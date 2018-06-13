local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
PlayFabRequestQueue = class(PlayFabRequestQueue)

PlayFabRequestQueue.init = function (self)
	self._queue = {}
	self._active_entry = nil
	self._fail_callback = callback(self, "playfab_request_fail_cb")
end

PlayFabRequestQueue.enqueue = function (self, request, success_callback, send_eac_challenge)
	local entry = {
		eac_challenge_success = false,
		resends = 0,
		request = table.clone(request),
		success_callback = success_callback,
		send_eac_challenge = send_eac_challenge
	}

	print("[PlayFabRequestQueue] Enqueuing request", request.FunctionName)
	table.insert(self._queue, entry)
end

PlayFabRequestQueue.update = function (self)
	if self._active_entry then
		return
	end

	if table.is_empty(self._queue) then
		return
	end

	local entry = table.remove(self._queue, 1)
	local request = entry.request
	self._active_entry = entry

	if entry.send_eac_challenge then
		local success_cb = callback(self, "eac_challenge_success_cb")
		local fail_cb = self._fail_callback
		local generate_challenge_request = {
			FunctionName = "generateChallenge"
		}

		print("[PlayFabRequestQueue] Sending EAC Challenge Request", request.FunctionName)
		PlayFabClientApi.ExecuteCloudScript(generate_challenge_request, success_cb, fail_cb)
	else
		print("[PlayFabRequestQueue] Sending Request Without EAC Challenge", request.FunctionName)
		self:_send_request(entry)
	end
end

PlayFabRequestQueue.eac_challenge_success_cb = function (self, result)
	local function_result = result.FunctionResult
	local challenge = function_result.challenge
	local eac_response, response = nil

	if challenge then
		eac_response, response = self:_get_eac_response(challenge)
	end

	if not challenge then
		print("[PlayFabRequestQueue] EAC disabled on backend")
		self:_challenge_response_received()
	elseif not eac_response then
		print("[PlayFabRequestQueue] EAC disabled on client")
		Managers.backend:playfab_eac_error()
	else
		print("[PlayFabRequestQueue] EAC Enabled!")
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

	print("[PlayFabRequestQueue] Sending Request", request.FunctionName)
	self:_send_request(entry)
end

PlayFabRequestQueue._send_request = function (self, entry)
	local request = entry.request
	local success_callback = entry.success_callback
	local success_cb = callback(self, "playfab_request_success_cb", success_callback)
	local fail_cb = self._fail_callback

	PlayFabClientApi.ExecuteCloudScript(request, success_cb, fail_cb)
end

PlayFabRequestQueue.playfab_request_success_cb = function (self, success_callback, result)
	local entry = self._active_entry
	local request = entry.request
	local function_result = result.FunctionResult

	if function_result and function_result.eac_failed_verification then
		print("[PlayFabRequestQueue] EAC Failed Verification", request.FunctionName)
		Managers.backend:playfab_eac_error()

		return
	end

	print("[PlayFabRequestQueue] Request Success", request.FunctionName)

	self._active_entry = nil

	success_callback(result)
end

PlayFabRequestQueue.playfab_request_fail_cb = function (self, result, error_override)
	local entry = self._active_entry
	local request = entry.request

	print("[PlayFabRequestQueue] Request Failed", request.FunctionName)

	if entry.send_eac_challenge and not entry.eac_challenge_success then
	end

	local backend_manager = Managers.backend

	backend_manager:playfab_api_error(result, error_override)
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
