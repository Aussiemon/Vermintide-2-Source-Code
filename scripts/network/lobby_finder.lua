require("scripts/network/lobby_aux")

LobbyFinder = class(LobbyFinder)

LobbyFinder.init = function (self, network_options, max_num_lobbies)
	local config_file_name = network_options.config_file_name
	local project_hash = network_options.project_hash
	self._network_hash = LobbyAux.create_network_hash(config_file_name, project_hash)
	self._server_port = network_options.server_port

	assert(self._server_port, "Must specify port to LobbyFinder.")

	self._cached_lobbies = {}
	self._max_num_lobbies = max_num_lobbies
	self._refreshing = false

	if IS_XB1 then
		self._browser = LobbyInternal.lobby_browser()
	else
		self._browser = LobbyInternal.client:create_lobby_browser()

		print("===========Lobbyfinder CREATED", self._browser)
	end
end

LobbyFinder.get_lobby_browser = function (self)
	return self._browser
end

LobbyFinder.destroy = function (self)
	if not IS_XB1 then
		LobbyInternal.client.destroy_lobby_browser(LobbyInternal.client, self._browser)
		print("===========Lobbyfinder DESTROYED", self._browser)
	end
end

LobbyFinder.add_filter_requirements = function (self, requirements, force_refresh)
	LobbyInternal.add_filter_requirements(requirements, self._browser)

	if force_refresh then
		printf("===========LobbyFinder:add_filter_requirements force refresh")
		self:refresh()
	end

	table.clear(self._cached_lobbies)
end

LobbyFinder.network_hash = function (self)
	return self._network_hash
end

LobbyFinder.lobbies = function (self)
	return self._cached_lobbies
end

LobbyFinder.latest_filter_lobbies = function (self)
	print("[LobbyFinder]:latest_filter_lobbies is deprecated")
end

LobbyFinder.refresh = function (self)
	printf("===========LobbyFinder:refresh() _refresing=%s", self._refreshing)

	if not self._refreshing then
		self._browser:refresh(self._server_port)

		self._refreshing = true
	end
end

LobbyFinder.is_refreshing = function (self)
	return self._refreshing
end

LobbyFinder.update = function (self, dt)
	if self._refreshing then
		local lobby_browser = self._browser
		local is_refreshing = lobby_browser:is_refreshing()

		if not is_refreshing then
			local engine_lobbies = self._cached_lobbies

			table.clear_array(engine_lobbies)

			local num_lobbies = lobby_browser:num_lobbies()
			local max_num_lobbies = self._max_num_lobbies

			if max_num_lobbies then
				num_lobbies = math.min(max_num_lobbies, num_lobbies)
			end

			printf("===========Lobbyfinder REFRESHING num_lobbies: %s", num_lobbies)

			for i = 0, num_lobbies - 1 do
				local engine_lobby_data = LobbyInternal.get_lobby(lobby_browser, i)

				if engine_lobby_data.network_hash == self._network_hash and LobbyAux.verify_lobby_data(engine_lobby_data) then
					engine_lobbies[#engine_lobbies + 1] = engine_lobby_data
					engine_lobby_data.valid = true

					printf("=======================Found valid lobby!")
				end
			end

			self._cached_lobbies = engine_lobbies
			self._refreshing = false
		end
	end
end
