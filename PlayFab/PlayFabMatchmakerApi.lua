local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local PlayFabSettings = require("PlayFab.PlayFabSettings")
local PlayFabMatchmakerApi = {
	settings = PlayFabSettings.settings,
	AuthUser = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/AuthUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	PlayerJoined = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/PlayerJoined", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	PlayerLeft = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/PlayerLeft", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	StartGame = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/StartGame", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UserInfo = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/UserInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end
}

return PlayFabMatchmakerApi
