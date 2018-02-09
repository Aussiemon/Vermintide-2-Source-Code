local debug = true

local function cleanup_print(...)
	if debug then
		print("[SmartMatchCleaner]", string.format(...))
	end

	return 
end

SmartMatchCleaner = class(SmartMatchCleaner)
SmartMatchCleaner.init = function (self)
	self.reset(self)

	return 
end
SmartMatchCleaner.reset = function (self)
	self._sessions_to_clean = {}

	return 
end
SmartMatchCleaner.ready = function (self)
	return #self._sessions_to_clean == 0
end
SmartMatchCleaner.add_session = function (self, session_data)
	self._sessions_to_clean[#self._sessions_to_clean + 1] = session_data

	return 
end
local ENTRIES_TO_REMOVE = ENTRIES_TO_REMOVE or {}
SmartMatchCleaner.update = function (self, dt)
	self._update_cleanup(self, dt)
	self._update_remove(self, dt)

	return 
end
SmartMatchCleaner._update_cleanup = function (self, dt)
	for i = 1, #self._sessions_to_clean, 1 do
		local session_data = self._sessions_to_clean[i]

		self[session_data.state](self, dt, i, session_data)
	end

	return 
end
SmartMatchCleaner._update_remove = function (self, dt)
	for idx, session_data in ipairs(self._sessions_to_clean) do
		if session_data.state == "_do_remove" then
			local session_id = session_data.session_id
			local session_name = session_data.session_name

			cleanup_print("REMOVED session entry --> session_id: %s - session_name: %s", session_id, session_name)

			ENTRIES_TO_REMOVE[#ENTRIES_TO_REMOVE + 1] = idx
		end
	end

	for i = #ENTRIES_TO_REMOVE, 1, -1 do
		table.remove(self._sessions_to_clean, i)
	end

	table.clear(ENTRIES_TO_REMOVE)

	return 
end
SmartMatchCleaner._change_state = function (self, session_data, state)
	if state and self[state] then
		cleanup_print("Changed state from: %s to: %s", session_data.state, state)

		session_data.state = state
	else
		fassert("[SmartMatchCleaner:_change_state] There is no state called %s", state)
	end

	return 
end
SmartMatchCleaner._cleanup_ticket = function (self, dt, index, session_data)
	local session_id = session_data.session_id
	local session_name = session_data.session_name
	local hopper_name = session_data.hopper_name
	local destroy_session = session_data.destroy_session
	local provided_ticket_id = session_data.ticket_id
	local user_id = session_data.user_id
	local status = MultiplayerSession.status(session_id)

	if status == MultiplayerSession.WORKING then
		return 
	end

	local ticket_id = MultiplayerSession.start_smartmatch_result(session_id)

	if status == MultiplayerSession.BROKEN or status == MultiplayerSession.SHUTDOWN then
		cleanup_print("Cannot cleanup ticket since the session is either broken or shutdown. Ticket params: - session_id: %s - session_name: %s - hopper_name: %s - ticket_id: %s", session_id, session_name, hopper_name, provided_ticket_id)
	elseif not Managers.account:user_exists(user_id) then
		cleanup_print("Couldn't delete smartmatch ticket since the user didn't exist in cache - session_id: %s - session_name: %s - hopper_name: %s - ticket_id: %s - user_id: %s", session_id, session_name, hopper_name, provided_ticket_id, user_id)
	elseif provided_ticket_id then
		cleanup_print("Deleting PROVIDED ticket with params - session_id: %s - session_name: %s - hopper_name: %s - ticket_id: %s", session_id, session_name, hopper_name, provided_ticket_id)
		MultiplayerSession.delete_smartmatch_ticket(session_id, hopper_name, provided_ticket_id)
	elseif ticket_id ~= "" then
		cleanup_print("Found ticket for session --> session_id: %s - session_name: %s - ticket_id: %s", session_id, session_name, ticket_id)
		cleanup_print("Deleting ticket with params - session_id: %s - session_name: %s - hopper_name: %s - ticket_id: %s", session_id, session_name, hopper_name, ticket_id)
		MultiplayerSession.delete_smartmatch_ticket(session_id, hopper_name, ticket_id)
	else
		cleanup_print("Had no ticket for session --> session_id: %s - session_name: %s", session_id, session_name)
	end

	if destroy_session then
		self._change_state(self, session_data, "_cleanup_session")
	else
		cleanup_print("KEEP SESSION ALIVE --> session_id: %s - session_name: %s", session_id, session_name)
		self._change_state(self, session_data, "_do_remove")
	end

	return 
end
SmartMatchCleaner._cleanup_session = function (self, dt, index, session_data)
	local session_id = session_data.session_id
	local session_name = session_data.session_name
	local session_name = session_data.session_name
	local hopper_name = session_data.hopper_name
	local status = MultiplayerSession.status(session_id)

	if status == MultiplayerSession.READY or status == MultiplayerSession.BROKEN then
		cleanup_print("Leaving session --> session_id: %s - session_name: %s", session_id, session_name)
		MultiplayerSession.leave(session_id)
		self._change_state(self, session_data, "_free_session")
	elseif status == MultiplayerSession.SHUTDOWN then
		self._change_state(self, session_data, "_free_session")
	end

	return 
end
SmartMatchCleaner._free_session = function (self, dt, index, session_data)
	local session_id = session_data.session_id
	local session_name = session_data.session_name
	local status = MultiplayerSession.status(session_id)

	if status == MultiplayerSession.SHUTDOWN then
		cleanup_print("Freeing session --> session_id: %s - session_name: %s", session_id, session_name)
		Network.free_multiplayer_session(session_id)
		self._change_state(self, session_data, "_do_remove")
	end

	return 
end
SmartMatchCleaner._do_remove = function (self)
	return 
end

return 
