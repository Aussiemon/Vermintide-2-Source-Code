-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_walking.lua

EnemyCharacterStateWalking = class(EnemyCharacterStateWalking, EnemyCharacterState)

EnemyCharacterStateWalking.init = function (self, character_state_init_context, name)
	EnemyCharacterState.init(self, character_state_init_context, name or "walking")

	local context = character_state_init_context

	self.current_movement_speed_scale = 0
	self.latest_valid_navmesh_position = Vector3Box(math.huge, math.huge, math.huge)
	self.last_input_direction = Vector3Box(0, 0, 0)
end

EnemyCharacterStateWalking.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local unit = self._unit
	local input_extension = self._input_extension
	local first_person_extension = self._first_person_extension
	local status_extension = self._status_extension
	local inventory_extension = self._inventory_extension
	local health_extension = self._health_extension
	local locomotion_extension = self._locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()
	local player = Managers.player:owner(unit)
	local is_bot = player and player.bot_player

	if not status_extension:get_unarmed() then
		CharacterStateHelper.play_animation_event(unit, "to_combat")
	end

	if previous_state == "standing" then
		self.current_movement_speed_scale = 0
	else
		self.current_movement_speed_scale = 1
	end

	if not is_bot then
		local dir = Vector3.normalize(Vector3.flat(current_velocity))
		local look_rot = first_person_extension:current_rotation()
		local x = Vector3.dot(Quaternion.right(look_rot), dir)
		local y = Vector3.dot(Vector3.normalize(Vector3.flat(Quaternion.forward(look_rot))), dir)
		local local_move_vector = Vector3(x, y, 0)

		self.last_input_direction:store(local_move_vector)
	end

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(self._locomotion_extension, input_extension, status_extension)

	self.move_anim_3p = move_anim_3p
	self.move_anim_1p = move_anim_1p

	CharacterStateHelper.play_animation_event(unit, move_anim_3p)
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)

	self.is_bot = is_bot
end

EnemyCharacterStateWalking.common_state_changes = function (self)
	self:handle_disabled_ghost_mode()

	local csm = self._csm
	local unit = self._unit
	local input_extension = self._input_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local CharacterStateHelper = CharacterStateHelper
	local first_person_extension = self._first_person_extension
	local inventory_extension = self._inventory_extension
	local career_data = self._career_extension:career_settings()

	if locomotion_extension:is_on_ground() then
		ScriptUnit.extension(unit, "whereabouts_system"):set_is_onground()
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return true
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

		return true
	end

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension:set_pushed(false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension:hit_react_type()

		params.hit_react_type = hit_react_type .. "_push"

		csm:change_state("stunned", params)

		return true
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)

		local params = movement_settings_table.stun_settings.parry_broken

		params.hit_react_type = "medium_push"

		csm:change_state("stunned", params)

		return true
	end

	if locomotion_extension:is_animation_driven() then
		return true
	end

	local interactor_extension = self._interactor_extension

	if CharacterStateHelper.is_starting_interaction(input_extension, interactor_extension) then
		interactor_extension:start_interaction("interacting")

		if interactor_extension:allow_movement_during_interaction() then
			return
		end

		local config = interactor_extension:interaction_config()
		local params = self._temp_params

		params.swap_to_3p = config.swap_to_3p
		params.show_weapons = config.show_weapons
		params.activate_block = config.activate_block
		params.allow_rotation_update = config.allow_rotation_update

		csm:change_state("interacting", params)

		return true
	end

	if not csm.state_next and status_extension.do_leap then
		csm:change_state("leaping")

		return true
	end

	local input_extension = self._input_extension

	if input_extension:get("character_inspecting") then
		local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(self._inventory_extension)
		local current_action_settings = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

		if not current_action_settings then
			csm:change_state("inspecting")

			return true
		end
	end

	return false
end

EnemyCharacterStateWalking.common_movement = function (self, in_ghost_mode, dt)
	local csm = self._csm
	local current_movement_speed_scale = self.current_movement_speed_scale
	local first_person_extension = self._first_person_extension
	local input_extension = self._input_extension
	local inventory_extension = self._inventory_extension
	local locomotion_extension = self._locomotion_extension
	local status_extension = self._status_extension
	local unit = self._unit
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local is_crouching = status_extension:is_crouching()
	local is_moving = CharacterStateHelper.has_move_input(input_extension)

	if not csm.state_next and not is_moving and current_movement_speed_scale == 0 then
		local params = self._temp_params

		csm:change_state("standing", params)
		first_person_extension:change_state("standing")

		return true
	end

	if not csm.state_next and not locomotion_extension:is_on_ground() then
		csm:change_state("falling", self._temp_params)
		first_person_extension:change_state("falling")

		return true
	end

	if (input_extension:get("jump") or input_extension:get("jump_only")) and not status_extension:is_crouching() and (not is_crouching or CharacterStateHelper.can_uncrouch(unit)) and locomotion_extension:jump_allowed() then
		if is_crouching then
			CharacterStateHelper.uncrouch(unit, t, first_person_extension, status_extension)
		end

		csm:change_state("jumping")
		first_person_extension:change_state("jumping")

		return
	end

	local toggle_crouch = input_extension.toggle_crouch
	local player = Managers.player:owner(unit)
	local move_input = CharacterStateHelper.get_movement_input(input_extension)
	local breed = Unit.get_data(unit, "breed")

	if not self.is_bot then
		local breed_move_acceleration_up = breed and breed.breed_move_acceleration_up
		local breed_move_acceleration_down = breed and breed.breed_move_acceleration_down
		local move_acceleration_up_dt = breed_move_acceleration_up * dt or movement_settings_table.move_acceleration_up * dt
		local move_acceleration_down_dt = breed_move_acceleration_down * dt or movement_settings_table.move_acceleration_down * dt

		if is_moving then
			current_movement_speed_scale = math.min(1, current_movement_speed_scale + move_acceleration_up_dt)

			if gamepad_active then
				current_movement_speed_scale = Vector3.length(move_input) * current_movement_speed_scale
			end
		else
			current_movement_speed_scale = math.max(0, current_movement_speed_scale - move_acceleration_down_dt)
		end
	else
		current_movement_speed_scale = is_moving and 1 or 0
	end

	local is_walking = input_extension:get("walk")
	local breed_multiplier = breed.movement_speed_multiplier
	local current_max_move_speed = movement_settings_table.move_speed

	if in_ghost_mode and not is_walking then
		current_max_move_speed = movement_settings_table.ghost_move_speed
	end

	current_max_move_speed = current_max_move_speed * breed_multiplier

	local buffed_move_speed = buff_extension:apply_buffs_to_value(current_max_move_speed, "movement_speed")
	local final_move_speed = buffed_move_speed * current_movement_speed_scale * movement_settings_table.player_speed_scale
	local strafe_speed_multiplier = breed.strafe_speed_multiplier
	local move_input_direction = Vector3.normalize(move_input)

	if Vector3.length_squared(move_input) == 0 then
		move_input_direction = self.last_input_direction:unbox()
	else
		self.last_input_direction:store(move_input_direction)
	end

	CharacterStateHelper.move_on_ground(first_person_extension, input_extension, locomotion_extension, move_input_direction, final_move_speed, unit, strafe_speed_multiplier)
	CharacterStateHelper.ghost_mode(self._ghost_mode_extension, input_extension)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension)

	local move_anim_3p, move_anim_1p = CharacterStateHelper.get_move_animation(locomotion_extension, input_extension, status_extension, self.move_anim_3p)

	if move_anim_3p ~= self.move_anim_3p then
		CharacterStateHelper.play_animation_event(unit, move_anim_3p, true)

		self.move_anim_3p = move_anim_3p
	end

	if move_anim_1p ~= self.move_anim_1p then
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, move_anim_1p)

		self.move_anim_1p = move_anim_1p
	end

	self.current_movement_speed_scale = current_movement_speed_scale

	return false
end

EnemyCharacterStateWalking.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local input_extension = self._input_extension
	local inventory_extension = self._inventory_extension
	local health_extension = self._health_extension

	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, health_extension)
	self:_update_taunt_dialogue(t)

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	handled = self:common_movement(in_ghost_mode, dt)
end
