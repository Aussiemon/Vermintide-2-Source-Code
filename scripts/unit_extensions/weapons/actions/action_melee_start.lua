-- chunkname: @scripts/unit_extensions/weapons/actions/action_melee_start.lua

ActionMeleeStart = class(ActionMeleeStart, ActionDummy)

local function scale_delay_value(action_settings, value, owner_unit, buff_extension)
	local new_value = value
	local time_scale = ActionUtils.get_action_time_scale(owner_unit, action_settings)

	new_value = new_value / time_scale

	return new_value
end

ActionMeleeStart.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionMeleeStart.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._owner_unit = owner_unit
	self.input_extension = ScriptUnit.extension(owner_unit, "input_system")
	self.buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.spread_extension = ScriptUnit.has_extension(weapon_unit, "spread_system")
end

ActionMeleeStart.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionMeleeStart.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
	Unit.flow_event(self.first_person_unit, "sfx_swing_charge")
	self:_play_additional_animation(new_action.custom_start_anim_data)

	self.zoom_condition_function = new_action.zoom_condition_function

	local owner_unit = self.owner_unit
	local buff_extension = self.buff_extension

	self._block_delay = scale_delay_value(new_action, new_action.blocking_charge_start_time or 0, owner_unit, buff_extension)

	if self.zoom_condition_function then
		local aim_zoom_delay = scale_delay_value(new_action, new_action.aim_zoom_delay or 0, owner_unit, buff_extension)

		self.aim_zoom_time = t + aim_zoom_delay
	end
end

ActionMeleeStart.client_owner_post_update = function (self, dt, t, world)
	local action = self.current_action
	local owner_unit = self.owner_unit
	local action_start_time = self.action_start_t
	local blocking_charge = action.blocking_charge
	local status_extension = self.status_extension

	if not status_extension.blocking and blocking_charge and t > action_start_time + self._block_delay then
		local go_id = Managers.state.unit_storage:go_id(owner_unit)

		if not LEVEL_EDITOR_TEST then
			if self.is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, true)
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_charge_blocking", go_id, true)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, true)
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_charge_blocking", go_id, true)
			end
		end

		status_extension:set_blocking(true)
		status_extension:set_charge_blocking(true)

		status_extension.timed_block = t + 0.5
	end

	if self.zoom_condition_function and self.zoom_condition_function(action.lookup_data) then
		local input_extension = self.input_extension
		local buff_extension = self.buff_extension

		if not status_extension:is_zooming() and t >= self.aim_zoom_time then
			status_extension:set_zooming(true, action.default_zoom)
		end

		if buff_extension:has_buff_perk("increased_zoom") and status_extension:is_zooming() and input_extension:get("action_three") then
			status_extension:switch_variable_zoom(action.buffed_zoom_thresholds)
		end
	end
end

ActionMeleeStart.finish = function (self, reason, data)
	local reset_block = true
	local reset_aim = true

	if reason == "new_interupting_action" then
		local next_action = data and data.new_action_settings

		if next_action then
			reset_block = not next_action.chain_block_charge
			reset_aim = not next_action.chain_aim
		end
	end

	local action = self.current_action
	local owner_unit = self.owner_unit

	if reset_aim then
		local unzoom_condition_function = action.unzoom_condition_function

		if not unzoom_condition_function or unzoom_condition_function(reason, data) then
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")

			status_extension:set_zooming(false)
		end
	end

	if reset_block then
		if not LEVEL_EDITOR_TEST then
			local go_id = Managers.state.unit_storage:go_id(owner_unit)

			if self.is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, false)
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_charge_blocking", go_id, false)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, false)
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_charge_blocking", go_id, false)
			end
		end

		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_blocking(false)
		status_extension:set_charge_blocking(false)
	end

	self:_play_additional_animation(action.custom_finish_anim_data)
end
