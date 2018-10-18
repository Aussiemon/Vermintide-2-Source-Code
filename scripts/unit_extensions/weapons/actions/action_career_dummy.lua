ActionCareerDummy = class(ActionCareerDummy, ActionDummy)

ActionCareerDummy.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerDummy.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
end

ActionCareerDummy.finish = function (self, reason)
	local chain_action_data = ActionCareerDummy.super.finish(self, reason)

	if reason ~= "new_interupting_action" then
		self.inventory_extension:wield_previous_slot()
	end

	return chain_action_data
end

return
