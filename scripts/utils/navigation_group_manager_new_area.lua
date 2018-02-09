require("foundation/scripts/util/math")
require("scripts/utils/navigation_group")

NavigationGroupManagerNewArea = class(NavigationGroupManagerNewArea)
NavigationGroupManagerNewArea.init = function (self)
	self._navigation_groups = {}
	self._registered_polygons = {}
	self._world = nil
	self._level = nil
	self._navmesh = nil
	self._printing_groups = false

	return 
end
NavigationGroupManagerNewArea.setup = function (self, world, nav_world, level)
	self._world = world
	self._nav_world = nav_world
	self._level = level
	self._navmesh = Level.navigation_mesh(self._level)

	return 
end
NavigationGroupManagerNewArea.form_groups = function (self, start_polygon_index, rad, area_cap)
	local poly = start_polygon_index or 0
	local radius = rad or 20
	local group_area_cap = area_cap or 290
	local navmesh = self._navmesh
	local n = {
		false,
		false,
		false
	}
	local num_polygons = NavigationMesh.num_polygons(navmesh)

	for poly = 0, num_polygons - 1, 1 do
		if self._registered_polygons[poly] == nil then
			local poly_area = self.calc_polygon_area(self, navmesh, poly)
			local poly_center = self.calc_polygon_center(self, navmesh, poly)
			local neighbours = self.get_neighbours(self, navmesh, poly)
			local shortest_distance, closest_group = nil

			for _, poly_neighbour in ipairs(neighbours) do
				local group = self._registered_polygons[poly_neighbour]

				if group ~= nil then
					local group_area = group.group_area(group)
					local group_center = group.group_center(group)
					local distance = Vector3.distance(poly_center, group_center)

					if group_area + poly_area <= group_area_cap then
						if shortest_distance then
							if distance < shortest_distance then
								shortest_distance = distance
								closest_group = group
							end
						else
							shortest_distance = distance
							closest_group = group
						end
					end
				end
			end

			if closest_group and self.in_range(self, navmesh, shortest_distance, closest_group) then
				self.join_group(self, navmesh, poly, poly_area, closest_group)
			end

			if self._registered_polygons[poly] == nil then
				local navigation_group = self.create_group(self, self._world, self._nav_world, navmesh, poly, poly_area, radius)
				self._navigation_groups[navigation_group] = true
				self._registered_polygons[poly] = navigation_group
			end
		end

		poly = poly + 1
	end

	return 
end
NavigationGroupManagerNewArea.get_neighbours = function (self, navmesh, polygon_index)
	local a, b, c = NavigationMesh.polygon_neighbors(navmesh, polygon_index)
	local neighbours = {}

	if a then
		neighbours[#neighbours + 1] = a
	end

	if b then
		neighbours[#neighbours + 1] = b
	end

	if c then
		neighbours[#neighbours + 1] = c
	end

	return neighbours
end
NavigationGroupManagerNewArea.create_group = function (self, world, nav_world, navmesh, poly, poly_area, radius)
	local poly_center = self.calc_polygon_center(self, navmesh, poly)
	local navigation_group = NavigationGroup:new(world, nav_world, poly, radius, poly_center, poly_area)

	return navigation_group
end
NavigationGroupManagerNewArea.join_group = function (self, navmesh, poly, poly_area, group)
	self._registered_polygons[poly] = group

	group.add_polygon(group, poly, poly_area)

	return 
end
NavigationGroupManagerNewArea.get_polygon_group = function (self, poly)
	return self._registered_polygons[poly]
end
NavigationGroupManagerNewArea.get_group_polygons = function (self, poly)
	local poly_group = self.get_polygon_group(self, poly)

	return poly_group.get_group_polygons(poly_group)
end
NavigationGroupManagerNewArea.in_range = function (self, navmesh, distance, group)
	local group_center = group.group_center(group)
	local radius = group.radius(group)

	return distance <= radius
end
NavigationGroupManagerNewArea.calc_polygon_center = function (self, navmesh, poly)
	local n = {
		false,
		false,
		false
	}
	local v = Vector3(0, 0, 0)
	local vec = nil
	n[1], n[2], n[3] = NavigationMesh.polygon_vertices(navmesh, poly)

	for _, index in ipairs(n) do
		vec = NavigationMesh.vertex(navmesh, index)
		v = v + vec
	end

	return v/3
end
NavigationGroupManagerNewArea.calc_polygon_area = function (self, navmesh, poly)
	local sides = self.get_polygon_sides(self, navmesh, poly)
	local perimeter = 0

	for i = 1, 3, 1 do
		perimeter = perimeter + sides[i]
	end

	perimeter = perimeter/2
	local area = math.sqrt(perimeter*(perimeter - sides[1])*(perimeter - sides[2])*(perimeter - sides[3]))

	return area
end
NavigationGroupManagerNewArea.get_polygon_sides = function (self, navmesh, poly)
	local points = {
		false,
		false,
		false
	}
	local sides = {
		false,
		false,
		false
	}
	points[1], points[2], points[3] = NavigationMesh.polygon_vertices(navmesh, poly)

	for i = 1, 3, 1 do
		points[i] = NavigationMesh.vertex(navmesh, points[i])
	end

	sides[1] = Vector3.distance(points[1], points[2])
	sides[2] = Vector3.distance(points[1], points[3])
	sides[3] = Vector3.distance(points[2], points[3])

	return sides
end
NavigationGroupManagerNewArea.print_groups = function (self)
	if not self._printing_groups then
		print([[


		   =================
		   SHOWING VERSION 4  
		   =================

]])

		for group, _ in pairs(self._navigation_groups) do
			group.print_group(group, self._navmesh)
		end
	else
		for group, _ in pairs(self._navigation_groups) do
			group.destroy_gui(group)
		end
	end

	self._printing_groups = not self._printing_groups

	return 
end
nav_group_manager_new_area = nav_group_manager_new_area or NavigationGroupManagerNewArea:new()

return 
