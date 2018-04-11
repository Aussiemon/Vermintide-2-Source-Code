local data_fields = {
	"DAMAGE_AMOUNT",
	"DAMAGE_TYPE",
	"ATTACKER",
	"HIT_ZONE",
	"DIRECTION",
	"DAMAGE_SOURCE_NAME",
	"HIT_RAGDOLL_ACTOR_NAME",
	"DAMAGING_UNIT",
	"HIT_REACT_TYPE",
	"CRITICAL_HIT"
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

	self.state = "alive"
	self.damage = extension_init_data.damage or 0
	self._recent_damage_type = nil
	self._recent_hit_react_type = nil

	self.set_max_health(self, health, true)

	return 
end
GenericHealthExtension.destroy = function (self)
	return 
end
GenericHealthExtension.reset = function (self)
	self.damage = 0
	self.state = "alive"

	pdArray.set_empty(self.damage_buffers[1])
	pdArray.set_empty(self.damage_buffers[2])

	return 
end
GenericHealthExtension.hot_join_sync = function (self, sender)
	local unit = self.unit
	local network_manager = Managers.state.network
	local go_id, is_level_unit = network_manager.game_object_or_level_id(network_manager, unit)

	if go_id then
		local state_id = NetworkLookup.health_statuses[self.state]
		local damage_taken = self.get_damage_taken(self)
		local damage = NetworkUtils.get_network_safe_damage_hotjoin_sync(damage_taken)
		local network_transmit = self.network_transmit

		network_transmit.send_rpc(network_transmit, "rpc_sync_damage_taken", sender, go_id, is_level_unit, false, damage, state_id)

		if not self.is_alive(self) then
			local damage_amount = 0
			local hit_zone_id = NetworkLookup.hit_zones.full
			local damage_type_id = NetworkLookup.damage_types.sync_health
			local damage_direction = Vector3.up()
			local damage_source_id = NetworkLookup.damage_sources["n/a"]
			local hit_ragdoll_actor_id = NetworkLookup.hit_ragdoll_actors["n/a"]
			local hit_react_type_id = NetworkLookup.hit_react_types.light
			local is_dead = true
			local is_critical_strike = false
			local added_dot = false

			network_transmit.send_rpc(network_transmit, "rpc_add_damage", sender, go_id, is_level_unit, go_id, is_level_unit, damage_amount, hit_zone_id, damage_type_id, damage_direction, damage_source_id, hit_ragdoll_actor_id, hit_react_type_id, is_dead, is_critical_strike, added_dot)
		end
	end

	return 
end
GenericHealthExtension.is_alive = function (self)
	return not self.dead
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

	return 
end
GenericHealthExtension.get_max_health = function (self)
	return self.health
end
GenericHealthExtension.current_max_health_percent = function (self)
	return 1
end
GenericHealthExtension.set_max_health = function (self, health, update_unmodfied)
	local health_constant = NetworkConstants.health
	local network_health = math.clamp(health, health_constant.min, health_constant.max)
	local decimal = network_health % 1
	local rounded_decimal = math.round(decimal * 4) * 0.25
	network_health = math.floor(network_health) + rounded_decimal

	if update_unmodfied then
		self.unmodified_max_health = network_health
	end

	self.health = network_health
	local network_manager = Managers.state.network
	local go_id, is_level_unit = network_manager.game_object_or_level_id(network_manager, self.unit)

	if self.is_server and go_id then
		local state = NetworkLookup.health_statuses[self.state]

		self.network_transmit:send_rpc_clients("rpc_sync_damage_taken", go_id, is_level_unit, true, network_health, state)
	end

	return 
end
GenericHealthExtension._add_to_damage_history_buffer = function (self, unit, attacker_unit, damage_amount, hit_zone_name, damage_type, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike)
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
	temp_table[DamageDataIndex.DIRECTION] = damage_direction_table
	temp_table[DamageDataIndex.DAMAGE_SOURCE_NAME] = damage_source_name or "n/a"
	temp_table[DamageDataIndex.HIT_RAGDOLL_ACTOR_NAME] = hit_ragdoll_actor or "n/a"
	temp_table[DamageDataIndex.DAMAGING_UNIT] = damaging_unit or "n/a"
	temp_table[DamageDataIndex.HIT_REACT_TYPE] = hit_react_type or "light"
	temp_table[DamageDataIndex.CRITICAL_HIT] = is_critical_strike or false

	pdArray.push_back10(damage_queue, unpack(temp_table))

	return temp_table
end
GenericHealthExtension._should_die = function (self)
	return self.health <= self.damage
end
GenericHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike, added_dot)
	if Managers.player:is_player_unit(attacker_unit) then
		local owner_player = Managers.player:owner(attacker_unit)

		if owner_player.local_player and not owner_player.bot_player then
			local breed = Unit.get_data(self.unit, "breed")

			if breed and breed.boss then
				Managers.state.event:trigger("show_boss_health_bar", self.unit)
			end
		end
	end

	local unit = self.unit
	local network_manager = Managers.state.network
	local unit_id, is_level_unit = network_manager.game_object_or_level_id(network_manager, unit)
	local damage_table = self._add_to_damage_history_buffer(self, unit, attacker_unit, damage_amount, hit_zone_name, damage_type, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike)

	StatisticsUtil.register_damage(unit, damage_table, self.statistics_db)
	fassert(damage_type, "No damage_type!")

	self._recent_damage_type = damage_type
	self._recent_hit_react_type = hit_react_type

	if ScriptUnit.has_extension(attacker_unit, "hud_system") then
		DamageUtils.handle_hit_indication(attacker_unit, unit, damage_amount, hit_zone_name, added_dot)
	end

	if not self.is_invincible and not self.dead then
		self.damage = self.damage + damage_amount

		if self._should_die(self) and (self.is_server or not unit_id) then
			local death_system = Managers.state.entity:system("death_system")

			death_system.kill_unit(death_system, unit, damage_table)
		end
	end

	if self.is_server and unit_id then
		local attacker_unit_id, attacker_is_level_unit = network_manager.game_object_or_level_id(network_manager, attacker_unit)
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
		local damage_type_id = NetworkLookup.damage_types[damage_type]
		local damage_source_id = NetworkLookup.damage_sources[damage_source_name or "n/a"]
		local hit_ragdoll_actor_id = NetworkLookup.hit_ragdoll_actors[hit_ragdoll_actor or "n/a"]
		local hit_react_type_id = NetworkLookup.hit_react_types[hit_react_type or "light"]
		local network_transmit = self.network_transmit
		local is_dead = self.dead or false
		is_critical_strike = is_critical_strike or false
		added_dot = added_dot or false

		network_transmit.send_rpc_clients(network_transmit, "rpc_add_damage", unit_id, is_level_unit, attacker_unit_id, attacker_is_level_unit, damage_amount, hit_zone_id, damage_type_id, damage_direction, damage_source_id, hit_ragdoll_actor_id, hit_react_type_id, is_dead, is_critical_strike, added_dot)
	end

	return 
end
GenericHealthExtension.add_heal = function (self, healer_unit, heal_amount, heal_source_name, heal_type)
	local unit = self.unit

	self._add_to_damage_history_buffer(self, unit, healer_unit, -heal_amount, nil, "heal", nil, heal_source_name, nil, nil, nil, nil)

	if not self.dead then
		self.damage = math.max(0, self.damage - heal_amount)
		local unit_id, is_level_unit = Managers.state.network:game_object_or_level_id(unit)

		if unit_id and self.is_server then
			local network_manager = Managers.state.network
			local healer_unit_id, healer_is_level_unit = network_manager.game_object_or_level_id(network_manager, healer_unit)
			local heal_type_id = NetworkLookup.heal_types[heal_type]
			local network_transmit = self.network_transmit

			network_transmit.send_rpc_clients(network_transmit, "rpc_heal", unit_id, is_level_unit, healer_unit_id, healer_is_level_unit, heal_amount, heal_type_id)
		end
	end

	return 
end
GenericHealthExtension.die = function (self, damage_type)
	if self.is_server then
		local unit = self.unit

		if ScriptUnit.has_extension(unit, "ai_system") then
			damage_type = damage_type or "undefined"

			AiUtils.kill_unit(unit, nil, nil, damage_type, nil)
		end
	end

	return 
end
GenericHealthExtension.set_dead = function (self)
	self.damage = self.health
	self.dead = true

	return 
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

return 
