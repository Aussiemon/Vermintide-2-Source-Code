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

CareerAbilityWEShade._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension

	return career_extension:can_use_activated_ability() and not status_extension:is_disabled()
end

CareerAbilityWEShade._run_ability = function (self)
	local owner_unit = self._owner_unit
	local local_player = self._local_player
	local bot_player = self._bot_player
	local is_server = self._is_server
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local buff_extension = self._buff_extension
	local career_extension = self._career_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local buff_name = "kerillian_shade_activated_ability"

	if talent_extension:has_talent("kerillian_shade_activated_ability_duration", "wood_elf", true) then
		buff_name = "kerillian_shade_activated_ability_duration"
	end

	local buff_template_name_id = NetworkLookup.buff_templates[buff_name]
	local unit_object_id = network_manager:unit_game_object_id(owner_unit)

	if is_server then
		buff_extension:add_buff(buff_name, {
			attacker_unit = owner_unit
		})
		network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
	else
		network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
	end

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_enter")
		first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_loop")
		first_person_extension:animation_event("shade_stealth_ability")
		career_extension:set_state("kerillian_activate_shade")

		MOOD_BLACKBOARD.skill_shade = true
	end

	if local_player or (is_server and bot_player) then
		local status_extension = self._status_extension

		status_extension:set_invisible(true)
		status_extension:set_noclip(true)

		local events = {
			"Play_career_ability_kerillian_shade_enter",
			"Play_career_ability_kerillian_shade_loop_husk"
		}
		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit
		local is_server = Managers.player.is_server
		local unit_id = network_manager:unit_game_object_id(owner_unit)
		local node_id = 0

		for _, event in ipairs(events) do
			local event_id = NetworkLookup.sound_events[event]

			if is_server then
				network_transmit:send_rpc_clients("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
			else
				network_transmit:send_rpc_server("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
			end
		end
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

return
