MainPathUtils = {}
local distance_squared = Vector3.distance_squared
local Geometry = Geometry
local Vector3_distance = Vector3.distance

MainPathUtils.total_path_dist = function ()
	return EngineOptimized.main_path_total_length()
end

MainPathUtils.closest_pos_at_main_path = function (not_used, p, search_main_path_index)
	local start_node_index, end_node_index = nil

	if search_main_path_index then
		local level_analysis = Managers.state.conflict.level_analysis
		local main_path_data = level_analysis.main_path_data
		local breaks_order = main_path_data.breaks_order

		if search_main_path_index == 1 then
			start_node_index = 1
		else
			start_node_index = breaks_order[search_main_path_index - 1] + 1
		end

		end_node_index = breaks_order[search_main_path_index]
	end

	return EngineOptimized.closest_pos_at_main_path(p, start_node_index, end_node_index)
end

MainPathUtils.closest_pos_at_main_path_lua = function (main_paths, p, search_main_path_index)
	Profiler.start("closest_pos_at_main_path")

	local best_dist = math.huge
	local best_main_path, best_sub_index = nil
	local best_point = Vector3(0, 0, 0)
	local best_point_found = false
	local best_travel_dist = 0
	local total_path_dist = 0
	p = p or main_paths[1].nodes[1]:unbox()
	local Vector3_set_xyz = Vector3.set_xyz
	local Vector3_to_elements = Vector3.to_elements
	local Geometry_closest_point_on_line = Geometry.closest_point_on_line
	local Script_set_temp_count = Script.set_temp_count
	local Script_temp_count = Script.temp_count
	local start_index = search_main_path_index or 1
	local end_index = search_main_path_index or #main_paths

	for i = start_index, end_index, 1 do
		local sub_path = main_paths[i]
		local nodes = sub_path.nodes
		total_path_dist = total_path_dist + sub_path.path_length

		for j = 1, #nodes - 1, 1 do
			local num_v, num_q, num_m = Script_temp_count()
			local p1 = nodes[j]:unbox()
			local p2 = nodes[j + 1]:unbox()
			local closest_point = Geometry_closest_point_on_line(p, p1, p2)
			local d = distance_squared(p, closest_point)

			if d < best_dist then
				best_dist = d
				best_main_path = i
				best_sub_index = j
				best_point_found = true

				Vector3_set_xyz(best_point, Vector3_to_elements(closest_point))
			end

			Script_set_temp_count(num_v, num_q, num_m)
		end
	end

	local move_percent, closest_node = nil

	if best_point_found then
		local path = main_paths[best_main_path]
		closest_node = path.nodes[best_sub_index]:unbox()
		best_travel_dist = (path.travel_dist and path.travel_dist[best_sub_index] + Vector3.distance(best_point, closest_node)) or 0
		move_percent = best_travel_dist / total_path_dist
	else
		best_point = nil
	end

	Profiler.stop("closest_pos_at_main_path")

	return best_point, best_travel_dist, total_path_dist, move_percent, best_main_path, best_sub_index
end

MainPathUtils.collapse_main_paths = function (main_paths)
	local unified_path = {}
	local unified_travel_dists = {}
	local breaks = {}
	local breaks_order = {}
	local segments = {}
	local k = 1

	for i = 1, #main_paths, 1 do
		local sub_path = main_paths[i]
		local nodes = sub_path.nodes
		local travel_dist = sub_path.travel_dist
		local break_index = (k + #nodes) - 1

		if i < #main_paths then
			breaks[break_index] = 0
		end

		breaks_order[i] = break_index

		for j = 1, #nodes, 1 do
			unified_path[k] = nodes[j]
			unified_travel_dists[k] = travel_dist[j]
			segments[k] = i
			k = k + 1
		end
	end

	for break_index, data in pairs(breaks) do
		breaks[break_index] = (unified_travel_dists[break_index] + unified_travel_dists[break_index + 1]) / 2
	end

	EngineOptimized.register_main_path(unified_path, unified_travel_dists, segments, #main_paths)

	return unified_path, unified_travel_dists, segments, breaks, breaks_order
end

MainPathUtils.point_on_mainpath = function (main_paths, wanted_distance)
	return EngineOptimized.point_on_mainpath(wanted_distance)
end

MainPathUtils.point_on_mainpath_lua = function (main_paths, wanted_distance)
	if wanted_distance < 0 then
		return main_paths[1].nodes[1]:unbox(), 1
	end

	local segment_distance = 0
	local get_path_point = LevelAnalysis.get_path_point

	for i = 1, #main_paths, 1 do
		local sub_path = main_paths[i]
		segment_distance = segment_distance + sub_path.path_length

		if wanted_distance <= segment_distance then
			local remainder_dist = wanted_distance - (segment_distance - sub_path.path_length)
			local sub_move_percent = remainder_dist / sub_path.path_length
			local pos, sub_index = get_path_point(sub_path.nodes, sub_path.path_length, sub_move_percent)

			return pos, i, sub_index
		end
	end

	local num_main_paths = #main_paths
	local nodes = main_paths[num_main_paths].nodes

	return nodes[#nodes]:unbox(), num_main_paths
end

MainPathUtils.zone_segment_on_mainpath = function (main_paths, p)
	local best_point, best_travel_dist, move_percent = MainPathUtils.closest_pos_at_main_path(main_paths, p)
	local index = math.floor((best_travel_dist + 5) / 10)

	return index
end

function moll()
	local start_point = EngineOptimized.point_on_mainpath(0)
	local path_pos, travel_dist, move_percent, sub_index, path_index = EngineOptimized.closest_pos_at_main_path(start_point)
	local current_path_index = path_index
	local segment_index, break_node_index, last_node_position = EngineOptimized.main_path_next_break(current_path_index)

	while break_node_index do
		print("MAINPATH: ", current_path_index, segment_index, break_node_index, last_node_position)

		local pos = EngineOptimized.point_on_mainpath(travel_dist + 1)
		path_pos, travel_dist, move_percent, sub_index, path_index = EngineOptimized.closest_pos_at_main_path(pos)

		QuickDrawerStay:sphere(path_pos, 3, Color(0, 0, 255))

		if path_index ~= current_path_index then
			local segment_index, break_node_index, last_node_position = EngineOptimized.main_path_next_break(path_index)
			current_path_index = path_index
		else
			break
		end
	end
end

local index_list = {
	0,
	1,
	-1,
	5,
	-5,
	20,
	-20
}
local index_list_size = #index_list

MainPathUtils.closest_pos_at_collapsed_main_path = function (collapsed_path, collapsed_dists, breaks_lookup, p, last_index)
	last_index = last_index or 1
	local num_nodes = #collapsed_path
	local last_node = num_nodes - 1
	local math_clamp = math.clamp
	local best_dist = math.huge
	local best_point = Vector3(0, 0, 0)
	local best_index = false
	local total_path_dist = collapsed_dists[num_nodes]
	p = p or collapsed_path[1]:unbox()
	local Vector3_set_xyz = Vector3.set_xyz
	local Vector3_to_elements = Vector3.to_elements
	local Geometry_closest_point_on_line = Geometry.closest_point_on_line

	for j = 1, index_list_size, 1 do
		local i = last_index + index_list[j]
		i = math_clamp(i, 1, last_node)
		local p1 = collapsed_path[i]:unbox()
		local p2 = collapsed_path[i + 1]:unbox()
		local closest_point = Geometry_closest_point_on_line(p, p1, p2)
		local d = distance_squared(p, closest_point)

		if d < best_dist then
			best_dist = d
			best_index = i

			Vector3_set_xyz(best_point, Vector3_to_elements(closest_point))
		end
	end

	local move_percent, closest_node = nil
	local best_travel_dist = 0

	if best_index then
		closest_node = collapsed_path[best_index]:unbox()
		local node_dist = collapsed_dists[best_index]
		best_travel_dist = node_dist + Vector3_distance(best_point, closest_node)
		local at_break = breaks_lookup[best_index]

		if at_break and node_dist < best_travel_dist then
			if at_break < best_travel_dist then
				best_travel_dist = collapsed_dists[best_index + 1]
				best_point = collapsed_path[best_index + 1]:unbox()
			else
				best_travel_dist = node_dist
				best_point = closest_node
			end
		end

		move_percent = best_travel_dist / total_path_dist
	else
		best_point = nil
	end

	return best_point, best_travel_dist, move_percent, best_index
end

MainPathUtils.resolve_node_in_door = function (nav_world, node_position, door_unit)
	local nav_graph_extension = ScriptUnit.has_extension(door_unit, "nav_graph_system")

	if nav_graph_extension == nil then
		return node_position
	end

	local nav_graph_system = Managers.state.entity:system("nav_graph_system")
	local smart_object_id = nav_graph_system:get_smart_object_id(door_unit)
	local smart_object_unit_data = nav_graph_system:get_smart_objects(smart_object_id)

	for _, smart_object_data in pairs(smart_object_unit_data) do
		local entrance_position = Vector3Aux.unbox(smart_object_data.pos1)
		local exit_position = Vector3Aux.unbox(smart_object_data.pos2)
		local entrance_distance_sq = Vector3.distance_squared(node_position, entrance_position)
		local exit_distance_sq = Vector3.distance_squared(node_position, exit_position)

		if entrance_distance_sq < exit_distance_sq then
			node_position = entrance_position
		else
			node_position = exit_position
		end

		local success, z = GwNavQueries.triangle_from_position(nav_world, node_position, 1.5, 1.5)

		if success then
			node_position.z = z

			break
		end

		node_position = nil

		break
	end

	return node_position
end

local DOOR_SEARCH_RADIUS = 1.5

MainPathUtils.node_list_from_main_paths = function (nav_world, main_paths, max_node_distance, obstacles)
	local forward_list = {}
	local reversed_list = {}
	local forward_break_list = {}
	local reversed_break_list = {}
	local door_system = Managers.state.entity:system("door_system")
	local door_broadphase_query_result = {}

	for i = 1, #main_paths, 1 do
		local path_nodes = main_paths[i].nodes

		for j = 1, #path_nodes, 1 do
			local node = path_nodes[j]
			forward_list[#forward_list + 1] = node

			if i ~= 1 and j == 1 then
				reversed_break_list[node] = true
			elseif i ~= #main_paths and j == #path_nodes then
				forward_break_list[node] = true
			end

			if max_node_distance then
				local next_node = path_nodes[j + 1]

				if next_node then
					local segment = next_node:unbox() - node:unbox()
					local segment_length = Vector3.length(segment)

					if max_node_distance < segment_length then
						local segment_direction = Vector3.normalize(segment)
						local num_insert_nodes = math.floor(segment_length / max_node_distance)

						for k = 1, num_insert_nodes, 1 do
							local wanted_node_position = node:unbox() + segment_direction * k * max_node_distance
							local num_doors = door_system:get_doors(wanted_node_position, DOOR_SEARCH_RADIUS, door_broadphase_query_result)

							if num_doors > 0 then
								local door_unit = door_broadphase_query_result[1]
								wanted_node_position = MainPathUtils.resolve_node_in_door(nav_world, wanted_node_position, door_unit)
							else
								local success, z = GwNavQueries.triangle_from_position(nav_world, wanted_node_position, 1.5, 1.5)

								if success then
									wanted_node_position.z = z
								else
									wanted_node_position = nil
								end
							end

							if wanted_node_position then
								local new_node = Vector3Box(wanted_node_position)
								forward_list[#forward_list + 1] = new_node
							end
						end
					end
				end
			end
		end
	end

	if obstacles then
		for i = 1, #obstacles, 1 do
			local obstacle = obstacles[i]
			local obstacle_position = obstacle.position:unbox()
			local path_position, _, _, _, _, best_sub_index = MainPathUtils.closest_pos_at_main_path_lua({
				{
					path_length = 1,
					nodes = forward_list
				}
			}, obstacle_position)

			if path_position then
				local distance_sq = distance_squared(path_position, obstacle_position)

				if distance_sq <= obstacle.radius_sq then
					local add_break_node = forward_list[best_sub_index]
					forward_break_list[forward_list[best_sub_index]] = true
					reversed_break_list[forward_list[best_sub_index + 1]] = true
				end
			end
		end
	end

	for i = #forward_list, 1, -1 do
		reversed_list[#reversed_list + 1] = forward_list[i]
	end

	return forward_list, reversed_list, forward_break_list, reversed_break_list
end

MainPathUtils.closest_node_in_node_list = function (node_list, p)
	local best_dist = math.huge
	local best_index = nil

	for i = 1, #node_list, 1 do
		local node_position = node_list[i]:unbox()
		local d = distance_squared(p, node_position)

		if d < best_dist then
			best_dist = d
			best_index = i
		end
	end

	return best_index
end

MainPathUtils.ray_along_node_list = function (nav_world, node_list, start_node_index, node_list_direction, wanted_distance)
	local end_node_index = (node_list_direction == -1 and 1) or #node_list
	local distance = 0

	for i = start_node_index, end_node_index, node_list_direction do
		local to_node = node_list[i + node_list_direction]

		if not to_node then
			return distance
		end

		local from_node = node_list[i]
		local from_position = from_node:unbox()
		local to_position = to_node:unbox()
		local success, hit_position = GwNavQueries.raycast(nav_world, from_position, to_position)

		if success then
			distance = distance + Vector3.length(to_position - from_position)

			if wanted_distance <= distance then
				return wanted_distance
			end
		else
			distance = distance + Vector3.length(hit_position - from_position)

			if wanted_distance <= distance then
				return wanted_distance
			else
				return distance
			end
		end
	end
end

MainPathUtils.find_equidistant_points_in_node_list = function (node_list, start_node_index, node_list_direction, point_distance, num_wanted_points, points)
	local node_index = start_node_index
	local point_index = 1
	local segment_offset = 0

	while true do
		local to_node_index = node_index + node_list_direction
		local to_node = node_list[to_node_index]

		if not to_node then
			return points
		end

		local segment_start = node_list[node_index]:unbox()
		local segment_end = to_node:unbox()
		local segment = segment_end - segment_start
		local segment_length = Vector3.length(segment)
		local segment_direction = Vector3.normalize(segment)
		local num_points_in_segment = math.ceil((segment_length - segment_offset) / point_distance)

		for i = 0, num_points_in_segment - 1, 1 do
			points[point_index] = {
				segment_start + segment_direction * (segment_offset + i * point_distance),
				segment_direction * node_list_direction,
				node_index
			}
			point_index = point_index + 1

			if num_wanted_points and num_wanted_points < point_index then
				return points
			end
		end

		local segment_remainder = segment_length - (num_points_in_segment - 1) * point_distance
		segment_offset = (segment_offset + point_distance) - segment_remainder
		node_index = node_index + node_list_direction
	end
end

return
