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
	self:_sync_player_data()
	self._matchmaking_manager:send_system_chat_message("matchmaking_status_start_hosting_game")
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
	local lobby_members = self._lobby:members()
	local members = lobby_members:get_members()
	local game_mechanism = Managers.mechanism:game_mechanism()
	local slot_reservation_handler = game_mechanism:get_slot_reservation_handler()
	local _, slot_id = slot_reservation_handler:try_reserve_slots(Network.peer_id(), members)
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

MatchmakingStatePlayerHostedGame._sync_player_data = function (self)
	local my_peer_id = Network.peer_id()
	local players = Managers.player:human_players()

	for _, player in pairs(players) do
		local peer_id = player:network_id()
		local player_name = player:name()
		local profile_index = player:profile_index()
		local career_index = player:career_index()
		local player_unit = player.player_unit
		local cosmetic_ext = ScriptUnit.extension(player_unit, "cosmetic_system")
		local frame_item_name = cosmetic_ext:get_equipped_frame().name
		local frame_item_id = NetworkLookup.item_names[frame_item_name]
		local inventory_ext = ScriptUnit.extension(player_unit, "inventory_system")
		local slot_melee_data = inventory_ext:get_slot_data("slot_melee")
		local slot_melee_item_data = slot_melee_data.item_data
		local slot_melee_item_name = slot_melee_item_data.key
		local melee_weapon_id = NetworkLookup.item_names[slot_melee_item_name]
		local slot_ranged_data = inventory_ext:get_slot_data("slot_ranged")
		local slot_ranged_item_data = slot_ranged_data.item_data
		local slot_ranged_item_name = slot_ranged_item_data.key
		local ranged_weapon_id = NetworkLookup.item_names[slot_ranged_item_name]
		local do_full_sync = false
		local fake_party_id = 0

		self._network_transmit:send_rpc("rpc_matchmaking_sync_player_data", my_peer_id, peer_id, player_name, profile_index, career_index, frame_item_id, melee_weapon_id, ranged_weapon_id, fake_party_id, do_full_sync)
	end
end
