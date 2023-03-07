local PlayFabSettings = require("PlayFab.PlayFabSettings")
local IPlayFabHttps = {
	_defaultHttpsFile = "PlayFab.PlayFabHttps_LuaSec"
}

IPlayFabHttps.SetHttp = function (httpInterface)
	if httpInterface then
		IPlayFabHttps._internalHttp = httpInterface

		return
	end

	if IPlayFabHttps._defaultHttpsFile then
		IPlayFabHttps._internalHttp = require(IPlayFabHttps._defaultHttpsFile)

		return
	end
end

IPlayFabHttps.MakePlayFabApiCall = function (urlPath, request, authKey, authValue, onSuccess, onError)
	if IPlayFabHttps._internalHttp == nil then
		IPlayFabHttps.SetHttp(nil)
	end

	if PlayFabSettings.settings.titleId == nil then
		error("PlayFabSettings.settings.titleId must be set before making API calls")
	end

	IPlayFabHttps._internalHttp.MakePlayFabApiCall(urlPath, request, authKey, authValue, onSuccess, onError)
end

return IPlayFabHttps
