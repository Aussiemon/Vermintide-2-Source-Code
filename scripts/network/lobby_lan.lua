require("scripts/network/lobby_aux")
require("scripts/network/lobby_host")
require("scripts/network/lobby_client")
require("scripts/network/lobby_finder")
require("scripts/network/lobby_members")

LobbyInternal = LobbyInternal or {}
LobbyInternal.state_map = {
	[LanLobby.CREATING] = LobbyState.CREATING,
	[LanLobby.JOINING] = LobbyState.JOINING,
	[LanLobby.JOINED] = LobbyState.JOINED,
	[LanLobby.FAILED] = LobbyState.FAILED
}

LobbyInternal.create_lobby = function (network_options)
	local lobby_port = network_options.lobby_port

	assert(lobby_port, "Must provide port to LobbyHostLan.")

	return Network.create_lan_lobby(lobby_port, network_options.max_members)
end

LobbyInternal.leave_lobby = Network.leave_lan_lobby

LobbyInternal.join_lobby = function (lobby_data)
	return Network.join_lan_lobby(lobby_data.address)
end

LobbyInternal.network_initialized = function ()
	local client = LobbyInternal.client

	return not not client
end

LobbyInternal.lobby_browser = function ()
	return LobbyInternal.client:lobby_browser()
end

LobbyInternal.get_lobby_data_from_id = function (id)
	return nil
end

LobbyInternal.get_lobby_data_from_id_by_key = function (id, key)
	return nil
end

LobbyInternal.init_client = function (network_options)
	Network.set_explicit_connections()

	local peer_id = Development.parameter("lan_peer_id")

	if peer_id then
		print("Forcing LAN peer_id ", peer_id)

		local peer_id_number = tonumber(peer_id, 16)
		LobbyInternal.client = Network.init_lan_client(network_options.config_file_name, 0, peer_id_number)
	else
		LobbyInternal.client = Network.init_lan_client(network_options.config_file_name)
	end

	GameSettingsDevelopment.set_ignored_rpc_logs()
end

LobbyInternal.shutdown_client = function ()
	Network.shutdown_lan_client(LobbyInternal.client)

	LobbyInternal.client = nil
end

LobbyInternal.get_lobby = LanLobbyBrowser.lobby

LobbyInternal.clear_filter_requirements = function ()
	return
end

LobbyInternal.add_filter_requirements = function (requirements)
	return
end

LobbyInternal.lobby_id = function (lobby)
	return 10000
end

LobbyInternal.user_name = function (user)
	return user
end

LobbyInternal.lobby_id_match = function (id1, id2)
	if id1 == nil or id2 == nil then
		return true
	end

	return id1 == id2
end

LobbyInternal.user_name = function (user)
	return Network.peer_id()
end

LobbyInternal.is_friend = function (peer_id)
	return false
end

return
