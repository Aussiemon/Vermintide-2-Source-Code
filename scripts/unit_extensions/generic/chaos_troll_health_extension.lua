ChaosTrollHealthExtension = class(ChaosTrollHealthExtension, GenericHealthExtension)
local set_material_property = AiUtils.set_material_property

ChaosTrollHealthExtension.init = function (self, extension_init_context, unit, ...)
	ChaosTrollHealthExtension.super.init(self, extension_init_context, unit, ...)

	local t = Managers.time:time("game")
	self._regen_time = t + 1
	self._regen_paused_time = t
	self.pulse_time = 0
	self.state = "unhurt"
end

ChaosTrollHealthExtension.extensions_ready = function (self, world, unit, extension_name)
	local blackboard = BLACKBOARDS[unit]
	local breed = Breeds[blackboard.breed.name]
	local action = BreedActions[blackboard.breed.name].downed
	self.breed = breed
	self.action = action

	self:_setup_initial_health_variables(self.health)
end

ChaosTrollHealthExtension.current_max_health_percent = function (self)
	return self.health / self.current_max_health
end

ChaosTrollHealthExtension.set_max_health = function (self, value)
	ChaosTrollHealthExtension.super.set_max_health(self, value)
	self:_setup_initial_health_variables(value)

	local go_id = self._game_object_id or Managers.state.unit_storage:go_id(self.unit)

	if go_id then
		local max_health = DamageUtils.networkify_health(self.current_max_health)

		self.network_transmit:send_rpc_clients("rpc_sync_current_max_health", go_id, max_health)
	end
end

ChaosTrollHealthExtension._setup_initial_health_variables = function (self, new_max_health)
	if not self.action then
		return
	end

	self.go_down_health = new_max_health * self.action.become_downed_hp_percent
	self.respawn_hp_min = new_max_health * self.action.respawn_hp_min_percent
	self.respawn_hp_max = new_max_health
	self.regen_pulse_interval = self.breed.regen_pulse_interval
	self.downed_pulse_interval = self.breed.downed_pulse_interval
	self.regen_pulse_intensity = self.breed.regen_pulse_intensity
	self.downed_pulse_intensity = self.breed.downed_pulse_intensity
	self.regen_taken_damage_pause_time = self.breed.regen_taken_damage_pause_time
	self.current_max_health = new_max_health
	self._initial_sync = false
end

ChaosTrollHealthExtension.hot_join_sync = function (self, peer_id)
	local go_id = self._game_object_id or Managers.state.unit_storage:go_id(self.unit)

	if go_id then
		local state = NetworkLookup.health_statuses[self.state]
		local is_level_unit = false
		local set_max_health = true

		self.network_transmit:send_rpc("rpc_sync_damage_taken", peer_id, go_id, is_level_unit, set_max_health, self.current_max_health, state)
		self.network_transmit:send_rpc("rpc_sync_damage_taken", peer_id, go_id, is_level_unit, set_max_health, self.health, state)
	end

	ChaosTrollHealthExtension.super.hot_join_sync(self, peer_id)
end

ChaosTrollHealthExtension.update_regen_effect = function (self, t, dt, regen_pulse_interval, intensity)
	self.pulse_time = self.pulse_time + dt
	local n = (self._regen_time - t) / regen_pulse_interval
	local pulse_value = math.sin(n * math.pi) * intensity

	set_material_property(self.unit, "regen_value", "mtr_skin", pulse_value, true)
end

local pulse_duration = 0

ChaosTrollHealthExtension.update = function (self, dt, context, t)
	if self.state == "dead" then
		return
	end

	if not self._initial_sync then
		self._initial_sync = true

		self:sync_health_to_clients(true)
	end

	if self.state == "down" then
		self:update_regen_effect(t, dt, self.downed_pulse_interval, self.downed_pulse_intensity)

		if self.start_reset_time < t then
			self.down_reset_timer = self.down_reset_timer + dt
			local percent_damage = 1 - self.down_reset_timer / self.action.reset_duration

			set_material_property(self.unit, "damage_value", "mtr_skin", percent_damage, true)
		end
	elseif self.state == "unhurt" or self.state == "wounded" then
		self:update_regen_effect(t, dt, self.regen_pulse_interval, self.regen_pulse_intensity)

		if self._regen_time < t and self._regen_paused_time < t then
			local blackboard = BLACKBOARDS[self.unit]
			local time_spent_in_regen = t - self._regen_paused_time
			local max_health_regen_time = blackboard.max_health_regen_time
			local percentage_to_max_regen = math.min(time_spent_in_regen / max_health_regen_time, 1)
			local max_health_regen_per_sec = blackboard.max_health_regen_per_sec
			local heal_amount = max_health_regen_per_sec * percentage_to_max_regen
			heal_amount = DamageUtils.networkify_health(heal_amount)

			if heal_amount > 0 and self.damage > 0 then
				self:add_heal(self.unit, heal_amount * self.regen_pulse_interval, nil, "buff")
				self:sync_health_to_clients(nil)
			end

			self._regen_time = t + self.regen_pulse_interval
			self.pulse_time = 0
		end
	end
end

ChaosTrollHealthExtension._should_die = function (self)
	return self.state == "wounded" and self.health <= self.damage
end

ChaosTrollHealthExtension.apply_client_predicted_damage = function (self, predicted_damage)
	return
end

ChaosTrollHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, attack_type)
	ChaosTrollHealthExtension.super.add_damage(self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, attack_type)

	self._first_damage_occured = true

	if self.state == "dead" then
		return
	end

	local t = Managers.time:time("game")

	if self.state == "unhurt" then
		local percent_damage = 1

		if self.health - self.damage < self.go_down_health then
			local blackboard = BLACKBOARDS[self.unit]
			self.damage = 0
			self.state = "down"
			blackboard.downed_state = "downed"
			self.start_reset_time = t + self.action.downed_duration + self.action.standup_anim_duration - self.action.reset_duration
			self.down_reset_timer = 0
		else
			percent_damage = self.damage / (self.health - self.go_down_health)
		end

		set_material_property(self.unit, "damage_value", "mtr_skin", percent_damage, true)
	elseif self.state == "down" then
		if self.health - self.damage < self.respawn_hp_min then
			self.wounded = true
			self.damage = self.health - self.respawn_hp_min
		end
	elseif self.state == "wounded" then
		if self.health <= self.damage then
			self.state = "dead"

			set_material_property(self.unit, "regen_value", "mtr_skin", 0, true)
		else
			local percent_damage = self.damage / (self.health - self.damage)

			set_material_property(self.unit, "damage_value", "mtr_skin", percent_damage, true)
		end
	end

	self._regen_paused_time = t + self.regen_taken_damage_pause_time

	self:sync_health_to_clients(nil)
end

ChaosTrollHealthExtension.set_downed_finished = function (self)
	if self.state == "down" then
		local action = self.action
		self.respawn_hp_max = self.health * action.respawn_hp_max_percent

		if self.respawn_hp_max < self.health - self.damage then
			self.damage = self.health - self.respawn_hp_max
		end

		if action.reduce_hp_permanently then
			local new_health = self.health - self.damage
			self.respawn_hp_min = new_health * action.respawn_hp_min_percent
			self.go_down_health = new_health * action.become_downed_hp_percent

			ChaosTrollHealthExtension.super.set_max_health(self, new_health)
			self:sync_health_to_clients(true)

			self.damage = 0
		end

		if self.wounded then
			self.state = "wounded"
		else
			self.wounded = false
			self.state = "unhurt"
		end

		self.down_reset_timer = nil

		set_material_property(self.unit, "damage_value", "mtr_skin", 1, true)
		self:sync_health_to_clients(false)
	end
end

ChaosTrollHealthExtension.die = function (self, damage_type)
	local unit = self.unit

	if ScriptUnit.has_extension(unit, "ai_system") then
		damage_type = damage_type or "undefined"

		self:force_set_wounded()
		AiUtils.kill_unit(unit, nil, nil, damage_type, nil)
	end
end

ChaosTrollHealthExtension.sync_health_to_clients = function (self, set_max_health, reason)
	self._game_object_id = self._game_object_id or Managers.state.unit_storage:go_id(self.unit)
	local state_id = NetworkLookup.health_statuses[self.state]
	local is_level_unit = false
	local value = nil

	if set_max_health then
		value = self.health
	else
		value = math.max(0, self.damage)
	end

	self.network_transmit:send_rpc_clients("rpc_sync_damage_taken", self._game_object_id, is_level_unit, set_max_health or false, value, state_id)
end

ChaosTrollHealthExtension.min_health_reached = function (self)
	return self.health - self.damage <= self.respawn_hp_min
end

ChaosTrollHealthExtension.force_set_wounded = function (self)
	self.wounded = true
	self.state = "wounded"
end
