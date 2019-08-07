require("foundation/scripts/util/error")
require("scripts/utils/util")

MainPathSpawningGenerator = {
	_remove_zones_due_to_crossroads = function (zones, num_main_zones, removed_path_distances)
		local to_remove = FrameTable.alloc_table()
		local num_removed_dist_pairs = #removed_path_distances

		for i = 1, num_main_zones, 1 do
			local zone = zones[i]
			local travel_dist = zone.travel_dist

			fassert(zone.type ~= "island", "Zones badly stored")

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
	end,
	inject_travel_dists = function (main_paths, overrride)
		print("[MainPathSpawningGenerator] Injecting travel distances")

		local Vector3_distance = Vector3.distance
		local first_path = main_paths[1]

		if not first_path.travel_dist or overrride then
			local total_travel_dist = 0
			local p1 = first_path.nodes[1]:unbox()

			for i = 1, #main_paths, 1 do
				local path = main_paths[i]
				local nodes = path.nodes
				local p2 = nodes[1]:unbox()
				total_travel_dist = total_travel_dist + Vector3_distance(p1, p2)
				local travel_dist = {
					total_travel_dist
				}

				for j = 2, #nodes, 1 do
					p1 = nodes[j - 1]:unbox()
					p2 = nodes[j]:unbox()
					total_travel_dist = total_travel_dist + Vector3_distance(p1, p2)
					travel_dist[j] = total_travel_dist
				end

				p1 = p2
				path.travel_dist = travel_dist
			end
		end
	end,
	main_path_has_marker_type = function (path_markers, main_path_index, marker_type)
		local has_marker_type = nil

		for i = 1, #path_markers, 1 do
			local path_marker = path_markers[i]
			local path_marker_main_path_index = path_marker.main_path_index
			local path_marker_type = path_marker.marker_type

			if path_marker_main_path_index == main_path_index and path_marker_type == marker_type then
				has_marker_type = true

				break
			end
		end

		return has_marker_type
	end,
	load_spawn_zone_data = function (spawn_zone_path)
		local spawn_data = require(spawn_zone_path)
		local path_markers = spawn_data.path_markers

		for i = 1, #path_markers, 1 do
			local marker = path_markers[i]
			local p = marker.pos
			marker.pos = Vector3Box(p[1], p[2], p[3])
		end

		return spawn_data
	end,
	generate_crossroad_path_choices = function (crossroads, seed)
		if not crossroads or not next(crossroads) then
			return nil
		end

		local chosen_road_id = nil
		local chosen_crossroads = {}

		for crossroad_id, crossroad in pairs(crossroads) do
			seed, chosen_road_id = Math.next_random(seed, 1, #crossroad.roads)
			chosen_crossroads[crossroad_id] = chosen_road_id
		end

		return chosen_crossroads
	end
}

MainPathSpawningGenerator.remove_crossroads_extra_path_branches = function (crossroads, chosen_crossroads, main_paths, zones, num_main_zones, path_markers, seed)
	if not crossroads or not next(crossroads) then
		print("[MainPathSpawningGenerator] This levels contains no crossroads")

		return
	end

	local to_remove = FrameTable.alloc_table()
	local crossroad_main_path_indices = FrameTable.alloc_table()
	local chosen_crossroad_paths = FrameTable.alloc_table()

	for crossroads_id, chosen_road_id in pairs(chosen_crossroads) do
		local crossroad = crossroads[crossroads_id]

		printf("[MainPathSpawningGenerator] Using path: %d at crossroad: %s. (1/%d paths).", chosen_road_id, crossroads_id, #crossroad.roads)

		for k = #main_paths, 1, -1 do
			local main_path = main_paths[k]

			if main_path.crossroads_id == crossroads_id and main_path.road_id == chosen_road_id then
				chosen_crossroad_paths[k] = true
				crossroad_main_path_indices[#crossroad_main_path_indices + 1] = k

				printf("[MainPathSpawningGenerator]\t\t->preparing to stitch road: %d that has main path index: %d ", main_path.road_id, k)
			end
		end

		for k = 1, #main_paths, 1 do
			local main_path = main_paths[k]

			if main_path.crossroads_id == crossroads_id and main_path.road_id ~= chosen_road_id then
				printf("[MainPathSpawningGenerator]\t\t->removing road: %d from crossroad: %s with main path index: %d", main_path.road_id, main_path.crossroads_id, k)

				to_remove[#to_remove + 1] = k
			end
		end
	end

	local to_stitch = FrameTable.alloc_table()

	for i = #crossroad_main_path_indices, 1, -1 do
		repeat
			to_stitch[#to_stitch + 1] = {}
			local crossroad_stitch = to_stitch[#to_stitch]
			local index = crossroad_main_path_indices[i]
			local previous_main_path_index = index - 1

			for k = #to_remove, 1, -1 do
				local removed_main_path_index = to_remove[k]

				if previous_main_path_index == removed_main_path_index then
					previous_main_path_index = previous_main_path_index - 1
				end
			end

			local previous_has_break = MainPathSpawningGenerator.main_path_has_marker_type(path_markers, previous_main_path_index, "break")

			if not previous_has_break then
				crossroad_stitch[#crossroad_stitch + 1] = previous_main_path_index
				crossroad_stitch[#crossroad_stitch + 1] = index
			end

			local crossroad_has_break = MainPathSpawningGenerator.main_path_has_marker_type(path_markers, index, "break")

			if crossroad_has_break then
				break
			end

			local next_main_path_index = index + 1

			for k = 1, #to_remove, 1 do
				local removed_main_path_index = to_remove[k]

				if next_main_path_index == removed_main_path_index then
					next_main_path_index = next_main_path_index + 1
				end
			end

			if previous_has_break then
				crossroad_stitch[#crossroad_stitch + 1] = index
			end

			if not chosen_crossroad_paths[next_main_path_index] then
				crossroad_stitch[#crossroad_stitch + 1] = next_main_path_index
			end
		until true
	end

	for i = 1, #to_stitch, 1 do
		repeat
			local stitched_indices = to_stitch[i]

			if #stitched_indices <= 1 then
				break
			end

			local wanted_main_path_index = stitched_indices[1]
			local wanted_main_path = main_paths[wanted_main_path_index]
			local wanted_main_path_nodes = wanted_main_path.nodes

			for k = 2, #stitched_indices, 1 do
				local stitch_index = stitched_indices[k]
				local stitch_main_path = main_paths[stitch_index]
				local stitch_main_path_nodes = stitch_main_path.nodes

				for j = 1, #stitch_main_path_nodes, 1 do
					local stiched_node = stitch_main_path_nodes[j]
					wanted_main_path_nodes[#wanted_main_path_nodes + 1] = stiched_node
				end

				printf("[MainPathSpawningGenerator] Stitched and removed main path index: %d", stitch_index)

				to_remove[#to_remove + 1] = stitch_index
			end
		until true
	end

	table.sort(to_remove, function (a, b)
		return a < b
	end)

	local removed_path_distances = {}

	for k = #to_remove, 1, -1 do
		local index = to_remove[k]
		local travel_dist = main_paths[index].travel_dist
		local was_stitched_path = chosen_crossroad_paths[index]

		if not was_stitched_path then
			removed_path_distances[#removed_path_distances + 1] = {
				travel_dist[1],
				travel_dist[#travel_dist]
			}
		end

		table.remove(main_paths, index)
	end

	num_main_zones = MainPathSpawningGenerator._remove_zones_due_to_crossroads(zones, num_main_zones, removed_path_distances)

	return true, num_main_zones, removed_path_distances
end

MainPathSpawningGenerator.generate_great_cycles = function (conflict_director, zones, zone_convert, num_main_zones, spawn_cycle_length)
	local cycle_length = 0
	local cycle_zones = {}
	local great_cycles = {}
	local pack_spawning_setting = conflict_director.pack_spawning
	local initial_roaming_set = pack_spawning_setting.roaming_set
	local random_director_list = Managers.state.conflict.enemy_package_loader.random_director_list
	local director_index = 1

	for i = 1, num_main_zones, 1 do
		local zone_layer = zones[i]
		local override_conflict_setting = zone_layer.roaming_set

		if override_conflict_setting then
			if override_conflict_setting == "random" then
				override_conflict_setting = random_director_list[director_index].name
				director_index = director_index + 1
			end

			conflict_director = ConflictDirectors[override_conflict_setting]
			local pack_spawning = conflict_director.pack_spawning

			if pack_spawning then
				pack_spawning_setting = pack_spawning
			end
		end

		local outer = {}
		local total_zone_area = zone_layer.sub_areas[1]
		local pack_type = pack_spawning_setting.roaming_set.breed_packs
		local zone = {
			total_area = 0,
			nodes = zone_layer.sub[1],
			area = zone_layer.sub_areas[1],
			outer = outer,
			pack_type = pack_type,
			pack_spawning_setting = pack_spawning_setting,
			conflict_setting = conflict_director,
			unique_zone_id = zone_layer.unique_zone_id
		}

		for j = 2, #zone_layer.sub, 1 do
			local area = zone_layer.sub_areas[j]
			total_zone_area = total_zone_area + (area or 0)
			outer[#outer + 1] = {
				nodes = zone_layer.sub[j],
				area = area
			}
		end

		zone.total_area = total_zone_area
		cycle_length = cycle_length + zone_layer.sub_zone_length
		cycle_zones[#cycle_zones + 1] = zone
		zone_convert[i] = zone

		if spawn_cycle_length <= cycle_length or i == num_main_zones then
			great_cycles[#great_cycles + 1] = {
				zones = cycle_zones,
				length = cycle_length
			}
			cycle_length = cycle_length - spawn_cycle_length
			cycle_zones = {}
		end
	end

	return great_cycles
end

MainPathSpawningGenerator.get_unique_non_random_conflict_directors = function (default_conflict_director_name, zones, num_main_zones)
	local non_random_conflict_directors = {}
	local num_random = 0
	local num_non_random = 0

	if num_main_zones > 0 then
		if zones[1].roaming_set == nil then
			non_random_conflict_directors[default_conflict_director_name] = true
		end

		for i = 1, num_main_zones, 1 do
			local zone_layer = zones[i]
			local conflict_director_name = zone_layer.roaming_set

			if conflict_director_name then
				if conflict_director_name == "random" then
					num_random = num_random + 1
				else
					non_random_conflict_directors[conflict_director_name] = true
					num_non_random = num_non_random + 1
				end
			end
		end
	else
		non_random_conflict_directors[default_conflict_director_name] = true
	end

	return non_random_conflict_directors, num_random, num_non_random
end

return
