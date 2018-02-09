ActionCareerWHBountyhunter = class(ActionCareerWHBountyhunter, ActionBountyHunterHandgun)
ActionCareerWHBountyhunter.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerWHBountyhunter.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

	return 
end
ActionCareerWHBountyhunter.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	local action_init_data = action_init_data or {}
	local talent_extension = self.talent_extension

	if talent_extension.has_talent(talent_extension, "victor_bountyhunter_activated_ability_railgun") then
		action_init_data.upper_barrel = "railgun"
		action_init_data.lower_barrel = "railgun"
	elseif talent_extension.has_talent(talent_extension, "victor_bountyhunter_activated_ability_shotgun") then
		action_init_data.upper_barrel = "shotgun"
		action_init_data.lower_barrel = "shotgun"
	else
		action_init_data.upper_barrel = "railgun"
		action_init_data.lower_barrel = "shotgun"
	end

	ActionCareerWHBountyhunter.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
	self._play_vo(self)

	return 
end
ActionCareerWHBountyhunter.finish = function (self, reason)
	ActionCareerWHBountyhunter.super.finish(self, reason)

	local owner_unit = self.owner_unit
	local talent_extension = self.talent_extension
	local inventory_extension = self.inventory_extension
	local career_extension = self.career_extension

	if talent_extension.has_talent(talent_extension, "victor_bountyhunter_activated_ability_reload", "witch_hunter", true) then
		local weapon_slot = "slot_ranged"
		local slot_data = inventory_extension.get_slot_data(inventory_extension, weapon_slot)
		local right_unit_1p = slot_data.right_unit_1p
		local left_unit_1p = slot_data.left_unit_1p
		local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
		local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
		local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

		if ammo_extension then
			ammo_extension.instant_reload(ammo_extension, true)
		end
	end

	if talent_extension.has_talent(talent_extension, "victor_bountyhunter_activated_ability_heal", "witch_hunter", true) then
		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit
		local unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
		local heal_type_id = NetworkLookup.heal_types.career_skill

		network_transmit.send_rpc_server(network_transmit, "rpc_request_heal", unit_id, 35, heal_type_id)
	end

	inventory_extension.wield_previous_weapon(inventory_extension)
	career_extension.start_activated_ability_cooldown(career_extension)

	return 
end
ActionCareerWHBountyhunter._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "activate_ability", event_data)

	return 
end

return 
