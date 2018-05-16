local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local PlayFabSettings = require("PlayFab.PlayFabSettings")
local PlayFabAdminApi = {
	settings = PlayFabSettings.settings,
	CreatePlayerSharedSecret = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/CreatePlayerSharedSecret", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	DeletePlayerSharedSecret = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/DeletePlayerSharedSecret", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetPlayerSharedSecrets = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerSharedSecrets", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetPolicy = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPolicy", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	SetPlayerSecret = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/SetPlayerSecret", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdatePlayerSharedSecret = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdatePlayerSharedSecret", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdatePolicy = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdatePolicy", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	BanUsers = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/BanUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	DeletePlayer = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/DeletePlayer", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetUserAccountInfo = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserAccountInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetUserBans = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	ResetUsers = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/ResetUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	RevokeAllBansForUser = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/RevokeAllBansForUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	RevokeBans = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/RevokeBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	SendAccountRecoveryEmail = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/SendAccountRecoveryEmail", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateBans = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateUserTitleDisplayName = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserTitleDisplayName", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	CreatePlayerStatisticDefinition = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/CreatePlayerStatisticDefinition", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	DeleteUsers = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetDataReport = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetDataReport", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetPlayerStatisticDefinitions = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerStatisticDefinitions", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetPlayerStatisticVersions = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerStatisticVersions", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetUserData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetUserInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetUserPublisherData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetUserPublisherInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserPublisherInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetUserPublisherReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserPublisherReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetUserReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	IncrementPlayerStatisticVersion = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/IncrementPlayerStatisticVersion", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	RefundPurchase = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/RefundPurchase", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	ResetUserStatistics = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/ResetUserStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	ResolvePurchaseDispute = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/ResolvePurchaseDispute", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdatePlayerStatisticDefinition = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdatePlayerStatisticDefinition", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateUserData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateUserInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateUserPublisherData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateUserPublisherInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserPublisherInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateUserPublisherReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserPublisherReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateUserReadOnlyData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	AddNews = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/AddNews", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	AddVirtualCurrencyTypes = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/AddVirtualCurrencyTypes", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	DeleteStore = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteStore", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetCatalogItems = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCatalogItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetPublisherData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetRandomResultTables = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetRandomResultTables", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetStoreItems = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetStoreItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetTitleData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTitleData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetTitleInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTitleInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	ListVirtualCurrencyTypes = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/ListVirtualCurrencyTypes", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	RemoveVirtualCurrencyTypes = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/RemoveVirtualCurrencyTypes", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	SetCatalogItems = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/SetCatalogItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	SetStoreItems = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/SetStoreItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	SetTitleData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/SetTitleData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	SetTitleInternalData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/SetTitleInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	SetupPushNotification = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/SetupPushNotification", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateCatalogItems = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateCatalogItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateRandomResultTables = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateRandomResultTables", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateStoreItems = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateStoreItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	AddUserVirtualCurrency = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/AddUserVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetUserInventory = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserInventory", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GrantItemsToUsers = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GrantItemsToUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	RevokeInventoryItem = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/RevokeInventoryItem", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	SubtractUserVirtualCurrency = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/SubtractUserVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetMatchmakerGameInfo = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetMatchmakerGameInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetMatchmakerGameModes = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetMatchmakerGameModes", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	ModifyMatchmakerGameModes = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/ModifyMatchmakerGameModes", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	AddServerBuild = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/AddServerBuild", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetServerBuildInfo = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetServerBuildInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetServerBuildUploadUrl = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetServerBuildUploadUrl", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	ListServerBuilds = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/ListServerBuilds", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	ModifyServerBuild = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/ModifyServerBuild", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	RemoveServerBuild = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/RemoveServerBuild", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	SetPublisherData = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/SetPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetCloudScriptRevision = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCloudScriptRevision", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetCloudScriptVersions = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCloudScriptVersions", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	SetPublishedRevision = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/SetPublishedRevision", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateCloudScript = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateCloudScript", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	DeleteContent = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteContent", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetContentList = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetContentList", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetContentUploadUrl = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetContentUploadUrl", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	ResetCharacterStatistics = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/ResetCharacterStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	AddPlayerTag = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/AddPlayerTag", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetAllActionGroups = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetAllActionGroups", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetAllSegments = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetAllSegments", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetPlayerSegments = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerSegments", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetPlayersInSegment = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayersInSegment", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetPlayerTags = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerTags", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	RemovePlayerTag = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/RemovePlayerTag", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	AbortTaskInstance = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/AbortTaskInstance", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	CreateActionsOnPlayersInSegmentTask = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/CreateActionsOnPlayersInSegmentTask", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	CreateCloudScriptTask = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/CreateCloudScriptTask", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	DeleteTask = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteTask", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetActionsOnPlayersInSegmentTaskInstance = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetActionsOnPlayersInSegmentTaskInstance", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetCloudScriptTaskInstance = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCloudScriptTaskInstance", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetTaskInstances = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTaskInstances", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	GetTasks = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTasks", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	RunTask = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/RunTask", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end,
	UpdateTask = function (request, onSuccess, onError)
		if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
			error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
		end

		IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateTask", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
	end
}

return PlayFabAdminApi
