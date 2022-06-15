require("scripts/managers/conflict_director/main_path_spawning_generator")

LevelAnalysis = class(LevelAnalysis)

LevelAnalysis.init = function (self, nav_world, using_editor, level_name, level_seed)
	self.nav_world = nav_world
	self.using_editor = using_editor
	self.cover_points_broadphase = Broadphase(40, 512)
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
	self.boss_waypoints = {}
	self.override_spawners = {}
	self.num_override_spawners = 0

	self:set_random_seed(nil, level_seed)

	if level_name and not using_editor then
		self:_setup_level_data(level_name, level_seed)
	end
end

LevelAnalysis._setup_level_data = function (self, level_name, level_seed)
	local num_nested_levels = LevelResource.nested_level_count(level_name)

	if num_nested_levels > 0 then
		level_name = LevelResource.nested_level_resource_name(level_name, 0)
	end

	local spawn_zone_path = level_name .. "_spawn_zones"

	if Application.can_get("lua", spawn_zone_path) then
		self._last_loaded_zone_package = spawn_zone_path
		local spawn_data = MainPathSpawningGenerator.load_spawn_zone_data(spawn_zone_path)
		self.spawn_zone_data = spawn_data
		local crossroads = spawn_data.crossroads
		self.chosen_crossroads = MainPathSpawningGenerator.generate_crossroad_path_choices(crossroads, level_seed)
	else
		ferror("Cant get %s, make sure this is added to the \\resource_packages\\level_scripts.package file. Or have you forgotten to run generate_resource_packages.bat?", spawn_zone_path)
	end
end

LevelAnalysis.set_random_seed = function (self, checkpoint_data, override_seed)
	local seed = nil
	seed = (not checkpoint_data or checkpoint_data.seed) and (override_seed or math.random_seed())
	self.starting_seed = seed
	self.seed = seed

	print("[LevelAnalysis] set_random_seed( " .. self.starting_seed .. ")")
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
	value = a + (b - a) * value
	self.seed = seed

	return value
end

LevelAnalysis.destroy = function (self)
	self:reset()

	if self.traverse_logic ~= nil then
		GwNavTagLayerCostTable.destroy(self.navtag_layer_cost_table)
		GwNavCostMap.destroy_tag_cost_table(self.nav_cost_map_cost_table)
		GwNavTraverseLogic.destroy(self.traverse_logic)
	end

	if self.astar_list then
		local astar_list = self.astar_list

		for i = 1, #astar_list, 1 do
			local a_star = astar_list[i][1]

			if not GwNavAStar.processing_finished(a_star) then
				GwNavAStar.cancel(a_star)
			end

			GwNavAStar.destroy(a_star)
		end
	end

	EngineOptimized.unregister_main_path()
end

LevelAnalysis.reset = function (self)
	if self._last_loaded_zone_package then
		package.loaded[self._last_loaded_zone_package] = nil
	end
end

LevelAnalysis.set_enemy_recycler = function (self, enemy_recycler)
	self.enemy_recycler = enemy_recycler
end

LevelAnalysis.get_start_and_finish = function (self)
	return self.start, self.finish
end

LevelAnalysis.get_path_markers = function (self)
	return self.path_markers
end

LevelAnalysis._add_path_marker_data = function (self, pos, marker_type, order, main_path_index, crossroads_string, roaming_set_string, mutators_string, peak_boolean, nav_world, path_markers)
	local kind = nil
	local index = #path_markers + 1
	local on_mesh = GwNavTraversal.get_seed_triangle(nav_world, pos)

	if not on_mesh then
		kind = "outside"

		printf("Path marker with order %s is outside of navigation mesh (%s).", tostring(order), tostring(pos))
	end

	for i = 1, #path_markers, 1 do
		if order < path_markers[i].order then
			index = i
			kind = kind or "good"

			break
		elseif order == path_markers[i].order then
			index = i
			kind = kind or "duplicate"

			printf("Two path markers in the level has the same order: %s (%s)", tostring(order), tostring(pos))

			break
		end
	end

	kind = kind or "good"

	table.insert(path_markers, index, {
		pos = Vector3Box(pos),
		marker_type = marker_type,
		main_path_index = main_path_index,
		order = order,
		kind = kind,
		crossroads = crossroads_string,
		roaming_set = roaming_set_string,
		mutators = mutators_string,
		peak = peak_boolean
	})

	return kind == "good"
end

LevelAnalysis._initialize_path_markers_from_editor = function (self, path_markers, drawer)
	local Unit_alive = Unit.alive
	local Unit_is_a = Unit.is_a
	local Unit_get_data = Unit.get_data
	local Unit_local_position = Unit.local_position
	local index_offset = Script.index_offset()
	local level_objects = LevelEditor.objects
	local nav_world = self.nav_world
	local success = true

	for object_id, object in pairs(level_objects) do
		local unit = object._unit

		if Unit_alive(unit) and Unit_is_a(unit, "units/gamemode/path_marker") then
			local order = tonumber(Unit.get_data(unit, "order"))
			local marker_type = Unit_get_data(unit, "marker_type")
			local pos = Unit_local_position(unit, index_offset)
			local crossroads_string = Unit_get_data(unit, "crossroads")
			local roaming_set_string = Unit_get_data(unit, "roaming_set")
			local mutators_string = Unit_get_data(unit, "mutators")
			local peak_boolean = Unit_get_data(unit, "peak") or nil
			roaming_set_string = (roaming_set_string ~= "" and roaming_set_string) or nil
			mutators_string = (mutators_string ~= "" and mutators_string) or nil
			local entry_success = self:_add_path_marker_data(pos, marker_type, order, 1, crossroads_string, roaming_set_string, mutators_string, peak_boolean, nav_world, path_markers)

			if not entry_success then
				success = false
			end
		end
	end

	return success
end

LevelAnalysis._initialize_path_markers_from_ingame = function (self, path_markers, level_name)
	local LevelResource_unit_position = LevelResource.unit_position
	local LevelResource_unit_data = LevelResource.unit_data
	local DynamicData_get = DynamicData.get
	local unit_ind = LevelResource.unit_indices(level_name, "units/gamemode/path_marker")
	local nav_world = self.nav_world
	local success = true

	for _, id in ipairs(unit_ind) do
		local pos = LevelResource_unit_position(level_name, id)
		local unit_data = LevelResource_unit_data(level_name, id)
		local order = tonumber(DynamicData_get(unit_data, "order"))
		local marker_type = DynamicData_get(unit_data, "marker_type")
		local crossroads_string = DynamicData_get(unit_data, "crossroads")
		local roaming_set_string = DynamicData_get(unit_data, "roaming_set")
		local mutators_string = DynamicData_get(unit_data, "mutators")
		local peak_boolean = DynamicData_get(unit_data, "peak") or nil
		mutators_string = (mutators_string ~= "" and mutators_string) or nil
		roaming_set_string = (roaming_set_string ~= "" and roaming_set_string) or nil
		local entry_success = self:_add_path_marker_data(pos, marker_type, order, 1, crossroads_string, roaming_set_string, mutators_string, peak_boolean, nav_world, path_markers)

		if not entry_success then
			success = false
		end
	end

	return success
end

LevelAnalysis.generate_main_path = function (self, level_name, path_markers, in_editor, drawer, use_level_reference)
	if not path_markers then
		path_markers = {}

		if not level_name then
			local level_key = Managers.state.game_mode:level_key()
			level_name = LevelSettings[level_key].level_name
		end

		if use_level_reference and LevelResource.nested_level_count(level_name) > 0 then
			level_name = LevelResource.nested_level_resource_name(level_name, 0)
		end

		print("[LevelAnalysis] Generating main-path for level:", level_name)

		if in_editor then
			local success = self:_initialize_path_markers_from_editor(path_markers, drawer)

			if not success then
				return "[LevelAnalysis] Failed to initialize all path markers from editor (see Console for conflicting markers)."
			end
		else
			local success = self:_initialize_path_markers_from_ingame(path_markers, level_name)

			if not success then
				print("[LevelAnalysis] Failed to initialize all path markers from ingame.")
			end
		end
	else
		print("[LevelAnalysis] path markers aready generated")
	end

	if #path_markers < 2 then
		return "Missing path markers in level. Need at least 2."
	end

	table.sort(path_markers, function (a, b)
		return a.order < b.order
	end)
	print("[LevelAnalysis] Path-markers:")

	local main_path_index = 1
	local num_crossroads = 0
	local crossroads = {}
	local count = 0

	for i = 1, #path_markers, 1 do
		local path_marker = path_markers[i]

		printf("\tread path_marker (crossroad: %s)", path_marker.crossroads)

		if path_marker.crossroads and path_marker.crossroads ~= "" then
			local parts = string.split(path_marker.crossroads, ":")
			local crossroads_id = parts[1]
			local road_id = tonumber(parts[2])

			fassert(road_id, "bad road_id")

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

		if path_marker.marker_type == "break" or path_marker.marker_type == "crossroad_break" then
			main_path_index = main_path_index + 1
			count = count + 1

			if count < 2 then
				return "If using breaks in main-path, then each sub-path needs at least 2 path markers. Check path marker with order -> " .. tostring(path_marker.order)
			end

			count = 0
		else
			count = count + 1
		end

		printf("\t\tmarker: %d,\torder: %d,\tmain_path_index: %d,\tcrossroads: %s %s", i, path_marker.order, path_marker.main_path_index, path_marker.crossroads_id, path_marker.road_id)
	end

	if count < 2 then
		return "If using breaks in main-path, then each sub-path needs at least 2 path markers. Last path marker is lonely!"
	end

	self.crossroads = crossroads
	self.num_crossroads = num_crossroads
	self.path_markers = path_markers
	self.start = path_markers[1].pos
	self.finish = path_markers[#path_markers].pos

	self:start_main_path_generation(main_path_index)

	return "success", path_markers
end

LevelAnalysis.start_main_path_generation = function (self, num_main_paths)
	print("[LevelAnalysis] start_main_path_generation")

	self.stitching_path = true
	local nav_world = self.nav_world
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
	local traverse_logic = GwNavTraverseLogic.create(nav_world, nav_cost_map_cost_table)
	self.traverse_logic = traverse_logic
	self.navtag_layer_cost_table = GwNavTagLayerCostTable.create()

	self:initialize_cost_table(self.navtag_layer_cost_table, layer_costs)
	GwNavTraverseLogic.set_navtag_layer_cost_table(traverse_logic, self.navtag_layer_cost_table)

	local j = 1
	local sub_index = 1

	for i = 1, #path_markers - 1, 1 do
		local pos1 = path_markers[i].pos:unbox()
		local pos2 = path_markers[i + 1].pos:unbox()

		if path_markers[i].marker_type == "break" or path_markers[i].marker_type == "crossroad_break" then
			sub_index = 1
		else
			self.astar_list[j] = {
				GwNavAStar.create(),
				sub_index,
				path_markers[i].main_path_index,
				i
			}

			GwNavAStar.start(self.astar_list[j][1], nav_world, pos1, pos2, traverse_logic)

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

	printf("[LevelAnalysis] main path generation - found %d main paths, total of %d sub-paths.", num_main_paths, #self.astar_list)
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
end

LevelAnalysis.boxify_pos_array = function (array)
	for i = 1, #array, 1 do
		array[i] = Vector3Box(array[i])
	end
end

LevelAnalysis.boxify_table_pos_array = function (source_array)
	local array = {}

	for i = 1, #source_array, 1 do
		local d = source_array[i]
		array[i] = Vector3Box(d[1], d[2], d[3])
	end

	return array
end

LevelAnalysis.update_main_path_generation = function (self)
	local GwNavAStar_processing_finished = GwNavAStar.processing_finished
	local GwNavAStar_path_found = GwNavAStar.path_found
	local GwNavAStar_node_count = GwNavAStar.node_count
	local GwNavAStar_node_at_index = GwNavAStar.node_at_index
	local GwNavAStar_path_cost = GwNavAStar.path_cost
	local GwNavAStar_path_distance = GwNavAStar.path_distance
	local GwNavAStar_destroy = GwNavAStar.destroy
	local astar_list = self.astar_list
	local size = #astar_list
	local main_paths = self.main_paths
	local a_star_index = 1

	while size >= a_star_index do
		local a_star = astar_list[a_star_index][1]
		local result = GwNavAStar_processing_finished(a_star)

		if result and GwNavAStar_path_found(a_star) then
			local num_nodes = GwNavAStar_node_count(a_star)

			print("[LevelAnalysis] Found path! node-count:", num_nodes)

			local node_list = {}

			for i = 1, num_nodes, 1 do
				node_list[i] = GwNavAStar_node_at_index(a_star, i)
			end

			LevelAnalysis.boxify_pos_array(node_list)

			local cost = GwNavAStar_path_cost(a_star)
			local dist = GwNavAStar_path_distance(a_star)
			local main_path_index = astar_list[a_star_index][3]
			local main_path = main_paths[main_path_index]
			local sub_index = astar_list[a_star_index][2]
			local path_marker_index = astar_list[a_star_index][4]
			main_path.astar_paths[sub_index] = {
				dist,
				cost,
				node_list,
				main_path_index,
				path_marker_index
			}

			GwNavAStar_destroy(a_star)

			astar_list[a_star_index] = astar_list[size]
			astar_list[size] = nil
			size = size - 1

			if size == 0 then
				print("[LevelAnalysis] main path generation - all sub paths generated")

				local dist_from_start = 0

				for i = 1, #main_paths, 1 do
					local main_path = main_paths[i]
					local astar_paths = main_path.astar_paths
					local main_nodes = main_path.nodes

					for j = 1, #astar_paths, 1 do
						local data = astar_paths[j]
						local path_dist = data[1]
						local nodes = data[3]
						local index = #main_nodes + 1
						local start_index = index

						for k = 1, #nodes - 1, 1 do
							main_nodes[index] = nodes[k]
							index = index + 1
						end

						main_path.path_length = main_path.path_length + path_dist
						local path_marker_idx = data[5]
						local path_marker = self.path_markers[path_marker_idx]
						main_path.path_markers[start_index] = path_marker
						local crossroads_id = path_marker.crossroads_id

						if crossroads_id then
							fassert(not main_path.crossroads_id or main_path.crossroads_id == crossroads_id, "If using crossroads, all path-markers in the same main-path must be have the same crossroads id")

							main_path.crossroads_id = crossroads_id
							main_path.road_id = path_marker.road_id
						end
					end

					main_path.dist_from_start = dist_from_start
					dist_from_start = dist_from_start + main_path.path_length
					local data = astar_paths[#astar_paths]
					local last_nodes = data[3]
					main_nodes[#main_nodes + 1] = last_nodes[#last_nodes]
				end

				self.total_main_path_length = dist_from_start

				MainPathSpawningGenerator.inject_travel_dists(main_paths)

				self.stitching_path = false
				self.boss_event_list = {}

				if CurrentBossSettings and not CurrentBossSettings.disabled and not self.using_editor then
					self:generate_boss_paths()
				end

				return "done"

				if "done" then
					local p1 = astar_list[a_star_index][4]
					local order1 = self.path_markers[p1].order
					local s = string.format("[LevelAnalysis] Level fail: No path found between path-markers with order %s and the next. Cannot create main path. No bosses will spawn.", tostring(order1))

					if Debug then
						Debug.sticky_text(s, "delay", 20)
					end

					print(s)

					self.stitching_path = false

					return "fail", s

					if "fail" then
						a_star_index = a_star_index + 1
					end
				end
			end
		end
	end
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

	if encampment_id and encampment_id > 0 then
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
end

LevelAnalysis.group_spawners = function (self, spawners, level_sections)
	table.sort(spawners, function (a, b)
		return a[3] < b[3]
	end)

	local last_map_section_index = 0
	local conflict_director_section_list = {}

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

		if not level_section then
			for j = i + 1, num_sections, 1 do
				local spawner_replacement = level_sections[j]

				if spawner_replacement and not level_sections[i] then
					level_sections[i] = spawner_replacement
				end
			end

			for k = i - 1, 1, -1 do
				local spawner_replacement = level_sections[k]

				if spawner_replacement and not level_sections[i] then
					level_sections[i] = spawner_replacement
				end
			end
		end
	end

	for i = 1, num_sections, 1 do
		local level_section = level_sections[i]

		if not level_section then
			table.dump(level_sections, "LEVEL_SECTIONS ERROR-----------------------", 3)
			error()
		end

		local first_gizmo = spawners[level_section][1]
		local gizmo_pos = Unit.local_position(first_gizmo, 0)
		local _, travel_dist, _, _, _ = MainPathUtils.closest_pos_at_main_path(nil, gizmo_pos)
		local _, _, zone_c = Managers.state.conflict.spawn_zone_baker:get_zone_segment_from_travel_dist(travel_dist)
		local conflict_setting = zone_c.conflict_setting
		conflict_director_section_list[i] = conflict_setting
	end

	return num_sections, conflict_director_section_list
end

LevelAnalysis.boxify_waypoint_table = function (self, waypoint_table)
	local waypoints = {}

	for i = 1, #waypoint_table, 1 do
		local w = waypoint_table[i]
		waypoints[i] = Vector3Box(w[1], w[2], w[3])
	end

	return waypoints
end

LevelAnalysis.print_boss_waypoints = function (self)
	local boss_waypoints = self.boss_waypoints

	for i = 1, #boss_waypoints, 1 do
		local section = boss_waypoints[i]

		print("Section:", i)

		for j = 1, #section, 1 do
			local data = section[j]

			print(string.format("BossWaypoint section: %q, #wp %q travel-dist: %.1f", i, j, data.travel_dist))
		end
	end
end

LevelAnalysis.get_boss_spline_travel_distance = function (self, waypoints_table)
	local final_travel_dist = nil

	if waypoints_table.main_path_connector then
		local mpc = waypoints_table.main_path_connector
		local main_path_connector_pos = Vector3(mpc[1], mpc[2], mpc[3])
		local path_pos, travel_dist = MainPathUtils.closest_pos_at_main_path(nil, main_path_connector_pos)
		final_travel_dist = travel_dist

		print("MAIN PATH CONNECTOR ", final_travel_dist)
	else
		local wp = waypoints_table.waypoints[1]
		local position = Vector3(wp[1], wp[2], wp[3])
		local path_pos, travel_dist = MainPathUtils.closest_pos_at_main_path(nil, position)
		final_travel_dist = travel_dist

		print("NORMAL PATROL MAIN PATH ", final_travel_dist)
	end

	table.dump(waypoints_table)

	return final_travel_dist
end

LevelAnalysis.get_possible_events = function (self)
	local events = {}
	local boss_waypoints = self.boss_waypoints

	for _, section_table in ipairs(boss_waypoints) do
		for _, waypoints_table in ipairs(section_table) do
			local travel_dist = self:get_boss_spline_travel_distance(waypoints_table)
			events[#events + 1] = {
				kind = "event_patrol",
				travel_dist = travel_dist,
				waypoints_table = waypoints_table
			}
		end
	end

	local data = self.terror_spawners.event_boss
	local spawners = data.spawners

	for _, spawner in ipairs(spawners) do
		local spawner_pos = Unit.local_position(spawner[1], 0)
		local _, travel_dist, _, _, _ = MainPathUtils.closest_pos_at_main_path(nil, spawner_pos)
		events[#events + 1] = {
			kind = "event_boss",
			travel_dist = travel_dist,
			spawner = spawner
		}
	end

	table.sort(events, function (a, b)
		return a.travel_dist < b.travel_dist
	end)

	return events
end

LevelAnalysis.pick_boss_spline = function (self, map_section, padding, last_travel_dist)
	local boss_waypoints = self.boss_waypoints

	if not boss_waypoints then
		return false, "no boss waypoints table, you need to regenerate boss waypoints in editor!"
	end

	local section_waypoints = boss_waypoints[map_section]

	if not section_waypoints then
		return false, string.format("no section waypoints for section %d - You need to add boss waypoints or set boss_spawning_method to nil in level_settings.", map_section)
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

	local fail_message = nil

	if not start_index then
		printf("[LevelAnalysis] waypoint is too close to the last section's waypoint (map section=%d) -> using fallback (last waypoint in section)", map_section)

		start_index = #section_waypoints
	end

	local spawner_index = self:_random(start_index, #section_waypoints)
	local waypoints_table = section_waypoints[spawner_index]
	local spline_waypoints = self:boxify_waypoint_table(waypoints_table.waypoints)
	local event_data = {
		spline_type = "patrol",
		event_kind = "event_spline_patrol",
		spline_id = waypoints_table.id,
		spline_way_points = spline_waypoints,
		one_directional = waypoints_table.one_directional
	}
	local travel_dist = self:get_boss_spline_travel_distance(waypoints_table)

	return true, fail_message, spline_waypoints[1], event_data, travel_dist
end

LevelAnalysis.spawn_all_boss_spline_patrols = function (self, optional_id)
	local boss_waypoints = self.boss_waypoints

	if not boss_waypoints then
		print("No boss_waypoints found in level!")

		return false
	end

	print("SPAWN BOSS SPLINES")

	for i = 1, #boss_waypoints, 1 do
		local section_waypoints = boss_waypoints[i]

		for j = 1, #section_waypoints, 1 do
			local waypoints_table = section_waypoints[j]

			if not optional_id or waypoints_table.id == optional_id then
				local spline_waypoints = self:boxify_waypoint_table(waypoints_table.waypoints)
				local event_data = {
					spline_type = "patrol",
					event_kind = "event_spline_patrol",
					spline_id = waypoints_table.id,
					spline_way_points = spline_waypoints
				}

				self.enemy_recycler:add_main_path_terror_event(spline_waypoints[1], "boss_event_spline_patrol", 45, event_data)
				print("INJECTING BOSS SPLINE ID", waypoints_table.id)

				local spawner_pos = spline_waypoints[1]:unbox()
				local path_pos, travel_dist, move_percent, path_index, sub_index = MainPathUtils.closest_pos_at_main_path(nil, spawner_pos)
				local activation_pos, _ = MainPathUtils.point_on_mainpath(nil, travel_dist - 45)

				QuickDrawerStay:line(spawner_pos, spawner_pos + Vector3(0, 0, 15), Color(125, 255, 0))
				QuickDrawerStay:sphere(spawner_pos, 5, Colors.get("purple"))
				QuickDrawerStay:line(spawner_pos, activation_pos, Color(125, 255, 0))
				QuickDrawerStay:sphere(activation_pos, 5, Colors.get("pink"))
			end
		end
	end
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

	table.clear(self.enemy_recycler.main_path_events)

	for i = 1, #spawners, 1 do
		local spawner = spawners[i]
		local spawner_pos = Unit.local_position(spawner[1], 0)
		local boxed_pos = Vector3Box(spawner_pos)
		local event_data = {
			event_kind = "event_boss"
		}

		self.enemy_recycler:add_main_path_terror_event(boxed_pos, "boss_event_rat_ogre", 45, event_data)

		local path_pos, travel_dist, move_percent, path_index, sub_index = MainPathUtils.closest_pos_at_main_path(nil, boxed_pos:unbox())
		local activation_pos, _ = MainPathUtils.point_on_mainpath(nil, travel_dist - 45)

		QuickDrawerStay:line(spawner_pos, spawner_pos + Vector3(0, 0, 15), Color(125, 255, 0))
		QuickDrawerStay:sphere(spawner_pos, 5, Colors.get("purple"))
		QuickDrawerStay:line(spawner_pos, activation_pos, Color(125, 255, 0))
		QuickDrawerStay:sphere(activation_pos, 5, Colors.get("pink"))
	end

	self.enemy_recycler.current_main_path_event_id = 1
	local travel_dist = self.enemy_recycler.main_path_events[1][1]
	self.enemy_recycler.current_main_path_event_activation_dist = travel_dist
end

LevelAnalysis._give_events = function (self, main_paths, terror_spawners, generated_event_list, terror_event_list, conflict_director_section_list, terror_event_category)
	local spawn_distance = 0
	local padding = 10
	local start_index, end_index = nil

	for i = 1, #conflict_director_section_list, 1 do
		local boxed_pos, gizmo_unit, event_data = nil
		local terror_event_kind = generated_event_list[i]
		local terror_event_name, override_spawn_distance = nil
		local director = conflict_director_section_list[i]
		local boss_settings = director.boss
		local event_settings = boss_settings[terror_event_category]

		if terror_event_kind == "event_boss" or terror_event_kind == "event_patrol" then
			local event_lookup = event_settings.event_lookup
			local terror_events = event_lookup[terror_event_kind]
			terror_event_name = terror_events[self:_random(#terror_events)]
			local patrol_success, dist, fail_reason = nil

			if terror_event_kind == "event_patrol" then
				patrol_success, fail_reason, boxed_pos, event_data, dist = self:pick_boss_spline(i, padding, spawn_distance)

				fassert(patrol_success, "[LevelAnalysis] Failed finding patrol spline! [reason=%s]", fail_reason)
				print(" ----> using boss spline path!")

				spawn_distance = dist
				override_spawn_distance = dist
			else
				print(" ----> using boss gizmo!")

				local data = terror_spawners[terror_event_kind]
				local level_sections = data.level_sections
				local spawners = data.spawners
				start_index = level_sections[i]
				end_index = level_sections[i + 1] - 1

				fassert(start_index <= end_index, "Level Error: Too few boss-gizmo spawners of type '%d' in section %d: start-index: %d, end-index: %d,", terror_event_kind, i, tostring(start_index), tostring(end_index))

				local start_travel_dist = spawners[start_index][2]
				local end_travel_dist = spawners[end_index][2]
				local forbidden_dist = padding - (start_travel_dist - spawn_distance)

				print(string.format("[LevelAnalysis] section: %d, start-index: %d, end-index: %d, forbidden-dist: %.1f start-travel-dist: %.1f, end-travel-dist: %.1f spawn_distance %.1f", i, start_index, end_index, forbidden_dist, start_travel_dist, end_travel_dist, spawn_distance))

				if forbidden_dist > 0 then
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

						local random_dist = self:_random_float_interval(forbidden_travel_dist, end_travel_dist)
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
					local spawner_index = self:_random(start_index, end_index)
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
			local data = spawners[self:_random(1, #spawners)]
			gizmo_unit = data[1]
			local encampment_id = data[4]
			local encampment_template = EncampmentTemplates[encampment_id]
			boxed_pos = Vector3Box(Unit.local_position(gizmo_unit, 0))
			spawn_distance = data[2]
			local unit_compositions_id = self:_random(1, #encampment_template.unit_compositions)
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
			local spawners = data.spawners
			local start_index = level_sections[i]
			local end_index = level_sections[i + 1] - 1
			local index = math.floor((start_index + end_index) / 2)
			index = math.clamp(index, start_index, level_sections[i + 1])
			local spawner = spawners[index]
			boxed_pos = Vector3Box(Unit.local_position(spawner[1], 0))
			gizmo_unit = spawner[1]
			spawn_distance = spawner[2]
		end

		if terror_event_kind ~= "nothing" then
			if event_settings.terror_events_using_packs then
				self.enemy_recycler:add_terror_event_in_area(boxed_pos, terror_event_name, event_data)
			else
				local activation_distance = 45
				local spawn_dist = nil

				if override_spawn_distance then
					spawn_dist = override_spawn_distance - activation_distance
				end

				self.enemy_recycler:add_main_path_terror_event(boxed_pos, terror_event_name, activation_distance, event_data, spawn_dist)
			end
		end

		local debug_color_name = (event_settings and event_settings.debug_color) or "deep_pink"
		terror_event_list[#terror_event_list + 1] = {
			boxed_pos,
			terror_event_name,
			spawn_distance,
			debug_color_name
		}
	end
end

LevelAnalysis._override_generated_event_list = function (self, generated_event_list, conflict_director_section_list, terror_event_category)
	local override_spawners = self.override_spawners

	if self.num_override_spawners <= 0 then
		return
	end

	local list = {}

	for i = 1, #conflict_director_section_list, 1 do
		local director = conflict_director_section_list[i]
		local boss_settings = director.boss
		local chance_of_encampment = boss_settings[terror_event_category].chance_of_encampment

		if override_spawners[i] and self:_random() <= chance_of_encampment then
			list[#list + 1] = i
		end
	end

	if #list <= 0 then
		return
	end

	local section = list[self:_random(1, #list)]

	print("[LevelAnalysis] Overriding section ", section, " with an encampment")

	generated_event_list[section] = "encampment"
end

LevelAnalysis._generate_event_name_list = function (self, conflict_director_section_list, max_events_of_this_kind, terror_event_category)
	print("[LevelAnalysis] Terror events added:")

	local event_list = {}
	local count_events = {}
	local last_chosen_event_index = -1

	for i = 1, #conflict_director_section_list, 1 do
		local conflict_director = conflict_director_section_list[i]
		local boss_settings = conflict_director.boss

		if boss_settings.disabled then
			event_list[i] = "nothing"
		else
			local terror_events_kinds = boss_settings[terror_event_category].events
			local num_event_kinds = #terror_events_kinds
			local index = self:_random(1, num_event_kinds)

			while index == last_chosen_event_index and num_event_kinds >= 2 do
				index = self:_random(1, num_event_kinds)
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
				printf("[LevelAnalysis] %d -->Added boss/special event: %s", i, terror_event_name)
			else
				printf("[LevelAnalysis] %d\t-->Added boss/special event: %s (, %s -> removed due to too many.)", i, terror_event_name, terror_events_kinds[index])
			end

			last_chosen_event_index = index
		end
	end

	return event_list
end

LevelAnalysis._hand_placed_terror_creation = function (self, main_paths, terror_event_list, terror_event_category)
	local num_sections, conflict_director_section_list = nil
	local terror_spawners = self.terror_spawners
	local last_num_sections, last_event_type = nil

	for event_type, data in pairs(terror_spawners) do
		print("[LevelAnalysis] grouping spawners for ", event_type)

		num_sections, conflict_director_section_list = self:group_spawners(data.spawners, data.level_sections)

		if last_num_sections and num_sections ~= last_num_sections then
			error("Not all sectors has boss event gizmos in level for  " .. ((num_sections < last_num_sections and event_type) or last_event_type))
		end

		last_num_sections = num_sections
		last_event_type = event_type

		print("[LevelAnalysis] ")
	end

	local level_settings = self.level_settings
	local level_overrides = level_settings[terror_event_category]
	local max_events_of_this_kind = (level_overrides and level_overrides.max_events_of_this_kind) or {
		event_boss = 2
	}
	local generated_event_list = self:_generate_event_name_list(conflict_director_section_list, max_events_of_this_kind, terror_event_category)

	self:_override_generated_event_list(generated_event_list, conflict_director_section_list, terror_event_category)
	self:_give_events(main_paths, self.terror_spawners, generated_event_list, terror_event_list, conflict_director_section_list, terror_event_category)
end

LevelAnalysis._automatic_terror_creation = function (self, main_paths, total_main_path_dist, terror_event_list, terror_event_category, event_every_x_meter, safe_distance)
	terror_event_list[#terror_event_list + 1] = {
		Vector3Box(0, 0, 0),
		"safe-dist",
		safe_distance,
		"deep_pink"
	}
	local level_path_dist = total_main_path_dist
	local adjusted_path_distance = level_path_dist - safe_distance
	local num_event_places_f = adjusted_path_distance / event_every_x_meter
	local num_event_places = math.floor(num_event_places_f)
	local trailing_event_fraction = num_event_places_f % 1
	local trailing_event = (self:_random() <= trailing_event_fraction and 1) or 0
	local num_events = num_event_places + trailing_event

	print("[LevelAnalysis] num_event_places_f:", num_event_places_f, ", num_event_places:", num_event_places, ", trailing_event_fraction:", trailing_event_fraction, ", num_events:", num_events)
	print("[LevelAnalysis] Level path distance:", level_path_dist)

	if num_events <= 0 then
		return
	end

	local padding = 100
	local spawn_distance = 0
	local wanted_distances = {}
	local conflict_director_section_list = {}
	local path_dist1 = nil
	local path_dist2 = safe_distance

	for i = 1, num_events, 1 do
		path_dist1 = path_dist2
		path_dist2 = path_dist1 + event_every_x_meter
		path_dist2 = math.clamp(path_dist2, 0, level_path_dist)
		local forbidden_dist = padding - (path_dist2 - spawn_distance)

		print("[LevelAnalysis] path_dist1:", path_dist1, ", path_dist2:", path_dist2, " forbidden_dist:", forbidden_dist)

		if forbidden_dist > 0 then
			path_dist1 = path_dist1 + forbidden_dist
		end

		if path_dist2 < path_dist1 then
			print("[LevelAnalysis] skipping event - not enough space left in this segment")

			break
		end

		path_dist2 = math.clamp(path_dist2, 0, level_path_dist)
		local wanted_distance = self:_random_float_interval(path_dist1, path_dist2)

		print("[LevelAnalysis] wanted_distance:", wanted_distance)

		wanted_distances[i] = wanted_distance
		spawn_distance = wanted_distance
		local _, _, zone_c = Managers.state.conflict.spawn_zone_baker:get_zone_segment_from_travel_dist(wanted_distance)
		local conflict_setting = zone_c.conflict_setting
		conflict_director_section_list[i] = conflict_setting
	end

	local level_settings = self.level_settings
	local level_overrides = level_settings[terror_event_category]
	local max_events_of_this_kind = (level_overrides and level_overrides.max_events_of_this_kind) or {
		event_boss = 2
	}
	local event_list = self:_generate_event_name_list(conflict_director_section_list, max_events_of_this_kind, terror_event_category)

	for i = 1, #event_list, 1 do
		local wanted_distance = wanted_distances[i]
		local pos = MainPathUtils.point_on_mainpath(main_paths, wanted_distance)
		local boxed_pos = Vector3Box(pos)
		local terror_event_name = "nothing"
		local terror_event_kind = event_list[i]
		local debug_color_name = "deep_pink"

		if terror_event_kind ~= "nothing" then
			local director = conflict_director_section_list[i]
			local boss_settings = director.boss
			local event_settings = boss_settings[terror_event_category]
			debug_color_name = event_settings.debug_color
			local event_data = {}
			local event_lookup = event_settings.event_lookup
			local terror_events = event_lookup[terror_event_kind]
			terror_event_name = terror_events[self:_random(#terror_events)]

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
			debug_color_name
		}
	end
end

LevelAnalysis.debug_spawn_boss_from_closest_spawner_to_player = function (self, draw_only)
	local side = Managers.state.side:get_side_from_name("heroes")
	local PLAYER_POSITIONS = side.PLAYER_POSITIONS
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

			local rot = Quaternion(Vector3.up(), 0)
			local optional_data = nil

			Managers.state.conflict:spawn_queued_unit(Breeds.skaven_rat_ogre, Vector3Box(best_pos), QuaternionBox(rot), "debug_spawn", nil, nil, optional_data)
		end
	end
end

LevelAnalysis.generate_boss_paths = function (self)
	self.boss_event_list = {}
	self.total_main_path_dist = self:calc_dists_to_start()
	local level_settings = self.level_settings

	printf("[LevelAnalysis] Generating boss paths for level: %s", level_settings.level_id)
	printf("[LevelAnalysis] This level has a total main-path length of %.3f meters.", self.total_main_path_dist)

	local boss_spawning_method = level_settings.boss_spawning_method

	if boss_spawning_method == "hand_placed" then
		self:_hand_placed_terror_creation(self.main_paths, self.boss_event_list, "boss_events")
	elseif boss_spawning_method == "bypassed" then
	else
		local level_overrides = level_settings.boss_events
		local event_every_x_meter = (level_overrides and level_overrides.recurring_distance) or 300
		local safe_distance = (level_overrides and level_overrides.safe_dist) or 150

		self:_automatic_terror_creation(self.main_paths, self.total_main_path_dist, self.boss_event_list, "boss_events", event_every_x_meter, safe_distance)
	end

	local level_overrides = level_settings.rare_events

	if not level_overrides or (level_overrides and not level_overrides.disabled) then
		local event_every_x_meter = (level_overrides and level_overrides.recurring_distance) or 1500
		local safe_distance = (level_overrides and level_overrides.safe_dist) or 50

		self:_automatic_terror_creation(self.main_paths, self.total_main_path_dist, self.boss_event_list, "rare_events", event_every_x_meter, safe_distance)
	end
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

			if length > 15 then
				break
			end

			p1 = p2
		end

		if length <= 15 then
			print("Removing patrol of type: '" .. patrol_type .. "', called: '" .. data.id .. "' because it is too short: " .. length .. "m, which is less then 15m.")
			table.remove(routes, j)
		end
	end
end

LevelAnalysis.store_patrol_waypoints = function (self, boss_waypoints, patrol_waypoints, event_waypoints)
	if boss_waypoints then
		for i = 1, #boss_waypoints, 1 do
			self:_remove_short_routes(boss_waypoints[i], "boss")
		end
	end

	self:_remove_short_routes(patrol_waypoints, "roaming")
	self:_remove_short_routes(event_waypoints, "event")

	self.used_roaming_waypoints = {}
	self.boss_waypoints = boss_waypoints
	self.patrol_waypoints = patrol_waypoints
	local ai_group_system = Managers.state.entity:system("ai_group_system")

	if event_waypoints then
		self.event_waypoints = event_waypoints

		ai_group_system:add_ready_splines(self.event_waypoints, "event")
	end

	self:_make_waypoint_lookup()
	ai_group_system:add_ready_splines(self.patrol_waypoints, "roaming")
end

LevelAnalysis.draw_patrol_route = function (self, route_data, drawer, col)
	local h = Vector3(0, 0, 1)
	local waypoints = route_data.waypoints
	local wp = waypoints[1]
	local p1 = Vector3(wp[1], wp[2], wp[3]) + h

	drawer:sphere(p1, 0.5, col)

	local p2 = nil

	for i = 2, #waypoints, 1 do
		wp = waypoints[i]
		p2 = Vector3(wp[1], wp[2], wp[3]) + h

		drawer:sphere(p2, 0.5, col)
		drawer:line(p1, p2, col)

		p1 = p2
	end
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

				self:draw_patrol_route(route_data, drawer, section_color)
			end
		end
	end

	local roaming_color = Color(0, 220, 200)
	local roaming_waypoints = self.patrol_waypoints

	if roaming_waypoints then
		for i = 1, #roaming_waypoints, 1 do
			local route_data = roaming_waypoints[i]

			self:draw_patrol_route(route_data, drawer, roaming_color)
		end
	end

	local event_color = Color(100, 100, 0)
	local event_waypoints = self.event_waypoints

	if event_waypoints then
		for i = 1, #event_waypoints, 1 do
			local route_data = event_waypoints[i]

			self:draw_patrol_route(route_data, drawer, event_color)
		end
	end
end

LevelAnalysis.draw_patrol_start_position = function (self, route_data, drawer, col, map_section)
	local h = Vector3(0, 0, 1)
	local waypoints = route_data.waypoints
	local wp = waypoints[1]
	local p1 = Vector3(wp[1], wp[2], wp[3]) + h

	drawer:sphere(p1, 1, col)
	drawer:line(p1, p1 + Vector3(0, 0, 50), Colors.get("red"))
	table.dump(route_data)

	local debug_text = nil

	if route_data.one_directional then
		debug_text = "Patrol " .. route_data.id .. " one_directional " .. " MS: " .. map_section
	else
		debug_text = "Patrol " .. route_data.id .. " MS: " .. map_section
	end

	local main_path_connector = nil

	if route_data.main_path_connector then
		local pos = Vector3(route_data.main_path_connector[1], route_data.main_path_connector[2], route_data.main_path_connector[3])

		drawer:sphere(pos, 1, Colors.get("lime"))
		print("Found main path connector")

		main_path_connector = pos
	end

	Managers.state.debug_text:output_world_text(debug_text, 0.5, p1 + Vector3(0, 0, 1), nil, "patrol_start_position_debug", Vector3(255, 255, 0))

	local travel_dist = nil

	if main_path_connector then
		local path_pos, dist = MainPathUtils.closest_pos_at_main_path(nil, main_path_connector)

		drawer:sphere(path_pos, 1, Colors.get("cyan"))

		debug_text = "" .. route_data.id .. " using main path connection "

		Managers.state.debug_text:output_world_text(debug_text, 0.5, path_pos + Vector3(0, 0, 1), nil, "patrol_start_position_debug", Vector3(255, 255, 0))
		drawer:line(p1, path_pos, Colors.get("cyan"))

		travel_dist = dist

		print("Main path connector travel dist ", travel_dist)
	else
		local path_pos, dist = MainPathUtils.closest_pos_at_main_path(nil, p1)

		drawer:sphere(path_pos, 1, Colors.get("cyan"))

		debug_text = "" .. route_data.id .. " connection "

		Managers.state.debug_text:output_world_text(debug_text, 0.5, path_pos + Vector3(0, 0, 1), nil, "patrol_start_position_debug", Vector3(255, 255, 0))
		drawer:line(p1, path_pos, Colors.get("cyan"))

		travel_dist = dist
	end

	local main_path_pos = MainPathUtils.point_on_mainpath(nil, travel_dist - 45)

	if main_path_pos then
		drawer:line(p1, main_path_pos, Colors.get("yellow"))
		drawer:sphere(main_path_pos, 1, col)

		local main_path_spawn_text = "" .. route_data.id .. " trigger "

		Managers.state.debug_text:output_world_text(main_path_spawn_text, 0.4, main_path_pos + Vector3(0, 0, 1), nil, "patrol_start_position_debug", Vector3(255, 255, 0))
	end
end

LevelAnalysis.draw_patrol_start_positions = function (self)
	local drawer = QuickDrawerStay
	local color = Colors.get("purple")
	local boss_waypoints = self.boss_waypoints

	Managers.state.debug_text:clear_world_text("patrol_start_position_debug")

	if boss_waypoints then
		for i = 1, #boss_waypoints, 1 do
			local section = boss_waypoints[i]

			for j = 1, #section, 1 do
				local route_data = section[j]

				self:draw_patrol_start_position(route_data, drawer, color, i)
			end
		end
	end
end

LevelAnalysis.debug_get_closest_boss_patrol_spawn = function (self, player_position)
	local boss_waypoints = self.boss_waypoints
	local closest_route = nil
	local closest_dist = math.huge

	if boss_waypoints then
		for i = 1, #boss_waypoints, 1 do
			local section = boss_waypoints[i]

			for j = 1, #section, 1 do
				local route_data = section[j]
				local h = Vector3(0, 0, 1)
				local waypoints = route_data.waypoints
				local wp = waypoints[1]
				local p1 = Vector3(wp[1], wp[2], wp[3]) + h
				local dist = Vector3.distance(player_position, p1)

				if dist < closest_dist then
					closest_route = route_data
					closest_dist = dist
				end
			end
		end
	end

	local waypoints = self:boxify_waypoint_table(closest_route.waypoints)

	return closest_route, waypoints
end

LevelAnalysis.get_waypoint_spline = function (self, spline_id)
	local route_data = self.waypoint_lookup_table and self.waypoint_lookup_table[spline_id]

	if route_data then
		local waypoints = route_data.waypoints
		local wp = waypoints[1]
		local start_pos = Vector3(wp[1], wp[2], wp[3])
		local one_directional = route_data.one_directional

		if one_directional then
			print("Getting waypoint spline, is one one_directional")
		end

		return route_data, waypoints, start_pos, route_data.one_directional
	end
end

LevelAnalysis.get_closest_waypoint_spline = function (self, pos)
	if not self.waypoint_lookup_table then
		return
	end

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

	print("Closest")

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
	local best_spline_id, best_spline_data, best_start_pos, start_pos = nil
	local best_distance = 30
	local Vector3_distance = Vector3.distance
	local used_roaming_waypoints = self.used_roaming_waypoints
	local best_index = nil
	local roaming_waypoints = self.patrol_waypoints

	for i = 1, #roaming_waypoints, 1 do
		if not used_roaming_waypoints[i] then
			local route_data = roaming_waypoints[i]
			local wp = (exact and self:get_closest_pos_to_waypoint_list(route_data.waypoints, pos)) or route_data.waypoints[1]
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
end

LevelAnalysis.remove_crossroads_extra_path_branches = function (self, main_paths, crossroads, total_main_path_length_unmodified, zones, num_main_zones, path_markers)
	main_paths = main_paths or self.main_paths
	crossroads = crossroads or self.crossroads
	local seed = self.starting_seed
	local chosen_crossroads = self.chosen_crossroads
	local main_path_was_changed, altered_amount_num_main_zones, removed_path_distances = MainPathSpawningGenerator.remove_crossroads_extra_path_branches(crossroads, chosen_crossroads, main_paths, zones, num_main_zones, path_markers, seed)

	if main_path_was_changed then
		self:remove_terror_spawners_due_to_crossroads(removed_path_distances)

		local pickup_system = Managers.state.entity:system("pickup_system")

		pickup_system:remove_pickups_due_to_crossroads(removed_path_distances, total_main_path_length_unmodified)
		Managers.state.game_mode:remove_respawn_units_due_to_crossroads(removed_path_distances, total_main_path_length_unmodified)

		return true, altered_amount_num_main_zones
	else
		return false, num_main_zones
	end
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

	local boss_waypoints = self.boss_waypoints

	if not boss_waypoints then
		return false, "no boss waypoints table, you need to regenerate boss waypoints in editor!"
	end

	table.clear(to_remove)

	for i = 1, #boss_waypoints, 1 do
		local section_waypoints = boss_waypoints[i]

		for j = 1, #section_waypoints, 1 do
			local waypoints_table = section_waypoints[j]
			local travel_dist = waypoints_table.travel_dist

			for y = 1, num_removed_dist_pairs, 1 do
				local dist_pair = removed_path_distances[y]

				if dist_pair[1] < travel_dist and travel_dist < dist_pair[2] then
					to_remove[#to_remove + 1] = waypoints_table.id

					break
				end
			end
		end

		for k = 1, #to_remove, 1 do
			local id = to_remove[k]

			for j = 1, #section_waypoints, 1 do
				local waypoints_table = section_waypoints[j]

				if waypoints_table.id == id then
					table.remove(section_waypoints, j)

					break
				end
			end
		end

		table.dump(section_waypoints)
	end
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
end

LevelAnalysis.store_path_markers = function (self, path_markers)
	self.path_markers = path_markers
	self.start = path_markers[1].pos
	self.finish = path_markers[#path_markers].pos
end

LevelAnalysis.main_path = function (self, index)
	local main_path = self.main_paths[index]

	return main_path.nodes, main_path.path_length
end

LevelAnalysis.get_path_point = function (path_list, path_length, move_percent)
	local travel_dist = 0
	local goal_dist = move_percent * path_length
	local Vector3_length = Vector3.length

	for i = 1, #path_list - 1, 1 do
		local p1 = path_list[i]:unbox()
		local p2 = path_list[i + 1]:unbox()
		local vec = p2 - p1
		local p1p2_dist = Vector3_length(vec)
		travel_dist = travel_dist + p1p2_dist

		if goal_dist < travel_dist then
			local left_over = travel_dist - goal_dist
			local missing = p1p2_dist - left_over
			local part = missing / p1p2_dist
			local part_vec = vec * part
			local final_position = p1 + part_vec

			return final_position, i
		end
	end

	return path_list[#path_list]:unbox(), #path_list
end

LevelAnalysis.reset_debug = function (self)
	local debug_text = Managers.state.debug_text

	debug_text:clear_world_text("boss_spawning")

	self.used_roaming_waypoints = {}
end

LevelAnalysis.debug = function (self, t)
	local debug_text = Managers.state.debug_text

	debug_text:clear_world_text("boss")

	if false and not self._debug_boss_spawning then
		local terror_spawners = self.terror_spawners
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
				debug_text:output_world_text(name, 0.5, pos2, nil, "boss_spawning", Vector3(c[1], c[2], c[3]), "player_1")

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

			if self.path_markers[i].marker_type == "break" or self.path_markers[i].marker_type == "crossroad_break" then
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

		if nodes and #nodes > 0 then
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
					local color_name = data[4]
					local color = Colors.get(color_name)

					QuickDrawer:cylinder(pos, pos_up, 0.5, color, 10)
					QuickDrawer:sphere(pos_up, 2, color)

					local c = Colors.color_definitions[color_name]

					debug_text:output_world_text(text, 0.5, pos_up, nil, "boss", Vector3(c[2], c[3], c[4]), "player_1")
				end
			end

			local p = t % 5 / 5
			local point = LevelAnalysis.get_path_point(nodes, path_length, p)

			QuickDrawer:sphere(point + Vector3(0, 0, 1.5), 1.366, Color(255, 244, 183, 7))
		end
	end
end

LevelAnalysis.update = function (self, t)
	if self.stitching_path then
		self:update_main_path_generation()
	end
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
end

LevelAnalysis.get_zone_from_unique_id = function (self, zones, unique_zone_id)
	for i = 1, #zones, 1 do
		local zone = zones[i]

		if zone.unique_zone_id == unique_zone_id then
			return zone
		end
	end
end

LevelAnalysis.get_zone_segment_from_travel_dist = function (travel_dist, zones, num_main_zones)
	local num_zones = num_main_zones

	for i = 1, num_zones, 1 do
		local zone = zones[i]
		local zone_travel_dist = zone.travel_dist - 5

		if travel_dist < zone_travel_dist then
			local zone_index = (i > 1 and i - 1) or i
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
	printf("[LevelAnalysis] Processing points: %d, %d/%d, astars: free %d running %d", work_data.num_points_started, work_data.investigated_points, total_points, #free_astars, #running_astars)

	if total_points <= work_data.investigated_points then
		print("[LevelAnalysis] -->processing done!")

		if delete_failed_points then
			if #remove_list > 0 then
				print("[LevelAnalysis] -->removing bad points:")
				table.sort(remove_list)

				for i = #remove_list, 1, -1 do
					local index = remove_list[i]
					point_list[index] = nil

					print("[LevelAnalysis] \tpoint", index, "removed")
				end
			else
				print("[LevelAnalysis] --> no bad points were found!")
			end
		end

		print("[LevelAnalysis] --> clearing up free_astars:", #free_astars)

		local GwNavAStar_destroy = GwNavAStar.destroy

		for i = 1, #free_astars, 1 do
			GwNavAStar_destroy(free_astars[i].astar)
		end

		print("[LevelAnalysis] -->clearing up running_astars:", #running_astars)

		for i = 1, #running_astars, 1 do
			GwNavAStar_destroy(running_astars[i].astar)
		end

		print("[LevelAnalysis] -->bye!")

		return true
	end

	local traverse_logic = work_data.traverse_logic
	local i = 0
	local astar = nil

	if max_running_astars > #running_astars - #free_astars then
		local GwNavAStar_start = GwNavAStar.start

		while j < total_points and i < max_running_astars do
			local data = nil

			if #free_astars > 0 then
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

			fassert(pos2, "No main-path pos found")
			GwNavAStar_start(astar, work_data.nav_world, pos1, pos2, traverse_logic)
		end
	end

	work_data.num_points_started = j
	i = 1
	local size = #running_astars
	local GwNavAStar_processing_finished = GwNavAStar.processing_finished
	local GwNavAStar_path_found = GwNavAStar.path_found
	local GwNavAStar_node_at_index = GwNavAStar.node_at_index
	local GwNavAStar_node_count = GwNavAStar.node_count

	while i <= size do
		local data = running_astars[i]
		local astar = data.astar
		local result = GwNavAStar_processing_finished(astar)

		if result then
			work_data.investigated_points = work_data.investigated_points + 1

			if GwNavAStar_path_found(astar) then
				if line_object then
					local a, b, c = Script.temp_count()
					local p1 = GwNavAStar_node_at_index(astar, 1)
					local h = Vector3(0, 0, 0.2) + translate_vec

					for k = 2, GwNavAStar_node_count(astar), 1 do
						local p2 = GwNavAStar_node_at_index(astar, k)

						line_object:line(p1 + h, p2 + h, ok_color)

						p1 = p2
					end

					Script.set_temp_count(a, b, c)
				end

				printf("[LevelAnalysis] \tpoint: %d ok! (%d/%d)", data.point_index, work_data.investigated_points, total_points)
				path_found_func(point_list, data.point_index, data)
			else
				if line_object then
					local h = Vector3(0, 0, 0.2) + translate_vec
					local p1 = get_pos_func(point_list, data.point_index)
					local p2 = MainPathUtils.closest_pos_at_main_path_lua(work_data.main_paths, p1)

					line_object:line(p1 + h, p2 + h, fail_color)
					line_object:sphere(p1 + h, 0.2, fail_color)
					line_object:sphere(p2 + h, 0.2, fail_color)
				end

				printf("[LevelAnalysis] \tpoint: %d failed! (%d/%d)", data.point_index, work_data.investigated_points, total_points)
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
end

LevelAnalysis.setup_main_path_breaks_check = function (nav_world, main_paths, traverse_logic, path_markers, drawer)
	local setup_data = {
		max_running_astars = 50,
		nav_world = nav_world,
		traverse_logic = traverse_logic,
		running_astar_list = {},
		free_astar_list = {},
		nodes_to_check = {},
		drawer = drawer,
		failed_main_path_breaks = {},
		optional_failed_messages = {}
	}
	local nodes_to_check = setup_data.nodes_to_check
	local optional_failed_messages = setup_data.optional_failed_messages
	local num_main_paths = #main_paths

	for i = num_main_paths, 1, -1 do
		local from_main_path = main_paths[i]
		local from_nodes = from_main_path.nodes
		local from_node = from_nodes[1]

		for j = i - 1, 1, -1 do
			local to_main_path = main_paths[j]
			local to_nodes = to_main_path.nodes
			local to_node = to_nodes[#to_nodes]
			local is_crossroad = from_main_path.crossroads_id or to_main_path.crossroads_id
			local has_crossroad_break = is_crossroad and MainPathSpawningGenerator.main_path_has_marker_type(path_markers, j, "crossroad_break")
			local shares_crossroad_id = from_main_path.crossroads_id == to_main_path.crossroads_id
			local shares_road_id = from_main_path.road_id == to_main_path.road_id
			nodes_to_check[#nodes_to_check + 1] = {
				from_node_box = from_node,
				to_node_box = to_node,
				from_main_path_index = i,
				to_main_path_index = j,
				is_crossroad = is_crossroad,
				has_crossroad_break = has_crossroad_break,
				shares_crossroad_id = shares_crossroad_id,
				shares_road_id = shares_road_id
			}
		end

		local has_crossroad_break = MainPathSpawningGenerator.main_path_has_marker_type(path_markers, i, "crossroad_break")

		if has_crossroad_break then
			local last_from_node = from_nodes[#from_nodes]
			local crossroads_id = from_main_path.crossroads_id

			if crossroads_id then
				for j = i + 1, num_main_paths, 1 do
					local to_main_path = main_paths[j]
					local to_nodes = to_main_path.nodes
					local to_node = to_nodes[1]
					local to_main_path_crossroad_id = to_main_path.crossroads_id

					if not to_main_path_crossroad_id or to_main_path_crossroad_id == crossroads_id then
						nodes_to_check[#nodes_to_check + 1] = {
							crossroad_break_check = true,
							from_node_box = last_from_node,
							to_node_box = to_node,
							from_main_path_index = i,
							to_main_path_index = j
						}

						print("Checking crossroad break on a crossroad between " .. i .. " to " .. j)

						break
					end
				end
			else
				local chosen_crossroad_id = nil
				local checked_road_ids = {}

				for j = i + 1, num_main_paths, 1 do
					local to_main_path = main_paths[j]
					local to_nodes = to_main_path.nodes
					local to_node = to_nodes[1]
					local to_main_path_crossroad_id = to_main_path.crossroads_id
					local to_main_path_road_id = to_main_path.road_id

					if to_main_path_crossroad_id then
						chosen_crossroad_id = chosen_crossroad_id or to_main_path_crossroad_id

						if to_main_path_crossroad_id == chosen_crossroad_id and not checked_road_ids[to_main_path_road_id] then
							nodes_to_check[#nodes_to_check + 1] = {
								crossroad_break_check = true,
								from_node_box = last_from_node,
								to_node_box = to_node,
								from_main_path_index = i,
								to_main_path_index = j
							}
							checked_road_ids[to_main_path_road_id] = true

							print("Checking crossroad break between " .. i .. " to " .. j)
						end
					else
						if not chosen_crossroad_id then
							print("There is no crossroad after crossroad break " .. i)

							optional_failed_messages[#optional_failed_messages + 1] = string.format("Error! There is not a crossroad after crossroad break at main path %d at position %s ", i, tostring(to_node:unbox()))
						end

						break
					end
				end
			end
		end
	end

	return setup_data
end

LevelAnalysis.process_main_path_breaks_check = function (work_data)
	local nav_world = work_data.nav_world
	local traverse_logic = work_data.traverse_logic
	local running_astar_list = work_data.running_astar_list
	local free_astar_list = work_data.free_astar_list
	local nodes_to_check = work_data.nodes_to_check
	local max_running_astars = work_data.max_running_astars
	local drawer = work_data.drawer
	local failed_main_path_breaks = work_data.failed_main_path_breaks
	local optional_failed_messages = work_data.optional_failed_messages
	local GwNavAStar_create = GwNavAStar.create
	local GwNavAStar_start = GwNavAStar.start
	local GwNavAStar_processing_finished = GwNavAStar.processing_finished
	local GwNavAStar_path_found = GwNavAStar.path_found
	local GwNavAStar_node_count = GwNavAStar.node_count
	local GwNavAStar_node_at_index = GwNavAStar.node_at_index
	local GwNavAStar_destroy = GwNavAStar.destroy

	while #nodes_to_check > 0 and max_running_astars > #running_astar_list do
		local num_nodes_to_check = #nodes_to_check
		local next_check_data = nodes_to_check[num_nodes_to_check]
		nodes_to_check[num_nodes_to_check] = nil
		local astar_data = nil

		if #free_astar_list > 0 then
			astar_data = free_astar_list[#free_astar_list]
			free_astar_list[#free_astar_list] = nil
		else
			astar_data = {
				astar = GwNavAStar_create()
			}
		end

		local astar = astar_data.astar
		local start_position = next_check_data.from_node_box:unbox()
		local end_position = next_check_data.to_node_box:unbox()
		astar_data.from_main_path_index = next_check_data.from_main_path_index
		astar_data.to_main_path_index = next_check_data.to_main_path_index
		astar_data.from_node_box = next_check_data.from_node_box
		astar_data.to_node_box = next_check_data.to_node_box
		astar_data.is_crossroad = next_check_data.is_crossroad
		astar_data.has_crossroad_break = next_check_data.has_crossroad_break
		astar_data.shares_crossroad_id = next_check_data.shares_crossroad_id
		astar_data.shares_road_id = next_check_data.shares_road_id
		astar_data.crossroad_break_check = next_check_data.crossroad_break_check

		GwNavAStar_start(astar, nav_world, start_position, end_position, traverse_logic)

		running_astar_list[#running_astar_list + 1] = astar_data
	end

	local i = 1
	local num_running_astars = #running_astar_list

	while i <= num_running_astars do
		local current_astar_data = running_astar_list[i]
		local current_astar = current_astar_data.astar

		if GwNavAStar_processing_finished(current_astar) then
			local from_main_path_index = current_astar_data.from_main_path_index
			local to_main_path_index = current_astar_data.to_main_path_index
			local from_node_box = current_astar_data.from_node_box
			local to_node_box = current_astar_data.to_node_box
			local crossroad_break_check = current_astar_data.crossroad_break_check

			if GwNavAStar_path_found(current_astar) then
				local a, b, c = Script.temp_count()
				local fail_color = Colors.get("red")
				local small_offset = Vector3.up() * 0.25
				local large_offset = Vector3.up() * 25
				local node_count = GwNavAStar_node_count(current_astar)

				for j = 2, node_count, 1 do
					local previous_node = GwNavAStar_node_at_index(current_astar, j - 1) + small_offset
					local current_node = GwNavAStar_node_at_index(current_astar, j) + small_offset

					drawer:sphere(previous_node, 0.25, fail_color)
					drawer:line(previous_node, current_node, fail_color)

					if j == 2 then
						drawer:line(previous_node, previous_node + large_offset, fail_color)
					end

					if j == node_count then
						drawer:sphere(current_node, 0.25, fail_color)
						drawer:line(current_node, current_node + large_offset, fail_color)
					end
				end

				Script.set_temp_count(a, b, c)

				local is_crossroad = current_astar_data.is_crossroad
				local has_crossroad_break = current_astar_data.has_crossroad_break
				local shares_crossroad_id = current_astar_data.shares_crossroad_id
				local shares_road_id = current_astar_data.shares_road_id

				if crossroad_break_check then
					printf("[LevelAnalysis] Found path from crossroad break between main_path_index %d and %d (start=%s end=%s). But that's ok since it will be stitched", from_main_path_index, to_main_path_index, tostring(from_node_box:unbox()), tostring(to_node_box:unbox()))
				elseif not is_crossroad or (not has_crossroad_break and (not shares_crossroad_id or shares_road_id)) then
					local failed_data = failed_main_path_breaks[from_main_path_index] or {}
					failed_data[to_main_path_index] = {
						node = to_node_box,
						is_crossroad = is_crossroad
					}
					failed_main_path_breaks[from_main_path_index] = failed_data

					printf("[LevelAnalysis] Error! Path exist between main_path_index %d and %d (start=%s end=%s)!", from_main_path_index, to_main_path_index, tostring(from_node_box:unbox()), tostring(to_node_box:unbox()))
				elseif not shares_road_id and shares_crossroad_id then
					printf("[LevelAnalysis] Path exist between main_path_index %d and %d (start=%s end=%s), but it is between two diffrent roads in the same crossroad that wont exist together.", from_main_path_index, to_main_path_index, tostring(from_node_box:unbox()), tostring(to_node_box:unbox()))
				end
			elseif crossroad_break_check then
				local failed_data = failed_main_path_breaks[from_main_path_index] or {}
				failed_data[to_main_path_index] = {
					node = to_node_box,
					optional_failed_messages = optional_failed_messages
				}
				failed_main_path_breaks[from_main_path_index] = failed_data

				printf("[LevelAnalysis] Could not find path to mainpath after crossroad break %d and %d (start=%s end=%s), make sure crossroad breaks can be stitched to either a crossroad or another mainpath.", from_main_path_index, to_main_path_index, tostring(from_node_box:unbox()), tostring(to_node_box:unbox()))
			else
				printf("[LevelAnalysis] Break between main_path_index %d and %d seems good (start=%s end=%s).", from_main_path_index, to_main_path_index, tostring(from_node_box:unbox()), tostring(to_node_box:unbox()))
			end

			free_astar_list[#free_astar_list + 1] = current_astar_data
			running_astar_list[i] = running_astar_list[num_running_astars]
			running_astar_list[num_running_astars] = nil
			num_running_astars = num_running_astars - 1
		else
			i = i + 1
		end
	end

	if #nodes_to_check == 0 and #running_astar_list == 0 then
		local num_free_astars = #free_astar_list

		for j = 1, num_free_astars, 1 do
			local current_astar_data = free_astar_list[j]
			local current_astar = current_astar_data.astar

			GwNavAStar_destroy(current_astar)

			free_astar_list[j] = nil
		end

		local error_string = nil

		for from_main_path_index, data in pairs(failed_main_path_breaks) do
			if error_string == nil then
				error_string = "Found player path(s) between the main path indexes listed below. Either remove main path break or the path that allows the player to traverse back."
			end

			for to_main_path_index, sub_data in pairs(data) do
				local node = sub_data.node
				local crossroad_string = ""

				if sub_data.is_crossroad then
					crossroad_string = "\nNote: Breaks in this crossroad path needs to be changed to crossroad_break."
				end

				error_string = string.format("%s\n%d -> %d:\t%s %s", error_string, from_main_path_index, to_main_path_index, tostring(node:unbox()), crossroad_string)
			end
		end

		if optional_failed_messages then
			for j = 1, #optional_failed_messages, 1 do
				local msg = optional_failed_messages[j]
				error_string = "\n" .. error_string .. msg
			end
		end

		printf("[LevelAnalysis] Main Path Break Check Done!")

		return true, error_string
	else
		return false
	end
end

LevelAnalysis.check_splines_integrity = function (self)
	print("----> Checking splines integrity START:")

	local ai_group_system = Managers.state.entity:system("ai_group_system")
	local formation = PatrolFormationSettings.storm_vermin_two_column.normal
	local roaming_waypoints = self.patrol_waypoints

	for i = 1, #roaming_waypoints, 1 do
		local route_data = roaming_waypoints[i]
		local astar_points = route_data.astar_points
		local spline_name = route_data.id
		local faulty = false
		local pA, pB = astar_points[1]:unbox()

		for j = 2, #astar_points, 1 do
			pB = astar_points[j]:unbox()
			local dist = Vector3.distance_squared(pA, pB)

			if dist > 0.01 then
				pA = pB
			else
				pA = pB
				faulty = true

				print("SPLINE HAS FAULTY POINTS:", j, spline_name, pA, pB, Vector3.distance(pA, pB))
			end
		end

		if faulty then
			print("Faulty spline - ", spline_name, ", points:")

			for j = 1, #astar_points, 1 do
				print(j, astar_points[j]:unbox())
			end

			print("")
		end

		local start_position = ai_group_system:spline_start_position(spline_name)
		slot15 = ai_group_system:create_formation_data(start_position, formation, spline_name)
	end

	print("----> Checking splines integrity ENDS.")
end

return
