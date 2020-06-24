ActionMeleeStart = class(ActionMeleeStart, ActionDummy)

local function play_additional_charge_animation(unit, anim_data)
	if anim_data and anim_data.anim_event and anim_data.variable_name and anim_data.variable_value then
		CharacterStateHelper.play_animation_event_with_variable_float(unit, anim_data.anim_event, anim_data.variable_name, anim_data.variable_value)
	end
end

ActionMeleeStart.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionMeleeStart.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
	Unit.flow_event(self.first_person_unit, "sfx_swing_charge")

	local owner_unit = self._owner_unit
	self._action = new_action
	self._action_start_time = t

	play_additional_charge_animation(owner_unit, new_action.custom_start_anim_data)
end

ActionMeleeStart.client_owner_post_update = function (self, dt, t, world)
	local action = self._action
	local owner_unit = self._owner_unit
	local action_start_time = self._action_start_time
	local blocking_charge = action.blocking_charge
	local status_extension = ScriptUnit.extension(owner_unit, "status_system")

	if not status_extension.blocking and blocking_charge and t > action.blocking_charge_start_time + action_start_time then
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
end

ActionMeleeStart.finish = function (self, reason)
	local owner_unit = self._owner_unit
	local go_id = Managers.state.unit_storage:go_id(owner_unit)

	if not LEVEL_EDITOR_TEST then
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
	play_additional_charge_animation(owner_unit, self._action.custom_finish_anim_data)
end

return
