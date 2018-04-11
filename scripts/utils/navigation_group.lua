NavigationGroup = class(NavigationGroup)
NavigationGroup.init = function (self, nav_world, poly_hash, poly, poly_center, poly_area, group_number)
	self._center_poly = poly_hash
	self._area = 0
	self._group_center = Vector3Box(poly_center)
	self._distance_from_finish = math.huge
	self._group_number = group_number
	self._group_polygons = {}
	self._group_size = 0
	self._group_neighbours = {}

	self.add_polygon(self, poly, poly_center, poly_area, nav_world)

	return 
end
NavigationGroup.make_string_of_group = function (self, write_string)
	write_string = write_string .. "{neighbours={"

	for group_neighbour, _ in pairs(self._group_neighbours) do
		local group_id = group_neighbour._group_number
		write_string = write_string .. group_id .. ","
	end

	write_string = write_string .. "}, group_polygons={"

	for poly_hash, poly in pairs(self._group_polygons) do
		write_string = write_string .. "[\"" .. poly_hash .. "\"]=" .. tostring(poly) .. ",\n"
	end

	write_string = write_string .. "}, dist_from_finish=" .. self._distance_from_finish .. ", "

	return write_string
end
NavigationGroup.add_polygon = function (self, poly, poly_center, poly_area, nav_world)
	local poly_hash = self.get_poly_hash(self, poly, nav_world)
	self._group_polygons[poly_hash] = poly
	self._group_size = self._group_size + 1
	self._area = self._area + poly_area

	if poly_center ~= nil then
		self.calculate_group_center(self, poly_center, poly_hash, nav_world)
	end

	return 
end
NavigationGroup.add_neighbour_group = function (self, group)
	self._group_neighbours[group] = true

	return 
end
NavigationGroup.remove_neighbour_group = function (self, group)
	self._group_neighbours[group] = nil

	return 
end
NavigationGroup.set_distance_from_finish = function (self, distance_from_finish)
	self._distance_from_finish = distance_from_finish

	return 
end
NavigationGroup.get_group_neighbours = function (self)
	return self._group_neighbours
end
NavigationGroup.recalc_neighbour_distances = function (self)
	for neighbour, data in pairs(self._group_neighbours) do
		data = Vector3.distance(self._group_center:unbox(), neighbour.get_group_center(neighbour):unbox())
	end

	return 
end
NavigationGroup.calculate_group_center = function (self, poly_center, poly_hash, nav_world)
	local group_size = self._group_size
	local curr_center = self._group_center:unbox()
	local new_center = ((group_size - 1) * curr_center + poly_center) / group_size
	local new_center_poly = GwNavTraversal.get_seed_triangle(nav_world, new_center)
	local new_center_hash = new_center_poly and self.get_poly_hash(self, new_center_poly, nav_world)

	if new_center_hash then
		local a, b, c = Script.temp_count()
		local group_polygons = self._group_polygons

		if not group_polygons[new_center_hash] then
			new_center, new_center_hash = self.breadth_first_find_nearest_group_triangle(self, new_center_poly, nav_world)

			if new_center == nil then
				print("Fallback: Will use", poly_center, "as center for nav group", self._group_number)

				new_center_hash = poly_hash
				new_center = poly_center
			end
		end

		self._group_center:store(new_center)

		self._center_poly = new_center_hash

		Script.set_temp_count(a, b, c)
	end

	return 
end
NavigationGroup.get_group_polygons_centers = function (self, list, nav_world)
	error("not used?")

	local poly_center = nil

	for _, poly in pairs(self._group_polygons) do
		local a, b, c = Script.temp_count()
		poly_center = self.calc_polygon_center(self, poly, nav_world)

		table.insert(list, Vector3Box(poly_center))
		Script.set_temp_count(a, b, c)
	end

	return list
end
NavigationGroup.get_poly_center_from_hash = function (self, poly_hash)
	return self._group_polygons[poly_hash]
end
NavigationGroup.get_group_center_poly = function (self)
	return self._center_poly
end
NavigationGroup.get_group_center = function (self)
	return self._group_center
end
NavigationGroup.get_group_area = function (self)
	return self._area
end
NavigationGroup.get_group_polygons = function (self)
	return self._group_polygons
end
NavigationGroup.get_group_size = function (self)
	return self._group_size
end
NavigationGroup.get_distance_from_finish = function (self)
	return self._distance_from_finish
end
NavigationGroup.destroy = function (self)
	self._group_neighbours = {}
	self._group_polygons = {}
	self._group_size = 0

	return 
end
NavigationGroup.calc_polygon_center = function (self, poly, nav_world)
	local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, poly)
	local center = (p1 + p2 + p3) / 3

	return center
end
NavigationGroup.get_poly_hash = function (self, poly, nav_world)
	local a, b, c = Script.temp_count()
	local poly_center = self.calc_polygon_center(self, poly, nav_world)
	local poly_hash = poly_center.x * 0.0001 + poly_center.y + poly_center.z * 10000

	Script.set_temp_count(a, b, c)

	return poly_hash
end
local BREADTH_FIRST_MAX_NODES = 1000
NavigationGroup.breadth_first_find_nearest_group_triangle = function (self, root_triangle, nav_world)
	local triangle_lookup = FrameTable.alloc_table()
	local b_queue = FrameTable.alloc_table()
	local b_current = 1
	local b_last = 1
	b_queue[1] = root_triangle
	local root_hash = self.get_poly_hash(self, root_triangle, nav_world)
	triangle_lookup[root_hash] = true
	local group_polygons = self._group_polygons

	while b_current <= b_last do
		local node_tri = b_queue[b_current]
		local node_hash = self.get_poly_hash(self, node_tri, nav_world)
		b_current = b_current + 1

		if group_polygons[node_hash] then
			local tri_center = self.calc_polygon_center(self, node_tri, nav_world)

			return tri_center, node_hash
		end

		local neighbours = {
			GwNavTraversal.get_neighboring_triangles(node_tri)
		}

		for i = 1, #neighbours, 1 do
			local a, b, c = Script.temp_count()
			local neighbour_tri = neighbours[i]
			local neighbour_hash = self.get_poly_hash(self, neighbour_tri, nav_world)

			if not triangle_lookup[neighbour_hash] then
				b_last = b_last + 1
				b_queue[b_last] = neighbour_tri
				triangle_lookup[neighbour_hash] = true
			end

			Script.set_temp_count(a, b, c)
		end

		if BREADTH_FIRST_MAX_NODES < b_current then
			local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, root_triangle)

			print("WARNING: Navigation Group Breadth First Search failed. Triangle at:", p1)

			return nil, nil
		end
	end

	return 
end
NavigationGroup.print_group = function (self, world, nav_world, line_object, line_drawer, debug_world_gui)
	local color_node_a = math.random(0, 255)
	local color_node_b = math.random(0, 255)
	local color_node_c = math.random(0, 255)
	local color = Color(color_node_a, color_node_b, color_node_c)

	print("Group", self._group_number, "has neighbours:")

	for group_neighbour, _ in pairs(self._group_neighbours) do
		print(group_neighbour._group_number)
	end

	for _, poly in pairs(self._group_polygons) do
		self.draw_poly_lines(self, poly, color, nav_world, line_object, debug_world_gui)
	end

	local m = Matrix4x4.identity()
	local font_size = 1.2
	local font_material = "materials/fonts/gw_arial_16"
	local font = "gw_arial_16"
	local group_center = self._group_center:unbox()
	local text_pos = Vector3(group_center[1], group_center[3], group_center[2])

	line_drawer.sphere(line_drawer, group_center, 0.07, Color(255, 255, 255))
	Gui.text_3d(debug_world_gui, "C", font_material, font_size, font, m, text_pos, 3, Color(255, 255, 255))
	Gui.text_3d(debug_world_gui, "C", font_material, font_size + 0.1, font, m, text_pos - Vector3(0.05, 0, 0), 2, Color(0, 0, 0))
	Gui.text_3d(debug_world_gui, "id=" .. self._group_number, font_material, font_size - 0.8, font, m, text_pos + Vector3(0, 1.5, 0), 3, Color(255, 255, 255))
	Gui.text_3d(debug_world_gui, "dist=" .. self._distance_from_finish, font_material, font_size - 0.8, font, m, text_pos + Vector3(0, 1, 0), 3, Color(255, 255, 255))
	Gui.text_3d(debug_world_gui, "area=" .. self._area, font_material, font_size - 0.8, font, m, text_pos + Vector3(0, 0.5, 0), 3, Color(255, 255, 255))

	return 
end
NavigationGroup.draw_poly_lines = function (self, poly, color, nav_world, line_object, debug_world_gui)
	local a, b, c = Script.temp_count()
	local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, poly)
	p1 = p1 + Vector3(0, 0, 0.1)
	p2 = p2 + Vector3(0, 0, 0.1)
	p3 = p3 + Vector3(0, 0, 0.1)

	LineObject.add_line(line_object, color, p1, p2)
	LineObject.add_line(line_object, color, p1, p3)
	LineObject.add_line(line_object, color, p2, p3)
	Script.set_temp_count(a, b, c)

	return 
end

return 
