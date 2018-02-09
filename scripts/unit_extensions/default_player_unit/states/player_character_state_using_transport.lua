PlayerCharacterStateUsingTransport = class(PlayerCharacterStateUsingTransport, PlayerCharacterState)
PlayerCharacterStateUsingTransport.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "using_transport")

	local context = character_state_init_context

	return 
end
PlayerCharacterStateUsingTransport.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local first_person_extension = self.first_person_extension

	table.clear(self.temp_params)
	CharacterStateHelper.play_animation_event(unit, "idle")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")

	return 
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
		csm.change_state(csm, "standing")

		return 
	end

	local interactor_extension = self.interactor_extension

	if CharacterStateHelper.is_starting_interaction(input_extension, interactor_extension) then
		local config = interactor_extension.interaction_config(interactor_extension)

		interactor_extension.start_interaction(interactor_extension, "interacting")

		if not config.allow_movement then
			local params = self.temp_params
			params.swap_to_3p = config.swap_to_3p

			csm.change_state(csm, "interacting", params)
		end

		return 
	end

	if CharacterStateHelper.is_interacting(interactor_extension) then
		local config = interactor_extension.interaction_config(interactor_extension)

		if not config.allow_movement then
			local params = self.temp_params
			params.swap_to_3p = config.swap_to_3p

			csm.change_state(csm, "interacting", params)
		end

		return 
	end

	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self.health_extension)
	CharacterStateHelper.reload(input_extension, inventory_extension, status_extension)

	return 
end

return 
