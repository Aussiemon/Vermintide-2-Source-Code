-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_dodging.lua

EnemyCharacterStateDodging = class(EnemyCharacterStateDodging, EnemyCharacterState)

EnemyCharacterStateDodging.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "dodging")

	local context = character_state_init_context

	self.movement_speed = 0
	self.dodge_direction = Vector3Box(0, 0, 0)
	self.last_position = Vector3Box(0, 0, 0)
end

EnemyCharacterStateDodging.on_enter_animation = function (self, unit)
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local dodge_direction = self.dodge_direction:unbox()
	local x_value = Vector3.x(dodge_direction)
	local y_value = Vector3.y(dodge_direction)
	local variable_name = "dodge_time"
	local variable_value = self.estimated_dodge_time
	local first_person_extension = self._first_person_extension

	if math.abs(y_value) > math.abs(x_value) then
		CharacterStateHelper.play_animation_event_with_variable_float(unit, "dodge_bwd", variable_name, variable_value)
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "dodge_bwd")
	elseif x_value > 0 then
		CharacterStateHelper.play_animation_event_with_variable_float(unit, "dodge_left", variable_name, variable_value)
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "dodge_left")
	else
		CharacterStateHelper.play_animation_event_with_variable_float(unit, "dodge_right", variable_name, variable_value)
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "dodge_right")
	end
end

EnemyCharacterStateDodging.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local unit = self._unit
	local input_extension = self._input_extension
	local first_person_extension = self._first_person_extension
	local status_extension = self._status_extension
	local inventory_extension = self._inventory_extension
	local health_extension = self._health_extension

	self.dodge_direction:store(params.dodge_direction)

	params.dodge_direction = nil

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	status_extension:set_dodge_jump_override_t(t, movement_settings_table.dodging.dodge_jump_override_timer)
	self:start_dodge(unit, t)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)
	self:on_enter_animation(unit)
	self._locomotion_extension:enable_rotation_towards_velocity(false)

	local forward_direction = Quaternion.forward(first_person_extension:current_rotation())

	Vector3.set_z(forward_direction, 0)

	forward_direction = Vector3.normalize(forward_direction)

	local flat_rotation = Quaternion.look(forward_direction, Vector3(0, 0, 1))

	Unit.set_local_rotation(unit, 0, flat_rotation)
end

EnemyCharacterStateDodging.on_exit = function (self, unit, input, dt, context, t, next_state)
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local cd = math.max(movement_settings_table.dodging.dodge_cd, movement_settings_table.dodging.dodge_jump_override_timer - self.time_in_dodge)

	self._status_extension:set_dodge_cd(t, cd)

	self.dodge_timer = nil
	self.dodge_stand_still_timer = nil
	self.dodge_return_timer = nil

	self._locomotion_extension:enable_rotation_towards_velocity(true)
	self._status_extension:start_dodge_cooldown(t)

	local network_manager = Managers.state.network

	if network_manager:game() then
		CharacterStateHelper.play_animation_event(unit, "dodge_end")

		if not LEVEL_EDITOR_TEST then
			local unit_id = network_manager:unit_game_object_id(unit)

			self._status_extension:set_is_dodging(false)
			network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, false, unit_id, 0)
		end
	end
end

EnemyCharacterStateDodging.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local unit = self._unit
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension

	self.time_in_dodge = self.time_in_dodge + dt

	ScriptUnit.extension(unit, "whereabouts_system"):set_is_onground()

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

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

	if self._locomotion_extension:is_animation_driven() then
		return
	end

	if (input_extension:get("jump") or input_extension:get("jump_only")) and status_extension:can_override_dodge_with_jump(t) and self._locomotion_extension:jump_allowed() then
		local params = self._temp_params

		params.post_dodge_jump = true

		csm:change_state("jumping", params)

		return
	end

	CharacterStateHelper.update_dodge_lock(unit, self._input_extension, status_extension)

	if not self._csm.state_next and not self._locomotion_extension:is_on_ground() then
		csm:change_state("falling", self._temp_params)

		return
	end

	if not self:update_dodge(unit, dt, t) then
		local params = self._temp_params

		csm:change_state("walking", params)
	end

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, self._inventory_extension)

	local move_anim = CharacterStateHelper.get_move_animation(self._locomotion_extension, input_extension, status_extension, self.move_anim)

	if move_anim ~= self.move_anim then
		CharacterStateHelper.play_animation_event(unit, move_anim)

		self.move_anim = move_anim
	end
end

local params = {}

EnemyCharacterStateDodging.update_dodge = function (self, unit, dt, t)
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local last_distance_left = self.distance_left
	local diminishing_return_factor = self._status_extension:get_dodge_cooldown()
	local speed_modifier = movement_settings_table.dodging.speed_modifier
	local distance_modifier = movement_settings_table.dodging.distance_modifier
	local distance_moved = Vector3.distance(Unit.world_position(unit, 0), self.last_position:unbox())
	local move_procent = distance_moved / self.distance_supposed_to_move

	if move_procent < movement_settings_table.dodging.stop_threshold then
		return false
	end

	if self.distance_left <= 0 then
		return false
	end

	local time_in_dodge = self.time_in_dodge * diminishing_return_factor
	local speed_at_times = movement_settings_table.dodging.speed_at_times
	local breaked = false
	local start_point = self.current_speed_setting_index + 1

	self.current_speed_setting_index = #speed_at_times

	for index = start_point, #speed_at_times do
		if time_in_dodge <= speed_at_times[index].time_in_dodge then
			self.current_speed_setting_index = index - 1

			break
		end
	end

	local dodge_finished = false
	local current_speed_setting_index = self.current_speed_setting_index
	local next_speed_setting_index = current_speed_setting_index + 1

	if next_speed_setting_index <= #speed_at_times then
		local time_between_settings = speed_at_times[next_speed_setting_index].time_in_dodge - speed_at_times[current_speed_setting_index].time_in_dodge
		local time_in_setting = time_in_dodge - speed_at_times[current_speed_setting_index].time_in_dodge
		local percentage_in_between = time_in_setting / time_between_settings

		self.speed = math.lerp(speed_at_times[current_speed_setting_index].speed, speed_at_times[next_speed_setting_index].speed, percentage_in_between) * speed_modifier * diminishing_return_factor
	else
		self.speed = speed_at_times[current_speed_setting_index].speed * speed_modifier * diminishing_return_factor
	end

	local unit_rotation = self._first_person_extension:current_rotation()
	local flat_unit_rotation = Quaternion.look(Vector3.flat(Quaternion.forward(unit_rotation)), Vector3.up())
	local move_direction = Quaternion.rotate(flat_unit_rotation, self.dodge_direction:unbox())

	self._locomotion_extension:set_wanted_velocity(move_direction * self.speed)

	local move_delta = self.speed * dt

	self.distance_supposed_to_move = move_delta
	self.distance_left = self.distance_left - move_delta

	return true
end

EnemyCharacterStateDodging.get_is_dodging = function (self)
	return self.dodge_timer or self.dodge_stand_still_timer or self.dodge_return_timer
end

EnemyCharacterStateDodging.start_dodge = function (self, unit, t)
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local network_manager = Managers.state.network

	if network_manager:game() and not LEVEL_EDITOR_TEST then
		local unit_id = network_manager:unit_game_object_id(unit)

		self._status_extension:set_is_dodging(true)
		network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, true, unit_id, 0)
	end

	assert(#movement_settings_table.dodging.speed_at_times > 1, "not enough speed at times in movementsettings")

	self.current_speed_setting_index = 1
	self.speed = movement_settings_table.dodging.speed_at_times[self.current_speed_setting_index].speed
	self.distance_supposed_to_move = 0
	self.time_in_dodge = 0
	self.distance_left = movement_settings_table.dodging.distance * movement_settings_table.dodging.distance_modifier * self._status_extension:get_dodge_cooldown()

	self.last_position:store(Unit.world_position(unit, 0))
	self:calculate_dodge_total_time(unit)
end

EnemyCharacterStateDodging.calculate_dodge_total_time = function (self, unit)
	local time_step = 0.016666666666666666
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local not_hit_end = true
	local time_in_dodge = 0
	local current_speed_setting_index = 1
	local distance_travelled = 0
	local dodge_fatigue = self.dodge_fatigue
	local diminishing_return_factor = self._status_extension:get_dodge_cooldown()
	local speed_modifier = movement_settings_table.dodging.speed_modifier
	local distance_modifier = movement_settings_table.dodging.distance_modifier * diminishing_return_factor
	local speed = movement_settings_table.dodging.speed_at_times[1].speed * speed_modifier * diminishing_return_factor

	while not_hit_end do
		time_in_dodge = time_in_dodge + time_step

		local speed_at_times = movement_settings_table.dodging.speed_at_times
		local breaked = false
		local start_point = current_speed_setting_index + 1

		current_speed_setting_index = #speed_at_times

		for index = start_point, #speed_at_times do
			if time_in_dodge <= speed_at_times[index].time_in_dodge then
				current_speed_setting_index = index - 1

				break
			end
		end

		local next_speed_setting_index = current_speed_setting_index + 1

		if next_speed_setting_index <= #speed_at_times then
			local time_between_settings = speed_at_times[next_speed_setting_index].time_in_dodge - speed_at_times[current_speed_setting_index].time_in_dodge
			local time_in_setting = time_in_dodge - speed_at_times[current_speed_setting_index].time_in_dodge
			local percentage_in_between = time_in_setting / time_between_settings

			speed = math.lerp(speed_at_times[current_speed_setting_index].speed, speed_at_times[next_speed_setting_index].speed, percentage_in_between) * speed_modifier * diminishing_return_factor
		else
			speed = speed_at_times[current_speed_setting_index].speed * speed_modifier
		end

		distance_travelled = distance_travelled + speed * time_step

		if distance_travelled > movement_settings_table.dodging.distance * distance_modifier * diminishing_return_factor then
			not_hit_end = false
		end
	end

	self.estimated_dodge_time = time_in_dodge
end
