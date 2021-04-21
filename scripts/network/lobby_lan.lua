require("scripts/network/lobby_aux")
require("scripts/network/lobby_host")
require("scripts/network/lobby_client")
require("scripts/network/lobby_finder")
require("scripts/network/lobby_members")

LobbyInternal = LobbyInternal or {}
LobbyInternal.lobby_data_version = 2

if IS_XB1 then
	LobbyInternal.state_map = {
		[LobbyState.WORKING] = LobbyState.WORKING,
		[LobbyState.SHUTDOWN] = LobbyState.SHUTDOWN,
		[LobbyState.JOINED] = LobbyState.JOINED,
		[LobbyState.FAILED] = LobbyState.FAILED
	}
end

LobbyInternal.TYPE = "lan"

LobbyInternal.network_initialized = function ()
	local client = LobbyInternal.client

	return not not client
end

LobbyInternal.create_lobby = function (network_options)
	return Network.create_lan_lobby(network_options.max_members)
end

LobbyInternal.join_lobby = function (lobby_data)
	return Network.join_lan_lobby(lobby_data.id)
end

LobbyInternal.leave_lobby = Network.leave_lan_lobby

LobbyInternal.open_channel = function (lobby, peer)
	local channel_id = LanLobby.open_channel(lobby, peer)

	print("LobbyInternal.open_channel lobby: %s, to peer: %s channel: %s", lobby, peer, channel_id)

	return channel_id
end

LobbyInternal.close_channel = function (lobby, channel)
	print("LobbyInternal.close_channel lobby: %s, channel: %s", lobby, channel)
	LanLobby.close_channel(lobby, channel)
end

LobbyInternal.is_orphaned = function (engine_lobby)
	return false
end

LobbyInternal.game_session_host = function (engine_lobby)
	return LanLobby.game_session_host(engine_lobby)
end

LobbyInternal.init_client = function (network_options)
	local game_port = network_options.server_port

	if Development.parameter("client") then
		game_port = 0
	end

	local peer_id = Development.parameter("lan_peer_id")

	if peer_id then
		print("Forcing LAN peer_id ", peer_id)

		local peer_id_number = tonumber(peer_id, 16)
		LobbyInternal.client = Network.init_lan_client(network_options.config_file_name, game_port, peer_id_number)
	else
		LobbyInternal.client = Network.init_lan_client(network_options.config_file_name, game_port)
	end

	fassert(LobbyInternal.client, "Failed to initialize the network. The port is most likely in use, which means that another game instance is running at the same time.")
	GameSettingsDevelopment.set_ignored_rpc_logs()
end

LobbyInternal.shutdown_client = function ()
	Network.shutdown_lan_client(LobbyInternal.client)

	LobbyInternal.client = nil
end

LobbyInternal.get_lobby_data_from_id = function (id)
	return nil
end

LobbyInternal.get_lobby_data_from_id_by_key = function (id, key)
	return nil
end

LobbyInternal.ping = function (peer_id)
	return Network.ping(peer_id)
end

LobbyInternal.get_lobby = LanLobbyBrowser.lobby
local XBOX_MOCK_LOBBY_BROWSER = {
	is_refreshing = function ()
		return false
	end,
	refresh = function ()
		return
	end,
	num_lobbies = function ()
		return 0
	end
}

LobbyInternal.lobby_browser = function ()
	return XBOX_MOCK_LOBBY_BROWSER
end

LobbyInternal.clear_filter_requirements = function ()
	return
end

LobbyInternal.add_filter_requirements = function (requirements)
	return
end

LobbyInternal.user_name = function (user)
	return Network.peer_id()
end

LobbyInternal.lobby_id = function (lobby)
	return 10000
end

LobbyInternal.is_friend = function (peer_id)
	return false
end

LobbyInternal.client_ready = function ()
	return false
end

LobbyInternal.set_max_members = function (lobby, max_members)
	LanLobby.set_max_members(lobby, max_members)
end

LobbyInternal.lobby_id_match = function (id1, id2)
	if id1 == nil or id2 == nil then
		return true
	end

	return id1 == id2
end

return
