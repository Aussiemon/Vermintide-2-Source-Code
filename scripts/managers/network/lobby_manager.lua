local network_options = {
	map = "None",
	project_hash = "bulldozer",
	max_members = 4,
	config_file_name = "global",
	lobby_port = (LEVEL_EDITOR_TEST and GameSettingsDevelopment.editor_lobby_port) or GameSettingsDevelopment.network_port,
	server_port = script_data.server_port or script_data.settings.server_port,
	query_port = script_data.query_port or script_data.settings.query_port,
	steam_port = script_data.steam_port or script_data.settings.steam_port,
	ip_address = Network.default_network_address()
}
LobbyManager = class(LobbyManager)

LobbyManager.init = function (self)
	self._network_options = nil
	self._lobby_port_increment = 0
end

LobbyManager.network_hash = function (self)
	local config_file_name = network_options.config_file_name
	local project_hash = network_options.project_hash
	local disable_print = true

	return LobbyAux.create_network_hash(config_file_name, project_hash, disable_print, disable_print)
end

LobbyManager.network_options = function (self)
	fassert(self._network_options, "Network options has not been set up yet.")

	return self._network_options
end

LobbyManager.setup_network_options = function (self, increment_lobby_port)
	printf("[LobbyManager] Setting up network options")

	local development_port = script_data.server_port or script_data.settings.server_port or network_options.lobby_port

	if PLATFORM == "win32" then
		development_port = development_port + self._lobby_port_increment
	else
		development_port = network_options.lobby_port
	end

	if increment_lobby_port then
		self._lobby_port_increment = self._lobby_port_increment + 1
	end

	local lobby_port = (LEVEL_EDITOR_TEST and GameSettingsDevelopment.editor_lobby_port) or development_port
	network_options.lobby_port = lobby_port
	local max_members = Managers.mechanism:max_members()
	network_options.max_members = max_members
	self._network_options = network_options
end

return
