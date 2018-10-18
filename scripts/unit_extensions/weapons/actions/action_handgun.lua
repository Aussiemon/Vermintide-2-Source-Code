ActionHandgun = class(ActionHandgun)

ActionHandgun.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.weapon_system = weapon_system
	self.owner_unit = owner_unit
	self.first_person_unit = first_person_unit
	self.weapon_unit = weapon_unit
	self.world = world
	self.item_name = item_name
	self.wwise_world = Managers.world:wwise_world(world)
	self.trail_end_position_variable = World.find_particles_variable(world, "fx/wpnfx_pistol_bullet_trail", "size")
	self.is_server = is_server
	self._is_critical_strike = false
end

ActionHandgun.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
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

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + new_action.fire_time
	self.extra_buff_shot = false
	self.ammo_usage = new_action.ammo_usage
	self.overcharge_type = new_action.overcharge_type
	self.used_ammo = false
	self.active_reload_time = new_action.active_reload_time and t + new_action.active_reload_time

	if is_critical_strike then
		Unit.flow_event(owner_unit, "vfx_critical_strike")
		Unit.flow_event(first_person_unit, "vfx_critical_strike")

		local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = true
		end
	end

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

			self.overcharge_extension:add_charge(overcharge_amount)
		end
	end

	if self.state == "shooting" then
		local world = self.world
		local buff_extension = self.owner_buff_extension
		local _, procced = buff_extension:apply_buffs_to_value(0, StatBuffIndex.EXTRA_SHOT)
		local add_spread = not self.extra_buff_shot

		if not self.extra_buff_shot and procced then
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
		local position = first_person_extension:current_position()
		local rotation = first_person_extension:current_rotation()

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

		if current_action.ray_against_large_hitbox then
			result = PhysicsWorld.immediate_raycast_actors(physics_world, position, direction, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only", "dynamic_collision_filter", "filter_enemy_trigger")
		else
			result = PhysicsWorld.immediate_raycast_actors(physics_world, position, direction, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
		end

		local is_server = self.is_server

		if result then
			DamageUtils.process_projectile_hit(world, self.item_name, owner_unit, is_server, result, current_action, direction, true, nil, nil, self._is_critical_strike, self.power_level)
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

		if ammo_extension and current_action.reload_when_out_of_ammo and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload() then
			ammo_extension:start_reload(true)
		end
	end

	self.charge_multiplier = nil
	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end

return
