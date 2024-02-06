-- chunkname: @scripts/helpers/navigation_utils.lua

NavigationUtils = NavigationUtils or {}

NavigationUtils.create_exclusive_box_obstacle_from_unit_data = function (nav_world, unit)
	local is_exclusive = true
	local color = Color(255, 255, 0, 0)
	local has_layer = false
	local layer_idx = 0
	local has_smartobject = false
	local smartobject_idx = 0
	local mesh_name = Unit.get_data(unit, "navtag_volume", "mesh_name")
	local padding_x = Unit.has_data(unit, "navtag_volume", "padding_x") and Unit.get_data(unit, "navtag_volume", "padding_x") or 0
	local padding_y = Unit.has_data(unit, "navtag_volume", "padding_y") and Unit.get_data(unit, "navtag_volume", "padding_y") or 0
	local padding_z = Unit.has_data(unit, "navtag_volume", "padding_z") and Unit.get_data(unit, "navtag_volume", "padding_z") or 0

	return NavigationUtils.create_exclusive_box_obstacle_from_mesh(nav_world, unit, is_exclusive, color, has_layer, layer_idx, has_smartobject, smartobject_idx, mesh_name, padding_x, padding_y, padding_z)
end

NavigationUtils.create_exclusive_box_obstacle_from_mesh = function (nav_world, unit, is_exclusive, color, has_layer, layer_idx, has_smartobject, smartobject_idx, mesh_name, padding_x, padding_y, padding_z)
	local mesh = Unit.mesh(unit, mesh_name)
	local padding = Vector3(padding_x, padding_y, padding_z)
	local _, mesh_size = Mesh.box(mesh)
	local size = mesh_size + padding
	local transform = Mesh.world_pose(mesh)
	local position = Matrix4x4.translation(transform)
	local local_center = Vector3(0, 0, 0)
	local obstacle = GwNavBoxObstacle.create(nav_world, position, local_center, size, is_exclusive, color, layer_idx, smartobject_idx)

	return obstacle, transform
end

NavigationUtils.debug_draw_nav_mesh = function (nav_world, nav_cost_maps_data, nav_cost_maps_count, world, line_object)
	GwNavWorld.build_database_visual_representation(nav_world)

	local tile_count = GwNavWorld.database_tile_count(nav_world)

	for tile = 1, tile_count do
		local triangle_count = GwNavWorld.database_tile_triangle_count(nav_world, tile)

		for i = 1, triangle_count do
			local num_vectors, num_quaternions, num_matrices = Script.temp_count()
			local a, b, c, tri_color = GwNavWorld.database_triangle(nav_world, tile, i)

			if a then
				LineObject.add_line(line_object, tri_color, a, b)
				LineObject.add_line(line_object, tri_color, b, c)
				LineObject.add_line(line_object, tri_color, c, a)
			end

			Script.set_temp_count(num_vectors, num_quaternions, num_matrices)
		end
	end

	if nav_cost_maps_data then
		local tri_color = Colors.get("yellow")

		for cost_map_index = 1, nav_cost_maps_count do
			local cost_map_data = nav_cost_maps_data[cost_map_index]

			if cost_map_data then
				local cost_map = cost_map_data.cost_map
				local triangle_count = GwNavCostMap.get_debug_triangle_count(cost_map)

				for triangle = 1, triangle_count do
					local num_vectors, num_quaternions, num_matrices = Script.temp_count()
					local a, b, c = GwNavCostMap.get_debug_triangle(cost_map, triangle)

					if a then
						LineObject.add_line(line_object, tri_color, a, b)
						LineObject.add_line(line_object, tri_color, b, c)
						LineObject.add_line(line_object, tri_color, c, a)
					end

					Script.set_temp_count(num_vectors, num_quaternions, num_matrices)
				end
			end
		end
	end

	LineObject.dispatch(world, line_object)
	LineObject.reset(line_object)
end

NavigationUtils.get_closest_index_on_spline = function (spline_curve, position)
	local splines = spline_curve:splines()
	local smallest_distance_sq, point, best_index = math.huge, nil, 1
	local Vector3_distance_squared = Vector3.distance_squared
	local num_splines = #splines

	for i = 1, num_splines do
		local spline = splines[i]
		local points = spline.points
		local point_position = points[2]:unbox()
		local distance_sq = Vector3_distance_squared(position, point_position)

		if distance_sq < smallest_distance_sq then
			smallest_distance_sq = distance_sq
			point = point_position
			best_index = i
		end
	end

	return best_index, point
end

NavigationUtils.get_position_on_interpolated_spline = function (spline_curve, position)
	local Vector3_distance_squared = Vector3.distance_squared
	local splines = spline_curve:splines()
	local num_splines = #splines
	local best_distance_sq, best_spline_index, best_subdivision_index = math.huge

	for j = 1, num_splines do
		local spline = splines[j]
		local subdivisions = spline.subdivisions
		local num_subdivisions = #subdivisions

		for k = 1, num_subdivisions do
			local subdivision = subdivisions[k]
			local subdivision_position = subdivision.points[2]:unbox()
			local distance_sq = Vector3_distance_squared(position, subdivision_position)

			if distance_sq < best_distance_sq then
				best_distance_sq = distance_sq
				best_spline_index = j
				best_subdivision_index = k
			end
		end
	end

	local closest_subdivisions = splines[best_spline_index].subdivisions
	local closest_subdivision = closest_subdivisions[best_subdivision_index]
	local closest_subdivision_position = closest_subdivision.points[2]:unbox()
	local previous_subdivision_index, previous_spline_index, previous_subdivision, previous_subdivision_position, next_subdivision_position, final_spline_index, final_subdivision_index, t

	if best_subdivision_index > 1 then
		previous_subdivision_index = best_subdivision_index - 1
		previous_subdivision = closest_subdivisions[previous_subdivision_index]
		previous_subdivision_position = previous_subdivision.points[2]:unbox()
	elseif best_spline_index > 1 then
		previous_spline_index = best_spline_index - 1

		local previous_spline = splines[previous_spline_index]
		local previous_spline_subdivisions = previous_spline.subdivisions

		previous_subdivision_index = #previous_spline_subdivisions
		previous_subdivision = previous_spline_subdivisions[previous_subdivision_index]
		previous_subdivision_position = previous_subdivision.points[2]:unbox()
	end

	if false then
		-- Nothing
	end

	if best_subdivision_index < #closest_subdivisions then
		local next_subdivision = closest_subdivisions[best_subdivision_index + 1]

		next_subdivision_position = next_subdivision.points[2]:unbox()
	elseif best_spline_index < num_splines then
		local next_spline = splines[best_spline_index + 1]
		local next_spline_subdivisions = next_spline.subdivisions
		local next_subdivision = next_spline_subdivisions[1]

		next_subdivision_position = next_subdivision.points[2]:unbox()
	else
		local spline_points = splines[num_splines].points

		next_subdivision_position = spline_points[#spline_points]:unbox()
	end

	if previous_subdivision_position then
		local previous_to_position = position - previous_subdivision_position
		local previous_to_closest = Vector3.normalize(closest_subdivision_position - previous_subdivision_position)
		local previous_subdivision_length = previous_subdivision.length
		local dot = Vector3.dot(previous_to_position, previous_to_closest)

		if dot >= 0 and dot <= previous_subdivision_length then
			t = dot / previous_subdivision_length
		elseif next_subdivision_position == nil then
			t = math.clamp(dot, 0, 1)
		end
	end

	if t then
		final_spline_index = previous_spline_index or best_spline_index
		final_subdivision_index = previous_subdivision_index
	else
		local closest_to_position = position - closest_subdivision_position
		local closest_to_next = Vector3.normalize(next_subdivision_position - closest_subdivision_position)
		local next_subdivision_length = closest_subdivision.length
		local dot = Vector3.dot(closest_to_position, closest_to_next)

		if dot >= 0 and dot <= next_subdivision_length then
			t = dot / next_subdivision_length
		else
			t = math.clamp(dot, 0, 1)
		end

		final_spline_index = best_spline_index
		final_subdivision_index = best_subdivision_index
	end

	return final_spline_index, final_subdivision_index, t
end
