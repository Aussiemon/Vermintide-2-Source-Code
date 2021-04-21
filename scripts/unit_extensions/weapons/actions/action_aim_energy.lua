ActionAimEnergy = class(ActionAimEnergy, ActionAim)

ActionAimEnergy.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionAimEnergy.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
end

ActionAimEnergy.client_owner_start_action = function (self, new_action, t)
	ActionAimEnergy.super.client_owner_start_action(self, new_action, t)
end

ActionAimEnergy.client_owner_post_update = function (self, dt, t, world, can_damage)
	ActionAimEnergy.super.client_owner_post_update(self, dt, t, world, can_damage)
	self:_process_energy_draining(dt, t)
end

ActionAimEnergy._process_energy_draining = function (self, dt, t)
	local is_depleted = false
	local energy_extension = ScriptUnit.extension(self.owner_unit, "energy_system")
	local is_drainable = energy_extension:is_drainable()

	if is_drainable then
		local drain_rate = self.current_action.drain_rate
		local drained_energy_delta = drain_rate * dt

		energy_extension:drain(drained_energy_delta)

		is_depleted = energy_extension:is_depleted()
	end

	if is_depleted then
		self:_fire_shot(t)
	end
end

ActionAimEnergy._fire_shot = function (self, t)
	local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")
	local item_data, _, _ = CharacterStateHelper.get_item_data_and_weapon_extensions(inventory_extension)
	local item_template = BackendUtils.get_item_template(item_data)
	local action_settings = self.current_action.action_on_energy_drained
	local action_name = action_settings.action_name
	local sub_action_name = action_settings.sub_action_name
	local actions = item_template.actions
	local local_player = Managers.player:local_player()
	local hero_name = local_player:profile_display_name()
	local career_name = local_player:career_name()
	local power_level = BackendUtils.get_total_power_level(hero_name, career_name)
	local action_init_data = nil
	local weapon_extension = ScriptUnit.extension(self.weapon_unit, "weapon_system")

	weapon_extension:start_action(action_name, sub_action_name, actions, t, power_level, action_init_data)
end

return
