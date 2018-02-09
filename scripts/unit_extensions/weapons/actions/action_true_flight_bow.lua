require("scripts/unit_extensions/weapons/projectiles/true_flight_templates")

ActionTrueFlightBow = class(ActionTrueFlightBow)
ActionTrueFlightBow.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.first_person_unit = first_person_unit
	self.weapon_unit = weapon_unit
	self.item_name = item_name
	self.is_server = is_server
	self.world = world

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	self._is_critical_strike = false

	return 
end
ActionTrueFlightBow.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	self.current_action = new_action
	self.true_flight_template_id = TrueFlightTemplates[new_action.true_flight_template].lookup_id

	assert(self.true_flight_template_id)

	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	self.num_projectiles = new_action.num_projectiles or 1
	self.multi_projectile_spread = (1 < self.num_projectiles and (new_action.multi_projectile_spread or 0.075)) or nil
	self.num_projectiles_shot = 1

	if chain_action_data then
		self.targets = chain_action_data.targets

		if not self.targets then
			self.targets = {
				chain_action_data.target
			}
		end
	end

	if action_init_data then
		self.targets = action_init_data.targets

		if not self.targets then
			self.targets = {
				action_init_data.target
			}
		end
	end

	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + (new_action.fire_time or 0)
	self.power_level = power_level
	self.extra_buff_shot = false
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

	return 
end
ActionTrueFlightBow.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		local buff_extension = self.owner_buff_extension
		local _, procced = buff_extension.apply_buffs_to_value(buff_extension, 0, StatBuffIndex.EXTRA_SHOT)
		local add_spread = not self.extra_buff_shot

		self.fire(self, current_action, add_spread)

		if procced and not self.extra_buff_shot then
			self.state = "waiting_to_shoot"
			self.time_to_shoot = t + 0.1
			self.extra_buff_shot = true
		else
			self.state = "shot"
		end

		local first_person_extension = self.first_person_extension

		if self.current_action.reset_aim_on_attack then
			first_person_extension.reset_aim_assist_multiplier(first_person_extension)
		end

		local fire_sound_event = self.current_action.fire_sound_event

		if fire_sound_event then
			local play_on_husk = self.current_action.fire_sound_on_husk

			first_person_extension.play_hud_sound_event(first_person_extension, fire_sound_event, nil, play_on_husk)
		end
	end

	return 
end
ActionTrueFlightBow.finish = function (self, reason, data)
	local owner_unit_status = ScriptUnit.extension(self.owner_unit, "status_system")
	local current_action = self.current_action

	if not data or data.new_action ~= "action_two" or data.new_sub_action ~= "default" then
		owner_unit_status.set_zooming(owner_unit_status, false)
	end

	return 
end
ActionTrueFlightBow.fire = function (self, current_action, add_spread)
	local owner_unit = self.owner_unit
	local speed = current_action.speed
	local first_person_extension = self.first_person_extension
	local position = first_person_extension.current_position(first_person_extension)
	local rotation = first_person_extension.current_rotation(first_person_extension)
	local spread_extension = self.spread_extension
	local num_projectiles = self.num_projectiles

	for i = 1, num_projectiles, 1 do
		local fire_rotation = rotation

		if spread_extension then
			if 1 < self.num_projectiles_shot then
				local spread_horizontal_angle = math.pi*(self.num_projectiles_shot%2 + 0.5)
				local shot_count_offset = (self.num_projectiles_shot ~= 1 or 0) and math.round((self.num_projectiles_shot - 1)*0.5, 0)
				local angle_offset = self.multi_projectile_spread*shot_count_offset
				fire_rotation = spread_extension.combine_spread_rotations(spread_extension, spread_horizontal_angle, angle_offset, fire_rotation)
			end

			if add_spread then
				spread_extension.set_shooting(spread_extension)
			end
		end

		local angle = DamageUtils.pitch_from_rotation(fire_rotation)
		local target_vector = Vector3.normalize(Quaternion.forward(fire_rotation))

		if 1 < i then
			speed = speed*(i*0.05 - 1)
		end

		local target_unit = self.targets and ((current_action.single_target and self.targets[1]) or self.targets[i])
		local lookup_data = current_action.lookup_data

		ActionUtils.spawn_true_flight_projectile(owner_unit, target_unit, self.true_flight_template_id, position, fire_rotation, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, nil, self._is_critical_strike, self.power_level)

		if self.ammo_extension and not self.extra_buff_shot then
			local ammo_usage = self.current_action.ammo_usage

			self.ammo_extension:use_ammo(ammo_usage)

			if self.ammo_extension:can_reload() then
				local play_reload_animation = false

				self.ammo_extension:start_reload(play_reload_animation)
			end
		end

		self.num_projectiles_shot = self.num_projectiles_shot + 1
		local overcharge_type = current_action.overcharge_type

		if overcharge_type and not self.extra_buff_shot then
			local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

			if current_action.scale_overcharge then
				self.overcharge_extension:add_charge(overcharge_amount, self.charge_level)
			else
				self.overcharge_extension:add_charge(overcharge_amount)
			end
		end

		if current_action.alert_sound_range_fire then
			Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], current_action.alert_sound_range_fire)
		end
	end

	return 
end

return 
