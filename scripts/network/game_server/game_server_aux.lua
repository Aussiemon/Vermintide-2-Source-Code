GameServerAux = {
	create_network_hash = function (config_file_name, project_hash)
		return LobbyAux.create_network_hash(config_file_name, project_hash)
	end,
	verify_lobby_data = function (lobby)
		return true
	end
}
