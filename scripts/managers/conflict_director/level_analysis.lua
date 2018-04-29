-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
LevelAnalysis = class(LevelAnalysis)

require("scripts/utils/util")

LevelAnalysis.init = function (self, nav_world, using_editor)
	self.nav_world = nav_world
	self.using_editor = using_editor
	self.cover_points_broadphase = Broadphase(40, 512)
	self.chosen_crossroads = {}
	self.used_roaming_waypoints = {}
	self.generic_ai_node_units = {}
	local terror_spawners = {
		event_boss = {
			spawners = {},
			level_sections = {}
		},
		event_patrol = {
			spawners = {},
			level_sections = {}
		}
	}
	self.terror_spawners = terror_spawners
	self.override_spawners = {}
	self.boss_settings_section = {}
	self.num_override_spawners = 0

	if using_editor then
		self.set_random_seed(self)
	end

	return 
end
LevelAnalysis.set_random_seed = function (self, checkpoint_data, override_seed)
	local seed = nil
	seed = (not checkpoint_data or checkpoint_data.seed) and (override_seed or math.random_seed())
	self.starting_seed = seed
	self.seed = seed

	print("[LevelAnalysis] set_random_seed( " .. self.starting_seed .. ")")

	return 
end
LevelAnalysis.create_checkpoint_data = function (self)
	return {
		seed = self.starting_seed
	}
end
LevelAnalysis._random = function (self, ...)
	local seed, value = Math.next_random(self.seed, ...)
	self.seed = seed

	return value
end
LevelAnalysis._random_float_interval = function (self, a, b)
	local seed, value = Math.next_random(self.seed)
	local value = a + (b - a) * value
	self.seed = seed

	return value
end
LevelAnalysis.destroy = function (self)
	if self.traverse_logic ~= nil then
		GwNavTagLayerCostTable.destroy(self.navtag_layer_cost_table)
		GwNavCostMap.destroy_tag_cost_table(self.nav_cost_map_cost_table)
		GwNavTraverseLogic.destroy(self.traverse_logic)
	end

	if self.astar_list then
		for i = 1, #self.astar_list, 1 do
			local a_star = astar_list[i][1]

			if not GwNavAStar.processing_finished(self.astar_list[i]) then
				GwNavAStar.cancel(self.astar_list[i])
			end

			GwNavAStar.destroy(self.astar_list[i])
		end
	end

	EngineOptimized.unregister_main_path()

	return 
end
LevelAnalysis.set_enemy_recycler = function (self, enemy_recycler)
	self.enemy_recycler = enemy_recycler

	return 
end
LevelAnalysis.get_start_and_finish = function (self)
	return self.start, self.finish
end
LevelAnalysis.get_path_markers = function (self)
	return self.path_markers
end
LevelAnalysis.get_data_via_editor = function (self, path_markers)
	local index_offset = Script.index_offset()
	local level_objects = LevelEditor.objects

	for object_id, object in pairs(level_objects) do
		local unit = object._unit

		if Unit.alive(unit) and Unit.is_a(unit, "units/gamemode/path_marker") then
			local pos = Unit.local_position(unit, index_offset)
			local order = Unit.get_data(unit, "order")
			local marker_type = Unit.get_data(unit, "marker_type")
			local crossroads_string = Unit.get_data(unit, "crossroads")
			local roaming_set_string = Unit.get_data(unit, "roaming_set")
			local order = tonumber(order)
			local index = #path_markers + 1
			local kind = "good"
			local on_mesh = GwNavTraversal.get_seed_triangle(self.nav_world, pos)

			if not on_mesh then
				kind = "outside"
				result = string.format("Path marker with order %s is outside of navigation mesh.", tostring(order))
			end

			for i = 1, #path_markers, 1 do
				if order < path_markers[i].order then
					index = i
					kind = kind or "good"

					break
				elseif order == path_markers[i] then
					index = i
					kind = kind or "duplicate"
					result = string.format("Two path markers in the level has the same order: %s", tostring(order))

					break
				end
			end

			table.insert(path_markers, index, {
				main_path_index = 1,
				pos = Vector3Box(pos),
				marker_type = marker_type,
				order = order,
				kind = kind,
				crossroads = crossroads_string,
				roaming_set = roaming_set_string,
				conflict_director = roaming_set_string
			})
		end
	end

	return 
end
LevelAnalysis.generate_main_path = function (self, level_name, path_markers, in_editor)
	local result = "success"

	if not path_markers then
		path_markers = {}

		if not level_name then
			local level_key = Managers.state.game_mode:level_key()
			level_name = LevelSettings[level_key].level_name
		end

		print("[LevelAnalysis] Generating main-path for level:", level_name)

		if in_editor then
			self.get_data_via_editor(self, path_markers)
		else
			local unit_ind = LevelResource.unit_indices(level_name, "units/gamemode/path_marker")

			for _, id in ipairs(unit_ind) do
				local pos = LevelResource.unit_position(level_name, id)
				local unit_data = LevelResource.unit_data(level_name, id)
				local order = DynamicData.get(unit_data, "order")
				local marker_type = DynamicData.get(unit_data, "marker_type")
				local crossroads_string = DynamicData.get(unit_data, "crossroads")
				local roaming_set_string = DynamicData.get(unit_data, "roaming_set")
				local order = tonumber(order)
				local index = #path_markers + 1
				local kind = "good"
				local on_mesh = GwNavTraversal.get_seed_triangle(self.nav_world, pos)

				if not on_mesh then
					kind = "outside"
					result = string.format("Path marker with order %s is outside of navigation mesh.", tostring(order))
				end

				for i = 1, #path_markers, 1 do
					if order < path_markers[i].order then
						index = i
						kind = kind or "good"

						break
					elseif order == path_markers[i] then
						index = i
						kind = kind or "duplicate"
						result = string.format("Two path markers in the level has the same order: %s", tostring(order))

						break
					end
				end

				table.insert(path_markers, index, {
					main_path_index = 1,
					pos = Vector3Box(pos),
					marker_type = marker_type,
					order = order,
					kind = kind,
					crossroads = crossroads_string,
					roaming_set = roaming_set_string,
					conflict_director = roaming_set_string
				})
			end
		end
	else
		print("[LevelAnalysis] path markers aready generated")
	end

	if #path_markers < 2 then
		return "Missing path markers in level. Need at least 2."
	end

	local done = false

	while not done do
		done = true

		for i = 1, #path_markers - 1, 1 do
			if path_markers[i + 1].order < path_markers[i].order then
				local temp = path_markers[i]
				path_markers[i] = path_markers[i + 1]
				path_markers[i + 1] = temp
				done = false
			end
		end
	end

	print("[LevelAnalysis] Path-markers:")

	local main_path_index = 1
	local num_crossroads = 0
	local crossroads = {}
	local count = 0

	for i = 1, #path_markers, 1 do
		local path_marker = path_markers[i]

		print("read path_marker crossroad: ", path_marker.crossroads)

		if path_marker.crossroads and path_marker.crossroads ~= "" then
			local parts = string.split(path_marker.crossroads, ":")
			local crossroads_id = parts[1]
			local road_id = tonumber(parts[2])

			assert(road_id, "bad road_id")

			path_marker.crossroads_id = crossroads_id
			path_marker.road_id = road_id
			local crossroad = crossroads[crossroads_id]

			if not crossroad then
				crossroad = {
					num_roads = 0,
					main_path_index = main_path_index,
					roads = {}
				}
				crossroads[crossroads_id] = crossroad
				num_crossroads = num_crossroads + 1
			end

			crossroad.roads[road_id] = (crossroad.roads[road_id] or 0) + 1
			crossroad.num_roads = crossroad.num_roads + 1
		end

		path_marker.main_path_index = main_path_index

		if path_marker.marker_type == "break" then
			main_path_index = main_path_index + 1
			count = count + 1

			if count < 2 then
				return "If using breaks in main-path, then each sub-path needs at least 2 path markers. "
			end

			count = 0
		else
			count = count + 1
		end

		print("[LevelAnalysis] \tmarker: " .. i .. ", order:" .. path_marker.order .. ", main path index: " .. path_marker.main_path_index, ", crossroads:", path_marker.crossroads_id, path_marker.road_id)
	end

	if count < 2 then
		return "If using breaks in main-path, then each sub-path needs at least 2 path markers. Last path marker is loonely!"
	end

	self.crossroads = crossroads
	self.num_crossroads = num_crossroads
	self.path_markers = path_markers
	self.start = path_markers[1].pos
	self.finish = path_markers[#path_markers].pos

	self.start_main_path_generation(self, main_path_index)

	return result
end
LevelAnalysis.start_main_path_generation = function (self, num_main_paths)
	print("[LevelAnalysis] start_main_path_generation")

	self.stitching_path = true
	local path_markers = self.path_markers
	self.astar_list = {}
	self.main_paths = {}
	local layer_costs = {
		bot_ladders = 20,
		ledges_with_fence = 20,
		jumps = 20,
		ledges = 20,
		bot_jumps = 20,
		bot_drops = 20
	}
	local nav_cost_map_cost_table = GwNavCostMap.create_tag_cost_table()

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table)

	self.nav_cost_map_cost_table = nav_cost_map_cost_table
	self.traverse_logic = GwNavTraverseLogic.create(self.nav_world, nav_cost_map_cost_table)
	self.navtag_layer_cost_table = GwNavTagLayerCostTable.create()

	self.initialize_cost_table(self, self.navtag_layer_cost_table, layer_costs)
	GwNavTraverseLogic.set_navtag_layer_cost_table(self.traverse_logic, self.navtag_layer_cost_table)

	local j = 1
	local sub_index = 1

	for i = 1, #path_markers - 1, 1 do
		local pos1 = path_markers[i].pos:unbox()
		local pos2 = path_markers[i + 1].pos:unbox()

		if path_markers[i].marker_type == "break" then
			sub_index = 1
		else
			self.astar_list[j] = {
				GwNavAStar.create(),
				sub_index,
				path_markers[i].main_path_index,
				i
			}

			GwNavAStar.start(self.astar_list[j][1], self.nav_world, pos1, pos2, self.traverse_logic)

			j = j + 1
			sub_index = sub_index + 1
		end
	end

	for i = 1, num_main_paths, 1 do
		self.main_paths[i] = {
			path_length = 0,
			nodes = {},
			astar_paths = {},
			path_markers = {}
		}
	end

	print("[LevelAnalysis] main path generation - found " .. tostring(num_main_paths) .. " main paths, total of " .. tostring(#self.astar_list) .. " sub-paths.")

	return 
end
LevelAnalysis.initialize_cost_table = function (self, navtag_layer_cost_table, layer_costs)
	for layer_id, layer_name in ipairs(LAYER_ID_MAPPING) do
		local layer_cost = layer_costs[layer_name]

		if layer_cost then
			if layer_cost == 0 then
				GwNavTagLayerCostTable.forbid_layer(navtag_layer_cost_table, layer_id)
			else
				GwNavTagLayerCostTable.allow_layer(navtag_layer_cost_table, layer_id)
				GwNavTagLayerCostTable.set_layer_cost_multiplier(navtag_layer_cost_table, layer_id, layer_cost)
			end
		end
	end

	return 
end
LevelAnalysis.boxify_pos_array = function (array)
	for i = 1, #array, 1 do
		array[i] = Vector3Box(array[i])
	end

	return 
end
LevelAnalysis.boxify_table_pos_array = function (source_array)
	local array = {}

	for i = 1, #source_array, 1 do
		local d = source_array[i]
		array[i] = Vector3Box(d[1], d[2], d[3])
	end

	return array
end
LevelAnalysis.inject_travel_dists = function (main_paths, overrride)
	print("[LevelAnalysis] Injecting travel distances")

	local first_path = main_paths[1]
	local travel_dist = first_path.travel_dist

	if not travel_dist or overrride then
		local total_travel_dist = 0
		local p1 = first_path.nodes[1]:unbox()

		for i = 1, #main_paths, 1 do
			local path = main_paths[i]
			local nodes = path.nodes
			local p2 = nodes[1]:unbox()
			total_travel_dist = total_travel_dist + Vector3.distance(p1, p2)
			local travel_dist = {
				total_travel_dist
			}

			for j = 2, #nodes, 1 do
				p1 = nodes[j - 1]:unbox()
				p2 = nodes[j]:unbox()
				total_travel_dist = total_travel_dist + Vector3.distance(p1, p2)
				travel_dist[j] = total_travel_dist
			end

			p1 = p2
			path.travel_dist = travel_dist
		end
	end

	return 
end
LevelAnalysis.update_main_path_generation = function (self)
	local astar_list = self.astar_list
	local size = #astar_list
	local main_paths = self.main_paths
	local i = 1

	while i <= size do

		-- Decompilation error in this vicinity:
		local a_star = astar_list[i][1]
		local result = GwNavAStar.processing_finished(a_star)
	end

	return 
end
LevelAnalysis.calc_dists_to_start = function (self)
	local main_paths = self.main_paths
	local dist_from_start = 0

	for i = 1, #main_paths, 1 do
		local main_path = main_paths[i]
		main_path.dist_from_start = dist_from_start
		dist_from_start = dist_from_start + main_path.path_length
	end

	local total_path_dist = dist_from_start

	return total_path_dist
end
LevelAnalysis.boss_gizmo_spawned = function (self, unit)
	local travel_dist = Unit.get_data(unit, "travel_dist")
	local map_section_index = tonumber(Unit.get_data(unit, "map_section"))
	local override_spawners = self.override_spawners
	local encampment_id = Unit.get_data(unit, "event_encampment")

	if encampment_id and 0 < encampment_id then
		local override_spawners = self.override_spawners
		local spawner_list = override_spawners[map_section_index]

		if not spawner_list then
			spawner_list = {}
			override_spawners[map_section_index] = spawner_list
		end

		if EncampmentTemplates[encampment_id] then
			spawner_list[#spawner_list + 1] = {
				unit,
				travel_dist,
				map_section_index,
				encampment_id
			}
			self.num_override_spawners = self.num_override_spawners + 1
		end
	end

	local terror_spawners = self.terror_spawners

	for terror_event_kind, data in pairs(terror_spawners) do
		local can_spawn = Unit.get_data(unit, terror_event_kind)

		if can_spawn then
			local spawners = data.spawners
			spawners[#spawners + 1] = {
				unit,
				travel_dist,
				map_section_index
			}
		end
	end

	return 
end
LevelAnalysis.generic_ai_node_spawned = function (self, unit)
	local generic_ai_node_units = self.generic_ai_node_units
	local id = Unit.get_data(unit, "id")
	local units = generic_ai_node_units[id]

	if not units then
		units = {}
		generic_ai_node_units[id] = units
	end

	units[#units + 1] = unit

	return 
end
LevelAnalysis.group_spawners = function (self, spawners, level_sections)
	table.sort(spawners, function (a, b)
		return a[2] < b[2]
	end)

	for i = 1, #spawners, 1 do
		local spawner_data = spawners[i]
		local map_section_index = spawner_data[3]
		local section = level_sections[map_section_index]

		if not section then
			level_sections[map_section_index] = i
		elseif i < section then
			section = i
		end
	end

	level_sections[#level_sections + 1] = #spawners + 1

	return #level_sections - 1
end
LevelAnalysis.group_spawners = function (self, spawners, level_sections)
	table.sort(spawners, function (a, b)
		return a[2] < b[2]
	end)

	local last_map_section_index = 0

	for i = 1, #spawners, 1 do
		local spawner_data = spawners[i]
		local unit = spawner_data[1]
		local travel_dist = spawner_data[2]
		local map_section_index = spawner_data[3]
		local override = spawner_data[4]

		if map_section_index ~= last_map_section_index then
			if last_map_section_index < map_section_index then
				level_sections[map_section_index] = i
			elseif map_section_index < last_map_section_index then
			end
		end

		last_map_section_index = map_section_index
	end

	level_sections[last_map_section_index + 1] = #spawners + 1
	local num_sections = last_map_section_index

	for i = 1, num_sections, 1 do
		local level_section = level_sections[i]

		if not level_sections then
			table.dump(level_sections, "LEVEL_SECTIONS ERROR-----------------------", 3)
			error()
		end

		local first_gizmo = spawners[level_section][1]
		local gizmo_pos = Unit.local_position(first_gizmo, 0)
		local path_pos, travel_dist, move_percent, path_index, sub_index = MainPathUtils.closest_pos_at_main_path(nil, gizmo_pos)
		local zone_index, zone, zone_c = Managers.state.conflict.spawn_zone_baker:get_zone_segment_from_travel_dist(travel_dist)
		local roaming_set = zone_c.pack_spawning_setting.roaming_set

		if roaming_set then
			local boss_settings = roaming_set.boss_settings

			if boss_settings then
				self.boss_settings_section[i] = boss_settings
			end
		end
	end

	return num_sections
end
LevelAnalysis.boxify_waypoint_table = function (self, waypoint_table)
	local waypoints = {}

	for i = 1, #waypoint_table, 1 do
		local w = waypoint_table[i]
		waypoints[i] = Vector3Box(w[1], w[2], w[3])
	end

	return waypoints
end
LevelAnalysis.pick_boss_spline = function (self, map_section, padding, last_travel_dist)
	local boss_waypoints = self.boss_waypoints

	if not boss_waypoints then
		return false
	end

	local section_waypoints = boss_waypoints[map_section]

	if not section_waypoints then
		return false
	end

	local section_travel_dist = section_waypoints[1].travel_dist
	local safe_start_dist = last_travel_dist + padding
	safe_start_dist = (section_travel_dist < safe_start_dist and safe_start_dist) or section_travel_dist
	local start_index = nil

	for j = 1, #section_waypoints, 1 do
		local waypoints_table = section_waypoints[j]

		if safe_start_dist <= waypoints_table.travel_dist then
			start_index = j

			break
		end
	end

	if start_index then
		local spawner_index = self._random(self, start_index, #section_waypoints)
		local waypoints_table = section_waypoints[spawner_index]
		local spline_waypoints = self.boxify_waypoint_table(self, waypoints_table.waypoints)
		local event_data = {
			spline_type = "patrol",
			event_kind = "event_spline_patrol",
			spline_id = waypoints_table.id,
			spline_way_points = spline_waypoints
		}

		return true, spline_waypoints[1], event_data, waypoints_table.travel_dist
	end

	return false
end
LevelAnalysis.spawn_all_boss_spline_patrols = function (self, optional_id)
	local boss_waypoints = self.boss_waypoints

	if not boss_waypoints then
		return false
	end

	print("SPAWN BOSS SPLINES")

	for i = 1, #boss_waypoints, 1 do
		local section_waypoints = boss_waypoints[i]

		for j = 1, #section_waypoints, 1 do
			local waypoints_table = section_waypoints[j]

			if not optional_id or waypoints_table.id == optional_id then
				local spline_waypoints = self.boxify_waypoint_table(self, waypoints_table.waypoints)
				local event_data = {
					spline_type = "patrol",
					event_kind = "event_spline_patrol",
					spline_id = waypoints_table.id,
					spline_way_points = spline_waypoints
				}

				self.enemy_recycler:add_terror_event_in_area(spline_waypoints[1], "boss_event_spline_patrol", event_data)
				print("INJECTING BOSS SPLINE ID", waypoints_table.id)
			end
		end
	end

	return 
end
LevelAnalysis.inject_all_bosses_into_main_path = function (self)
	local boss_waypoints = self.boss_waypoints

	if not boss_waypoints then
		return false
	end

	print("SPAWN BOSS SPLINES")

	local terror_event_kind = "event_boss"
	local terror_spawners = self.terror_spawners
	local data = terror_spawners[terror_event_kind]
	local spawners = data.spawners

	for i = 1, #spawners, 1 do
		local spawner = spawners[i]
		local travel_dist = spawner[2]
		local spawner_pos = Unit.local_position(spawner[1], 0)
		local boxed_pos = Vector3Box(spawner_pos)
		local event_data = {
			event_kind = "event_boss"
		}

		self.enemy_recycler:add_main_path_terror_event(boxed_pos, "boss_event_rat_ogre", 45, event_data)
		QuickDrawerStay:line(spawner_pos, spawner_pos + Vector3(0, 0, 15), Color(125, 255, 0))
		QuickDrawerStay:sphere(spawner_pos, 1, Color(125, 255, 0))
	end

	return 
end
LevelAnalysis.give_events = function (self, main_paths, terror_spawners, num_sections, generated_event_list, terror_event_list, event_settings, level_overrides)
	local spawn_distance = 0
	local padding = (level_overrides and level_overrides.hand_placed_padding_dist) or event_settings.hand_placed_padding_dist
	local start_index, end_index = nil
	local boss_settings_section = self.boss_settings_section

	for i = 1, num_sections, 1 do
		local boxed_pos, gizmo_unit, event_data = nil
		local terror_event_kind = generated_event_list[i]
		local terror_event_name = nil

		if boss_settings_section[i] and not boss_settings_section[i].boss_events then
		end

		if terror_event_kind == "event_boss" or terror_event_kind == "event_patrol" then
			local patrol_success, dist = nil

			if terror_event_kind == "event_patrol" then
				patrol_success, boxed_pos, event_data, dist = self.pick_boss_spline(self, i, padding, spawn_distance)

				print(" ----> using event patrol!")
			end

			if patrol_success then
				local spline_patrol_events = (level_overrides and level_overrides.spline_patrol_events) or event_settings.spline_patrol_events
				terror_event_name = spline_patrol_events[Math.random(#spline_patrol_events)]

				print(" ----> using boss spline path!")

				spawn_distance = dist
			else
				event_lookup = (level_overrides and level_overrides.event_lookup) or event_settings.event_lookup
				local terror_events = event_lookup[terror_event_kind]
				terror_event_name = terror_events[Math.random(#terror_events)]

				print(" ----> using boss gizmo!")

				local data = terror_spawners[terror_event_kind]
				local level_sections = data.level_sections
				local spawners = data.spawners
				start_index = level_sections[i]
				end_index = level_sections[i + 1] - 1

				fassert(start_index <= end_index, "Level Error: Too few boss-gizmo spawners of type '%d' in section %d: start-index: %d, end-index: %d,", terror_event_kind, i, tostring(start_index), tostring(end_index))

				local start_travel_dist = spawners[start_index][2]
				local end_travel_dist = spawners[end_index][2]
				local forbidden_dist = padding - start_travel_dist - spawn_distance

				print(string.format("[LevelAnalysis] section: %d, start-index: %d, end-index: %d, forbidden-dist: %.1f start-travel-dist: %.1f, end-travel-dist: %.1f spawn_distance %.1f", i, start_index, end_index, forbidden_dist, start_travel_dist, end_travel_dist, spawn_distance))

				if 0 < forbidden_dist then
					local forbidden_travel_dist = start_travel_dist + forbidden_dist
					local new_start_index = nil

					for j = start_index, end_index, 1 do
						local travel_dist = spawners[j][2]

						if forbidden_travel_dist <= travel_dist then
							new_start_index = j

							break
						else
							print("[LevelAnalysis] \t\t--> since forbidden dist, skipping spawner ", j, " at distance,", travel_dist)
						end
					end

					if new_start_index then
						print("[LevelAnalysis] \t\t--> found new spawner ", new_start_index, " at distance,", spawners[new_start_index][2], " passing forbidden dist:", forbidden_travel_dist)

						start_index = new_start_index
					else
						print(string.format("[LevelAnalysis] failed to find spawner - too few spawners in section %d, forbidden-dist %.1f from: %.1f to: %.1f", i, forbidden_dist, forbidden_travel_dist, end_travel_dist))
						print("[LevelAnalysis] \t\t--> fallback -> using main-path spawning for section", i, forbidden_travel_dist, end_travel_dist)

						local random_dist = self._random_float_interval(self, forbidden_travel_dist, end_travel_dist)
						local pos = MainPathUtils.point_on_mainpath(main_paths, random_dist)

						if pos then
							spawn_distance = random_dist
							boxed_pos = Vector3Box(pos)
							event_data = {
								event_kind = terror_event_kind
							}
						else
							print("[LevelAnalysis] \t\t--> fallback 2 -> pick any spawner in segment (MIGHT GET BOSSES VERY CLOSE TO EACHOTHER)", i)

							start_index = level_sections[i]
						end
					end
				end

				if not boxed_pos then
					local spawner_index = self._random(self, start_index, end_index)
					local spawner = spawners[spawner_index]
					local spawner_pos = Unit.local_position(spawner[1], 0)
					boxed_pos = Vector3Box(spawner_pos)
					gizmo_unit = spawner[1]
					spawn_distance = spawner[2]
					event_data = {
						gizmo_unit = gizmo_unit,
						event_kind = terror_event_kind
					}
				end
			end
		elseif terror_event_kind == "encampment" then
			terror_event_name = "boss_event_encampment"

			print("pick section:", i)

			local spawners = self.override_spawners[i]
			local data = spawners[self._random(self, 1, #spawners)]
			gizmo_unit = data[1]
			local encampment_id = data[4]
			local encampment_template = EncampmentTemplates[encampment_id]
			boxed_pos = Vector3Box(Unit.local_position(gizmo_unit, 0))
			spawn_distance = data[2]
			local unit_compositions_id = self._random(self, 1, #encampment_template.unit_compositions)
			event_data = {
				encampment_id = encampment_id,
				unit_compositions_id = unit_compositions_id,
				gizmo_unit = gizmo_unit,
				event_kind = terror_event_kind
			}
		else
			terror_event_name = "nothing"
			local data = terror_spawners.event_boss
			local level_sections = data.level_sections
			local start_index = level_sections[i]
			local end_index = level_sections[i + 1] - 1
			local index = math.floor((start_index + end_index) / 2)
			local spawners = data.spawners
			local spawner = spawners[index]
			boxed_pos = Vector3Box(Unit.local_position(spawner[1], 0))
			gizmo_unit = spawner[1]
			spawn_distance = spawner[2]
		end

		if terror_event_kind ~= "nothing" then
			if event_settings.terror_events_using_packs then
				self.enemy_recycler:add_terror_event_in_area(boxed_pos, terror_event_name, event_data)
			else
				self.enemy_recycler:add_main_path_terror_event(boxed_pos, terror_event_name, 45, event_data)
			end
		end

		terror_event_list[#terror_event_list + 1] = {
			boxed_pos,
			terror_event_name,
			spawn_distance,
			event_settings
		}

		if script_data.debug_ai_recycler then
			local pos = boxed_pos.unbox(boxed_pos)

			Debug.world_sticky_text(pos + Vector3(0, 0, 13), terror_event_name .. "-" .. i, "yellow")
			QuickDrawerStay:cylinder(pos, pos + Vector3(0, 0, 6), 2)
		end
	end

	return 
end
LevelAnalysis.override_generated_event_list = function (self, event_settings, generated_event_list, num_sections, level_overrides)
	local override_spawners = self.override_spawners

	if self.num_override_spawners <= 0 then
		return 
	end

	if event_settings.chance_of_encampment < self._random(self) then
		return 
	end

	local list = {}

	for i = 1, num_sections, 1 do
		if override_spawners[i] then
			list[#list + 1] = i
		end
	end

	if #list <= 0 then
		return 
	end

	local section = list[self._random(self, 1, #list)]

	print("[LevelAnalysis] Overriding section ", section, " with an encampment")

	generated_event_list[section] = "encampment"

	return 
end
LevelAnalysis.generate_event_name_list = function (self, event_settings, num_sections, level_overrides)
	print("[LevelAnalysis] Terror events added:")

	local terror_events_kinds = (level_overrides and level_overrides.events) or event_settings.events
	local num_event_kinds = #terror_events_kinds
	local max_events_of_this_kind = (level_overrides and level_overrides.max_events_of_this_kind) or event_settings.max_events_of_this_kind
	local event_list = {}
	local count_events = {}
	local last_chosen_event_index = -1

	for i = 1, num_sections, 1 do
		local index = self._random(self, 1, num_event_kinds)

		while index == last_chosen_event_index and 2 <= num_event_kinds do
			index = self._random(self, 1, num_event_kinds)
		end

		local terror_event_name = terror_events_kinds[index]
		local count = count_events[terror_event_name]

		if count then
			count = count + 1
		else
			count = 1
		end

		count_events[terror_event_name] = count

		if max_events_of_this_kind then
			local max_count = max_events_of_this_kind[terror_event_name]

			if max_count and max_count < count then
				terror_event_name = "nothing"
			end
		end

		event_list[i] = terror_event_name

		if terror_event_name == terror_events_kinds[index] then
			print("[LevelAnalysis]", i, "\t-->Added boss/special event:", terror_event_name)
		else
			print("[LevelAnalysis]", i, "\t-->Added boss/special event:", terror_event_name, "(", terror_events_kinds[index], "-> removed due to too many.)")
		end

		last_chosen_event_index = index
	end

	return event_list
end
LevelAnalysis.hand_placed_terror_creation = function (self, main_paths, event_settings, terror_event_list, level_overrides)
	local terror_events_kinds = (level_overrides and level_overrides.events) or event_settings.events
	local num_sections = nil
	local num_event_kinds = #terror_events_kinds

	if num_event_kinds <= 0 then
		return 
	end

	if script_data.debug_ai_recycler then
		self.saved_terror_spawners = table.clone(self.terror_spawners)
	end

	local terror_spawners = self.terror_spawners
	local last_num_sections, last_event_type = nil

	for event_type, data in pairs(terror_spawners) do
		print("[LevelAnalysis] grouping spawners for ", event_type)

		num_sections = self.group_spawners(self, data.spawners, data.level_sections)

		if last_num_sections and num_sections ~= last_num_sections then
			error("Not all sectors has boss event gizmos in level for  " .. ((num_sections < last_num_sections and event_type) or last_event_type))
		end

		last_num_sections = num_sections
		last_event_type = event_type

		print("[LevelAnalysis] ")
	end

	local generated_event_list = self.generate_event_name_list(self, event_settings, num_sections, level_overrides)

	self.override_generated_event_list(self, event_settings, generated_event_list, num_sections, level_overrides)
	self.give_events(self, main_paths, self.terror_spawners, num_sections, generated_event_list, terror_event_list, event_settings, level_overrides)

	return 
end
LevelAnalysis.automatic_terror_creation = function (self, main_paths, total_main_path_dist, terror_event_list, event_settings, level_overrides)
	local terror_event_kinds = (level_overrides and level_overrides.events) or event_settings.events
	local num_event_kinds = #terror_event_kinds

	if num_event_kinds <= 0 then
		return 
	end

	local event_every_x_meter = (level_overrides and level_overrides.recurring_distance) or event_settings.recurring_distance
	local safe_distance = (level_overrides and level_overrides.safe_dist) or event_settings.safe_dist
	terror_event_list[#terror_event_list + 1] = {
		Vector3Box(0, 0, 0),
		"safe-dist",
		safe_distance,
		event_settings
	}
	local level_path_dist = total_main_path_dist
	local adjusted_path_distance = level_path_dist - safe_distance
	local num_event_places_f = adjusted_path_distance / event_every_x_meter
	local num_event_places = math.floor(num_event_places_f)
	local trailing_event_fraction = num_event_places_f % 1
	local trailing_event = (self._random(self) <= trailing_event_fraction and 1) or 0
	local num_events = num_event_places + trailing_event
	local padding = (level_overrides and level_overrides.padding_dist) or event_settings.padding_dist

	print("[LevelAnalysis] Level path distance:", level_path_dist)
	print("[LevelAnalysis] num_event_places_f:", num_event_places_f, ", num_event_places:", num_event_places, ", trailing_event_fraction:", trailing_event_fraction, ", num_events:", num_events)

	if num_events <= 0 then
		return 
	end

	local event_list = self.generate_event_name_list(self, event_settings, num_events, level_overrides)
	local spawn_distance = 0
	local path_dist1 = nil
	local path_dist2 = safe_distance

	for i = 1, num_events, 1 do
		path_dist1 = path_dist2
		path_dist2 = path_dist1 + event_every_x_meter
		path_dist2 = math.clamp(path_dist2, 0, level_path_dist)
		local forbidden_dist = padding - path_dist2 - spawn_distance

		print("[LevelAnalysis] path_dist1:", path_dist1, ", path_dist2:", path_dist2, " forbidden_dist:", forbidden_dist)

		if 0 < forbidden_dist then
			path_dist1 = path_dist1 + forbidden_dist
		end

		if path_dist2 < path_dist1 then
			print("[LevelAnalysis] skipping event - not enough space left in this segment")

			break
		end

		path_dist2 = math.clamp(path_dist2, 0, level_path_dist)
		local wanted_distance = self._random_float_interval(self, path_dist1, path_dist2)

		print("[LevelAnalysis] wanted_distance:", wanted_distance)

		local pos = MainPathUtils.point_on_mainpath(main_paths, wanted_distance)
		local boxed_pos = Vector3Box(pos)
		local terror_event_name = "nothing"
		local terror_event_kind = event_list[i]

		if terror_event_kind ~= "nothing" then
			local event_data = {}
			local event_lookup = (level_overrides and level_overrides.event_lookup) or event_settings.event_lookup
			local terror_events = event_lookup[terror_event_kind]
			terror_event_name = terror_events[Math.random(#terror_events)]

			if event_settings.terror_events_using_packs then
				self.enemy_recycler:add_terror_event_in_area(boxed_pos, terror_event_name, event_data)
			else
				self.enemy_recycler:add_main_path_terror_event(boxed_pos, terror_event_name, 45, event_data)
			end
		end

		terror_event_list[#terror_event_list + 1] = {
			boxed_pos,
			terror_event_name,
			wanted_distance,
			event_settings
		}

		if script_data.debug_ai_recycler then
			Debug.world_sticky_text(pos + Vector3(0, 0, 13), (terror_event_name or "nothing") .. "-" .. i, "yellow")
		end

		spawn_distance = wanted_distance
	end

	return 
end
LevelAnalysis.debug_spawn_boss_from_closest_spawner_to_player = function (self, draw_only)
	local player_pos = PLAYER_POSITIONS[1]
	local best_dist = math.huge
	local best_pos = nil
	local spawners = self.saved_terror_spawners

	if not spawners then
		print("debug_spawn_boss_from_closest_spawner_to_player - no spawners found")

		return 
	end

	print("debug_spawn_boss_from_closest_spawner_to_player")

	local boss_spawners = spawners.event_boss.spawners

	for i = 1, #boss_spawners, 1 do
		local data = boss_spawners[i]
		local spawner_pos = Unit.local_position(data[1], 0)
		local dist = Vector3.distance(player_pos, spawner_pos)

		if dist < best_dist then
			best_dist = dist
			best_pos = spawner_pos
		end

		QuickDrawer:sphere(spawner_pos, 1.5, Color(100, 200, 10))
	end

	if best_pos then
		print("debug_spawn_boss_from_closest_spawner_to_player - found spawner!")
		QuickDrawerStay:sphere(best_pos, 1.6, Color(50, 200, 10))

		if not draw_only then
			print("\t spawning ogre")
			Managers.state.conflict:spawn_unit(Breeds.skaven_rat_ogre, best_pos, Quaternion(Vector3.up(), 0), "debug_spawn")
		end
	end

	return 
end
LevelAnalysis.generate_boss_paths = function (self)
	self.boss_event_list = {}
	local last_boss, last_rare = nil
	local total_length = 0

	if CurrentBossSettings and not CurrentBossSettings.disabled then
		self.total_main_path_dist = self.calc_dists_to_start(self)
		local level_settings = self.level_settings
		local boss_spawning_method = level_settings.boss_spawning_method

		print("[LevelAnalysis] Generating boss paths for level:", level_settings.level_id)
		print("[LevelAnalysis] This level has a total main-path length of ", self.total_main_path_dist, " meters.")

		local boss_events = CurrentBossSettings.boss_events
		local boss_level_overrides = level_settings[boss_events.name]

		if boss_spawning_method == "hand_placed" then
			self.hand_placed_terror_creation(self, self.main_paths, boss_events, self.boss_event_list, boss_level_overrides)
		else
			self.automatic_terror_creation(self, self.main_paths, self.total_main_path_dist, self.boss_event_list, boss_events, boss_level_overrides)
		end

		local rare_events = CurrentBossSettings.rare_events
		local rare_level_overrides = level_settings[rare_events.name]

		self.automatic_terror_creation(self, self.main_paths, self.total_main_path_dist, self.boss_event_list, rare_events, rare_level_overrides)
	else
		local level_settings = self.level_settings

		print("[LevelAnalysis] Boss-spawning disabled for level", level_settings.level_id)
	end

	return 
end
LevelAnalysis.get_main_paths = function (self)
	return self.main_paths
end
LevelAnalysis.get_crossroads = function (self)
	return self.crossroads
end

local function _extract_wp(wp_list, lookup)
	for i = 1, #wp_list, 1 do
		local route_data = wp_list[i]
		local id = route_data.id

		if id then
			lookup[id] = route_data
		end
	end

	return 
end

LevelAnalysis._make_waypoint_lookup = function (self)
	self.waypoint_lookup_table = {}

	if self.event_waypoints then
		_extract_wp(self.event_waypoints, self.waypoint_lookup_table)
	end

	if self.patrol_waypoints then
		_extract_wp(self.patrol_waypoints, self.waypoint_lookup_table)
	end

	if self.boss_waypoints then
		for section, wp_list in pairs(self.boss_waypoints) do
			_extract_wp(wp_list, self.waypoint_lookup_table)
		end
	end

	return 
end
LevelAnalysis._remove_short_routes = function (self, routes, patrol_type)
	if not routes then
		return 
	end

	local Vector3_distance = Vector3.distance

	for j = #routes, 1, -1 do
		local data = routes[j]
		local waypoints = data.waypoints
		local length = 0
		local p = waypoints[1]
		local p1 = Vector3(p[1], p[2], p[3])
		local p2 = nil

		for i = 2, #waypoints, 1 do
			local p = waypoints[i]
			p2 = Vector3(p[1], p[2], p[3])
			length = length + Vector3_distance(p1, p2)

			if 15 < length then
				break
			end

			p1 = p2
		end

		if length <= 15 then
			print("Removing patrol of type: '" .. patrol_type .. "', called: '" .. data.id .. "' because it is too short: " .. tostring(data.travel_dist) .. "m, which is less then 10m.")
			table.remove(routes, j)
		end
	end

	return 
end
LevelAnalysis.store_patrol_waypoints = function (self, boss_waypoints, patrol_waypoints, event_waypoints)
	local ai_group_system = Managers.state.entity:system("ai_group_system")

	if boss_waypoints then
		for i = 1, #boss_waypoints, 1 do
			self._remove_short_routes(self, boss_waypoints[i], "boss")
		end
	end

	self._remove_short_routes(self, patrol_waypoints, "roaming")
	self._remove_short_routes(self, event_waypoints, "event")

	self.used_roaming_waypoints = {}
	self.boss_waypoints = boss_waypoints
	self.patrol_waypoints = patrol_waypoints

	if event_waypoints then
		self.event_waypoints = event_waypoints

		ai_group_system.add_ready_splines(ai_group_system, self.event_waypoints, "event")
	end

	self._make_waypoint_lookup(self)
	ai_group_system.add_ready_splines(ai_group_system, self.patrol_waypoints, "roaming")

	return 
end
LevelAnalysis.draw_patrol_route = function (self, route_data, drawer, col)
	local h = Vector3(0, 0, 1)
	local waypoints = route_data.waypoints
	local wp = waypoints[1]
	local p1 = Vector3(wp[1], wp[2], wp[3]) + h

	drawer.sphere(drawer, p1, 0.5, col)

	local p2 = nil

	for i = 2, #waypoints, 1 do
		wp = waypoints[i]
		p2 = Vector3(wp[1], wp[2], wp[3]) + h

		drawer.sphere(drawer, p2, 0.5, col)
		drawer.line(drawer, p1, p2, col)

		p1 = p2
	end

	return 
end
LevelAnalysis.draw_patrol_routes = function (self)
	local drawer = QuickDrawerStay
	local section_colors = {
		Color(0, 255, 40),
		Color(0, 75, 255),
		Color(200, 25, 40),
		Color(255, 0, 255),
		Color(0, 0, 255),
		Color(0, 200, 0),
		Color(220, 200, 0)
	}
	local boss_waypoints = self.boss_waypoints

	if boss_waypoints then
		for i = 1, #boss_waypoints, 1 do
			local section = boss_waypoints[i]
			local section_color = section_colors[i]

			for j = 1, #section, 1 do
				local route_data = section[j]

				self.draw_patrol_route(self, route_data, drawer, section_color)
			end
		end
	end

	local roaming_color = Color(0, 220, 200)
	local roaming_waypoints = self.patrol_waypoints

	if roaming_waypoints then
		for i = 1, #roaming_waypoints, 1 do
			local route_data = roaming_waypoints[i]

			self.draw_patrol_route(self, route_data, drawer, roaming_color)
		end
	end

	local event_color = Color(100, 100, 0)
	local event_waypoints = self.event_waypoints

	if event_waypoints then
		for i = 1, #event_waypoints, 1 do
			local route_data = event_waypoints[i]

			self.draw_patrol_route(self, route_data, drawer, event_color)
		end
	end

	return 
end
LevelAnalysis.get_waypoint_spline = function (self, spline_id)
	local route_data = nil
	local route_data = self.waypoint_lookup_table and self.waypoint_lookup_table[spline_id]

	if route_data then
		local waypoints = route_data.waypoints
		local wp = waypoints[1]
		local start_pos = Vector3(wp[1], wp[2], wp[3])

		return route_data, waypoints, start_pos
	end

	return 
end
LevelAnalysis.get_closest_waypoint_spline = function (self, pos, spline_type)
	local route_data = nil
	local min_dist = math.huge
	local best_id = nil

	for id, route_data in pairs(self.waypoint_lookup_table) do
		local waypoints = route_data.waypoints
		local wp = waypoints[1]
		local start_pos = Vector3(wp[1], wp[2], wp[3])
		local dist = Vector3.distance(pos, start_pos)

		if dist < min_dist then
			best_id = id
			min_dist = dist
		end
	end

	if best_id then
		local route_data = self.waypoint_lookup_table[best_id]
		local waypoints = LevelAnalysis.boxify_table_pos_array(route_data.waypoints)

		return best_id, waypoints, waypoints[1]:unbox()
	end

	return nil
end
local Vector3_to_elements = Vector3.to_elements
local Vector3_set_xyz = Vector3.set_xyz
local Script_temp_count = Script.temp_count
local Script_set_temp_count = Script.set_temp_count
local Geometry_closest_point_on_line = Geometry.closest_point_on_line
local distance_squared = Vector3.distance_squared
LevelAnalysis.get_closest_pos_to_waypoint_list = function (self, waypoints, pos)
	local best_point = Vector3(0, 0, 0)
	local best_dist = math.huge
	local p1 = Vector3(unpack(waypoints[1]))
	local num_v, num_q, num_m = Script_temp_count()

	for j = 2, #waypoints, 1 do
		local p2 = Vector3(unpack(waypoints[j]))
		local closest_point = Geometry_closest_point_on_line(pos, p1, p2)
		local d = distance_squared(pos, closest_point)

		if d < best_dist then
			best_dist = d

			Vector3_set_xyz(best_point, Vector3_to_elements(closest_point))
		end

		p1 = p2
	end

	Script_set_temp_count(num_v, num_q, num_m)

	return best_point
end
LevelAnalysis.get_closest_roaming_spline = function (self, pos, exact)
	local roaming_waypoints = self.patrol_waypoints
	local best_spline_id, best_spline_data, best_start_pos, start_pos = nil
	local best_distance = 30
	local Vector3_distance = Vector3.distance
	local used_roaming_waypoints = self.used_roaming_waypoints
	local best_index = nil

	for i = 1, #roaming_waypoints, 1 do
		if not used_roaming_waypoints[i] then
			local route_data = roaming_waypoints[i]
			local wp = (exact and self.get_closest_pos_to_waypoint_list(self, route_data.waypoints, pos)) or route_data.waypoints[1]
			start_pos = Vector3(wp[1], wp[2], wp[3])
			local distance = Vector3_distance(pos, start_pos)

			if distance < best_distance then
				best_distance = distance
				best_spline_id = route_data.id
				best_spline_data = route_data
				best_index = i
				best_start_pos = start_pos
			end
		end
	end

	if best_spline_id then
		used_roaming_waypoints[best_index] = true
	end

	return best_spline_id, best_spline_data, best_start_pos
end
LevelAnalysis.store_main_paths = function (self, main_paths)
	self.main_paths = main_paths
	local collapsed_path, collapsed_travel_dists, segments, breaks_lookup, breaks_order = MainPathUtils.collapse_main_paths(main_paths)
	local total_dist = collapsed_travel_dists[#collapsed_travel_dists]
	self.main_path_data = {
		collapsed_path = collapsed_path,
		collapsed_travel_dists = collapsed_travel_dists,
		breaks_lookup = breaks_lookup,
		breaks_order = breaks_order,
		total_dist = total_dist
	}

	return 
end
LevelAnalysis.pick_crossroad_path = function (self, cross_road_id, path_id)
	self.chosen_crossroads[cross_road_id] = path_id

	return 
end
LevelAnalysis.remove_crossroads_extra_path_branches = function (self, main_paths, crossroads, total_main_path_length_unmodified, zones, num_main_zones)
	main_paths = main_paths or self.main_paths
	crossroads = crossroads or self.crossroads

	if not crossroads or not next(crossroads) then
		print("This levels contains no crossroads")

		return 
	end

	local to_remove = {}

	for crossroads_id, crossroad in pairs(crossroads) do
		local chosen_road_id = self.chosen_crossroads[crossroads_id]

		if not chosen_road_id then
			chosen_road_id = Math.random(1, #crossroad.roads)

			print("Crossroads: No flow call Pick Crossroad Path for crossroad '" .. crossroads_id .. "' received. Code is chosing for you:" .. crossroads_id .. "->" .. chosen_road_id)
		end

		print("Keeping path '" .. chosen_road_id .. "'' at crossroad '" .. crossroads_id .. "'. (1/" .. #crossroad.roads .. ") paths.")

		for k = 1, #main_paths, 1 do
			local main_path = main_paths[k]

			if main_path.crossroads_id == crossroads_id and main_path.road_id ~= chosen_road_id then
				print("\t\t->removing road: " .. main_path.road_id .. " from crossroads: " .. main_path.crossroads_id)

				to_remove[#to_remove + 1] = k
			end
		end
	end

	local removed_path_distances = {}

	for k = #to_remove, 1, -1 do
		local index = to_remove[k]
		local travel_dist = main_paths[index].travel_dist
		removed_path_distances[#removed_path_distances + 1] = {
			travel_dist[1],
			travel_dist[#travel_dist]
		}

		table.remove(main_paths, index)
	end

	self.remove_terror_spawners_due_to_crossroads(self, removed_path_distances)

	local pickup_system = Managers.state.entity:system("pickup_system")

	pickup_system.remove_pickups_due_to_crossroads(pickup_system, removed_path_distances, total_main_path_length_unmodified)

	num_main_zones = self.remove_zones_due_to_crossroads(self, zones, num_main_zones, removed_path_distances)

	Managers.state.spawn.respawn_handler:remove_respawn_units_due_to_crossroads(removed_path_distances, total_main_path_length_unmodified)

	return true, num_main_zones
end
LevelAnalysis.remove_terror_spawners_due_to_crossroads = function (self, removed_path_distances)
	local to_remove = {}
	local terror_spawners = self.terror_spawners
	local num_removed_dist_pairs = #removed_path_distances

	for checkbox_name, data in pairs(terror_spawners) do
		table.clear(to_remove)

		local spawners = data.spawners

		for i = 1, #spawners, 1 do
			local spawner_data = spawners[i]
			local travel_dist = spawner_data[2]

			for j = 1, num_removed_dist_pairs, 1 do
				local dist_pair = removed_path_distances[j]

				if dist_pair[1] < travel_dist and travel_dist < dist_pair[2] then
					to_remove[#to_remove + 1] = i

					break
				end
			end
		end

		for i = #to_remove, 1, -1 do
			table.remove(spawners, to_remove[i])
		end
	end

	return 
end
LevelAnalysis.remove_zones_due_to_crossroads = function (self, zones, num_main_zones, removed_path_distances)
	local to_remove = {}
	local num_removed_dist_pairs = #removed_path_distances

	for i = 1, num_main_zones, 1 do
		local zone = zones[i]
		local travel_dist = zone.travel_dist

		assert(zone.type ~= "island", "Zones badly stored")

		for j = 1, num_removed_dist_pairs, 1 do
			local dist_pair = removed_path_distances[j]

			if dist_pair[1] < travel_dist and travel_dist < dist_pair[2] then
				to_remove[#to_remove + 1] = i

				break
			end
		end
	end

	for i = #to_remove, 1, -1 do
		table.remove(zones, to_remove[i])
	end

	num_main_zones = num_main_zones - #to_remove

	return num_main_zones
end
LevelAnalysis.brute_force_calc_zone_distances = function (self, zones, num_main_zones, spawn_pos_lookup)
	for i = 1, num_main_zones, 1 do
		local zone = zones[i]
		local sub_zones = zone.sub

		if sub_zones[1] then
			local triangle_index = sub_zones[1][1]
			local p = spawn_pos_lookup[triangle_index]
			local best_point, travel_dist, move_percent, best_sub_index, best_main_path = EngineOptimized.closest_pos_at_main_path(Vector3(p[1], p[2], p[3]))
			zone.old_travel_dist = zone.travel_dist
			zone.travel_dist = travel_dist
		end
	end

	return 
end
LevelAnalysis.store_path_markers = function (self, path_markers)
	self.path_markers = path_markers
	self.start = path_markers[1].pos
	self.finish = path_markers[#path_markers].pos

	return 
end
LevelAnalysis.main_path = function (self, index)
	local main_path = self.main_paths[index]

	return main_path.nodes, main_path.path_length
end
LevelAnalysis.get_path_point = function (path_list, path_length, move_percent)
	local travel_dist = 0
	local goal_dist = move_percent * path_length

	for i = 1, #path_list - 1, 1 do
		local p1 = path_list[i]:unbox()
		local p2 = path_list[i + 1]:unbox()
		local vec = p2 - p1
		local p1p2_dist = Vector3.length(vec)
		travel_dist = travel_dist + p1p2_dist

		if goal_dist < travel_dist then
			local missing = travel_dist - goal_dist
			local left_over = p1p2_dist - missing
			local part = left_over / p1p2_dist
			local part_vec = vec * part
			local move_vec = p1 + part_vec

			return move_vec, i
		end
	end

	return path_list[#path_list]:unbox(), #path_list
end
LevelAnalysis.reset_debug = function (self)
	local debug_text = Managers.state.debug_text

	debug_text.clear_world_text(debug_text, "boss_spawning")

	self.used_roaming_waypoints = {}

	return 
end
local cols = {}

for i = 1, 16, 1 do
	cols[i] = {
		math.floor((1 - i / 16) * 255),
		0,
		math.floor(i / 16 * 255)
	}
end

LevelAnalysis.debug = function (self, t)
	local debug_text = Managers.state.debug_text

	debug_text.clear_world_text(debug_text, "boss")

	if false and not self._debug_boss_spawning then
		local terror_spawners = self.terror_spawners
		local h = Vector3(0, 0, 22)
		local th = 0

		for name, data in pairs(terror_spawners) do
			local h = Vector3(0, 0, 22 + th)
			local spawners = data.spawners

			for i = 1, #spawners, 1 do
				local spawner = spawners[i]
				local unit = spawner[1]
				local map_section_index = spawner[3]
				local pos1 = Unit.local_position(unit, 0)
				local pos2 = pos1 + h
				local c = Colors.distinct_colors_lookup[(map_section_index + 3) % 10]
				local color = Color(c[1], c[2], c[3])

				QuickDrawerStay:line(pos1, pos2, color)
				debug_text.output_world_text(debug_text, name, 0.5, pos2, nil, "boss_spawning", Vector3(c[1], c[2], c[3]), "player_1")

				local wanted_distance = spawner[2]
				local main_path_pos = MainPathUtils.point_on_mainpath(self.main_paths, wanted_distance)

				QuickDrawerStay:line(pos2, main_path_pos, color)
			end

			th = th + 0.5
		end

		self._debug_boss_spawning = true
	end

	if self.path_markers then
		for i = 1, #self.path_markers, 1 do
			local pos = self.path_markers[i].pos:unbox()

			if self.path_markers[i].marker_type == "break" then
				QuickDrawer:cylinder(pos, pos + Vector3(0, 0, 8), 0.6, Color(255, 194, 13, 17), 16)
				QuickDrawer:sphere(pos + Vector3(0, 0, 8), 0.4, Color(255, 194, 13, 17))
			else
				QuickDrawer:cylinder(pos, pos + Vector3(0, 0, 8), 0.8, Color(255, 244, 183, 7), 16)
			end
		end
	end

	for k = 1, #self.main_paths, 1 do
		local main_path = self.main_paths[k]
		local nodes = main_path.nodes
		local path_length = main_path.path_length

		if nodes and 0 < #nodes then
			local last_pos = nodes[1]:unbox()

			for i = 1, #nodes, 1 do
				local pos = nodes[i]:unbox()

				QuickDrawer:sphere(pos + Vector3(0, 0, 1.5), 0.4, Color(255, 44, 143, 7))
				QuickDrawer:line(pos + Vector3(0, 0, 1.5), last_pos + Vector3(0, 0, 1.5), Color(255, 44, 143, 7))

				last_pos = pos
			end

			local pos, text = nil

			if self.boss_event_list then
				for i = 1, #self.boss_event_list, 1 do
					local data = self.boss_event_list[i]
					pos = data[1]:unbox()
					text = data[2]
					local pos_up = pos + Vector3(0, 0, 10)
					local color_name = data[4].debug_color
					local color = Colors.get(color_name)

					QuickDrawer:cylinder(pos, pos_up, 0.5, color, 10)
					QuickDrawer:sphere(pos_up, 2, color)

					local c = Colors.color_definitions[color_name]

					debug_text.output_world_text(debug_text, text, 0.5, pos_up, nil, "boss", Vector3(c[2], c[3], c[4]), "player_1")
				end
			end

			local p = t % 5 / 5
			local point = LevelAnalysis.get_path_point(nodes, path_length, p)

			QuickDrawer:sphere(point + Vector3(0, 0, 1.5), 1.366, Color(255, 244, 183, 7))
		end
	end

	return 
end
LevelAnalysis.update = function (self, t)
	if self.stitching_path then
		self.update_main_path_generation(self)
	end

	return 
end
LevelAnalysis.get_main_and_sub_zone_index_from_pos = function (nav_world, zones, lookup, pos, zone_index_lookup)
	local triangle = GwNavTraversal.get_seed_triangle(nav_world, pos)

	if triangle then
		local a, b, c = Script.temp_count()
		local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, triangle)
		local tri_center = (p1 + p2 + p3) / 3
		local key = tri_center.x * 0.0001 + tri_center.y + tri_center.z * 10000

		Script.set_temp_count(a, b, c)

		local triangle_id = lookup[key]
		local baked_number = zone_index_lookup[triangle_id]

		print("get_main_and_sub_zone_index_from_pos", pos, key, triangle_id, baked_number)

		if baked_number then
			local zone_index = math.floor(baked_number / 10000)
			local zone_outer_index = baked_number % 10000
			local zone = zones[zone_index]

			return zone, zone_index, zone_outer_index
		end
	end

	return 
end
LevelAnalysis.get_zone_from_unique_id = function (self, zones, unique_zone_id)
	for i = 1, #zones, 1 do
		local zone = zones[i]

		if zone.unique_zone_id == unique_zone_id then
			return zone
		end
	end

	return 
end
LevelAnalysis.get_zone_segment_from_travel_dist = function (travel_dist, zones, num_main_zones)
	local num_zones = num_main_zones

	for i = 1, num_zones, 1 do
		local zone = zones[i]
		local zone_travel_dist = zone.travel_dist - 5

		if travel_dist < zone_travel_dist then
			local zone_index = (1 < i and i - 1) or i
			local closest_zone = zones[zone_index]

			return zone_index, closest_zone
		end
	end

	return num_zones, zones[num_zones]
end
LevelAnalysis.setup_unreachable_processing = function (nav_world, main_paths, point_list, optional)
	local setup = {
		investigated_points = 0,
		num_points_started = 0,
		running_astar_list = {},
		free_astar_list = {},
		remove_list = {},
		main_paths = main_paths,
		nav_world = nav_world,
		point_list = point_list,
		max_running_astars = (optional and optional.max_concurrent_astars) or 25,
		delete_failed_points = optional and optional.delete_failed_points,
		get_pos_func = optional and optional.get_pos_func,
		get_pos_func2 = optional and optional.get_pos_func2,
		path_found_func = optional and optional.path_found_func,
		path_not_found_func = optional and optional.path_not_found_func,
		traverse_logic = (optional and optional.traverse_logic) or GwNavTraverseLogic.create(nav_world),
		line_object = optional and optional.line_object,
		fail_color = optional and optional.fail_color,
		ok_color = optional and optional.ok_color,
		translate_vec = optional and optional.translate_vec
	}

	return setup
end
LevelAnalysis.process_unreachable = function (work_data)
	local point_list = work_data.point_list
	local delete_failed_points = work_data.delete_failed_points
	local path_found_func = work_data.path_found_func or function ()
		return 
	end
	local path_not_found_func = work_data.path_not_found_func or function ()
		return 
	end
	local get_pos_func = work_data.get_pos_func or function (point_list, index)
		return point_list[index]:unbox()
	end
	local get_pos_func2 = work_data.get_pos_func2 or function ()
		return 
	end
	local max_running_astars = work_data.max_running_astars
	local running_astars = work_data.running_astar_list
	local free_astars = work_data.free_astar_list
	local remove_list = work_data.remove_list
	local total_astars = #running_astars + #free_astars
	local j = work_data.num_points_started
	local total_points = #point_list
	local line_object = work_data.line_object
	local fail_color = (work_data.fail_color and Color(unpack(work_data.fail_color))) or Color(255, 0, 0)
	local ok_color = (work_data.ok_color and Color(unpack(work_data.ok_color))) or Color(255, 255, 255)
	local translate_vec = (work_data.translate_vec and Vector3(unpack(work_data.translate_vec))) or Vector3(0, 0, 0)

	Debug.text("Processing points: %d, %d/%d, astars: free %d running %d", work_data.num_points_started, work_data.investigated_points, total_points, #free_astars, #running_astars)
	print(string.format("[LevelAnalysis] Processing points: %d, %d/%d, astars: free %d running %d", work_data.num_points_started, work_data.investigated_points, total_points, #free_astars, #running_astars))

	if total_points <= work_data.investigated_points then
		print("[LevelAnalysis] -->processing done!")

		if delete_failed_points then
			if 0 < #remove_list then
				print("[LevelAnalysis] -->removing bad points:")
				table.sort(remove_list)

				for i = #remove_list, 1, -1 do
					local index = remove_list[i]
					point_list[index] = nil

					print("[LevelAnalysis] \tpoint", index, "removed")
				end
			else
				print("[LevelAnalysis] -->no bad points were found!")
			end
		end

		print("[LevelAnalysis] -->clearing up free_astars:", #free_astars)

		for i = 1, #free_astars, 1 do
			GwNavAStar.destroy(free_astars[i].astar)
		end

		print("[LevelAnalysis] -->clearing up running_astars:", #running_astars)

		for i = 1, #running_astars, 1 do
			GwNavAStar.destroy(running_astars[i].astar)
		end

		print("[LevelAnalysis] -->bye!")

		return true
	end

	local traverse_logic = work_data.traverse_logic
	local i = 0
	local astar = nil

	if #running_astars - #free_astars < max_running_astars then
		while j < total_points and i < max_running_astars do
			local data = nil

			if 0 < #free_astars then
				data = free_astars[#free_astars]
				free_astars[#free_astars] = nil
				astar = data.astar
				data.point_index = j + 1
				running_astars[#running_astars + 1] = data
			elseif total_astars < max_running_astars then
				i = i + 1
				astar = GwNavAStar.create()
				total_astars = total_astars + 1
				data = {
					astar = astar,
					point_index = j + 1
				}
				running_astars[i] = data
			else
				break
			end

			local pos1 = get_pos_func(point_list, j + 1)
			local pos2 = get_pos_func2(point_list, j + 1) or MainPathUtils.closest_pos_at_main_path_lua(work_data.main_paths, pos1)
			data.goal_pos_boxed = Vector3Box(pos2)
			j = j + 1

			assert(pos2, "no main-path pos found")
			GwNavAStar.start(astar, work_data.nav_world, pos1, pos2, traverse_logic)
		end
	end

	work_data.num_points_started = j
	i = 1
	local size = #running_astars

	while i <= size do
		local data = running_astars[i]
		local astar = data.astar
		local result = GwNavAStar.processing_finished(astar)

		if result then
			work_data.investigated_points = work_data.investigated_points + 1

			if GwNavAStar.path_found(astar) then
				if line_object then
					local a, b, c = Script.temp_count()
					local p1 = GwNavAStar.node_at_index(astar, 1)
					local h = Vector3(0, 0, 0.2) + translate_vec

					for k = 2, GwNavAStar.node_count(astar), 1 do
						local p2 = GwNavAStar.node_at_index(astar, k)

						line_object.line(line_object, p1 + h, p2 + h, ok_color)

						p1 = p2
					end

					Script.set_temp_count(a, b, c)
				end

				print(string.format("[LevelAnalysis] \tpoint: %d ok! (%d/%d)", data.point_index, work_data.investigated_points, total_points))
				path_found_func(point_list, data.point_index, data)
			else
				if line_object then
					local h = Vector3(0, 0, 0.2) + translate_vec
					local p1 = get_pos_func(point_list, data.point_index)
					local p2 = MainPathUtils.closest_pos_at_main_path_lua(work_data.main_paths, p1)

					line_object.line(line_object, p1 + h, p2 + h, fail_color)
					line_object.sphere(line_object, p1 + h, 0.2, fail_color)
					line_object.sphere(line_object, p2 + h, 0.2, fail_color)
				end

				print(string.format("[LevelAnalysis] \tpoint: %d failed! (%d/%d)", data.point_index, work_data.investigated_points, total_points))
				path_not_found_func(point_list, data.point_index)

				if delete_failed_points then
					remove_list[#remove_list + 1] = data.point_index
				end
			end

			free_astars[#free_astars + 1] = data
			running_astars[i] = running_astars[size]
			running_astars[size] = nil
			size = size - 1
		else
			i = i + 1
		end
	end

	return 
end
LevelAnalysis.check_splines_integrity = function (self)
	print("----> Checking splines integrity START:")

	local roaming_waypoints = self.patrol_waypoints
	local Vector3_distance = Vector3.distance
	local ai_group_system = Managers.state.entity:system("ai_group_system")
	local formation = PatrolFormationSettings.storm_vermin_two_column.normal

	for i = 1, #roaming_waypoints, 1 do
		local route_data = roaming_waypoints[i]
		local astar_points = route_data.astar_points
		local spline_name = route_data.id
		local faulty = false
		local pA, pB = astar_points[1]:unbox()

		for i = 2, #astar_points, 1 do
			pB = astar_points[i]:unbox()
			local dist = Vector3.distance_squared(pA, pB)

			if 0.01 < dist then
				pA = pB
			else
				pA = pB
				faulty = true

				print("SPLINE HAS FAULTY POINTS:", i, spline_name, pA, pB, Vector3.distance(pA, pB))
			end
		end

		if faulty then
			print("Faulty spline - ", spline_name, ", points:")

			for i = 1, #astar_points, 1 do
				print(i, astar_points[i]:unbox())
			end

			print("")
		end

		local start_position = ai_group_system.spline_start_position(ai_group_system, spline_name)
		slot16 = ai_group_system.create_formation_data(ai_group_system, start_position, formation, spline_name)
	end

	print("----> Checking splines integrity ENDS.")

	return 
end

return 
