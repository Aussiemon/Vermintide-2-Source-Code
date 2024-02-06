-- chunkname: @PlayFab/PlayFabMatchmakerApi.lua

local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local PlayFabSettings = require("PlayFab.PlayFabSettings")
local PlayFabMatchmakerApi = {
	settings = PlayFabSettings.settings,
}

PlayFabMatchmakerApi.AuthUser = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/AuthUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabMatchmakerApi.PlayerJoined = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/PlayerJoined", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabMatchmakerApi.PlayerLeft = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/PlayerLeft", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabMatchmakerApi.StartGame = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/StartGame", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabMatchmakerApi.UserInfo = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Matchmaker/UserInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

return PlayFabMatchmakerApi
