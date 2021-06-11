require("scripts/managers/game_mode/mechanisms/deus_run_controller")
require("scripts/settings/dlcs/morris/deus_default_graph_settings")
require("scripts/settings/dlcs/morris/deus_node_settings")
require("scripts/settings/dlcs/morris/deus_theme_settings")

DeusMechanism = class(DeusMechanism)
DeusMechanism.name = "Deus"
local RPCS = {
	"rpc_deus_setup_run"
}
local DEUS_CAREERS = {}

for _, profile_settings in ipairs(SPProfiles) do
	if profile_settings.affiliation == "heroes" then
		local careers = profile_settings.careers

		for _, career_settings in ipairs(careers) do
			DEUS_CAREERS[#DEUS_CAREERS + 1] = career_settings.name
		end
	end
end

local REAL_PLAYER_LOCAL_ID = 1
local HUB_LEVEL_NAME = "morris_hub"
local HUB_GAME_MODE_KEY = "inn_deus"
local HUB_STATE = "inn_deus"
local MAP_LEVEL_NAME = "dlc_morris_map"
local MAP_GAME_MODE_KEY = "map_deus"
local MAP_STATE = "map_deus"
local INGAME_GAME_MODE_KEY = "deus"
local INGAME_STATE = "ingame_deus"

local function node_type_to_state(node_type)
	local current_node_config = DeusNodeSettings[node_type]

	return current_node_config.mechanism_state
end

local function node_type_to_game_mode(node_type)
	local current_node_config = DeusNodeSettings[node_type]

	return current_node_config.game_mode_key
end

local function level_to_node_type(level)
	if level == MAP_LEVEL_NAME then
		return "map"
	end

	if level == HUB_LEVEL_NAME then
		return "inn"
	end

	return "ingame"
end

local function print_vote_request(params)
	local level_key = params.mission_id
	local difficulty_key = params.difficulty
	local quick_game = params.quick_game
	local private_game = params.private_game
	local always_host = params.always_host
	local strict_matchmaking = params.strict_matchmaking
	local matchmaking_type = params.matchmaking_type
	local twitch_enabled = params.twitch_enabled

	print("............................................................................................................")
	print("............................................................................................................")
	printf("GAME START SETTINGS -> Level: %s | Difficulty: %s | Private: %s | Always Host: %s | Strict Matchmaking: %s | Quick Game: %s | Matchmaking Type: %s | Twitch: %s", (level_key and level_key) or "Not specified", difficulty_key, (private_game and "yes") or "no", (always_host and "yes") or "no", (strict_matchmaking and "yes") or "no", (quick_game and "yes") or "no", matchmaking_type or "Not specified", (twitch_enabled and "Yes") or "No")
	print("............................................................................................................")
	print("............................................................................................................")
end

local vote_requests = {
	deus_quickplay = function (request_type, params)
		local vote_data = {
			mechanism = "deus",
			difficulty = params.difficulty,
			quick_game = params.quick_game,
			private_game = params.private_game,
			always_host = params.always_host,
			strict_matchmaking = params.strict_matchmaking,
			matchmaking_type = params.matchmaking_type,
			vote_type = params.request_type
		}

		Managers.state.voting:request_vote("deus_settings_vote", vote_data, Network.peer_id())
	end,
	deus_custom = function (request_type, params)
		local vote_data = {
			mechanism = "deus",
			mission_id = params.mission_id,
			difficulty = params.difficulty,
			quick_game = params.quick_game,
			private_game = params.private_game,
			always_host = params.always_host,
			strict_matchmaking = params.strict_matchmaking,
			dominant_god = params.dominant_god,
			matchmaking_type = params.matchmaking_type,
			vote_type = params.request_type
		}

		Managers.state.voting:request_vote("deus_settings_vote", vote_data, Network.peer_id())
	end,
	deus_twitch = function (request_type, params)
		local vote_data = {
			mechanism = "deus",
			mission_id = params.mission_id,
			difficulty = params.difficulty,
			quick_game = params.quick_game,
			private_game = params.private_game,
			always_host = params.always_host,
			strict_matchmaking = params.strict_matchmaking,
			dominant_god = params.dominant_god,
			matchmaking_type = params.matchmaking_type,
			vote_type = params.request_type
		}

		Managers.state.voting:request_vote("deus_settings_vote", vote_data, Network.peer_id())
	end
}

local function get_difficulty_tweak_for_progress(run_progress)
	return math.round(math.lerp(-DifficultyTweak.range, DifficultyTweak.range, run_progress))
end

local function get_next_level_data(deus_run_controller, in_map)
	local level_key, environment_variation_id, level_seed = nil
	local mechanism = "deus"
	local game_mode_key, conflict_settings, locked_director_functions, run_difficulty, difficulty_tweak = nil
	local extra_packages = {}

	if not deus_run_controller or deus_run_controller:get_run_ended() then
		level_key = HUB_LEVEL_NAME
	elseif in_map then
		level_key = MAP_LEVEL_NAME
	else
		local current_node = deus_run_controller:get_current_node()
		local current_node_type = current_node.node_type
		level_key = current_node.level
		level_seed = current_node.level_seed
		environment_variation_id = LevelHelper:get_random_variation_id(level_key)
		game_mode_key = node_type_to_game_mode(current_node_type)
		run_difficulty = deus_run_controller:get_run_difficulty()
		local current_run_progress = current_node.run_progress
		difficulty_tweak = get_difficulty_tweak_for_progress(current_run_progress)
		conflict_settings = current_node.conflict_settings
		locked_director_functions = nil
		local curse_name = current_node.curse

		if curse_name then
			local curse = MutatorTemplates[curse_name]
			local package_name = curse.package_name

			table.insert(extra_packages, package_name)
		end
	end

	return level_key, environment_variation_id, level_seed, mechanism, game_mode_key, conflict_settings, locked_director_functions, run_difficulty, difficulty_tweak, extra_packages
end

DeusMechanism.init = function (self, settings)
	self._is_server = true
	self._hero_profiles = table.clone(PROFILES_BY_AFFILIATION.heroes)
	self._state = HUB_STATE
end

DeusMechanism._reset = function (self, settings)
	if self._deus_run_controller then
		self._deus_run_controller:destroy()

		self._deus_run_controller = nil
	end

	self._run_id = nil
	self._run_seed = nil
	self._final_round = false

	if self._is_server then
		self:_update_current_state()
	end
end

DeusMechanism.network_context_created = function (self, lobby, server_peer_id, own_peer_id, is_server, network_handler)
	self._is_server = is_server

	if self._deus_run_controller then
		Managers.mechanism:manual_end_venture()

		if is_server and not self._deus_run_controller:get_run_ended() then
			self._deus_run_controller:network_context_created(lobby, server_peer_id, own_peer_id, is_server, network_handler)
		else
			self._deus_run_controller:destroy()

			self._deus_run_controller = nil
		end
	end

	if is_server then
		self:_update_current_state()
	end
end

DeusMechanism.network_context_destroyed = function (self)
	return
end

DeusMechanism.handle_ingame_enter = function (self, game_mode)
	if self._deus_run_controller then
		self._deus_run_controller:full_sync()
		self:_update_own_avatar_info()
		self._deus_run_controller:handle_level_start()

		if game_mode == INGAME_GAME_MODE_KEY and self._deus_run_controller:is_server() then
			self:_send_level_started_tracking_data()
		end
	end

	if Development.parameter("deus-auto-host") and game_mode == HUB_GAME_MODE_KEY then
		Managers.state.game_mode:complete_level()
	end
end

DeusMechanism.handle_ingame_exit = function (self, exit_type)
	if exit_type == "join_lobby_failed" or exit_type == "left_game" or exit_type == "lobby_state_failed" or exit_type == "kicked_by_server" or exit_type == "afk_kick" or exit_type == "quit_game" or exit_type == "return_to_pc_menu" or exit_type == "backend_disconnected" then
		self:_reset()
	end
end

DeusMechanism.create_host_migration_info = function (self, gm_event_end_conditions_met, gm_event_end_reason)
	local network_handler = Managers.mechanism:network_handler()
	local deus_run_controller = self._deus_run_controller
	local new_host = network_handler.host_to_migrate_to

	if deus_run_controller and new_host then
		local new_host_peer_id = new_host.peer_id
		local profile_index = deus_run_controller:get_player_profile(new_host_peer_id, REAL_PLAYER_LOCAL_ID)
		local health_state = profile_index ~= 0 and deus_run_controller:get_player_health_state(new_host_peer_id, REAL_PLAYER_LOCAL_ID)

		if health_state ~= "alive" then
			deus_run_controller = nil
		end
	end

	if deus_run_controller and deus_run_controller:get_run_ended() then
		deus_run_controller = nil
	end

	if deus_run_controller and not new_host then
		deus_run_controller = nil
	end

	local in_map = self._state == MAP_STATE
	local host_migration_info = {
		host_to_migrate_to = new_host
	}
	local level_key, environment_variation_id, level_seed, mechanism, game_mode_key, conflict_settings, locked_director_functions, run_difficulty, difficulty_tweak, extra_packages = get_next_level_data(deus_run_controller, in_map)
	host_migration_info.level_data = {
		level_key = level_key,
		environment_variation_id = environment_variation_id,
		level_seed = level_seed,
		mechanism = mechanism,
		game_mode_key = game_mode_key,
		conflict_settings = conflict_settings,
		locked_director_functions = locked_director_functions,
		difficulty = run_difficulty,
		difficulty_tweak = difficulty_tweak,
		extra_packages = extra_packages
	}
	local is_private = network_handler.lobby_client:lobby_data("is_private")
	local matchmaking_type = nil
	matchmaking_type = (IS_PS4 and "n/a") or ((not deus_run_controller or NetworkLookup.matchmaking_types["n/a"]) and (network_handler.lobby_client:lobby_data("matchmaking_type") or NetworkLookup.matchmaking_types["n/a"]))
	host_migration_info.lobby_data = {
		is_private = is_private,
		difficulty = run_difficulty,
		difficulty_tweak = difficulty_tweak,
		selected_mission_id = level_key,
		mission_id = level_key,
		matchmaking_type = matchmaking_type,
		mechanism = mechanism
	}

	return host_migration_info
end

DeusMechanism.register_rpcs = function (self, network_event_delegate)
	self:unregister_rpcs()

	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	if self._deus_run_controller then
		self._deus_run_controller:register_rpcs(self._network_event_delegate)
	end
end

DeusMechanism.unregister_rpcs = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end

	if self._deus_run_controller then
		self._deus_run_controller:unregister_rpcs()
	end
end

DeusMechanism.can_resync_loadout = function (self)
	local level_transition_handler = Managers.level_transition_handler
	local game_mode = level_transition_handler:get_current_game_mode()

	if game_mode == "deus" then
		return self._deus_run_controller ~= nil
	else
		return true
	end
end

DeusMechanism.update_loadout = function (self)
	local deus_run_controller = self._deus_run_controller

	if deus_run_controller and not deus_run_controller:get_run_ended() then
		local own_peer_id = deus_run_controller:get_own_peer_id()
		local current_profile_index, current_career_index = deus_run_controller:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)

		if current_profile_index ~= 0 then
			local profile = SPProfiles[current_profile_index]
			local careers = profile.careers
			local career = careers[current_career_index]
			local career_name = career.name

			self:_update_career_loadout(REAL_PLAYER_LOCAL_ID, career_name)
		end
	end
end

DeusMechanism._update_career_loadout = function (self, local_player_id, career_name)
	local deus_run_controller = self._deus_run_controller

	if not deus_run_controller or deus_run_controller:get_run_ended() then
		return
	end

	local own_peer_id = deus_run_controller:get_own_peer_id()
	local deus_backend = Managers.backend:get_interface("deus")
	local career_settings = CareerSettings[career_name]
	local profile_name = career_settings.profile_name
	local profile_index = FindProfileIndex(career_settings.profile_name)
	local profile_careers = SPProfiles[profile_index].careers
	local career_index = table.index_of(profile_careers, career_settings)
	local talent_tree_index = career_settings.talent_tree_index
	local melee_item, ranged_item = deus_run_controller:get_loadout(own_peer_id, local_player_id, profile_index, career_index)

	if melee_item then
		deus_backend:grant_deus_weapon(melee_item)
		deus_backend:set_loadout_item(melee_item.backend_id, career_name, "slot_melee")
	end

	if ranged_item then
		deus_backend:grant_deus_weapon(ranged_item)
		deus_backend:set_loadout_item(ranged_item.backend_id, career_name, "slot_ranged")
	end

	local power_ups = deus_run_controller:get_power_ups(own_peer_id, local_player_id, profile_index, career_index)
	local talent_ids = {}

	for _, power_up_instance in ipairs(power_ups) do
		local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]

		if power_up.talent then
			local talent_index = power_up.talent_index
			local talent_tier = power_up.talent_tier
			local talent_name = TalentTrees[profile_name][talent_tree_index][talent_tier][talent_index]
			local lookup = TalentIDLookup[talent_name]
			local talent_id = lookup.talent_id
			talent_ids[#talent_ids + 1] = talent_id
		end
	end

	deus_backend:set_deus_talent_ids(career_name, talent_ids)
	deus_backend:refresh_deus_weapons_in_items_backend()
end

DeusMechanism.choose_next_state = function (self, next_state)
	self._next_state = next_state
end

DeusMechanism.reset_choose_next_state = function (self)
	self._next_state = nil
end

DeusMechanism.progress_state = function (self)
	self._prior_state = self._state

	if self._next_state then
		self._state = self._next_state
		self._next_state = nil
	else
		self._state = HUB_STATE
	end

	return self._state
end

DeusMechanism.get_prior_state = function (self)
	local prior_state = self._prior_state

	if prior_state == MAP_STATE or prior_state == INGAME_STATE then
		return "deus"
	end

	return prior_state
end

DeusMechanism.set_current_state = function (self, state)
	self._prior_state = self._state
	self._state = state
end

DeusMechanism.get_hub_level_key = function (self)
	return HUB_LEVEL_NAME
end

DeusMechanism.get_end_of_level_rewards_arguments = function (self, game_won, quickplay, statistics_db, stats_id)
	local end_of_level_rewards_arguments = self._deus_run_controller:get_end_of_level_rewards_arguments(game_won, quickplay)
	local ignore_dlc_check = false
	local current_weave = LevelUnlockUtils.current_weave(statistics_db, stats_id, ignore_dlc_check)
	local weave_template = WeaveSettings.templates[current_weave]
	local weave_templates_ordererd = WeaveSettings.templates_ordered
	local current_weave_index = table.find(weave_templates_ordererd, weave_template)
	end_of_level_rewards_arguments.current_weave_index = current_weave_index

	return end_of_level_rewards_arguments
end

DeusMechanism.get_end_of_level_extra_mission_results = function (self)
	return self._deus_run_controller:get_mission_results()
end

DeusMechanism.get_players_session_score = function (self, statistics_db, profile_synchronizer, saved_scoreboard_stats)
	return self._deus_run_controller:get_scoreboard()
end

DeusMechanism.on_final_round_won = function (self, statistics_db, stats_id)
	local player = Managers.player:local_player()
	local journey_name = self._deus_run_controller:get_journey_name()
	local difficulty_name = self._deus_run_controller:get_run_difficulty()
	local dominant_god = self._deus_run_controller:get_dominant_god()

	StatisticsUtil.register_journey_complete(statistics_db, player, journey_name, dominant_god, difficulty_name)
end

DeusMechanism.request_vote = function (self, params)
	print_vote_request(params)

	local vote_data = {
		mission_id = params.mission_id,
		difficulty = params.difficulty,
		quick_game = params.quick_game,
		private_game = params.private_game,
		always_host = params.always_host,
		strict_matchmaking = params.strict_matchmaking,
		dominant_god = params.dominant_god,
		matchmaking_type = params.matchmaking_type,
		mechanism = params.mechanism,
		vote_type = params.request_type
	}

	Managers.state.voting:request_vote("deus_settings_vote", vote_data, Network.peer_id())
end

DeusMechanism.get_deus_run_controller = function (self)
	return self._deus_run_controller
end

DeusMechanism.is_final_round = function (self)
	return self._final_round
end

DeusMechanism.is_venture_over = function (self)
	local reason = self._game_round_ended_reason
	local game_mode_ended = reason == "won" or reason == "lost"

	return game_mode_ended and (reason == "lost" or self._final_round)
end

DeusMechanism.game_round_ended = function (self, t, dt, reason, reason_data)
	fassert(reason == "reload" or reason == "won" or reason == "lost" or reason == "start_game", "unsupported reason for game end")

	self._game_round_ended_reason = reason
	local next_state = nil

	if reason == "reload" then
		Managers.level_transition_handler:reload_level()
		Managers.level_transition_handler:promote_next_level_data()

		self._next_state = self._state
	elseif reason == "start_game" then
		local difficulty, journey_name, dominant_god = nil

		if self._vote_data then
			difficulty = self._vote_data.difficulty
			journey_name = self._vote_data.mission_id
			dominant_god = self._vote_data.dominant_god
		else
			difficulty = "normal"
			journey_name = AvailableJourneyOrder[1]
			dominant_god = DeusJourneyCycleGods[1]
		end

		local run_id = string.sub(tostring(math.random_seed()), 0, 8)
		local run_seed = nil

		if script_data.deus_seed then
			run_seed = script_data.deus_seed
		elseif DEUS_MAP_SEED_WHITELIST.use_full_gen_whitelist then
			local seed_whitelist = DEUS_MAP_SEED_WHITELIST.full_gen_whitelist[journey_name] or DEUS_MAP_SEED_WHITELIST.full_gen_whitelist.default
			local _, index = Math.next_random(math.random_seed(), 1, #seed_whitelist)
			run_seed = seed_whitelist[index]
		else
			run_seed = tostring(math.random_seed())
		end

		journey_name = script_data.deus_journey or journey_name
		dominant_god = script_data.deus_dominant_god or dominant_god

		self:_setup_run(run_id, run_seed, true, Network.peer_id(), difficulty, journey_name, dominant_god)

		local difficulty_id = NetworkLookup.difficulties[difficulty]
		local journey_name_id = NetworkLookup.deus_journeys[journey_name]
		local dominant_god_id = NetworkLookup.deus_themes[dominant_god]

		Managers.mechanism:send_rpc_clients("rpc_deus_setup_run", run_id, run_seed, difficulty_id, journey_name_id, dominant_god_id)

		next_state = self:_transition_next_node("start")
	else
		local state = self._state

		if state == INGAME_STATE or state == MAP_STATE then
			local game_won = reason == "won"

			if state == INGAME_STATE then
				self:_send_level_ended_tracking_data(game_won)
			end

			if reason == "lost" then
				self:_send_run_tracking_data(game_won)
				self._deus_run_controller:handle_run_ended()

				next_state = self:_transition_to_inn()
			elseif game_won then
				if state == INGAME_STATE then
					self._deus_run_controller:handle_level_won()
				end

				local current_node = self._deus_run_controller:get_current_node()

				if #current_node.next > 0 then
					if state == MAP_STATE then
						local next_node_key = reason_data

						if next_node_key == nil then
							next_node_key = self._deus_run_controller:get_current_node().next[1]
						end

						next_state = self:_transition_next_node(next_node_key)
					else
						next_state = self:_transition_map()
					end
				else
					self:_send_run_tracking_data(game_won)
					self._deus_run_controller:handle_run_ended()

					next_state = self:_transition_to_inn()
				end
			end
		end
	end

	if next_state then
		self._next_state = next_state
	end
end

DeusMechanism._transition_next_node = function (self, next_node_key)
	local deus_run_controller = self._deus_run_controller
	local level_transition_handler = Managers.level_transition_handler

	deus_run_controller:set_current_node_key(next_node_key)

	local current_node = deus_run_controller:get_current_node()
	local current_node_type = current_node.node_type
	local in_map = false
	local level_key, environment_variation_id, level_seed, mechanism, game_mode_key, conflict_settings, locked_director_functions, run_difficulty, difficulty_tweak, extra_packages = get_next_level_data(deus_run_controller, in_map)

	level_transition_handler:set_next_level(level_key, environment_variation_id, level_seed, mechanism, game_mode_key, conflict_settings, locked_director_functions, run_difficulty, difficulty_tweak, extra_packages)
	level_transition_handler:promote_next_level_data()

	local next_state = node_type_to_state(current_node_type)

	return next_state
end

DeusMechanism._transition_map = function (self)
	local deus_run_controller = self._deus_run_controller
	local level_transition_handler = Managers.level_transition_handler
	local in_map = true
	local level_key, environment_variation_id, level_seed, mechanism, game_mode_key, conflict_settings, locked_director_functions, run_difficulty, difficulty_tweak, extra_packages = get_next_level_data(deus_run_controller, in_map)

	level_transition_handler:set_next_level(level_key, environment_variation_id, level_seed, mechanism, game_mode_key, conflict_settings, locked_director_functions, run_difficulty, difficulty_tweak, extra_packages)

	local next_state = MAP_STATE

	return next_state
end

DeusMechanism._transition_to_inn = function (self)
	local level_transition_handler = Managers.level_transition_handler
	local in_map = false
	local deus_run_controller = nil
	local level_key, environment_variation_id, level_seed, mechanism, game_mode_key, conflict_settings, locked_director_functions, run_difficulty, difficulty_tweak, extra_packages = get_next_level_data(deus_run_controller, in_map)

	level_transition_handler:set_next_level(level_key, environment_variation_id, level_seed, mechanism, game_mode_key, conflict_settings, locked_director_functions, run_difficulty, difficulty_tweak, extra_packages)

	self._post_match = true

	return HUB_STATE
end

DeusMechanism.should_run_tutorial = function (self)
	return true, "tutorial"
end

DeusMechanism.get_level_end_view = function (self)
	return "LevelEndViewDeus"
end

DeusMechanism._get_next_game_mode_key = function (self)
	local game_mode_key = nil
	local state = self._state

	if state == HUB_STATE then
		game_mode_key = HUB_GAME_MODE_KEY
	elseif state == INGAME_STATE then
		local current_node = self._deus_run_controller:get_current_node()
		game_mode_key = node_type_to_game_mode(current_node.node_type)
	elseif state == MAP_STATE then
		game_mode_key = MAP_GAME_MODE_KEY
	end

	return game_mode_key
end

DeusMechanism.start_next_round = function (self)
	local deus_run_controller = self._deus_run_controller
	self._game_round_ended_reason = nil
	self._final_round = false
	local state = self._state
	local side_compositions = self:_build_side_compositions(state)
	local game_mode_key = self:_get_next_game_mode_key()
	local blessings = script_data.debug_activated_blessings or (deus_run_controller and deus_run_controller:get_blessings()) or {}
	local mutators = {}

	for _, blessing in ipairs(blessings) do
		local config = DeusBlessingSettings[blessing]

		if config.mutators then
			for _, mutator in ipairs(config.mutators) do
				mutators[#mutators + 1] = mutator
			end
		end
	end

	if state == HUB_STATE then
		if deus_run_controller then
			deus_run_controller:destroy()

			self._deus_run_controller = nil
		end
	elseif state == INGAME_STATE then
		local current_node = deus_run_controller:get_current_node()
		local has_next_node = current_node.next and #current_node.next > 0
		self._final_round = not has_next_node
		local curse = current_node.curse

		if curse then
			mutators[#mutators + 1] = curse
		end

		local minor_modifier_group = current_node.minor_modifier_group

		if minor_modifier_group then
			for _, minor_modifier in ipairs(minor_modifier_group) do
				mutators[#mutators + 1] = minor_modifier
			end
		end

		local theme = current_node.theme
		local theme_mutators = DeusThemeSettings[theme].mutators

		if theme_mutators then
			for _, mutator in ipairs(theme_mutators) do
				mutators[#mutators + 1] = mutator
			end
		end

		if current_node.mutators then
			for _, mutator in ipairs(current_node.mutators) do
				mutators[#mutators + 1] = mutator
			end
		end

		deus_run_controller:handle_start_next_round()
	end

	local game_mode_settings = {
		mutators = mutators,
		deus_run_controller = deus_run_controller
	}

	return game_mode_key, side_compositions, game_mode_settings
end

DeusMechanism._build_side_compositions = function (self, state)
	local available_profiles = self._hero_profiles
	local party_manager = Managers.party
	local side_compositions = {
		{
			name = "heroes",
			relations = {
				enemy = {
					"dark_pact",
					"neutral"
				}
			},
			party = party_manager:get_party(1),
			add_these_settings = {
				using_grims_and_tomes = true,
				show_damage_feedback = false,
				available_profiles = available_profiles
			}
		},
		{
			name = "dark_pact",
			relations = {
				enemy = {
					"heroes",
					"neutral"
				}
			}
		},
		{
			name = "neutral",
			relations = {
				enemy = {
					"dark_pact",
					"heroes"
				}
			}
		}
	}

	return side_compositions
end

DeusMechanism.profile_available = function (self, profile_synchronizer, profile_name, career_name)
	local profile_index = FindProfileIndex(profile_name)
	local party = Managers.party:get_party(1)
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots, 1 do
		local status = occupied_slots[i]
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id
		local player_profile_id, player_career_id = profile_synchronizer:profile_by_peer(peer_id, local_player_id)

		if player_profile_id == profile_index then
			return false
		end
	end

	return true
end

DeusMechanism.get_state = function (self)
	return self._state
end

DeusMechanism.generate_level_seed = function (self)
	local deus_run_controller = self._deus_run_controller
	local current_node = deus_run_controller and deus_run_controller:get_current_node()

	return (current_node and current_node.level_seed) or 0
end

DeusMechanism.get_current_node_curse = function (self)
	local deus_run_controller = self._deus_run_controller
	local current_node = deus_run_controller and deus_run_controller:get_current_node()

	return (current_node and current_node.curse) or nil
end

DeusMechanism.get_current_node_theme = function (self)
	local deus_run_controller = self._deus_run_controller
	local current_node = deus_run_controller and deus_run_controller:get_current_node()

	return (current_node and current_node.theme) or nil
end

DeusMechanism.get_level_seed = function (self, level_seed, optional_system)
	local deus_run_controller = self._deus_run_controller
	local current_node = deus_run_controller and deus_run_controller:get_current_node()

	if optional_system then
		return (current_node and current_node.system_seeds[optional_system]) or 0
	end

	return (current_node and current_node.level_seed) or 0
end

DeusMechanism.can_spawn_pickup = function (self, spawner_unit, pickup_name)
	return Pickups.deus_potions[pickup_name] and Unit.get_data(spawner_unit, "deus_potion")
end

DeusMechanism.uses_random_directors = function (self)
	return false
end

DeusMechanism.profile_available_for_peer = function (self, profile_synchronizer, peer_id, local_player_id, profile_name, career_name)
	local profile_index = FindProfileIndex(profile_name)
	local reserver_peer_id = profile_synchronizer:get_profile_index_reservation(profile_index)

	return not reserver_peer_id or reserver_peer_id == peer_id
end

DeusMechanism.profile_changed = function (self, peer_id, local_player_id, profile_index, career_index)
	if self._deus_run_controller and not self._deus_run_controller:get_run_ended() then
		self._deus_run_controller:profile_changed(peer_id, local_player_id, profile_index, career_index)

		if peer_id == self._deus_run_controller:get_own_peer_id() and local_player_id == REAL_PLAYER_LOCAL_ID then
			self:_update_own_avatar_info()
		end

		local profile = SPProfiles[profile_index]
		local careers = profile.careers
		local career = careers[career_index]
		local career_name = career.name

		self:_update_career_loadout(local_player_id, career_name)
	end
end

DeusMechanism.allocate_slot = function (self, sender, profile_index)
	local network_server = Managers.mechanism:network_server()
	local profile_synchronizer = network_server.profile_synchronizer

	if profile_synchronizer:try_reserve_profile_for_peer(sender, profile_index) then
		return true
	end

	return false
end

DeusMechanism.sync_mechanism_data = function (self, peer_id, mechanism_newly_initialized)
	if not mechanism_newly_initialized then
		return
	end

	local deus_run_controller = self._deus_run_controller

	if deus_run_controller and not deus_run_controller:get_run_ended() then
		local difficulty_id = NetworkLookup.difficulties[deus_run_controller:get_run_difficulty()]
		local journey_name_id = NetworkLookup.deus_journeys[deus_run_controller:get_journey_name()]
		local dominant_god_id = NetworkLookup.deus_themes[deus_run_controller:get_dominant_god()]
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		RPC.rpc_deus_setup_run(channel_id, self._run_id, self._run_seed, difficulty_id, journey_name_id, dominant_god_id)
	end
end

DeusMechanism.client_left = function (self, peer_id)
	return
end

DeusMechanism._send_level_started_tracking_data = function (self)
	local statistics_db = Managers.player:statistics_db()
	local bots = Managers.player:bots()
	local num_bots = #bots
	local level_tracking_data = self._deus_run_controller:get_level_started_tracking_data(statistics_db, num_bots)

	Managers.telemetry.events:deus_level_started(level_tracking_data)
end

DeusMechanism._send_level_ended_tracking_data = function (self, game_won)
	local statistics_db = Managers.player:statistics_db()
	local bots = Managers.player:bots()
	local num_bots = #bots
	local level_tracking_data = self._deus_run_controller:get_level_ended_tracking_data(statistics_db, game_won, num_bots)

	Managers.telemetry.events:deus_level_ended(level_tracking_data)
end

DeusMechanism._send_run_tracking_data = function (self, game_won)
	local run_tracking_data = self._deus_run_controller:get_run_tracking_data(game_won)

	Managers.telemetry.events:deus_run_ended(run_tracking_data)
end

DeusMechanism.debug_load_shrine_node = function (self)
	local run_seed = "DEBUG_SHRINE_NODE"

	self:_debug_load_seed(run_seed, script_data.current_difficulty_setting or "normal")
end

DeusMechanism.debug_load_map = function (self)
	self:_debug_load_seed(script_data.deus_seed or tostring(math.random_seed()), script_data.current_difficulty_setting or "normal")
end

DeusMechanism.debug_load_level = function (self, level_name)
	local level_settings = LevelSettings[level_name]

	if level_settings and level_settings.hub_level then
		local level_transition_handler = Managers.level_transition_handler

		level_transition_handler:set_next_level(level_name)
		level_transition_handler:promote_next_level_data()
	else
		local run_seed = "DEBUG_SPECIFIC_NODE" .. (script_data.deus_force_load_run_progress or 0) .. "_" .. level_name .. "SEED" .. 0 .. "SEED_END"

		self:_debug_load_seed(run_seed, script_data.current_difficulty_setting or "normal")
	end
end

DeusMechanism.debug_load_deus_level = function (self, level_name, difficulty, progress, level_seed)
	local run_seed = "DEBUG_SPECIFIC_NODE" .. math.floor(progress * 1000) .. "_" .. level_name .. "SEED" .. level_seed .. "SEED_END"

	self:_debug_load_seed(run_seed, difficulty)
end

DeusMechanism._debug_load_seed = function (self, run_seed, difficulty)
	local run_id = string.sub(tostring(math.random_seed()), 0, 8)
	local journey_name = script_data.deus_journey or AvailableJourneyOrder[1]
	local dominant_god = script_data.deus_dominant_god or DeusJourneyCycleGods[1]

	self:_setup_run(run_id, run_seed, true, Network.peer_id(), difficulty, journey_name, dominant_god)

	local difficulty_id = NetworkLookup.difficulties[difficulty]
	local journey_name_id = NetworkLookup.deus_journeys[journey_name]
	local dominant_god_id = NetworkLookup.deus_themes[dominant_god]

	Managers.mechanism:send_rpc_clients("rpc_deus_setup_run", run_id, run_seed, difficulty_id, journey_name_id, dominant_god_id)

	if string.starts_with(run_seed, "DEBUG_SHRINE_NODE") then
		self._deus_run_controller:debug_shrine_setup()
	end

	local deus_run_controller = self._deus_run_controller
	local current_node = deus_run_controller:get_current_node()
	local current_node_type = current_node.node_type
	local level_key = current_node.level
	local level_seed = current_node.level_seed
	local conflict_settings = current_node.conflict_settings
	local current_run_progress = current_node.run_progress
	local mechanism = "deus"
	local run_difficulty = deus_run_controller:get_run_difficulty()
	local difficulty_tweak = get_difficulty_tweak_for_progress(current_run_progress)
	local environment_variation_id = LevelHelper:get_random_variation_id(level_key)
	local game_mode_key = node_type_to_game_mode(current_node_type)
	local level_transition_handler = Managers.level_transition_handler

	level_transition_handler:set_next_level(level_key, environment_variation_id, level_seed, mechanism, game_mode_key, conflict_settings, nil, run_difficulty, difficulty_tweak)
	self:_update_current_state()
	level_transition_handler:promote_next_level_data()
end

DeusMechanism._setup_run = function (self, run_id, run_seed, is_server, server_peer_id, difficulty, journey_name, dominant_god)
	local deus_backend = Managers.backend:get_interface("deus")
	local own_peer_id = Network.peer_id()
	self._run_id = run_id
	self._run_seed = run_seed

	if self._deus_run_controller then
		self._deus_run_controller:destroy()
	end

	local backend_items = Managers.backend:get_interface("items")
	local talent_interface = Managers.backend:get_interface("talents")
	local loadout = backend_items:get_loadout()
	local initial_loadout = {}
	local initial_talents = {}

	for _, career in ipairs(DEUS_CAREERS) do
		local talents_for_career = talent_interface:get_talents(career)
		initial_talents[career] = talents_for_career
		local slots = loadout[career]
		local initial_loadout_slots = {}
		initial_loadout[career] = initial_loadout_slots

		for slot, backend_id in pairs(slots) do
			if slot == "slot_melee" or slot == "slot_ranged" then
				local item_data = backend_items:get_item_from_id(backend_id)
				local item_key = item_data and item_data.key
				local deus_item_key = DeusStartingWeaponTypeMapping[item_key]

				if not deus_item_key then
					fassert(DeusDefaultLoadout[career], "career %s is not properly configured for Morris.", career)

					deus_item_key = DeusDefaultLoadout[career][slot]

					Application.warning("Unknown weapon " .. (item_key or "unknown") .. " in slot " .. slot .. ", can't convert to deus weapon. Using " .. deus_item_key)
				end

				local item = DeusWeaponGeneration.generate_item_from_item_key(deus_item_key, difficulty, 0, "plentiful", 0)
				item.power_level = DeusStarterWeaponPowerLevels[difficulty] or DeusStarterWeaponPowerLevels.default
				initial_loadout_slots[slot] = item
			end
		end
	end

	deus_backend:reset_deus_inventory()

	local backend_deus_loadout = {}

	for career, slots in pairs(initial_loadout) do
		local backend_deus_loadout_slots = {}
		backend_deus_loadout[career] = backend_deus_loadout_slots

		for slot, item_data in pairs(slots) do
			local new_backend_id = deus_backend:grant_deus_weapon(item_data)
			backend_deus_loadout_slots[slot] = new_backend_id
		end
	end

	deus_backend:refresh_deus_weapons_in_items_backend()
	deus_backend:set_deus_loadout(backend_deus_loadout)

	local network_handler = Managers.mechanism:network_handler()

	Managers.backend:set_loadout_interface_override(nil)

	local weapon_group_whitelist = {}

	for weapon_group_name, _ in pairs(DeusWeaponGroups) do
		local is_weapon_unlocked = backend_items:has_item(weapon_group_name)

		if is_weapon_unlocked then
			weapon_group_whitelist[weapon_group_name] = true
		end
	end

	self._deus_run_controller = DeusRunController:new(run_id, is_server, network_handler, server_peer_id, own_peer_id, initial_loadout, initial_talents, weapon_group_whitelist)

	self._deus_run_controller:register_rpcs(self._network_event_delegate)

	local rolled_over_coins = deus_backend:get_rolled_over_soft_currency()
	local backend_id = Managers.backend:player_id() or ""

	self._deus_run_controller:setup_run(run_seed, difficulty, journey_name, dominant_god, rolled_over_coins, backend_id)
	self._deus_run_controller:full_sync()
	self:_update_own_avatar_info()

	local current_profile_index, current_career_index = self._deus_run_controller:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)

	if current_profile_index ~= 0 then
		local profile = SPProfiles[current_profile_index]
		local careers = profile.careers
		local career = careers[current_career_index]
		local career_name = career.name

		self:_update_career_loadout(REAL_PLAYER_LOCAL_ID, career_name)
	end

	deus_backend:deus_run_started()
end

DeusMechanism._update_own_avatar_info = function (self)
	local own_peer_id = self._deus_run_controller:get_own_peer_id()
	local profile_index, career_index = self._deus_run_controller:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)
	local local_player = Managers.player:local_player()

	if profile_index == 0 or not local_player then
		return
	end

	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local display_name = profile.display_name
	local career_name = career.name
	local experience = ExperienceSettings.get_experience(display_name)
	local level = ExperienceSettings.get_level(experience)
	local frame_item = BackendUtils.get_loadout_item(career_name, "slot_frame")
	local frame_name = (frame_item and frame_item.data.name) or "default"
	local name = local_player:name() or ""

	self._deus_run_controller:set_own_player_avatar_info(level, name, frame_name)
end

DeusMechanism.rpc_deus_setup_run = function (self, channel_id, run_id, run_seed, difficulty_id, journey_name_id, dominant_god_id)
	local difficulty = NetworkLookup.difficulties[difficulty_id]
	local journey_name = NetworkLookup.deus_journeys[journey_name_id]
	local dominant_god = NetworkLookup.deus_themes[dominant_god_id]
	local server_peer_id = CHANNEL_TO_PEER_ID[channel_id]

	self:_setup_run(run_id, run_seed, false, server_peer_id, difficulty, journey_name, dominant_god)
end

DeusMechanism.should_play_level_introduction = function (self)
	return false
end

DeusMechanism.set_vote_data = function (self, data)
	self._vote_data = data
end

DeusMechanism._get_vote_data = function (self)
	return self._vote_data
end

DeusMechanism.get_loading_tip = function (self)
	local loading_tips_file = DLCSettings.morris.loading_tips_file
	local loading_tips = local_require(loading_tips_file)
	local theme = self:get_current_node_theme()
	local themed_tips = loading_tips[theme] or loading_tips.general

	if self._state == MAP_STATE then
		themed_tips = loading_tips.general
	end

	local random_index = math.random(1, #themed_tips)
	local loading_tip = themed_tips[random_index]

	return loading_tip
end

DeusMechanism.post_match = function (self)
	return self._post_match
end

DeusMechanism.get_level_dialogue_context = function (self)
	local times_map_visited = 0
	local times_shrine_was_in_range = 0
	local times_shrine_visited = 0
	local level_theme = nil
	local deus_run_controller = self._deus_run_controller

	if deus_run_controller then
		local traversed_nodes = deus_run_controller:get_traversed_nodes()
		times_map_visited = #traversed_nodes + 1
		local visited_nodes = deus_run_controller:get_visited_nodes()

		for _, node_key in ipairs(visited_nodes) do
			local node = deus_run_controller:get_node(node_key)

			if node.node_type == "shop" then
				times_shrine_visited = times_shrine_visited + 1
			end

			for _, next_node_key in ipairs(node.next) do
				local next_node = deus_run_controller:get_node(next_node_key)

				if next_node.node_type == "shop" then
					times_shrine_was_in_range = times_shrine_was_in_range + 1

					break
				end
			end
		end

		local level_name = deus_run_controller:get_current_node().level
		local level_settings = LevelSettings[level_name]
		level_theme = level_settings.theme
	end

	return {
		times_map_visited = times_map_visited,
		times_shrine_was_in_range = times_shrine_was_in_range,
		current_theme = level_theme,
		times_shrine_visited = times_shrine_visited,
		deus_current_curse = self:get_current_node_curse(),
		is_final_round = self:is_final_round()
	}
end

DeusMechanism._update_current_state = function (self)
	local new_state = nil

	if not self._deus_run_controller or self._deus_run_controller:get_run_ended() then
		new_state = HUB_STATE
	elseif self._deus_run_controller:has_completed_current_node() then
		new_state = MAP_STATE
	else
		local current_node = self._deus_run_controller:get_current_node()

		if current_node.level_type == "SHOP" then
			new_state = MAP_STATE
		else
			new_state = INGAME_STATE
		end
	end

	Managers.mechanism:choose_next_state(new_state)
	Managers.mechanism:progress_state()
end

DeusMechanism.get_starting_level = function ()
	return HUB_LEVEL_NAME
end

return
