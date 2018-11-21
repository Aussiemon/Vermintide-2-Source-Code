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

	if ScriptUnit.has_extension(weapon_unit, "spread_system") then
		self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	end
end

ActionDummy.client_owner_start_action = function (self, new_action, t)
	self.current_action = new_action
	self.action_time_started = t
	local spread_template_override = new_action.spread_template_override

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end
end

ActionDummy.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionDummy.finish = function (self, reason)
	if self.spread_extension then
		self.spread_extension:reset_spread_template()
	end
end

return
