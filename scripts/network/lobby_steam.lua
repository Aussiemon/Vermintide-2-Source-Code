-- chunkname: @scripts/network/lobby_steam.lua

require("scripts/network/lobby_aux")
require("scripts/network/lobby_host")
require("scripts/network/lobby_client")
require("scripts/network/lobby_finder")
require("scripts/network/lobby_members")

LobbyInternal = LobbyInternal or {}
LobbyInternal.TYPE = "steam"
LobbyInternal.lobby_data_version = 2

LobbyInternal.network_initialized = function ()
	return not not LobbyInternal.client
end

LobbyInternal.create_lobby = function (network_options)
	local privacy = network_options.privacy or "public"
	local use_eac = true

	return Network.create_steam_lobby(privacy, network_options.max_members, use_eac)
end

LobbyInternal.join_lobby = function (lobby_data)
	local use_eac = true

	return Network.join_steam_lobby(lobby_data.id, use_eac)
end

LobbyInternal.leave_lobby = function (lobby)
	Network.leave_steam_lobby(lobby)
end

LobbyInternal.open_channel = function (lobby, peer)
	local channel_id = SteamLobby.open_channel(lobby, peer)

	printf("LobbyInternal.open_channel lobby: %s, to peer: %s channel: %s", lobby, peer, channel_id)

	return channel_id
end

LobbyInternal.close_channel = function (lobby, channel)
	printf("LobbyInternal.close_channel lobby: %s, channel: %s", lobby, channel)
	SteamLobby.close_channel(lobby, channel)
end

LobbyInternal.is_orphaned = function (engine_lobby)
	return engine_lobby.is_orphaned(engine_lobby)
end

LobbyInternal.init_client = function (network_options)
	LobbyInternal.client = Network.init_steam_client(network_options.config_file_name)

	GameSettingsDevelopment.set_ignored_rpc_logs()
end

LobbyInternal.shutdown_client = function ()
	Network.shutdown_steam_client(LobbyInternal.client)
	GameServerInternal.forget_server_browser()

	LobbyInternal.client = nil
end

LobbyInternal.get_lobby_data_from_id = function (id)
	SteamLobby.request_lobby_data(id)

	local data = SteamMisc.get_lobby_data(id)

	return data
end

LobbyInternal.get_lobby_data_from_id_by_key = function (id, key)
	local data = SteamMisc.get_lobby_data_by_key(id, key)

	return data ~= "" and data or nil
end

LobbyInternal.ping = function (peer_id)
	return Network.ping(peer_id)
end

LobbyInternal.get_lobby = function (lobby_browser, index)
	local lobby_data = lobby_browser:lobby(index)
	local lobby_data_all = lobby_browser:data_all(index)

	lobby_data_all.id = lobby_data.id

	local formatted_lobby_data = {}

	for key, value in pairs(lobby_data_all) do
		formatted_lobby_data[string.lower(key)] = value
	end

	return formatted_lobby_data
end

LobbyInternal.clear_filter_requirements = function (lobby_browser)
	SteamLobbyBrowser.clear_filters(lobby_browser)
end

LobbyInternal.add_filter_requirements = function (requirements, lobby_browser)
	SteamLobbyBrowser.clear_filters(lobby_browser)
	SteamLobbyBrowser.add_slots_filter(lobby_browser, requirements.free_slots)

	local distance_filter = requirements.distance_filter

	fassert(distance_filter, "Missing or bad distance filer: %s", distance_filter)
	SteamLobbyBrowser.add_distance_filter(lobby_browser, distance_filter)
	mm_printf("Filter: Free slots = %s", tostring(requirements.free_slots))
	mm_printf("Filter: Distance = %s", tostring(requirements.distance_filter))

	for key, filter in pairs(requirements.filters) do
		local value, comparison = filter.value, filter.comparison

		SteamLobbyBrowser.add_filter(lobby_browser, key, value, comparison)
		mm_printf("Filter: %s, comparison(%s), value=%s", tostring(key), tostring(comparison), tostring(value))
	end

	for _, filter in ipairs(requirements.near_filters) do
		local key, value = filter.key, filter.value

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

LobbyInternal.set_max_members = function (lobby, max_members)
	SteamLobby.set_max_members(lobby, max_members)
end
