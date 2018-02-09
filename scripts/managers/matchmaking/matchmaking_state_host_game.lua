MatchmakingStateHostGame = class(MatchmakingStateHostGame)
MatchmakingStateHostGame.NAME = "MatchmakingStateHostGame"
MatchmakingStateHostGame.init = function (self, params)
	self._lobby = params.lobby
	self._network_transmit = params.network_transmit
	self._difficulty_manager = params.difficulty
	self._matchmaking_manager = params.matchmaking_manager
	self._handshaker_host = params.handshaker_host
	self._wwise_world = params.wwise_world

	return 
end
MatchmakingStateHostGame.destroy = function (self)
	return 
end
MatchmakingStateHostGame.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config

	self._start_hosting_game(self)
	self._matchmaking_manager:send_system_chat_message("matchmaking_status_start_hosting_game")

	if not DEDICATED_SERVER then
		self.set_debug_info(self)
	end

	return 
end
MatchmakingStateHostGame.set_debug_info = function (self)
	local search_config = self.search_config
	local level = search_config.level_key
	local difficulty = search_config.difficulty
	local peer_id = Network.peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)
	local profile_index = player.profile_index(player)
	local profile = SPProfiles[profile_index]
	local profile_name = profile.display_name
	Managers.matchmaking.debug.state = "hosting game"
	Managers.matchmaking.debug.level = level
	Managers.matchmaking.debug.difficulty = difficulty
	Managers.matchmaking.debug.hero = profile_name

	return 
end
MatchmakingStateHostGame.on_exit = function (self)
	return 
end
MatchmakingStateHostGame.update = function (self, dt, t)
	return MatchmakingStateWaitForCountdown, self.state_context
end
MatchmakingStateHostGame._start_hosting_game = function (self)
	local state_context = self.state_context
	local search_config = self.search_config
	local level_key = search_config.level_key
	local act_key = search_config.act_key
	local difficulty = search_config.difficulty
	local game_mode = search_config.game_mode
	local private_game = search_config.private_game

	assert(private_game ~= nil)

	local quick_game = search_config.quick_game
	local eac_authorized = false

	if Managers.eac:enabled() then
		eac_authorized = Managers.eac:authorized()
	end

	self._difficulty_manager:set_difficulty(difficulty)

	local is_dedicated_server = self._lobby:is_dedicated_server()

	if not is_dedicated_server then
		Managers.party:set_leader(self._lobby:lobby_host())
	end

	local is_leader = Managers.party:is_leader(Network.peer_id())
	local is_leader_on_dedicated_server = is_leader and is_dedicated_server

	if not is_leader_on_dedicated_server then
		self._matchmaking_manager:set_matchmaking_data(level_key, difficulty, act_key, game_mode, private_game, quick_game, eac_authorized)
		self._matchmaking_manager:set_game_privacy(private_game)
	end

	self._game_created = true

	self._matchmaking_manager:activate_waystone_portal(true)

	return 
end

return 
