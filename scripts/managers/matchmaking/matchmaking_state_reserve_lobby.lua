-- chunkname: @scripts/managers/matchmaking/matchmaking_state_reserve_lobby.lua

require("scripts/game_state/server_search_utils")
require("scripts/game_state/server_party_reserve_state_machine")

local REQUEST_DATA_DELAY = 2

MatchmakingStateReserveLobby = class(MatchmakingStateReserveLobby)
MatchmakingStateReserveLobby.NAME = "MatchmakingStateReserveLobby"

MatchmakingStateReserveLobby.init = function (self, params)
	self._network_options = params.network_options
	self._reserver = nil
	self._state = nil
	self._wait_for_join_message = nil
	self._reserved_lobby_client = nil
	self._join_lobby_data = nil
	self._received_join_message = nil
	self._request_timer = 0
	self._lobby = params.lobby

	Managers.state.event:register(self, "friend_party_peer_left", "on_friend_party_peer_left")
end

MatchmakingStateReserveLobby.terminate = function (self)
	if self._reserved_lobby_client then
		self._reserved_lobby_client:destroy()
	end
end

MatchmakingStateReserveLobby.destroy = function (self)
	self:_cleanup()
end

MatchmakingStateReserveLobby.on_enter = function (self, state_context)
	self._state_context = state_context
	self._wait_for_join_message = state_context.search_config.wait_for_join_message

	local search_config = state_context.search_config

	self._party_members = search_config.party_members

	local linux = search_config.linux

	if not linux then
		self._optional_filters = {
			matchmaking_filters = {
				name = {
					comparison = "not_equal",
					value = "AWS Gamelift unknown",
				},
			},
		}
	end

	self:_start_search(self._party_members, self._optional_filters)
end

MatchmakingStateReserveLobby.on_exit = function (self)
	self:_cleanup()
end

MatchmakingStateReserveLobby.update = function (self, dt, t)
	local state = self._state

	if self._reserved_lobby_client and t > self._request_timer then
		self._reserved_lobby_client:request_data()

		self._request_timer = t + REQUEST_DATA_DELAY
	end

	self:_update_lobby_finder(dt, t)

	if state == "reserving" then
		self._reserver:update(dt, t)

		local result, game_server_lobby_client, lobby_data = self._reserver:result()

		if result == "reserved" then
			print("MatchmakingStateReserveLobby open channel")

			local engine_lobby = game_server_lobby_client.lobby
			local game_server_peer_id = GameServerInternal.lobby_host(engine_lobby)
			local channel_id = GameServerInternal.open_channel(engine_lobby, game_server_peer_id)

			PEER_ID_TO_CHANNEL[game_server_peer_id] = channel_id
			CHANNEL_TO_PEER_ID[channel_id] = game_server_peer_id
			self._reserved_lobby_client = game_server_lobby_client
			self._join_lobby_data = lobby_data

			if self._wait_for_join_message then
				self._state = "waiting_for_join_message"
			else
				self:_claim_reservation(self._state_context)

				return MatchmakingStateRequestJoinGame, self._state_context
			end
		elseif result == "failed" then
			local search_config = self._state_context.search_config

			if search_config.player_hosted then
				return MatchmakingStateSearchPlayerHostedLobby, self._state_context
			elseif search_config.dedicated_server then
				self._state = "reserving"
			else
				return MatchmakingStateIdle, self._state_context
			end
		end
	elseif state == "waiting_for_join_message" then
		if self._received_join_message then
			self:_claim_reservation(self._state_context)

			return MatchmakingStateRequestJoinGame, self._state_context
		end

		local engine_lobby = self._reserved_lobby_client.lobby

		if SteamGameServerLobby.state(engine_lobby) == "failed" then
			local fail_reason = SteamGameServerLobby.fail_reason(engine_lobby)
			local mechanism = Managers.mechanism:game_mechanism()

			if mechanism.reset_dedicated_slots_count and mechanism.reset_party_info then
				mechanism:reset_dedicated_slots_count()
				mechanism:reset_party_info()
			end

			self._reserved_lobby_client:destroy()

			self._reserved_lobby_client = nil
			self._join_lobby_data = nil

			self:_start_search(self._party_members, self._optional_filters)
		end
	end
end

MatchmakingStateReserveLobby._update_lobby_finder = function (self, dt, t)
	if self._lobby_update_timer then
		fassert(not self._lobby_finder:is_refreshing(), "")

		if t > self._lobby_update_timer then
			self._lobby_finder:refresh()

			self._lobby_update_timer = nil
		else
			return
		end
	end

	self._lobby_finder:update(dt)

	if self._lobby_finder:is_refreshing() then
		return
	end

	local lobbies = self._lobby_finder:lobbies()
	local num_players_matchmaking

	if #lobbies > 0 then
		num_players_matchmaking = 0

		for i = 1, #lobbies do
			local lobby = lobbies[i]
			local num_players = tonumber(lobby.num_players)

			if lobby.matchmaking ~= "false" then
				num_players_matchmaking = num_players_matchmaking + num_players
			end
		end
	else
		local lobby_data = self._lobby:get_stored_lobby_data()

		num_players_matchmaking = lobby_data.num_players
	end

	Managers.state.event:trigger("matchmaking_num_players_in_matchmaking", "versus", num_players_matchmaking)

	self._lobby_update_timer = t + 10
end

MatchmakingStateReserveLobby.rpc_join_reserved_game_server = function (self, channel_id)
	self._received_join_message = true
end

MatchmakingStateReserveLobby._cleanup = function (self)
	if self._reserver ~= nil then
		self._reserver:destroy()

		self._reserver = nil
	end

	self._state = nil
	self._wait_for_join_message = nil

	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("friend_party_peer_left", self)
	end

	if self._lobby_finder then
		self._lobby_finder:destroy()

		self._lobby_finder = nil
	end
end

MatchmakingStateReserveLobby._start_search = function (self, party_members, optional_filters)
	local optional_order_func = Managers.mechanism:get_custom_lobby_sort()
	local optional_black_listed_servers = Managers.matchmaking:broken_server_map()
	local allow_hotjoining_ongoing_game = not Managers.state.game_mode:setting("allow_hotjoining_ongoing_game")
	local user_data = {
		soft_filters = {
			check_server_name = false,
			filter_fully_reserved_servers = true,
			hotjoin_disabled_game_states = true,
			remove_started_servers = allow_hotjoining_ongoing_game,
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

	if not self._lobby_finder then
		self._lobby_finder = ServerSearchUtils.trigger_lobby_finder_search(self._network_options, 0, {
			filters = {
				mechanism = {
					comparison = "equal",
					value = "versus",
				},
				matchmaking = {
					comparison = "not_equal",
					value = "false",
				},
				game_state = {
					comparison = "equal",
					value = "party_lobby",
				},
			},
		})
	end
end

MatchmakingStateReserveLobby._claim_reservation = function (self, state_context)
	state_context.reserved_lobby = self._reserved_lobby_client
	state_context.join_lobby_data = self._join_lobby_data

	self._reserved_lobby_client:claim_reserved()

	self._reserved_lobby_client = nil
	self._join_lobby_data = nil
end

MatchmakingStateReserveLobby.on_friend_party_peer_left = function (self, peer_id, approved_for_joining, peer_state)
	if approved_for_joining then
		Managers.matchmaking:cancel_matchmaking()
	end
end
