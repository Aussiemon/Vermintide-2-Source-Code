ActionShotgun = class(ActionShotgun)
ActionShotgun.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.weapon_system = weapon_system
	self.owner_unit = owner_unit
	self.first_person_unit = first_person_unit
	self.weapon_unit = weapon_unit
	self.world = world
	self.item_name = item_name
	self.wwise_world = Managers.world:wwise_world(world)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.is_server = is_server
	self._is_critical_strike = false
	self.start_gaze_rotation = QuaternionBox()

	return 
end
ActionShotgun.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	self.current_action = new_action
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + new_action.fire_time
	self.active_reload_time = new_action.active_reload_time and t + new_action.active_reload_time
	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local infinite_ammo = false
	infinite_ammo = buff_extension.get_non_stacking_buff(buff_extension, "victor_bountyhunter_passive_infinite_ammo_buff")
	self.power_level = (is_critical_strike and buff_extension.apply_buffs_to_value(buff_extension, power_level, StatBuffIndex.CRITICAL_STRIKE_EFFECTIVENESS)) or power_level
	self.owner_buff_extension = buff_extension

	if is_critical_strike then
		Unit.flow_event(owner_unit, "vfx_critical_strike")
		Unit.flow_event(first_person_unit, "vfx_critical_strike")

		local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = true
		end
	end

	self._is_critical_strike = is_critical_strike
	local spread_template_override = new_action.spread_template_override

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end

	self.extra_buff_shot = false
	self.shield_users_blocking = {}
	self.infinite_ammo = infinite_ammo
	local HAS_TOBII = rawget(_G, "Tobii") and Application.user_setting("tobii_eyetracking")

	if HAS_TOBII and new_action.fire_at_gaze_setting and Application.user_setting("tobii_fire_at_gaze") then
		local owner_unit = self.owner_unit

		if ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
			local eyetracking_extension = ScriptUnit.extension(owner_unit, "eyetracking_system")

			self.start_gaze_rotation:store(eyetracking_extension.gaze_rotation(eyetracking_extension))
		end
	end

	return 
end
ActionShotgun.client_owner_post_update = function (self, dt, t, world, can_damage)
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local is_server = self.is_server

	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		local world = self.world
		local spread_extension = self.spread_extension
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local current_position = first_person_extension.current_position(first_person_extension)
		local current_rotation = first_person_extension.current_rotation(first_person_extension)

		if current_action.fire_at_gaze_setting and ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
			local eyetracking_extension = ScriptUnit.extension(owner_unit, "eyetracking_system")

			if eyetracking_extension.get_is_feature_enabled(eyetracking_extension, "tobii_fire_at_gaze") then
				current_rotation = self.start_gaze_rotation:unbox()
			end
		end

		num_shots = current_action.shot_count or 1
		local ammo_usage = current_action.ammo_usage

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "handgun_fire"
			})
		end

		if current_action.special_ammo_thing and not self.extra_buff_shot then
			ammo_usage = self.ammo_extension.current_ammo
			num_shots = ammo_usage
		end

		local physics_world = World.get_data(world, "physics_world")
		local check_buffs = true
		local num_layers_spread = current_action.num_layers_spread or 1
		local bullseye = current_action.bullseye or false
		local spread_pitch = current_action.spread_pitch or 0.8
		local weapon_unit = self.weapon_unit

		for i = 1, num_shots, 1 do
			local rotation = current_rotation

			if spread_extension then
				rotation = spread_extension.get_target_style_spread(spread_extension, i, num_shots, current_rotation, num_layers_spread, bullseye, spread_pitch)
			end

			local direction = Quaternion.forward(rotation)
			local collision_filter = "filter_player_ray_projectile"
			local result = PhysicsWorld.immediate_raycast_actors(physics_world, current_position, direction, current_action.range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")

			if result then
				local data = DamageUtils.process_projectile_hit(world, self.item_name, owner_unit, is_server, result, current_action, direction, check_buffs, nil, self.shield_users_blocking, self._is_critical_strike, self.power_level)

				if data.buffs_checked then
					check_buffs = check_buffs and false
				end

				if data.blocked_by_unit then
					self.shield_users_blocking[data.blocked_by_unit] = true
				end
			end

			hit_position = (result and result[#result][1]) or current_position + direction * current_action.range

			Unit.set_flow_variable(weapon_unit, "hit_position", hit_position)
			Unit.set_flow_variable(weapon_unit, "trail_life", Vector3.length(hit_position - current_position) * 0.1)
			Unit.flow_event(weapon_unit, "lua_bullet_trail")
			Unit.flow_event(weapon_unit, "lua_bullet_trail_set")
		end

		local add_spread = not self.extra_buff_shot

		if spread_extension and add_spread then
			spread_extension.set_shooting(spread_extension)
		end

		if current_action.alert_sound_range_fire then
			Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], current_action.alert_sound_range_fire)
		end

		local overcharge_type = current_action.overcharge_type

		if overcharge_type then
			local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

			self.overcharge_extension:add_charge(overcharge_amount)
		end

		if self.ammo_extension and not self.extra_buff_shot and not self.infinite_ammo then
			self.ammo_extension:use_ammo(ammo_usage)
		end

		local buff_extension = self.owner_buff_extension
		local _, procced = buff_extension.apply_buffs_to_value(buff_extension, 0, StatBuffIndex.EXTRA_SHOT)

		if procced and not self.extra_buff_shot then
			self.state = "waiting_to_shoot"
			self.time_to_shoot = t + 0.2
			self.extra_buff_shot = true
		else
			self.state = "shot"
		end

		local fire_sound_event = self.current_action.fire_sound_event

		if fire_sound_event then
			local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

			first_person_extension.play_hud_sound_event(first_person_extension, fire_sound_event)
		end
	end

	if self.state == "shot" and self.active_reload_time then
		local input_extension = ScriptUnit.extension(owner_unit, "input_system")

		if self.active_reload_time < t then
			local ammo_extension = self.ammo_extension

			if (input_extension.get(input_extension, "weapon_reload") or input_extension.get_buffer(input_extension, "weapon_reload")) and ammo_extension.can_reload(ammo_extension) then
				local weapon_extension = ScriptUnit.extension(self.weapon_unit, "weapon_system")

				weapon_extension.stop_action(weapon_extension, "reload")
			end
		elseif input_extension.get(input_extension, "weapon_reload") then
			input_extension.add_buffer(input_extension, "weapon_reload", 0)
		end
	end

	return 
end
ActionShotgun.finish = function (self, reason)
	local ammo_extension = self.ammo_extension
	local current_action = self.current_action

	if self.spread_extension then
		self.spread_extension:reset_spread_template()
	end

	if ammo_extension and current_action.reload_when_out_of_ammo and (ammo_extension.ammo_count(ammo_extension) == 0 or reason == "reload") and ammo_extension.can_reload(ammo_extension) then
		local play_reload_animation = true

		ammo_extension.start_reload(ammo_extension, play_reload_animation)
	end

	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end

	return 
end

return 
