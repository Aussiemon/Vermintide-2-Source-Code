﻿-- chunkname: @scripts/unit_extensions/default_player_unit/states/player_character_state_using_transport.lua

PlayerCharacterStateUsingTransport = class(PlayerCharacterStateUsingTransport, PlayerCharacterState)

PlayerCharacterStateUsingTransport.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "using_transport")

	local context = character_state_init_context
end

PlayerCharacterStateUsingTransport.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local first_person_extension = self.first_person_extension

	table.clear(self.temp_params)
	CharacterStateHelper.play_animation_event(unit, "idle")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")
end

PlayerCharacterStateUsingTransport.on_exit = function (self, unit, input, dt, context, t, next_state)
	return
end

PlayerCharacterStateUsingTransport.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local input_extension = self.input_extension
	local status_extension = self.status_extension
	local inventory_extension = self.inventory_extension
	local first_person_extension = self.first_person_extension

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if not CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("standing")

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

	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self.health_extension)
end
