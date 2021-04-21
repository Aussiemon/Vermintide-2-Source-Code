ActionCareerTrueFlightAim = class(ActionCareerTrueFlightAim, ActionTrueFlightBowAim)

ActionCareerTrueFlightAim.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerTrueFlightAim.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
end

ActionCareerTrueFlightAim.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionCareerTrueFlightAim.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	self.not_wield_previous = new_action.not_wield_previous
	local init_flow_event = self.current_action.init_flow_event

	if init_flow_event then
		Unit.flow_event(self.owner_unit, init_flow_event)
		Unit.flow_event(self.first_person_unit, init_flow_event)
	end

	local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

	inventory_extension:check_and_drop_pickups("career_ability")
end

ActionCareerTrueFlightAim.finish = function (self, reason)
	local chain_action_data = ActionCareerTrueFlightAim.super.finish(self, reason)

	if reason ~= "new_interupting_action" then
		if not self.not_wield_previous then
			self.inventory_extension:wield_previous_slot()
		end

		Unit.flow_event(self.owner_unit, "lua_force_stop")
		Unit.flow_event(self.first_person_unit, "lua_force_stop")
	end

	return chain_action_data
end

return
