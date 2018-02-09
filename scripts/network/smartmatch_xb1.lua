local DEBUG_SMARTMATCH = true

local function dprintf()
	return 
end

if DEBUG_SMARTMATCH then
	function dprintf(...)
		print("[SmartMatch]", string.format(...))

		return 
	end
end

local HOPPER_PARAMS_LUT = {
	default_stage_hopper = {
		"difficulty",
		"stage"
	},
	new_stage_hopper = {
		"difficulty",
		"level"
	}
}
local HOPPER_PARAM_TYPE_LUT = {
	stage = "number",
	difficulty = "number",
	level = "collection"
}
local SMARTMATCH_STATUS_LUT = {
	[SmartMatchStatus.UNKNOWN] = "UNKNOWN",
	[SmartMatchStatus.SEARCHING] = "SEARCHING",
	[SmartMatchStatus.EXPIRED] = "EXPIRED",
	[SmartMatchStatus.FOUND] = "FOUND"
}
local SMARTMATCH_SESSION_STATUS_LUT = {
	[MultiplayerSession.READY] = "READY",
	[MultiplayerSession.WORKING] = "WORKING",
	[MultiplayerSession.SHUTDOWN] = "SHUTDOWN",
	[MultiplayerSession.BROKEN] = "BROKEN"
}
SmartMatch = class(SmartMatch)
SmartMatch.init = function (self, hopper_name, is_host, ticket_params, timeout)
	self._hopper_name = hopper_name or LobbyInternal.HOPPER_NAME
	self._is_host = is_host or false
	self._ticket_params = ticket_params or {}
	self._timout = timeout or 90
	self._ticket_id = nil
	self._user_id = Managers.account:user_id()

	if table.is_empty(self._ticket_params) then
		dprintf("No params sent to SmartMatch")
	end

	self._create_smartmatch_session(self)

	self._state = "_start_smartmatch"

	return self._hopper_name
end
SmartMatch._create_smartmatch_session = function (self)
	local session_name = Application.guid()
	local hopper_name = LobbyInternal.HOPPER_NAME
	local session_template_name = LobbyInternal.SMARTMATCH_SESSION_TEMPLATE_NAME
	local keywords = nil
	local min_num_members = 0
	local max_num_members = 0
	local guest_user_ids = nil
	self._session_id = Network.create_multiplayer_session_host(self._user_id, session_name, session_template_name, keywords, min_num_members, max_num_members, guest_user_ids)
	self._session_name = session_name

	return 
end
SmartMatch._handle_smartmatch_session = function (self)
	local status = MultiplayerSession.status(self._session_id)

	if status ~= self._status then
		dprintf("Session status changed from: %s to %s", (self._status and SMARTMATCH_SESSION_STATUS_LUT[self._status]) or "NONE", (status and SMARTMATCH_SESSION_STATUS_LUT[status]) or "NONE")

		self._status = status
		self._ready = status == MultiplayerSession.READY
		self._failed = status == MultiplayerSession.BROKEN
	end

	return 
end
SmartMatch._start_smartmatch = function (self, dt)
	if not self._ready then
		return 
	end

	local timeout_in_seconds = (self._is_host and self._timout*10) or self._timout
	local preserve_session_mode = (self._is_host and PreserveSessionMode.ALWAYS) or PreserveSessionMode.NEVER

	dprintf("PreserveSessionMode %s. is host %s", (preserve_session_mode == PreserveSessionMode.ALWAYS and "ALWAYS") or "NEVER", (self._is_host and "TRUE") or "FALSE")

	local ticket_param_str = nil

	if self._ticket_params then
		ticket_param_str = self._convert_to_json(self, self._hopper_name, self._ticket_params)

		dprintf("Ticket Params: %s Hopper Name: %s", ticket_param_str, self._hopper_name)
	end

	dprintf("Starting SmartMatch with session_id: %s Hopper name: %s PreserveSessionMode: %s Ticket params: %s Timeout: %i", tostring(self._session_id), self._hopper_name, (preserve_session_mode == PreserveSessionMode.ALWAYS and "ALWAYS") or "NEVER", ticket_param_str, timeout_in_seconds)
	MultiplayerSession.start_smartmatch(self._session_id, self._hopper_name, timeout_in_seconds, preserve_session_mode, ticket_param_str)

	self._smartmatch_started = true
	self._state = "_check_smartmatch_result"

	return 
end
SmartMatch._check_smartmatch_result = function (self, dt)
	if not self._ready then
		return 
	end

	local ticket_id, estimated_waiting_time = MultiplayerSession.start_smartmatch_result(self._session_id)

	if (not self._ticket_id or self._ticket_id ~= ticket_id) and ticket_id ~= "" then
		dprintf("Started smartmatch with ticket_id: %s", ticket_id)

		self._ticket_id = ticket_id
	end

	if not self._estimated_waiting_time then
		dprintf("[Start] Estimated waiting time: %s", estimated_waiting_time)

		self._estimated_waiting_time = estimated_waiting_time
	end

	local smartmatch_status = MultiplayerSession.smartmatch_status(self._session_id)
	local session_name, session_template_name, estimated_waiting_time = MultiplayerSession.smartmatch_result(self._session_id)
	self._estimated_waiting_time = (0 < estimated_waiting_time and estimated_waiting_time) or self._estimated_waiting_time

	if self._smartmatch_status ~= smartmatch_status then
		if DEBUG_SMARTMATCH then
			dprintf("SmartMatch Status Changed from %s to %s", (self._smartmatch_status and SMARTMATCH_STATUS_LUT[self._smartmatch_status]) or "NONE", (smartmatch_status and SMARTMATCH_STATUS_LUT[smartmatch_status]) or "NONE")

			if session_name ~= "" then
				dprintf("Current session name: %s. Smartmatch session name: %s. Smartmatch session template: %s", self._session_name, session_name, session_template_name)
			end
		end

		self._smartmatch_status = smartmatch_status

		if self._smartmatch_status == SmartMatchStatus.FOUND then
			local is_my_own_session = session_name == self._session_name

			dprintf("Found session - Session name: %s %s Session template: %s", session_name, (is_my_own_session and "(My own session)") or "", session_template_name)

			self._found_session_name = session_name
			self._found_session_template = session_template_name
			self._done = true
			self._failed = is_my_own_session

			if self._failed then
				dprintf("Smartmatch failed because: FOUND_SESSION == MY_SESSION")
			else
				dprintf("Smartmatch SUCCESS!")
			end

			self._state = "_smartmatch_done"
		elseif self._smartmatch_status == SmartMatchStatus.EXPIRED then
			self._done = true
			self._failed = true

			dprintf("Smartmatch failed because: TIMEOUT")

			self._state = "_smartmatch_done"
		end
	end

	return 
end
SmartMatch._smartmatch_done = function (self, dt)
	return 
end
SmartMatch._convert_to_json = function (self, hopper_name, params)
	local lut_variables = HOPPER_PARAMS_LUT[hopper_name]

	fassert(lut_variables, "[SmartMatch::_convert_to_json] No such hopper_name:  %s", hopper_name)

	local str = ""

	for _, var in ipairs(lut_variables) do
		local var_type = HOPPER_PARAM_TYPE_LUT[var]
		local val = params[var]

		fassert(val, "[SmartMatch::_convert_to_json] Missing variable [%s] in params", var)

		if var_type == "number" then
			str = str .. string.format("%q:%i,", var, val)
		elseif var_type == "string" then
			str = str .. string.format("%q:%q,", var, val)
		elseif var_type == "collection" then
			str = str .. string.format("%q:[", var)

			for idx, value in ipairs(val) do
				if idx == 1 then
					str = str .. string.format("%q", tostring(value))
				else
					str = str .. string.format(",%q", tostring(value))
				end
			end

			str = str .. "],"
		end
	end

	if str == "" then
		return 
	else
		str = string.sub(str, 1, -2)

		print("Hopper name:", hopper_name, "JSON_DATA:", string.format("{%s}", str))

		return string.format("{%s}", str)
	end

	return 
end
SmartMatch.update = function (self, dt)
	self._handle_smartmatch_session(self)
	self[self._state](self, dt)

	return self._ready and not self._done
end
SmartMatch.is_search_done = function (self)
	return self._done
end
SmartMatch.results = function (self)
	return self._found_session_name, self._found_session_template
end
SmartMatch.success = function (self)
	return not self._failed
end
SmartMatch.destroy = function (self)
	local session_data = {
		destroy_session = true,
		state = "_cleanup_ticket",
		user_id = self._user_id,
		session_id = self._session_id,
		hopper_name = self._hopper_name,
		session_name = self._session_name
	}

	Managers.account:add_session_to_cleanup(session_data)

	return 
end

return 
