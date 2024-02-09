﻿-- chunkname: @scripts/managers/matchmaking/matchmaking_state_join_game.lua

MatchmakingStateJoinGame = class(MatchmakingStateJoinGame)
MatchmakingStateJoinGame.NAME = "MatchmakingStateJoinGame"

MatchmakingStateJoinGame.init = function (self, params)
	self._lobby = params.lobby
	self._network_transmit = params.network_transmit
	self._matchmaking_manager = params.matchmaking_manager
	self._network_transmit = params.network_transmit
	self._statistics_db = params.statistics_db
	self._ingame_ui = params.ingame_ui
	self._matchmaking_manager.selected_profile_index = nil
	self._matchmaking_loading_context = {}
	self._hero_popup_at_t = nil
	self._selected_hero_at_t = nil
	self._show_popup = false
	self._wwise_world = params.wwise_world
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
	self._lobby_data.selected_mission_id = self._join_lobby_data.selected_mission_id
	self._lobby_data.difficulty = self._join_lobby_data.difficulty

	if Managers.mechanism:mechanism_setting("check_matchmaking_hero_availability") then
		local matchmaking_manager = self._matchmaking_manager
		local hero_index, hero_name = self:_current_hero()

		fassert(hero_index, "no hero index? this is wrong")

		if matchmaking_manager:hero_available_in_lobby_data(hero_index, self._lobby_data) and not Application.user_setting("always_ask_hero_when_joining") then
			self._selected_hero_name = hero_name

			self:_request_profile_from_host(hero_index)
		else
			self._show_popup = true
		end

		self._matchmaking_manager:send_system_chat_message("matchmaking_status_aquiring_profiles")
	else
		WwiseWorld.trigger_event(self._wwise_world, "menu_wind_countdown_warning")
		self:_set_state_to_start_lobby()
	end

	if Managers.mechanism:mechanism_setting("sync_backend_id") then
		self:_sync_backend_id()
	end

	self._update_lobby_data_timer = 0
end

MatchmakingStateJoinGame.on_exit = function (self)
	local ui_manager = Managers.ui

	if ui_manager:get_active_popup("profile_picker") then
		ui_manager:close_popup("profile_picker")
	end
end

MatchmakingStateJoinGame.update = function (self, dt, t)
	local ui_manager = Managers.ui
	local profile_picker = ui_manager:get_active_popup("profile_picker")

	if profile_picker then
		local popup_result = profile_picker:query_result()

		if popup_result then
			self._profile_picker_shown = false
			self._selected_hero_at_t = t

			local cancel_matchmaking = self:_handle_popup_result(popup_result, t)

			if cancel_matchmaking then
				self._matchmaking_manager:cancel_matchmaking()

				return nil
			end
		end

		self:_update_lobby_data(dt, t)
	elseif self._profile_picker_shown then
		self._profile_picker_shown = false

		self._matchmaking_manager:cancel_matchmaking()

		return nil
	end

	if not Managers.state.network then
		self._matchmaking_manager:cancel_matchmaking()

		return nil
	end

	if self._exit_to_search_game then
		mm_printf_force("Search was aborted")

		local matchmaking_manager = self._matchmaking_manager

		matchmaking_manager:add_broken_lobby_client(self.lobby_client, t, false)

		if self.lobby_client then
			self.lobby_client:destroy()

			self.lobby_client = nil
		end

		self.state_context.lobby_client = nil
		self.state_context.join_lobby_data = nil

		self._matchmaking_manager:reset_joining()

		local join_by_lobby_browser = self.state_context.join_by_lobby_browser

		if join_by_lobby_browser then
			mm_printf_force("Abort from lobby browser or invite")
			matchmaking_manager:cancel_join_lobby("cancelled")

			return MatchmakingStateIdle, self.state_context
		elseif Managers.account:user_detached() then
			mm_printf_force("User detached - > Cancel Matchmaking")
			matchmaking_manager:cancel_matchmaking()

			return MatchmakingStateIdle, self.state_context
		else
			mm_printf_force("Abort for other reason")

			local lobby = Managers.state.network:lobby()

			if lobby then
				Managers.party:set_leader(lobby:lobby_host())
			end

			return MatchmakingStateSearchGame, self.state_context
		end
	end

	if self._show_popup then
		local backend_manager = Managers.backend
		local waiting_user_input = backend_manager:is_waiting_for_user_input()
		local backend_items = backend_manager:get_interface("items")
		local waiting_for_item_poll = backend_items:num_current_item_server_requests() ~= 0

		if not waiting_user_input and not waiting_for_item_poll then
			self:_spawn_join_popup(dt, t)
		end
	end

	if Managers.state.network.is_server and not Managers.state.network.network_server:are_all_peers_ingame() then
		Managers.simple_popup:queue_popup(Localize("player_join_block_exit_game"), Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))
		self._matchmaking_manager:cancel_matchmaking()

		return nil
	end

	return nil
end

MatchmakingStateJoinGame._update_lobby_data = function (self, dt, t)
	self._update_lobby_data_timer = self._update_lobby_data_timer - dt

	if self._update_lobby_data_timer < 0 then
		self._update_lobby_data_timer = 0.5

		local lobby_data = self._lobby_data
		local lobby_client = self.lobby_client
		local selected_mission_id = lobby_client:lobby_data("selected_mission_id")

		if lobby_data.selected_mission_id ~= selected_mission_id then
			lobby_data.selected_mission_id = selected_mission_id
		end

		local difficulty = lobby_client:lobby_data("difficulty")
		local difficulty_tweak = lobby_client:lobby_data("difficulty_tweak")

		lobby_data.difficulty_tweak = difficulty_tweak

		if lobby_data.difficulty ~= difficulty then
			lobby_data.difficulty = difficulty

			if self._popup_profile_picker then
				self._popup_profile_picker:set_difficulty(difficulty)
			end
		end
	end
end

MatchmakingStateJoinGame._handle_popup_result = function (self, result, t)
	local selected_hero_name
	local cancel = false

	if result.accepted then
		mm_printf_force("Popup accepted")

		selected_hero_name = result.selected_hero_name

		local hero_index = FindProfileIndex(selected_hero_name)

		self._selected_hero_name = selected_hero_name
		self._selected_career_name = result.selected_career_name

		self:_request_profile_from_host(hero_index)
	else
		mm_printf_force("Popup cancelled")

		local player = Managers.player:local_player(1)
		local reason = result.reason or "timed_out"
		local time_taken = self._selected_hero_at_t and self._selected_hero_at_t - self._hero_popup_at_t or 0
		local is_bad_connection = false

		self._matchmaking_manager:add_broken_lobby_client(self.lobby_client, t, is_bad_connection)

		if reason == "cancelled" then
			cancel = true
		else
			self._exit_to_search_game = true
		end

		local status_message = "matchmaking_status_character_select_" .. reason

		self._matchmaking_manager:send_system_chat_message(status_message)
	end

	Managers.ui:close_popup("profile_picker")

	return cancel
end

MatchmakingStateJoinGame._update_profiles_data = function (self, profile_array, player_id_array)
	ProfileSynchronizer.unpack_lobby_profile_slots(profile_array, player_id_array, self._lobby_data)

	self._matchmaking_manager.debug.profiles_data = self._lobby_data
end

MatchmakingStateJoinGame.get_transition = function (self)
	if self._join_lobby_data and self._next_transition_state then
		local join_method = self._join_lobby_data.join_method or self.search_config and self.search_config.join_method
		local start_lobby_data = {
			lobby_client = self.lobby_client,
			join_method = join_method,
		}

		return self._next_transition_state, start_lobby_data
	end
end

MatchmakingStateJoinGame._spawn_join_popup = function (self, dt, t)
	if Managers.popup:has_popup() then
		self:_update_popup_timeout(dt, t)

		return
	end

	local state_context = self.state_context
	local peer_id = Network.peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)
	local profile_index = player:profile_index()
	local career_index = player:career_index()
	local auto_cancel_time = MatchmakingSettings.JOIN_LOBBY_TIME_UNTIL_AUTO_CANCEL
	local join_by_lobby_browser = self.state_context.join_by_lobby_browser
	local difficulty = self.lobby_client:lobby_data("difficulty")

	Managers.ui:open_popup("profile_picker", profile_index, career_index, auto_cancel_time, join_by_lobby_browser, difficulty, self._lobby_data)

	self._profile_picker_shown = true

	local time_manager = Managers.time

	self._hero_popup_at_t = time_manager:time("game")
	self._show_popup = false
	self._popup_auto_cancel_time = nil
end

MatchmakingStateJoinGame._update_popup_timeout = function (self, dt, t)
	self._popup_auto_cancel_time = self._popup_auto_cancel_time or t + MatchmakingSettings.JOIN_LOBBY_TIME_UNTIL_AUTO_CANCEL

	if t > self._popup_auto_cancel_time then
		local status_message = "matchmaking_status_character_select_timed_out"

		self._matchmaking_manager:send_system_chat_message(status_message)
		self._matchmaking_manager:cancel_matchmaking()
	end
end

MatchmakingStateJoinGame._request_profile_from_host = function (self, hero_index)
	local lobby_client = self.lobby_client
	local host = lobby_client:lobby_host()

	self._matchmaking_manager.selected_profile_index = hero_index

	RPC.rpc_matchmaking_request_profile(PEER_ID_TO_CHANNEL[host], hero_index)

	local host_name = host

	if rawget(_G, "Steam") and GameSettingsDevelopment.network_mode == "steam" then
		host_name = Steam.user_name(host)
	end

	self._matchmaking_manager.debug.text = "requesting_profile"
	self._matchmaking_manager.debug.state = "hosted by: " .. (host_name or "unknown")
	self._matchmaking_manager.debug.level = lobby_client:lobby_data("selected_mission_id")
end

MatchmakingStateJoinGame.rpc_matchmaking_request_profile_reply = function (self, channel_id, profile, reply)
	local selected_hero_name = self._selected_hero_name
	local selected_hero_index = FindProfileIndex(selected_hero_name)
	local reason

	fassert(profile == selected_hero_index, "wrong profile in rpc_matchmaking_request_profile_reply")

	if reply == true then
		self._matchmaking_manager.debug.text = "profile_accepted"
		reason = "profile_accepted"

		if self._selected_career_name then
			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			local career_index = career_index_from_name(selected_hero_index, self._selected_career_name)

			hero_attributes:set(selected_hero_name, "career", career_index)
		end

		self:_set_state_to_start_lobby()
	else
		reason = "profile_declined"
		self._matchmaking_manager.debug.text = "profile_declined"
		self._show_popup = true
	end

	local player = Managers.player:local_player(1)
	local time_taken = self._selected_hero_at_t and self._selected_hero_at_t - self._hero_popup_at_t or 0
end

MatchmakingStateJoinGame._current_hero = function (self)
	local peer_id = Network.peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)
	local profile_index = player:profile_index()
	local profile = SPProfiles[profile_index]
	local profile_name = profile.display_name

	return profile_index, profile_name
end

MatchmakingStateJoinGame._level_started = function (self)
	local lobby_client = self.lobby_client
	local selected_mission_id = lobby_client:lobby_data("selected_mission_id")
	local mission_id = lobby_client:lobby_data("mission_id")
	local level_started = selected_mission_id == mission_id

	return level_started, mission_id
end

MatchmakingStateJoinGame.loading_context = function (self)
	return self._matchmaking_loading_context
end

MatchmakingStateJoinGame.rpc_matchmaking_join_game = function (self, channel_id)
	mm_printf_force("Transition from join due to rpc_matchmaking_join_game")
	self:_set_state_to_start_lobby()
end

MatchmakingStateJoinGame._sync_backend_id = function (self)
	local lobby_client = self.lobby_client
	local peer_id = lobby_client:lobby_host()
	local backend_id = Managers.backend:player_id()

	if backend_id and self._network_transmit then
		self._network_transmit:send_rpc("rpc_set_peer_backend_id", peer_id, backend_id)
	end
end

MatchmakingStateJoinGame.active_lobby = function (self)
	return self.lobby_client
end

MatchmakingStateJoinGame._set_state_to_start_lobby = function (self)
	self._matchmaking_manager:send_system_chat_message("matchmaking_status_joining_game")

	self._matchmaking_manager.debug.text = "starting_game"
	self._next_transition_state = "start_lobby"
end
