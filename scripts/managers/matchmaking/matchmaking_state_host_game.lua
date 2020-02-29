MatchmakingStateHostGame = class(MatchmakingStateHostGame)
MatchmakingStateHostGame.NAME = "MatchmakingStateHostGame"

MatchmakingStateHostGame.init = function (self, params)
	self._lobby = params.lobby
	self._network_transmit = params.network_transmit
	self._difficulty_manager = params.difficulty
	self._matchmaking_manager = params.matchmaking_manager
	self._handshaker_host = params.handshaker_host
	self._wwise_world = params.wwise_world
end

MatchmakingStateHostGame.destroy = function (self)
	return
end

MatchmakingStateHostGame.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config

	self:_start_hosting_game()
	self._matchmaking_manager:send_system_chat_message("matchmaking_status_start_hosting_game")

	if not DEDICATED_SERVER then
		self:set_debug_info()

		local player = Managers.player:local_player()
		local connection_state = "started_hosting"
		local time_taken = Managers.time:time("main") - self.state_context.started_matchmaking_t
		local using_strict_matchmaking = self.search_config.strict_matchmaking

		Managers.telemetry.events:matchmaking_hosting(player, time_taken, self.search_config)

		self.state_context.started_hosting_t = Managers.time:time("main")
	end
end

MatchmakingStateHostGame.set_debug_info = function (self)
	local search_config = self.search_config
	local level = search_config.level_key
	local difficulty = search_config.difficulty
	local peer_id = Network.peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)
	local profile_index = player:profile_index()
	local profile = profile_index and SPProfiles[profile_index]
	local profile_name = (profile and profile.display_name) or "random"
	Managers.matchmaking.debug.state = "hosting game"
	Managers.matchmaking.debug.level = level
	Managers.matchmaking.debug.difficulty = difficulty
	Managers.matchmaking.debug.hero = profile_name
end

MatchmakingStateHostGame.on_exit = function (self)
	return
end

MatchmakingStateHostGame.update = function (self, dt, t)
	if self._skip_waystone then
		return MatchmakingStateStartGame, self.state_context
	else
		return MatchmakingStateWaitForCountdown, self.state_context
	end
end

MatchmakingStateHostGame._start_hosting_game = function (self)
	local state_context = self.state_context
	local search_config = self.search_config
	local level_key = search_config.level_key
	local act_key = search_config.act_key
	local difficulty = search_config.difficulty
	local game_mode = search_config.game_mode
	local private_game = search_config.private_game
	local weave_name = search_config.weave_name

	fassert(private_game ~= nil, "Private status variable wasn't set.")

	local quick_game = search_config.quick_game
	local eac_authorized = false

	if PLATFORM == "win32" then
		if DEDICATED_SERVER then
			local eac_server = Managers.matchmaking.network_server:eac_server()
			eac_authorized = EACServer.state(eac_server, Network.peer_id()) == "trusted"
		else
			local eac_state = EAC.state()

			fassert(eac_state ~= nil, "EAC state wasn't set.")

			eac_authorized = eac_state == "trusted"
		end
	end

	local mechanism_name = Managers.mechanism:current_mechanism_name()

	if not DEDICATED_SERVER and mechanism_name == "versus" then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_2d_audio_event("menu_wind_countdown_warning")
	end

	self._difficulty_manager:set_difficulty(difficulty)

	local is_dedicated_server = self._lobby:is_dedicated_server()

	if not is_dedicated_server then
		Managers.party:set_leader(self._lobby:lobby_host())
	end

	local is_leader = Managers.party:is_leader(Network.peer_id())
	local is_leader_on_dedicated_server = is_leader and is_dedicated_server

	if not is_leader_on_dedicated_server then
		self._matchmaking_manager:set_matchmaking_data(level_key, difficulty, act_key, game_mode, private_game, quick_game, eac_authorized, weave_name)
		self._matchmaking_manager:set_game_privacy(private_game)
	end

	self._game_created = true
	self._skip_waystone = self.search_config.skip_waystone

	if not self._skip_waystone then
		local waystone_type = 1

		if not quick_game and game_mode ~= "event" then
			local level_settings = LevelSettings[level_key]
			waystone_type = level_settings.waystone_type or waystone_type
		elseif quick_game and game_mode == "weave" then
			waystone_type = 3
		end

		self._matchmaking_manager:activate_waystone_portal(true, waystone_type)
	end
end

return
