require("scripts/managers/game_mode/game_modes/game_mode_base")
require("scripts/managers/game_mode/spawning_components/weave_spawning")

script_data.disable_gamemode_end = script_data.disable_gamemode_end or Development.parameter("disable_gamemode_end")
GameModeWeave = class(GameModeWeave, GameModeBase)
local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false

GameModeWeave.init = function (self, settings, world, network_server, is_server, profile_synchronizer, level_key, statistics_db, game_mode_settings)
	GameModeWeave.super.init(self, settings, world, network_server, is_server, profile_synchronizer, level_key, statistics_db, game_mode_settings)

	self.about_to_lose = false
	self.lost_condition_timer = nil
	self.about_to_win = false
	self.win_condition_timer = nil
	self._adventure_profile_rules = AdventureProfileRules:new(self._profile_synchronizer, self._network_server)
	local hero_side = Managers.state.side:get_side_from_name("heroes")
	self._weave_spawning = WeaveSpawning:new(self._profile_synchronizer, hero_side, self._is_server, self._network_server, game_mode_settings and game_mode_settings.game_mode_data)

	self:_register_player_spawner(self._weave_spawning)

	self._available_profiles = table.clone(PROFILES_BY_AFFILIATION.heroes)
	self._bot_players = {}

	self:_setup_bot_spawn_priority_lookup()

	self._local_player_spawned = false
	self._quick_play = Managers.matchmaking:is_quick_game()
	local event_manager = Managers.state.event

	event_manager:register(self, "level_start_local_player_spawned", "event_local_player_spawned")
	event_manager:register(self, "on_ai_unit_destroyed", "on_ai_unit_destroyed")
end

GameModeWeave.register_rpcs = function (self, network_event_delegate, network_transmit)
	GameModeWeave.super.register_rpcs(self, network_event_delegate, network_transmit)
	self._weave_spawning:register_rpcs(network_event_delegate, network_transmit)
end

GameModeWeave.unregister_rpcs = function (self)
	self._weave_spawning:unregister_rpcs()
	GameModeWeave.super.unregister_rpcs(self)
end

GameModeWeave.event_local_player_spawned = function (self, is_initial_spawn)
	self._local_player_spawned = true
	self._is_initial_spawn = is_initial_spawn
end

GameModeWeave.update = function (self, t, dt)
	self._weave_spawning:update(t, dt)
end

GameModeWeave.server_update = function (self, t, dt)
	GameModeWeave.super.server_update(self, t, dt)
	self:_handle_bots(t, dt)
	self._weave_spawning:server_update(t, dt)
end

GameModeWeave.evaluate_end_conditions = function (self, round_started, dt, t, mutator_handler)
	if script_data.disable_gamemode_end then
		return false
	end

	local ignore_bots = true
	local humans_dead = GameModeHelper.side_is_dead("heroes", ignore_bots)
	local players_disabled = GameModeHelper.side_is_disabled("heroes") and not GameModeHelper.side_delaying_loss("heroes")
	local mutator_lost = mutator_handler:evaluate_lose_conditions()
	local time_up = self:_is_time_up(t)
	local lost = not self._lose_condition_disabled and (mutator_lost or humans_dead or players_disabled or self._level_failed or time_up)

	if self._about_to_win then
		if self.win_condition_timer < t then
			return true, "won"
		else
			return false
		end
	end

	if self.about_to_lose then
		if lost then
			if self.lost_condition_timer < t then
				return true, "lost"
			else
				return false
			end
		else
			self.about_to_lose = nil
			self.lost_condition_timer = nil
		end
	end

	if lost then
		self.about_to_lose = true

		if humans_dead then
			self.lost_condition_timer = t + GameModeSettings.weave.lose_condition_time_dead
		elseif time_up then
			self.lost_condition_timer = t + GameModeSettings.weave.lose_condition_time_time_up
		else
			self.lost_condition_timer = t + GameModeSettings.weave.lose_condition_time
		end
	elseif self._level_completed and not self._about_to_win then
		local weave_manager = Managers.weave
		local next_objective_index = weave_manager:calculate_next_objective_index()

		if next_objective_index then
			return true, "won"
		else
			self._about_to_win = true
			self.win_condition_timer = t + 6
		end
	else
		return false
	end
end

GameModeWeave.get_saved_game_mode_data = function (self)
	local saved_game_mode_data = self._weave_spawning:get_saved_game_mode_data()

	return table.clone(saved_game_mode_data)
end

GameModeWeave.mutators = function (self)
	local weave_manager = Managers.weave
	local mutators = weave_manager:mutators()

	return mutators
end

GameModeWeave.ai_killed = function (self, killed_unit, killer_unit, death_data, killing_blow)
	local weave_manager = Managers.weave

	weave_manager:ai_killed(killed_unit, killer_unit, death_data, killing_blow)
end

GameModeWeave.on_ai_unit_destroyed = function (self, unit, blackboard, reason)
	if reason == "far_away" and blackboard then
		local spawn_type = Unit.get_data(unit, "spawn_type") or "unknown"
		local enemy_recycler = Managers.state.conflict.enemy_recycler
		local breed = blackboard.breed
		local death_data = {
			despawned = true,
			breed = breed
		}
		local weave_objective_system = Managers.state.entity:system("weave_objective_system")
		local pos = Vector3Box(POSITION_LOOKUP[unit])
		local rot = QuaternionBox(Unit.local_rotation(unit, 0))
		local optional_data = {
			spawn_type = spawn_type
		}

		enemy_recycler:add_breed(breed.name, pos, rot, optional_data)
		weave_objective_system:on_ai_killed(unit, nil, death_data)
	end
end

GameModeWeave._is_time_up = function (self)
	if LEVEL_EDITOR_TEST then
		return false
	end

	local weave_manager = Managers.weave
	local time_left = weave_manager:get_time_left()

	if time_left then
		return time_left <= 0
	end

	local network_time = Managers.state.network:network_time()
	local max_time = NetworkConstants.clock_time.max
	local time_up = network_time / max_time > 0.9

	return time_up
end

GameModeWeave.player_entered_game_session = function (self, peer_id, local_player_id, wanted_party_index)
	GameModeWeave.super.player_entered_game_session(self, peer_id, local_player_id, wanted_party_index)

	if LAUNCH_MODE ~= "attract_benchmark" then
		self._adventure_profile_rules:handle_profile_delegation_for_joining_player(peer_id, local_player_id)
	end

	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status.party_id ~= 1 then
		local party_id = 1

		if #self._bot_players > 0 then
			local profile_index = self._profile_synchronizer:profile_by_peer(peer_id, local_player_id)
			local removed = self:_remove_bot_by_profile(self._bot_players, profile_index)

			if not removed then
				local update_safe = false

				self:_remove_bot(self._bot_players, #self._bot_players, update_safe)
			end
		end

		Managers.party:request_join_party(peer_id, local_player_id, party_id)
	end
end

GameModeWeave.players_left_safe_zone = function (self)
	local weave_manager = Managers.weave
	local weave_spawner = weave_manager:weave_spawner()

	weave_spawner:players_left_safe_zone()
end

GameModeWeave.disable_player_spawning = function (self)
	self._weave_spawning:set_spawning_disabled(true)
end

GameModeWeave.enable_player_spawning = function (self, safe_position, safe_rotation)
	self._weave_spawning:set_spawning_disabled(false)
	self._weave_spawning:force_update_spawn_positions(safe_position, safe_rotation)
end

GameModeWeave.teleport_despawned_players = function (self, position)
	self._weave_spawning:teleport_despawned_players(position)
end

GameModeWeave.flow_callback_add_spawn_point = function (self, unit)
	self._weave_spawning:add_spawn_point(unit)
end

GameModeWeave.set_override_respawn_group = function (self, respawn_group_name, active)
	self._weave_spawning:set_override_respawn_group(respawn_group_name, active)
end

GameModeWeave.set_respawn_group_enabled = function (self, respawn_group_name, active)
	self._weave_spawning:set_respawn_group_enabled(respawn_group_name, active)
end

GameModeWeave.set_respawn_gate_enabled = function (self, respawn_gate_unit, enabled)
	self._weave_spawning:set_respawn_gate_enabled(respawn_gate_unit, enabled)
end

GameModeWeave.respawn_unit_spawned = function (self, unit)
	self._weave_spawning:respawn_unit_spawned(unit)
end

GameModeWeave.get_respawn_handler = function (self)
	return self._weave_spawning:get_respawn_handler()
end

GameModeWeave.respawn_gate_unit_spawned = function (self, unit)
	self._weave_spawning:respawn_gate_unit_spawned(unit)
end

GameModeWeave.set_respawning_enabled = function (self, enabled)
	self._weave_spawning:set_respawning_enabled(enabled)
end

GameModeWeave.remove_respawn_units_due_to_crossroads = function (self, removed_path_distances, total_main_path_length)
	self._weave_spawning:remove_respawn_units_due_to_crossroads(removed_path_distances, total_main_path_length)
end

GameModeWeave.recalc_respawner_dist_due_to_crossroads = function (self)
	self._weave_spawning:recalc_respawner_dist_due_to_crossroads()
end

GameModeWeave.force_respawn = function (self, peer_id, local_player_id)
	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status.party_id == 0 then
		local party_id = 1

		Managers.party:assign_peer_to_party(peer_id, local_player_id, party_id)
	end

	self._weave_spawning:force_respawn(peer_id, local_player_id)
end

GameModeWeave.force_respawn_dead_players = function (self)
	self._weave_spawning:force_respawn_dead_players()
end

GameModeWeave.get_active_respawn_units = function (self)
	return self._weave_spawning:get_active_respawn_units()
end

GameModeWeave.get_player_wounds = function (self, profile)
	if Managers.state.game_mode:has_activated_mutator("instant_death") then
		return 1
	end

	local difficulty_manager = Managers.state.difficulty
	local difficulty_settings = difficulty_manager:get_difficulty_settings()

	return difficulty_settings.wounds
end

GameModeWeave.get_boss_loot_pickup = function (self)
	return nil
end

GameModeWeave.ended = function (self, reason)
	local all_peers_ingame = self._network_server:are_all_peers_ingame()

	if not all_peers_ingame then
		self._network_server:disconnect_joining_peers()
	end

	local weave_manager = Managers.weave
	local next_objective_index = weave_manager:calculate_next_objective_index()
	local current_weave_phase = weave_manager:get_active_weave_phase()

	weave_manager:set_active_weave_phase(current_weave_phase + 1)

	if reason == "won" and not next_objective_index then
		weave_manager:sync_end_of_weave_data()
	end
end

GameModeWeave.game_lost = function (self)
	Managers.matchmaking:set_quick_game(false)
end

GameModeWeave.get_end_screen_config = function (self, game_won, game_lost, player)
	local screen_name = "none"
	local screen_config = {}

	if game_won then
		local weave_manager = Managers.weave
		local next_objective_index = weave_manager:calculate_next_objective_index()

		if not next_objective_index then
			screen_name = "victory"
			screen_config = {
				show_act_presentation = false
			}
		end
	else
		screen_name = "defeat"
	end

	return screen_name, screen_config
end

GameModeWeave.local_player_ready_to_start = function (self, player)
	if not self._local_player_spawned then
		return false
	end

	return true
end

GameModeWeave.local_player_game_starts = function (self, player, loading_context)
	if self._is_initial_spawn then
		LevelHelper:flow_event(self._world, "local_player_spawned")

		if Development.parameter("attract_mode") then
			LevelHelper:flow_event(self._world, "start_benchmark")
		else
			LevelHelper:flow_event(self._world, "level_start_local_player_spawned")
		end
	end

	local weave_manager = Managers.weave

	if self._is_server then
		weave_manager:store_player_ids()
		weave_manager:start_objective()
		weave_manager:reset_statistics_for_challenges()
		weave_manager:start_timer()
	end
end

GameModeWeave._get_first_available_bot_profile = function (self)
	local available_profiles = self._available_profiles
	local profile_synchronizer = self._profile_synchronizer
	local available_profile_by_priority = {}

	for i = 1, #available_profiles do
		local profile_name = available_profiles[i]
		local profile_index = FindProfileIndex(profile_name)

		if not profile_synchronizer:is_profile_in_use(profile_index) then
			available_profile_by_priority[#available_profile_by_priority + 1] = profile_index
		end
	end

	local bot_profile_id_to_priority_id = self._bot_profile_id_to_priority_id

	table.sort(available_profile_by_priority, function (a, b)
		return (bot_profile_id_to_priority_id[a] or math.huge) < (bot_profile_id_to_priority_id[b] or math.huge)
	end)

	local profile_index = available_profile_by_priority[1]

	if script_data.wanted_bot_profile then
		local wanted_profile_index = FindProfileIndex(script_data.wanted_bot_profile)

		if script_data.allow_same_bots or not profile_synchronizer:is_profile_in_use(wanted_profile_index) then
			profile_index = wanted_profile_index
		end
	end

	local profile = SPProfiles[profile_index]
	local display_name = profile.display_name
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local career_index = hero_attributes:get(display_name, "career")
	local bot_career_index = hero_attributes:get(display_name, "bot_career") or career_index or 1

	if script_data.wanted_bot_career_index then
		bot_career_index = script_data.wanted_bot_career_index
	end

	return profile_index, bot_career_index
end

GameModeWeave._setup_bot_spawn_priority_lookup = function (self)
	local saved_priority = PlayerData.bot_spawn_priority
	local num_saved_priority = #saved_priority

	if LAUNCH_MODE == "game" then
		if num_saved_priority > 0 then
			self._bot_profile_id_to_priority_id = {}

			for i = 1, num_saved_priority do
				local profile_id = saved_priority[i]
				self._bot_profile_id_to_priority_id[profile_id] = i
			end
		else
			self._bot_profile_id_to_priority_id = ProfileIndexToPriorityIndex
		end
	elseif LAUNCH_MODE == "attract_benchmark" then
		self._bot_profile_id_to_priority_id = ProfileIndexToPriorityIndex
	else
		self._bot_profile_id_to_priority_id = ProfileIndexToPriorityIndex
	end
end

GameModeWeave._handle_bots = function (self, t, dt)
	local in_session = Managers.state.network ~= nil and not Managers.state.network.game_session_shutdown

	if not in_session then
		return
	end

	local can_spawn_bots = Development.parameter("enable_bots_in_weaves") or self._quick_play

	if script_data.ai_bots_disabled or not can_spawn_bots then
		if #self._bot_players > 0 then
			local update_safe = true

			self:_clear_bots(update_safe)
		end

		return
	end

	local party = Managers.party:get_party(1)
	local num_slots = party.num_slots
	local max_bots = num_slots

	if script_data.cap_num_bots then
		max_bots = math.min(max_bots, script_data.cap_num_bots)
	end

	local bot_players = self._bot_players
	local num_bot_players = #bot_players
	local delta = max_bots - num_bot_players

	if delta > 0 then
		local num_used_slots = party.num_used_slots
		local open_slots = num_slots - num_used_slots
		local num_bots_to_add = math.min(delta, open_slots)

		for i = 1, num_bots_to_add do
			self:_add_bot(bot_players)
		end
	elseif delta < 0 then
		local num_bots_to_remove = math.abs(delta)

		for i = 1, num_bots_to_remove do
			local update_safe = true

			self:_remove_bot(bot_players, #bot_players, update_safe)
		end
	end
end

GameModeWeave._add_bot = function (self, bot_players)
	local party_id = 1
	local party = Managers.party:get_party(party_id)
	local profile_index, career_index = self:_get_first_available_bot_profile(party)

	if LAUNCH_MODE == "attract_benchmark" then
		career_index = 1
	end

	local bot_player = self:_add_bot_to_party(party_id, profile_index, career_index)
	bot_players[#bot_players + 1] = bot_player
end

GameModeWeave._remove_bot = function (self, bot_players, index, update_safe)
	local bot_player = bot_players[index]

	fassert(bot_player, "No bot player at index (%s)", tostring(index))

	if update_safe then
		self:_remove_bot_update_safe(bot_player)
	else
		self:_remove_bot_instant(bot_player)
	end

	local last = #bot_players
	bot_players[index] = bot_players[last]
	bot_players[last] = nil
end

GameModeWeave._remove_bot_by_profile = function (self, bot_players, profile_index)
	local bot_index = nil
	local num_current_bots = #bot_players

	for i = 1, num_current_bots do
		local bot_player = bot_players[i]
		local bot_profile_index = bot_player:profile_index()

		if bot_profile_index == profile_index then
			bot_index = i

			break
		end
	end

	local removed = false

	if bot_index then
		local update_safe = false

		self:_remove_bot(bot_players, bot_index, update_safe)

		removed = true
	end

	return removed
end

GameModeWeave._clear_bots = function (self, update_safe)
	local bot_players = self._bot_players
	local num_bot_players = #bot_players

	for i = num_bot_players, 1, -1 do
		self:_remove_bot(bot_players, i, update_safe)
	end
end

GameModeWeave.cleanup_game_mode_units = function (self)
	local update_safe = false

	self:_clear_bots(update_safe)
end
