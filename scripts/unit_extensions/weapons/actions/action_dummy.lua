ActionDummy = class(ActionDummy)
ActionDummy.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.world = world
	self.owner_unit = owner_unit
	self.first_person_unit = first_person_unit
	self.weapon_unit = weapon_unit
	self.item_name = item_name
	self.is_server = is_server

	if ScriptUnit.has_extension(owner_unit, "status_system") then
		self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	end

	return 
end
ActionDummy.client_owner_start_action = function (self, new_action, t)
	self.current_action = new_action
	self.action_time_started = t

	return 
end
ActionDummy.client_owner_post_update = function (self, dt, t, world, can_damage)
	return 
end
ActionDummy.finish = function (self, reason)
	return 
end

return 
