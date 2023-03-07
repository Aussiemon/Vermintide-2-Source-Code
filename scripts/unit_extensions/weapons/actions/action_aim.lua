ActionAim = class(ActionAim, ActionBase)

ActionAim.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionAim.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.ammo_extension = ScriptUnit.has_extension(weapon_unit, "ammo_system")
	self.spread_extension = ScriptUnit.has_extension(weapon_unit, "spread_system")
	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
end

local function scale_delay_value(action_settings, value, owner_unit, buff_extension)
	local new_value = value
	local time_scale = ActionUtils.get_action_time_scale(owner_unit, action_settings)
	new_value = new_value / time_scale

	return new_value
end

ActionAim.client_owner_start_action = function (self, new_action, t)
	ActionAim.super.client_owner_start_action(self, new_action, t)

	local owner_unit = self.owner_unit
	self.current_action = new_action
	self.zoom_condition_function = new_action.zoom_condition_function
	self.played_aim_sound = false
	self.heavy_aim_flow_done = false
	self.fully_charged_triggered = false
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.buff_extension = buff_extension
	local aim_sound_delay = scale_delay_value(new_action, new_action.aim_sound_delay or 0, owner_unit, buff_extension)
	local aim_zoom_delay = scale_delay_value(new_action, new_action.aim_zoom_delay or 0, owner_unit, buff_extension)
	local heavy_aim_flow_delay = scale_delay_value(new_action, new_action.heavy_aim_flow_delay or 0, owner_unit, buff_extension)
	local charge_time = scale_delay_value(new_action, new_action.charge_time or 0, owner_unit, buff_extension)
	self.aim_sound_time = t + aim_sound_delay
	self.aim_zoom_time = t + aim_zoom_delay
	self.heavy_aim_flow_time = t + heavy_aim_flow_delay
	self.charge_time_trigger = t + charge_time
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

	first_person_extension:disable_rig_movement()
	first_person_extension:enable_rig_offset()

	local spread_template_override = new_action.spread_template_override

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end

	local loaded_projectile_settings = new_action.loaded_projectile_settings

	if loaded_projectile_settings then
		local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

		inventory_extension:set_loaded_projectile_override(loaded_projectile_settings)
	end

	self.charge_ready_sound_event = self.current_action.charge_ready_sound_event

	self:_start_charge_sound()
end

ActionAim._start_charge_sound = function (self)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local owner_player = self.owner_player
	local is_bot = owner_player and owner_player.bot_player
	local is_local = owner_player and not owner_player.remote
	local wwise_world = self.wwise_world

	if is_local and not is_bot then
		local wwise_playing_id, wwise_source_id = ActionUtils.start_charge_sound(wwise_world, self.weapon_unit, owner_unit, current_action)
		self.charging_sound_id = wwise_playing_id
		self.wwise_source_id = wwise_source_id
	end

	ActionUtils.play_husk_sound_event(wwise_world, current_action.charge_sound_husk_name, owner_unit, is_bot)
end

ActionAim._stop_charge_sound = function (self)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local owner_player = self.owner_player
	local is_bot = owner_player and owner_player.bot_player
	local is_local = owner_player and not owner_player.remote
	local wwise_world = self.wwise_world

	if is_local and not is_bot then
		ActionUtils.stop_charge_sound(wwise_world, self.charging_sound_id, self.wwise_source_id, current_action)

		self.charging_sound_id = nil
		self.wwise_source_id = nil
	end

	ActionUtils.play_husk_sound_event(wwise_world, current_action.charge_sound_husk_stop_event, owner_unit, is_bot)
end

ActionAim.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if Application.user_setting("tobii_eyetracking") and ScriptUnit.has_extension(owner_unit, "eyetracking_system") then
		local eyetracking_extension = ScriptUnit.extension(owner_unit, "eyetracking_system")

		if eyetracking_extension:get_is_feature_enabled("tobii_aim_at_gaze") and not eyetracking_extension:get_aim_at_gaze_cancelled() then
			local input_extension = ScriptUnit.extension(owner_unit, "input_system")
			local move_input = input_extension:get("look_raw") or Vector3(0, 0, 0)
			local move_input_controller = input_extension:get("look_raw_controller") or Vector3(0, 0, 0)

			if Vector3.length(move_input) > 0.01 or Vector3.length(move_input_controller) > 0.01 then
				local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

				first_person_extension:stop_force_look_rotation()
				eyetracking_extension:set_aim_at_gaze_cancelled(true)
			end
		end
	end

	if not self.zoom_condition_function or self.zoom_condition_function() then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")
		local input_extension = ScriptUnit.extension(owner_unit, "input_system")
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if not status_extension:is_zooming() and self.aim_zoom_time <= t then
			status_extension:set_zooming(true, current_action.default_zoom)
		end

		if buff_extension:has_buff_perk("increased_zoom") and status_extension:is_zooming() and input_extension:get("action_three") then
			status_extension:switch_variable_zoom(current_action.buffed_zoom_thresholds)
		end
	end

	if not self.played_aim_sound and self.aim_sound_time <= t and not Managers.player:owner(self.owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "aim_start"
		})

		local sound_event = current_action.aim_sound_event

		if sound_event then
			if current_action.looping_aim_sound then
				local start_aim_id = current_action.aim_sound_event
				local stop_aim_id = current_action.unaim_sound_event

				self.weapon_extension:add_looping_audio("aim", start_aim_id, stop_aim_id, nil, nil, true)
			else
				local wwise_world = self.wwise_world

				WwiseWorld.trigger_event(wwise_world, sound_event)
			end
		end

		self.played_aim_sound = true
	end

	if not self.heavy_aim_flow_done and self.heavy_aim_flow_time <= t and not Managers.player:owner(self.owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "aim_start"
		})

		local heavy_aim_flow_event = current_action.heavy_aim_flow_event

		if heavy_aim_flow_event then
			Unit.flow_event(self.first_person_unit, heavy_aim_flow_event)
		end

		local heavy_sound_event = current_action.heavy_aim_sound_event

		if heavy_sound_event then
			local wwise_world = self.wwise_world

			WwiseWorld.trigger_event(wwise_world, heavy_sound_event)
		end

		self.heavy_aim_flow_done = true
	end

	if self.charge_time_trigger < t and not self.fully_charged_triggered then
		self.fully_charged_triggered = true

		self.buff_extension:trigger_procs("on_full_charge")
	end
end

ActionAim.finish = function (self, reason)
	local current_action = self.current_action
	local ammo_extension = self.ammo_extension
	local owner_unit = self.owner_unit
	local unzoom_condition_function = current_action.unzoom_condition_function

	if not unzoom_condition_function or unzoom_condition_function(reason) then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)
	end

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

	first_person_extension:enable_rig_movement()
	first_person_extension:disable_rig_offset()
	first_person_extension:stop_force_look_rotation()

	local reload_when_out_of_ammo_condition_func = current_action.reload_when_out_of_ammo_condition_func
	local do_out_of_ammo_reload = not reload_when_out_of_ammo_condition_func and true or reload_when_out_of_ammo_condition_func(owner_unit, reason)

	if ammo_extension and ammo_extension:can_reload() and ammo_extension:ammo_count() == 0 and current_action.reload_when_out_of_ammo and do_out_of_ammo_reload then
		local play_reload_animation = true

		ammo_extension:start_reload(play_reload_animation)
	end

	if self.spread_extension then
		self.spread_extension:reset_spread_template()
	end

	local sound_event = current_action.unaim_sound_event

	if sound_event then
		local wwise_world = self.wwise_world

		WwiseWorld.trigger_event(wwise_world, sound_event)
	end

	local owner = Managers.player:owner(owner_unit)

	if not owner.bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "full_stop"
		})
	end

	if current_action.reset_aim_assist_on_exit then
		first_person_extension:reset_aim_assist_multiplier()
	end

	local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

	inventory_extension:set_loaded_projectile_override(nil)
	self.buff_extension:trigger_procs("on_charge_finished")

	if not current_action.looping_aim_sound then
		self:_stop_charge_sound()
	end
end
