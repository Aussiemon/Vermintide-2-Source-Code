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

		return 
	end,
	GetPhotonAuthenticationToken = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPhotonAuthenticationToken", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetTitlePublicKey = function (request, onSuccess, onError)
		IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitlePublicKey", request, nil, nil, onSuccess, onError)

		return 
	end,
	GetWindowsHelloChallenge = function (request, onSuccess, onError)
		IPlayFabHttps.MakePlayFabApiCall("/Client/GetWindowsHelloChallenge", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithAndroidDeviceID", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithCustomID", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithEmailAddress", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithFacebook", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithGameCenter", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithGoogleAccount", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithIOSDeviceID", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithKongregate", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithPlayFab", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithSteam", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithTwitch", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/LoginWithWindowsHello", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterPlayFabUser", request, nil, nil, onSuccess, onError)

		return 
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

			return 
		end

		onSuccess = wrappedOnSuccess

		IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterWithWindowsHello", request, nil, nil, onSuccess, onError)

		return 
	end,
	SetPlayerSecret = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/SetPlayerSecret", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	AddGenericID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AddGenericID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	AddUsernamePassword = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AddUsernamePassword", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetAccountInfo = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetAccountInfo", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayerCombinedInfo = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerCombinedInfo", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayerProfile = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerProfile", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayFabIDsFromFacebookIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromFacebookIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayFabIDsFromGameCenterIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGameCenterIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayFabIDsFromGenericIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGenericIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayFabIDsFromGoogleIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromGoogleIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayFabIDsFromKongregateIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromKongregateIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayFabIDsFromSteamIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromSteamIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayFabIDsFromTwitchIDs = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayFabIDsFromTwitchIDs", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	LinkAndroidDeviceID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkAndroidDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	LinkCustomID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkCustomID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	LinkFacebookAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkFacebookAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	LinkGameCenterAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkGameCenterAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	LinkGoogleAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkGoogleAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	LinkIOSDeviceID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkIOSDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	LinkKongregate = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkKongregate", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	LinkSteamAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkSteamAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	LinkTwitch = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkTwitch", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	LinkWindowsHello = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/LinkWindowsHello", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	RemoveGenericID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveGenericID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	ReportPlayer = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ReportPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	SendAccountRecoveryEmail = function (request, onSuccess, onError)
		IPlayFabHttps.MakePlayFabApiCall("/Client/SendAccountRecoveryEmail", request, nil, nil, onSuccess, onError)

		return 
	end,
	UnlinkAndroidDeviceID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkAndroidDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UnlinkCustomID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkCustomID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UnlinkFacebookAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkFacebookAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UnlinkGameCenterAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkGameCenterAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UnlinkGoogleAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkGoogleAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UnlinkIOSDeviceID = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkIOSDeviceID", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UnlinkKongregate = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkKongregate", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UnlinkSteamAccount = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkSteamAccount", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UnlinkTwitch = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkTwitch", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UnlinkWindowsHello = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlinkWindowsHello", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UpdateAvatarUrl = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateAvatarUrl", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UpdateUserTitleDisplayName = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserTitleDisplayName", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetFriendLeaderboard = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetFriendLeaderboardAroundPlayer = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendLeaderboardAroundPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetLeaderboard = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetLeaderboardAroundPlayer = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardAroundPlayer", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayerStatistics = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayerStatisticVersions = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerStatisticVersions", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetUserData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetUserPublisherData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetUserPublisherReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserPublisherReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetUserReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UpdatePlayerStatistics = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdatePlayerStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UpdateUserData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UpdateUserPublisherData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateUserPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetCatalogItems = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCatalogItems", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPublisherData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPublisherData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetStoreItems = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetStoreItems", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetTime = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetTime", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetTitleData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitleData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetTitleNews = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetTitleNews", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	AddUserVirtualCurrency = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AddUserVirtualCurrency", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	ConfirmPurchase = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ConfirmPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	ConsumeItem = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ConsumeItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetCharacterInventory = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterInventory", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPurchase = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetUserInventory = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetUserInventory", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	PayForPurchase = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/PayForPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	PurchaseItem = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/PurchaseItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	RedeemCoupon = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RedeemCoupon", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	StartPurchase = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/StartPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	SubtractUserVirtualCurrency = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/SubtractUserVirtualCurrency", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UnlockContainerInstance = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlockContainerInstance", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UnlockContainerItem = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UnlockContainerItem", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	AddFriend = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AddFriend", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetFriendsList = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetFriendsList", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	RemoveFriend = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveFriend", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	SetFriendTags = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/SetFriendTags", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetCurrentGames = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCurrentGames", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetGameServerRegions = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetGameServerRegions", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	Matchmake = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/Matchmake", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	StartGame = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/StartGame", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	WriteCharacterEvent = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/WriteCharacterEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	WritePlayerEvent = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/WritePlayerEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	WriteTitleEvent = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/WriteTitleEvent", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	AddSharedGroupMembers = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AddSharedGroupMembers", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	CreateSharedGroup = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/CreateSharedGroup", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetSharedGroupData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetSharedGroupData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	RemoveSharedGroupMembers = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RemoveSharedGroupMembers", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UpdateSharedGroupData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateSharedGroupData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	ExecuteCloudScript = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ExecuteCloudScript", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetContentDownloadUrl = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetContentDownloadUrl", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetAllUsersCharacters = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetAllUsersCharacters", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetCharacterLeaderboard = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterLeaderboard", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetCharacterStatistics = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetLeaderboardAroundCharacter = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardAroundCharacter", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetLeaderboardForUserCharacters = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetLeaderboardForUserCharacters", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GrantCharacterToUser = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GrantCharacterToUser", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UpdateCharacterStatistics = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateCharacterStatistics", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetCharacterData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetCharacterReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetCharacterReadOnlyData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	UpdateCharacterData = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/UpdateCharacterData", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	AcceptTrade = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AcceptTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	CancelTrade = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/CancelTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayerTrades = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerTrades", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetTradeStatus = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetTradeStatus", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	OpenTrade = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/OpenTrade", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	AttributeInstall = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		PlayFabSettings.settings.advertisingIdType = PlayFabSettings.settings.advertisingIdType .. "_Successful"

		IPlayFabHttps.MakePlayFabApiCall("/Client/AttributeInstall", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayerSegments = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerSegments", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	GetPlayerTags = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/GetPlayerTags", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	AndroidDevicePushNotificationRegistration = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/AndroidDevicePushNotificationRegistration", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	RegisterForIOSPushNotification = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RegisterForIOSPushNotification", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	RestoreIOSPurchases = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/RestoreIOSPurchases", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	ValidateAmazonIAPReceipt = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateAmazonIAPReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	ValidateGooglePlayPurchase = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateGooglePlayPurchase", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	ValidateIOSReceipt = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateIOSReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end,
	ValidateWindowsStoreReceipt = function (request, onSuccess, onError)
		if not PlayFabClientApi.IsClientLoggedIn() then
			error("Must be logged in to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Client/ValidateWindowsStoreReceipt", request, "X-Authorization", PlayFabSettings._internalSettings.sessionTicket, onSuccess, onError)

		return 
	end
}

return PlayFabClientApi
