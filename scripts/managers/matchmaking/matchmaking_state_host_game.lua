MatchmakingStateHostGame = class(MatchmakingStateHostGame)
MatchmakingStateHostGame.NAME = "MatchmakingStateHostGame"

MatchmakingStateHostGame.init = function (self, params)
	self._lobby = params.lobby
	self._network_transmit = params.network_transmit
	self._difficulty_manager = params.difficulty
	self._matchmaking_manager = params.matchmaking_manager
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
	local mission_id = search_config.mission_id
	local difficulty = search_config.difficulty
	local peer_id = Network.peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)
	local profile_index = player:profile_index()
	local profile = profile_index and SPProfiles[profile_index]
	local profile_name = (profile and profile.display_name) or "random"
	Managers.matchmaking.debug.state = "hosting game"
	Managers.matchmaking.debug.mission_id = mission_id
	Managers.matchmaking.debug.difficulty = difficulty
	Managers.matchmaking.debug.hero = profile_name
end

MatchmakingStateHostGame.on_exit = function (self)
	return
end

MatchmakingStateHostGame.update = function (self, dt, t)
	if self._wait_to_start_game then
		return MatchmakingStateWaitForCountdown, self.state_context
	elseif self._skip_waystone then
		return MatchmakingStateStartGame, self.state_context
	else
		return MatchmakingStateWaitForCountdown, self.state_context
	end
end

MatchmakingStateHostGame._start_hosting_game = function (self)
	local state_context = self.state_context
	local search_config = self.search_config
	local mission_id = search_config.mission_id
	local act_key = search_config.act_key
	local difficulty = search_config.difficulty
	local matchmaking_type = search_config.matchmaking_type
	local private_game = search_config.private_game
	local mechanism = search_config.mechanism

	fassert(private_game ~= nil, "Private status variable wasn't set.")

	local quick_game = search_config.quick_game
	local eac_authorized = false

	if IS_WINDOWS or IS_LINUX then
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

	self._difficulty_manager:set_difficulty(difficulty, 0)

	local is_dedicated_server = self._lobby:is_dedicated_server()

	if not is_dedicated_server then
		Managers.party:set_leader(self._lobby:lobby_host())
	end

	local is_leader = Managers.party:is_leader(Network.peer_id())
	local is_leader_on_dedicated_server = is_leader and is_dedicated_server

	if not is_leader_on_dedicated_server then
		self._matchmaking_manager:set_matchmaking_data(mission_id, difficulty, act_key, matchmaking_type, private_game, quick_game, eac_authorized, 0, mechanism)
		self._matchmaking_manager:set_game_privacy(private_game)
	end

	self._game_created = true
	self._wait_to_start_game = self.search_config.wait_to_start_game
	self._skip_waystone = self.search_config.skip_waystone

	if self._wait_to_start_game then
	elseif not self._skip_waystone then
		local waystone_type = 1

		if mechanism == "weave" then
			waystone_type = 3
		elseif not quick_game and matchmaking_type ~= "event" then
			local level_settings = LevelSettings[mission_id]
			waystone_type = level_settings.waystone_type or waystone_type
		elseif quick_game and mechanism == "weave" then
			waystone_type = 3
		end

		self._matchmaking_manager:activate_waystone_portal(waystone_type)
	end
end

return
