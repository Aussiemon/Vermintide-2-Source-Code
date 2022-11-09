-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/settings/breeds")
require("scripts/managers/conflict_director/terror_event_mixer")
require("scripts/settings/conflict_settings")
require("scripts/managers/conflict_director/conflict_utils")
require("scripts/managers/conflict_director/main_path_utils")
require("scripts/managers/conflict_director/pack_spawner_utils")
require("scripts/managers/conflict_director/formation_utils")
require("scripts/managers/conflict_director/breed_packs")
require("scripts/managers/conflict_director/pacing")
require("scripts/managers/conflict_director/enemy_recycler")
require("scripts/managers/conflict_director/level_analysis")
require("scripts/managers/conflict_director/patrol_analysis")
require("scripts/managers/conflict_director/horde_spawner")
require("scripts/managers/conflict_director/a_star")
require("scripts/managers/conflict_director/specials_pacing")
require("scripts/managers/conflict_director/perlin_path")
require("scripts/managers/conflict_director/spawn_zone_baker")
require("scripts/managers/conflict_director/nav_tag_volume_handler")
require("scripts/managers/conflict_director/conflict_director_tests")
require("scripts/managers/conflict_director/breed_freezer")
require("scripts/managers/conflict_director/peak_delayer")
require("scripts/settings/level_settings")
require("scripts/utils/perlin_noise")
require("scripts/utils/navigation_group_manager")
require("scripts/settings/syntax_watchdog")
require("scripts/settings/patrol_formation_settings")
require("scripts/utils/debug_list_picker")
require("scripts/utils/ik_chain")

local position_lookup = POSITION_LOOKUP
local BLACKBOARDS = BLACKBOARDS
local distance_squared = Vector3.distance_squared
local RecycleSettings = RecycleSettings
local FORM_GROUPS_IN_ONE_FRAME = true
local RPCS = {
	"rpc_terror_event_trigger_flow"
}
local script_data = script_data
script_data.debug_terror = script_data.debug_terror or Development.parameter("debug_terror")
script_data.ai_roaming_spawning_disabled = script_data.ai_roaming_spawning_disabled or Development.parameter("ai_roaming_spawning_disabled")
script_data.ai_specials_spawning_disabled = script_data.ai_specials_spawning_disabled or Development.parameter("ai_specials_spawning_disabled")
script_data.ai_horde_spawning_disabled = script_data.ai_horde_spawning_disabled or Development.parameter("ai_horde_spawning_disabled")
script_data.ai_pacing_disabled = script_data.ai_pacing_disabled or Development.parameter("ai_pacing_disabled")
script_data.ai_far_off_despawn_disabled = script_data.ai_far_off_despawn_disabled or Development.parameter("ai_far_off_despawn_disabled")
script_data.debug_player_positioning = script_data.debug_player_positioning or Development.parameter("debug_player_positioning")

local function find_level_peaks(zones, num_zones)
	local peaks = {}

	for i = 1, num_zones, 1 do
		local zone = zones[i]

		if zone.peak then
			peaks[#peaks + 1] = zone.travel_dist
		end
	end

	return peaks
end

local conflict_director_testify = script_data.testify and require("scripts/managers/conflict_director/conflict_director_testify")
ConflictDirector = class(ConflictDirector)

ConflictDirector.init = function (self, world, level_key, network_event_delegate, level_seed, is_server, conflict_settings)
	self._world = world
	self._time = 0
	self._level_key = level_key
	self._spawned = {}
	self._spawned_lookup = {}
	self._num_spawned_by_breed = {}
	self._num_spawned_by_breed_during_event = {}
	self._spawned_units_by_breed = {}
	self.num_queued_spawn_by_breed = {}

	TerrorEventUtils.set_seed(level_seed)

	self._current_debug_list_index = 1
	self._debug_list = {
		"none"
	}
	local level_settings = LevelSettings[level_key]
	self.initial_conflict_settings = conflict_settings

	self:set_updated_settings(conflict_settings)

	self.pacing = Pacing:new(world)
	self.enemy_recycler = nil
	self.specials_pacing = nil
	self.navigation_group_manager = NavigationGroupManager:new()
	self._alive_specials = {}
	self._alive_bosses = {}
	self._alive_standards = {}
	self._next_pacing_update = Math.random()
	self._next_threat_update = self._next_pacing_update + 0.1
	self._living_horde = 0
	self._horde_ends_at = math.huge
	self._num_spawned_during_event = 0
	self._num_angry_bosses = 0
	self._next_horde_time = math.huge
	self._player_directions = {}
	self._drop_crumb_time = 0
	self.world_gui = World.create_world_gui(world, Matrix4x4.identity(), 1, 1, "immediate", "material", "materials/fonts/gw_fonts")
	self._player_areas = {}

	self:reset_spawned_by_breed()
	self:reset_spawned_by_breed_during_event()
	self:reset_queued_spawn_by_breed()
	TerrorEventMixer.reset()

	self._rushing_checks = {}
	self._next_rush_check_unit = nil
	self._next_rush_check = math.huge
	self.spawn_queue = {}
	self.first_spawn_index = 1
	self.spawn_queue_size = 0
	self.spawn_queue_id = 0
	self.main_path_player_info = {}

	self:_setup_sides_to_update_recycler()

	local side = Managers.state.side:get_side_from_name("heroes") or Managers.state.side:get_side(1)
	self._hero_side = side
	local player_units = side.PLAYER_UNITS
	local ahead_unit, behind_unit = nil

	if side then
		local player_units = side.PLAYER_UNITS
		ahead_unit = player_units[1]
		behind_unit = player_units[1]
	end

	self.main_path_info = {
		current_path_index = 1,
		behind_percent = 1,
		ahead_percent = 0,
		ahead_travel_dist = 0,
		main_path_player_info_index = 0,
		ahead_unit = ahead_unit,
		behind_unit = behind_unit,
		player_info_by_travel_distance = {}
	}
	self._main_path_obstacles = {}
	self._next_progression_percent = 0.1
	self._next_rushing_intervention_time = 5.1
	self._rushing_intervention_travel_dist = 50
	self.rushing_intervention_data = {
		ahead_dist = 0,
		loneliness_value = 0
	}
	self._next_speed_running_intervention_time = 5.1
	self.speed_running_intervention_data = {
		next_travel_dist_check_t = 10,
		player_travel_distances = {},
		total_travel_distances = {}
	}
	self.in_safe_zone = true
	self.disabled = false
	self._mini_patrol_state = "waiting"
	self._next_mini_patrol_timer = 15
	local level_name = level_settings.level_name
	self.level_analysis = LevelAnalysis:new(nil, false, level_name, level_seed)
	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.frozen_intensity_decay_until = 0
	self.threat_value = 0
	self.num_aggroed = 0
	local difficulty, difficulty_tweak = Managers.state.difficulty:get_difficulty()
	self.delay_horde_threat_value = (CurrentPacing.delay_horde_threat_value and DifficultyTweak.converters.tweaked_delay_threat_value(difficulty, difficulty_tweak, CurrentPacing.delay_horde_threat_value)) or math.huge
	self.delay_mini_patrol_threat_value = (CurrentPacing.delay_mini_patrol_threat_value and DifficultyTweak.converters.tweaked_delay_threat_value(difficulty, difficulty_tweak, CurrentPacing.delay_mini_patrol_threat_value)) or math.huge
	self.delay_specials_threat_value = (CurrentPacing.delay_specials_threat_value and DifficultyTweak.converters.tweaked_delay_threat_value(difficulty, difficulty_tweak, CurrentPacing.delay_specials_threat_value)) or math.huge

	Managers.state.event:register(self, "event_delay_pacing", "event_delay_pacing")
end

ConflictDirector._setup_sides_to_update_recycler = function (self)
	local sides_to_update = {}
	local sides = Managers.state.side:sides()
	local j = 1

	for i = 1, #sides, 1 do
		local side = sides[i]

		if side.using_enemy_recycler then
			sides_to_update[j] = side
			j = j + 1
		end
	end

	self.sides_to_update_recycler = sides_to_update
end

ConflictDirector.rpc_terror_event_trigger_flow = function (self, channel_id, event_id)
	local flow_event = NetworkLookup.terror_flow_events[event_id]

	self:level_flow_event(flow_event)
end

local function remove_element_from_array(array, value_to_remove)
	local size = #array

	for i = 1, size, 1 do
		local value = array[i]

		if value == value_to_remove then
			array[i] = array[size]
			array[size] = nil

			return
		end
	end
end

ConflictDirector.alive_specials_count = function (self)
	local count = 0

	for _, special in ipairs(self._alive_specials) do
		if ALIVE[special] then
			count = count + 1
		end
	end

	return count
end

ConflictDirector.alive_specials = function (self, optional_table)
	local alive_specials = optional_table or {}

	for _, special in ipairs(self._alive_specials) do
		if ALIVE[special] then
			alive_specials[#alive_specials + 1] = special
		end
	end

	return alive_specials
end

ConflictDirector.alive_bosses = function (self)
	return self._alive_bosses
end

ConflictDirector.alive_standards = function (self)
	return self._alive_standards
end

ConflictDirector.reset_queued_spawn_by_breed = function (self)
	for name, breed in pairs(Breeds) do
		self.num_queued_spawn_by_breed[name] = 0
	end
end

ConflictDirector.reset_spawned_by_breed = function (self)
	for name, breed in pairs(Breeds) do
		self._num_spawned_by_breed[name] = 0
		self._spawned_units_by_breed[name] = {}
	end
end

ConflictDirector.reset_spawned_by_breed_during_event = function (self)
	for name, breed in pairs(Breeds) do
		self._num_spawned_by_breed_during_event[name] = 0
	end

	self._num_spawned_during_event = 0
end

ConflictDirector.destroy = function (self)
	self.navigation_group_manager:destroy(self._world)

	if self.nav_tag_volume_handler then
		self.nav_tag_volume_handler:destroy()

		self.nav_tag_volume_handler = nil
	end

	if self.patrol_analysis then
		self.patrol_analysis:destroy()

		self.patrol_analysis = nil
	end

	self.level_analysis:destroy()
	self._network_event_delegate:unregister(self)

	self._main_path_obstacles = nil

	if self.breed_freezer then
		self.breed_freezer:destroy()
	end
end

ConflictDirector.get_player_unit_segment = function (self, player_unit)
	local player_info = self.main_path_player_info[player_unit]

	return (player_info and player_info.path_index) or nil
end

ConflictDirector.get_player_unit_travel_distance = function (self, player_unit)
	local player_info = self.main_path_player_info[player_unit]

	return (player_info and player_info.travel_dist) or nil
end

ConflictDirector.stop_rush_check = function (self, t)
	self._next_rush_check = math.huge

	table.clear(self._rushing_checks)
end

ConflictDirector.init_rush_check = function (self, t)
	self.players_speeding_dist = 0
	self._next_rush_check = 0
end

ConflictDirector.are_players_rushing = function (self, t)
	if self._next_rush_check < t then
		local main_path_player_info = self.main_path_player_info
		local side = self._hero_side
		local player_units = side.PLAYER_UNITS
		self._next_rush_check_unit = next(player_units, self._next_rush_check_unit)
		local unit = player_units[self._next_rush_check_unit]

		if unit then
			local path_data = main_path_player_info[unit]

			if not path_data then
				return
			end

			local rushing_checks = self._rushing_checks
			local start_data = rushing_checks[unit]

			if not start_data then
				start_data = {
					start_pos = Vector3Box(path_data.path_pos:unbox()),
					start_dist = path_data.travel_dist
				}
				rushing_checks[unit] = start_data

				return
			end

			local path_data = main_path_player_info[unit]
			local distance_moved = path_data.travel_dist - start_data.start_dist

			if self.players_speeding_dist < distance_moved then
				self.players_speeding_dist = distance_moved
			end

			if CurrentPacing.relax_rushing_distance < distance_moved then
				return true
			end
		else
			self._next_rush_check = t + 1
		end
	end
end

ConflictDirector.main_path_completion = function (self, unit)
	local min_completion = 0
	local data = self.main_path_player_info[unit]
	local move_percent = (data and data.move_percent) or 0

	return move_percent
end

ConflictDirector.sort_player_info_by_travel_distance = function (self, main_path_info, main_path_player_info)
	local player_info_by_travel_distance = main_path_info.player_info_by_travel_distance

	table.clear(player_info_by_travel_distance)

	local i = 0

	for unit, data in pairs(main_path_player_info) do
		i = i + 1
		player_info_by_travel_distance[i] = data
	end

	if i > 0 then
		table.sort(player_info_by_travel_distance, function (info_a, info_b)
			return info_a.travel_dist < info_b.travel_dist
		end)

		local ahead_info = player_info_by_travel_distance[1]
		main_path_info.ahead_unit = ahead_info.unit
		main_path_info.ahead_percent = ahead_info.move_percent
		main_path_info.ahead_travel_dist = ahead_info.travel_dist
		local behind_info = player_info_by_travel_distance[i]
		main_path_info.behind_unit = behind_info.unit
		main_path_info.behind_percent = ahead_info.move_percent
	else
		main_path_info.ahead_unit = nil
		main_path_info.ahead_percent = 0
		main_path_info.ahead_travel_dist = 0
		main_path_info.behind_unit = nil
		main_path_info.behind_percent = 1
	end
end

ConflictDirector.main_path_player_far_away_check = function (self, data, travel_dist, path_pos, pos, t)
	local far_away = math.abs(travel_dist - data.travel_dist) > 100

	if far_away then
		local astar = data.astar

		if astar then
			local done = GwNavAStar.processing_finished(astar)

			if done then
				local path_found = GwNavAStar.path_found(astar)

				if path_found then
					far_away = false
				end

				GwNavAStar.destroy(astar)

				data.astar = nil
				data.astar_timer = 0
				data.astar_timer = t + 3
			end
		elseif data.astar_timer < t then
			print("main_path_player_far_away_check started")

			local astar = GwNavAStar.create(self.nav_world)
			local traverse_logic = Managers.state.bot_nav_transition:traverse_logic()

			GwNavAStar.start_with_propagation_box(astar, self.nav_world, pos, path_pos, 30, traverse_logic)

			data.astar = astar
			data.astar_timer = t + 3
		end
	end

	return far_away
end

ConflictDirector.update_main_path_player_info = function (self, side, t)
	local main_path_info = self.main_path_info

	if not main_path_info.main_paths then
		return
	end

	local main_path_player_info = self.main_path_player_info
	local index = main_path_info.main_path_player_info_index
	index = index + 1
	local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
	local player_and_bot_positions = side.PLAYER_AND_BOT_POSITIONS
	local num_units = #player_and_bot_units

	if index > num_units then
		index = 1
	end

	main_path_info.main_path_player_info_index = index
	local unit = player_and_bot_units[index]

	if unit then
		local pos = player_and_bot_positions[index]
		local navigation_group_manager = self.navigation_group_manager
		local nav_group = navigation_group_manager:get_group_from_position(pos)

		if not nav_group then
			local above = 1
			local below = 3
			local horizontal = 3
			local distance_from_obstacle = 0.1
			local nav_world = self.nav_world
			local position_on_mesh = GwNavQueries.inside_position_from_outside_position(nav_world, pos, above, below, horizontal, distance_from_obstacle)

			if position_on_mesh then
				nav_group = navigation_group_manager:get_group_from_position(position_on_mesh)
			else
				nav_group = self._player_areas[index]
			end
		end

		local search_main_path_index = nil

		if nav_group then
			search_main_path_index = nav_group:get_main_path_index()
		end

		local path_pos, travel_dist, move_percent, sub_index, path_index = MainPathUtils.closest_pos_at_main_path(nil, pos, search_main_path_index)
		local data = main_path_player_info[unit]

		if not data then
			data = {
				astar_timer = 0,
				path_pos = Vector3Box(),
				unit = unit,
				total_path_dist = MainPathUtils.total_path_dist(),
				travel_dist = travel_dist
			}
			main_path_player_info[unit] = data
		end

		local far_away = self:main_path_player_far_away_check(data, travel_dist, path_pos, pos, t)

		if not far_away then
			data.path_index = path_index
			data.sub_index = sub_index
			data.move_percent = move_percent
			data.travel_dist = travel_dist

			data.path_pos:store(path_pos)

			if path_index then
				main_path_info.current_path_index = math.max(path_index, main_path_info.current_path_index)
			end

			if main_path_info.ahead_percent <= move_percent or main_path_info.ahead_unit == unit then
				local zone_index, _, zone = self.spawn_zone_baker:get_zone_segment_from_travel_dist(travel_dist)
				local mutators_need_conflict_update = nil

				if zone then
					mutators_need_conflict_update = self:check_update_mutators(zone.mutators)
				end

				local updated_settings = false

				if not script_data.override_conflict_settings and zone and self.current_conflict_settings ~= zone.conflict_setting.name and not self.level_settings.ignore_zone_conflict_settings then
					local new_conflict_setting = zone.conflict_setting.name
					updated_settings = self:check_updated_settings(new_conflict_setting)
				end

				if mutators_need_conflict_update and not updated_settings then
					self:refresh_conflict_director_patches()
				end

				if self._next_progression_percent <= move_percent then
					Managers.telemetry.events:level_progression(self._next_progression_percent)

					self._next_progression_percent = self._next_progression_percent + 0.1
				end

				main_path_info.ahead_percent = move_percent
				main_path_info.ahead_unit = unit
				main_path_info.ahead_travel_dist = travel_dist
				main_path_info.zone_index = zone_index
			end

			if move_percent <= main_path_info.behind_percent or main_path_info.behind_unit == unit then
				main_path_info.behind_percent = move_percent
				main_path_info.behind_unit = unit
			end
		end
	end

	local recalc = false

	for player_unit, data in pairs(main_path_player_info) do
		if not ALIVE[player_unit] then
			main_path_player_info[player_unit] = nil
			recalc = true
		end
	end

	if recalc then
		self:sort_player_info_by_travel_distance(main_path_info, main_path_player_info)
	end
end

ConflictDirector.get_main_path_player_data = function (self, unit)
	return self.main_path_player_info[unit]
end

ConflictDirector.get_cluster_and_loneliness = function (self, min_dist, position_list, unit_list)
	if self._cluster_and_loneliness[min_dist] then
		local stored = self._cluster_and_loneliness[min_dist]

		return stored[1], stored[2], stored[3], stored[4]
	end

	local cluster_utility, loneliness_index, loneliness_value = ConflictUtils.cluster_weight_and_loneliness(position_list, min_dist or 10)
	local loneliest_player_unit = unit_list[loneliness_index]
	local fill = FrameTable.alloc_table()
	fill[1] = cluster_utility
	fill[2] = position_list[loneliness_index]
	fill[3] = loneliness_value
	fill[4] = loneliest_player_unit
	self._cluster_and_loneliness[min_dist] = fill

	return cluster_utility, position_list[loneliness_index], loneliness_value, loneliest_player_unit
end

ConflictDirector.update_player_areas = function (self, sides)
	local player_areas = self._player_areas

	table.clear_array(player_areas, #player_areas)

	if self.navigation_group_manager.operational then
		for j = 1, #sides, 1 do
			local side = sides[j]
			local player_units = side.PLAYER_UNITS

			for i = 1, #player_units, 1 do
				local unit = player_units[i]
				local last_pos_on_mesh = ScriptUnit.extension(unit, "whereabouts_system"):last_position_on_navmesh()
				local area = last_pos_on_mesh and self.navigation_group_manager:get_group_from_position(last_pos_on_mesh)

				if area then
					player_areas[i] = area
				else
					player_areas[i] = false
				end
			end
		end
	end
end

ConflictDirector.add_horde = function (self, amount, event_breed_name)
	self._living_horde = self._living_horde + amount

	if event_breed_name then
		local event_breed = self._spawned_units_by_breed_during_event[event_breed_name]
		event_breed[breed_name] = event_breed[breed_name] + 1
	end
end

ConflictDirector.set_master_event_running = function (self, event_name)
	if self.running_master_event ~= event_name then
		self:reset_spawned_by_breed_during_event()
	end

	self.running_master_event = event_name
end

ConflictDirector.spawned_during_event = function (self)
	return self._num_spawned_during_event
end

ConflictDirector.horde_size = function (self)
	return self._living_horde, self._horde_ends_at
end

ConflictDirector.has_horde = function (self)
	if self.horde_spawner then
		return self.horde_spawner:running_horde()
	end
end

ConflictDirector.mini_patrol = function (self, t, terror_event_id, side_id, composition_type, group_template, optional_data)
	local strictly_not_close_to_players = true
	local limit_spawners = 1
	local silent = true
	self._last_mini_patrol_composition = composition_type

	self.horde_spawner:execute_event_horde(t, terror_event_id, side_id, composition_type, limit_spawners, silent, group_template, strictly_not_close_to_players, nil, nil, nil, optional_data)
end

ConflictDirector.mini_patrol_killed = function (self, id)
	print("Mini patrol killed!", id)
end

ConflictDirector.event_horde = function (self, t, terror_event_type, side_id, composition_type, limit_spawners, silent, group_template, sound_settings, optional_data)
	if not script_data.ai_horde_spawning_disabled then
		side_id = side_id or self.default_enemy_side_id
		local horde = self.horde_spawner:execute_event_horde(t, terror_event_type, side_id, composition_type, limit_spawners, silent, group_template, nil, sound_settings, nil, nil, optional_data)

		return horde
	end
end

ConflictDirector.check_updated_settings = function (self, new_conflict_setting)
	local current_conflict_settings = self.current_conflict_settings
	local script_data = script_data

	if script_data.override_conflict_settings and script_data.override_conflict_settings ~= current_conflict_settings then
		new_conflict_setting = script_data.override_conflict_settings
	end

	local should_update_settings = new_conflict_setting and current_conflict_settings ~= new_conflict_setting

	if should_update_settings then
		local level_settings = LevelHelper:current_level_settings()
		self.level_settings = level_settings
		local level_conflict_settings = level_settings.conflict_settings

		if level_conflict_settings and ConflictDirectors[level_conflict_settings].disabled then
			return
		end

		local conflict_settings = new_conflict_setting or self.current_conflict_settings
		conflict_settings = conflict_settings or level_conflict_settings or "default"

		self:set_updated_settings(conflict_settings)

		return true
	end

	return false
end

ConflictDirector.check_update_mutators = function (self, new_mutators)
	local old_mutators = self._current_zone_mutators
	local to_deactivate, to_activate = nil

	if not old_mutators then
		to_activate = new_mutators
	elseif new_mutators ~= old_mutators then
		to_deactivate = {}
		to_activate = {}

		for _, current_zone_mutator in ipairs(old_mutators) do
			if table.index_of(new_mutators, current_zone_mutator) == -1 then
				to_deactivate[#to_deactivate + 1] = current_zone_mutator
			end
		end

		for _, new_zone_mutator in ipairs(new_mutators) do
			if table.index_of(old_mutators, new_zone_mutator) == -1 then
				to_activate[#to_activate + 1] = new_zone_mutator
			end
		end
	end

	local update_conflict_settings = false

	if to_deactivate then
		for _, mutator_name in ipairs(to_deactivate) do
			Managers.state.game_mode._mutator_handler:deactivate_mutator(mutator_name)

			update_conflict_settings = update_conflict_settings or MutatorTemplates[mutator_name].update_conflict_settings ~= nil
		end
	end

	if to_activate then
		for _, mutator_name in ipairs(to_activate) do
			Managers.state.game_mode._mutator_handler:initialize_mutators({
				mutator_name
			})
			Managers.state.game_mode._mutator_handler:activate_mutator(mutator_name)

			update_conflict_settings = update_conflict_settings or MutatorTemplates[mutator_name].update_conflict_settings ~= nil
		end
	end

	self._current_zone_mutators = new_mutators

	return update_conflict_settings
end

ConflictDirector.set_updated_settings = function (self, conflict_settings_name)
	fassert(conflict_settings_name ~= "random", "Should not get a 'random' setting in ConflictDirector:set_updated_settings")

	local director = ConflictDirectors[conflict_settings_name]
	CurrentConflictSettings = director
	self.current_conflict_settings = conflict_settings_name

	self:refresh_conflict_director_patches()

	local S = director

	print("Switching ConflictSettings: to: " .. tostring(S.name))

	for key, settings in pairs(S) do
		if type(settings) == "table" then
			print("\t" .. tostring(key) .. "=" .. tostring(settings.name))
		else
			print("\t" .. tostring(key) .. "=" .. tostring(settings))
		end
	end

	print("---")
end

ConflictDirector.refresh_conflict_director_patches = function (self)
	local director = ConflictDirectors[self.current_conflict_settings]
	local difficulty, difficulty_tweak = Managers.state.difficulty:get_difficulty()
	local fallback_difficulty = Managers.state.difficulty.fallback_difficulty
	local composition_difficulty = DifficultyTweak.converters.composition(difficulty, difficulty_tweak)
	local pacing_difficulty = DifficultyTweak.converters.pacing(difficulty, difficulty_tweak)
	local intensity_difficulty = DifficultyTweak.converters.intensity(difficulty, difficulty_tweak)
	CurrentIntensitySettings = ConflictUtils.patch_settings_with_difficulty(table.clone(director.intensity), intensity_difficulty, fallback_difficulty)
	CurrentPacing = ConflictUtils.patch_settings_with_difficulty(table.clone(director.pacing), pacing_difficulty, fallback_difficulty)
	CurrentBossSettings = ConflictUtils.patch_settings_with_difficulty(table.clone(director.boss), difficulty, fallback_difficulty)
	CurrentSpecialsSettings = ConflictUtils.patch_settings_with_difficulty(table.clone(director.specials), composition_difficulty, fallback_difficulty)
	CurrentHordeSettings = ConflictUtils.patch_settings_with_difficulty(table.clone(director.horde), composition_difficulty, fallback_difficulty)
	CurrentRoamingSettings = table.clone(director.roaming)
	CurrentPackSpawningSettings = ConflictUtils.patch_settings_with_difficulty(table.clone(director.pack_spawning), composition_difficulty, fallback_difficulty)

	if Managers.state.game_mode then
		Managers.state.game_mode:conflict_director_updated_settings()
	end
end

ConflictDirector.update_horde_pacing = function (self, t, dt)
	local pacing = self.pacing

	if pacing:horde_population() < 1 or pacing.pacing_state == "pacing_frozen" then
		self._next_horde_time = nil

		return
	end

	if not self._next_horde_time then
		self._next_horde_time = t + ConflictUtils.random_interval(CurrentPacing.horde_frequency)
	end

	if self._next_horde_time < t and not self.delay_horde then
		local num_spawned = #self._spawned
		local horde_failed = RecycleSettings.push_horde_if_num_alive_grunts_above < num_spawned

		if horde_failed then
			local pacing_setting = CurrentPacing

			if RecycleSettings.push_horde_in_time then
				print("HORDE: Pushing horde in time; too many units out " .. num_spawned)

				self._next_horde_time = t + 5

				pacing:annotate_graph("Pushed horde", "red")
			else
				print("HORDE: Skipped horde; too many units out")

				self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.horde_frequency)

				pacing:annotate_graph("Failed horde", "red")
			end

			return
		end

		local wave, horde_type, no_fallback, optional_wave_composition = nil

		if script_data.ai_pacing_disabled then
			self._next_horde_time = math.huge
			self._multiple_horde_count = nil
			wave = "unknown"
			self._wave = wave
		else
			local set_standard_horde = nil
			local pacing_setting = CurrentPacing

			if pacing_setting.multiple_hordes then
				if self._multiple_horde_count then
					self._multiple_horde_count = self._multiple_horde_count - 1

					if self._multiple_horde_count <= 0 then
						print("HORDE: last wave, reset to standard horde delay")

						optional_wave_composition = self._current_wave_composition
						self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.max_delay_until_next_horde)
						self._multiple_horde_count = nil
						self._current_wave_composition = nil
						wave = "multi_last_wave"
					else
						local time_delay = ConflictUtils.random_interval(pacing_setting.multiple_horde_frequency)

						print("HORDE: next wave, multiple_horde_frequency -> Time delay", time_delay)

						self._next_horde_time = t + time_delay
						wave = "multi_consecutive_wave"
						optional_wave_composition = self._current_wave_composition
					end

					horde_type = "multi_followup"
					no_fallback = true
				else
					self._multiple_horde_count = pacing_setting.multiple_hordes - 1
					self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.multiple_horde_frequency)
					wave = "multi_first_wave"
				end
			else
				self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.horde_frequency)
				wave = "single_wave"
			end

			self._wave = wave
		end

		local horde_settings = CurrentHordeSettings

		if not horde_type then
			if horde_settings.mix_paced_hordes then
				if self.horde_spawner.num_paced_hordes % 2 == 0 then
					if math.random() < horde_settings.chance_of_vector then
						horde_type = "vector"
					else
						horde_type = "ambush"
					end
				elseif self.horde_spawner.last_paced_horde_type == "vector" then
					horde_type = "ambush"
				else
					horde_type = "vector"
				end
			elseif math.random() < horde_settings.chance_of_vector then
				horde_type = "vector"
			else
				horde_type = "ambush"
			end

			if horde_type == "vector" and math.random() <= horde_settings.chance_of_vector_blob then
				horde_type = "vector_blob"
			end

			local composition = (horde_type == "vector" and horde_settings.vector_composition) or (horde_type == "vector_blob" and horde_settings.vector_blob_composition) or horde_settings.ambush_composition

			if wave and type(composition) == "table" then
				optional_wave_composition = composition[math.random(#composition)]

				printf("HORDE: Chosing horde wave composition %s", optional_wave_composition)

				self._current_wave_composition = optional_wave_composition
			end
		elseif horde_type == "multi_followup" then
			horde_type = self.horde_spawner.last_paced_horde_type
		end

		print("Time for new HOOORDE!", wave)

		self._horde_ends_at = t + 120
		local extra_data = {
			multiple_horde_count = self._multiple_horde_count,
			horde_wave = wave,
			optional_wave_composition = optional_wave_composition
		}
		local side_id = self.default_enemy_side_id

		print("HORDE: Spawning hordes while " .. #self._spawned .. " other ai are spawned")
		self.horde_spawner:horde(horde_type, extra_data, side_id, no_fallback)
	end
end

ConflictDirector.horde_killed = function (self, wave)
	if not wave then
		return
	end

	local count = self._multiple_horde_count

	if not count then
		local pacing_setting = CurrentPacing
		local t = Managers.time:time("game")
		self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.horde_frequency)

		print("Horde killed: ", wave)
	else
		self._next_horde_time = 0

		print("Horde killed: ", wave)
	end
end

ConflictDirector.going_to_relax_state = function (self)
	self._multiple_horde_count = nil
end

ConflictDirector.get_horde_data = function (self)
	return self._next_horde_time, self.horde_spawner.hordes, self._multiple_horde_count
end

ConflictDirector.start_terror_event = function (self, event_name, optional_seed, origin_unit, origin_position)
	local seed = optional_seed or 0

	return TerrorEventMixer.add_to_start_event_list(event_name, seed, origin_unit, origin_position)
end

ConflictDirector.terror_event_finished = function (self, event_name)
	return table.contains(TerrorEventMixer.finished_events, event_name)
end

ConflictDirector.start_terror_event_from_template = function (self, event_template_name, spawner_id, optional_seed)
	fassert(spawner_id ~= nil, "Starting a terror event from template should not be done if 'spawner_id' is nil!")

	local level_transition_handler = Managers.level_transition_handler
	local level_key = level_transition_handler:get_current_level_keys()
	local new_terror_event_name = string.format("%s_%s", event_template_name, spawner_id)
	local wanted_terror_event = TerrorEventBlueprints[level_key][new_terror_event_name]

	if wanted_terror_event then
		self:start_terror_event(new_terror_event_name, optional_seed)

		return
	end

	local terror_event_template = TerrorEventBlueprints[level_key][event_template_name]

	fassert(terror_event_template ~= nil, string.format("Tried to get non-existing terror event '%s'", event_template_name))

	local new_terror_event = table.clone(terror_event_template)

	for _, data in ipairs(new_terror_event) do
		if data.spawner_id then
			data.spawner_id = spawner_id
		end
	end

	TerrorEventBlueprints[level_key][new_terror_event_name] = new_terror_event

	self:start_terror_event(new_terror_event_name, optional_seed)
end

ConflictDirector.handle_speed_runners = function (self, t)
	local threat_value = self:get_threat_value()
	local threat_value_exceeded = self.delay_specials_threat_value < threat_value
	local data = self.speed_running_intervention_data
	local settings = CurrentSpecialsSettings.speed_running_intervention or SpecialsSettings.default.speed_running_intervention
	local pacing = self.pacing

	if not threat_value_exceeded or self.specials_pacing:is_disabled() or pacing:get_state() == "pacing_frozen" then
		data.started_speed_intervention_check_t = nil
		data.player_travel_distances = nil
		data.total_travel_distances = nil
		data.has_traveled_far = false

		return
	end

	if not data.started_speed_intervention_check_t then
		data.started_speed_intervention_check_t = t
	end

	local time_spent_in_high_threat = t - data.started_speed_intervention_check_t

	if time_spent_in_high_threat < settings.required_time_spent_in_high_threat then
		return
	end

	local player_travel_distances = data.player_travel_distances or {}
	local total_travel_distances = data.total_travel_distances or {}
	data.player_travel_distances = player_travel_distances
	data.total_travel_distances = total_travel_distances
	local has_traveled_far = data.has_traveled_far
	local target_speed_runner = data.target_speed_runner

	if data.next_travel_dist_check_t < t then
		data.has_traveled_far = false
		local main_path_info = self.main_path_info
		local ahead_unit = main_path_info.ahead_unit
		local player_info = self.main_path_player_info[ahead_unit]
		local previous_travel_dist = player_travel_distances[ahead_unit]

		if player_info and previous_travel_dist then
			local current_travel_dist = player_info.travel_dist
			local diff = current_travel_dist - previous_travel_dist

			if settings.travel_distance_threshold <= diff then
				data.has_traveled_far = true
				data.target_speed_runner = ahead_unit
				local stored_travel_distance = total_travel_distances[ahead_unit] or 0
				total_travel_distances[ahead_unit] = stored_travel_distance + diff
			end
		end

		for unit, player_info in pairs(self.main_path_player_info) do
			local travel_dist = player_info.travel_dist
			player_travel_distances[unit] = travel_dist
		end

		data.next_travel_dist_check_t = t + settings.travel_distance_check_frequency
	end

	if not has_traveled_far then
		return
	end

	local has_high_intensity = CurrentPacing.peak_intensity_threshold < pacing.total_intensity

	if has_high_intensity then
		if pacing:get_state() == "pacing_peak_fade" then
			local state_start_time = pacing._state_start_time
			local time_in_state = t - state_start_time

			if time_in_state < settings.time_required_in_pacing_peak_to_ignore_high_intensity then
				return
			end
		else
			return
		end
	end

	local active_respawn_units = Managers.state.game_mode:game_mode():get_active_respawn_units()

	if #active_respawn_units > 0 then
		local main_path_info = self.main_path_info
		local ahead_unit = main_path_info.ahead_unit
		local player_info = self.main_path_player_info[ahead_unit]
		local current_travel_dist = player_info.travel_dist

		for i = 1, #active_respawn_units, 1 do
			local respawn_unit = active_respawn_units[i]
			local respawn_unit_position = Unit.world_position(respawn_unit, 0)
			local _, respawn_unit_travel_distance = MainPathUtils.closest_pos_at_main_path(self.main_path_info.main_paths, respawn_unit_position)

			if current_travel_dist < respawn_unit_travel_distance then
				return
			end
		end
	end

	local chance_of_vector_horde = settings.chance_of_vector_horde
	local will_spawn_vector_horde = math.random() <= chance_of_vector_horde

	if will_spawn_vector_horde then
		local breed_name = settings.vector_horde_breeds[math.random(1, #settings.vector_horde_breeds)]
		local num_enemies_range = settings.vector_horde_config[breed_name]
		local num_enemies = math.random(num_enemies_range[1], num_enemies_range[2])
		local spawn_list = {}

		for i = 1, num_enemies, 1 do
			spawn_list[#spawn_list + 1] = breed_name
		end

		local conflict_director = Managers.state.conflict
		local side_id = self.default_enemy_side_id

		conflict_director.horde_spawner:execute_custom_horde(spawn_list, true, side_id)

		local delay_times = settings.delay_between_speed_running_intervention_horde_spawn
		self._next_speed_running_intervention_time = t + math.random(delay_times[1], delay_times[2])
	elseif Unit.alive(target_speed_runner) then
		local success, message = self.specials_pacing:request_speed_running_intervention(t, target_speed_runner, self.main_path_player_info)

		if success then
			local delay_times = settings.delay_between_speed_running_intervention_special_spawn
			local travel_distance_scaling_index = 1
			local target_travel_distance = total_travel_distances[target_speed_runner] or 0
			local total_travel_distance_scaling_thresholds = settings.total_travel_distance_scaling_thresholds

			for i = 1, #total_travel_distance_scaling_thresholds, 1 do
				local travel_distance_threshold = total_travel_distance_scaling_thresholds[i]
				travel_distance_scaling_index = i

				if target_travel_distance < travel_distance_threshold then
					break
				end
			end

			local scaled_delay_times = delay_times[travel_distance_scaling_index]
			local delay_time = math.random(scaled_delay_times[1], scaled_delay_times[2])
			self._next_speed_running_intervention_time = t + delay_time
		else
			self._next_speed_running_intervention_time = t + 5
		end
	end
end

ConflictDirector.handle_alone_player = function (self, t, enemy_side)
	local player_and_bot_units = enemy_side.ENEMY_PLAYER_AND_BOT_UNITS
	local data = self.rushing_intervention_data
	local disable_rush_intervention = Managers.state.game_mode:setting("disable_rush_intervention")

	if disable_rush_intervention and disable_rush_intervention.all then
		data.disabled = "No rush intervention, since game mode disabled it"

		return
	end

	if #player_and_bot_units == 1 then
		data.disabled = "No rush intervention, since only one player alive"

		return
	else
		data.disabled = nil
	end

	local main_path_info = self.main_path_info
	local ahead_unit = main_path_info.ahead_unit

	if ahead_unit then
		local rush_intervention = CurrentSpecialsSettings.rush_intervention
		local _, _, loneliness_value, loneliest_player_unit = self:get_cluster_and_loneliness(10, enemy_side.ENEMY_PLAYER_AND_BOT_POSITIONS, enemy_side.ENEMY_PLAYER_AND_BOT_UNITS)
		data.loneliness_value = loneliness_value

		if ahead_unit == loneliest_player_unit or #player_and_bot_units == 2 then
			local player_info = self.main_path_player_info[ahead_unit]
			local dist = player_info.travel_dist - self._rushing_intervention_travel_dist
			data.player_travel_dist = player_info.travel_dist
			data.ahead_dist = dist
			data.ahead_unit = ahead_unit

			if dist <= 0 then
				return
			end

			if rush_intervention.loneliness_value_for_special < loneliness_value then
				print("going to make a rush intervention, since loneliness_value=", loneliness_value, " and dist=", dist)

				local success, message = self.specials_pacing:request_rushing_intervention(t, ahead_unit, main_path_info, self.main_path_player_info, disable_rush_intervention)

				if success then
					self.pacing:annotate_graph("Rush intervention - special", "red")

					data.message = "spawning: " .. message
				else
					data.message = message
				end

				local add_time = rush_intervention.delay_between_interventions

				if (not disable_rush_intervention or not disable_rush_intervention.horde) and rush_intervention.loneliness_value_for_ambush_horde < loneliness_value and Math.random() < rush_intervention.chance_of_ambush_horde then
					print("rush intervention - ambush horde!")
					self.pacing:annotate_graph("Rush intervention - horde", "red")

					local horde_settings = CurrentHordeSettings
					local composition = horde_settings.ambush_composition
					local extra_data = nil

					if type(composition) == "table" then
						local optional_wave_composition = composition[math.random(#composition)]
						extra_data = {
							optional_wave_composition = optional_wave_composition
						}
					end

					self.horde_spawner:execute_ambush_horde(extra_data, self.default_enemy_side_id, false, position_lookup[ahead_unit])

					add_time = add_time + 10
					success = true
				end

				if success then
					self._next_rushing_intervention_time = t + add_time
					self._rushing_intervention_travel_dist = player_info.travel_dist + rush_intervention.distance_until_next_intervention
				end
			end
		end
	end
end

ConflictDirector.respawn_level = function (self, seed)
	self:destroy_all_units()

	if seed then
		local ai_interest_point_system = Managers.state.entity:system("ai_interest_point_system")

		ai_interest_point_system:set_seed(seed)
		self.enemy_recycler:set_seed(seed)
		self.level_analysis:set_random_seed(nil, seed)
		self.spawn_zone_baker:set_seed(seed)
		TerrorEventUtils.set_seed(seed)
	else
		self.level_analysis:set_random_seed(nil, self.level_analysis.seed)
		self.spawn_zone_baker:set_seed(self.spawn_zone_baker.seed)
		TerrorEventUtils.set_seed(self.level_analysis.seed)
	end

	local pack_members = nil
	self._spawn_pos_list, self._pack_sizes, self._pack_rotations, pack_members, self._zone_data_list = self:generate_spawns()

	self.enemy_recycler:setup(self._spawn_pos_list, self._pack_sizes, self._pack_rotations, pack_members, self._zone_data_list)
	self.level_analysis:remove_crossroads_extra_path_branches()
	self.level_analysis:generate_boss_paths()
	self.level_analysis:reset_debug()

	self.main_path_info.main_paths = self.level_analysis:get_main_paths()

	self.spawn_zone_baker:draw_pack_density_graph()
end

ConflictDirector.create_debug_list = function (self)
	self._debug_list = {
		"none",
		self.pacing,
		self.spawn_zone_baker
	}
end

ConflictDirector.update_mini_patrol = function (self, t, dt)
	local pacing = self.pacing
	local settings = CurrentPacing.mini_patrol
	local timer = self._next_mini_patrol_timer

	if self._mini_patrol_state == "spawning" then
		if timer < t then
			self._mini_patrol_state = "running"
			self._next_mini_patrol_timer = t + settings.override_timer
		end
	elseif self._mini_patrol_state == "running" then
		local num_spawned_by_breed = self._num_spawned_by_breed

		if (num_spawned_by_breed.skaven_clan_rat < 3 and num_spawned_by_breed.skaven_storm_vermin <= 1) or timer < t then
			self._mini_patrol_state = "waiting"
			self._next_mini_patrol_timer = t + ConflictUtils.random_interval(settings.frequency)
		end
	elseif timer < t then
		local mini_patrol_ok = pacing.total_intensity <= settings.only_spawn_below_intensity and settings.only_spawn_above_intensity <= pacing.total_intensity and RecycleSettings.max_grunts - #self._spawned >= 0 and not self.delay_mini_patrol

		if mini_patrol_ok then
			self._next_mini_patrol_timer = t + 5
			local composition = CurrentHordeSettings.mini_patrol_composition

			print("spawning mini patrol")

			local group_template = {
				size = 0,
				template = "mini_patrol",
				id = Managers.state.entity:system("ai_group_system"):generate_group_id()
			}
			local side_id = self.default_enemy_side_id

			self:mini_patrol(t, nil, side_id, composition, group_template)

			self._mini_patrol_state = "spawning"
		else
			self._next_mini_patrol_timer = t + 2
		end
	end

	if script_data.debug_mini_patrols then
		Debug.text("Mini patrol: active=%s, timer=%.1f last=[%s]", tostring(self._mini_patrol_state), self._next_mini_patrol_timer - t, tostring(self._last_mini_patrol_composition))
	end
end

ConflictDirector.reset_data = function (self)
	self._cluster_and_loneliness = FrameTable.alloc_table()
end

ConflictDirector.update = function (self, dt, t)
	self._time = t

	if script_data.testify then
		Testify:poll_requests_through_handler(conflict_director_testify, self)
	end

	local all_player_positions = {}
	local sides = self.sides_to_update_recycler

	for i = 1, #sides, 1 do
		table.append(all_player_positions, sides[i].PLAYER_AND_BOT_POSITIONS)
	end

	if self.level_analysis then
		self.level_analysis:update(t, dt)

		if self._hero_side then
			self:update_main_path_player_info(self._hero_side, t)
		end
	end

	if self.disabled then
		return
	end

	local script_data = script_data

	self:check_updated_settings()

	local conflict_settings = CurrentConflictSettings

	if conflict_settings.disabled then
		return
	end

	if self._next_threat_update < t then
		self:calculate_threat_value()
		self:check_pacing_event_delay()

		self._next_threat_update = t + 1
	end

	local pacing = self.pacing

	if not script_data.ai_pacing_disabled and not conflict_settings.pacing.disabled then
		if self._next_pacing_update < t then
			local side = self._hero_side

			if side then
				local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

				pacing:update(t, dt, player_and_bot_units)

				self._next_pacing_update = t + 1
				local pacing_state = pacing:get_state()

				if pacing_state == "pacing_relax" then
					local rushing = self:are_players_rushing(t)

					if rushing then
						if CurrentPacing.leave_relax_if_rushing then
							print("players are progressing too fast, leave relax")
							pacing:advance_pacing(t, "players are rushing")
						end

						if CurrentPacing.horde_in_relax_if_rushing then
							print("players are progressing too fast, punish with a horde")

							self._next_horde_time = t
						end
					end
				end
			end
		end

		if not script_data.ai_rush_intervention_disabled and self._next_rushing_intervention_time < t then
			self._next_rushing_intervention_time = t + 1

			self:handle_alone_player(t, self._enemy_side)
		end

		local settings = CurrentSpecialsSettings.speed_running_intervention or SpecialsSettings.default.speed_running_intervention

		if not settings.disabled and not script_data.ai_speed_running_intervention_disabled and self._next_speed_running_intervention_time < t then
			self._next_speed_running_intervention_time = t + 2.5

			self:handle_speed_runners(t)
		end
	end

	if self.in_safe_zone then
		local game_mode_manager = Managers.state.game_mode
		local round_started = game_mode_manager:is_round_started()

		if round_started then
			print("Players are leaving the safe zone")

			self.in_safe_zone = false

			Managers.state.game_mode:players_left_safe_zone()

			if self.specials_pacing then
				self.specials_pacing:start(t)

				if not script_data.ai_pacing_disabled then
					local pacing_setting = CurrentPacing
					self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.horde_startup_time)
				end
			end
		end
	else
		if not conflict_settings.specials.disabled and self.specials_pacing and not script_data.ai_specials_spawning_disabled and not Managers.state.game_mode:setting("ai_specials_spawning_disabled") then
			local specials_population = pacing:specials_population()

			self.specials_pacing:update(t, self._alive_specials, specials_population, all_player_positions)
		end

		if not script_data.ai_horde_spawning_disabled and not conflict_settings.horde.disabled and not Managers.state.game_mode:setting("horde_spawning_disabled") then
			self:update_horde_pacing(t, dt)
		else
			local pacing_setting = CurrentPacing
			self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.horde_frequency)
		end

		if not script_data.ai_mini_patrol_disabled and self.level_settings.use_mini_patrols then
			local pacing_state = pacing.pacing_state

			if pacing_state == "pacing_build_up" then
				self:update_mini_patrol(t, dt)
			end
		end

		if self.horde_spawner then
			self.horde_spawner:update(t, dt)
		end
	end

	if self.director_is_ai_ready then
		local ai_system = Managers.state.entity:system("ai_system")

		TerrorEventMixer.update(t, dt, ai_system.ai_debugger and ai_system.ai_debugger.screen_gui)
	elseif not FORM_GROUPS_IN_ONE_FRAME and self.navigation_group_manager.form_groups_running then
		local done = self.navigation_group_manager:form_groups_update()

		if done then
			local level_seed = Managers.mechanism:get_level_seed()

			self:ai_nav_groups_ready(level_seed)
		end
	end

	local recycler_positions = all_player_positions

	if self.enemy_recycler and not script_data.ai_roaming_spawning_disabled and not conflict_settings.roaming.disabled then
		local threat_population = pacing:threat_population()
		local available_to_spawn = RecycleSettings.max_grunts - #self._spawned

		if available_to_spawn <= 0 then
			threat_population = 0
		end

		local use_player_areas = self.navigation_group_manager.operational

		if script_data.recycler_in_freeflight then
			if script_data.recycler_in_cutscene then
				local player_manager = Managers.player
				local player = player_manager:local_player(1)
				local freeflight_pos = Managers.state.camera:camera_position(player.viewport_name)

				if freeflight_pos then
					recycler_positions = (self._recycler_extra_pos and {
						freeflight_pos,
						self._recycler_extra_pos:unbox()
					}) or {
						freeflight_pos
					}
					use_player_areas = false
				end
			else
				local freeflight_pos = self:get_free_flight_pos()

				if freeflight_pos then
					recycler_positions = (self._recycler_extra_pos and {
						freeflight_pos,
						self._recycler_extra_pos:unbox()
					}) or {
						freeflight_pos
					}
					use_player_areas = false
				end
			end

			if self._recycler_extra_pos and self._recycler_extra_end_time < t then
				self._recycler_extra_pos = nil
			end
		end

		self:update_player_areas(sides)
		self.enemy_recycler:update(t, dt, recycler_positions, threat_population, self._player_areas, use_player_areas)
	end

	self.enemy_recycler:update_main_path_events(t)
	self:update_spawn_queue(t)

	if self.enemy_recycler and not script_data.ai_far_off_despawn_disabled then
		self.enemy_recycler:far_off_despawn(t, dt, recycler_positions, self._spawned)
	end

	if self._spline_groups_to_spawn then
		for spline_name, group_data in pairs(self._spline_groups_to_spawn) do
			local ai_group_system = Managers.state.entity:system("ai_group_system")
			local spline_ready = ai_group_system:spline_ready(spline_name)

			if spline_ready then
				if spline_ready == "failed" or spline_ready.failed then
					print("spline is in fail state, cancelling the spline spawn.", spline_name)

					self._spline_groups_to_spawn[spline_name] = nil
				else
					self:_spawn_spline_group(group_data, spline_ready)

					self._spline_groups_to_spawn[spline_name] = nil
				end
			end
		end
	end

	local peak_delayer = self._peak_delayer

	if peak_delayer then
		local ahead_player_travel_dist = nil
		local main_path_info = self.main_path_info

		if not main_path_info.ahead_unit then
			return
		end

		local ahead_player_info = self.main_path_player_info[main_path_info.ahead_unit]
		ahead_player_travel_dist = ahead_player_info.travel_dist

		peak_delayer:update(ahead_player_travel_dist, t)
	end
end

ConflictDirector.pre_update = function (self)
	if self.breed_freezer and not script_data.disable_breed_freeze_opt then
		self.breed_freezer:commit_freezes()
	end
end

ConflictDirector.post_update = function (self)
	if self.breed_freezer and not script_data.disable_breed_freeze_opt then
		self.breed_freezer:commit_freezes()
	end
end

ConflictDirector.set_recycler_extra_pos = function (self, boxed_pos, ends_at)
	self._recycler_extra_pos = boxed_pos
	self._recycler_extra_end_time = ends_at
end

ConflictDirector.get_free_flight_pos = function (self)
	local position = nil
	local freeflight_manager = Managers.free_flight
	local data = freeflight_manager.data.global

	if data.viewport_world_name then
		local world = Managers.world:world(data.viewport_world_name)
		local viewport = ScriptWorld.global_free_flight_viewport(world)
		local camera = data.frustum_freeze_camera or ScriptViewport.camera(viewport)
		position = ScriptCamera.position(camera)
	end

	return position
end

ConflictDirector.spawn_queued_unit = function (self, breed, boxed_spawn_pos, boxed_spawn_rot, spawn_category, spawn_animation, spawn_type, optional_data, group_data, unit_data)
	optional_data = optional_data or {}
	optional_data.side_id = optional_data.side_id or self.default_enemy_side_id
	local enemy_package_loader = self.enemy_package_loader

	if not enemy_package_loader.breed_processed[breed.name] then
		local ignore_breed_limits = optional_data and optional_data.ignore_breed_limits
		local success, replacement_breed_name = enemy_package_loader:request_breed(breed.name, ignore_breed_limits, spawn_category)

		if not success then
			printf("[ConflictDirector] Replacing wanted breed (%s) with %s", breed.name, replacement_breed_name or "nil")

			breed = Breeds[replacement_breed_name]
		end
	end

	local spawn_queue = self.spawn_queue
	local spawn_index = self.first_spawn_index + self.spawn_queue_size
	self.spawn_queue_size = self.spawn_queue_size + 1
	self.spawn_queue_id = self.spawn_queue_id + 1
	local data = spawn_queue[spawn_index]

	fassert(breed, "no supplied breed")

	if data then
		data[1] = breed
		data[2] = boxed_spawn_pos
		data[3] = boxed_spawn_rot
		data[4] = spawn_category
		data[5] = spawn_animation
		data[6] = spawn_type
		data[7] = optional_data
		data[8] = group_data
		data[9] = unit_data
		data[10] = self.spawn_queue_id
	else
		data = {
			breed,
			boxed_spawn_pos,
			boxed_spawn_rot,
			spawn_category,
			spawn_animation,
			spawn_type,
			optional_data,
			group_data,
			unit_data,
			self.spawn_queue_id
		}
		spawn_queue[spawn_index] = data
	end

	local breed_name = breed.name
	self.num_queued_spawn_by_breed[breed_name] = self.num_queued_spawn_by_breed[breed_name] + 1

	return self.spawn_queue_id
end

ConflictDirector.remove_queued_unit = function (self, queue_id)
	local spawn_queue = self.spawn_queue
	local first_spawn_index = self.first_spawn_index
	local spawn_queue_size = self.spawn_queue_size
	local first = self.first_spawn_index
	local last = (first + spawn_queue_size) - 1

	for i = first, last, 1 do
		local d = spawn_queue[i]

		fassert(d, "Missing spawn_queue item")

		if d[10] == queue_id then
			local breed = d[1]
			self.num_queued_spawn_by_breed[breed.name] = self.num_queued_spawn_by_breed[breed.name] - 1
			local temp = spawn_queue[i]
			spawn_queue[i] = spawn_queue[last]
			spawn_queue[last] = temp
			self.spawn_queue_size = self.spawn_queue_size - 1

			if self.spawn_queue_size == 0 then
				self.first_spawn_index = 1
			end

			return d
		end
	end

	ferror("Spawn_queue id not found %s", tostring(queue_id))
end

ConflictDirector.update_spawn_queue = function (self, t)
	local enemy_package_loader = self.enemy_package_loader

	enemy_package_loader:update_breeds_loading_status()

	if self.spawn_queue_size == 0 then
		return
	end

	local first_spawn_index = self.first_spawn_index
	local spawn_queue = self.spawn_queue
	local d = spawn_queue[first_spawn_index]
	local breed = d[1]
	local breed_name = breed.name

	while not enemy_package_loader.breed_loaded_on_all_peers[breed_name] do
		first_spawn_index = first_spawn_index + 1

		if first_spawn_index == self.first_spawn_index + self.spawn_queue_size then
			return
		end

		d = spawn_queue[first_spawn_index]
		breed = d[1]
		breed_name = breed.name
	end

	local unit = not script_data.disable_breed_freeze_opt and self.breed_freezer:try_unfreeze_breed(breed, d)

	if unit then
		local breed = BLACKBOARDS[unit].breed
		local go_id = Managers.state.unit_storage:go_id(unit)

		self:_post_spawn_unit(unit, go_id, breed, d[2]:unbox(), d[4], d[5], d[7], d[6])
	else
		unit = self:_spawn_unit(d[1], d[2]:unbox(), d[3]:unbox(), d[4], d[5], d[6], d[7], d[8], d[10])
	end

	self.num_queued_spawn_by_breed[breed_name] = self.num_queued_spawn_by_breed[breed_name] - 1
	local unit_data = d[9]

	if unit_data then
		unit_data[1] = unit
	end

	if first_spawn_index ~= self.first_spawn_index then
		local swapee = self.spawn_queue[first_spawn_index]
		self.spawn_queue[first_spawn_index] = self.spawn_queue[self.first_spawn_index]
		self.spawn_queue[self.first_spawn_index] = swapee
	end

	self.spawn_queue_size = self.spawn_queue_size - 1
	self.first_spawn_index = self.first_spawn_index + 1

	if self.spawn_queue_size == 0 then
		self.first_spawn_index = 1
	end
end

local dialogue_system_init_data = {
	faction = "enemy"
}

ConflictDirector._spawn_unit = function (self, breed, spawn_pos, spawn_rot, spawn_category, spawn_animation, spawn_type, optional_data, group_data, spawn_index)
	local breed_unit_field = (script_data.use_optimized_breed_units and breed.opt_base_unit) or breed.base_unit
	local base_unit_name = (type(breed_unit_field) == "string" and breed_unit_field) or breed_unit_field[Math.random(#breed_unit_field)]
	local unit_template = breed.unit_template
	local entity_manager = Managers.state.entity
	local nav_world = entity_manager:system("ai_system"):nav_world()
	optional_data.spawn_queue_index = spawn_index
	local inventory_init_data = nil

	if breed.has_inventory then
		local breed_inventory_field = (script_data.use_optimized_breed_units and breed.opt_default_inventory_template) or breed.default_inventory_template
		local breed_inventory_template = (type(breed_inventory_field) == "string" and breed_inventory_field) or breed_inventory_field[Math.random(#breed_inventory_field)]
		inventory_init_data = {
			optional_spawn_data = optional_data,
			inventory_template = breed_inventory_template,
			inventory_configuration_name = optional_data.inventory_configuration_name
		}
	end

	local aim_init_data = nil

	if breed.aim_template ~= nil then
		aim_init_data = {
			husk = false,
			template = breed.aim_template
		}
	end

	local animation_movement_init_data = nil

	if breed.animation_movement_template ~= nil then
		animation_movement_init_data = {
			husk = false,
			template = breed.animation_movement_template
		}
	end

	dialogue_system_init_data.breed_name = breed.name
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local health = breed.max_health and breed.max_health[difficulty_rank]

	if health then
		local max_health_modifier = optional_data.max_health_modifier or 1
		health = health * max_health_modifier
	end

	local side_id = optional_data.side_id
	local extension_init_data = {
		health_system = {
			health = health,
			optional_data = optional_data
		},
		ai_system = {
			size_variation = 1,
			size_variation_normalized = 1,
			breed = breed,
			nav_world = nav_world,
			spawn_type = spawn_type,
			spawn_category = spawn_category,
			optional_spawn_data = optional_data,
			side_id = side_id
		},
		locomotion_system = {
			nav_world = nav_world,
			breed = breed
		},
		ai_navigation_system = {
			nav_world = nav_world
		},
		death_system = {
			is_husk = false,
			death_reaction_template = breed.death_reaction,
			disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
		},
		hit_reaction_system = {
			is_husk = false,
			hit_reaction_template = breed.hit_reaction,
			hit_effect_template = breed.hit_effect_template
		},
		ai_inventory_system = inventory_init_data,
		ai_group_system = group_data,
		dialogue_system = dialogue_system_init_data,
		aim_system = aim_init_data,
		proximity_system = {
			breed = breed
		},
		buff_system = {
			breed = breed
		},
		animation_movement_system = animation_movement_init_data
	}

	if optional_data.prepare_func then
		optional_data.prepare_func(breed, extension_init_data, optional_data)
	end

	local spawn_pose = Matrix4x4.from_quaternion_position(spawn_rot, spawn_pos)
	local size_variation_range = optional_data.size_variation_range or breed.size_variation_range

	if size_variation_range then
		local size_normalized = Math.random()
		local size = math.lerp(size_variation_range[1], size_variation_range[2], size_normalized)
		extension_init_data.ai_system.size_variation = size
		extension_init_data.ai_system.size_variation_normalized = size_normalized

		Matrix4x4.set_scale(spawn_pose, Vector3(size, size, size))
	end

	local ai_unit, go_id = Managers.state.unit_spawner:spawn_network_unit(base_unit_name, unit_template, extension_init_data, spawn_pose)

	self:_post_spawn_unit(ai_unit, go_id, breed, spawn_pos, spawn_category, spawn_animation, optional_data, spawn_type)

	return ai_unit
end

ConflictDirector._post_spawn_unit = function (self, ai_unit, go_id, breed, spawn_pos, spawn_category, spawn_animation, optional_data, spawn_type)
	optional_data = optional_data or {}
	local blackboard = BLACKBOARDS[ai_unit]
	blackboard.enemy_id = optional_data.spawn_queue_index

	if optional_data.enhancements then
		TerrorEventUtils.apply_breed_enhancements(ai_unit, breed, optional_data)
	end

	local breed_name = breed.name

	Unit.set_data(ai_unit, "spawn_type", spawn_type)

	local level_settings = self.level_settings
	local climate_type = level_settings.climate_type or "default"

	Unit.set_flow_variable(ai_unit, "climate_type", climate_type)
	Unit.flow_event(ai_unit, "climate_type_set")

	if optional_data.enhancements then
		Managers.telemetry.events:ai_spawned(blackboard.enemy_id, breed.name, spawn_pos, optional_data.enhancements)
	end

	blackboard.spawn_animation = spawn_animation
	blackboard.optional_spawn_data = optional_data
	self._spawned[#self._spawned + 1] = ai_unit
	self._spawned_lookup[ai_unit] = #self._spawned
	self._num_spawned_by_breed[breed_name] = self._num_spawned_by_breed[breed_name] + 1
	self._spawned_units_by_breed[breed_name][ai_unit] = ai_unit

	if self.running_master_event and spawn_category ~= "enemy_recycler" then
		blackboard.event_spawned = true
		self._num_spawned_by_breed_during_event[breed_name] = self._num_spawned_by_breed_during_event[breed_name] + 1

		Managers.state.event:trigger("ai_unit_spawned", ai_unit, breed_name, blackboard.confirmed_player_sighting, true)

		self._num_spawned_during_event = self._num_spawned_during_event + 1
	else
		Managers.state.event:trigger("ai_unit_spawned", ai_unit, breed_name, blackboard.confirmed_player_sighting, false)
	end

	if breed.spawn_stinger then
		local wwise_world = Managers.world:wwise_world(self._world)
		local wwise_playing_id, wwise_source_id = WwiseWorld.trigger_event(wwise_world, breed.spawn_stinger)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_server_audio_event", NetworkLookup.sound_events[breed.spawn_stinger])
	end

	local locomotion_extension = blackboard.locomotion_extension

	if locomotion_extension then
		locomotion_extension:ready(go_id, blackboard)
	end

	if optional_data.spawned_func then
		optional_data.spawned_func(ai_unit, breed, optional_data)
	end
end

ConflictDirector.set_disabled = function (self, state)
	self.disabled = state
end

ConflictDirector.last_spawned_unit = function (self)
	return self._spawned[#self._spawned]
end

ConflictDirector.spawned_units = function (self)
	return self._spawned
end

ConflictDirector.count_units_by_breed = function (self, breed_name)
	return self._num_spawned_by_breed[breed_name]
end

ConflictDirector.spawned_units_by_breed = function (self, breed_name)
	return self._spawned_units_by_breed[breed_name]
end

ConflictDirector.count_units_by_breed_during_event = function (self, breed_name)
	local amount = self._num_spawned_by_breed_during_event[breed_name] or 0

	return amount
end

ConflictDirector.add_unit_to_bosses = function (self, unit)
	self._alive_bosses[#self._alive_bosses + 1] = unit
end

ConflictDirector.remove_unit_from_bosses = function (self, unit)
	remove_element_from_array(self._alive_bosses, unit)
end

ConflictDirector.add_unit_to_standards = function (self, unit)
	self._alive_standards[#self._alive_standards + 1] = unit
end

ConflictDirector.remove_unit_from_standards = function (self, unit)
	remove_element_from_array(self._alive_standards, unit)
end

ConflictDirector._remove_unit_from_spawned = function (self, unit, blackboard, do_not_trigger_despawn_event)
	local spawned_lookup = self._spawned_lookup
	local index = spawned_lookup[unit]

	if not index then
		printf("ERROR: REMOVE UNIT FROM SPAWNED:(traceback) %q", tostring(unit))

		return
	end

	local breed = blackboard.breed
	local spawn_type = blackboard.spawn_type

	if spawn_type == "horde" or spawn_type == "horde_hidden" then
		self:add_horde(-1)
	end

	if spawn_type == "roam" then
		local die_data = BREED_DIE_LOOKUP[unit]

		if die_data then
			local cleanup_dead_breed = die_data[1]

			cleanup_dead_breed(unit, die_data[2])

			BREED_DIE_LOOKUP[unit] = nil
		end
	end

	local spawned = self._spawned
	local index_last = #spawned
	spawned_lookup[unit] = nil

	if index == index_last then
		spawned[index_last] = nil
	else
		local swap_unit = spawned[index_last]
		spawned[index] = swap_unit
		spawned[index_last] = nil
		spawned_lookup[swap_unit] = index
	end

	if blackboard.optional_spawn_data and blackboard.optional_spawn_data.despawned_func then
		blackboard.optional_spawn_data.despawned_func(unit, breed, blackboard.optional_spawn_data)
	end

	local breed_name = breed.name
	self._num_spawned_by_breed[breed_name] = self._num_spawned_by_breed[breed_name] - 1
	self._spawned_units_by_breed[breed_name][unit] = nil

	if blackboard.event_spawned then
		self._num_spawned_by_breed_during_event[breed_name] = self._num_spawned_by_breed_during_event[breed_name] - 1
		self._num_spawned_during_event = self._num_spawned_during_event - 1
	end

	if breed.special then
		remove_element_from_array(self._alive_specials, unit)
	end

	if breed.boss then
		remove_element_from_array(self._alive_bosses, unit)
	end

	if not do_not_trigger_despawn_event then
		Managers.state.event:trigger("ai_unit_despawned", unit, breed_name, blackboard.confirmed_player_sighting, blackboard.event_spawned)
	end
end

local threat_values = {}

for breed_name, data in pairs(Breeds) do
	threat_values[breed_name] = override_threat_value or data.threat_value or 0

	if not data.threat_value then
		ferror("missing threat in breed %s", breed_name)
	end
end

ConflictDirector.get_threat_value = function (self)
	return self.threat_value, self.num_aggroed
end

ConflictDirector.get_num_aggroed_enemies = function (self)
	return self.num_aggroed
end

ConflictDirector.set_threat_value = function (self, breed_name, value)
	threat_values[breed_name] = value
end

ConflictDirector.calculate_threat_value = function (self)
	local threat_value = 0
	local i = 0
	local activated_per_breed = Managers.state.performance:activated_per_breed()

	for breed_name, amount in pairs(activated_per_breed) do
		threat_value = threat_value + threat_values[breed_name] * amount
		i = i + amount
	end

	self.delay_horde = self.delay_horde_threat_value < threat_value
	self.delay_mini_patrol = self.delay_mini_patrol_threat_value < threat_value
	self.delay_specials = self.delay_specials_threat_value < threat_value
	self.threat_value = threat_value
	self.num_aggroed = i
end

ConflictDirector.check_pacing_event_delay = function (self)
	if self.event_delay then
		self.delay_horde = true
		self.delay_mini_patrol = true
		self.delay_specials = true
	end
end

local source_attacker_unit_index = DamageDataIndex.SOURCE_ATTACKER_UNIT

ConflictDirector.register_unit_killed = function (self, unit, blackboard, killer_unit, killing_blow)
	self:_remove_unit_from_spawned(unit, blackboard)

	local side = self._hero_side

	if side then
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

		self.pacing:enemy_killed(unit, player_and_bot_units)
	end

	local breed = blackboard.breed
	local breed_name = breed.name
	local death_pos = POSITION_LOOKUP[unit]
	local breed_enhancements = nil
	local ai_system = Managers.state.entity:system("ai_system")
	local attributes = ai_system:get_attributes(unit)
	local breed_enhancements = (attributes.grudge_marked and attributes.breed_enhancements) or nil

	if breed_enhancements then
		Managers.telemetry.events:ai_died(blackboard.enemy_id, breed_name, death_pos)
	end

	Managers.state.event:trigger("on_unit_killed", unit, killer_unit, killing_blow)
end

ConflictDirector.register_unit_destroyed = function (self, unit, reason)
	local blackboard = BLACKBOARDS[unit]
	local breed = blackboard.breed
	local breed_name = breed.name
	local despawn_pos = POSITION_LOOKUP[unit]

	Managers.telemetry.events:ai_despawned(breed_name, despawn_pos, reason)

	if breed.run_on_despawn then
		breed.run_on_despawn(unit, blackboard)
	end

	if script_data.disable_breed_freeze_opt or not self.breed_freezer:try_mark_unit_for_freeze(breed, unit) then
		Managers.state.unit_spawner:mark_for_deletion(unit)
	end

	blackboard.about_to_be_destroyed = true
end

ConflictDirector.event_delay_pacing = function (self, should_delay)
	self.event_delay = should_delay

	if not should_delay then
		local t = Managers.time:time("game")

		self.specials_pacing:delay_spawning(t, 10, 15)
	end
end

ConflictDirector.destroy_unit = function (self, unit, blackboard, reason)
	if ALIVE[unit] then
		local game_mode_manager = Managers.state.game_mode

		if game_mode_manager then
			game_mode_manager:ai_destroyed(unit, blackboard, reason)
		end

		self:_remove_unit_from_spawned(unit, blackboard)
		self:register_unit_destroyed(unit, reason)
	end
end

ConflictDirector.destroy_all_units = function (self, except_immune)
	print("ConflictDirector - destroy all units")

	local network_manager = Managers.state.network

	if not network_manager:game() then
		return
	end

	local BLACKBOARDS = BLACKBOARDS
	local spawned = self._spawned
	local num_spawned = #spawned

	for k = num_spawned, 1, -1 do
		local unit = spawned[k]

		if ALIVE[unit] then
			local blackboard = BLACKBOARDS[unit]
			local breed = blackboard.breed

			if not except_immune or not breed.debug_despawn_immunity then
				local reason = "destroy_all_units"
				local breed_name = breed.name
				local despawn_pos = POSITION_LOOKUP[unit]

				Managers.telemetry.events:ai_despawned(breed_name, despawn_pos, reason)
				self:_remove_unit_from_spawned(unit, blackboard, true)

				if script_data.disable_breed_freeze_opt or not self.breed_freezer:try_mark_unit_for_freeze(breed, unit) then
					Managers.state.unit_spawner:mark_for_deletion(unit)
				end

				if breed.run_on_despawn then
					breed.run_on_despawn(unit, blackboard)
				end
			end
		end
	end

	Managers.state.event:trigger("ai_units_all_destroyed")

	self._living_horde = 0
end

ConflictDirector.destroy_close_units = function (self, position, except_unit, dist_squared)
	local network_manager = Managers.state.network

	if not network_manager:game() then
		return
	end

	position = position or POSITION_LOOKUP[Managers.player:local_player().player_unit]

	if not position then
		return
	end

	local spawned = self._spawned
	local list_size = #spawned
	local i = 1
	local BLACKBOARDS = BLACKBOARDS
	local num_destroyed_units = 0

	while i <= list_size do
		local unit = spawned[i]
		local remove_unit = nil

		if ALIVE[unit] and unit ~= except_unit then
			local unit_pos = Unit.local_position(unit, 0)
			remove_unit = distance_squared(position, unit_pos) < dist_squared
		else
			remove_unit = false
		end

		if remove_unit then
			local blackboard = BLACKBOARDS[unit]
			local breed = blackboard.breed
			local reason = "destroy_close_units"
			local breed_name = breed.name
			local despawn_pos = POSITION_LOOKUP[unit]

			Managers.telemetry.events:ai_despawned(breed_name, despawn_pos, reason)

			num_destroyed_units = num_destroyed_units + 1

			if Managers.weave:get_active_weave() then
				local death_data = {
					breed = breed
				}
				local local_player_unit = Managers.player:local_player().player_unit
				local weave_objective_system = Managers.state.entity:system("weave_objective_system")

				weave_objective_system:on_ai_killed(unit, local_player_unit, death_data)
			end

			self:_remove_unit_from_spawned(unit, blackboard)

			list_size = list_size - 1

			if script_data.disable_breed_freeze_opt or not self.breed_freezer:try_mark_unit_for_freeze(breed, unit) then
				Managers.state.unit_spawner:mark_for_deletion(unit)
			end

			if breed.run_on_despawn then

				-- Decompilation error in this vicinity:
				breed.run_on_despawn(unit, blackboard)
			end
		end
	end

	print("debug destroy close units", num_destroyed_units)
end

ConflictDirector.destroy_specials = function (self)
	print("debug destroy specials")

	local alive_specials = self._alive_specials
	local num_alive_specials = #alive_specials
	local BLACKBOARDS = BLACKBOARDS

	for k = num_alive_specials, 1, -1 do
		local unit = alive_specials[k]

		if ALIVE[unit] then
			local blackboard = BLACKBOARDS[unit]
			local breed = blackboard.breed
			local reason = "destroy_specials"
			local breed_name = breed.name
			local despawn_pos = POSITION_LOOKUP[unit]

			Managers.telemetry.events:ai_despawned(breed_name, despawn_pos, reason)
			self:_remove_unit_from_spawned(unit, blackboard)

			if script_data.disable_breed_freeze_opt or not self.breed_freezer:try_mark_unit_for_freeze(breed, unit) then
				Managers.state.unit_spawner:mark_for_deletion(unit)
			end

			if breed.run_on_despawn then
				breed.run_on_despawn(unit, blackboard)
			end
		end
	end

	fassert(#self._alive_specials == 0, "Something bad happend when debug despawned all specials")

	local side = self._hero_side
	local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

	for _, player_unit in ipairs(player_and_bot_units) do
		local status_extension = ScriptUnit.extension(player_unit, "status_system")

		if status_extension.pack_master_status and status_extension.pack_master_status == "pack_master_hanging" then
			StatusUtils.set_grabbed_by_pack_master_network("pack_master_dropping", player_unit, true, nil)
		end
	end
end

ConflictDirector.debug_spawn_breed = function (self, breed_name, delayed, override_pos, extra_data)
	local breed = Breeds[breed_name]
	local item = extra_data
	local text = item[1]
	local func = item[2]

	if func and self[func] then
		local done = self[func](self, item[3], item[4], item[5], item[6])

		if done then
			return
		end
	end

	if not breed then
		print("debug spawning - missing breed")

		return
	end

	if not Managers.state.unit_spawner.unit_template_lut[breed.unit_template] then
		printf("Failed to spawn '%s' - No unit template found", breed.name)

		return
	end

	print("Debug spawning: " .. breed.name)

	local pos = nil
	local debug_func_name = breed.debug_spawn_func_name

	if debug_func_name then
		pos = self[debug_func_name](self, breed, false, delayed, override_pos)
	else
		pos = self:aim_spawning(breed, false, delayed, override_pos)
	end

	return pos
end

ConflictDirector.debug_spawn_all_breeds = function (self, except_these_breeds, use_except_list_as_spawn_list)
	local pos = self:aim_spawning(nil, true)

	if not pos then
		return
	end

	local breed_list = {}

	if use_except_list_as_spawn_list then
		for breed_name, _ in pairs(except_these_breeds) do
			breed_list[#breed_list + 1] = Breeds[breed_name]
		end
	else
		for breed_name, breed in pairs(Breeds) do
			if not except_these_breeds[breed_name] then
				breed_list[#breed_list + 1] = breed
			end
		end
	end

	except_these_breeds = except_these_breeds or {}
	local num_attempts = 8
	local amount = #breed_list
	local grid_size = math.ceil(math.sqrt(amount))
	local rot = Quaternion(Vector3.up(), math.degrees_to_radians(math.random(1, 360)))

	for i = 1, amount, 1 do
		local spawn_pos = nil

		for j = 1, num_attempts, 1 do
			local offset = Vector3(4 * math.random() - 2, 4 * math.random() - 2, 0)

			if j == 1 then
				offset = Vector3(-grid_size / 2 + i % grid_size, -grid_size / 2 + math.floor(i / grid_size), 0)
			end

			spawn_pos = LocomotionUtils.pos_on_mesh(self.nav_world, pos + offset)

			if spawn_pos then
				local optional_data = {
					ignore_breed_limits = true,
					side_id = self.debug_spawn_side_id
				}
				local breed = breed_list[i]

				self:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(rot), "debug_spawn", nil, nil, optional_data)

				break
			end
		end
	end

	return true
end

ConflictDirector.debug_spawn_breed_at_hidden_spawner = function (self, breed_name)
	local breed = Breeds[breed_name]

	print("Debug spawning from hidden spawner: " .. breed_name)

	local side = self._hero_side
	local player_positions = side.PLAYER_POSITIONS
	local center_pos = player_positions[1]

	if center_pos then
		local spawner = ConflictUtils.get_random_hidden_spawner(center_pos, 40)

		if not spawner then
			print("No hidden spawner units found")

			return
		end

		local spawn_pos = Unit.local_position(spawner, 0)
		local spawn_category = "debug_spawn"
		local rot = Quaternion(Vector3.up(), math.degrees_to_radians(math.random(1, 360)))
		local optional_data = {
			ignore_breed_limits = true,
			side_id = self.debug_spawn_side_id
		}

		self:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(rot), spawn_category, nil, nil, optional_data)
	end
end

ConflictDirector.rpc_debug_conflict_director_command = function (self, channel_id, command_name, breed_name, position, enhancements_string, extra_data)
	self._debug_spawn_breed_position = position
	self._debug_spawn_breed_enhancements = table.set(string.split(enhancements_string, ","))

	if command_name == "debug_spawn_breed" then
		self:debug_spawn_breed(breed_name, false, position, extra_data)
	elseif command_name == "debug_spawn_group" then
		self:debug_spawn_group(breed_name)
	elseif command_name == "debug_spawn_roaming_patrol" then
		self:debug_spawn_roaming_patrol(position)
	elseif command_name == "debug_spawn_group_at_main_path" then
		self:debug_spawn_group_at_main_path(nil, nil)
	elseif command_name == "debug_spawn_breed_at_hidden_spawner" then
		self:debug_spawn_breed_at_hidden_spawner(breed_name)
	elseif command_name == "destroy_close_units" then
		self:destroy_close_units(position, nil, 144)
	elseif command_name == "destroy_all_units" then
		self:destroy_all_units(true)
	elseif command_name == "destroy_specials" then
		self:destroy_specials()
	end

	self._debug_spawn_breed_position = nil
	self._debug_spawn_breed_enhancements = nil
end

ConflictDirector.rpc_debug_conflict_director_command = NOP

ConflictDirector.debug_spawn_group = function (self, breed_name)
	local breed = Breeds[breed_name]

	print("Spawning group: " .. breed_name)
	self:aim_spawning_group(breed, true)
end

ConflictDirector.debug_spawn_group_at_main_path = function (self, main_path_index, sub_node_index)
	local breed = Breeds.skaven_storm_vermin
	local patrol_template = "spline_patrol"
	RecycleSettings.destroy_los_distance_squared = math.huge
	local main_paths = self.main_path_info.main_paths
	local main_path = (main_path_index and main_paths[main_path_index]) or main_paths[math.random(1, #main_paths)]
	local sub_node = (sub_node_index and main_path.nodes[sub_node_index]) or main_path.nodes[math.random(1, #main_path.nodes)]
	local data = {
		wanted_size = 5,
		group_type = "main_path_patrol",
		breed = breed
	}

	self:spawn_group(patrol_template, sub_node:unbox(), data)
end

ConflictDirector.debug_spawn_horde = function (self)
	if self.in_safe_zone then
		print("Can't spawn horde in safe zone")

		return
	end

	local kind = script_data.ai_set_horde_type_debug
	local side_id = self.default_enemy_side_id
	local extra_data = {
		horde_wave = "single"
	}

	if not kind or kind == "random" then
		local random_table = {
			"vector",
			"vector_blob",
			"ambush"
		}
		kind = random_table[math.random(1, #random_table)]
	end

	print("DEBUG_HORDE: ", kind)

	if type(CurrentHordeSettings.vector_composition) == "table" then
		local wave_composition = CurrentHordeSettings.vector_composition[math.random(#CurrentHordeSettings.vector_composition)]
		extra_data.optional_wave_composition = wave_composition

		print("DEBUG_HORDE: Wave composition ", wave_composition)
	end

	self.horde_spawner:horde(kind, extra_data, side_id)
end

ConflictDirector.debug_speed_running_intervention = function (self, t)
	local speed_running_intervention_data = self.speed_running_intervention_data

	if speed_running_intervention_data.debug_state then
		Debug.text(string.format("%0.1f", self._next_speed_running_intervention_time - t) .. " SPEED RUN intervention: " .. speed_running_intervention_data.debug_state)
	end

	if speed_running_intervention_data.total_travel_distances then
		for unit, dist in pairs(speed_running_intervention_data.total_travel_distances) do
			local player = Managers.player:owner(unit)

			if player then
				local display_name = SPProfiles[player:profile_index()].display_name

				Debug.text(display_name .. " total travel distance: " .. dist)
			end
		end
	end
end

local function player_aim_direction()
	local in_free_flight = Managers.free_flight:active("global")

	if in_free_flight then
		local input_service = Managers.free_flight.input_manager:get_service("FreeFlight")
		local data = Managers.free_flight.data.global
		local world = Managers.world:world(data.viewport_world_name)
		local viewport = ScriptWorld.global_free_flight_viewport(world)
		local camera = data.frustum_freeze_camera or ScriptViewport.camera(viewport)
		local mouse = input_service:get("cursor")
		local position = Camera.screen_to_world(camera, Vector3(mouse.x, mouse.y, 0), 0)
		local direction = Camera.screen_to_world(camera, Vector3(mouse.x, mouse.y, 0), 1) - position
		local raycast_dir = Vector3.normalize(direction)

		return position, raycast_dir
	else
		local player_manager = Managers.player
		local player = player_manager:local_player(1)
		local camera_position = Managers.state.camera:camera_position(player.viewport_name)
		local camera_rotation = Managers.state.camera:camera_rotation(player.viewport_name)
		local camera_direction = Quaternion.forward(camera_rotation)

		return camera_position, camera_direction
	end
end

ConflictDirector.player_aim_raycast = function (self, world, only_breed, filter)
	local position, raycast_dir = player_aim_direction()
	local player_manager = Managers.player
	local player = player_manager:local_player(1)
	local player_unit = player.player_unit
	local physics_world = World.get_data(world, "physics_world")
	local result = PhysicsWorld.immediate_raycast(physics_world, position, raycast_dir, 100, "all", "collision_filter", filter)

	if result then
		local num_hits = #result

		for i = 1, num_hits, 1 do
			local hit = result[i]
			local hit_actor = hit[4]
			local hit_unit = Actor.unit(hit_actor)
			local attack_hit_self = hit_unit == player_unit

			if not attack_hit_self then
				local breed = Unit.get_data(hit_unit, "breed")

				if only_breed then
					if breed then
						return breed, hit[1], hit[2], hit[3], hit[4]
					end
				else
					return hit[1], hit[2], hit[3], hit[4]
				end
			end
		end
	end

	return nil
end

ConflictDirector.debug_spawn_tentacle_blob = function (self, breed, only_breed, optional_delayed, optional_override_pos)
	print("DEBUG SPAWN TENTACLE")

	local position, distance, normal, actor = self:player_aim_raycast(self._world, only_breed, "filter_ray_horde_spawn")

	if not position then
		return
	end

	local spawn_pos = position

	QuickDrawerStay:sphere(spawn_pos, 0.33, Color(255, 0, 0))

	local spawn_category = "debug_spawn"
	local rot = Quaternion(Vector3.up(), math.degrees_to_radians(math.random(1, 360)))
	local optional_data = breed.debug_spawn_optional_data or {}

	optional_data.spawned_func = function (unit, breed, optional_data)
		if breed.special then
			self._alive_specials[#self._alive_specials + 1] = unit
		end

		local entity_manager = Managers.state.entity
		local ai_system = entity_manager:system("ai_system")

		if ai_system.ai_debugger and not AiUtils.unit_alive(ai_system.ai_debugger.active_unit) and not script_data.ai_disable_auto_ai_debugger_target then
			ai_system.ai_debugger.active_unit = unit
			script_data.debug_unit = unit
		end
	end

	optional_data.ignore_breed_limits = true
	optional_data.side_id = self.debug_spawn_side_id

	self:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(rot), spawn_category, nil, nil, optional_data)
end

ConflictDirector.aim_spawning_surface = function (self, breed, on_navmesh, optional_delayed, optional_override_pos)
	local position, distance, normal, actor = self:player_aim_raycast(self._world, false, "filter_ray_horde_spawn")

	if breed.inside_wall_spawn_distance then
		position = position - normal * breed.inside_wall_spawn_distance
	end

	local spawn_category = "debug_spawn"
	local rot = Quaternion.look(normal, Vector3.up())
	local optional_data = breed.debug_spawn_optional_data or {}
	optional_data.side_id = self.debug_spawn_side_id

	optional_data.spawned_func = function (unit, breed, optional_data)
		if breed.special then
			self._alive_specials[#self._alive_specials + 1] = unit
		end

		local entity_manager = Managers.state.entity
		local ai_system = entity_manager:system("ai_system")

		if ai_system.ai_debugger and not AiUtils.unit_alive(ai_system.ai_debugger.active_unit) and not script_data.ai_disable_auto_ai_debugger_target then
			ai_system.ai_debugger.active_unit = unit
			script_data.debug_unit = unit
		end
	end

	optional_data.ignore_breed_limits = true

	self:spawn_queued_unit(breed, Vector3Box(position), QuaternionBox(rot), spawn_category, nil, nil, optional_data)
end

ConflictDirector.set_debug_spawn_side = function (self, side_id)
	self.debug_spawn_side_id = side_id
end

ConflictDirector.cycle_debug_spawn_side = function (self)
	self.debug_spawn_side_id = self.debug_spawn_side_id % #Managers.state.side:sides() + 1
end

ConflictDirector.aim_spawning_air = function (self, breed, on_navmesh, optional_delayed, optional_override_pos)
	local position, distance, normal, actor = self:player_aim_raycast(self._world, false, "filter_ray_horde_spawn")
	local spawn_category = "debug_spawn"
	local rot = Quaternion.identity()

	if not position then
		local raycast_dir = nil
		position, raycast_dir = player_aim_direction()
		position = position + raycast_dir * breed.air_spawning_distance
	elseif breed.inside_wall_spawn_distance then
		position = position - normal * breed.inside_wall_spawn_distance
	end

	local optional_data = breed.debug_spawn_optional_data or {}
	optional_data.side_id = self.debug_spawn_side_id

	optional_data.spawned_func = function (unit, breed, optional_data)
		if breed.special then
			self._alive_specials[#self._alive_specials + 1] = unit
		end

		local entity_manager = Managers.state.entity
		local ai_system = entity_manager:system("ai_system")

		if ai_system.ai_debugger and not AiUtils.unit_alive(ai_system.ai_debugger.active_unit) and not script_data.ai_disable_auto_ai_debugger_target then
			ai_system.ai_debugger.active_unit = unit
			script_data.debug_unit = unit
		end
	end

	optional_data.ignore_breed_limits = true

	self:spawn_queued_unit(breed, Vector3Box(position), QuaternionBox(rot), spawn_category, nil, nil, optional_data)
end

ConflictDirector.aim_spawning = function (self, breed, on_navmesh, optional_delayed, optional_override_pos, additional_data)
	local position, distance, normal, actor = self:player_aim_raycast(self._world, false, "filter_ray_horde_spawn")

	if optional_delayed then
		return position
	elseif optional_override_pos then
		position = optional_override_pos
	elseif self._debug_spawn_breed_position then
		position = self._debug_spawn_breed_position
	end

	if not position then
		return
	end

	local spawn_pos = nil

	if on_navmesh then
		spawn_pos = LocomotionUtils.pos_on_mesh(self.nav_world, position)
	else
		spawn_pos = position
	end

	if breed then
		local spawn_category = "debug_spawn"
		local rot = Quaternion(Vector3.up(), math.degrees_to_radians(math.random(1, 360)))
		local optional_data = breed.debug_spawn_optional_data or {}
		optional_data.ignore_breed_limits = true
		optional_data.side_id = self.debug_spawn_side_id

		optional_data.spawned_func = function (unit, breed, optional_data)
			if breed.special then
				self._alive_specials[#self._alive_specials + 1] = unit
			end

			local entity_manager = Managers.state.entity
			local ai_system = entity_manager:system("ai_system")

			if ai_system.ai_debugger and not AiUtils.unit_alive(ai_system.ai_debugger.active_unit) and not script_data.ai_disable_auto_ai_debugger_target then
				ai_system.ai_debugger.active_unit = unit
				script_data.debug_unit = unit
			end
		end

		if additional_data then
			table.merge(optional_data, additional_data)
		end

		self:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(rot), spawn_category, nil, nil, optional_data)
	else
		return spawn_pos
	end
end

ConflictDirector.debug_spawn_roaming_patrol = function (self, position)
	if not position then
		return
	end

	local ai_group_system = Managers.state.entity:system("ai_group_system")
	local level_has_roaming_splines = ai_group_system:level_has_splines("roaming")

	if level_has_roaming_splines then
		local formation = PatrolFormationSettings.random_roaming_formation(BreedPacks.beastmen[3])
		local spline_name = ai_group_system:get_best_spline(position, "roaming")

		if not spline_name then
			Debug.sticky_text("no roaming spline within max distance")

			return
		end

		local spline_way_points = {
			Vector3Box(28, -243, 0),
			Vector3Box(37, -143, 0)
		}
		local data = {
			spawn_all_at_same_position = false,
			group_type = "roaming_patrol",
			formation = formation,
			spline_name = spline_name,
			spline_way_points = spline_way_points
		}

		self:spawn_spline_group("spline_patrol", position, data)
	end
end

ConflictDirector.debug_spawn_spline_patrol_closest_spawner = function (self)
	local local_player = Managers.player:local_player()
	local position = self:get_free_flight_pos()
	position = position or POSITION_LOOKUP[local_player.player_unit]
	local route, waypoints = Managers.state.conflict.level_analysis:debug_get_closest_boss_patrol_spawn(position)
	local event_data = {
		spline_type = "patrol",
		event_kind = "event_spline_patrol",
		spline_id = route.id,
		spline_way_points = waypoints,
		one_directional = route.one_directional
	}

	TerrorEventMixer.start_event("boss_event_chaos_spline_patrol", event_data)
end

ConflictDirector.aim_patrol_spawning = function (self, formation_name)
	self:aim_spawning_group(nil, true, formation_name)

	return true
end

ConflictDirector.inject_event_patrol = function (self)
	local spline_name, spline_data, start_pos = self.conflict_director.level_analysis:get_closest_roaming_spline(area_position:unbox())

	if not spline_name then
		return false
	end

	local waypoints = spline_data.waypoints
	local spline_waypoints = self:boxify_waypoint_table(waypoints)
end

ConflictDirector.aim_spawning_group = function (self, breed, on_navmesh, formation_name)
	local position, distance, normal, actor = self:player_aim_raycast(self._world, false, "filter_ray_horde_spawn")

	if self._debug_spawn_breed_position then
		position = self._debug_spawn_breed_position
	end

	if not position then
		return
	end

	if not formation_name then
		local data = {
			wanted_size = 50,
			group_type = "grid",
			breed = breed
		}

		self:spawn_group("spline_patrol", position, data)
	else
		local ai_group_system = Managers.state.entity:system("ai_group_system")
		local spline_type = "patrol"
		local despawn_at_end = false

		if spline_type then
			local difficulty = Managers.state.difficulty:get_difficulty()
			local formation = PatrolFormationSettings[formation_name][difficulty]
			formation.settings = PatrolFormationSettings[formation_name].settings
			local spline_name, waypoints, route_data, start_pos = nil
			spline_name = ai_group_system:get_best_spline(position, spline_type)

			if spline_name then
				waypoints = {
					Vector3Box(110, 0, 0),
					Vector3Box(1, -220, 0)
				}
			else
				spline_name, waypoints, start_pos = self.level_analysis:get_closest_waypoint_spline(position)

				if spline_name then
					position = start_pos
					despawn_at_end = true
				else
					print("No patrol spline found")

					return
				end
			end

			local data = {
				spawn_all_at_same_position = false,
				group_type = "spline_patrol",
				formation = formation,
				spline_name = spline_name,
				spline_way_points = waypoints,
				despawn_at_end = despawn_at_end
			}

			self:spawn_spline_group("spline_patrol", position, data)
		else
			local data = {
				group_type = "main_path_patrol",
				breed = breed or Breeds.skaven_storm_vermin
			}

			self:spawn_group("spline_patrol", position, data)
		end
	end
end

local spawn_group_positions = {}

ConflictDirector.spawn_group = function (self, patrol_template_name, position, data)
	local group_type = data.group_type
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local wanted_size = data.wanted_size or 0
	local num_attempts = 8
	local group_size = 0
	local spawn_in_grid = group_type == "grid"
	local grid_size = spawn_in_grid and math.ceil(math.sqrt(wanted_size))

	for i = 1, wanted_size, 1 do
		local spawn_pos = nil

		for j = 1, num_attempts, 1 do
			local offset = Vector3(4 * Math.random() - 2, 4 * Math.random() - 2, 0)

			if spawn_in_grid and j == 1 then
				offset = Vector3(-grid_size / 2 + i % grid_size, -grid_size / 2 + math.floor(i / grid_size), 0)
			end

			spawn_pos = LocomotionUtils.pos_on_mesh(self.nav_world, position + offset)

			if spawn_pos then
				group_size = group_size + 1
				spawn_group_positions[group_size] = spawn_pos

				break
			end
		end
	end

	if group_size == 0 then
		return
	end

	local group_data = nil

	if group_type == "main_path_patrol" then
		group_data = {
			id = Managers.state.entity:system("ai_group_system"):generate_group_id(),
			template = patrol_template_name,
			size = group_size,
			group_type = group_type
		}
	end

	local spawn_category = "patrol"
	local rot = Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360)))
	local optional_data = {
		ignore_breed_limits = true,
		side_id = self.debug_spawn_side_id or data.side_id
	}

	for i = 1, group_size, 1 do
		local spawn_pos = spawn_group_positions[i]
		local spawn_breed = data.breed

		self:spawn_queued_unit(spawn_breed, Vector3Box(spawn_pos), QuaternionBox(rot), spawn_category, nil, nil, optional_data, group_data)
	end
end

ConflictDirector.spawn_spline_group = function (self, patrol_template_name, position, data)
	local group_type = data.group_type
	local spline_name = data.spline_name
	local formation = data.formation
	local zone_data = data.zone_data
	local spawn_all_at_same_position = data.spawn_all_at_same_position
	local ai_group_system = Managers.state.entity:system("ai_group_system")
	local group_start_position = position and Vector3Box(position)
	local side = Managers.state.side:get_side(self.default_enemy_side_id)
	local base_group_data = {
		id = ai_group_system:generate_group_id(),
		template = patrol_template_name,
		spline_name = spline_name,
		formation = formation,
		group_type = group_type,
		group_start_position = group_start_position,
		data = data,
		zone_data = zone_data,
		despawn_at_end = data.despawn_at_end,
		spawn_all_at_same_position = spawn_all_at_same_position,
		side = side
	}
	local spline = ai_group_system:spline(spline_name)

	if spline then
		print("Spline already found!")

		if not spline.failed then
			self:_spawn_spline_group(base_group_data)
		else
			print("spline is in fail state, cancelling the spline spawn.", spline_name)
		end
	elseif data.spline_way_points then
		ai_group_system:create_spline_from_way_points(spline_name, data.spline_way_points, data.spline_type)

		self._spline_groups_to_spawn = self._spline_groups_to_spawn or {}
		self._spline_groups_to_spawn[spline_name] = base_group_data
	else
		ferror("Missing spline: %s", spline_name)
	end
end

ConflictDirector._check_hi_data_override = function (self, breed, breed_count, zone_data)
	local breed_name = breed.name
	local data = breed_count[breed_name]

	if data then
		data.count = data.count + 1

		if data.max_amount < data.count then
			breed = data.switch_breed
			data.switch_count = data.switch_count + 1

			return breed, breed_name
		end
	end

	return breed
end

ConflictDirector.set_breed_override_lookup = function (self, breed_override_lookup)
	self._breed_override_lookup = breed_override_lookup
end

ConflictDirector._spawn_spline_group = function (self, base_group_data, spline)
	local spawn_category = "patrol"
	local formation = base_group_data.formation
	local spline_name = base_group_data.spline_name
	local ai_group_system = Managers.state.entity:system("ai_group_system")
	local spawn_all_at_same_position = base_group_data.spawn_all_at_same_position
	local group_start_position = base_group_data.group_start_position and base_group_data.group_start_position:unbox()
	local start_position = group_start_position or ai_group_system:spline_start_position(spline_name)
	local formation_data = ai_group_system:create_formation_data(start_position, formation, spline_name, spawn_all_at_same_position, base_group_data)
	base_group_data.formation = formation_data
	base_group_data.group_start_position = Vector3Box(start_position)
	local group_size = formation_data.group_size

	if group_size == 0 then
		return
	end

	local zone_data = base_group_data.zone_data
	local breed_count = nil

	if zone_data then
		local hi_data = zone_data.hi_data
		breed_count = hi_data and hi_data.breed_count
	end

	base_group_data.size = group_size
	local breed_override_lookup = self._breed_override_lookup

	for row, columns in ipairs(formation_data) do
		for column, data in ipairs(columns) do
			repeat
				local breed_name = data.breed_name

				if not Breeds[breed_name] then
					break
				end

				local optional_data = {}
				local spawn_breed = Breeds[breed_name]

				if breed_count then
					local old_breed = nil
					spawn_breed, old_breed = self:_check_hi_data_override(spawn_breed, breed_count, zone_data)
				end

				if breed_override_lookup then
					local breed_override_name = breed_override_lookup[spawn_breed.name]

					if breed_override_name then
						spawn_breed = Breeds[breed_override_name]
					end
				end

				local spawn_pos = data.start_position:unbox()
				local direction = data.start_direction:unbox()
				local rotation = Quaternion.look(direction, Vector3.up())
				local group_data = table.shallow_copy(base_group_data)
				group_data.breed = breed_name
				group_data.group_position = {
					row = row,
					column = column
				}
				optional_data.far_off_despawn_immunity = true

				self:spawn_queued_unit(spawn_breed, Vector3Box(spawn_pos), QuaternionBox(rotation), spawn_category, nil, nil, optional_data, group_data)
			until true
		end
	end
end

ConflictDirector.spawn_one = function (self, breed, optional_pos, group_data, optional_data, optional_rotation)
	if breed.special then
		local specials_spawning_disabled = Managers.state.game_mode:setting("ai_specials_spawning_disabled")

		if specials_spawning_disabled then
			return
		end
	end

	local spawn_category = "spawn_one"
	local side = self._hero_side
	local player_positions = side.PLAYER_POSITIONS
	local center_pos = player_positions[1]

	if not center_pos then
		for i = 1, #player_positions, 1 do
			local pos = player_positions[i]

			if pos then
				center_pos = pos

				break
			end
		end
	end

	if not center_pos then
		return
	end

	local spawn_pos = optional_pos or ConflictUtils.get_spawn_pos_on_circle(self.nav_world, center_pos, 20, 8, 30)

	if spawn_pos then
		local rot = optional_rotation
		rot = rot or Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360)))

		self:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(rot), spawn_category, nil, nil, optional_data, group_data)
	end
end

local function cb_spawn_at_raw_spawned(unit, breed, optional_data)
	local play_go_tutorial_system = Managers.state.entity:system("play_go_tutorial_system")

	if play_go_tutorial_system then
		local spawner_unit = optional_data.spawner_unit

		play_go_tutorial_system:register_unit(spawner_unit, unit)
	end
end

ConflictDirector.spawn_at_raw_spawner = function (self, breed, spawner_id, optional_data, side_id)
	local spawner_system = Managers.state.entity:system("spawner_system")
	local spawner_unit, optional_idle_animation = spawner_system:get_raw_spawner_unit(spawner_id)

	if spawner_unit then
		local pos = Unit.local_position(spawner_unit, 0)
		local rot = Unit.local_rotation(spawner_unit, 0)
		optional_data = optional_data or {}
		optional_data.idle_animation = optional_idle_animation
		optional_data.spawner_unit = spawner_unit

		if optional_data.spawned_func then
			local previous_spawned_func = optional_data.spawned_func

			optional_data.spawned_func = function (ai_unit, breed, optional_data)
				previous_spawned_func(ai_unit, breed, optional_data)
				cb_spawn_at_raw_spawned(ai_unit, breed, optional_data)
			end
		else
			optional_data.spawned_func = cb_spawn_at_raw_spawned
		end

		optional_data.side_id = optional_data.side_id or side_id or self.default_enemy_side_id

		self:spawn_queued_unit(breed, Vector3Box(pos), QuaternionBox(rot), "raw_spawner", nil, nil, optional_data, nil, nil)
	end
end

ConflictDirector.debug_spawn_at_raw = function (self, breed, optional_data, side_id)
	local pos = self:player_aim_raycast(self._world, false, "filter_ray_horde_spawn")

	if self._debug_spawn_breed_position then
		pos = self._debug_spawn_breed_position
	end

	local rot = Quaternion.identity()
	optional_data = optional_data or {}

	if optional_data.spawned_func then
		local previous_spawned_func = optional_data.spawned_func

		optional_data.spawned_func = function (ai_unit, breed, optional_data)
			previous_spawned_func(ai_unit, breed, optional_data)
			cb_spawn_at_raw_spawned(ai_unit, breed, optional_data)
		end
	else
		optional_data.spawned_func = cb_spawn_at_raw_spawned
	end

	optional_data.side_id = optional_data.side_id or side_id or self.default_enemy_side_id

	self:spawn_queued_unit(breed, Vector3Box(pos), QuaternionBox(rot), "raw_spawner", nil, nil, optional_data, nil, nil)
end

ConflictDirector.generate_spawns = function (self)
	local pos_list, pack_sizes, pack_rotations, pack_members, zone_data_list = nil
	local _, finish_point = self.level_analysis:get_start_and_finish()

	fassert(finish_point, "Missing path marker at the end of the level")

	local triangle = GwNavTraversal.get_seed_triangle(self.nav_world, finish_point:unbox())

	fassert(triangle, "The path marker at the end of the level is outside the navmesh")
	self.navigation_group_manager:setup(self._world, self.nav_world)

	if FORM_GROUPS_IN_ONE_FRAME then
		print("Forming navigation groups in one frame")
		self.navigation_group_manager:form_groups(nil, finish_point)
	else
		self.navigation_group_manager:form_groups_start(nil, finish_point)
	end

	if CurrentConflictSettings.roaming.disabled then
		print("roaming spawning is disabled")

		return {}
	end

	if self.spawn_zone_baker.spawn_zones_available and not self.level_settings.skip_generate_spawns then
		local goal_density = 0.5
		local conflict_settings_name = self.current_conflict_settings or "default"
		local conflict_setting = ConflictDirectors[conflict_settings_name]
		local pack_spawning_setting = conflict_setting.pack_spawning or PackSpawningSettings.default
		local basics = pack_spawning_setting.basics
		local spawn_cycle_length = basics.spawn_cycle_length
		local area_density_coefficient = pack_spawning_setting.area_density_coefficient
		local length_density_coefficient = basics.length_density_coefficient
		local mutators = Managers.state.game_mode:mutators()
		local mutator_list = table.keys(mutators)
		pos_list, pack_sizes, pack_rotations, pack_members, zone_data_list = self.spawn_zone_baker:generate_spawns(spawn_cycle_length, goal_density, area_density_coefficient, length_density_coefficient, conflict_settings_name, mutator_list)

		return pos_list, pack_sizes, pack_rotations, pack_members, zone_data_list
	else
		print("This level is missing spawn_zones. No roaming enemies will spawn at all.")
	end

	pos_list = {}

	return pos_list
end

ConflictDirector.register_main_path_obstacle = function (self, position, radius_sq)
	local obstacles = self._main_path_obstacles
	obstacles[#obstacles + 1] = {
		position = position,
		radius_sq = radius_sq
	}
end

ConflictDirector.ai_ready = function (self, level_seed)
	self.enemy_package_loader = Managers.level_transition_handler.enemy_package_loader
	local t = Managers.time:time("game")
	local side = self._hero_side

	if side then
		self.default_hero_side_id = side.side_id
	end

	local enemy_side = Managers.state.side:get_side_from_name("dark_pact")

	if enemy_side then
		self.default_enemy_side_id = enemy_side.side_id

		fassert(self.default_enemy_side_id, "default enemy side id is missing")
	else
		self.default_enemy_side_id = 2
		enemy_side = Managers.state.side:get_side(2)
	end

	self._enemy_side = enemy_side

	print("CurrentConflictSettings", self.current_conflict_settings)

	if CurrentConflictSettings.disabled then
		Managers.state.event:trigger("conflict_director_setup_done")

		return
	end

	print("[ConflictDirector] conflict_director is ai_ready")

	self.level_settings = LevelHelper:current_level_settings()
	local entity_manager = Managers.state.entity
	self.nav_world = entity_manager:system("ai_system"):nav_world()
	self.patrol_analysis = PatrolAnalysis:new(self.nav_world, false, QuickDrawerStay)
	local ai_group_system = Managers.state.entity:system("ai_group_system")

	ai_group_system:ai_ready(self.patrol_analysis)

	self.nav_tag_volume_handler = NavTagVolumeHandler:new(self._world, self.nav_world)
	self.level_analysis.nav_world = self.nav_world
	self.level_analysis.level_settings = self.level_settings
	self.spawn_zone_baker = SpawnZoneBaker:new(self._world, self.nav_world, self.level_analysis, level_seed)
	local zones = self.spawn_zone_baker.zones
	local num_zones = self.spawn_zone_baker.num_main_zones
	local level_peaks = find_level_peaks(zones, num_zones)
	self._peak_delayer = PeakDelayer:new(level_peaks)
	self.spawn_zone_baker.zones = Managers.state.game_mode._mutator_handler:tweak_zones(self.current_conflict_settings, zones, self.spawn_zone_baker.num_main_zones)

	if self.spawn_zone_baker:loaded_spawn_zones_available() then
	else
		local result = self.level_analysis:generate_main_path()

		self.level_analysis:remove_crossroads_extra_path_branches()

		if result ~= "success" then
			Debug.sticky_text("Level fail: %s", result, "delay", 20)

			return
		end
	end

	self.main_path_info.main_paths = self.level_analysis:get_main_paths()
	local granularity = 3
	local forward_nodes, reversed_nodes, forward_break_nodes, reversed_break_nodes = MainPathUtils.node_list_from_main_paths(self.nav_world, self.main_path_info.main_paths, granularity, self._main_path_obstacles)
	self.main_path_info.merged_main_paths = {
		forward_list = forward_nodes,
		reversed_list = reversed_nodes,
		forward_break_list = forward_break_nodes,
		reversed_break_list = reversed_break_nodes
	}
	self.specials_pacing = SpecialsPacing:new(self._world, self.nav_world, self.nav_tag_volume_handler, enemy_side)
	local start = {
		self.level_analysis:get_start_and_finish()
	}

	fassert(start, "The path marker at the start of level is outside nav mesh")

	self._spawn_pos_list, self._pack_sizes, self._pack_rotations, self.pack_members, self._zone_data_list = self:generate_spawns()

	if FORM_GROUPS_IN_ONE_FRAME then
		self:ai_nav_groups_ready(level_seed)
	end

	local level_settings = LevelSettings[self._level_key]

	if not level_settings.load_no_enemies then
		self.breed_freezer = BreedFreezer:new(self._world, Managers.state.entity, self._network_event_delegate, self.enemy_package_loader)
	end
end

ConflictDirector.ai_nav_groups_ready = function (self, level_seed)
	self.enemy_recycler = EnemyRecycler:new(self._world, self.nav_world, self._spawn_pos_list, self._pack_sizes, self._pack_rotations, self.pack_members, self._zone_data_list, level_seed)

	self.level_analysis:set_enemy_recycler(self.enemy_recycler)

	self.horde_spawner = HordeSpawner:new(self._world, self.level_analysis.cover_points_broadphase)
	local insert_bosses = self.spawn_zone_baker:loaded_spawn_zones_available()

	if insert_bosses and CurrentBossSettings and not CurrentBossSettings.disabled then
		self.level_analysis:generate_boss_paths()
	end

	local main_path_info = self.main_path_info
	local main_paths = main_path_info.main_paths

	self.navigation_group_manager:assign_main_path_indexes(main_paths)

	self.in_safe_zone = true
	self.director_is_ai_ready = true

	Managers.state.event:trigger("conflict_director_setup_done")
	self:create_debug_list()
end

ConflictDirector.a_star_area_pos_search = function (self, p1, p2)
	local tri1 = GwNavTraversal.get_seed_triangle(self.nav_world, p1)
	local tri2 = GwNavTraversal.get_seed_triangle(self.nav_world, p2)

	if not tri1 or not tri2 then
		return false
	end

	local group1 = self.navigation_group_manager:get_polygon_group(tri1)
	local group2 = self.navigation_group_manager:get_polygon_group(tri2)

	if group1 and group2 then
		local path, dist = self.navigation_group_manager:a_star_cached(group1, group2)

		return path, dist
	end
end

ConflictDirector.freeze_intensity_decay = function (self, freeze_time)
	self.frozen_intensity_decay_until = self._time + freeze_time
end

ConflictDirector.intensity_decay_frozen = function (self, freeze_time)
	return self._time < self.frozen_intensity_decay_until
end

ConflictDirector.boss_event_running = function (self)
	return self._num_spawned_by_breed.skaven_rat_ogre > 0 or self._num_spawned_by_breed.skaven_stormfiend > 0 or self._num_spawned_by_breed.chaos_troll > 0 or self._num_spawned_by_breed.chaos_spawn > 0 or self._num_spawned_by_breed.beastmen_minotaur > 0
end

ConflictDirector.angry_boss = function (self)
	return self._num_angry_bosses > 0
end

ConflictDirector.add_angry_boss = function (self, amount, blackboard)
	self._num_angry_bosses = math.clamp(self._num_angry_bosses + amount, 0, 255)

	if blackboard then
		AiUtils.activate_unit(blackboard)
	end
end

ConflictDirector.level_flow_event = function (self, event_name)
	LevelHelper:flow_event(self._world, event_name)
end

ConflictDirector.jslots = function (self, unit, attacker_unit)
	local p1 = POSITION_LOOKUP[unit]
	local p2 = POSITION_LOOKUP[unit]
end

ConflictDirector.update_server_debug = function (self, t, dt)
	local side = self._hero_side
	local player_positions = side and side.PLAYER_POSITIONS

	if script_data.debug_zone_baker_on_screen then
		self.spawn_zone_baker:draw_zone_info_on_screen()
	end

	if script_data.debug_current_threat_value then
		local value, num = self:get_threat_value()

		Debug.text("DELAY: HORDE %s, SPECIALS %s, MINI_PATROL %s, Threat value: %.2f, num aggroed: %d", tostring(self.delay_horde), tostring(self.delay_specials), tostring(self.delay_mini_patrol), value, num)
	end

	if script_data.show_current_conflict_settings then
		Debug.text("Current ConflictSettings [%s]", CurrentConflictSettings.name)
	end

	if script_data.debug_conflict_director_breeds then
		local difficulty = Managers.state.difficulty:get_difficulty()
		local contained_breeds = CurrentConflictSettings.contained_breeds[difficulty]

		Debug.text("Conflict Director Breeds:")

		for breed_name, _ in pairs(contained_breeds) do
			Debug.text("   %s", breed_name)
		end
	end

	local side = Managers.state.side:get_side(self.default_enemy_side_id)
	slot6 = side.units_lookup

	if DebugKeyHandler.key_pressed("t", "test terror", "ai", "left shift") then
		print("Pressed t")

		if ConflictDirectorTests.start_test(self, t, dt) then
			return
		end
	end

	if DebugKeyHandler.key_pressed("f", "toggle debug graphs", "ai", "left shift") then
		local size = #self._debug_list

		for i = 2, size, 1 do
			local a = self._debug_list[i]

			a:show_debug(false)
		end

		for i = 1, size, 1 do
			local index = self._current_debug_list_index % size + 1

			if index == 1 then
				self._current_debug_list_index = index

				break
			else
				local a = self._debug_list[index]

				if a:show_debug(true) then
					self._current_debug_list_index = index

					break
				end
			end
		end
	end

	if DebugKeyHandler.key_pressed("g", "execute debug graphs", "ai", "left shift") then
		local f = self._debug_list[self._current_debug_list_index]

		if f and f.execute_debug then
			f:execute_debug()
		end
	end

	if script_data.show_alive_ai then
		ConflictUtils.display_number_of_breeds("TOTAL: ", #self._spawned, self._num_spawned_by_breed)

		if self.running_master_event then
			local num_spawned = 0

			for breed_name, amount in pairs(self._num_spawned_by_breed_during_event) do
				num_spawned = num_spawned + amount
			end

			ConflictUtils.display_number_of_breeds("EVENT: ", num_spawned, self._num_spawned_by_breed_during_event)
		end
	end

	if script_data.show_where_ai_is then
		ConflictUtils.show_where_ai_is(self._spawned)
	end

	if DebugKeyHandler.key_pressed("o", "draw spawn zones", "ai", "left shift") then
		local d = self.draw_all_zones
		d = (d == nil and "all") or (d == "all" and "last") or (d == "last" and "last_naive") or (d == "last_naive" and nil)

		if d == "all" then
			self.spawn_zone_baker:draw_zones(self.nav_world)
		elseif d == "last_naive" then
		elseif d == "last" then
		else
			self.spawn_zone_baker:draw_zones(self.nav_world)
		end

		self.draw_all_zones = d
	end

	local draw_all_zones = self.draw_all_zones

	if draw_all_zones ~= "nil" then
		if draw_all_zones == "all" then
			Debug.text("Draw Zone-segment (all)")
		elseif draw_all_zones == "last" then
			local main_paths = self.level_analysis:get_main_paths()
			local dist = self.main_path_info.ahead_travel_dist or 0
			local index = self.spawn_zone_baker:get_zone_segment_from_travel_dist(dist)

			if index then
				Debug.text("Draw Zone-segment: %d (last) travel_dist: %.1f", index, dist)
				self.spawn_zone_baker:draw_zones(self.nav_world, index)
			else
				Debug.text("Draw Zone-segment not precalculated (last)")
			end
		elseif draw_all_zones == "last_naive" then
			local main_paths = self.level_analysis:get_main_paths()
			local index = MainPathUtils.zone_segment_on_mainpath(main_paths, player_positions[1])

			self.spawn_zone_baker:draw_zones(self.nav_world, index)
			Debug.text("Draw Zone-segment: %d (last_naive)", index)
		end
	end

	if script_data.debug_ai_pacing then
		local side = self._hero_side
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

		if DebugKeyHandler.key_pressed("numpad_plus", "Increase intensity +25", "Pacing & Intensity") then
			self.pacing:debug_add_intensity(player_and_bot_units, 25)
		end

		if DebugKeyHandler.key_pressed("numpad_minus", "Decrease intensity -25", "Pacing & Intensity") then
			self.pacing:debug_add_intensity(player_and_bot_units, -25)
		end

		Debug.text("Total enemies alive: " .. tostring(#self._spawned))
	end

	if script_data.debug_rush_intervention then
		local data = self.rushing_intervention_data

		if ALIVE[data.ahead_unit] then
			data.ahead_unit_name = Managers.player:unit_owner(data.ahead_unit):profile_display_name()
		else
			data.ahead_unit_name = "?"
		end

		local countdown = math.clamp(self._next_rushing_intervention_time - t, 0, 999999)
		local rush_intervention = CurrentSpecialsSettings.rush_intervention

		if data.disabled then
			Debug.text("Rusher: %s ", data.disabled)
		else
			Debug.text("Rusher: %s loneliness: %.1f / ( special: %.1f, horde: %.1f ) (%s) ahead-dist: %.1f, time: %.1f ", data.ahead_unit_name, data.loneliness_value, rush_intervention.loneliness_value_for_special, rush_intervention.loneliness_value_for_ambush_horde, tostring(data.message), data.ahead_dist, countdown)
		end
	end

	if DebugKeyHandler.key_pressed("h", "spawn_horde", "ai") and not DamageUtils.is_in_inn then
		self:debug_spawn_horde()
	end

	if DebugKeyHandler.key_pressed("a", "force target switch", "ai", "left shift") then
		local unit = script_data.debug_unit

		if ALIVE[unit] then
			local ai_base_extension = ScriptUnit.extension(unit, "ai_system")
			local blackboard = ai_base_extension:blackboard()
			blackboard.target_changed = true
		end
	end

	if script_data.debug_ai_pacing then
		for unit, data in pairs(self._rushing_checks) do
			ConflictUtils.draw_stack_of_balls(data.start_pos:unbox(), 255, 255, 30, 0)

			local path_data = self.main_path_player_info[unit]

			if path_data and path_data.path_pos then
				ConflictUtils.draw_stack_of_balls(path_data.path_pos:unbox(), 255, 30, 255, 0)
			end
		end
	end

	if script_data.debug_near_cover_points then
		ConflictUtils.hidden_cover_points(player_positions[1], player_positions, 1, 35, nil)
	end

	if script_data.debug_player_positioning then
		local enemy_side = self._enemy_side
		local cluster_utility, lonliness_pos, loneliness_value, lonliest_player_unit = self:get_cluster_and_loneliness(10, enemy_side.ENEMY_PLAYER_POSITIONS, enemy_side.ENEMY_PLAYER_UNITS)

		if lonliest_player_unit then
			QuickDrawer:sphere(position_lookup[lonliest_player_unit], 0.88)
		end

		local cluster_radius = 7
		local side = self._hero_side
		local player_and_bot_positions = side.PLAYER_AND_BOT_POSITIONS
		local clusters, sizes = ConflictUtils.cluster_positions(player_and_bot_positions, cluster_radius)

		for i = 1, #clusters, 1 do
			QuickDrawer:sphere(clusters[i], cluster_radius)

			for j = 1, sizes[i], 1 do
				QuickDrawer:sphere(clusters[i] + Vector3(0, 0, 2 + j), 0.6)
			end
		end

		local main_path_info = self.main_path_info
		local ahead_unit = main_path_info.ahead_unit
		local dist_to_intervention = 0

		if ahead_unit then
			local player_info = self.main_path_player_info[ahead_unit]
			dist_to_intervention = self._rushing_intervention_travel_dist - player_info.travel_dist
			local path_pos = player_info.path_pos:unbox()
			local color = Color(0, 200, 30)
			local player_pos = POSITION_LOOKUP[ahead_unit]
			local a2 = path_pos + Vector3(0, 0, 0.5)
			local a3 = path_pos + Vector3(0, 0, 1)
			local a4 = path_pos + Vector3(0, 0, 1.5)

			QuickDrawer:cone(path_pos, a2, 0.3, color, 8, 8)
			QuickDrawer:cone(a2, a3, 0.3, color, 8, 8)
			QuickDrawer:cone(a3, a4, 0.3, color, 8, 8)
			QuickDrawer:cone(player_pos, player_pos + Vector3(0, 0, 2), 0.3, color, 8, 8)
			QuickDrawer:line(player_pos + Vector3(0, 0, 1), path_pos + Vector3(0, 0, 1), color)

			local ap = main_path_info.ahead_percent * 100
			local np = self._next_progression_percent * 100

			Debug.text("Ahead unit travel dist: %.1f, progression %d/%d", player_info.travel_dist, ap, np)
		end

		local behind_unit = main_path_info.behind_unit

		if behind_unit then
			local player_info = self.main_path_player_info[behind_unit]
			local path_pos = player_info.path_pos:unbox()
			local color = Color(200, 200, 0)
			local player_pos = POSITION_LOOKUP[behind_unit]
			local b2 = path_pos + Vector3(0, 0, 0.5)
			local b3 = path_pos + Vector3(0, 0, 1)
			local b4 = path_pos + Vector3(0, 0, 1.5)

			QuickDrawer:cone(path_pos, b2, 0.3, color, 8, 7)
			QuickDrawer:cone(b2, b3, 0.3, color, 8, 7)
			QuickDrawer:cone(b3, b4, 0.3, color, 8, 7)
			QuickDrawer:cone(player_pos, player_pos + Vector3(0, 0, 2), 0.3, color, 8, 8)
			QuickDrawer:line(player_pos + Vector3(0, 0, 1), path_pos + Vector3(0, 0, 1), color)
		end

		local tt_intervention = self._next_rushing_intervention_time - t

		Debug.text("cluster-utility: %s, lone-value: %.1f, intervention dist: %.1f, intervention timer: %.1f", tostring(cluster_utility), loneliness_value, dist_to_intervention, tt_intervention)
	end
end

ConflictDirector.client_ready = function (self)
	local level_settings = LevelSettings[self._level_key]

	if not level_settings.load_no_enemies then
		local enemy_package_loader = Managers.level_transition_handler.enemy_package_loader
		self.breed_freezer = BreedFreezer:new(self._world, Managers.state.entity, self._network_event_delegate, enemy_package_loader)
	end
end

ConflictDirector.update_client = function (self, dt, t)
	return
end

ConflictDirector.hot_join_sync = function (self, peer_id)
	if self.breed_freezer then
		self.breed_freezer:hot_join_sync(peer_id)
	end
end

ConflictDirector.set_peaks = function (self, peaks)
	self._peak_delayer:set_peaks(peaks)
end

ConflictDirector.get_peaks = function (self)
	return self._peak_delayer:get_peaks()
end

ConflictDirector.is_near_or_in_a_peak = function (self)
	return self._peak_delayer:is_near_or_in_a_peak()
end

ConflictDirector.spawn_breed_func = function (self, breed_name)
	local picked_enhancements = self._debug_spawn_breed_enhancements

	if picked_enhancements and next(picked_enhancements) then
		self:debug_spawn_variant(breed_name, picked_enhancements)

		return true
	end
end

ConflictDirector.debug_spawn_variant = function (self, breed_name, enhancement_list, num_enhancements)
	local breed = Breeds[breed_name]

	if enhancement_list then
		local enhancements = TerrorEventUtils.generate_enhanced_breed_from_list(enhancement_list)
		local additional_data = {
			enhancements = enhancements
		}

		return self:aim_spawning(breed, false, nil, nil, additional_data)
	elseif num_enhancements then
		local enhancements = TerrorEventUtils.generate_enhanced_breed(num_enhancements, breed_name)
		local additional_data = {
			enhancements = enhancements
		}

		return self:aim_spawning(breed, false, nil, nil, additional_data)
	end

	return breed
end

ConflictDirector.pick_enhancement = function (self, enhancement_name)
	print("Picked:", enhancement_name)
end

return
