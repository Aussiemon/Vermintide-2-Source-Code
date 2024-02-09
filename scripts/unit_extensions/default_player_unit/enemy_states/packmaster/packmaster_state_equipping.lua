-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/packmaster/packmaster_state_equipping.lua

PackmasterStateEquipping = class(PackmasterStateEquipping, EnemyCharacterState)

PackmasterStateEquipping.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "packmaster_equipping")

	self.current_movement_speed_scale = 0
	self.last_input_direction = Vector3Box(0, 0, 0)
end

local position_lookup = POSITION_LOOKUP

PackmasterStateEquipping.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	table.clear(self._temp_params)

	self._unit = unit
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")
	self._inventory_extension = ScriptUnit.extension(unit, "inventory_system")

	local breed = Unit.get_data(unit, "breed")
	local first_person_extension = self._first_person_extension

	CharacterStateHelper.play_animation_event(unit, "equip")
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "equip")

	self._spawn_weapon_time = t + breed.equip_hook_weapon_spawn_time
	self._finish_time = t + breed.equip_hook_exit_state_time
end

PackmasterStateEquipping.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local locomotion_extension = self._locomotion_extension
	local inventory_extension = self._inventory_extension
	local health_extension = self._health_extension

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	if CharacterStateHelper.is_using_transport(status_extension) then
		csm:change_state("using_transport")

		return
	end

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension:set_pushed(false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension:hit_react_type()

		params.hit_react_type = hit_react_type .. "_push"

		csm:change_state("stunned", params)

		return
	end

	if CharacterStateHelper.is_block_broken(status_extension) then
		status_extension:set_block_broken(false)

		local params = movement_settings_table.stun_settings.parry_broken

		params.hit_react_type = "medium_push"

		csm:change_state("stunned", params)

		return
	end

	local spawn_weapon_time = self._spawn_weapon_time

	if spawn_weapon_time and spawn_weapon_time <= t then
		CharacterStateHelper.show_inventory_3p(unit, true, true, self._is_server, inventory_extension)
		first_person_extension:unhide_weapons("catapulted")

		self._spawn_weapon_time = nil
	end

	local finish_time = self._finish_time

	if finish_time and finish_time <= t then
		CharacterStateHelper.play_animation_event(unit, "to_armed")
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "to_armed")
		first_person_extension:animation_set_variable("armed", 1)
		status_extension:set_unarmed(false)
		csm:change_state("standing")

		return
	end

	local look_sense_override = 1

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, inventory_extension, look_sense_override)
end

PackmasterStateEquipping._finish = function (self, target_unit)
	if not self._locomotion_extension:is_on_ground() then
		return
	end

	local unit = self._unit
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension

	self:_play_vo()
end

PackmasterStateEquipping.on_exit = function (self, unit, input, dt, context, t, next_state)
	local network_manager = Managers.state.network

	if not network_manager:in_game_session() then
		return
	end

	local csm = self._csm
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension

	self._career_extension:start_activated_ability_cooldown(1, 1)

	self._finish_time = nil
end

PackmasterStateEquipping._play_vo = function (self, unit, t)
	local unit = self._unit
end
