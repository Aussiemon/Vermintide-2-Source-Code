-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_inspecting.lua

EnemyCharacterStateInspecting = class(EnemyCharacterStateInspecting, EnemyCharacterState)

EnemyCharacterStateInspecting.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "inspecting")

	local context = character_state_init_context
end

EnemyCharacterStateInspecting.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self._locomotion_extension:set_wanted_velocity(Vector3.zero())
	CharacterStateHelper.change_camera_state(self._player, "follow_third_person")

	local active = false
	local override
	local unarmed = false

	if self._status_extension:get_unarmed() then
		unarmed = true
	end

	self._first_person_extension:set_first_person_mode(active, override, unarmed)
	CharacterStateHelper.stop_weapon_actions(self._inventory_extension, "inspecting")
	CharacterStateHelper.stop_career_abilities(self._career_extension, "inspecting")
	CharacterStateHelper.play_animation_event(unit, "idle")
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "idle")
	self._status_extension:set_inspecting(true)
end

EnemyCharacterStateInspecting.on_exit = function (self, unit, input, dt, context, t, next_state)
	CharacterStateHelper.change_camera_state(self._player, "follow")
	self._first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)
	self._status_extension:set_inspecting(false)
end

EnemyCharacterStateInspecting.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local unit = self._unit
	local input_extension = self._input_extension
	local interactor_extension = self._interactor_extension
	local camera_manager = Managers.state.camera
	local status_extension = self._status_extension

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if not input_extension:get("character_inspecting") then
		csm:change_state("standing")

		return
	end

	if not csm.state_next and status_extension.do_leap then
		csm:change_state("leaping")

		return
	end

	self._locomotion_extension:set_disable_rotation_update()
	CharacterStateHelper.look(input_extension, self._player.viewport_name, self._first_person_extension, status_extension, self._inventory_extension)
end
