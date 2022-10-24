ScriptBackend = class(ScriptBackend)
BackendSaveDataVersion = 30
local CONNECTION_STATE_NAMES = {}
local STATE_CHANGES = {}
local RESULT_NAMES = {}
local BACKEND_ENVIRONMENTS = {}

if rawget(_G, "Backend") then
	CONNECTION_STATE_NAMES[Backend.CONNECTION_UNINITIALIZED] = "connection_uninitialized"
	CONNECTION_STATE_NAMES[Backend.CONNECTION_INITIALIZED] = "connection_initialized"
	CONNECTION_STATE_NAMES[Backend.CONNECTION_CONNECTING] = "connection_connecting"
	CONNECTION_STATE_NAMES[Backend.CONNECTION_CONNECTED] = "connection_connected"
	CONNECTION_STATE_NAMES[Backend.CONNECTION_WAITING_AUTH_TICKET] = "connection_waiting_auth_ticket"
	CONNECTION_STATE_NAMES[Backend.CONNECTION_AUTHENTICATING] = "connection_authenticating"
	CONNECTION_STATE_NAMES[Backend.CONNECTION_AUTHENTICATED] = "connection_authenticated"
	CONNECTION_STATE_NAMES[Backend.CONNECTION_DISCONNECTING] = "connection_disconnecting"
	CONNECTION_STATE_NAMES[Backend.CONNECTION_ENTITIES_LOADED] = "connection_entities_loaded"
	CONNECTION_STATE_NAMES[Backend.CONNECTION_ERROR] = "connection_error"
	STATE_CHANGES[Backend.CONNECTION_UNINITIALIZED] = {
		[Backend.CONNECTION_INITIALIZED] = true
	}
	STATE_CHANGES[Backend.CONNECTION_INITIALIZED] = {
		[Backend.CONNECTION_CONNECTING] = true,
		[Backend.CONNECTION_CONNECTED] = true
	}
	STATE_CHANGES[Backend.CONNECTION_CONNECTING] = {
		[Backend.CONNECTION_CONNECTED] = true
	}
	STATE_CHANGES[Backend.CONNECTION_CONNECTED] = {
		[Backend.CONNECTION_AUTHENTICATING] = true,
		[Backend.CONNECTION_AUTHENTICATED] = true,
		[Backend.CONNECTION_WAITING_AUTH_TICKET] = true
	}
	STATE_CHANGES[Backend.CONNECTION_WAITING_AUTH_TICKET] = {
		[Backend.CONNECTION_AUTHENTICATING] = true,
		[Backend.CONNECTION_AUTHENTICATED] = true
	}
	STATE_CHANGES[Backend.CONNECTION_AUTHENTICATING] = {
		[Backend.CONNECTION_AUTHENTICATED] = true
	}
	STATE_CHANGES[Backend.CONNECTION_AUTHENTICATED] = {
		[Backend.CONNECTION_ENTITIES_LOADED] = true
	}
	STATE_CHANGES[Backend.CONNECTION_ENTITIES_LOADED] = {}
	RESULT_NAMES[Backend.RES_OK] = "backend_res_ok"
	RESULT_NAMES[Backend.RES_UNKNOWN_ERR] = "backend_res_unknown_error"
	RESULT_NAMES[Backend.RES_INVALID_STATE] = "backend_res_invalid_state"
	RESULT_NAMES[Backend.RES_AUTH_IN_PROGRESS] = "backend_res_auth_in_progress"
	RESULT_NAMES[Backend.RES_INVALID_USER] = "backend_res_invalid_user"
	RESULT_NAMES[Backend.RES_HTTP_ERROR] = "backend_res_http_error"
	RESULT_NAMES[Backend.RES_DNS_ERROR] = "backend_res_dns_error"
	RESULT_NAMES[Backend.RES_INVALID_TRANSACTION] = "backend_res_invalid_transaction"
	RESULT_NAMES[Backend.RES_INVALID_ATTRIBUTE] = "backend_res_invalid_attribute"
	RESULT_NAMES[Backend.RES_NO_PENDING_DATA] = "backend_res_no_pending_data"
	RESULT_NAMES[Backend.RES_COMM_ERROR] = "backend_res_comm_error"
	RESULT_NAMES[Backend.RES_NO_SUCH_ENTITY] = "backend_res_no_such_entity"
	RESULT_NAMES[Backend.RES_NO_CHANGE] = "backend_res_no_change"
	RESULT_NAMES[Backend.RES_INVALID_ENTITY_ID] = "backend_res_invalid_entity_id"
	RESULT_NAMES[Backend.RES_ACTIVE_SESSION] = "backend_res_active_session"
	RESULT_NAMES[Backend.RES_NO_ACTIVE_SESSION] = "backend_res_no_active_session"
	RESULT_NAMES[Backend.RES_PARSE_ERROR] = "backend_res_parse_error"
	RESULT_NAMES[Backend.RES_TITLE_ID_DISABLED] = "backend_res_title_id_disabled"

	if Backend.ENV_DEV then
		BACKEND_ENVIRONMENTS[Backend.ENV_DEV] = "Dev"
		BACKEND_ENVIRONMENTS[Backend.ENV_STAGE] = "Stage"
		BACKEND_ENVIRONMENTS[Backend.ENV_PROD] = "Prod"
	end
end

local LOG_LEVELS = {
	off = 0,
	verbose = 2,
	normal = 1
}

ScriptBackend.init = function (self)
	local title_id = GameSettingsDevelopment.backend_settings.title_id
	local environment = GameSettingsDevelopment.backend_settings.environment

	print(string.format("[Backend] Creating backend with title id: %d, environment: %q", title_id, BACKEND_ENVIRONMENTS[environment]))
	Backend.create(title_id, environment)

	self._backend = true

	self:refresh_log_level()

	self._dirty = true
	self._dirty_stats = true
	self._state = Backend.CONNECTION_UNINITIALIZED
	self._commits = {}
	self._commit_current_id = nil
	self._commit_queue_id = nil
	self._last_id = 0
end

local function print_result(result, action)
	if result and result.reason ~= Backend.ERR_OK then
		local error_message = string.format("%q failed with %d, %s", action, result.reason, result.details or "nil")

		print_error(error_message)

		return {
			reason = result.reason,
			details = result.details
		}
	end
end

ScriptBackend.update = function (self)
	if self._commit_current_id then
		self:_check_current_commit()
	end

	Profiler.start("Backend update")

	local result = Backend.update()

	Profiler.stop("Backend update")

	return result
end

ScriptBackend._update_state = function (self)
	local state = Backend.state()
	local allowed_changes = STATE_CHANGES[self._state]

	if state ~= self._state then
		print("[Backend] Changed state from", CONNECTION_STATE_NAMES[self._state], "to", CONNECTION_STATE_NAMES[state])
	end

	local result = nil

	if state ~= self._state and not allowed_changes[state] then
		local error_data = self:check_for_errors()

		if error_data then
			return error_data
		end

		local current_state = CONNECTION_STATE_NAMES[self._state]
		local new_state = CONNECTION_STATE_NAMES[state]
		local error_message, reason = nil

		if self._state == Backend.CONNECTION_ENTITIES_LOADED then
			Crashify.print_exception("Backend", "Disconnected")

			reason = BACKEND_LUA_ERRORS.ERR_DISCONNECTED
		else
			reason = Backend.ERR_UNKNOWN
			error_message = string.format("Wrong transition: Going from state %q to %q", current_state, new_state)
		end

		print("[Backend]", reason, error_message)

		result = {
			reason = reason,
			details = error_message
		}
	end

	self._state = state

	return result
end

ScriptBackend.update_state = function (self)
	return self:_update_state()
end

ScriptBackend.update_signin = function (self)
	local error_data = self:_update_state()

	if error_data then
		return error_data
	end

	local state = self._state
	local result = nil

	if state == Backend.CONNECTION_INITIALIZED then
		result = print_result(Backend.connect(), "Connect")
	end

	if state == Backend.CONNECTION_CONNECTED then
		result = print_result(Backend.steam_auth(), "Auth")
	end

	if state == Backend.CONNECTION_AUTHENTICATED and not self._entities_requested then
		Backend.load_entities()

		self._entities_requested = true
	end

	return result
end

ScriptBackend.authenticated = function (self)
	return Backend.state() == Backend.CONNECTION_ENTITIES_LOADED
end

ScriptBackend._refresh_stats = function (self)
	if self._dirty_stats or not self._stats then
		local stats = BackendStats.get_stats(self._backend)
		local nice_stats = {}

		for id, stat_data in pairs(stats) do
			nice_stats[stat_data.key] = stat_data.data
		end

		self._stats = stats
		self._nice_stats = nice_stats
		self._dirty_stats = false
	end
end

ScriptBackend.get_stats = function (self)
	self:_refresh_stats()

	return self._nice_stats
end

ScriptBackend.set_stats = function (self, nice_stats)
	self:_refresh_stats()

	local new_stats = table.clone(nice_stats)

	for stat_name, stat_value in pairs(nice_stats) do
		for backend_stat_id, backend_stat_data in pairs(self._stats) do
			if backend_stat_data.key == stat_name then
				new_stats[stat_name] = nil

				if backend_stat_data.data ~= stat_value then
					print_result(BackendStats.set_stat(backend_stat_id, stat_name, stat_value), "Set stat")
				end

				break
			end
		end
	end

	for stat_name, stat_value in pairs(new_stats) do
		Crashify.print_exception("ScriptBackend", "Tried to set unregistered stat %s, value: %s", stat_name, stat_value)
	end

	self:commit()

	self._dirty_stats = true
end

ScriptBackend.check_for_errors = function (self)
	local backend_error = Backend.get_error()
	local session_error = BackendSession.get_error()
	local commit_error = nil

	if self._commit_error then
		commit_error = {
			reason = Backend.ERR_COMMIT
		}
		self._commit_error = nil
	end

	return backend_error or session_error or commit_error
end

ScriptBackend._new_id = function (self)
	self._last_id = self._last_id + 1

	return self._last_id
end

ScriptBackend._check_current_commit = function (self)
	local status = self:commit_status(self._commit_current_id)

	if status ~= Backend.COMMIT_WAITING then
		local commit_data = self._commits[self._commit_current_id]

		print("commit status", status, commit_data.id)

		self._commit_current_id = nil

		if status == Backend.COMMIT_SUCCESS then
			if self._commit_queue_id then
				self:commit(true)
			end
		elseif status == Backend.COMMIT_ERROR then
			self._commit_error = true
			self._commit_queue_id = nil
		end
	end
end

ScriptBackend._commit_internal = function (self, queued_id)
	local commit_id, result = Backend.commit()
	local new_id = queued_id or self:_new_id()
	local commit_data = {
		id = commit_id,
		timeout = os.time() + 15,
		result = result
	}
	self._commits[new_id] = commit_data
	self._commit_current_id = new_id

	print(string.format("Commiting with %d:%d result: %d", new_id, commit_id, result))

	return new_id
end

ScriptBackend._queue_commit = function (self)
	if not self._commit_queue_id then
		self._commit_queue_id = self:_new_id()
	end

	return self._commit_queue_id
end

ScriptBackend.commit = function (self, internal)
	print("Trying to commit", internal, self._commit_current_id, self._commit_queue_id)

	if self._commit_current_id then
		fassert(not internal, "Internal backend commit error, current commit exists")

		return self:_queue_commit()
	else
		local new_id = self:_commit_internal(self._commit_queue_id)
		self._commit_queue_id = nil

		return new_id
	end
end

ScriptBackend.commit_status = function (self, commit_id)
	fassert(commit_id, "Querying status for commit_id %s", tostring(commit_id))

	if commit_id == self._commit_queue_id then
		return Backend.COMMIT_WAITING
	end

	local commit_data = self._commits[commit_id]

	fassert(commit_data, "No commit with id %d", commit_id)

	if commit_data.timeout < os.time() then
		print(commit_data.timeout, os.time())

		local warning = string.format("Commit timed out %d:%d", commit_id, commit_data.id)

		Application.warning(warning)

		return Backend.COMMIT_ERROR
	end

	if commit_data.result ~= Backend.COMMIT_WAITING then
		return commit_data.result
	elseif commit_data.id then
		local status = Backend.query_commit(commit_data.id)

		if status == Backend.COMMIT_SUCCESS then
			local backend_items = Managers.backend:get_interface("items")

			backend_items:__dirtify()
		end

		commit_data.result = status

		return status
	else
		return Backend.COMMIT_WAITING
	end
end

ScriptBackend.destroy = function (self)
	print("[Backend] ScriptBackend destroy")
	Backend.destroy()
end

ScriptBackend.backend_object = function (self)
	error("no backend object in lua anymore")

	return self._backend
end

ScriptBackend.refresh_log_level = function (self)
	local log_index = script_data.backend_logging_level or "verbose"
	local log_level = LOG_LEVELS[log_index]

	Backend.set_log_level(log_level)
end

ScriptBackend.wait_for_shutdown = function (self, timeout)
	local timeout_at = os.time() + timeout

	while Backend.active_requests() > 0 or self._commit_queue_id do
		local error = self:update()

		if error or timeout_at < os.time() then
			if error then
				print("wait for shutdown has enountered error")
			else
				print("wait for shutdown has timed out", Backend.active_requests(), self._commit_queue_id)
			end

			return
		end
	end

	print("disconnecting backend")
	Backend.disconnect()

	while not self:update() and Backend.active_requests() > 0 and os.time() < timeout_at do
	end

	if timeout_at < os.time() then
		print("backend disconnect has timed out")
	end
end

return
