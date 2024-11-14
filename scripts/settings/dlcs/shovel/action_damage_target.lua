-- chunkname: @scripts/settings/dlcs/shovel/action_damage_target.lua

ActionDamageTarget = class(ActionDamageTarget, ActionBase)

ActionDamageTarget.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionDamageTarget.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.owner_unit = owner_unit
	self.ammo_extension = ScriptUnit.has_extension(weapon_unit, "ammo_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self.owner_buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self.hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if self.first_person_extension then
		self.first_person_unit = self.first_person_extension:get_first_person_unit()
	end

	self._rumble_effect_id = false
	self.unit_id = self.network_manager.unit_storage:go_id(owner_unit)
end

ActionDamageTarget.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionDamageTarget.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	if not chain_action_data or not chain_action_data.target then
		self._done = true

		self.weapon_extension:stop_action("action_complete")

		return
	end

	self._power_level = power_level
	self._target_unit = chain_action_data.target
	self._damage_steps = new_action.damage_steps
	self._step_idx = 1
	self._num_repeats = 0

	local anim_time_scale = ActionUtils.get_action_time_scale(self.owner_unit, new_action)

	self._anim_time_scale = anim_time_scale
	self._next_update_t = t + new_action.damage_steps[1].start_delay / self._anim_time_scale
	self._done = false

	local target_unit = self._target_unit
	local target_node_id = Unit.has_node(target_unit, "j_spine") and Unit.node(target_unit, "j_spine") or 0

	self._target_node_id = target_node_id
	self._target_hit_zone = new_action.target_node
	self._target_hit_zone_id = NetworkLookup.hit_zones[new_action.target_node]

	local network_manager = Managers.state.network

	self._attacker_unit_id = network_manager:unit_game_object_id(self.owner_unit)
	self._hit_unit_id = network_manager:unit_game_object_id(chain_action_data.target)

	AiUtils.alert_unit(self.owner_unit, self._target_unit)
	self.weapon_system:start_soul_rip(self.owner_unit, chain_action_data.target, target_node_id, math.random(0, 65535), true)

	if not self.is_bot then
		local wwise_playing_id, wwise_source_id = ActionUtils.start_charge_sound(self.wwise_world, self.weapon_unit, self.owner_unit, new_action)

		self.charging_sound_id = wwise_playing_id
		self.wwise_source_id = wwise_source_id
	end
end

ActionDamageTarget._apply_damage_step = function (self, hit_unit, power_level, step_data, t)
	local damage_profile = step_data.damage_profile
	local overcharge_amount = step_data.overcharge_amount
	local breed = Unit.get_data(hit_unit, "breed")

	if breed then
		overcharge_amount = breed.is_player and step_data.overcharge_amount_player_target or overcharge_amount

		if step_data.can_crit then
			self._is_critical_strike = ActionUtils.is_critical_strike(self.owner_unit, self.current_action, t)

			self:_handle_critical_strike(self._is_critical_strike, self.buff_extension, self.hud_extension, self.first_person_extension, "on_critical_shot", nil)
		else
			self._is_critical_strike = false
		end

		if step_data.proc_buffs then
			local hit_index = 1
			local send_to_server = true
			local damage_profile_template = DamageProfileTemplates[damage_profile]
			local charge_value = damage_profile_template.charge_value or "instant_projectile"
			local buff_type = DamageUtils.get_item_buff_type(self.item_name)

			DamageUtils.buff_on_attack(self.owner_unit, hit_unit, charge_value, self._is_critical_strike, self._target_hit_zone, hit_index, send_to_server, buff_type)
		end
	end

	local _, ranged_boost_curve_multiplier = ActionUtils.get_ranged_boost(self.owner_unit)
	local damage_source = self.item_name
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local attacker_unit_id = self._attacker_unit_id
	local hit_unit_id = self._hit_unit_id
	local hit_zone_id = self._target_hit_zone_id
	local hit_position = Unit.world_position(hit_unit, self._target_node_id)
	local self_pos = self.first_person_extension:current_position()
	local attack_direction = Vector3.normalize(hit_position - self_pos)
	local damage_profile_id = NetworkLookup.damage_profiles[damage_profile]

	self.weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", 1, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", self._is_critical_strike, "can_damage", true, "can_stagger", true, "first_hit", true)

	if overcharge_amount then
		local buff_extension = self.owner_buff_extension

		if self._is_critical_strike and buff_extension:has_buff_perk("no_overcharge_crit") then
			overcharge_amount = 0
		end

		self.overcharge_extension:add_charge(overcharge_amount)
	end
end

ActionDamageTarget.client_owner_post_update = function (self, dt, t, world, can_damage)
	local target_unit = self._target_unit

	if target_unit and not HEALTH_ALIVE[target_unit] then
		self._done = true
		self._target_unit = nil

		if ALIVE[target_unit] then
			local current_action = self.current_action

			self.weapon_system:soul_rip_burst(self.owner_unit, target_unit, self._target_node_id, current_action.last_damage_step_fx_name, math.random(0, 65535), true)
		end

		self:_start_forced_action(t)
	end

	if not self._done and t >= self._next_update_t then
		local current_step = self._damage_steps[self._step_idx]

		self:_apply_damage_step(target_unit, self._power_level, current_step, t)

		self._num_repeats = self._num_repeats + 1

		if self._num_repeats < current_step.repeat_count then
			self._next_update_t = t + current_step.repeat_delay / self._anim_time_scale
		else
			self._step_idx = self._step_idx + 1

			local next_step = self._damage_steps[self._step_idx]

			if next_step then
				self._next_update_t = t + next_step.start_delay / self._anim_time_scale
				self._num_repeats = 0
			else
				self._done = true

				self:_proc_spell_used(self.owner_buff_extension)
				self:_start_forced_action(t)
			end
		end
	end

	if ALIVE[target_unit] then
		local position = Unit.world_position(target_unit, self._target_node_id)
		local to_target, target_dist = Vector3.direction_length(position - self.first_person_extension:current_position())
		local look_dir = Quaternion.forward(self.first_person_extension:current_rotation())
		local max_angle = math.cos(math.degrees_to_radians(45))
		local dot = Vector3.dot(look_dir, to_target)

		if dot < max_angle then
			local radius = 5
			local target_break_threshold = math.cos(math.atan2(radius, target_dist))

			if dot < target_break_threshold then
				self._done = true
				self._target_unit = nil

				self.weapon_extension:stop_action("action_complete")
			end
		end

		if not self._damage_steps[self._step_idx] then
			local current_action = self.current_action

			self.weapon_system:soul_rip_burst(self.owner_unit, target_unit, self._target_node_id, current_action.last_damage_step_fx_name, math.random(0, 65535), true)

			local sound_event = current_action.last_damage_step_sound_event

			if sound_event then
				Managers.state.entity:system("audio_system"):play_audio_position_event(sound_event, position)
			end
		end
	end
end

ActionDamageTarget._start_forced_action = function (self, t)
	local forced_action = self.current_action.force_action_on_complete

	if not forced_action then
		return
	end

	local action_name = forced_action.action_name
	local sub_action_name = forced_action.sub_action_name
	local power_level = self._power_level
	local weapon_extension = self.weapon_extension
	local item_template_name = self.current_action.lookup_data.item_template_name
	local item_template = WeaponUtils.get_weapon_template(item_template_name)
	local actions = item_template.actions

	weapon_extension:start_action(action_name, sub_action_name, actions, t, power_level)
end

ActionDamageTarget.finish = function (self, reason)
	ActionDamageTarget.super.finish(self, reason)

	if not self.is_bot then
		ActionUtils.stop_charge_sound(self.wwise_world, self.charging_sound_id, self.wwise_source_id, self.current_action)

		self.charging_sound_id = nil
		self.wwise_source_id = nil
	end

	self.weapon_system:stop_soul_rip(self.owner_unit, true)
end

ActionDamageTarget.destroy = function (self)
	return
end
