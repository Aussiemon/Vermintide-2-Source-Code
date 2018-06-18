local json = require("PlayFab.json")
local PlayFabSettings = require("PlayFab.PlayFabSettings")
active_requests = active_requests or {}
local MAX_RETRIES = 2
local retry_codes = {
	1199,
	1342,
	1133,
	1287,
	1127,
	1131,
	1214
}

local function on_error(request_data, result, error_override)
	local error_code = nil

	if error_override then
		error_code = error_override
	elseif result.data and result.data.Error then
		local logs = result.data.Logs

		if logs then
			for i = 1, #logs, 1 do
				local log = logs[i]
				local data = log.Data

				if data then
					local api_error = data.apiError

					if api_error then
						error_code = api_error.errorCode
					end
				end
			end
		end
	elseif result.errorCode then
		error_code = result.errorCode
	end

	if table.contains(retry_codes, error_code) and request_data.retries < MAX_RETRIES then
		local url = request_data.url
		local body = request_data.body
		local headers = request_data.headers
		local request_cb = request_data.request_cb
		local id = request_data.id
		local options = request_data.options

		Managers.curl:post(url, body, headers, request_cb, id, options)

		request_data.retries = request_data.retries + 1

		print("[PLAYFAB HTTPS CURL] RESENDING REQUEST", id, error_code)
		ScriptApplication.send_to_crashify("Backend_Error", "RESENDING REQUEST: %s", request_data)
	else
		Managers.backend:playfab_api_error(result, error_code)
	end
end

function curl_callback(success, code, headers, data, user_data)
	local request_data = active_requests[user_data]

	if success then
		local _, response = pcall(json.decode, data)

		if response and type(response) == "table" then
			if response.code == 200 and response.data and not response.data.Error then
				request_data.onSuccess(response.data)
			else
				on_error(request_data, response)
			end
		else
			local error_data = {
				error = "ServiceUnavailable",
				errorCode = 1123,
				status = "",
				code = code
			}

			if data then
				error_data.errorMessage = "Could not deserialize response from server: " .. tostring(data)
			else
				error_data.errorMessage = "Could not deserialize response from server: NO DATA"
			end

			on_error(request_data, error_data)
		end
	else
		local error_data = {
			error = "ServiceUnavailable",
			errorCode = 1123,
			status = "",
			code = code
		}

		if data then
			error_data.errorMessage = "Could not deserialize response from server: " .. tostring(data)
		else
			error_data.errorMessage = "Could not deserialize response from server: NO DATA"
		end

		on_error(request_data, error_data, tostring(data))
	end
end

local PlayFabHttpsCurl = {
	MakePlayFabApiCall = function (url_path, request, auth_key, auth_value, on_success_callback, on_fail_callback)
		local json_request = json.encode(request)
		local headers = {
			"X-ReportErrorAsSuccess: true",
			"X-PlayFabSDK: " .. PlayFabSettings._internalSettings.sdkVersionString,
			"Content-Type: application/json",
			"content-length: " .. tostring(string.len(json_request))
		}

		if auth_key then
			headers[#headers + 1] = auth_key .. ": " .. auth_value
		end

		local id = #active_requests + 1
		local curl_manager = Managers.curl
		local full_url = "https://" .. PlayFabSettings.settings.titleId .. ".playfabapi.com/" .. url_path
		local options = {
			[curl_manager._curl.OPT_SSL_VERIFYPEER] = false
		}
		local request_data = {
			retries = 0,
			onSuccess = on_success_callback,
			onFail = on_fail_callback,
			url = full_url,
			body = json_request,
			headers = headers,
			request_cb = curl_callback,
			id = id,
			options = options
		}
		active_requests[id] = request_data

		curl_manager:post(full_url, json_request, headers, curl_callback, id, options)
	end
}

return PlayFabHttpsCurl
