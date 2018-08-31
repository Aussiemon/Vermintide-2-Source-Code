ActionCareerCancel = class(ActionCareerCancel, ActionDummy)

ActionCareerCancel.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerCancel.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
end

ActionCareerCancel.finish = function (self, reason)
	ActionCareerCancel.super.finish(self, reason)
	self.inventory_extension:wield_previous_slot()
end

return
