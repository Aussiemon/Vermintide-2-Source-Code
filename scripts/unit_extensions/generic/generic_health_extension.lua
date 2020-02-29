local data_fields = {
	"DAMAGE_AMOUNT",
	"DAMAGE_TYPE",
	"ATTACKER",
	"HIT_ZONE",
	"POSITION",
	"DIRECTION",
	"DAMAGE_SOURCE_NAME",
	"HIT_RAGDOLL_ACTOR_NAME",
	"SOURCE_ATTACKER_UNIT",
	"HIT_REACT_TYPE",
	"CRITICAL_HIT",
	"FIRST_HIT",
	"TOTAL_HITS",
	"BACKSTAB_MULTIPLIER"
}
DamageDataIndex = {}
local DamageDataIndex = DamageDataIndex

for index, field_name in ipairs(data_fields) do
	DamageDataIndex[field_name] = index
end

DamageDataIndex.STRIDE = #data_fields
data_fields = nil
GenericHealthExtension = class(GenericHealthExtension)

GenericHealthExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.is_server = Managers.player.is_server
	self.system_data = extension_init_context.system_data
	self.statistics_db = extension_init_context.statistics_db
	self.damage_buffers = {
		pdArray.new(),
		pdArray.new()
	}
	self.network_transmit = extension_init_context.network_transmit
	local health = extension_init_data.health or Unit.get_data(unit, "health")

	if health == -1 then
		self.is_invincible = true
		health = math.huge
	else
		self.is_invincible = false
	end

	self.dead = false
	self.predicted_dead = false
	self.state = "alive"
	self.damage = extension_init_data.damage or 0
	self.predicted_damage = 0
	self.last_damage_data = {}

	self:set_max_health(health)

	self.unmodified_max_health = self.health
	self._health_clamp_min = nil
	self._recent_damage_type = nil
	self._recent_hit_react_type = nil
	self._damage_cap_per_hit = extension_init_data.damage_cap_per_hit or Unit.get_data(unit, "damage_cap_per_hit") or self.health
end

GenericHealthExtension.destroy = function (self)
	return
end

GenericHealthExtension.freeze = function (self)
	self:set_dead()
end

GenericHealthExtension.unfreeze = function (self)
	self:reset()
end

GenericHealthExtension.reset = function (self)
	self.state = "alive"
	self.dead = false
	self.predicted_dead = false
	self.damage = 0
	self.predicted_damage = 0
	self._recent_damage_type = nil
	self._recent_hit_react_type = nil

	pdArray.set_empty(self.damage_buffers[1])
	pdArray.set_empty(self.damage_buffers[2])
	self:set_max_health(self.unmodified_max_health)
	table.clear(self.last_damage_data)
end

GenericHealthExtension.hot_join_sync = function (self, sender)
	local unit = self.unit
	local network_manager = Managers.state.network
	local go_id, is_level_unit = network_manager:game_object_or_level_id(unit)

	if go_id then
		local state_id = NetworkLookup.health_statuses[self.state]
		local damage_taken = self:get_damage_taken()
		local damage = NetworkUtils.get_network_safe_damage_hotjoin_sync(damage_taken)
		local network_transmit = self.network_transmit

		network_transmit:send_rpc("rpc_sync_damage_taken", sender, go_id, is_level_unit, false, damage, state_id)

		if not self:is_alive() then
			local damage_amount = 0
			local hit_zone_id = NetworkLookup.hit_zones.full
			local damage_type_id = NetworkLookup.damage_types.sync_health
			local hit_position = Unit.world_position(unit, 0)
			local damage_direction = Vector3.up()
			local source_attacker_unit_id = NetworkConstants.invalid_game_object_id
			local damage_source_id = NetworkLookup.damage_sources["n/a"]
			local hit_ragdoll_actor_id = NetworkLookup.hit_ragdoll_actors["n/a"]
			local hit_react_type_id = NetworkLookup.hit_react_types.light
			local is_dead = true
			local is_critical_strike = false
			local added_dot = false
			local first_hit = false
			local total_hits = 0
			local backstab_multiplier = 1

			network_transmit:send_rpc("rpc_add_damage", sender, go_id, is_level_unit, go_id, is_level_unit, source_attacker_unit_id, damage_amount, hit_zone_id, damage_type_id, hit_position, damage_direction, damage_source_id, hit_ragdoll_actor_id, hit_react_type_id, is_dead, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier)
		end
	end
end

GenericHealthExtension.is_alive = function (self)
	return not self.dead
end

GenericHealthExtension.client_predicted_is_alive = function (self)
	return self:is_alive() and not self.predicted_dead
end

GenericHealthExtension.current_health_percent = function (self)
	return 1 - self.damage / self.health
end

GenericHealthExtension.current_health = function (self)
	return self.health - self.damage
end

GenericHealthExtension.get_damage_taken = function (self)
	return self.damage
end

GenericHealthExtension.set_current_damage = function (self, damage)
	self.damage = damage
end

GenericHealthExtension.set_health_clamp_min = function (self, health_clamp_min)
	self._health_clamp_min = health_clamp_min
end

GenericHealthExtension.get_max_health = function (self)
	return self.health
end

GenericHealthExtension.is_dead = function (self)
	return self.dead
end

GenericHealthExtension.current_max_health_percent = function (self)
	return 1
end

GenericHealthExtension.set_max_health = function (self, health)
	local health_constant = NetworkConstants.health
	local network_health = math.clamp(health, health_constant.min, health_constant.max)
	local decimal = network_health % 1
	local rounded_decimal = math.round(decimal * 4) * 0.25
	network_health = math.floor(network_health) + rounded_decimal
	self.health = network_health
	local network_manager = Managers.state.network
	local go_id, is_level_unit = network_manager:game_object_or_level_id(self.unit)

	if self.is_server and go_id then
		local state = NetworkLookup.health_statuses[self.state]

		self.network_transmit:send_rpc_clients("rpc_sync_damage_taken", go_id, is_level_unit, true, network_health, state)
	end
end

GenericHealthExtension._add_to_damage_history_buffer = function (self, unit, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, first_hit, total_hits, backstab_multiplier)
	local hit_position_table = (hit_position and {
		hit_position.x,
		hit_position.y,
		hit_position.z
	}) or nil
	local damage_direction_table = (damage_direction and {
		damage_direction.x,
		damage_direction.y,
		damage_direction.z
	}) or nil
	local damage_buffers = self.damage_buffers
	local system_data = self.system_data
	local active_damage_buffer_index = system_data.active_damage_buffer_index
	local damage_queue = damage_buffers[active_damage_buffer_index]
	local temp_table = FrameTable.alloc_table()
	temp_table[DamageDataIndex.DAMAGE_AMOUNT] = damage_amount
	temp_table[DamageDataIndex.DAMAGE_TYPE] = damage_type
	temp_table[DamageDataIndex.ATTACKER] = attacker_unit
	temp_table[DamageDataIndex.HIT_ZONE] = hit_zone_name
	temp_table[DamageDataIndex.POSITION] = hit_position_table
	temp_table[DamageDataIndex.DIRECTION] = damage_direction_table
	temp_table[DamageDataIndex.DAMAGE_SOURCE_NAME] = damage_source_name or "n/a"
	temp_table[DamageDataIndex.HIT_RAGDOLL_ACTOR_NAME] = hit_ragdoll_actor or "n/a"
	temp_table[DamageDataIndex.SOURCE_ATTACKER_UNIT] = source_attacker_unit
	temp_table[DamageDataIndex.HIT_REACT_TYPE] = hit_react_type or "light"
	temp_table[DamageDataIndex.CRITICAL_HIT] = is_critical_strike or false
	temp_table[DamageDataIndex.FIRST_HIT] = first_hit or false
	temp_table[DamageDataIndex.TOTAL_HITS] = total_hits or 0
	temp_table[DamageDataIndex.BACKSTAB_MULTIPLIER] = backstab_multiplier or false

	pdArray.push_back14(damage_queue, unpack(temp_table))

	return temp_table
end

GenericHealthExtension._should_die = function (self)
	return self.health <= self.damage
end

GenericHealthExtension.apply_client_predicted_damage = function (self, predicted_damage)
	fassert(not self.is_server, "This should only be used for the clients!")

	if not self:get_is_invincible() then
		local damage_mod = math.min(predicted_damage, self._damage_cap_per_hit)
		self.predicted_damage = self.predicted_damage + damage_mod
		self.predicted_dead = self.health <= self.damage + self.predicted_damage
	else
		self.predicted_dead = false
	end
end

GenericHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier)
	local unit = self.unit
	local network_manager = Managers.state.network
	local unit_id, is_level_unit = network_manager:game_object_or_level_id(unit)

	if self._health_clamp_min then
		local health = self:current_health()
		local predicted_health = health - damage_amount
		local overkill_damage = math.max(0, self._health_clamp_min - predicted_health)
		damage_amount = damage_amount - overkill_damage
	end

	local damage_table = self:_add_to_damage_history_buffer(unit, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, first_hit, total_hits, backstab_multiplier)

	fassert(damage_type, "No damage_type!")

	self._recent_damage_type = damage_type
	self._recent_hit_react_type = hit_react_type

	StatisticsUtil.register_damage(unit, damage_table, self.statistics_db)
	self:save_kill_feed_data(attacker_unit, damage_table, hit_zone_name, damage_type, damage_source_name, source_attacker_unit)

	if ScriptUnit.has_extension(attacker_unit, "hud_system") then
		DamageUtils.handle_hit_indication(attacker_unit, unit, damage_amount, hit_zone_name, added_dot)
	end

	if not self:get_is_invincible() and not self.dead then
		local damage_mod = math.min(damage_amount, self._damage_cap_per_hit)
		self.damage = self.damage + damage_mod
		self.predicted_damage = math.max(self.predicted_damage - damage_mod, 0)

		if self:_should_die() and (self.is_server or not unit_id) then
			local death_system = Managers.state.entity:system("death_system")

			death_system:kill_unit(unit, damage_table)
		end
	end

	self:_sync_out_damage(attacker_unit, unit_id, is_level_unit, source_attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier)
end

GenericHealthExtension._sync_out_damage = function (self, attacker_unit, unit_id, is_level_unit, source_attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier)
	if self.is_server and unit_id then
		local network_manager = Managers.state.network
		local attacker_unit_id, attacker_is_level_unit = network_manager:game_object_or_level_id(attacker_unit)
		local source_attacker_unit_id = network_manager:unit_game_object_id(source_attacker_unit) or NetworkConstants.invalid_game_object_id
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
		local damage_type_id = NetworkLookup.damage_types[damage_type]
		local damage_source_id = NetworkLookup.damage_sources[damage_source_name or "n/a"]
		local hit_ragdoll_actor_id = NetworkLookup.hit_ragdoll_actors[hit_ragdoll_actor or "n/a"]
		local hit_react_type_id = NetworkLookup.hit_react_types[hit_react_type or "light"]
		local network_transmit = self.network_transmit
		local is_dead = self.dead or false
		is_critical_strike = is_critical_strike or false
		added_dot = added_dot or false
		first_hit = first_hit or false
		total_hits = total_hits or 0
		backstab_multiplier = backstab_multiplier or 1

		network_transmit:send_rpc_clients("rpc_add_damage", unit_id, is_level_unit, attacker_unit_id, attacker_is_level_unit, source_attacker_unit_id, damage_amount, hit_zone_id, damage_type_id, hit_position, damage_direction, damage_source_id, hit_ragdoll_actor_id, hit_react_type_id, is_dead, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier)
	end
end

GenericHealthExtension.add_heal = function (self, healer_unit, heal_amount, heal_source_name, heal_type)
	local unit = self.unit

	self:_add_to_damage_history_buffer(unit, healer_unit, -heal_amount, nil, "heal", nil, nil, heal_source_name, nil, nil, nil, nil)

	if not self.dead then
		self.damage = math.max(0, self.damage - heal_amount)
		local unit_id, is_level_unit = Managers.state.network:game_object_or_level_id(unit)

		if unit_id and self.is_server then
			local network_manager = Managers.state.network
			local healer_unit_id, healer_is_level_unit = network_manager:game_object_or_level_id(healer_unit)
			local heal_type_id = NetworkLookup.heal_types[heal_type]
			local network_transmit = self.network_transmit

			network_transmit:send_rpc_clients("rpc_heal", unit_id, is_level_unit, healer_unit_id, healer_is_level_unit, heal_amount, heal_type_id)
		end
	end
end

GenericHealthExtension.die = function (self, damage_type)
	if self.is_server then
		local unit = self.unit

		if ScriptUnit.has_extension(unit, "ai_system") then
			damage_type = damage_type or "undefined"

			AiUtils.kill_unit(unit, nil, nil, damage_type, nil)
		end
	end
end

GenericHealthExtension.set_dead = function (self)
	self.damage = self.health
	self.dead = true
end

GenericHealthExtension.has_assist_shield = function (self)
	return false
end

GenericHealthExtension.recent_damages = function (self)
	local previous_buffer_index = 3 - self.system_data.active_damage_buffer_index
	local damage_queue = self.damage_buffers[previous_buffer_index]

	return pdArray.data(damage_queue)
end

GenericHealthExtension.recently_damaged = function (self)
	return self._recent_damage_type, self._recent_hit_react_type
end

GenericHealthExtension.get_is_invincible = function (self)
	local unit = self.unit
	local has_invincibility_buff = false
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if buff_extension then
		has_invincibility_buff = buff_extension:has_buff_perk("invincibility")
	end

	local dlc_is_invincible = false

	return self.is_invincible or has_invincibility_buff or dlc_is_invincible
end

GenericHealthExtension.save_kill_feed_data = function (self, attacker_unit, damage_table, hit_zone_name, damage_type, damage_source_name, source_attacker_unit)
	local unit = self.unit
	local last_damage_data = self.last_damage_data
	local registered_damage = false

	if damage_type ~= "temporary_health_degen" and damage_type ~= "knockdown_bleed" then
		local attacker_unit = source_attacker_unit or AiUtils.get_actual_attacker_unit(attacker_unit)

		if AiUtils.unit_alive(attacker_unit) then
			local breed = Unit.get_data(attacker_unit, "breed")
			local ai_suicide = attacker_unit == unit and breed and not breed.is_player

			if not ai_suicide and (attacker_unit ~= unit or damage_type ~= "cutting") and breed then
				last_damage_data.breed = breed
				last_damage_data.damage_type = damage_type
				local network_manager = Managers.state.network
				last_damage_data.attacker_unit_id = network_manager:unit_game_object_id(attacker_unit)
				registered_damage = true
				local player = Managers.player:owner(attacker_unit)

				if player then
					last_damage_data.attacker_unique_id = player:unique_id()
					last_damage_data.attacker_side = Managers.state.side.side_by_unit[attacker_unit]
				else
					last_damage_data.attacker_unique_id = nil
					last_damage_data.attacker_side = nil
				end
			end
		end
	end

	if not registered_damage then
		local area_damage_extension = ScriptUnit.has_extension(attacker_unit, "area_damage_system")

		if area_damage_extension then
			local source_attacker_unit_data = area_damage_extension.source_attacker_unit_data

			if source_attacker_unit_data then
				last_damage_data.breed = source_attacker_unit_data.breed
				last_damage_data.attacker_unique_id = source_attacker_unit_data.attacker_unique_id
				last_damage_data.attacker_side = source_attacker_unit_data.attacker_side
			end
		end
	end
end

return
