PlayerCharacterStateWaitingForAssistedRespawn = class(PlayerCharacterStateWaitingForAssistedRespawn, PlayerCharacterState)

PlayerCharacterStateWaitingForAssistedRespawn.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "waiting_for_assisted_respawn")

	self.recovery_timer = nil
	self.recovered = false
end

PlayerCharacterStateWaitingForAssistedRespawn.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local first_person_extension = self.first_person_extension

	first_person_extension:set_first_person_mode(false)

	local include_local_player = true

	CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self.is_server, self.inventory_extension)

	local input_extension = self.input_extension

	input_extension:set_enabled(false)

	local status_extension = self.status_extension
	local flavour_unit = status_extension.assisted_respawn_flavour_unit
	self.flavour_unit = flavour_unit

	LocomotionUtils.enable_linked_movement(self.world, unit, flavour_unit, 0, Vector3.zero())

	local flavour_animation = Unit.get_data(flavour_unit, "on_enter_loop_anim")

	CharacterStateHelper.play_animation_event(unit, flavour_animation)
	CharacterStateHelper.change_camera_state(self.player, "observer")

	local career_extension = ScriptUnit.extension(unit, "career_system")

	CharacterStateHelper.stop_weapon_actions(self.inventory_extension, "respawning")
	CharacterStateHelper.stop_career_abilities(career_extension, "respawning")
end

PlayerCharacterStateWaitingForAssistedRespawn.on_exit = function (self, unit, input, dt, context, t, next_state)
	local first_person_extension = self.first_person_extension

	first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)

	local include_local_player = true

	CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self.is_server, self.inventory_extension)

	local input_extension = self.input_extension

	input_extension:set_enabled(true)

	local player = self.player

	CharacterStateHelper.change_camera_state(player, "follow")
	LocomotionUtils.disable_linked_movement(unit)

	local locomotion_extension = self.locomotion_extension

	locomotion_extension:enable_script_driven_movement()

	self.recovery_timer = nil
	self.recovered = false
	local status_extension = self.status_extension

	status_extension:set_assisted_respawning(false)
	status_extension:set_respawned(true)

	if Managers.state.network:game() and not LEVEL_EDITOR_TEST then
		local network_manager = Managers.state.network
		local helper_unit = self.status_extension:get_assisted_respawn_helper_unit()
		local go_id = network_manager:unit_game_object_id(unit) or 0
		local helper_go_id = helper_unit and network_manager:unit_game_object_id(helper_unit) or 0

		network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.respawned, true, go_id, helper_go_id)
	end
end

PlayerCharacterStateWaitingForAssistedRespawn.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local status_extension = self.status_extension

	if CharacterStateHelper.is_dead(status_extension) then
		csm:change_state("dead")

		return
	end

	if CharacterStateHelper.is_assisted_respawning(status_extension) then
		if not self.recovery_timer then
			local flavour_unit = self.flavour_unit
			local recovery_time = Unit.get_data(flavour_unit, "recovery_time")
			self.recovery_timer = t + recovery_time

			CharacterStateHelper.play_animation_event(unit, "respawn_revive")
		elseif self.recovery_timer <= t then
			csm:change_state("standing")

			return
		end
	end
end
