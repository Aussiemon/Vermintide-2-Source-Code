TrainingDummyHealthExtension = class(TrainingDummyHealthExtension, GenericHealthExtension)

TrainingDummyHealthExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.is_server = Managers.player.is_server
	self.system_data = extension_init_context.system_data
	self.statistics_db = extension_init_context.statistics_db
	self.damage_buffers = {
		pdArray.new(),
		pdArray.new()
	}
	self.network_transmit = extension_init_context.network_transmit
	self.is_invincible = true
	self.health = NetworkConstants.health.max
	self.damage = 0
	self.state = "alive"
	self._side_name = "neutral"
end

TrainingDummyHealthExtension.extensions_ready = function (self, world, unit)
	local side_manager = Managers.state.side
	local side = side_manager:get_side_from_name(self._side_name)
	local side_id = side.side_id

	side_manager:add_unit_to_side(self.unit, side_id)
end

TrainingDummyHealthExtension.freeze = function (self)
	self:set_dead()
end

TrainingDummyHealthExtension.unfreeze = function (self)
	self:reset()
end

TrainingDummyHealthExtension.reset = function (self)
	return
end

TrainingDummyHealthExtension.hot_join_sync = function (self, sender)
	return
end

TrainingDummyHealthExtension.is_alive = function (self)
	return true
end

TrainingDummyHealthExtension.current_health_percent = function (self)
	return 1
end

TrainingDummyHealthExtension.current_health = function (self)
	return self.health
end

TrainingDummyHealthExtension.get_max_health = function (self)
	return self.health
end

local dot_hit_types = {
	bleed = true,
	burninating = true,
	arrow_poison_dot = true
}

TrainingDummyHealthExtension.apply_client_predicted_damage = function (self, predicted_damage)
	return
end

TrainingDummyHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, attack_type, backstab_multiplier)
	local unit = self.unit
	local network_manager = Managers.state.network
	local unit_id, is_level_unit = network_manager:game_object_or_level_id(unit)

	DamageUtils.handle_hit_indication(attacker_unit, unit, damage_amount, hit_zone_name, added_dot)
	self:_add_to_damage_history_buffer(unit, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike)

	self._recent_damage_type = damage_type
	self._recent_hit_react_type = hit_react_type
	local is_dot_damage = dot_hit_types[damage_type]

	if not DEDICATED_SERVER then
		local color_modifier_red = math.min(120 + damage_amount * 4, 255)
		local color_modifier_green = math.max(200 - damage_amount * 4, 0)
		local color = nil

		if is_dot_damage then
			color = Vector3(192, 192, 192)
		else
			color = Vector3(color_modifier_red, color_modifier_green, 0)
		end

		local text_size = 40 + damage_amount * 0.75
		local duration = 2.2

		if is_critical_strike then
			color[1] = 255
			duration = 3.2
			text_size = text_size + 0.05
		end

		if is_dot_damage then
			duration = 1.5
			text_size = text_size - 0.05
		end

		Managers.state.event:trigger("add_damage_number", damage_amount * 0.01, text_size, unit, duration, color, is_critical_strike)
	end

	if self.is_server and unit_id then
		local attacker_unit_id, attacker_is_level_unit = network_manager:game_object_or_level_id(attacker_unit)
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
		local damage_type_id = NetworkLookup.damage_types[damage_type]
		local damage_source_id = NetworkLookup.damage_sources[damage_source_name or "n/a"]
		local hit_ragdoll_actor_id = NetworkLookup.hit_ragdoll_actors[hit_ragdoll_actor or "n/a"]
		local hit_react_type_id = NetworkLookup.hit_react_types[hit_react_type or "light"]
		local attack_type_id = NetworkLookup.buff_attack_types[attack_type or "n/a"]
		local source_attacker_unit_id = NetworkConstants.invalid_game_object_id
		local network_transmit = self.network_transmit
		local is_dead = self.dead or false
		is_critical_strike = is_critical_strike or false
		added_dot = added_dot or false
		first_hit = first_hit or false
		total_hits = total_hits or 0
		backstab_multiplier = backstab_multiplier or 1

		network_transmit:send_rpc_clients("rpc_add_damage", unit_id, is_level_unit, attacker_unit_id, attacker_is_level_unit, source_attacker_unit_id, damage_amount, hit_zone_id, damage_type_id, hit_position, damage_direction, damage_source_id, hit_ragdoll_actor_id, hit_react_type_id, is_dead, is_critical_strike, added_dot, first_hit, total_hits, attack_type_id, backstab_multiplier)
	end
end

TrainingDummyHealthExtension.set_max_health = function (self, health, update_unmodfied)
	return
end

TrainingDummyHealthExtension.get_damage_taken = function (self)
	return 0
end

TrainingDummyHealthExtension.set_current_damage = function (self, damage)
	return
end

TrainingDummyHealthExtension.die = function (self, damage_type)
	fassert(false, "Tried to kill TrainingDummyHealthExtension")
end

TrainingDummyHealthExtension.set_dead = function (self)
	return
end

TrainingDummyHealthExtension.recently_damaged = function (self)
	return self._recent_damage_type, self._recent_hit_react_type
end

return
