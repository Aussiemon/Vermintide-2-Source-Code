local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local PlayFabSettings = require("PlayFab.PlayFabSettings")
local PlayFabClientApi = {
	settings = PlayFabSettings.settings,
	IsClientLoggedIn = function ()
		return PlayFabSettings._internalSettings.sessionTicket ~= nil
	end,
	_MultiStepClientLogin = function (needsAttribution)
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
	end,
	GetPhotonAuthenticationToken = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPhotonAuthenticationToken", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetTitlePublicKey = function (request, onSuccess, onError)
		IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitlePublicKey", request, nil, nil, onSuccess, onError)
	end,
	GetWindowsHelloChallenge = function (request, onSuccess, onError)
		IPlayFabHttps.MakePlayFabApiCall("/Client/GetWindowsHelloChallenge", request, nil, nil, onSuccess, onError)
	end,
	LoginWithAndroidDeviceID = function (request, onSuccess, onError)
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
	end,
	LoginWithCustomID = function (request, onSuccess, onError)
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
	end,
	LoginWithEmailAddress = function (request, onSuccess, onError)
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
	end,
	LoginWithFacebook = function (request, onSuccess, onError)
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
	end,
	LoginWithGameCenter = function (request, onSuccess, onError)
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
	end,
	LoginWithGoogleAccount = function (request, onSuccess, onError)
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
	end,
	LoginWithIOSDeviceID = function (request, onSuccess, onError)
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
	end,
	LoginWithKongregate = function (request, onSuccess, onError)
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
	end,
	LoginWithPlayFab = function (request, onSuccess, onError)
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
	end,
	LoginWithSteam = function (request, onSuccess, onError)
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
	end,
	LoginWithXbox = function (request, onSuccess, onError)
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
	end,
	LoginWithPSN = function (request, onSuccess, onError)
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
	end,
	LoginWithTwitch = function (request, onSuccess, onError)
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
	end,
	LoginWithWindowsHello = function (request, onSuccess, onError)
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
	end,
	RegisterPlayFabUser = function (request, onSuccess, onError)
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
	end,
	RegisterWithWindowsHello = function (request, onSuccess, onError)
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
	end,
	SetPlayerSecret = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/SetPlayerSecret", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	AddGenericID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AddGenericID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	AddUsernamePassword = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AddUsernamePassword", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetAccountInfo = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetAccountInfo", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayerCombinedInfo = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerCombinedInfo", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayerProfile = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerProfile", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayFabIDsFromFacebookIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromFacebookIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayFabIDsFromGameCenterIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGameCenterIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayFabIDsFromGenericIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGenericIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayFabIDsFromGoogleIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGoogleIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayFabIDsFromKongregateIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromKongregateIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayFabIDsFromSteamIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromSteamIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayFabIDsFromTwitchIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromTwitchIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	LinkAndroidDeviceID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkAndroidDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	LinkCustomID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkCustomID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	LinkFacebookAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkFacebookAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	LinkGameCenterAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkGameCenterAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	LinkGoogleAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkGoogleAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	LinkIOSDeviceID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkIOSDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	LinkKongregate = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkKongregate", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	LinkSteamAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkSteamAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	LinkTwitch = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkTwitch", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	LinkWindowsHello = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkWindowsHello", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	RemoveGenericID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveGenericID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	ReportPlayer = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ReportPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	SendAccountRecoveryEmail = function (request, onSuccess, onError)
		IPlayFabHttps.MakePlayFabApiCall("/Client/SendAccountRecoveryEmail", request, nil, nil, onSuccess, onError)
	end,
	UnlinkAndroidDeviceID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkAndroidDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UnlinkCustomID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkCustomID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UnlinkFacebookAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkFacebookAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UnlinkGameCenterAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkGameCenterAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UnlinkGoogleAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkGoogleAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UnlinkIOSDeviceID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkIOSDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UnlinkKongregate = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkKongregate", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UnlinkSteamAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkSteamAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UnlinkTwitch = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkTwitch", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UnlinkWindowsHello = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkWindowsHello", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UpdateAvatarUrl = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateAvatarUrl", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UpdateUserTitleDisplayName = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserTitleDisplayName", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetFriendLeaderboard = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetFriendLeaderboardAroundPlayer = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendLeaderboardAroundPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetLeaderboard = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetLeaderboardAroundPlayer = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardAroundPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayerStatistics = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayerStatisticVersions = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerStatisticVersions", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetUserData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetUserPublisherData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetUserPublisherReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserPublisherReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetUserReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UpdatePlayerStatistics = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdatePlayerStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UpdateUserData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UpdateUserPublisherData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetCatalogItems = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCatalogItems", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPublisherData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetStoreItems = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetStoreItems", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetTime = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetTime", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetTitleData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitleData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetTitleNews = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitleNews", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	AddUserVirtualCurrency = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AddUserVirtualCurrency", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	ConfirmPurchase = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ConfirmPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	ConsumeItem = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ConsumeItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetCharacterInventory = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterInventory", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPurchase = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetUserInventory = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserInventory", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	PayForPurchase = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/PayForPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	PurchaseItem = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/PurchaseItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	RedeemCoupon = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RedeemCoupon", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	StartPurchase = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/StartPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	SubtractUserVirtualCurrency = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/SubtractUserVirtualCurrency", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UnlockContainerInstance = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlockContainerInstance", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UnlockContainerItem = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlockContainerItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	AddFriend = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AddFriend", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetFriendsList = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendsList", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	RemoveFriend = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveFriend", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	SetFriendTags = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/SetFriendTags", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetCurrentGames = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCurrentGames", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetGameServerRegions = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetGameServerRegions", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	Matchmake = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/Matchmake", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	StartGame = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/StartGame", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	WriteCharacterEvent = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/WriteCharacterEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	WritePlayerEvent = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/WritePlayerEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	WriteTitleEvent = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/WriteTitleEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	AddSharedGroupMembers = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AddSharedGroupMembers", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	CreateSharedGroup = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/CreateSharedGroup", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetSharedGroupData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetSharedGroupData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	RemoveSharedGroupMembers = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveSharedGroupMembers", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UpdateSharedGroupData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateSharedGroupData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	ExecuteCloudScript = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ExecuteCloudScript", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetContentDownloadUrl = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetContentDownloadUrl", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetAllUsersCharacters = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetAllUsersCharacters", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetCharacterLeaderboard = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetCharacterStatistics = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetLeaderboardAroundCharacter = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardAroundCharacter", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetLeaderboardForUserCharacters = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardForUserCharacters", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GrantCharacterToUser = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GrantCharacterToUser", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UpdateCharacterStatistics = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateCharacterStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetCharacterData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetCharacterReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	UpdateCharacterData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateCharacterData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	AcceptTrade = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AcceptTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	CancelTrade = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/CancelTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayerTrades = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerTrades", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetTradeStatus = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetTradeStatus", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	OpenTrade = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/OpenTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	AttributeInstall = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		PlayFabSettings.settings.advertisingIdType = PlayFabSettings.settings.advertisingIdType .. "_Successful"

		IPlayFabHttps.MakePlayFabApiCall("/Client/AttributeInstall", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayerSegments = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerSegments", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	GetPlayerTags = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerTags", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	AndroidDevicePushNotificationRegistration = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AndroidDevicePushNotificationRegistration", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	RegisterForIOSPushNotification = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterForIOSPushNotification", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	RestoreIOSPurchases = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RestoreIOSPurchases", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	ValidateAmazonIAPReceipt = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateAmazonIAPReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	ValidateGooglePlayPurchase = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateGooglePlayPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	ValidateIOSReceipt = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateIOSReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end,
	ValidateWindowsStoreReceipt = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateWindowsStoreReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)
	end
}

return PlayFabClientApi
