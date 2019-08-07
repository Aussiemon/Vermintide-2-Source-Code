require("scripts/network/lobby_host")
require("scripts/network/lobby_client")
require("scripts/network/lobby_finder")
require("scripts/network/game_server/game_server")
require("scripts/network/game_server/game_server_finder")
require("scripts/network/game_server/game_server_finder_lan")
require("scripts/network/game_server/game_server_client")
require("scripts/game_state/components/level_transition_handler")
require("scripts/network/network_event_delegate")
require("scripts/network/network_server")
require("scripts/network/network_client")
require("scripts/network/network_transmit")

StateLoadingRestartNetwork = class(StateLoadingRestartNetwork)
StateLoadingRestartNetwork.NAME = "StateLoadingRestartNetwork"

StateLoadingRestartNetwork.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateLoadingRestartNetwork")
	self:_init_params(params)
	self:_init_network()
end

StateLoadingRestartNetwork._init_params = function (self, params)
	self._world = params.world
	self._viewport = params.viewport
	self._loading_view = params.loading_view
	self._starting_tutorial = params.starting_tutorial
	self._server_created = true
	self._lobby_joined = true
	self._previous_session_error_headers_lookup = {
		host_left_game = "popup_notice_topic",
		kicked_by_server = "popup_notice_topic",
		afk_kick = "popup_notice_topic"
	}
end

StateLoadingRestartNetwork._init_network = function (self)
	local auto_join_setting = Development.parameter("auto_join")

	assert(not auto_join_setting or Development.parameter("unique_server_name"), "Can't use auto_join without unique_server_name")

	local lobby_to_join = Development.parameter("auto_join_server")

	Development.set_parameter("auto_join", nil)
	Development.set_parameter("auto_join_server", nil)

	local host_to_join = nil
	local lobby_is_server = lobby_to_join ~= nil
	local loading_context = self.parent.parent.loading_context
	local increment_lobby_port = true

	Managers.lobby:setup_network_options(increment_lobby_port)

	local network_options = Managers.lobby:network_options()
	local platform = PLATFORM

	if not rawget(_G, "LobbyInternal") or not LobbyInternal.network_initialized() then
		if platform == "win32" then
			if rawget(_G, "Steam") and not LEVEL_EDITOR_TEST and not Development.parameter("use_lan_backend") then
				require("scripts/network/lobby_steam")
				require("scripts/network/game_server/game_server_user_steam")

				if rawget(_G, "SteamGameServer") then
					require("scripts/network/game_server/game_server_steam")
				end

				local invite_type, lobby_id = Friends.boot_invite()

				if invite_type ~= Friends.NO_INVITE and not self._starting_tutorial then
					lobby_is_server = invite_type == Friends.INVITE_SERVER
					lobby_to_join = lobby_id
				end

				print("state_loading_restart_network JOIN VIA STEAM " .. invite_type)
			else
				rawset(_G, "Steam", nil)
				require("scripts/network/lobby_lan")

				host_to_join = script_data.host_to_join
			end
		elseif platform == "xb1" then
			if Managers.account:offline_mode() then
				if package.loaded["scripts/network/lobby_xbox_live"] then
					package.loaded["scripts/network/lobby_xbox_live"] = nil
					package.load_order[#package.load_order] = nil
				end

				require("scripts/network/lobby_lan")
			else
				if package.loaded["scripts/network/lobby_lan"] then
					package.loaded["scripts/network/lobby_lan"] = nil
					package.load_order[#package.load_order] = nil
				end

				require("scripts/network/lobby_xbox_live")
			end
		elseif platform == "ps4" then
			if Managers.account:offline_mode() then
				if package.loaded["scripts/network/lobby_psn"] then
					package.loaded["scripts/network/lobby_psn"] = nil
					package.load_order[#package.load_order] = nil
				end

				require("scripts/network/lobby_lan")
			else
				if package.loaded["scripts/network/lobby_lan"] then
					package.loaded["scripts/network/lobby_lan"] = nil
					package.load_order[#package.load_order] = nil
				end

				require("scripts/network/lobby_psn")
			end
		end

		LobbyInternal.init_client(network_options)
	elseif PLATFORM == "xb1" then
		if Managers.account:offline_mode() then
			if package.loaded["scripts/network/lobby_xbox_live"] then
				package.loaded["scripts/network/lobby_xbox_live"] = nil
				package.load_order[#package.load_order] = nil
			end

			require("scripts/network/lobby_lan")
		else
			if package.loaded["scripts/network/lobby_lan"] then
				package.loaded["scripts/network/lobby_lan"] = nil
				package.load_order[#package.load_order] = nil
			end

			require("scripts/network/lobby_xbox_live")
			LobbyInternal.init_client(network_options)
		end
	elseif PLATFORM == "ps4" then
		if Managers.account:offline_mode() then
			if package.loaded["scripts/network/lobby_psn"] then
				package.loaded["scripts/network/lobby_psn"] = nil
				package.load_order[#package.load_order] = nil
			end

			require("scripts/network/lobby_lan")
		else
			if package.loaded["scripts/network/lobby_lan"] then
				package.loaded["scripts/network/lobby_lan"] = nil
				package.load_order[#package.load_order] = nil
			end

			require("scripts/network/lobby_psn")
			LobbyInternal.init_client(network_options)
		end
	end

	if script_data.done_initial_join then
		lobby_to_join, host_to_join = nil
	else
		script_data.done_initial_join = true
	end

	if not self.parent:has_registered_rpcs() then
		self.parent:register_rpcs()
	end

	slot9 = self._starting_tutorial and Managers.invite:get_invited_lobby_data()
	local loadout_resync_state = StateLoading.LoadoutResyncStates.WAIT_FOR_RPC_LOAD_LEVEL
	local has_invitation = Managers.invite:has_invitation()

	print("[StateLoadingRestartNetwork] Selecting loadout_resync_state...", has_invitation, self._starting_tutorial, loading_context.join_lobby_data, loading_context.join_server_data, auto_join_setting, lobby_to_join, host_to_join, platform)

	if has_invitation and not self._starting_tutorial then
		self._has_invitation = true
	elseif loading_context.join_lobby_data or loading_context.join_server_data then
		self.parent:setup_join_lobby()
	elseif auto_join_setting or lobby_to_join or host_to_join then
		self.parent:setup_lobby_finder(callback(self, "cb_lobby_joined"), lobby_to_join, host_to_join, lobby_is_server)

		self._lobby_joined = false
	elseif platform == "xb1" or platform == "ps4" then
		self._server_created = false
		self._creating_lobby = false
	else
		self.parent:setup_lobby_host()

		self._server_created = true
		loadout_resync_state = StateLoading.LoadoutResyncStates.CHECK_RESYNC
	end

	if self.parent:loadout_resync_state() == StateLoading.LoadoutResyncStates.IDLE then
		print("[StateLoadingRestartNetwork] loadout_resync_state IDLE ->", loadout_resync_state)
		self.parent:set_loadout_resync_state(loadout_resync_state)
	else
		print("[StateLoadingRestartNetwork] Ignoring selected loadout_resync_state, wasn't IDLE")
	end

	if loading_context.previous_session_error then
		local previous_session_error = loading_context.previous_session_error
		loading_context.previous_session_error = nil

		self.parent:create_popup(previous_session_error, self._previous_session_error_headers_lookup[previous_session_error], "continue")
	end
end

StateLoadingRestartNetwork.update = function (self, dt, t)
	if self._has_invitation_error or Managers.account:user_detached() then
		return
	end

	if self._has_invitation then
		if Managers.invite:invites_handled() then
			if not Managers.account:offline_mode() then
				local lobby_data = Managers.invite:get_invited_lobby_data()

				if lobby_data then
					if lobby_data.is_server_invite then
						self.parent.parent.loading_context.join_server_data = lobby_data
					else
						self.parent.parent.loading_context.join_lobby_data = lobby_data
					end

					self.parent:setup_join_lobby()

					self._has_invitation = false
				else
					self.parent:set_invitation_error()

					self._has_invitation_error = true
				end
			else
				self.parent.offline_invite = true
				self._has_invitation = false
			end
		end
	elseif self._server_created and self._lobby_joined then
		return StateLoadingRunning
	elseif Managers.account:all_lobbies_freed() and not self._creating_lobby then
		self.parent:setup_lobby_host(callback(self, "cb_server_created"))

		self._creating_lobby = true
	end
end

StateLoadingRestartNetwork.on_exit = function (self, application_shutdown)
	return
end

StateLoadingRestartNetwork.cb_server_created = function (self)
	self._server_created = true
end

StateLoadingRestartNetwork.cb_lobby_joined = function (self)
	self._lobby_joined = true
end

return
