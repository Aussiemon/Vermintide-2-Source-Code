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

	return 
end
CareerAbilityESHuntsman.extensions_ready = function (self, world, unit)
	self.first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self.status_extension = ScriptUnit.extension(unit, "status_system")
	self.career_extension = ScriptUnit.extension(unit, "career_system")
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	self.inventory_extension = ScriptUnit.extension(unit, "inventory_system")

	if self.first_person_extension then
		self.first_person_unit = self.first_person_extension:get_first_person_unit()
	end

	return 
end
CareerAbilityESHuntsman.destroy = function (self)
	return 
end
CareerAbilityESHuntsman.update = function (self, unit, input, dt, context, t)
	if not self._ability_available(self) then
		return 
	end

	local input_service = self.input_manager:get_service("Player")

	if input_service.get(input_service, "function_career") then
		self._run_ability(self)
	end

	return 
end
CareerAbilityESHuntsman._ability_available = function (self)
	local career_extension = self.career_extension
	local status_extension = self.status_extension
	local activated_ability_data = career_extension.get_activated_ability_data(career_extension)

	return self.local_player and not self.bot_player and career_extension.can_use_activated_ability(career_extension) and not status_extension.is_disabled(status_extension)
end
CareerAbilityESHuntsman._run_ability = function (self)
	local world = self.world
	local owner_unit = self.owner_unit
	local is_server = self.is_server
	local local_player = self.local_player
	local network_manager = self.network_manager
	local network_transmit = network_manager.network_transmit
	local status_extension = self.status_extension
	local inventory_extension = self.inventory_extension
	local career_extension = self.career_extension
	local buff_extension = self.buff_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local server_buff_names = {
		"markus_huntsman_activated_ability_headshot_multiplier"
	}
	local local_buff_names = {
		"markus_huntsman_activated_ability",
		"markus_huntsman_activated_ability_increased_attack_speed",
		"markus_huntsman_activated_ability_increased_reload_speed",
		"markus_huntsman_activated_ability_decrease_move_speed",
		"markus_huntsman_activated_ability_decrease_crouch_move_speed",
		"markus_huntsman_activated_ability_decrease_walk_move_speed",
		"markus_huntsman_activated_ability_decrease_dodge_speed",
		"markus_huntsman_activated_ability_decrease_dodge_distance",
		"markus_huntsman_activated_ability_guaranteed_ranged_critical_strikes",
		"markus_huntsman_end_activated_on_ranged_hit",
		"markus_huntsman_end_activated_on_melee_hit"
	}
	local unit_object_id = network_manager.unit_game_object_id(network_manager, owner_unit)

	for _, buff_name in ipairs(server_buff_names) do
		local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

		if is_server then
			buff_extension.add_buff(buff_extension, buff_name, {
				attacker_unit = owner_unit
			})
			network_transmit.send_rpc_clients(network_transmit, "rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
		else
			network_transmit.send_rpc_server(network_transmit, "rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
		end
	end

	for _, buff_name in ipairs(local_buff_names) do
		buff_extension.add_buff(buff_extension, buff_name, {
			attacker_unit = owner_unit
		})
	end

	if talent_extension.has_talent(talent_extension, "markus_huntsman_activated_ability_damage") then
		buff_extension.add_buff(buff_extension, "markus_huntsman_activated_ability_damage", {
			attacker_unit = owner_unit
		})
	end

	if local_player then
		local first_person_extension = self.first_person_extension

		first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_markus_huntsman_enter", nil, true)
		first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_markus_huntsman_loop")
		first_person_extension.animation_event(first_person_extension, "shade_stealth_ability")

		MOOD_BLACKBOARD.skill_huntsman_stealth = true

		career_extension.set_state(career_extension, "markus_activate_huntsman")
	end

	local weapon_slot = "slot_ranged"
	local slot_data = inventory_extension.get_slot_data(inventory_extension, weapon_slot)
	local right_unit_1p = slot_data.right_unit_1p
	local left_unit_1p = slot_data.left_unit_1p
	local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
	local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
	local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

	if ammo_extension then
		if ammo_extension.total_remaining_ammo(ammo_extension) < ammo_extension.clip_size(ammo_extension) then
			local extra_ammo_for_full_reload = ammo_extension.clip_size(ammo_extension) - ammo_extension.ammo_count(ammo_extension)

			ammo_extension.add_ammo_to_reserve(ammo_extension, extra_ammo_for_full_reload)
		end

		ammo_extension.instant_reload(ammo_extension, false, "reload")
	end

	status_extension.set_invisible(status_extension, true)
	self._play_vo(self)
	career_extension.start_activated_ability_cooldown(career_extension)

	return 
end
CareerAbilityESHuntsman._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "activate_ability", event_data)

	return 
end

return 
