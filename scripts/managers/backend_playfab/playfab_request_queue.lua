local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
PlayFabRequestQueue = class(PlayFabRequestQueue)

PlayFabRequestQueue.init = function (self)
	self._queue = {}
	self._pending_request = false
end

PlayFabRequestQueue.enqueue = function (self, name, request, immediate, send_eac_challenge)
	local entry = {
		name = name,
		request = request
	}

	if send_eac_challenge then
		local function request_callback(entry, result)
			if result.Error then
				table.dump(result, nil, 5)
				self:_challenge_response_received(entry, false)
			else
				local function_result = result.FunctionResult
				local challenge = function_result.challenge
				local eac_response, response = nil

				if challenge then
					eac_response, response = self:_get_eac_response(challenge)
				end

				if not challenge then
					print("EAC disabled on backend")
					self:_challenge_response_received(entry, true)
				elseif not eac_response then
					print("EAC disabled on client")
					Managers.backend:playfab_eac_error()
				else
					print("EAC Enabled!")
					self:_challenge_response_received(entry, true, response)
				end
			end
		end

		local challenge_entry = {
			name = "generate_eac_challenge",
			request = {
				payload = {
					FunctionName = "generateChallenge"
				},
				callback = function (payload, on_complete)
					PlayFabClientApi.ExecuteCloudScript(payload, callback(request_callback, entry), callback(request_callback, entry))
				end
			}
		}

		print("[PlayFabRequestQueue] Enqueuing Challenge request for", name, #self._queue)
		table.insert(self._queue, challenge_entry)

		return
	end

	if immediate then
		self:send_request(entry)

		self._pending_request = false
	else
		print("[PlayFabRequestQueue] Enqueuing request", name, #self._queue)
		table.insert(self._queue, entry)
	end
end

PlayFabRequestQueue.update = function (self)
	if self._pending_request then
		return
	end

	if table.is_empty(self._queue) then
		return
	end

	local entry = table.remove(self._queue, 1)

	self:send_request(entry)
end

PlayFabRequestQueue.send_request = function (self, entry)
	print("[PlayFabRequestQueue] Sending request", entry.name)
	entry.request.callback(entry.request.payload, function ()
		print("[PlayFabRequestQueue] Request processed", entry.name)

		self._pending_request = false
	end)

	self._pending_request = true
end

PlayFabRequestQueue._challenge_response_received = function (self, entry, success, eac_response)
	if success then
		local payload = entry.request.payload
		local function_params = payload.FunctionParameter or {}
		function_params.response = eac_response
		payload.FunctionParameter = function_params

		self:send_request(entry)
	end
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
