﻿-- chunkname: @scripts/managers/matchmaking/matchmaking_state_request_join_game.lua

require("scripts/game_state/server_join_state_machine")

MatchmakingStateRequestJoinGame = class(MatchmakingStateRequestJoinGame)
MatchmakingStateRequestJoinGame.NAME = "MatchmakingStateRequestJoinGame"

MatchmakingStateRequestJoinGame.init = function (self, params)
	self._lobby = params.lobby
	self._network_options = params.network_options
	self._matchmaking_manager = params.matchmaking_manager
	self._network_transmit = params.network_transmit
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
	self.lobby_client = state_context.reserved_lobby
	self._pre_verification_error = nil

	local passed_verification, error_message = self:_run_pre_connection_verification(self._join_lobby_data)

	if passed_verification then
		local host

		if self.lobby_client == nil then
			self:_setup_lobby_connection(self._join_lobby_data, state_context.password)

			host = self._join_lobby_data.host or "nohostname"
		else
			host = "dedicated server"
		end

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
				game_server_data = join_lobby_data,
			}

			self._user_data = user_data
		else
			self.lobby_client = GameServerLobbyClient:new(network_options, join_lobby_data, password)
		end
	else
		self.lobby_client = LobbyClient:new(network_options, join_lobby_data)
	end
end

MatchmakingStateRequestJoinGame.update = function (self, dt, t)
	local host, lobby_id, new_lobby_state
	local lobby_client = self.lobby_client

	if lobby_client ~= nil then
		lobby_client:update(dt)

		host = lobby_client:lobby_host()
		lobby_id = lobby_client:id()
		new_lobby_state = lobby_client.state

		if lobby_client:failed() then
			return self:_join_game_failed("failure_start_join_server", t, true)
		end
	end

	local state = self._state

	if state == "failed_pre_connection_verification" then
		return self:_join_game_failed(self._pre_verification_error, t, false)
	elseif state == "waiting_for_password" then
		local action, user_data, password

		if self._password_request then
			self._password_request:update(dt)

			action, user_data, password = self._password_request:result()
		else
			action, user_data, password = "join", self._user_data, ""
		end

		if action ~= nil then
			if action == "join" then
				self.lobby_client = GameServerLobbyClient:new(user_data.network_options, user_data.game_server_data, password)
				self._state = "waiting_to_join_lobby"
			else
				return self:_join_game_failed("cancelled", t, false)
			end

			if self._password_request then
				self._password_request:destroy()

				self._password_request = nil
			end
		end
	elseif state == "waiting_to_join_lobby" then
		if lobby_client:is_joined() and host ~= "0" then
			self._matchmaking_manager.debug.text = "Connecting to host"

			local host_name = LobbyInternal.user_name and LobbyInternal.user_name(host) or lobby_client.user_name and lobby_client:user_name(host) or "-"

			mm_printf("Joined lobby, checking network hash...")

			self._check_network_hash_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
			self._state = "check_network_hash"
		end
	elseif state == "check_network_hash" then
		local this_hash = lobby_client.network_hash
		local other_hash = lobby_client:lobby_data("network_hash")
		local host_name = LobbyInternal.user_name and LobbyInternal.user_name(host) or "-"

		if other_hash ~= nil then
			if this_hash == other_hash then
				mm_printf("Network hashes matches, waiting to connect to host with user name '%s'...", tostring(host_name))

				self._state = "verify_not_blocked"
			else
				mm_printf("Network hashes differ. lobby_id=%s, host_id:%s, this_hash:%q, other_hash:%q", lobby_id, host_name, this_hash, other_hash)
				self:_join_fail_popup(string.format(Localize("failure_start_join_server_incorrect_hash"), this_hash, other_hash))

				return self:_join_game_failed("network_hash_mismatch", t, true)
			end
		elseif t > self._check_network_hash_timeout then
			mm_printf("Failed to get lobby data in time. lobby_id=%s, host_id:%s", lobby_id, host_name)

			return self:_join_game_failed("lobby_data_timeout", t, true)
		end
	elseif state == "verify_not_blocked" then
		if not DEDICATED_SERVER and IS_WINDOWS then
			local host_peer_id = lobby_client:lobby_host()
			local relationship = Friends.relationship(host_peer_id)

			if relationship == Friends.IGNORED or relationship == Friends.IGNORED_FRIEND then
				return self:_join_game_failed("user_blocked", t, false)
			end
		end

		self._state = "verify_game_mode"
	elseif state == "verify_game_mode" then
		local matchmaking_type_id = lobby_client:lobby_data("matchmaking_type")

		if not matchmaking_type_id then
			self._state = "verify_difficulty"

			return
		end

		local mechanism = lobby_client:lobby_data("mechanism")
		local mechanism_settings = MechanismSettings[mechanism]

		if mechanism_settings and mechanism_settings.extra_requirements_function then
			if mechanism_settings.extra_requirements_function() then
				if mechanism_settings.disable_difficulty_check then
					self._state = "waiting_to_connect"
					self._connect_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
				else
					self._state = "verify_difficulty"
				end
			else
				local host_name = LobbyInternal.user_name and LobbyInternal.user_name(host) or "-"
				local game_reply = "failure_start_join_server_game_mode_requirements_failed"

				return self:_join_game_failed(game_reply, t, false, nil, true)
			end
		elseif mechanism_settings and mechanism_settings.disable_difficulty_check then
			self._state = "waiting_to_connect"
			self._connect_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
		else
			self._state = "verify_difficulty"
		end
	elseif state == "verify_difficulty" then
		if Development.parameter("unlock_all_difficulties") then
			self._state = "waiting_to_connect"
			self._connect_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME

			return
		end

		local difficulty = lobby_client:lobby_data("difficulty") or "normal"
		local difficutly_settings = DifficultySettings[difficulty]
		local local_player = Managers.player:local_player()
		local best_aquired_power_level = local_player:best_aquired_power_level()
		local difficulty_approved = true
		local requirements = ""

		if best_aquired_power_level < difficutly_settings.required_power_level then
			difficulty_approved = false
			requirements = string.format("%s: %s\n", Localize("required_power_level"), tostring(UIUtils.presentable_hero_power_level(difficutly_settings.required_power_level)))
		end

		if difficutly_settings.extra_requirement_name then
			local extra_requirement_data = ExtraDifficultyRequirements[difficutly_settings.extra_requirement_name]

			if not extra_requirement_data.requirement_function() then
				difficulty_approved = false
				requirements = requirements .. "* " .. Localize(extra_requirement_data.description_text) .. "\n"
			end
		end

		if not difficulty_approved then
			local host_name = LobbyInternal.user_name and LobbyInternal.user_name(host) or "-"
			local game_reply = "failure_start_join_server_difficulty_requirements_failed"

			return self:_join_game_failed(game_reply, t, false, requirements, true)
		else
			self._state = "waiting_to_connect"
			self._connect_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
		end
	elseif state == "waiting_to_connect" then
		if self._connected_to_server then
			self._matchmaking_manager.debug.text = "Requesting to join"

			mm_printf("Connected, requesting to join game...")

			local friend_join = not not self.state_context.friend_join
			local unlocked_dlcs_array = self:_gather_dlc_ids()

			self._network_transmit:send_rpc("rpc_matchmaking_request_join_lobby", host, lobby_id, friend_join, unlocked_dlcs_array)

			self._join_timeout = t + MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME
			self._state = "asking_to_join"
		elseif t > self._connect_timeout then
			local host_name = LobbyInternal.user_name and LobbyInternal.user_name(host) or "-"

			mm_printf_force("Failed to connect to host due to timeout. lobby_id=%s, host_id:%s", lobby_id, host_name)

			return self:_join_game_failed("connection_timeout", t, true)
		end
	elseif state == "asking_to_join" then
		local join_time = MatchmakingSettings.REQUEST_JOIN_LOBBY_REPLY_TIME - (self._join_timeout - t)

		self._matchmaking_manager.debug.text = string.format("Requesting to join game %s [%.0f]", self.lobby_client:id(), join_time)

		local host_name = LobbyInternal.user_name and LobbyInternal.user_name(host) or "-"
		local game_reply = self._game_reply

		if t > self._join_timeout then
			mm_printf_force("Failed to join game due to timeout. lobby_id=%s, host_id:%s", lobby_id, host_name)

			return self:_join_game_failed("connection_timeout", t, true)
		elseif game_reply ~= nil then
			if game_reply == "lobby_ok" then
				mm_printf("Successfully joined game after %.2f seconds: lobby_id=%s host_id:%s", join_time, lobby_id, host_name)

				return self:_join_game_success(t)
			else
				mm_printf_force("Failed to join game due to host responding '%s'. lobby_id=%s, host_id:%s", game_reply, lobby_id, host_name)

				return self:_join_game_failed(game_reply, t, game_reply == "lobby_id_mismatch", self._game_reply_variable, true)
			end
		end
	end

	return nil
end

MatchmakingStateRequestJoinGame._gather_dlc_ids = function (self)
	local unlocked_dlcs = {}
	local dlcs = UnlockSettings[1].unlocks
	local unlock_manager = Managers.unlock

	for dlc_name, _ in pairs(dlcs) do
		if unlock_manager:is_dlc_unlocked(dlc_name) and not unlock_manager:is_dlc_cosmetic(dlc_name) then
			print(dlc_name)

			unlocked_dlcs[#unlocked_dlcs + 1] = NetworkLookup.dlcs[dlc_name]
		end
	end

	return unlocked_dlcs
end

MatchmakingStateRequestJoinGame._join_game_success = function (self, t)
	self.state_context.lobby_client = self.lobby_client

	local join_method = self.state_context.search_config and self.state_context.search_config.join_method

	if join_method == "party" then
		return MatchmakingStatePartyJoins, self.state_context
	else
		if Managers.mechanism:current_mechanism_name() == "versus" then
			self.state_context.profiles_data = {}

			return MatchmakingStateJoinGame, self.state_context
		end

		return MatchmakingStateRequestProfiles, self.state_context
	end
end

MatchmakingStateRequestJoinGame._join_fail_popup = function (self, fail_text)
	local non_matchmaking_join = self.state_context.non_matchmaking_join
	local has_lobby_browser_ui = self.state_context.join_by_lobby_browser and self.lobby_browser_view_ui

	if non_matchmaking_join and not has_lobby_browser_ui then
		Managers.simple_popup:queue_popup(fail_text, Localize("popup_error_topic"), "ok", Localize("button_ok"))
	end
end

MatchmakingStateRequestJoinGame._join_game_failed = function (self, reason, t, is_bad_connection, reason_variable, disable_chat_message)
	self._matchmaking_manager:add_broken_lobby_client(self.lobby_client, t, is_bad_connection)

	if self.lobby_client ~= nil then
		self.lobby_client:destroy()

		self.lobby_client = nil
	end

	self._matchmaking_manager:reset_joining()

	self.state_context.join_lobby_data = nil

	if reason ~= "cancelled" and not disable_chat_message then
		local status_message = "matchmaking_status_join_game_failed_" .. reason

		self._matchmaking_manager:send_system_chat_message(status_message)
	end

	local join_by_lobby_browser = self.state_context.join_by_lobby_browser

	if join_by_lobby_browser then
		self._matchmaking_manager:cancel_join_lobby(reason, reason_variable)

		return MatchmakingStateIdle, self.state_context
	else
		return MatchmakingStateSearchGame, self.state_context
	end
end

MatchmakingStateRequestJoinGame.rpc_matchmaking_request_join_lobby_reply = function (self, channel_id, reply_id, reply_variable)
	self._game_reply = NetworkLookup.game_ping_reply[reply_id]
	self._game_reply_variable = reply_variable
end

MatchmakingStateRequestJoinGame.rpc_notify_connected = function (self, channel_id)
	self._connected_to_server = true
end
