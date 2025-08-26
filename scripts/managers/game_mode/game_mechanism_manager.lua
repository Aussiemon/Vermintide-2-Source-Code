-- chunkname: @scripts/managers/game_mode/game_mechanism_manager.lua

require("scripts/managers/game_mode/mechanisms/adventure_mechanism")

local mechanism_manager_testify = script_data.testify and require("scripts/managers/game_mode/game_mechanism_manager_testify")

MechanismSettings = {
	adventure = {
		check_matchmaking_hero_availability = true,
		class_name = "AdventureMechanism",
		default_difficulty = "hard",
		default_inventory = true,
		display_name = "game_mode_adventure",
		server_port = 27015,
		server_universe = "carousel",
		tobii_available = true,
		vote_switch_mechanism_background = "vote_switch_mechanism_adventure_background",
		vote_switch_mechanism_text = "vote_switch_mechanism_adventure_description",
		states = {
			"inn",
			"ingame",
			"tutorial",
			"weave",
		},
		venture_end_states_in = {
			"inn",
		},
		venture_end_states_out = {
			"inn",
		},
		party_data = {
			heroes = {
				name = "heroes",
				num_slots = 4,
				party_id = 1,
			},
		},
		gamemode_lookup = {
			default = "adventure",
			keep = "inn",
		},
	},
	weave = {
		check_matchmaking_hero_availability = true,
		class_name = "AdventureMechanism",
		default_inventory = true,
		disable_difficulty_check = true,
		display_name = "game_mode_adventure",
		required_dlc = "scorpion",
		server_port = 27015,
		server_universe = "carousel",
		tobii_available = true,
		vote_switch_mechanism_background = "vote_switch_mechanism_adventure_background",
		vote_switch_mechanism_text = "vote_switch_mechanism_adventure_description",
		states = {
			"inn",
			"ingame",
			"tutorial",
			"weave",
		},
		venture_end_states_in = {
			"inn",
		},
		venture_end_states_out = {
			"inn",
		},
		party_data = {
			heroes = {
				name = "heroes",
				num_slots = 4,
				party_id = 1,
			},
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
		end,
		gamemode_lookup = {
			default = "weave",
			keep = "inn",
		},
	},
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
	"rpc_level_load_started",
	"rpc_carousel_set_local_match",
	"rpc_carousel_set_private_lobby",
	"rpc_set_peer_backend_id",
	"rpc_dedicated_or_player_hosted_search",
	"rpc_reserved_slots_count",
	"rpc_party_slots_status",
	"rpc_force_start_dedicated_server",
	"rpc_switch_level_dedicated_server",
	"rpc_sync_players_session_score",
}

local function check_bool_string(text)
	if text == "false" then
		return false
	else
		return text
	end
end

GameMechanismManager.init = function (self, optional_mechanism_key)
	self._mechanism_key = optional_mechanism_key
	self._game_mechanism = nil
	self._level_seed = nil
	self._locked_director_functions = nil
	self._locked_director_function_ids = nil
	self._venture_started = false

	self:_init_mechanism()
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

	if self._network_client then
		local server_channel = PEER_ID_TO_CHANNEL[self._server_peer_id]
		local session_id = level_transition_handler:get_current_level_session_id()

		RPC.rpc_level_load_started(server_channel, session_id)
	end

	if Managers.party:cleared() then
		self:reset_party_data(self._is_server)
	end
end

GameMechanismManager.create_level_seed = function (self)
	return LevelTransitionHandler.create_level_seed()
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

GameMechanismManager.get_end_of_level_rewards_arguments = function (self, game_won, quickplay, statistics_db, stats_id, level_key, hero_name)
	if self._game_mechanism.get_end_of_level_rewards_arguments then
		return self._game_mechanism:get_end_of_level_rewards_arguments(game_won, quickplay, statistics_db, stats_id, level_key, hero_name)
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

GameMechanismManager.sync_players_session_score = function (self, players_session_score)
	local peer_ids = {}
	local local_player_ids = {}
	local scores = {}

	if self._game_mechanism.sync_players_session_score then
		self._game_mechanism:sync_players_session_score(players_session_score, peer_ids, local_player_ids, scores)
	else
		for _, player_data in pairs(players_session_score) do
			peer_ids[#peer_ids + 1] = player_data.peer_id
			local_player_ids[#local_player_ids + 1] = player_data.local_player_id

			local stats = player_data.group_scores.offense

			for i = 1, #stats do
				scores[#scores + 1] = stats[i].score
			end
		end
	end

	self:send_rpc_clients("rpc_sync_players_session_score", peer_ids, local_player_ids, scores)
	Managers.state.event:trigger("player_session_scores_synced")
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

		self._game_mechanism = nil
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

GameMechanismManager.get_level_end_view_packages = function (self)
	return self._game_mechanism and self._game_mechanism.get_level_end_view_packages and self._game_mechanism:get_level_end_view_packages()
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

GameMechanismManager.can_resync_loadout = function (self)
	local game_mechanism = self._game_mechanism

	if game_mechanism and game_mechanism.can_resync_loadout then
		return game_mechanism:can_resync_loadout()
	else
		return true
	end
end

GameMechanismManager.update_loadout = function (self)
	local game_mechanism = self._game_mechanism

	if game_mechanism and game_mechanism.update_loadout then
		game_mechanism:update_loadout()
	end
end

GameMechanismManager.network_context_created = function (self, lobby, server_peer_id, own_peer_id, is_server, network_handler)
	printf("[GameMechanismManager] network_context_created (server_peer_id=%s, own_peer_id=%s)", server_peer_id, own_peer_id)

	self._lobby = lobby
	self._server_peer_id = server_peer_id
	self._peer_id = own_peer_id
	self._is_server = is_server

	local game_mechanism = self._game_mechanism

	if game_mechanism and game_mechanism.network_context_created then
		game_mechanism:network_context_created(lobby, server_peer_id, own_peer_id, is_server, network_handler)
	end
end

GameMechanismManager.set_network_server = function (self, network_server)
	self._network_server = network_server

	if network_server then
		self._network_client = nil
	end

	if self._game_mechanism.network_handler_set then
		self._game_mechanism:network_handler_set(network_server)
	end
end

GameMechanismManager.set_network_client = function (self, network_client)
	self._network_client = network_client

	if network_client then
		self._network_server = nil
	end

	if self._game_mechanism.network_handler_set then
		self._game_mechanism:network_handler_set(network_client)
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

GameMechanismManager._setup_mechanism_specific_career_settings = function (self)
	for career_name, career_settings in pairs(CareerSettingsOriginal) do
		local mechanism_overrides = career_settings.mechanism_overrides

		if mechanism_overrides then
			local mechanism_override = mechanism_overrides[self._mechanism_key]

			if mechanism_override then
				local new_settings = table.shallow_copy(career_settings)

				table.merge_recursive(new_settings, mechanism_override)
				table.merge(CareerSettings[career_name], new_settings)
			end
		end
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
		if self._game_mechanism then
			if self._game_mechanism.left_mechanism_due_to_switch then
				self._game_mechanism:left_mechanism_due_to_switch()
			end

			if self._game_mechanism.destroy then
				self._game_mechanism:destroy()

				self._game_mechanism = nil
			end
		end

		self:_setup_mechanism_specific_career_settings()

		local class = rawget(_G, settings.class_name)

		self._game_mechanism = class:new(settings)

		if switching_mechanism and self._game_mechanism.entered_mechanism_due_to_switch then
			self._game_mechanism:entered_mechanism_due_to_switch()
		end

		local network_handler = self:network_handler()

		if network_handler and self._game_mechanism.network_handler_set then
			self._game_mechanism:network_handler_set(network_handler)
		end

		if switching_mechanism then
			MechanismOverrides.mechanism_switched()
			Managers.backend:commit(true, function ()
				Managers.backend:switch_mechanism(mechanism_key)
				Managers.backend:load_mechanism_loadout(mechanism_key)
			end)
		elseif Managers.backend:get_backend_mirror() then
			Managers.backend:switch_mechanism(mechanism_key)
			Managers.backend:load_mechanism_loadout(mechanism_key)
		end
	end

	self:_register_mechanism_rpcs()
	self:reset_party_data(false)
	self:clear_stored_challenge_progression_status()
end

GameMechanismManager.mechanism_try_call = function (self, method_name, ...)
	local mechanism = self._game_mechanism

	if mechanism then
		local method = mechanism[method_name]

		if method then
			return true, method(mechanism, ...)
		end
	end

	return false
end

GameMechanismManager.rpc_level_load_started = function (self, channel_id, session_id)
	local level_transition_handler = Managers.level_transition_handler
	local current_session_id = level_transition_handler:get_current_level_session_id()

	if current_session_id ~= session_id then
		Crashify.print_exception("GameMechanismManager", "rpc_level_load_started received with the wrong current state, ignoring it.")

		return
	end

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if not peer_id or peer_id == "0" then
		Crashify.print_exception("GameMechanismManager", "rpc_level_load_started received with unknown channel_id, ignoring it.")

		return
	end

	local network_server = self._network_server

	if not network_server then
		Crashify.print_exception("GameMechanismManager", "rpc_level_load_started as not the server, ignoring it.")

		return
	end

	local peer_initialized_mechanism = network_server:get_peer_initialized_mechanism(peer_id)
	local mechanism_newly_initialized = peer_initialized_mechanism ~= self._mechanism_key

	if mechanism_newly_initialized then
		print("Mechanism says: a client has initialized the mechanism!", peer_id)
		network_server:set_peer_initialized_mechanism(peer_id, self._mechanism_key)

		local state_name = self._game_mechanism:get_state()
		local settings = MechanismSettings[self._mechanism_key]
		local states = settings.states
		local state_id = table.find(states, state_name)

		RPC.rpc_set_current_mechanism_state(channel_id, state_id)
	end

	if self._game_mechanism.sync_mechanism_data then
		self._game_mechanism:sync_mechanism_data(peer_id, mechanism_newly_initialized)
	end
end

GameMechanismManager.create_host_migration_info = function (self, gm_event_end_conditions_met, gm_event_end_reason)
	if self._game_mechanism.create_host_migration_info then
		return self._game_mechanism:create_host_migration_info(gm_event_end_conditions_met, gm_event_end_reason)
	end

	local host_migration_info = {
		host_to_migrate_to = self._network_client.host_to_migrate_to,
	}
	local difficulty = Managers.state.difficulty:get_difficulty()
	local initial_level = Managers.mechanism:default_level_key()

	host_migration_info.level_to_load = initial_level

	local is_private = self._network_client.lobby_client:lobby_data("is_private")
	local matchmaking_type

	matchmaking_type = IS_PS4 and "n/a" or NetworkLookup.matchmaking_types["n/a"]
	host_migration_info.lobby_data = {
		matchmaking_type = matchmaking_type,
		is_private = is_private,
		difficulty = difficulty,
		selected_mission_id = initial_level,
		mission_id = initial_level,
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

GameMechanismManager.mechanism_setting_for_title = function (self, setting_name)
	if not self._title_settings then
		self:refresh_mechanism_setting_for_title()
	end

	fassert(self._mechanism_key, "No mechanism set yet.")

	local data = self._title_settings[self._mechanism_key]
	local setting = data and data[setting_name]

	if setting then
		return setting
	end

	return self:mechanism_setting(setting_name)
end

GameMechanismManager.refresh_mechanism_setting_for_title = function (self)
	fassert(Managers.backend:get_backend_mirror(), "Backend not created yet")

	self._title_settings = Managers.backend:get_title_settings()
end

GameMechanismManager.max_party_members = function (self)
	local settings = MechanismSettings[self._mechanism_key]
	local party_definitions = settings.party_data

	return Managers.party:max_party_members(party_definitions)
end

GameMechanismManager.max_instance_members = function (self)
	fassert(self._mechanism_key, "No mechanism set yet.")

	if self._game_mechanism.max_instance_members then
		local max_members = self._game_mechanism:max_instance_members(self._lobby)

		assert(max_members > 0, "[GameMechanismManager] At least one must be provided to lobbies.")

		return max_members
	end

	local num_slots = self:max_party_members()

	assert(num_slots > 0, "[GameMechanismManager] At least one must be provided to lobbies. Parties is not set up yet.")

	return num_slots
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

GameMechanismManager.preferred_slot_id = function (self, party_id, peer_id, local_player_id)
	if self._game_mechanism and self._game_mechanism.preferred_slot_id then
		return self._game_mechanism:preferred_slot_id(party_id, peer_id, local_player_id)
	end

	return nil
end

GameMechanismManager.profile_available_for_peer = function (self, party_id, peer_id, profile_index)
	local reserver_peer_id = self._profile_synchronizer:get_profile_index_reservation(party_id, profile_index)

	return not reserver_peer_id or reserver_peer_id == peer_id
end

GameMechanismManager.profile_changed = function (self, peer_id, local_player_id, profile_index, career_index, is_bot)
	if self._game_mechanism and self._game_mechanism.profile_changed then
		return self._game_mechanism:profile_changed(peer_id, local_player_id, profile_index, career_index, is_bot)
	end

	return false
end

GameMechanismManager.profile_synchronizer = function (self)
	return self._profile_synchronizer
end

GameMechanismManager.get_players_session_score = function (self, statistics_db, profile_synchronizer, saved_scoreboard_stats)
	local scoreboard

	if not self._is_server then
		scoreboard = self.synced_players_session_score
	end

	if not scoreboard then
		if self._game_mechanism.get_players_session_score then
			scoreboard = self._game_mechanism:get_players_session_score(statistics_db, profile_synchronizer, saved_scoreboard_stats)
		end

		scoreboard = scoreboard or ScoreboardHelper.get_grouped_topic_statistics(statistics_db, profile_synchronizer, saved_scoreboard_stats)
	end

	return scoreboard
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

GameMechanismManager.progress_state = function (self, skip_sync)
	local new_state = self._game_mechanism:progress_state()
	local settings = MechanismSettings[self._mechanism_key]
	local states = settings.states
	local state_id = table.find(states, new_state)

	fassert(state_id, "State not found in mechanism settings")

	if not skip_sync then
		self:send_rpc_clients("rpc_set_current_mechanism_state", state_id)
	end
end

GameMechanismManager.get_starting_level = function (self)
	local level_key = self._game_mechanism.get_starting_level and self._game_mechanism:get_starting_level() or LevelSettings.default_start_level

	return level_key
end

GameMechanismManager.default_level_key = function (self)
	local boot_level_name = Boot.loading_context and Boot.loading_context.level_key

	if boot_level_name then
		return boot_level_name
	end

	local attract_mode_level = check_bool_string(Development.parameter("attract_mode")) and BenchmarkSettings.auto_host_level
	local level_name = check_bool_string(Development.parameter("auto_host_level")) or Development.parameter("vs_auto_search") and "carousel_hub" or attract_mode_level or self:get_starting_level()

	return level_name
end

GameMechanismManager.get_loading_tip = function (self)
	local mechanism = self._game_mechanism

	if mechanism.get_loading_tip then
		return mechanism:get_loading_tip()
	end

	return nil
end

GameMechanismManager.backend_profiles_loaded = function (self)
	if self._game_mechanism.backend_profiles_loaded then
		self._game_mechanism:backend_profiles_loaded()
	end
end

GameMechanismManager.try_reserve_game_server_slots = function (self, reserver, peers, invitee)
	local game_mode_manager = Managers.state.game_mode

	if game_mode_manager and not game_mode_manager:is_reservable() then
		print("Rejected game server reservation because game mode denies joining")

		return false
	end

	if self._game_mechanism.try_reserve_game_server_slots then
		return self._game_mechanism:try_reserve_game_server_slots(reserver, peers, invitee)
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
		level_transition_handler:promote_next_level_data()
	end
end

GameMechanismManager._on_venture_start = function (self, loading_context)
	self._venture_started = true

	local is_server = self._is_server
	local statistics_db = StatisticsDatabase:new()

	Managers.venture.statistics = statistics_db
	Managers.venture.challenge = ChallengeManager:new(statistics_db, is_server)
	Managers.venture.quickplay = QuickplayManager:new(loading_context, is_server)

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

GameMechanismManager.check_venture_start = function (self, loading_context)
	if not self._venture_started then
		self:_on_venture_start(loading_context)
	end
end

GameMechanismManager.check_venture_end = function (self, left_lobby)
	local state = self._game_mechanism:get_state()
	local prior_state = self._game_mechanism:get_prior_state()
	local venture_end_states_in = self:mechanism_setting("venture_end_states_in")
	local venture_end_states_out = self:mechanism_setting("venture_end_states_out")

	if left_lobby or self._venture_ended_manually or self._venture_started and (table.contains(venture_end_states_in, state) or table.contains(venture_end_states_out, prior_state)) then
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

	self:mechanism_try_call("set_local_match", local_match)
end

GameMechanismManager.rpc_carousel_set_private_lobby = function (self, channel_id, private_lobby)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._server_peer_id then
		return
	end

	self:mechanism_try_call("set_private_lobby", private_lobby)
end

GameMechanismManager.rpc_dedicated_or_player_hosted_search = function (self, channel_id, use_dedicated_servers, use_dedicated_aws_servers, use_player_hosted)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._server_peer_id then
		return
	end

	self:mechanism_try_call("set_dedicated_or_player_hosted_search", use_dedicated_servers, use_dedicated_aws_servers, use_player_hosted)
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
		local level_key

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
	local unsynced_players_session_score
	local mechanism_stats_by_player = ScoreboardHelper.num_stats_per_player

	if self._game_mechanism.get_players_session_score then
		unsynced_players_session_score, mechanism_stats_by_player = self._game_mechanism:get_players_session_score(statistics_db, self._profile_synchronizer)
		mechanism_stats_by_player = mechanism_stats_by_player or ScoreboardHelper.num_stats_per_player
	end

	unsynced_players_session_score = unsynced_players_session_score or ScoreboardHelper.get_grouped_topic_statistics(statistics_db, self._profile_synchronizer)

	if mechanism_stats_by_player ~= num_stats_per_player then
		Crashify.print_exception("GameMechanismManager", "rpc_sync_players_session_score received with mismatching stats_per_player count, probably the host was modded. Ignoring the host score and using client's.")

		self.synced_players_session_score = unsynced_players_session_score

		return
	end

	if self._game_mechanism.extract_players_session_score then
		self._game_mechanism:extract_players_session_score(num_players, num_stats_per_player, peer_ids, local_player_ids, unsynced_players_session_score, players_session_score)
	else
		for _, player_data in pairs(unsynced_players_session_score) do
			local peer_id = player_data.peer_id
			local local_player_id = player_data.local_player_id

			for i = 1, num_players do
				if peer_id == peer_ids[i] and local_player_id == local_player_ids[i] then
					local scores = player_data.group_scores.offense
					local start_value = (i - 1) * num_stats_per_player + 1
					local score_index = 1

					for j = start_value, start_value + num_stats_per_player - 1 do
						scores[score_index].score = players_session_score[j]
						score_index = score_index + 1
					end

					break
				end
			end
		end
	end

	self.synced_players_session_score = unsynced_players_session_score

	Managers.state.event:trigger("player_session_scores_synced")
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

GameMechanismManager.reset_party_data = function (self, sync_to_clients)
	local members

	if sync_to_clients then
		members = Managers.party:gather_party_members()
	end

	Managers.party:clear_parties(sync_to_clients)
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

	if self._game_mechanism.setup_mechanism_parties then
		self._game_mechanism:setup_mechanism_parties(self)
	end
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

GameMechanismManager.get_player_level_fallback = function (self, player)
	if self._game_mechanism and self._game_mechanism.get_player_level_fallback then
		return self._game_mechanism:get_player_level_fallback(player)
	end
end

GameMechanismManager.get_slot_reservation_handler = function (self, owner, session_type)
	if self._game_mechanism.get_slot_reservation_handler then
		return self._game_mechanism:get_slot_reservation_handler(owner, session_type)
	end
end

GameMechanismManager.get_all_reservation_handlers_by_owner = function (self, owner)
	if self._game_mechanism.get_all_reservation_handlers_by_owner then
		return self._game_mechanism:get_all_reservation_handlers_by_owner(owner)
	end
end

GameMechanismManager.rpc_set_peer_backend_id = function (self, channel_id, peer_backend_id)
	if not self._is_server then
		Application.warning("[GameMechanismManager:rpc_set_peer_backend_id] sent rpc to non-server peer")

		return
	end

	if self._game_mechanism.set_peer_backend_id then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self._game_mechanism:set_peer_backend_id(peer_id, peer_backend_id)
	end
end

GameMechanismManager.get_social_wheel_class = function (self)
	local social_wheel_class = MechanismSettings[self._mechanism_key].social_wheel

	return social_wheel_class and social_wheel_class or "SocialWheelUI"
end

GameMechanismManager.load_end_screen_resources = function (self)
	if self._game_mechanism.load_end_screen_resources then
		self._game_mechanism:load_end_screen_resources()
	end
end

GameMechanismManager.unload_end_screen_resources = function (self)
	if self._game_mechanism.unload_end_screen_resources then
		self._game_mechanism:unload_end_screen_resources()
	end
end

GameMechanismManager.is_peer_fully_synced = function (self, peer_id)
	if self._game_mechanism.is_peer_fully_synced then
		return self._game_mechanism:is_peer_fully_synced(peer_id)
	end

	return true
end

GameMechanismManager.update_testify = function (self, dt, t)
	Testify:poll_requests_through_handler(mechanism_manager_testify, self)

	if self._game_mechanism.update_testify then
		self._game_mechanism:update_testify(dt, t)
	end
end

GameMechanismManager.player_joined_party = function (self, peer_id, local_player_id, party_id, slot_id, is_bot)
	if self._game_mechanism.player_joined_party then
		self._game_mechanism:player_joined_party(peer_id, local_player_id, party_id, slot_id, is_bot)
	end
end

GameMechanismManager.reserved_party_id_by_peer = function (self, peer_id)
	return self._game_mechanism:reserved_party_id_by_peer(peer_id)
end

GameMechanismManager.try_reserve_profile_for_peer_by_mechanism = function (self, peer_id, profile_index, career_index, allow_switching)
	return self._game_mechanism:try_reserve_profile_for_peer_by_mechanism(self._profile_synchronizer, peer_id, profile_index, career_index, allow_switching)
end

GameMechanismManager.get_persistent_profile_index_reservation = function (self, peer_id)
	if self._profile_synchronizer then
		local profile_index, career_index = self._profile_synchronizer:get_persistent_profile_index_reservation(peer_id)

		return profile_index, career_index
	end
end

GameMechanismManager.remote_client_connecting = function (self, peer_id)
	if self._game_mechanism.remote_client_connecting then
		self._game_mechanism:remote_client_connecting(peer_id)
	end
end

GameMechanismManager.remote_client_disconnected = function (self, peer_id)
	if self._game_mechanism.remote_client_disconnected then
		self._game_mechanism:remote_client_disconnected(peer_id)
	end
end

local EMPTY_TABLE = {}

GameMechanismManager.get_challenge_progression_status = function (self, optional_category)
	return Managers.state.achievement and Managers.state.achievement:get_challenge_progression(optional_category) or EMPTY_TABLE
end

GameMechanismManager.store_challenge_progression_status = function (self, force_store, optional_category)
	if self._game_mechanism.store_challenge_progression_status then
		self._game_mechanism:store_challenge_progression_status(force_store, optional_category)
	end
end

GameMechanismManager.get_stored_challenge_progression_status = function (self, optional_category)
	if self._game_mechanism.get_stored_challenge_progression_status then
		return self._game_mechanism:get_stored_challenge_progression_status(optional_category)
	end

	return EMPTY_TABLE
end

GameMechanismManager.clear_stored_challenge_progression_status = function (self, optional_category)
	if self._game_mechanism.clear_stored_challenge_progression_status then
		return self._game_mechanism:clear_stored_challenge_progression_status(optional_category)
	end
end

GameMechanismManager.state_context_set_up = function (self)
	if self._game_mechanism.state_context_set_up then
		return self._game_mechanism:state_context_set_up()
	end
end
