require("scripts/ui/views/loading_view")

DO_RELOAD = false
StateLoadingRunning = class(StateLoadingRunning)
StateLoadingRunning.NAME = "StateLoadingRunning"
StateLoadingRunning.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateLoadingRunning")
	self._init_network(self)

	self._loading_view = params.loading_view
	self._level_transition_handler = params.level_transition_handler
	self._previous_session_error_headers_lookup = {
		host_left_game = "popup_notice_topic",
		kicked_by_server = "popup_notice_topic",
		afk_kick = "popup_notice_topic"
	}
	local level_key = self._level_transition_handler:get_next_level_key()

	self.parent:set_lobby_host_data(level_key)

	local loading_context = self.parent.parent.loading_context

	if loading_context.previous_session_error then
		local previous_session_error = loading_context.previous_session_error
		loading_context.previous_session_error = nil

		self.parent:create_popup(previous_session_error, self._previous_session_error_headers_lookup[previous_session_error] or "popup_notice_topic", "continue")
	end

	DO_RELOAD = false

	return 
end
StateLoadingRunning._init_network = function (self)
	local loading_context = self.parent.parent.loading_context
	Managers.state.event = EventManager:new()

	if not self.parent:has_registered_rpcs() then
		self.parent:register_rpcs()
	end

	if loading_context.join_lobby_data or loading_context.join_server_data then
		self.parent:set_matchmaking(false)
		self.parent:setup_network_options()
		self.parent:setup_join_lobby(true)
		self.parent:clear_network_loading_context()
		Managers.transition:show_icon_background()
	elseif loading_context.start_lobby_data then
		self.parent:set_matchmaking(true)
		self.parent:clear_network_loading_context()

		local start_lobby_data = loading_context.start_lobby_data
		local lobby_client = start_lobby_data.lobby_client
		local network_client_setup_successful = self.parent:setup_network_client(true, lobby_client)

		if network_client_setup_successful then
			self.parent:setup_chat_manager(lobby_client, lobby_client.lobby_host(lobby_client), Network.peer_id(), false)
			self.parent:setup_deed_manager(lobby_client, lobby_client.lobby_host(lobby_client), Network.peer_id())
		end

		if loading_context.start_lobby_data.initialize_voip and PLATFORM == "xb1" and Managers.account:has_privilege(UserPrivilege.COMMUNICATION_VOICE_INGAME) then
			if not Managers.voice_chat then
				Managers.voice_chat = VoiceChatXboxOneManager:new()
			elseif Managers.voice_chat then
				Managers.voice_chat:initate_voice_chat()
			end
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
	end

	return 
end
StateLoadingRunning.update = function (self, dt)
	if PLATFORM == "xb1" and self.parent:waiting_for_cleanup() then
		return 
	end

	if not LEVEL_EDITOR_TEST and self._level_transition_handler.transition_type ~= nil then
		if not self.parent:loading_view_setup_done() then
			local level_key = self.parent:get_next_level_key()

			self.parent:setup_loading_view(level_key)
		end

		if not self.parent:menu_assets_setup_done() then
			self.parent:setup_menu_assets()
		end

		self._level_transition_handler:load_next_level()
	end

	if Development.parameter("honduras_demo") and not self.parent:loading_view_setup_done() then
		local level_key = self.parent:get_next_level_key()

		self.parent:setup_loading_view(level_key)
	end

	return 
end
StateLoadingRunning.on_exit = function (self, application_shutdown)
	return 
end

return 
