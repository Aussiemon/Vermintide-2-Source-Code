MatchmakingStateJoinGame = class(MatchmakingStateJoinGame)
MatchmakingStateJoinGame.NAME = "MatchmakingStateJoinGame"
MatchmakingStateJoinGame.init = function (self, params)
	self._lobby = params.lobby
	self._network_transmit = params.network_transmit
	self._matchmaking_manager = params.matchmaking_manager
	self._handshaker_client = params.handshaker_client
	self._statistics_db = params.statistics_db
	self._ingame_ui = params.ingame_ui
	self._matchmaking_manager.selected_profile_index = nil
	self._matchmaking_loading_context = {}
	self._hero_popup_at_t = nil
	self._selected_hero_at_t = nil
	self._show_popup = false

	return 
end
MatchmakingStateJoinGame.destroy = function (self)
	return 
end
MatchmakingStateJoinGame.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config
	self.lobby_client = state_context.lobby_client
	self._lobby_data = state_context.profiles_data
	self._join_lobby_data = state_context.join_lobby_data
	self._lobby_data.selected_level_key = self._join_lobby_data.selected_level_key
	self._lobby_data.difficulty = self._join_lobby_data.difficulty
	local matchmaking_manager = self._matchmaking_manager
	local hero_index, hero_name = self._current_hero(self)

	assert(hero_index, "no hero index? this is wrong")

	if matchmaking_manager.hero_available_in_lobby_data(matchmaking_manager, hero_index, self._lobby_data) then
		local hero = SPProfiles[hero_index]
		self._selected_hero_name = hero_name

		self._request_profile_from_host(self, hero_index)
	else
		self._show_popup = true
	end

	self._matchmaking_manager:send_system_chat_message("matchmaking_status_aquiring_profiles")

	self._update_lobby_data_timer = 0

	return 
end
MatchmakingStateJoinGame.on_exit = function (self)
	if self._popup_join_lobby_handler then
		if self._ingame_ui:unavailable_hero_popup_active() then
			self._ingame_ui:hide_unavailable_hero_popup()
		end

		self._popup_join_lobby_handler = nil
	end

	return 
end
MatchmakingStateJoinGame.update = function (self, dt, t)
	local popup_join_lobby_handler = self._popup_join_lobby_handler

	if popup_join_lobby_handler then
		local popup_result = popup_join_lobby_handler.query_result(popup_join_lobby_handler)

		if popup_result then
			self._selected_hero_at_t = t
			local cancel_matchmaking = self._handle_popup_result(self, popup_result, t)

			if cancel_matchmaking then
				self._matchmaking_manager:cancel_matchmaking()

				return nil
			end
		end

		self._update_lobby_data(self, dt, t)
	end

	if self._handshaker_client:is_timed_out_from_server(t) then
		mm_printf_force("Timed out from server")
		self._matchmaking_manager:send_system_chat_message("matchmaking_status_handshaker_time_out")
		self._matchmaking_manager:cancel_matchmaking()

		return nil
	end

	if self._exit_to_search_game then
		mm_printf_force("Search was aborted")

		local matchmaking_manager = self._matchmaking_manager
		local lobby_id = self.lobby_client:id()

		matchmaking_manager.add_broken_lobby(matchmaking_manager, lobby_id, t, false)

		if self.lobby_client then
			self.lobby_client:destroy()

			self.lobby_client = nil
		end

		self.state_context.lobby_client = nil
		self.state_context.join_lobby_data = nil

		self._handshaker_client:reset()

		local join_by_lobby_browser = self.state_context.join_by_lobby_browser

		if join_by_lobby_browser then
			mm_printf_force("Abort from lobby browser or invite")
			matchmaking_manager.cancel_join_lobby(matchmaking_manager, "user_cancel")

			return MatchmakingStateIdle, self.state_context
		else
			mm_printf_force("Abort for other reason")

			return MatchmakingStateSearchGame, self.state_context
		end
	end

	if self._show_popup then
		local backend_manager = Managers.backend
		local waiting_user_input = backend_manager.is_waiting_for_user_input(backend_manager)
		local backend_items = backend_manager.get_interface(backend_manager, "items")
		local waiting_for_item_poll = backend_items.num_current_item_server_requests(backend_items) ~= 0

		if not waiting_user_input and not waiting_for_item_poll then
			self._show_popup = false

			self._spawn_join_popup(self)
		end
	end

	return nil
end
MatchmakingStateJoinGame._update_lobby_data = function (self, dt, t)
	self._update_lobby_data_timer = self._update_lobby_data_timer - dt

	if self._update_lobby_data_timer < 0 then
		self._update_lobby_data_timer = 0.5
		local lobby_data = self._lobby_data
		local lobby_client = self.lobby_client
		local selected_level_key = lobby_client.lobby_data(lobby_client, "selected_level_key")

		if lobby_data.selected_level_key ~= selected_level_key then
			lobby_data.selected_level_key = selected_level_key
		end

		local difficulty = lobby_client.lobby_data(lobby_client, "difficulty")

		if lobby_data.difficulty ~= difficulty then
			lobby_data.difficulty = difficulty

			if self._popup_join_lobby_handler then
				self._popup_join_lobby_handler:set_difficulty(difficulty)
			end
		end
	end

	return 
end
MatchmakingStateJoinGame._handle_popup_result = function (self, result, t)
	local selected_hero_name = nil
	local cancel = false

	if result.accepted then
		mm_printf_force("Popup accepted")

		selected_hero_name = result.selected_hero_name
		local hero_index = FindProfileIndex(selected_hero_name)
		self._selected_hero_name = selected_hero_name
		self._selected_career_name = result.selected_career_name

		self._request_profile_from_host(self, hero_index)
	else
		mm_printf_force("Popup cancelled")

		local player = Managers.player:local_player(1)
		local reason = (self._popup_join_lobby_handler.cancel_timer <= 0 and "timed_out") or "cancelled"
		local time_taken = (self._selected_hero_at_t and self._selected_hero_at_t - self._hero_popup_at_t) or 0

		Managers.telemetry.events:ui_matchmaking_select_player(player, selected_hero_name, reason, time_taken)

		local lobby_id = self.lobby_client:id()
		local is_bad_connection = false

		self._matchmaking_manager:add_broken_lobby(lobby_id, t, is_bad_connection)

		if reason == "cancelled" then
			cancel = true
		else
			self._exit_to_search_game = true
		end

		local status_message = "matchmaking_status_character_select_" .. reason

		self._matchmaking_manager:send_system_chat_message(status_message)
	end

	self._remove_join_popup(self)

	return cancel
end
MatchmakingStateJoinGame.rpc_matchmaking_update_profiles_data = function (self, sender, client_cookie, host_cookie, profile_array, player_id_array)
	if not self._handshaker_client:validate_cookies(client_cookie, host_cookie) then
		return 
	end

	self._update_profiles_data(self, profile_array, player_id_array)

	if self._popup_join_lobby_handler then
		self._set_unavailable_heroes(self, self._lobby_data)
	end

	return 
end
MatchmakingStateJoinGame._update_profiles_data = function (self, profile_array, player_id_array)
	SlotAllocator.unpack_after_transmission(profile_array, player_id_array, self._lobby_data)

	self._matchmaking_manager.debug.profiles_data = self._lobby_data

	return 
end
MatchmakingStateJoinGame.get_transition = function (self)
	if self._join_lobby_data and self._next_transition_state then
		local start_lobby_data = {
			lobby_client = self.lobby_client
		}

		return self._next_transition_state, start_lobby_data
	end

	return 
end
MatchmakingStateJoinGame._spawn_join_popup = function (self)
	local state_context = self.state_context
	local peer_id = Network.peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)
	local profile_index = player.profile_index(player)
	local career_index = player.career_index(player)
	local auto_cancel_time = MatchmakingSettings.JOIN_LOBBY_TIME_UNTIL_AUTO_CANCEL
	local join_by_lobby_browser = self.state_context.join_by_lobby_browser
	local difficulty = self.lobby_client:lobby_data("difficulty")
	self._popup_join_lobby_handler = self._ingame_ui:show_unavailable_hero_popup(profile_index, career_index, auto_cancel_time, join_by_lobby_browser, difficulty)

	self._set_unavailable_heroes(self, self._lobby_data)

	local time_manager = Managers.time
	self._hero_popup_at_t = time_manager.time(time_manager, "game")

	return 
end
MatchmakingStateJoinGame._remove_join_popup = function (self)
	self._ingame_ui:hide_unavailable_hero_popup()

	self._popup_join_lobby_handler = nil

	return 
end
MatchmakingStateJoinGame._set_unavailable_heroes = function (self, lobby_data)
	local occupied_heroes = {}
	local num_profiles = #SPProfiles

	for i = 1, num_profiles, 1 do
		if not SlotAllocator.is_free_in_lobby(i, lobby_data) then
			occupied_heroes[i] = true
		end
	end

	self._popup_join_lobby_handler:set_unavailable_heroes(occupied_heroes)

	return 
end
MatchmakingStateJoinGame._request_profile_from_host = function (self, hero_index)
	local lobby_client = self.lobby_client
	local host = lobby_client.lobby_host(lobby_client)
	self._matchmaking_manager.selected_profile_index = hero_index

	self._handshaker_client:send_rpc_to_host("rpc_matchmaking_request_profile", hero_index)

	local host_name = host

	if rawget(_G, "Steam") and GameSettingsDevelopment.network_mode == "steam" then
		host_name = Steam.user_name(host)
	end

	self._matchmaking_manager.debug.text = "requesting_profile"
	self._matchmaking_manager.debug.state = "hosted by: " .. host_name
	self._matchmaking_manager.debug.level = lobby_client.lobby_data(lobby_client, "selected_level_key")

	return 
end
MatchmakingStateJoinGame.rpc_matchmaking_request_profile_reply = function (self, sender, client_cookie, host_cookie, profile, reply)
	if not self._handshaker_client:validate_cookies(client_cookie, host_cookie) then
		return 
	end

	local selected_hero_name = self._selected_hero_name
	local selected_hero_index = FindProfileIndex(selected_hero_name)
	local reason = nil

	fassert(profile == selected_hero_index, "wrong profile in rpc_matchmaking_request_profile_reply")

	if reply == true then
		self._matchmaking_manager.debug.text = "profile_accepted"
		reason = "profile_accepted"

		if self._selected_career_name then
			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			local career_index = career_index_from_name(selected_hero_index, self._selected_career_name)

			hero_attributes.set(hero_attributes, selected_hero_name, "career", career_index)
		end

		self._set_state_to_start_lobby(self)
	else
		reason = "profile_declined"
		self._matchmaking_manager.debug.text = "profile_declined"
		self._show_popup = true
	end

	local player = Managers.player:local_player(1)
	local time_taken = (self._selected_hero_at_t and self._selected_hero_at_t - self._hero_popup_at_t) or 0

	Managers.telemetry.events:ui_matchmaking_select_player(player, selected_hero_name, reason, time_taken)

	return 
end
MatchmakingStateJoinGame._current_hero = function (self)
	local peer_id = Network.peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)
	local profile_index = player.profile_index(player)
	local profile = SPProfiles[profile_index]
	local profile_name = profile.display_name

	return profile_index, profile_name
end
MatchmakingStateJoinGame._level_started = function (self)
	local lobby_client = self.lobby_client
	local selected_level_key = lobby_client.lobby_data(lobby_client, "selected_level_key")
	local level_key = lobby_client.lobby_data(lobby_client, "level_key")
	local level_started = selected_level_key == level_key

	return level_started, level_key
end
MatchmakingStateJoinGame.loading_context = function (self)
	return self._matchmaking_loading_context
end
MatchmakingStateJoinGame.rpc_matchmaking_join_game = function (self, sender, client_cookie, host_cookie)
	if not self._handshaker_client:validate_cookies(client_cookie, host_cookie) then
		return 
	end

	mm_printf_force("Transition from join due to rpc_matchmaking_join_game")
	self._set_state_to_start_lobby(self)

	return 
end
MatchmakingStateJoinGame.active_lobby = function (self)
	return self.lobby_client
end
MatchmakingStateJoinGame._set_state_to_start_lobby = function (self)
	self._matchmaking_manager:send_system_chat_message("matchmaking_status_joining_game")

	self._matchmaking_manager.debug.text = "starting_game"
	self._next_transition_state = "start_lobby"

	return 
end

return 
