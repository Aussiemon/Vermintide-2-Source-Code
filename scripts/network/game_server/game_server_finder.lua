GameServerFinder = class(GameServerFinder)
local SECONDS_BETWEEN_REFRESHES = 10
GameServerFinder.init = function (self, network_options, max_num_servers)
	local config_file_name = network_options.config_file_name
	local project_hash = network_options.project_hash
	self._network_hash = GameServerAux.create_network_hash(config_file_name, project_hash)
	self._cached_servers = {}
	self._pending_refresh_request = false

	return 
end
GameServerFinder.destroy = function (self)
	return 
end
GameServerFinder.refresh = function (self)
	local server_browser = GameServerInternal.server_browser()

	server_browser.refresh(server_browser)

	self._pending_refresh_request = true

	table.clear(self._cached_servers)

	return 
end
GameServerFinder.set_search_type = function (self, search_type)
	local server_browser = GameServerInternal.server_browser()

	server_browser.set_search_type(server_browser, search_type)

	return 
end
GameServerFinder.add_to_favorites = function (self, ip, connection_port, query_port)
	local server_browser = GameServerInternal.server_browser()

	server_browser.add_to_favorites(server_browser, ip, connection_port, query_port)

	return 
end
GameServerFinder.remove_from_favorites = function (self, ip, connection_port, query_port)
	local server_browser = GameServerInternal.server_browser()

	server_browser.remove_from_favorites(server_browser, ip, connection_port, query_port)

	return 
end
GameServerFinder.add_filter_requirements = function (self, requirements, skip_verify_lobby_data)
	GameServerInternal.add_filter_requirements(requirements)

	self._skip_verify_lobby_data = skip_verify_lobby_data

	return 
end
GameServerFinder.servers = function (self)
	return self._cached_servers
end
GameServerFinder.is_refreshing = function (self)
	return self._pending_refresh_request
end
GameServerFinder.update = function (self, dt)
	local server_browser = GameServerInternal.server_browser()

	server_browser.update(server_browser, dt)

	local is_refreshing = server_browser.is_refreshing(server_browser)

	if self._pending_refresh_request and not is_refreshing then
		local cached_server = self._cached_servers
		local servers = server_browser.servers(server_browser)

		for _, server in ipairs(servers) do
			if self._skip_verify_lobby_data or GameServerAux.verify_lobby_data(server) then
				server.valid = true
				cached_server[#cached_server + 1] = server
			end
		end

		self._pending_refresh_request = false
	end

	return 
end

return 
