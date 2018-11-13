ActionHandgunLockTargeting = class(ActionHandgunLockTargeting)

ActionHandgunLockTargeting.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.owner_unit_first_person = first_person_unit
	self.weapon_unit = weapon_unit
	self.is_server = is_server
	self.world = world
	self.item_name = item_name

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end
end

ActionHandgunLockTargeting.client_owner_start_action = function (self, new_action, t)
	self.target = nil
	self.current_action = new_action
	local ammo_extension = self.ammo_extension

	if ammo_extension then
		self.max_targets = math.min(ammo_extension:ammo_count(), new_action.max_targets)
	else
		self.max_targets = new_action.max_targets
	end
end

ActionHandgunLockTargeting.client_owner_post_update = function (self, dt, t, world, can_damage)
	local smart_tageting_extension = ScriptUnit.extension(self.owner_unit, "smart_targeting_system")
	local data = smart_tageting_extension:get_targeting_data()
	local target = data.unit

	if target ~= self.target then
		if Unit.alive(self.target) then
			local outline_extension = ScriptUnit.has_extension(self.target, "outline_system")

			if outline_extension then
				outline_extension.set_method("never")
			end
		end

		local outline_extension = ScriptUnit.has_extension(target, "outline_system")

		if outline_extension then
			outline_extension.set_method("always")
		end

		self.target = target
	end
end

ActionHandgunLockTargeting.finish = function (self, reason)
	local target = self.target
	local outline_extension = ScriptUnit.has_extension(target, "outline_system")

	if outline_extension then
		outline_extension.set_method("never")
	end

	local chain_action_data = {
		target = target
	}

	return chain_action_data
end

return
