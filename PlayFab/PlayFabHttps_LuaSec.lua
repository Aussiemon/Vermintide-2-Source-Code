local https = require("ssl.https")
local ltn12 = require("ltn12")
local json = require("PlayFab.json")
local PlayFabSettings = require("PlayFab.PlayFabSettings")
local PlayFabHttps_LuaSec = {
	MakePlayFabApiCall = function (urlPath, request, authKey, authValue, onSuccess, onError)
		local requestJson = json.encode(request)
		local requestHeaders = {
			["X-ReportErrorAsSuccess"] = "true",
			["Content-Type"] = "application/json",
			["X-PlayFabSDK"] = PlayFabSettings._internalSettings.sdkVersionString,
			["content-length"] = tostring(string.len(requestJson))
		}

		if authKey then
			requestHeaders[authKey] = authValue
		end

		local playFabResponse = {}
		local fullUrl = "https://" .. PlayFabSettings.settings.titleId .. ".playfabapi.com/" .. urlPath
		local body, code, headers, status = https.request({
			method = "POST",
			url = fullUrl,
			headers = requestHeaders,
			source = ltn12.source.string(requestJson),
			sink = ltn12.sink.table(playFabResponse)
		})

		if code == 200 then
			local _, response = pcall(json.decode, playFabResponse[1] or "null")

			if response and response.code == 200 and response.data and onSuccess then
				onSuccess(response.data)
			elseif response and onError then
				onError(response)
			elseif onError then
				onError({
					errorCode = 1123,
					error = "ServiceUnavailable",
					code = code,
					status = status,
					errorMessage = "Could not deserialize reseponse from server: " .. playFabResponse[1]
				})
			end
		elseif onError then
			onError({
				errorCode = 1123,
				error = "ServiceUnavailable",
				code = code,
				status = status,
				errorMessage = "Could not deserialize reseponse from server: " .. playFabResponse[1]
			})
		end

		return 
	end
}

return PlayFabHttps_LuaSec
