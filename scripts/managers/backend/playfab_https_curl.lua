local json = require("PlayFab.json")
local PlayFabSettings = require("PlayFab.PlayFabSettings")
active_requests = active_requests or {}

function curl_callback(success, code, headers, data, user_data)
	local request = active_requests[user_data]

	if success then
		if code == 200 then
			local _, response = pcall(json.decode, data)

			if response and response.code == 200 and response.data and request.onSuccess and not response.data.Error then
				request.onSuccess(response.data)
			elseif response and request.onError then
				request.onError(response)
			elseif request.onError then
				local error_data = {
					status = "",
					errorCode = 1123,
					error = "ServiceUnavailable",
					code = code,
					errorMessage = "Could not deserialize response from server: " .. data
				}

				request.onError(error_data)
			end
		elseif request.onError then
			local error_data = {
				status = "",
				errorCode = 1123,
				error = "ServiceUnavailable",
				code = code,
				errorMessage = "Could not deserialize response from server: " .. data
			}

			request.onError(error_data)
		end
	else
		local error_data = {
			status = "",
			errorCode = 1123,
			error = "ServiceUnavailable",
			code = code,
			errorMessage = "Could not deserialize response from server: " .. data
		}

		request.onError(error_data)
	end

	return 
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

		local function fail_callback(result)
			local backend_manager = Managers.backend

			backend_manager.playfab_api_error(backend_manager, result)

			return 
		end

		local id = #active_requests + 1
		local callbacks = {
			onSuccess = on_success_callback,
			onError = fail_callback
		}
		active_requests[id] = callbacks
		local curl_manager = Managers.curl
		local full_url = "https://" .. PlayFabSettings.settings.titleId .. ".playfabapi.com/" .. url_path

		curl_manager.post(curl_manager, full_url, json_request, headers, curl_callback, id, {
			[curl_manager._curl.OPT_SSL_VERIFYPEER] = false
		})

		return 
	end
}

return PlayFabHttpsCurl
