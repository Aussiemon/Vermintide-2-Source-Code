-- chunkname: @scripts/managers/matchmaking/matchmaking_state_player_hosted_game.lua

MatchmakingStatePlayerHostedGame = class(MatchmakingStatePlayerHostedGame)
MatchmakingStatePlayerHostedGame.NAME = "MatchmakingStatePlayerHostedGame"

MatchmakingStatePlayerHostedGame.init = function (self, params)
	self._lobby = params.lobby
	self._network_transmit = params.network_transmit
	self._difficulty_manager = params.difficulty
	self._matchmaking_manager = params.matchmaking_manager
	self._profile_synchronizer = params.profile_synchronizer
	self._wwise_world = params.wwise_world
end

MatchmakingStatePlayerHostedGame.destroy = function (self)
	return
end

MatchmakingStatePlayerHostedGame.on_enter = function (self, state_context)
	self._state_context = state_context
	self._search_config = state_context.search_config
	self._search_config.is_player_hosted = true

	self:_start_hosting_game()
	self._matchmaking_manager:send_system_chat_message("matchmaking_status_start_hosting_game")
	self._matchmaking_manager:set_lobby_data_match_started(false)
end

MatchmakingStatePlayerHostedGame.on_exit = function (self)
	return
end

MatchmakingStatePlayerHostedGame.update = function (self, dt, t)
	return self._new_state, self._state_context
end

MatchmakingStatePlayerHostedGame.force_start_game = function (self)
	local game_mechanism = Managers.mechanism:game_mechanism()
	local slot_reservation_handler = game_mechanism:get_slot_reservation_handler()

	if slot_reservation_handler:all_teams_have_members() or Development.parameter("allow_versus_force_start_single_player") then
		self._state_context.clients_not_in_game_session = true
		self._search_config.is_player_hosted = false
		self._new_state = MatchmakingStateStartGame

		Managers.matchmaking:set_lobby_data_match_started(true)

		if Managers.state.network.is_server then
			Managers.state.network.network_server:set_custom_game_started_or_cancelled()
		end

		local audio_event = "versus_hud_player_lobby_match_found"
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_sound_local(audio_event)

		local network_transmit = Managers.state.network.network_transmit
		local event_id = NetworkLookup.sound_events[audio_event]
		local leaders = Managers.party:server_get_friend_party_leaders()

		for _, leader in pairs(leaders) do
			if PEER_ID_TO_CHANNEL[leader] then
				network_transmit:send_rpc("rpc_vs_play_matchmaking_sfx", leader, event_id)
			end
		end

		if game_mechanism.server_decide_side_order then
			game_mechanism:server_decide_side_order()
		end
	end
end

MatchmakingStatePlayerHostedGame._start_hosting_game = function (self)
	local state_context = self._state_context
	local search_config = self._search_config
	local mission_id = search_config.mission_id
	local difficulty = search_config.difficulty
	local matchmaking_type = search_config.matchmaking_type
	local quick_game = search_config.quick_game
	local private_game = search_config.private_game
	local mechanism = search_config.mechanism
	local game_mechanism = Managers.mechanism:game_mechanism()
	local slot_reservation_handler = game_mechanism:get_slot_reservation_handler()

	slot_reservation_handler:update_slot_settings(Managers.party:parties())

	local party_id = Managers.mechanism:reserved_party_id_by_peer(Network.peer_id())

	if game_mechanism.set_is_hosting_versus_custom_game then
		game_mechanism:set_is_hosting_versus_custom_game(true)
	end

	local eac_authorized = false

	if IS_WINDOWS then
		local eac_state = EAC.state()

		fassert(eac_state ~= nil, "EAC state wasn't set.")

		eac_authorized = eac_state == "trusted"
	end

	self._difficulty_manager:set_difficulty(difficulty, 0)
	Managers.party:set_leader(self._lobby:lobby_host())
	self._matchmaking_manager:set_matchmaking_data(mission_id, difficulty, nil, matchmaking_type, private_game, quick_game, eac_authorized, 0, mechanism)
	self._matchmaking_manager:set_game_privacy(private_game)
end
