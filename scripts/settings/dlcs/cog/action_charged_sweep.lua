-- chunkname: @scripts/settings/dlcs/cog/action_charged_sweep.lua

ActionChargedSweep = class(ActionChargedSweep, ActionSweep)

ActionChargedSweep.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionChargedSweep.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	local overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")

	self.overcharge_level_map = {
		overcharge_extension.overcharge_threshold,
		overcharge_extension.overcharge_limit,
		overcharge_extension.overcharge_critical_limit,
	}
	self.overcharge_map_size = #self.overcharge_level_map
	self.overcharge_extension = overcharge_extension
end

ActionChargedSweep.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}
	self._overcharge_type = nil
	self._consume_overcharge = false

	local discharge_effect
	local overcharge_extension = self.overcharge_extension

	if new_action.discharge_attack then
		local value = overcharge_extension:get_overcharge_value()
		local overcharge_level = self:get_overcharge_level(value)

		discharge_effect = self:get_discharge_effect(new_action, overcharge_level)

		if discharge_effect then
			power_level = power_level * (discharge_effect.overcharge_power_mult or 1)
			self._overcharge_type = discharge_effect.consume_overcharge_type
			self._consume_overcharge = true
		end
	else
		self._overcharge_type = new_action.overcharge_type
	end

	self._discharge_effect = discharge_effect
	self._overcharge_on_swing = new_action.overcharge_on_swing

	if new_action.overcharge_on_swing then
		self:_apply_overcharge(self._overcharge_type, self._consume_overcharge)
	end

	ActionChargedSweep.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
end

ActionChargedSweep.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	ActionChargedSweep.super.client_owner_post_update(self, dt, t, world, can_damage, current_time_in_action)
end

ActionChargedSweep.finish = function (self, reason)
	ActionChargedSweep.super.finish(self, reason)
end

ActionChargedSweep.get_overcharge_level = function (self, value)
	local level = 1
	local overcharge_map = self.overcharge_level_map

	for i = self.overcharge_map_size, 1, -1 do
		if value >= overcharge_map[i] then
			return i + 1
		end
	end

	return level
end

ActionChargedSweep.get_discharge_effect = function (self, action, overcharge_level)
	local overcharge_level_start = math.min(overcharge_level, self.overcharge_map_size)
	local discharge_effects = action.discharge_effects

	for i = overcharge_level_start, 1, -1 do
		local effect = discharge_effects[overcharge_level]

		if effect then
			return effect
		end
	end

	return nil
end

ActionChargedSweep.apply_overcharge = function (self, overcharge_type, consume)
	if overcharge_type then
		local overcharge_extension = self.overcharge_extension
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

		if consume then
			overcharge_extension:remove_charge(overcharge_amount)
		else
			overcharge_extension:add_charge(overcharge_amount)
		end
	end
end

ActionChargedSweep._send_attack_hit = function (self, t, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, ...)
	local first_alive_hit = false
	local hit_unit

	if t > self._time_to_hit and self._number_of_hit_enemies == 1 then
		hit_unit = self._network_manager:game_object_or_level_unit(hit_unit_id)

		local target_health_extension = ScriptUnit.has_extension(hit_unit, "health_system")

		first_alive_hit = target_health_extension and target_health_extension:client_predicted_is_alive()
	end

	ActionChargedSweep.super._send_attack_hit(self, t, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, ...)

	if first_alive_hit then
		if not self._overcharge_on_swing then
			self:apply_overcharge(self._overcharge_type, self._consume_overcharge)
		end

		self:_apply_discharge_effect(self._discharge_effect, damage_source_id, hit_unit, hit_position)
	end
end

ActionChargedSweep._apply_discharge_effect = function (self, discharge_effect, damage_source_id, hit_unit, hit_position)
	if discharge_effect then
		local impact_explosion_template_name = discharge_effect.explosion_template_name

		if impact_explosion_template_name then
			local spine_node = Unit.has_node(hit_unit, "c_spine") and Unit.node(hit_unit, "c_spine")
			local explosion_position = spine_node and Unit.world_position(hit_unit, spine_node) or hit_position
			local world = self.world
			local owner_unit = self.owner_unit
			local rotation = self._stored_rotation:unbox()
			local scale = 1
			local item_name = self.item_name
			local power_level = self._power_level
			local is_server = self.is_server
			local is_husk = false
			local is_critical_strike = false
			local weapon_unit = self.weapon_unit
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local impact_explosion_template = ExplosionTemplates[impact_explosion_template_name]
			local owner_unit_go_id = network_manager:unit_game_object_id(owner_unit)
			local impact_explosion_template_id = NetworkLookup.explosion_templates[impact_explosion_template_name]

			if is_server then
				network_transmit:send_rpc_clients("rpc_create_explosion", owner_unit_go_id, false, explosion_position, rotation, impact_explosion_template_id, scale, damage_source_id, power_level, is_critical_strike, owner_unit_go_id)
			else
				network_transmit:send_rpc_server("rpc_create_explosion", owner_unit_go_id, false, explosion_position, rotation, impact_explosion_template_id, scale, damage_source_id, power_level, is_critical_strike, owner_unit_go_id)
			end

			DamageUtils.create_explosion(world, owner_unit, explosion_position, rotation, impact_explosion_template, scale, item_name, is_server, is_husk, weapon_unit, power_level, is_critical_strike)
		end
	end
end

ActionChargedSweep._get_damage_profile_name = function (self, action_hand, action)
	local discharge_effect = self._discharge_effect

	if discharge_effect and discharge_effect.damage_profile_name then
		return discharge_effect.damage_profile_name
	end

	return ActionChargedSweep.super._get_damage_profile_name(self, action_hand, action)
end
