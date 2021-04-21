ActionRangedBase = class(ActionRangedBase, ActionBase)
local HAS_TOBII = rawget(_G, "Tobii") and Application.user_setting("tobii_eyetracking")
local MAX_SHOTS_PER_FRAME = 3
local unit_has_extension = ScriptUnit.has_extension
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event

ActionRangedBase.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionRangedBase.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.buff_extension = unit_has_extension(owner_unit, "buff_system")
	self.overcharge_extension = unit_has_extension(owner_unit, "overcharge_system")
	self.hud_extension = unit_has_extension(owner_unit, "hud_system")
	self.first_person_extension = unit_has_extension(owner_unit, "first_person_system")
	self.eyetracking_extension = HAS_TOBII and unit_has_extension(owner_unit, "eyetracking_system")
	self.targeting_extension = unit_has_extension(owner_unit, "smart_targeting_system")
	self.input_extension = unit_has_extension(owner_unit, "input_system")
	self.status_extension = unit_has_extension(owner_unit, "status_system")
	self.ammo_extension = unit_has_extension(weapon_unit, "ammo_system")
	self.spread_extension = unit_has_extension(weapon_unit, "spread_system")
	self._start_gaze_rotation = QuaternionBox()
	self._fire_position = Vector3Box()
	self._fire_rotation = QuaternionBox()
	self.shield_users_blocking = {}
end

ActionRangedBase.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionRangedBase.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local owner_unit = self.owner_unit
	local buff_extension = self.buff_extension
	local hud_extension = self.hud_extension
	self._state = "waiting_to_shoot"
	self._time_to_shoot = t + (new_action.fire_time or 0)
	self._active_reload_time = new_action.active_reload_time and t + new_action.active_reload_time
	self._power_level = power_level
	self._num_shots_total, self._num_projectiles_per_shot = self:gen_num_shots()
	self._extra_shot_delay = new_action.extra_shot_delay or 0.2
	self._burst_shot_delay = new_action.burst_shot_delay or 0.1
	self._num_shots_fired = 0
	self._num_projectiles_spawned = 0
	self._check_buffs = true
	self._spread_done = false
	self._extra_buff_shot = false
	self._infinite_ammo = buff_extension:has_buff_perk("infinite_ammo")
	self._continuous_buff_check = new_action.continuous_buff_check or false

	if not self.is_bot then
		local controller_effect = new_action.controller_effects and new_action.controller_effects.start

		if controller_effect then
			Managers.state.controller_features:add_effect(controller_effect.effect_type, controller_effect.params)
		end
	end

	local spread_template_override = new_action.spread_template_override

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end

	self._unhide_ammo_at_action_end = new_action.unhide_ammo_on_infinite_ammo and self._infinite_ammo
end

ActionRangedBase.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	if self._state == "waiting_to_shoot" then
		self:_waiting_to_shoot(t)
	end

	if self._state == "start_shooting" then
		self:_start_shooting(t)
	end

	if self._state == "shooting" then
		self:_shooting(t, false)
	end

	if self._state == "finished_shooting" then
		self:_finished_shooting(t)
	end
end

ActionRangedBase.finish = function (self, reason)
	ActionRangedBase.super.finish(self, reason)

	if self._state == "start_shooting" then
		self:_start_shooting()
	end

	if self._state == "shooting" then
		local t = Managers.time:time("game")

		self:_shooting(t, true)
	end

	if self.spread_extension then
		self.spread_extension:reset_spread_template()
	end

	local hud_extension = self.hud_extension

	if hud_extension then
		hud_extension.show_critical_indication = false
	end

	if reason ~= "new_interupting_action" then
		self.status_extension:set_zooming(false)
		self:reload()
	end

	if self._unhide_ammo_at_action_end then
		Unit.flow_event(self.first_person_unit, "anim_cb_unhide_ammo")
	end
end

ActionRangedBase._waiting_to_shoot = function (self, t)
	if self._time_to_shoot <= t then
		self._state = "start_shooting"
	end
end

ActionRangedBase._start_shooting = function (self, t)
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local first_person_extension = self.first_person_extension
	local current_position, current_rotation = first_person_extension:get_projectile_start_position_rotation()
	local eyetracking_extension = self.eyetracking_extension

	if current_action.fire_at_gaze_setting and eyetracking_extension and eyetracking_extension:get_is_feature_enabled("tobii_fire_at_gaze") then
		current_rotation = self._start_gaze_rotation:unbox()
	end

	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, current_action, t)

	self:_handle_critical_strike(is_critical_strike, self.buff_extension, self.hud_extension, nil, "on_critical_shot", nil)

	self._is_critical_strike = is_critical_strike

	table.clear(self.shield_users_blocking)
	self._fire_position:store(current_position)
	self._fire_rotation:store(current_rotation)

	if not self.is_bot then
		local controller_effect = current_action.controller_effects and current_action.controller_effects.fire

		if controller_effect then
			Managers.state.controller_features:add_effect(controller_effect.effect_type, controller_effect.params)
		end
	end

	self:apply_shot_cost()

	self._num_projectiles_spawned = 0

	if current_action.alert_sound_range_fire then
		Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], current_action.alert_sound_range_fire)
	end

	local fire_sound_event = self.current_action.fire_sound_event

	if fire_sound_event then
		first_person_extension:play_hud_sound_event(fire_sound_event)
	end

	if not self.is_bot then
		Unit.flow_event(self.weapon_unit, "lua_start_shooting")
	end

	self._state = "shooting"
end

ActionRangedBase._shooting = function (self, t, action_ended)
	local num_projectiles_per_shot = self._num_projectiles_per_shot
	local num_projectiles_spawned = self._num_projectiles_spawned
	local num_shots_this_frame = num_projectiles_per_shot - num_projectiles_spawned

	if not action_ended then
		num_shots_this_frame = math.min(num_shots_this_frame, MAX_SHOTS_PER_FRAME)
	end

	self._num_projectiles_spawned = self:shoot(num_shots_this_frame, num_projectiles_spawned, num_projectiles_per_shot)

	if num_projectiles_per_shot - self._num_projectiles_spawned <= 0 then
		self._num_shots_fired = self._num_shots_fired + 1

		if self._num_shots_fired < self._num_shots_total then
			self._state = "waiting_to_shoot"
			self._time_to_shoot = t + self._burst_shot_delay
		elseif self:proc_extra_shot(t) then
			self._state = "waiting_to_shoot"
			self._time_to_shoot = t + self._extra_shot_delay
			self._extra_buff_shot = true
		else
			self._state = "finished_shooting"
		end
	end
end

ActionRangedBase._finished_shooting = function (self, t)
	if self._active_reload_time then
		local add_spread = not self._extra_buff_shot

		if self.spread_extension and add_spread and not self._spread_done then
			self.spread_extension:set_shooting()

			self._spread_done = true
		end

		local input_extension = self.input_extension

		if self._active_reload_time < t then
			local ammo_extension = self.ammo_extension

			if (input_extension:get("weapon_reload") or input_extension:get_buffer("weapon_reload")) and ammo_extension:can_reload() then
				self.status_extension:set_zooming(false)

				local weapon_extension = ScriptUnit.extension(self.weapon_unit, "weapon_system")

				weapon_extension:stop_action("reload")
			end
		elseif input_extension:get("weapon_reload") then
			input_extension:add_buffer("weapon_reload", 0)
		end
	end

	Unit.flow_event(self.weapon_unit, "lua_finish_shooting")
end

ActionRangedBase.shoot = function (self, num_shots_this_frame, shots_fired, num_shots_total)
	local spread_extension = self.spread_extension
	local current_action = self.current_action
	local current_position = self._fire_position:unbox()
	local current_rotation = self._fire_rotation:unbox()
	local num_layers_spread = current_action.num_layers_spread or 1
	local bullseye = current_action.bullseye or false
	local spread_pitch = current_action.spread_pitch or 0.8

	for i = 1, num_shots_this_frame, 1 do
		shots_fired = shots_fired + 1
		local rotation = current_rotation

		if spread_extension then
			rotation = spread_extension:get_target_style_spread(shots_fired, num_shots_total, current_rotation, num_layers_spread, bullseye, spread_pitch)
		end

		self:spawn_projectile(current_position, rotation)
	end

	return shots_fired
end

ActionRangedBase.reload = function (self, reason)
	local ammo_extension = self.ammo_extension

	if not ammo_extension then
		return
	end

	local current_action = self.current_action

	if current_action.reload_when_out_of_ammo and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload() then
		local owner_unit = self.owner_unit
		local reload_when_out_of_ammo_condition_func = current_action.reload_when_out_of_ammo_condition_func

		if not reload_when_out_of_ammo_condition_func or reload_when_out_of_ammo_condition_func(owner_unit, reason) then
			ammo_extension:start_reload(current_action.play_reload_animation)
		end
	end
end

ActionRangedBase.spawn_projectile = function (self, position, rotation)
	local current_action = self.current_action

	if current_action.projectile_info then
		self:fire_projectile(position, rotation)
	else
		local direction = Quaternion.forward(rotation)
		local result = self:fire_hitscan(position, direction, current_action.range or 30)

		if result then
			local world = self.world
			local item_name = self.item_name
			local owner_unit = self.owner_unit
			local is_server = self.is_server
			local check_buffs = self._check_buffs
			local continuous_buff_check = self._continuous_buff_check
			local data = DamageUtils.process_projectile_hit(world, item_name, owner_unit, is_server, result, current_action, direction, check_buffs, nil, self.shield_users_blocking, self._is_critical_strike, self._power_level)

			if data.buffs_checked and check_buffs and not continuous_buff_check then
				self._check_buffs = false
			end

			if data.blocked_by_unit then
				self.shield_users_blocking[data.blocked_by_unit] = true
			end
		end
	end
end

ActionRangedBase.fire_projectile = function (self, position, rotation)
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local angle = ActionUtils.pitch_from_rotation(rotation)
	local speed = current_action.speed
	local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	local lookup_data = current_action.lookup_data

	ActionUtils.spawn_player_projectile(owner_unit, position, rotation, 0, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, self._is_critical_strike, self._power_level)
end

ActionRangedBase.fire_hitscan = function (self, position, direction, range)
	local result = nil

	if self.current_action.ray_against_large_hitbox then
		result = PhysicsWorld.immediate_raycast_actors(self.physics_world, position, direction, range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only", "dynamic_collision_filter", "filter_enemy_trigger")
	else
		result = PhysicsWorld.immediate_raycast_actors(self.physics_world, position, direction, range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
	end

	return result
end

ActionRangedBase.proc_extra_shot = function (self, t)
	if not self._extra_buff_shot then
		local _, procced = self.buff_extension:apply_buffs_to_value(0, "extra_shot")

		if procced then
			return true
		end
	end

	return false
end

ActionRangedBase.gen_num_shots = function (self)
	local current_action = self.current_action
	local ammo_extension = self.ammo_extension
	local ammo_usage = current_action.ammo_usage or 1
	local max_ammo_shots = math.floor(ammo_extension:current_ammo() / ammo_usage)
	local num_shots_total = current_action.num_shots or 1
	local projectiles_per_shot = current_action.num_projectiles_per_shot or 1

	if current_action.fire_all_ammo then
		projectiles_per_shot = projectiles_per_shot * max_ammo_shots
		num_shots_total = 1
	else
		num_shots_total = math.min(num_shots_total, max_ammo_shots)
	end

	return num_shots_total, projectiles_per_shot
end

ActionRangedBase.apply_shot_cost = function (self)
	if not self._infinite_ammo and not self._extra_buff_shot then
		self:_use_ammo()
		self:_add_overcharge()
	end
end

ActionRangedBase._use_ammo = function (self)
	local ammo_extension = self.ammo_extension

	if ammo_extension and not self._extra_buff_shot then
		ammo_extension:use_ammo(self.current_action.ammo_usage)
	end
end

ActionRangedBase._add_overcharge = function (self)
	local current_action = self.current_action
	local overcharge_type = current_action.overcharge_type

	if overcharge_type then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

		self.overcharge_extension:add_charge(overcharge_amount)
	end
end

return
