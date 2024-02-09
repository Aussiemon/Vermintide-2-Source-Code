-- chunkname: @scripts/game_state/server_party_reserve_state_machine.lua

local FindServerState = class(FindServerState)

FindServerState.NAME = "FindServerState"

FindServerState.init = function (self, state_machine, network_options, network_hash, peers_to_reserve, black_listed_servers, filters, optional_order_func, user_data)
	self._state_machine = state_machine
	self._num_players = #peers_to_reserve
	self._network_options = network_options
	self._network_hash = network_hash
	self._optional_order_func = optional_order_func
	self._black_listed_servers = black_listed_servers
	self._filters = filters
	self._search_types = {
		"favorites",
		"internet",
		"lan",
	}
	state_machine._search_index = state_machine._search_index or 1
	state_machine._servers_by_type = state_machine._servers_by_type or {}
	self._finder = nil
	self._delay = 0
	self._search_time = 0
	self._soft_filters = user_data.soft_filters or {}
end

FindServerState.enter = function (self)
	return
end

FindServerState.destroy = function (self)
	if self._finder ~= nil then
		self._finder:destroy()
	end

	self._finder = nil
end

FindServerState.update = function (self, dt, t)
	self._search_time = self._search_time + dt

	if t < self._delay then
		return
	end

	local sm = self._state_machine
	local search_type = self._search_types[sm._search_index]
	local server_list = sm._servers_by_type[search_type] or {}

	if table.is_empty(server_list) then
		if self._finder == nil then
			self._finder = self:_trigger_search(search_type)
		end

		self._finder:update(dt)

		if self._finder:is_refreshing() then
			return
		end

		local servers = self._finder:servers()

		ServerSearchUtils.filter_game_server_search(servers, self._network_options, self._soft_filters, self._network_hash, self._black_listed_servers, self._search_time)

		if self._optional_order_func ~= nil then
			table.sort(servers, self._optional_order_func)
		end

		sm._servers_by_type[search_type] = servers

		self._finder:destroy()

		self._finder = nil
		server_list = servers
	end

	local server_data = self:_pick_server(search_type, server_list)

	if server_data == nil then
		if sm._search_index >= #self._search_types then
			self._delay = t + 3
		end

		sm._search_index = math.index_wrapper(sm._search_index + 1, #self._search_types)

		return
	else
		return "server_found", server_data
	end
end

FindServerState._pick_server = function (self, search_type)
	print("######### PICKING SERVER #########")

	local state_machine = self._state_machine
	local servers = state_machine._servers_by_type[search_type]

	if #servers == 0 then
		return nil
	end

	local server_index

	server_index = self._optional_order_func ~= nil and 1 or Math.random(#servers)

	local server = servers[server_index]

	table.remove(servers, server_index)

	if table.is_empty(servers) then
		state_machine._reserve_attempts[search_type] = state_machine._reserve_attempts[search_type] - 1

		if state_machine._reserve_attempts[search_type] <= 0 then
			table.clear(servers)
		end
	end

	return server
end

FindServerState._trigger_search = function (self, search_type)
	print("Attempting " .. search_type .. " search for game server")

	local disable_dedicated_servers = Development.parameter("use_lan_backend") or rawget(_G, "Steam") == nil
	local supported_on_platform = IS_WINDOWS
	local game_server_finder

	if disable_dedicated_servers or not supported_on_platform then
		game_server_finder = GameServerFinderLan:new(self._network_options)
	else
		game_server_finder = GameServerFinder:new(self._network_options)
	end

	game_server_finder:set_search_type(search_type)

	local game_server_requirements = {
		free_slots = self._num_players,
		server_browser_filters = {
			dedicated = "valuenotused",
			notfull = "valuenotused",
			gamedir = Managers.mechanism:server_universe(),
		},
		matchmaking_filters = {},
	}

	table.merge_recursive(game_server_requirements, self._filters)

	local skip_verify_lobby_data = true

	game_server_finder:add_filter_requirements(game_server_requirements, skip_verify_lobby_data)
	game_server_finder:refresh()

	return game_server_finder
end

local ServerReserveState = class(ServerReserveState)

ServerReserveState.NAME = "ServerReserveState"

ServerReserveState.init = function (self, state_machine, network_options, network_hash, peers_to_reserve, optional_order_func, black_listed_servers, filters)
	self._network_options = network_options
	self._peers_to_reserve = peers_to_reserve
	self._state_machine = state_machine
end

ServerReserveState.enter = function (self, server_data)
	print("Attempt reserving slots on " .. server_data.server_info.ip_port)

	local password

	self._lobby_data = server_data
	self._lobby = GameServerLobbyClient:new(self._network_options, server_data, password, self._peers_to_reserve)
	self._state_machine._lobby = self._lobby
end

ServerReserveState.update = function (self, dt)
	local lobby = self._lobby

	lobby:update(dt)

	local state = lobby:state()

	if state == "reserved" then
		return "reserve_success", lobby, self._lobby_data
	end

	if state == "failed" then
		return "reserve_failed"
	end
end

local SuccessState = class(SuccessState)

SuccessState.NAME = "SuccessState"

SuccessState.init = function (self, state_machine, network_options, network_hash, peers_to_reserve, optional_order_func, black_listed_servers, filters)
	self._state_machine = state_machine
end

SuccessState.enter = function (self, lobby, lobby_data)
	self._state_machine._result = "reserved"
	self._state_machine._lobby_data = lobby_data
end

local FailState = class(FailState)

FailState.NAME = "FailState"

FailState.init = function (self, state_machine, network_options, network_hash, peers_to_reserve, optional_order_func, black_listed_servers, filters)
	state_machine._result = "failed"
end

ServerPartyReserveStateMachine = class(ServerPartyReserveStateMachine, VisualStateMachine)

ServerPartyReserveStateMachine.init = function (self, network_options, peers_to_reserve, optional_order_func, optional_black_listed_servers, optional_filters, user_data)
	local parent
	local config_file_name = network_options.config_file_name
	local project_hash = network_options.project_hash
	local network_hash = LobbyAux.create_network_hash(config_file_name, project_hash)

	self.super.init(self, "ServerPartyReserveStateMachine", parent, network_options, network_hash, peers_to_reserve, optional_black_listed_servers or {}, optional_filters or {}, optional_order_func, user_data or {})

	self._has_result = false
	self._user_data = user_data
	self._result = nil
	self._lobby = nil
	self._lobby_data = nil
	self._reserve_attempts = {
		favorites = 5,
		internet = 5,
		lan = 5,
	}
	self._servers = {}

	self:add_transition("FindServerState", "server_found", ServerReserveState)
	self:add_transition("FindServerState", "server_not_found", FailState)
	self:add_transition("ServerReserveState", "reserve_success", SuccessState)
	self:add_transition("ServerReserveState", "reserve_failed", FindServerState)
	self:set_initial_state(FindServerState)
end

ServerPartyReserveStateMachine.destroy = function (self)
	if self._lobby then
		self._lobby:destroy()

		self._lobby = nil
	end

	self.super.destroy(self)
end

ServerPartyReserveStateMachine.result = function (self)
	if self._result == nil then
		return
	end

	local lobby = self._lobby

	self._lobby = nil

	return self._result, lobby, self._lobby_data, self._user_data
end
