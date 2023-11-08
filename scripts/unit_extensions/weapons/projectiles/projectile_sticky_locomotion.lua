require("scripts/helpers/network_utils")

ProjectileStickyLocomotion = class(ProjectileStickyLocomotion)

ProjectileStickyLocomotion.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.world = extension_init_context.world
	self.is_server = Managers.player.is_server
	self.spawn_time = Managers.time:time("game")
	self.time_lived = 0
	self.stop_time = 0
	self.stopped = extension_init_data.stopped
	self.moved = false
	self.extension_init_data = extension_init_data
	self.is_husk = not not extension_init_data.is_husk
	self.rotation_offset = extension_init_data.rotation_offset
	self.speed = extension_init_data.speed
	self.target_vector = extension_init_data.target_vector
	self.target_unit = extension_init_data.target_unit

	self:_init_from_seed(extension_init_data.seed)

	local initial_position = extension_init_data.initial_position
	self._last_position = Vector3Box(POSITION_LOOKUP[unit])
	self.position_boxed = Vector3Box(POSITION_LOOKUP[unit])
	self._rotation = QuaternionBox(Unit.world_rotation(unit, 0))
	self.velocity = Vector3Box()
	self.target_vector_boxed = Vector3Box(self.target_vector)
	self.initial_position_boxed = Vector3Box(initial_position)
	self._target_unit_id = NetworkConstants.invalid_game_object_id

	if self.stopped then
		if ALIVE[self.target_unit] then
			self:stick_to_unit(self.target_unit)
		else
			self:stick_to_position(initial_position)
		end
	end
end

ProjectileStickyLocomotion._init_from_seed = function (self, seed)
	seed = seed or 0
	self._seed = seed
	self._spin_dir = 1 - bit.band(seed, 128) / 64
	seed, self._wobble_min = math.next_random_range(seed, 0, 0)
	seed, self._wobble_max = math.next_random_range(seed, 0.3, 0.5)
	seed, self._wobble_speed = math.next_random_range(seed, 3, 6)
	seed, self._wobble_vertical_mult = math.next_random_range(seed, 0.7, 1)
	seed, self._wobble_horizontal_mult = math.next_random_range(seed, 1, 1.2)
	seed, self._wobble_stabiliztion_speed = math.next_random_range(seed, 0.5, 0.5)
end

ProjectileStickyLocomotion.destroy = function (self)
	return
end

ProjectileStickyLocomotion.update = function (self, unit, input, dt, context, t)
	self.moved = false
	local time_lived = t - self.spawn_time
	self.time_lived = time_lived
	local new_position, new_rotation = nil

	if self.stopped and self.stop_time then
		local time_stopped = t - self.stop_time
		local target_unit = self.target_unit
		local target_unit_pos = POSITION_LOOKUP[target_unit]

		if target_unit_pos then
			local stick_animation_time = self._hit_unit_radius * 12 / self.speed
			local forward = self._impact_offset:unbox()
			local target_pos = target_unit_pos + Vector3(0, 0, self._hit_unit_height)

			if time_stopped < stick_animation_time then
				local p0 = self.initial_position_boxed:unbox()
				local p1 = target_pos + Quaternion.rotate(Quaternion.axis_angle(Vector3.up(), time_lived), forward)
				local c0 = target_pos + forward
				local c1 = p1 + forward
				local lerp_t = time_stopped / stick_animation_time
				new_position = Bezier.calc_point(lerp_t, p0, c0, c1, p1)
			else
				new_position = target_pos + Quaternion.rotate(Quaternion.axis_angle(Vector3.up(), time_lived), forward)
			end
		else
			local stick_animation_time = 0.5
			local forward = self._impact_offset:unbox()
			local right = Vector3.cross(forward, Vector3.up())
			local p0 = self.initial_position_boxed:unbox()
			local p1 = p0 + Vector3.up() * (0.1 + math.sin(time_lived) * 0.1) + forward * math.sin(time_lived * 1.4) * 0.1 + right * math.sin(time_lived * 1.8) * 0.1

			if time_stopped < stick_animation_time then
				local lerp_t = math.easeOutCubic(time_stopped / stick_animation_time)
				new_position = Vector3.lerp(p0, p1, lerp_t)
				new_rotation = Quaternion.lerp(Quaternion.look(self.target_vector_boxed:unbox()), Quaternion.look(forward), lerp_t)
			else
				new_position = p1
				new_rotation = Quaternion.look(forward)
			end
		end
	else
		local target_vector = self.target_vector_boxed:unbox()
		local move_delta = target_vector * self.speed * time_lived
		local projectile_speed_scaler = self.speed * 0.1
		local amount_t = math.easeCubic(math.clamp(time_lived * self._wobble_stabiliztion_speed * projectile_speed_scaler, 0, 1))
		local transition_scale = math.clamp(amount_t * 250, 0, 1)
		local amount_mult = math.lerp(self._wobble_max, self._wobble_min, amount_t) * transition_scale
		local vertical_wobble_amount = amount_mult * self._wobble_vertical_mult
		local horizontal_wobble_amount = amount_mult * self._wobble_horizontal_mult
		local wobble_speed = self._wobble_speed * self._spin_dir
		local wobble_offset = Vector3(math.sin(time_lived * wobble_speed - math.rad(115)) * horizontal_wobble_amount, 0, math.cos(time_lived * wobble_speed - math.rad(115)) * vertical_wobble_amount)
		wobble_offset = Quaternion.rotate(Quaternion.look(target_vector), wobble_offset)
		new_position = self.initial_position_boxed:unbox() + move_delta + wobble_offset
	end

	if not NetworkUtils.network_safe_position(new_position) then
		self:stop()

		if not self.is_husk then
			Managers.state.unit_spawner:mark_for_deletion(self.unit)
		end

		return
	end

	local position = self.position_boxed:unbox()
	local velocity = new_position - position

	if Vector3.length_squared(velocity) <= 1e-06 then
		return
	end

	new_rotation = new_rotation or Quaternion.look(velocity)

	Unit.set_local_position(unit, 0, new_position)
	Unit.set_local_rotation(unit, 0, new_rotation)
	self._last_position:store(position)
	self.position_boxed:store(new_position)
	self.velocity:store(velocity)
	self._rotation:store(new_rotation)

	self.moved = true
end

ProjectileStickyLocomotion.moved_this_frame = function (self)
	return self.moved
end

ProjectileStickyLocomotion.current_velocity = function (self)
	return self.velocity:unbox()
end

ProjectileStickyLocomotion.current_position = function (self)
	return self.position_boxed:unbox()
end

ProjectileStickyLocomotion.current_rotation = function (self)
	return self._rotation:unbox()
end

ProjectileStickyLocomotion.last_position = function (self)
	return self._last_position:unbox()
end

ProjectileStickyLocomotion.stop = function (self, hit_unit, hit_zone_name, hit_normal)
	if self.is_husk then
		return
	end

	local ai_extension = ScriptUnit.has_extension(hit_unit, "ai_system")

	if ai_extension then
		self:stick_to_unit(hit_unit)
	else
		self:stick_to_position(self:current_position(), hit_normal)
	end

	local network_manager = Managers.state.network
	local game = network_manager:game()

	if game then
		local unit_storage = Managers.state.unit_storage
		local go_id = unit_storage:go_id(self.unit)
		local new_initial_pos = self.initial_position_boxed:unbox()
		local hit_unit_id = ai_extension and unit_storage:go_id(hit_unit)

		if hit_unit_id then
			GameSession.set_game_object_field(game, go_id, "target_unit", hit_unit_id)

			if self.is_server then
				network_manager.network_transmit:send_rpc_clients("rpc_projectile_stick_unit", go_id, hit_unit_id)
			else
				network_manager.network_transmit:send_rpc_server("rpc_projectile_stick_unit", go_id, hit_unit_id)
			end
		elseif self.is_server then
			network_manager.network_transmit:send_rpc_clients("rpc_projectile_stick_position", go_id, new_initial_pos)
		else
			network_manager.network_transmit:send_rpc_server("rpc_projectile_stick_position", go_id, new_initial_pos)
		end

		GameSession.set_game_object_field(game, go_id, "initial_position", new_initial_pos)
		GameSession.set_game_object_field(game, go_id, "stopped", true)
	end
end

ProjectileStickyLocomotion.stick_to_unit = function (self, unit)
	self.stopped = true
	self.stop_time = Managers.time:time("game")

	self.initial_position_boxed:store(self:current_position())

	self.target_unit = unit
	local ai_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_extension then
		local breed = ai_extension._breed
		local breed_radius = breed.radius or 1
		self._hit_unit_radius = breed_radius
		self._hit_unit_height = breed.aoe_height and breed.aoe_height / 2 or 1
		self._impact_offset = Vector3Box(Vector3.normalize(Vector3.flat(self.target_vector_boxed:unbox()) * breed_radius))

		Unit.flow_event(self.unit, "stopped")
	else
		self:stick_to_position(self:current_position())
	end
end

ProjectileStickyLocomotion.stick_to_position = function (self, position, hit_normal)
	self.stopped = true
	self.stop_time = Managers.time:time("game")
	local new_initial_pos = position

	if hit_normal then
		new_initial_pos = new_initial_pos + hit_normal * 0.1
	end

	self.position_boxed:store(new_initial_pos)
	self.initial_position_boxed:store(new_initial_pos)

	self.target_unit = nil
	self._impact_offset = Vector3Box(Vector3.normalize(Vector3.flat(self.target_vector_boxed:unbox())))

	Unit.flow_event(self.unit, "stopped")
end

ProjectileStickyLocomotion.has_stopped = function (self)
	return self.stopped
end

ProjectileStickyLocomotion.hot_join_sync = function (self, peer_id)
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	if ALIVE[self.unit] then
		local go_id = Managers.state.unit_storage:go_id(self.unit)
		local time_stopped = Managers.time:time("game") - self.stop_time

		RPC.rpc_hot_join_sync_projectile_sticky(channel_id, go_id, self.time_lived, time_stopped)
	end
end

ProjectileStickyLocomotion.hot_join_sync_projectile_sticky = function (self, time_lived, time_stopped)
	local t = Managers.time:time("game")
	self.spawn_time = t - time_lived
	self.stop_time = t - time_stopped
	self.time_lived = time_lived
end
