ActionShotgun = class(ActionShotgun, ActionBase)
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event
local MAX_SHOTS_PER_FRAME = 3

ActionShotgun.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionShotgun.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.start_gaze_rotation = QuaternionBox()
	self._fire_position = Vector3Box()
	self._fire_rotation = QuaternionBox()
end

ActionShotgun.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	self.current_action = new_action
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + new_action.fire_time
	self.active_reload_time = new_action.active_reload_time and t + new_action.active_reload_time
	local owner_unit = self.owner_unit
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local infinite_ammo = buff_extension:get_non_stacking_buff("victor_bountyhunter_passive_infinite_ammo_buff")
	self.infinite_ammo = infinite_ammo
	self.power_level = power_level
	self.owner_buff_extension = buff_extension
	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	self:_handle_critical_strike(is_critical_strike, buff_extension, hud_extension, nil, nil, nil)

	self._is_critical_strike = is_critical_strike
	local spread_template_override = new_action.spread_template_override

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end

	self._shots_fired = 0
	self._check_buffs = true
	self._spread_done = false
	self.extra_buff_shot = false
	self.shield_users_blocking = {}
	local HAS_TOBII = rawget(_G, "Tobii") and Application.user_setting("tobii_eyetracking")

	if HAS_TOBII and new_action.fire_at_gaze_setting and Application.user_setting("tobii_fire_at_gaze") then
		local eyetracking_extension = ScriptUnit.has_extension(owner_unit, "eyetracking_system")

		if eyetracking_extension then
			self.start_gaze_rotation:store(eyetracking_extension:gaze_rotation())
		end
	end
end

ActionShotgun._use_ammo = function (self)
	local current_action = self.current_action
	local ammo_extension = self.ammo_extension
	local ammo_usage = current_action.ammo_usage
	local num_shots_total = current_action.shot_count or 1

	if current_action.special_ammo_thing and not self.extra_buff_shot then
		ammo_usage = ammo_extension.current_ammo
		num_shots_total = ammo_usage
	end

	if ammo_extension and not self.extra_buff_shot and not self.infinite_ammo then
		ammo_extension:use_ammo(ammo_usage)
	end

	self._num_shots_total = num_shots_total
end

ActionShotgun._add_overcharge = function (self)
	local current_action = self.current_action
	local overcharge_type = current_action.overcharge_type

	if overcharge_type then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

		self.overcharge_extension:add_charge(overcharge_amount)
	end
end

ActionShotgun._start_shooting = function (self)
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local current_position = first_person_extension:current_position()
	local current_rotation = first_person_extension:current_rotation()

	if current_action.fire_at_gaze_setting and ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
		local eyetracking_extension = ScriptUnit.extension(owner_unit, "eyetracking_system")

		if eyetracking_extension:get_is_feature_enabled("tobii_fire_at_gaze") then
			current_rotation = self.start_gaze_rotation:unbox()
		end
	end

	self._fire_position:store(current_position)
	self._fire_rotation:store(current_rotation)

	if not Managers.player:owner(self.owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "handgun_fire"
		})
	end

	self:_use_ammo()
	self:_add_overcharge()

	if current_action.alert_sound_range_fire then
		Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], current_action.alert_sound_range_fire)
	end

	local fire_sound_event = self.current_action.fire_sound_event

	if fire_sound_event then
		first_person_extension:play_hud_sound_event(fire_sound_event)
	end

	self.state = "shooting"
end

ActionShotgun._shooting = function (self, t, final_frame)
	local num_shots_total = self._num_shots_total
	local shots_fired = self._shots_fired
	local num_shots_this_frame = num_shots_total - shots_fired

	if not final_frame then
		num_shots_this_frame = math.min(num_shots_this_frame, MAX_SHOTS_PER_FRAME)
	end

	self:_shoot(num_shots_total, num_shots_this_frame)

	local buff_extension = self.owner_buff_extension
	local _, procced = buff_extension:apply_buffs_to_value(0, "extra_shot")

	if procced and not self.extra_buff_shot then
		self.state = "waiting_to_shoot"
		self.time_to_shoot = t + 0.2
		self.extra_buff_shot = true
	elseif self._num_shots_total - self._shots_fired <= 0 then
		self.state = "shot"
	end
end

ActionShotgun._shoot = function (self, num_shots_total, num_shots_this_frame)
	local spread_extension = self.spread_extension
	local current_action = self.current_action
	local current_position = self._fire_position:unbox()
	local current_rotation = self._fire_rotation:unbox()
	local world = self.world
	local physics_world = self.physics_world
	local check_buffs = self._check_buffs
	local num_layers_spread = current_action.num_layers_spread or 1
	local bullseye = current_action.bullseye or false
	local spread_pitch = current_action.spread_pitch or 0.8
	local weapon_unit = self.weapon_unit
	local item_name = self.item_name
	local owner_unit = self.owner_unit
	local is_server = self.is_server

	for i = 1, num_shots_this_frame, 1 do
		self._shots_fired = self._shots_fired + 1
		local rotation = current_rotation

		if spread_extension then
			rotation = spread_extension:get_target_style_spread(self._shots_fired, num_shots_total, current_rotation, num_layers_spread, bullseye, spread_pitch)
		end

		local direction = Quaternion.forward(rotation)
		local result = PhysicsWorld.immediate_raycast_actors(physics_world, current_position, direction, current_action.range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")

		if result then
			local data = DamageUtils.process_projectile_hit(world, item_name, owner_unit, is_server, result, current_action, direction, check_buffs, nil, self.shield_users_blocking, self._is_critical_strike, self.power_level)

			if data.buffs_checked then
				check_buffs = check_buffs and false
			end

			if data.blocked_by_unit then
				self.shield_users_blocking[data.blocked_by_unit] = true
			end
		end

		local hit_position = (result and result[#result][1]) or current_position + direction * current_action.range

		unit_set_flow_variable(weapon_unit, "hit_position", hit_position)
		unit_set_flow_variable(weapon_unit, "trail_life", Vector3.length(hit_position - current_position) * 0.1)
		unit_flow_event(weapon_unit, "lua_bullet_trail")
		unit_flow_event(weapon_unit, "lua_bullet_trail_set")
	end

	self._check_buffs = check_buffs
end

ActionShotgun.client_owner_post_update = function (self, dt, t, world, can_damage)
	local owner_unit = self.owner_unit

	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "start_shooting"
	end

	if self.state == "start_shooting" then
		self:_start_shooting()
	end

	if self.state == "shooting" then
		self:_shooting(t, false)
	end

	if self.state == "shot" and self.active_reload_time then
		local add_spread = not self.extra_buff_shot

		if self.spread_extension and add_spread and not self._spread_done then
			self.spread_extension:set_shooting()

			self._spread_done = true
		end

		local input_extension = ScriptUnit.extension(owner_unit, "input_system")

		if self.active_reload_time < t then
			local ammo_extension = self.ammo_extension

			if (input_extension:get("weapon_reload") or input_extension:get_buffer("weapon_reload")) and ammo_extension:can_reload() then
				local weapon_extension = ScriptUnit.extension(self.weapon_unit, "weapon_system")

				weapon_extension:stop_action("reload")
			end
		elseif input_extension:get("weapon_reload") then
			input_extension:add_buffer("weapon_reload", 0)
		end
	end
end

ActionShotgun.finish = function (self, reason)
	local ammo_extension = self.ammo_extension
	local current_action = self.current_action

	if self.state == "start_shooting" then
		self:_start_shooting()
	end

	if self.state == "shooting" then
		local t = Managers.time:time("game")

		self:_shooting(t, true)
	end

	if self.spread_extension then
		self.spread_extension:reset_spread_template()
	end

	if ammo_extension and current_action.reload_when_out_of_ammo and (ammo_extension:ammo_count() == 0 or reason == "reload") and ammo_extension:can_reload() then
		local play_reload_animation = true

		ammo_extension:start_reload(play_reload_animation)
	end

	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end

return
