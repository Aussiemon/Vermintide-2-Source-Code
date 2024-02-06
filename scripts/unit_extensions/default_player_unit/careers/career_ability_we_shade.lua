-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_we_shade.lua

CareerAbilityWEShade = class(CareerAbilityWEShade)

CareerAbilityWEShade.init = function (self, extension_init_context, unit, extension_init_data)
	self._owner_unit = unit
	self._world = extension_init_context.world
	self._wwise_world = Managers.world:wwise_world(self._world)

	local player = extension_init_data.player

	self._player = player
	self._is_server = player.is_server
	self._local_player = player.local_player
	self._bot_player = player.bot_player
	self._network_manager = Managers.state.network
	self._input_manager = Managers.input
end

CareerAbilityWEShade.extensions_ready = function (self, world, unit)
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._buff_system = Managers.state.entity:system("buff_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
end

CareerAbilityWEShade.destroy = function (self)
	return
end

CareerAbilityWEShade.update = function (self, unit, input, dt, context, t)
	if not self:_ability_available() then
		return
	end

	local input_extension = self._input_extension

	if input_extension and input_extension:get("action_career") then
		self:_run_ability()
	end
end

CareerAbilityWEShade.stop = function (self, reason)
	if self._is_priming then
		self:_stop_priming()
	end
end

CareerAbilityWEShade._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local available = true

	return available and career_extension:can_use_activated_ability() and not status_extension:is_disabled()
end

CareerAbilityWEShade._run_ability = function (self)
	local owner_unit = self._owner_unit
	local bot_player = self._bot_player
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local buff_extension = self._buff_extension
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local was_invisible = status_extension:is_invisible()
	local buff_name = "kerillian_shade_activated_ability"
	local talent_extension = ScriptUnit.extension(self._owner_unit, "talent_system")
	local has_phasing = talent_extension:has_talent("kerillian_shade_activated_ability_phasing")

	if has_phasing then
		buff_name = "kerillian_shade_activated_ability_phasing"
	end

	buff_extension:add_buff(buff_name)

	local first_person_extension = self._first_person_extension

	first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_enter", nil, true)
	first_person_extension:play_remote_hud_sound_event("Play_career_ability_kerillian_shade_loop_husk")

	if not bot_player then
		if not was_invisible then
			first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_loop")
		end

		first_person_extension:animation_event("shade_stealth_ability")
		career_extension:set_state("kerillian_activate_shade")

		MOOD_BLACKBOARD.skill_shade = true
	end

	if Managers.state.network:game() then
		status_extension:set_is_dodging(true)

		local unit_id = network_manager:unit_game_object_id(owner_unit)

		network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, true, unit_id, 0)
	end

	career_extension:start_activated_ability_cooldown()
	self:_play_vo()
end

CareerAbilityWEShade._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end
