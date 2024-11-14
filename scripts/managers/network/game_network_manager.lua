-- chunkname: @scripts/managers/network/game_network_manager.lua

local game_object_templates = dofile("scripts/network/game_object_templates")

local function debug_print(format, ...)
	if script_data.network_debug then
		printf("[GameNetworkManager] " .. format, ...)
	end
end

GameNetworkManager = class(GameNetworkManager)

local PING_SAMPLES_MAX_SIZE = 10
local PING_SAMPLE_INTERVAL = 1

GameNetworkManager.init = function (self, world, lobby, is_server, event_delegate)
	print("GameNetworkManager:init... creating game session")

	local session = Network.create_game_session()

	fassert(session, "Failed to create game session")

	self.game_session = session

	if is_server then
		printf("Host GameSession.make_game_session_host with session:", session)
		GameSession.make_game_session_host(session)

		self._session_id = Application.guid()
	else
		local game_session_host = GameSession.game_session_host(self.game_session)

		self._session_id = "<client-session-id>"

		if not game_session_host or game_session_host == "0" then
			game_session_host = lobby:lobby_host()
		end

		fassert(game_session_host and game_session_host ~= "0", "tried to join GameSession without a valid host.")

		local channel_id = PEER_ID_TO_CHANNEL[game_session_host]

		GameSession.join(session, channel_id)

		self._game_session_host = game_session_host
	end

	self._world = world
	self._lobby = lobby
	self._lobby_host = lobby:lobby_host()
	self.is_server = is_server
	self._left_game = false
	self._game_object_types = {}
	self._object_synchronizing_clients = {}
	self._game_object_disconnect_callbacks = {}

	debug_print("Setting pong timeout to %s", tostring(GameSettingsDevelopment.network_timeout))
	Network.set_pong_timeout(GameSettingsDevelopment.network_timeout)
	dofile("scripts/network_lookup/network_constants")

	self.peer_id = Network.peer_id()

	debug_print("My own peer_id = %s", tostring(self.peer_id))
	debug_print("self.is_server = %s", tostring(self.is_server))
	self:set_small_network_packets(Application.user_setting("small_network_packets") or DefaultUserSettings.get("user_settings", "small_network_packets"))

	self._event_delegate = event_delegate

	event_delegate:register(self, "rpc_play_particle_effect_no_rotation", "rpc_play_particle_effect", "rpc_play_particle_effect_with_variable", "rpc_play_particle_effect_spline", "rpc_gm_event_end_conditions_met", "rpc_gm_event_round_started", "rpc_gm_event_initial_peers_spawned", "rpc_surface_mtr_fx", "rpc_surface_mtr_fx_lvl_unit", "rpc_skinned_surface_mtr_fx", "rpc_play_melee_hit_effects", "game_object_created", "game_session_disconnect", "game_object_destroyed", "rpc_enemy_is_alerted", "rpc_assist", "rpc_coop_feedback", "rpc_ladder_shake", "rpc_request_spawn_network_unit", "rpc_flow_event")
end

GameNetworkManager.lobby = function (self)
	return self._lobby
end

GameNetworkManager.session_id = function (self)
	return self._session_id
end

GameNetworkManager.ping_by_peer = function (self, peer_id)
	fassert(self.is_server, "tried to fetch ping by peer id as a client")

	return self._lobby:ping_by_peer(peer_id)
end

GameNetworkManager.set_small_network_packets = function (self, enable)
	if enable then
		Network.limit_mtu(576)
	else
		Network.limit_mtu(65536)
	end
end

GameNetworkManager.set_entity_system = function (self, entity_system)
	self.entity_system = entity_system
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

	transmit:set_game_session(self.game_session)

	for peer_id, _ in pairs(self._object_synchronizing_clients) do
		transmit:add_peer_ignore(peer_id)
	end

	self.network_server = context.network_server
	self.network_client = context.network_client
	self.statistics_db = context.statistics_db
	self.difficulty_manager = context.difficulty_manager
	self.weave_manager = context.weave_manager
	self.voting_manager = context.voting_manager
	self.matchmaking_manager = context.matchmaking_manager
	self.game_server_manager = context.game_server_manager
	self._leaving_game = false
end

GameNetworkManager.set_unit_storage = function (self, unit_storage)
	self.unit_storage = unit_storage
end

GameNetworkManager.set_unit_spawner = function (self, unit_spawner)
	self.unit_spawner = unit_spawner
end

GameNetworkManager.in_game_session = function (self)
	local session = self.game_session

	if session and GameSession.in_session(session) then
		return true
	else
		return false
	end
end

GameNetworkManager.update_receive = function (self, dt)
	Network.update_receive(dt, self._event_delegate.event_table)

	local game_session = self.game_session

	if not game_session then
		return
	end

	self.network_transmit:update_receive()

	if not self._game_session_host and GameSession.in_session(game_session) then
		self._game_session_host = GameSession.game_session_host(game_session)
	end

	if self._game_session_disconnect then
		debug_print("Game session disconnected, leaving game...")

		self._game_session_host = nil

		self.network_transmit:set_game_session(nil)

		self.game_session = nil
		self._left_game = true
	end
end

GameNetworkManager.update_transmit = function (self, dt)
	Network.update_transmit()
end

GameNetworkManager.update = function (self, dt)
	if self.is_server and self:in_game_session() then
		local lobby = self._lobby
		local game_session = self.game_session
		local players = self.player_manager:human_players()
		local min_ping, max_ping = NetworkConstants.ping.min, NetworkConstants.ping.max

		for _, player in pairs(players) do
			local peer_id = player.peer_id

			if peer_id ~= self.peer_id then
				local game_object_id = player.game_object_id
				local ping_in_ms = math.clamp(math.floor(lobby:ping_by_peer(peer_id) * 1000), min_ping, max_ping)

				GameSession.set_game_object_field(game_session, game_object_id, "ping", ping_in_ms)
			end
		end
	end

	if self._shutdown_server_timer then
		self._shutdown_server_timer = self._shutdown_server_timer - dt

		local shutdown = self.network_server:all_client_peers_disconnected() or self._shutdown_server_timer < 0

		if shutdown then
			self.network_server:force_disconnect_all_client_peers()
			self:_shutdown_server()

			self._shutdown_server_timer = nil
		end
	end

	if self._left_game and not self:in_game_session() and not self.game_session_shutdown then
		debug_print("No longer in game session, shutting it down.")
		Network.shutdown_game_session()

		self.game_session_shutdown = true
	end
end

GameNetworkManager.network_time = function (self)
	return self.network_clock:time()
end

GameNetworkManager._shutdown_server = function (self)
	debug_print("Shutting down game session host.")
	self:game_session_disconnect()
	GameSession.shutdown_game_session_host(self.game_session)

	self._game_session_host = nil

	self.network_transmit:set_game_session(nil)

	self.game_session = nil
	self._left_game = true
end

GameNetworkManager.force_disconnect_from_session = function (self)
	debug_print("Forcing disconnect_from_host()")
	GameSession.disconnect_from_host(self.game_session)
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
			self:_shutdown_server()
		end
	else
		local local_players = Managers.player:players_at_peer(Network.peer_id())

		for _, player in pairs(local_players) do
			if player:needs_despawn() then
				Managers.state.spawn:delayed_despawn(player)
				printf("despawning player %s", player:name())
			end
		end

		GameSession.leave(self.game_session)
	end
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
end

GameNetworkManager.game_object_template = function (self, go_type)
	return game_object_templates[go_type]
end

GameNetworkManager.request_profile = function (self, local_player_id, profile_name, career_name, force_respawn)
	if self.network_server then
		self.network_server:request_profile(local_player_id, profile_name, career_name, force_respawn)
	end

	if self.network_client then
		self.network_client:request_profile(local_player_id, profile_name, career_name, force_respawn)
	end
end

GameNetworkManager.create_game_object = function (self, object_template, data_table, session_disconnect_callback)
	local game_object_id = GameSession.create_game_object(self.game_session, object_template, data_table)

	self._game_object_types[game_object_id] = object_template
	self._game_object_disconnect_callbacks[game_object_id] = session_disconnect_callback

	debug_print("Created game object of type '%s' with go_id=%d", object_template, game_object_id)

	return game_object_id
end

GameNetworkManager.create_player_game_object = function (self, profile, data_table, session_disconnect_callback)
	fassert(self.is_server, "create_player_game_object: FAIL")

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
end

GameNetworkManager.game_object_created_player = function (self, go_id, owner_peer_id)
	assert(not self.is_server, "game_object_created_player: FAIL")

	local peer_id = GameSession.game_object_field(self.game_session, go_id, "network_id")
	local local_player_id = GameSession.game_object_field(self.game_session, go_id, "local_player_id")

	debug_print("game_object_created_player, go_id=%d, owner_peer_id=%s peer_id=%s", go_id, owner_peer_id, peer_id)

	local player_manager = self.player_manager

	if peer_id == self.peer_id then
		debug_print("PLAYER is local player")

		local player = player_manager:player(peer_id, local_player_id)

		player:set_game_object_id(go_id)
		player:create_sync_data()

		local stats_id = player:stats_id()

		self.statistics_db:sync_stats_to_server(stats_id, peer_id, local_player_id, self.network_transmit)
		debug_print("PLAYER TYPE: %s", player:type())
	else
		debug_print("PLAYER ADDED go_id = %d, peer_id = %s, self.peer_id = %s", go_id, peer_id, self.peer_id)

		local player_controlled = GameSession.game_object_field(self.game_session, go_id, "player_controlled")
		local account_id = GameSession.game_object_field(self.game_session, go_id, "account_id")

		debug_print("ADDING REMOTE PLAYER FOR PEER %s", peer_id)

		local player = player_manager:add_remote_player(peer_id, player_controlled, local_player_id, nil, account_id)

		player:set_game_object_id(go_id)
		player:create_sync_data()
	end
end

GameNetworkManager.game_object_destroyed_player = function (self, go_id, owner_peer_id)
	local peer_id = GameSession.game_object_field(self.game_session, go_id, "network_id")
	local local_player_id = GameSession.game_object_field(self.game_session, go_id, "local_player_id")

	debug_print("game_object_destroyed_player, game_object_id=%i owner_peer_id=%s peer_id=%s", go_id, owner_peer_id, peer_id)

	local player_manager = self.player_manager

	if peer_id ~= self.peer_id then
		player_manager:remove_player(peer_id, local_player_id)
		debug_print("removing peer_id=%s local_player_id=%d", peer_id, local_player_id)
	else
		debug_print("not removing peer_id=%s local_player_id=%d", peer_id, local_player_id)

		local player = player_manager:player_from_peer_id(peer_id, local_player_id)

		player:game_object_destroyed()
	end
end

GameNetworkManager.game_object_created_player_unit_health = function (self, go_id, owner_peer_id)
	local health_extension = self:_health_extension(go_id)

	if health_extension == nil then
		return
	end

	health_extension:set_health_game_object_id(go_id)
end

GameNetworkManager.game_object_destroyed_player_unit_health = function (self, go_id, owner_peer_id)
	local health_extension = self:_health_extension(go_id)

	if health_extension == nil then
		return
	end

	health_extension:set_health_game_object_id(nil)
end

GameNetworkManager.game_object_created_dark_pact_horde_ability = function (self, go_id, owner_peer_id)
	local player_unit_id = GameSession.game_object_field(self.game_session, go_id, "unit_game_object_id")
	local player_unit = self.unit_storage:unit(player_unit_id)

	if player_unit == nil then
		return nil
	end

	local horde_ability_extension = ScriptUnit.extension(player_unit, "versus_horde_ability_system")

	if horde_ability_extension == nil then
		return nil
	end

	horde_ability_extension:set_ability_game_object_id(go_id)
end

GameNetworkManager.game_object_destroyed_dark_pact_horde_ability = function (self, go_id, owner_peer_id)
	local player_unit_id = GameSession.game_object_field(self.game_session, go_id, "unit_game_object_id")
	local player_unit = self.unit_storage:unit(player_unit_id)

	if player_unit == nil then
		return nil
	end

	local horde_ability_extension = ScriptUnit.extension(player_unit, "versus_horde_ability_system")

	if horde_ability_extension == nil then
		return nil
	end

	horde_ability_extension:set_ability_game_object_id(nil)
end

GameNetworkManager.game_object_created_player_sync_data = function (self, go_id, owner_peer_id)
	local peer_id = GameSession.game_object_field(self.game_session, go_id, "network_id")
	local local_player_id = GameSession.game_object_field(self.game_session, go_id, "local_player_id")

	printf("Adding player sync data to peer=%s local_player_id=%s", peer_id, local_player_id)

	local player = self.player_manager:player(peer_id, local_player_id)

	if player then
		player:set_sync_data_game_object_id(go_id)
	end
end

GameNetworkManager.game_object_destroyed_player_sync_data = function (self, go_id, owner_peer_id)
	local peer_id = GameSession.game_object_field(self.game_session, go_id, "network_id")
	local local_player_id = GameSession.game_object_field(self.game_session, go_id, "local_player_id")
	local player = self.player_manager:player(peer_id, local_player_id)

	if player and player.remote then
		player:set_sync_data_game_object_id(nil)
	end
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

GameNetworkManager._career_extension = function (self, go_id)
	local player_unit_id = GameSession.game_object_field(self.game_session, go_id, "unit_game_object_id")
	local player_unit = self.unit_storage:unit(player_unit_id)

	if player_unit == nil then
		return nil
	end

	local career_extension = ScriptUnit.extension(player_unit, "career_system")

	return career_extension
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
		end

		self._game_object_disconnect_callbacks[go_id] = cb
	end

	debug_print("game object created go_id=%d, owner_id=%s go_type=%s go_created_func_name=%s", go_id, owner_id, go_type, go_created_func_name)

	local go_created_func = self[go_created_func_name]

	assert(go_created_func)
	go_created_func(self, go_id, owner_id, go_template)
end

GameNetworkManager.game_object_created_network_unit = function (self, game_object_id, owner_id, go_template)
	self.unit_spawner:spawn_unit_from_game_object(game_object_id, owner_id, go_template)
end

GameNetworkManager.game_object_created_music_states = function (self, game_object_id, owner_id, go_template)
	Managers.music:game_object_created(game_object_id, owner_id, go_template)
end

GameNetworkManager.game_object_created_keep_decoration = function (self, game_object_id, owner_id, go_template)
	local unit_level_index = GameSession.game_object_field(self.game_session, game_object_id, "level_unit_index")
	local level = LevelHelper:current_level(self._world)
	local unit = Level.unit_by_index(level, unit_level_index)
	local keep_decoration_extension = ScriptUnit.extension(unit, "keep_decoration_system")

	keep_decoration_extension:on_game_object_created(game_object_id)
end

GameNetworkManager.game_object_destroyed_keep_decoration = function (self, game_object_id, owner_id, go_template)
	local unit_level_index = GameSession.game_object_field(self.game_session, game_object_id, "level_unit_index")
	local level = LevelHelper:current_level(self._world)
	local unit = Level.unit_by_index(level, unit_level_index)
	local keep_decoration_extension = ScriptUnit.extension(unit, "keep_decoration_system")

	keep_decoration_extension:on_game_object_destroyed()
end

GameNetworkManager.game_object_created_progress_timer = function (self, game_object_id, owner_id, go_template)
	local unit_level_index = GameSession.game_object_field(self.game_session, game_object_id, "level_unit_index")
	local level = LevelHelper:current_level(self._world)
	local unit = Level.unit_by_index(level, unit_level_index)
	local progress_extension = ScriptUnit.extension(unit, "progress_system")

	progress_extension:on_game_object_created(game_object_id)
end

GameNetworkManager.game_object_destroyed_progress_timer = function (self, game_object_id, owner_id, go_template)
	local unit_level_index = GameSession.game_object_field(self.game_session, game_object_id, "level_unit_index")
	local level = LevelHelper:current_level(self._world)
	local unit = Level.unit_by_index(level, unit_level_index)
	local progress_extension = ScriptUnit.extension(unit, "progress_system")

	progress_extension:on_game_object_destroyed()
end

GameNetworkManager.game_object_created_game_mode_data = function (self, game_object_id, owner_id, go_template)
	Managers.state.game_mode:on_game_mode_data_created(self.game_session, game_object_id)
end

GameNetworkManager.game_object_destroyed_game_mode_data = function (self, game_object_id, owner_id, go_template)
	Managers.state.game_mode:on_game_mode_data_destroyed()
end

GameNetworkManager.game_object_created_weave = function (self, game_object_id, owner_id, go_template)
	Managers.weave:game_object_created(game_object_id)
end

GameNetworkManager.game_object_destroyed_weave = function (self, game_object_id)
	Managers.weave:game_object_destroyed(game_object_id)
end

GameNetworkManager.game_object_created_objective = function (self, game_object_id, owner_id, go_template)
	local objective_system = Managers.state.entity:system("objective_system")

	objective_system:game_object_created(game_object_id)
end

GameNetworkManager.game_object_destroyed_objective = function (self, game_object_id)
	local objective_system = Managers.state.entity:system("objective_system")

	objective_system:game_object_destroyed(game_object_id)
end

GameNetworkManager.game_object_created_horde_surge = function (self, game_object_id, owner_id, go_template)
	local game_mode = Managers.state.game_mode:game_mode()

	game_mode._horde_surge_handler._game_object_id = game_object_id
end

GameNetworkManager.game_object_destroyed_horde_surge = function (self, game_object_id)
	local game_mode = Managers.state.game_mode:game_mode()

	game_mode._horde_surge_handler._game_object_id = nil
end

GameNetworkManager.destroy_game_object = function (self, go_id)
	debug_print("destroying game object with go_id=%d", go_id)

	self._game_object_disconnect_callbacks[go_id] = nil

	GameSession.destroy_game_object(self.game_session, go_id)
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
end

GameNetworkManager.game_object_created_player_unit = function (self, go_id, owner_id, go_template)
	if self.is_server then
		self.network_server:peer_spawned_player(owner_id)
	end

	self:game_object_created_network_unit(go_id, owner_id, go_template)
end

GameNetworkManager.game_object_destroyed_player_unit = function (self, go_id, owner_id, go_template)
	local target_unit = self.unit_storage:unit(go_id)

	if self.is_server then
		self.network_server:peer_despawned_player(owner_id)
	end

	self:game_object_destroyed_network_unit(go_id, owner_id, go_template)

	if DEDICATED_SERVER then
		return false
	end

	local health_system = ScriptUnit.has_extension(target_unit, "health_system")
	local last_damage_data = health_system.last_damage_data

	if last_damage_data then
		local local_player = Managers.player:local_player()

		if last_damage_data.attacker_unique_id == local_player:unique_id() then
			local position = POSITION_LOOKUP[local_player.player_unit]
			local target_position = POSITION_LOOKUP[target_unit]

			Managers.telemetry_events:local_player_killed_player(local_player, position, target_position)
		end
	end
end

GameNetworkManager.game_object_destroyed_network_unit = function (self, go_id, owner_id, go_template)
	self.unit_spawner:destroy_game_object_unit(go_id, owner_id, go_template)
end

GameNetworkManager.game_object_destroyed_music_states = function (self, go_id, owner_id, go_template)
	debug_print("MUSIC object destroyed")
	Managers.music:game_object_destroyed(go_id, owner_id, go_template)
end

GameNetworkManager.game_object_migrated_away = function (self, go_id, new_peer_id)
	assert(false, "Not implemented.")
end

GameNetworkManager.game_object_migrated_to_me = function (self, go_id, old_peer_id)
	assert(false, "Not implemented.")
end

GameNetworkManager.game_session_disconnect = function (self, host_id)
	debug_print("Engine called game_session_disconnect callback")

	self._game_session_disconnect = true

	for game_object_id, callback in pairs(self._game_object_disconnect_callbacks) do
		callback(game_object_id)
	end

	self.unit_spawner.game_session = nil
end

GameNetworkManager.game_session_disconnect_music_states = function (self, game_object_id)
	Managers.music:client_game_session_disconnect_music_states(game_object_id)
end

GameNetworkManager.game_object_destroyed_do_nothing = function (self)
	return
end

GameNetworkManager.game_object_created_sync_unit = function (self, game_object_id, owner_id, go_template)
	Managers.state.entity:system("game_object_system"):game_object_created(game_object_id, owner_id, go_template)
end

GameNetworkManager.game_object_destroyed_sync_unit = function (self, go_id, owner_id, go_template)
	return
end

GameNetworkManager.game_object_created_payload = function (self, game_object_id, owner_id, go_template)
	local unit_level_index = GameSession.game_object_field(self.game_session, game_object_id, "level_unit_index")
	local level = LevelHelper:current_level(self._world)
	local unit = Level.unit_by_index(level, unit_level_index)
	local extension = ScriptUnit.extension(unit, "payload_system")

	extension:set_game_object_id(game_object_id)
end

GameNetworkManager.game_object_destroyed_payload = function (self, game_object_id)
	return
end

GameNetworkManager.game_object_created_twitch_vote = function (self, game_object_id, owner_id, go_template)
	Managers.twitch:add_game_object_id(game_object_id)
end

GameNetworkManager.game_object_destroyed_twitch_vote = function (self, game_object_id)
	Managers.twitch:remove_game_object_id(game_object_id)
end

GameNetworkManager.game_object_created_career_data = function (self, go_id, owner_peer_id)
	local career_extension = self:_career_extension(go_id)

	if career_extension == nil then
		return
	end

	career_extension:set_career_game_object_id(go_id)
end

GameNetworkManager.game_object_destroyed_career_data = function (self, go_id, owner_peer_id)
	local career_extension = self:_career_extension(go_id)

	if career_extension == nil then
		return
	end

	career_extension:set_career_game_object_id(nil)
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
end

GameNetworkManager.set_peer_synchronizing = function (self, peer_id)
	self._object_synchronizing_clients[peer_id] = true

	self.network_transmit:add_peer_ignore(peer_id)
end

GameNetworkManager.hot_join_sync = function (self, peer_id)
	if Managers.state.debug then
		Managers.state.debug:hot_join_sync(peer_id)
	end

	self.difficulty_manager:hot_join_sync(peer_id)
	self.weave_manager:hot_join_sync(peer_id)
	self.entity_system:hot_join_sync(peer_id)
	self.game_mode:hot_join_sync(peer_id)
	self.networked_flow_state:hot_join_sync(peer_id)
	self.voting_manager:hot_join_sync(peer_id)
	self.statistics_db:hot_join_sync(peer_id)
	Managers.deed:hot_join_sync(peer_id)
	LoadoutUtils.hot_join_sync(peer_id)

	if self.matchmaking_manager then
		self.matchmaking_manager:hot_join_sync(peer_id)
	end

	if self.game_server_manager then
		self.game_server_manager:hot_join_sync(peer_id)
	end

	if self.room_manager then
		self.room_manager:hot_join_sync(peer_id)
	end

	if Managers.venture.challenge then
		Managers.venture.challenge:hot_join_sync(peer_id)
	end

	if Managers.state.conflict then
		Managers.state.conflict:hot_join_sync(peer_id)
	end

	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	RPC.rpc_to_client_sync_session_id(channel_id, self._session_id)

	self._object_synchronizing_clients[peer_id] = nil

	self.network_transmit:remove_peer_ignore(peer_id)
end

GameNetworkManager.rpc_play_particle_effect = function (self, channel_id, effect_id, go_id, node_id, offset, rotation_offset, linked)
	if self.is_server then
		self.network_transmit:send_rpc_clients("rpc_play_particle_effect", effect_id, go_id, node_id, offset, rotation_offset, linked)
	end

	local unit = self.unit_storage:unit(go_id)
	local effect_name = NetworkLookup.effects[effect_id]

	Managers.state.event:trigger("event_play_particle_effect", effect_name, unit, node_id, offset, rotation_offset, linked)
end

GameNetworkManager.rpc_play_particle_effect_no_rotation = function (self, sender, effect_id, go_id, node_id, offset, linked)
	if self.is_server then
		self.network_transmit:send_rpc_clients("rpc_play_particle_effect_no_rotation", effect_id, go_id, node_id, offset, linked)
	end

	local unit = self.unit_storage:unit(go_id)
	local effect_name = NetworkLookup.effects[effect_id]

	Managers.state.event:trigger("event_play_particle_effect", effect_name, unit, node_id, offset, Quaternion.identity(), linked)
end

GameNetworkManager.rpc_play_particle_effect_with_variable = function (self, sender, effect_id, position, rotation, variable, value)
	if self.is_server then
		self.network_transmit:send_rpc_clients("rpc_play_particle_effect_with_variable", effect_id, position, rotation, variable, value)
	end

	local effect_name = NetworkLookup.effects[effect_id]
	local world = self._world
	local particle_variable = World.find_particles_variable(world, effect_name, variable)
	local beam_effect_id = World.create_particles(world, effect_name, position, rotation)

	World.set_particles_variable(world, beam_effect_id, particle_variable, value)
end

GameNetworkManager.rpc_play_particle_effect_spline = function (self, sender, fx_name_id, variable_ids, spline_points)
	if self.is_server then
		self.network_transmit:send_rpc_clients("rpc_play_particle_effect_spline", fx_name_id, variable_ids, spline_points)
	end

	local fx_name = NetworkLookup.effects[fx_name_id]
	local world = self._world
	local fx_id = World.create_particles(world, fx_name, spline_points[1])

	for i = 1, #spline_points do
		World.set_particles_variable(world, fx_id, variable_ids[i], spline_points[i])
	end
end

GameNetworkManager._pack_percentages_completed_arrays = function (self, percentages_completed)
	local peer_ids = {}
	local local_player_ids = {}
	local percentages = {}
	local i = 1
	local player_manager = Managers.player

	for unique_id, percentage_complete in pairs(percentages_completed) do
		local player = player_manager:player_from_unique_id(unique_id)

		if player then
			local peer_id = player:network_id()
			local local_player_id = player:local_player_id()

			peer_ids[i] = peer_id
			local_player_ids[i] = local_player_id
			percentages[i] = percentage_complete
			i = i + 1
		end
	end

	return peer_ids, local_player_ids, percentages
end

GameNetworkManager._unpack_percentages_completed_arrays = function (self, peer_ids, local_player_ids, percentages)
	local percentages_completed = {}
	local player_manager = Managers.player

	for i = 1, #peer_ids do
		local peer_id = peer_ids[i]
		local local_player_id = local_player_ids[i]
		local percentage_completed = percentages[i]
		local player = player_manager:player(peer_id, local_player_id)

		if player then
			local unique_id = player:unique_id()

			percentages_completed[unique_id] = math.clamp(percentage_completed, 0, 1)
		end
	end

	return percentages_completed
end

GameNetworkManager.gm_event_end_conditions_met = function (self, reason, checkpoint_available, percentages_completed)
	local peer_ids, local_player_ids, percentages = self:_pack_percentages_completed_arrays(percentages_completed)
	local reason_id = NetworkLookup.game_end_reasons[reason]

	self.network_transmit:send_rpc_clients("rpc_gm_event_end_conditions_met", reason_id, checkpoint_available, peer_ids, local_player_ids, percentages)
end

GameNetworkManager.rpc_gm_event_end_conditions_met = function (self, channel_id, reason_id, checkpoint_available, peer_ids, local_player_ids, percentages)
	if not self.is_server then
		local percentages_completed = self:_unpack_percentages_completed_arrays(peer_ids, local_player_ids, percentages)
		local end_reason = NetworkLookup.game_end_reasons[reason_id]

		Managers.state.game_mode:set_end_reason(end_reason)
		Managers.state.game_mode:trigger_event("end_conditions_met", end_reason, checkpoint_available, percentages_completed)
	end
end

GameNetworkManager.gm_event_round_started = function (self)
	local time_since_round_started = 0

	self.network_transmit:send_rpc_clients("rpc_gm_event_round_started", time_since_round_started)
end

GameNetworkManager.rpc_gm_event_round_started = function (self, channel_id, time_since_round_started)
	Managers.state.game_mode:trigger_event("round_started", time_since_round_started)
end

GameNetworkManager.gm_event_initial_peers_spawned = function (self)
	self.network_transmit:send_rpc_clients("rpc_gm_event_initial_peers_spawned")
end

GameNetworkManager.rpc_gm_event_initial_peers_spawned = function (self, channel_id)
	Managers.state.game_mode:trigger_event("initial_peers_spawned")
end

GameNetworkManager.rpc_play_melee_hit_effects = function (self, channel_id, sound_event_id, hit_position, sound_type_id, unit_game_object_id)
	local hit_unit = self.unit_storage:unit(unit_game_object_id)

	if not Unit.alive(hit_unit) then
		return
	end

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_play_melee_hit_effects", peer_id, sound_event_id, hit_position, sound_type_id, unit_game_object_id)
	end

	local sound_event = NetworkLookup.sound_events[sound_event_id]
	local sound_type = NetworkLookup.melee_impact_sound_types[sound_type_id]

	EffectHelper.play_melee_hit_effects(sound_event, self._world, hit_position, sound_type, true, hit_unit)
end

GameNetworkManager.rpc_request_spawn_network_unit = function (self, channel_id, request_spawn_template_id, position, rotation, source_unit_go_id, state_int)
	local source_unit = self.unit_storage:unit(source_unit_go_id)
	local template_name = NetworkLookup.spawn_unit_templates[request_spawn_template_id]
	local spawn_template = SpawnUnitTemplates[template_name]

	spawn_template.spawn_func(source_unit, position, rotation, state_int)

	local players = Managers.player:human_players()
end

GameNetworkManager.rpc_surface_mtr_fx = function (self, channel_id, effect_name_id, unit_game_object_id, position, rotation, normal, actor_index)
	local unit = self.unit_storage:unit(unit_game_object_id)

	if not Unit.alive(unit) then
		return
	end

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_surface_mtr_fx", peer_id, effect_name_id, unit_game_object_id, position, rotation, normal, actor_index)
	end

	local hit_actor

	if actor_index > 0 then
		hit_actor = Unit.actor(unit, actor_index)
	end

	local effect_name = NetworkLookup.surface_material_effects[effect_name_id]

	EffectHelper.play_surface_material_effects(effect_name, self._world, unit, position, rotation, normal, nil, true, nil, hit_actor)
end

GameNetworkManager.rpc_surface_mtr_fx_lvl_unit = function (self, channel_id, effect_name_id, unit_level_index, position, rotation, normal, actor_index)
	local level = LevelHelper:current_level(self._world)
	local unit = Level.unit_by_index(level, unit_level_index)

	if not Unit.alive(unit) then
		return
	end

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_surface_mtr_fx_lvl_unit", peer_id, effect_name_id, unit_level_index, position, rotation, normal, actor_index)
	end

	local hit_actor

	if actor_index > 0 then
		hit_actor = Unit.actor(unit, actor_index)
	end

	local effect_name = NetworkLookup.surface_material_effects[effect_name_id]

	EffectHelper.play_surface_material_effects(effect_name, self._world, unit, position, rotation, normal, nil, true, nil, hit_actor)
end

GameNetworkManager.rpc_skinned_surface_mtr_fx = function (self, channel_id, effect_name_id, position, rotation, normal)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_skinned_surface_mtr_fx", peer_id, effect_name_id, position, rotation, normal)
	end

	local effect_name = NetworkLookup.surface_material_effects[effect_name_id]

	EffectHelper.play_skinned_surface_material_effects(effect_name, self._world, nil, position, rotation, normal, true)
end

GameNetworkManager.game_session_host = function (self)
	return self.game_session and (self._game_session_host or GameSession.game_session_host(self.game_session))
end

GameNetworkManager.rpc_enemy_is_alerted = function (self, channel_id, unit_id, is_alerted)
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
end

GameNetworkManager.rpc_ladder_shake = function (self, channel_id, unit_index)
	local unit = Level.unit_by_index(LevelHelper:current_level(self._world), unit_index)

	ScriptUnit.extension(unit, "ladder_system"):shake()
end

GameNetworkManager.rpc_assist = function (self, channel_id, savior_player_id, savior_local_player_id, saved_player_id, saved_local_player_id, predicate_id, enemy_unit_id)
	local player_manager = Managers.player
	local savior_player = player_manager:player(savior_player_id, savior_local_player_id)
	local saved_player = player_manager:player(saved_player_id, saved_local_player_id)
	local predicate = NetworkLookup.coop_feedback[predicate_id]
	local enemy_unit = self.unit_storage:unit(enemy_unit_id)
	local local_human = not savior_player.remote and not saved_player.bot_player

	Managers.state.event:trigger("add_coop_feedback", savior_player:stats_id() .. saved_player:stats_id(), local_human, predicate, savior_player, saved_player)

	local savior_unit = savior_player.player_unit
	local saved_unit = saved_player.player_unit

	if saved_unit and not saved_player.remote then
		local buff_extension = ScriptUnit.has_extension(saved_unit, "buff_system")

		if buff_extension then
			buff_extension:trigger_procs("on_assisted", savior_unit, enemy_unit)
		end
	end

	if savior_unit and not savior_player.remote then
		local savior_buff_extension = ScriptUnit.has_extension(savior_unit, "buff_system")

		if savior_buff_extension then
			savior_buff_extension:trigger_procs("on_assisted_ally", saved_unit, enemy_unit)
		end
	end

	if predicate == "save" then
		local savior_player_stats_id = savior_player:stats_id()

		Managers.player:statistics_db():increment_stat(savior_player_stats_id, "saves")
	elseif predicate == "aid" then
		local savior_player_stats_id = savior_player:stats_id()

		Managers.player:statistics_db():increment_stat(savior_player_stats_id, "aidings")
	end
end

GameNetworkManager.rpc_coop_feedback = function (self, channel_id, player1_peer_id, player1_local_player_id, predicate_id, player2_peer_id, player2_local_player_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_coop_feedback", peer_id, player1_peer_id, player1_local_player_id, predicate_id, player2_peer_id, player2_local_player_id)
	end

	local predicate = NetworkLookup.coop_feedback[predicate_id]
	local player_manager = Managers.player
	local player1 = player_manager:player(player1_peer_id, player1_local_player_id)
	local player2 = player_manager:player(player2_peer_id, player2_local_player_id)
	local local_human = not player1.remote and not player1.bot_player
	local statistics_db = Managers.player:statistics_db()

	if predicate == "aid" then
		statistics_db:increment_stat(player1:stats_id(), "aidings")
	elseif predicate == "save" then
		statistics_db:increment_stat(player1:stats_id(), "saves")
	elseif predicate == "discarded_grimoire" then
		local player_1_peer_id = player1.peer_id
		local is_player_controlled = player1:is_player_controlled()
		local player_1_name = is_player_controlled and (rawget(_G, "Steam") and Steam.user_name(player_1_peer_id) or tostring(player_1_peer_id)) or player1:name()

		if IS_CONSOLE and not Managers.account:offline_mode() then
			local lobby = Managers.state.network:lobby()

			player_1_name = is_player_controlled and (lobby:user_name(player_1_peer_id) or tostring(player_1_peer_id)) or player1:name()
		end

		local pop_chat = true
		local message = string.format(Localize("system_chat_player_discarded_grimoire"), player_1_name)

		Managers.chat:add_local_system_message(1, message, pop_chat)
	end

	Managers.state.event:trigger("add_coop_feedback", player1:stats_id() .. player2:stats_id(), local_human, predicate, player1, player2)
end

GameNetworkManager.rpc_flow_event = function (self, channel_id, unit_id, event_id)
	local unit = self.unit_storage:unit(unit_id)

	if not unit then
		printf("unit from game_object_id %d is nil", unit_id)

		return
	end

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_flow_event", peer_id, unit_id, event_id)
	end

	local event_name = NetworkLookup.flow_events[event_id]

	Unit.flow_event(unit, event_name)
end

GameNetworkManager.anim_event = function (self, unit, event)
	local anim_system = Managers.state.entity:system("animation_system")

	anim_system:anim_event(unit, event)
end

GameNetworkManager.anim_event_with_variable_float = function (self, unit, event, variable_name, variable_value)
	local anim_system = Managers.state.entity:system("animation_system")

	anim_system:anim_event_with_variable_float(unit, event, variable_name, variable_value)
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
end
