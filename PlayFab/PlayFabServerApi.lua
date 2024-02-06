-- chunkname: @PlayFab/PlayFabServerApi.lua

local IPlayFabHttps = require("PlayFab.IPlayFabHttps")
local PlayFabSettings = require("PlayFab.PlayFabSettings")
local PlayFabServerApi = {
	settings = PlayFabSettings.settings,
}

PlayFabServerApi.AuthenticateSessionTicket = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/AuthenticateSessionTicket", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.SetPlayerSecret = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/SetPlayerSecret", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.BanUsers = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/BanUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetPlayerProfile = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerProfile", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetPlayFabIDsFromFacebookIDs = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayFabIDsFromFacebookIDs", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetPlayFabIDsFromSteamIDs = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayFabIDsFromSteamIDs", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetUserAccountInfo = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserAccountInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetUserBans = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.RevokeAllBansForUser = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/RevokeAllBansForUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.RevokeBans = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/RevokeBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.SendPushNotification = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/SendPushNotification", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateAvatarUrl = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateAvatarUrl", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateBans = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateBans", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.DeleteUsers = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/DeleteUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetFriendLeaderboard = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetFriendLeaderboard", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetLeaderboard = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboard", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetLeaderboardAroundUser = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboardAroundUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetPlayerCombinedInfo = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerCombinedInfo", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetPlayerStatistics = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetPlayerStatisticVersions = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerStatisticVersions", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetUserData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetUserInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetUserPublisherData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetUserPublisherInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserPublisherInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetUserPublisherReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserPublisherReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetUserReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdatePlayerStatistics = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdatePlayerStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateUserData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateUserInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateUserPublisherData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateUserPublisherInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserPublisherInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateUserPublisherReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserPublisherReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateUserReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetCatalogItems = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetCatalogItems", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetPublisherData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetTime = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetTime", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetTitleData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetTitleData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetTitleInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetTitleInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetTitleNews = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetTitleNews", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.SetPublisherData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/SetPublisherData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.SetTitleData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/SetTitleData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.SetTitleInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/SetTitleInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.AddCharacterVirtualCurrency = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/AddCharacterVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.AddUserVirtualCurrency = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/AddUserVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.ConsumeItem = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/ConsumeItem", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.EvaluateRandomResultTable = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/EvaluateRandomResultTable", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetCharacterInventory = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterInventory", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetRandomResultTables = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetRandomResultTables", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetUserInventory = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetUserInventory", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GrantItemsToCharacter = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GrantItemsToCharacter", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GrantItemsToUser = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GrantItemsToUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GrantItemsToUsers = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GrantItemsToUsers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.ModifyItemUses = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/ModifyItemUses", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.MoveItemToCharacterFromCharacter = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/MoveItemToCharacterFromCharacter", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.MoveItemToCharacterFromUser = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/MoveItemToCharacterFromUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.MoveItemToUserFromCharacter = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/MoveItemToUserFromCharacter", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.RedeemCoupon = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/RedeemCoupon", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.ReportPlayer = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/ReportPlayer", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.RevokeInventoryItem = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/RevokeInventoryItem", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.SubtractCharacterVirtualCurrency = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/SubtractCharacterVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.SubtractUserVirtualCurrency = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/SubtractUserVirtualCurrency", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UnlockContainerInstance = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UnlockContainerInstance", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UnlockContainerItem = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UnlockContainerItem", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateUserInventoryItemCustomData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateUserInventoryItemCustomData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.AddFriend = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/AddFriend", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetFriendsList = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetFriendsList", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.RemoveFriend = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/RemoveFriend", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.SetFriendTags = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/SetFriendTags", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.DeregisterGame = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/DeregisterGame", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.NotifyMatchmakerPlayerLeft = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/NotifyMatchmakerPlayerLeft", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.RedeemMatchmakerTicket = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/RedeemMatchmakerTicket", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.RefreshGameServerInstanceHeartbeat = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/RefreshGameServerInstanceHeartbeat", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.RegisterGame = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/RegisterGame", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.SetGameServerInstanceData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/SetGameServerInstanceData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.SetGameServerInstanceState = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/SetGameServerInstanceState", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.SetGameServerInstanceTags = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/SetGameServerInstanceTags", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.WriteCharacterEvent = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/WriteCharacterEvent", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.WritePlayerEvent = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/WritePlayerEvent", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.WriteTitleEvent = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/WriteTitleEvent", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.AddSharedGroupMembers = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/AddSharedGroupMembers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.CreateSharedGroup = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/CreateSharedGroup", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.DeleteSharedGroup = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/DeleteSharedGroup", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetSharedGroupData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetSharedGroupData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.RemoveSharedGroupMembers = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/RemoveSharedGroupMembers", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateSharedGroupData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateSharedGroupData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.ExecuteCloudScript = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/ExecuteCloudScript", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetContentDownloadUrl = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetContentDownloadUrl", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.DeleteCharacterFromUser = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/DeleteCharacterFromUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetAllUsersCharacters = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetAllUsersCharacters", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetCharacterLeaderboard = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterLeaderboard", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetCharacterStatistics = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetLeaderboardAroundCharacter = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboardAroundCharacter", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetLeaderboardForUserCharacters = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetLeaderboardForUserCharacters", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GrantCharacterToUser = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GrantCharacterToUser", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateCharacterStatistics = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterStatistics", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetCharacterData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetCharacterInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetCharacterReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetCharacterReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateCharacterData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateCharacterInternalData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterInternalData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.UpdateCharacterReadOnlyData = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/UpdateCharacterReadOnlyData", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.AddPlayerTag = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/AddPlayerTag", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetAllActionGroups = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetAllActionGroups", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetAllSegments = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetAllSegments", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetPlayerSegments = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerSegments", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetPlayersInSegment = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayersInSegment", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.GetPlayerTags = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/GetPlayerTags", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.RemovePlayerTag = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/RemovePlayerTag", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

PlayFabServerApi.AwardSteamAchievement = function (request, onSuccess, onError)
	if not PlayFabSettings.settings.titleId or not PlayFabSettings.settings.devSecretKey then
		error("Must have PlayFabSettings.settings.devSecretKey set to call this method")
	end

	IPlayFabHttps.MakePlayFabApiCall("/Server/AwardSteamAchievement", request, "X-SecretKey", PlayFabSettings.settings.devSecretKey, onSuccess, onError)
end

return PlayFabServerApi
