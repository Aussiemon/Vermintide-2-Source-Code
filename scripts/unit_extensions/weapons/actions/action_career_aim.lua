ActionCareerAim = class(ActionCareerAim, ActionAim)

ActionCareerAim.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionCareerAim.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

	inventory_extension:check_and_drop_pickups("career_ability")
end
