ActionChargedProjectile = class(ActionChargedProjectile)
ActionChargedProjectile.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.world = world
	self.owner_unit = owner_unit
	self.weapon_unit = weapon_unit
	self.item_name = item_name
	self.first_person_unit = first_person_unit
	self.wwise_world = Managers.world:wwise_world(world)
	self.is_server = is_server
	self.network_manager = Managers.state.network

	if ScriptUnit.has_extension(weapon_unit, "spread_system") then
		self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	end

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self._is_critical_strike = false

	return 
end
ActionChargedProjectile.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local is_critical_strike = ActionUtils.is_critical_strike(self.owner_unit, new_action, t)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.power_level = power_level
	self.owner_buff_extension = buff_extension
	self.current_action = new_action
	self.state = "waiting_to_shoot"

	if not new_action.forced_charge_level then
		if chain_action_data then
			self.charge_level = chain_action_data.charge_level
		else
			self.charge_level = 0
		end
	else
		self.charge_level = new_action.forced_charge_level
	end

	self.time_to_shoot = t + new_action.fire_time
	self.extra_buff_shot = false
	local spread_template_override = new_action.spread_template_override

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end

	local loaded_projectile_settings = new_action.loaded_projectile_settings

	if loaded_projectile_settings then
		local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

		inventory_extension.set_loaded_projectile_override(inventory_extension, loaded_projectile_settings)
	end

	if is_critical_strike then
		Unit.flow_event(owner_unit, "vfx_critical_strike")
		Unit.flow_event(first_person_unit, "vfx_critical_strike")

		local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = true
		end
	end

	self._is_critical_strike = is_critical_strike

	return 
end
ActionChargedProjectile.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		local overcharge_type = current_action.overcharge_type

		if overcharge_type and not self.extra_buff_shot then
			local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

			if current_action.scale_overcharge then
				self.overcharge_extension:add_charge(overcharge_amount, self.charge_level)
			else
				self.overcharge_extension:add_charge(overcharge_amount)
			end
		end

		if self.ammo_extension then
			local ammo_usage = self.current_action.ammo_usage
			local _, procced = self.owner_buff_extension:apply_buffs_to_value(0, StatBuffIndex.NOT_CONSUME_GRENADE)

			if not procced then
				self.ammo_extension:use_ammo(ammo_usage)
			else
				local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

				inventory_extension.wield_previous_weapon(inventory_extension)
			end
		end

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "handgun_fire"
			})
		end

		local _, procced = self.owner_buff_extension:apply_buffs_to_value(0, StatBuffIndex.EXTRA_SHOT)
		local add_spread = not self.extra_buff_shot

		if procced and not self.extra_buff_shot then
			self.state = "waiting_to_shoot"
			self.time_to_shoot = t + 0.1
			self.extra_buff_shot = true
		else
			self.state = "shot"
		end

		local network_manager = self.network_manager
		local owner_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
		local first_person_unit = self.first_person_unit
		local position = Unit.world_position(first_person_unit, 0)
		local rotation = Unit.local_rotation(first_person_unit, 0)
		local gaze_settings = nil

		if current_action.fire_at_gaze_setting and ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
			local eyetracking_extension = ScriptUnit.extension(owner_unit, "eyetracking_system")

			if eyetracking_extension.get_is_feature_enabled(eyetracking_extension, "tobii_fire_at_gaze") then
				rotation = eyetracking_extension.gaze_rotation(eyetracking_extension)
				gaze_settings = true
			end
		end

		local spread_extension = self.spread_extension

		if spread_extension then
			rotation = spread_extension.get_randomised_spread(spread_extension, rotation)

			if add_spread then
				spread_extension.set_shooting(spread_extension)
			end
		end

		local angle = DamageUtils.pitch_from_rotation(rotation)
		local speed = current_action.speed
		local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
		local projectile_info = current_action.projectile_info

		if projectile_info.fire_from_muzzle then
			local unit = self.weapon_unit
			local muzzle_name = projectile_info.muzzle_name or "fx_muzzle"
			local node = Unit.node(unit, muzzle_name)
			local muzzle_pos = Unit.world_position(unit, node)
			local life_time = 1

			if projectile_info.timed_data then
				life_time = projectile_info.timed_data.life_time
			end

			local radians = math.degrees_to_radians(angle)
			local gravity = ProjectileGravitySettings[projectile_info.gravity_settings]
			local position_on_trajectory = WeaponHelper:position_on_trajectory(position, target_vector, speed / 100, radians, gravity, life_time)
			target_vector = Vector3.normalize(Vector3.flat(position_on_trajectory - muzzle_pos))
			position = muzzle_pos
		end

		if current_action.fire_at_gaze_setting and current_action.throw_up_this_much_in_target_direction and ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
			local eyetracking_extension = ScriptUnit.extension(owner_unit, "eyetracking_system")

			if eyetracking_extension.get_is_feature_enabled(eyetracking_extension, "tobii_fire_at_gaze") then
				local hit_point = eyetracking_extension.get_gaze_rayhit(eyetracking_extension)

				if hit_point then
					local dl = Vector3.distance(Vector3.flat(position), Vector3.flat(hit_point))
					local dh = position[3] - hit_point[3]
					local gravity = ProjectileGravitySettings[projectile_info.gravity_settings]
					local throw_vector = Vector3.normalize(Quaternion.forward(rotation))
					throw_vector = throw_vector + Vector3(0, 0, current_action.throw_up_this_much_in_target_direction)
					throw_vector = Vector3.normalize(throw_vector)
					local sin = -throw_vector[3]
					local cos = math.sqrt(1 - sin * sin)
					local speed_squared_limit = 22500
					local speed_squared = math.clamp((-0.5 * gravity * dl * dl) / (dh * cos * cos - dl * sin * cos), 0.1, speed_squared_limit)
					speed = math.sqrt(speed_squared) * 100
				end
			end
		end

		local owner_player = Managers.player:owner(owner_unit)
		local is_bot = owner_player and owner_player.bot_player
		local throw_up_factor = current_action.throw_up_this_much_in_target_direction

		if throw_up_factor and not is_bot then
			target_vector = Vector3.normalize(target_vector + Vector3(0, 0, current_action.throw_up_this_much_in_target_direction))
		end

		local lookup_data = current_action.lookup_data
		local item_name = self.item_name
		local item_template_name = lookup_data.item_template_name
		local action_name = lookup_data.action_name
		local sub_action_name = lookup_data.sub_action_name
		local charge_level = self.charge_level
		local scale = math.round(math.max(charge_level, 0) * 100)
		local projectile_power_level = self.power_level

		if current_action.scale_power_level then
			projectile_power_level = math.max(current_action.scale_power_level, self.charge_level) * projectile_power_level
		end

		local item_data = ItemMasterList[item_name]
		local item_template = BackendUtils.get_item_template(item_data)

		ActionUtils.spawn_player_projectile(owner_unit, position, rotation, scale, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, self._is_critical_strike, projectile_power_level, gaze_settings)

		local fire_sound_event = self.current_action.fire_sound_event

		if fire_sound_event then
			local play_on_husk = self.current_action.fire_sound_on_husk
			local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

			first_person_extension.play_hud_sound_event(first_person_extension, fire_sound_event, nil, play_on_husk)
		end

		if current_action.alert_sound_range_fire then
			Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], current_action.alert_sound_range_fire)
		end

		if current_action.hide_weapon_after_fire then
			Unit.set_unit_visibility(self.weapon_unit, false)
		end

		if projectile_info.pickup_name then
			local dialogue_input = ScriptUnit.extension_input(self.owner_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			event_data.item_type = projectile_info.pickup_name

			dialogue_input.trigger_networked_dialogue_event(dialogue_input, "throwing_item", event_data)
		end
	end

	return 
end
ActionChargedProjectile.finish = function (self, reason)
	local owner_unit = self.owner_unit
	local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

	inventory_extension.set_loaded_projectile_override(inventory_extension, nil)

	if self.spread_extension then
		self.spread_extension:reset_spread_template()
	end

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end

	return 
end

return 
