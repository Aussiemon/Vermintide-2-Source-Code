require("scripts/managers/game_mode/mechanisms/adventure_mechanism")

MechanismSettings = {
	adventure = {
		server_port = 27015,
		display_name = "tutorial_intro_adventure",
		default_inventory = true,
		server_universe = "carousel",
		check_matchmaking_hero_availability = true,
		tobii_available = true,
		max_members = 4,
		vote_switch_mechanism_background = "vote_switch_mechanism_adventure_background",
		vote_switch_mechanism_text = "vote_switch_mechanism_adventure_description",
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
	},
	weave = {
		disable_difficulty_check = true,
		display_name = "game_mode_adventure",
		default_inventory = true,
		server_port = 27015,
		check_matchmaking_hero_availability = true,
		tobii_available = true,
		class_name = "AdventureMechanism",
		server_universe = "carousel",
		vote_switch_mechanism_background = "vote_switch_mechanism_adventure_background",
		vote_switch_mechanism_text = "vote_switch_mechanism_adventure_description",
		max_members = 4,
		required_dlc = "scorpion",
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
		},
		extra_requirements_function = function (optional_statistics_db, optional_stats_id)
			if script_data.unlock_all_levels then
				return true
			end

			local backend_stats = Managers.backend:get_stats()

			for _, level_key in pairs(MainGameLevels) do
				local level_settings = LevelSettings[level_key]

				if level_settings.game_mode == "adventure" then
					if optional_statistics_db then
						local value = optional_statistics_db:get_persistent_stat(optional_stats_id, "completed_levels", level_key)
						local level_completed = value and value ~= 0

						if not level_completed then
							return false
						end
					elseif (tonumber(backend_stats["completed_levels_" .. level_key]) or 0) < 1 then
						return false
					end
				end
			end

			local scorpion_dlc_levels = GameActs.act_scorpion

			for _, level_key in pairs(scorpion_dlc_levels) do
				local level_settings = LevelSettings[level_key]

				if level_settings.game_mode == "adventure" then
					if optional_statistics_db then
						local value = optional_statistics_db:get_persistent_stat(optional_stats_id, "completed_levels", level_key)
						local level_completed = value and value ~= 0

						if not level_completed then
							return false
						end
					elseif (tonumber(backend_stats["completed_levels_" .. level_key]) or 0) < 1 then
						return false
					end
				end
			end

			return true
		end
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
	"rpc_set_current_mechanism_state",
	"rpc_carousel_set_local_match",
	"rpc_carousel_set_private_lobby",
	"rpc_dedicated_or_player_hosted_search",
	"rpc_reserved_slots_count",
	"rpc_party_slots_status",
	"rpc_force_start_dedicated_server",
	"rpc_switch_level_dedicated_server",
	"rpc_sync_players_session_score",
	"rpc_sync_adventure_data_to_peer"
}

local function check_bool_string(text)
	if text == "false" then
		return false
	else
		return text
	end
end

GameMechanismManager.init = function (self)
	self._mechanism_key = nil
	self._game_mechanism = nil
	self._level_seed = nil
	self._locked_director_functions = nil
	self._locked_director_function_ids = nil
	self._venture_started = false

	self:_init_mechanism()
	self:_setup_party_data(false)
end

GameMechanismManager.handle_level_load = function (self, done_again_during_loading)
	local level_transition_handler = Managers.level_transition_handler
	local new_mechanism_name = level_transition_handler:get_current_mechanism()
	local current_mechanism_name = self._mechanism_key

	if not done_again_during_loading then
		self._last_mechanism_switch = current_mechanism_name
	end

	if not self._game_mechanism or current_mechanism_name ~= new_mechanism_name then
		self:_init_mechanism()
	end

	if Managers.party:cleared() then
		self:_setup_party_data(self._is_server)
	end
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
	local level_seed = Managers.level_transition_handler:get_current_level_seed()

	if self._game_mechanism.get_level_seed then
		return self._game_mechanism:get_level_seed(level_seed, optional_system)
	else
		return level_seed
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

GameMechanismManager.sync_players_session_score = function (self, statistics_db, profile_synchronizer, players_session_score)
	local peer_ids = {}
	local local_player_ids = {}
	local scores = {}

	for _, player_data in pairs(players_session_score) do
		peer_ids[#peer_ids + 1] = player_data.peer_id
		local_player_ids[#local_player_ids + 1] = player_data.local_player_id
		local stats = player_data.group_scores.offense

		for i = 1, #stats, 1 do
			scores[#scores + 1] = stats[i].score
		end
	end

	self:send_rpc_clients("rpc_sync_players_session_score", peer_ids, local_player_ids, scores)
end

GameMechanismManager.network_server = function (self)
	return self._network_server
end

GameMechanismManager.network_client = function (self)
	return self._network_client
end

GameMechanismManager.network_handler = function (self)
	return self._network_server or self._network_client
end

GameMechanismManager.set_level_seed = function (self, seed)
	print("GameMechanismManager setting level seed:", seed)

	self._level_seed = seed
end

GameMechanismManager.generate_locked_director_functions = function (self, level_key)
	local locked_director_functions = ConflictUtils.generate_conflict_director_locked_functions(level_key)

	return locked_director_functions
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

GameMechanismManager.network_context_created = function (self, lobby, server_peer_id, own_peer_id, is_server, network_handler)
	printf("[GameMechanismManager] network_context_created (server_peer_id=%s, own_peer_id=%s)", server_peer_id, own_peer_id)

	self._lobby = lobby
	self._server_peer_id = server_peer_id
	self._peer_id = own_peer_id
	self._is_server = is_server

	if is_server then
		self._network_server = network_handler
		self._network_client = nil
	else
		self._network_client = network_handler
		self._network_server = nil
	end

	local game_mechanism = self._game_mechanism

	if game_mechanism and game_mechanism.network_context_created then
		game_mechanism:network_context_created(lobby, server_peer_id, own_peer_id, is_server, network_handler)
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
	self._network_client = nil
	self._network_server = nil
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

GameMechanismManager._init_mechanism = function (self)
	local level_transition_handler = Managers.level_transition_handler
	local mechanism_key = level_transition_handler:get_current_mechanism()

	print("initializing mechanism to:", mechanism_key)
	fassert(MechanismSettings[mechanism_key], "[GameMechanismManager] Tried to set unknown mechanism %q", tostring(mechanism_key))

	local settings = MechanismSettings[mechanism_key]
	local switching_mechanism = self._mechanism_key and self._mechanism_key ~= mechanism_key
	self._mechanism_key = mechanism_key

	self:_unregister_mechanism_rpcs()

	if not self._game_mechanism or switching_mechanism then
		if self._game_mechanism and self._game_mechanism.left_mechanism_due_to_switch then
			self._game_mechanism:left_mechanism_due_to_switch()
		end

		local class = rawget(_G, settings.class_name)
		self._game_mechanism = class:new(settings)

		if switching_mechanism and self._game_mechanism.entered_mechanism_due_to_switch then
			self._game_mechanism:entered_mechanism_due_to_switch()
		end

		if switching_mechanism then
			Managers.backend:commit(true)
			Managers.backend:load_mechanism_loadout(mechanism_key)
		end
	end

	self:_register_mechanism_rpcs()

	SaveData.last_mechanism = mechanism_key
end

GameMechanismManager.create_host_migration_info = function (self, gm_event_end_conditions_met, gm_event_end_reason)
	if self._game_mechanism.create_host_migration_info then
		return self._game_mechanism:create_host_migration_info(gm_event_end_conditions_met, gm_event_end_reason)
	end

	local host_migration_info = {
		host_to_migrate_to = self._network_client.host_to_migrate_to
	}
	local difficulty = Managers.state.difficulty:get_difficulty()
	local initial_level = Managers.mechanism:default_level_key()
	host_migration_info.level_to_load = initial_level
	local is_private = self._network_client.lobby_client:lobby_data("is_private")
	local matchmaking_type = nil

	if IS_PS4 then
		matchmaking_type = "n/a"
	else
		matchmaking_type = NetworkLookup.matchmaking_types["n/a"]
	end

	host_migration_info.lobby_data = {
		matchmaking_type = matchmaking_type,
		is_private = is_private,
		difficulty = difficulty,
		selected_mission_id = initial_level,
		mission_id = initial_level
	}

	return host_migration_info
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
	self._game_mechanism:game_round_ended(t, dt, reason, reason_data)
end

GameMechanismManager.start_next_round = function (self)
	local game_mode_key, side_compositions, game_mode_settings = self._game_mechanism:start_next_round()

	return game_mode_key, side_compositions, game_mode_settings
end

GameMechanismManager.get_current_level_key = function (self)
	return Managers.level_transition_handler:get_current_level_key()
end

GameMechanismManager.get_current_level_keys = function (self)
	return Managers.level_transition_handler:get_current_level_key()
end

GameMechanismManager.game_mechanism = function (self)
	return self._game_mechanism
end

GameMechanismManager.current_mechanism_name = function (self)
	return self._mechanism_key
end

GameMechanismManager.get_last_mechanism_switch = function (self)
	return self._last_mechanism_switch
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

GameMechanismManager.is_packages_loaded = function (self)
	if self._game_mechanism.is_packages_loaded then
		return self._game_mechanism:is_packages_loaded()
	end

	return true
end

GameMechanismManager.load_packages = function (self)
	if self._game_mechanism.load_packages then
		self._game_mechanism:load_packages()
	end
end

GameMechanismManager.client_joined = function (self, peer_id)
	print("Mechanism says: a client joined the game!", peer_id)

	local channel_id = PEER_ID_TO_CHANNEL[peer_id]
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
	if self._game_mechanism.client_left then
		self._game_mechanism:client_left(peer_id)
	end
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
	if self._is_server then
		if self._game_mechanism.get_players_session_score then
			return self._game_mechanism:get_players_session_score(statistics_db, profile_synchronizer, saved_scoreboard_stats)
		end

		return ScoreboardHelper.get_grouped_topic_statistics(statistics_db, profile_synchronizer, saved_scoreboard_stats)
	else
		return self.synced_players_session_score
	end
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

GameMechanismManager.setting = function (self, key)
	return MechanismSettings[self._mechanism_key][key]
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

GameMechanismManager.default_level_key = function (self)
	local boot_level_name = Boot.loading_context and Boot.loading_context.level_key

	if boot_level_name then
		return boot_level_name
	end

	local attract_mode_level = check_bool_string(Development.parameter("attract_mode")) and BenchmarkSettings.auto_host_level
	local level_name = check_bool_string(Development.parameter("auto_host_level")) or attract_mode_level or self:get_starting_level()

	return level_name
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
	if not self._is_server then
		return
	end

	if self._game_mechanism and self._game_mechanism.debug_load_level then
		self._game_mechanism:debug_load_level(level_name, environment_variation_id)
	else
		local level_transition_handler = Managers.level_transition_handler

		level_transition_handler:set_next_level(level_name, environment_variation_id)
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

GameMechanismManager.check_venture_end = function (self, left_lobby)
	local state = self._game_mechanism:get_state()
	local prior_state = self._game_mechanism:get_prior_state()
	local venture_end_states_in = self:mechanism_setting("venture_end_states_in")
	local venture_end_states_out = self:mechanism_setting("venture_end_states_out")

	if left_lobby or self._venture_ended_manually or (self._venture_started and (table.contains(venture_end_states_in, state) or table.contains(venture_end_states_out, prior_state))) then
		self:_on_venture_end()
	end

	self._venture_ended_manually = nil
end

GameMechanismManager.manual_end_venture = function (self)
	self._venture_ended_manually = true
end

GameMechanismManager.is_venture_over = function (self)
	if self._game_mechanism.is_venture_over then
		return self._game_mechanism:is_venture_over()
	end

	local game_mode_manager = Managers.state.game_mode

	return game_mode_manager and game_mode_manager:is_game_mode_ended()
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

GameMechanismManager.rpc_sync_players_session_score = function (self, channel_id, peer_ids, local_player_ids, players_session_score)
	local num_players = #peer_ids
	local num_stats_per_player = #players_session_score / num_players
	local statistics_db = Managers.player:statistics_db()
	local unsynced_players_session_score = nil

	if self._game_mechanism.get_players_session_score then
		unsynced_players_session_score = self._game_mechanism:get_players_session_score(statistics_db, self._profile_synchronizer)
	else
		unsynced_players_session_score = ScoreboardHelper.get_grouped_topic_statistics(statistics_db, self._profile_synchronizer)
	end

	if ScoreboardHelper.num_stats_per_player ~= num_stats_per_player then
		Crashify.print_exception("GameMechanismManager", "rpc_sync_players_session_score received with mismatching stats_per_player count, probably the host was modded. Ignoring the host score and using client's.")

		self.synced_players_session_score = unsynced_players_session_score

		return
	end

	for _, player_data in pairs(unsynced_players_session_score) do
		local peer_id = player_data.peer_id
		local local_player_id = player_data.local_player_id

		for i = 1, num_players, 1 do
			if peer_id == peer_ids[i] and local_player_id == local_player_ids[i] then
				local scores = player_data.group_scores.offense
				local start_value = (i - 1) * num_stats_per_player + 1
				local score_index = 1

				for j = start_value, (start_value + num_stats_per_player) - 1, 1 do
					scores[score_index].score = players_session_score[j]
					score_index = score_index + 1
				end

				break
			end
		end
	end

	self.synced_players_session_score = unsynced_players_session_score
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
	local peers = self._network_server and self._network_server:get_peers()

	if not peers then
		return
	end

	local rpc_func = RPC[rpc_name]

	for _, peer_id in ipairs(peers) do
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		if peer_id ~= self._peer_id and channel_id then
			rpc_func(channel_id, ...)
		end
	end
end

GameMechanismManager.should_run_tutorial = function (self)
	return self._game_mechanism:should_run_tutorial()
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

GameMechanismManager._setup_party_data = function (self, sync_to_clients)
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
	local settings = MechanismSettings[self._mechanism_key]
	local party_data = settings.party_data

	Managers.party:register_parties(party_data)
end

GameMechanismManager.get_level_dialogue_context = function (self)
	if self._game_mechanism.get_level_dialogue_context then
		return self._game_mechanism:get_level_dialogue_context()
	end

	return {}
end

GameMechanismManager.override_hub_level = function (self, new_hub_level_key)
	if self._game_mechanism and self._game_mechanism.override_hub_level then
		self._game_mechanism:override_hub_level(new_hub_level_key)
	end
end

return
