-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/packmaster/packmaster_state_grabbing.lua

PackmasterStateGrabbing = class(PackmasterStateGrabbing, EnemyCharacterState)

PackmasterStateGrabbing.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "packmaster_grabbing")

	self.current_movement_speed_scale = 0
	self.last_input_direction = Vector3Box(0, 0, 0)
end

local position_lookup = POSITION_LOOKUP

PackmasterStateGrabbing.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self._temp_params)

	self._unit = unit

	local breed = Unit.get_data(unit, "breed")

	self._breed = breed
	self._hook_range = breed.grab_hook_range
	self._grab_movement_speed_multiplier_initial = breed.grab_movement_speed_multiplier_initial
	self._grab_movement_speed_multiplier_target = breed.grab_movement_speed_multiplier_target
	self._move_slow_lerp_constant = 0.5
	self._dot_threshold = breed.grab_hook_cone_dot
	self._physics_world = World.physics_world(self._world)
	self.highest_dot_value = 0

	local velocity = Vector3(0, 0, 0)

	self._locomotion_extension:set_forced_velocity(velocity)
	self._locomotion_extension:set_wanted_velocity(Vector3.zero())

	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")
	self._inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

	local first_person_extension = self._first_person_extension

	self._first_person_unit = first_person_extension:get_first_person_unit()

	CharacterStateHelper.play_animation_event(unit, "attack_grab")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "attack_grab")

	self._grab_time = t + breed.grab_anim_time
	self._grab_grace_period = breed.grab_grace_period

	self._status_extension:set_is_packmaster_grabbing(true)
	self:set_breed_action("initial_pull")
end

PackmasterStateGrabbing.on_exit = function (self, unit, input, dt, context, t, next_state)
	local status_extension = self._status_extension

	status_extension:set_is_packmaster_grabbing(false)
	self._career_extension:start_activated_ability_cooldown(1)
	self:set_breed_action("n/a")
end

PackmasterStateGrabbing.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension

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

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)

		local params = movement_settings_table.stun_settings.parry_broken

		params.hit_react_type = "medium_push"

		csm:change_state("stunned", params)

		return
	end

	local grab_time = self._grab_time
	local grab_grace_period = {
		before = grab_time - self._grab_grace_period.before,
		after = grab_time + self._grab_grace_period.after,
	}
	local grab_target = self:_grab()

	if grab_time and t >= grab_grace_period.before then
		if grab_target or grab_time <= t then
			CharacterStateHelper.play_animation_event_first_person(first_person_extension, "claw_closed")
		end

		if grab_target then
			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event("hook_success", event_data)
			csm:change_state("packmaster_dragging", grab_target)
		elseif t >= grab_grace_period.after then
			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event("hook_fail", event_data)
			csm:change_state("walking")
		end
	end

	locomotion_extension:set_disable_rotation_update()
	self:_update_movement(unit, t, dt)
end

PackmasterStateGrabbing._grab = function (self)
	if not self._locomotion_extension:is_on_ground() then
		return nil
	end

	local unit = self._unit
	local first_person_unit = self._first_person_unit
	local physics_world = self._physics_world
	local enemy_unit_in_range = EnemyCharacterStateHelper.get_enemies_in_line_of_sight(unit, first_person_unit, physics_world)

	return enemy_unit_in_range
end

PackmasterStateGrabbing._update_movement = function (self, unit, t, dt)
	local buff_extension = self._buff_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local first_person_extension = self._first_person_extension
	local move_input = CharacterStateHelper.get_movement_input(input_extension)
	local is_moving = CharacterStateHelper.has_move_input(input_extension)
	local current_movement_speed_scale = self.current_movement_speed_scale

	if not self.is_bot then
		local move_acceleration_up_dt = movement_settings_table.move_acceleration_up * dt
		local move_acceleration_down_dt = movement_settings_table.move_acceleration_down * dt

		if is_moving then
			current_movement_speed_scale = math.min(1, current_movement_speed_scale + move_acceleration_up_dt)
		else
			current_movement_speed_scale = math.max(0, current_movement_speed_scale - move_acceleration_down_dt)
		end
	else
		current_movement_speed_scale = is_moving and 1 or 0
	end

	local movement_speed_multiplier = math.lerp(self._grab_movement_speed_multiplier_initial, self._grab_movement_speed_multiplier_target, self._move_slow_lerp_constant * dt)
	local current_max_move_speed = movement_settings_table.move_speed * movement_speed_multiplier
	local buffed_move_speed = buff_extension:apply_buffs_to_value(current_max_move_speed, "movement_speed")
	local final_move_speed = buffed_move_speed * current_movement_speed_scale * movement_settings_table.player_speed_scale
	local movement = Vector3(0, 0, 0)

	if move_input then
		movement = movement + move_input
	end

	local move_input_direction

	move_input_direction = Vector3.normalize(movement)

	if Vector3.length(move_input_direction) == 0 then
		move_input_direction = self.last_input_direction:unbox()
	else
		self.last_input_direction:store(move_input_direction)
	end

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(self._locomotion_extension, input_extension, self._status_extension)

	if move_anim_3p ~= self.move_anim_3p or move_anim_1p ~= self.move_anim_1p then
		CharacterStateHelper.play_animation_event(unit, move_anim_3p)

		self.move_anim_3p = move_anim_3p
		self.move_anim_1p = move_anim_1p
	end

	CharacterStateHelper.move_on_ground(first_person_extension, input_extension, self._locomotion_extension, move_input_direction, final_move_speed, unit)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, self._status_extension, self._inventory_extension)

	self.current_movement_speed_scale = current_movement_speed_scale
end
