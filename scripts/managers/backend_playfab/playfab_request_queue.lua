local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
local guid = (IS_PS4 and math.uuid) or Application.guid
PlayFabRequestQueue = class(PlayFabRequestQueue)
local MAX_RETRIES = 2
local TIMEOUT_TIME = 20

PlayFabRequestQueue.init = function (self)
	self._queue = {}
	self._active_entry = nil
	self._id = 0
	self._eac_id = 0
	self._metadata = Managers.backend:get_metadata()
	self._throttle_per_func = {}
	self._max_requests = 15
end

PlayFabRequestQueue.is_pending_request = function (self)
	return self._active_entry or #self._queue > 0
end

PlayFabRequestQueue.enqueue = function (self, request, success_callback, send_eac_challenge, error_callback)
	local id = self._id + 1
	local parameters = request.FunctionParameter

	if not parameters then
		request.FunctionParameter = {
			metadata = self._metadata
		}
	else
		parameters.metadata = self._metadata
	end

	local entry = {
		resends = 0,
		eac_challenge_success = false,
		api_function_name = "ExecuteCloudScript",
		request = table.clone(request),
		success_callback = success_callback,
		error_callback = error_callback,
		send_eac_challenge = send_eac_challenge,
		timeout = TIMEOUT_TIME,
		id = id
	}

	print("[PlayFabRequestQueue] Enqueuing ExecuteCloudScript request", request.FunctionName, id)
	table.insert(self._queue, entry)

	self._id = id

	return id
end

PlayFabRequestQueue.enqueue_api_request = function (self, api_function_name, request, success_callback, optional_error_callback)
	local id = self._id + 1
	local entry = {
		resends = 0,
		send_eac_challenge = false,
		api_function_name = api_function_name,
		request = table.clone(request),
		success_callback = success_callback,
		error_callback = optional_error_callback,
		timeout = TIMEOUT_TIME,
		id = id
	}

	print("[PlayFabRequestQueue] Enqueuing Client API request", api_function_name, id)
	table.insert(self._queue, entry)

	self._id = id

	return id
end

PlayFabRequestQueue._need_throttle = function (self, funcName, t)
	if not self._throttle_per_func[funcName] then
		local data = {
			num_requests = 0,
			time = t + 15
		}
	end

	self._throttle_per_func[funcName] = data
	local new_num_requests = data.num_requests + 1

	if self._max_requests <= new_num_requests then
		return true
	end

	data.num_requests = new_num_requests

	return false
end

PlayFabRequestQueue._update_throttling = function (self, t, entry)
	for key, data in pairs(self._throttle_per_func) do
		if data.time <= t then
			self._throttle_per_func[key] = nil
		end
	end

	if entry.send_eac_challenge and self:_need_throttle("generateChallenge", t) then
		return false
	end

	local name = (entry.request and entry.request.FunctionName) or entry.api_function_name

	if self:_need_throttle(name, t) then
		return false
	end

	return true
end

PlayFabRequestQueue.update = function (self, dt, t)
	local active_entry = self._active_entry

	if active_entry then
		local timeout = active_entry.timeout - dt
		local active_request = active_entry.request

		if timeout > 0 then
			self._active_entry.timeout = timeout

			return
		elseif active_entry.resends < MAX_RETRIES and active_entry.send_eac_challenge and not active_entry.eac_challenge_success then
			active_entry.resends = active_entry.resends + 1
			active_entry.timeout = TIMEOUT_TIME

			print("[PlayFabRequestQueue] EAC Challenge Request Timed Out Resending", active_request.FunctionName, active_entry.id)
			table.dump(active_entry, nil, 5)
			Crashify.print_exception("PlayFabRequestQueue", "EAC Challenge Request Timed Out - Resending")
			table.insert(self._queue, 1, active_entry)
		else
			print("[PlayFabRequestQueue] Request Timed Out", active_request.api_function_name, active_request.FunctionName, active_entry.id)
			table.dump(active_entry, nil, 5)
			Crashify.print_exception("PlayFabRequestQueue", "Request Timed Out")

			return "request_timed_out", active_entry.id
		end
	end

	if table.is_empty(self._queue) then
		return
	end

	if not self:_update_throttling(t, self._queue[1]) then
		return
	end

	local entry = table.remove(self._queue, 1)
	local request = entry.request
	self._active_entry = entry

	if entry.send_eac_challenge then
		local eac_id = self._eac_id + 1
		local success_cb = callback(self, "eac_challenge_success_cb")
		local generate_challenge_request = {
			FunctionName = "generateChallenge",
			FunctionParameter = {
				eac_id = eac_id,
				metadata = self._metadata
			}
		}
		entry.expected_eac_id = eac_id
		self._eac_id = eac_id

		print("[PlayFabRequestQueue] Sending EAC Challenge Request", request.FunctionName, entry.id, eac_id)
		PlayFabClientApi.ExecuteCloudScript(generate_challenge_request, success_cb)
	else
		print("[PlayFabRequestQueue] Sending Request Without EAC Challenge", entry.api_function_name, request.FunctionName, entry.id)
		self:_send_request(entry)
	end
end

PlayFabRequestQueue.eac_challenge_success_cb = function (self, result)
	local entry = self._active_entry
	local function_result = result.FunctionResult
	local challenge = function_result.challenge
	local eac_id = function_result.eac_id

	if not entry or (eac_id and eac_id ~= entry.expected_eac_id) then
		print("[PlayFabRequestQueue] Received Timed Out EAC Response - Ignoring", eac_id)

		return
	end

	local eac_response, response = nil

	if challenge then
		eac_response, response = self:_get_eac_response(challenge)
	end

	if not challenge then
		print("[PlayFabRequestQueue] EAC disabled on backend", entry.id)
		self:_challenge_response_received()
	elseif not eac_response then
		print("[PlayFabRequestQueue] EAC disabled on client", entry.id)

		entry.timeout = math.huge

		Managers.backend:playfab_eac_error()
	else
		print("[PlayFabRequestQueue] EAC Enabled!", entry.id)
		self:_challenge_response_received(response)
	end
end

PlayFabRequestQueue._challenge_response_received = function (self, response)
	local entry = self._active_entry
	entry.eac_challenge_success = true
	entry.timeout = TIMEOUT_TIME
	local request = entry.request
	local function_params = request.FunctionParameter or {}
	function_params.response = response
	request.FunctionParameter = function_params

	print("[PlayFabRequestQueue] Sending Request", request.FunctionName, entry.id)
	self:_send_request(entry)
end

PlayFabRequestQueue._send_request = function (self, entry)
	local api_function_name = entry.api_function_name
	local request = entry.request
	local success_callback = entry.success_callback
	local success_cb = callback(self, "playfab_request_success_cb", success_callback, entry.id)
	local error_callback = entry.error_callback
	local error_cb = error_callback and callback(self, "playfab_request_error_cb", error_callback, entry.id)

	PlayFabClientApi[api_function_name](request, success_cb, error_cb)
end

PlayFabRequestQueue.playfab_request_success_cb = function (self, success_callback, id, result)
	local entry = self._active_entry
	local function_result = result.FunctionResult

	if not entry or (id and id ~= entry.id) then
		print("[PlayFabRequestQueue] Received Timed Out Success Response - Ignoring", id)

		return
	end

	local request = entry.request

	if function_result and function_result.eac_failed_verification then
		print("[PlayFabRequestQueue] EAC Failed Verification", request.FunctionName, entry.id)
		Managers.backend:playfab_eac_error()

		return
	end

	print("[PlayFabRequestQueue] Request Success", entry.api_function_name, request.FunctionName, entry.id)

	self._active_entry = nil

	success_callback(result)

	if script_data.testify then
		local function_to_wait_for = Testify:poll_request("wait_for_playfab_response")

		if function_to_wait_for and function_to_wait_for == request.FunctionName then
			Testify:respond_to_request("wait_for_playfab_response", request.FunctionName)
		end
	end
end

PlayFabRequestQueue.playfab_request_error_cb = function (self, error_callback, id, result)
	local entry = self._active_entry
	local request = entry.request

	if not entry or (id and id ~= entry.id) then
		print("[PlayFabRequestQueue] Received Timed Out Error Response - Ignoring", id)

		return
	end

	print("[PlayFabRequestQueue] Request Error", entry.api_function_name, request.FunctionName, entry.id, result.errorCode, result.errorMessage)

	local function reenable_queue_function()
		self._active_entry = nil
	end

	error_callback(result, reenable_queue_function)
end

PlayFabRequestQueue._get_eac_response = function (self, challenge)
	local i = 0
	local str = ""

	while challenge[tostring(i)] do
		str = str .. string.char(challenge[tostring(i)])
		i = i + 1
	end

	local eac_response = EAC.challenge_response(str)
	local response = nil

	if eac_response then
		local index = 1
		response = {}

		while string.byte(eac_response, index, index) do
			local byte_value = string.byte(eac_response, index, index)
			response[tostring(index - 1)] = byte_value
			index = index + 1
		end
	end

	return eac_response, response
end

return
