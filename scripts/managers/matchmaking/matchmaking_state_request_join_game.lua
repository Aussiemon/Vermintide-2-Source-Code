MatchmakingStateRequestJoinGame = class(MatchmakingStateRequestJoinGame)
MatchmakingStateRequestJoinGame.NAME = "MatchmakingStateRequestJoinGame"
MatchmakingStateRequestJoinGame.init = function (self, params)
	self._lobby = params.lobby
	self._network_options = params.network_options
	self._matchmaking_manager = params.matchmaking_manager
	self._handshaker_client = params.handshaker_client
	self._matchmaking_manager.selected_profile_index = nil
	self._state = "waiting_to_join_lobby"

	return 
end
MatchmakingStateRequestJoinGame.destroy = function (self)
	return 
end
MatchmakingStateRequestJoinGame.on_enter = function (self, state_context)
	self.state_context = state_context
	self._join_lobby_data = state_context.join_lobby_data
	self._game_reply = nil
	self._connected_to_server = false
	self._connect_timeout = nil
	self._join_timeout = nil

	self._setup_lobby_connection(self, self._join_lobby_data, state_context.password)

	local host = self._join_lobby_data.host or "nohostname"
	self._matchmaking_manager.debug.text = "Joining lobby"
	self._matchmaking_manager.debug.state = "hosted by: " .. host

	self._matchmaking_manager:send_system_chat_message("matchmaking_status_starting_handshake")

	return 
end
MatchmakingStateRequestJoinGame.on_exit = function (self)
	return 
end
MatchmakingStateRequestJoinGame._setup_lobby_connection = function (self, join_lobby_data, password)
	local network_options = self._network_options

	if join_lobby_data.server_info then
		self.lobby_client = GameServerLobbyClient:new(network_options, join_lobby_data, password)
	else
		self.lobby_client = LobbyClient:new(network_options, join_lobby_data)
	end

	return 
end
MatchmakingStateRequestJoinGame.update = function (self, dt, t)
	local lobby_client = self.lobby_client

	lobby_client.update(lobby_client, dt)

	local host = lobby_client.lobby_host(lobby_client)
	local lobby_id = lobby_client.id(lobby_client)
	local new_lobby_state = lobby_client.state

	if lobby_client.failed(lobby_client) then
		return self._join_game_failed(self, lobby_id, "failure_start_join_server", t, true)
	end

	local state = self._state

	if state == "waiting_to_join_lobby" then
		if lobby_client.is_joined(lobby_client) and host ~= "0" then
			self._matchmaking_manager.debug.text = "Connecting to host"
			local host_name = (LobbyInternal.user_name and LobbyInternal.user_name(host)) or (lobby_client.user_name and lobby_client.user_name(lobby_client, host)) or "-"

			mm_printf("Joined lobby, waiting to connect to host with user name '%s'...", tostring(host_name))

			self._state = "waiting_to_connect"
			self._connect_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
		end
	elseif state == "waiting_to_connect" then
		if self._connected_to_server then
			self._matchmaking_manager.debug.text = "Handshaking"

			mm_printf("Connected, starting handshake...")
			self._handshaker_client:start_handshake(host)

			self._handshake_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
			self._state = "waiting_for_handshake"
		elseif self._connect_timeout < t then
			local host_name = (LobbyInternal.user_name and LobbyInternal.user_name(host)) or "-"

			mm_printf_force("Failed to connect to host due to timeout. lobby_id=%s, host_id:%s", lobby_id, host_name)

			return self._join_game_failed(self, lobby_id, "connection_timeout", t, true)
		end
	elseif state == "waiting_for_handshake" then
		local handshake_time = self._handshake_timeout - t + 1
		self._matchmaking_manager.debug.text = string.format("Waiting for handshake %s [%.0f]", self.lobby_client:id(), handshake_time)

		if self._handshaker_client:handshake_done() then
			mm_printf("Handshake done, checking network hash...")

			self._check_network_hash_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
			self._state = "check_network_hash"
		elseif self._handshake_timeout < t then
			local host_name = (LobbyInternal.user_name and LobbyInternal.user_name(host)) or "-"

			mm_printf("Failed to resolve handshake in time. lobby_id=%s, host_id:%s", lobby_id, host_name)

			return self._join_game_failed(self, lobby_id, "handshake_timeout", t, true)
		end
	elseif state == "check_network_hash" then
		local this_hash = lobby_client.network_hash
		local other_hash = lobby_client.lobby_data(lobby_client, "network_hash")

		if other_hash ~= nil then
			if this_hash ~= other_hash then
				local host_name = (LobbyInternal.user_name and LobbyInternal.user_name(host)) or "-"

				mm_printf("Network hashes differ. lobby_id=%s, host_id:%s", lobby_id, host_name)
				self._join_fail_popup(self, string.format(Localize("failure_start_join_server_incorrect_hash"), this_hash, other_hash))

				return self._join_game_failed(self, lobby_id, "network_hash_mismatch", t, true)
			end

			self._matchmaking_manager.debug.text = "Requesting to join"

			mm_printf("Network hash check done, requesting to join game...")
			self._handshaker_client:send_rpc_to_host("rpc_matchmaking_request_join_lobby", lobby_id)

			self._join_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
			self._state = "asking_to_join"
		elseif self._check_network_hash_timeout < t then
			local host_name = (LobbyInternal.user_name and LobbyInternal.user_name(host)) or "-"

			mm_printf("Failed to get lobby data in time. lobby_id=%s, host_id:%s", lobby_id, host_name)

			return self._join_game_failed(self, lobby_id, "lobby_data_timeout", t, true)
		end
	elseif state == "asking_to_join" then
		local join_time = MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME - self._join_timeout - t
		self._matchmaking_manager.debug.text = string.format("Requesting to join game %s [%.0f]", self.lobby_client:id(), join_time)
		local host_name = (LobbyInternal.user_name and LobbyInternal.user_name(host)) or "-"
		local game_reply = self._game_reply

		if self._join_timeout < t then
			mm_printf_force("Failed to join game due to timeout. lobby_id=%s, host_id:%s", lobby_id, host_name)

			return self._join_game_failed(self, lobby_id, "join_timeout", t, true)
		elseif game_reply ~= nil then
			if game_reply == "lobby_ok" then
				mm_printf("Successfully joined game after %.2f seconds: lobby_id=%s host_id:%s", join_time, lobby_id, host_name)

				return self._join_game_success(self, t)
			else
				mm_printf_force("Failed to join game due to host responding '%s'. lobby_id=%s, host_id:%s", game_reply, lobby_id, host_name)

				return self._join_game_failed(self, lobby_id, game_reply, t, game_reply == "lobby_id_mismatch")
			end
		end
	end

	return nil
end
MatchmakingStateRequestJoinGame._join_game_success = function (self, t)
	self.state_context.lobby_client = self.lobby_client

	return MatchmakingStateRequestProfiles, self.state_context
end
MatchmakingStateRequestJoinGame._join_fail_popup = function (self, fail_text)
	local non_matchmaking_join = self.state_context.non_matchmaking_join
	local has_lobby_browser_ui = self.state_context.join_by_lobby_browser and self.lobby_browser_view_ui

	if non_matchmaking_join and not has_lobby_browser_ui then
		Managers.simple_popup:queue_popup(fail_text, Localize("popup_error_topic"), "ok", Localize("button_ok"))
	end

	return 
end
MatchmakingStateRequestJoinGame._join_game_failed = function (self, lobby_id, reason, t, is_bad_connection)
	self._matchmaking_manager:add_broken_lobby(lobby_id, t, is_bad_connection)
	self.lobby_client:destroy()

	self.lobby_client = nil

	self._handshaker_client:reset()

	self.state_context.join_lobby_data = nil
	local status_message = "matchmaking_status_join_game_failed_" .. reason

	self._matchmaking_manager:send_system_chat_message(status_message)

	local join_by_lobby_browser = self.state_context.join_by_lobby_browser

	if join_by_lobby_browser then
		self._matchmaking_manager:cancel_join_lobby(reason)

		return MatchmakingStateIdle, self.state_context
	else
		return MatchmakingStateSearchGame, self.state_context
	end

	return 
end
MatchmakingStateRequestJoinGame.rpc_matchmaking_request_join_lobby_reply = function (self, sender, client_cookie, host_cookie, reply_id)
	if not self._handshaker_client:validate_cookies(client_cookie, host_cookie) then
		return 
	end

	self._game_reply = NetworkLookup.game_ping_reply[reply_id]

	return 
end
MatchmakingStateRequestJoinGame.rpc_notify_connected = function (self, sender)
	self._connected_to_server = true

	return 
end

return 
