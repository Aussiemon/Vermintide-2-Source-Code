-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("foundation/scripts/util/math")
require("scripts/utils/navigation_group")

NavigationGroupManager = class(NavigationGroupManager)
local MIN_AREA = 20
NavigationGroupManager.init = function (self, using_editor)
	self._navigation_groups = {}
	self._registered_polygons = {}
	self._world = nil
	self._level = nil
	self.nav_world = nil
	self._groups_max_radius = 20
	self._finish_point = nil
	self._num_groups = 0
	self._printing_groups = false
	self._numb = 0
	self._using_editor = using_editor

	return 
end
NavigationGroupManager.setup = function (self, world, nav_world)
	self._world = world
	self.nav_world = nav_world
	self.operational = true

	return 
end
NavigationGroupManager.form_groups = function (self, radius, finish_point, optional_level_name)
	print("Forming navigation groups")
	assert(finish_point ~= nil, "Got nil for finish_point")
	Profiler.start("form_groups")

	local time1 = os.clock()
	self._groups_max_radius = radius or self._groups_max_radius
	self._finish_point = finish_point
	local nav_world = self.nav_world
	local level_name = optional_level_name

	if not optional_level_name then
		local level_key = Managers.state.game_mode:level_key()
		level_name = LevelSettings[level_key].level_name
	end

	local unit_indices = LevelResource.unit_indices(level_name, "core/gwnav/units/seedpoint/seedpoint")
	self._num_groups = 0
	local first_poly = GwNavTraversal.get_seed_triangle(nav_world, finish_point.unbox(finish_point))
	local in_group_queue = {}
	local rejected_queue = {}
	self._in_group_queue_pos = 0
	self._rejected_queue_pos = 0
	in_group_queue[#in_group_queue + 1] = first_poly
	self._iter_count = -999999

	self.assign_group(self, nil, in_group_queue, rejected_queue)

	local time2 = os.clock()

	print("NavigationGroupManager -> calulation time A:", time2 - time1)

	for i, unit_index in ipairs(unit_indices) do
		local pos = LevelResource.unit_position(level_name, unit_index)
		first_poly = GwNavTraversal.get_seed_triangle(nav_world, pos)
		local in_group_queue2 = {}
		local rejected_queue2 = {}
		self._in_group_queue_pos = 0
		self._rejected_queue_pos = 0
		in_group_queue2[#in_group_queue2 + 1] = first_poly

		self.assign_group(self, nil, in_group_queue2, rejected_queue2)
	end

	local time3 = os.clock()

	print("NavigationGroupManager -> calulation time B:", time3 - time2)
	print("number of nav groups: ", self._num_groups)
	self.refine_groups(self)
	print("number of refined nav groups : ", self._num_groups)
	self.calc_distances_from_finish_for_all(self, in_group_queue)

	if not self._using_editor then
		self.make_sure_group_centers_are_on_mesh(self)
		self.knit_groups_with_ledges(self)
	end

	print("NavigationGroupManager -> calulation time C:", os.clock() - time3)
	Profiler.stop("form_groups")

	return 
end
NavigationGroupManager.form_groups_start = function (self, radius, finish_point, optional_level_name)
	print("NavigationGroupManager -> form_groups_start")
	assert(finish_point ~= nil, "Got nil for finish_point")

	self._groups_max_radius = radius or self._groups_max_radius
	self._finish_point = finish_point
	local nav_world = self.nav_world
	local level_name = optional_level_name

	if not optional_level_name then
		local level_key = Managers.state.game_mode:level_key()
		level_name = LevelSettings[level_key].level_name
	end

	local unit_indices = LevelResource.unit_indices(level_name, "core/gwnav/units/seedpoint/seedpoint")
	self._seedpoint_unit_indices = unit_indices
	self._level_name = level_name
	self._num_groups = 0
	local first_poly = GwNavTraversal.get_seed_triangle(nav_world, finish_point.unbox(finish_point))
	local in_group_queue = {}
	local rejected_queue = {}
	self._in_group_queue_pos = 0
	self._rejected_queue_pos = 0
	in_group_queue[#in_group_queue + 1] = first_poly
	self._current_group = nil
	self._in_group_queue = in_group_queue
	self._rejected_queue = rejected_queue
	self._backup_group_queue = in_group_queue
	self.form_groups_running = true
	self._sum_iter_count = 0
	self._spawn_point_index = 0

	self.form_groups_update(self)

	return 
end
local max_nodes_per_frame = (PLATFORM == "win32" and 1000) or 400
NavigationGroupManager.form_groups_update = function (self)
	print("NavigationGroupManager -> form_groups_update")
	Debug.text("NavigationGroupManager: %d ", self._sum_iter_count)

	local time1 = os.clock()
	self._iter_count = 0
	local all_work_done = false
	self.form_groups_running = true

	while self._iter_count < max_nodes_per_frame do
		local a, b, c = self.assign_group(self, self._current_group, self._in_group_queue, self._rejected_queue)
		local completed = not b
		self._sum_iter_count = self._sum_iter_count + self._iter_count

		print("\t\tworking on group -> count:", self._iter_count)

		if completed then
			self._spawn_point_index = self._spawn_point_index + 1
			local unit_index = self._seedpoint_unit_indices[self._spawn_point_index]

			if unit_index then
				print("\t\tpop next seed point")

				local pos = LevelResource.unit_position(self._level_name, unit_index)
				local first_poly = GwNavTraversal.get_seed_triangle(self.nav_world, pos)
				self._in_group_queue = {}
				self._rejected_queue = {}
				self._current_group = nil
				self._in_group_queue_pos = 0
				self._rejected_queue_pos = 0
				self._in_group_queue[#self._in_group_queue + 1] = first_poly
				self._iter_count = 0
			else
				self.form_groups_end(self)

				self.form_groups_running = false
				all_work_done = true

				break
			end
		else
			self._current_group = a
			self._in_group_queue = b
			self._rejected_queue = c
		end
	end

	print("\t-> time:", os.clock() - time1, "sum:", self._sum_iter_count)

	return all_work_done
end
NavigationGroupManager.form_groups_end = function (self)
	local time1 = os.clock()

	print("\t-> number of nav groups: ", self._num_groups)
	self.refine_groups(self)
	print("\t-> number of refined nav groups : ", self._num_groups)
	self.calc_distances_from_finish_for_all(self, self._backup_group_queue)

	if not self._using_editor then
		self.make_sure_group_centers_are_on_mesh(self)
		self.knit_groups_with_ledges(self)
	end

	print("NavigationGroupManager -> form_groups_end time:", os.clock() - time1)

	return 
end
NavigationGroupManager.assign_group = function (self, group, in_group_queue, rejected_queue)
	local a, b, c = Script.temp_count()
	self._iter_count = self._iter_count + 1
	local poly, poly_hash, create_new_group = self.next_poly_in_queue(self, in_group_queue, rejected_queue)
	create_new_group = create_new_group or not group

	if not poly then
		return 
	end

	if create_new_group then
		group = self.create_group(self, self.nav_world, poly_hash, poly)
		in_group_queue = self.add_neighbours_to_queue(self, poly, group, in_group_queue)
	elseif self.in_range(self, poly, group) then
		if poly_hash ~= group.get_group_center_poly(group) then
			self.join_group(self, poly, poly_hash, group)
		else
			self._registered_polygons[poly_hash] = group
		end

		in_group_queue = self.add_neighbours_to_queue(self, poly, group, in_group_queue)
	else
		rejected_queue[#rejected_queue + 1] = poly
	end

	Script.set_temp_count(a, b, c)

	if max_nodes_per_frame < self._iter_count then
		return group, in_group_queue, rejected_queue
	end

	return self.assign_group(self, group, in_group_queue, rejected_queue)
end
NavigationGroupManager.next_poly_in_queue = function (self, in_group_queue, rejected_queue)
	self._in_group_queue_pos = self._in_group_queue_pos + 1
	local poly = in_group_queue[self._in_group_queue_pos]
	local poly_is_valid, poly_hash = self.poly_is_valid(self, poly)
	local create_new_group = false

	if not poly_is_valid then
		self._in_group_queue_pos = self._in_group_queue_pos - 1
		create_new_group = true

		repeat
			self._rejected_queue_pos = self._rejected_queue_pos + 1
			poly = rejected_queue[self._rejected_queue_pos]
			poly_is_valid, poly_hash = self.poly_is_valid(self, poly)

			if poly_is_valid == nil then
				self._rejected_queue_pos = self._rejected_queue_pos - 1

				return false, false
			end
		until poly_is_valid
	end

	if create_new_group then
		self.unmark_polys(self, rejected_queue)
	end

	return poly, poly_hash, create_new_group
end
NavigationGroupManager.poly_is_valid = function (self, poly)
	local poly_hash = false
	local poly_is_valid = false

	if poly then
		poly_hash = self.get_poly_hash(self, poly)

		if self._registered_polygons[poly_hash] == nil or self._registered_polygons[poly_hash] == true then
			poly_is_valid = true
		end
	else
		return nil, nil
	end

	return poly_is_valid, poly_hash
end
NavigationGroupManager.unmark_polys = function (self, rejected_queue)
	for i = self._rejected_queue_pos, #rejected_queue, 1 do
		local poly = rejected_queue[i]
		local poly_hash = self.get_poly_hash(self, poly)

		if self._registered_polygons[poly_hash] == true then
			self._registered_polygons[poly_hash] = nil
		end
	end

	return 
end
NavigationGroupManager.add_neighbours_to_queue = function (self, poly, group, in_group_queue)
	local neighbours = self.get_neighbours(self, poly)
	local poly_hash_atm = self.get_poly_hash(self, poly)

	for _, neighbour in ipairs(neighbours) do
		local poly_hash = self.get_poly_hash(self, neighbour)
		local poly_group = self._registered_polygons[poly_hash]

		if poly_group == nil then
			in_group_queue[#in_group_queue + 1] = neighbour
			self._registered_polygons[poly_hash] = true
		elseif poly_group ~= true and group ~= poly_group then
			group.add_neighbour_group(group, poly_group)
			poly_group.add_neighbour_group(poly_group, group)
		end
	end

	return in_group_queue
end
NavigationGroupManager.refine_groups = function (self)
	for group, _ in pairs(self._navigation_groups) do
		local group_area = group.get_group_area(group)
		local group_neighbours = group.get_group_neighbours(group)
		local num_neightbours = table.size(group_neighbours)

		if group_area < MIN_AREA and 0 < num_neightbours then
			local group_polygons = group.get_group_polygons(group)
			local new_group = self.find_smallest_neighbour_group(self, group)
			local a, b, c = Script.temp_count()

			for _, poly in pairs(group_polygons) do
				local poly_hash = self.get_poly_hash(self, poly)

				self.join_group(self, poly, poly_hash, new_group)
			end

			Script.set_temp_count(a, b, c)

			for neighbour_group, _ in pairs(group_neighbours) do
				neighbour_group.remove_neighbour_group(neighbour_group, group)

				if neighbour_group ~= new_group then
					neighbour_group.add_neighbour_group(neighbour_group, new_group)
					new_group.add_neighbour_group(new_group, neighbour_group)
				end
			end

			self._navigation_groups[group] = nil
			self._num_groups = self._num_groups - 1

			group.destroy(group, self._world)

			group = nil
		end
	end

	return 
end

local function find_center_tri(nav_world, pos, above, below)
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, pos, above, below)

	if success then
		pos.z = altitude

		return pos
	end

	return 
end

NavigationGroupManager.make_sure_group_centers_are_on_mesh = function (self)
	for group, _ in pairs(self._navigation_groups) do
		local pos = group._group_center:unbox()
		local success, altitude = GwNavQueries.triangle_from_position(self.nav_world, pos, 1, 1)

		if not success then
			success, altitude = GwNavQueries.triangle_from_position(self.nav_world, pos, 2.5, 2.5)
		end

		if not success then
			success, altitude = GwNavQueries.triangle_from_position(self.nav_world, pos, 5, 5)
		end

		if success then
			pos.z = altitude

			group._group_center:store(pos)
		else
			local triangle = GwNavTraversal.get_seed_triangle(self.nav_world, pos)

			if triangle then
				local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(self.nav_world, triangle)
				local tri_center = (p1 + p2 + p3) / 3

				group._group_center:store(tri_center)
			else
				local p = GwNavQueries.inside_position_from_outside_position(self.nav_world, pos + Vector3(0, 0, 2), 0, 4, 4, 0.1)

				if p then
					group._group_center:store(p)
				else
					QuickDrawerStay:line(pos, pos + Vector3(0, 0, 20), Color(0, 255, 0))
					QuickDrawerStay:line(pos, pos + Vector3(0.1, 0, 20), Color(0, 255, 0))
					QuickDrawerStay:line(pos, pos + Vector3(0.1, 0.1, 20), Color(0, 255, 0))
					QuickDrawerStay:line(pos, pos + Vector3(0, 0.1, 20), Color(0, 255, 0))
				end
			end
		end
	end

	return 
end
NavigationGroupManager.find_smallest_neighbour_group = function (self, group)
	local group_neighbours = group.get_group_neighbours(group)
	local smallest_neighbour_group = next(group_neighbours, nil)
	local smallest_area = smallest_neighbour_group.get_group_area(smallest_neighbour_group)

	for neighbour_group, _ in pairs(group_neighbours) do
		local group_area = neighbour_group.get_group_area(neighbour_group)

		if group_area < smallest_area then
			smallest_neighbour_group = neighbour_group
			smallest_area = group_area
		end
	end

	return smallest_neighbour_group
end
NavigationGroupManager.calc_distances_from_finish_for_all = function (self, in_group_queue)
	local a, b, c = Script.temp_count()
	local first_poly = GwNavTraversal.get_seed_triangle(self.nav_world, self._finish_point:unbox())
	local first_poly_hash = self.get_poly_hash(self, first_poly)

	for i, poly in ipairs(in_group_queue) do
		Script.set_temp_count(a, b, c)

		local poly_hash = self.get_poly_hash(self, poly)
		local group = self._registered_polygons[poly_hash]
		local is_first_group = false

		if group.get_distance_from_finish(group) ~= math.huge then
		else
			if group == self._registered_polygons[first_poly_hash] then
				is_first_group = true
			end

			local distance_from_finish = self.calc_distance_from_finish(self, group, is_first_group)

			group.set_distance_from_finish(group, distance_from_finish)
		end
	end

	return 
end
NavigationGroupManager.get_neighbours = function (self, poly)
	local neighbours = {
		GwNavTraversal.get_neighboring_triangles(poly)
	}

	return neighbours
end
NavigationGroupManager.create_group = function (self, world, poly_hash, poly)
	local poly_center = self.calc_polygon_center(self, poly)
	local poly_area = self.calc_polygon_area(self, poly)
	self._num_groups = self._num_groups + 1
	local group = NavigationGroup:new(self.nav_world, poly_hash, poly, poly_center, poly_area, self._num_groups)
	self._navigation_groups[group] = true
	self._registered_polygons[poly_hash] = group

	return group
end
NavigationGroupManager.join_group = function (self, poly, poly_hash, group)
	local poly_area = self.calc_polygon_area(self, poly)
	local poly_center = self.calc_polygon_center(self, poly)

	group.add_polygon(group, poly, poly_center, poly_area, self.nav_world)

	self._registered_polygons[poly_hash] = group

	return 
end
NavigationGroupManager.in_range = function (self, poly, group)
	local poly_center = self.calc_polygon_center(self, poly)
	local group_center = group.get_group_center(group):unbox()
	local to_centre = poly_center - group_center
	local distance = Vector3.length(to_centre)
	local radius = self._groups_max_radius

	return distance <= radius and math.abs(to_centre.z) < 2.5
end
NavigationGroupManager.calc_distance_from_finish = function (self, group, first_group)
	local distance_from_finish = math.huge
	local group_center = group.get_group_center(group)

	if first_group then
		distance_from_finish = Vector3.distance(group_center.unbox(group_center), self._finish_point:unbox())
	else
		local group_neighbours = group.get_group_neighbours(group)
		local neighbour = next(group_neighbours, nil)

		if not neighbour then
			return distance_from_finish
		end

		for neighbour_group, _ in pairs(group_neighbours) do
			local neighbour_distance = neighbour_group.get_distance_from_finish(neighbour_group)

			if neighbour_distance < distance_from_finish then
				distance_from_finish = neighbour_distance
				neighbour = neighbour_group
			end
		end

		local distance_to_neighbour = Vector3.distance(group_center.unbox(group_center), neighbour.get_group_center(neighbour):unbox())
		distance_from_finish = distance_from_finish + distance_to_neighbour
	end

	return distance_from_finish
end
NavigationGroupManager.calc_neighour_distances = function (self)
	for group, _ in nil do
		group.recalc_neighbour_distances(group)
	end

	return 
end
NavigationGroupManager.calc_polygon_center = function (self, poly)
	local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(self.nav_world, poly)
	local center = (p1 + p2 + p3) / 3

	return center
end
NavigationGroupManager.calc_polygon_area = function (self, poly)
	local p1, p2, p3 = self.get_polygon_sides(self, poly)
	local perimeter = p1 + p2 + p3
	perimeter = perimeter / 2
	local area = math.sqrt(perimeter * (perimeter - p1) * (perimeter - p2) * (perimeter - p3))

	return area
end
NavigationGroupManager.get_polygon_sides = function (self, poly)
	local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(self.nav_world, poly)
	local side_p1, side_p2, side_p3 = nil
	side_p1 = Vector3.distance(p1, p2)
	side_p2 = Vector3.distance(p1, p3)
	side_p3 = Vector3.distance(p2, p3)

	return side_p1, side_p2, side_p3
end
NavigationGroupManager.destroy = function (self, world)
	self.destroy_gui(self, world)

	for group, _ in pairs(self._navigation_groups) do
		group.destroy(group, world)

		group = nil
	end

	self.operational = nil
	self._navigation_groups = {}
	self._registered_polygons = {}

	return 
end
NavigationGroupManager.get_group_from_position = function (self, position)
	local triangle = GwNavTraversal.get_seed_triangle(self.nav_world, position)

	if not triangle then
		return 
	end

	local group = self.get_polygon_group(self, triangle)

	return group
end
NavigationGroupManager.get_polygon_group = function (self, triangle, dont_clear)
	local triangle_hash = self.get_poly_hash(self, triangle)
	local group = self._registered_polygons[triangle_hash]

	if group then
		return group
	end

	group = self.breadth_first_search_neighbours(self, triangle)

	return group
end
NavigationGroupManager.draw_tri = function (self, triangle, h, col)
	h = h or 0.1
	local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(self.nav_world, triangle)
	p1 = p1 + Vector3(0, 0, h)
	p2 = p2 + Vector3(0, 0, h)
	p3 = p3 + Vector3(0, 0, h)

	QuickDrawerStay:line(p1, p2, col)
	QuickDrawerStay:line(p2, p3, col)
	QuickDrawerStay:line(p3, p1, col)

	return 
end
local b_queue = {}
local patch_list = {}
local triangle_lookup = {}
NavigationGroupManager.breadth_first_search_neighbours = function (self, root_triangle)
	table.clear(triangle_lookup)
	table.clear(patch_list)

	local count = 1
	local b_queue = b_queue
	local b_start = 1
	local b_last = 1
	b_queue[1] = root_triangle
	local root_hash = self.get_poly_hash(self, root_triangle)
	triangle_lookup[root_hash] = true

	while b_start <= b_last do
		local node_tri = b_queue[b_start]
		local node_hash = self.get_poly_hash(self, node_tri)
		b_start = b_start + 1
		count = count + 1
		local group = self._registered_polygons[node_hash]

		if group then
			for tri_hash, tri in pairs(patch_list) do
				self.join_group(self, tri, tri_hash, group)
			end

			return group
		end

		patch_list[node_hash] = node_tri
		local neighbours = {
			GwNavTraversal.get_neighboring_triangles(node_tri)
		}

		for i = 1, #neighbours, 1 do
			local a, b, c = Script.temp_count()
			local neighbour_tri = neighbours[i]
			local neighbour_hash = self.get_poly_hash(self, neighbour_tri)

			if not triangle_lookup[neighbour_hash] then
				b_last = b_last + 1
				b_queue[b_last] = neighbour_tri
				triangle_lookup[neighbour_hash] = true
			end

			Script.set_temp_count(a, b, c)
		end

		if 1000 < count then
			local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(self.nav_world, root_triangle)

			print("WARNING navigation group patching failed. Triangle at:", p1)

			break
		end
	end

	return 
end
NavigationGroupManager.get_group_polygons = function (self, poly)
	local poly_group = self.get_polygon_group(self, poly)

	return poly_group.get_group_polygons(poly_group)
end
NavigationGroupManager.get_group_center = function (self, poly)
	local group = self.get_polygon_group(self, poly)

	return group.get_group_center(group)
end
NavigationGroupManager.get_poly_hash = function (self, poly)
	local poly_center = self.calc_polygon_center(self, poly)
	local poly_hash = poly_center.x * 0.0001 + poly_center.y + poly_center.z * 10000

	return poly_hash
end
NavigationGroupManager.get_group_centers = function (self, list)
	local a, b, c = Script.temp_count()

	for group, _ in pairs(self._navigation_groups) do
		local center = group.get_group_center(group)

		table.insert(list, center)
	end

	Script.set_temp_count(a, b, c)

	return list
end
NavigationGroupManager.get_group_polygons_centers = function (self, list)
	for group, _ in pairs(self._navigation_groups) do
		local a, b, c = Script.temp_count()
		list = group.get_group_polygons_centers(group, list)

		Script.set_temp_count(a, b, c)
	end

	return list
end
NavigationGroupManager.print_groups = function (self, world, nav_world)
	local a, b, c = Script.temp_count()
	local do_print_groups = not not script_data.debug_navigation_group_manager

	if do_print_groups == self._printing_groups then
		return 
	end

	if do_print_groups then
		self._line_object = self._line_object or World.create_line_object(self._world, false)
		self._drawer = self._drawer or Managers.state.debug:drawer({
			mode = "perm",
			name = "nav_group"
		})
		self._debug_world_gui = World.create_world_gui(world, Matrix4x4.identity(), 1, 1, "material", "materials/fonts/gw_fonts")
		local debug_world_gui = self._debug_world_gui
		local a, b, c = Script.temp_count()

		for group, _ in pairs(self._navigation_groups) do
			group.print_group(group, world, nav_world, self._line_object, self._drawer, debug_world_gui)
		end

		Script.set_temp_count(a, b, c)
	else
		self.destroy_gui(self, world)
	end

	self._printing_groups = do_print_groups

	Script.set_temp_count(a, b, c)

	if self._line_object then
		LineObject.dispatch(world, self._line_object)
	end

	return 
end
NavigationGroupManager.destroy_gui = function (self, world)
	local line_object = self._line_object

	if not line_object then
		return 
	end

	self._drawer:reset()
	LineObject.reset(line_object)
	LineObject.dispatch(world, line_object)
	World.destroy_line_object(world, line_object)

	self._line_object = nil

	World.destroy_gui(world, self._debug_world_gui)

	return 
end
NavigationGroupManager.a_star_cached = function (self, group1, group2)
	return LuaAStar.a_star_cached(self._navigation_groups, group1, group2)
end
NavigationGroupManager.a_star_cached_between_positions = function (self, p1, p2)
	local tri1 = GwNavTraversal.get_seed_triangle(self.nav_world, p1)
	local tri2 = GwNavTraversal.get_seed_triangle(self.nav_world, p2)

	if not tri1 or not tri2 then
		return false
	end

	local group1 = self.get_polygon_group(self, tri1)
	local group2 = self.get_polygon_group(self, tri2)

	if not group1 or not group2 then
		print("CACHED ASTAR FAIL")

		return false
	end

	return LuaAStar.a_star_cached(self._navigation_groups, group1, group2)
end
NavigationGroupManager.draw_group_path = function (self, path)
	local col = Color(255, 200, 255, 10)
	local p1 = path[1]._group_center:unbox()
	local p2 = nil

	for i = 2, #path, 1 do
		p2 = path[i]._group_center:unbox()

		QuickDrawerStay:line(p1, p2, col)

		p1 = p2
	end

	return 
end
NavigationGroupManager.draw_group_connections = function (self)
	local col = Color(255, 255, 128, 128)
	local h = Vector3(0, 0, 1)

	for group, _ in pairs(self._navigation_groups) do
		for n_group, _ in pairs(group._group_neighbours) do
			local p1 = group._group_center:unbox() + h
			local p2 = n_group._group_center:unbox() + h
			local to_dir = Vector3.normalize(p2 - p1)
			local arrow = Vector3.cross(to_dir, Vector3.up()) / 2
			local text = string.format("dist=%.1f", Vector3.length(p2 - p1))

			Debug.world_sticky_text((p2 + p1) * 0.5, text, "red")
			QuickDrawerStay:line(p1, p2, col)

			local p3 = p2 - to_dir

			QuickDrawerStay:line(p3, p3 - to_dir * 0.45 + arrow, col)
			QuickDrawerStay:line(p3, p3 - to_dir * 0.45 - arrow, col)
		end
	end

	return 
end
NavigationGroupManager.knit_groups_with_ledges = function (self)
	local nav_graph_system = Managers.state.entity:system("nav_graph_system")
	local smart_objects = nav_graph_system.smart_objects

	for smart_object_id, smart_object_data in pairs(smart_objects) do
		for i = 1, #smart_object_data, 1 do
			local smart_object = smart_object_data[i]
			local smart_object_type = smart_object.smart_object_type or "ledges"
			local p1 = Vector3Aux.unbox(smart_object.pos1)
			local group1 = self.get_group_from_position(self, p1)

			if group1 then
				local p2 = Vector3Aux.unbox(smart_object.pos2)
				local group2 = self.get_group_from_position(self, p2)

				if group2 and group1 ~= group2 then
					if not group1._group_neighbours[group2] then
						group1._group_neighbours[group2] = true
					end

					if smart_object.data.is_bidirectional and not group2._group_neighbours[group1] then
						group2._group_neighbours[group1] = true
					end
				end
			end
		end
	end

	return 
end

local function get_tri_hash(p1, p2, p3)
	local center = (p1 + p2 + p3) / 3

	return center.x * 0.0001 + center.y + center.z * 10000
end

NavigationGroupManager.breadth_first_search_all_triangles = function (self, triangle)
	local time1 = os.clock()
	local nav_world = self.nav_world
	local triangle = triangle or GwNavTraversal.get_seed_triangle(nav_world, self._finish_point:unbox())

	if triangle == nil then
		return 
	end

	local num_triangles = 1
	local i = 0
	local unique_id = 0
	local are_triangles_equal = GwNavTraversal.are_triangles_equal
	local get_neighboring_triangles = GwNavTraversal.get_neighboring_triangles
	local get_triangle_vertices = GwNavTraversal.get_triangle_vertices
	local source_tri_hash = get_tri_hash(get_triangle_vertices(nav_world, triangle))
	local triangles = {
		triangle
	}
	local tri_lookup = {
		source_tri_hash = unique_id
	}

	while i < num_triangles do
		i = i + 1
		triangle = triangles[i]
		local neighbors = {
			get_neighboring_triangles(triangle)
		}

		for j = 1, #neighbors, 1 do
			local neighbor = neighbors[j]

			if neighbor then
				local p1, p2, p3 = get_triangle_vertices(nav_world, neighbor)
				local center = (p1 + p2 + p3) / 3
				local tri_hash = center.x * 0.0001 + center.y + center.z * 10000

				if not tri_lookup[tri_hash] then
					num_triangles = num_triangles + 1
					triangles[num_triangles] = neighbor
					tri_lookup[tri_hash] = unique_id
					unique_id = unique_id + 1
				end
			end
		end
	end

	local time2 = os.clock()

	print("NavigationGroupManager -> traverse all triangles time:", time2 - time1, "Num triangles:", num_triangles)

	return tri_lookup
end

return 
