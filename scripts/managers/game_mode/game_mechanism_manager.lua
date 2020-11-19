require("scripts/managers/game_mode/mechanisms/adventure_mechanism")

MechanismSettings = {
	adventure = {
		default_inventory = true,
		check_matchmaking_hero_availability = true,
		server_port = 27015,
		server_universe = "carousel",
		tobii_available = true,
		max_members = 4,
		class_name = "AdventureMechanism",
		states = {
			"inn",
			"ingame",
			"tutorial",
			"weave"
		},
		venture_end_states_in = {
			"inn"
		},
		venture_end_states_out = {
			"inn"
		},
		party_data = {
			heroes = {
				party_id = 1,
				name = "heroes",
				num_slots = 4
			}
		}
	}
}

for _, dlc in pairs(DLCSettings) do
	local mechanism_settings = dlc.mechanism_settings

	if mechanism_settings then
		for name, settings in pairs(mechanism_settings) do
			if settings.file then
				require(settings.file)
			end

			MechanismSettings[name] = settings
		end
	end
end

GameMechanismManager = class(GameMechanismManager)
local rpcs = {
	"rpc_from_server_set_mechanism",
	"rpc_set_current_mechanism_state",
	"rpc_switch_mechanism",
	"rpc_carousel_set_local_match",
	"rpc_carousel_set_private_lobby",
	"rpc_dedicated_or_player_hosted_search",
	"rpc_reserved_slots_count",
	"rpc_party_slots_status",
	"rpc_force_start_dedicated_server",
	"rpc_switch_level_dedicated_server",
	"rpc_sync_adventure_data_to_peer"
}

GameMechanismManager.init = function (self)
	self._mechanism_key = nil
	self._game_mechanism = nil
	self._level_seed = nil
	self._locked_director_functions = nil
	self._locked_director_function_ids = nil
	self._joined_peers = {}
	self._difficulty = script_data.current_difficulty_setting or "normal"
	self._difficulty_tweak = script_data.current_difficulty_tweak_setting or 0
	self._venture_started = false

	self:_reset()
	self:setup_party_data(false)
end

GameMechanismManager.create_level_seed = function (self)
	local time_since_start = (os.clock() * 10000) % 961748927
	local date_time = os.time()
	local low_time = tonumber(tostring(string.format("%d", date_time)):reverse():sub(1, 6))
	local seed = (time_since_start + low_time) % 15485867
	seed = math.floor(seed)

	return seed
end

GameMechanismManager.generate_level_seed = function (self)
	local seed = self._game_mechanism.generate_level_seed and self._game_mechanism:generate_level_seed()

	if seed then
		self._level_seed = seed
	else
		print("[LevelTransitionHandler] Generated new level_seed:", seed)

		self._level_seed = self:create_level_seed()
	end

	return self._level_seed
end

GameMechanismManager.get_level_seed = function (self, optional_system)
	if self._game_mechanism.get_level_seed then
		return self._game_mechanism:get_level_seed(self._level_seed, optional_system)
	else
		return self._level_seed
	end
end

GameMechanismManager.get_end_of_level_rewards_arguments = function (self, game_won, quickplay, statistics_db, stats_id)
	if self._game_mechanism.get_end_of_level_rewards_arguments then
		return self._game_mechanism:get_end_of_level_rewards_arguments(game_won, quickplay, statistics_db, stats_id)
	else
		return {}
	end
end

GameMechanismManager.get_end_of_level_extra_mission_results = function (self)
	if self._game_mechanism.get_end_of_level_extra_mission_results then
		return self._game_mechanism:get_end_of_level_extra_mission_results()
	else
		return {}
	end
end

GameMechanismManager.register_network_server = function (self, network_server)
	fassert(self._network_server == nil, "Game is trying to create duplicated instances of NetworkServer")

	self._network_server = network_server
end

GameMechanismManager.unregister_network_server = function (self)
	fassert(self._network_server, "Trying to destroy NetworkServer even though it has already been destroyed?")

	self._network_server = nil
end

GameMechanismManager.network_server = function (self)
	return self._network_server
end

GameMechanismManager.set_level_seed = function (self, seed)
	print("GameMechanismManager setting level seed:", seed)

	self._level_seed = seed
end

GameMechanismManager.set_locked_director_functions_from_ids = function (self, locked_director_function_ids)
	self._locked_director_functions = ConflictUtils.extract_conflict_director_locked_functions(locked_director_function_ids)
	self._locked_director_function_ids = locked_director_function_ids
end

GameMechanismManager.get_locked_director_functions = function (self)
	return self._locked_director_functions
end

GameMechanismManager.get_locked_director_function_ids = function (self)
	return self._locked_director_function_ids
end

GameMechanismManager.generate_locked_director_functions = function (self, level_key)
	self._locked_director_function_ids = ConflictUtils.generate_conflict_director_locked_function_ids(level_key)
	self._locked_director_functions = ConflictUtils.extract_conflict_director_locked_functions(self._locked_director_function_ids)

	return self._locked_director_functions, self._locked_director_function_ids
end

GameMechanismManager.get_filtered_pickups = function (self, pickup_type)
	local game_mechanism = self._game_mechanism

	if game_mechanism and game_mechanism.get_filtered_pickups then
		return game_mechanism:get_filtered_pickups(pickup_type)
	end

	return Pickups[pickup_type]
end

GameMechanismManager.can_spawn_pickup = function (self, spawner_unit, pickup_name)
	local game_mechanism = self._game_mechanism

	if game_mechanism and game_mechanism.can_spawn_pickup then
		return game_mechanism:can_spawn_pickup(spawner_unit, pickup_name)
	end

	return false
end

GameMechanismManager.uses_random_directors = function (self)
	local game_mechanism = self._game_mechanism

	if game_mechanism and game_mechanism.uses_random_directors then
		return game_mechanism:uses_random_directors()
	end

	return true
end

GameMechanismManager.get_overriden_startup_conflict_setting = function (self)
	local game_mechanism = self._game_mechanism

	if game_mechanism and game_mechanism.get_overriden_startup_conflict_setting then
		return game_mechanism:get_overriden_startup_conflict_setting()
	end

	return nil
end

GameMechanismManager._reset = function (self, level_key)
	local dev_param_mechanism = Development.parameter("mechanism")
	local key = dev_param_mechanism or self._mechanism_key or "adventure"
	self._dedicated_server_peer_id = nil

	self:_init_mechanism(key, level_key)
end

GameMechanismManager.destroy = function (self)
	self:_unregister_mechanism_rpcs()

	if self._game_mechanism.destroy then
		self._game_mechanism:destroy()
	end

	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end
end

GameMechanismManager.set_profile_synchronizer = function (self, profile_synchronizer)
	self._profile_synchronizer = profile_synchronizer
end

GameMechanismManager.set_difficulty = function (self, difficulty, difficulty_tweak)
	self._difficulty = difficulty
	self._difficulty_tweak = difficulty_tweak
end

GameMechanismManager.get_difficulty = function (self)
	return self._difficulty, self._difficulty_tweak
end

GameMechanismManager.get_level_end_view = function (self)
	return self._game_mechanism and self._game_mechanism.get_level_end_view and self._game_mechanism:get_level_end_view()
end

GameMechanismManager.handle_ingame_enter = function (self, game_mode)
	local game_mechanism = self._game_mechanism

	if game_mechanism and game_mechanism.handle_ingame_enter then
		game_mechanism:handle_ingame_enter(game_mode)
	end
end

GameMechanismManager.handle_ingame_exit = function (self, exit_type)
	local game_mechanism = self._game_mechanism

	if game_mechanism and game_mechanism.handle_ingame_exit then
		game_mechanism:handle_ingame_exit(exit_type)
	end
end

GameMechanismManager.network_context_created = function (self, lobby, server_peer_id, own_peer_id)
	printf("[GameMechanismManager] network_context_created (server_peer_id=%s, own_peer_id=%s)", server_peer_id, own_peer_id)

	self._lobby = lobby
	self._server_peer_id = server_peer_id
	self._peer_id = own_peer_id
	local is_server = server_peer_id == own_peer_id
	self._is_server = is_server
	local game_mechanism = self._game_mechanism

	if game_mechanism and game_mechanism.network_context_created then
		game_mechanism:network_context_created(lobby, server_peer_id, own_peer_id)
	end
end

GameMechanismManager.server_peer_id = function (self)
	return self._server_peer_id
end

GameMechanismManager.is_server = function (self)
	return self._is_server
end

GameMechanismManager.network_context_destroyed = function (self, level_key)
	print("[GameMechanismManager] network_context_destroyed")

	self._lobby = nil
	self._server_peer_id = nil
	self._peer_id = nil
	self._is_server = nil

	if self._game_mechanism and self._game_mechanism.network_context_destroyed then
		self._game_mechanism:network_context_destroyed()
	end
end

GameMechanismManager.register_rpcs = function (self, network_event_delegate)
	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(rpcs))
	self:_register_mechanism_rpcs()
end

GameMechanismManager._register_mechanism_rpcs = function (self)
	if self._network_event_delegate and self._game_mechanism and self._game_mechanism.register_rpcs then
		self._game_mechanism:register_rpcs(self._network_event_delegate)
	end
end

GameMechanismManager.unregister_rpcs = function (self)
	self:_unregister_mechanism_rpcs()

	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end
end

GameMechanismManager._unregister_mechanism_rpcs = function (self)
	if self._game_mechanism and self._game_mechanism.unregister_rpcs then
		self._game_mechanism:unregister_rpcs()
	end
end

GameMechanismManager._init_mechanism = function (self, mechanism_key, level_key)
	print("initializing mechanism to:", mechanism_key)
	fassert(MechanismSettings[mechanism_key], "[GameMechanismManager] Tried to set unknown mechanism %q", tostring(mechanism_key))

	local settings = MechanismSettings[mechanism_key]
	local switching_mechanism = self._mechanism_key and self._mechanism_key ~= mechanism_key
	self._mechanism_key = mechanism_key

	self:_unregister_mechanism_rpcs()

	if self._game_mechanism and not switching_mechanism then
		self._game_mechanism:reset(settings, level_key)
	else
		if self._game_mechanism and self._game_mechanism.left_mechanism_due_to_switch then
			self._game_mechanism:left_mechanism_due_to_switch()
		end

		local class = rawget(_G, settings.class_name)
		self._game_mechanism = class:new(settings, level_key)

		if switching_mechanism and self._game_mechanism.entered_mechanism_due_to_switch then
			self._game_mechanism:entered_mechanism_due_to_switch()
		end
	end

	self:_register_mechanism_rpcs()

	SaveData.last_mechanism = mechanism_key
end

GameMechanismManager.is_final_round = function (self)
	return self._game_mechanism:is_final_round()
end

GameMechanismManager.on_final_round_won = function (self, statistics_db, stats_id)
	if self._game_mechanism.on_final_round_won then
		self._game_mechanism:on_final_round_won(statistics_db, stats_id)
	end
end

GameMechanismManager.request_vote = function (self, request_type, params)
	if self._game_mechanism.request_vote then
		self._game_mechanism:request_vote(request_type, params)
	end
end

GameMechanismManager.game_round_ended = function (self, t, dt, reason, reason_data)
	local level_key = self._game_mechanism:game_round_ended(t, dt, reason, reason_data)

	return level_key
end

GameMechanismManager.get_next_game_mode_key = function (self, level_transition_handler)
	return self._game_mechanism:get_next_game_mode_key(level_transition_handler)
end

GameMechanismManager.start_next_round = function (self, level_transition_handler)
	self._level_transition_handler = level_transition_handler
	local level_key = self._level_transition_handler:get_current_level_keys()

	if not self._game_mechanism or self._switch_mechanism_key then
		local dev_param_mechanism = Development.parameter("mechanism")
		local key = self._switch_mechanism_key or dev_param_mechanism or "adventure"

		self:_init_mechanism(key, level_key)

		self._switch_mechanism_key = nil
	end

	local game_mode_key, side_compositions, game_mode_settings = self._game_mechanism:start_next_round(level_transition_handler)

	return game_mode_key, side_compositions, game_mode_settings
end

GameMechanismManager.get_current_level_keys = function (self)
	return self._level_transition_handler:get_current_level_keys()
end

GameMechanismManager.game_mechanism = function (self)
	return self._game_mechanism
end

GameMechanismManager.current_mechanism_name = function (self)
	return self._mechanism_key
end

GameMechanismManager.mechanism_setting = function (self, setting_name)
	fassert(self._mechanism_key, "No mechanism set yet.")

	return MechanismSettings[self._mechanism_key][setting_name]
end

GameMechanismManager.max_members = function (self)
	fassert(self._mechanism_key, "No mechanism set yet.")

	if self._game_mechanism.max_members then
		return self._game_mechanism:max_members()
	end

	return MechanismSettings[self._mechanism_key].max_members
end

GameMechanismManager.server_universe = function (self)
	fassert(self._mechanism_key, "No mechanism set yet.")

	return MechanismSettings[self._mechanism_key].server_universe
end

GameMechanismManager.leaving_game = function (self)
	print("Mechanism leaving game")
	self:_reset()
end

GameMechanismManager.is_packages_loaded = function (self)
	if self._game_mechanism.is_packages_loaded and not self._switch_mechanism_key then
		return self._game_mechanism:is_packages_loaded()
	end

	return true
end

GameMechanismManager.load_packages = function (self)
	if self._game_mechanism.load_packages and not self._switch_mechanism_key then
		self._game_mechanism:load_packages()
	end
end

GameMechanismManager.client_joined = function (self, peer_id)
	self._joined_peers[peer_id] = true

	print("Mechanism says: a client joined the game!", peer_id)

	local mechanism_id = NetworkLookup.mechanism_keys[self._mechanism_key]
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	RPC.rpc_from_server_set_mechanism(channel_id, mechanism_id)

	local state_name = self._game_mechanism:get_state()
	local settings = MechanismSettings[self._mechanism_key]
	local states = settings.states
	local state_id = table.find(states, state_name)

	RPC.rpc_set_current_mechanism_state(channel_id, state_id)

	if self._game_mechanism.client_joined then
		self._game_mechanism:client_joined(peer_id)
	end
end

GameMechanismManager.sync_game_mode_data_to_peer = function (self, network_transmit, peer_id)
	local mechanism = self._game_mechanism

	if mechanism and mechanism.sync_game_mode_data_to_peer then
		mechanism:sync_game_mode_data_to_peer(network_transmit, peer_id)
	end
end

GameMechanismManager.client_left = function (self, peer_id)
	self._joined_peers[peer_id] = nil

	if self._game_mechanism.client_left then
		self._game_mechanism:client_left(peer_id)
	end
end

GameMechanismManager.get_joined_peers = function (self)
	return self._joined_peers
end

GameMechanismManager.get_profile_synchronizer_class = function (self)
	if self._game_mechanism and self._game_mechanism.get_profile_synchronizer_class then
		return self._game_mechanism:get_profile_synchronizer_class()
	end

	return ProfileSynchronizer
end

GameMechanismManager.profile_available = function (self, profile_name, career_name)
	if self._game_mechanism then
		return self._game_mechanism:profile_available(self._profile_synchronizer, profile_name, career_name)
	end

	return true
end

GameMechanismManager.profile_available_for_peer = function (self, peer_id, local_player_id, profile_name, career_name)
	if self._game_mechanism then
		return self._game_mechanism:profile_available_for_peer(self._profile_synchronizer, peer_id, local_player_id, profile_name, career_name)
	end

	return false
end

GameMechanismManager.profile_changed = function (self, peer_id, local_player_id, profile_index, career_index)
	if self._game_mechanism and self._game_mechanism.profile_changed then
		return self._game_mechanism:profile_changed(peer_id, local_player_id, profile_index, career_index)
	end

	return false
end

GameMechanismManager.get_players_session_score = function (self, statistics_db, profile_synchronizer, saved_scoreboard_stats)
	if self._game_mechanism.get_players_session_score then
		return self._game_mechanism:get_players_session_score(statistics_db, profile_synchronizer, saved_scoreboard_stats)
	end

	return ScoreboardHelper.get_grouped_topic_statistics(statistics_db, profile_synchronizer, saved_scoreboard_stats)
end

GameMechanismManager.save_current_score_information = function (self, game_won)
	if self._game_mechanism.save_current_score_information then
		self._game_mechanism:save_current_score_information(game_won)
	end
end

GameMechanismManager.score_information = function (self)
	if self._game_mechanism.score_information then
		return self._game_mechanism:score_information()
	end
end

GameMechanismManager.get_prior_state = function (self)
	return self._game_mechanism:get_prior_state()
end

GameMechanismManager.choose_next_state = function (self, state)
	self._game_mechanism:choose_next_state(state)
end

GameMechanismManager.reset_choose_next_state = function (self)
	self._game_mechanism:reset_choose_next_state()
end

GameMechanismManager.progress_state = function (self)
	local new_state = self._game_mechanism:progress_state()
	local settings = MechanismSettings[self._mechanism_key]
	local states = settings.states
	local state_id = table.find(states, new_state)

	fassert(state_id, "State not found in mechanism settings")
	self:send_rpc_clients("rpc_set_current_mechanism_state", state_id)
end

GameMechanismManager.get_starting_level = function (self)
	local level_key = (self._game_mechanism.get_starting_level and self._game_mechanism:get_starting_level()) or LevelSettings.default_start_level

	return level_key
end

GameMechanismManager.get_loading_tip = function (self)
	local mechanism = self._game_mechanism

	if mechanism.get_loading_tip then
		return mechanism:get_loading_tip()
	end

	return nil
end

GameMechanismManager.set_lobby_max_members = function (self, max_members)
	self._lobby:set_max_members(max_members)
end

GameMechanismManager.backend_profiles_loaded = function (self)
	if self._game_mechanism.backend_profiles_loaded then
		self._game_mechanism:backend_profiles_loaded()
	end
end

GameMechanismManager.try_reserve_game_server_slots = function (self, reserver, peers)
	if self._game_mechanism.try_reserve_game_server_slots then
		return self._game_mechanism:try_reserve_game_server_slots(reserver, peers)
	end

	printf("[GameMechanismManager] Approving slot reservation by default.")

	return true
end

GameMechanismManager.game_server_slot_reservation_expired = function (self, peer_id)
	if self._game_mechanism.game_server_slot_reservation_expired then
		self._game_mechanism:game_server_slot_reservation_expired(peer_id)
	end
end

GameMechanismManager.debug_load_level = function (self, level_name, environment_variation_id)
	if self._game_mechanism and self._game_mechanism.debug_load_level then
		self._game_mechanism:debug_load_level(level_name)
	else
		local game_mode_manager = Managers.state.game_mode
		local level_transition_handler = game_mode_manager.level_transition_handler

		level_transition_handler:set_next_level(level_name, environment_variation_id or 0)
		level_transition_handler:level_completed()
	end
end

GameMechanismManager._on_venture_start = function (self)
	self._venture_started = true
	local is_server = self._is_server
	local statistics_db = StatisticsDatabase:new()
	Managers.venture.statistics = statistics_db
	Managers.venture.challenge = ChallengeManager:new(statistics_db, is_server)

	Managers:on_venture_start()

	if self._game_mechanism.on_venture_start then
		self._game_mechanism:on_venture_start()
	end
end

GameMechanismManager._on_venture_end = function (self)
	Managers:on_venture_end()

	if self._game_mechanism.on_venture_end then
		self._game_mechanism:on_venture_end()
	end

	Managers.venture:destroy()

	self._venture_started = false
end

GameMechanismManager.check_venture_start = function (self)
	if not self._venture_started then
		self:_on_venture_start()
	end
end

GameMechanismManager.check_venture_end = function (self)
	local state = self._game_mechanism:get_state()
	local prior_state = self._game_mechanism:get_prior_state()
	local venture_end_states_in = self:mechanism_setting("venture_end_states_in")
	local venture_end_states_out = self:mechanism_setting("venture_end_states_out")

	if self._venture_started and (table.contains(venture_end_states_in, state) or table.contains(venture_end_states_out, prior_state)) then
		self:_on_venture_end()
	end
end

GameMechanismManager.rpc_from_server_set_mechanism = function (self, channel_id, mechanism_id)
	local mechanism_name = NetworkLookup.mechanism_keys[mechanism_id]

	print("Server sends mechanism to client", mechanism_name)
	self:_init_mechanism(mechanism_name)
end

GameMechanismManager.rpc_switch_mechanism = function (self, channel_id, mechanism_id)
	self._switch_mechanism_key = NetworkLookup.mechanism_keys[mechanism_id]

	Managers.backend:load_mechanism_loadout(self._switch_mechanism_key)
end

GameMechanismManager.rpc_set_current_mechanism_state = function (self, channel_id, state_id)
	fassert(not self._is_server, "Server handles the state internally, this should only end up on clients.")

	local settings = MechanismSettings[self._mechanism_key]
	local states = settings.states
	local state_name = states[state_id]

	fassert(state_name, "No corresponding state_name for state_id (mechanism:%s)", self._mechanism_key)
	print("Received new state from server", state_name)
	self._game_mechanism:set_current_state(state_name)
end

GameMechanismManager.rpc_carousel_set_local_match = function (self, channel_id, local_match)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._server_peer_id then
		return
	end

	self._game_mechanism:set_local_match(local_match)
end

GameMechanismManager.rpc_carousel_set_private_lobby = function (self, channel_id, private_lobby)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._server_peer_id then
		return
	end

	self._game_mechanism:set_private_lobby(private_lobby)
end

GameMechanismManager.rpc_dedicated_or_player_hosted_search = function (self, channel_id, use_dedicated_servers, use_dedicated_aws_servers, use_player_hosted)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._server_peer_id then
		return
	end

	self._game_mechanism:set_dedicated_or_player_hosted_search(use_dedicated_servers, use_dedicated_aws_servers, use_player_hosted)
end

GameMechanismManager.rpc_reserved_slots_count = function (self, channel_id, num_reserved_slots, num_slots_total)
	if not self._game_mechanism.num_dedicated_reserved_slots_changed then
		return
	end

	self._game_mechanism:num_dedicated_reserved_slots_changed(num_reserved_slots, num_slots_total)

	if self._is_server then
		self._dedicated_server_peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self:send_rpc_clients("rpc_reserved_slots_count", num_reserved_slots, num_slots_total)
	end
end

GameMechanismManager.rpc_party_slots_status = function (self, channel_id, server_name, party_id, party_members, member_states)
	if not self._game_mechanism.dedicated_party_slot_status_changed then
		return
	end

	self._game_mechanism:dedicated_party_slot_status_changed(server_name, party_id, party_members, member_states)

	if self._is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]
		self._dedicated_server_peer_id = peer_id

		self:send_rpc_clients("rpc_party_slots_status", server_name, party_id, party_members, member_states)
	end
end

GameMechanismManager.rpc_force_start_dedicated_server = function (self, channel_id)
	print("got GameMechanismManager:rpc_force_start_dedicated_server from", channel_id)

	if self._game_mechanism.force_start_dedicated_server then
		self._game_mechanism:force_start_dedicated_server()
	end
end

GameMechanismManager.rpc_switch_level_dedicated_server = function (self, channel_id, level_id)
	print("got GameMechanismManager:rpc_force_start_dedicated_server from", level_id)

	if self._game_mechanism.switch_level_dedicated_server then
		local dedicated_server_peer_id = Managers.mechanism:dedicated_server_peer_id()
		local from_peer_id = CHANNEL_TO_PEER_ID[channel_id]
		local from_dedicated_server = dedicated_server_peer_id == from_peer_id
		local level_key = nil

		if level_id > 0 then
			level_key = NetworkLookup.level_keys[level_id]
		end

		self._game_mechanism:switch_level_dedicated_server(level_key, from_dedicated_server)
	end
end

GameMechanismManager.rpc_sync_adventure_data_to_peer = function (self, channel_id, next_weave_name_id, next_weave_objective_index)
	local next_weave_name = NetworkLookup.weave_names[next_weave_name_id]
	local weave_manager = Managers.weave

	if next_weave_name ~= "n/a" then
		weave_manager:set_next_weave(next_weave_name)
		weave_manager:set_next_objective(next_weave_objective_index)
	end
end

GameMechanismManager.dedicated_server_peer_id = function (self)
	return self._dedicated_server_peer_id
end

GameMechanismManager.reset_dedicated_server_peer_id = function (self)
	self._dedicated_server_peer_id = nil
end

GameMechanismManager.send_rpc_clients = function (self, rpc_name, ...)
	local rpc_func = RPC[rpc_name]

	for peer_id, _ in pairs(self._joined_peers) do
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		if channel_id then
			rpc_func(channel_id, ...)
		end
	end
end

GameMechanismManager.should_run_tutorial = function (self)
	return self._game_mechanism:should_run_tutorial()
end

GameMechanismManager.switch_mechanism = function (self, mechanism_key)
	self._switch_mechanism_key = mechanism_key

	if self._mechanism_key ~= mechanism_key then
		local mechanism_id = NetworkLookup.mechanism_keys[mechanism_key]

		self:send_rpc_clients("rpc_switch_mechanism", mechanism_id)
		Managers.backend:load_mechanism_loadout(self._switch_mechanism_key)
	end
end

GameMechanismManager.switch_mechanism_key = function (self)
	return self._switch_mechanism_key
end

GameMechanismManager.get_custom_lobby_sort = function (self)
	return self._game_mechanism.get_custom_lobby_sort and self._game_mechanism:get_custom_lobby_sort()
end

GameMechanismManager.get_state = function (self)
	return self._game_mechanism:get_state()
end

GameMechanismManager.set_vote_data = function (self, data)
	if self._game_mechanism.set_vote_data then
		self._game_mechanism:set_vote_data(data)
	end
end

GameMechanismManager.setup_party_data = function (self, sync_to_clients)
	local members = nil

	if sync_to_clients then
		members = Managers.party:gather_party_members()
	end

	Managers.party:clear(sync_to_clients)
	self:setup_mechanism_parties()

	if sync_to_clients then
		for _, member in pairs(members) do
			local peer_id = member.peer_id
			local local_player_id = member.local_player_id

			Managers.party:assign_peer_to_party(peer_id, local_player_id)
		end
	end
end

GameMechanismManager.setup_mechanism_parties = function (self)
	local mechanism_key = self._switch_mechanism_key or Development.parameter("mechanism") or self._mechanism_key or "adventure"
	local settings = MechanismSettings[mechanism_key]
	local party_data = settings.party_data

	Managers.party:register_parties(party_data)
end

return
