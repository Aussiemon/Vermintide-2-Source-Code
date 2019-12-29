require("scripts/managers/game_mode/game_modes/game_mode_base")
require("scripts/managers/game_mode/spawning_components/weave_spawning")

script_data.disable_gamemode_end = script_data.disable_gamemode_end or Development.parameter("disable_gamemode_end")
GameModeWeave = class(GameModeWeave, GameModeBase)
local COMPLETE_LEVEL_VAR = false
local FAIL_LEVEL_VAR = false

GameModeWeave.init = function (self, settings, world, network_server, level_transition_handler, is_server, profile_synchronizer)
	GameModeWeave.super.init(self, settings, world, network_server, level_transition_handler, is_server, profile_synchronizer)

	self.about_to_lose = false
	self.lost_condition_timer = nil
	self.about_to_win = false
	self.win_condition_timer = nil
	self._level_transition_handler = level_transition_handler
	self._adventure_profile_rules = AdventureProfileRules:new(self._profile_synchronizer, self._network_server)
	local saved_game_mode_data = Managers.weave:get_saved_game_mode_data()
	local hero_side = Managers.state.side:get_side_from_name("heroes")
	self._weave_spawning = WeaveSpawning:new(self._profile_synchronizer, hero_side, self._is_server, self._network_server, saved_game_mode_data)

	self:_register_player_spawner(self._weave_spawning)

	self._local_player_spawned = false
	local event_manager = Managers.state.event

	event_manager:register(self, "level_start_local_player_spawned", "event_local_player_spawned")
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
	self._weave_spawning:server_update(t, dt)
end

GameModeWeave.evaluate_end_conditions = function (self, round_started, dt, t, mutator_handler)
	if script_data.disable_gamemode_end then
		return false
	end

	local ignore_bots = true
	local humans_dead = GameModeHelper.side_is_dead("heroes", ignore_bots)
	local players_disabled = GameModeHelper.side_is_disabled("heroes")
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

GameModeWeave.get_conflict_settings = function (self)
	local weave_manager = Managers.weave
	local objective_template = weave_manager:get_active_objective_template()

	if not objective_template then
		return nil
	end

	return objective_template.conflict_settings or "default"
end

GameModeWeave.ai_killed = function (self, killed_unit, killer_unit, death_data, killing_blow)
	local weave_manager = Managers.weave

	weave_manager:ai_killed(killed_unit, killer_unit, death_data, killing_blow)
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

GameModeWeave.player_entered_game_session = function (self, peer_id, local_player_id)
	GameModeWeave.super.player_entered_game_session(self, peer_id, local_player_id)

	if LAUNCH_MODE ~= "attract_benchmark" then
		self._adventure_profile_rules:handle_profile_delegation_for_joining_player(peer_id, local_player_id)
	end

	local status = Managers.party:get_player_status(peer_id, local_player_id)

	if status.party_id ~= 1 then
		local party_id = 1

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

GameModeWeave.respawn_unit_spawned = function (self, unit)
	self._weave_spawning:respawn_unit_spawned(unit)
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

GameModeWeave.ended = function (self, reason)
	local weave_manager = Managers.weave
	local next_objective_index = weave_manager:calculate_next_objective_index()
	local current_weave_phase = weave_manager:get_active_weave_phase()

	weave_manager:set_active_weave_phase(current_weave_phase + 1)

	if reason == "won" and not next_objective_index then
		weave_manager:sync_end_of_weave_data()
	end
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

return
