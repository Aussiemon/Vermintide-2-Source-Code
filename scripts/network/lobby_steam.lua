require("scripts/network/lobby_aux")
require("scripts/network/lobby_host")
require("scripts/network/lobby_client")
require("scripts/network/lobby_finder")
require("scripts/network/lobby_members")

LobbyInternal = LobbyInternal or {}
LobbyInternal.TYPE = "steam"
LobbyInternal.privacy_map = {
	[LobbyPrivacy.PRIVATE] = Network.STEAM_LOBBY_PRIVATE,
	[LobbyPrivacy.FRIENDS] = Network.STEAM_LOBBY_FRIENDS_ONLY,
	[LobbyPrivacy.PUBLIC] = Network.STEAM_LOBBY_PUBLIC,
	[LobbyPrivacy.INVISIBLE] = Network.STEAM_LOBBY_INVISIBLE
}
LobbyInternal.comparison_map = {
	[LobbyComparison.EQUAL] = SteamLobbyBrowser.EQUAL,
	[LobbyComparison.NOT_EQUAL] = SteamLobbyBrowser.NOT_EQUAL,
	[LobbyComparison.LESS] = SteamLobbyBrowser.LESS,
	[LobbyComparison.LESS_OR_EQUAL] = SteamLobbyBrowser.LESS_OR_EQUAL,
	[LobbyComparison.GREATER] = SteamLobbyBrowser.GREATER,
	[LobbyComparison.GREATER_OR_EQUAL] = SteamLobbyBrowser.GREATER_OR_EQUAL
}
LobbyInternal.state_map = {
	[SteamLobby.CREATING] = LobbyState.CREATING,
	[SteamLobby.JOINING] = LobbyState.JOINING,
	[SteamLobby.JOINED] = LobbyState.JOINED,
	[SteamLobby.FAILED] = LobbyState.FAILED
}
LobbyInternal.filter_comparisons = {
	[SteamLobby.CREATING] = LobbyState.CREATING,
	[SteamLobby.JOINING] = LobbyState.JOINING,
	[SteamLobby.JOINED] = LobbyState.JOINED,
	[SteamLobby.FAILED] = LobbyState.FAILED
}
LobbyInternal.distance_filters = {
	[LobbyDistanceFilter.CLOSE] = SteamLobbyBrowser.CLOSE,
	[LobbyDistanceFilter.MEDIUM] = SteamLobbyBrowser.DEFAULT,
	[LobbyDistanceFilter.FAR] = SteamLobbyBrowser.FAR,
	[LobbyDistanceFilter.WORLD] = SteamLobbyBrowser.WORLD
}

LobbyInternal.create_lobby = function (network_options)
	local privacy = network_options.privacy or LobbyPrivacy.PUBLIC
	local use_eac = true

	return Network.create_steam_lobby(LobbyInternal.privacy_map[privacy], network_options.max_members, use_eac)
end

LobbyInternal.network_initialized = function ()
	return not not LobbyInternal.client
end

LobbyInternal.leave_lobby = Network.leave_steam_lobby

LobbyInternal.join_lobby = function (lobby_data)
	local use_eac = true

	return Network.join_steam_lobby(lobby_data.id, use_eac)
end

LobbyInternal.init_client = function (network_options)
	Network.set_explicit_connections()

	LobbyInternal.client = Network.init_steam_client(network_options.config_file_name)

	GameSettingsDevelopment.set_ignored_rpc_logs()
end

LobbyInternal.shutdown_client = function ()
	Network.shutdown_steam_client(LobbyInternal.client)

	LobbyInternal.client = nil

	GameServerInternal.forget_server_browser()
end

LobbyInternal.ping = function (peer_id)
	return Network.ping(peer_id)
end

LobbyInternal.add_ping_peer = function (peer_id)
	return
end

LobbyInternal.remove_ping_peer = function (peer_id)
	return
end

LobbyInternal.get_lobby = function (lobby_browser, index)
	local lobby_data = lobby_browser:lobby(index)
	local lobby_data_all = lobby_browser:data_all(index)
	lobby_data_all.id = lobby_data.id

	if lobby_data_all.Host or lobby_data_all.Difficulty then
		print("")
		print(debug.traceback())
		print("")
		table.dump(lobby_data_all, "Lobby Data", 2)
		Crashify.print_exception("LobbyInternal.get_lobby", "Found Capitalized lobby data field (Difficulty or Host)")
	end

	local formatted_lobby_data = {}

	for key, value in pairs(lobby_data_all) do
		formatted_lobby_data[string.lower(key)] = value
	end

	return formatted_lobby_data
end

LobbyInternal.lobby_browser = function ()
	return LobbyInternal.client:lobby_browser()
end

LobbyInternal.get_lobby_data_from_id = function (id)
	SteamLobby.request_lobby_data(id)

	local data = SteamMisc.get_lobby_data(id)

	return data
end

LobbyInternal.get_lobby_data_from_id_by_key = function (id, key)
	local data = SteamMisc.get_lobby_data_by_key(id, key)

	return (data ~= "" and data) or nil
end

LobbyInternal.clear_filter_requirements = function ()
	local lobby_browser = LobbyInternal.client:lobby_browser()

	SteamLobbyBrowser.clear_filters(lobby_browser)
end

LobbyInternal.add_filter_requirements = function (requirements)
	local lobby_browser = LobbyInternal.client:lobby_browser()

	SteamLobbyBrowser.clear_filters(lobby_browser)
	SteamLobbyBrowser.add_slots_filter(lobby_browser, requirements.free_slots)

	local distance_filter = LobbyInternal.distance_filters[requirements.distance_filter]

	SteamLobbyBrowser.add_distance_filter(lobby_browser, distance_filter)
	mm_printf("Filter: Free slots = %s", tostring(requirements.free_slots))
	mm_printf("Filter: Distance = %s", tostring(requirements.distance_filter))

	for key, filter in pairs(requirements.filters) do
		local value = filter.value
		local comparison = filter.comparison
		local steam_comparison = LobbyInternal.comparison_map[comparison]

		SteamLobbyBrowser.add_filter(lobby_browser, key, value, steam_comparison)
		mm_printf("Filter: %s, comparison(%s), value=%s", tostring(key), tostring(comparison), tostring(value))
	end

	for _, filter in ipairs(requirements.near_filters) do
		local key = filter.key
		local value = filter.value

		SteamLobbyBrowser.add_near_filter(lobby_browser, key, value)
		mm_printf("Near Filter: %s, value=%s", tostring(key), tostring(value))
	end
end

LobbyInternal.user_name = function (user)
	return Steam.user_name(user)
end

LobbyInternal.lobby_id = function (lobby)
	return lobby:id()
end

LobbyInternal.is_friend = function (peer_id)
	return Friends.in_category(peer_id, Friends.FRIEND_FLAG)
end

return
