PlayerCharacterStateLeaping = class(PlayerCharacterStateLeaping, PlayerCharacterState)
PlayerCharacterStateLeaping.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "leaping")

	self._direction = Vector3Box()

	return 
end
local position_lookup = POSITION_LOOKUP
PlayerCharacterStateLeaping.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self.temp_params)

	local player = self.player
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local locomotion_extension = self.locomotion_extension
	local inventory_extension = self.inventory_extension
	local first_person_extension = self.first_person_extension
	self._wwise_world = Managers.world:wwise_world(self.world)
	local leap_data = self.status_extension.do_leap
	leap_data.landing_time = t + leap_data.time_of_flight
	leap_data.starting_pos = Vector3Box(POSITION_LOOKUP[unit])
	leap_data.total_distance = Vector3.length(leap_data.projected_hit_pos:unbox() - POSITION_LOOKUP[unit])
	self._leap_data = leap_data
	status_extension.do_leap = false
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local jump_speed = movement_settings_table.jump.initial_vertical_leap_speed
	local rotation = first_person_extension.current_rotation(first_person_extension)
	local look_direction_flat = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	local start_position = POSITION_LOOKUP[unit]
	local projected_hit_pos = leap_data.projected_hit_pos:unbox()
	local distance = Vector3.length(projected_hit_pos - start_position)
	local needed_speed = distance/leap_data.time_of_flight
	local forward_velocity = look_direction_flat*needed_speed
	local velocity_jump = Vector3(forward_velocity.x, forward_velocity.y, jump_speed)
	local initial_velocity = leap_data.initial_velocity:unbox()

	self._start_leap(self, unit, initial_velocity, t)
	CharacterStateHelper.look(input_extension, player.viewport_name, first_person_extension, status_extension, self.inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self.health_extension)

	local position = POSITION_LOOKUP[unit]

	ScriptUnit.extension(unit, "whereabouts_system"):set_jumped()

	local start_jump_height = position_lookup[unit].z
	local status_extension = self.status_extension

	status_extension.set_falling_height(status_extension, start_jump_height)

	return 
end
PlayerCharacterStateLeaping.on_exit = function (self, unit, input, dt, context, t, next_state)
	local input_extension = self.input_extension

	self.locomotion_extension:reset_maximum_upwards_velocity()

	if next_state == "walking" or next_state == "standing" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_landed()
	elseif next_state and next_state ~= "falling" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_no_landing()
	end

	if next_state and next_state ~= "falling" and Managers.state.network:game() then
		CharacterStateHelper.play_animation_event(unit, "land_still")
		CharacterStateHelper.play_animation_event(unit, "to_onground")
	end

	if self._leap_data.leap_finish then
		self._leap_data.leap_finish(unit)
	end

	return 
end
PlayerCharacterStateLeaping.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local locomotion_extension = self.locomotion_extension
	local inventory_extension = self.inventory_extension
	local health_extension = self.health_extension

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return 
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm.change_state(csm, "using_transport")

		return 
	end

	if CharacterStateHelper.is_overcharge_exploding(status_extension) then
		csm.change_state(csm, "overcharge_exploding")

		return 
	end

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension.set_pushed(status_extension, false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension.hit_react_type(status_extension)
		params.hit_react_type = hit_react_type .. "_push"

		csm.change_state(csm, "stunned", params)

		return 
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension.set_block_broken(status_extension, false)

		local params = movement_settings_table.stun_settings.parry_broken
		params.hit_react_type = "medium_push"

		csm.change_state(csm, "stunned", params)

		return 
	end

	if self._update_movement(self, unit, dt, t) then
		self._land(self, unit, t)

		if locomotion_extension.is_on_ground(locomotion_extension) then
			csm.change_state(csm, "walking", self.temp_params)
			first_person_extension.change_state(first_person_extension, "walking")

			return 
		end

		if not self.csm.state_next and locomotion_extension.current_velocity(locomotion_extension).z <= 0 then
			csm.change_state(csm, "falling", self.temp_params)
			first_person_extension.change_state(first_person_extension, "falling")

			return 
		end
	end

	local current_position = POSITION_LOOKUP[unit]
	local starting_pos = self._leap_data.starting_pos:unbox()
	local distance_travelled = Vector3.length(current_position - starting_pos)
	local percentage_done = distance_travelled/self._leap_data.total_distance
	local look_override_x = 0
	local look_override_y = math.lerp(0, -0.01, percentage_done)
	local look_sense_override = math.min(1, math.lerp(0.1, 1, percentage_done))
	local look_override = Vector3(look_override_x, look_override_y, 0)

	CharacterStateHelper.look(input_extension, self.player.viewport_name, first_person_extension, status_extension, inventory_extension, look_sense_override, look_override)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)
	CharacterStateHelper.reload(input_extension, inventory_extension, status_extension)

	return 
end
PlayerCharacterStateLeaping._update_movement = function (self, unit, dt, t)
	local leap_done = false
	local leap_data = self._leap_data

	if leap_data.landing_time <= dt + t then
		leap_done = true
	end

	local current_position = POSITION_LOOKUP[unit]
	local starting_pos = leap_data.starting_pos:unbox()
	local distance_travelled = Vector3.length(current_position - starting_pos)

	if leap_data.total_distance*0.75 <= distance_travelled then
		local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration*1.5
	elseif leap_data.total_distance*0.5 <= distance_travelled then
		local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
		movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration*1.25
	end

	local colliding_down = CharacterStateHelper.is_colliding_down(unit)

	return leap_done or colliding_down
end
PlayerCharacterStateLeaping._land = function (self, unit, t)
	local world = self.world
	local locomotion_extension = self.locomotion_extension
	local first_person_extension = self.first_person_extension

	first_person_extension.play_camera_effect_sequence(first_person_extension, "landed_hard", t)

	local land_sound_event = self._leap_data.sfx_event_land

	if land_sound_event then
		local position = first_person_extension.current_position(first_person_extension)

		WwiseUtils.trigger_position_event(world, land_sound_event, position)
	end

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration

	return 
end
PlayerCharacterStateLeaping._start_leap = function (self, unit, velocity, t)
	local world = self.world
	local locomotion_extension = self.locomotion_extension
	local first_person_extension = self.first_person_extension

	CharacterStateHelper.play_animation_event(unit, self._leap_data.anim_start_event)
	first_person_extension.play_camera_effect_sequence(first_person_extension, "jump", t)

	local jump_sound_event = self._leap_data.sfx_event_jump

	if jump_sound_event then
		local position = first_person_extension.current_position(first_person_extension)

		WwiseUtils.trigger_position_event(world, jump_sound_event, position)
	end

	locomotion_extension.set_maximum_upwards_velocity(locomotion_extension, velocity.z)
	locomotion_extension.set_forced_velocity(locomotion_extension, velocity)
	locomotion_extension.set_wanted_velocity(locomotion_extension, velocity)

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	movement_settings_table.gravity_acceleration = PlayerUnitMovementSettings.gravity_acceleration*0.9

	return 
end

return 
