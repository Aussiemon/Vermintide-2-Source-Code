-- chunkname: @scripts/game_state/title_screen_substates/xb1/state_title_screen_init_network.lua

require("scripts/network/lobby_host")
require("scripts/network/lobby_client")
require("scripts/network/lobby_finder")
require("scripts/game_state/components/level_transition_handler")
require("scripts/network/network_event_delegate")
require("scripts/network/network_server")
require("scripts/network/network_client")
require("scripts/network/network_transmit")

StateTitleScreenInitNetwork = class(StateTitleScreenInitNetwork)
StateTitleScreenInitNetwork.NAME = "StateTitleScreenInitNetwork"

StateTitleScreenInitNetwork.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateTitleScreenInitNetwork")

	self._params = params
	self._world = self._params.world
	self._viewport = self._params.viewport

	self:_init_network()
end

StateTitleScreenInitNetwork._init_network = function (self)
	local auto_join_setting = Development.parameter("auto_join")

	Development.set_parameter("auto_join", nil)

	local increment_lobby_port = true

	LobbySetup.setup_network_options(increment_lobby_port)

	local network_options = LobbySetup.network_options()

	if not rawget(_G, "LobbyInternal") or not LobbyInternal.network_initialized() then
		require("scripts/network/lobby_xbox_live")
		LobbyInternal.init_client(network_options)
	end

	self._network_state = "_create_session"
end

StateTitleScreenInitNetwork.update = function (self, dt, t)
	if self[self._network_state] then
		self[self._network_state](self, dt, t)
	end

	Network.update(dt, self._network_event_delegate.event_table)
	Managers.backend:update(dt, t)

	return self:_next_state()
end

StateTitleScreenInitNetwork._create_session = function (self)
	local auto_join_setting = Development.parameter("auto_join")
	local unique_server_name = Development.parameter("unique_server_name")
	local loading_context = self.parent.parent.loading_context

	self._network_event_delegate = NetworkEventDelegate:new()

	Managers.level_transition_handler:register_rpcs(self._network_event_delegate)
	Managers.mechanism:register_rpcs(self._network_event_delegate)
	Managers.party:register_rpcs(self._network_event_delegate)

	local network_options = LobbySetup.network_options()

	if loading_context.join_lobby_data then
		self._lobby_client = LobbyClient:new(network_options, loading_context.join_lobby_data)
		loading_context.join_lobby_data = nil
		self._network_state = "_update_lobby_client"
	elseif auto_join_setting then
		if Managers.package:is_loading("resource_packages/inventory", "global") then
			Managers.package:load("resource_packages/inventory", "global")
		end

		if Managers.package:is_loading("resource_packages/careers", "global") then
			Managers.package:load("resource_packages/careers", "global")
		end

		assert(unique_server_name, "No unique_server_name in %%appdata%%\\Roaming\\Fatshark\\Bulldozer\\user_settings.config")

		self._lobby_finder = LobbyFinder:new(network_options, nil, true)
		self._network_state = "_update_lobby_join"
	else
		assert(not loading_context.profile_synchronizer)
		assert(not loading_context.network_server)

		self._lobby_host = LobbyHost:new(network_options)
		self._network_state = "_creating_session_host"
	end
end

StateTitleScreenInitNetwork._creating_session_host = function (self, dt, t)
	self._lobby_host:update(dt)

	local state = self._lobby_host.state

	if state == LobbyState.JOINED then
		self._network_state = "_join_session"
	elseif state == LobbyState.FAILED then
		self._network_state = "_error"
	end
end

StateTitleScreenInitNetwork._join_session = function (self, dt, t)
	self._lobby_host:update(dt)

	local initial_level = Managers.mechanism:default_level_key()
	local level_transition_handler = Managers.level_transition_handler

	level_transition_handler:set_next_level(initial_level)
	level_transition_handler:promote_next_level_data()
	level_transition_handler:load_current_level()

	local loading_context = self.parent.parent.loading_context

	self._network_server = NetworkServer:new(Managers.player, self._lobby_host, nil)
	self._network_transmit = loading_context.network_transmit or NetworkTransmit:new(true, self._network_server.server_peer_id)

	self._network_transmit:set_network_event_delegate(self._network_event_delegate)
	self._network_server:register_rpcs(self._network_event_delegate, self._network_transmit)
	self._network_server:server_join()

	self._profile_synchronizer = self._network_server.profile_synchronizer
	loading_context.network_transmit = self._network_transmit

	require("scripts/game_state/state_ingame")

	self._wanted_game_state = StateIngame
	self._network_state = "_update_host_lobby"
end

StateTitleScreenInitNetwork._update_host_lobby = function (self, dt, t)
	Managers.level_transition_handler:update()
	self._network_transmit:transmit_local_rpcs()

	if self._lobby_host then
		self._lobby_host:update(dt)

		local lobby_state = self._lobby_host.state

		if lobby_state == LobbyState.FAILED and not self._popup_id and self._wanted_game_state then
			local text_id = "failure_start_no_lan"

			self._popup_id = Managers.popup:queue_popup(Localize(text_id), Localize("popup_error_topic"), "quit", Localize("menu_quit"))
		end
	end

	self._network_server:update(dt, t)
end

StateTitleScreenInitNetwork._update_lobby_client = function (self, dt, t)
	Managers.level_transition_handler:update()
	self._lobby_client:update(dt)

	local new_lobby_state = self._lobby_client.state

	if new_lobby_state == LobbyState.JOINED and not self._sent_joined then
		local host = self._lobby_client:lobby_host()

		if host ~= "0" then
			self._network_client = NetworkClient:new(host, nil, nil, nil, self._lobby_client)
			self._network_transmit = NetworkTransmit:new(false, self._network_client.server_peer_id)

			self._network_transmit:set_network_event_delegate(self._network_event_delegate)
			self._network_client:register_rpcs(self._network_event_delegate, self._network_transmit)

			self._profile_synchronizer = self._network_client.profile_synchronizer
			self._sent_joined = true
		end
	end

	if new_lobby_state == LobbyState.FAILED and not self._popup_id then
		self._popup_id = Managers.popup:queue_popup(Localize("failure_start_join_server"), Localize("popup_error_topic"), "restart_as_server", Localize("menu_accept"))
	end

	if self._network_client then
		self._network_client:update(dt, t)

		if self._network_client.state == NetworkClientStates.denied_enter_game and not self._popup_id then
			local error_message = "failure_start_join_server"
			local fail_reason = self._network_client.fail_reason

			if fail_reason then
				error_message = error_message .. "_" .. fail_reason
			end

			self._popup_id = Managers.popup:queue_popup(Localize(error_message), Localize("popup_error_topic"), "restart_as_server", Localize("menu_accept"))
		end
	end
end

StateTitleScreenInitNetwork._update_lobby_join = function (self, dt, t)
	local lobby_finder = self._lobby_finder

	lobby_finder:update(dt)

	local lobbies = lobby_finder:lobbies()

	for i, lobby in ipairs(lobbies) do
		local auto_join = lobby.unique_server_name == Development.parameter("unique_server_name")

		if lobby.valid and auto_join then
			local network_options = LobbySetup.network_options()
			local level_transition_handler = Managers.level_transition_handler

			level_transition_handler:set_next_level(lobby.level_key)
			level_transition_handler:promote_next_level_data()
			level_transition_handler:load_current_level()

			self._lobby_client = LobbyClient:new(network_options, lobby)
			self._lobby_finder = nil
			self._network_state = "_update_lobby_client"

			break
		end
	end
end

StateTitleScreenInitNetwork._error = function (self, dt, t)
	return
end

StateTitleScreenInitNetwork._next_state = function (self)
	if not self:_packages_loaded() or not self._wanted_game_state then
		return
	end

	if not self._debug_setup then
		self._debug_setup = true

		Debug.setup(self._world, "init_network_ui")
	end

	if self._popup_id then
		local result = Managers.popup:query_result(self._popup_id)

		if result == "quit" then
			Boot.quit_game = true
		elseif result == "restart_as_server" then
			self._popup_id = nil

			if self._lobby_finder then
				self._lobby_finder:destroy()

				self._lobby_finder = nil
			end

			if self._lobby_client then
				self._lobby_client:destroy()

				self._lobby_client = nil

				Managers.account:set_current_lobby(nil)
			end

			if self._lobby_host then
				self._lobby_host:destroy()

				self._lobby_host = nil

				Managers.account:set_current_lobby(nil)
			end

			if self._network_server then
				self._network_server:destroy()

				self._network_server = nil
			elseif self._network_client then
				self._network_client:destroy()

				self._network_client = nil
			end

			self._profile_synchronizer = nil

			local network_options = LobbySetup.network_options()

			self._lobby_host = LobbyHost:new(network_options)
			self._network_state = "_creating_session_host"
		elseif result == "continue" then
			self._popup_id = nil
		end

		return
	end

	if self._lobby_host and self._lobby_host.state ~= LobbyState.JOINED then
		return
	end

	if self._lobby_finder or self._lobby_client and self._lobby_client.state ~= LobbyState.JOINED then
		return
	end

	if not self._sent_joined and not self._lobby_host or self._lobby_host and self._lobby_host.state == LobbyState.FAILED then
		return
	end

	if self._network_client and not self._network_client:can_enter_game() then
		return
	elseif self._network_server and not self._network_server:can_enter_game() then
		return
	end

	if not Managers.backend:profiles_loaded() then
		return
	end

	self.parent.state = self._wanted_game_state
	self._wanted_game_state = nil
end

StateTitleScreenInitNetwork.on_exit = function (self, application_shutdown)
	Managers.level_transition_handler:unregister_rpcs()

	if Managers.mechanism then
		Managers.mechanism:unregister_rpcs()
	end

	if Managers.party then
		Managers.party:unregister_rpcs()
	end

	if application_shutdown then
		if Managers.party:has_party_lobby() then
			local lobby = Managers.party:steal_lobby()

			if type(lobby) ~= "table" then
				LobbyInternal.leave_lobby(lobby)
			end
		end

		if self._lobby_finder then
			self._lobby_finder:destroy()

			self._lobby_finder = nil
		end

		if self._lobby_client then
			self._lobby_client:destroy()

			self._lobby_client = nil

			Managers.account:set_current_lobby(nil)
		end

		if self._lobby_host then
			self._lobby_host:destroy()

			self._lobby_host = nil

			Managers.account:set_current_lobby(nil)
		end

		if self._network_server then
			self._network_server:destroy()

			self._network_server = nil
		elseif self._network_client then
			self._network_client:destroy()

			self._network_client = nil
		end

		if rawget(_G, "LobbyInternal") then
			LobbyInternal.shutdown_client()
		end

		self.parent.loading_context.network_transmit = nil

		if self._network_transmit then
			self._network_transmit:destroy()

			self._network_transmit = nil
		end
	else
		local loading_context = {
			network_transmit = self._network_transmit,
		}

		if self._lobby_host then
			loading_context.lobby_host = self._lobby_host

			local level_key = Managers.level_transition_handler:get_current_level_keys()
			local stored_lobby_host_data = self._lobby_host:get_stored_lobby_data() or {}

			stored_lobby_host_data.level_key = level_key
			stored_lobby_host_data.unique_server_name = stored_lobby_host_data.unique_server_name or LobbyAux.get_unique_server_name()
			stored_lobby_host_data.host = stored_lobby_host_data.host or Network.peer_id()
			stored_lobby_host_data.num_players = stored_lobby_host_data.num_players or 1
			stored_lobby_host_data.matchmaking = "false"

			self._lobby_host:set_lobby_data(stored_lobby_host_data)

			loading_context.network_server = self._network_server

			self._network_server:unregister_rpcs()
		else
			loading_context.lobby_client = self._lobby_client
			loading_context.network_client = self._network_client

			self._network_client:unregister_rpcs()
		end

		self.parent.parent.loading_context = loading_context
	end

	self._profile_synchronizer = nil

	if self._network_event_delegate then
		self._network_event_delegate:destroy()

		self._network_event_delegate = nil
	end
end

StateTitleScreenInitNetwork._packages_loaded = function (self)
	local level_transition_handler = Managers.level_transition_handler

	if level_transition_handler:all_packages_loaded() then
		if self._network_server and not self._has_sent_level_loaded then
			self._has_sent_level_loaded = true

			local level_name = level_transition_handler:get_current_level_keys()
			local level_index = NetworkLookup.level_keys[level_name]

			self._network_server.network_transmit:send_rpc("rpc_level_loaded", Network.peer_id(), level_index)
		end

		local package_manager = Managers.package

		for i, name in ipairs(GlobalResources) do
			if not package_manager:has_loaded(name) then
				return false
			end
		end

		return true
	end

	return true
end
