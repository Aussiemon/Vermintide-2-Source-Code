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
require("scripts/settings/level_settings")
require("scripts/utils/perlin_noise")
require("scripts/utils/navigation_group_manager")
require("scripts/settings/syntax_watchdog")
require("scripts/settings/patrol_formation_settings")
require("scripts/utils/debug_list_picker")
require("scripts/utils/ik_chain")

local unit_alive = Unit.alive
local position_lookup = POSITION_LOOKUP
local player_units = PLAYER_UNITS
local player_positions = PLAYER_POSITIONS
local player_and_bot_units = PLAYER_AND_BOT_UNITS
local player_and_bot_positions = PLAYER_AND_BOT_POSITIONS
local BLACKBOARDS = BLACKBOARDS
local distance_squared = Vector3.distance_squared
local GameSettingsDevelopment = GameSettingsDevelopment
local RecycleSettings = RecycleSettings
local FORM_GROUPS_IN_ONE_FRAME = true
local script_data = script_data
script_data.debug_terror = script_data.debug_terror or Development.parameter("debug_terror")
script_data.ai_roaming_spawning_disabled = script_data.ai_roaming_spawning_disabled or Development.parameter("ai_roaming_spawning_disabled")
script_data.ai_specials_spawning_disabled = script_data.ai_specials_spawning_disabled or Development.parameter("ai_specials_spawning_disabled")
script_data.ai_horde_spawning_disabled = script_data.ai_horde_spawning_disabled or Development.parameter("ai_horde_spawning_disabled")
script_data.ai_pacing_disabled = script_data.ai_pacing_disabled or Development.parameter("ai_pacing_disabled")
script_data.ai_far_off_despawn_disabled = script_data.ai_far_off_despawn_disabled or Development.parameter("ai_far_off_despawn_disabled")
script_data.debug_player_positioning = script_data.debug_player_positioning or Development.parameter("debug_player_positioning")
ConflictDirector = class(ConflictDirector)
ConflictDirector.init = function (self, world, level_key, network_event_delegate)
	self._world = world
	self._time = 0
	self._spawned = {}
	self._spawned_lookup = {}
	self._num_spawned_by_breed = {}
	self._num_spawned_by_breed_during_event = {}
	self._spawned_units_by_breed = {}
	self._current_debug_list_index = 1
	self._debug_list = {
		"none"
	}
	local conflict_settings = script_data.override_conflict_settings or LevelSettings[level_key].conflict_settings or "default"

	self.set_updated_settings(self, conflict_settings)

	self.pacing = Pacing:new(world, CurrentConflictSettings.pacing)
	self.enemy_recycler = nil
	self.specials_pacing = nil
	self.navigation_group_manager = NavigationGroupManager:new()
	self._alive_specials = {}
	self._alive_bosses = {}
	self._next_pacing_update = Math.random()
	self._next_threat_update = self._next_pacing_update + 0.1
	self._living_horde = 0
	self._num_spawned_during_event = 0
	self._num_angry_bosses = 0
	self._next_horde_time = math.huge
	self._crumbs = {}
	self._player_directions = {}
	self._drop_crumb_time = 0
	self.world_gui = World.create_world_gui(world, Matrix4x4.identity(), 1, 1, "immediate", "material", "materials/fonts/gw_fonts")
	self._player_areas = {}

	self.reset_spawned_by_breed(self)
	self.reset_spawned_by_breed_during_event(self)
	TerrorEventMixer.reset()

	self._rushing_checks = {}
	self._next_rush_check_unit = nil
	self._next_rush_check = math.huge
	self.spawn_queue = {}
	self.first_spawn_index = 1
	self.spawn_queue_size = 0
	self.spawn_queue_id = 0
	self.main_path_player_info = {}
	self.main_path_info = {
		current_path_index = 1,
		behind_percent = 1,
		ahead_percent = 0,
		ahead_travel_dist = 0,
		main_path_player_info_index = 0,
		ahead_unit = player_units[1],
		behind_unit = player_units[1],
		player_info_by_travel_distance = {}
	}
	self._main_path_obstacles = {}
	self._next_progression_percent = 0.1
	self._next_outside_navmesh_intervention_time = 6.15
	self.outside_navmesh_intervention_data = {}
	self._next_rushing_intervention_time = 5.1
	self._rushing_intervention_travel_dist = 50
	self.rushing_intervention_data = {
		ahead_dist = 0,
		loneliness_value = 0
	}
	self.in_safe_zone = true
	self.disabled = false
	self._mini_patrol_state = "waiting"
	self._next_mini_patrol_timer = 15
	self.level_analysis = LevelAnalysis:new()
	self._network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, "rpc_terror_event_trigger_flow")

	self.frozen_intensity_decay_until = 0
	self.debug_breed_picker = DebugListPicker:new(DebugBreedSpawns, "debug_breed")
	self.threat_value = 0
	self.num_aggroed = 0
	local difficulty = Managers.state.difficulty:get_difficulty()
	self.delay_horde_threat_value = (CurrentPacing.delay_horde_threat_value and CurrentPacing.delay_horde_threat_value[difficulty]) or math.huge
	self.delay_mini_patrol_threat_value = (CurrentPacing.delay_mini_patrol_threat_value and CurrentPacing.delay_mini_patrol_threat_value[difficulty]) or math.huge
	self.delay_specials_threat_value = (CurrentPacing.delay_specials_threat_value and CurrentPacing.delay_specials_threat_value[difficulty]) or math.huge

	return 
end
ConflictDirector.rpc_terror_event_trigger_flow = function (self, sender, event_id)
	local flow_event = NetworkLookup.terror_flow_events[event_id]

	self.level_flow_event(self, flow_event)

	return 
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

	return 
end

ConflictDirector.alive_specials = function (self)
	return self._alive_specials
end
ConflictDirector.alive_bosses = function (self)
	return self._alive_bosses
end
ConflictDirector.reset_spawned_by_breed = function (self)
	for name, breed in pairs(Breeds) do
		self._num_spawned_by_breed[name] = 0
		self._spawned_units_by_breed[name] = {}
	end

	return 
end
ConflictDirector.reset_spawned_by_breed_during_event = function (self)
	for name, breed in pairs(Breeds) do
		self._num_spawned_by_breed_during_event[name] = 0
	end

	self._num_spawned_during_event = 0

	return 
end
ConflictDirector.destroy = function (self)
	self.navigation_group_manager:destroy(self._world)

	if self.nav_tag_volume_handler then
		self.nav_tag_volume_handler:destroy()

		self.nav_tag_volume_handler = nil
	end

	self.level_analysis:destroy()
	self._network_event_delegate:unregister(self)

	self._main_path_obstacles = nil

	if self.spawn_zone_baker then
		self.spawn_zone_baker:reset()
	end

	return 
end
local max_crumbs = 25
ConflictDirector.update_player_crumbs = function (self, t, dt)
	if self._drop_crumb_time < t then
		self._num_crumbs = (self._num_crumbs or 0) + 1

		for player_id = 1, #player_positions, 1 do
			local pos = player_positions[player_id]

			if not self._crumbs[player_id] then
				self._crumbs[player_id] = {
					Vector3Box(pos),
					current_index = 1
				}
			end

			local player_crumbs = self._crumbs[player_id]
			local last_pos = player_crumbs[player_crumbs.current_index]:unbox()

			if 1 < distance_squared(last_pos, pos) then
				player_crumbs.current_index = player_crumbs.current_index + 1

				if max_crumbs < player_crumbs.current_index then
					player_crumbs.current_index = 1
				end

				player_crumbs[player_crumbs.current_index] = Vector3Box(pos)
				local oldest_index = (player_crumbs.current_index - 2)%#player_crumbs + 1
				local oldest_pos = player_crumbs[oldest_index]

				if oldest_pos then
					self._player_directions[player_id] = Vector3Box(pos - oldest_pos.unbox(oldest_pos))
				end
			end
		end

		self._drop_crumb_time = t + 0.5
	end

	return 
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

	return 
end
ConflictDirector.init_rush_check = function (self, t)
	self.players_speeding_dist = 0
	self._next_rush_check = 0

	return 
end
ConflictDirector.are_players_rushing = function (self, t)
	if self._next_rush_check < t then
		local main_path_player_info = self.main_path_player_info
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

	return 
end
ConflictDirector.main_path_completion = function (self)
	local min_completion = 0

	for unit, data in pairs(self.main_path_player_info) do
		local move_percent = data.move_percent

		if move_percent and min_completion < move_percent then
			min_completion = move_percent
		end
	end

	return min_completion
end
ConflictDirector.sort_player_info_by_travel_distance = function (self, main_path_info, main_path_player_info)
	local player_info_by_travel_distance = main_path_info.player_info_by_travel_distance

	table.clear(player_info_by_travel_distance)

	local i = 0

	for unit, data in pairs(main_path_player_info) do
		i = i + 1
		player_info_by_travel_distance[i] = data
	end

	if 0 < i then
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

	return 
end
ConflictDirector.main_path_player_far_away_check = function (self, data, travel_dist, path_pos, pos, t)
	local far_away = 100 < math.abs(travel_dist - data.travel_dist)

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
ConflictDirector.update_main_path_player_info = function (self, t)
	local main_path_info = self.main_path_info

	if not main_path_info.main_paths then
		return 
	end

	Profiler.start("update_main_path_player_info")

	local main_path_player_info = self.main_path_player_info
	local index = main_path_info.main_path_player_info_index
	index = index + 1
	local num_units = #player_and_bot_units

	if num_units < index then
		index = 1
	end

	main_path_info.main_path_player_info_index = index
	local unit = player_and_bot_units[index]

	if unit then
		local pos = player_and_bot_positions[index]
		local data = main_path_player_info[unit]
		local main_paths = main_path_info.main_paths
		local path_pos, travel_dist, move_percent, sub_index, path_index = MainPathUtils.closest_pos_at_main_path(nil, pos)

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

		local far_away = self.main_path_player_far_away_check(self, data, travel_dist, path_pos, pos, t)

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

				if not script_data.override_conflict_settings and zone and self.current_conflict_settings ~= zone.conflict_setting.name then
					local new_conflict_setting = zone.conflict_setting.name

					self.check_updated_settings(self, new_conflict_setting)
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

	for unit, data in pairs(main_path_player_info) do
		if not unit_alive(unit) then
			main_path_player_info[unit] = nil
			recalc = true
		end
	end

	if recalc then
		self.sort_player_info_by_travel_distance(self, main_path_info, main_path_player_info)
	end

	Profiler.stop("update_main_path_player_info")

	if self.spawn_zone_baker.graph then
		Profiler.start("debug_ai_pacing")

		local ahead_unit = main_path_info.ahead_unit

		if ahead_unit then
			local data = main_path_player_info[ahead_unit]

			self.spawn_zone_baker:draw_player_in_density_graph(data.travel_dist)
		end

		Profiler.stop("debug_ai_pacing")
	end

	return 
end
ConflictDirector.get_main_path_player_data = function (self, unit)
	return self.main_path_player_info[unit]
end
ConflictDirector.get_index = function (self, number, mod)
	local index = math.floor(number)%mod

	if index == 0 then
		index = mod
	end

	return index
end
ConflictDirector.get_cluster_and_loneliness = function (self, min_dist)
	if self._cluster_and_loneliness[min_dist] then
		local stored = self._cluster_and_loneliness[min_dist]

		return stored[1], stored[2], stored[3], stored[4]
	end

	local positions = player_and_bot_positions
	local units = player_and_bot_units
	local cluster_utility, loneliness_index, loneliness_value = ConflictUtils.cluster_weight_and_loneliness(positions, min_dist or 10)
	local loneliest_player_unit = units[loneliness_index]
	local fill = FrameTable.alloc_table()
	fill[1] = cluster_utility
	fill[2] = positions[loneliness_index]
	fill[3] = loneliness_value
	fill[4] = loneliest_player_unit
	self._cluster_and_loneliness[min_dist] = fill

	return cluster_utility, positions[loneliness_index], loneliness_value, loneliest_player_unit
end
ConflictDirector.update_player_areas = function (self)
	Profiler.start("update_player_areas")

	local player_areas = self._player_areas

	table.clear_array(player_areas, #player_areas)

	if self.navigation_group_manager.operational then
		for i = 1, #player_units, 1 do
			local unit = player_units[i]
			local last_pos_on_mesh = ScriptUnit.extension(unit, "whereabouts_system").last_pos_on_nav_mesh:unbox()
			local area = self.navigation_group_manager:get_group_from_position(last_pos_on_mesh)

			if area then
				player_areas[i] = area
			else
				player_areas[i] = false
			end
		end
	end

	Profiler.stop("update_player_areas")

	return 
end

local function terror_print(...)
	if script_data.debug_terror then
		Debug.text(...)
	end

	return 
end

ConflictDirector.add_horde = function (self, amount, event_breed_name)
	self._living_horde = self._living_horde + amount

	if event_breed_name then
		local event_breed = self._spawned_units_by_breed_during_event[event_breed_name]
		event_breed[breed_name] = event_breed[breed_name] + 1
	end

	return 
end
ConflictDirector.set_master_event_running = function (self, event_name)
	if self.running_master_event ~= event_name then
		self.reset_spawned_by_breed_during_event(self)
	end

	self.running_master_event = event_name

	return 
end
ConflictDirector.spawned_during_event = function (self)
	return self._num_spawned_during_event
end
ConflictDirector.horde_size = function (self)
	return self._living_horde
end
ConflictDirector.horde_size_total = function (self)
	local spawner_system = Managers.state.entity:system("spawner_system")
	local num = self._living_horde + spawner_system.waiting_to_spawn(spawner_system)

	return num
end
ConflictDirector.has_horde = function (self)
	if self.horde_spawner then
		return self.horde_spawner:running_horde()
	end

	return 
end
ConflictDirector.mini_patrol = function (self, t, terror_event_id, composition_type, group_template)
	local strictly_not_close_to_players = true
	local limit_spawners = 1
	local silent = true
	self._last_mini_patrol_composition = composition_type

	self.horde_spawner:execute_event_horde(t, terror_event_id, composition_type, limit_spawners, silent, group_template, strictly_not_close_to_players)

	return 
end
ConflictDirector.mini_patrol_killed = function (self, id)
	print("Mini patrol killed!", id)

	return 
end
ConflictDirector.event_horde = function (self, t, terror_event_id, composition_type, limit_spawners, silent, group_template)
	if not script_data.ai_horde_spawning_disabled then
		local horde = self.horde_spawner:execute_event_horde(t, terror_event_id, composition_type, limit_spawners, silent, group_template)

		return horde
	end

	return 
end
ConflictDirector.check_updated_settings = function (self, new_conflict_setting)
	local script_data = script_data
	local current_conflict_settings = self.current_conflict_settings
	local script_data = script_data

	if script_data.override_conflict_settings and script_data.override_conflict_settings ~= current_conflict_settings then
		new_conflict_setting = script_data.override_conflict_settings
	end

	local should_update_settings = new_conflict_setting and current_conflict_settings ~= new_conflict_setting

	if WAS_RELOADED then
		should_update_settings = true
		new_conflict_setting = current_conflict_settings
		WAS_RELOADED = false
	end

	if should_update_settings then
		local level_settings = LevelHelper:current_level_settings()
		self.level_settings = level_settings
		local level_conflict_settings = level_settings.conflict_settings

		if level_conflict_settings and ConflictDirectors[level_conflict_settings].disabled then
			return 
		end

		local conflict_settings = new_conflict_setting or self.current_conflict_settings
		conflict_settings = conflict_settings or level_conflict_settings or "default"

		self.set_updated_settings(self, conflict_settings)
	end

	return 
end
ConflictDirector.patch_settings_with_difficulty = function (self, source_settings)
	local difficulty = Managers.state.difficulty.difficulty
	local overrides = source_settings.difficulty_overrides

	if overrides and overrides[difficulty] then
		local override_settings = overrides[difficulty]
		local patched_settings = {}

		for key, value in pairs(source_settings) do
			if key ~= "difficulty_overrides" then
				patched_settings[key] = override_settings[key] or source_settings[key]
			end
		end

		return patched_settings
	else
		return source_settings
	end

	return 
end
ConflictDirector.set_updated_settings = function (self, conflict_settings_name)
	assert(not ConflictDirectorSets[conflict_settings_name], "Should not get a ConflictDirectorSet in ConflictDirector:set_updated_settings")

	local director = ConflictDirectors[conflict_settings_name]
	CurrentConflictSettings = director
	self.current_conflict_settings = conflict_settings_name
	CurrentIntensitySettings = self.patch_settings_with_difficulty(self, director.intensity)
	CurrentPacing = self.patch_settings_with_difficulty(self, director.pacing)
	CurrentBossSettings = self.patch_settings_with_difficulty(self, director.boss)
	CurrentSpecialsSettings = self.patch_settings_with_difficulty(self, director.specials)
	CurrentHordeSettings = director.horde
	CurrentRoamingSettings = director.roaming
	CurrentPackSpawningSettings = director.pack_spawning
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

	return 
end
ConflictDirector.update_horde_pacing = function (self, t, dt)
	local pacing = self.pacing

	if pacing.horde_population(pacing) < 1 or pacing.pacing_state == "pacing_frozen" then
		self._next_horde_time = nil

		return 
	end

	if not self._next_horde_time then
		local pacing_setting = pacing.settings
		self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.horde_frequency)
	end

	if self._next_horde_time < t and not self.delay_horde then
		local horde_failed = true
		local num_spawned = #self._spawned
		horde_failed = RecycleSettings.push_horde_if_num_alive_grunts_above < num_spawned

		if horde_failed then
			local pacing_setting = pacing.settings

			if RecycleSettings.push_horde_in_time then
				print("Pushing horde in time; too many units out")

				self._next_horde_time = t + 5

				pacing.annotate_graph(pacing, "Pushed horde", "red")
			else
				print("Skipped horde; too many units out")

				self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.horde_frequency)

				pacing.annotate_graph(pacing, "Failed horde", "red")
			end

			return 
		end

		local wave = nil

		if script_data.ai_pacing_disabled then
			self._next_horde_time = math.huge
			self._multiple_horde_count = nil
			wave = "unknown"
		else
			local set_standard_horde = nil
			local pacing_setting = pacing.settings

			if pacing_setting.multiple_hordes then
				if self._multiple_horde_count then
					self._multiple_horde_count = self._multiple_horde_count - 1

					if self._multiple_horde_count <= 0 then
						print("HORDE: last wave, reset to standard horde delay")

						self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.max_delay_until_next_horde)
						self._multiple_horde_count = nil
						wave = "multi last wave"
					else
						local time_delay = ConflictUtils.random_interval(pacing_setting.multiple_horde_frequency)

						print("HORDE: next wave, multiple_horde_frequency -> Time delay", time_delay)

						self._next_horde_time = t + time_delay
						wave = "multi consecutive wave"
					end
				else
					self._multiple_horde_count = pacing_setting.multiple_hordes - 1
					self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.multiple_horde_frequency)
					wave = "multi first wave"
				end
			else
				self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.max_delay_until_next_horde)
				wave = "single wave"
			end
		end

		print("Time for new HOOORDE!")

		local multi_horde_type = self._multiple_horde_count
		local extra_data = {
			multiple_horde_count = self._multiple_horde_count,
			horde_wave = wave
		}

		self.horde_spawner:horde(nil, extra_data)
	end

	return 
end
ConflictDirector.horde_killed = function (self, wave)
	local count = self._multiple_horde_count

	if not count then
		local pacing_setting = self.pacing.settings
		local t = Managers.time:time("game")
		self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.horde_frequency)

		print("Horde killed: ", wave)
	else
		self._next_horde_time = 0

		print("Horde killed: ", wave)
	end

	return 
end
ConflictDirector.going_to_relax_state = function (self)
	self._multiple_horde_count = nil

	return 
end
ConflictDirector.get_horde_data = function (self)
	return self._next_horde_time, self.horde_spawner.hordes, self._multiple_horde_count
end
ConflictDirector.is_running_multiple_horde = function (self)
	local pacing = self.pacing
	local pacing_setting = pacing.settings
	local multiple_hordes_count = pacing_setting.multiple_hordes
	local is_first_multiple_horde = multiple_hordes_count and self._multiple_horde_count == multiple_hordes_count

	return self._multiple_horde_count ~= nil, is_first_multiple_horde
end
ConflictDirector.start_terror_event = function (self, event_name)
	TerrorEventMixer.add_to_start_event_list(event_name)

	return 
end
ConflictDirector.handle_alone_player = function (self, t)
	local data = self.rushing_intervention_data

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
		local _, _, loneliness_value, loneliest_player_unit = self.get_cluster_and_loneliness(self, 10)
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

				local success, message = self.specials_pacing:request_rushing_intervention(t, ahead_unit, main_path_info, self.main_path_player_info)

				if success then
					self.pacing:annotate_graph("Rush intervention - special", "red")

					data.message = "spawning: " .. message
				else
					data.message = message
				end

				local add_time = rush_intervention.delay_between_interventions

				if rush_intervention.loneliness_value_for_ambush_horde < loneliness_value and Math.random() < rush_intervention.chance_of_ambush_horde then
					print("rush intervention - ambush horde!")
					self.pacing:annotate_graph("Rush intervention - horde", "red")

					local extra_data = nil

					self.horde_spawner:execute_ambush_horde(extra_data, false, position_lookup[ahead_unit])

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

	return 
end

local function enough_aggro_for_outside_navmesh_intervention(boss_spawned)
	local outside_navmesh_intervention = CurrentSpecialsSettings.outside_navmesh_intervention
	local needed_ordinary_enemy_aggro = outside_navmesh_intervention.needed_ordinary_enemy_aggro
	local needed_special_enemy_aggro = outside_navmesh_intervention.needed_special_enemy_aggro
	local entity_manager = Managers.state.entity
	local ai_system = entity_manager.system(entity_manager, "ai_system")
	local num_ordinary_enemies_aggro = ai_system.number_ordinary_aggroed_enemies
	local num_special_enemies_aggro = ai_system.number_special_aggored_enemies
	local enough_aggro = boss_spawned or needed_ordinary_enemy_aggro <= num_ordinary_enemies_aggro or needed_special_enemy_aggro <= num_special_enemies_aggro

	return enough_aggro
end

ConflictDirector.handle_players_outside_navmesh = function (self, t)
	local boss_spawned = self.boss_event_running(self)
	local players_eligible_for_punishment = enough_aggro_for_outside_navmesh_intervention(boss_spawned)

	if players_eligible_for_punishment then
		local entity_manager = Managers.state.entity
		local ai_slot_system = entity_manager.system(entity_manager, "ai_slot_system")
		local outside_navmesh_intervention = CurrentSpecialsSettings.outside_navmesh_intervention
		local data = self.outside_navmesh_intervention_data
		local num_players = #player_and_bot_units

		for i = 1, num_players, 1 do
			local player_unit = player_and_bot_units[i]

			if ai_slot_system.has_target_been_outside_navmesh_too_long(ai_slot_system, player_unit, t) then
				data.outside_unit = player_unit
				local success, message = self.specials_pacing:request_outside_navmesh_intervention(player_unit)
				data.message = message

				if success then
					self.pacing:annotate_graph("Outside navmesh intervention - special", "red")

					local add_time = outside_navmesh_intervention.delay_between_interventions
					self._next_outside_navmesh_intervention_time = t + add_time
				end

				break
			end
		end
	end

	return 
end
ConflictDirector.respawn_level = function (self)
	self.destroy_all_units(self)

	local pack_types = nil
	self._spawn_pos_list, self._pack_sizes, self._pack_rotations, pack_types, self._zone_data_list = self.generate_spawns(self)

	self.enemy_recycler:setup(self._spawn_pos_list, self._pack_sizes, self._pack_rotations, pack_types, self._zone_data_list)
	self.level_analysis:generate_boss_paths()
	self.level_analysis:reset_debug()

	self.main_path_info.main_paths = self.level_analysis:get_main_paths()

	self.spawn_zone_baker:draw_pack_density_graph()

	return 
end
ConflictDirector.create_debug_list = function (self)
	self._debug_list = {
		"none",
		self.pacing,
		self.spawn_zone_baker
	}

	return 
end
ConflictDirector.update_mini_patrol = function (self, t, dt)
	local pacing = self.pacing
	local settings = pacing.settings.mini_patrol
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
		local mini_patrol_ok = pacing.total_intensity <= settings.only_spawn_below_intensity and settings.only_spawn_above_intensity <= pacing.total_intensity and 0 <= RecycleSettings.max_grunts - #self._spawned and not self.delay_mini_patrol

		if mini_patrol_ok then
			self._next_mini_patrol_timer = t + 5
			local composition = CurrentHordeSettings.mini_patrol_composition
			local mini_patrol_override = self.level_settings.mini_patrol_override

			if mini_patrol_override then
				composition = mini_patrol_override.composition
			end

			print("spawning mini patrol")

			local group_template = {
				size = 0,
				template = "mini_patrol",
				id = Managers.state.entity:system("ai_group_system"):generate_group_id()
			}

			self.mini_patrol(self, t, nil, composition, group_template)

			self._mini_patrol_state = "spawning"
		else
			self._next_mini_patrol_timer = t + 2
		end
	end

	if script_data.debug_mini_patrols then
		Debug.text("Mini patrol: active=%s, timer=%.1f last=[%s]", tostring(self._mini_patrol_state), self._next_mini_patrol_timer - t, tostring(self._last_mini_patrol_composition))
	end

	return 
end
ConflictDirector.reset_data = function (self)
	self._cluster_and_loneliness = FrameTable.alloc_table()

	return 
end
ConflictDirector.update = function (self, dt, t)
	self._time = t

	if script_data.debug_enabled and World.get_data(self._world, "paused") then
		self.update_server_debug(self, t, dt)

		return 
	end

	if #player_positions == 0 then
		return 
	end

	if self.level_analysis then
		self.level_analysis:update(t, dt)
		self.update_main_path_player_info(self, t)
	end

	if self.disabled then
		return 
	end

	local script_data = script_data

	self.check_updated_settings(self)

	local conflict_settings = CurrentConflictSettings

	if conflict_settings.disabled then
		return 
	end

	if self._next_threat_update < t then
		self.calculate_threat_value(self)

		self._next_threat_update = t + 1
	end

	local pacing = self.pacing

	if not script_data.ai_pacing_disabled and not conflict_settings.pacing.disabled then
		if self._next_pacing_update < t then
			Profiler.start("pacing")
			pacing.update(pacing, t, dt, player_and_bot_units)

			self._next_pacing_update = t + 1
			local pacing_state = pacing.get_state(pacing)

			if pacing_state == "pacing_relax" then
				local rushing = self.are_players_rushing(self, t)

				if rushing then
					if CurrentPacing.leave_relax_if_rushing then
						print("players are progressing too fast, leave relax")
						pacing.advance_pacing(pacing, t, "players are rushing")
					end

					if CurrentPacing.horde_in_relax_if_rushing then
						print("players are progressing too fast, punish with a horde")

						self._next_horde_time = t
					end
				end
			end

			Profiler.stop("pacing")
		end

		Profiler.start("player rush")

		if not script_data.ai_rush_intervention_disabled and self._next_rushing_intervention_time < t then
			self._next_rushing_intervention_time = t + 1

			self.handle_alone_player(self, t)
		end

		Profiler.stop("player rush")
	end

	if self.in_safe_zone then
		local game_mode_manager = Managers.state.game_mode
		local round_started = game_mode_manager.is_round_started(game_mode_manager)

		if round_started then
			print("Players are leaving the safe zone")

			self.in_safe_zone = false

			if self.specials_pacing then
				self.specials_pacing:start(t)

				if not script_data.ai_pacing_disabled then
					local pacing_setting = pacing.settings
					self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.horde_startup_time)
				end
			end
		end
	else
		if not conflict_settings.specials.disabled then
			if not conflict_settings.specials.outside_navmesh_intervention.disabled and not script_data.ai_outside_navmesh_intervention_disabled and self._next_outside_navmesh_intervention_time < t then
				Profiler.start("players outside navmesh")

				self._next_outside_navmesh_intervention_time = t + 1

				self.handle_players_outside_navmesh(self, t)
				Profiler.stop("players outside navmesh")
			end

			if self.specials_pacing and not script_data.ai_specials_spawning_disabled then
				Profiler.start("specials pacing")

				local specials_population = pacing.specials_population(pacing)

				self.specials_pacing:update(t, self._alive_specials, specials_population, player_and_bot_positions)
				Profiler.stop("specials pacing")
			end
		end

		if not script_data.ai_horde_spawning_disabled and not conflict_settings.horde.disabled then
			Profiler.start("horde pacing")
			self.update_horde_pacing(self, t, dt)
			Profiler.stop("horde pacing")
		else
			local pacing_setting = pacing.settings
			self._next_horde_time = t + ConflictUtils.random_interval(pacing_setting.horde_frequency)
		end

		if not script_data.ai_mini_patrol_disabled and self.level_settings.use_mini_patrols then
			local pacing_state = pacing.pacing_state

			if pacing_state == "pacing_build_up" then
				Profiler.start("mini_patrol")
				self.update_mini_patrol(self, t, dt)
				Profiler.stop("mini_patrol")
			end
		end

		Profiler.start("hordes")

		if self.horde_spawner then
			self.horde_spawner:update(t, dt)
		end

		Profiler.stop("hordes")
	end

	if self.director_is_ai_ready then
		Profiler.start("TerrorEventMixer")

		local ai_system = Managers.state.entity:system("ai_system")

		TerrorEventMixer.update(t, dt, ai_system.ai_debugger and ai_system.ai_debugger.screen_gui)
		Profiler.stop("TerrorEventMixer")
	elseif not FORM_GROUPS_IN_ONE_FRAME and self.navigation_group_manager.form_groups_running then
		Profiler.start("form_groups_update")

		local done = self.navigation_group_manager:form_groups_update()

		if done then
			self.ai_nav_groups_ready(self)
		end

		Profiler.stop("form_groups_update")
	end

	local recycler_positions = player_positions

	if self.enemy_recycler and not script_data.ai_roaming_spawning_disabled and not conflict_settings.roaming.disabled then
		local threat_population = pacing.threat_population(pacing)
		local available_to_spawn = RecycleSettings.max_grunts - #self._spawned

		if available_to_spawn <= 0 then
			threat_population = 0
		end

		local use_player_areas = self.navigation_group_manager.operational

		if script_data.recycler_in_freeflight then
			if script_data.recycler_in_cutscene then
				local player_manager = Managers.player
				local player = player_manager.local_player(player_manager, 1)
				local freeflight_pos = Managers.state.camera:camera_position(player.viewport_name)

				if freeflight_pos then
					recycler_positions = {
						freeflight_pos
					}
					use_player_areas = false
				end
			else
				local freeflight_pos = self.get_free_flight_pos(self)

				if freeflight_pos then
					recycler_positions = {
						freeflight_pos
					}
					use_player_areas = false
				end
			end
		end

		self.update_player_areas(self)
		self.enemy_recycler:update(t, dt, recycler_positions, threat_population, self._player_areas, use_player_areas)
	end

	self.enemy_recycler:update_main_path_events(t)
	self.update_spawn_queue(self, t)

	if self.enemy_recycler and not script_data.ai_far_off_despawn_disabled then
		self.enemy_recycler:far_off_despawn(t, dt, recycler_positions, self._spawned)
	end

	if script_data.debug_enabled then
		self.update_server_debug(self, t, dt)
	end

	if self._spline_groups_to_spawn then
		for spline_name, group_data in pairs(self._spline_groups_to_spawn) do
			local ai_group_system = Managers.state.entity:system("ai_group_system")
			local spline_ready = ai_group_system.spline_ready(ai_group_system, spline_name)

			if spline_ready then
				self._spawn_spline_group(self, group_data)

				self._spline_groups_to_spawn[spline_name] = nil
			end
		end
	end

	return 
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

		assert(d, "Missing spawn_queue item")

		if d[10] == queue_id then
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

	assert(f, "Spawn_queue id not found")

	return 
end
ConflictDirector.update_spawn_queue = function (self, t)
	local script_data = script_data

	if script_data.debug_ai_recycler then
		local s = ""

		for i = self.first_spawn_index, (self.first_spawn_index + self.spawn_queue_size) - 1, 1 do
			s = s .. self.spawn_queue[i][10] .. ","
		end

		if 0 < self.spawn_queue_size then
			Debug.text("SPAWN QUEUE: s=" .. self.spawn_queue_size .. " ,i=" .. self.first_spawn_index .. " > " .. s)
		else
			Debug.text("SPAWN QUEUE: s=" .. self.spawn_queue_size .. " ,i=" .. self.first_spawn_index .. " EMPTY")
		end

		local deletion_queue = Managers.state.unit_spawner.deletion_queue

		if deletion_queue.last < deletion_queue.first then
			Debug.text("DELETION QUEUE: [ EMPTY ]")
		else
			Debug.text("DELETION QUEUE: [ " .. deletion_queue.first .. "->" .. deletion_queue.last .. " ]")
		end
	end

	if 0 < self.spawn_queue_size then
		local first_spawn_index = self.first_spawn_index
		local spawn_queue = self.spawn_queue
		local d = spawn_queue[first_spawn_index]
		local unit = self.spawn_unit(self, d[1], d[2]:unbox(), d[3]:unbox(), d[4], d[5], d[6], d[7], d[8])
		first_spawn_index = first_spawn_index + 1
		self.spawn_queue_size = self.spawn_queue_size - 1
		local unit_data = d[9]

		if unit_data then
			unit_data[1] = unit
		end

		self.first_spawn_index = first_spawn_index

		if self.spawn_queue_size == 0 then
			self.first_spawn_index = 1
		end
	end

	return 
end
local dialogue_system_init_data = {
	faction = "enemy"
}
ConflictDirector.spawn_unit = function (self, breed, spawn_pos, spawn_rot, spawn_category, spawn_animation, spawn_type, optional_data, group_data)
	Profiler.start("conflict spawn unit")

	local breed_unit_field = (script_data.use_optimized_breed_units and breed.opt_base_unit) or breed.base_unit
	local base_unit_name = (type(breed_unit_field) == "string" and breed_unit_field) or breed_unit_field[Math.random(#breed_unit_field)]
	local unit_template = breed.unit_template
	local entity_manager = Managers.state.entity
	local nav_world = entity_manager.system(entity_manager, "ai_system"):nav_world()
	optional_data = optional_data or {}
	local inventory_init_data = nil

	if breed.has_inventory then
		inventory_init_data = {
			optional_spawn_data = optional_data,
			inventory_template = breed.default_inventory_template,
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

	dialogue_system_init_data.breed_name = breed.name
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()

	Profiler.start("create ai extensions")

	local health = breed.max_health and breed.max_health[difficulty_rank]
	local extension_init_data = {
		health_system = {
			health = health
		},
		ai_system = {
			size_variation = 1,
			size_variation_normalized = 1,
			breed = breed,
			nav_world = nav_world,
			spawn_type = spawn_type,
			spawn_category = spawn_category,
			optional_spawn_data = optional_data
		},
		locomotion_system = {
			nav_world = nav_world
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
		aim_system = aim_init_data
	}

	if optional_data.prepare_func then
		optional_data.prepare_func(breed, extension_init_data)
	end

	Profiler.stop("create ai extensions")
	Profiler.start("spawn ai_unit")

	local spawn_pose = Matrix4x4.from_quaternion_position(spawn_rot, spawn_pos)
	local size_variation_range = breed.size_variation_range

	if size_variation_range then
		local size_normalized = Math.random()
		local size = math.lerp(size_variation_range[1], size_variation_range[2], size_normalized)
		extension_init_data.ai_system.size_variation = size
		extension_init_data.ai_system.size_variation_normalized = size_normalized

		Matrix4x4.set_scale(spawn_pose, Vector3(size, size, size))
	end

	local ai_unit, go_id = Managers.state.unit_spawner:spawn_network_unit(base_unit_name, unit_template, extension_init_data, spawn_pose)

	Profiler.stop("spawn ai_unit")

	local breed_name = breed.name
	local level_settings = self.level_settings
	local climate_type = level_settings.climate_type or "default"

	Unit.set_flow_variable(ai_unit, "climate_type", climate_type)
	Unit.flow_event(ai_unit, "climate_type_set")
	Managers.telemetry.events:ai_spawned(breed.name, spawn_pos)

	local blackboard = BLACKBOARDS[ai_unit]
	blackboard.spawn_animation = spawn_animation
	blackboard.spawn = true
	blackboard.optional_spawn_data = optional_data
	self._spawned[#self._spawned + 1] = ai_unit
	self._spawned_lookup[ai_unit] = #self._spawned
	self._num_spawned_by_breed[breed_name] = self._num_spawned_by_breed[breed_name] + 1
	self._spawned_units_by_breed[breed_name][ai_unit] = ai_unit

	if self.running_master_event and spawn_category ~= "enemy_recycler" then
		blackboard.event_spawned = true
		self._num_spawned_by_breed_during_event[breed_name] = self._num_spawned_by_breed_during_event[breed_name] + 1
		self._num_spawned_during_event = self._num_spawned_during_event + 1

		Managers.state.event:trigger("ai_unit_spawned", breed_name, blackboard.confirmed_player_sighting, true)
	else
		Managers.state.event:trigger("ai_unit_spawned", breed_name, blackboard.confirmed_player_sighting, false)
	end

	if breed.spawn_stinger then
		local wwise_world = Managers.world:wwise_world(self._world)
		local wwise_playing_id, wwise_source_id = WwiseWorld.trigger_event(wwise_world, breed.spawn_stinger)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_server_audio_event", NetworkLookup.sound_events[breed.spawn_stinger])
	end

	local locomotion_extension = blackboard.locomotion_extension

	if locomotion_extension then
		locomotion_extension.ready(locomotion_extension, go_id, blackboard)
	end

	Profiler.stop("conflict spawn unit")

	return ai_unit
end
ConflictDirector.set_disabled = function (self, state)
	self.disabled = state

	return 
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
	return self._num_spawned_by_breed_during_event[breed_name] or 0
end
ConflictDirector.add_unit_to_bosses = function (self, unit)
	self._alive_bosses[#self._alive_bosses + 1] = unit

	return 
end
ConflictDirector.remove_unit_from_bosses = function (self, unit)
	remove_element_from_array(self._alive_bosses, unit)

	return 
end
ConflictDirector._remove_unit_from_spawned = function (self, unit, blackboard, do_not_trigger_despawn_event)
	local spawned_lookup = self._spawned_lookup
	local index = spawned_lookup[unit]

	if not index then
		printf("ERROR: REMOVE UNIT FROM SPAWNED:(traceback) %q", tostring(unit))
		print(Unit.get_data(unit, "traceback"))
		print(Script.callstack())

		return 
	end

	local breed = blackboard.breed

	if blackboard.spawn_type == "horde" or blackboard.spawn_type == "horde_hidden" then
		self.add_horde(self, -1)
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
		Managers.state.event:trigger("ai_unit_despawned", breed_name, blackboard.confirmed_player_sighting, blackboard.event_spawned)
	end

	return 
end
local threat_values = {}

for breed_name, data in pairs(Breeds) do
	threat_values[breed_name] = data.threat_value or 0

	if not data.threat_value then
		fassert(false, "missing threat in breed %s", breed_name)
	end
end

ConflictDirector.get_threat_value = function (self)
	return self.threat_value, self.num_aggroed
end
ConflictDirector.calculate_threat_value = function (self)
	local threat_value = 0
	local i = 0
	local activated_per_breed = Managers.state.performance:activated_per_breed()

	for breed_name, amount in pairs(activated_per_breed) do
		threat_value = threat_value + threat_values[breed_name]*amount
		i = i + amount
	end

	self.delay_horde = self.delay_horde_threat_value < threat_value
	self.delay_mini_patrol = self.delay_mini_patrol_threat_value < threat_value
	self.delay_specials = self.delay_specials_threat_value < threat_value
	self.threat_value = threat_value
	self.num_aggroed = i

	return 
end
ConflictDirector.register_unit_killed = function (self, unit, blackboard, killer_unit, killing_blow)
	self._remove_unit_from_spawned(self, unit, blackboard)
	self.pacing:enemy_killed(unit, player_and_bot_units)

	local breed = blackboard.breed
	local breed_name = breed.name
	local death_pos = POSITION_LOOKUP[unit]

	Managers.telemetry.events:ai_died(breed_name, death_pos)

	return 
end
ConflictDirector.destroy_unit = function (self, unit, blackboard, reason)
	if Unit.alive(unit) then
		local breed = blackboard.breed
		local breed_name = breed.name
		local despawn_pos = POSITION_LOOKUP[unit]

		Managers.telemetry.events:ai_despawned(breed_name, despawn_pos, reason)
		self._remove_unit_from_spawned(self, unit, blackboard)
		Managers.state.unit_spawner:mark_for_deletion(unit)

		if breed.run_on_despawn then
			Profiler.start("run_on_despawn")
			breed.run_on_despawn(unit, blackboard)
			Profiler.stop("run_on_despawn")
		end
	end

	return 
end
ConflictDirector.destroy_all_units = function (self, except_immune)
	print("ConflictDirector - destroy all units")

	local network_manager = Managers.state.network

	if not network_manager.game(network_manager) then
		return 
	end

	local BLACKBOARDS = BLACKBOARDS
	local spawned = self._spawned
	local num_spawned = #spawned

	for k = num_spawned, 1, -1 do
		local unit = spawned[k]

		if Unit.alive(unit) then
			local blackboard = BLACKBOARDS[unit]
			local breed = blackboard.breed

			if not except_immune or not breed.debug_despawn_immunity then
				local reason = "destroy_all_units"
				local breed_name = breed.name
				local despawn_pos = POSITION_LOOKUP[unit]

				Managers.telemetry.events:ai_despawned(breed_name, despawn_pos, reason)
				self._remove_unit_from_spawned(self, unit, blackboard, true)
				Managers.state.unit_spawner:mark_for_deletion(unit)

				if breed.run_on_despawn then
					Profiler.start("run_on_despawn")
					breed.run_on_despawn(unit, blackboard)
					Profiler.stop("run_on_despawn")
				end
			end
		end
	end

	Managers.state.event:trigger("ai_units_all_destroyed")

	self._living_horde = 0

	return 
end
ConflictDirector.destroy_close_units = function (self, except_unit, dist_squared)
	local network_manager = Managers.state.network

	if not network_manager.game(network_manager) then
		return 
	end

	print("debug destroy close units")

	local player_manager = Managers.player
	local player = player_manager.player_from_peer_id(player_manager, Network.peer_id())
	local player_unit = player.player_unit
	local player_pos = Unit.local_position(player_unit, 0)
	local spawned = self._spawned
	local list_size = #spawned
	local i = 1
	local BLACKBOARDS = BLACKBOARDS

	while i <= list_size do

		-- decompilation error in this vicinity
		local unit = spawned[i]
		local remove_unit = nil

		if unit_alive(unit) and unit ~= except_unit then
			local unit_pos = Unit.local_position(unit, 0)
			remove_unit = distance_squared(player_pos, unit_pos) < dist_squared
		else
			remove_unit = false
		end
	end

	return 
end
ConflictDirector.destroy_specials = function (self)
	print("debug destroy specials")

	local alive_specials = self._alive_specials
	local num_alive_specials = #alive_specials
	local BLACKBOARDS = BLACKBOARDS

	for k = num_alive_specials, 1, -1 do
		local unit = alive_specials[k]

		if Unit.alive(unit) then
			local blackboard = BLACKBOARDS[unit]
			local breed = blackboard.breed
			local reason = "destroy_specials"
			local breed_name = breed.name
			local despawn_pos = POSITION_LOOKUP[unit]

			Managers.telemetry.events:ai_despawned(breed_name, despawn_pos, reason)
			self._remove_unit_from_spawned(self, unit, blackboard)
			Managers.state.unit_spawner:mark_for_deletion(unit)

			if breed.run_on_despawn then
				Profiler.start("run_on_despawn")
				breed.run_on_despawn(unit, blackboard)
				Profiler.stop("run_on_despawn")
			end
		end
	end

	assert(#self._alive_specials == 0, "Something bad happend when debug despawned all specials")

	for _, player_unit in ipairs(player_and_bot_units) do
		local status_extension = ScriptUnit.extension(player_unit, "status_system")

		if status_extension.pack_master_status and status_extension.pack_master_status == "pack_master_hanging" then
			StatusUtils.set_grabbed_by_pack_master_network("pack_master_dropping", player_unit, true, nil)
		end
	end

	return 
end
ConflictDirector.get_debug_breed = function (self)
	local breed_name = self.debug_breed_picker:current_item_name()
	local breed = Breeds[breed_name]

	return breed
end
ConflictDirector.get_debug_breed_name = function (self)
	return self.debug_breed_picker:current_item_name()
end
ConflictDirector.debug_spawn_breed = function (self, t, delayed, override_pos)
	local breed = self.get_debug_breed(self)

	if not breed then
		local item = self.debug_breed_picker:current_item()
		local text = item[1]
		local func_name = item[2]

		print("Debug spawning func:", text)

		if func_name and self[func_name] then
			self[func_name](self, item[3], item[4], item[5])
		end

		return 
	end

	print("Debug spawning: " .. breed.name)

	local pos = nil
	local debug_func_name = breed.debug_spawn_func_name

	if debug_func_name then
		pos = self[debug_func_name](self, breed, false, delayed, override_pos)
	else
		pos = self.aim_spawning(self, breed, false, delayed, override_pos)
	end

	return pos
end
ConflictDirector.debug_spawn_all_breeds = function (self, except_these_breeds, use_except_list_as_spawn_list)
	local pos = self.aim_spawning(self, nil, true)
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
			local offset = Vector3(math.random()*4 - 2, math.random()*4 - 2, 0)

			if j == 1 then
				offset = Vector3(-grid_size/2 + i%grid_size, -grid_size/2 + math.floor(i/grid_size), 0)
			end

			spawn_pos = LocomotionUtils.pos_on_mesh(self.nav_world, pos + offset)

			if spawn_pos then
				local breed = breed_list[i]

				self.spawn_queued_unit(self, breed, Vector3Box(spawn_pos), QuaternionBox(rot), "debug_spawn", nil, nil, nil)

				break
			end
		end
	end

	return 
end
ConflictDirector.debug_spawn_breed_at_hidden_spawner = function (self, t)
	local breed = self.get_debug_breed(self)
	self._show_switch_breed = t + 1

	print("Debug spawning from hidden spawner: " .. breed.name)

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
		slot8 = self.spawn_unit(self, breed, spawn_pos, rot, spawn_category, nil)
	end

	return 
end
ConflictDirector.debug_spawn_group = function (self, t)
	local breed = self.get_debug_breed(self)

	if not breed then
		print("no breed selected, can't spawn a group")

		return 
	end

	print("Spawning group: " .. breed.name)
	self.aim_spawning_group(self, breed, true)

	return 
end
ConflictDirector.debug_spawn_group_at_main_path = function (self, main_path_index, sub_node_index)
	local breed = Breeds.skaven_storm_vermin
	breed.far_off_despawn_immunity = true
	local patrol_template = "storm_vermin_formation_patrol"
	RecycleSettings.destroy_los_distance_squared = math.huge
	local main_paths = self.main_path_info.main_paths
	local main_path = (main_path_index and main_paths[main_path_index]) or main_paths[math.random(1, #main_paths)]
	local sub_node = (sub_node_index and main_path.nodes[sub_node_index]) or main_path.nodes[math.random(1, #main_path.nodes)]
	Debug.storm_vermin_patrols_done = nil
	local data = {
		group_type = "main_path_patrol",
		breed = breed
	}

	self.spawn_group(self, patrol_template, sub_node.unbox(sub_node), data)

	return 
end
ConflictDirector.debug_spawn_horde = function (self)
	if self.in_safe_zone then
		print("Can't spawn horde in safe zone")

		return 
	end

	local kind = script_data.ai_set_horde_type_debug

	if not kind or kind == "random" then
		self.horde_spawner:horde()
	else
		self.horde_spawner:horde(kind)
	end

	return 
end
ConflictDirector.debug_outside_navmesh_intervention = function (self, t)
	local entity_manager = Managers.state.entity
	local ai_system = entity_manager.system(entity_manager, "ai_system")
	local ai_slot_system = entity_manager.system(entity_manager, "ai_slot_system")
	local outside_navmesh = false
	local num_players = #player_and_bot_units

	for i = 1, num_players, 1 do
		local player_unit = player_and_bot_units[i]

		if ai_slot_system.has_target_been_outside_navmesh_too_long(ai_slot_system, player_unit, t) then
			outside_navmesh = true

			break
		end
	end

	local outside_navmesh_intervention = CurrentSpecialsSettings.outside_navmesh_intervention
	local needed_ordinary_enemy_aggro = outside_navmesh_intervention.needed_ordinary_enemy_aggro
	local needed_special_enemy_aggro = outside_navmesh_intervention.needed_special_enemy_aggro
	local boss_spawned = self.boss_event_running(self)
	local num_ordinary_enemies_aggro = ai_system.number_ordinary_aggroed_enemies
	local num_special_enemies_aggro = ai_system.number_special_aggored_enemies
	local player_eligible_for_punish = boss_spawned or needed_ordinary_enemy_aggro <= num_ordinary_enemies_aggro or needed_special_enemy_aggro <= num_special_enemies_aggro
	local data = self.outside_navmesh_intervention_data
	local outside_unit = data.outside_unit

	if unit_alive(outside_unit) then
		local player_manager = Managers.player
		local player = player_manager.unit_owner(player_manager, outside_unit)
		data.outside_unit_name = player.profile_display_name(player)
	else
		data.outside_unit_name = "?"
	end

	local countdown = math.clamp(self._next_outside_navmesh_intervention_time - t, 0, 999999)

	if data.disabled then
		Debug.text("Outside Navmesh: %s ", data.disabled)
	else
		Debug.text("Outside Navmesh Intervention: Enough aggro = %s, Outside navmesh = %s, Number aggroed (%d ordinary, %d special, boss = %s) - %s (%s) time: %.1f ", tostring(player_eligible_for_punish), tostring(outside_navmesh), num_ordinary_enemies_aggro, num_special_enemies_aggro, tostring(boss_spawned), data.outside_unit_name, tostring(data.message), countdown)
	end

	return 
end
ConflictDirector.player_aim_raycast = function (self, world, only_breed, filter)
	local player_manager = Managers.player
	local player = player_manager.local_player(player_manager, 1)
	local player_unit = player.player_unit
	local result = nil
	local in_free_flight = Managers.free_flight:active("global")

	if in_free_flight then
		local input_service = Managers.free_flight.input_manager:get_service("FreeFlight")
		local data = Managers.free_flight.data.global
		local world = Managers.world:world(data.viewport_world_name)
		local physics_world = World.get_data(world, "physics_world")
		local viewport = ScriptWorld.global_free_flight_viewport(world)
		local camera = data.frustum_freeze_camera or ScriptViewport.camera(viewport)
		local mouse = input_service.get(input_service, "cursor")
		local position = Camera.screen_to_world(camera, Vector3(mouse.x, mouse.y, 0), 0)
		local direction = Camera.screen_to_world(camera, Vector3(mouse.x, mouse.y, 0), 1) - position
		local raycast_dir = Vector3.normalize(direction)
		result = PhysicsWorld.immediate_raycast(physics_world, position, raycast_dir, 100, "all", "collision_filter", filter)
	else
		local camera_position = Managers.state.camera:camera_position(player.viewport_name)
		local camera_rotation = Managers.state.camera:camera_rotation(player.viewport_name)
		local camera_direction = Quaternion.forward(camera_rotation)
		local filter = filter or "filter_ray_projectile"
		local physics_world = World.get_data(world, "physics_world")
		result = PhysicsWorld.immediate_raycast(physics_world, camera_position, camera_direction, 100, "all", "collision_filter", filter)
	end

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

	local position, distance, normal, actor = self.player_aim_raycast(self, self._world, only_breed, "filter_ray_horde_spawn")

	if not position then
		return 
	end

	local spawn_pos = position

	QuickDrawerStay:sphere(spawn_pos, 0.33, Color(255, 0, 0))

	local spawn_category = "debug_spawn"
	local rot = Quaternion(Vector3.up(), math.degrees_to_radians(math.random(1, 360)))
	local optional_data = breed.debug_spawn_optional_data
	local unit = self.spawn_unit(self, breed, spawn_pos, rot, spawn_category, nil, nil, optional_data)

	if breed.special then
		self._alive_specials[#self._alive_specials + 1] = unit
	end

	local entity_manager = Managers.state.entity
	local ai_system = entity_manager.system(entity_manager, "ai_system")

	if ai_system.ai_debugger and not AiUtils.unit_alive(ai_system.ai_debugger.active_unit) and not script_data.ai_disable_auto_ai_debugger_target then
		ai_system.ai_debugger.active_unit = unit
		script_data.debug_unit = unit
	end

	return 
end
ConflictDirector.aim_spawning_surface = function (self, breed, on_navmesh, optional_delayed, optional_override_pos)
	local position, distance, normal, actor = self.player_aim_raycast(self, self._world, false, "filter_ray_horde_spawn")

	if breed.inside_wall_spawn_distance then
		position = position - normal*breed.inside_wall_spawn_distance
	end

	local spawn_category = "debug_spawn"
	local rot = Quaternion.look(normal, Vector3.up())
	local optional_data = breed.debug_spawn_optional_data
	local unit = self.spawn_unit(self, breed, position, rot, spawn_category, nil, nil, optional_data)

	if breed.special then
		self._alive_specials[#self._alive_specials + 1] = unit
	end

	local entity_manager = Managers.state.entity
	local ai_system = entity_manager.system(entity_manager, "ai_system")

	if ai_system.ai_debugger and not AiUtils.unit_alive(ai_system.ai_debugger.active_unit) and not script_data.ai_disable_auto_ai_debugger_target then
		ai_system.ai_debugger.active_unit = unit
		script_data.debug_unit = unit
	end

	return 
end
ConflictDirector.aim_spawning = function (self, breed, on_navmesh, optional_delayed, optional_override_pos)
	local position, distance, normal, actor = self.player_aim_raycast(self, self._world, false, "filter_ray_horde_spawn")

	if optional_delayed then
		return position
	elseif optional_override_pos then
		position = optional_override_pos
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
		local optional_data = breed.debug_spawn_optional_data
		local unit = self.spawn_unit(self, breed, spawn_pos, rot, spawn_category, nil, nil, optional_data)

		if breed.special then
			self._alive_specials[#self._alive_specials + 1] = unit
		end

		local entity_manager = Managers.state.entity
		local ai_system = entity_manager.system(entity_manager, "ai_system")

		if ai_system.ai_debugger and not AiUtils.unit_alive(ai_system.ai_debugger.active_unit) and not script_data.ai_disable_auto_ai_debugger_target then
			ai_system.ai_debugger.active_unit = unit
			script_data.debug_unit = unit
		end
	else
		return spawn_pos
	end

	return 
end
ConflictDirector.spawn_roaming_patrol = function (self)
	local position, distance, normal, actor = self.player_aim_raycast(self, self._world, false, "filter_ray_horde_spawn")

	if not position then
		return 
	end

	local ai_group_system = Managers.state.entity:system("ai_group_system")
	local level_has_roaming_splines = ai_group_system.level_has_splines(ai_group_system, "roaming")

	if level_has_roaming_splines then
		local formation = PatrolFormationSettings.random_roaming_formation(BreedPacks.standard[6])
		local spline_name = ai_group_system.get_best_spline(ai_group_system, position, "roaming")

		if not spline_name then
			Debug.sticky_text("no roaming spline within max distance")

			return 
		end

		local spline_way_points = {
			Vector3Box(28, -243, 0),
			Vector3Box(37, -143, 0)
		}
		local data = {
			group_type = "roaming_patrol",
			formation = formation,
			spline_name = spline_name,
			spline_way_points = spline_way_points
		}

		self.spawn_spline_group(self, "spline_patrol", position, data)
	end

	return 
end
ConflictDirector.aim_patrol_spawning = function (self, formation_name)
	self.aim_spawning_group(self, nil, true, formation_name)

	return 
end
ConflictDirector.inject_event_patrol = function (self)
	local spline_name, spline_data, start_pos = self.conflict_director.level_analysis:get_closest_roaming_spline(area_position:unbox())

	if not spline_name then
		return false
	end

	local waypoints = spline_data.waypoints
	local spline_waypoints = self.boxify_waypoint_table(self, waypoints)

	return 
end
ConflictDirector.aim_spawning_group = function (self, breed, on_navmesh, formation_name)
	local position, distance, normal, actor = self.player_aim_raycast(self, self._world, false, "filter_ray_horde_spawn")

	if not position then
		return 
	end

	if script_data.debug_storm_vermin_patrol then
		QuickDrawerStay:sphere(position, 0.5, Colors.get("crimson"))
	end

	if breed == Breeds.skaven_clan_rat or breed == Breeds.skaven_slave then
		local data = {
			wanted_size = 50,
			group_type = "grid",
			breed = breed
		}

		self.spawn_group(self, "storm_vermin_formation_patrol", position, data)
	else
		local ai_group_system = Managers.state.entity:system("ai_group_system")
		local spline_type = ai_group_system.get_available_spline_type(ai_group_system)

		if spline_type then
			local difficulty = Managers.state.difficulty:get_difficulty()
			local formation = PatrolFormationSettings[formation_name][difficulty]
			formation.settings = PatrolFormationSettings[formation_name].settings
			local spline_name, spline_data, start_pos, waypoints = nil

			if spline_type == "event" then
				spline_name, spline_data, start_pos = self.level_analysis:get_closest_event_spline(position)

				if not spline_name then
					print("no event spline found")

					return 
				end

				waypoints = self.level_analysis:boxify_waypoint_table(spline_data.waypoints)
			else
				spline_name = ai_group_system.get_best_spline(ai_group_system, position, spline_type)
				waypoints = {
					Vector3Box(110, 0, 0),
					Vector3Box(1, -220, 0)
				}
			end

			local data = {
				group_type = "spline_patrol",
				formation = formation,
				spline_name = spline_name,
				spline_way_points = waypoints
			}

			self.spawn_spline_group(self, "spline_patrol", position, data)
		else
			local data = {
				group_type = "main_path_patrol",
				breed = breed or Breeds.skaven_storm_vermin
			}

			self.spawn_group(self, "storm_vermin_formation_patrol", position, data)
		end
	end

	return 
end
local spawn_group_positions = {}
ConflictDirector.spawn_group = function (self, patrol_template_name, position, data)
	local group_type = data.group_type
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local wanted_size = data.wanted_size or difficulty_settings.amount_storm_vermin_patrol
	local num_attempts = 8
	local group_size = 0
	local spawn_in_grid = group_type == "grid"
	local grid_size = math.ceil(math.sqrt(wanted_size))

	for i = 1, wanted_size, 1 do
		local spawn_pos = nil

		for j = 1, num_attempts, 1 do
			local offset = Vector3(Math.random()*4 - 2, Math.random()*4 - 2, 0)

			if spawn_in_grid and j == 1 then
				offset = Vector3(-grid_size/2 + i%grid_size, -grid_size/2 + math.floor(i/grid_size), 0)
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

	for i = 1, group_size, 1 do
		local spawn_pos = spawn_group_positions[i]
		local spawn_breed = data.breed

		self.spawn_queued_unit(self, spawn_breed, Vector3Box(spawn_pos), QuaternionBox(rot), spawn_category, nil, nil, nil, group_data)
	end

	return 
end
ConflictDirector.spawn_spline_group = function (self, patrol_template_name, position, data)
	local group_type = data.group_type
	local spline_name = data.spline_name
	local formation = data.formation
	local despawn_at_end = data.despawn_at_end
	local ai_group_system = Managers.state.entity:system("ai_group_system")
	local group_start_position = position and Vector3Box(position)
	local base_group_data = {
		id = ai_group_system.generate_group_id(ai_group_system),
		template = patrol_template_name,
		spline_name = spline_name,
		formation = formation,
		group_type = group_type,
		group_start_position = group_start_position,
		data = data,
		despawn_at_end = despawn_at_end
	}
	local spline = ai_group_system.spline(ai_group_system, spline_name)

	if spline then
		print("Spline already found!")
		self._spawn_spline_group(self, base_group_data)
	elseif data.spline_way_points then
		ai_group_system.create_spline_from_way_points(ai_group_system, spline_name, data.spline_way_points, data.spline_type)

		self._spline_groups_to_spawn = self._spline_groups_to_spawn or {}
		self._spline_groups_to_spawn[spline_name] = base_group_data
	else
		print("Missing spline:", spline_name)
		assert(false)
	end

	return 
end
ConflictDirector._spawn_spline_group = function (self, base_group_data)
	local spawn_category = "patrol"
	local formation = base_group_data.formation
	local spline_name = base_group_data.spline_name
	local despawn_at_end = base_group_data.despawn_at_end
	local ai_group_system = Managers.state.entity:system("ai_group_system")
	local group_start_position = base_group_data.group_start_position and base_group_data.group_start_position:unbox()
	local start_position = group_start_position or ai_group_system.spline_start_position(ai_group_system, spline_name)
	local formation_data = ai_group_system.create_formation_data(ai_group_system, start_position, formation, spline_name)
	base_group_data.formation = formation_data
	base_group_data.group_start_position = Vector3Box(start_position)
	local group_size = formation_data.group_size

	if group_size == 0 then
		return 
	end

	base_group_data.size = group_size

	for row, columns in ipairs(formation_data) do
		for column, data in ipairs(columns) do
			local breed_name = data.breed_name

			if not Breeds[breed_name] then
			else
				local spawn_pos = data.start_position:unbox()
				local direction = data.start_direction:unbox()
				local rotation = Quaternion.look(direction, Vector3.up())
				local spawn_breed = Breeds[breed_name]
				local group_data = table.clone(base_group_data)
				group_data.breed = breed_name
				group_data.group_position = {
					row = row,
					column = column
				}
				group_data.despawn_at_end = despawn_at_end
				spawn_breed.far_off_despawn_immunity = true

				self.spawn_queued_unit(self, spawn_breed, Vector3Box(spawn_pos), QuaternionBox(rotation), spawn_category, nil, nil, nil, group_data)
			end
		end
	end

	return 
end
ConflictDirector.spawn_one = function (self, breed, optional_pos, group_data, optional_data)
	local spawn_category = "spawn_one"
	local center_pos = player_positions[1]
	local spawn_pos = optional_pos or ConflictUtils.get_spawn_pos_on_circle(self.nav_world, center_pos, 20, 8, 30)

	if spawn_pos then
		local rot = Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360)))
		local unit = self.spawn_queued_unit(self, breed, Vector3Box(spawn_pos), QuaternionBox(rot), spawn_category, nil, nil, optional_data, group_data)

		return unit
	end

	return 
end
ConflictDirector.spawn_at_raw_spawner = function (self, breed, spawner_id, optional_data)
	local spawner_system = Managers.state.entity:system("spawner_system")
	local spawner_unit, optional_idle_animation = spawner_system.get_raw_spawner_unit(spawner_system, spawner_id)

	if spawner_unit then
		local pos = Unit.local_position(spawner_unit, 0)
		local rot = Unit.local_rotation(spawner_unit, 0)
		optional_data = optional_data or {}
		optional_data.idle_animation = optional_idle_animation
		local ai_unit = self.spawn_unit(self, breed, pos, rot, "raw_spawner", nil, nil, optional_data, nil, optional_idle_animation)
		local play_go_tutorial_system = Managers.state.entity:system("play_go_tutorial_system")

		if play_go_tutorial_system then
			play_go_tutorial_system.register_unit(play_go_tutorial_system, spawner_unit, ai_unit)
		end
	end

	return 
end
ConflictDirector.generate_spawns = function (self)
	local pos_list, pack_sizes, pack_rotations, pack_types, zone_data_list = nil
	local _, finish_point = self.level_analysis:get_start_and_finish()

	assert(finish_point, "Missing path marker at the end of the level")

	local triangle = GwNavTraversal.get_seed_triangle(self.nav_world, finish_point.unbox(finish_point))

	assert(triangle, "The path marker at the end of the level is outside the navmesh")
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

	if self.spawn_zone_baker.spawn_zones_available then
		local level_settings = self.level_settings
		local goal_density = 0.5
		local conflict_settings_name = level_settings.conflict_settings or "default"
		local conflict_setting = ConflictDirectors[conflict_settings_name]
		local pack_spawning_setting = conflict_setting.pack_spawning or PackSpawningSettings.default
		local basics = pack_spawning_setting.basics
		local spawn_cycle_length = basics.spawn_cycle_length
		local area_density_coefficient = pack_spawning_setting.area_density_coefficient
		local length_density_coefficient = basics.length_density_coefficient
		pos_list, pack_sizes, pack_rotations, pack_types, zone_data_list = self.spawn_zone_baker:generate_spawns(spawn_cycle_length, goal_density, area_density_coefficient, length_density_coefficient, conflict_settings_name)

		return pos_list, pack_sizes, pack_rotations, pack_types, zone_data_list
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

	return 
end
ConflictDirector.ai_ready = function (self)
	local t = Managers.time:time("game")

	print("CurrentConflictSettings", self.current_conflict_settings)

	if CurrentConflictSettings.disabled then
		Managers.state.event:trigger("conflict_director_setup_done")

		return 
	end

	print("[ConflictDirector] conflict_director is ai_ready")

	self.level_settings = LevelHelper:current_level_settings()
	local entity_manager = Managers.state.entity
	self.nav_world = entity_manager.system(entity_manager, "ai_system"):nav_world()
	self.patrol_analysis = PatrolAnalysis:new(self.nav_world, false, QuickDrawerStay)
	local ai_group_system = Managers.state.entity:system("ai_group_system")

	ai_group_system.ai_ready(ai_group_system, self.patrol_analysis)

	self.nav_tag_volume_handler = NavTagVolumeHandler:new(self._world, self.nav_world)
	self.level_analysis.nav_world = self.nav_world
	self.level_analysis.level_settings = self.level_settings
	self.spawn_zone_baker = SpawnZoneBaker:new(self._world, self.nav_world, self.level_analysis)

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
	self.specials_pacing = SpecialsPacing:new(self.nav_world)
	local start = {
		self.level_analysis:get_start_and_finish()
	}

	assert(start, "The path marker at the start of level is outside nav mesh")

	local pack_types = nil
	self._spawn_pos_list, self._pack_sizes, self._pack_rotations, self.pack_types, self._zone_data_list = self.generate_spawns(self)

	if FORM_GROUPS_IN_ONE_FRAME then
		self.ai_nav_groups_ready(self)
	end

	return 
end
ConflictDirector.ai_nav_groups_ready = function (self)
	self.enemy_recycler = EnemyRecycler:new(self._world, self.nav_world, self._spawn_pos_list, self._pack_sizes, self._pack_rotations, self.pack_types, self._zone_data_list)

	self.level_analysis:set_enemy_recycler(self.enemy_recycler)

	self.horde_spawner = HordeSpawner:new(self._world, self.level_analysis.cover_points_broadphase)
	local insert_bosses = self.spawn_zone_baker:loaded_spawn_zones_available()

	if insert_bosses then
		self.level_analysis:generate_boss_paths()
	end

	self.in_safe_zone = true
	self.director_is_ai_ready = true

	Managers.state.event:trigger("conflict_director_setup_done")
	self.create_debug_list(self)

	return 
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

	return 
end
ConflictDirector.freeze_intensity_decay = function (self, freeze_time)
	self.frozen_intensity_decay_until = self._time + freeze_time

	return 
end
ConflictDirector.intensity_decay_frozen = function (self, freeze_time)
	return self._time < self.frozen_intensity_decay_until
end
ConflictDirector.boss_event_running = function (self)
	return 0 < self._num_spawned_by_breed.skaven_rat_ogre
end
ConflictDirector.angry_boss = function (self)
	return 0 < self._num_angry_bosses
end
ConflictDirector.add_angry_boss = function (self, amount, blackboard)
	self._num_angry_bosses = math.clamp(self._num_angry_bosses + amount, 0, 255)

	if blackboard then
		AiUtils.activate_unit(blackboard)
	end

	return 
end
ConflictDirector.level_flow_event = function (self, event_name)
	LevelHelper:flow_event(self._world, event_name)

	return 
end
ConflictDirector.update_server_debug = function (self, t, dt)
	Profiler.start("Conflict Server Debug")
	ConflictDirectorTests.update(self, t, dt)

	if script_data.debug_current_threat_value then
		local value, num = self.get_threat_value(self)

		Debug.text("DELAY: HORDE %s, SPECIALS %s, MINI_PATROL %s, Threat value: %d, num aggroed: %d", tostring(self.delay_horde), tostring(self.delay_specials), tostring(self.delay_mini_patrol), value, num)
	end

	if DebugKeyHandler.key_pressed("y", "test cover points", "ai", "left shift") then
		if false then
			local bp = self.level_analysis.cover_points_broadphase
			local green = Color(255, 0, 240, 0)
			local red = Color(255, 240, 0, 0)
			local found_units = {}

			Broadphase.query(bp, player_positions[1], 20, found_units)

			local player_pos = player_positions[1]

			for i = 1, #found_units, 1 do
				local unit = found_units[i]
				local pos = Unit.local_position(unit, 0)
				local rot = Unit.local_rotation(unit, 0)
				local to_cover_point = Vector3.normalize(player_pos - pos)
				local valid = 0.9 < Vector3.dot(Quaternion.forward(rot), to_cover_point)

				if valid then
					QuickDrawerStay:sphere(pos, 1, green)
					QuickDrawerStay:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot)*2 + Vector3(0, 0, 1), green)
				else
					QuickDrawerStay:sphere(pos, 1, red)
					QuickDrawerStay:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot)*2 + Vector3(0, 0, 1), red)
				end
			end
		end

		self.specials_pacing:get_special_spawn_pos()
	end

	if script_data.show_current_conflict_settings then
		Debug.text("Current ConflictSettings [%s]", CurrentConflictSettings.name)
	end

	if self.ik_tentacle then
		self.ik_tentacle:set_target_pos(PLAYER_POSITIONS[1] + Vector3(0, 0, 1), 2)
		self.ik_tentacle:solve(t, dt)
	end

	if DebugKeyHandler.key_pressed("t", "test terror", "ai", "left shift") then
		print("Pressed t")
		print("Creating tentacle")

		local start_pos = PLAYER_POSITIONS[1] + Vector3(1, 0, 0)
		local target_pos = PLAYER_POSITIONS[1] + Vector3(0, 0, 1)
		local joints = {}

		for i = 1, 30, 1 do
			joints[i] = Vector3(0, 0, i*0.5)
		end

		self.ik_tentacle = IkChain:new(joints, start_pos, target_pos, 0.01, 0.8)

		self.ik_tentacle:solve(t, dt)

		return 

		local main_path_info = self.main_path_info
		local ahead_unit = main_path_info.ahead_unit
		local spawn_pos = self.aim_spawning(self, nil, true)

		if not spawn_pos then
			return 
		end

		local to_target = POSITION_LOOKUP[ahead_unit] - spawn_pos
		local spawn_rot = Quaternion.look(to_target, Vector3.up())
		local unit_name = "units/beings/enemies/chaos_sorcerer_fx/chr_chaos_sorcerer_fx"
		local extension_init_data = {
			area_damage_system = {
				damage_wave_template_name = "plague_wave",
				source_unit = ahead_unit
			}
		}
		local damage_wave_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "damage_wave_unit", extension_init_data, spawn_pos, spawn_rot)
		local wave_extension = ScriptUnit.extension(damage_wave_unit, "area_damage_system")

		wave_extension.launch_wave(wave_extension, ahead_unit)

		return 

		local debug_breed = self.get_debug_breed(self)

		if debug_breed == Breeds.skaven_clan_rat or debug_breed == Breeds.skaven_slave or debug_breed == Breeds.skaven_storm_vermin then
			local event_data = {}

			TerrorEventMixer.start_event("steady_70_horde", event_data)
		else
			Debug.sticky_text("Can't spawn horde of breed type %s", self.get_debug_breed_name(self))
		end
	end

	if DebugKeyHandler.key_pressed("f", "toggle debug graphs", "ai", "left shift") then
		local size = #self._debug_list

		for i = 2, size, 1 do
			local a = self._debug_list[i]

			a.show_debug(a, false)
		end

		for i = 1, size, 1 do
			local index = self._current_debug_list_index%size + 1

			if index == 1 then
				self._current_debug_list_index = index

				break
			else
				local a = self._debug_list[index]

				if a.show_debug(a, true) then
					self._current_debug_list_index = index

					break
				end
			end
		end
	end

	if DebugKeyHandler.key_pressed("g", "execute debug graphs", "ai", "left shift") then
		local f = self._debug_list[self._current_debug_list_index]

		if f and f.execute_debug then
			f.execute_debug(f)
		end
	end

	if script_data.show_alive_ai then
		Profiler.start("show_alive_ai")
		ConflictUtils.display_number_of_breeds("TOTAL: ", #self._spawned, self._num_spawned_by_breed)

		if self.running_master_event then
			local num_spawned = 0

			for breed_name, amount in pairs(self._num_spawned_by_breed_during_event) do
				num_spawned = num_spawned + amount
			end

			ConflictUtils.display_number_of_breeds("EVENT: ", num_spawned, self._num_spawned_by_breed_during_event)
		end

		Profiler.stop("show_alive_ai")
	end

	if script_data.show_where_ai_is then
		ConflictUtils.show_where_ai_is(self._spawned)
	end

	if self.director_is_ai_ready then
		self.navigation_group_manager:print_groups(self._world, self.nav_world)
	end

	local debug_breed_name = self.get_debug_breed_name(self)

	if DebugKeyHandler.key_pressed("o", "switch spawn breed", "ai") then
		self.debug_breed_picker:activate()
	end

	self.debug_breed_picker:update(t, dt)

	if DebugKeyHandler.key_pressed("p", "spawn " .. debug_breed_name, "ai", "left ctrl") then
		self.debug_spawn_group(self, t)
	elseif DebugKeyHandler.key_pressed("p", "spawn " .. debug_breed_name, "ai", "right ctrl") then
		self.spawn_roaming_patrol(self)
	elseif DebugKeyHandler.key_pressed("p", "spawn " .. debug_breed_name, "ai", "left alt") then
		self.debug_spawn_group_at_main_path(self, nil, nil)
	elseif DebugKeyHandler.key_pressed("p", "spawn " .. debug_breed_name, "ai") then
		self.debug_spawn_breed(self, t)
	elseif DebugKeyHandler.key_pressed("p", "spawn " .. debug_breed_name, "ai", "left shift") then
		local pos = self.debug_spawn_breed(self, t, true)

		if pos then
			self._debug_spawn_breed_pos = Vector3Box(pos)
			self._debug_spawn_breed_delayed = t + 3
		end
	elseif DebugKeyHandler.key_pressed("o", "spawn hidden " .. debug_breed_name, "ai", "left ctrl") then
		self.debug_spawn_breed_at_hidden_spawner(self, t)
	end

	if self._debug_spawn_breed_delayed and self._debug_spawn_breed_delayed < t then
		self._debug_spawn_breed_delayed = nil

		self.debug_spawn_breed(self, t, false, self._debug_spawn_breed_pos:unbox())
	end

	if DebugKeyHandler.key_pressed("i", "unspawn all AIs", "ai") then
		self.destroy_all_units(self, true)
	end

	if DebugKeyHandler.key_pressed("u", "unspawn close AIs", "ai") then
		self.destroy_close_units(self, nil, 144)
	end

	if DebugKeyHandler.key_pressed("m", "unspawn all AI specials", "ai") then
		self.destroy_specials(self)
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
			local index = MainPathUtils.zone_segment_on_mainpath(main_paths, PLAYER_POSITIONS[1])

			self.spawn_zone_baker:draw_zones(self.nav_world, index)
			Debug.text("Draw Zone-segment: %d (last_naive)", index)
		end
	end

	if script_data.debug_ai_pacing then
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

		if unit_alive(data.ahead_unit) then
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

	if not self.in_safe_zone and script_data.debug_outside_navmesh_intervention then
		self.debug_outside_navmesh_intervention(self, t)
	end

	local test = false

	if test then
		if DebugKeyHandler.key_pressed("r", "test", "ai") then
			print("ASTAR")

			local start, goal = self.level_analysis:get_start_and_finish()
			local tri1 = GwNavTraversal.get_seed_triangle(self.nav_world, player_positions[1])
			local tri2 = GwNavTraversal.get_seed_triangle(self.nav_world, goal.unbox(goal))

			if not tri1 or not tri2 then
				return false
			end

			local group1 = self.navigation_group_manager:get_polygon_group(tri1)
			local group2 = self.navigation_group_manager:get_polygon_group(tri2)
			local nav_groups = self.navigation_group_manager._navigation_groups
			local path, length = LuaAStar.a_star_plain(nav_groups, group1, group2)
			self.path = path

			print("Generated path:", #path, length)
		end

		if self.path then
			local path = self.path
			local old_pos = nil

			for i = 1, #path, 1 do
				local pos = path[i]:get_group_center():unbox()

				QuickDrawer:sphere(pos, 2)

				if old_pos then
					QuickDrawer:line(pos + Vector3(0, 0, 1), old_pos + Vector3(0, 0, 1), Color(255, 244, 143, 7))
				end

				old_pos = pos
			end
		end
	end

	if DebugKeyHandler.key_pressed("h", "spawn_horde", "ai") then
		self.debug_spawn_horde(self)
	end

	if DebugKeyHandler.key_pressed("a", "force target switch", "ai", "left shift") then
		local unit = script_data.debug_unit

		if unit_alive(unit) then
			local ai_base_extension = ScriptUnit.extension(unit, "ai_system")
			local blackboard = ai_base_extension.blackboard(ai_base_extension)
			blackboard.target_changed = true
		end
	end

	if script_data.debug_ai_pacing then
		for unit, data in pairs(self._rushing_checks) do
			ConflictUtils.draw_stack_of_balls(data.start_pos:unbox(), 255, 255, 30, 0)

			local path_data = self.main_path_player_info[unit]

			if path_data.path_pos then
				ConflictUtils.draw_stack_of_balls(path_data.path_pos:unbox(), 255, 30, 255, 0)
			end
		end
	end

	if script_data.debug_near_cover_points then
		ConflictUtils.hidden_cover_points(player_positions[1], PLAYER_POSITIONS, 1, 35, nil)
	end

	if script_data.debug_player_positioning then
		local cluster_utility, lonliness_pos, loneliness_value, lonliest_player_unit = self.get_cluster_and_loneliness(self, 10)

		if lonliest_player_unit then
			QuickDrawer:sphere(position_lookup[lonliest_player_unit], 0.88)
		end

		local cluster_radius = 7
		local clusters, sizes = ConflictUtils.cluster_positions(player_and_bot_positions, cluster_radius)

		for i = 1, #clusters, 1 do
			QuickDrawer:sphere(clusters[i], cluster_radius)

			for j = 1, sizes[i], 1 do
				QuickDrawer:sphere(clusters[i] + Vector3(0, 0, j + 2), 0.6)
			end
		end

		local main_path_info = self.main_path_info
		local ahead_unit = main_path_info.ahead_unit
		local dist_to_intervention = 0

		for slot19, slot20 in pairs(self.main_path_player_info) do
		end

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

			local ap = main_path_info.ahead_percent*100
			local np = self._next_progression_percent*100

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

	Profiler.stop("Conflict Server Debug")

	return 
end
local colors = {
	{
		30,
		30,
		30
	},
	{
		45,
		45,
		45
	},
	{
		60,
		60,
		60
	},
	{
		85,
		85,
		85
	},
	{
		100,
		100,
		100
	},
	{
		115,
		115,
		115
	},
	{
		130,
		130,
		130
	},
	{
		145,
		145,
		145
	},
	{
		160,
		160,
		160
	},
	{
		175,
		175,
		175
	},
	{
		190,
		190,
		190
	},
	{
		205,
		205,
		205
	},
	{
		220,
		220,
		220
	},
	{
		235,
		235,
		235
	},
	{
		255,
		255,
		255
	}
}
local cylinder_obstacles = {}
local cylinder_state = "spawn"
local cut_type = "soft"
ConflictDirector.spawn_mesh_cut = function (self)
	local world = self._world
	local nav_world = self.nav_world
	local position, distance, normal, actor = self.player_aim_raycast(self, world, false, "filter_ray_horde_spawn")

	if not position then
		print("No spawn pos found")

		return 
	end

	for o, _ in pairs(cylinder_obstacles) do
		GwNavCylinderObstacle.set_does_trigger_tagvolume(o, false)
		GwNavCylinderObstacle.remove_from_world(o)
		GwNavCylinderObstacle.destroy(o)
	end

	table.clear(cylinder_obstacles)

	local spawn_pos = LocomotionUtils.pos_on_mesh(self.nav_world, position)

	if not spawn_pos then
		print("No mesh found at spawn pos")

		return 
	end

	local xc = 1
	local yc = 2
	local cell_size = 2
	local radius = cell_size/2 + 0.3

	for i = -xc, xc, 1 do
		for j = -yc, yc, 1 do
			local pos = spawn_pos + Vector3(i*cell_size, j*cell_size, -1)

			QuickDrawerStay:sphere(pos, radius)

			local o = nil

			if cut_type == "soft" then
				o = GwNavCylinderObstacle.create(nav_world, pos, 3, radius, false, Color(255, 255, 0), LAYER_ID_MAPPING.fire_grenade)

				GwNavCylinderObstacle.add_to_world(o)
				GwNavCylinderObstacle.set_does_trigger_tagvolume(o, true)
			elseif cut_type == "hard" then
				o = GwNavCylinderObstacle.create_exclusive(nav_world, pos, 3, radius)

				GwNavCylinderObstacle.add_to_world(o)
				GwNavCylinderObstacle.set_does_trigger_tagvolume(o, true)
			else
				local t = GwNavTraversal.get_seed_triangle(nav_world, pos)
				local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, t)

				GwNavTraversal.get_neighboring_triangles(poly)
				GwNavNavTagVolume.create(nav_world, poly_line, pos.z - 2, pos.z + 2, false, Color(0, 200, 45), LAYER_ID_MAPPING.fire_grenade)
			end

			cylinder_obstacles[o] = true
		end
	end

	return 
end

return 
