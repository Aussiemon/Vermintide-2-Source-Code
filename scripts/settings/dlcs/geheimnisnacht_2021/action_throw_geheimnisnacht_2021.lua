ActionThrowGeheimnisnacht2021 = class(ActionThrowGeheimnisnacht2021, ActionBase)

ActionThrowGeheimnisnacht2021.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionThrowGeheimnisnacht2021.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
end

ActionThrowGeheimnisnacht2021.client_owner_start_action = function (self, new_action, t)
	ActionThrowGeheimnisnacht2021.super.client_owner_start_action(self, new_action, t)

	self.current_action = new_action
	self.ammo_extension = ScriptUnit.extension(self.weapon_unit, "ammo_system")
end

ActionThrowGeheimnisnacht2021.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionThrowGeheimnisnacht2021.finish = function (self, reason)
	if reason ~= "action_complete" then
		return
	end

	local current_action = self.current_action
	local ammo_usage = current_action.ammo_usage

	self.ammo_extension:use_ammo(ammo_usage)
end
