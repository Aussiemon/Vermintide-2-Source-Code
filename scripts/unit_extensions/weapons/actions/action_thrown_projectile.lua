ActionThrownProjectile = class(ActionThrownProjectile, ActionBase)

ActionThrownProjectile.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionThrownProjectile.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self._ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self._spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
end

ActionThrownProjectile.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionThrownProjectile.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local owner_unit = self.owner_unit
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	self._status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self._first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self._hud_extension = hud_extension
	self._owner_buff_extension = buff_extension
	self._current_action = new_action
	self._power_level = power_level
	local input_extension = ScriptUnit.extension(owner_unit, "input_system")

	input_extension:reset_input_buffer()

	self.state = "waiting_to_shoot"
	local buffed_anim_time_scale = ActionUtils.get_action_time_scale(owner_unit, new_action)
	local fire_time = (new_action.fire_time or 0) * 1 / buffed_anim_time_scale
	self._time_to_shoot = t + fire_time
	self._time_to_unzoom = (new_action.unzoom_time and t + new_action.unzoom_time) or nil
	self._extra_buff_shot = false

	self:_handle_critical_strike(is_critical_strike, buff_extension, hud_extension, nil, nil, nil)

	self._is_critical_strike = is_critical_strike
end

ActionThrownProjectile._use_ammo = function (self)
	local ammo_extension = self._ammo_extension

	if ammo_extension and not self._extra_buff_shot then
		local ammo_usage = self._current_action.ammo_usage

		ammo_extension:use_ammo(ammo_usage)
	end
end

ActionThrownProjectile._reload = function (self)
	local ammo_extension = self._ammo_extension

	if ammo_extension:can_reload() then
		local current_action = self._current_action
		local play_reload_animation = current_action.play_reload_animation
		local override_reload_time = current_action.override_reload_time

		ammo_extension:start_reload(play_reload_animation, override_reload_time)
	end
end

ActionThrownProjectile.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self._current_action

	if self._time_to_unzoom and self._time_to_unzoom <= t then
		local status_extension = self._status_extension

		status_extension:set_zooming(false)
	end

	if self.state == "waiting_to_shoot" and self._time_to_shoot <= t then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		local buff_extension = self._owner_buff_extension
		local _, procced = buff_extension:apply_buffs_to_value(0, "extra_shot")
		local add_spread = not self._extra_buff_shot

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "bow_fire"
			})
		end

		self:_fire(add_spread)

		if self._ammo_extension and not self._extra_buff_shot then
			self:_use_ammo()

			if current_action.reload_event_delay_time then
				self.time_to_reload = t + current_action.reload_event_delay_time
			else
				self:_reload()
			end
		end

		if procced and not self._extra_buff_shot then
			self.state = "waiting_to_shoot"
			self._time_to_shoot = t + 0.1
			self._extra_buff_shot = true
		else
			self.state = "shot"
		end

		local first_person_extension = self._first_person_extension

		if self._current_action.reset_aim_on_attack then
			first_person_extension:reset_aim_assist_multiplier()
		end

		local fire_sound_event = self._current_action.fire_sound_event

		if fire_sound_event then
			first_person_extension:play_hud_sound_event(fire_sound_event)
		end
	end

	if self.time_to_reload and self.time_to_reload < t then
		self:_reload()

		self.time_to_reload = nil
	end
end

ActionThrownProjectile.finish = function (self, reason, data)
	if self.state == "waiting_to_shoot" then
		self:_fire()
		self:_use_ammo()
		self:_reload()

		self.state = "shot"
	end

	if not data or data.new_action ~= "action_two" or data.new_sub_action ~= "default" then
		local status_extension = self._status_extension

		status_extension:set_zooming(false)
	end

	local hud_extension = self._hud_extension

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end

ActionThrownProjectile._fire = function (self, add_spread)
	local current_action = self._current_action
	local owner_unit = self.owner_unit
	local first_person_extension = self._first_person_extension
	local speed = current_action.speed
	local rotation = first_person_extension:current_rotation()
	local position = first_person_extension:current_position()
	local spread_extension = self._spread_extension

	if spread_extension then
		rotation = spread_extension:get_randomised_spread(rotation)

		if add_spread then
			spread_extension:set_shooting()
		end
	end

	local angle = ActionUtils.pitch_from_rotation(rotation)
	local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	local lookup_data = current_action.lookup_data

	ActionUtils.spawn_player_projectile(owner_unit, position, rotation, 0, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, self._is_critical_strike, self._power_level)

	if current_action.alert_sound_range_fire then
		Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], current_action.alert_sound_range_fire)
	end
end

return
