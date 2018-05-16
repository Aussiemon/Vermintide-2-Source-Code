PlayerCharacterStatePouncedDown = class(PlayerCharacterStatePouncedDown, PlayerCharacterState)

PlayerCharacterStatePouncedDown.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "pounced_down")

	local context = character_state_init_context
end

local liberate_duration = 1.2

PlayerCharacterStatePouncedDown.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	CharacterStateHelper.stop_weapon_actions(self.inventory_extension, "pounced")

	local first_person_extension = self.first_person_extension
	local status_extension = self.status_extension

	CharacterStateHelper.change_camera_state(self.player, "follow_third_person")
	first_person_extension:set_first_person_mode(false)
	first_person_extension:set_wanted_player_height("knocked_down", t)

	local _, pouncer_unit = status_extension:is_pounced_down()
	local include_local_player = true

	CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self.is_server, self.inventory_extension)
	CharacterStateHelper.play_animation_event(pouncer_unit, "jump_attack")
	CharacterStateHelper.play_animation_event(unit, "jump_attack")
	self.inventory_extension:check_and_drop_pickups("pounced_down")
end

PlayerCharacterStatePouncedDown.on_exit = function (self, unit, input, dt, context, t, next_state)
	local first_person_extension = self.first_person_extension
	self.liberated = nil
	self.liberation_time = nil
	local network_manager = Managers.state.network

	if network_manager:game() and next_state then
		local go_id = Managers.state.unit_storage:go_id(unit)

		network_manager.network_transmit:send_rpc_server("rpc_disable_locomotion", go_id, false, NetworkLookup.movement_funcs.none)
	end

	if next_state ~= "knocked_down" then
		CharacterStateHelper.change_camera_state(self.player, "follow")
		self.first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)
		first_person_extension:set_wanted_player_height("stand", t)

		local include_local_player = false

		CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self.is_server, self.inventory_extension)
	end
end

PlayerCharacterStatePouncedDown.set_free = function (self, t, unit)
	self.liberated = true
	self.liberation_time = t + liberate_duration

	CharacterStateHelper.play_animation_event(unit, "jump_attack_stand_up")
end

PlayerCharacterStatePouncedDown.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local input_source = self.player.input_source
	local status_extension = self.status_extension
	local input_extension = self.input_extension

	if CharacterStateHelper.is_dead(status_extension) then
		csm:change_state("dead")

		return
	end

	if CharacterStateHelper.is_knocked_down(status_extension) then
		self.temp_params.already_in_ko_anim = true

		csm:change_state("knocked_down", self.temp_params)

		return
	end

	if self.liberated then
		if self.liberation_time < t then
			csm:change_state("standing")
		end

		return
	end

	if not CharacterStateHelper.is_pounced_down(status_extension) then
		self:set_free(t, unit)
	end

	self.locomotion_extension:set_disable_rotation_update()
	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)
end

return
