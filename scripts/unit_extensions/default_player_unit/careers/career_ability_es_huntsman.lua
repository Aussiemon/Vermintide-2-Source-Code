CareerAbilityESHuntsman = class(CareerAbilityESHuntsman)

CareerAbilityESHuntsman.init = function (self, extension_init_context, unit, extension_init_data)
	self.owner_unit = unit
	self.world = extension_init_context.world
	self.wwise_world = Managers.world:wwise_world(self.world)
	local player = extension_init_data.player
	self.player = player
	self.is_server = player.is_server
	self.local_player = player.local_player
	self.bot_player = player.bot_player
	self.network_manager = Managers.state.network
	self.input_manager = Managers.input
end

CareerAbilityESHuntsman.extensions_ready = function (self, world, unit)
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
end

CareerAbilityESHuntsman.destroy = function (self)
	return
end

CareerAbilityESHuntsman.update = function (self, unit, input, dt, context, t)
	if not self:_ability_available() then
		return
	end

	local input_extension = self._input_extension

	if not input_extension then
		return
	end

	if input_extension:get("action_career") then
		self:_run_ability()
	end
end

CareerAbilityESHuntsman._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension

	return career_extension:can_use_activated_ability() and not status_extension:is_disabled()
end

CareerAbilityESHuntsman._run_ability = function (self)
	local owner_unit = self.owner_unit
	local is_server = self.is_server
	local local_player = self.local_player
	local bot_player = self.bot_player
	local network_manager = self.network_manager
	local network_transmit = network_manager.network_transmit
	local inventory_extension = self._inventory_extension
	local buff_extension = self._buff_extension
	local career_extension = self._career_extension
	local server_buff_names = {
		"markus_huntsman_activated_ability",
		"markus_huntsman_activated_ability_headshot_multiplier"
	}
	local local_buff_names = {
		"markus_huntsman_activated_ability_increased_reload_speed",
		"markus_huntsman_activated_ability_decrease_move_speed",
		"markus_huntsman_activated_ability_decrease_crouch_move_speed",
		"markus_huntsman_activated_ability_decrease_walk_move_speed",
		"markus_huntsman_activated_ability_decrease_dodge_speed",
		"markus_huntsman_activated_ability_decrease_dodge_distance",
		"markus_huntsman_end_activated_on_ranged_hit",
		"markus_huntsman_end_activated_on_melee_hit"
	}
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

	if talent_extension:has_talent("markus_huntsman_activated_ability_damage") then
		server_buff_names[#server_buff_names + 1] = "markus_huntsman_activated_ability_damage"
	end

	local unit_object_id = network_manager:unit_game_object_id(owner_unit)

	for _, buff_name in ipairs(server_buff_names) do
		local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

		if is_server then
			buff_extension:add_buff(buff_name, {
				attacker_unit = owner_unit
			})
			network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
		else
			network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
		end
	end

	for _, buff_name in ipairs(local_buff_names) do
		buff_extension:add_buff(buff_name, {
			attacker_unit = owner_unit
		})
	end

	local weapon_slot = "slot_ranged"
	local slot_data = inventory_extension:get_slot_data(weapon_slot)
	local right_unit_1p = slot_data.right_unit_1p
	local left_unit_1p = slot_data.left_unit_1p
	local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
	local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
	local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

	if ammo_extension then
		if ammo_extension:total_remaining_ammo() < ammo_extension:clip_size() then
			local extra_ammo_for_full_reload = ammo_extension:clip_size() - ammo_extension:ammo_count()

			ammo_extension:add_ammo_to_reserve(extra_ammo_for_full_reload)
		end

		ammo_extension:instant_reload(false, "reload")
	end

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_enter")
		first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_loop")
		first_person_extension:animation_event("shade_stealth_ability")
		career_extension:set_state("markus_activate_huntsman")

		MOOD_BLACKBOARD.skill_huntsman_stealth = true
	end

	if local_player or (is_server and bot_player) then
		local status_extension = self._status_extension

		status_extension:set_invisible(true)

		local events = {
			"Play_career_ability_markus_huntsman_enter",
			"Play_career_ability_markus_huntsman_loop_husk"
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

CareerAbilityESHuntsman._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

return
