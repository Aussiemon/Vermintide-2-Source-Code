-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_leaping.lua

EnemyCharacterStateLeaping = class(EnemyCharacterStateLeaping, EnemyCharacterState)

EnemyCharacterStateLeaping.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "leaping")

	self._direction = Vector3Box()
end

local POSITION_LOOKUP = POSITION_LOOKUP

EnemyCharacterStateLeaping.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self._temp_params)

	local player = self._player
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
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
	self.jump_direction = Vector3Box(look_direction_flat)

	self:_start_leap(unit, t)
	CharacterStateHelper.look(input_extension, player.viewport_name, first_person_extension, status_extension, self._inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self._health_extension)
	ScriptUnit.extension(unit, "whereabouts_system"):set_jumped()

	self._time_slided = 0
	self._played_landing_event = nil
end

EnemyCharacterStateLeaping.on_exit = function (self, unit, input, dt, context, t, next_state)
	local input_extension = self._input_extension
	local locomotion_extension = self._locomotion_extension

	if next_state == "walking" or next_state == "standing" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_landed()
	elseif next_state and next_state ~= "falling" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_no_landing()
	end

	if next_state and next_state ~= "falling" and Managers.state.network:game() then
		CharacterStateHelper.play_animation_event(unit, "land_still")
		CharacterStateHelper.play_animation_event(unit, "to_onground")
		locomotion_extension:force_on_ground(true)
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

	if self:_update_movement(unit, dt, t) then
		self:_finish(unit, t)

		if CharacterStateHelper.is_colliding_down(unit) then
			csm:change_state("walking", self._temp_params)
			first_person_extension:change_state("walking")

			return
		elseif CharacterStateHelper.is_colliding_sides(unit) then
			csm:change_state("walking", self._temp_params)
			first_person_extension:change_state("walking")

			return
		end

		if not self._csm.state_next and locomotion_extension:current_velocity().z <= 0 then
			csm:change_state("falling", self._temp_params)
			first_person_extension:change_state("falling")

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

	if distance_travelled <= start_accel_distance then
		local interval_distance_percentage = scale_percentage(zero_distance, start_accel_distance, distance_travelled)

		interval_distance_percentage = math.ease_out_exp(interval_distance_percentage)

		local speed_multiplier = math.lerp(0, 1.25, interval_distance_percentage)

		speed = speed * speed_multiplier

		local gravity_multiplier = 0.5

		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier

		local move_cap = math.clamp(movement_settings_table.move_speed, 0, movement_settings_table.max_move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)

		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale)

		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	elseif distance_travelled <= end_accel_distance then
		local interval_distance_percentage = scale_percentage(start_accel_distance, end_accel_distance, distance_travelled)

		interval_distance_percentage = math.easeOutCubic(interval_distance_percentage)

		local speed_multiplier = math.lerp(1.25, 0.8, interval_distance_percentage)

		speed = speed * speed_multiplier

		local gravity_multiplier = 0.5

		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier

		local move_cap = math.clamp(movement_settings_table.move_speed, 0, movement_settings_table.max_move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)

		new_move_speed = math.clamp(new_move_speed, 0, move_cap * (movement_settings_table.player_speed_scale or 1))

		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	elseif distance_travelled <= glide_distance then
		local interval_distance_percentage = scale_percentage(end_accel_distance, glide_distance, distance_travelled)

		interval_distance_percentage = math.ease_in_exp(interval_distance_percentage)

		local speed_multiplier = math.lerp(0.8, 0.7, interval_distance_percentage)

		speed = speed * speed_multiplier

		local gravity_multiplier = 1

		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier

		local move_cap = math.clamp(movement_settings_table.move_speed, 0, movement_settings_table.max_move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)

		new_move_speed = math.clamp(new_move_speed, 0, move_cap * (movement_settings_table.player_speed_scale or 1))

		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	elseif distance_travelled <= slow_distance then
		local interval_distance_percentage = scale_percentage(glide_distance, slow_distance, distance_travelled)

		interval_distance_percentage = math.ease_out_quad(interval_distance_percentage)

		local speed_multiplier = math.lerp(0.7, 0.6, interval_distance_percentage)

		speed = speed * speed_multiplier

		local gravity_multiplier = 0

		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * interval_distance_percentage

		local move_cap = math.clamp(movement_settings_table.move_speed, 0, movement_settings_table.max_move_speed)
		local prev_move_velocity = locomotion_extension:current_velocity()
		local new_move_velocity = (Vector3.normalize(prev_move_velocity) + move_direction) * speed
		local new_move_speed = Vector3.length(new_move_velocity)

		new_move_speed = math.clamp(new_move_speed, 0, move_cap * movement_settings_table.player_speed_scale or 1)

		local new_move_direction = Vector3.normalize(new_move_velocity)

		locomotion_extension:set_wanted_velocity(new_move_direction * new_move_speed)
	else
		local interval_distance_percentage = scale_percentage(slow_distance, full_distance, distance_travelled)

		interval_distance_percentage = math.ease_out_quad(interval_distance_percentage)

		local speed_multiplier = math.lerp(0.6, 1.2, interval_distance_percentage)

		speed = speed * speed_multiplier

		local forward_vector_multiplier = math.lerp(0.25, 0, interval_distance_percentage)
		local towards_end_vector_multiplier = math.lerp(0, 0.75, interval_distance_percentage)
		local gravity_multiplier = 1.5

		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * gravity_multiplier

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
end

EnemyCharacterStateLeaping._update_movement = function (self, unit, dt, t)
	if self._leap_done then
		return true
	end

	self:_move_in_air(unit, dt, t)

	local colliding_down = CharacterStateHelper.is_colliding_down(unit)
	local colliding_sides = CharacterStateHelper.is_colliding_sides(unit)

	self._leap_done = colliding_down or colliding_sides

	return self._leap_done
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

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration

	locomotion_extension:set_forced_velocity(Vector3.zero())
	locomotion_extension:set_wanted_velocity(Vector3.zero())
	locomotion_extension:reset_maximum_upwards_velocity()

	if self._leap_data.leap_events.finished then
		local final_position = POSITION_LOOKUP[unit]

		self._leap_data.leap_events.finished(self, unit, false, final_position)
	end

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

	local direction = self._leap_data.direction:unbox()
	local speed = PlayerUnitMovementSettings.leap.jump_speed
	local velocity = direction * speed + Vector3.up()

	locomotion_extension:set_maximum_upwards_velocity(velocity.z)
	locomotion_extension:set_forced_velocity(velocity)
	locomotion_extension:set_wanted_velocity(velocity)

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration * 0
	self._leap_done = false
end
