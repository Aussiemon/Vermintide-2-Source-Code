ChaosTrollHuskHealthExtension = class(ChaosTrollHuskHealthExtension, GenericHealthExtension)
local set_material_property = AiUtils.set_material_property

ChaosTrollHuskHealthExtension.init = function (self, extension_init_context, unit, ...)
	ChaosTrollHuskHealthExtension.super.init(self, extension_init_context, unit, ...)

	local t = Managers.time:time("game")
	self._regen_time = t + 1
	self.pulse_time = 0
	self.state = "unhurt"
	local breed = Breeds.chaos_troll
	local action = BreedActions.chaos_troll.downed
	self.go_down_health = self.health * action.become_downed_hp_percent
	self.regen_pulse_interval = breed.regen_pulse_interval
	self.downed_pulse_interval = breed.downed_pulse_interval
	self.regen_pulse_intensity = breed.regen_pulse_intensity
	self.downed_pulse_intensity = breed.downed_pulse_intensity
	self.action = action
	self.original_health = self.health
end

ChaosTrollHuskHealthExtension.current_max_health_percent = function (self)
	return self.health / self.original_health
end

ChaosTrollHuskHealthExtension.update = function (self, dt, context, t)
	if self.state == "dead" then
		return
	end

	if self.state == "down" then
		ChaosTrollHealthExtension.update_regen_effect(self, t, dt, self.downed_pulse_interval, self.downed_pulse_intensity)

		if self.start_reset_time < t then
			self.down_reset_timer = self.down_reset_timer + dt
			local percent_damage = 1 - self.down_reset_timer / self.action.reset_duration

			set_material_property(self.unit, "damage_value", "mtr_skin", percent_damage, true)
		end
	elseif self.state == "unhurt" or self.state == "wounded" then
		ChaosTrollHealthExtension.update_regen_effect(self, t, dt, self.regen_pulse_interval, self.regen_pulse_intensity)

		if self._regen_time < t then
			self._regen_time = t + self.regen_pulse_interval
			self.pulse_time = 0
		end
	end

	if script_data.show_ai_health then
		Debug.text("TROLL HEALTH [%s] hp=%.1f dmg=%.1f", self.state, self:current_health(), self.damage)
	end
end

ChaosTrollHuskHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike, added_dot)
	local unit = self.unit
	local damage_table = self:_add_to_damage_history_buffer(unit, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike)

	StatisticsUtil.register_damage(unit, damage_table, self.statistics_db)
	fassert(damage_type, "No damage_type!")

	self._recent_damage_type = damage_type
	self._recent_hit_react_type = hit_react_type

	if ScriptUnit.has_extension(attacker_unit, "hud_system") then
		DamageUtils.handle_hit_indication(attacker_unit, unit, damage_amount, hit_zone_name, added_dot)
	end
end

ChaosTrollHuskHealthExtension.add_heal = function (self, healer_unit, heal_amount, heal_source_name, heal_type)
	local unit = self.unit

	self:_add_to_damage_history_buffer(unit, healer_unit, -heal_amount, nil, "heal", nil, nil, heal_source_name, nil, nil, nil, nil)
end

ChaosTrollHuskHealthExtension.sync_damage_taken = function (self, damage, set_max_health, state)
	if set_max_health then
		self:set_max_health(damage)

		return
	end

	self.damage = damage

	if self.state ~= state then
		if state == "down" then
			set_material_property(self.unit, "damage_value", "mtr_skin", 1, true)

			local t = Managers.time:time("game")
			self.start_reset_time = t + (self.action.downed_duration + self.action.standup_anim_duration) - self.action.reset_duration
			self.down_reset_timer = 0
		elseif state == "wounded" or state == "unhurt" then
			set_material_property(self.unit, "damage_value", "mtr_skin", 0, true)
		elseif state == "dead" then
			set_material_property(self.unit, "regen_value", "mtr_skin", 0, true)
		end

		self.state = state
	elseif state == "unhurt" then
		local percent_damage = self.damage / math.max(self.health - self.go_down_health, 0.01)

		set_material_property(self.unit, "damage_value", "mtr_skin", percent_damage, true)
	elseif state == "wounded" then
		local percent_damage = self.damage / (self.health - self.damage)

		set_material_property(self.unit, "damage_value", "mtr_skin", percent_damage, true)
	end
end

return
