-- chunkname: @scripts/unit_extensions/weapons/actions/action_grenade_thrower.lua

ActionGrenadeThrower = class(ActionGrenadeThrower, ActionBase)

ActionGrenadeThrower.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionGrenadeThrower.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
end

ActionGrenadeThrower.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionGrenadeThrower.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local owner_unit = self.owner_unit
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

	self.power_level = power_level
	self.owner_buff_extension = buff_extension
	self.current_action = new_action
	self.extra_buff_shot = false
	self.num_projectiles = new_action.num_projectiles
	self.multi_projectile_spread = new_action.multi_projectile_spread or 0.075

	if self.ammo_extension and self.num_projectiles then
		self.num_projectiles = math.min(self.num_projectiles, self.ammo_extension:current_ammo())
	end

	self.num_projectiles_shot = 1
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + (new_action.fire_time or 0)
	self.active_reload_time = new_action.active_reload_time and t + new_action.active_reload_time

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	self:_handle_critical_strike(is_critical_strike, buff_extension, hud_extension, nil, "on_critical_shot", nil)

	self._is_critical_strike = is_critical_strike
end

ActionGrenadeThrower.client_owner_post_update = function (self, dt, t, world, can_damage)
	if self.state == "waiting_to_shoot" and t >= self.time_to_shoot then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		local owner_unit = self.owner_unit

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "crossbow_fire",
			})
		end

		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local position, rotation = first_person_extension:get_projectile_start_position_rotation()
		local spread_extension = self.spread_extension
		local current_action = self.current_action

		if spread_extension then
			rotation = spread_extension:get_randomised_spread(rotation)

			spread_extension:set_shooting()
		end

		local angle = ActionUtils.pitch_from_rotation(rotation)
		local speed = current_action.speed
		local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
		local lookup_data = current_action.lookup_data

		ActionUtils.spawn_player_projectile(owner_unit, position, rotation, 0, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, self._is_critical_strike, self.power_level)

		local fire_sound_event = self.current_action.fire_sound_event

		if fire_sound_event then
			first_person_extension:play_hud_sound_event(fire_sound_event)
		end

		if self.ammo_extension and not self.extra_buff_shot then
			local ammo_usage = current_action.ammo_usage
			local is_grenade = ItemMasterList[self.item_name].item_type == "grenade"
			local _, procced = self.owner_buff_extension:apply_buffs_to_value(0, "not_consume_grenade")

			if procced and is_grenade then
				self.ammo_extension:add_ammo_to_reserve(ammo_usage)
			end

			self.ammo_extension:use_ammo(ammo_usage)
		end

		local add_spread = not self.extra_buff_shot

		if self:_update_extra_shots(self.owner_buff_extension, 1) then
			self.state = "waiting_to_shoot"
			self.time_to_shoot = t + 0.1
			self.extra_buff_shot = true
		else
			self.state = "shot"
		end

		first_person_extension:reset_aim_assist_multiplier()
	end

	if self.state == "shot" and self.active_reload_time then
		local owner_unit = self.owner_unit
		local input_extension = ScriptUnit.extension(owner_unit, "input_system")

		if t > self.active_reload_time then
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

ActionGrenadeThrower.finish = function (self, reason)
	local ammo_extension = self.ammo_extension
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if reason ~= "new_interupting_action" then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)

		local reload_when_out_of_ammo_condition_func = current_action.reload_when_out_of_ammo_condition_func
		local do_out_of_ammo_reload = not reload_when_out_of_ammo_condition_func and true or reload_when_out_of_ammo_condition_func(owner_unit, reason)

		if ammo_extension and current_action.reload_when_out_of_ammo and do_out_of_ammo_reload and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload() then
			local play_reload_animation = true

			ammo_extension:start_reload(play_reload_animation)
		end
	end

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end
