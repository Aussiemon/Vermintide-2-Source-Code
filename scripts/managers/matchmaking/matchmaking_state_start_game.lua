MatchmakingStateStartGame = class(MatchmakingStateStartGame)
MatchmakingStateStartGame.NAME = "MatchmakingStateStartGame"
MatchmakingStateStartGame.init = function (self, params)
	self._lobby = params.lobby
	self._level_transition_handler = params.level_transition_handler
	self._handshaker_host = params.handshaker_host
	self._handshaker_client = params.handshaker_client
	self._network_server = params.network_server
	self._statistics_db = params.statistics_db
	self._matchmaking_manager = params.matchmaking_manager

	return 
end
MatchmakingStateStartGame.destroy = function (self)
	return 
end
MatchmakingStateStartGame.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config

	self._setup_lobby_data(self)
	self._network_server:enter_post_game()
	self._start_game(self)

	return 
end
MatchmakingStateStartGame.on_exit = function (self)
	self._game_parameters = nil

	return 
end
MatchmakingStateStartGame.update = function (self, dt, t)
	return nil
end
MatchmakingStateStartGame._setup_lobby_data = function (self)
	local level_key, difficulty, act_key, quick_game, private_game = nil

	if self.state_context.join_by_lobby_browser then
		level_key = self._level_transition_handler:default_level_key()
		difficulty = Managers.state.difficulty:get_difficulty()
		act_key = nil
		quick_game = false
		private_game = false
	else
		local search_config = self.search_config
		level_key = search_config.level_key
		difficulty = search_config.difficulty
		act_key = search_config.act_key
		quick_game = search_config.quick_game
		private_game = search_config.private_game
	end

	if quick_game then
		level_key = self._matchmaking_manager:get_weighed_random_unlocked_level()
	end

	local level_settings = LevelSettings[level_key]
	local game_mode = level_settings.game_mode
	local eac_authorized = false

	if PLATFORM == "win32" then
		if DEDICATED_SERVER then
			eac_authorized = false
		else
			local eac_state = EAC.state()

			assert(eac_state ~= nil)

			eac_authorized = eac_state == "trusted"
		end
	end

	self._matchmaking_manager:set_matchmaking_data(level_key, difficulty, act_key, game_mode, private_game, quick_game, eac_authorized)
	Managers.state.difficulty:set_difficulty(difficulty)

	self._game_parameters = {
		level_key = level_key,
		difficulty = difficulty,
		game_mode = game_mode,
		private_game = private_game
	}

	return 
end
MatchmakingStateStartGame.get_transition = function (self)
	if self.next_transition_state and self.start_lobby_data then
		return self.next_transition_state, self.start_lobby_data
	end

	return 
end
MatchmakingStateStartGame._start_game = function (self)
	self._capture_telemetry(self)
	self._handshaker_host:send_rpc_to_clients("rpc_matchmaking_join_game")

	local game_server_lobby_client = self.state_context.game_server_lobby_client

	if game_server_lobby_client then
		self.next_transition_state = "start_lobby"
		self.start_lobby_data = {
			lobby_client = game_server_lobby_client
		}
		local ip_address = game_server_lobby_client.ip_address(game_server_lobby_client)

		self._handshaker_host:send_rpc_to_clients("rpc_matchmaking_broadcast_game_server_ip_address", ip_address)
	else
		Managers.state.game_mode:complete_level()
	end

	return 
end
MatchmakingStateStartGame._capture_telemetry = function (self)
	local lobby_members = self._lobby:members()
	local members = lobby_members.get_members(lobby_members)
	local nr_friends = 0

	for _, peer_id in pairs(members) do
		if rawget(_G, "Steam") and rawget(_G, "Friends") then
			local is_friend = Friends.in_category(peer_id, Friends.FRIEND_FLAG)

			if is_friend then
				nr_friends = nr_friends + 1
			end
		end
	end

	local player = Managers.player:local_player(1)

	Managers.telemetry.events:matchmaking_starting_game(player, nr_friends)

	local connection_state = "started_game"
	local time_taken = Managers.time:time("main") - self.state_context.started_matchmaking_t
	local using_strict_matchmaking = self.search_config.strict_matchmaking

	Managers.telemetry.events:matchmaking_connection(player, connection_state, time_taken, using_strict_matchmaking)

	return 
end

return 
