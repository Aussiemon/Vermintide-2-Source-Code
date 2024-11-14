-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/packmaster/packmaster_state_hoisting.lua

PackmasterStateHoisting = class(PackmasterStateHoisting, EnemyCharacterState)

PackmasterStateHoisting.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "packmaster_hoisting")

	local context = character_state_init_context

	self.current_movement_speed_scale = 0
	self.last_input_direction = Vector3Box(0, 0, 0)
end

PackmasterStateHoisting.on_enter = function (self, unit, input, dt, context, t, previous_state, dragged_unit)
	self._hosting_end_time = t + BreedActions.skaven_pack_master.hoist.hoist_anim_length
	self._drag_target_unit = dragged_unit
	self._unit = unit

	local drag_target_unit = self._drag_target_unit
	local velocity = Vector3(0, 0, 0)

	self._locomotion_extension:set_forced_velocity(velocity)
	self._locomotion_extension:set_wanted_velocity(Vector3.zero())
	CharacterStateHelper.change_camera_state(self._player, "follow_third_person")
	StatusUtils.set_grabbed_by_pack_master_network("pack_master_hoisting", drag_target_unit, true, unit)
	self:set_breed_action("hoist")
end

PackmasterStateHoisting.on_exit = function (self, unit, input, dt, context, t, next_state)
	local drag_target_unit = self._drag_target_unit
	local first_person_extension = self._first_person_extension

	if Unit.alive(drag_target_unit) then
		-- Nothing
	end

	self._drag_target_unit = nil

	CharacterStateHelper.change_camera_state(self._player, "follow")
	first_person_extension:toggle_visibility(CameraTransitionSettings.perspective_transition_time)
	first_person_extension:set_wanted_player_height("stand", t)

	if self._action_aborted then
		return
	end

	local include_local_player = true

	if not self._status_extension:get_unarmed() then
		CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self._is_server, self._inventory_extension)
		first_person_extension:unhide_weapons("catapulted")
	else
		CharacterStateHelper.play_animation_event(unit, "to_unarmed")
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "to_unarmed")
		first_person_extension:animation_set_variable("armed", 0)
		CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self._is_server, self._inventory_extension)
	end

	self:set_breed_action("n/a")

	local career_extension = self._career_extension
	local equip_ability_id = career_extension:ability_id("equip")
	local equip_ability = career_extension:ability_by_id(equip_ability_id)

	equip_ability:unfreeze()
end

PackmasterStateHoisting.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local inventory_extension = self._inventory_extension
	local input_extension = ScriptUnit.extension(unit, "input_system")
	local status_extension = self._status_extension
	local drag_target_unit = self._drag_target_unit
	local target_is_dead

	if drag_target_unit and HEALTH_ALIVE[drag_target_unit] then
		local target_unit_status_extension = ScriptUnit.extension(drag_target_unit, "status_system")

		target_is_dead = target_unit_status_extension:is_dead()

		if target_is_dead then
			local params = self._temp_params

			csm:change_state("walking", params)

			return
		end
	else
		local params = self._temp_params

		csm:change_state("walking", params)

		return
	end

	if CharacterStateHelper.is_dead(status_extension) then
		self:release_dragged_target()
		csm:change_state("dead")

		return true
	end

	if CharacterStateHelper.is_staggered(status_extension) then
		self:release_dragged_target()
		csm:change_state("staggered")

		return true
	end

	if not self._locomotion_extension:is_on_ground() then
		self:release_dragged_target()

		local params = self._temp_params

		csm:change_state("walking", params)

		return true
	end

	if not input_extension then
		return
	end

	if t > self._hosting_end_time then
		StatusUtils.set_grabbed_by_pack_master_network("pack_master_hanging", drag_target_unit, true, unit)
		status_extension:set_packmaster_released()
		status_extension:set_unarmed(true)

		local params = self._temp_params
		local career_extension = ScriptUnit.extension(unit, "career_system")

		csm:change_state("standing", params)
	end

	self._locomotion_extension:set_disable_rotation_update()
	CharacterStateHelper.look(input_extension, self._player.viewport_name, self._first_person_extension, status_extension, inventory_extension)
end

PackmasterStateHoisting.release_dragged_target = function (self)
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local drag_target_unit = self._drag_target_unit
	local target_status_extension = ScriptUnit.extension(drag_target_unit, "status_system")

	CharacterStateHelper.show_inventory_3p(self._unit, true, true, Managers.player.is_server, self._inventory_extension)
	first_person_extension:unhide_weapons("catapulted")
	StatusUtils.set_grabbed_by_pack_master_network("pack_master_unhooked", drag_target_unit, false, self._unit)
	status_extension:set_packmaster_released()
end
