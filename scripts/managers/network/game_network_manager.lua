local game_object_templates = dofile("scripts/network/game_object_templates")

local function debug_print(format, ...)
	if script_data.network_debug then
		printf("[GameNetworkManager] " .. format, ...)
	end

	return 
end

GameNetworkManager = class(GameNetworkManager)
local PING_SAMPLES_MAX_SIZE = 10
local PING_SAMPLE_INTERVAL = 1
GameNetworkManager.init = function (self, world, lobby, is_server, event_delegate)
	Network.create_game_session()

	local session = Network.game_session()

	assert(session, "Failed to create game session")

	self.game_session = session

	if is_server then
		GameSession.make_game_session_host(session)
	end

	self._world = world
	self._lobby = lobby
	self._lobby_host = lobby.lobby_host(lobby)
	self.is_server = is_server
	self._left_game = false
	self._session_id = math.uuid()
	self._game_object_types = {}
	self._object_synchronizing_clients = {}
	self._game_object_disconnect_callbacks = {}

	debug_print("Setting pong timeout to %s", tostring(GameSettingsDevelopment.network_timeout))
	Network.set_pong_timeout(GameSettingsDevelopment.network_timeout)
	dofile("scripts/network_lookup/network_constants")

	self.peer_id = Network.peer_id()

	debug_print("My own peer_id = ", tostring(self.peer_id))
	debug_print("self.is_server = %s", tostring(self.is_server))
	self.set_max_upload_speed(self, Application.user_setting("max_upload_speed") or DefaultUserSettings.get("user_settings", "max_upload_speed"))

	self._event_delegate = event_delegate

	event_delegate.register(event_delegate, self, "rpc_play_particle_effect", "rpc_gm_event_end_conditions_met", "rpc_gm_event_round_started", "rpc_surface_mtr_fx", "rpc_surface_mtr_fx_lvl_unit", "rpc_skinned_surface_mtr_fx", "rpc_play_melee_hit_effects", "game_object_created", "game_session_disconnect", "game_object_destroyed", "rpc_enemy_is_alerted", "rpc_assist", "rpc_coop_feedback", "rpc_ladder_shake", "rpc_set_boon_handler_game_object_fields")

	return 
end
GameNetworkManager.lobby = function (self)
	return self._lobby
end
GameNetworkManager.session_id = function (self)
	return self._session_id
end
GameNetworkManager.set_max_upload_speed = function (self, max_speed)
	if self.is_server then
		local max_num_peers = 3
		local min_per_peer = max_speed/max_num_peers

		debug_print("Network caps: min/peer %d kbps, total %d kbps", min_per_peer, max_speed)
		Network.enable_qos(min_per_peer, min_per_peer, max_speed)
	else
		debug_print("Network caps: min/peer %d kbps, total %d kbps", max_speed, max_speed)
		Network.enable_qos(max_speed, max_speed, max_speed)
	end

	return 
end
GameNetworkManager.set_entity_system = function (self, entity_system)
	self.entity_system = entity_system

	return 
end
GameNetworkManager.post_init = function (self, context)
	self.profile_synchronizer = context.profile_synchronizer
	self.game_mode = context.game_mode
	self.networked_flow_state = context.networked_flow_state
	self.room_manager = context.room_manager
	self.spawn_manager = context.spawn_manager
	self.network_clock = context.network_clock
	self.player_manager = context.player_manager
	local transmit = context.network_transmit
	self.network_transmit = transmit

	transmit.set_game_session(transmit, self.game_session)

	for peer_id, _ in pairs(self._object_synchronizing_clients) do
		transmit.add_peer_ignore(transmit, peer_id)
	end

	self.network_server = context.network_server
	self.statistics_db = context.statistics_db
	self.difficulty_manager = context.difficulty_manager
	self.voting_manager = context.voting_manager
	self.matchmaking_manager = context.matchmaking_manager
	self.game_server_manager = context.game_server_manager
	self._leaving_game = false

	return 
end
GameNetworkManager.set_unit_storage = function (self, unit_storage)
	self.unit_storage = unit_storage

	return 
end
GameNetworkManager.set_unit_spawner = function (self, unit_spawner)
	self.unit_spawner = unit_spawner

	return 
end
GameNetworkManager.in_game_session = function (self)
	local session = self.game_session

	if session and GameSession.in_session(session) then
		return true
	else
		return false
	end

	return 
end
GameNetworkManager.update_receive = function (self, dt)
	Profiler.start("GameNetworkManager:update_receive()")
	Network.update_receive(dt, self._event_delegate.event_table)

	local game_session = self.game_session

	if not game_session then
		Profiler.stop("GameNetworkManager:update_receive()")

		return 
	end

	if not self._game_session_host then
		if GameSession.in_session(game_session) then
			self._game_session_host = GameSession.game_session_host(game_session)
		else
			Profiler.stop("GameNetworkManager:update_receive()")

			return 
		end
	end

	if self._game_session_disconnect then
		debug_print("Game session disconnected, leaving game...")

		self._game_session_host = nil

		self.network_transmit:set_game_session(nil)

		self.game_session = nil
		self._left_game = true
	end

	Profiler.stop("GameNetworkManager:update_receive()")

	return 
end
GameNetworkManager.update_transmit = function (self, dt)
	Profiler.start("GameNetworkManager:update_transmit()")
	Network.update_transmit()
	Profiler.stop("GameNetworkManager:update_transmit()")

	return 
end
GameNetworkManager.update = function (self, dt)
	if self._shutdown_server_timer then
		self._shutdown_server_timer = self._shutdown_server_timer - dt
		local shutdown = self.network_server:all_client_peers_disconnected() or self._shutdown_server_timer < 0

		if shutdown then
			self.network_server:force_disconnect_all_client_peers()
			self._shutdown_server(self)

			self._shutdown_server_timer = nil
		end
	end

	if self._left_game and not self.in_game_session(self) and not self.game_session_shutdown then
		debug_print("No longer in game session, shutting it down.")
		Network.shutdown_game_session()

		self.game_session_shutdown = true
	end

	return 
end
GameNetworkManager.network_time = function (self)
	return self.network_clock:time()
end
GameNetworkManager._shutdown_server = function (self)
	debug_print("Shutting down game session host.")
	self.game_session_disconnect(self)
	GameSession.shutdown_game_session_host(self.game_session)

	self._game_session_host = nil

	self.network_transmit:set_game_session(nil)

	self.game_session = nil
	self._left_game = true

	return 
end
GameNetworkManager.force_disconnect_from_session = function (self)
	debug_print("Forcing disconnect_from_host()")
	GameSession.disconnect_from_host(self.game_session)

	return 
end
local SHUTDOWN_SERVER_TIMER = 2
GameNetworkManager.leave_game = function (self, force_disconnect)
	debug_print("Leaving game...")

	self._leaving_game = true
	self.ignore_lobby_rpcs = force_disconnect

	if self.is_server then
		if force_disconnect then
			self._shutdown_server_timer = SHUTDOWN_SERVER_TIMER
		else
			self._shutdown_server(self)
		end
	else
		local local_players = Managers.player:players_at_peer(Network.peer_id())

		for _, player in pairs(local_players) do
			player.despawn(player)
			printf("despawning player %s", player.name(player))
		end

		GameSession.leave(self.game_session)
	end

	return 
end
GameNetworkManager.has_left_game = function (self)
	return self._left_game
end
GameNetworkManager.is_leaving_game = function (self)
	return self._leaving_game
end
GameNetworkManager.destroy = function (self)
	for peer_id, _ in pairs(self._object_synchronizing_clients) do
		self.network_transmit:remove_peer_ignore(peer_id)
	end

	self._event_delegate:unregister(self)

	self._event_delegate = nil
	self.entity_system = nil
	self.game_mode = nil
	self.networked_flow_state = nil
	self.room_manager = nil
	self.spawn_manager = nil
	self.network_clock = nil
	self.profile_synchronizer = nil
	self._lobby = nil
	self._game_object_disconnect_callbacks = nil
	self._world = nil
	self.network_transmit = nil
	self.network_server = nil

	GarbageLeakDetector.register_object(self, "Network Manager")

	if not self.game_session_shutdown then
		debug_print("Shutting down game session")
		Network.shutdown_game_session()
	end

	return 
end
GameNetworkManager.game = function (self)
	return self.game_session
end
GameNetworkManager.game_object_or_level_unit = function (self, unit_id, is_level_unit)
	if is_level_unit then
		local level = LevelHelper:current_level(self._world)
		local level_unit = Level.unit_by_index(level, unit_id)

		return level_unit
	else
		local network_unit = Managers.state.unit_storage:unit(unit_id)

		return network_unit
	end

	return 
end
GameNetworkManager.game_object_or_level_id = function (self, unit)
	local go_id = Managers.state.unit_storage:go_id(unit)

	if go_id ~= nil then
		return go_id, false
	end

	local level = LevelHelper:current_level(self._world)
	local level_index = Level.unit_index(level, unit)

	if level_index then
		return level_index, true
	end

	return 
end
GameNetworkManager.level_object_id = function (self, unit)
	local current_level = LevelHelper:current_level(self._world)

	return Level.unit_index(current_level, unit)
end
GameNetworkManager.unit_game_object_id = function (self, unit)
	local go_id = self.unit_storage:go_id(unit)

	if go_id then
		return go_id
	end

	return 
end
GameNetworkManager.game_object_template = function (self, go_type)
	return game_object_templates[go_type]
end
GameNetworkManager.spawn_peer_player = function (self, peer_id, local_player_id, clan_tag)
	assert(self.is_server)

	local player_manager = self.player_manager
	local player_controlled = true
	local player = nil

	if peer_id == self.peer_id then
		player = player_manager.player(player_manager, peer_id, local_player_id)
	else
		local room_manager = self.room_manager

		if room_manager then
			if room_manager.has_room(room_manager, peer_id) then
				room_manager.destroy_room(room_manager, peer_id, false)
			end

			room_manager.create_room(room_manager, peer_id, local_player_id)
		end

		if not player_manager.player_exists(player_manager, peer_id, local_player_id) then
			debug_print("ADDING REMOTE PLAYER FOR PEER %s", peer_id)

			player = player_manager.add_remote_player(player_manager, peer_id, player_controlled, local_player_id, clan_tag)

			player.create_boon_handler(player, self._world)
			self.network_transmit:send_rpc("rpc_to_client_session_synch", peer_id, self._session_id)
		end
	end

	Managers.state.spawn:ready_to_spawn(peer_id, local_player_id)

	return 
end
GameNetworkManager.create_game_object = function (self, object_template, data_table, session_disconnect_callback)
	local game_object_id = GameSession.create_game_object(self.game_session, object_template, data_table)
	self._game_object_types[game_object_id] = object_template
	self._game_object_disconnect_callbacks[game_object_id] = session_disconnect_callback

	debug_print("Created game object of type '%s' with go_id=%d", object_template, game_object_id)

	return game_object_id
end
GameNetworkManager.create_player_game_object = function (self, profile, data_table, session_disconnect_callback)
	assert(self.is_server, "create_player_game_object: FAIL")

	local go_id = GameSession.create_game_object(self.game_session, profile, data_table)
	self._game_object_types[go_id] = "player"
	self._game_object_disconnect_callbacks[go_id] = session_disconnect_callback

	debug_print("Created player game object of type '%s' with go_id=%d", profile, go_id)

	return go_id
end
GameNetworkManager.cb_spawn_point_game_object_created = function (self, go_id, owner_id)
	Managers.state.event:trigger("event_create_client_spawnpoint", go_id)

	if script_data.spawn_debug then
		print("spawn created", go_id)
	end

	return 
end
GameNetworkManager.game_object_created_player = function (self, go_id, owner_peer_id)
	assert(not self.is_server, "game_object_created_player: FAIL")

	local peer_id = GameSession.game_object_field(self.game_session, go_id, "network_id")
	local local_player_id = GameSession.game_object_field(self.game_session, go_id, "local_player_id")

	debug_print("game_object_created_player, go_id=%d, owner_peer_id=%s peer_id=%s", go_id, owner_peer_id, peer_id)

	local player_manager = self.player_manager

	if peer_id == self.peer_id then
		debug_print("PLAYER is local player")

		local player = player_manager.player(player_manager, peer_id, local_player_id)

		player.set_game_object_id(player, go_id)
		player.create_boon_handler(player, self._world)

		local stats_id = player.stats_id(player)

		self.statistics_db:sync_stats_to_server(stats_id, peer_id, local_player_id, self.network_transmit)
		debug_print("PLAYER TYPE: %s", player.type(player))
	else
		debug_print("PLAYER ADDED go_id = %d, peer_id = %s, self.peer_id = %s", go_id, peer_id, self.peer_id)

		local player_controlled = GameSession.game_object_field(self.game_session, go_id, "player_controlled")

		debug_print("ADDING REMOTE PLAYER FOR PEER %s", peer_id)

		local player = player_manager.add_remote_player(player_manager, peer_id, player_controlled, local_player_id)

		player.set_game_object_id(player, go_id)
		player.create_boon_handler(player, self._world)
	end

	return 
end
GameNetworkManager.game_object_destroyed_player = function (self, go_id, owner_peer_id)
	local peer_id = GameSession.game_object_field(self.game_session, go_id, "network_id")
	local local_player_id = GameSession.game_object_field(self.game_session, go_id, "local_player_id")

	debug_print("game_object_destroyed_player, game_object_id=%i owner_peer_id=%s peer_id=%s", go_id, owner_peer_id, peer_id)

	local player_manager = self.player_manager

	if peer_id ~= self.peer_id then
		player_manager.remove_player(player_manager, peer_id, local_player_id)
		debug_print("removing peer_id=%s local_player_id=%d", peer_id, local_player_id)
	else
		debug_print("not removing peer_id=%s local_player_id=%d", peer_id, local_player_id)
	end

	return 
end
GameNetworkManager.game_object_created_player_unit_health = function (self, go_id, owner_peer_id)
	local health_extension = self._health_extension(self, go_id)

	if health_extension == nil then
		return 
	end

	health_extension.set_health_game_object_id(health_extension, go_id)

	return 
end
GameNetworkManager.game_object_destroyed_player_unit_health = function (self, go_id, owner_peer_id)
	local health_extension = self._health_extension(self, go_id)

	if health_extension == nil then
		return 
	end

	health_extension.set_health_game_object_id(health_extension, nil)

	return 
end
GameNetworkManager._health_extension = function (self, go_id)
	local player_unit_id = GameSession.game_object_field(self.game_session, go_id, "unit_game_object_id")
	local player_unit = self.unit_storage:unit(player_unit_id)

	if player_unit == nil then
		return nil
	end

	local health_extension = ScriptUnit.extension(player_unit, "health_system")

	return health_extension
end
GameNetworkManager.game_object_created = function (self, go_id, owner_id)
	local go_type_id = GameSession.game_object_field(self.game_session, go_id, "go_type")
	local go_type = NetworkLookup.go_types[go_type_id]
	local go_template = game_object_templates[go_type]
	local go_created_func_name = go_template.game_object_created_func_name
	local session_disconnect_func_name = go_template.game_session_disconnect_func_name

	if session_disconnect_func_name then
		local function cb(game_object_id)
			self[session_disconnect_func_name](self, game_object_id)

			return 
		end

		self._game_object_disconnect_callbacks[go_id] = cb
	end

	debug_print("game object created go_id=%d, owner_id=%s go_type=%s go_created_func_name=%s", go_id, owner_id, go_type, go_created_func_name)

	local go_created_func = self[go_created_func_name]

	assert(go_created_func)
	go_created_func(self, go_id, owner_id, go_template)

	return 
end
GameNetworkManager.game_object_created_network_unit = function (self, game_object_id, owner_id, go_template)
	self.unit_spawner:spawn_unit_from_game_object(game_object_id, owner_id, go_template)

	return 
end
GameNetworkManager.game_object_created_music_states = function (self, game_object_id, owner_id, go_template)
	Managers.music:game_object_created(game_object_id, owner_id, go_template)

	return 
end
GameNetworkManager.game_object_created_keep_decoration = function (self, game_object_id, owner_id, go_template)
	local unit_level_index = GameSession.game_object_field(self.game_session, game_object_id, "level_unit_index")
	local level = LevelHelper:current_level(self._world)
	local unit = Level.unit_by_index(level, unit_level_index)
	local decoration_system = Managers.state.entity:system("keep_decoration_system")

	decoration_system.on_game_object_created(decoration_system, unit, game_object_id)

	return 
end
GameNetworkManager.game_object_destroyed_keep_decoration = function (self, game_object_id, owner_id, go_template)
	local unit_level_index = GameSession.game_object_field(self.game_session, game_object_id, "level_unit_index")
	local level = LevelHelper:current_level(self._world)
	local unit = Level.unit_by_index(level, unit_level_index)
	local decoration_system = Managers.state.entity:system("keep_decoration_system")

	decoration_system.on_game_object_destroyed(decoration_system, unit)

	return 
end
GameNetworkManager.destroy_game_object = function (self, go_id)
	debug_print("destroying game object with go_id=%d", go_id)

	self._game_object_disconnect_callbacks[go_id] = nil

	GameSession.destroy_game_object(self.game_session, go_id)

	return 
end
GameNetworkManager.game_object_destroyed = function (self, go_id, owner_id)
	local go_type_id = GameSession.game_object_field(self.game_session, go_id, "go_type")
	local go_type = NetworkLookup.go_types[go_type_id]
	local go_template = game_object_templates[go_type]
	local go_destroyed_func_name = go_template.game_object_destroyed_func_name
	local go_destroyed_func = self[go_destroyed_func_name]

	go_destroyed_func(self, go_id, owner_id, go_template)

	self._game_object_disconnect_callbacks[go_id] = nil

	debug_print("game object was destroyed id=%d with type=%s, object_destroy_func=%s, owned by peer=%s", go_id, go_type, go_destroyed_func_name, owner_id)

	return 
end
GameNetworkManager.game_object_created_player_unit = function (self, go_id, owner_id, go_template)
	if self.is_server then
		self.network_server:peer_spawned_player(owner_id)
	end

	self.game_object_created_network_unit(self, go_id, owner_id, go_template)

	return 
end
GameNetworkManager.game_object_destroyed_player_unit = function (self, go_id, owner_id, go_template)
	local player_unit = self.unit_storage:unit(go_id)

	REMOVE_PLAYER_UNIT_FROM_LISTS(player_unit)

	if self.is_server then
		self.network_server:peer_despawned_player(owner_id)
	end

	self.game_object_destroyed_network_unit(self, go_id, owner_id, go_template)

	return 
end
GameNetworkManager.game_object_destroyed_network_unit = function (self, go_id, owner_id, go_template)
	self.unit_spawner:destroy_game_object_unit(go_id, owner_id, go_template)

	return 
end
GameNetworkManager.game_object_destroyed_music_states = function (self, go_id, owner_id, go_template)
	debug_print("MUSIC object destroyed")
	Managers.music:game_object_destroyed(go_id, owner_id, go_template)

	return 
end
GameNetworkManager.game_object_migrated_away = function (self, go_id, new_peer_id)
	assert(false, "Not implemented.")

	return 
end
GameNetworkManager.game_object_migrated_to_me = function (self, go_id, old_peer_id)
	assert(false, "Not implemented.")

	return 
end
GameNetworkManager.game_session_disconnect = function (self, host_id)
	debug_print("Engine called game_session_disconnect callback")

	self._game_session_disconnect = true

	for game_object_id, callback in pairs(self._game_object_disconnect_callbacks) do
		callback(game_object_id)
	end

	self.unit_spawner.game_session = nil

	return 
end
GameNetworkManager.game_session_disconnect_music_states = function (self, game_object_id)
	Managers.music:client_game_session_disconnect_music_states(game_object_id)

	return 
end
GameNetworkManager.game_object_destroyed_do_nothing = function (self)
	return 
end
GameNetworkManager.game_object_created_sync_unit = function (self, game_object_id, owner_id, go_template)
	Managers.state.entity:system("game_object_system"):game_object_created(game_object_id, owner_id, go_template)

	return 
end
GameNetworkManager.game_object_destroyed_sync_unit = function (self, go_id, owner_id, go_template)
	return 
end
GameNetworkManager.game_object_created_payload = function (self, game_object_id, owner_id, go_template)
	local unit_level_index = GameSession.game_object_field(self.game_session, game_object_id, "level_unit_index")
	local level = LevelHelper:current_level(self._world)
	local unit = Level.unit_by_index(level, unit_level_index)
	local extension = ScriptUnit.extension(unit, "payload_system")

	extension.set_game_object_id(extension, game_object_id)

	return 
end
GameNetworkManager.game_object_destroyed_payload = function (self, game_object_id)
	return 
end
GameNetworkManager.game_object_created_twitch_vote = function (self, game_object_id, owner_id, go_template)
	Managers.twitch:add_game_object_id(game_object_id)

	return 
end
GameNetworkManager.game_object_destroyed_twitch_vote = function (self, game_object_id)
	Managers.twitch:remove_game_object_id(game_object_id)

	return 
end
GameNetworkManager.remove_peer = function (self, peer_id)
	if self._object_synchronizing_clients[peer_id] then
		self._object_synchronizing_clients[peer_id] = nil

		self.network_transmit:remove_peer_ignore(peer_id)
	end

	if Managers.game_server ~= nil then
		Managers.game_server:remove_peer(peer_id)
	end

	self.player_manager:remove_all_players_from_peer(peer_id)

	if self.room_manager and self.room_manager:has_room(peer_id) then
		self.room_manager:destroy_room(peer_id)
	end

	return 
end
GameNetworkManager.set_peer_synchronizing = function (self, peer_id)
	self._object_synchronizing_clients[peer_id] = true

	self.network_transmit:add_peer_ignore(peer_id)

	return 
end
GameNetworkManager._hot_join_sync = function (self, peer_id)
	Profiler.start("hot_join_sync")

	if Managers.state.debug then
		Managers.state.debug:hot_join_sync(peer_id)
	end

	self.difficulty_manager:hot_join_sync(peer_id)
	self.entity_system:hot_join_sync(peer_id)
	self.game_mode:hot_join_sync(peer_id)
	self.networked_flow_state:hot_join_sync(peer_id)
	self.voting_manager:hot_join_sync(peer_id)
	self.statistics_db:hot_join_sync(peer_id)

	if self.matchmaking_manager then
		self.matchmaking_manager:hot_join_sync(peer_id)
	end

	if self.game_server_manager then
		self.game_server_manager:hot_join_sync(peer_id)
	end

	if self.room_manager then
		self.room_manager:hot_join_sync(peer_id)
	end

	if script_data.unlimited_ammo then
		RPC.rpc_toggle_unlimited_ammo(peer_id, true)
	end

	self._object_synchronizing_clients[peer_id] = nil

	self.network_transmit:remove_peer_ignore(peer_id)
	Profiler.stop("hot_join_sync")

	return 
end
GameNetworkManager.rpc_play_particle_effect = function (self, sender, effect_id, go_id, node_id, offset, rotation_offset, linked)
	if self.is_server then
		self.network_transmit:send_rpc_clients("rpc_play_particle_effect", effect_id, go_id, node_id, offset, rotation_offset, linked)
	end

	local unit = self.unit_storage:unit(go_id)
	local effect_name = NetworkLookup.effects[effect_id]

	Managers.state.event:trigger("event_play_particle_effect", effect_name, unit, node_id, offset, rotation_offset, linked)

	return 
end
GameNetworkManager.gm_event_end_conditions_met = function (self, reason, checkpoint_available, percentage_completed)
	local reason_id = NetworkLookup.game_end_reasons[reason]
	local percentage_completed = math.clamp(percentage_completed, 0, 1)

	self.network_transmit:send_rpc_clients("rpc_gm_event_end_conditions_met", reason_id, checkpoint_available, percentage_completed)

	return 
end
GameNetworkManager.rpc_gm_event_end_conditions_met = function (self, sender, reason_id, checkpoint_available, percentage_completed)
	local end_reason = NetworkLookup.game_end_reasons[reason_id]

	Managers.state.game_mode:set_end_reason(end_reason)
	Managers.state.game_mode:trigger_event("end_conditions_met", end_reason, checkpoint_available, percentage_completed)

	return 
end
GameNetworkManager.gm_event_round_started = function (self)
	self.network_transmit:send_rpc_clients("rpc_gm_event_round_started")

	return 
end
GameNetworkManager.rpc_gm_event_round_started = function (self, sender)
	Managers.state.game_mode:trigger_event("round_started")

	return 
end
GameNetworkManager.rpc_play_melee_hit_effects = function (self, sender, sound_event_id, hit_position, sound_type_id, unit_game_object_id)
	local hit_unit = self.unit_storage:unit(unit_game_object_id)

	if not Unit.alive(hit_unit) then
		return 
	end

	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_play_melee_hit_effects", sender, sound_event_id, hit_position, sound_type_id, unit_game_object_id)
	end

	local sound_event = NetworkLookup.sound_events[sound_event_id]
	local sound_type = NetworkLookup.melee_impact_sound_types[sound_type_id]

	EffectHelper.play_melee_hit_effects(sound_event, self._world, hit_position, sound_type, true, hit_unit)

	return 
end
GameNetworkManager.rpc_set_boon_handler_game_object_fields = function (self, sender, player_game_object_id, name_ids, remaining_durations)
	local players = Managers.player:human_players()

	for _, player in pairs(players) do
		if player.game_object_id == player_game_object_id then
			local boon_handler = player.boon_handler

			boon_handler.set_game_object_fields(boon_handler, name_ids, remaining_durations)

			break
		end
	end

	return 
end
GameNetworkManager.rpc_surface_mtr_fx = function (self, sender, effect_name_id, unit_game_object_id, position, rotation, normal, actor_index)
	local unit = self.unit_storage:unit(unit_game_object_id)

	if not Unit.alive(unit) then
		return 
	end

	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_surface_mtr_fx", sender, effect_name_id, unit_game_object_id, position, rotation, normal, actor_index)
	end

	local hit_actor = nil

	if 0 < actor_index then
		hit_actor = Unit.actor(unit, actor_index)
	end

	local effect_name = NetworkLookup.surface_material_effects[effect_name_id]

	EffectHelper.play_surface_material_effects(effect_name, self._world, unit, position, rotation, normal, nil, true, nil, hit_actor)

	return 
end
GameNetworkManager.rpc_surface_mtr_fx_lvl_unit = function (self, sender, effect_name_id, unit_level_index, position, rotation, normal, actor_index)
	local level = LevelHelper:current_level(self._world)
	local unit = Level.unit_by_index(level, unit_level_index)

	if not Unit.alive(unit) then
		return 
	end

	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_surface_mtr_fx_lvl_unit", sender, effect_name_id, unit_level_index, position, rotation, normal, actor_index)
	end

	local hit_actor = nil

	if 0 < actor_index then
		hit_actor = Unit.actor(unit, actor_index)
	end

	local effect_name = NetworkLookup.surface_material_effects[effect_name_id]

	EffectHelper.play_surface_material_effects(effect_name, self._world, unit, position, rotation, normal, nil, true, nil, hit_actor)

	return 
end
GameNetworkManager.rpc_skinned_surface_mtr_fx = function (self, sender, effect_name_id, position, rotation, normal)
	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_skinned_surface_mtr_fx", sender, effect_name_id, position, rotation, normal)
	end

	local effect_name = NetworkLookup.surface_material_effects[effect_name_id]

	EffectHelper.play_skinned_surface_material_effects(effect_name, self._world, nil, position, rotation, normal, true)

	return 
end
GameNetworkManager.game_session_host = function (self)
	return self.game_session and (self._game_session_host or GameSession.game_session_host(self.game_session))
end
GameNetworkManager.rpc_enemy_is_alerted = function (self, sender, unit_id, is_alerted)
	local unit = self.unit_storage:unit(unit_id)
	local category_name = "detect"

	if is_alerted then
		local head_node = Unit.node(unit, "c_head")
		local viewport_name = "player_1"
		local color_vector = Vector3(255, 0, 0)
		local offset_vector = Vector3(0, 0, 1)
		local text_size = 0.5
		local debug_start_string = "!"

		Managers.state.debug_text:output_unit_text(debug_start_string, text_size, unit, head_node, offset_vector, nil, category_name, color_vector, viewport_name)
	else
		local category_name = "detect"

		Managers.state.debug_text:clear_unit_text(unit, category_name)
	end

	return 
end
GameNetworkManager.rpc_ladder_shake = function (self, sender, unit_index)
	local unit = Level.unit_by_index(LevelHelper:current_level(self._world), unit_index)

	ScriptUnit.extension(unit, "ladder_system"):shake()

	return 
end
GameNetworkManager.rpc_assist = function (self, sender, savior_player_id, savior_local_player_id, saved_player_id, saved_local_player_id, predicate_id, enemy_unit_id)
	local player_manager = Managers.player
	local savior_player = player_manager.player(player_manager, savior_player_id, savior_local_player_id)
	local saved_player = player_manager.player(player_manager, saved_player_id, saved_local_player_id)
	local predicate = NetworkLookup.coop_feedback[predicate_id]
	local enemy_unit = self.unit_storage:unit(enemy_unit_id)
	local local_human = not savior_player.remote and not saved_player.bot_player

	Managers.state.event:trigger("add_coop_feedback", savior_player.stats_id(savior_player) .. saved_player.stats_id(saved_player), local_human, predicate, savior_player, saved_player)

	local savior_unit = savior_player.player_unit
	local saved_unit = saved_player.player_unit

	if saved_unit and not saved_player.remote then
		local buff_extension = ScriptUnit.has_extension(saved_unit, "buff_system")

		if buff_extension then
			buff_extension.trigger_procs(buff_extension, "on_assisted", savior_unit, enemy_unit)
		end
	end

	if savior_unit and not savior_player.remote then
		local savior_buff_extension = ScriptUnit.has_extension(savior_unit, "buff_system")

		if savior_buff_extension then
			savior_buff_extension.trigger_procs(savior_buff_extension, "on_assisted_ally", saved_unit, enemy_unit)
		end
	end

	if predicate == "save" then
		local savior_player_stats_id = savior_player.stats_id(savior_player)

		Managers.player:statistics_db():increment_stat(savior_player_stats_id, "saves")
	elseif predicate == "aid" then
		local savior_player_stats_id = savior_player.stats_id(savior_player)

		Managers.player:statistics_db():increment_stat(savior_player_stats_id, "aidings")
	end

	return 
end
GameNetworkManager.rpc_coop_feedback = function (self, sender, player1_peer_id, player1_local_player_id, predicate_id, player2_peer_id, player2_local_player_id)
	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_coop_feedback", sender, player1_peer_id, player1_local_player_id, predicate_id, player2_peer_id, player2_local_player_id)
	end

	local predicate = NetworkLookup.coop_feedback[predicate_id]
	local player_manager = Managers.player
	local player1 = player_manager.player(player_manager, player1_peer_id, player1_local_player_id)
	local player2 = player_manager.player(player_manager, player2_peer_id, player2_local_player_id)
	local local_human = not player1.remote and not player1.bot_player
	local statistics_db = Managers.player:statistics_db()

	if predicate == "aid" then
		statistics_db.increment_stat(statistics_db, player1.stats_id(player1), "aidings")
	elseif predicate == "save" then
		statistics_db.increment_stat(statistics_db, player1.stats_id(player1), "saves")
	end

	Managers.state.event:trigger("add_coop_feedback", player1.stats_id(player1) .. player2.stats_id(player2), local_human, predicate, player1, player2)

	return 
end
GameNetworkManager.anim_event = function (self, unit, event)
	local go_id = self.unit_storage:go_id(unit)

	fassert(go_id, "Unit storage does not have a game object id for %q", unit)

	local event_id = NetworkLookup.anims[event]

	if self.game_session then
		if self.is_server then
			self.network_transmit:send_rpc_clients("rpc_anim_event", event_id, go_id)
		else
			self.network_transmit:send_rpc_server("rpc_anim_event", event_id, go_id)
		end
	end

	Unit.animation_event(unit, event)

	return 
end
GameNetworkManager.specific_anim_event = function (self, unit, event, lookup_table)
	local go_id = self.unit_storage:go_id(unit)

	fassert(go_id, "Unit storage does not have a game object id for %q", unit)

	local event_id = lookup_table[event]

	if self.game_session then
		if self.is_server then
			self.network_transmit:send_rpc_clients("rpc_anim_event", event_id, go_id)
		else
			self.network_transmit:send_rpc_server("rpc_anim_event", event_id, go_id)
		end
	end

	Unit.animation_event(unit, event)

	return 
end
GameNetworkManager.anim_event_with_variable_float = function (self, unit, event, variable_name, variable_value)
	local go_id = self.unit_storage:go_id(unit)

	fassert(go_id, "Unit storage does not have a game object id for %q", unit)

	local event_id = NetworkLookup.anims[event]
	local variable_id = NetworkLookup.anims[variable_name]

	if self.game_session then
		if self.is_server then
			self.network_transmit:send_rpc_clients("rpc_anim_event_variable_float", event_id, go_id, variable_id, variable_value)
		else
			self.network_transmit:send_rpc_server("rpc_anim_event_variable_float", event_id, go_id, variable_id, variable_value)
		end
	end

	local variable_index = Unit.animation_find_variable(unit, variable_name)

	Unit.animation_set_variable(unit, variable_index, variable_value)
	Unit.animation_event(unit, event)

	return 
end
GameNetworkManager.anim_set_variable_float = function (self, unit, variable_name, variable_value)
	local go_id = self.unit_storage:go_id(unit)

	fassert(go_id, "Unit storage does not have a game object id for %q", unit)

	local variable_id = NetworkLookup.anims[variable_name]

	if self.game_session then
		if self.is_server then
			self.network_transmit:send_rpc_clients("rpc_anim_set_variable_float", go_id, variable_id, variable_value)
		else
			self.network_transmit:send_rpc_server("rpc_anim_set_variable_float", go_id, variable_id, variable_value)
		end
	end

	local variable_index = Unit.animation_find_variable(unit, variable_name)

	Unit.animation_set_variable(unit, variable_index, variable_value)

	return 
end

if LEVEL_EDITOR_TEST then
	GameNetworkManager.anim_event = function (self, unit, event)
		Unit.animation_event(unit, event)

		return 
	end
	GameNetworkManager.anim_event_with_variable_float = function (self, unit, event, variable_name, variable_value)
		local variable_index = Unit.animation_find_variable(unit, variable_name)

		Unit.animation_set_variable(unit, variable_index, variable_value)
		Unit.animation_event(unit, event)

		return 
	end
end

return 
