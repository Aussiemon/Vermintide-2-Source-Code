local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local PlayFabSettings = require("PlayFab.PlayFabSettings")
local PlayFabServerApi = {
	settings = PlayFabSettings.settings,
	AuthenticateSessionTicket = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/AuthenticateSessionTicket", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	SetPlayerSecret = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/SetPlayerSecret", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	BanUsers = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/BanUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetPlayerProfile = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerProfile", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetPlayFabIDsFromFacebookIDs = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayFabIDsFromFacebookIDs", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetPlayFabIDsFromSteamIDs = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayFabIDsFromSteamIDs", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetUserAccountInfo = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserAccountInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetUserBans = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	RevokeAllBansForUser = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/RevokeAllBansForUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	RevokeBans = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/RevokeBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	SendPushNotification = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/SendPushNotification", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateAvatarUrl = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateAvatarUrl", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateBans = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	DeleteUsers = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/DeleteUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetFriendLeaderboard = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetFriendLeaderboard", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetLeaderboard = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboard", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetLeaderboardAroundUser = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboardAroundUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetPlayerCombinedInfo = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerCombinedInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetPlayerStatistics = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetPlayerStatisticVersions = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerStatisticVersions", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetUserData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetUserInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetUserPublisherData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetUserPublisherInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserPublisherInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetUserPublisherReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserPublisherReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetUserReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdatePlayerStatistics = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdatePlayerStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateUserData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateUserInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateUserPublisherData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateUserPublisherInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserPublisherInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateUserPublisherReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserPublisherReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateUserReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetCatalogItems = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetCatalogItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetPublisherData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetTime = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetTime", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetTitleData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetTitleData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetTitleInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetTitleInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetTitleNews = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetTitleNews", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	SetPublisherData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/SetPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	SetTitleData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/SetTitleData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	SetTitleInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/SetTitleInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	AddCharacterVirtualCurrency = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/AddCharacterVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	AddUserVirtualCurrency = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/AddUserVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	ConsumeItem = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/ConsumeItem", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	EvaluateRandomResultTable = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/EvaluateRandomResultTable", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetCharacterInventory = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterInventory", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetRandomResultTables = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetRandomResultTables", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetUserInventory = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserInventory", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GrantItemsToCharacter = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GrantItemsToCharacter", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GrantItemsToUser = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GrantItemsToUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GrantItemsToUsers = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GrantItemsToUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	ModifyItemUses = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/ModifyItemUses", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	MoveItemToCharacterFromCharacter = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/MoveItemToCharacterFromCharacter", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	MoveItemToCharacterFromUser = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/MoveItemToCharacterFromUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	MoveItemToUserFromCharacter = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/MoveItemToUserFromCharacter", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	RedeemCoupon = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/RedeemCoupon", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	ReportPlayer = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/ReportPlayer", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	RevokeInventoryItem = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/RevokeInventoryItem", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	SubtractCharacterVirtualCurrency = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/SubtractCharacterVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	SubtractUserVirtualCurrency = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/SubtractUserVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UnlockContainerInstance = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UnlockContainerInstance", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UnlockContainerItem = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UnlockContainerItem", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateUserInventoryItemCustomData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserInventoryItemCustomData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	AddFriend = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/AddFriend", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetFriendsList = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetFriendsList", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	RemoveFriend = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/RemoveFriend", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	SetFriendTags = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/SetFriendTags", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	DeregisterGame = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/DeregisterGame", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	NotifyMatchmakerPlayerLeft = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/NotifyMatchmakerPlayerLeft", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	RedeemMatchmakerTicket = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/RedeemMatchmakerTicket", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	RefreshGameServerInstanceHeartbeat = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/RefreshGameServerInstanceHeartbeat", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	RegisterGame = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/RegisterGame", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	SetGameServerInstanceData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/SetGameServerInstanceData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	SetGameServerInstanceState = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/SetGameServerInstanceState", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	SetGameServerInstanceTags = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/SetGameServerInstanceTags", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	WriteCharacterEvent = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/WriteCharacterEvent", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	WritePlayerEvent = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/WritePlayerEvent", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	WriteTitleEvent = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/WriteTitleEvent", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	AddSharedGroupMembers = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/AddSharedGroupMembers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	CreateSharedGroup = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/CreateSharedGroup", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	DeleteSharedGroup = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/DeleteSharedGroup", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetSharedGroupData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetSharedGroupData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	RemoveSharedGroupMembers = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/RemoveSharedGroupMembers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateSharedGroupData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateSharedGroupData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	ExecuteCloudScript = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/ExecuteCloudScript", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetContentDownloadUrl = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetContentDownloadUrl", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	DeleteCharacterFromUser = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/DeleteCharacterFromUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetAllUsersCharacters = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetAllUsersCharacters", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetCharacterLeaderboard = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterLeaderboard", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetCharacterStatistics = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetLeaderboardAroundCharacter = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboardAroundCharacter", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetLeaderboardForUserCharacters = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboardForUserCharacters", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GrantCharacterToUser = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GrantCharacterToUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateCharacterStatistics = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetCharacterData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetCharacterInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetCharacterReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateCharacterData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateCharacterInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	UpdateCharacterReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	AddPlayerTag = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/AddPlayerTag", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetAllActionGroups = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetAllActionGroups", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetAllSegments = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetAllSegments", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetPlayerSegments = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerSegments", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetPlayersInSegment = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayersInSegment", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	GetPlayerTags = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerTags", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	RemovePlayerTag = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/RemovePlayerTag", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end,
	AwardSteamAchievement = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Server/AwardSteamAchievement", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)

		return 
	end
}

return PlayFabServerApi
