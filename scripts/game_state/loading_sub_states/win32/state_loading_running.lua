-- chunkname: @scripts/game_state/loading_sub_states/win32/state_loading_running.lua

require("scripts/ui/views/loading_view")

StateLoadingRunning = class(StateLoadingRunning)
StateLoadingRunning.NAME = "StateLoadingRunning"

StateLoadingRunning.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateLoadingRunning")
	self:_init_network()

	self._loading_view = params.loading_view
	self._previous_session_error_headers_lookup = {
		afk_kick = "popup_notice_topic",
		host_left_game = "popup_notice_topic",
		kicked_by_server = "popup_notice_topic",
	}

	local level_key = Managers.level_transition_handler:get_current_level_key()

	self.parent:set_lobby_host_data(level_key)

	local loading_context = self.parent.parent.loading_context

	if loading_context.previous_session_error then
		local previous_session_error = loading_context.previous_session_error

		loading_context.previous_session_error = nil

		self.parent:create_popup(previous_session_error, self._previous_session_error_headers_lookup[previous_session_error] or "popup_notice_topic", "continue")
	end
end

StateLoadingRunning._init_network = function (self)
	local loading_context = self.parent.parent.loading_context

	if not self.parent:has_registered_rpcs() then
		self.parent:register_rpcs()
	end

	local loadout_resync_state = StateLoading.LoadoutResyncStates.WAIT_FOR_LEVEL_LOAD

	print("[StateLoadingRunning] Selecting loadout_resync_state...", loading_context.join_lobby_data, loading_context.join_server_data, loading_context.start_lobby_data)

	if loading_context.join_lobby_data or loading_context.join_server_data then
		self.parent:set_matchmaking(false)
		LobbySetup.setup_network_options()
		self.parent:setup_join_lobby(nil, loading_context.setup_voip)
		self.parent:clear_network_loading_context()
		Managers.transition:show_icon_background()
	elseif loading_context.start_lobby_data then
		self.parent:set_matchmaking(true)
		self.parent:clear_network_loading_context()

		local start_lobby_data = loading_context.start_lobby_data
		local lobby_client = start_lobby_data.lobby_client
		local network_client_setup_successful = self.parent:setup_network_client(true, lobby_client)

		if network_client_setup_successful then
			local peer_id = Network.peer_id()
			local lobby_host = lobby_client:lobby_host()
			local is_server = false
			local network_handler = self.parent._network_client

			self.parent:setup_chat_manager(lobby_client, lobby_host, peer_id, is_server)
			self.parent:setup_deed_manager(lobby_client, lobby_host, peer_id, is_server, network_handler)
			self.parent:setup_enemy_package_loader(lobby_client, lobby_host, peer_id)
			self.parent:setup_global_managers(lobby_client, lobby_host, peer_id, is_server, network_handler)
		end

		loading_context.start_lobby_data = nil

		Managers.transition:show_icon_background()
	else
		self._network_server = loading_context.network_server
		self._network_client = loading_context.network_client

		if self._network_server then
			self.parent:setup_network_transmit(self._network_server)
		elseif self._network_client then
			self._network_client:set_wait_for_state_loading(nil)
			self.parent:setup_network_transmit(self._network_client)
		end

		loadout_resync_state = StateLoading.LoadoutResyncStates.CHECK_RESYNC
	end

	if self.parent:loadout_resync_state() == StateLoading.LoadoutResyncStates.IDLE then
		print("[StateLoadingRunning] loadout_resync_state IDLE ->", loadout_resync_state)
		self.parent:set_loadout_resync_state(loadout_resync_state)
	else
		print("[StateLoadingRunning] Ignoring selected loadout_resync_state, wasn't IDLE")
	end
end

StateLoadingRunning.update = function (self, dt)
	if IS_XB1 and self.parent:waiting_for_cleanup() then
		return
	end

	local level_transition_handler = Managers.level_transition_handler

	if not LEVEL_EDITOR_TEST and (self.parent._network_server and level_transition_handler:needs_level_load() or self.parent._network_client and self.parent._network_client:is_fully_synced() and level_transition_handler:needs_level_load()) then
		if not self.parent:loading_view_setup_done() then
			local level_key = level_transition_handler:get_current_level_key()

			self.parent:setup_loading_view(level_key)
		end

		if not self.parent:menu_assets_setup_done() then
			self.parent:setup_menu_assets()
		end

		self.parent:load_current_level()
	end

	if script_data.honduras_demo and not self.parent:loading_view_setup_done() then
		local level_key = level_transition_handler:get_current_level_key()

		self.parent:setup_loading_view(level_key)
	end

	if self.parent:has_joined() and not Managers.load_time:has_lobby() then
		Managers.load_time:set_lobby(self.parent:get_lobby())
	end
end

StateLoadingRunning.on_exit = function (self, application_shutdown)
	return
end
