require("scripts/network/lobby_aux")

LobbyFinder = class(LobbyFinder)
LobbyFinder.init = function (self, network_options, max_num_lobbies)
	local config_file_name = network_options.config_file_name
	local project_hash = network_options.project_hash
	self._network_hash = LobbyAux.create_network_hash(config_file_name, project_hash)
	self._lobby_port = network_options.lobby_port

	assert(self._lobby_port, "Must specify port to LobbyFinder.")

	self._cached_lobbies = {}
	self._max_num_lobbies = max_num_lobbies
	self._refreshing = false

	return 
end
LobbyFinder.destroy = function (self)
	return 
end
LobbyFinder.add_filter_requirements = function (self, requirements, force_refresh)
	LobbyInternal.add_filter_requirements(requirements)

	if force_refresh then
		self.refresh(self)
	end

	table.clear(self._cached_lobbies)

	return 
end
LobbyFinder.network_hash = function (self)
	return self._network_hash
end
LobbyFinder.lobbies = function (self)
	return self._cached_lobbies
end
LobbyFinder.latest_filter_lobbies = function (self)
	print("[LobbyFinder]:latest_filter_lobbies is deprecated")

	return 
end
LobbyFinder.refresh = function (self)
	local lobby_browser = LobbyInternal.lobby_browser()

	lobby_browser.refresh(lobby_browser, self._lobby_port)

	self._refreshing = true

	return 
end
LobbyFinder.is_lobby_browser_refreshing = function (self)
	print("[LobbyFinder]:is_lobby_browser_refreshing() is deprecated")

	return false
end
LobbyFinder.is_refreshing = function (self)
	return self._refreshing
end
LobbyFinder.update = function (self, dt)
	if self._refreshing then
		local lobby_browser = LobbyInternal.lobby_browser()
		local is_refreshing = lobby_browser.is_refreshing(lobby_browser)

		if not is_refreshing then
			local lobbies = {}
			local num_lobbies = lobby_browser.num_lobbies(lobby_browser)
			local max_num_lobbies = self._max_num_lobbies

			if max_num_lobbies then
				num_lobbies = math.min(max_num_lobbies, num_lobbies)
			end

			for i = 0, num_lobbies - 1, 1 do
				local lobby = LobbyInternal.get_lobby(lobby_browser, i)

				if LobbyAux.verify_lobby_data(lobby) then
					lobbies[#lobbies + 1] = lobby

					if lobby.network_hash == self._network_hash then
						lobby.valid = true
					end
				end
			end

			self._cached_lobbies = lobbies
			self._refreshing = false
		end
	end

	return 
end

return 
