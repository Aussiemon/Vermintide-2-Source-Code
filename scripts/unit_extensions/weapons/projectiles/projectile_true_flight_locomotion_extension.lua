﻿-- chunkname: @scripts/unit_extensions/weapons/projectiles/projectile_true_flight_locomotion_extension.lua

require("scripts/unit_extensions/weapons/projectiles/true_flight_utility")

ProjectileTrueFlightLocomotionExtension = class(ProjectileTrueFlightLocomotionExtension)

ProjectileTrueFlightLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local gravity_settings = extension_init_data.gravity_settings or "default"
	local initial_position = extension_init_data.initial_position
	local true_flight_template_name = extension_init_data.true_flight_template_name

	assert(true_flight_template_name, "no true_flight_template")

	self.true_flight_template_name = true_flight_template_name

	local template = TrueFlightTemplates[true_flight_template_name]

	self.true_flight_template = template

	local t = Managers.time:time("game")

	self.t = t - (extension_init_data.fast_forward_time or 0)
	self.target_unit = extension_init_data.target_unit
	self.target_node = template.initial_target_node or "c_head"
	self.unit = unit
	self.world = world
	self.gravity_settings = gravity_settings
	self.gravity = ProjectileGravitySettings[gravity_settings]
	self.velocity = Vector3Box()
	self.speed = extension_init_data.speed
	self.initial_position_boxed = Vector3Box(initial_position)

	local side_by_unit = Managers.state.side.side_by_unit

	self.side = side_by_unit[unit] or side_by_unit[extension_init_data.owner_unit]
	self.target_broadphase_categories = template.dont_target_friendly and self.side and self.side.enemy_broadphase_categories or nil
	self.trajectory_template_name = extension_init_data.trajectory_template_name

	assert(self.trajectory_template_name)

	self.raycast_timer = 0
	self.target_vector = extension_init_data.target_vector
	self.current_direction = Vector3Box(self.target_vector)
	self.current_rotation = QuaternionBox(Quaternion.look(self.target_vector))
	self.target_vector = Vector3.normalize(Vector3.flat(self.target_vector))
	self.target_vector_boxed = Vector3Box(self.target_vector)
	self.owner_unit = extension_init_data.owner_unit
	self.is_husk = not not extension_init_data.is_husk

	local network_manager = Managers.state.network

	self.network_manager = network_manager
	self.radians = math.degrees_to_radians(extension_init_data.angle)
	self.stopped = false
	self.moved = false
	self.spawn_time = t
	self.death_time = extension_init_data.life_time or math.huge
	self.on_target_time = 0
	self.height_offset = extension_init_data.height_offset or 0

	if template.target_tracking_check_func then
		self._update_towards_target_func = self[template.target_tracking_check_func]
	else
		self._update_towards_target_func = self.update_towards_target
	end

	self._legitimate_target_func = template.legitimate_target_func and self[template.legitimate_target_func] or self.legitimate_target
	self._keep_target_on_miss_check_func = template.keep_target_on_miss_check_func and self[template.keep_target_on_miss_check_func] or self.legitimate_never
	self._valid_target_dot = template.valid_target_dot or 0.75
	self._retarget_broadphase_offset = template.retarget_broadphase_offset or 10
	self._dont_target_patrols = template.dont_target_patrols
	self._lerp_modifier_func = template.lerp_modifier_func or function (distance)
		return distance < 5 and 1 or 5 / distance
	end
	self.target_players = template.target_players

	if template.find_target_func then
		self._find_target_func = self[template.find_target_func]
	else
		self._find_target_func = self.find_broadphase_target
	end

	if extension_init_data.position_target then
		self.position_target = Vector3Box(extension_init_data.position_target)
	end

	if template.init_func then
		local seed = math.random_seed()

		self._custom_data = {}

		template.init_func(unit, template, seed, self._custom_data)
	end

	self._current_position = Vector3Box(POSITION_LOOKUP[unit])

	Unit.set_local_position(unit, 0, initial_position)

	self.hit_units = {}
end

local function get_target_head_node_position(unit, node_name)
	local blackboard = BLACKBOARDS[unit]
	local breed = blackboard and blackboard.breed
	local node = Unit.has_node(unit, node_name) and Unit.node(unit, node_name) or 0

	if breed and breed.target_head_node then
		return Unit.world_position(unit, node)
	else
		return Unit.world_position(unit, node)
	end
end

local function valid_position(position)
	local pmin, pmax = NetworkConstants.position.min, NetworkConstants.position.max

	for i = 1, 3 do
		local coord = position[i]

		if coord < pmin or pmax < coord then
			print("[ProjectileTrueFlightLocomotionExtension] position is not valid, outside of NetworkConstants.position")

			return false
		end
	end

	return true
end

ProjectileTrueFlightLocomotionExtension._do_forced_impact = function (self, unit, current_position)
	local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

	projectile_extension:force_impact(unit, Unit.local_position(unit, 0))

	local network_manager = self.network_manager
	local unit_id = network_manager:unit_game_object_id(unit)

	network_manager.network_transmit:send_rpc_clients("rpc_generic_impact_projectile_force_impact", unit_id, current_position)
end

ProjectileTrueFlightLocomotionExtension.bounce = function (self, hit_position, hit_direction, hit_normal)
	local bounce_dir = Vector3.normalize(Vector3.reflect(hit_direction, hit_normal))
	local bounce_pos = hit_position - hit_direction * 0.25 + hit_normal * 0.1
	local rotation = Quaternion.look(bounce_dir)

	self.t = Managers.time:time("game")

	self.target_vector_boxed:store(bounce_dir)
	self.initial_position_boxed:store(bounce_pos)

	self.radians = math.degrees_to_radians(ActionUtils.pitch_from_rotation(rotation))

	self._current_position:store(bounce_pos)
	self:_unit_set_position_rotation(self.unit, bounce_pos, rotation)
end

ProjectileTrueFlightLocomotionExtension.update = function (self, unit, input, dt, context, t)
	self.dt = t - self.t
	self.t = t
	self.moved = false

	if self.stopped then
		return
	end

	if self.is_husk then
		local game = Managers.state.network:game()
		local id = Managers.state.unit_storage:go_id(unit)

		if game and id then
			local position = GameSession.game_object_field(game, id, "position")
			local rotation = GameSession.game_object_field(game, id, "rotation")

			self:_unit_set_position_rotation(unit, position, rotation)
		end

		return
	end

	self.on_target_time = self.on_target_time + dt

	local current_position = self._current_position:unbox()

	if self.on_target_time > self.death_time then
		self:_do_forced_impact(unit, current_position)
	end

	local template = TrueFlightTemplates[self.true_flight_template_name]
	local target = self.target_unit
	local has_good_target, can_see_target = self:_check_target_valid(target, current_position, template)
	local new_position

	if not has_good_target then
		local max_on_target_time = template.max_on_target_time or 0.75
		local seek = max_on_target_time > self.on_target_time
		local position, new_target = self:update_seeking_target(current_position, dt, t, seek)

		new_position = position
		self.target_unit = new_target
		has_good_target, can_see_target = self:_check_target_valid(new_target, current_position, template)
	end

	local new_rotation

	if can_see_target then
		new_position, new_rotation = self._update_towards_target_func(self, current_position, t, dt)
	elseif has_good_target then
		local position, _ = self:update_seeking_target(current_position, dt, t, false)

		new_position = position
	end

	if not valid_position(new_position) then
		self:stop()
		Managers.state.unit_spawner:mark_for_deletion(self.unit)

		return
	end

	local velocity = new_position - current_position
	local length = Vector3.length(velocity)

	if length <= 0.001 then
		return
	end

	if script_data.debug_projectiles then
		QuickDrawerStay:line(current_position, new_position, Color(255, 255, 255, 0))
	end

	local direction = Vector3.normalize(velocity)
	local new_rotation = new_rotation or Quaternion.look(direction)

	self:_unit_set_position_rotation(unit, new_position, new_rotation)

	local game = Managers.state.network:game()
	local id = Managers.state.unit_storage:go_id(unit)

	if game and id then
		GameSession.set_game_object_field(game, id, "position", new_position)
		GameSession.set_game_object_field(game, id, "rotation", new_rotation)
	end

	self._current_position:store(new_position)
	self.velocity:store(velocity)
	self.current_direction:store(direction)
	self.current_rotation:store(new_rotation)

	self.t = t

	self.target_vector_boxed:store(Vector3.normalize(Vector3.flat(direction)))
	self.initial_position_boxed:store(new_position)

	self.radians = math.degrees_to_radians(ActionUtils.pitch_from_rotation(new_rotation))
	self.moved = true
end

ProjectileTrueFlightLocomotionExtension._check_target_valid = function (self, target, current_position, template)
	local can_see_target = false
	local has_good_target = false

	if self.position_target then
		can_see_target = true
	elseif HEALTH_ALIVE[target] and not self.hit_units[target] then
		if self._dont_target_patrols and AiUtils.is_part_of_patrol(target) and not AiUtils.is_aggroed(target) then
			return has_good_target, can_see_target
		end

		has_good_target = true

		if self._legitimate_target_func(self, target, current_position) then
			can_see_target = true
		elseif template.retarget_on_miss then
			has_good_target = self._keep_target_on_miss_check_func(self, target, current_position)
		end
	end

	return has_good_target, can_see_target
end

ProjectileTrueFlightLocomotionExtension.set_projectile_state = function (self, state_id)
	if state_id ~= self.projectile_state_id then
		local is_server = not self.is_husk
		local unit = self.unit
		local template = TrueFlightTemplates[self.true_flight_template_name]

		template.template_state_func(self, unit, state_id, is_server)

		if is_server then
			local network_manager = self.network_manager
			local unit_id = network_manager:unit_game_object_id(unit)

			network_manager.network_transmit:send_rpc_clients("rpc_set_projectile_state", unit_id, state_id)
		end

		self.projectile_state_id = state_id
	else
		print("WARNING: projectile trying to be put in the same state multiple times", self.unit, state_id)
	end
end

ProjectileTrueFlightLocomotionExtension.update_towards_slow_bomb_target = function (self, position, t, dt)
	local target_unit = self.target_unit
	local unit = self.unit
	local current_direction = self.current_direction:unbox()
	local template = TrueFlightTemplates[self.true_flight_template_name]
	local speed_multiplier = template.speed_multiplier
	local target_position = Unit.world_position(target_unit, Unit.node(target_unit, "c_spine"))
	local required_velocity = target_position - position
	local distance = Vector3.length(required_velocity)
	local wanted_direction = Vector3.normalize(required_velocity)
	local current_rotation = Quaternion.look(current_direction)
	local wanted_rotation = Quaternion.look(wanted_direction)

	if self._slow_bomb_triggered then
		local speed_mod = template.triggered_speed_mult
		local new_position = position + current_direction * self.speed * speed_multiplier * speed_mod * dt

		return new_position
	elseif distance < template.trigger_dist then
		self._slow_bomb_triggered = true

		Unit.flow_event(unit, "lua_projectile_triggered")

		local network_manager = self.network_manager
		local unit_id = network_manager:unit_game_object_id(unit)

		network_manager.network_transmit:send_rpc_clients("rpc_set_projectile_state", unit_id, 1)
	end

	local speed_mod = math.clamp(distance < 10 and 1 or distance / 10, 0, 3)
	local speed = self.speed * speed_multiplier * speed_mod
	local lerp_modifier = self._lerp_modifier_func(distance)

	lerp_modifier = lerp_modifier * lerp_modifier * (math.min(self.on_target_time, 0.25) / 0.25)

	local lerp_value = math.min(dt * lerp_modifier * 100, 0.75)
	local new_rotation = Quaternion.lerp(current_rotation, wanted_rotation, lerp_value)
	local new_direction = Quaternion.forward(new_rotation)
	local new_position = position + new_direction * speed * dt

	return new_position
end

ProjectileTrueFlightLocomotionExtension.update_towards_strike_missile_target = function (self, position, t, dt)
	local target_unit = self.target_unit
	local current_direction = self.current_direction:unbox()
	local template = TrueFlightTemplates[self.true_flight_template_name]
	local speed_multiplier = template.speed_multiplier
	local target_position = Unit.world_position(target_unit, Unit.node(target_unit, "c_spine"))
	local required_velocity = target_position - position
	local dist_to_target = Vector3.length(required_velocity)
	local wanted_direction = Vector3.normalize(required_velocity)
	local unit = self.unit

	if self._missile_triggered then
		if self._missile_striking then
			local speed_mod = template.triggered_speed_mult
			local new_position = position + current_direction * self.speed * speed_multiplier * speed_mod * dt

			return new_position
		else
			if t > self._missile_lingering then
				self._missile_striking = true

				local create_bot_threat = template.create_bot_threat

				if create_bot_threat then
					local blackboard = HEALTH_ALIVE[self.owner_unit] and BLACKBOARDS[self.owner_unit]

					if blackboard and not blackboard.created_missile_bot_threat then
						blackboard.missile_bot_threat_unit = target_unit
						blackboard.created_missile_bot_threat = true
					end
				end

				Unit.flow_event(unit, "lua_projectile_striking")

				local network_manager = self.network_manager
				local unit_id = network_manager:unit_game_object_id(unit)

				network_manager.network_transmit:send_rpc_clients("rpc_set_projectile_state", unit_id, 2)
			end

			local speed_mod = 0.1
			local new_position = position + current_direction * self.speed * speed_multiplier * speed_mod * dt

			return new_position
		end
	elseif Vector3.dot(current_direction, wanted_direction) > 0.999 or self.on_target_time > 2 then
		self._missile_triggered = true
		self._missile_lingering = t + template.lingering_duration

		Unit.flow_event(unit, "lua_projectile_triggered")

		local network_manager = self.network_manager
		local unit_id = network_manager:unit_game_object_id(unit)

		network_manager.network_transmit:send_rpc_clients("rpc_set_projectile_state", unit_id, 1)
	end

	local current_rotation = Quaternion.look(current_direction)
	local wanted_rotation = Quaternion.look(wanted_direction)

	self.speed = self.speed - 5 * dt

	local speed = self.speed * speed_multiplier
	local lerp_modifier = self._lerp_modifier_func(dist_to_target)

	lerp_modifier = lerp_modifier * lerp_modifier * (math.min(self.on_target_time, 0.5) / 0.5)

	local lerp_value = math.min(dt * lerp_modifier * 100, 0.75)
	local new_rotation = Quaternion.lerp(current_rotation, wanted_rotation, lerp_value)
	local new_direction = Quaternion.forward(new_rotation)
	local new_position = position + new_direction * speed * dt

	return new_position
end

ProjectileTrueFlightLocomotionExtension.update_towards_position_target = function (self, position, t, dt)
	local current_direction = self.current_direction:unbox()
	local template = TrueFlightTemplates[self.true_flight_template_name]
	local speed_multiplier = template.speed_multiplier
	local target_position = self.position_target:unbox()
	local required_velocity = target_position - position
	local distance = Vector3.length(required_velocity)
	local wanted_direction = Vector3.normalize(required_velocity)
	local current_rotation = Quaternion.look(current_direction)
	local wanted_rotation = Quaternion.look(wanted_direction)
	local height_over_target = self.height_offset + math.max(position.z - target_position.z, 0)
	local lerp_modifier = self._lerp_modifier_func(distance, height_over_target, t)

	lerp_modifier = lerp_modifier * lerp_modifier * (math.min(self.on_target_time, 0.25) / 0.25)

	local lerp_value = math.min(dt * lerp_modifier * 100, 0.75)
	local new_rotation = Quaternion.lerp(current_rotation, wanted_rotation, lerp_value)
	local new_direction = Quaternion.forward(new_rotation)
	local speed = self.speed * speed_multiplier
	local new_position = position + new_direction * speed * dt

	return new_position
end

ProjectileTrueFlightLocomotionExtension.update_towards_target = function (self, position, t, dt)
	local target_unit = self.target_unit
	local current_direction = self.current_direction:unbox()
	local template = TrueFlightTemplates[self.true_flight_template_name]
	local speed_multiplier = template.speed_multiplier
	local target_position = get_target_head_node_position(target_unit, self.target_node)
	local required_velocity = target_position - position
	local distance = Vector3.length(required_velocity)
	local speed = self.speed * speed_multiplier

	if distance < speed * dt then
		return target_position
	end

	local wanted_direction = Vector3.normalize(required_velocity)
	local current_rotation = Quaternion.look(current_direction)
	local wanted_rotation = Quaternion.look(wanted_direction)
	local height_over_target = self.height_offset + math.max(position.z - target_position.z, 0)
	local lerp_modifier = self._lerp_modifier_func(distance, height_over_target, t)

	lerp_modifier = lerp_modifier * lerp_modifier * (math.min(self.on_target_time, 0.25) / 0.25)

	local lerp_value = math.min(dt * lerp_modifier * 100, 0.75)
	local new_rotation = Quaternion.lerp(current_rotation, wanted_rotation, lerp_value)
	local new_direction = Quaternion.forward(new_rotation)
	local new_position = position + new_direction * speed * dt
	local create_bot_threat = template.create_bot_threat

	if self.target_players and create_bot_threat then
		self:update_bot_threat(target_unit, distance)
	end

	return new_position
end

ProjectileTrueFlightLocomotionExtension.update_seeking_target = function (self, position, dt, t, seeking)
	local true_flight_template = TrueFlightTemplates[self.true_flight_template_name]
	local speed_multiplier = true_flight_template.speed_multiplier
	local self_dt, speed, angle, gravity = self.dt, self.speed * speed_multiplier, self.radians, self.gravity
	local target_vector = Vector3Box.unbox(self.target_vector_boxed)
	local initial_position = Vector3Box.unbox(self.initial_position_boxed)
	local trajectory_template_name = self.trajectory_template_name
	local is_husk = self.is_husk
	local trajectory = ProjectileTemplates.get_trajectory_template(trajectory_template_name, is_husk)
	local new_position = trajectory.update(speed, angle, gravity, initial_position, target_vector, self_dt)
	local target = seeking and self:find_new_target(position, true_flight_template, t, self_dt)

	return new_position, target
end

ProjectileTrueFlightLocomotionExtension.find_new_target = function (self, position, true_flight_template, t, dt)
	if t > self.raycast_timer then
		local time_between_raycasts = true_flight_template.time_between_raycasts

		self.raycast_timer = t + time_between_raycasts

		local target = self._find_target_func(self, position)

		return target
	end
end

ProjectileTrueFlightLocomotionExtension.find_player_target = function (self, position)
	local player_units
	local side = self.side

	if side then
		player_units = side.ENEMY_PLAYER_UNITS
	else
		side = Managers.state.side:get_side_from_name("heroes")
		player_units = side.PLAYER_UNITS
	end

	local players_n = #player_units

	if players_n > 0 then
		local start_index = Math.random(1, players_n)

		for i = start_index, start_index + players_n do
			local index = (i - 1) % players_n + 1
			local unit = player_units[index]

			if HEALTH_ALIVE[unit] and not self.hit_units[unit] and self._legitimate_target_func(self, unit, position) then
				return unit
			end
		end
	end
end

local ai_units = {}

ProjectileTrueFlightLocomotionExtension.find_broadphase_target = function (self, position)
	local broadphase_radius = TrueFlightTemplates[self.true_flight_template_name].broadphase_radius
	local broadphase_categories = self.target_broadphase_categories

	table.clear(ai_units)

	local ai_units_n

	if self.target_position then
		ai_units_n = AiUtils.broadphase_query(self.target_position:unbox(), broadphase_radius, ai_units, broadphase_categories)
	else
		local current_direction = self.current_direction:unbox()

		ai_units_n = AiUtils.broadphase_query(position + current_direction * self._retarget_broadphase_offset, broadphase_radius, ai_units, broadphase_categories)

		if ai_units_n <= 0 then
			ai_units_n = AiUtils.broadphase_query(position + current_direction * 2 * self._retarget_broadphase_offset, broadphase_radius * 2, ai_units, broadphase_categories)
		end
	end

	if ai_units_n > 0 then
		table.shuffle(ai_units)

		for i = 1, ai_units_n do
			local unit = ai_units[i]

			if ScriptUnit.has_extension(unit, "health_system") and HEALTH_ALIVE[unit] and not self.hit_units[unit] and self._legitimate_target_func(self, unit, position) then
				return unit
			end
		end
	end

	return nil
end

ProjectileTrueFlightLocomotionExtension.find_closest_highest_value_target = function (self, position)
	local template = TrueFlightTemplates[self.true_flight_template_name]
	local broadphase_radius = template.broadphase_radius
	local broadphase_categories = self.target_broadphase_categories
	local forward_search_distance_to_find_target = template.forward_search_distance_to_find_target

	table.clear(ai_units)

	local ai_units_n

	if self.target_position then
		ai_units_n = AiUtils.broadphase_query(self.target_position:unbox(), broadphase_radius, ai_units, broadphase_categories)
	else
		local current_direction = self.current_direction:unbox()

		ai_units_n = AiUtils.broadphase_query(position + current_direction * forward_search_distance_to_find_target, broadphase_radius, ai_units, broadphase_categories)

		if ai_units_n <= 0 then
			ai_units_n = AiUtils.broadphase_query(position + current_direction * forward_search_distance_to_find_target * 2, broadphase_radius * 2, ai_units, broadphase_categories)
		end
	end

	if ai_units_n > 0 then
		local i = 1

		while i <= ai_units_n do
			local unit = ai_units[i]
			local breed = Unit.get_data(unit, "breed")

			if not breed or breed.no_autoaim or not ScriptUnit.has_extension(unit, "health_system") or not HEALTH_ALIVE[unit] or self.hit_units[unit] or not self._legitimate_target_func(self, unit, position) then
				table.swap_delete(ai_units, i)

				ai_units_n = ai_units_n - 1
			else
				i = i + 1
			end
		end

		TrueFlightUtility.sort_prioritize_specials(ai_units)

		return ai_units[1]
	end

	return nil
end

ProjectileTrueFlightLocomotionExtension.legitimate_always = function (self, unit, position)
	return true
end

ProjectileTrueFlightLocomotionExtension.legitimate_never = function (self, unit, position)
	return false
end

ProjectileTrueFlightLocomotionExtension.legitimate_only_dot_check = function (self, unit, position)
	local node = Unit.has_node(unit, "c_spine") and Unit.node(unit, "c_spine") or 0
	local target_position = Unit.world_position(unit, node)
	local current_direction = self.current_direction:unbox()
	local direction_to_target = target_position - position
	local wanted_direction = Vector3.normalize(direction_to_target)
	local dot_value = Vector3.dot(current_direction, wanted_direction)

	if dot_value > -self._valid_target_dot then
		return true
	else
		self.target_unit = nil
	end
end

ProjectileTrueFlightLocomotionExtension.legitimate_target = function (self, unit, position)
	local target_position = get_target_head_node_position(unit, "c_head")
	local current_direction = self.current_direction:unbox()
	local direction_to_target = target_position - position

	if Vector3.length_squared(direction_to_target) < math.epsilon then
		return true
	end

	local wanted_direction = Vector3.normalize(direction_to_target)
	local dot_value = Vector3.dot(current_direction, wanted_direction)

	if dot_value > -self._valid_target_dot then
		local physics_world = World.get_data(self.world, "physics_world")
		local result = PhysicsWorld.immediate_raycast_actors(physics_world, position, wanted_direction, 10000, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
		local INDEX_ACTOR = 4

		if result then
			for index, hit in pairs(result) do
				local hit_actor = hit[INDEX_ACTOR]
				local potential_hit_unit = Actor.unit(hit_actor)

				if potential_hit_unit ~= self.owner_unit then
					local breed = Unit.get_data(potential_hit_unit, "breed")

					if breed then
						if potential_hit_unit == unit then
							return true
						end
					elseif hit_actor ~= Unit.actor(potential_hit_unit, "c_afro") then
						return false
					end
				end
			end
		end
	else
		self.target_unit = nil
	end

	return false
end

ProjectileTrueFlightLocomotionExtension.legitimate_target_keep_target = function (self, unit, position)
	local target_position = get_target_head_node_position(unit, "c_head")
	local current_direction = self.current_direction:unbox()
	local direction_to_target = target_position - position

	if Vector3.length_squared(direction_to_target) == 0 then
		return true
	end

	local wanted_direction = Vector3.normalize(direction_to_target)
	local dot_value = Vector3.dot(current_direction, wanted_direction)

	if dot_value > -self._valid_target_dot and Vector3.length_squared(wanted_direction) > 0 then
		local physics_world = World.get_data(self.world, "physics_world")
		local result = PhysicsWorld.immediate_raycast_actors(physics_world, position, wanted_direction, 10000, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
		local INDEX_ACTOR = 4

		if result then
			for index, hit in pairs(result) do
				local hit_actor = hit[INDEX_ACTOR]
				local potential_hit_unit = Actor.unit(hit_actor)

				if potential_hit_unit ~= self.owner_unit then
					local breed = Unit.get_data(potential_hit_unit, "breed")

					if breed then
						if potential_hit_unit == unit then
							return true
						end
					elseif hit_actor ~= Unit.actor(potential_hit_unit, "c_afro") then
						return false
					end
				end
			end
		end
	end

	return false
end

ProjectileTrueFlightLocomotionExtension.legitimate_player_target = function (self, unit, position)
	local node_name = self.target_node
	local node = Unit.has_node(unit, node_name) and Unit.node(unit, node_name) or 0
	local target_position = Unit.world_position(unit, node)
	local current_direction = self.current_direction:unbox()
	local direction_to_target = target_position - position

	if Vector3.length_squared(direction_to_target) == 0 then
		return true
	end

	local wanted_direction = Vector3.normalize(direction_to_target)
	local dot_value = Vector3.dot(current_direction, wanted_direction)

	if dot_value > -0.99 then
		local physics_world = World.get_data(self.world, "physics_world")
		local result = PhysicsWorld.immediate_raycast_actors(physics_world, position, wanted_direction, 10000, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
		local INDEX_ACTOR = 4

		if result then
			for index, hit in pairs(result) do
				local hit_actor = hit[INDEX_ACTOR]
				local potential_hit_unit = Actor.unit(hit_actor)

				if potential_hit_unit ~= self.owner_unit then
					local player_unit = VALID_PLAYERS_AND_BOTS[potential_hit_unit]

					if player_unit then
						if potential_hit_unit == unit then
							return true
						end
					elseif hit_actor ~= Unit.actor(potential_hit_unit, "c_afro") then
						return false
					end
				end
			end
		end
	else
		self.target_unit = nil
	end

	return false
end

ProjectileTrueFlightLocomotionExtension._unit_set_position_rotation = function (self, unit, position, rotation)
	if self.true_flight_template.update_unit_position then
		self.true_flight_template.update_unit_position(unit, position, rotation, self._custom_data, self)
	else
		Unit.set_local_rotation(unit, 0, rotation)
		Unit.set_local_position(unit, 0, position)
	end
end

ProjectileTrueFlightLocomotionExtension.moved_this_frame = function (self)
	return self.moved
end

ProjectileTrueFlightLocomotionExtension.current_velocity = function (self)
	return self.velocity:unbox()
end

ProjectileTrueFlightLocomotionExtension.current_position = function (self)
	return self._current_position:unbox()
end

ProjectileTrueFlightLocomotionExtension.destroy = function (self)
	local template = self.true_flight_template

	if template.create_bot_threat then
		local blackboard = HEALTH_ALIVE[self.owner_unit] and BLACKBOARDS[self.owner_unit]

		if blackboard then
			blackboard.created_missile_bot_threat = nil
		end
	end

	self.hit_units = nil
end

ProjectileTrueFlightLocomotionExtension.notify_hit_enemy = function (self, hit_unit)
	self.hit_units[hit_unit] = true
	self.raycast_timer = 0
end

ProjectileTrueFlightLocomotionExtension.update_bot_threat = function (self, target_unit, distance)
	local template = self.true_flight_template

	if distance < template.bot_threat_at_distance then
		local blackboard = HEALTH_ALIVE[self.owner_unit] and BLACKBOARDS[self.owner_unit]

		if blackboard and not blackboard.created_missile_bot_threat then
			blackboard.missile_bot_threat_unit = target_unit
			blackboard.created_missile_bot_threat = true
		end
	end
end

ProjectileTrueFlightLocomotionExtension.stop = function (self)
	if self.true_flight_template.update_after_impact then
		return
	end

	self.stopped = true
end
