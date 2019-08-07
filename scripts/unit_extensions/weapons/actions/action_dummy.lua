ActionDummy = class(ActionDummy, ActionBase)

ActionDummy.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionDummy.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(owner_unit, "status_system") then
		self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	end

	if ScriptUnit.has_extension(weapon_unit, "spread_system") then
		self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	end
end

ActionDummy.client_owner_start_action = function (self, new_action, t)
	ActionDummy.super.client_owner_start_action(self, new_action, t)

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

	Unit.flow_event(self.owner_unit, "lua_force_stop")
	Unit.flow_event(self.first_person_unit, "lua_force_stop")
end

return
