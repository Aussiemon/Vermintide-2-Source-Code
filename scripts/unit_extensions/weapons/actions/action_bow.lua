﻿-- chunkname: @scripts/unit_extensions/weapons/actions/action_bow.lua

ActionBow = class(ActionBow, ActionBase)

ActionBow.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionBow.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
end

ActionBow.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionBow.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local owner_unit = self.owner_unit
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

	self.owner_buff_extension = buff_extension
	self.current_action = new_action
	self.power_level = power_level

	local input_extension = ScriptUnit.extension(owner_unit, "input_system")

	input_extension:reset_input_buffer()

	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + (new_action.fire_time or 0)
	self.time_to_unzoom = new_action.unzoom_time and t + new_action.unzoom_time or nil
	self.extra_buff_shot = false

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	self:_handle_critical_strike(is_critical_strike, buff_extension, hud_extension, nil, "on_critical_shot", nil)

	self._is_critical_strike = is_critical_strike
end

ActionBow.reload = function (self, current_action)
	if self.ammo_extension:can_reload() then
		local play_reload_animation = current_action.play_reload_animation

		self.ammo_extension:start_reload(play_reload_animation, current_action.override_reload_time)

		self.time_to_reload = nil
	end
end

ActionBow.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action

	if self.time_to_unzoom and t >= self.time_to_unzoom then
		local owner_unit = self.owner_unit
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)
	end

	if self.state == "waiting_to_shoot" and t >= self.time_to_shoot then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		local add_spread = not self.extra_buff_shot

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "bow_fire",
			})
		end

		local has_extra_shot = not current_action.career_skill and self:_update_extra_shots(self.owner_buff_extension, 1)

		self:fire(current_action, add_spread)

		if self.ammo_extension and not self.extra_buff_shot then
			local ammo_usage = self.current_action.ammo_usage

			self.ammo_extension:use_ammo(ammo_usage)

			if current_action.reload_event_delay_time then
				self.time_to_reload = t + current_action.reload_event_delay_time
			else
				self:reload(current_action)
			end
		end

		if has_extra_shot then
			self.state = "waiting_to_shoot"
			self.time_to_shoot = t + 0.1
			self.extra_buff_shot = true
		else
			self.state = "shot"
		end

		local first_person_extension = ScriptUnit.extension(self.owner_unit, "first_person_system")

		if self.current_action.reset_aim_on_attack then
			first_person_extension:reset_aim_assist_multiplier()
		end

		local fire_sound_event = self.current_action.fire_sound_event

		if fire_sound_event then
			first_person_extension:play_hud_sound_event(fire_sound_event)
		end
	end

	if self.time_to_reload and t > self.time_to_reload then
		self:reload(current_action)

		self.time_to_reload = nil
	end
end

ActionBow.finish = function (self, reason, data)
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if self.state == "waiting_to_shoot" then
		self:fire(current_action)

		self.state = "shot"

		if self.ammo_extension and not self.extra_buff_shot then
			local ammo_usage = current_action.ammo_usage

			self.ammo_extension:use_ammo(ammo_usage)
		end

		self:reload(current_action)
	end

	if self.time_to_reload then
		self:reload(current_action)
	end

	if not data or data.new_action ~= "action_two" or data.new_sub_action ~= "default" then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)
	end

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end

ActionBow.fire = function (self, current_action, add_spread)
	local owner_unit = self.owner_unit
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local speed = current_action.speed
	local position, rotation = first_person_extension:get_projectile_start_position_rotation()
	local spread_extension = self.spread_extension

	if spread_extension then
		rotation = spread_extension:get_randomised_spread(rotation)

		if add_spread then
			spread_extension:set_shooting()
		end
	end

	local angle = ActionUtils.pitch_from_rotation(rotation)
	local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	local lookup_data = current_action.lookup_data

	ActionUtils.spawn_player_projectile(owner_unit, position, rotation, 0, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, self._is_critical_strike, self.power_level)

	if current_action.alert_sound_range_fire then
		Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], current_action.alert_sound_range_fire)
	end
end
