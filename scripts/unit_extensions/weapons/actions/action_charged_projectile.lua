-- chunkname: @scripts/unit_extensions/weapons/actions/action_charged_projectile.lua

ActionChargedProjectileUtility = {}

ActionChargedProjectileUtility.prepare_charged_projectile = function (action_data, owner_unit, weapon_unit, item_name, charge_level, power_level)
	local overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local ammo_extension = ScriptUnit.has_extension(weapon_unit, "ammo_system")
	local is_grenade = ammo_extension

	if action_data.forced_charge_level then
		charge_level = action_data.forced_charge_level
	end

	local projectile_context = {
		first_shot = true,
		overcharge_extension = overcharge_extension,
		buff_extension = buff_extension,
		ammo_extension = ammo_extension,
		item_name = item_name,
		power_level = power_level,
		owner_unit = owner_unit,
		weapon_unit = weapon_unit,
		action_data = action_data,
		charge_level = charge_level,
		is_grenade = is_grenade,
	}

	if is_grenade then
		projectile_context.extra_grenades = buff_extension:apply_buffs_to_value(0, "grenade_extra_shot")
		projectile_context.grenade_thrown = false
		projectile_context.free_grenade = false
		projectile_context.rewield_grenade = false
	end

	return projectile_context
end

ActionChargedProjectileUtility.fire_charged_projectile = function (projectile_context, is_critical_strike, last_projectile, position, rotation, gaze_settings)
	local action_data = projectile_context.action_data
	local overcharge_type = action_data.overcharge_type
	local buff_extension = projectile_context.buff_extension

	if overcharge_type and projectile_context.first_shot then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

		if is_critical_strike and buff_extension:has_buff_perk("no_overcharge_crit") then
			overcharge_amount = 0
		end

		local overcharge_extension = projectile_context.overcharge_extension

		if action_data.scale_overcharge then
			local charge_level = projectile_context.charge_level

			overcharge_extension:add_charge(overcharge_amount, charge_level)
		else
			overcharge_extension:add_charge(overcharge_amount)
		end
	end

	local owner_unit = projectile_context.owner_unit
	local trigger_wield

	if projectile_context.is_grenade then
		local ammo_usage = action_data.ammo_usage

		if not projectile_context.grenade_thrown then
			projectile_context.grenade_thrown = true

			local _, free_grenade_proc = buff_extension:apply_buffs_to_value(0, "not_consume_grenade")
			local free_grenade_perk = buff_extension:has_buff_perk("free_grenade")

			if free_grenade_proc or free_grenade_perk then
				projectile_context.free_grenade = true

				buff_extension:trigger_procs("on_grenade_use")
			end

			projectile_context.rewield_grenade = buff_extension:has_buff_perk("rewield_grenade_on_throw")

			Managers.state.achievement:trigger_event("on_grenade_thrown", owner_unit, action_data)
		end

		if last_projectile then
			if not projectile_context.free_grenade then
				projectile_context.ammo_extension:use_ammo(ammo_usage)
			end

			trigger_wield = projectile_context.rewield_grenade and "rewield_wielded_weapon" or "wield_previous_weapon"
		end
	end

	local angle
	local charge_level = projectile_context.charge_level
	local speed

	if action_data.charged_speed then
		speed = math.lerp(action_data.speed, action_data.charged_speed, math.clamp(charge_level, 0, 1))
	else
		speed = action_data.speed
	end

	local target_vector
	local weapon_unit = projectile_context.weapon_unit
	local projectile_info = action_data.projectile_info

	if projectile_info.fire_from_muzzle then
		local muzzle_name = projectile_info.muzzle_name or "fx_muzzle"
		local node = Unit.node(weapon_unit, muzzle_name)
		local muzzle_pos = Unit.world_position(weapon_unit, node)
		local life_time = 1

		if projectile_info.timed_data then
			life_time = projectile_info.timed_data.life_time
		end

		angle = ActionUtils.pitch_from_rotation(rotation)
		target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))

		local radians = math.degrees_to_radians(angle)
		local gravity = ProjectileGravitySettings[projectile_info.gravity_settings]
		local position_on_trajectory = WeaponHelper:position_on_trajectory(position, target_vector, speed / 100, radians, gravity, life_time)

		target_vector = Vector3.normalize(Vector3.flat(position_on_trajectory - muzzle_pos))
		position = muzzle_pos
	end

	local flatten_target_vector = action_data.flatten_target_vector ~= false

	if flatten_target_vector then
		angle = angle or ActionUtils.pitch_from_rotation(rotation)
		target_vector = target_vector or Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	else
		angle = 0
		target_vector = Quaternion.forward(rotation)
	end

	if action_data.fire_at_gaze_setting and action_data.throw_up_this_much_in_target_direction and ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
		local eyetracking_extension = ScriptUnit.extension(owner_unit, "eyetracking_system")

		if eyetracking_extension:get_is_feature_enabled("tobii_fire_at_gaze") then
			local hit_point = eyetracking_extension:get_gaze_rayhit()

			if hit_point then
				local dl = Vector3.distance(Vector3.flat(position), Vector3.flat(hit_point))
				local dh = position[3] - hit_point[3]
				local gravity = ProjectileGravitySettings[projectile_info.gravity_settings]
				local throw_vector = Vector3.normalize(Quaternion.forward(rotation))

				throw_vector = throw_vector + Vector3(0, 0, action_data.throw_up_this_much_in_target_direction)
				throw_vector = Vector3.normalize(throw_vector)

				local sin = -throw_vector[3]
				local cos = math.sqrt(1 - sin * sin)
				local speed_squared_limit = 22500
				local speed_squared = math.clamp(-0.5 * gravity * dl * dl / (dh * cos * cos - dl * sin * cos), 0.1, speed_squared_limit)

				speed = math.sqrt(speed_squared) * 100
			end
		end
	end

	local owner_player = Managers.player:owner(owner_unit)
	local is_bot = owner_player and owner_player.bot_player
	local throw_up_factor = action_data.throw_up_this_much_in_target_direction

	if throw_up_factor and not is_bot then
		target_vector = Vector3.normalize(target_vector + Vector3(0, 0, action_data.throw_up_this_much_in_target_direction))
	end

	local lookup_data = action_data.lookup_data
	local item_name = projectile_context.item_name
	local item_template_name = lookup_data.item_template_name
	local action_name = lookup_data.action_name
	local sub_action_name = lookup_data.sub_action_name
	local scaled_charge = math.round(math.max(charge_level, 0) * 100)
	local scale_projectile = action_data.scale_projectile ~= false
	local scale = scale_projectile and scaled_charge or 1
	local projectile_power_level = projectile_context.power_level
	local full_charge_boost = buff_extension:has_buff_perk("full_charge_boost")

	if full_charge_boost and charge_level >= 1 then
		projectile_power_level = buff_extension:apply_buffs_to_value(projectile_power_level, "full_charge_boost")
	end

	projectile_power_level = ActionUtils.scale_charged_projectile_power_level(projectile_power_level, action_data, charge_level)

	ActionUtils.spawn_player_projectile(owner_unit, position, rotation, scale, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, is_critical_strike, projectile_power_level, gaze_settings, scaled_charge)

	local fire_sound_event = action_data.fire_sound_event

	if fire_sound_event then
		local play_on_husk = action_data.fire_sound_on_husk
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension:play_hud_sound_event(fire_sound_event, nil, play_on_husk)
	end

	if action_data.alert_sound_range_fire then
		Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], action_data.alert_sound_range_fire)
	end

	if action_data.hide_weapon_after_fire then
		Unit.set_unit_visibility(weapon_unit, false)
	end

	if not projectile_info.disable_throwing_dialogue and projectile_info.pickup_name then
		local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		event_data.item_type = projectile_info.pickup_name

		dialogue_input:trigger_networked_dialogue_event("throwing_item", event_data)
	end

	projectile_context.first_shot = false

	return trigger_wield
end

ActionChargedProjectile = class(ActionChargedProjectile, ActionBase)

ActionChargedProjectile.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionChargedProjectile.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(weapon_unit, "spread_system") then
		self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	end

	self._weapon_unit = weapon_unit
end

ActionChargedProjectile.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionChargedProjectile.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local owner_unit = self.owner_unit
	local is_critical_strike = ActionUtils.is_critical_strike(self.owner_unit, new_action, t)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

	self.owner_buff_extension = buff_extension
	self.current_action = new_action
	self.state = "waiting_to_shoot"

	local chained_charge_level = chain_action_data and chain_action_data.charge_level or 0

	self._projectile_context = ActionChargedProjectileUtility.prepare_charged_projectile(new_action, owner_unit, self._weapon_unit, self.item_name, chained_charge_level, power_level)
	self.time_to_shoot = t + new_action.fire_time
	self.extra_buff_shot = false

	local spread_template_override = new_action.spread_template_override

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end

	local loaded_projectile_settings = new_action.loaded_projectile_settings

	if loaded_projectile_settings then
		local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

		inventory_extension:set_loaded_projectile_override(loaded_projectile_settings)
	end

	local is_spell = new_action.is_spell
	local charge_level = self._projectile_context.charge_level

	if charge_level and charge_level >= 1 and is_spell then
		buff_extension:trigger_procs("on_full_charge_action", new_action, t, chain_action_data)
	end

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	self:_handle_critical_strike(is_critical_strike, buff_extension, hud_extension, nil, "on_critical_shot", nil)

	self._is_critical_strike = is_critical_strike
end

ActionChargedProjectile.client_owner_post_update = function (self, dt, t, world, can_damage)
	if self.state == "waiting_to_shoot" and t >= self.time_to_shoot then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		if self:_update_extra_shots(self.owner_buff_extension, 1) then
			self.state = "waiting_to_shoot"
			self.time_to_shoot = t + 0.1
			self.extra_buff_shot = true
		else
			self.extra_buff_shot = false
			self.state = "shot"
		end

		self:_shoot(t)
		self:_proc_spell_used(self.owner_buff_extension)
	end
end

ActionChargedProjectile._update_extra_shots = function (self, buff_extension, shots_to_consume)
	local projectile_context = self._projectile_context

	if projectile_context.is_grenade then
		local extra_grenades = projectile_context.extra_grenades

		if shots_to_consume then
			projectile_context.extra_grenades = projectile_context.extra_grenades - shots_to_consume
		end

		return extra_grenades > 0
	end

	return ActionChargedProjectile.super._update_extra_shots(self, buff_extension, shots_to_consume)
end

ActionChargedProjectile._shoot = function (self, t)
	local projectile_context = self._projectile_context
	local action_data = projectile_context.action_data
	local owner_unit = self.owner_unit

	if not Managers.player:owner(self.owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "handgun_fire",
		})
	end

	local gaze_settings = false
	local first_person_unit = self.first_person_unit
	local position, rotation

	if action_data.fire_pos_rot then
		position, rotation = action_data.fire_pos_rot(action_data, first_person_unit, self.weapon_unit, owner_unit, self.world)
	else
		position = Unit.world_position(first_person_unit, 0)
		rotation = Unit.local_rotation(first_person_unit, 0)

		if action_data.fire_at_gaze_setting and ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
			local eyetracking_extension = ScriptUnit.has_extension(owner_unit, "eyetracking_system")

			if eyetracking_extension and eyetracking_extension:get_is_feature_enabled("tobii_fire_at_gaze") then
				rotation = eyetracking_extension:gaze_rotation()
				gaze_settings = true
			end
		end

		local spread_extension = self.spread_extension

		if spread_extension then
			rotation = spread_extension:get_randomised_spread(rotation)

			if projectile_context.first_shot then
				spread_extension:set_shooting()
			end
		end
	end

	local last_projectile = not self.extra_buff_shot
	local swap_weapon_on_shot = ActionChargedProjectileUtility.fire_charged_projectile(projectile_context, self._is_critical_strike, last_projectile, position, rotation, gaze_settings)
	local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

	if swap_weapon_on_shot == "wield_previous_weapon" then
		inventory_extension:wield_previous_weapon()
	elseif swap_weapon_on_shot == "rewield_wielded_weapon" then
		inventory_extension:rewield_wielded_slot()
	end
end

ActionChargedProjectile.finish = function (self, reason)
	if self.state == "waiting_to_shoot" then
		self.state = "shot"

		local t = Managers.time:time("game")
		local max_iteration_count = 5

		for i = 1, max_iteration_count do
			self:_shoot(t)
			self:_proc_spell_used(self.owner_buff_extension)

			self.extra_buff_shot = true

			if not self:_update_extra_shots(self.owner_buff_extension, 1) then
				break
			end
		end
	end

	local projectile_context = self._projectile_context
	local ammo_extension = projectile_context.ammo_extension
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if reason ~= "new_interupting_action" then
		local reload_when_out_of_ammo_condition_func = current_action.reload_when_out_of_ammo_condition_func
		local do_out_of_ammo_reload = not reload_when_out_of_ammo_condition_func and true or reload_when_out_of_ammo_condition_func(owner_unit, reason)

		if ammo_extension and current_action.reload_when_out_of_ammo and do_out_of_ammo_reload and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload() then
			ammo_extension:start_reload(true)
		end
	end

	local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

	inventory_extension:set_loaded_projectile_override(nil)

	if self.spread_extension then
		self.spread_extension:reset_spread_template()
	end

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end
