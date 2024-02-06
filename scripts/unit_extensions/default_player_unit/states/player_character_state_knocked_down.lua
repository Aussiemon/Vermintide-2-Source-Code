-- chunkname: @scripts/unit_extensions/default_player_unit/states/player_character_state_knocked_down.lua

PlayerCharacterStateKnockedDown = class(PlayerCharacterStateKnockedDown, PlayerCharacterState)

PlayerCharacterStateKnockedDown.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "knocked_down")

	local context = character_state_init_context
end

PlayerCharacterStateKnockedDown.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	CharacterStateHelper.stop_weapon_actions(self.inventory_extension, "knocked_down")
	CharacterStateHelper.stop_career_abilities(self.career_extension, "knocked_down")

	local unit = self.unit
	local input_source = self.player.input_source

	if not params or not params.already_in_ko_anim then
		local animation_event = "knockdown_fall_front"

		CharacterStateHelper.play_animation_event(unit, animation_event)

		if params and params.already_in_ko_anim then
			params.already_in_ko_anim = nil
		end
	end

	self.debug_t = t

	self.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local first_person_extension = self.first_person_extension

	first_person_extension:set_wanted_player_height("knocked_down", t)
	first_person_extension:animation_event("knocked_down")
	first_person_extension:animation_set_variable("knockdown_blend", 0)

	self.start_time = t

	CharacterStateHelper.change_camera_state(self.player, "follow_third_person")
	first_person_extension:set_first_person_mode(false)

	local status_extension = ScriptUnit.extension(unit, "status_system")

	self.pounced_down = previous_state == "pounced_down"

	local is_pounced_down, pouncer_unit = CharacterStateHelper.is_pounced_down(status_extension)

	if is_pounced_down and not self.pounced_down then
		CharacterStateHelper.play_animation_event(pouncer_unit, "jump_attack")
		CharacterStateHelper.play_animation_event(unit, "jump_attack")

		self.pounced_down = true
	end

	self.grabbed_by_pack_master = previous_state == "grabbed_by_pack_master"

	local include_local_player = true

	CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self.is_server, self.inventory_extension)

	local inventory_extension = ScriptUnit.extension(unit, "inventory_system")

	inventory_extension:check_and_drop_pickups("knocked_down")

	local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")

	overcharge_extension:reset()
	status_extension:set_catapulted(false)
end

PlayerCharacterStateKnockedDown.on_exit = function (self, unit, input, dt, context, t, next_state)
	local first_person_extension = self.first_person_extension

	if next_state ~= "dead" then
		CharacterStateHelper.change_camera_state(self.player, "follow")

		local include_local_player = true

		CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self.is_server, self.inventory_extension)
		self.first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)
	end

	first_person_extension:set_wanted_player_height("stand", t)
end

PlayerCharacterStateKnockedDown.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local locomotion_extension = self.locomotion_extension

	if locomotion_extension:is_on_ground() then
		ScriptUnit.extension(unit, "whereabouts_system"):set_is_onground()
	end

	local status_extension = self.status_extension

	if CharacterStateHelper.is_dead(status_extension) then
		csm:change_state("dead")

		return
	end

	if self.pounced_down and not CharacterStateHelper.is_pounced_down(status_extension) then
		locomotion_extension:set_disabled(false, LocomotionUtils.update_local_animation_driven_movement_with_parent)

		local animation_event = "knockdown"

		CharacterStateHelper.play_animation_event(unit, animation_event)

		self.pounced_down = false
	end

	if self.grabbed_by_pack_master and not CharacterStateHelper.is_grabbed_by_pack_master(status_extension) then
		locomotion_extension:enable_script_driven_movement()
		locomotion_extension:enable_rotation_towards_velocity(true)

		self.grabbed_by_pack_master = false
	end

	if not CharacterStateHelper.is_knocked_down(status_extension) then
		local params = self.temp_params

		params.is_crouching = false

		csm:change_state("standing")

		return
	end

	local time_since_start = t - self.start_time
	local first_person_extension = self.first_person_extension

	if time_since_start <= 1 then
		first_person_extension:animation_set_variable("knockdown_blend", time_since_start)
	else
		first_person_extension:animation_set_variable("knockdown_blend", 1)
	end

	local input_extension = self.input_extension

	locomotion_extension:set_disable_rotation_update()
	CharacterStateHelper.look(input_extension, self.player.viewport_name, self.first_person_extension, status_extension, self.inventory_extension)
end
