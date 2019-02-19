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
end

MatchmakingStateStartGame.destroy = function (self)
	return
end

MatchmakingStateStartGame.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config

	self:_setup_lobby_data()
	self._network_server:enter_post_game()
	self:_start_game()
end

MatchmakingStateStartGame.on_exit = function (self)
	self._game_parameters = nil
end

MatchmakingStateStartGame.update = function (self, dt, t)
	return nil
end

MatchmakingStateStartGame._setup_lobby_data = function (self)
	local level_key, difficulty, act_key, quick_game, private_game = nil
	local search_config = self.search_config
	local game_mode = search_config.game_mode

	if self.state_context.join_by_lobby_browser then
		level_key = self._level_transition_handler:default_level_key()
		difficulty = Managers.state.difficulty:get_difficulty()
		act_key = nil
		quick_game = false
		private_game = false
	else
		level_key = search_config.level_key
		difficulty = search_config.difficulty
		act_key = search_config.act_key
		quick_game = search_config.quick_game
		private_game = search_config.private_game
	end

	if quick_game or level_key == nil then
		local ignore_dlc_check = false

		if Managers.account:offline_mode() then
			ignore_dlc_check = false
		end

		level_key = self._matchmaking_manager:get_weighed_random_unlocked_level(ignore_dlc_check)
	end

	local eac_authorized = false

	if PLATFORM == "win32" then
		if DEDICATED_SERVER then
			local eac_server = Managers.matchmaking.network_server:eac_server()
			eac_authorized = EACServer.state(eac_server, Network.peer_id()) == "trusted"
		else
			local eac_state = EAC.state()

			fassert(eac_state ~= nil, "Couldn't fetch EAC state!")

			eac_authorized = eac_state == "trusted"
		end
	end

	if PLATFORM == "xb1" then
		local DIFFICULTY_LUT = {
			"easy",
			"normal",
			"hard",
			"harder",
			"hardest"
		}
		local matchmaking_types = nil

		if game_mode == "event" then
			matchmaking_types = {
				"event"
			}
		else
			matchmaking_types = {
				"quick_game",
				"custom_game"
			}
		end

		local lobby_members_class = self._lobby:members()
		local lobby_members = lobby_members_class:get_members()
		local profiles = {}

		for _, peer_id in ipairs(lobby_members) do
			local player = Managers.player:player_from_peer_id(peer_id)

			if player then
				profiles[#profiles + 1] = player:profile_index()
			end
		end

		local difficulty_id = table.find(DIFFICULTY_LUT, difficulty)
		local powerlevel = self._matchmaking_manager:get_average_power_level()
		local strict_matchmaking = 0
		local network_hash = self._lobby:get_network_hash()
		local ticket_params = {
			level = {
				level_key
			},
			matchmaking_types = matchmaking_types,
			difficulty = difficulty_id,
			powerlevel = powerlevel,
			strict_matchmaking = strict_matchmaking,
			profiles = profiles,
			network_hash = network_hash
		}

		self._lobby:enable_matchmaking(not search_config.private_game, ticket_params, 600)
	end

	self._matchmaking_manager:set_matchmaking_data(level_key, difficulty, act_key, game_mode, private_game, quick_game, eac_authorized)
	Managers.state.difficulty:set_difficulty(difficulty)

	self._game_parameters = {
		level_key = level_key,
		difficulty = difficulty,
		game_mode = game_mode,
		private_game = private_game
	}
end

MatchmakingStateStartGame.get_transition = function (self)
	if self.next_transition_state and self.start_lobby_data then
		return self.next_transition_state, self.start_lobby_data
	end
end

MatchmakingStateStartGame._start_game = function (self)
	self:_capture_telemetry()
	self._handshaker_host:send_rpc_to_clients("rpc_matchmaking_join_game")

	local game_server_lobby_client = self.state_context.game_server_lobby_client

	if game_server_lobby_client then
		self.next_transition_state = "start_lobby"
		self.start_lobby_data = {
			lobby_client = game_server_lobby_client
		}
		local ip_address = game_server_lobby_client:ip_address()

		self._handshaker_host:send_rpc_to_clients("rpc_matchmaking_broadcast_game_server_ip_address", ip_address)
	else
		Managers.state.game_mode:complete_level()
	end
end

MatchmakingStateStartGame._capture_telemetry = function (self)
	local lobby_members = self._lobby:members()
	local members = lobby_members:get_members()
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
end

return
