-- chunkname: @scripts/unit_extensions/generic/chaos_troll_husk_health_extension.lua

ChaosTrollHuskHealthExtension = class(ChaosTrollHuskHealthExtension, GenericHealthExtension)

local set_material_property = AiUtils.set_material_property

ChaosTrollHuskHealthExtension.init = function (self, extension_init_context, unit, ...)
	ChaosTrollHuskHealthExtension.super.init(self, extension_init_context, unit, ...)

	local t = Managers.time:time("game")

	self._regen_time = t + 1
	self.pulse_time = 0
	self.state = "unhurt"

	local set_only_current_max_health = true

	self:_setup_initial_health_variables(self.health, set_only_current_max_health)

	self.network_event_delegate = extension_init_context.system_data.network_event_delegate

	self.network_event_delegate:register(self, "rpc_sync_current_max_health")
end

ChaosTrollHuskHealthExtension.set_max_health = function (self, value, set_only_current_max_health)
	if set_only_current_max_health then
		self.current_max_health = value
	else
		ChaosTrollHuskHealthExtension.super.set_max_health(self, value)
		self:_setup_initial_health_variables(value)
	end
end

ChaosTrollHuskHealthExtension._setup_initial_health_variables = function (self, new_max_health, from_init)
	local breed = Breeds.chaos_troll
	local action = BreedActions.chaos_troll.downed

	self.go_down_health = new_max_health * action.become_downed_hp_percent
	self.regen_pulse_interval = breed.regen_pulse_interval
	self.downed_pulse_interval = breed.downed_pulse_interval
	self.regen_pulse_intensity = breed.regen_pulse_intensity
	self.downed_pulse_intensity = breed.downed_pulse_intensity
	self.action = action
	self.respawn_hp_max = new_max_health
end

ChaosTrollHuskHealthExtension.current_max_health_percent = function (self)
	return self.health / self.current_max_health
end

ChaosTrollHuskHealthExtension.update = function (self, dt, context, t)
	if self.state == "dead" then
		return
	end

	if self.state == "down" then
		ChaosTrollHealthExtension.update_regen_effect(self, t, dt, self.downed_pulse_interval, self.downed_pulse_intensity)

		if t > self.start_reset_time then
			self.down_reset_timer = self.down_reset_timer + dt

			local percent_damage = 1 - self.down_reset_timer / self.action.reset_duration

			set_material_property(self.unit, "damage_value", "mtr_skin", percent_damage, true)
		end
	elseif self.state == "unhurt" or self.state == "wounded" then
		ChaosTrollHealthExtension.update_regen_effect(self, t, dt, self.regen_pulse_interval, self.regen_pulse_intensity)

		if t > self._regen_time then
			self._regen_time = t + self.regen_pulse_interval
			self.pulse_time = 0
		end
	end
end

ChaosTrollHuskHealthExtension.apply_client_predicted_damage = function (self, predicted_damage)
	return
end

ChaosTrollHuskHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, attack_type, backstab_multiplier, target_index)
	local unit = self.unit
	local damage_table = self:_add_to_damage_history_buffer(unit, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source_name, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, attack_type, target_index)

	StatisticsUtil.register_damage(unit, damage_table, self.statistics_db)
	self:save_kill_feed_data(attacker_unit, damage_table, hit_zone_name, damage_type, damage_source_name, source_attacker_unit)
	fassert(damage_type, "No damage_type!")

	self._recent_damage_type = damage_type
	self._recent_hit_react_type = hit_react_type

	DamageUtils.handle_hit_indication(attacker_unit, unit, damage_amount, hit_zone_name, added_dot)
end

ChaosTrollHuskHealthExtension.add_heal = function (self, healer_unit, heal_amount, heal_source_name, heal_type)
	local unit = self.unit

	self:_add_to_damage_history_buffer(unit, healer_unit, -heal_amount, nil, "heal", nil, nil, heal_source_name, nil, nil, nil, nil, nil, nil, nil, nil, nil)
end

ChaosTrollHuskHealthExtension.sync_damage_taken = function (self, damage, set_max_health, state)
	if set_max_health then
		if not self._has_got_initial_setup then
			self:set_max_health(damage, true)

			self._has_got_initial_setup = true
		else
			ChaosTrollHealthExtension.super.set_max_health(self, damage)
		end

		return
	end

	self.damage = damage
	self._first_damage_occured = true

	if self.state ~= state then
		if state == "down" then
			set_material_property(self.unit, "damage_value", "mtr_skin", 1, true)

			local t = Managers.time:time("game")

			self.start_reset_time = t + (self.action.downed_duration + self.action.standup_anim_duration - self.action.reset_duration)
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

ChaosTrollHuskHealthExtension.rpc_sync_current_max_health = function (self, channel_id, go_id, new_max_health)
	local game_object_id = self.game_object_id or Managers.state.unit_storage:go_id(self.unit)

	if game_object_id ~= go_id then
		return
	end

	self.current_max_health = DamageUtils.networkify_health(new_max_health)
end

ChaosTrollHuskHealthExtension.destroy = function (self)
	ChaosTrollHuskHealthExtension.super:destroy()
	self.network_event_delegate:unregister(self)
end
