ActionAim = class(ActionAim)

ActionAim.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.weapon_unit = weapon_unit
	self.first_person_unit = first_person_unit
	self.is_server = is_server
	self.world = world
	self.item_name = item_name
	self.wwise_world = Managers.world:wwise_world(world)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	if ScriptUnit.has_extension(weapon_unit, "spread_system") then
		self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	end
end

ActionAim.client_owner_start_action = function (self, new_action, t)
	local owner_unit = self.owner_unit
	self.current_action = new_action
	self.zoom_condition_function = new_action.zoom_condition_function
	self.played_aim_sound = false
	self.heavy_aim_flow_done = false
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local aim_sound_delay = buff_extension:apply_buffs_to_value(new_action.aim_sound_delay or 0, StatBuffIndex.REDUCED_RANGED_CHARGE_TIME)
	local aim_zoom_delay = buff_extension:apply_buffs_to_value(new_action.aim_zoom_delay or 0, StatBuffIndex.REDUCED_RANGED_CHARGE_TIME)
	local heavy_aim_flow_delay = buff_extension:apply_buffs_to_value(new_action.heavy_aim_flow_delay or 0, StatBuffIndex.REDUCED_RANGED_CHARGE_TIME)
	self.aim_sound_time = t + aim_sound_delay
	self.aim_zoom_time = t + aim_zoom_delay
	self.heavy_aim_flow_time = t + heavy_aim_flow_delay
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
	local owner_unit = self.owner_unit
	local owner_player = Managers.player:owner(owner_unit)
	local is_bot = owner_player and owner_player.bot_player

	if not is_bot then
		local charge_sound_name = new_action.charge_sound_name

		if charge_sound_name then
			local wwise_playing_id, wwise_source_id = ActionUtils.start_charge_sound(self.wwise_world, self.weapon_unit, owner_unit, new_action)
			self.charging_sound_id = wwise_playing_id
			self.wwise_source_id = wwise_source_id
		end
	end

	local charge_sound_husk_name = self.current_action.charge_sound_husk_name

	if charge_sound_husk_name then
		ActionUtils.play_husk_sound_event(charge_sound_husk_name, owner_unit)
	end
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
			local wwise_world = self.wwise_world

			WwiseWorld.trigger_event(wwise_world, sound_event)
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

	if ammo_extension and ammo_extension:can_reload() and ammo_extension:ammo_count() == 0 and current_action.reload_when_out_of_ammo then
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

	local owner = Managers.player:owner(self.owner_unit)

	if owner:is_player_controlled() then
	end

	if not Managers.player:owner(self.owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "full_stop"
		})
	end

	if current_action.reset_aim_assist_on_exit then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension:reset_aim_assist_multiplier()
	end

	local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

	inventory_extension:set_loaded_projectile_override(nil)

	local charging_sound_id = self.charging_sound_id

	if charging_sound_id then
		ActionUtils.stop_charge_sound(self.wwise_world, charging_sound_id, self.wwise_source_id, self.current_action)

		self.wwise_source_id = nil
		self.charging_sound_id = nil
	end

	local charge_sound_husk_stop_event = current_action.charge_sound_husk_stop_event

	if charge_sound_husk_stop_event then
		ActionUtils.play_husk_sound_event(charge_sound_husk_stop_event, owner_unit)
	end
end

return
