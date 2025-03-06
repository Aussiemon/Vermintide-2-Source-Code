-- chunkname: @scripts/unit_extensions/default_player_unit/states/player_character_state_standing.lua

PlayerCharacterStateStanding = class(PlayerCharacterStateStanding, PlayerCharacterState)

PlayerCharacterStateStanding.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "standing")

	local context = character_state_init_context
end

PlayerCharacterStateStanding.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local unit = self.unit
	local input_extension = self.input_extension

	self.locomotion_extension:set_wanted_velocity(Vector3.zero())

	self.wherabouts_extension = ScriptUnit.extension(unit, "whereabouts_system")

	local inventory_extension = self.inventory_extension
	local first_person_extension = self.first_person_extension
	local status_extension = self.status_extension
	local toggle_crouch = input_extension.toggle_crouch

	CharacterStateHelper.check_crouch(unit, input_extension, status_extension, toggle_crouch, first_person_extension, t)
	CharacterStateHelper.look(input_extension, self.player.viewport_name, first_person_extension, status_extension, self.inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self.health_extension)

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	self.time_when_can_be_pushed = t + movement_settings_table.soft_collision.grace_time_pushed_entering_standing

	if CharacterStateHelper.is_interacting(self.interactor_extension) or CharacterStateHelper.is_starting_interaction(self.input_extension, self.interactor_extension) then
		return
	end

	self.side = Managers.state.side.side_by_unit[unit]
	self.current_animation = "idle"

	CharacterStateHelper.play_animation_event(unit, "idle")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")
end

PlayerCharacterStateStanding.on_exit = function (self, unit, input, dt, context, t, next_state)
	return
end

PlayerCharacterStateStanding._inspection_available = function (self)
	local is_state_ingame_deus = Managers.mechanism:get_state() == "ingame_deus"

	if not is_state_ingame_deus then
		return true
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")

	return not gamepad_active
end

PlayerCharacterStateStanding.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local world = self.world
	local unit = self.unit
	local input_extension = self.input_extension
	local locomotion_extension = self.locomotion_extension
	local status_extension = self.status_extension
	local first_person_extension = self.first_person_extension
	local CharacterStateHelper = CharacterStateHelper

	if locomotion_extension:is_on_ground() then
		self.wherabouts_extension:set_is_onground()
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if CharacterStateHelper.is_waiting_for_assisted_respawn(status_extension) then
		csm:change_state("waiting_for_assisted_respawn")

		return
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

		return
	end

	if CharacterStateHelper.is_ledge_hanging(world, unit, self.temp_params) then
		csm:change_state("ledge_hanging", self.temp_params)

		return
	end

	if CharacterStateHelper.is_overcharge_exploding(status_extension) then
		csm:change_state("overcharge_exploding")

		return
	end

	if not csm.state_next and status_extension.do_leap then
		csm:change_state("leaping")

		return
	end

	CharacterStateHelper.update_dodge_lock(unit, input_extension, status_extension)

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension:set_pushed(false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension:hit_react_type()

		params.hit_react_type = hit_react_type .. "_push"

		csm:change_state("stunned", params)

		return
	end

	if CharacterStateHelper.is_charged(status_extension) then
		local params = movement_settings_table.charged_settings.charged

		params.hit_react_type = "charged"

		csm:change_state("charged", params)

		return
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)

		local params = movement_settings_table.stun_settings.parry_broken

		params.hit_react_type = "medium_push"

		csm:change_state("stunned", params)

		return
	end

	local start_dodge, dodge_direction = CharacterStateHelper.check_to_start_dodge(unit, input_extension, status_extension, t)

	if start_dodge then
		local params = self.temp_params

		params.dodge_direction = dodge_direction

		csm:change_state("dodging", params)

		return
	end

	if locomotion_extension:is_animation_driven() then
		csm:change_state("walking")

		return
	end

	local interactor_extension = self.interactor_extension

	if CharacterStateHelper.is_starting_interaction(input_extension, interactor_extension) then
		local _, hold_input = InteractionHelper.interaction_action_names(unit)

		interactor_extension:start_interaction(hold_input)

		if interactor_extension:allow_movement_during_interaction() then
			return
		end

		local config = interactor_extension:interaction_config()
		local params = self.temp_params

		params.swap_to_3p = config.swap_to_3p
		params.show_weapons = config.show_weapons
		params.activate_block = config.activate_block
		params.allow_rotation_update = config.allow_rotation_update

		csm:change_state("interacting", params)

		return
	end

	if CharacterStateHelper.is_interacting(interactor_extension) then
		if interactor_extension:allow_movement_during_interaction() then
			return
		end

		local config = interactor_extension:interaction_config()
		local params = self.temp_params

		params.swap_to_3p = config.swap_to_3p
		params.show_weapons = config.show_weapons
		params.activate_block = config.activate_block
		params.allow_rotation_update = config.allow_rotation_update

		csm:change_state("interacting", params)

		return
	end

	local is_crouching = status_extension:is_crouching()

	if (input_extension:get("jump") or input_extension:get("jump_only")) and not status_extension:is_crouching() and (not is_crouching or CharacterStateHelper.can_uncrouch(unit)) and locomotion_extension:jump_allowed() then
		if is_crouching then
			CharacterStateHelper.uncrouch(unit, t, first_person_extension, status_extension)
		end

		csm:change_state("jumping")
		first_person_extension:change_state("jumping")

		return
	end

	local is_moving = CharacterStateHelper.has_move_input(input_extension)

	if is_moving then
		local params = self.temp_params

		csm:change_state("walking", params)
		first_person_extension:change_state("walking")

		return
	end

	if not locomotion_extension:is_on_ground() then
		csm:change_state("falling")
		first_person_extension:change_state("falling")

		return
	end

	if input_extension:get("character_inspecting") and self:_inspection_available() then
		local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(self.inventory_extension)
		local current_action_settings = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

		if not current_action_settings then
			csm:change_state("inspecting")

			return
		end
	end

	if self.cosmetic_extension:get_queued_3p_emote() then
		local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(self.inventory_extension)
		local current_action_settings = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

		if not current_action_settings then
			csm:change_state("emote")

			return
		end
	end

	local inventory_extension = self.inventory_extension
	local first_person_extension = self.first_person_extension
	local toggle_crouch = input_extension.toggle_crouch

	if t > self.time_when_can_be_pushed and self.player:is_player_controlled() then
		self.current_animation = CharacterStateHelper.update_soft_collision_movement(first_person_extension, status_extension, locomotion_extension, unit, self.world, self.current_animation, self.side)
	end

	CharacterStateHelper.check_crouch(unit, input_extension, status_extension, toggle_crouch, first_person_extension, t)
	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self.health_extension)
end
