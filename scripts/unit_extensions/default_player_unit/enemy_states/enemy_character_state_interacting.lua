-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_interacting.lua

EnemyCharacterStateInteracting = class(EnemyCharacterStateInteracting, EnemyCharacterState)

EnemyCharacterStateInteracting.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "interacting")
end

EnemyCharacterStateInteracting.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self.has_started_interacting = false
	self.swap_to_3p = params.swap_to_3p

	local locomotion_extension = self._locomotion_extension

	self._locomotion_extension:set_wanted_velocity(Vector3.zero())

	if not self._locomotion_extension:is_on_ground() then
		local status_extension = self._status_extension

		status_extension:set_falling_height()
	end

	local first_person_extension = self._first_person_extension

	if self.swap_to_3p then
		CharacterStateHelper.change_camera_state(self._player, "follow_third_person")
		first_person_extension:set_first_person_mode(false)
	else
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")
	end

	if not params.show_weapons then
		local include_local_player = true

		CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self._is_server, self._inventory_extension)
	end

	self.deactivate_block_on_exit = false

	if params.activate_block then
		self.activate_block = params.activate_block

		local status_extension = self._status_extension

		self.deactivate_block_on_exit = not status_extension:is_blocking()

		if not LEVEL_EDITOR_TEST and Managers.state.network:game() then
			local game_object_id = Managers.state.unit_storage:go_id(unit)

			if self._is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", game_object_id, true)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", game_object_id, true)
			end
		end

		status_extension:set_blocking(true)
	end
end

EnemyCharacterStateInteracting.on_exit = function (self, unit, input, dt, context, t, next_state)
	self.activate_block = nil

	if self.swap_to_3p then
		CharacterStateHelper.change_camera_state(self._player, "follow")

		local include_local_player = true

		CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self._is_server, self._inventory_extension)
		self._first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)
	else
		local include_local_player = false

		CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self._is_server, self._inventory_extension)
	end

	local status_extension = self._status_extension

	if self.deactivate_block_on_exit then
		if not LEVEL_EDITOR_TEST and Managers.state.network:game() then
			local game_object_id = Managers.state.unit_storage:go_id(unit)

			if self._is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", game_object_id, false)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", game_object_id, false)
			end
		end

		status_extension:set_blocking(false)
	end
end

EnemyCharacterStateInteracting.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local input_extension = self._input_extension
	local interactor_extension = self._interactor_extension
	local status_extension = self._status_extension
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	if self.activate_block then
		if not status_extension:is_blocking() and not LEVEL_EDITOR_TEST and Managers.state.network:game() then
			local game_object_id = Managers.state.unit_storage:go_id(unit)

			if self._is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", game_object_id, true)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", game_object_id, true)
			end
		end

		status_extension:set_blocking(true)
	end

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

		return
	end

	if not csm.state_next and status_extension.do_leap then
		csm:change_state("leaping")

		return
	end

	if not csm.state_next and status_extension.do_pounce then
		csm:change_state("pouncing")

		return
	end

	if not CharacterStateHelper.is_interacting(interactor_extension) then
		csm:change_state("standing")

		return
	end

	if not CharacterStateHelper.is_waiting_for_interaction_approval(interactor_extension) then
		if not self.has_started_interacting then
			self.has_started_interacting = true
		end

		if not CharacterStateHelper.interact(input_extension, interactor_extension) then
			csm:change_state("standing")

			return
		end
	end

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension:set_pushed(false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension:hit_react_type()

		params.hit_react_type = hit_react_type .. "_push"

		csm:change_state("stunned", params)
		interactor_extension:abort_interaction()

		return
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)

		local params = movement_settings_table.stun_settings.parry_broken

		params.hit_react_type = "medium_push"

		csm:change_state("stunned", params)
		interactor_extension:abort_interaction()

		return
	end

	self._locomotion_extension:set_disable_rotation_update()
	CharacterStateHelper.look(input_extension, self._player.viewport_name, self._first_person_extension, status_extension, self._inventory_extension)

	local should_climb = status_extension:should_climb()

	if not csm.state_next and should_climb then
		local interactor_extension = ScriptUnit.extension(unit, "interactor_system")
		local interactable_unit = interactor_extension:interactable_unit()
		local nav_graph_system = Managers.state.entity:system("nav_graph_system")
		local level_jumps = nav_graph_system.level_jumps
		local jump_data = level_jumps[interactable_unit]

		self._temp_params.jump_data = jump_data

		local smart_object_type = jump_data.jump_object_data.smart_object_type

		if smart_object_type == "ledges" or smart_object_type == "ledges_with_fence" then
			csm:change_state("climbing", self._temp_params)
			self._first_person_extension:change_state("climbing")
		elseif smart_object_type == "jumps" then
			csm:change_state("jump_across", self._temp_params)
			self._first_person_extension:change_state("jump_across")
		end

		return
	end

	local should_tunnel = status_extension:should_tunnel()

	if not csm.state_next and should_tunnel then
		csm:change_state("tunneling")
	end

	local should_spawn = status_extension:should_spawn()

	if not csm.state_next and should_spawn then
		csm:change_state("spawning")
	end
end
