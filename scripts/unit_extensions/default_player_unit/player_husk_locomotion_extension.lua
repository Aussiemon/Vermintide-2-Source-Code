PlayerHuskLocomotionExtension = class(PlayerHuskLocomotionExtension)
local POSITION_LOOKUP = POSITION_LOOKUP

PlayerHuskLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit
	self.game = extension_init_data.game
	self.id = extension_init_data.id
	self.player = extension_init_data.player
	self.is_server = Managers.player.is_server
	self.velocity_current = Vector3Box(0, 0, 0)
	self._current_rotation = QuaternionBox(Quaternion.identity())
	self.has_moved_from_start_position = extension_init_data.has_moved_from_start_position
	self.move_speed_anim_var = Unit.animation_find_variable(unit, "move_speed")

	Managers.player:assign_unit_ownership(unit, self.player, true)

	local level_settings = LevelHelper:current_level_settings()
	local flow_event = level_settings.on_spawn_flow_event

	if flow_event then
		Unit.flow_event(unit, flow_event)
	end

	local animation_run_variable_id = Unit.animation_find_variable(unit, "anim_run_speed")
	local animation_walk_variable_id = Unit.animation_find_variable(unit, "anim_walk_speed")
	self.movement_scale_animation_id = Unit.animation_find_variable(unit, "movement_scale")
	self.run_speed_treshold = Unit.animation_get_variable(unit, animation_run_variable_id)
	self.walk_speed_treshold = Unit.animation_get_variable(unit, animation_walk_variable_id)

	if self.is_server then
		local nav_cost_map_cost_table = GwNavCostMap.create_tag_cost_table()

		AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table, nil, 1)

		self._latest_position_on_navmesh = Vector3Box(Unit.world_position(unit, 0))
		self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
		self._nav_traverse_logic = GwNavTraverseLogic.create(self._nav_world, nav_cost_map_cost_table)
		self._nav_cost_map_cost_table = nav_cost_map_cost_table
	end
end

PlayerHuskLocomotionExtension.destroy = function (self)
	if self.is_server then
		GwNavCostMap.destroy_tag_cost_table(self._nav_cost_map_cost_table)
		GwNavTraverseLogic.destroy(self._nav_traverse_logic)
	end
end

PlayerHuskLocomotionExtension.current_velocity = function (self)
	return GameSession.game_object_field(self.game, self.id, "velocity")
end

PlayerHuskLocomotionExtension.average_velocity = function (self)
	return GameSession.game_object_field(self.game, self.id, "average_velocity")
end

PlayerHuskLocomotionExtension.small_sample_size_average_velocity = function (self)
	return GameSession.game_object_field(self.game, self.id, "small_sample_size_average_velocity")
end

PlayerHuskLocomotionExtension.extensions_ready = function (self, world, unit)
	self.status_extension = ScriptUnit.extension(self.unit, "status_system")
end

PlayerHuskLocomotionExtension.add_external_velocity = function (self, velocity, upper_limit)
	if not Managers.state.network:game() then
		return
	end

	local rpc_name = upper_limit and "rpc_add_external_velocity_with_upper_limit" or "rpc_add_external_velocity"

	if self.is_server then
		Managers.state.network.network_transmit:send_rpc(rpc_name, self.player:network_id(), self.id, velocity, upper_limit)
	else
		Managers.state.network.network_transmit:send_rpc_server(rpc_name, self.id, velocity, upper_limit)
	end
end

PlayerHuskLocomotionExtension.set_forced_velocity = function (self, velocity_forced)
	if not self.disabled then
		if self.is_server then
			Managers.state.network.network_transmit:send_rpc("rpc_set_forced_velocity", self.player:network_id(), self.id, velocity_forced)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_set_forced_velocity", self.id, velocity_forced)
		end
	end
end

PlayerHuskLocomotionExtension.set_disabled = function (self, disabled, run_func, master_unit)
	self._disabled = disabled
	self._run_func = run_func
	self.master_unit = master_unit

	if not disabled then
		local unit = self.unit
		local pos = POSITION_LOOKUP[unit] or Unit.local_position(unit, 0)
		self._pos_lerp_time = 0

		Unit.set_data(unit, "last_lerp_position", pos)
		Unit.set_data(unit, "last_lerp_position_offset", Vector3(0, 0, 0))
		Unit.set_data(unit, "accumulated_movement", Vector3(0, 0, 0))

		local mover = Unit.mover(unit)

		Mover.set_position(mover, pos)
		Unit.set_local_position(unit, 0, pos)
	end
end

PlayerHuskLocomotionExtension.update = function (self, unit, input, dt, context, t)
	if self._disabled then
		self._run_func(unit, dt, self)

		return
	end

	if self.game and self.id then
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local is_alive = health_extension:is_alive()

		if is_alive then
			local movement_state = "onground"

			self:update_movement(dt, unit, movement_state)
		end
	end

	local is_on_ladder, ladder_unit = self.status_extension:get_is_on_ladder()

	if is_on_ladder and ladder_unit then
		self:update_ladder_animation_position(ladder_unit)
	end

	self:_update_last_position_on_navmesh()
end

PlayerHuskLocomotionExtension.last_position_on_navmesh = function (self)
	assert(self.is_server, "last position on nav mesh is only saved on server")

	return self._latest_position_on_navmesh:unbox()
end

PlayerHuskLocomotionExtension._update_last_position_on_navmesh = function (self)
	if self.is_server then
		local current_position = GameSession.game_object_field(self.game, self.id, "position")
		local found_nav_mesh, z = GwNavQueries.triangle_from_position(self._nav_world, current_position, 0.1, 0.3, self._nav_traverse_logic)

		if found_nav_mesh then
			self._latest_position_on_navmesh:store(Vector3(current_position.x, current_position.y, current_position.z))
		end
	end
end

local POS_EPSILON = 0.01
local POS_LERP_TIME = 0.1
local POS_LERP_TIME_LINKED = 0.01
local DISCONNECT_GRACE_TIME = 1

PlayerHuskLocomotionExtension.update_movement = function (self, dt, unit, movement_state)
	local old_pos = Unit.local_position(unit, 0)
	local new_pos = nil
	local linked_movement = GameSession.game_object_field(self.game, self.id, "linked_movement")
	local moving_platform = GameSession.game_object_field(self.game, self.id, "moving_platform")

	if linked_movement then
		local link_parent_is_level_unit = GameSession.game_object_field(self.game, self.id, "link_parent_is_level_unit")
		local link_parent_id = GameSession.game_object_field(self.game, self.id, "link_parent_id")
		local link_node = GameSession.game_object_field(self.game, self.id, "link_node")
		local link_offset = GameSession.game_object_field(self.game, self.id, "link_offset")
		local link_parent_unit = Managers.state.network:game_object_or_level_unit(link_parent_id, link_parent_is_level_unit)

		if Unit.alive(link_parent_unit) then
			new_pos = Unit.world_position(link_parent_unit, link_node) + link_offset
		else
			new_pos = GameSession.game_object_field(self.game, self.id, "position")
		end
	elseif moving_platform ~= 0 then
		local moving_platform_unit = Managers.state.network:game_object_or_level_unit(moving_platform, true)
		local moving_platform_pos = Unit.local_position(moving_platform_unit, 0)
		local player_local_pos = GameSession.game_object_field(self.game, self.id, "position")
		new_pos = moving_platform_pos + player_local_pos
	else
		new_pos = GameSession.game_object_field(self.game, self.id, "position")
	end

	local new_yaw = GameSession.game_object_field(self.game, self.id, "yaw")
	local new_pitch = GameSession.game_object_field(self.game, self.id, "pitch")
	local yaw_rotation = Quaternion(Vector3.up(), new_yaw)
	local pitch_rotation = Quaternion(Vector3.right(), new_pitch)
	local new_rot = Quaternion.multiply(yaw_rotation, pitch_rotation)
	local velocity = GameSession.game_object_field(self.game, self.id, "velocity")

	if Vector3.length(velocity) < NetworkConstants.VELOCITY_EPSILON then
		velocity = Vector3(0, 0, 0)
	end

	self.has_moved_from_start_position = GameSession.game_object_field(self.game, self.id, "has_moved_from_start_position")

	self:_extrapolation_movement(unit, dt, old_pos, new_pos, new_rot, movement_state, velocity, linked_movement)
	self.velocity_current:store(velocity)
	self._current_rotation:store(new_rot)
	self:_update_speed_variable()
end

PlayerHuskLocomotionExtension.update_ladder_animation_position = function (self, ladder_unit)
	local unit = self.unit
	local ladder_pos = Unit.world_position(ladder_unit, 0)
	local time_in_move_animation = CharacterStateHelper.time_in_ladder_move_animation(unit, Vector3.z(ladder_pos))
	local variable_index = Unit.animation_find_variable(unit, "climb_time")

	Unit.animation_set_variable(unit, variable_index, time_in_move_animation)
end

PlayerHuskLocomotionExtension._extrapolation_movement = function (self, unit, dt, old_pos, new_pos, new_rot, movement_state, velocity, linked_movement)
	local last_pos = Unit.get_data(unit, "last_lerp_position") or old_pos
	local last_pos_offset = Unit.get_data(unit, "last_lerp_position_offset") or Vector3(0, 0, 0)
	local accumulated_movement = Unit.get_data(unit, "accumulated_movement") or Vector3(0, 0, 0)
	self._pos_lerp_time = (self._pos_lerp_time or 0) + dt
	self._velocity_lerp_time = (self._velocity_lerp_time or 0) + dt
	local pos_lerp_time = linked_movement and POS_LERP_TIME_LINKED or POS_LERP_TIME
	local lerp_t = self._pos_lerp_time / pos_lerp_time
	local move_delta = velocity * dt
	accumulated_movement = accumulated_movement + move_delta
	local lerp_pos = Vector3.lerp(last_pos_offset, Vector3(0, 0, 0), math.min(lerp_t, 1))
	local pos = last_pos + accumulated_movement + lerp_pos

	Profiler.record_statistics("move_delta", Vector3.length(move_delta))
	Profiler.record_statistics("husk_speed", Vector3.length(velocity))
	Profiler.record_statistics("dt", dt)
	Unit.set_data(unit, "accumulated_movement", accumulated_movement)

	if POS_EPSILON < Vector3.length(new_pos - last_pos) then
		self._pos_lerp_time = 0

		Unit.set_data(unit, "last_lerp_position", new_pos)
		Unit.set_data(unit, "last_lerp_position_offset", pos - new_pos)
		Unit.set_data(unit, "accumulated_movement", Vector3(0, 0, 0))
	end

	local previous_velocity = self.velocity_current:unbox()

	if NetworkConstants.VELOCITY_EPSILON < Vector3.length(velocity - previous_velocity) then
		self._velocity_lerp_time = 0
	end

	if DISCONNECT_GRACE_TIME < self._pos_lerp_time and DISCONNECT_GRACE_TIME < self._velocity_lerp_time then
		pos = new_pos

		Unit.set_data(unit, "accumulated_movement", Vector3(0, 0, 0))
	end

	local mover = Unit.mover(unit)

	Mover.set_position(mover, pos)
	Unit.set_local_position(unit, 0, pos)

	local old_rot = Unit.local_rotation(unit, 0)

	Unit.set_local_rotation(unit, 0, Quaternion.lerp(old_rot, new_rot, math.min(dt * 15, 1)))
end

local WALK_THRESHOLD = 0.97
local JOG_THRESHOLD = 3.23
local RUN_THRESHOLD = 6.14
local LOWEST_MOVEMENT_ANIMATION_SCALE = 0.3
local HIGHEST_MOVEMENT_ANIMATION_SCALE = 1.5
local MOVE_SPEED_MAX = 99.9999

PlayerHuskLocomotionExtension._update_speed_variable = function (self)
	local velocity = self.velocity_current:unbox()
	local flat_velocity = Vector3(velocity.x, velocity.y, 0)
	local speed = Vector3.length(flat_velocity)
	local unit = self.unit

	Unit.animation_set_variable(unit, self.move_speed_anim_var, math.min(speed, MOVE_SPEED_MAX))

	local movement_anim_scale = nil

	if speed < self.walk_speed_treshold then
		movement_anim_scale = speed / self.walk_speed_treshold
	elseif self.run_speed_treshold < speed then
		movement_anim_scale = speed / self.run_speed_treshold
	else
		movement_anim_scale = 1
	end

	movement_anim_scale = math.clamp(movement_anim_scale, LOWEST_MOVEMENT_ANIMATION_SCALE, HIGHEST_MOVEMENT_ANIMATION_SCALE)

	Unit.animation_set_variable(unit, self.movement_scale_animation_id, movement_anim_scale)
end

PlayerHuskLocomotionExtension._calculate_move_speed_var_from_mps = function (self, move_speed)
	local speed_var = nil
	local speed_multiplier = 1

	if move_speed <= WALK_THRESHOLD then
		speed_var = 0
		speed_multiplier = move_speed / WALK_THRESHOLD
	elseif move_speed <= JOG_THRESHOLD then
		speed_var = (move_speed - WALK_THRESHOLD) / (JOG_THRESHOLD - WALK_THRESHOLD)
	elseif move_speed <= RUN_THRESHOLD then
		speed_var = 1 + (move_speed - JOG_THRESHOLD) / (RUN_THRESHOLD - JOG_THRESHOLD)
	else
		speed_var = 3
		speed_multiplier = move_speed / RUN_THRESHOLD
	end

	return speed_var, speed_multiplier
end

PlayerHuskLocomotionExtension.rpc_animation_set_variable = function (self, index, variable)
	Unit.animation_set_variable(self.unit, index, variable)
end

PlayerHuskLocomotionExtension.hot_join_sync = function (self, sender)
	local player_object_id = self.id
	local unit = self.unit
	local channel_id = PEER_ID_TO_CHANNEL[sender]

	RPC.rpc_sync_anim_state_3(channel_id, player_object_id, Unit.animation_get_state(unit))
end

PlayerHuskLocomotionExtension.current_rotation = function (self)
	return self._current_rotation:unbox()
end

local ALLOWED_MOVER_MOVE_DISTANCE = 1

PlayerHuskLocomotionExtension.move_to_non_intersecting_position = function (self)
	local unit = self.unit
	local mover = Unit.mover(unit)
	local is_colliding, colliding_actor, move_vector, new_position = Mover.separate(mover, ALLOWED_MOVER_MOVE_DISTANCE)

	if is_colliding and new_position then
		Mover.set_position(mover, new_position)
		Unit.set_local_position(unit, 0, new_position)
	end
end

PlayerHuskLocomotionExtension.teleport_to = function (self, pos, rot)
	local unit = self.unit
	local mover = Unit.mover(unit)

	Mover.set_position(mover, pos)
	Unit.set_local_position(unit, 0, pos)
	self:move_to_non_intersecting_position()
end
