require("scripts/managers/conflict_director/weave_spawner")
require("scripts/settings/wind_settings")
require("scripts/settings/weave_settings")

WeaveManager = class(WeaveManager)
local RPCS = {
	"rpc_set_active_weave",
	"rpc_weave_objective_completed",
	"rpc_weave_final_objective_completed",
	"rpc_sync_end_of_weave_data",
	"rpc_sync_player_count",
	"rpc_bar_cutoff_reached"
}
local EVENTS = {
	"conflict_director_setup_done",
	"event_conflict_director_setup_done"
}

WeaveManager.init = function (self)
	self:_reset()
end

WeaveManager.initiate = function (self, world, network_event_delegate, is_server, game_mode_key)
	if game_mode_key == "weave" then
		self:_setup_weave_data(is_server)
		self:_setup_data(world, is_server)
		self:_register_events()
		self:_register_rpcs(network_event_delegate)

		self._initiated = true
	else
		self:_reset()
	end
end

WeaveManager._reset = function (self)
	self._world = nil
	self._initiated = false
	self._is_server = true
	self._bar_score = 0
	self._score = 0
	self._bar_filled = false
	self._objective_ui_mission_name = nil
	self._num_players = nil
	self._active_weave_name = nil
	self._next_weave_name = nil
	self._active_objective_index = nil
	self._next_objective_index = nil
	self._player_ids = {}
	self._saved_game_mode_data = {}
	self._remaining_time = WeaveSettings.starting_time
	self._damage_taken = 0
	self._weave_spawner = nil
	self._final_data_synced = false
	self._has_reset_challenge_stats = false
	self._pause_timer = true
	self._track_kills = false
	self._num_enemies_killed = 0
	self._enemies_killed = {}
	self._active_weave_phase = 1
end

WeaveManager.clear_weave_data = function (self)
	self._bar_score = 0
	self._bar_filled = false
	self._remaining_time = WeaveSettings.starting_time
	self._damage_taken = 0
	self._final_data_synced = false
	self._active_weave_phase = 1

	table.clear(self._saved_game_mode_data)

	self._track_kills = false
	self._num_enemies_killed = 0

	table.clear(self._enemies_killed)
end

WeaveManager._setup_data = function (self, world, is_server)
	self._world = world
	self._is_server = is_server
	self._bar_filled = false
	self._objective_ui_mission_name = nil
	self._next_weave_name = nil
	self._final_data_synced = false
	self._pause_timer = true
	self._next_objective_index = nil
	self._track_kills = false
	self._num_enemies_killed = 0

	table.clear(self._enemies_killed)

	if self._is_server then
		self._weave_spawner = WeaveSpawner:new(self._world, nil)
	else
		self._weave_spawner = nil
	end
end

WeaveManager.weave_spawner = function (self)
	return self._weave_spawner
end

WeaveManager._setup_weave_data = function (self, is_server)
	if not is_server then
		return
	end

	local weave_name = self._next_weave_name or Development.parameter("weave_name")
	local weave_objective_index = self._next_objective_index or (Development.parameter("weave_name") and 1)
	local time_left = self._remaining_time or WeaveSettings.starting_time
	local damage_taken = self._damage_taken or 0
	local player_ids = self._player_ids

	self:_set_active_weave(weave_name)
	self:_set_active_objective(weave_objective_index)
	self:_set_time_left(time_left)
	self:_set_damage_taken(damage_taken)
	self:_set_player_ids(player_ids)
	self:_create_game_object()
	Development.set_parameter("weave_name", nil)
end

WeaveManager._register_events = function (self)
	local event_manager = Managers.state.event

	event_manager:register(self, unpack(EVENTS))
end

WeaveManager._unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager and self._initiated then
		for i = 1, #EVENTS, 2 do
			local event_name = EVENTS[i]

			event_manager:unregister(event_name, self)
		end
	end
end

WeaveManager._register_rpcs = function (self, network_event_delegate)
	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

WeaveManager._unregister_rpcs = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end
end

WeaveManager.reset_statistics_for_challenges = function (self)
	if self._has_reset_challenge_stats then
		return
	end

	local statistics_db = Managers.player:statistics_db()
	local player = Managers.player:local_player()
	local stats_id = player:stats_id()

	if ScorpionSeasonalSettings.current_season_id == 1 then
		local stat_id = "weave_life_stepped_in_bush"

		statistics_db:set_stat(stats_id, "season_1", stat_id, 0)

		stat_id = "weave_death_hit_by_spirit"

		statistics_db:set_stat(stats_id, "season_1", stat_id, 0)

		stat_id = "weave_beasts_destroyed_totems"

		statistics_db:set_stat(stats_id, "season_1", stat_id, 0)

		stat_id = "weave_light_low_curse"

		statistics_db:set_stat(stats_id, "season_1", stat_id, 0)

		stat_id = "weave_shadow_kill_no_shrouded"

		statistics_db:set_stat(stats_id, "season_1", stat_id, 0)
	end

	self._has_reset_challenge_stats = true
end

WeaveManager.teardown = function (self)
	self:_unregister_rpcs()
	self:_unregister_events()

	self._go_id = nil
	self._initiated = false
end

WeaveManager.destroy = function (self)
	self:_unregister_rpcs()
	self:_unregister_events()
end

WeaveManager.update = function (self, dt, t)
	if not self._initiated then
		return
	end

	if self:get_active_weave() and not self._final_data_synced then
		local objective_template = self:get_active_objective_template()

		if self._is_server then
			if not self._pause_timer then
				self._remaining_time = math.max(self._remaining_time - dt, 0)
			end

			self._score = self:_calculate_score()
		end

		local game = Managers.state.network:game()

		if game and self._go_id then
			if self._is_server then
				local remaining_time = math.floor(self._remaining_time)

				GameSession.set_game_object_field(game, self._go_id, "remaining_time", remaining_time)

				if objective_template.bar_cutoff <= self._bar_score and not self._bar_filled then
					self:_objective_completed()

					local network_transmit = Managers.state.network.network_transmit

					network_transmit:send_rpc_clients("rpc_weave_objective_completed")
				end
			else
				self._remaining_time = GameSession.game_object_field(game, self._go_id, "remaining_time")
			end
		end

		if self._remaining_time == 0 and self._objective_ui_mission_name ~= "weave_time_out" then
			if self._objective_ui_mission_name then
				Managers.state.event:trigger("ui_event_complete_mission", self._objective_ui_mission_name, true)
			end

			Managers.state.event:trigger("ui_event_add_mission_objective", "weave_time_out", Localize("weave_time_out"))

			self._objective_ui_mission_name = "weave_time_out"
		end

		if self._weave_spawner then
			self._weave_spawner:update(t, dt, objective_template)
		end
	end
end

WeaveManager.event_conflict_director_setup_done = function (self)
	if self:get_active_weave() and self._is_server then
		local objective_template = self:get_active_objective_template()
		local spawning_seed = objective_template.spawning_seed

		if spawning_seed then
			self._weave_spawner:set_seed(spawning_seed)
		end

		self._weave_spawner.conflict_director_setup_done = true
	end
end

WeaveManager._set_player_ids = function (self, player_ids)
	if not player_ids then
		return
	end

	self._player_ids = player_ids
end

WeaveManager.store_player_ids = function (self)
	if not table.is_empty(self._player_ids) then
		return
	end

	local lobby = Managers.state.network:lobby()
	local lobby_members = lobby:members()
	local member_ids = lobby_members:get_members()

	for _, peer_id in pairs(member_ids) do
		self._player_ids[peer_id] = true
	end

	local matchmaking = lobby:lobby_data("matchmaking")

	if matchmaking == "true" then
		self._num_players = 4
	else
		self._num_players = table.size(self._player_ids)
	end

	local network_transmit = Managers.state.network.network_transmit

	network_transmit:send_rpc_clients("rpc_sync_player_count", self._num_players)
end

WeaveManager.get_saved_game_mode_data = function (self)
	if not self._is_server then
		return
	end

	return table.clone(self._saved_game_mode_data)
end

WeaveManager.store_saved_game_mode_data = function (self)
	if not self._is_server then
		return
	end

	local saved_game_mode_data = Managers.state.game_mode:get_saved_game_mode_data()

	for _, slot_data in pairs(saved_game_mode_data) do
		slot_data.spawn_state = nil
		slot_data.position = nil
		slot_data.rotation = nil
	end

	self._saved_game_mode_data = saved_game_mode_data
end

WeaveManager.get_player_ids = function (self)
	return self._player_ids
end

WeaveManager.set_next_weave = function (self, weave_name)
	self._next_weave_name = weave_name
end

WeaveManager.set_next_objective = function (self, objective_index)
	self._next_objective_index = objective_index
end

WeaveManager.get_next_weave = function (self)
	return self._next_weave_name
end

WeaveManager.get_next_objective = function (self)
	return self._next_objective_index
end

WeaveManager.get_time_left = function (self)
	return self._remaining_time
end

WeaveManager.get_damage_taken = function (self)
	return self._damage_taken
end

WeaveManager._set_active_weave = function (self, weave_name)
	self._active_weave_name = weave_name
end

WeaveManager._report_telemetry = function (self)
	local wind = self:get_active_wind()
	local tier = self:get_weave_tier()

	Managers.telemetry.events:weave_activated(wind, tier)
end

WeaveManager._set_active_objective = function (self, objective_index)
	self._active_objective_index = objective_index
end

WeaveManager.get_active_objective = function (self)
	return self._active_objective_index
end

WeaveManager._set_time_left = function (self, remaining_time)
	self._remaining_time = remaining_time
end

WeaveManager._set_damage_taken = function (self, damage_taken)
	self._damage_taken = damage_taken
end

WeaveManager.get_active_weave = function (self)
	return self._active_weave_name
end

WeaveManager.get_active_weave_phase = function (self)
	return self._active_weave_phase
end

WeaveManager.set_active_weave_phase = function (self, phase)
	self._active_weave_phase = phase
end

WeaveManager.get_active_wind = function (self)
	local template = WeaveSettings.templates[self._active_weave_name]

	return template and template.wind
end

WeaveManager.get_active_wind_settings = function (self)
	if not self._active_weave_name then
		return
	end

	local template = WeaveSettings.templates[self._active_weave_name]
	local wind = template and template.wind

	return WindSettings[wind]
end

WeaveManager.get_scaling_value = function (self, scaling_value_key)
	local quick_game = Managers.matchmaking:is_quick_game()
	local template = WeaveSettings.templates[self._active_weave_name]
	local scaling_settings = template.scaling_settings
	local scaling_setting = not quick_game and scaling_settings and scaling_settings[scaling_value_key]
	local tier = template.tier
	local previous_breakpoint = 0

	if scaling_setting then
		for _, increase_data in ipairs(WeaveSettings.difficulty_increases) do
			if tier <= increase_data.breakpoint then
				local scaling_value = (tier - previous_breakpoint) / (increase_data.breakpoint - previous_breakpoint)
				local min = scaling_setting[1]
				local max = scaling_setting[2]
				local final_scaling_value = math.lerp(min, max, scaling_value)

				return final_scaling_value
			else
				previous_breakpoint = increase_data.breakpoint
			end
		end
	end

	return 0
end

WeaveManager.start_timer = function (self)
	self._pause_timer = false
end

WeaveManager.calculate_next_objective_index = function (self)
	local active_objective_index = self._active_objective_index
	local template = WeaveSettings.templates[self._active_weave_name]
	local objectives = template.objectives

	if active_objective_index == #objectives then
		return
	end

	return active_objective_index + 1
end

WeaveManager.sync_end_of_weave_data = function (self)
	self._final_data_synced = true
	local score = self._score
	local remaining_time = self._remaining_time
	local num_players = self._num_players
	local damage_taken = self._damage_taken
	local network_transmit = Managers.state.network.network_transmit

	network_transmit:send_rpc_clients("rpc_sync_end_of_weave_data", score, remaining_time, num_players, damage_taken)
end

WeaveManager.hot_join_sync = function (self, sender)
	local game_mode_key = Managers.state.game_mode:game_mode_key()

	if game_mode_key ~= "weave" then
		return
	end

	local network_transmit = Managers.state.network.network_transmit
	local weave_name = self._active_weave_name

	if weave_name then
		local weave_name_id = NetworkLookup.weave_names[weave_name]
		local objective_index = self._active_objective_index

		network_transmit:send_rpc("rpc_set_active_weave", sender, weave_name_id, objective_index)
	end

	local player_count = self._num_players

	if player_count then
		network_transmit:send_rpc("rpc_sync_player_count", sender, player_count)
	end
end

local mutators_temp = {}

WeaveManager.mutators = function (self)
	table.clear(mutators_temp)

	local active_weave_name = self._active_weave_name

	if not active_weave_name then
		return mutators_temp
	end

	local template = WeaveSettings.templates[active_weave_name]
	local wind_strength = template.wind_strength

	if wind_strength == 0 then
		return mutators_temp
	end

	local wind = template.wind
	local wind_settings = WindSettings[wind]
	local mutator_name = wind_settings.mutator
	mutators_temp[#mutators_temp + 1] = mutator_name

	return mutators_temp
end

WeaveManager.start_objective = function (self)
	local objective_template = self:get_active_objective_template()
	local start_flow_event = objective_template.objective_start_flow_event
	local objective_settings = objective_template.objective_settings
	local objective_lists = objective_settings and objective_settings.objective_lists

	if start_flow_event then
		LevelHelper:flow_event(self._world, start_flow_event)
	end

	self._track_kills = objective_template.track_kills

	if objective_lists then
		local weave_objective_system = Managers.state.entity:system("weave_objective_system")

		weave_objective_system:activate_objectives(objective_lists)
	end

	local objective_text = objective_template.display_name

	Managers.state.event:trigger("ui_event_add_mission_objective", "objective", Localize(objective_text))

	self._objective_ui_mission_name = "objective"

	Managers.state.event:trigger("weave_objective_synced")
	self:_report_telemetry()
end

WeaveManager.player_damaged = function (self, damage_amount)
	self._damage_taken = math.min(WeaveSettings.max_damage_taken, self._damage_taken + damage_amount)
end

WeaveManager.current_bar_score = function (self)
	local game = Managers.state.network:game()

	if game and self._go_id then
		local game_object_score = GameSession.game_object_field(game, self._go_id, "bar_score")
		local bar_score = self._bar_score
		local score = (game_object_score < bar_score and bar_score) or game_object_score

		return score
	else
		return 0
	end
end

WeaveManager.increase_bar_score = function (self, amount)
	fassert(self._is_server, "can't increase weave score as a client")

	local objective_template = self:get_active_objective_template()
	local bar_multiplier = objective_template.bar_multiplier
	local bar_cutoff = objective_template.bar_cutoff
	amount = amount * bar_multiplier
	local game = Managers.state.network:game()

	if game and self._go_id then
		self._bar_score = math.min(math.max(self._bar_score + amount, 0), bar_cutoff)

		if self._bar_score == bar_cutoff then
			local network_transmit = Managers.state.network.network_transmit

			network_transmit:send_rpc_clients("rpc_bar_cutoff_reached")
		end

		GameSession.set_game_object_field(game, self._go_id, "bar_score", self._bar_score)
	end
end

WeaveManager.show_bar = function (self)
	local objective_template = self:get_active_objective_template()

	if objective_template and objective_template.show_bar and not self._bar_filled then
		return true
	end

	return false
end

WeaveManager.get_active_objective_template = function (self)
	if not self._active_objective_index then
		return
	end

	local objective_index = self._active_objective_index
	local weave_template = WeaveSettings.templates[self._active_weave_name]
	local objectives = weave_template.objectives
	local objective_template = objectives[objective_index]

	return objective_template
end

WeaveManager.get_scaling_difficulty_index = function (self)
	return
end

WeaveManager.get_active_weave_template = function (self)
	if not self._active_weave_name then
		return
	end

	return WeaveSettings.templates[self._active_weave_name]
end

WeaveManager.start_terror_event = function (self, event_template_name, spawner_id)
	local weave_settings = self:get_active_weave_template()
	local objective_settings = self:get_active_objective_template()
	local objective_index = self._active_objective_index

	fassert(weave_settings ~= nil, "Tried to start terror event from WeaveManager without any active weave")
	fassert(objective_settings.terror_events ~= nil, string.format("%q does not contain a terror_events table for objective %s", weave_settings.name, objective_index))
	fassert(table.contains(objective_settings.terror_events, event_template_name), string.format("%q's terror_event table does not contain terror event '%q'", weave_settings.name, event_template_name))
	self._weave_spawner:start_terror_event_from_template(event_template_name, spawner_id)
end

WeaveManager.stop_terror_event = function (self, event_template_name, spawner_id)
	local weave_settings = self:get_active_weave_template()
	local objective_settings = self:get_active_objective_template()
	local objective_index = self._active_objective_index

	fassert(weave_settings ~= nil, "Tried to start terror event from WeaveManager without any active weave")
	fassert(objective_settings.terror_events ~= nil, string.format("%q does not contain a terror_events table for objective %s", weave_settings.name, objective_index))
	fassert(table.contains(objective_settings.terror_events, event_template_name), string.format("%q's terror_event table does not contain terror event '%q'", weave_settings.name, event_template_name))

	local new_terror_event_name = string.format("%s_%s", event_template_name, spawner_id)

	TerrorEventMixer.stop_event(new_terror_event_name)
end

WeaveManager.get_wind_strength = function (self)
	local weave_template = WeaveSettings.templates[self._active_weave_name]

	return (weave_template and weave_template.wind_strength) or 1
end

WeaveManager._create_game_object = function (self)
	local go_data_table = {
		go_type = NetworkLookup.go_types.weave,
		bar_score = self._bar_score,
		remaining_time = self._remaining_time
	}
	local callback = callback(self, "cb_game_session_disconnect")
	self._go_id = Managers.state.network:create_game_object("weave", go_data_table, callback)
end

WeaveManager.game_object_created = function (self, go_id)
	self._go_id = go_id
end

WeaveManager.game_object_destroyed = function (self)
	self._go_id = nil
end

WeaveManager.cb_game_session_disconnect = function (self)
	self._go_id = nil
end

WeaveManager.final_objective_completed = function (self)
	if self._is_server then
		local network_transmit = Managers.state.network.network_transmit

		network_transmit:send_rpc_clients("rpc_weave_final_objective_completed")

		self._pause_timer = true
	end

	if self._objective_ui_mission_name then
		Managers.state.event:trigger("ui_event_complete_mission", self._objective_ui_mission_name, true)
	end

	local wwise_world = Managers.world:wwise_world(self._world)

	WwiseWorld.trigger_event(wwise_world, "Play_hud_wind_objectives_complete")
	Managers.state.event:trigger("ui_event_add_mission_objective", "weave_victory", Localize("weave_victory"))

	self._objective_ui_mission_name = "weave_victory"
end

WeaveManager._objective_completed = function (self)
	self._bar_filled = true
	local objective_template = self:get_active_objective_template()
	local objective_completed_flow_event = objective_template.objective_completed_flow_event

	if objective_completed_flow_event then
		LevelHelper:flow_event(self._world, objective_completed_flow_event)
	end

	local end_zone_name = objective_template.end_zone_name

	if end_zone_name then
		local end_zone_system = Managers.state.entity:system("end_zone_system")

		end_zone_system:activate_end_zone_by_name(end_zone_name)
	end

	if self._objective_ui_mission_name then
		Managers.state.event:trigger("ui_event_complete_mission", self._objective_ui_mission_name)
	end

	local next_objective_index = self:calculate_next_objective_index()
	local template = WeaveSettings.templates[self._active_weave_name]
	local objectives = template.objectives
	local bonus_time = objective_template.bonus_time_on_complete

	if bonus_time and self._is_server then
		self._remaining_time = self._remaining_time + bonus_time
	end

	if next_objective_index == #objectives then
		local wwise_world = Managers.world:wwise_world(self._world)

		WwiseWorld.trigger_event(wwise_world, "Play_hud_wind_objectives_complete")

		local text = Localize("reach_final_challenge_text")

		if bonus_time then
			local seconds = math.max(bonus_time, 0)
			local minutes = math.floor(seconds / 60)
			local hours = math.floor(minutes / 60)
			local timer_text = string.format("%d:%02d", minutes - hours * 60, seconds % 60)
			text = text .. "\n+" .. timer_text
		end

		Managers.state.event:trigger("ui_event_add_mission_objective", "objective_complete", text)

		self._objective_ui_mission_name = "objective_complete"
	end

	local weave_objective_system = Managers.state.entity:system("weave_objective_system")

	weave_objective_system:deactivate()
end

WeaveManager._calculate_score = function (self)
	local damage_score = WeaveSettings.max_damage_taken - self._damage_taken
	local time_score = self._remaining_time * WeaveSettings.time_score_weighting
	local total_score = math.floor(math.max(time_score + damage_score, 0) * 10)

	return total_score
end

WeaveManager.get_bar_score = function (self)
	return self._bar_score
end

WeaveManager.get_score = function (self)
	return self._score
end

WeaveManager.get_time_score = function (self)
	return math.floor(math.max(self:get_score() - self:get_damage_score(), 0))
end

WeaveManager.get_damage_score = function (self)
	return math.floor((WeaveSettings.max_damage_taken - self._damage_taken) * 10)
end

WeaveManager.get_weave_tier = function (self)
	local weave_template = WeaveSettings.templates[self._active_weave_name]

	return weave_template.tier
end

WeaveManager.get_num_players = function (self)
	return self._num_players
end

WeaveManager.is_tracking_kills = function (self)
	return self._track_kills
end

WeaveManager.ai_killed = function (self, killed_unit, killer_unit, death_data, killing_blow)
	if self._track_kills then
		self:_track_ai_killed(death_data.breed.name)
	end

	local weave_objective_system = Managers.state.entity:system("weave_objective_system")

	weave_objective_system:on_ai_killed(killed_unit, killer_unit, death_data, killing_blow)
end

WeaveManager._track_ai_killed = function (self, breed_name)
	if self._is_server then
		self._enemies_killed[breed_name] = self._enemies_killed[breed_name] or 0
		self._enemies_killed[breed_name] = self._enemies_killed[breed_name] + 1
		self._num_enemies_killed = self._num_enemies_killed + 1
		local difficulty_key = Managers.state.difficulty:get_difficulty()
		local current_objective_template = self:get_active_objective_template()
		local enemy_count = current_objective_template.enemy_count[difficulty_key]
		local amount = 1 / enemy_count * 100

		self:increase_bar_score(amount)
	end
end

WeaveManager.rpc_bar_cutoff_reached = function (self, sender)
	local objective_template = self:get_active_objective_template()
	local bar_cutoff = objective_template.bar_cutoff
	self._bar_score = bar_cutoff
end

WeaveManager.rpc_set_active_weave = function (self, sender, weave_name_id, objective_index)
	local weave_name = NetworkLookup.weave_names[weave_name_id]

	self:reset_statistics_for_challenges()
	self:_set_active_weave(weave_name)
	self:_set_active_objective(objective_index)
	self:start_objective()
	Managers.state.event:trigger("weave_objective_synced")
end

WeaveManager.rpc_weave_objective_completed = function (self, sender)
	self:_objective_completed()
end

WeaveManager.rpc_sync_end_of_weave_data = function (self, sender, score, remaining_time, num_players, damage_taken)
	self._score = score
	self._remaining_time = remaining_time
	self._num_players = num_players
	self._damage_taken = damage_taken
end

WeaveManager.rpc_sync_player_count = function (self, sender, num_players)
	self._num_players = num_players
end

WeaveManager.rpc_weave_final_objective_completed = function (self, sender)
	self:final_objective_completed()
end

return
