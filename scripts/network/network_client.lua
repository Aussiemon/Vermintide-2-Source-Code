-- chunkname: @scripts/network/network_client.lua

require("scripts/game_state/components/profile_synchronizer")
require("scripts/game_state/components/network_state")
require("scripts/utils/profile_requester")

NetworkClientStates = table.enum("connecting", "connected", "loading", "loaded", "waiting_enter_game", "game_started", "is_ingame", "denied_enter_game", "lost_connection_to_host", "eac_match_failed")
NetworkClient = class(NetworkClient)

local NUM_PROFILES = #PROFILES_BY_AFFILIATION.heroes
local CONNECTION_TIMEOUT = 15

script_data.network_debug_connections = true

local function network_printf(format, ...)
	if script_data.network_debug_connections then
		printf("[NetworkClient] " .. format, ...)
	end
end

NetworkClient.init = function (self, server_peer_id, wanted_profile_index, wanted_party_index, clear_peer_states, lobby_client, voip)
	self:set_state(NetworkClientStates.connecting)

	self.server_peer_id = server_peer_id
	self._network_state = NetworkState:new(false, self, server_peer_id, Network.peer_id())

	Managers.level_transition_handler:register_network_state(self._network_state)

	local is_server = false

	self.profile_synchronizer = ProfileSynchronizer:new(false, lobby_client, self._network_state)
	self._profile_requester = ProfileRequester:new(false, nil, self.profile_synchronizer)
	self.wanted_profile_index = FindProfileIndex(Development.parameter("wanted_profile")) or wanted_profile_index or SaveData.wanted_profile_index or 1
	self.wanted_party_index = tonumber(Development.parameter("wanted_party_index")) or wanted_party_index or 0

	if self.wanted_profile_index then
		local profile = SPProfiles[self.wanted_profile_index]

		if profile.affiliation == "dark_pact" then
			self.wanted_party_index = 2
		end
	end

	Managers.mechanism:set_profile_synchronizer(self.profile_synchronizer)

	local profile = SPProfiles[self.wanted_profile_index]

	if profile then
		local hero_name = profile.display_name
		local hero_attributes = Managers.backend:get_interface("hero_attributes")

		self.wanted_career_index = Development.parameter("wanted_career_index") or hero_attributes:get(hero_name, "career") or 1
	else
		self.wanted_career_index = 0
	end

	self.lobby_client = lobby_client

	local display_name = profile and profile.display_name or "no profile wanted"

	network_printf("init - wanted_profile_index, %s, %s", self.wanted_profile_index, display_name)

	if clear_peer_states then
		network_printf("SENDING rpc_clear_peer_state to %s", self.server_peer_id)

		local channel_id = PEER_ID_TO_CHANNEL[self.server_peer_id]

		RPC.rpc_clear_peer_state(channel_id)
	end

	if voip then
		self.voip = voip
	else
		local voip_params = {
			is_server = is_server,
			lobby = lobby_client,
		}

		self.voip = Voip:new(voip_params)
	end

	self.connecting_timeout = 0
	self._already_connected_to_dedicated = PEER_ID_TO_CHANNEL[Managers.mechanism:dedicated_server_peer_id()]

	if not self._already_connected_to_dedicated then
		EAC.before_join()
	end

	self._eac_state_determined = false
	self._eac_can_play = false
end

NetworkClient.destroy = function (self)
	if not self._already_connected_to_dedicated then
		EAC.after_leave()
	end

	Managers.level_transition_handler:deregister_network_state()

	if self._network_event_delegate then
		self:unregister_rpcs()
	end

	self._network_state:destroy()
	self.voip:destroy()

	self.voip = nil

	self._profile_requester:destroy()

	self._profile_requester = nil

	self.profile_synchronizer:destroy()

	self.profile_synchronizer = nil
	self.lobby_client = nil

	GarbageLeakDetector.register_object(self, "Network Client")
end

NetworkClient.register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, "rpc_loading_synced", "rpc_notify_in_post_game", "rpc_game_started", "rpc_connection_failed", "rpc_notify_connected", IS_XB1 and "rpc_set_migration_host_xbox" or "rpc_set_migration_host", "rpc_client_update_lobby_data", "rpc_client_connection_state")

	self._network_event_delegate = network_event_delegate

	self._network_state:register_rpcs(network_event_delegate, network_transmit)
	self.profile_synchronizer:register_rpcs(network_event_delegate, network_transmit)
	self._profile_requester:register_rpcs(network_event_delegate, network_transmit)
	self.voip:register_rpcs(network_event_delegate, network_transmit)
end

NetworkClient.unregister_rpcs = function (self)
	self.voip:unregister_rpcs()
	self._profile_requester:unregister_rpcs()
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil

	self.profile_synchronizer:unregister_network_events()
	self._network_state:unregister_network_events()
end

NetworkClient.rpc_connection_failed = function (self, channel_id, reason)
	self.fail_reason = NetworkLookup.connection_fails[reason]

	network_printf("rpc_connection_failed due to %s", self.fail_reason)
	self:set_state(NetworkClientStates.denied_enter_game)
	network_printf("Connection to server failed with reason %s", self.fail_reason)
end

NetworkClient.rpc_notify_connected = function (self, channel_id)
	if not self._notification_sent then
		local channel_id = PEER_ID_TO_CHANNEL[self.server_peer_id]

		if not self._already_connected_to_dedicated then
			EAC.set_host(channel_id)
			EAC.validate_host()
		end

		self._eac_has_set_host = true

		local channel_id = PEER_ID_TO_CHANNEL[self.server_peer_id]

		RPC.rpc_notify_lobby_joined(channel_id, self.wanted_profile_index, self.wanted_career_index, self.wanted_party_index, Application.user_setting("clan_tag") or "0", Managers.account:account_id() or "0")

		self._notification_sent = true

		self:set_state(NetworkClientStates.connected)
		self._network_state:full_sync()

		if self.loaded_level_name then
			local level_name = self.loaded_level_name

			RPC.rpc_level_loaded(self.channel_id, NetworkLookup.level_keys[level_name])

			self.loaded_level_name = nil
		end
	end
end

NetworkClient.is_fully_synced = function (self)
	local own_id = Network.peer_id()
	local mechanism_synced = Managers.mechanism:is_peer_fully_synced(own_id)

	if not mechanism_synced then
		return false
	end

	return self._network_state:is_peer_fully_synced(own_id)
end

NetworkClient.rpc_notify_in_post_game = function (self, channel_id, in_post_game)
	if self._is_in_post_game ~= in_post_game then
		self._is_in_post_game = in_post_game

		local channel_id = PEER_ID_TO_CHANNEL[self.server_peer_id]

		RPC.rpc_post_game_notified(channel_id, in_post_game)
	end
end

NetworkClient.is_in_post_game = function (self)
	return self._is_in_post_game
end

NetworkClient.rpc_client_connection_state = function (self, channel_id, peer_id, state_id)
	local reason = NetworkLookup.connection_states[state_id]

	printf("rpc_client_connection_state Channel: %d, PeerID: %s, Reason: %s", channel_id, peer_id, reason)

	if reason == "connected" then
		NetworkUtils.announce_chat_peer_joined(peer_id, self.lobby_client)
	elseif reason == "disconnected" then
		NetworkUtils.announce_chat_peer_left(peer_id, self.lobby_client)
	end
end

NetworkClient.rpc_loading_synced = function (self, channel_id)
	network_printf("rpc_loading_synced. State: %q", self.state)

	if self.state ~= NetworkClientStates.game_started then
		self:set_state(NetworkClientStates.waiting_enter_game)
	else
		self._rpc_loading_synced = true
	end
end

NetworkClient.rpc_set_migration_host = function (self, channel_id, peer_id, do_migrate)
	if do_migrate then
		local player = Managers.player:player_from_peer_id(peer_id)
		local name = player and player:name() or tostring(peer_id)

		self.host_to_migrate_to = {
			peer_id = peer_id,
			name = name,
		}
	else
		self.host_to_migrate_to = nil
	end
end

NetworkClient.rpc_set_migration_host_xbox = function (self, channel_id, peer_id, do_migrate, session_id, session_template_name)
	if do_migrate then
		local player = Managers.player:player_from_peer_id(peer_id)
		local name = player and player:name() or tostring(peer_id)

		self.host_to_migrate_to = {
			peer_id = peer_id,
			name = name,
			session_id = session_id,
			session_template_name = session_template_name,
		}
	else
		self.host_to_migrate_to = nil
	end
end

NetworkClient.rpc_client_update_lobby_data = function (self, channel_id)
	self.lobby_client:force_update_lobby_data()
end

NetworkClient.set_state = function (self, new_state)
	network_printf("New State %s (old state %s)", new_state, tostring(self.state))

	self.state = new_state
end

NetworkClient.has_bad_state = function (self)
	local state = self.state

	return state == NetworkClientStates.denied_enter_game or state == NetworkClientStates.lost_connection_to_host or state == NetworkClientStates.eac_match_failed, state
end

NetworkClient.on_game_entered = function (self)
	self:set_state(NetworkClientStates.is_ingame)

	local channel_id = PEER_ID_TO_CHANNEL[self.server_peer_id]

	Managers.account:update_presence()
	RPC.rpc_is_ingame(channel_id)
end

NetworkClient.request_profile = function (self, local_player_id, profile_name, career_name, force_respawn)
	self._profile_requester:request_profile(Network.peer_id(), local_player_id, profile_name, career_name, force_respawn)
end

NetworkClient.profile_requester = function (self)
	return self._profile_requester
end

NetworkClient.rpc_game_started = function (self, channel_id, round_id)
	Application.error(string.format("SETTING ROUND ID %s", tostring(round_id)))

	if IS_XB1 then
		Managers.account:set_round_id(round_id)
	end

	network_printf("rpc_game_started")
	self:set_state(NetworkClientStates.game_started)
	Managers.state.event:trigger("game_started")
end

NetworkClient.on_level_loaded = function (self, level_name)
	network_printf("on_level_loaded %s", level_name)

	if self.state ~= NetworkClientStates.connecting then
		local channel_id = PEER_ID_TO_CHANNEL[self.server_peer_id]

		if channel_id then
			RPC.rpc_level_loaded(channel_id, NetworkLookup.level_keys[level_name])
		end
	else
		self.loaded_level_name = level_name
	end
end

NetworkClient._update_connections = function (self)
	local channel_id = PEER_ID_TO_CHANNEL[self.server_peer_id]

	if not channel_id then
		return
	end

	local channel_state, reason = Network.channel_state(channel_id)

	if channel_state ~= self._server_channel_state then
		if channel_state == "disconnected" then
			self.fail_reason = reason

			printf("broken_connection to %s", self.server_peer_id)
			Crashify.print_exception("Disconnected", "broken connection to server: " .. tostring(reason))
			self:set_state(NetworkClientStates.lost_connection_to_host)
		end

		self._server_channel_state = channel_state
	end
end

NetworkClient.update = function (self, dt)
	self._profile_requester:update(dt)
	self.profile_synchronizer:update()
	self:_update_connections()

	if not self.wait_for_state_loading and self.state == NetworkClientStates.loading then
		local level_transition_handler = Managers.level_transition_handler

		if Managers.level_transition_handler:all_packages_loaded() then
			network_printf("All level packages loaded!")

			if self._rpc_loading_synced then
				self:set_state(NetworkClientStates.waiting_enter_game)

				self._rpc_loading_synced = false
			else
				self:set_state(NetworkClientStates.loaded)
			end

			self:on_level_loaded(level_transition_handler:get_current_level_keys())
		end
	end

	if self.state == NetworkClientStates.connecting then
		self.connecting_timeout = self.connecting_timeout + dt

		if self.connecting_timeout > CONNECTION_TIMEOUT then
			self.connecting_timeout = 0
			self.fail_reason = "broken_connection"

			network_printf("connection timeout leading to broken_connection")
			self:set_state(NetworkClientStates.denied_enter_game)
		end
	end

	local state = self.state
	local bad_state = state == NetworkClientStates.lost_connection_to_host or state == NetworkClientStates.denied_enter_game or state == NetworkClientStates.eac_match_failed

	if not bad_state then
		self:_update_eac_match(dt)
	end

	self.voip:update(dt)
end

NetworkClient.eac_allowed_to_play = function (self)
	return self._eac_state_determined and self._eac_can_play
end

NetworkClient._update_eac_match = function (self, dt)
	if not self._eac_has_set_host then
		return
	end

	local state_determined, can_play = self:_eac_host_check()

	self._eac_state_determined = state_determined
	self._eac_can_play = can_play

	if can_play then
		-- Nothing
	else
		printf("eac mismatch leading to eac_authorize_failed")

		self.fail_reason = "eac_authorize_failed"

		self:set_state(NetworkClientStates.eac_match_failed)
	end
end

NetworkClient._eac_host_check = function (self)
	if self.lobby_client:is_dedicated_server() then
		if not self._switch_xxx then
			print("EAC debug check 1", self._switch_xxx)
		end

		self._switch_xxx = true

		return true, true
	end

	if self._switch_xxx or self._switch_xxx == nil then
		print("EAC debug check 2", self._switch_xxx)
	end

	self._switch_xxx = false

	if not self._eac_has_set_host then
		return false, true
	end

	local own_id = Network.peer_id()
	local host_state = EAC.state(self.server_peer_id)
	local own_state = EAC.state()

	if host_state == "undetermined" or own_state == "undetermined" then
		return false, true
	end

	local match

	match = (host_state ~= "banned" and own_state ~= "banned" or false) and host_state == own_state

	if not match then
		printf("Host (%s) EAC state is %s, own (%s) state is %s", self.server_peer_id, host_state, own_id, own_state)
	end

	return true, match
end

NetworkClient.can_enter_game = function (self)
	return self.state == NetworkClientStates.waiting_enter_game
end

NetworkClient.is_ingame = function (self)
	return self.state == NetworkClientStates.is_ingame or self.state == NetworkClientStates.game_started
end

NetworkClient.set_wait_for_state_loading = function (self, wait)
	self.wait_for_state_loading = wait
end

NetworkClient.is_peer_ingame = function (self, peer_id)
	return self._network_state:is_peer_ingame(peer_id)
end

NetworkClient.get_peers = function (self)
	return self._network_state and self._network_state:get_peers() or {}
end

NetworkClient.get_side_order_state = function (self)
	return self._network_state and self._network_state:get_side_order_state()
end
