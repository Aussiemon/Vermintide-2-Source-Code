-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_leaping.lua

EnemyCharacterStateLeaping = class(EnemyCharacterStateLeaping, EnemyCharacterState)

EnemyCharacterStateLeaping.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "leaping")

	self._direction = Vector3Box()
end

local POSITION_LOOKUP = POSITION_LOOKUP

EnemyCharacterStateLeaping.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self._temp_params)

	self._time_entered_leap = t

	local player = self._player
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension

	locomotion_extension:set_mover_filter_property("enemy_leap_state", true)

	local inventory_extension = self._inventory_extension
	local first_person_extension = self._first_person_extension
	local leap_data = status_extension.do_leap

	leap_data.starting_pos = Vector3Box(POSITION_LOOKUP[unit])
	leap_data.total_distance = Vector3.length(leap_data.projected_hit_pos:unbox() - POSITION_LOOKUP[unit])
	self._leap_data = leap_data
	status_extension.do_leap = false

	local rotation = first_person_extension:current_rotation()
	local look_direction_flat = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	local start_position = POSITION_LOOKUP[unit]
	local projected_hit_pos = leap_data.projected_hit_pos:unbox()
	local distance = Vector3.length(projected_hit_pos - start_position)

	self._percentage_done = 0
	self.initial_jump_direction = Vector3Box(projected_hit_pos - start_position)
	self.jump_direction = Vector3Box(look_direction_flat)

	self:_start_leap(unit, t)
	CharacterStateHelper.look(input_extension, player.viewport_name, first_person_extension, status_extension, self._inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self._health_extension)
	ScriptUnit.extension(unit, "whereabouts_system"):set_jumped()

	self._time_slided = 0
	self._played_landing_event = nil
end

EnemyCharacterStateLeaping.on_exit = function (self, unit, input, dt, context, t, next_state, is_destroy)
	local input_extension = self._input_extension
	local locomotion_extension = self._locomotion_extension

	locomotion_extension:set_mover_filter_property("enemy_leap_state", false)

	if not is_destroy then
		local player_position = Vector3.copy(POSITION_LOOKUP[unit])
		local end_position = self._leap_data.projected_hit_pos:unbox()

		if player_position and end_position and player_position.z < end_position.z then
			player_position.z = end_position.z + 0.1

			locomotion_extension:teleport_to(player_position)
		end

		locomotion_extension:set_forced_velocity(Vector3.zero())
		locomotion_extension:set_wanted_velocity(Vector3.zero())

		if next_state == "staggered" and self._leap_data.leap_events.finished then
			local final_position = POSITION_LOOKUP[unit]

			self._leap_data.leap_events.finished(self, unit, false, final_position)
		end

		if next_state == "walking" or next_state == "standing" then
			ScriptUnit.extension(unit, "whereabouts_system"):set_landed()
		elseif next_state and next_state ~= "falling" then
			ScriptUnit.extension(unit, "whereabouts_system"):set_no_landing()
		end

		if next_state and next_state ~= "falling" and next_state ~= "staggered" and Managers.state.network:game() then
			CharacterStateHelper.play_animation_event(unit, "land_still")
			CharacterStateHelper.play_animation_event(unit, "to_onground")
			locomotion_extension:force_on_ground(true)
		end
	end
end

EnemyCharacterStateLeaping.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension
	local inventory_extension = self._inventory_extension
	local health_extension = self._health_extension

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

		return
	end

	if CharacterStateHelper.is_overcharge_exploding(status_extension) then
		csm:change_state("overcharge_exploding")

		return
	end

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension:set_pushed(false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension:hit_react_type()

		params.hit_react_type = hit_react_type .. "_push"

		csm:change_state("stunned", params)

		return
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)

		local params = movement_settings_table.stun_settings.parry_broken

		params.hit_react_type = "medium_push"

		csm:change_state("stunned", params)

		return
	end

	self._time_spent_in_leap = t - self._time_entered_leap

	local is_done_moving, colliding_down, going_backwards = self:_update_movement(unit, dt, t)

	if is_done_moving then
		self:_finish(unit, t)

		if colliding_down then
			csm:change_state("walking", self._temp_params)
			first_person_extension:change_state("walking")

			self._leap_done = true

			return
		end

		local current_velocity = locomotion_extension:current_velocity()

		if not self._csm.state_next and (current_velocity.z <= 0 or going_backwards) then
			if going_backwards then
				current_velocity.y = 0
			end

			self._locomotion_extension:set_wanted_velocity(Vector3.zero())
			self._locomotion_extension:set_forced_velocity(Vector3.zero())
			csm:change_state("falling", self._temp_params)
			first_person_extension:change_state("falling")

			self._leap_done = true

			return
		end
	end

	local current_position = POSITION_LOOKUP[unit]
	local starting_pos = self._leap_data.starting_pos:unbox()
	local projected_hit_pos = self._leap_data.projected_hit_pos:unbox()
	local distance_travelled = Vector3.length(current_position - starting_pos)

	self._percentage_done = distance_travelled / Vector3.length(projected_hit_pos - starting_pos)

	if self._leap_data.update_leap_anim_variable then
		self._leap_data.update_leap_anim_variable(self, unit)
	end

	local distance_to_goal_sqr = Vector3.distance_squared(current_position, projected_hit_pos)

	if distance_to_goal_sqr < 0.25 then
		self._leap_done = true
	end

	local look_sense_override, look_override

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension, look_sense_override, look_override)
end

local function scale_percentage(a, b, p)
	return (math.clamp(p, a, b) - a) / (b - a)
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

EnemyCharacterStateLeaping._move_in_air = function (self, unit, dt, t)
	local locomotion_extension = self._locomotion_extension
	local current_position = POSITION_LOOKUP[unit]
	local starting_pos = self._leap_data.starting_pos:unbox()
	local end_position = self._leap_data.projected_hit_pos:unbox()
	local travelled_vector = Vector3.flat(current_position - starting_pos)
	local total_vector = Vector3.flat(end_position - starting_pos)
	local dot = Vector3.dot(travelled_vector, total_vector)
	local total_distance = Vector3.length(total_vector)
	local distance_travelled = dot / total_distance
	local move_direction = Vector3.normalize(self._leap_data.direction:unbox())
	local player_movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local movement_settings_table = self._leap_data.movement_settings or PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local starting_speed = self._leap_data.speed
	local speed = starting_speed
	local move_speed_multiplier = self._status_extension:current_move_speed_multiplier()

	speed = speed * move_speed_multiplier^2
	speed = speed * movement_settings_table.player_speed_scale

	local lerp_data = self._leap_data.lerp_data
	local zero_distance = total_distance * lerp_data.zero_distance or 0
	local start_accel_distance = total_distance * lerp_data.start_accel_distance or 0.1
	local end_accel_distance = total_distance * lerp_data.end_accel_distance or 0.2
	local glide_distance = total_distance * lerp_data.glide_distance or 0.7
	local slow_distance = total_distance * lerp_data.slow_distance or 0.95
	local full_distance = total_distance * lerp_data.full_distance or 1

	self._old_position = current_position

	local state

	if distance_travelled <= start_accel_distance then
		state = "start_acceleration"

		local interval_distance_percentage = scale_percentage(zero_distance, start_accel_distance, distance_travelled)

		interval_distance_percentage = math.ease_out_exp(interval_distance_percentage)

		local speed_multiplier = math.lerp(0, 1.25, interval_distance_percentage)

		speed = speed * speed_multiplier

		local gravity_multiplier = 0.05

		player_movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier

		local move_cap = math.clamp(movement_settings_table.move_speed, 0, movement_settings_table.max_move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)

		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)

		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	elseif distance_travelled <= end_accel_distance then
		state = "end_acceleration"

		local interval_distance_percentage = scale_percentage(start_accel_distance, end_accel_distance, distance_travelled)

		interval_distance_percentage = math.easeOutCubic(interval_distance_percentage)

		local speed_multiplier = math.lerp(1.25, 0.8, interval_distance_percentage)

		speed = speed * speed_multiplier

		local gravity_multiplier = 0.1

		player_movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier

		local move_cap = math.clamp(movement_settings_table.move_speed, 0, movement_settings_table.max_move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)

		new_move_speed = math.clamp(new_move_speed, 0, move_cap * (movement_settings_table.player_speed_scale or 1))

		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	elseif distance_travelled <= glide_distance then
		state = "glide"

		local interval_distance_percentage = scale_percentage(end_accel_distance, glide_distance, distance_travelled)

		interval_distance_percentage = math.ease_in_exp(interval_distance_percentage)

		local speed_multiplier = math.lerp(0.8, 0.7, interval_distance_percentage)

		speed = speed * speed_multiplier

		locomotion_extension:set_mover_filter_property("enemy_leap_state", false)

		local gravity_multiplier = 1

		player_movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier

		local move_cap = math.clamp(movement_settings_table.move_speed, 0, movement_settings_table.max_move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)

		new_move_speed = math.clamp(new_move_speed, 0, move_cap * (movement_settings_table.player_speed_scale or 1))

		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	elseif distance_travelled <= slow_distance then
		state = "slow"

		local interval_distance_percentage = scale_percentage(glide_distance, slow_distance, distance_travelled)

		interval_distance_percentage = math.ease_out_quad(interval_distance_percentage)

		local speed_multiplier = math.lerp(0.7, 0.6, interval_distance_percentage)

		speed = speed * speed_multiplier
		player_movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * interval_distance_percentage

		local move_cap = math.clamp(movement_settings_table.move_speed, 0, movement_settings_table.max_move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)

		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale or 1)

		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	else
		state = "slam"

		locomotion_extension:set_mover_filter_property("enemy_leap_state", false)

		local interval_distance_percentage = scale_percentage(slow_distance, full_distance, distance_travelled)

		interval_distance_percentage = math.ease_out_quad(interval_distance_percentage)

		local speed_multiplier = math.lerp(0.6, 1.2, interval_distance_percentage)

		speed = speed * speed_multiplier

		local forward_vector_multiplier = math.lerp(0.25, 0, interval_distance_percentage)
		local towards_end_vector_multiplier = math.lerp(0, 0.75, interval_distance_percentage)
		local gravity_multiplier = 2

		player_movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier

		local move_cap = math.clamp(movement_settings_table.slam_speed, 0, movement_settings_table.max_slam_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local forward = Vector3.normalize(Vector3.flat(move_direction)) * forward_vector_multiplier
		local towards_end = Vector3.normalize(end_position - current_position) * towards_end_vector_multiplier
		local move_direction = forward + towards_end
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)

		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)

		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_forced_velocity(new_move_direction * new_move_speed)
	end

	return state
end

EnemyCharacterStateLeaping._update_movement = function (self, unit, dt, t)
	if self._leap_done then
		return true
	end

	local leap_state = self:_move_in_air(unit, dt, t)
	local colliding_down = CharacterStateHelper.is_colliding_down(unit)
	local current_vel = self._locomotion_extension:current_velocity()
	local flat_current_vel = Vector3.flat(current_vel)
	local dot = Vector3.dot(Vector3.normalize(Vector3Box.unbox(self.initial_jump_direction)), Vector3.normalize(flat_current_vel))
	local going_backwards

	if leap_state ~= "start_acceleration" and dot < 0 then
		going_backwards = true
	end

	self._leap_done = colliding_down or going_backwards

	return self._leap_done, colliding_down, going_backwards
end

EnemyCharacterStateLeaping._finish = function (self, unit, t)
	local world = self._world
	local locomotion_extension = self._locomotion_extension
	local first_person_extension = self._first_person_extension

	first_person_extension:play_camera_effect_sequence("landed_leap", t)

	local land_sound_event = self._leap_data.sfx_event_land

	if land_sound_event and not self._played_landing_event then
		first_person_extension:play_unit_sound_event(land_sound_event, unit, 0, true)

		self._played_landing_event = true
	end

	local player_movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	player_movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration

	locomotion_extension:set_forced_velocity(Vector3.zero())
	locomotion_extension:set_wanted_velocity(Vector3.zero())

	if self._leap_data.leap_events.finished then
		local final_position = POSITION_LOOKUP[unit]

		self._leap_data.leap_events.finished(self, unit, false, final_position)
	end

	self:_camera_effects(unit, 0)

	self._leap_done = true
end

EnemyCharacterStateLeaping._start_leap = function (self, unit, t)
	local world = self._world
	local locomotion_extension = self._locomotion_extension
	local first_person_extension = self._first_person_extension

	first_person_extension:play_camera_effect_sequence("jump", t)

	if self._leap_data.anim_start_event_1p then
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, self._leap_data.anim_start_event_1p)
	end

	if self._leap_data.anim_start_event_3p then
		CharacterStateHelper.play_animation_event(unit, self._leap_data.anim_start_event_3p)
	end

	local jump_sound_event = self._leap_data.sfx_event_jump

	if jump_sound_event then
		first_person_extension:play_unit_sound_event(jump_sound_event, unit, 0, true)
	end

	local leap_events = self._leap_data.leap_events

	if leap_events and leap_events.start then
		leap_events.start(self, unit)
	end

	local direction = self._leap_data.direction:unbox()
	local speed = PlayerUnitMovementSettings.leap.jump_speed
	local velocity = direction * speed + Vector3.up()

	locomotion_extension:set_maximum_upwards_velocity(velocity.z)
	locomotion_extension:set_forced_velocity(velocity)
	locomotion_extension:set_wanted_velocity(velocity)

	local movement_settings_table = self._leap_data.movement_settings or PlayerUnitMovementSettings.get_movement_settings_table(unit)

	movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * 0
	self._leap_done = false
end

EnemyCharacterStateLeaping._camera_effects = function (self, unit, alpha)
	local fov_max = 1.5
	local fov_multiplier = math.lerp(1, fov_max, alpha)

	Managers.state.camera:set_additional_fov_multiplier(fov_multiplier)

	local local_screen_space_effect = "fx/speedlines_01_1p"

	if alpha >= 0.25 then
		if not self._screenspace_effect_id then
			print("particles ON")

			self._screenspace_effect_id = self._first_person_extension:create_screen_particles(local_screen_space_effect)
		end
	elseif alpha <= 0 then
		print("particles OFF")

		if self._screenspace_effect_id then
			self._first_person_extension:destroy_screen_particles(self._screenspace_effect_id)

			self._screenspace_effect_id = nil
		end
	end
end
