ActionCareerWEWaywatcher = class(ActionCareerWEWaywatcher, ActionTrueFlightBow)
ActionCareerWEWaywatcher.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerWEWaywatcher.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

	return 
end
ActionCareerWEWaywatcher.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionCareerWEWaywatcher.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	local owner_unit = self.owner_unit
	local talent_extension = self.talent_extension

	if talent_extension.has_talent(talent_extension, "kerillian_waywatcher_activated_ability_heal", "wood_elf", true) then
		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit
		local unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
		local heal_type_id = NetworkLookup.heal_types.career_skill

		network_transmit.send_rpc_server(network_transmit, "rpc_request_heal", unit_id, 20, heal_type_id)
	end

	if talent_extension.has_talent(talent_extension, "kerillian_waywatcher_activated_ability_restore_ammo", "wood_elf", true) then
		self._restore_ammo(self)
	end

	self._play_vo(self)

	return 
end
ActionCareerWEWaywatcher.finish = function (self, reason)
	ActionCareerWEWaywatcher.super.finish(self, reason)
	self.inventory_extension:wield_previous_weapon()
	self.career_extension:start_activated_ability_cooldown()

	return 
end
ActionCareerWEWaywatcher._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "activate_ability", event_data)

	return 
end
ActionCareerWEWaywatcher._restore_ammo = function (self)
	local owner_unit = self.owner_unit
	local weapon_slot = "slot_ranged"
	local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	local slot_data = inventory_extension.get_slot_data(inventory_extension, weapon_slot)
	local right_unit_1p = slot_data.right_unit_1p
	local left_unit_1p = slot_data.left_unit_1p
	local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
	local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
	local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
	local ammo_percent = ammo_extension.total_ammo_fraction(ammo_extension)
	local ammo_bonus_fraction = 0.2
	local ammo_amount = math.max(math.round(ammo_extension.get_max_ammo(ammo_extension) * ammo_bonus_fraction), 1)

	if ammo_extension then
		ammo_extension.add_ammo_to_reserve(ammo_extension, ammo_amount)
	end

	return 
end

return 
