require("scripts/game_state/server_join_state_machine")

MatchmakingStateRequestJoinGame = class(MatchmakingStateRequestJoinGame)
MatchmakingStateRequestJoinGame.NAME = "MatchmakingStateRequestJoinGame"

MatchmakingStateRequestJoinGame.init = function (self, params)
	self._lobby = params.lobby
	self._network_options = params.network_options
	self._matchmaking_manager = params.matchmaking_manager
	self._handshaker_client = params.handshaker_client
	self._matchmaking_manager.selected_profile_index = nil
	self._state = "waiting_to_join_lobby"
end

MatchmakingStateRequestJoinGame.destroy = function (self)
	if self._password_request ~= nil then
		self._password_request:destroy()

		self._password_request = nil
	end
end

MatchmakingStateRequestJoinGame.on_enter = function (self, state_context)
	self.state_context = state_context
	self._join_lobby_data = state_context.join_lobby_data
	self._game_reply = nil
	self._connected_to_server = false
	self._connect_timeout = nil
	self._join_timeout = nil
	self._pre_verification_error = nil
	local passed_verification, error_message = self:_run_pre_connection_verification(self._join_lobby_data)

	if passed_verification then
		self:_setup_lobby_connection(self._join_lobby_data, state_context.password)

		local host = self._join_lobby_data.host or "nohostname"
		self._matchmaking_manager.debug.text = "Joining lobby"
		self._matchmaking_manager.debug.state = "hosted by: " .. host

		self._matchmaking_manager:send_system_chat_message("matchmaking_status_starting_handshake")
	else
		self._state = "failed_pre_connection_verification"
		self._pre_verification_error = error_message or "pre_verification_failed"
	end
end

MatchmakingStateRequestJoinGame.on_exit = function (self)
	return
end

MatchmakingStateRequestJoinGame._run_pre_connection_verification = function (self, join_lobby_data)
	local current_lobby_id = self._lobby:id()
	local lobby_id = join_lobby_data.id or join_lobby_data.name

	if lobby_id == current_lobby_id then
		return false, "popup_already_in_same_lobby"
	end

	return true
end

MatchmakingStateRequestJoinGame._setup_lobby_connection = function (self, join_lobby_data, password)
	local network_options = self._network_options

	if join_lobby_data.server_info then
		if password == nil then
			self._state = "waiting_for_password"
			local user_data = {
				network_options = network_options,
				game_server_data = join_lobby_data
			}
			self._password_request = ServerJoinStateMachine:new(network_options, join_lobby_data.server_info.ip_port, user_data)
		else
			self.lobby_client = GameServerLobbyClient:new(network_options, join_lobby_data, password)
		end
	else
		self.lobby_client = LobbyClient:new(network_options, join_lobby_data)
	end
end

MatchmakingStateRequestJoinGame.update = function (self, dt, t)
	local host, lobby_id, new_lobby_state = nil
	local lobby_client = self.lobby_client

	if lobby_client ~= nil then
		lobby_client:update(dt)

		host = lobby_client:lobby_host()
		lobby_id = lobby_client:id()
		new_lobby_state = lobby_client.state

		if lobby_client:failed() then
			return self:_join_game_failed(lobby_id, "failure_start_join_server", t, true)
		end
	end

	local state = self._state

	if state == "failed_pre_connection_verification" then
		return self:_join_game_failed(lobby_id, self._pre_verification_error, t, false)
	elseif state == "waiting_for_password" then
		self._password_request:update(dt)

		local action, user_data, password = self._password_request:result()

		if action ~= nil then
			if action == "join" then
				self.lobby_client = GameServerLobbyClient:new(user_data.network_options, user_data.game_server_data, password)
				self._state = "waiting_to_join_lobby"
			else
				return self:_join_game_failed(nil, "cancelled", t, false)
			end

			self._password_request:destroy()

			self._password_request = nil
		end
	elseif state == "waiting_to_join_lobby" then
		if lobby_client:is_joined() and host ~= "0" then
			self._matchmaking_manager.debug.text = "Connecting to host"
			local host_name = (LobbyInternal.user_name and LobbyInternal.user_name(host)) or (lobby_client.user_name and lobby_client:user_name(host)) or "-"

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

			return self:_join_game_failed(lobby_id, "connection_timeout", t, true)
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

			return self:_join_game_failed(lobby_id, "handshake_timeout", t, true)
		end
	elseif state == "check_network_hash" then
		local this_hash = lobby_client.network_hash
		local other_hash = lobby_client:lobby_data("network_hash")

		if other_hash ~= nil then
			if this_hash ~= other_hash then
				local host_name = (LobbyInternal.user_name and LobbyInternal.user_name(host)) or "-"

				mm_printf("Network hashes differ. lobby_id=%s, host_id:%s", lobby_id, host_name)
				self:_join_fail_popup(string.format(Localize("failure_start_join_server_incorrect_hash"), this_hash, other_hash))

				return self:_join_game_failed(lobby_id, "network_hash_mismatch", t, true)
			end

			self._matchmaking_manager.debug.text = "Requesting to join"

			mm_printf("Network hash check done, requesting to join game...")
			self._handshaker_client:send_rpc_to_host("rpc_matchmaking_request_join_lobby", lobby_id, false)

			self._join_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
			self._state = "asking_to_join"
		elseif self._check_network_hash_timeout < t then
			local host_name = (LobbyInternal.user_name and LobbyInternal.user_name(host)) or "-"

			mm_printf("Failed to get lobby data in time. lobby_id=%s, host_id:%s", lobby_id, host_name)

			return self:_join_game_failed(lobby_id, "lobby_data_timeout", t, true)
		end
	elseif state == "asking_to_join" then
		local join_time = MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME - (self._join_timeout - t)
		self._matchmaking_manager.debug.text = string.format("Requesting to join game %s [%.0f]", self.lobby_client:id(), join_time)
		local host_name = (LobbyInternal.user_name and LobbyInternal.user_name(host)) or "-"
		local game_reply = self._game_reply

		if self._join_timeout < t then
			mm_printf_force("Failed to join game due to timeout. lobby_id=%s, host_id:%s", lobby_id, host_name)

			return self:_join_game_failed(lobby_id, "join_timeout", t, true)
		elseif game_reply ~= nil then
			if game_reply == "lobby_ok" then
				mm_printf("Successfully joined game after %.2f seconds: lobby_id=%s host_id:%s", join_time, lobby_id, host_name)

				return self:_join_game_success(t)
			else
				mm_printf_force("Failed to join game due to host responding '%s'. lobby_id=%s, host_id:%s", game_reply, lobby_id, host_name)

				return self:_join_game_failed(lobby_id, game_reply, t, game_reply == "lobby_id_mismatch")
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
end

MatchmakingStateRequestJoinGame._join_game_failed = function (self, lobby_id, reason, t, is_bad_connection)
	if lobby_id ~= nil then
		self._matchmaking_manager:add_broken_lobby(lobby_id, t, is_bad_connection)
	end

	if self.lobby_client ~= nil then
		self.lobby_client:destroy()

		self.lobby_client = nil
	end

	self._handshaker_client:reset()

	self.state_context.join_lobby_data = nil

	if reason ~= "cancelled" then
		local status_message = "matchmaking_status_join_game_failed_" .. reason

		self._matchmaking_manager:send_system_chat_message(status_message)
	end

	local join_by_lobby_browser = self.state_context.join_by_lobby_browser

	if join_by_lobby_browser then
		self._matchmaking_manager:cancel_join_lobby(reason)

		return MatchmakingStateIdle, self.state_context
	else
		return MatchmakingStateSearchGame, self.state_context
	end
end

MatchmakingStateRequestJoinGame.rpc_matchmaking_request_join_lobby_reply = function (self, sender, client_cookie, host_cookie, reply_id)
	if not self._handshaker_client:validate_cookies(client_cookie, host_cookie) then
		return
	end

	self._game_reply = NetworkLookup.game_ping_reply[reply_id]
end

MatchmakingStateRequestJoinGame.rpc_notify_connected = function (self, sender)
	self._connected_to_server = true
end

return
