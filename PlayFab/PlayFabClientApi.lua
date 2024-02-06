-- chunkname: @PlayFab/PlayFabClientApi.lua

local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local PlayFabSettings = require("PlayFab.PlayFabSettings")
local PlayFabClientApi = {
	settings = PlayFabSettings.settings,
}

PlayFabClientApi.IsClientLoggedIn = function ()
	return PlayFabSettings._internalSettings.sessionTicket ~= nil
end

PlayFabClientApi._MultiStepClientLogin = function (needsAttribution)
	if needsAttribution and not PlayFabSettings.settings.disableAdvertising and PlayFabSettings.settings.advertisingIdType and PlayFabSettings.settings.advertisingIdValue then
		local request = {}

		if PlayFabSettings.settings.advertisingIdType == PlayFabSettings.settings.AD_TYPE_IDFA then
			request.Idfa = PlayFabSettings.settings.advertisingIdValue
		elseif PlayFabSettings.settings.advertisingIdType == PlayFabSettings.settings.AD_TYPE_ANDROID_ID then
			request.Adid = PlayFabSettings.settings.advertisingIdValue
		else
			return
		end

		PlayFabClientApi.AttributeInstall(request, nil, nil)
	end
end

PlayFabClientApi.GetPhotonAuthenticationToken = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPhotonAuthenticationToken", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetTitlePublicKey = function (request, onSuccess, onError)
	IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitlePublicKey", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.GetWindowsHelloChallenge = function (request, onSuccess, onError)
	IPlayFabHttps.MakePlayFabApiCall("/Client/GetWindowsHelloChallenge", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithAndroidDeviceID = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithAndroidDeviceID", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithCustomID = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithCustomID", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithEmailAddress = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithEmailAddress", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithFacebook = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithFacebook", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithGameCenter = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithGameCenter", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithGoogleAccount = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithGoogleAccount", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithIOSDeviceID = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithIOSDeviceID", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithKongregate = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithKongregate", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithPlayFab = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithPlayFab", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithSteam = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithSteam", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithXbox = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithXbox", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithPSN = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithPSN", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithTwitch = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithTwitch", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.LoginWithWindowsHello = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithWindowsHello", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.RegisterPlayFabUser = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterPlayFabUser", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.RegisterWithWindowsHello = function (request, onSuccess, onError)
	request.TitleId = PlayFabSettings.settings.titleId

	local externalOnSuccess = onSuccess

	local function wrappedOnSuccess(result)
		PlayFabSettings._internalSettings.sessionTicket = result.SessionTicket

		if externalOnSuccess then
			externalOnSuccess(result)
		end

		PlayFabClientApi._MultiStepClientLogin(result.SettingsForUser.NeedsAttribution)
	end

	onSuccess = wrappedOnSuccess

	IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterWithWindowsHello", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.SetPlayerSecret = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/SetPlayerSecret", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.AddGenericID = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/AddGenericID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.AddUsernamePassword = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/AddUsernamePassword", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetAccountInfo = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetAccountInfo", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayerCombinedInfo = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerCombinedInfo", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayerProfile = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerProfile", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayFabIDsFromFacebookIDs = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromFacebookIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayFabIDsFromGameCenterIDs = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGameCenterIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayFabIDsFromGenericIDs = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGenericIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayFabIDsFromGoogleIDs = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGoogleIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayFabIDsFromKongregateIDs = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromKongregateIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayFabIDsFromSteamIDs = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromSteamIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayFabIDsFromTwitchIDs = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromTwitchIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.LinkAndroidDeviceID = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/LinkAndroidDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.LinkCustomID = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/LinkCustomID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.LinkFacebookAccount = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/LinkFacebookAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.LinkGameCenterAccount = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/LinkGameCenterAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.LinkGoogleAccount = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/LinkGoogleAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.LinkIOSDeviceID = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/LinkIOSDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.LinkKongregate = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/LinkKongregate", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.LinkSteamAccount = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/LinkSteamAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.LinkTwitch = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/LinkTwitch", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.LinkWindowsHello = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/LinkWindowsHello", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.RemoveGenericID = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveGenericID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.ReportPlayer = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/ReportPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.SendAccountRecoveryEmail = function (request, onSuccess, onError)
	IPlayFabHttps.MakePlayFabApiCall("/Client/SendAccountRecoveryEmail", request, nil, nil, onSuccess, onError)
end

PlayFabClientApi.UnlinkAndroidDeviceID = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkAndroidDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UnlinkCustomID = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkCustomID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UnlinkFacebookAccount = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkFacebookAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UnlinkGameCenterAccount = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkGameCenterAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UnlinkGoogleAccount = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkGoogleAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UnlinkIOSDeviceID = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkIOSDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UnlinkKongregate = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkKongregate", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UnlinkSteamAccount = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkSteamAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UnlinkTwitch = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkTwitch", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UnlinkWindowsHello = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkWindowsHello", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UpdateAvatarUrl = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateAvatarUrl", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UpdateUserTitleDisplayName = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserTitleDisplayName", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetFriendLeaderboard = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetFriendLeaderboardAroundPlayer = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendLeaderboardAroundPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetLeaderboard = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetLeaderboardAroundPlayer = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardAroundPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayerStatistics = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayerStatisticVersions = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerStatisticVersions", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetUserData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetUserPublisherData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetUserPublisherReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserPublisherReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetUserReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UpdatePlayerStatistics = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UpdatePlayerStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UpdateUserData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UpdateUserPublisherData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetCatalogItems = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetCatalogItems", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPublisherData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetStoreItems = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetStoreItems", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetTime = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetTime", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetTitleData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitleData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetTitleNews = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitleNews", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.AddUserVirtualCurrency = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/AddUserVirtualCurrency", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.ConfirmPurchase = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/ConfirmPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.ConsumeItem = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/ConsumeItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetCharacterInventory = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterInventory", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPurchase = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetUserInventory = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserInventory", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.PayForPurchase = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/PayForPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.PurchaseItem = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/PurchaseItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.RedeemCoupon = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/RedeemCoupon", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.StartPurchase = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/StartPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.SubtractUserVirtualCurrency = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/SubtractUserVirtualCurrency", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UnlockContainerInstance = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlockContainerInstance", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UnlockContainerItem = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UnlockContainerItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.AddFriend = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/AddFriend", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetFriendsList = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendsList", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.RemoveFriend = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveFriend", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.SetFriendTags = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/SetFriendTags", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetCurrentGames = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetCurrentGames", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetGameServerRegions = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetGameServerRegions", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.Matchmake = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/Matchmake", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.StartGame = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/StartGame", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.WriteCharacterEvent = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/WriteCharacterEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.WritePlayerEvent = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/WritePlayerEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.WriteTitleEvent = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/WriteTitleEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.AddSharedGroupMembers = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/AddSharedGroupMembers", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.CreateSharedGroup = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/CreateSharedGroup", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetSharedGroupData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetSharedGroupData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.RemoveSharedGroupMembers = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveSharedGroupMembers", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UpdateSharedGroupData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateSharedGroupData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.ExecuteCloudScript = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/ExecuteCloudScript", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetContentDownloadUrl = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetContentDownloadUrl", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetAllUsersCharacters = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetAllUsersCharacters", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetCharacterLeaderboard = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetCharacterStatistics = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetLeaderboardAroundCharacter = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardAroundCharacter", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetLeaderboardForUserCharacters = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardForUserCharacters", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GrantCharacterToUser = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GrantCharacterToUser", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UpdateCharacterStatistics = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateCharacterStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetCharacterData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetCharacterReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.UpdateCharacterData = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateCharacterData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.AcceptTrade = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/AcceptTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.CancelTrade = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/CancelTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayerTrades = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerTrades", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetTradeStatus = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetTradeStatus", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.OpenTrade = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/OpenTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.AttributeInstall = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	PlayFabSettings.settings.advertisingIdType = PlayFabSettings.settings.advertisingIdType .. "_Successful"

	IPlayFabHttps.MakePlayFabApiCall("/Client/AttributeInstall", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayerSegments = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerSegments", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.GetPlayerTags = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerTags", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.AndroidDevicePushNotificationRegistration = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/AndroidDevicePushNotificationRegistration", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.RegisterForIOSPushNotification = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterForIOSPushNotification", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.RestoreIOSPurchases = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/RestoreIOSPurchases", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.ValidateAmazonIAPReceipt = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateAmazonIAPReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.ValidateGooglePlayPurchase = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateGooglePlayPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.ValidateIOSReceipt = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateIOSReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

PlayFabClientApi.ValidateWindowsStoreReceipt = function (request, onSuccess, onError)
	if not PlayFabClientApi.IsClientLoggedIn() then
		error("Must be logged in to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateWindowsStoreReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
end

return PlayFabClientApi
