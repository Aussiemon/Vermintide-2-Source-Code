ActionBlock = class(ActionBlock)
ActionBlock.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.world = world
	self.owner_unit = owner_unit
	self.first_person_unit = first_person_unit
	self.weapon_unit = weapon_unit
	self.is_server = is_server
	self.item_name = item_name
	self._blocked_flag = false
	self._blocked_time = 0
	self._status_extension = ScriptUnit.extension(owner_unit, "status_system")

	return 
end
ActionBlock.client_owner_start_action = function (self, new_action, t)
	self.current_action = new_action
	self.action_time_started = t
	local input_extension = ScriptUnit.extension(self.owner_unit, "input_system")

	input_extension.reset_input_buffer(input_extension)

	local owner_unit = self.owner_unit
	local go_id = Managers.state.unit_storage:go_id(owner_unit)

	if not LEVEL_EDITOR_TEST then
		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, true)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, true)
		end
	end

	Unit.flow_event(self.first_person_unit, "sfx_block_started")

	local status_extension = self._status_extension

	status_extension.set_blocking(status_extension, true)

	status_extension.timed_block = t + 0.5

	return 
end
ActionBlock.client_owner_post_update = function (self, dt, t, world, can_damage)
	local status_extension = self._status_extension

	if status_extension.has_blocked(status_extension) then
		self._blocked_flag = true
		self._blocked_time = t - self.action_time_started

		status_extension.set_has_blocked(status_extension, false)
	end

	return 
end
ActionBlock.finish = function (self, reason)
	local owner_unit = self.owner_unit
	local go_id = Managers.state.unit_storage:go_id(owner_unit)

	if not LEVEL_EDITOR_TEST then
		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, false)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, false)
		end
	end

	self._blocked_flag = false
	local status_extension = self._status_extension

	status_extension.set_blocking(status_extension, false)
	status_extension.set_has_blocked(status_extension, false)

	return 
end
ActionBlock.streak_available = function (self, t, streak_action)
	local relative_start = streak_action and streak_action.relative_start_time
	local relative_end = streak_action and streak_action.relative_end_time

	if not self._blocked_flag or not relative_start or not relative_end then
		return false
	end

	local blocked_time = self._blocked_time
	local start_time = relative_start + blocked_time
	local end_time = relative_end + blocked_time

	if end_time < t then
		self._blocked_flag = false
		self._blocked_time = 0
	elseif start_time <= t then
		return true
	end

	return false
end

return 
