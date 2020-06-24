require("scripts/game_state/components/profile_synchronizer")
require("scripts/game_state/components/slot_allocator")
require("scripts/utils/profile_requester")

NetworkClient = class(NetworkClient)
local NUM_PROFILES = #PROFILES_BY_AFFILIATION.heroes
local CONNECTION_TIMEOUT = 15

local function network_printf(format, ...)
	if script_data.network_debug_connections then
		printf("[NetworkClient] " .. format, ...)
	end
end

NetworkClient.init = function (self, level_transition_handler, server_peer_id, level_index, wanted_profile_index, clear_peer_states, lobby_client)
	self.level_transition_handler = level_transition_handler

	self:set_state("connecting")

	self.connection_handler = ConnectionHandler:new(server_peer_id)
	self.server_peer_id = server_peer_id
	self.profile_synchronizer = ProfileSynchronizer:new(false, lobby_client, self)
	self._profile_requester = ProfileRequester:new(false, nil, self.profile_synchronizer)
	self.wanted_profile_index = FindProfileIndex(Development.parameter("wanted_profile")) or wanted_profile_index or SaveData.wanted_profile_index or 1

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
	local is_server = false
	self.slot_allocator = SlotAllocator:new(is_server, self.lobby_client, NUM_PROFILES)
	local display_name = (profile and profile.display_name) or "no profile wanted"

	network_printf("init - wanted_profile_index, %s, %s", self.wanted_profile_index, display_name)

	self.last_level_index = level_index

	if clear_peer_states then
		network_printf("SENDING rpc_clear_peer_state to %s", self.server_peer_id)
		RPC.rpc_clear_peer_state(self.server_peer_id)
	end

	local voip_params = {
		is_server = is_server,
		connection_handler = self.connection_handler,
		lobby = lobby_client
	}
	self.voip = Voip:new(voip_params)
	self.connecting_timeout = 0

	EAC.before_join()

	self._eac_state_determined = false
	self._eac_can_play = false
end

NetworkClient.destroy = function (self)
	EAC.after_leave()

	if self._network_event_delegate then
		self:unregister_rpcs()
	end

	self.voip:destroy()

	self.voip = nil

	self._profile_requester:destroy()

	self._profile_requester = nil

	self.profile_synchronizer:destroy()

	self.profile_synchronizer = nil

	self.connection_handler:update(0)

	self.lobby_client = nil

	GarbageLeakDetector.register_object(self, "Network Client")
end

NetworkClient.register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, "rpc_loading_synced", "rpc_notify_in_post_game", "rpc_reload_level", "rpc_load_level", "rpc_game_started", "rpc_disconnect_peer", "rpc_connection_failed", "rpc_notify_connected", "rpc_set_migration_host", "rpc_client_update_lobby_data")

	self._network_event_delegate = network_event_delegate

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
end

NetworkClient.rpc_connection_failed = function (self, sender, reason)
	self.fail_reason = NetworkLookup.connection_fails[reason]

	network_printf("rpc_connection_failed due to %s", self.fail_reason)
	self:set_state("denied_enter_game")
	network_printf("Connection to server failed with reason %s", self.fail_reason)
end

NetworkClient.rpc_notify_connected = function (self, sender)
	if not self._notification_sent then
		EAC.set_host(self.server_peer_id)

		self._eac_has_set_host = true

		EAC.validate_host()
		RPC.rpc_notify_lobby_joined(self.server_peer_id, self.wanted_profile_index, self.wanted_career_index, Application.user_setting("clan_tag") or "0", Managers.account:account_id() or "0")

		self._notification_sent = true

		self:set_state("connected")

		if self.loaded_level_name then
			local level_name = self.loaded_level_name

			RPC.rpc_level_loaded(self.server_peer_id, NetworkLookup.level_keys[level_name])

			self.loaded_level_name = nil
		end
	end
end

NetworkClient.rpc_notify_in_post_game = function (self, sender, in_post_game)
	if self._is_in_post_game ~= in_post_game then
		self._is_in_post_game = in_post_game

		RPC.rpc_post_game_notified(self.server_peer_id, in_post_game)
	end
end

NetworkClient.is_in_post_game = function (self)
	return self._is_in_post_game
end

NetworkClient.rpc_disconnect_peer = function (self, sender, peer_id)
	self.connection_handler:disconnect_peers(peer_id)
end

NetworkClient.rpc_loading_synced = function (self, sender)
	if self.state ~= "game_started" then
		self:set_state("waiting_enter_game")
	end
end

NetworkClient.rpc_reload_level = function (self, sender, level_seed)
	self:set_state("loading")
end

NetworkClient.rpc_load_level = function (self, sender, level_index, level_seed, difficulty_id, locked_director_functions_ids, environment_variation_id)
	local difficulty = NetworkLookup.difficulties[difficulty_id]
	local mechanism_manager = Managers.mechanism

	mechanism_manager:set_difficulty(difficulty)
	mechanism_manager:set_level_seed(level_seed)
	mechanism_manager:set_locked_director_functions_from_ids(locked_director_functions_ids)
	printf("[NetworkClient] Setting difficulty to: %s, level_seed to: %d", difficulty, level_seed)

	local level_transition_handler = self.level_transition_handler

	if level_transition_handler:transition_in_progress() then
		return
	end

	self:set_state("loading")
	self.level_transition_handler:prepare_load_level(level_index, level_seed, environment_variation_id)
end

NetworkClient.rpc_set_migration_host = function (self, sender, peer_id, do_migrate)
	if do_migrate then
		local player = Managers.player:player_from_peer_id(peer_id)
		local name = player:name()
		self.host_to_migrate_to = {
			peer_id = peer_id,
			name = name
		}
	else
		self.host_to_migrate_to = nil
	end
end

NetworkClient.rpc_client_update_lobby_data = function (self, sender)
	self.lobby_client:force_update_lobby_data()
end

NetworkClient.set_state = function (self, new_state)
	network_printf("New State %s (old state %s)", new_state, tostring(self.state))

	self.state = new_state
end

NetworkClient.has_bad_state = function (self)
	local state = self.state

	return state == "denied_enter_game" or state == "lost_connection_to_host" or state == "eac_match_failed"
end

NetworkClient.on_game_entered = function (self)
	self:set_state("is_ingame")
	RPC.rpc_is_ingame(self.server_peer_id)
end

NetworkClient.request_profile = function (self, local_player_id, profile_name, career_name, force_respawn)
	self._profile_requester:request_profile(Network.peer_id(), local_player_id, profile_name, career_name, force_respawn)
end

NetworkClient.profile_requester = function (self)
	return self._profile_requester
end

NetworkClient.rpc_game_started = function (self, sender, round_id)
	Application.error(string.format("SETTING ROUND ID %s", tostring(round_id)))

	if PLATFORM == "xb1" then
		Managers.account:set_round_id(round_id)
	end

	network_printf("rpc_game_started")
	self:set_state("game_started")
	Managers.state.event:trigger("game_started")
end

NetworkClient.on_level_loaded = function (self, level_name)
	network_printf("on_level_loaded %s", level_name)

	if self.state ~= "connecting" then
		RPC.rpc_level_loaded(self.server_peer_id, NetworkLookup.level_keys[level_name])
	else
		self.loaded_level_name = level_name
	end
end

NetworkClient.update = function (self, dt)
	local connection_handler = self.connection_handler

	self._profile_requester:update(dt)
	self.profile_synchronizer:update()
	connection_handler:update(dt)

	if not self.wait_for_state_loading and self.state == "loading" and self.level_transition_handler:all_packages_loaded() then
		network_printf("All level packages loaded!", self.level_transition_handler:get_current_level_keys())
		self:set_state("loaded")
		self:on_level_loaded(self.level_transition_handler:get_current_level_keys())
	end

	local broken_connections, num_broken_connections = connection_handler:get_broken_connections()

	for i = 1, num_broken_connections, 1 do
		local peer_id = broken_connections[i]

		if peer_id == self.server_peer_id and self.state ~= "lost_connection_to_host" then
			self.fail_reason = "broken_connection"

			network_printf("broken_connection to %s", peer_id)
			self:set_state("lost_connection_to_host")
		end

		broken_connections[i] = nil
	end

	if self.state == "connecting" then
		self.connecting_timeout = self.connecting_timeout + dt

		if CONNECTION_TIMEOUT < self.connecting_timeout then
			self.connecting_timeout = 0
			self.fail_reason = "broken_connection"

			network_printf("connection timeout leading to broken_connection")
			self:set_state("denied_enter_game")
		end
	end

	local state = self.state
	local bad_state = state == "lost_connection_to_host" or state == "denied_enter_game" or state == "eac_match_failed"

	if not bad_state then
		self:_update_eac_match(dt)
	end

	self.voip:update(dt)

	local lobby_client = self.lobby_client
	local lobby_members = lobby_client:members()
	local lost_connection = lobby_client:lost_connection_to_lobby()
	local suppress_messages = self._prev_lost_connection or lost_connection
	self._prev_lost_connection = lost_connection

	if lobby_members and not suppress_messages then
		local members_joined = lobby_members:get_members_joined()

		for i, peer_id in ipairs(members_joined) do
			if peer_id ~= lobby_client:lobby_host() then
				NetworkUtils.announce_chat_peer_joined(peer_id, lobby_client)
			end
		end

		local members_left = lobby_members:get_members_left()

		for i, peer_id in ipairs(members_left) do
			if peer_id ~= lobby_client:lobby_host() then
				NetworkUtils.announce_chat_peer_left(peer_id, lobby_client)
			end
		end
	end
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
	else
		printf("eac mismatch leading to eac_authorize_failed")

		self.fail_reason = "eac_authorize_failed"

		self:set_state("eac_match_failed")
	end
end

NetworkClient._eac_host_check = function (self)
	if not self._eac_has_set_host then
		return false, true
	end

	local own_id = Network.peer_id()
	local host_state = EAC.state(self.server_peer_id)
	local own_state = EAC.state()

	if host_state == "undetermined" or own_state == "undetermined" then
		return false, true
	end

	local match = nil
	match = ((host_state ~= "banned" and own_state ~= "banned") or false) and host_state == own_state

	if not match then
		printf("Host (%s) EAC state is %s, own (%s) state is %s", self.server_peer_id, host_state, own_id, own_state)
	end

	return true, match
end

NetworkClient.can_enter_game = function (self)
	return self.state == "waiting_enter_game"
end

NetworkClient.is_ingame = function (self)
	return self.state == "is_ingame" or self.state == "game_started"
end

NetworkClient.set_wait_for_state_loading = function (self, wait)
	self.wait_for_state_loading = wait
end

return
