ChaosTrollHealthExtension = class(ChaosTrollHealthExtension, GenericHealthExtension)
local set_material_property = AiUtils.set_material_property

ChaosTrollHealthExtension.init = function (self, extension_init_context, unit, ...)
	ChaosTrollHealthExtension.super.init(self, extension_init_context, unit, ...)

	local blackboard = BLACKBOARDS[unit]
	self._blackboard = blackboard
	local t = Managers.time:time("game")
	self._regen_time = t + 1
	self.pulse_time = 0
	self.state = "unhurt"
	local breed = Breeds[blackboard.breed.name]
	local action = BreedActions[blackboard.breed.name].downed
	self.go_down_health = self.health * action.become_downed_hp_percent
	self.respawn_hp_min = self.health * action.respawn_hp_min_percent
	self.respawn_hp_max = self.health
	self.regen_pulse_interval = breed.regen_pulse_interval
	self.downed_pulse_interval = breed.downed_pulse_interval
	self.regen_pulse_intensity = breed.regen_pulse_intensity
	self.downed_pulse_intensity = breed.downed_pulse_intensity
	self.action = action
	self.original_health = self.health
end

ChaosTrollHealthExtension.current_max_health_percent = function (self)
	return self.health / self.original_health
end

ChaosTrollHealthExtension.hot_join_sync = function (self, sender)
	local go_id = self._game_object_id or Managers.state.unit_storage:go_id(self.unit)

	if go_id then
		local health = self.health
		local state = NetworkLookup.health_statuses[self.state]
		local is_level_unit = false
		local set_max_health = true

		self.network_transmit:send_rpc("rpc_sync_damage_taken", sender, go_id, is_level_unit, set_max_health, health, state)
	end

	ChaosTrollHealthExtension.super.hot_join_sync(self, sender)
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

	if self.state == "down" then
		self:update_regen_effect(t, dt, self.downed_pulse_interval, self.downed_pulse_intensity)

		if self.start_reset_time < t then
			self.down_reset_timer = self.down_reset_timer + dt
			local percent_damage = 1 - self.down_reset_timer / self.action.reset_duration

			set_material_property(self.unit, "damage_value", "mtr_skin", percent_damage, true)
		end
	elseif self.state == "unhurt" or self.state == "wounded" then
		self:update_regen_effect(t, dt, self.regen_pulse_interval, self.regen_pulse_intensity)

		if self._regen_time < t then
			self:add_heal(self.unit, self._blackboard.health_regen_per_sec * self.regen_pulse_interval, nil, "buff")

			self._regen_time = t + self.regen_pulse_interval

			self:sync_health_to_clients()

			self.pulse_time = 0
		end
	end
end

ChaosTrollHealthExtension._should_die = function (self)
	return self.state == "wounded" and self.health <= self.damage
end

ChaosTrollHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike)
	ChaosTrollHealthExtension.super.add_damage(self, attacker_unit, damage_amount, hit_zone_name, damage_type, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike)

	if self.state == "dead" then
		return
	end

	if self.state == "unhurt" then
		local percent_damage = 1

		if self.health - self.damage < self.go_down_health then
			self.damage = 0
			self.state = "down"
			self._blackboard.downed_state = "downed"
			local t = Managers.time:time("game")
			self.start_reset_time = t + (self.action.downed_duration + self.action.standup_anim_duration) - self.action.reset_duration
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

	self:sync_health_to_clients()
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

			self:set_max_health(new_health)

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
		self:sync_health_to_clients()
	end
end

ChaosTrollHealthExtension.die = function (self, damage_type)
	local unit = self.unit

	if ScriptUnit.has_extension(unit, "ai_system") then
		damage_type = damage_type or "undefined"
		self.state = "wounded"

		AiUtils.kill_unit(unit, nil, nil, damage_type, nil)
	end
end

ChaosTrollHealthExtension.sync_health_to_clients = function (self)
	self._game_object_id = self._game_object_id or Managers.state.unit_storage:go_id(self.unit)
	local state_id = NetworkLookup.health_statuses[self.state]
	local is_level_unit = false
	local set_max_health = false

	self.network_transmit:send_rpc_clients("rpc_sync_damage_taken", self._game_object_id, is_level_unit, set_max_health, self.damage, state_id)
end

ChaosTrollHealthExtension.min_health_reached = function (self)
	return self.health - self.damage <= self.respawn_hp_min
end

return
