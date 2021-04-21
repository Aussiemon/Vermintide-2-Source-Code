ActionHandgun = class(ActionHandgun, ActionBase)

ActionHandgun.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionHandgun.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.trail_end_position_variable = World.find_particles_variable(world, "fx/wpnfx_pistol_bullet_trail", "size")
	self.career_extension = ScriptUnit.extension(self.owner_unit, "career_system")
end

ActionHandgun.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionHandgun.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.current_action = new_action
	self.power_level = power_level

	if new_action.use_beam_consecutive_hits and chain_action_data and chain_action_data.beam_consecutive_hits then
		self.charge_multiplier = 0.3 + 0.7 * math.clamp(chain_action_data.beam_consecutive_hits / 3, 0, 1)
		self.power_level = self.power_level * self.charge_multiplier
	end

	self.owner_buff_extension = buff_extension

	if not Managers.player:owner(self.owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "light_swing"
		})
	end

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	if ScriptUnit.has_extension(weapon_unit, "spread_system") then
		self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	end

	local spread_template_override = new_action.spread_template_override

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + new_action.fire_time
	self.extra_buff_shot = false
	self.ammo_usage = new_action.ammo_usage
	self.overcharge_type = new_action.overcharge_type
	self.uses_ability_cooldown = new_action.use_ability_cooldown
	self.used_ammo = false
	self.active_reload_time = new_action.active_reload_time and t + new_action.active_reload_time
	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	self:_handle_critical_strike(is_critical_strike, buff_extension, hud_extension, nil, "on_critical_shot", nil)

	self._is_critical_strike = is_critical_strike
end

ActionHandgun.client_owner_post_update = function (self, dt, t, world, can_damage)
	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local current_action = self.current_action

	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "shooting"

		if self.ammo_extension and not self.extra_buff_shot and self.ammo_usage then
			local ammo_usage = self.ammo_usage

			self.ammo_extension:use_ammo(ammo_usage)
		end

		local overcharge_type = self.overcharge_type

		if overcharge_type then
			local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type] * (self.charge_multiplier or 1)
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			if self._is_critical_strike and buff_extension:has_buff_perk("no_overcharge_crit") then
				overcharge_amount = 0
			end

			self.overcharge_extension:add_charge(overcharge_amount)
		end

		if self.uses_ability_cooldown then
			self.career_extension:reduce_activated_ability_cooldown(-self.ammo_usage)
		end
	end

	if self.state == "shooting" then
		local procced = self:_check_extra_shot_proc(self.owner_buff_extension)
		local add_spread = not self.extra_buff_shot

		if procced then
			self.state = "waiting_to_shoot"
			self.time_to_shoot = t + 0.1
			self.extra_buff_shot = true
		else
			self.state = "shot"
		end

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "handgun_fire"
			})
		end

		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local position, rotation = first_person_extension:get_projectile_start_position_rotation()

		if current_action.fire_at_gaze_setting and ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
			local eyetracking_extension = ScriptUnit.extension(owner_unit, "eyetracking_system")

			if eyetracking_extension:get_is_feature_enabled("tobii_fire_at_gaze") then
				rotation = eyetracking_extension:gaze_rotation()
			end
		end

		local spread_extension = self.spread_extension

		if spread_extension then
			rotation = spread_extension:get_randomised_spread(rotation)

			if add_spread then
				spread_extension:set_shooting()
			end
		end

		local physics_world = World.get_data(world, "physics_world")
		local auto_hit_chance = current_action.aim_assist_auto_hit_chance or 0
		local direction = nil

		if math.random() <= auto_hit_chance and Managers.input:is_device_active("gamepad") and ScriptUnit.has_extension(owner_unit, "smart_targeting_system") then
			local targeting_extension = ScriptUnit.extension(owner_unit, "smart_targeting_system")
			local targeting_data = targeting_extension:get_targeting_data()
			local target_position = targeting_data.target_position

			if target_position then
				direction = Vector3.normalize(target_position - position)
			end
		end

		direction = direction or Quaternion.forward(rotation)
		local result = nil

		if current_action.projectile_info then
			local angle = ActionUtils.pitch_from_rotation(rotation)
			local speed = current_action.speed
			local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
			local lookup_data = current_action.lookup_data

			ActionUtils.spawn_player_projectile(owner_unit, position, rotation, 0, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, self._is_critical_strike, self.power_level)
		else
			if current_action.ray_against_large_hitbox then
				result = PhysicsWorld.immediate_raycast_actors(physics_world, position, direction, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only", "dynamic_collision_filter", "filter_enemy_trigger")
			else
				result = PhysicsWorld.immediate_raycast_actors(physics_world, position, direction, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
			end

			local is_server = self.is_server

			if result then
				DamageUtils.process_projectile_hit(world, self.item_name, owner_unit, is_server, result, current_action, direction, true, nil, nil, self._is_critical_strike, self.power_level)
			end
		end

		if self.current_action.reset_aim_on_attack then
			first_person_extension:reset_aim_assist_multiplier()
		end

		local fire_sound_event = self.current_action.fire_sound_event

		if fire_sound_event then
			first_person_extension:play_hud_sound_event(fire_sound_event)
		end

		if current_action.alert_sound_range_fire then
			Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], current_action.alert_sound_range_fire)
		end

		local hit_position = (result and result[#result][1]) or position + direction * 100

		Unit.set_flow_variable(weapon_unit, "hit_position", hit_position)
		Unit.set_flow_variable(weapon_unit, "trail_life", Vector3.length(hit_position - position) * 0.1)
		Unit.flow_event(weapon_unit, "lua_bullet_trail")
		Unit.flow_event(weapon_unit, "lua_bullet_trail_set")
	end

	if self.state == "shot" and self.active_reload_time then
		local input_extension = ScriptUnit.extension(owner_unit, "input_system")

		if self.active_reload_time < t then
			local ammo_extension = self.ammo_extension

			if (input_extension:get("weapon_reload") or input_extension:get_buffer("weapon_reload")) and ammo_extension:can_reload() then
				local status_extension = ScriptUnit.extension(owner_unit, "status_system")

				status_extension:set_zooming(false)

				local weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

				weapon_extension:stop_action("reload")
			end
		elseif input_extension:get("weapon_reload") then
			input_extension:add_buffer("weapon_reload", 0)
		end
	end
end

ActionHandgun.finish = function (self, reason)
	local ammo_extension = self.ammo_extension
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if reason ~= "new_interupting_action" then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)

		local reload_when_out_of_ammo_condition_func = current_action.reload_when_out_of_ammo_condition_func
		local do_out_of_ammo_reload = (not reload_when_out_of_ammo_condition_func and true) or reload_when_out_of_ammo_condition_func(owner_unit, reason)

		if ammo_extension and current_action.reload_when_out_of_ammo and do_out_of_ammo_reload and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload() then
			ammo_extension:start_reload(true)
		end
	end

	if current_action.keep_block then
		if not LEVEL_EDITOR_TEST then
			local go_id = Managers.state.unit_storage:go_id(owner_unit)

			if self.is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, false)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, false)
			end
		end

		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_blocking(false)
	end

	self.charge_multiplier = nil
	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end

	if self.spread_extension then
		self.spread_extension:reset_spread_template()
	end
end

return
