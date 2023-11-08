ActionDetonate = class(ActionDetonate, ActionBase)

ActionDetonate.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionDetonate.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.ammo_extension = ScriptUnit.has_extension(weapon_unit, "ammo_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self.owner_buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self.hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")
	self.owner_unit = owner_unit

	if self.first_person_extension then
		self.first_person_unit = self.first_person_extension:get_first_person_unit()
	end

	self._rumble_effect_id = false
	self.unit_id = Managers.state.network.unit_storage:go_id(owner_unit)
end

ActionDetonate.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionDetonate.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local owner_unit = self.owner_unit
	local detonate_delay = new_action.detonate_delay_start
	local detonation_order = new_action.detonation_order
	local projectile_system = Managers.state.entity:system("projectile_system")
	local active_skull_count = projectile_system:get_indexed_projectile_count(owner_unit)
	local start_idx, end_idx, increment = nil

	if detonation_order == "front_first" then
		start_idx = active_skull_count
		end_idx = math.max(active_skull_count - new_action.num_to_detonate, 1)
		increment = -1
	else
		start_idx = 1
		end_idx = math.min(new_action.num_to_detonate, active_skull_count)
		increment = 1
	end

	local detonated = false

	for i = start_idx, end_idx, increment do
		local projectile = projectile_system:get_and_delete_indexed_projectile(owner_unit, i, true)
		local projectile_extension = ScriptUnit.has_extension(projectile, "projectile_system")

		if projectile_extension then
			projectile_extension:queue_delayed_external_event("detonate", t + detonate_delay, true)

			detonate_delay = detonate_delay + new_action.detonate_delay_increment
			detonated = true
		end
	end

	if detonated and self.first_person_extension then
		self.first_person_extension:animation_event("shake_minimal")
	end
end

ActionDetonate.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionDetonate.finish = function (self, reason)
	ActionDetonate.super.finish(self, reason)
end

ActionDetonate.destroy = function (self)
	return
end
