-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_es_huntsman.lua

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

CareerAbilityESHuntsman.stop = function (self, reason)
	if self._is_priming then
		self:_stop_priming()
	end
end

CareerAbilityESHuntsman._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local can_use = career_extension:can_use_activated_ability()
	local disabled = status_extension:is_disabled()
	local weapon_slot = "slot_ranged"
	local slot_data = self._inventory_extension:get_slot_data(weapon_slot)
	local has_weapon = slot_data ~= nil

	return can_use and not disabled and has_weapon
end

CareerAbilityESHuntsman.force_trigger_ability = function (self)
	local skip_cooldown = true

	self:_run_ability(skip_cooldown)
end

CareerAbilityESHuntsman._run_ability = function (self, skip_cooldown)
	local owner_unit = self.owner_unit
	local is_server = self.is_server
	local local_player = self.local_player
	local bot_player = self.bot_player
	local network_manager = self.network_manager
	local network_transmit = network_manager.network_transmit
	local inventory_extension = self._inventory_extension
	local buff_extension = self._buff_extension
	local career_extension = self._career_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local server_buff_names = {
		"markus_huntsman_activated_ability",
		"markus_huntsman_activated_ability_headshot_multiplier",
	}
	local local_buff_names = {}

	if talent_extension:has_talent("markus_huntsman_activated_ability_improved_stealth") then
		local_buff_names = {
			"markus_huntsman_activated_ability_increased_zoom",
			"markus_huntsman_activated_ability_increased_reload_speed",
			"markus_huntsman_activated_ability_decrease_move_speed",
			"markus_huntsman_activated_ability_decrease_crouch_move_speed",
			"markus_huntsman_activated_ability_decrease_walk_move_speed",
			"markus_huntsman_activated_ability_decrease_dodge_speed",
			"markus_huntsman_activated_ability_decrease_dodge_distance",
		}
	elseif talent_extension:has_talent("markus_huntsman_activated_ability_duration") then
		local_buff_names = {
			"markus_huntsman_activated_ability_increased_zoom_duration",
			"markus_huntsman_activated_ability_increased_reload_speed_duration",
			"markus_huntsman_activated_ability_decrease_move_speed_duration",
			"markus_huntsman_activated_ability_decrease_crouch_move_speed_duration",
			"markus_huntsman_activated_ability_decrease_walk_move_speed_duration",
			"markus_huntsman_activated_ability_decrease_dodge_speed_duration",
			"markus_huntsman_activated_ability_decrease_dodge_distance_duration",
			"markus_huntsman_end_activated_on_hit_duration",
		}
		server_buff_names = {
			"markus_huntsman_activated_ability_duration",
			"markus_huntsman_activated_ability_headshot_multiplier_duration",
		}
	else
		local_buff_names = {
			"markus_huntsman_activated_ability_increased_zoom",
			"markus_huntsman_activated_ability_increased_reload_speed",
			"markus_huntsman_activated_ability_decrease_move_speed",
			"markus_huntsman_activated_ability_decrease_crouch_move_speed",
			"markus_huntsman_activated_ability_decrease_walk_move_speed",
			"markus_huntsman_activated_ability_decrease_dodge_speed",
			"markus_huntsman_activated_ability_decrease_dodge_distance",
			"markus_huntsman_end_activated_on_hit",
		}
		server_buff_names = {
			"markus_huntsman_activated_ability",
			"markus_huntsman_activated_ability_headshot_multiplier",
		}
	end

	local unit_object_id = network_manager:unit_game_object_id(owner_unit)

	for _, buff_name in ipairs(server_buff_names) do
		local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

		if is_server then
			buff_extension:add_buff(buff_name, {
				attacker_unit = owner_unit,
			})
			network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
		else
			network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
		end
	end

	for _, buff_name in ipairs(local_buff_names) do
		buff_extension:add_buff(buff_name, {
			attacker_unit = owner_unit,
		})
	end

	if talent_extension:has_talent("markus_huntsman_activated_ability_cooldown_2") then
		local reference_buff = buff_extension:get_non_stacking_buff("markus_huntsman_passive")
		local max_stacks = reference_buff.template.max_sub_buff_stacks

		if not reference_buff.buff_list then
			reference_buff.buff_list = {}
		end

		for i = 1, max_stacks do
			if max_stacks > #reference_buff.buff_list then
				table.insert(reference_buff.buff_list, buff_extension:add_buff("markus_huntsman_auto_headshot"))
			end
		end
	end

	local weapon_slot = "slot_ranged"
	local slot_data = inventory_extension:get_slot_data(weapon_slot)
	local right_unit_1p = slot_data.right_unit_1p
	local left_unit_1p = slot_data.left_unit_1p
	local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
	local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
	local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

	if ammo_extension then
		local clip_size = ammo_extension:clip_size()
		local ammo_count = ammo_extension:ammo_count()
		local reserve_ammo = ammo_extension:remaining_ammo()
		local clip_empty = ammo_count == 0
		local clip_full = ammo_count == clip_size
		local instant_ammo = 0

		if clip_empty then
			instant_ammo = clip_size
		elseif clip_full then
			if reserve_ammo == 0 then
				instant_ammo = clip_size
			elseif reserve_ammo < clip_size then
				instant_ammo = clip_size - reserve_ammo
			end
		elseif reserve_ammo == 0 then
			instant_ammo = clip_size - ammo_count + clip_size
		elseif reserve_ammo < clip_size then
			instant_ammo = clip_size - ammo_count + (clip_size - reserve_ammo)
		else
			instant_ammo = clip_size - ammo_count
		end

		ammo_extension:add_ammo_to_reserve(instant_ammo)

		if ammo_extension:can_reload() then
			if clip_empty then
				ammo_extension:start_reload(true)
			else
				ammo_extension:instant_reload(false, "reload")
			end
		end
	end

	local first_person_extension = self._first_person_extension

	if local_player then
		first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_enter", nil, true)
		first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_loop")
		first_person_extension:animation_event("shade_stealth_ability")
		career_extension:set_state("markus_activate_huntsman")
		Managers.state.camera:set_mood("skill_huntsman_surge", "skill_huntsman_surge", false)
		Managers.state.camera:set_mood("skill_huntsman_stealth", "skill_huntsman_stealth", true)
	end

	if local_player or is_server and bot_player then
		local status_extension = self._status_extension

		status_extension:set_invisible(true, nil, "huntsman_ability")
		first_person_extension:play_remote_hud_sound_event("Play_career_ability_markus_huntsman_loop_husk")
	end

	if not skip_cooldown then
		career_extension:start_activated_ability_cooldown()
	end

	self:_play_vo()
end

CareerAbilityESHuntsman._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end
