local function noise(x, seed)
	local next_seed, _ = Math.next_random(x + seed)
	local _, value = Math.next_random(next_seed)

	return value * 2 - 1
end

local function smoothed_noise(x, seed)
	return noise(x, seed) / 2 + noise(x - 1, seed) / 4 + noise(x + 1, seed) / 4
end

local function interpolated_noise(x, seed)
	local x_floored = math.floor(x)
	local remainder = x - x_floored
	local v1 = smoothed_noise(x_floored, seed)
	local v2 = smoothed_noise(x_floored + 1, seed)

	return math.lerp(v1, v2, remainder)
end

PerlinPath = {
	make_perlin_path = function (start_oktave, end_oktave, persistance, seed)
		local total = 0
		local octave_table = {}

		for i = start_oktave, end_oktave, 1 do
			local waves = {}
			local amplitude = persistance^i
			local x = 0
			local step_dist = 1 / i

			for j = 0, i, 1 do
				local next_seed, _ = Math.next_random(x + seed)
				local _, value = Math.next_random(next_seed)
				waves[j] = {
					x,
					value * amplitude
				}
				x = x + step_dist
				seed = next_seed
			end

			octave_table[i - start_oktave + 1] = waves
		end

		return octave_table
	end
}
local near_path = 1345600
local zone_length = 25
PerlinPath.make_easy_path = function (nav_world, main_path, path_length)
	local new_path = {}
	local cycle_length = zone_length
	local num_cycles = path_length / cycle_length
	local new_cycle_length = path_length / math.floor(num_cycles)
	local x = 0

	for i = 1, num_cycles, 1 do
		local pos = LevelAnalysis.get_path_point(main_path, path_length, i / num_cycles)
		new_path[#new_path + 1] = Vector3Box(pos)
	end

	return PerlinPath.fill_spawns(nav_world, new_path, path_length)
end
local vector3_distance_squared = Vector3.distance_squared
PerlinPath.fill_spawns = function (nav_world, main_path, path_length, density_path, p1, p2)
	local lookup = {}
	local triangle = nil
	local num_triangles = 0
	local triangles = {}
	local seed_list = {}
	local area_list = {}

	for i = 1, #main_path, 1 do
		local pos = main_path[i]:unbox()
		local triangle = GwNavTraversal.get_seed_triangle(nav_world, pos)

		if triangle then
			num_triangles = num_triangles + 1
			triangles[num_triangles] = triangle
			seed_list[num_triangles] = pos
			local a, b, c = Script.temp_count()
			local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, triangle)
			local tri_center = (p1 + p2 + p3) / 3
			local key = tri_center.x * 0.0001 + tri_center.y + tri_center.z * 10000
			area_list[num_triangles] = Vector3.length(Vector3.cross(p2 - p1, p3 - p1)) / 2

			Script.set_temp_count(a, b, c)

			lookup[key] = num_triangles
		end
	end

	local i = 0

	while i < num_triangles do
		i = i + 1
		triangle = triangles[i]
		local a, b, c = Script.temp_count()
		local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, triangle)
		local tri_center = (p1 + p2 + p3) / 3
		local key = tri_center.x * 0.0001 + tri_center.y + tri_center.z * 10000
		local seed_index = lookup[key]
		area_list[seed_index] = area_list[seed_index] + Vector3.length(Vector3.cross(p2 - p1, p3 - p1)) / 2

		Script.set_temp_count(a, b, c)

		local seed_a = seed_list[seed_index - 1]
		local seed_b = seed_list[seed_index]
		local seed_c = seed_list[seed_index + 1]
		local neighbors = {
			GwNavTraversal.get_neighboring_triangles(triangle)
		}

		for k = 1, #neighbors, 1 do
			local neighbour = neighbors[k]
			local t1, t2, t3 = Script.temp_count()
			p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, neighbour)
			local tri_center = (p1 + p2 + p3) / 3
			local key = tri_center.x * 0.0001 + tri_center.y + tri_center.z * 10000

			if not lookup[key] then
				local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, neighbour)
				local a = (seed_a and vector3_distance_squared(seed_a, tri_center)) or math.huge
				local b = (seed_b and vector3_distance_squared(seed_b, tri_center)) or math.huge
				local c = (seed_c and vector3_distance_squared(seed_c, tri_center)) or math.huge
				local closest = nil

				if a < b then
					if c and a < c then
						if a < near_path then
							closest = seed_index - 1
						else
							closest = 1
						end
					elseif c < near_path then
						closest = seed_index + 1
					else
						closest = 1
					end
				elseif b < c then
					if b < near_path then
						closest = seed_index
					else
						closest = 1
					end
				elseif c < near_path then
					closest = seed_index + 1
				else
					closest = 1
				end

				num_triangles = num_triangles + 1
				triangles[num_triangles] = neighbour
				lookup[key] = closest
			end

			Script.set_temp_count(t1, t2, t3)
		end
	end

	for i = 1, #area_list, 1 do
		print("area " .. i .. ") " .. area_list[i])
	end

	print("DONE!", #triangles)

	return triangles, lookup, area_list
end
PerlinPath.populate_spawns = function (nav_world, main_path, path_length, density_path, p1, p2)
	return 
end
PerlinPath.draw_debug_spawns = function (nav_world, gui, triangles, lookup, area_list)
	local size = #triangles

	for i = 1, size, 1 do
		local triangle = triangles[i]
		local a, b, c = Script.temp_count()
		local h = Vector3(0, 0, 0.1)
		local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, triangle)
		local tri_center = (p1 + p2 + p3) / 3
		local key = tri_center.x * 0.0001 + tri_center.y + tri_center.z * 10000

		Gui.triangle(gui, p1 + h, p2 + h, p3 + h, 2, Colors.get_indexed((12 + lookup[key]) % 32 + 1))
		Script.set_temp_count(a, b, c)
	end

	return 
end
PerlinPath.make_path = function (oktave_table, points)
	local step_dist = 1 / points
	local x = 0

	for i = start_oktave, end_oktave, 1 do
		x = x + step_dist
	end

	return 
end
PerlinPath.normalize_path = function (points, wanted_area_fill_rate)
	local area = 0
	local segments = #points - 1

	for i = 1, segments, 1 do
		area = area + (points[i][2] + points[i + 1][2]) * 0.5
	end

	local total_area = segments
	local area_fill_rate = area / total_area
	local multiply_with = wanted_area_fill_rate / area_fill_rate

	return multiply_with
end

return 
