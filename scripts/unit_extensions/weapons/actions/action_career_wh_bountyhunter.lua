ActionCareerWHBountyhunter = class(ActionCareerWHBountyhunter, ActionBountyHunterHandgun)

ActionCareerWHBountyhunter.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerWHBountyhunter.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
end

ActionCareerWHBountyhunter.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}
	local talent_extension = self.talent_extension

	if talent_extension:has_talent("victor_bountyhunter_activated_ability_railgun") then
		action_init_data.upper_barrel = "railgun"
		action_init_data.lower_barrel = "railgun"
	elseif talent_extension:has_talent("victor_bountyhunter_activated_ability_blast_shotgun") then
		action_init_data.upper_barrel = "shotgun"
		action_init_data.lower_barrel = "shotgun"
	else
		action_init_data.upper_barrel = "railgun"
		action_init_data.lower_barrel = "shotgun"
	end

	ActionCareerWHBountyhunter.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
	self:_play_vo()

	self.start_activated_ability_cooldown_t = 0.1
	local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

	inventory_extension:check_and_drop_pickups("career_ability")
end

ActionCareerWHBountyhunter.client_owner_post_update = function (self, dt, ...)
	if self.start_activated_ability_cooldown_t then
		self.start_activated_ability_cooldown_t = self.start_activated_ability_cooldown_t - dt

		if self.start_activated_ability_cooldown_t <= 0 then
			local career_extension = self.career_extension

			career_extension:start_activated_ability_cooldown()

			self.start_activated_ability_cooldown_t = nil
		end
	end

	ActionCareerWHBountyhunter.super.client_owner_post_update(self, dt, ...)
end

ActionCareerWHBountyhunter.finish = function (self, reason)
	ActionCareerWHBountyhunter.super.finish(self, reason)

	local talent_extension = self.talent_extension
	local inventory_extension = self.inventory_extension

	if talent_extension:has_talent("victor_bountyhunter_activated_ability_reload", "witch_hunter", true) then
		local weapon_slot = "slot_ranged"
		local slot_data = inventory_extension:get_slot_data(weapon_slot)
		local right_unit_1p = slot_data.right_unit_1p
		local left_unit_1p = slot_data.left_unit_1p
		local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
		local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
		local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

		if ammo_extension then
			ammo_extension:instant_reload(true)
		end
	end

	self.inventory_extension:wield_previous_non_level_slot()
end

ActionCareerWHBountyhunter._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

return
