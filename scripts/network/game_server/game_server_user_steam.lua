require("scripts/network/game_server/game_server_aux")

GameServerInternal = GameServerInternal or {}
GameServerInternal.lobby_state_map = {
	[SteamGameServerLobby.JOINING] = GameServerLobbyState.JOINING,
	[SteamGameServerLobby.JOINED] = GameServerLobbyState.JOINED,
	[SteamGameServerLobby.FAILED] = GameServerLobbyState.FAILED
}
GameServerInternal.lobby_failed_reason_map = {
	[SteamGameServerLobby.SERVER_IS_FULL] = GameServerLobbyState.SERVER_IS_FULL,
	[SteamGameServerLobby.TIMEOUT] = GameServerLobbyState.TIMEOUT
}
GameServerInternal.search_types_map = {
	internet = SteamServerBrowser.INTERNET,
	lan = SteamServerBrowser.LAN,
	friends = SteamServerBrowser.FRIENDS,
	favorites = SteamServerBrowser.FAVORITES,
	history = SteamServerBrowser.HISTORY
}
GameServerInternal.join_server = function (game_server_info, password)
	local ip_address = game_server_info.ip_port
	local game_server_lobby = Network.join_steam_server(ip_address, password)

	SteamGameServerLobby.auto_update_data(game_server_lobby)

	return game_server_lobby
end
GameServerInternal.leave_server = function (game_server_lobby)
	Network.leave_steam_server(game_server_lobby)

	return 
end
GameServerInternal.lobby_host = function (game_server_lobby)
	return SteamGameServerLobby.game_session_host(game_server_lobby)
end
GameServerInternal.lobby_id = function (game_server_lobby)
	return SteamGameServerLobby.game_session_host(game_server_lobby)
end
GameServerInternal.user_name = function (user)
	error("The dedicated server can't lookup names")

	return 
end
GameServerInternal.server_browser = function ()
	if not GameServerInternal._internal_server_browser then
		GameServerInternal._create_server_browser_wrapper()
	end

	return GameServerInternal._internal_server_browser
end
GameServerInternal.clear_filter_requirements = function ()
	if not GameServerInternal._internal_server_browser then
		GameServerInternal._create_server_browser_wrapper()
	end

	local server_browser = GameServerInternal._internal_server_browser

	server_browser.clear_filters(server_browser)

	return 
end
GameServerInternal.add_filter_requirements = function (requirements)
	if not GameServerInternal._internal_server_browser then
		GameServerInternal._create_server_browser_wrapper()
	end

	local server_browser = GameServerInternal._internal_server_browser

	server_browser.clear_filters(server_browser)
	server_browser.add_filters(server_browser, requirements)

	return 
end
GameServerInternal.forget_server_browser = function ()
	GameServerInternal._internal_server_browser = nil

	return 
end
GameServerInternal._create_server_browser_wrapper = function ()
	fassert(GameServerInternal._internal_server_browser == nil, "Already has server browser wrapper")

	local server_browser = LobbyInternal.client:server_browser()
	GameServerInternal._internal_server_browser = SteamServerBrowserWrapper:new(server_browser)

	return 
end
SteamServerBrowserWrapper = class(SteamServerBrowserWrapper)
SteamServerBrowserWrapper.compare_funcs = {
	[LobbyComparison.EQUAL] = function (lhv, rhv)
		return lhv == tostring(rhv)
	end,
	[LobbyComparison.NOT_EQUAL] = function (lhv, rhv)
		return lhv ~= tostring(rhv)
	end,
	[LobbyComparison.LESS] = function (lhv, rhv)
		return tonumber(lhv) < rhv
	end,
	[LobbyComparison.LESS_OR_EQUAL] = function (lhv, rhv)
		return tonumber(lhv) <= rhv
	end,
	[LobbyComparison.GREATER] = function (lhv, rhv)
		return rhv < tonumber(lhv)
	end,
	[LobbyComparison.GREATER_OR_EQUAL] = function (lhv, rhv)
		return rhv <= tonumber(lhv)
	end
}
SteamServerBrowserWrapper.compare_func_names = {
	[LobbyComparison.EQUAL] = "==",
	[LobbyComparison.NOT_EQUAL] = "~=",
	[LobbyComparison.LESS] = "<",
	[LobbyComparison.LESS_OR_EQUAL] = "<=",
	[LobbyComparison.GREATER] = ">",
	[LobbyComparison.GREATER_OR_EQUAL] = ">="
}
SteamServerBrowserWrapper.init = function (self, server_browser)
	self._browser = server_browser
	self._cached_servers = {}
	self._filters = {}
	self._search_type = "internet"
	self._state = "waiting"

	return 
end
SteamServerBrowserWrapper.servers = function (self)
	return self._cached_servers
end
SteamServerBrowserWrapper.is_refreshing = function (self)
	local state = self._state

	return state == "refreshing" or state == "fetching_data"
end
SteamServerBrowserWrapper.refresh = function (self)
	if SteamServerBrowser.is_refreshing(self._browser) then
		SteamServerBrowser.abort_refresh(self._browser)
	end

	local search_type = GameServerInternal.search_types_map[self._search_type]

	SteamServerBrowser.refresh(self._browser, search_type)

	self._state = "refreshing"

	return 
end
SteamServerBrowserWrapper.set_search_type = function (self, search_type)
	fassert(GameServerInternal.search_types_map[search_type] ~= nil, "Unknown search type (%s)", search_type)

	self._search_type = search_type

	return 
end
SteamServerBrowserWrapper.add_to_favorites = function (self, ip, connection_port, query_port)
	SteamServerBrowser.add_favorite(self._browser, ip, connection_port, query_port)

	return 
end
SteamServerBrowserWrapper.remove_from_favorites = function (self, ip, connection_port, query_port)
	SteamServerBrowser.remove_favorite(self._browser, ip, connection_port, query_port)

	return 
end
SteamServerBrowserWrapper.clear_filters = function (self)
	SteamServerBrowser.clear_filters(self._browser)
	table.clear(self._filters)

	return 
end
SteamServerBrowserWrapper.add_filters = function (self, filters)
	local server_browser_filters = filters.server_browser_filters

	for key, value in pairs(server_browser_filters) do
		SteamServerBrowser.add_filter(self._browser, key, value)
		mm_printf("Adding server filter: key(%s) value=%s", key, value)
	end

	local matchmaking_filters = filters.matchmaking_filters

	for data_name, filter in pairs(matchmaking_filters) do
		local value = filter.value
		local comparison = filter.comparison
		local compare_func = SteamServerBrowserWrapper.compare_funcs[comparison]

		fassert(compare_func, "Compare func does not exist for comparison(%s)", comparison)

		local compare_name = SteamServerBrowserWrapper.compare_func_names[comparison]
		self._filters[data_name] = {
			value = value,
			compare_name = compare_name,
			compare_func = compare_func
		}

		mm_printf("Server Filter: %s, comparison(%s), value=%s", tostring(data_name), tostring(comparison), tostring(value))
	end

	return 
end
SteamServerBrowserWrapper.update = function (self, dt, t)
	local state = self._state

	if state == "refreshing" then
		if not SteamServerBrowser.is_refreshing(self._browser) then
			local num_servers = SteamServerBrowser.num_servers(self._browser)

			for i = 0, num_servers - 1, 1 do
				SteamServerBrowser.request_data(self._browser, i)
			end

			self._state = "fetching_data"
		end
	elseif state == "fetching_data" then
		local is_fetching = false
		local num_servers = SteamServerBrowser.num_servers(self._browser)

		for i = 0, num_servers - 1, 1 do
			local is_fetching_data, fetch_error = SteamServerBrowser.is_fetching_data(self._browser, i)

			if is_fetching_data then
				is_fetching = true

				break
			end

			assert(fetch_error == false, "fetch error")
		end

		if not is_fetching then
			local cached_servers = self._cached_servers

			table.clear(cached_servers)

			for i = 0, num_servers - 1, 1 do
				local server = SteamServerBrowser.server(self._browser, i)
				server.ip_port = server.ip_address .. ":" .. server.query_port
				local lobby_data = SteamServerBrowser.data_all(self._browser, i)
				lobby_data.server_info = server

				if self._filter_server(self, lobby_data) then
					cached_servers[#cached_servers + 1] = lobby_data
				end
			end

			self._state = "waiting"
		end
	end

	if self._state ~= state then
		printf("[SteamServerBrowserWrapper] Switched state from (%s) to (%s)", state, self._state)
	end

	return 
end
SteamServerBrowserWrapper._filter_server = function (self, server_data)
	local filters = self._filters

	for data_name, filter in pairs(filters) do
		local server_value = server_data[data_name]

		if not server_value then
			printf("[SteamServerBrowserWrapper] Could not find value for server (%s)", data_name)

			return false
		end

		local compare_value = filter.value
		local compare_func = filter.compare_func
		local compare_name = filter.compare_name

		if not compare_func(server_value, compare_value) then
			printf("[SteamServerBrowserWrapper] Server failed on filter %s, server_value(%s) %s compare_value=(%s)", data_name, server_value, compare_name, compare_value)

			return false
		end
	end

	return true
end

return 
