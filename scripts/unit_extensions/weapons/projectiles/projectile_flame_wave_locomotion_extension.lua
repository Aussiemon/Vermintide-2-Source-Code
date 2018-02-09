ProjectileFlameWaveLocomotionExtension = class(ProjectileFlameWaveLocomotionExtension)
local EVALUATE_DISTANCE = 1
local MAX_LATERAL_DIST = 0.5
ProjectileFlameWaveLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	local world = extension_init_context.world
	self._world = world
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._nav_world = nav_world
	self._layerless_traverse_logic = Managers.state.bot_nav_transition._layerless_traverse_logic
	self.is_husk = not not extension_init_data.is_husk
	self.is_server = Managers.player.is_server
	self.extension_init_data = extension_init_data
	local initial_position = extension_init_data.position
	self.initial_position_boxed = Vector3Box(initial_position)
	local pos = extension_init_data.position
	self._stopped = false
	self._dissipate = false
	local flat_angle = extension_init_data.flat_angle
	local lateral_speed = extension_init_data.lateral_speed
	local initial_forward_speed = extension_init_data.initial_forward_speed
	local age = extension_init_data.age or 0
	local flat_dir = Quaternion.forward(Quaternion(Vector3.up(), flat_angle))
	local success, z = GwNavQueries.triangle_from_position(nav_world, pos, 0, 2, self._layerless_traverse_logic, self._layerless_traverse_logic)

	if success then
		pos.z = z
	end

	self._flat_direction = Vector3Box(flat_dir)
	self._flat_direction_speed = initial_forward_speed
	self._max_distance = 15
	local lateral_dir = Vector3.cross(flat_dir, Vector3.up())
	self._lateral_direction = Vector3Box(lateral_dir)
	self._lateral_speed = lateral_speed
	local flat_velocity = flat_dir*initial_forward_speed + lateral_dir*lateral_speed
	self._flat_velocity = Vector3Box(flat_velocity)
	local t = Managers.time:time("game") - age
	self.t = t
	self._velocity = Vector3Box(flat_velocity)
	local interval = EVALUATE_DISTANCE/initial_forward_speed
	self._next_point_time_interval = interval
	self._last_position_time = t
	self._next_position_time = t + interval
	self._last_position = Vector3Box(pos)
	local next_pos = self._calculate_next_position(self, pos, flat_velocity)
	self._next_position = Vector3Box(next_pos)

	if not self.is_husk then
		local neighbour_speed = extension_init_data.neighbour_lateral_speed

		if neighbour_speed then
			self._neighbour_lateral_speed = neighbour_speed
		else
			self._neighbour_lateral_speed = 0

			self._spawn_projectile(self, pos, flat_dir, -6)
			self._spawn_projectile(self, pos, flat_dir, 6)
		end

		self._last_spawn = t
	end

	self._distance_travelled = extension_init_data.distance_travelled or 0

	return 
end
ProjectileFlameWaveLocomotionExtension._calculate_next_position = function (self, pos, velocity)
	local nav_world = self._nav_world
	local wanted_next_pos = pos + velocity*self._next_point_time_interval
	local success, z = GwNavQueries.triangle_from_position(nav_world, wanted_next_pos, 5, 5, self._layerless_traverse_logic)

	if success then
		wanted_next_pos.z = z
		success = GwNavQueries.raycango(nav_world, pos, wanted_next_pos, self._layerless_traverse_logic)
	end

	if success then
		return wanted_next_pos
	else
		self._dissipate = true

		return wanted_next_pos
	end

	return 
end
ProjectileFlameWaveLocomotionExtension.destroy = function (self)
	return 
end
ProjectileFlameWaveLocomotionExtension._generate_next_position = function (self)
	local old_next_position = self._next_position:unbox()

	self._last_position:store(old_next_position)
	self._next_position:store(self._calculate_next_position(self, old_next_position, self._flat_velocity:unbox()))

	local old_next_time = self._next_position_time
	self._last_position_time = old_next_time
	self._next_position_time = old_next_time + self._next_point_time_interval

	return 
end
ProjectileFlameWaveLocomotionExtension._update_position = function (self, dt, t)
	local delta_t = t - self._last_position_time
	local last_pos = self._last_position:unbox()
	local next_pos = self._next_position:unbox()
	local current_pos = last_pos + self._flat_velocity:unbox()*delta_t
	local current_z = math.lerp(last_pos.z, next_pos.z, math.smoothstep(delta_t, self._last_position_time, self._next_position_time))
	current_pos.z = current_z
	self._distance_travelled = self._distance_travelled + self._flat_direction_speed*dt
	local network_manager = Managers.state.network

	if not self.is_husk then
		local game = network_manager.game(network_manager)
		local game_object_id = game and network_manager.unit_game_object_id(network_manager, self._unit)

		if game_object_id then
			GameSession.set_game_object_field(game, game_object_id, "distance_travelled", self._distance_travelled)
		end
	end

	return current_pos
end
ProjectileFlameWaveLocomotionExtension._update_spawn = function (self, dt, t, new_position)
	if self._lateral_speed == 0 or self.is_husk then
		return 
	end

	local time_since_spawn = t - self._last_spawn
	local relative_speed = self._lateral_speed - self._neighbour_lateral_speed
	local lateral_diff = time_since_spawn*relative_speed + MAX_LATERAL_DIST*0.5

	if MAX_LATERAL_DIST < math.abs(lateral_diff) then
		self._spawn_projectile(self, new_position, self._flat_direction:unbox(), (self._lateral_speed + self._neighbour_lateral_speed)*0.5)

		self._last_spawn = self._last_spawn + MAX_LATERAL_DIST/math.abs(relative_speed)
	end

	return 
end
ProjectileFlameWaveLocomotionExtension._spawn_projectile = function (self, new_position, flat_direction, lateral_speed)
	local position = new_position + -self._lateral_direction:unbox()*math.sign(lateral_speed)*MAX_LATERAL_DIST*0.5
	local age = Managers.time:time("game") - self.t
	local extension_init_data = self.extension_init_data

	Managers.state.entity:system("projectile_system"):spawn_flame_wave_projectile(extension_init_data.owner_unit, extension_init_data.scale, extension_init_data.item_name, extension_init_data.item_template_name, extension_init_data.action_name, extension_init_data.sub_action_name, position, extension_init_data.flat_angle, lateral_speed, self._flat_direction_speed, age, self._neighbour_lateral_speed, self._distance_travelled)

	self._neighbour_lateral_speed = lateral_speed

	return 
end
ProjectileFlameWaveLocomotionExtension.update = function (self, unit, input, dt, context, t)
	while self._next_position_time < t do
		self._generate_next_position(self)
	end

	if self._max_distance < self._distance_travelled then
		self.stop(self)
	end

	if not self._stopped and not self._dissipate then
		local old_position = POSITION_LOOKUP[unit]
		local new_position = self._update_position(self, dt, t)

		Unit.set_local_position(unit, 0, new_position)
		self._velocity:store((new_position - old_position)/dt)
		self._update_spawn(self, dt, t, new_position)
	end

	return 
end
ProjectileFlameWaveLocomotionExtension.moved_this_frame = function (self)
	return not self._stopped
end
ProjectileFlameWaveLocomotionExtension.current_velocity = function (self)
	return self._velocity:unbox()
end
ProjectileFlameWaveLocomotionExtension.stop = function (self)
	self._stopped = true

	return 
end
ProjectileFlameWaveLocomotionExtension.has_stopped = function (self)
	return self._stopped or self._dissipate
end
ProjectileFlameWaveLocomotionExtension.get_game_object_data = function (self)
	local position = Unit.local_position(self._unit, 0)
	local flat_angle = self.extension_init_data.flat_angle
	local lateral_speed = self._lateral_speed
	local forward_speed = self._flat_direction_speed

	return position, flat_angle, lateral_speed, forward_speed, self._distance_travelled
end

return 
