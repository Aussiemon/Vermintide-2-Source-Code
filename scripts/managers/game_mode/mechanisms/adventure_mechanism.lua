AdventureMechanism = class(AdventureMechanism)
AdventureMechanism.name = "Adventure"
local live_event_packages = require("scripts/settings/live_events_packages")
local HUB_LEVEL_NAME = "inn_level"
local HUB_GAME_MODE_KEY = "inn"
local HUB_STATE = "inn"
local INGAME_GAME_MODE_KEY = "adventure"
local INGAME_STATE = "ingame"
local TUTORIAL_GAME_MODE_KEY = "tutorial"
local TUTORIAL_STATE = "tutorial"
local WEAVE_GAME_MODE_KEY = "weave"
local WEAVE_STATE = "weave"

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
	printf("GAME START SETTINGS -> Level: %s | Difficulty: %s | Private: %s | Always Host: %s | Strict Matchmaking: %s | Quick Game: %s | Matchmaking Type: %s | Twitch: %s", level_key and level_key or "Not specified", difficulty_key, private_game and "yes" or "no", always_host and "yes" or "no", strict_matchmaking and "yes" or "no", quick_game and "yes" or "no", matchmaking_type or "Not specified", twitch_enabled and "Yes" or "No")
	print("............................................................................................................")
	print("............................................................................................................")
end

local vote_requests = {
	default = function (params)
		print_vote_request(params)

		local vote_data = {
			mission_id = params.mission_id,
			difficulty = params.difficulty,
			quick_game = params.quick_game,
			private_game = params.private_game,
			always_host = params.always_host,
			strict_matchmaking = params.strict_matchmaking,
			excluded_level_keys = params.excluded_level_keys,
			matchmaking_type = params.matchmaking_type,
			mechanism = params.mechanism,
			vote_type = params.request_type
		}
		local vote_template = "game_settings_vote"

		Managers.state.voting:request_vote(vote_template, vote_data, Network.peer_id())
	end,
	deed = function (params)
		print_vote_request(params)

		local item_interface = Managers.backend:get_interface("items")
		local item = item_interface:get_item_from_id(params.deed_backend_id)
		local item_data = item.data
		local difficulty = item.difficulty
		local mission_id = item.level_key
		local vote_data = {
			item_name = item_data.name,
			mission_id = mission_id,
			difficulty = difficulty,
			excluded_level_keys = params.excluded_level_keys,
			matchmaking_type = params.matchmaking_type,
			mechanism = params.mechanism,
			vote_type = params.request_type
		}

		Managers.state.voting:request_vote("game_settings_deed_vote", vote_data, Network.peer_id())
	end,
	event = function (params)
		print_vote_request(params)

		local vote_data = {
			mission_id = params.mission_id,
			difficulty = params.difficulty,
			quick_game = params.quick_game,
			private_game = params.private_game,
			always_host = params.always_host,
			strict_matchmaking = params.strict_matchmaking,
			event_data = params.event_data,
			excluded_level_keys = params.excluded_level_keys,
			matchmaking_type = params.matchmaking_type,
			mechanism = params.mechanism,
			vote_type = params.request_type
		}

		Managers.state.voting:request_vote("game_settings_event_vote", vote_data, Network.peer_id())
	end,
	weave_quick_play = function (params)
		print_vote_request(params)

		local vote_data = {
			quick_game = true,
			difficulty = params.difficulty,
			private_game = params.private_game,
			always_host = params.always_host,
			matchmaking_type = params.matchmaking_type,
			mechanism = params.mechanism,
			vote_type = params.request_type
		}

		Managers.state.voting:request_vote("game_settings_weave_quick_play_vote", vote_data, Network.peer_id())
	end,
	weave = function (params)
		print_vote_request(params)

		local vote_data = {
			quick_game = false,
			mission_id = params.mission_id,
			difficulty = params.difficulty,
			objective_index = params.objective_index,
			private_game = params.private_game,
			always_host = params.always_host,
			matchmaking_type = params.matchmaking_type,
			mechanism = params.mechanism,
			vote_type = params.request_type
		}

		Managers.state.voting:request_vote("game_settings_weave_vote", vote_data, Network.peer_id())
	end
}
local RPCS = {
	"rpc_sync_adventure_data_to_peer"
}

AdventureMechanism.init = function (self, settings)
	self:_reset(settings)
end

AdventureMechanism.register_rpcs = function (self, network_event_delegate)
	self:unregister_rpcs()

	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

AdventureMechanism.unregister_rpcs = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end
end

AdventureMechanism.on_venture_start = function (self)
	return
end

AdventureMechanism.on_venture_end = function (self)
	if self._state ~= WEAVE_STATE then
		Managers.weave:clear_weave_name()
		Managers.backend:set_talents_interface_override()
	end
end

AdventureMechanism.is_venture_over = function (self)
	local reason = self._game_round_ended_reason
	local game_mode_ended = reason == "won" or reason == "lost"

	if self._state == WEAVE_STATE then
		local final_round = not Managers.weave:calculate_next_objective_index()

		return game_mode_ended and (reason == "lost" or final_round)
	else
		return game_mode_ended
	end
end

AdventureMechanism.handle_ingame_exit = function (self, exit_type)
	if exit_type == "join_lobby_failed" or exit_type == "left_game" or exit_type == "lobby_state_failed" or exit_type == "kicked_by_server" or exit_type == "afk_kick" or exit_type == "quit_game" or exit_type == "return_to_pc_menu" then
		self:_reset()
	end
end

AdventureMechanism._reset = function (self, settings, prior_state)
	local level_key = self:get_hub_level_key()
	local level_settings = LevelSettings[level_key]
	self._prior_state = prior_state or self._state

	if level_settings.hub_level then
		self._state = HUB_STATE
	else
		self._state = INGAME_STATE
	end

	self._next_state = nil
	self._saved_game_mode_data = nil
	self._hero_profiles = table.clone(PROFILES_BY_AFFILIATION.heroes)
	self._tutorial_profiles = table.clone(PROFILES_BY_AFFILIATION.tutorial)
end

AdventureMechanism.network_context_destroyed = function (self)
	self:_reset()
end

AdventureMechanism.choose_next_state = function (self, next_state)
	local state = self._state

	if state == HUB_STATE or state == TUTORIAL_STATE then
		local acceptable_states = {
			weave = true,
			ingame = true,
			tutorial = true
		}

		fassert(acceptable_states[next_state], "State (%s) is not an acceptable transition from current state (%s)", next_state, state)
	else
		ferror("Not allowed to choose next state in current state (%s)", state)
	end

	self._next_state = next_state
end

AdventureMechanism.reset_choose_next_state = function (self)
	self._next_state = nil
end

AdventureMechanism.progress_state = function (self)
	if self._next_state then
		self._prior_state = self._state
		self._state = self._next_state
		self._next_state = nil
	else
		local state = self._state
		self._prior_state = state

		if state == HUB_STATE then
			self._state = INGAME_STATE
		elseif state == INGAME_STATE or state == TUTORIAL_STATE then
			self._state = HUB_STATE
		elseif state == WEAVE_STATE then
			local weave_manager = Managers.weave
			local next_objective_index = weave_manager:calculate_next_objective_index()

			if not next_objective_index then
				self._state = HUB_STATE
			end
		else
			ferror("AdventureMechanism: unknown state %s", state)
		end
	end

	return self._state
end

AdventureMechanism.get_prior_state = function (self)
	return self._prior_state
end

AdventureMechanism.set_current_state = function (self, state)
	self._prior_state = self._state
	self._state = state
end

AdventureMechanism.get_hub_level_key = function (self)
	return self._debug_hub_level_key or AdventureMechanism.get_starting_level()
end

AdventureMechanism.allocate_slot = function (self, sender, profile_index)
	local network_server = Managers.mechanism:network_server()
	local profile_synchronizer = network_server.profile_synchronizer

	if profile_synchronizer:try_reserve_profile_for_peer(sender, profile_index) then
		return true
	end

	return false
end

AdventureMechanism.get_level_seed = function (self, level_seed, optional_system)
	local weave_manager = Managers.weave

	if weave_manager and weave_manager:get_active_weave() then
		local active_objective = weave_manager:get_active_objective_template()
		level_seed = optional_system and active_objective.system_seeds and active_objective.system_seeds[optional_system] or active_objective.level_seed or level_seed
	end

	return level_seed
end

AdventureMechanism.get_end_of_level_rewards_arguments = function (self, game_won, quickplay, statistics_db, stats_id)
	local is_weave_game_mode = self._current_game_mode == WEAVE_GAME_MODE_KEY
	local kill_count = statistics_db:get_stat(stats_id, "kills_total")
	local weave_tier, weave_progress = nil

	if is_weave_game_mode then
		local weave_manager = Managers.weave
		weave_tier = weave_manager:get_weave_tier()
		weave_progress = weave_manager:current_bar_score()
	end

	local ignore_dlc_check = false
	local current_weave = LevelUnlockUtils.current_weave(statistics_db, stats_id, ignore_dlc_check)
	local weave_template = WeaveSettings.templates[current_weave]
	local weave_templates_ordererd = WeaveSettings.templates_ordered
	local current_weave_index = table.find(weave_templates_ordererd, weave_template)
	local mission_system = Managers.state.entity:system("mission_system")
	local tome = mission_system:get_level_end_mission_data("tome_bonus_mission")
	local grimoire = mission_system:get_level_end_mission_data("grimoire_hidden_mission")
	local loot_dice = mission_system:get_level_end_mission_data("bonus_dice_hidden_mission")
	local painting_scraps = mission_system:get_level_end_mission_data("painting_scrap_hidden_mission")
	local chest_upgrade_data = {
		tome = tome and tome.current_amount or 0,
		grimoire = grimoire and grimoire.current_amount or 0,
		loot_dice = loot_dice and loot_dice.current_amount or 0,
		painting_scraps = painting_scraps and painting_scraps.current_amount or 0,
		quickplay = quickplay,
		game_won = game_won
	}

	return {
		current_weave_index = current_weave_index,
		weave_tier = weave_tier,
		weave_progress = weave_progress,
		kill_count = kill_count,
		chest_upgrade_data = chest_upgrade_data
	}
end

AdventureMechanism.get_end_of_level_extra_mission_results = function (self)
	local mission_system = Managers.state.entity:system("mission_system")

	mission_system:start_mission("players_alive_mission")

	return {}
end

AdventureMechanism.is_final_round = function (self)
	if self._current_game_mode == WEAVE_GAME_MODE_KEY then
		return not Managers.weave:calculate_next_objective_index()
	end

	return true
end

AdventureMechanism.get_level_end_view = function (self)
	local lobby = Managers.state.network:lobby()
	local is_quickplay = lobby:lobby_data("quick_game") == "true"

	if self._current_game_mode == WEAVE_GAME_MODE_KEY and not is_quickplay then
		return "LevelEndViewWeave"
	end

	return "LevelEndView"
end

AdventureMechanism.game_round_ended = function (self, t, dt, reason)
	self._game_round_ended_reason = reason
	local new_saved_game_mode_data = nil
	local state = self._state
	local level_key, conflict_settings, level_seed, locked_director_functions, difficulty, difficulty_tweak = nil

	if state == HUB_STATE then
		level_key = Managers.level_transition_handler:get_next_level_key()
	elseif state == TUTORIAL_STATE then
		level_key = self._debug_hub_level_key or AdventureMechanism.get_starting_level()
	elseif state == WEAVE_STATE then
		local weave_manager = Managers.weave
		local next_objective_index = weave_manager:calculate_next_objective_index()

		if next_objective_index and reason == "won" then
			local active_weave_name = weave_manager:get_active_weave()
			local template = WeaveSettings.templates[active_weave_name]
			local objectives = template.objectives
			local objective = objectives[next_objective_index]

			weave_manager:set_next_weave(active_weave_name)
			weave_manager:set_next_objective(next_objective_index)

			new_saved_game_mode_data = Managers.state.game_mode:get_saved_game_mode_data()

			if new_saved_game_mode_data then
				for _, slot_data in pairs(new_saved_game_mode_data) do
					slot_data.spawn_state = nil
					slot_data.position = nil
					slot_data.rotation = nil
				end
			end

			level_key = objective.level_id
			conflict_settings = objective.conflict_settings
			level_seed = Managers.mechanism:generate_level_seed()
			local level_transition_handler = Managers.level_transition_handler
			difficulty = level_transition_handler:get_current_difficulty()
			difficulty_tweak = level_transition_handler:get_current_difficulty_tweak()
			locked_director_functions = level_transition_handler:get_current_locked_director_functions()
		else
			level_key = AdventureMechanism.debug_hub_level_key or AdventureMechanism.get_starting_level()
			self._next_state = HUB_STATE
		end
	else
		level_key = AdventureMechanism.debug_hub_level_key or AdventureMechanism.get_starting_level()
	end

	if reason == "start_game" then
		Managers.level_transition_handler:promote_next_level_data()
	elseif reason == "won" or reason == "lost" then
		self._saved_game_mode_data = new_saved_game_mode_data
		local environment_variation_id = LevelHelper:get_environment_variation_id(level_key)

		Managers.level_transition_handler:set_next_level(level_key, environment_variation_id, level_seed, nil, nil, conflict_settings, locked_director_functions, difficulty, difficulty_tweak)
	elseif reason == "reload" then
		level_seed = Managers.mechanism:generate_level_seed()

		Managers.level_transition_handler:reload_level(nil, level_seed)
		Managers.level_transition_handler:promote_next_level_data()
	else
		fassert(false, "Invalid end reason %q.", tostring(reason))
	end
end

AdventureMechanism.should_run_tutorial = function (self)
	return true, TUTORIAL_STATE
end

AdventureMechanism._get_next_game_mode_key = function (self)
	local game_mode_key = nil
	local state = self._state

	if state == HUB_STATE then
		local current_level_key = Managers.level_transition_handler:get_current_level_keys()
		local level_settings = LevelSettings[current_level_key]

		if level_settings.hub_level then
			game_mode_key = HUB_GAME_MODE_KEY
		else
			game_mode_key = INGAME_GAME_MODE_KEY
		end
	elseif state == TUTORIAL_STATE then
		game_mode_key = TUTORIAL_GAME_MODE_KEY
	elseif state == WEAVE_STATE then
		game_mode_key = WEAVE_GAME_MODE_KEY
	else
		game_mode_key = INGAME_GAME_MODE_KEY
	end

	return game_mode_key
end

AdventureMechanism.start_next_round = function (self)
	self._game_round_ended_reason = nil
	local state = self._state

	if state == HUB_STATE then
		local settings = nil
		local prior_state = self._prior_state

		self:_reset(settings, prior_state)
	end

	local side_compositions = self:_build_side_compositions(state)
	local game_mode_key = self:_get_next_game_mode_key()
	self._current_game_mode = game_mode_key
	local saved_game_mode_data = nil

	if self._saved_game_mode_data then
		saved_game_mode_data = table.clone(self._saved_game_mode_data)
	end

	local game_mode_settings = {
		game_mode_data = saved_game_mode_data
	}

	return game_mode_key, side_compositions, game_mode_settings
end

AdventureMechanism._build_side_compositions = function (self, state)
	local available_profiles = self._hero_profiles

	if state == TUTORIAL_STATE then
		available_profiles = self._tutorial_profiles
	end

	local party_manager = Managers.party
	local side_compositions = {
		{
			name = "heroes",
			relations = {
				enemy = {
					"dark_pact"
				}
			},
			party = party_manager:get_party(1),
			add_these_settings = {
				using_grims_and_tomes = true,
				show_damage_feedback = false,
				using_enemy_recycler = true,
				available_profiles = available_profiles
			}
		},
		{
			name = "dark_pact",
			relations = {
				enemy = {
					"heroes"
				}
			}
		},
		{
			name = "neutral",
			relations = {
				enemy = {}
			}
		}
	}

	return side_compositions
end

AdventureMechanism.profile_available = function (self, profile_synchronizer, profile_name, career_name)
	local profile_index = FindProfileIndex(profile_name)
	local party = Managers.party:get_party(1)
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots do
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

AdventureMechanism.get_state = function (self)
	return self._state
end

AdventureMechanism.sync_mechanism_data = function (self, peer_id, mechanism_newly_initialized)
	local weave_manager = Managers.weave

	if weave_manager then
		local next_weave = weave_manager:get_next_weave()
		local next_objective_index = weave_manager:get_next_objective()
		local active_weave = weave_manager:get_active_weave()
		local active_objective_index = weave_manager:get_active_objective()
		local weave_name = next_weave or active_weave or "n/a"
		local objective_index = next_objective_index or active_objective_index or 1
		local weave_name_id = NetworkLookup.weave_names[weave_name]
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		RPC.rpc_sync_adventure_data_to_peer(channel_id, weave_name_id, objective_index)
	end
end

AdventureMechanism.rpc_sync_adventure_data_to_peer = function (self, channel_id, next_weave_name_id, next_weave_objective_index)
	local next_weave_name = NetworkLookup.weave_names[next_weave_name_id]
	local weave_manager = Managers.weave

	if next_weave_name ~= "n/a" then
		weave_manager:set_next_weave(next_weave_name)
		weave_manager:set_next_objective(next_weave_objective_index)
	end
end

AdventureMechanism.profile_available_for_peer = function (self, profile_synchronizer, peer_id, local_player_id, profile_name, career_name)
	local profile_index = FindProfileIndex(profile_name)
	local reserver_peer_id = profile_synchronizer:get_profile_index_reservation(profile_index)

	return not reserver_peer_id or reserver_peer_id == peer_id
end

AdventureMechanism.should_play_level_introduction = function (self)
	return true
end

AdventureMechanism.uses_random_directors = function (self)
	local weave_name = Managers.weave:get_next_weave() or Development.parameter("weave_name")
	local weave_data = WeaveSettings.templates[weave_name]

	return not weave_data
end

AdventureMechanism.debug_load_level = function (self, level_name, environment_variation_id)
	local level_settings = LevelSettings[level_name]
	local level_transition_handler = Managers.level_transition_handler

	level_transition_handler:set_next_level(level_name, environment_variation_id)
	level_transition_handler:promote_next_level_data()

	if level_settings and level_settings.hub_level then
		self._next_state = HUB_STATE
	else
		self._next_state = INGAME_STATE
	end

	Managers.mechanism:progress_state()
end

AdventureMechanism.request_vote = function (self, params)
	local deed_backend_id = params.deed_backend_id

	if deed_backend_id then
		Managers.deed:select_deed(deed_backend_id, Network.peer_id())
	end

	local request_func = vote_requests[params.request_type] or vote_requests.default

	if request_func then
		request_func(params)
	end
end

AdventureMechanism.override_hub_level = function (self, new_hub_level_key)
	self._debug_hub_level_key = new_hub_level_key
end

AdventureMechanism.get_starting_level = function ()
	local weave_name = Development.parameter("weave_name")

	if weave_name and weave_name ~= "false" then
		local weave_template = WeaveSettings.templates[weave_name]
		local objective = weave_template.objectives[1]
		local level_key = objective.level_id

		return level_key
	end

	local keep_variation_data = Managers.backend:get_level_variation_data()

	return keep_variation_data.hub_level or HUB_LEVEL_NAME
end

AdventureMechanism.left_mechanism_due_to_switch = function (self)
	self:_unload_packages()
end

AdventureMechanism.is_packages_loaded = function (self)
	local additional_packages = self._additional_packages

	if additional_packages == nil then
		return true
	end

	local package_manager = Managers.package

	for name, packages in pairs(additional_packages) do
		for i = 1, #packages do
			if not package_manager:has_loaded(packages[i], name) then
				return false
			end
		end
	end

	return true
end

AdventureMechanism.load_packages = function (self)
	local level_key = Managers.level_transition_handler:get_current_level_key()
	local level_settings = LevelSettings[level_key]

	if level_settings.tutorial_level then
		return
	end

	if self._additional_packages_initialized then
		return
	end

	self:_load_live_event_packages()

	self._additional_packages_initialized = true
end

AdventureMechanism._load_live_event_packages = function (self)
	local live_event_interface = Managers.backend:get_interface("live_events")
	local special_events = live_event_interface and live_event_interface:get_special_events()

	if special_events then
		self._additional_packages = {}
		local additional_packages = self._additional_packages

		for i = 1, #special_events do
			local event_data = special_events[i]
			local event_name = event_data.name
			local event_packages = live_event_packages[event_name]

			if event_packages and event_packages.resource_packages then
				if not additional_packages[event_name] then
					additional_packages[event_name] = {}
				end

				table.append(additional_packages[event_name], event_packages.resource_packages)
			end
		end

		local package_manager = Managers.package

		for name, packages in pairs(additional_packages) do
			for i = 1, #packages do
				package_manager:load(packages[i], name, nil, true)
			end
		end
	end
end

AdventureMechanism._unload_packages = function (self)
	local additional_packages = self._additional_packages

	if additional_packages then
		local package_manager = Managers.package

		for name, packages in pairs(additional_packages) do
			for i = 1, #packages do
				package_manager:unload(packages[i], name)
			end
		end

		table.clear(additional_packages)
	end

	self._additional_packages_initialized = false
end
