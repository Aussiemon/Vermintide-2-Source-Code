local PlayFabClientApi = require("PlayFab.PlayFabClientApi")

local function guid()
	if PLATFORM == "ps4" then
		local pattern = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

		return string.gsub(pattern, "x", function (c)
			return string.format("%x", math.random(0, 15))
		end)
	else
		return Application.guid()
	end
end

PlayFabRequestQueue = class(PlayFabRequestQueue)
local MAX_RETRIES = 2
local TIMEOUT_TIME = 20

PlayFabRequestQueue.init = function (self)
	self._queue = {}
	self._active_entry = nil
	self._id = 0
end

PlayFabRequestQueue.enqueue = function (self, request, success_callback, send_eac_challenge)
	local id = self._id + 1
	local entry = {
		eac_challenge_success = false,
		resends = 0,
		request = table.clone(request),
		success_callback = success_callback,
		send_eac_challenge = send_eac_challenge,
		timeout = TIMEOUT_TIME,
		id = id
	}

	print("[PlayFabRequestQueue] Enqueuing request", request.FunctionName, id)
	table.insert(self._queue, entry)

	self._id = id

	return id
end

PlayFabRequestQueue.update = function (self, dt)
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
			print("[PlayFabRequestQueue] Request Timed Out", active_request.FunctionName, active_entry.id)
			table.dump(active_entry, nil, 5)
			Crashify.print_exception("PlayFabRequestQueue", "Request Timed Out")

			return "request_timed_out", active_entry.id
		end
	end

	if table.is_empty(self._queue) then
		return
	end

	local entry = table.remove(self._queue, 1)
	local request = entry.request
	self._active_entry = entry

	if entry.send_eac_challenge then
		local success_cb = callback(self, "eac_challenge_success_cb")
		local generate_challenge_request = {
			FunctionName = "generateChallenge",
			FunctionParameter = {
				request_id = entry.id
			}
		}

		print("[PlayFabRequestQueue] Sending EAC Challenge Request", request.FunctionName, entry.id)
		PlayFabClientApi.ExecuteCloudScript(generate_challenge_request, success_cb)
	else
		print("[PlayFabRequestQueue] Sending Request Without EAC Challenge", request.FunctionName, entry.id)
		self:_send_request(entry)
	end
end

PlayFabRequestQueue.eac_challenge_success_cb = function (self, result)
	local entry = self._active_entry
	local function_result = result.FunctionResult
	local challenge = function_result.challenge
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
	local request = entry.request
	local function_params = request.FunctionParameter or {}
	function_params.response = response
	request.FunctionParameter = function_params

	print("[PlayFabRequestQueue] Sending Request", request.FunctionName, entry.id)
	self:_send_request(entry)
end

PlayFabRequestQueue._send_request = function (self, entry)
	local request = entry.request
	local success_callback = entry.success_callback
	local success_cb = callback(self, "playfab_request_success_cb", success_callback)

	PlayFabClientApi.ExecuteCloudScript(request, success_cb)
end

PlayFabRequestQueue.playfab_request_success_cb = function (self, success_callback, result)
	local entry = self._active_entry
	local request = entry.request
	local function_result = result.FunctionResult

	if function_result and function_result.eac_failed_verification then
		print("[PlayFabRequestQueue] EAC Failed Verification", request.FunctionName, entry.id)
		Managers.backend:playfab_eac_error()

		return
	end

	print("[PlayFabRequestQueue] Request Success", request.FunctionName, entry.id)

	self._active_entry = nil

	success_callback(result)
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
