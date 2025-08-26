-- chunkname: @scripts/managers/matchmaking/matchmaking_state_reserve_lobby.lua

require("scripts/game_state/server_search_utils")
require("scripts/game_state/server_party_reserve_state_machine")

local REQUEST_DATA_DELAY = 2

MatchmakingStateReserveLobby = class(MatchmakingStateReserveLobby)
MatchmakingStateReserveLobby.NAME = "MatchmakingStateReserveLobby"

MatchmakingStateReserveLobby.init = function (self, params)
	self._network_options = params.network_options
	self._network_transmit = params.network_transmit
	self._reserver = nil
	self._state = nil
	self._wait_for_join_message = nil
	self._join_lobby_data = nil
	self._received_join_message = nil
	self._request_timer = 0
	self._lobby = params.lobby

	Managers.state.event:register(self, "friend_party_peer_left", "on_friend_party_peer_left")
end

MatchmakingStateReserveLobby.terminate = function (self)
	if Managers.lobby:query_lobby("matchmaking_join_lobby") then
		Managers.lobby:destroy_lobby("matchmaking_join_lobby")
	end
end

MatchmakingStateReserveLobby.destroy = function (self)
	self:_cleanup()
end

MatchmakingStateReserveLobby.on_enter = function (self, state_context)
	self._state_context = state_context
	self._wait_for_join_message = state_context.search_config.wait_for_join_message

	local search_config = state_context.search_config
	local party_lobby_host = search_config.party_lobby_host

	self._party_lobby_host = party_lobby_host
	self._cleanup_server_lobby = true

	local lobby_members = party_lobby_host:members()
	local party_members = lobby_members:get_members()

	if state_context.is_flexmatch then
		local server_info = state_context.server_info

		Managers.lobby:make_lobby(GameServerLobbyClient, "matchmaking_join_lobby", "MatchmakingStateReserveLobby (on_enter)", self._network_options, state_context, server_info.password, party_members)

		self._state = "reserving"
	else
		if not search_config.linux then
			self._optional_filters = {
				matchmaking_filters = {
					name = {
						comparison = "not_equal",
						value = "AWS Gamelift unknown",
					},
				},
			}
		end

		self:_start_search(party_members, self._optional_filters)
	end
end

MatchmakingStateReserveLobby.on_exit = function (self)
	self:_cleanup()
end

MatchmakingStateReserveLobby.update = function (self, dt, t)
	local state = self._state
	local game_server_lobby_client = Managers.lobby:query_lobby("matchmaking_join_lobby")

	if game_server_lobby_client and t > self._request_timer then
		game_server_lobby_client:request_data()

		self._request_timer = t + REQUEST_DATA_DELAY
	end

	if state == "reserving" then
		local result, lobby_data

		if self._reserver then
			self._reserver:update(dt, t)

			result, game_server_lobby_client, lobby_data = self._reserver:result()
		elseif game_server_lobby_client then
			game_server_lobby_client:update(dt)

			result = game_server_lobby_client:state()
		end

		if result == "reserved" then
			if self._reserver then
				Managers.lobby:register_existing_lobby(game_server_lobby_client, "matchmaking_join_lobby", "MatchmakingStateReserveLobby (update)")
			end

			if self._reserver then
				self._join_lobby_data = lobby_data
			else
				self._join_lobby_data = table.clone(self._state_context)
			end

			local search_config = self._state_context.search_config

			if search_config and search_config.aws then
				self._state = "send_queue_tickets"
			elseif self._wait_for_join_message then
				self._state = "waiting_for_join_message"
			else
				self:_claim_reservation(self._state_context)

				return MatchmakingStateRequestJoinGame, self._state_context
			end
		elseif result == "failed" then
			local search_config = self._state_context.search_config

			if self._state_context.is_flexmatch then
				return MatchmakingStateIdle, self._state_context
			elseif search_config.player_hosted then
				return MatchmakingStateSearchPlayerHostedLobby, self._state_context
			elseif search_config.dedicated_server then
				self._state = "reserving"
			else
				return MatchmakingStateIdle, self._state_context
			end
		end
	elseif state == "send_queue_tickets" then
		game_server_lobby_client = Managers.lobby:get_lobby("matchmaking_join_lobby")

		local engine_lobby = game_server_lobby_client.lobby

		if SteamGameServerLobby.state(engine_lobby) == "failed" then
			self:_reset()

			return MatchmakingStateIdle, self._state_context
		end

		if not Managers.mechanism:dedicated_server_peer_id() then
			return
		end

		if self._wait_for_join_message then
			self._state = "waiting_for_join_message"
		else
			self:_claim_reservation(self._state_context)

			return MatchmakingStateRequestJoinGame, self._state_context
		end
	elseif state == "waiting_for_join_message" then
		if self._received_join_message then
			self:_claim_reservation(self._state_context)

			return MatchmakingStateRequestJoinGame, self._state_context
		end

		game_server_lobby_client = Managers.lobby:get_lobby("matchmaking_join_lobby")

		local engine_lobby = game_server_lobby_client.lobby

		if SteamGameServerLobby.state(engine_lobby) == "failed" then
			self:_reset()

			local search_config = self._state_context.search_config

			if search_config and search_config.aws then
				return MatchmakingStateIdle, self._state_context
			else
				local party_lobby_host = self._party_lobby_host
				local lobby_members = party_lobby_host:members()
				local party_members = lobby_members:get_members()

				self:_start_search(party_members, self._optional_filters)
			end
		end
	end
end

MatchmakingStateReserveLobby._reset = function (self)
	local mechanism = Managers.mechanism:game_mechanism()

	if mechanism.reset_dedicated_slots_count and mechanism.reset_party_info then
		mechanism:reset_dedicated_slots_count()
		mechanism:reset_party_info()
	end

	if Managers.lobby:query_lobby("matchmaking_join_lobby") then
		Managers.lobby:destroy_lobby("matchmaking_join_lobby")
	end

	self._join_lobby_data = nil
end

MatchmakingStateReserveLobby.rpc_join_reserved_game_server = function (self, channel_id)
	self._received_join_message = true
end

MatchmakingStateReserveLobby._cleanup = function (self)
	if self._reserver ~= nil then
		self._reserver:destroy()

		self._reserver = nil
	end

	if self._cleanup_server_lobby and Managers.lobby:query_lobby("matchmaking_join_lobby") then
		Managers.lobby:destroy_lobby("matchmaking_join_lobby")
	end

	self._state = nil
	self._wait_for_join_message = nil

	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("friend_party_peer_left", self)
	end
end

MatchmakingStateReserveLobby._start_search = function (self, party_members, optional_filters)
	local optional_order_func = Managers.mechanism:get_custom_lobby_sort()
	local optional_black_listed_servers = Managers.matchmaking:broken_server_map()
	local allow_hotjoining_ongoing_game = not Managers.state.game_mode:setting("allow_hotjoining_ongoing_game")
	local check_server_name = false
	local user_data = {
		soft_filters = {
			filter_fully_reserved_servers = true,
			hotjoin_disabled_game_states = true,
			remove_started_servers = allow_hotjoining_ongoing_game,
			check_server_name = check_server_name,
		},
	}

	if self._reserver then
		self._reserver:destroy()
	end

	self._reserver = ServerPartyReserveStateMachine:new(self._network_options, party_members, optional_order_func, optional_black_listed_servers, optional_filters, user_data)

	local lobby_data = self._lobby:get_stored_lobby_data()

	lobby_data.matchmaking = "searching"
	lobby_data.time_of_search = tostring(os.time())

	self._lobby:set_lobby_data(lobby_data)

	self._state = "reserving"
end

MatchmakingStateReserveLobby._claim_reservation = function (self, state_context)
	local game_server_lobby_client = Managers.lobby:free_lobby("matchmaking_join_lobby")

	state_context.reserved_lobby = game_server_lobby_client
	state_context.join_lobby_data = self._join_lobby_data

	game_server_lobby_client:claim_reserved()

	self._join_lobby_data = nil
	self._cleanup_server_lobby = false
end

MatchmakingStateReserveLobby.on_friend_party_peer_left = function (self, peer_id, approved_for_joining, peer_state)
	if approved_for_joining then
		Managers.matchmaking:cancel_matchmaking()
	end
end

MatchmakingStateReserveLobby.rpc_flexmatch_game_session_id_request = function (self, channel_id)
	if self._flexmatch_response_sent then
		return
	end

	local packed_ticket = NetworkUtils.net_pack_flexmatch_ticket(self._state_context.game_session_id)

	RPC.rpc_flexmatch_game_session_id_response(channel_id, packed_ticket)

	self._flexmatch_response_sent = true
end
