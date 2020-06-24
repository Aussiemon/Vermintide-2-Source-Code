require("scripts/network/peer_state_machine")
require("scripts/network/connection_handler")
require("scripts/network/voip")
require("scripts/game_state/components/profile_synchronizer")
require("scripts/utils/profile_requester")
require("scripts/game_state/components/slot_allocator")
require("scripts/settings/profiles/sp_profiles")

local NUM_PROFILES = #PROFILES_BY_AFFILIATION.heroes
local KICK_PEER_WAIT_TIMER = 5

local function network_printf(format, ...)
	if script_data.network_debug_connections then
		printf("[NetworkServer] " .. format, ...)
	end
end

PeerState = PeerState or CreateStrictEnumTable("Broken", "Connecting", "Connected", "Disconnected", "Loading", "LoadingLevelComplete", "WaitingForEnter", "WaitingForGameObjectSync", "WaitingForSpawnPlayer", "InGame", "InPostGame")
NetworkServer = class(NetworkServer)

NetworkServer.init = function (self, player_manager, lobby_host, initial_level, environment_variation_id, wanted_profile_index, level_transition_handler, game_server_manager)
	self.peer_connections = {}
	local my_peer_id = Network.peer_id()
	self.my_peer_id = my_peer_id
	self.connection_handler = ConnectionHandler:new()
	self.peers_to_disconnect = {}
	self.peers_added_to_gamesession = {}
	self.peers_completed_game_object_sync = {}
	self.player_manager = player_manager
	self.lobby_host = lobby_host
	self.peer_state_machines = {}
	self.kicked_peers_disconnect_timer = {}
	self.level_transition_handler = level_transition_handler
	local is_server = true
	self.slot_allocator = SlotAllocator:new(is_server, self.lobby_host, NUM_PROFILES)
	self._game_server_manager = game_server_manager

	self:set_current_level(initial_level, environment_variation_id)

	self.profile_synchronizer = ProfileSynchronizer:new(is_server, lobby_host, self)
	self._profile_requester = ProfileRequester:new(is_server, self, self.profile_synchronizer)

	Managers.mechanism:set_profile_synchronizer(self.profile_synchronizer)

	local voip_params = {
		is_server = is_server,
		my_peer_id = my_peer_id,
		connection_handler = self.connection_handler,
		lobby = lobby_host
	}
	self.voip = Voip:new(voip_params)
	self._reserved_slots = {}

	if not DEDICATED_SERVER then
		self.wanted_profile_index = wanted_profile_index or SaveData.wanted_profile_index or 1
		local profile = SPProfiles[self.wanted_profile_index]

		if profile then
			local hero_name = profile.display_name
			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			local wanted_career_index = hero_attributes:get(hero_name, "career") or 1
			local hero_experience = hero_attributes:get(hero_name, "experience") or 0
			local hero_level = ExperienceSettings.get_level(hero_experience)
			local career = profile.careers[wanted_career_index]

			if not career.is_unlocked_function(hero_name, hero_level) then
				wanted_career_index = 1

				hero_attributes:set(hero_name, "career", wanted_career_index)
			end

			self.wanted_career_index = wanted_career_index
		end
	end

	local server_name = nil

	if DEDICATED_SERVER then
		server_name = self.lobby_host:server_name()
	elseif rawget(_G, "Steam") then
		server_name = Steam.user_name()
	else
		server_name = "lan"
	end

	if DEDICATED_SERVER or (HAS_STEAM and not Development.parameter("use_lan_backend")) then
		self._eac_server = EACServer.create(my_peer_id, server_name)
	end

	self._eac_peer_ids = {}

	if DEDICATED_SERVER then
		self._eac_authorized_written_to_lobby_data = ""
	end

	Managers.mechanism:register_network_server(self)
end

NetworkServer.eac_server = function (self)
	return self._eac_server
end

NetworkServer.server_join = function (self)
	print(string.format("### Created peer state machine for %s", self.my_peer_id))

	local peer_id = self.my_peer_id
	self.peer_state_machines[peer_id] = PeerStateMachine.create(self, peer_id)
end

NetworkServer.num_active_peers = function (self)
	local num_peers = 0

	for peer_id, statemachine in pairs(self.peer_state_machines) do
		local state = statemachine.current_state
		local is_active = state ~= PeerStates.Disconnecting and state ~= PeerStates.Disconnected

		if is_active then
			num_peers = num_peers + 1
		end
	end

	return num_peers
end

NetworkServer.num_joining_peers = function (self)
	local num_peers = 0

	for peer_id, statemachine in pairs(self.peer_state_machines) do
		local state = statemachine.current_state
		local is_joining = state == PeerStates.Connecting

		if is_joining then
			num_peers = num_peers + 1
		end
	end

	return num_peers
end

NetworkServer.rpc_notify_connected = function (self, sender)
	if sender == self.my_peer_id then
		local profile_index, career_index = nil
		local level_settings = self.level_key and LevelSettings[self.level_key]
		profile_index = (not level_settings or level_settings.game_mode ~= "tutorial" or self.wanted_profile_index) and (wanted_profile_index or self.profile_synchronizer:get_first_free_profile())

		if profile_index == self.wanted_profile_index then
			career_index = Development.parameter("wanted_career_index") or self.wanted_career_index
		else
			local profile = SPProfiles[profile_index]
			local hero_name = profile.display_name
			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			career_index = hero_attributes:get(hero_name, "career") or 1
		end

		self.peer_state_machines[sender].rpc_notify_lobby_joined(profile_index, career_index)
	end
end

NetworkServer.rpc_notify_in_post_game = function (self, sender, in_post_game)
	if sender == self.my_peer_id then
		local peer_state_machine = self.peer_state_machines[sender]

		if peer_state_machine:has_function("rpc_post_game_notified") then
			peer_state_machine.rpc_post_game_notified(in_post_game)
		end
	end
end

NetworkServer.rpc_game_started = function (self, sender)
	if sender == self.my_peer_id then
		Managers.state.event:trigger("game_started")
	end
end

NetworkServer.can_enter_game = function (self)
	return self.peer_state_machines[self.my_peer_id].current_state == PeerStates.WaitingForEnterGame
end

NetworkServer.enter_post_game = function (self)
	network_printf("Entering post game")

	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		if peer_state_machine.current_state == PeerStates.InGame then
			peer_state_machine.state_data:change_state(PeerStates.InPostGame)
		end
	end
end

NetworkServer.is_in_post_game = function (self)
	if DEDICATED_SERVER then
		local leader_peer_id = Managers.party:leader()

		if not leader_peer_id then
			return false
		else
			return self.peer_state_machines[leader_peer_id].current_state == PeerStates.InPostGame
		end
	else
		return self.peer_state_machines[self.my_peer_id].current_state == PeerStates.InPostGame
	end
end

NetworkServer.rpc_to_client_spawn_player = function (self, sender, ...)
	if sender == self.my_peer_id then
	end
end

NetworkServer.set_current_level = function (self, level_key, environment_variation_id)
	network_printf("Current level key %s", level_key, environment_variation_id)

	self.level_key = level_key
	self.environment_variation_id = environment_variation_id
end

NetworkServer.on_game_entered = function (self, game_network_manager)
	network_printf("[NETWORK SERVER]: On Game Entered")

	self.game_session = Network.game_session()

	assert(self.game_session, "Unable to find game session in NetworkServer:on_game_entered.")

	self.game_network_manager = game_network_manager

	if not DEDICATED_SERVER then
		self.peers_completed_game_object_sync[self.my_peer_id] = true

		self.peer_state_machines[self.my_peer_id].rpc_is_ingame()
	end
end

NetworkServer.request_profile = function (self, local_player_id, profile_name, career_name, force_respawn)
	self._profile_requester:request_profile(Network.peer_id(), local_player_id, profile_name, career_name, force_respawn)
end

NetworkServer.profile_requester = function (self)
	return self._profile_requester
end

NetworkServer.rpc_is_ingame = function (self, sender)
	local peer_state_machine = self.peer_state_machines[sender]

	if not peer_state_machine or not peer_state_machine:has_function("rpc_is_ingame") then
		network_printf("RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)", "rpc_is_ingame")
		RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)
	else
		peer_state_machine.rpc_is_ingame()
	end
end

NetworkServer.rpc_loading_synced = function (self, sender)
	return
end

NetworkServer.peer_spawned_player = function (self, peer_id)
	network_printf("Peer %s spawned player.", peer_id)

	local peer_state_machine = self.peer_state_machines[peer_id]

	if peer_state_machine:has_function("spawned_player") then
		peer_state_machine.spawned_player()
	end
end

NetworkServer.peer_despawned_player = function (self, peer_id)
	network_printf("Peer %s despawned player.", peer_id)

	local peer_state_machine = self.peer_state_machines[peer_id]

	if peer_state_machine:has_function("despawned_player") then
		peer_state_machine.despawned_player()
	end
end

NetworkServer.peer_respawn_player = function (self, peer_id)
	network_printf("Peer %s respawn player.", peer_id)

	local peer_state_machine = self.peer_state_machines[peer_id]

	if peer_state_machine:has_function("respawn_player") then
		peer_state_machine.respawn_player()
	end
end

NetworkServer.rpc_client_respawn_player = function (self, sender)
	self:peer_respawn_player(sender)
end

NetworkServer.destroy = function (self)
	if self._eac_server ~= nil then
		EACServer.destroy(self._eac_server)

		self._eac_server = nil
	end

	if self.network_event_delegate then
		self:unregister_rpcs()
	end

	self.voip:destroy()

	self.voip = nil

	self._profile_requester:destroy()

	self._profile_requester = nil

	self.profile_synchronizer:destroy()

	self.profile_synchronizer = nil

	self.connection_handler:update(0)
	GarbageLeakDetector.register_object(self, "NetworkServer")

	if self._gui ~= nil then
		World.destroy_gui(Application.debug_world(), self._gui)

		self._gui = nil
	end

	Managers.mechanism:unregister_network_server()
end

NetworkServer.register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, "rpc_client_connection_state", "rpc_notify_lobby_joined", "rpc_to_client_spawn_player", "rpc_post_game_notified", "rpc_want_to_spawn_player", "rpc_level_loaded", "rpc_game_started", "rpc_is_ingame", "game_object_sync_done", "rpc_notify_connected", "rpc_loading_synced", "rpc_clear_peer_state", "rpc_notify_in_post_game", "rpc_client_respawn_player")

	self.network_event_delegate = network_event_delegate

	self.profile_synchronizer:register_rpcs(network_event_delegate, network_transmit)
	self._profile_requester:register_rpcs(network_event_delegate, network_transmit)

	self.network_transmit = network_transmit

	self.voip:register_rpcs(network_event_delegate, network_transmit)
end

NetworkServer.on_level_exit = function (self)
	table.clear(self.peers_completed_game_object_sync)

	for peer_id, peer_data in pairs(self.peer_connections) do
		if peer_data.state == PeerState.InPostGame then
			peer_data.state = PeerState.Loading
		end
	end

	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		local current_state = peer_state_machine.current_state

		if current_state ~= PeerStates.Connecting and current_state ~= PeerStates.Disconnecting and current_state ~= PeerStates.Disconnected then
			peer_state_machine.state_data:change_state(PeerStates.Loading)
		end
	end

	table.clear(self.peers_added_to_gamesession)
	self:unregister_rpcs()

	self.game_network_manager = nil
	self.game_session = nil
end

NetworkServer.unregister_rpcs = function (self)
	self.voip:unregister_rpcs()
	self._profile_requester:unregister_rpcs()

	if self.network_event_delegate then
		self.network_event_delegate:unregister(self)

		self.network_event_delegate = nil
	end

	self.profile_synchronizer:unregister_network_events()

	self.network_transmit = nil
end

NetworkServer.has_all_peers_loaded_packages = function (self)
	return self.profile_synchronizer:all_synced()
end

NetworkServer.kick_peer = function (self, peer_id)
	self.network_transmit:send_rpc("rpc_kick_peer", peer_id)

	self.kicked_peers_disconnect_timer[peer_id] = KICK_PEER_WAIT_TIMER
end

NetworkServer.update_disconnect_kicked_peers_by_time = function (self, dt)
	local kicked_peers_disconnect_timer = self.kicked_peers_disconnect_timer

	for peer_id, time_left in pairs(kicked_peers_disconnect_timer) do
		if time_left == 0 then
			kicked_peers_disconnect_timer[peer_id] = nil

			self:force_disconnect_client_by_peer_id(peer_id)
		else
			kicked_peers_disconnect_timer[peer_id] = math.max(time_left - dt, 0)
		end
	end
end

NetworkServer.disconnect_all_peers = function (self, reason)
	local reason_id = NetworkLookup.connection_fails[reason]
	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		if peer_id ~= Network.peer_id() and peer_state_machine.current_state ~= PeerStates.Disconnecting and peer_state_machine.current_state ~= PeerStates.Disconnected then
			RPC.rpc_connection_failed(peer_id, reason_id)
		end
	end
end

NetworkServer.disconnect_peer = function (self, peer_id, reason)
	local reason_id = NetworkLookup.connection_fails[reason]
	local peer_state_machine = self.peer_state_machines[peer_id]
	local current_state = peer_state_machine.current_state

	if current_state ~= PeerStates.Disconnecting and current_state ~= PeerStates.Disconnected then
		RPC.rpc_connection_failed(peer_id, reason_id)
	end
end

NetworkServer.force_disconnect_all_client_peers = function (self)
	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		local client = peer_id ~= self.my_peer_id

		if client and peer_state_machine.current_state ~= PeerStates.Disconnecting and peer_state_machine.current_state ~= PeerStates.Disconnected then
			peer_state_machine.state_data:change_state(PeerStates.Disconnecting)
		end
	end
end

NetworkServer.force_disconnect_client_by_peer_id = function (self, peer_id)
	local peer_state_machines = self.peer_state_machines

	if peer_id and peer_state_machines[peer_id] then
		local peer_state_machine = peer_state_machines[peer_id]
		local client = peer_id ~= self.my_peer_id

		if client and peer_state_machine.current_state ~= PeerStates.Disconnecting and peer_state_machine.current_state ~= PeerStates.Disconnected then
			peer_state_machine.state_data:change_state(PeerStates.Disconnecting)
		end
	end
end

NetworkServer.rpc_client_connection_state = function (self, sender, peer_id, peer_state)
	return
end

NetworkServer.rpc_notify_lobby_joined = function (self, sender, wanted_profile_index, wanted_career_index, clan_tag, account_id)
	network_printf("Peer %s has sent rpc_notify_lobby_joined", tostring(sender))

	local peer_state_machine = self.peer_state_machines[sender]

	if not peer_state_machine or not peer_state_machine:has_function("rpc_notify_lobby_joined") then
		network_printf("RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)", "rpc_notify_lobby_joined")
		RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)
	else
		peer_state_machine.rpc_notify_lobby_joined(wanted_profile_index, wanted_career_index, clan_tag, account_id)

		if sender ~= self.my_peer_id then
			self:_add_peer_to_eac(sender)
		end

		local enemy_package_loader = self.level_transition_handler.enemy_package_loader

		enemy_package_loader:client_connected(sender)
	end
end

NetworkServer.rpc_post_game_notified = function (self, sender, in_post_game)
	network_printf("Peer %s has sent rpc_post_game_notified", tostring(sender))

	local peer_state_machine = self.peer_state_machines[sender]

	if not peer_state_machine or not peer_state_machine:has_function("rpc_post_game_notified") then
		network_printf("RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)", "rpc_post_game_notified")
		RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)
	else
		peer_state_machine.rpc_post_game_notified(in_post_game)
	end
end

NetworkServer.rpc_level_loaded = function (self, sender, level_id)
	print("### Sending rpc_level_loaded")

	local peer_state_machine = self.peer_state_machines[sender]

	if not peer_state_machine then
		if sender ~= self.my_peer_id then
			network_printf("RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_enter_game)", "rpc_level_loaded")
			RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_enter_game)
		end
	else
		print(string.format("#### Has state machine: %s, sender: %s, level_id: %s", peer_state_machine:has_function("rpc_level_loaded"), sender, level_id))

		if peer_state_machine:has_function("rpc_level_loaded") then
			peer_state_machine.rpc_level_loaded(level_id)
		end
	end
end

NetworkServer.rpc_want_to_spawn_player = function (self, sender)
	local peer_state_machine = self.peer_state_machines[sender]

	if not peer_state_machine or not peer_state_machine:has_function("rpc_want_to_spawn_player") then
		network_printf("RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_enter_game)", "rpc_want_to_spawn_player")
		RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_enter_game)
	else
		peer_state_machine.rpc_want_to_spawn_player()
	end
end

NetworkServer.game_object_sync_done = function (self, peer_id)
	network_printf("Game_object_sync_done for peer %s", peer_id)

	self.peers_completed_game_object_sync[peer_id] = true

	self.game_network_manager:_hot_join_sync(peer_id)
	RPC.rpc_set_migration_host(peer_id, self.host_to_migrate_to or "", (self.host_to_migrate_to and true) or false)
end

NetworkServer.update = function (self, dt)
	self._profile_requester:update(dt)
	self.profile_synchronizer:update()

	local connection_handler = self.connection_handler
	local peer_state_machines = self.peer_state_machines
	local new_connections, num_new_connections = connection_handler:update(dt)

	for i = 1, num_new_connections, 1 do
		local peer_id = new_connections[i]

		network_printf("New connection detected in NetworkServer from %q", peer_id)
		NetworkUtils.announce_chat_peer_joined(peer_id, self.lobby_host)
	end

	local lobby_members = self.lobby_host:members()

	if lobby_members then
		local members_joined = lobby_members:get_members_joined()

		for i, peer_id in ipairs(members_joined) do
			if peer_id ~= self.lobby_host:lobby_host() then
				if peer_state_machines[peer_id] then
					network_printf("Peer %s reconnected to the server lobby.", peer_id)
				else
					network_printf("Peer %s joined server lobby.", peer_id)

					peer_state_machines[peer_id] = PeerStateMachine.create(self, peer_id)
				end
			end
		end
	end

	local broken_connections, broken_connections_n = connection_handler:get_broken_connections()

	for i = 1, broken_connections_n, 1 do
		local peer_id = broken_connections[i]

		network_printf("Broken connection to peer id %s discovered in connection handler. Server selecting peer to disconnect.", peer_id)
		self:_handle_peer_left_game(peer_id)

		broken_connections[i] = nil
	end

	local game_session = self.game_network_manager and self.game_network_manager:game()

	if game_session then
		local peer_id = GameSession.wants_to_leave(game_session)

		if peer_id then
			network_printf("Peer wants to leave game session: peer id %s", peer_id)
			self:_handle_peer_left_game(peer_id)
		end
	end

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		peer_state_machine:update(dt)
	end

	if self.game_network_manager and not self.game_network_manager:is_leaving_game() then
		local peers_ingame = 0
		local host_to_migrate_to = self.host_to_migrate_to

		for peer_id, peer_state_machine in pairs(peer_state_machines) do
			local peer_state = peer_state_machine.current_state
			local allowed_to_host = peer_state == PeerStates.InGame or peer_state == PeerStates.InPostGame

			if peer_id ~= Network.peer_id() and allowed_to_host then
				host_to_migrate_to = peer_id
				peers_ingame = peers_ingame + 1
			end
		end

		if peers_ingame < 2 then
			host_to_migrate_to = nil
		end

		if Managers.weave:get_active_weave() ~= nil then
			host_to_migrate_to = nil
		end

		if self.lobby_host:lost_connection_to_lobby() then
			host_to_migrate_to = nil
		end

		if host_to_migrate_to ~= self.host_to_migrate_to then
			self.host_to_migrate_to = host_to_migrate_to

			self.network_transmit:send_rpc_clients("rpc_set_migration_host", host_to_migrate_to or "", (host_to_migrate_to and true) or false)
		end
	end

	self:_update_reserve_slots(dt)
	self:update_disconnect_kicked_peers_by_time(dt)

	if self._eac_server ~= nil then
		EACServer.update(self._eac_server)
	end

	self:_update_eac_match(dt)

	if DEDICATED_SERVER then
		local eac_state = EACServer.state(self._eac_server, Network.peer_id())

		if eac_state ~= "undetermined" then
			local eac_authorized = eac_state == "trusted"
			local eac_authorized_string = (eac_authorized and "true") or "false"

			if self._eac_authorized_written_to_lobby_data ~= eac_authorized_string then
				cprintf("Server is " .. ((eac_authorized and "trusted") or "untrusted"))

				local lobby_data = self.lobby_host:get_stored_lobby_data()
				lobby_data.eac_authorized = eac_authorized_string

				self.lobby_host:set_lobby_data(lobby_data)

				self._eac_authorized_written_to_lobby_data = eac_authorized_string
			end
		end
	end

	if self.lobby_host:is_joined() then
		local lobby_members = self.lobby_host:members()
		local members = lobby_members:get_members()
		local num_members = #members
		local lobby_data = self.lobby_host:get_stored_lobby_data()

		if lobby_data and num_members ~= lobby_data.num_players then
			printf("[NetworkServer] Changing num_players from %s to %s", tostring(lobby_data.num_players), tostring(num_members))
			cprintf("Players: %d", num_members)

			lobby_data.num_players = num_members

			self.lobby_host:set_lobby_data(lobby_data)
		end
	end

	for peer_id, peer_state_machine in pairs(self.peer_state_machines) do
		if peer_state_machine.current_state.state_name == "Disconnected" then
			self.peer_state_machines[peer_id] = nil
		end
	end

	if not LEVEL_EDITOR_TEST then
		self.voip:update(dt)
	end

	if Development.parameter("network_draw_peer_states") then
		self:_draw_peer_states()
	end
end

NetworkServer._handle_peer_left_game = function (self, peer_id)
	if peer_id then
		NetworkUtils.announce_chat_peer_left(peer_id, self.lobby_host)

		local peer_state_machine = self.peer_state_machines[peer_id]

		if peer_state_machine and peer_state_machine.current_state ~= PeerStates.Disconnecting and peer_state_machine.current_state ~= PeerStates.Disconnected then
			peer_state_machine.state_data:change_state(PeerStates.Disconnecting)
		end
	end
end

NetworkServer._add_peer_to_eac = function (self, peer_id)
	if self._eac_server == nil then
		return
	end

	EACServer.add_peer(self._eac_server, peer_id)

	self._eac_peer_ids[peer_id] = {
		eac_match_timer = 0,
		updated = false
	}
end

NetworkServer._remove_peer_from_eac = function (self, peer_id)
	if self._eac_server == nil then
		return
	end

	EACServer.remove_peer(self._eac_server, peer_id)

	self._eac_peer_ids[peer_id] = nil
end

NetworkServer._update_eac_match = function (self, dt)
	local eac_peer_ids = self._eac_peer_ids

	for peer_id, data in pairs(eac_peer_ids) do
		data.update = false
	end

	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		local state_name = peer_state_machine.current_state.state_name
		local bad_state = state_name == "Disconnecting" or state_name == "Disconnected"
		local data = eac_peer_ids[peer_id]

		if data and not bad_state then
			data.update = true
			data.eac_match_timer = math.max(0, data.eac_match_timer - dt)

			if data.eac_match_timer == 0 then
				local determined, can_play = self:eac_check_peer(peer_id)

				if can_play then
				else
					printf("[NetworkServer] Peer's EAC status doesn't match the server, disconnecting peer (%s)", peer_id)
					self:disconnect_peer(peer_id, "eac_authorize_failed")
					peer_state_machine.state_data:change_state(PeerStates.Disconnecting)
				end

				data.eac_match_timer = 10
			end
		end
	end

	for peer_id, data in pairs(eac_peer_ids) do
		if not data.update then
			self:_remove_peer_from_eac(peer_id)
		end
	end
end

NetworkServer.eac_check_peer = function (self, peer_id)
	local server_state, peer_state = nil

	if DEDICATED_SERVER then
		server_state = EACServer.state(self._eac_server, self.my_peer_id)
		peer_state = EACServer.state(self._eac_server, peer_id)
	else
		local host = self.lobby_host
		server_state = EAC.state()

		if peer_id == self.my_peer_id then
			peer_state = server_state
		elseif self._eac_server == nil then
			peer_state = "untrusted"
		else
			peer_state = EACServer.state(self._eac_server, peer_id)
		end
	end

	if server_state == "undetermined" then
		return false, true
	end

	if peer_state == "undetermined" then
		return false, true
	end

	local match = nil
	match = ((server_state ~= "banned" and peer_state ~= "banned") or false) and server_state == peer_state

	if not match then
		printf("[NetworkServer] Host EAC state is %s, peer %s's state is %s", server_state, peer_id, peer_state)
	end

	return true, match
end

NetworkServer._draw_peer_states = function (self)
	if DEDICATED_SERVER then
		local result = ""
		local pattern = "%-16s|%s\n"
		result = result .. string.format(pattern, "Peer", "State")

		for peer, sm in pairs(self.peer_state_machines) do
			result = result .. string.format(pattern, peer, tostring(sm.current_state))
		end

		if result ~= self._peer_states_string then
			self._peer_states_string = result

			cprint("-------------------------------------------------")
			cprint(result)
		end

		return
	end

	local font = "materials/fonts/arial"
	local font_material = "arial"
	local text_height = 20
	local row_height = 20
	local margin = 32
	local peer_width = 180
	local state_width = 224
	local background_color = Color(128, 0, 0, 0)
	local text_color = Color(255, 255, 255, 255)
	local _, height = Gui.resolution()
	local y = height - margin - text_height
	local world = Application.debug_world()

	if self._gui == nil then
		self._gui = World.create_screen_gui(world, "immediate", "material", "materials/fonts/gw_fonts")
	end

	Gui.rect(self._gui, Vector2(0, 0), Vector2(margin * 2 + peer_width + state_width, height), background_color)

	local x = margin

	Gui.text(self._gui, "Peer", font, text_height, font_material, Vector3(x, y, 0), text_color)

	x = x + peer_width

	Gui.text(self._gui, "State", font, text_height, font_material, Vector3(x, y, 0), text_color)

	y = y - 4

	Gui.rect(self._gui, Vector2(margin, y), Vector2(peer_width + state_width, 1), text_color)

	y = y - row_height

	for peer, sm in pairs(self.peer_state_machines) do
		x = margin

		Gui.text(self._gui, peer, font, text_height, font_material, Vector3(x, y, 0), text_color)

		x = x + peer_width

		Gui.text(self._gui, tostring(sm.current_state), font, text_height, font_material, Vector3(x, y, 0), text_color)

		y = y - row_height
	end
end

NetworkServer.rpc_clear_peer_state = function (self, sender)
	print(string.format("### CLEARING PEER STATE FOR %s", tostring(sender)))

	local state_machine = self.peer_state_machines[sender]

	if state_machine == nil then
		local reason = nil

		if self.level_key == "prologue" then
			reason = NetworkLookup.connection_fails.host_plays_prologue
		else
			reason = NetworkLookup.connection_fails.unknown_error
		end

		RPC.rpc_connection_failed(sender, reason)

		return
	end

	state_machine.state_data:change_state(PeerStates.Connecting)

	local players_by_peer = Managers.player:players_at_peer(sender)

	if not players_by_peer then
		return
	end

	for _, player in pairs(players_by_peer) do
		local local_player_id = player:local_player_id()
		local profile_index, career_index = self.profile_synchronizer:profile_by_peer(sender, local_player_id)

		if profile_index then
			self.profile_synchronizer:unassign_peer_to_profile(sender, local_player_id, profile_index, career_index)
		end
	end
end

NetworkServer._update_reserve_slots = function (self, dt)
	local reserved_slots = self._reserved_slots

	for peer_id, time in pairs(reserved_slots) do
		reserved_slots[peer_id] = time - dt

		if reserved_slots[peer_id] <= 0 then
			self:remove_reserved_slot(peer_id)
		end
	end
end

NetworkServer.add_reserve_slot = function (self, peer_id)
	printf("[NetworkServer] Reserved slot for peer (%s) for 15 seconds", peer_id)

	self._reserved_slots[peer_id] = 15
end

NetworkServer.remove_reserved_slot = function (self, peer_id)
	self._reserved_slots[peer_id] = nil
end

NetworkServer.is_reserved = function (self, peer_id)
	return self._reserved_slots[peer_id] ~= nil
end

NetworkServer.num_reserved_slots = function (self)
	return table.size(self._reserved_slots)
end

NetworkServer.players_past_connecting = function (self)
	local peers = FrameTable.alloc_table()

	for peer, sm in pairs(self.peer_state_machines) do
		local is_past_connecting = sm.current_state ~= PeerStates.Connecting and sm.current_state ~= PeerStates.Disconnecting and sm.current_state ~= PeerStates.Disconnected

		if is_past_connecting then
			peers[#peers + 1] = peer
		end
	end

	return peers
end

NetworkServer.player_is_joining = function (self, peer_id)
	local peer_state_machines = self.peer_state_machines
	local peer_state_machine = peer_state_machines[peer_id]

	if not peer_state_machine then
		return false
	end

	local joining = peer_state_machine.current_state == PeerStates.Connecting or peer_state_machine.current_state == PeerStates.Loading or peer_state_machine.current_state == PeerStates.LoadingProfilePackages or peer_state_machine.current_state == PeerStates.WaitingForEnterGame or peer_state_machine.current_state == PeerStates.WaitingForGameObjectSync

	return joining
end

local dummy_ignore_map = {}

NetworkServer.are_all_peers_ingame = function (self, ignore_map)
	ignore_map = ignore_map or dummy_ignore_map
	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		local state_name = peer_state_machine.current_state.state_name

		if ignore_map[peer_id] == nil and state_name ~= "InGame" and state_name ~= "InPostGame" and state_name ~= "Disconnected" and state_name ~= "Disconnecting" then
			return false
		end
	end

	return true
end

NetworkServer.disconnect_joining_peers = function (self)
	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		local state_name = peer_state_machine.current_state.state_name

		if state_name ~= "InGame" and state_name ~= "InPostGame" and state_name ~= "Disconnected" and state_name ~= "Disconnecting" then
			self:disconnect_peer(peer_id, "host_left_game")
		end
	end
end

NetworkServer.is_peer_ingame = function (self, peer_id)
	local peer_state_machines = self.peer_state_machines
	local peer_state_machine = peer_state_machines[peer_id]
	local state_name = peer_state_machine and peer_state_machine.current_state.state_name

	return state_name == "InGame"
end

NetworkServer.are_all_peers_ready = function (self)
	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		local state_name = peer_state_machine.current_state.state_name

		if state_name ~= "WaitingForPlayers" and state_name ~= "InGame" and state_name ~= "Disconnected" then
			return false
		end
	end

	return true
end

NetworkServer.all_client_peers_disconnected = function (self)
	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		local state_name = peer_state_machine.current_state.state_name
		local client = peer_id ~= self.my_peer_id

		if client and state_name ~= "Disconnected" then
			return false
		end
	end

	return true
end

NetworkServer.waiting_to_enter_game = function (self)
	if DEDICATED_SERVER then
		return true
	end

	local peer_state_machine = self.peer_state_machines[self.my_peer_id]

	if not peer_state_machine then
		return false
	end

	if peer_state_machine.current_state.state_name == "WaitingForEnterGame" then
		return true
	end

	return false
end

NetworkServer.disconnected = function (self)
	local peer_state_machines = self.peer_state_machines
	local my_peer_id = self.my_peer_id

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		if peer_id == my_peer_id then
			local state_name = peer_state_machine.current_state.state_name

			if state_name == "Disconnected" or state_name == "Disconnecting" then
				return true
			end
		end
	end

	return false
end

NetworkServer.peer_wanted_profile = function (self, peer_id, local_player_id)
	local peer_state_machine = self.peer_state_machines[peer_id]
	local state_data = peer_state_machine.state_data
	local wanted_profile_index = state_data.wanted_profile_index
	local wanted_career_index = state_data.wanted_career_index

	return wanted_profile_index, wanted_career_index
end

return
