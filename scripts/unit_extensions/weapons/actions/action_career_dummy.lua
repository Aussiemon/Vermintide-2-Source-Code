ActionCareerDummy = class(ActionCareerDummy, ActionDummy)

ActionCareerDummy.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerDummy.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.owner_unit = owner_unit
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
end

ActionCareerDummy.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionCareerDummy.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	self.current_action = new_action
	local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

	inventory_extension:check_and_drop_pickups("career_ability")
end

ActionCareerDummy.finish = function (self, reason)
	local chain_action_data = ActionCareerDummy.super.finish(self, reason)

	if reason ~= "new_interupting_action" then
		self.inventory_extension:wield_previous_non_level_slot()
	end

	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local unzoom_condition_function = current_action.unzoom_condition_function

	if not unzoom_condition_function or unzoom_condition_function(reason) then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)
	end

	return chain_action_data
end
