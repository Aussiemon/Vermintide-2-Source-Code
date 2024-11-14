-- chunkname: @scripts/managers/matchmaking/matchmaking_state_reserve_slots_player_hosted.lua

MatchmakingStateReserveSlotsPlayerHosted = class(MatchmakingStateReserveSlotsPlayerHosted)
MatchmakingStateReserveSlotsPlayerHosted.NAME = "MatchmakingStateReserveSlotsPlayerHosted"

MatchmakingStateReserveSlotsPlayerHosted.init = function (self, params)
	self._lobby = params.lobby
	self._network_options = params.network_options
	self._matchmaking_manager = params.matchmaking_manager
	self._network_transmit = params.network_transmit
	self._is_server = params.is_server
	self._state = "waiting_to_join_lobby"
end

MatchmakingStateReserveSlotsPlayerHosted.destroy = function (self)
	if self._password_request ~= nil then
		self._password_request:destroy()

		self._password_request = nil
	end
end

MatchmakingStateReserveSlotsPlayerHosted.on_enter = function (self, state_context)
	self._state_context = state_context
	self._search_config = state_context.search_config
	self._reservation_reply = nil
	self._connected_to_server = false
	self._connect_timeout = nil
	self._current_lobby = Managers.state.network:lobby()
	self._joined_peers = {}

	local join_lobby_data = state_context.join_lobby_data

	Managers.lobby:make_lobby(LobbyClient, "matchmaking_join_lobby", self._network_options, join_lobby_data)

	self._matchmaking_manager.debug.text = "Joining lobby"
	self._matchmaking_manager.debug.state = "hosted by: " .. (join_lobby_data.host or "<no_host_name>")

	self._matchmaking_manager:send_system_chat_message("matchmaking_status_starting_handshake")
end

MatchmakingStateReserveSlotsPlayerHosted.on_exit = function (self)
	return
end

MatchmakingStateReserveSlotsPlayerHosted.terminate = function (self)
	if Managers.lobby:query_lobby("matchmaking_join_lobby") then
		Managers.lobby:destroy_lobby("matchmaking_join_lobby")
	end
end

MatchmakingStateReserveSlotsPlayerHosted.update = function (self, dt, t)
	self:_update_states(dt, t)

	return self._new_state, self._state_context
end

MatchmakingStateReserveSlotsPlayerHosted._update_states = function (self, dt, t)
	local lobby_client = Managers.lobby:query_lobby("matchmaking_join_lobby")

	if not lobby_client then
		return self:_join_game_failed("failure_start_join_server")
	else
		lobby_client:update(dt)

		if lobby_client:failed() then
			return self:_join_game_failed("failure_start_join_server")
		end
	end

	local host = lobby_client:lobby_host()
	local lobby_id = lobby_client:id()
	local state = self._state

	if state == "waiting_to_join_lobby" then
		if lobby_client:is_joined() and host ~= "0" then
			self._matchmaking_manager.debug.text = "Connecting to host"

			mm_printf("Joined lobby, checking network hash...")

			self._check_network_hash_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
			self._state = "verify_not_blocked"
		end
	elseif state == "verify_not_blocked" then
		local host_peer_id = lobby_client:lobby_host()
		local relationship = Friends.relationship(host_peer_id)

		if relationship == Friends.IGNORED or relationship == Friends.IGNORED_FRIEND then
			return self:_join_game_failed("user_blocked")
		end

		self._state = "waiting_to_connect"
		self._connect_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
	elseif state == "waiting_to_connect" then
		if self._connected_to_server then
			if self._is_server then
				self._state = "waiting_for_peers_to_join"
				self._waiting_for_peers_to_join_timout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME

				return self:_join_game_success(t)
			else
				self._waiting_for_confirmation_timout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
				self._state = "waiting_for_confirmation"

				return self:_join_game_success(t)
			end
		elseif t > self._connect_timeout then
			local host_name = LobbyInternal.user_name and LobbyInternal.user_name(host) or "-"

			mm_printf_force("Failed to connect to host due to timeout. lobby_id=%s, host_id:%s", lobby_id, host_name)

			return self:_join_game_failed("connection_timeout")
		end
	elseif state == "waiting_for_peers_to_join" then
		if self:_all_players_joined() then
			self._state = "request_reservation"
		elseif t > self._waiting_for_peers_to_join_timout then
			return self:_join_game_failed("join_timeout")
		end
	elseif state == "request_reservation" then
		self._matchmaking_manager.debug.text = "Requesting reservation"

		mm_printf("Connected, request reservation...")

		local lobby_members = self._lobby:members()
		local members = lobby_members:get_members()

		self._network_transmit:send_rpc("rpc_matchmaking_request_reserve_slots", host, lobby_id, members)

		self._reservation_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
		self._state = "asking_for_reservation"
	elseif state == "asking_for_reservation" then
		local reservation_time = MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME - (self._reservation_timeout - t)

		self._matchmaking_manager.debug.text = string.format("Requesting to reserve slots %s [%.0f]", lobby_client:id(), reservation_time)

		local host_name = LobbyInternal.user_name and LobbyInternal.user_name(host) or "-"
		local reservation_reply = self._reservation_reply

		if t > self._reservation_timeout then
			mm_printf_force("Failed to reserve slots due to timeout. lobby_id=%s, host_id:%s", lobby_id, host_name)

			return self:_join_game_failed("connection_timeout")
		elseif reservation_reply ~= nil then
			if reservation_reply == "lobby_ok" then
				mm_printf("Successfully reserved slots after %.2f seconds: lobby_id=%s host_id:%s", reservation_time, lobby_id, host_name)

				return self:_reservation_success(true)
			else
				mm_printf_force("Failed to reserve slots  due to host responding '%s'. lobby_id=%s, host_id:%s", reservation_reply, lobby_id, host_name)

				return self:_reservation_success(false)
			end
		end
	elseif state == "waiting_for_confirmation" then
		-- Nothing
	end
end

MatchmakingStateReserveSlotsPlayerHosted._join_game_success = function (self, t)
	local success = true

	if self._is_server then
		self._joined_peers[Network.peer_id()] = success

		local join_lobby_data = self._state_context.join_lobby_data

		self._network_transmit:send_rpc_clients("rpc_matchmaking_client_join_player_hosted", join_lobby_data.id)
	else
		local host = self._current_lobby:lobby_host()

		self._network_transmit:send_rpc("rpc_matchmaking_client_joined_player_hosted", host, success)
	end
end

MatchmakingStateReserveSlotsPlayerHosted._join_game_failed = function (self, reason)
	print("[MatchmakingStateReserveSlotsPlayerHosted] FAILED: " .. reason)

	local success = false

	if self._is_server then
		self._joined_peers[Network.peer_id()] = false

		self._network_transmit:send_rpc_clients("rpc_matchmaking_reservation_success", success)
	else
		local host = self._current_lobby:lobby_host()

		self._network_transmit:send_rpc("rpc_matchmaking_client_joined_player_hosted", host, success)
	end

	self:_cancel_join()
end

MatchmakingStateReserveSlotsPlayerHosted._reservation_success = function (self, success)
	if self._is_server then
		self._network_transmit:send_rpc_clients("rpc_matchmaking_reservation_success", success)
	end

	if success then
		self._state = "done"
		self._new_state = MatchmakingStateWaitJoinPlayerHosted
	else
		self:_cancel_join()
	end
end

MatchmakingStateReserveSlotsPlayerHosted._cancel_join = function (self)
	if Managers.lobby:query_lobby("matchmaking_join_lobby") then
		Managers.lobby:destroy_lobby("matchmaking_join_lobby")
	end

	self._matchmaking_manager:reset_joining()

	self._state_context.join_lobby_data = nil

	local join_by_lobby_browser = self._state_context.join_by_lobby_browser
	local friend_join = self._state_context.friend_join

	if self._is_server and not join_by_lobby_browser and not friend_join then
		if self._search_config.dedicated_server then
			self._new_state = MatchmakingStateReserveLobby
		else
			self._new_state = MatchmakingStateSearchPlayerHostedLobby
		end
	else
		Managers.matchmaking:cancel_matchmaking()
	end
end

MatchmakingStateReserveSlotsPlayerHosted._all_players_joined = function (self)
	local lobby_members = self._lobby:members()
	local members = lobby_members:get_members()
	local all_joined = true

	for _, peer_id in pairs(members) do
		if not self._joined_peers[peer_id] then
			all_joined = false

			break
		end
	end

	return all_joined
end

MatchmakingStateReserveSlotsPlayerHosted.rpc_matchmaking_client_joined_player_hosted = function (self, channel_id, success)
	if not self._is_server then
		fassert(false, "[MatchmakingStateReserveSlotsPlayerHosted] Server Only function")
	end

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	self._joined_peers[peer_id] = success

	if not success then
		self:_join_game_failed("peer_failed_to_join")
	end
end

MatchmakingStateReserveSlotsPlayerHosted.rpc_matchmaking_request_reserve_slots_reply = function (self, channel_id, reply_id, reply_variable)
	self._reservation_reply = NetworkLookup.game_ping_reply[reply_id]
	self._reservation_reply_variable = reply_variable
end

MatchmakingStateReserveSlotsPlayerHosted.rpc_matchmaking_reservation_success = function (self, channel_id, success)
	if self._is_server then
		fassert(false, "[MatchmakingStateReserveSlotsPlayerHosted] The lobby host should never receive this")
	end

	if success then
		self._new_state = MatchmakingStateWaitJoinPlayerHosted
	else
		self:_cancel_join()
	end
end

MatchmakingStateReserveSlotsPlayerHosted.rpc_notify_connected = function (self, channel_id)
	self._connected_to_server = true
end
