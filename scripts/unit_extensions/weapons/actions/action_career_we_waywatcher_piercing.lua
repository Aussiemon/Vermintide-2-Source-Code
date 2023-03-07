ActionCareerWEWaywatcherPiercing = class(ActionCareerWEWaywatcherPiercing, ActionBow)

ActionCareerWEWaywatcherPiercing.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerWEWaywatcherPiercing.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
end

ActionCareerWEWaywatcherPiercing.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionCareerWEWaywatcherPiercing.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
	self:_play_vo()
	self.career_extension:start_activated_ability_cooldown()

	local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

	inventory_extension:check_and_drop_pickups("career_ability")
end

ActionCareerWEWaywatcherPiercing.finish = function (self, reason)
	ActionCareerWEWaywatcherPiercing.super.finish(self, reason)
	self.inventory_extension:wield_previous_non_level_slot()
end

ActionCareerWEWaywatcherPiercing._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

ActionCareerWEWaywatcherPiercing._restore_ammo = function (self)
	local owner_unit = self.owner_unit
	local weapon_slot = "slot_ranged"
	local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	local slot_data = inventory_extension:get_slot_data(weapon_slot)
	local right_unit_1p = slot_data.right_unit_1p
	local left_unit_1p = slot_data.left_unit_1p
	local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
	local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
	local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
	local ammo_bonus_fraction = 0.2
	local ammo_amount = math.max(math.round(ammo_extension:max_ammo() * ammo_bonus_fraction), 1)

	if ammo_extension then
		ammo_extension:add_ammo_to_reserve(ammo_amount)
	end
end
