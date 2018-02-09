NavigationUtils = NavigationUtils or {}
NavigationUtils.create_exclusive_box_obstacle_from_unit_data = function (nav_world, unit)
	local is_exclusive = true
	local color = Color(255, 255, 0, 0)
	local has_layer = false
	local layer_idx = 0
	local has_smartobject = false
	local smartobject_idx = 0
	local mesh_name = Unit.get_data(unit, "navtag_volume", "mesh_name")
	local padding_x = (Unit.has_data(unit, "navtag_volume", "padding_x") and Unit.get_data(unit, "navtag_volume", "padding_x")) or 0
	local padding_y = (Unit.has_data(unit, "navtag_volume", "padding_y") and Unit.get_data(unit, "navtag_volume", "padding_y")) or 0
	local padding_z = (Unit.has_data(unit, "navtag_volume", "padding_z") and Unit.get_data(unit, "navtag_volume", "padding_z")) or 0

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

	for tile = 1, tile_count, 1 do
		local triangle_count = GwNavWorld.database_tile_triangle_count(nav_world, tile)

		for i = 1, triangle_count, 1 do
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

		for cost_map_index = 1, nav_cost_maps_count, 1 do
			local cost_map_data = nav_cost_maps_data[cost_map_index]

			if cost_map_data then
				local cost_map = cost_map_data.cost_map
				local triangle_count = GwNavCostMap.get_debug_triangle_count(cost_map)

				for triangle = 1, triangle_count, 1 do
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

	return 
end
NavigationUtils.get_closest_index_on_spline = function (spline_curve, position)
	local splines = spline_curve.splines(spline_curve)
	local smallest_distance = math.huge
	local point = nil
	local best_index = 1

	for index, spline in ipairs(splines) do
		local points = spline.points
		local point_position = points[2]:unbox()
		local distance = Vector3.distance(position, point_position)

		if distance < smallest_distance then
			smallest_distance = distance
			point = point_position
			best_index = index
		end
	end

	return best_index, point
end

return 
