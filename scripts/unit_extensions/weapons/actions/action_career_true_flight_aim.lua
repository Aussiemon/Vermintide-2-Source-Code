ActionCareerTrueFlightAim = class(ActionCareerTrueFlightAim, ActionTrueFlightBowAim)

ActionCareerTrueFlightAim.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerTrueFlightAim.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
end

ActionCareerTrueFlightAim.finish = function (self, reason)
	local chain_action_data = ActionCareerTrueFlightAim.super.finish(self, reason)

	if reason ~= "new_interupting_action" then
		self.inventory_extension:wield_previous_slot()
	end

	return chain_action_data
end

return
