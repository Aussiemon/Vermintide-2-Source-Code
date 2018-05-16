ActionCrossbow = class(ActionCrossbow)

ActionCrossbow.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.weapon_unit = weapon_unit
	self.first_person_unit = first_person_unit
	self.is_server = is_server
	self.item_name = item_name
	self.wwise_world = Managers.world:wwise_world(world)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	self._is_critical_strike = false
end

ActionCrossbow.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.power_level = power_level
	self.owner_buff_extension = buff_extension
	self.current_action = new_action
	self.num_projectiles = new_action.num_projectiles
	self.multi_projectile_spread = new_action.multi_projectile_spread or 0.075

	if self.ammo_extension and self.num_projectiles then
		self.num_projectiles = math.min(self.num_projectiles, self.ammo_extension.current_ammo)
	end

	self.num_projectiles_shot = 1
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + (new_action.fire_time or 0)
	self.extra_buff_shot = false
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

ActionCrossbow.client_owner_post_update = function (self, dt, t, world, can_damage)
	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		local owner_unit = self.owner_unit
		local add_spread = not self.extra_buff_shot

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "crossbow_fire"
			})
		end

		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local rotation = first_person_extension:current_rotation()
		local spread_extension = self.spread_extension
		local current_action = self.current_action

		if self.num_projectiles then
			for i = 1, self.num_projectiles, 1 do
				local fire_rotation = rotation
				local current_action = self.current_action
				local speed = current_action.speed

				if spread_extension then
					if current_action.burst and not current_action.no_burst_spread then
						if spread_extension then
							fire_rotation = spread_extension:get_randomised_spread(rotation)
						end
					elseif self.num_projectiles_shot > 1 and not current_action.burst then
						local spread_horizontal_angle = math.pi * (self.num_projectiles_shot % 2 + 0.5)
						local shot_count_offset = (self.num_projectiles_shot == 1 and 0) or math.round((self.num_projectiles_shot - 1) / 2, 0)
						local angle_offset = self.multi_projectile_spread * shot_count_offset
						fire_rotation = spread_extension:combine_spread_rotations(spread_horizontal_angle, angle_offset, fire_rotation)
					end

					if add_spread then
						spread_extension:set_shooting()
					end
				end

				local angle = ActionUtils.pitch_from_rotation(fire_rotation)
				local position = first_person_extension:current_position()
				local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(fire_rotation)))
				local projectile_info = current_action.projectile_info
				local lookup_data = current_action.lookup_data

				ActionUtils.spawn_player_projectile(owner_unit, position, fire_rotation, 0, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, self._is_critical_strike, self.power_level)

				local fire_sound_event = self.current_action.fire_sound_event
				local unit_fire_sound_event = self.current_action.unit_fire_sound_event

				if fire_sound_event then
					local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

					first_person_extension:play_hud_sound_event(fire_sound_event)
				end

				if unit_fire_sound_event then
					local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

					first_person_extension:play_sound_event(unit_fire_sound_event)
				end

				if self.ammo_extension and not self.extra_buff_shot then
					local ammo_usage = current_action.ammo_usage

					self.ammo_extension:use_ammo(ammo_usage)
				end

				self.num_projectiles_shot = self.num_projectiles_shot + 1

				if current_action.burst then
					break
				end
			end
		else
			if spread_extension then
				rotation = spread_extension:get_randomised_spread(rotation)

				if add_spread then
					spread_extension:set_shooting()
				end
			end

			local angle = ActionUtils.pitch_from_rotation(rotation)
			local current_action = self.current_action
			local speed = current_action.speed
			local position = first_person_extension:current_position()
			local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
			local projectile_info = current_action.projectile_info
			local lookup_data = current_action.lookup_data

			ActionUtils.spawn_player_projectile(owner_unit, position, rotation, 0, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, self._is_critical_strike, self.power_level)

			local fire_sound_event = self.current_action.fire_sound_event

			if fire_sound_event then
				local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

				first_person_extension:play_hud_sound_event(fire_sound_event)
			end

			if self.ammo_extension and not self.extra_buff_shot then
				local ammo_usage = current_action.ammo_usage

				self.ammo_extension:use_ammo(ammo_usage)
			end
		end

		local buff_extension = self.owner_buff_extension
		local _, procced = buff_extension:apply_buffs_to_value(0, StatBuffIndex.EXTRA_SHOT)

		if current_action.apply_burst_recoil then
			local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

			if self.num_projectiles_shot == 2 then
				first_person_extension:apply_recoil()
				first_person_extension:play_camera_recoil(current_action.first_recoil_settings, t)
			else
				first_person_extension:apply_recoil()
				first_person_extension:play_camera_recoil(current_action.recoil_settings, t)
			end
		end

		if procced and not self.extra_buff_shot then
			self.state = "waiting_to_shoot"
			self.time_to_shoot = t + 0.1
			self.extra_buff_shot = true
		elseif current_action.burst and self.num_projectiles_shot <= self.num_projectiles then
			self.state = "waiting_to_shoot"
			self.time_to_shoot = t + 0.075
		else
			self.state = "shot"
		end

		first_person_extension:reset_aim_assist_multiplier()
	end

	if self.state == "shot" and self.active_reload_time then
		local owner_unit = self.owner_unit
		local input_extension = ScriptUnit.extension(owner_unit, "input_system")

		if self.active_reload_time < t then
			local ammo_extension = self.ammo_extension

			if (input_extension:get("weapon_reload") or input_extension:get_buffer("weapon_reload")) and ammo_extension:can_reload() then
				local status_extension = ScriptUnit.extension(self.owner_unit, "status_system")

				status_extension:set_zooming(false)

				local weapon_extension = ScriptUnit.extension(self.weapon_unit, "weapon_system")

				weapon_extension:stop_action("reload")
			end
		elseif input_extension:get("weapon_reload") then
			input_extension:add_buffer("weapon_reload", 0)
		end
	end
end

ActionCrossbow.finish = function (self, reason)
	local ammo_extension = self.ammo_extension
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if reason ~= "new_interupting_action" then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)

		if ammo_extension and current_action.reload_when_out_of_ammo and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload() then
			local play_reload_animation = true

			ammo_extension:start_reload(play_reload_animation)
		end

		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)
	end

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end

return
