require("scripts/network/peer_state_machine")
require("scripts/network/connection_handler")
require("scripts/network/voip")
require("scripts/game_state/components/profile_synchronizer")
require("scripts/game_state/components/slot_allocator")
require("scripts/settings/profiles/sp_profiles")

local NUM_PROFILES = #SPProfiles
local DISCONNECT_TIMER = 4
local KICK_PEER_WAIT_TIMER = 5

local function network_printf(format, ...)
	if script_data.network_debug_connections then
		printf("[NetworkServer] " .. format, ...)
	end

	return 
end

PeerState = PeerState or CreateStrictEnumTable("Broken", "Connecting", "Connected", "Disconnected", "Loading", "LoadingLevelComplete", "WaitingForEnter", "WaitingForGameObjectSync", "WaitingForSpawnPlayer", "InGame", "InPostGame")
NetworkServer = class(NetworkServer)
NetworkServer.init = function (self, player_manager, lobby_host, initial_level, wanted_profile_index, level_transition_handler, game_server_manager)
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

	self.set_current_level(self, initial_level)

	local is_server = true
	self.profile_synchronizer = ProfileSynchronizer:new(is_server, lobby_host, self)
	local voip_params = {
		is_server = is_server,
		my_peer_id = my_peer_id,
		connection_handler = self.connection_handler,
		lobby = lobby_host
	}
	self.voip = Voip:new(voip_params)
	self._reserved_slots = {}
	self.wanted_profile_index = wanted_profile_index

	if rawget(_G, "EAC") then
		local server_name = nil

		if DEDICATED_SERVER then
			server_name = self.lobby_host:server_name()
		elseif rawget(_G, "Steam") then
			server_name = Steam.user_name()
		else
			server_name = "lan"
		end

		self._eac_server = EACServer.create(server_name)
		self._eac_peer_ids = {}
		self._using_eac = true
	end

	rawset(_G, "server", self)

	return 
end
NetworkServer.server_join = function (self)
	print(string.format("### Created peer state machine for %s", self.my_peer_id))

	local peer_id = self.my_peer_id
	self.peer_state_machines[peer_id] = PeerStateMachine.create(self, peer_id)

	return 
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
NetworkServer.rpc_notify_connected = function (self, sender)
	if sender == self.my_peer_id then
		local profile_index = nil
		local level_settings = self.level_key and LevelSettings[self.level_key]
		profile_index = (not level_settings or level_settings.game_mode ~= "tutorial" or self.wanted_profile_index) and (wanted_profile_index or self.profile_synchronizer:get_first_free_profile())

		self.peer_state_machines[sender].rpc_notify_lobby_joined(profile_index)
	end

	return 
end
NetworkServer.rpc_notify_in_post_game = function (self, sender, in_post_game)
	if sender == self.my_peer_id then
		local peer_state_machine = self.peer_state_machines[sender]

		if peer_state_machine.has_function(peer_state_machine, "rpc_post_game_notified") then
			peer_state_machine.rpc_post_game_notified(in_post_game)
		end
	end

	return 
end
NetworkServer.rpc_game_started = function (self, sender)
	if sender == self.my_peer_id then
		Managers.state.event:trigger("game_started")
	end

	return 
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

	return 
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

	return 
end
NetworkServer.rpc_to_client_spawn_player = function (self, sender, ...)
	if sender == self.my_peer_id then
	end

	return 
end
NetworkServer.set_current_level = function (self, level_key)
	network_printf("Current level key %s", level_key)
	self.level_transition_handler:generate_level_seed()

	self.level_key = level_key

	return 
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

	return 
end
NetworkServer.rpc_is_ingame = function (self, sender)
	local peer_state_machine = self.peer_state_machines[sender]

	if not peer_state_machine or not peer_state_machine.has_function(peer_state_machine, "rpc_is_ingame") then
		network_printf("RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)", "rpc_is_ingame")
		RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)
	else
		peer_state_machine.rpc_is_ingame()
	end

	return 
end
NetworkServer.rpc_loading_synced = function (self, sender)
	return 
end
NetworkServer.peer_spawned_player = function (self, peer_id)
	network_printf("Peer %s spawned player.", peer_id)

	local peer_state_machine = self.peer_state_machines[peer_id]

	if peer_state_machine.has_function(peer_state_machine, "spawned_player") then
		peer_state_machine.spawned_player()
	end

	return 
end
NetworkServer.peer_despawned_player = function (self, peer_id)
	network_printf("Peer %s despawned player.", peer_id)

	local peer_state_machine = self.peer_state_machines[peer_id]

	if peer_state_machine.has_function(peer_state_machine, "despawned_player") then
		peer_state_machine.despawned_player()
	end

	return 
end
NetworkServer.peer_respawn_player = function (self, peer_id)
	network_printf("Peer %s respawn player.", peer_id)

	local peer_state_machine = self.peer_state_machines[peer_id]

	if peer_state_machine.has_function(peer_state_machine, "respawn_player") then
		peer_state_machine.respawn_player()
	end

	return 
end
NetworkServer.rpc_client_respawn_player = function (self, sender)
	self.peer_respawn_player(self, sender)

	return 
end
NetworkServer.destroy = function (self)
	if self._using_eac then
		EACServer.destroy(self._eac_server)

		self._eac_server = nil
	end

	if self.network_event_delegate then
		self.unregister_rpcs(self)
	end

	self.voip:destroy()

	self.voip = nil

	self.profile_synchronizer:destroy()

	self.profile_synchronizer = nil

	self.connection_handler:update(0)
	GarbageLeakDetector.register_object(self, "NetworkServer")

	if self._gui ~= nil then
		World.destroy_gui(Application.debug_world(), self._gui)

		self._gui = nil
	end

	return 
end
NetworkServer.register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate.register(network_event_delegate, self, "rpc_client_connection_state", "rpc_notify_lobby_joined", "rpc_to_client_spawn_player", "rpc_post_game_notified", "rpc_want_to_spawn_player", "rpc_level_loaded", "rpc_game_started", "rpc_is_ingame", "game_object_sync_done", "rpc_notify_connected", "rpc_loading_synced", "rpc_clear_peer_state", "rpc_notify_in_post_game", "rpc_client_respawn_player")

	self.network_event_delegate = network_event_delegate

	self.profile_synchronizer:register_rpcs(network_event_delegate, network_transmit)

	self.network_transmit = network_transmit

	self.voip:register_rpcs(network_event_delegate, network_transmit)

	return 
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
	self.unregister_rpcs(self)

	self.game_network_manager = nil
	self.game_session = nil

	return 
end
NetworkServer.unregister_rpcs = function (self)
	self.voip:unregister_rpcs()

	if self.network_event_delegate then
		self.network_event_delegate:unregister(self)

		self.network_event_delegate = nil
	end

	self.profile_synchronizer:unregister_network_events()

	self.network_transmit = nil

	return 
end
NetworkServer.has_all_peers_loaded_packages = function (self)
	return self.profile_synchronizer:all_synced()
end
NetworkServer.kick_peer = function (self, peer_id)
	self.network_transmit:send_rpc("rpc_kick_peer", peer_id)

	self.kicked_peers_disconnect_timer[peer_id] = KICK_PEER_WAIT_TIMER

	return 
end
NetworkServer.update_disconnect_kicked_peers_by_time = function (self, dt)
	local kicked_peers_disconnect_timer = self.kicked_peers_disconnect_timer

	for peer_id, time_left in pairs(kicked_peers_disconnect_timer) do
		if time_left == 0 then
			kicked_peers_disconnect_timer[peer_id] = nil

			self.force_disconnect_client_by_peer_id(self, peer_id)
		else
			kicked_peers_disconnect_timer[peer_id] = math.max(time_left - dt, 0)
		end
	end

	return 
end
NetworkServer.disconnect_all_peers = function (self, reason)
	local reason_id = NetworkLookup.connection_fails[reason]
	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		if peer_state_machine.current_state ~= PeerStates.Disconnecting and peer_state_machine.current_state ~= PeerStates.Disconnected then
			RPC.rpc_connection_failed(peer_id, reason_id)
		end
	end

	return 
end
NetworkServer.disconnect_peer = function (self, peer_id, reason)
	local reason_id = NetworkLookup.connection_fails[reason]
	local peer_state_machine = self.peer_state_machines[peer_id]
	local current_state = peer_state_machine.current_state

	if current_state ~= PeerStates.Disconnecting and current_state ~= PeerStates.Disconnected then
		RPC.rpc_connection_failed(peer_id, reason_id)
	end

	return 
end
NetworkServer.force_disconnect_all_client_peers = function (self)
	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		local client = peer_id ~= self.my_peer_id

		if client and peer_state_machine.current_state ~= PeerStates.Disconnecting and peer_state_machine.current_state ~= PeerStates.Disconnected then
			peer_state_machine.state_data:change_state(PeerStates.Disconnecting)
		end
	end

	return 
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

	return 
end
NetworkServer.rpc_client_connection_state = function (self, sender, peer_id, peer_state)
	return 
end
NetworkServer.rpc_notify_lobby_joined = function (self, sender, wanted_profile_index, clan_tag)
	network_printf("Peer %s has sent rpc_notify_lobby_joined", tostring(sender))

	local peer_state_machine = self.peer_state_machines[sender]

	if not peer_state_machine or not peer_state_machine.has_function(peer_state_machine, "rpc_notify_lobby_joined") then
		network_printf("RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)", "rpc_notify_lobby_joined")
		RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)
	else
		peer_state_machine.rpc_notify_lobby_joined(wanted_profile_index, clan_tag)

		if self._using_eac and sender ~= self.my_peer_id then
			self._add_peer_to_eac(self, sender)
		end
	end

	return 
end
NetworkServer.rpc_post_game_notified = function (self, sender, in_post_game)
	network_printf("Peer %s has sent rpc_post_game_notified", tostring(sender))

	local peer_state_machine = self.peer_state_machines[sender]

	if not peer_state_machine or not peer_state_machine.has_function(peer_state_machine, "rpc_post_game_notified") then
		network_printf("RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)", "rpc_post_game_notified")
		RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_join)
	else
		peer_state_machine.rpc_post_game_notified(in_post_game)
	end

	return 
end
NetworkServer.rpc_level_loaded = function (self, sender, level_id)
	print("### Sending rpc_level_loaded")

	local peer_state_machine = self.peer_state_machines[sender]

	if not peer_state_machine then
		network_printf("RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_enter_game)", "rpc_level_loaded")
		RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_enter_game)
	else
		print(string.format("#### Has state machine: %s, sender: %s, level_id: %s", peer_state_machine.has_function(peer_state_machine, "rpc_level_loaded"), sender, level_id))

		if peer_state_machine.has_function(peer_state_machine, "rpc_level_loaded") then
			peer_state_machine.rpc_level_loaded(level_id)
		end
	end

	return 
end
NetworkServer.rpc_want_to_spawn_player = function (self, sender)
	local peer_state_machine = self.peer_state_machines[sender]

	if not peer_state_machine or not peer_state_machine.has_function(peer_state_machine, "rpc_want_to_spawn_player") then
		network_printf("RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_enter_game)", "rpc_want_to_spawn_player")
		RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.no_peer_data_on_enter_game)
	else
		peer_state_machine.rpc_want_to_spawn_player()
	end

	return 
end
NetworkServer.cb_eac_auth = function (self, peer_id, info)
	local peer_state_machine = self.peer_state_machines[peer_id]

	if not peer_state_machine or not peer_state_machine.has_function(peer_state_machine, "cb_eac_auth") then
		network_printf("EAC auth failed")
		RPC.rpc_connection_failed(sender, NetworkLookup.connection_fails.eac_authorize_failed)
	else
		peer_state_machine.cb_eac_auth(info)
	end

	return 
end
NetworkServer.game_object_sync_done = function (self, peer_id)
	network_printf("Game_object_sync_done for peer %s", peer_id)

	self.peers_completed_game_object_sync[peer_id] = true

	self.game_network_manager:_hot_join_sync(peer_id)
	RPC.rpc_set_migration_host(peer_id, self.host_to_migrate_to or "", (self.host_to_migrate_to and true) or false)

	return 
end
NetworkServer.update = function (self, dt)
	self.profile_synchronizer:update()

	local connection_handler = self.connection_handler
	local peer_state_machines = self.peer_state_machines
	local new_connections = connection_handler.update(connection_handler, dt)

	for peer_id, _ in pairs(new_connections) do
		network_printf("New connection detected in NetworkServer from %q", peer_id)
	end

	local lobby_members = self.lobby_host:members()

	if lobby_members then
		local members_joined = lobby_members.get_members_joined(lobby_members)

		for i, peer_id in ipairs(members_joined) do
			if peer_id ~= self.lobby_host:lobby_host() then
				network_printf("Peer %s joined server lobby.", peer_id)
				network_printf("Creating peer info.")

				peer_state_machines[peer_id] = PeerStateMachine.create(self, peer_id)
				local sender = (rawget(_G, "Steam") and Steam.user_name(peer_id)) or tostring(peer_id)

				Managers.chat:send_system_chat_message_to_all_except(1, "system_chat_player_joined_the_game", sender, peer_id, true)
			end
		end

		local members_left = lobby_members.get_members_left(lobby_members)

		for i, peer_id in ipairs(members_left) do
			network_printf("Peer %s left server lobby.", peer_id)

			local sender = (rawget(_G, "Steam") and Steam.user_name(peer_id)) or tostring(peer_id)

			Managers.chat:send_system_chat_message_to_all_except(1, "system_chat_player_left_the_game", sender, peer_id, true)

			local peer_state_machine = peer_state_machines[peer_id]

			if peer_state_machine and peer_state_machine.current_state ~= PeerStates.Disconnecting and peer_state_machine.current_state ~= PeerStates.Disconnected then
				network_printf("Disconnecting peer.")
				peer_state_machine.state_data:change_state(PeerStates.Disconnecting)
			end
		end
	end

	local broken_connections, broken_connections_n = connection_handler.get_broken_connections(connection_handler)

	for i = 1, broken_connections_n, 1 do
		local peer_id = broken_connections[i]
		local peer_state_machine = peer_state_machines[peer_id]

		if peer_state_machine and peer_state_machine.current_state ~= PeerStates.Disconnecting and peer_state_machine.current_state ~= PeerStates.Disconnected then
			peer_state_machine.state_data:change_state(PeerStates.Disconnecting)
			network_printf("Broken connection to peer id %s discovered in connection handler. Server selecting peer to disconnect.", peer_id)
		end

		broken_connections[peer_id] = nil
	end

	local game_session = self.game_network_manager and self.game_network_manager:game()

	if game_session then
		local peer_id = GameSession.wants_to_leave(game_session)
		local peer_state_machine = peer_state_machines[peer_id]

		if peer_state_machine and peer_state_machine.current_state ~= PeerStates.Disconnecting and peer_state_machine.current_state ~= PeerStates.Disconnected then
			peer_state_machine.state_data:change_state(PeerStates.Disconnecting)
		end
	end

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		peer_state_machine.update(peer_state_machine, dt)
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

		if host_to_migrate_to ~= self.host_to_migrate_to then
			self.host_to_migrate_to = host_to_migrate_to

			self.network_transmit:send_rpc_clients("rpc_set_migration_host", host_to_migrate_to or "", (host_to_migrate_to and true) or false)
		end
	end

	self._update_reserve_slots(self, dt)
	self.update_disconnect_kicked_peers_by_time(self, dt)

	if self._using_eac then
		EACServer.update(self._eac_server)
		self._update_eac_match(self, dt)
	end

	if self.lobby_host:is_joined() then
		local lobby_members = self.lobby_host:members()
		local members = lobby_members.get_members(lobby_members)
		local num_members = #members
		local lobby_data = self.lobby_host:get_stored_lobby_data()

		if num_members ~= lobby_data.num_players then
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
		self._draw_peer_states(self)
	end

	return 
end
NetworkServer._add_peer_to_eac = function (self, peer_id)
	EACServer.add_peer(self._eac_server, peer_id)

	self._eac_peer_ids[peer_id] = {
		eac_match_timer = 0,
		updated = false
	}

	return 
end
NetworkServer._remove_peer_from_eac = function (self, peer_id)
	EACServer.remove_peer(self._eac_server, peer_id)

	self._eac_peer_ids[peer_id] = nil

	return 
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
				local determined, can_play = self.eac_check_peer(self, peer_id)

				if can_play then
				else
					printf("[NetworkServer] Peer's EAC status doesn't match the server, disconnecting peer (%s)", peer_id)
					self.disconnect_peer(self, peer_id, "eac_authorize_failed")
					peer_state_machine.state_data:change_state(PeerStates.Disconnecting)
				end

				data.eac_match_timer = 10
			end
		end
	end

	for peer_id, data in pairs(eac_peer_ids) do
		if not data.update then
			self._remove_peer_from_eac(self, peer_id)
		end
	end

	return 
end
NetworkServer.eac_check_peer = function (self, peer_id)
	local server_state, peer_state = nil

	if DEDICATED_SERVER then
		local gs = Managers.game_server
		server_state = "untrusted"
		peer_state = EACServer.state(self._eac_server, peer_id)
	else
		local host = self.lobby_host
		server_state = EAC.state()

		if peer_id == self.my_peer_id then
			peer_state = server_state
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

	local font = "foundation/fonts/debug"
	local font_material = "debug"
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
		self._gui = World.create_screen_gui(world, "immediate", "material", font)
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

	return 
end
NetworkServer.rpc_clear_peer_state = function (self, sender)
	print(string.format("### CLEARING PEER STATE FOR %s", tostring(sender)))
	self.peer_state_machines[sender].state_data:change_state(PeerStates.Connecting)

	local players_by_peer = Managers.player:players_at_peer(sender)

	if not players_by_peer then
		return 
	end

	for _, player in pairs(players_by_peer) do
		local profile_index = self.profile_synchronizer:profile_by_peer(sender, player.local_player_id(player))

		if profile_index then
			self.profile_synchronizer:clear_ownership(profile_index)
		end
	end

	return 
end
NetworkServer._update_reserve_slots = function (self, dt)
	local reserved_slots = self._reserved_slots

	for peer_id, time in pairs(reserved_slots) do
		reserved_slots[peer_id] = time - dt

		if reserved_slots[peer_id] <= 0 then
			self.remove_reserved_slot(self, peer_id)
		end
	end

	return 
end
NetworkServer.add_reserve_slot = function (self, peer_id)
	printf("[NetworkServer] Reserved slot for peer (%s) for 15 seconds", peer_id)

	self._reserved_slots[peer_id] = 15

	return 
end
NetworkServer.remove_reserved_slot = function (self, peer_id)
	self._reserved_slots[peer_id] = nil

	return 
end
NetworkServer.is_reserved = function (self, peer_id)
	return self._reserved_slots[peer_id] ~= nil
end
NetworkServer.num_reserved_slots = function (self)
	return table.size(self._reserved_slots)
end
NetworkServer.player_is_joining = function (self, peer_id)
	local peer_state_machines = self.peer_state_machines
	local peer_state_machine = peer_state_machines[peer_id]

	if not peer_state_machine then
		return false
	end

	local joining = peer_state_machine.current_state == PeerStates.Connecting or peer_state_machine.current_state == PeerStates.Loading or peer_state_machine.current_state == PeerStates.LoadingProfilePackages or peer_state_machine.current_state == PeerStates.WaitingForEnterGame or peer_state_machine.current_state == PeerStates.WaitingForGameObjectSync or peer_state_machine.current_state == PeerStates.SpawningPlayer

	return joining
end
local dummy_ignore_map = {}
NetworkServer.are_all_peers_ingame = function (self, ignore_map)
	ignore_map = ignore_map or dummy_ignore_map
	local peer_state_machines = self.peer_state_machines

	for peer_id, peer_state_machine in pairs(peer_state_machines) do
		local state_name = peer_state_machine.current_state.state_name

		if ignore_map[peer_id] == nil and state_name ~= "InGame" and state_name ~= "InPostGame" and state_name ~= "Disconnected" then
			return false
		end
	end

	return true
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

		if state_name ~= "WaitingForPlayers" and state_name ~= "InGame" and state_name ~= "SpawningPlayer" and state_name ~= "Disconnected" then
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

return 
