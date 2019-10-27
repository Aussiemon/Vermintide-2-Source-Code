PlayerCharacterStateLeaping = class(PlayerCharacterStateLeaping, PlayerCharacterState)

PlayerCharacterStateLeaping.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "leaping")

	self._direction = Vector3Box()
end

local POSITION_LOOKUP = POSITION_LOOKUP

PlayerCharacterStateLeaping.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self.temp_params)

	local player = self.player
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local inventory_extension = self.inventory_extension
	local first_person_extension = self.first_person_extension
	self._wwise_world = Managers.world:wwise_world(self.world)
	self._physics_world = World.get_data(self.world, "physics_world")
	local leap_data = self.status_extension.do_leap
	leap_data.starting_pos = Vector3Box(POSITION_LOOKUP[unit])
	leap_data.total_distance = Vector3.length(leap_data.projected_hit_pos:unbox() - POSITION_LOOKUP[unit])
	self._leap_data = leap_data
	status_extension.do_leap = false
	local rotation = first_person_extension:current_rotation()
	local look_direction_flat = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	self._move_function = self[leap_data.move_function]
	self.jump_direction = Vector3Box(look_direction_flat)

	self:_start_leap(unit, t)
	CharacterStateHelper.look(input_extension, player.viewport_name, first_person_extension, status_extension, self.inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self.health_extension)
	ScriptUnit.extension(unit, "whereabouts_system"):set_jumped()

	if player and not player.remote and Managers.state.network:game() then
		local go_id = Managers.state.unit_storage:go_id(self.unit)

		Managers.state.network.network_transmit:send_rpc_server("rpc_leap_start", go_id)
	end

	self._time_slided = 0
	self._play_landing_event = true
	self._played_landing_event = false
	self._last_slam_vertical_distance = 0
end

PlayerCharacterStateLeaping.on_exit = function (self, unit, input, dt, context, t, next_state)
	self:_reset_speed_and_gravity(unit)

	if next_state == "walking" or next_state == "standing" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_landed()
	elseif next_state and next_state ~= "falling" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_no_landing()
	end

	local player = self.player

	if player and not player.remote and Managers.state.network:game() then
		local go_id = Managers.state.unit_storage:go_id(unit)

		Managers.state.network.network_transmit:send_rpc_server("rpc_leap_finished", go_id)
	end

	if next_state and next_state ~= "falling" and Managers.state.network:game() then
		CharacterStateHelper.play_animation_event(unit, "land_still")
		CharacterStateHelper.play_animation_event(unit, "to_onground")
	end

	if next_state == "catapulted" then
		self:_finish(unit, t, true)
	end
end

PlayerCharacterStateLeaping.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local locomotion_extension = self.locomotion_extension
	local inventory_extension = self.inventory_extension
	local health_extension = self.health_extension

	self:_update_distance_travelled()

	local leap_data = self._leap_data
	local leap_events = leap_data.leap_events

	if leap_events then
		local first_event_data = leap_events[1]
		local total_distance = self._total_distance
		local distance_travelled = self._distance_travelled

		while first_event_data do
			if distance_travelled >= total_distance * first_event_data.distance_percentage then
				local event_function = first_event_data.event_function

				event_function(self)
				table.remove(leap_events, 1)

				first_event_data = leap_events[1]
			else
				break
			end
		end
	end

	local aborted = false

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		aborted = true
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

		aborted = true
	end

	if CharacterStateHelper.is_overcharge_exploding(status_extension) then
		csm:change_state("overcharge_exploding")

		aborted = true
	end

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension:set_pushed(false)
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)
	end

	local movement_done, final_position = self:_update_movement(unit, dt, t)

	if aborted then
		if leap_events then
			local finished_event_function = leap_events.finished

			if finished_event_function then
				finished_event_function(self, true, final_position or POSITION_LOOKUP[unit])
			end
		end

		return
	end

	if movement_done then
		self:_finish(unit, t, false, final_position)

		if locomotion_extension:is_on_ground() then
			csm:change_state("walking", self.temp_params)
			first_person_extension:change_state("walking")

			return
		end

		if not self.csm.state_next and locomotion_extension:current_velocity().z <= 0 then
			csm:change_state("falling", self.temp_params)
			first_person_extension:change_state("falling")

			return
		end
	end

	local look_sense_override, look_override = nil

	CharacterStateHelper.look(input_extension, self.player.viewport_name, first_person_extension, status_extension, inventory_extension, look_sense_override, look_override)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)
end

PlayerCharacterStateLeaping._update_distance_travelled = function (self)
	local unit = self.unit
	local leap_data = self._leap_data
	local current_position = POSITION_LOOKUP[unit]
	local starting_pos = leap_data.starting_pos:unbox()
	local end_position = leap_data.projected_hit_pos:unbox()
	local travelled_vector = Vector3.flat(current_position - starting_pos)
	local total_vector = Vector3.flat(end_position - starting_pos)
	local dot = Vector3.dot(travelled_vector, total_vector)
	local total_distance = Vector3.length(total_vector)
	self._total_distance = total_distance
	self._distance_travelled = dot / total_distance
end

local function scale_percentage(a, b, p)
	return (math.clamp(p, a, b) - a) / (b - a)
end

PlayerCharacterStateLeaping.leap = function (self, unit, dt, t)
	local locomotion_extension = self.locomotion_extension
	local current_position = POSITION_LOOKUP[unit]
	local starting_pos = self._leap_data.starting_pos:unbox()
	local end_position = self._leap_data.projected_hit_pos:unbox()
	local total_distance = self._total_distance
	local distance_travelled = self._distance_travelled
	local vertical_distance = starting_pos.z - current_position.z
	local move_direction = Vector3.normalize(self._leap_data.direction:unbox())
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local starting_speed = self._leap_data.speed
	local speed = starting_speed
	local move_speed_multiplier = self.status_extension:current_move_speed_multiplier()
	speed = speed * move_speed_multiplier
	speed = speed * move_speed_multiplier
	speed = speed * movement_settings_table.player_speed_scale
	local zero_distance = total_distance * 0
	local start_accel_distance = total_distance * 0.1
	local end_accel_distance = total_distance * 0.2
	local glide_distance = total_distance * 0.5
	local slow_distance = total_distance * 0.7
	local full_distance = total_distance * 1

	if distance_travelled <= start_accel_distance then
		local interval_distance_percentage = scale_percentage(zero_distance, start_accel_distance, distance_travelled)
		interval_distance_percentage = math.ease_out_exp(interval_distance_percentage)
		local speed_multiplier = math.lerp(0, 1, interval_distance_percentage)
		speed = speed * speed_multiplier
		local gravity_multiplier = 0.25
		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier
		local move_cap = math.clamp(movement_settings_table.leap.move_speed, 0, PlayerUnitMovementSettings.leap.move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)
		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)
		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	elseif distance_travelled <= end_accel_distance then
		local interval_distance_percentage = scale_percentage(start_accel_distance, end_accel_distance, distance_travelled)
		interval_distance_percentage = math.easeOutCubic(interval_distance_percentage)
		local speed_multiplier = math.lerp(1, 0.8, interval_distance_percentage)
		speed = speed * speed_multiplier
		local gravity_multiplier = 0.5
		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier
		local move_cap = math.clamp(movement_settings_table.leap.move_speed, 0, PlayerUnitMovementSettings.leap.move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)
		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)
		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	elseif distance_travelled <= glide_distance then
		local interval_distance_percentage = scale_percentage(end_accel_distance, glide_distance, distance_travelled)
		interval_distance_percentage = math.ease_in_exp(interval_distance_percentage)
		local speed_multiplier = math.lerp(0.8, 0.7, interval_distance_percentage)
		speed = speed * speed_multiplier
		local gravity_multiplier = 1
		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier
		local move_cap = math.clamp(movement_settings_table.leap.move_speed, 0, PlayerUnitMovementSettings.leap.move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)
		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)
		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	elseif distance_travelled <= slow_distance then
		local interval_distance_percentage = scale_percentage(glide_distance, slow_distance, distance_travelled)
		interval_distance_percentage = math.ease_out_quad(interval_distance_percentage)
		local speed_multiplier = math.lerp(0.7, 0.5, interval_distance_percentage)
		speed = speed * speed_multiplier
		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * interval_distance_percentage
		local move_cap = math.clamp(movement_settings_table.leap.move_speed, 0, PlayerUnitMovementSettings.leap.move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)
		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)
		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	else
		local interval_distance_percentage = scale_percentage(slow_distance, full_distance, distance_travelled)
		interval_distance_percentage = math.ease_out_quad(interval_distance_percentage)
		local speed_multiplier = math.lerp(0.5, 1.5, interval_distance_percentage)
		speed = speed * speed_multiplier
		local forward_vector_multiplier = math.lerp(0.25, 0, interval_distance_percentage)
		local towards_end_vector_multiplier = math.lerp(0, 0.75, interval_distance_percentage)
		local gravity_multiplier = 1.5
		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier
		local move_cap = math.clamp(movement_settings_table.leap.slam_speed, 0, PlayerUnitMovementSettings.leap.slam_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local forward = Vector3.normalize(Vector3.flat(move_direction)) * forward_vector_multiplier
		local towards_end = Vector3.normalize(end_position - current_position) * towards_end_vector_multiplier
		local move_direction = forward + towards_end
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)
		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)
		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_forced_velocity(new_move_direction * new_move_speed)
		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)

		local clamped_vertical_distance = math.clamp(vertical_distance, 0, math.huge)

		if clamped_vertical_distance < self._last_slam_vertical_distance then
			self._play_landing_event = false

			return true, current_position
		end

		self._last_slam_vertical_distance = clamped_vertical_distance
	end

	if full_distance < distance_travelled then
		return true, current_position
	end

	return false
end

PlayerCharacterStateLeaping.teleleap = function (self, unit, dt, t)
	local locomotion_extension = self.locomotion_extension
	local current_position = POSITION_LOOKUP[unit]
	local starting_pos = self._leap_data.starting_pos:unbox()
	local end_position = self._leap_data.projected_hit_pos:unbox()
	local total_distance = self._total_distance
	local distance_travelled = self._distance_travelled
	local move_direction = Vector3.normalize(self._leap_data.direction:unbox())
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local starting_speed = self._leap_data.speed
	local speed = starting_speed
	local move_speed_multiplier = self.status_extension:current_move_speed_multiplier()
	speed = speed * move_speed_multiplier
	speed = speed * move_speed_multiplier
	speed = speed * movement_settings_table.player_speed_scale
	local zero_distance = total_distance * 0
	local hover_distance = total_distance * 0.05
	local acceleration_distance = total_distance * 0.2
	local teleport_acceleration_distance = total_distance * 0.5
	local full_distance = total_distance * 1
	local total_distance_percentage = scale_percentage(zero_distance, full_distance, distance_travelled)

	if distance_travelled <= hover_distance then
		local interval_distance_percentage = scale_percentage(zero_distance, hover_distance, distance_travelled)
		interval_distance_percentage = math.ease_out_exp(interval_distance_percentage)
		local speed_multiplier = math.lerp(0, 0.25, interval_distance_percentage)
		speed = speed * speed_multiplier
		local gravity_multiplier = math.lerp(5.5, 3, interval_distance_percentage)
		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier
		local move_cap = math.clamp(movement_settings_table.teleleap.move_speed, 0, PlayerUnitMovementSettings.teleleap.move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)
		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)
		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	elseif distance_travelled <= acceleration_distance then
		local interval_distance_percentage = scale_percentage(hover_distance, acceleration_distance, distance_travelled)
		interval_distance_percentage = math.easeOutCubic(interval_distance_percentage)
		local speed_multiplier = math.lerp(0.25, 3.5, interval_distance_percentage)
		speed = speed * speed_multiplier
		local forward_vector_multiplier = math.lerp(0.75, 0.25, total_distance_percentage)
		local towards_end_vector_multiplier = math.lerp(0, 0.75, total_distance_percentage)
		local gravity_multiplier = 0.5
		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier
		local move_cap = math.clamp(movement_settings_table.teleleap.move_speed, 0, PlayerUnitMovementSettings.teleleap.move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local forward = Vector3.normalize(Vector3.flat(move_direction)) * forward_vector_multiplier
		local towards_end = Vector3.normalize(end_position - current_position) * towards_end_vector_multiplier
		local move_direction = forward + towards_end
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)
		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)
		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_forced_velocity(new_move_direction * new_move_speed)
		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	elseif distance_travelled <= teleport_acceleration_distance then
		local interval_distance_percentage = scale_percentage(acceleration_distance, teleport_acceleration_distance, distance_travelled)
		interval_distance_percentage = math.ease_in_exp(interval_distance_percentage)
		local speed_multiplier = math.lerp(3.5, 5.5, interval_distance_percentage)
		speed = speed * speed_multiplier
		local forward_vector_multiplier = math.lerp(0.25, 0.25, total_distance_percentage)
		local towards_end_vector_multiplier = math.lerp(0.75, 1, total_distance_percentage)
		local gravity_multiplier = 1
		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier
		local move_cap = math.clamp(movement_settings_table.teleleap.move_speed, 0, PlayerUnitMovementSettings.teleleap.move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local forward = Vector3.normalize(Vector3.flat(move_direction)) * forward_vector_multiplier
		local towards_end = Vector3.normalize(end_position - current_position) * towards_end_vector_multiplier
		local move_direction = forward + towards_end
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)
		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)
		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_forced_velocity(new_move_direction * new_move_speed)
		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	else
		local landing_position = self:_teleport_to_with_collision(current_position, end_position, nil, "filter_mover_blocker")

		return true, landing_position
	end

	return false
end

PlayerCharacterStateLeaping._teleport_to_with_collision = function (self, start_pos, end_pos, rot, collision_filter)
	local locomotion_extension = self.locomotion_extension
	local physics_world = self._physics_world
	local radius = 1
	local max_hits = 20
	local result = PhysicsWorld.linear_sphere_sweep(physics_world, start_pos, end_pos, radius, max_hits, "collision_filter", collision_filter, "report_initial_overlap")
	local teleport_pos = nil

	if not result then
		teleport_pos = end_pos
	else
		teleport_pos = start_pos
	end

	locomotion_extension:teleport_to(teleport_pos, rot)

	return teleport_pos
end

PlayerCharacterStateLeaping._update_movement = function (self, unit, dt, t)
	if self._leap_done then
		return self._leap_done, self._final_position:unbox()
	end

	local max_dt = 0.016666666666666666
	local current_dt = 0
	local leap_done, final_position = nil

	while not leap_done and current_dt < dt do
		local interpolated_dt = math.min(max_dt, dt - current_dt)
		current_dt = math.min(current_dt + max_dt, dt)
		leap_done, final_position = self:_move_function(unit, interpolated_dt, t)
	end

	local colliding_down = CharacterStateHelper.is_colliding_down(unit)
	self._leap_done = leap_done or colliding_down
	self._final_position = Vector3Box((leap_done and final_position) or POSITION_LOOKUP[unit])

	return self._leap_done, final_position
end

PlayerCharacterStateLeaping._reset_speed_and_gravity = function (self, unit)
	local locomotion_extension = self.locomotion_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration

	locomotion_extension:set_forced_velocity(Vector3.zero())
	locomotion_extension:set_wanted_velocity(Vector3.zero())
	locomotion_extension:reset_maximum_upwards_velocity()
	locomotion_extension:set_external_velocity_enabled(true)
end

PlayerCharacterStateLeaping._finish = function (self, unit, t, aborted, final_position)
	local locomotion_extension = self.locomotion_extension
	local first_person_extension = self.first_person_extension
	local leap_data = self._leap_data
	local landed = self._play_landing_event

	self:_reset_speed_and_gravity(unit)

	if landed then
		locomotion_extension:force_on_ground(true)

		if leap_data.camera_effect_sequence_land then
			first_person_extension:play_camera_effect_sequence(leap_data.camera_effect_sequence_land, t)
		end

		local land_sound_event = leap_data.sfx_event_land

		if land_sound_event and not self._played_landing_event then
			first_person_extension:play_unit_sound_event(land_sound_event, unit, 0, true)

			self._played_landing_event = true
		end
	end

	local leap_events = leap_data.leap_events

	if leap_events then
		local finished_event_function = leap_events.finished

		if finished_event_function then
			finished_event_function(self, aborted or not landed, final_position or POSITION_LOOKUP[unit])
		end
	end

	self._leap_done = true
end

PlayerCharacterStateLeaping._start_leap = function (self, unit, t)
	local locomotion_extension = self.locomotion_extension
	local first_person_extension = self.first_person_extension
	local leap_data = self._leap_data

	if leap_data.camera_effect_sequence_start then
		first_person_extension:play_camera_effect_sequence(leap_data.camera_effect_sequence_start, t)
	end

	if leap_data.anim_start_event_1p then
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, leap_data.anim_start_event_1p)
	end

	if leap_data.anim_start_event_3p then
		CharacterStateHelper.play_animation_event(unit, leap_data.anim_start_event_3p)
	end

	local jump_sound_event = self._leap_data.sfx_event_jump

	if jump_sound_event then
		first_person_extension:play_unit_sound_event(jump_sound_event, unit, 0, true)
	end

	local direction = leap_data.direction:unbox()
	local speed = leap_data.initial_vertical_speed
	local velocity = direction * speed + Vector3.up()

	locomotion_extension:set_maximum_upwards_velocity(velocity.z)
	locomotion_extension:force_on_ground(false)
	locomotion_extension:set_forced_velocity(velocity)
	locomotion_extension:set_wanted_velocity(velocity)

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * 0
	local leap_events = leap_data.leap_events

	if leap_events then
		local start_event_function = leap_events.start

		if start_event_function then
			start_event_function(self)
		end
	end

	self._leap_done = false
end

return
