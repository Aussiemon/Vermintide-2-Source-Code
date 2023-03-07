ActionCancel = class(ActionCancel, ActionBase)

ActionCancel.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCancel.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
end

ActionCancel.client_owner_start_action = function (self, new_action, t)
	ActionCancel.super.client_owner_start_action(self, new_action, t)
end

ActionCancel.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionCancel.finish = function (self, reason)
	return
end
