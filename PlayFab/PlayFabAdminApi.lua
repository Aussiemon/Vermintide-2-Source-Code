-- chunkname: @PlayFab/PlayFabAdminApi.lua

local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local PlayFabSettings = require("PlayFab.PlayFabSettings")
local PlayFabAdminApi = {
	settings = PlayFabSettings.settings,
}

PlayFabAdminApi.CreatePlayerSharedSecret = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/CreatePlayerSharedSecret", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.DeletePlayerSharedSecret = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/DeletePlayerSharedSecret", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetPlayerSharedSecrets = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerSharedSecrets", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetPolicy = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPolicy", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.SetPlayerSecret = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/SetPlayerSecret", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdatePlayerSharedSecret = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdatePlayerSharedSecret", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdatePolicy = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdatePolicy", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.BanUsers = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/BanUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.DeletePlayer = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/DeletePlayer", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetUserAccountInfo = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserAccountInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetUserBans = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.ResetUsers = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/ResetUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.RevokeAllBansForUser = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/RevokeAllBansForUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.RevokeBans = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/RevokeBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.SendAccountRecoveryEmail = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/SendAccountRecoveryEmail", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateBans = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateUserTitleDisplayName = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserTitleDisplayName", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.CreatePlayerStatisticDefinition = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/CreatePlayerStatisticDefinition", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.DeleteUsers = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetDataReport = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetDataReport", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetPlayerStatisticDefinitions = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerStatisticDefinitions", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetPlayerStatisticVersions = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerStatisticVersions", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetUserData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetUserInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetUserPublisherData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetUserPublisherInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserPublisherInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetUserPublisherReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserPublisherReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetUserReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.IncrementPlayerStatisticVersion = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/IncrementPlayerStatisticVersion", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.RefundPurchase = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/RefundPurchase", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.ResetUserStatistics = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/ResetUserStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.ResolvePurchaseDispute = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/ResolvePurchaseDispute", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdatePlayerStatisticDefinition = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdatePlayerStatisticDefinition", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateUserData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateUserInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateUserPublisherData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateUserPublisherInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserPublisherInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateUserPublisherReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserPublisherReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateUserReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateUserReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.AddNews = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/AddNews", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.AddVirtualCurrencyTypes = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/AddVirtualCurrencyTypes", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.DeleteStore = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteStore", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetCatalogItems = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCatalogItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetPublisherData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetRandomResultTables = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetRandomResultTables", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetStoreItems = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetStoreItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetTitleData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTitleData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetTitleInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTitleInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.ListVirtualCurrencyTypes = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/ListVirtualCurrencyTypes", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.RemoveVirtualCurrencyTypes = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/RemoveVirtualCurrencyTypes", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.SetCatalogItems = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/SetCatalogItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.SetStoreItems = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/SetStoreItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.SetTitleData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/SetTitleData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.SetTitleInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/SetTitleInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.SetupPushNotification = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/SetupPushNotification", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateCatalogItems = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateCatalogItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateRandomResultTables = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateRandomResultTables", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateStoreItems = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateStoreItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.AddUserVirtualCurrency = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/AddUserVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetUserInventory = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetUserInventory", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GrantItemsToUsers = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GrantItemsToUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.RevokeInventoryItem = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/RevokeInventoryItem", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.SubtractUserVirtualCurrency = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/SubtractUserVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetMatchmakerGameInfo = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetMatchmakerGameInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetMatchmakerGameModes = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetMatchmakerGameModes", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.ModifyMatchmakerGameModes = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/ModifyMatchmakerGameModes", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.AddServerBuild = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/AddServerBuild", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetServerBuildInfo = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetServerBuildInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetServerBuildUploadUrl = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetServerBuildUploadUrl", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.ListServerBuilds = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/ListServerBuilds", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.ModifyServerBuild = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/ModifyServerBuild", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.RemoveServerBuild = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/RemoveServerBuild", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.SetPublisherData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/SetPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetCloudScriptRevision = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCloudScriptRevision", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetCloudScriptVersions = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCloudScriptVersions", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.SetPublishedRevision = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/SetPublishedRevision", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateCloudScript = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateCloudScript", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.DeleteContent = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteContent", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetContentList = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetContentList", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetContentUploadUrl = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetContentUploadUrl", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.ResetCharacterStatistics = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/ResetCharacterStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.AddPlayerTag = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/AddPlayerTag", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetAllActionGroups = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetAllActionGroups", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetAllSegments = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetAllSegments", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetPlayerSegments = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerSegments", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetPlayersInSegment = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayersInSegment", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetPlayerTags = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetPlayerTags", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.RemovePlayerTag = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/RemovePlayerTag", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.AbortTaskInstance = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/AbortTaskInstance", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.CreateActionsOnPlayersInSegmentTask = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/CreateActionsOnPlayersInSegmentTask", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.CreateCloudScriptTask = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/CreateCloudScriptTask", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.DeleteTask = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/DeleteTask", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetActionsOnPlayersInSegmentTaskInstance = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetActionsOnPlayersInSegmentTaskInstance", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetCloudScriptTaskInstance = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetCloudScriptTaskInstance", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetTaskInstances = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTaskInstances", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.GetTasks = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/GetTasks", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.RunTask = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/RunTask", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabAdminApi.UpdateTask = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Admin/UpdateTask", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

return PlayFabAdminApi
