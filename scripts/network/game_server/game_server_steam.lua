GameServerInternal = GameServerInternal or {}
GameServerInternal.state_map = {
	[SteamGameServer.CONNECTING] = GameServerState.CONNECTING,
	[SteamGameServer.CONNECTED] = GameServerState.CONNECTED,
	[SteamGameServer.DISCONNECTED] = GameServerState.DISCONNECTED
}

GameServerInternal.init_server = function (network_options, server_name)
	Network.set_explicit_connections()

	local config_file_name = network_options.config_file_name
	local project_hash = network_options.project_hash
	local network_hash = GameServerAux.create_network_hash(config_file_name, project_hash)
	local settings = {
		gamedir = "vermintide2",
		dedicated = true,
		server_version = "1.0.0.0",
		steam_port = network_options.steam_port,
		game_description = network_hash,
		ip_address = network_options.ip_address,
		map = network_options.map,
		max_players = network_options.max_members,
		query_port = network_options.query_port,
		server_name = server_name,
		server_port = network_options.server_port
	}
	local use_eac = true

	return Network.init_steam_server(config_file_name, settings, use_eac)
end

GameServerInternal.shutdown_server = function (game_server)
	Network.shutdown_steam_server(game_server)
end

GameServerInternal.server_id = function (game_server)
	return SteamGameServer.id(game_server)
end

GameServerInternal.set_level_name = function (game_server, name)
	SteamGameServer.set_map(game_server, name)
end

return
