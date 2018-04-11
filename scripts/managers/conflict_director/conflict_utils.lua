-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/settings/breeds")
require("scripts/settings/conflict_settings")

ConflictUtils = {}
local ConflictUtils = ConflictUtils
local distance_squared = Vector3.distance_squared
local length_squared = Vector3.length_squared
local SPHERES = 1
local LINES = 2
local RED = 1
local YELLOW = 2
local GREEN = 3
local WHITE = 4
local math_random = Math.random
local colors = {
	QuaternionBox(255, 184, 46, 0),
	QuaternionBox(255, 250, 140, 0),
	QuaternionBox(255, 0, 220, 0),
	QuaternionBox(200, 235, 235, 235)
}
ConflictUtils.random_interval = function (numbers)
	if type(numbers) == "table" then
		return math_random(numbers[1], numbers[2])
	else
		return numbers
	end

	return 
end
local clusters_sizes = {}
local cluster_index_lookup = {}
local cluster_work_queue = {
	false,
	false,
	false
}
ConflictUtils.cluster_positions = function (positions, min_dist)
	local clusters = {
		positions[1]
	}
	local clusters_sizes = clusters_sizes
	clusters_sizes[1] = 1
	cluster_index_lookup[1] = 1
	min_dist = min_dist * min_dist
	local work_queue = cluster_work_queue

	for i = 1, 3, 1 do
		work_queue[i] = nil
	end

	for i = 2, #positions, 1 do
		work_queue[i - 1] = i
	end

	local work_size = #work_queue

	while 0 < work_size do
		local clustered = false

		for i = 1, #clusters, 1 do
			for j = 1, work_size, 1 do
				local index = work_queue[j]
				local dist = Vector3.distance_squared(clusters[i], positions[index])

				if dist < min_dist then
					work_queue[j] = work_queue[work_size]
					work_size = work_size - 1
					cluster_index_lookup[index] = i
					clusters_sizes[i] = clusters_sizes[i] + 1
					clustered = true

					break
				end
			end
		end

		if not clustered then
			local i = #clusters + 1
			local index = work_queue[1]
			clusters[i] = positions[index]
			cluster_index_lookup[index] = i
			clusters_sizes[i] = 1
			work_queue[1] = work_queue[work_size]
			work_size = work_size - 1
		end
	end

	for i = #clusters + 1, #clusters_sizes, 1 do
		clusters_sizes[i] = nil
	end

	return clusters, clusters_sizes, cluster_index_lookup
end
local loneliness = {}
local max_cluster_score = {
	1,
	2,
	3,
	6
}
ConflictUtils.cluster_weight_and_loneliness = function (positions, min_dist)
	local distance_squared = Vector3.distance_squared
	min_dist = min_dist * min_dist
	local num_positions = #positions

	if num_positions == 1 then
		return 1, 1, 100
	elseif num_positions == 0 then
		return 0, 0, 0
	end

	local a = positions[1]
	local b = positions[2]
	local c = positions[3]
	local d = positions[4]
	local utility_sum = 0
	local ab = 0
	local ac = 0
	local ad = 0
	local bc = 0
	local bd = 0
	local cd = 0

	if d then
		ad = distance_squared(a, d)
		bd = distance_squared(b, d)
		cd = distance_squared(c, d)
		utility_sum = utility_sum + ((ad < min_dist and 1) or 0)
		utility_sum = utility_sum + ((bd < min_dist and 1) or 0)
		utility_sum = utility_sum + ((cd < min_dist and 1) or 0)
		loneliness[4] = ad + bd + cd
	end

	if c then
		ac = distance_squared(a, c)
		bc = distance_squared(b, c)
		utility_sum = utility_sum + ((ac < min_dist and 1) or 0)
		utility_sum = utility_sum + ((bc < min_dist and 1) or 0)
		loneliness[3] = ac + bc + cd
	end

	if b then
		ab = distance_squared(a, b)
		utility_sum = utility_sum + ((ab < min_dist and 1) or 0)
		loneliness[2] = ab + bc + bd
	end

	loneliness[1] = ab + ac + ad
	local cluster_utility = utility_sum / max_cluster_score[num_positions]
	local loneliest_value = 0
	local loneliest_index = 1

	for i = 1, num_positions, 1 do
		if loneliest_value < loneliness[i] then
			loneliest_value = loneliness[i]
			loneliest_index = i
		end
	end

	loneliest_value = math.sqrt(loneliest_value) / num_positions

	return cluster_utility, loneliest_index, loneliest_value, loneliness
end
ConflictUtils.average_player_position = function ()
	local player_count = 0
	local player_center_pos = Vector3.zero()
	local players = Managers.player:human_and_bot_players()

	for k, player in pairs(players) do
		local unit = player.player_unit

		if Unit.alive(unit) then
			local pos = POSITION_LOOKUP[unit]
			player_center_pos = player_center_pos + pos
			player_count = player_count + 1
		end
	end

	if player_count == 0 then
		return nil
	end

	player_center_pos = player_center_pos * 1 / player_count

	return player_center_pos
end
local found_cover_units = {}
local hidden_cover_units = {}
ConflictUtils.hidden_cover_points = function (center_position, avoid_pos_list, min_rad, max_rad, dot_threshold)
	if script_data.debug_near_cover_points then
		local free_flight_manager = Managers.free_flight
		local in_free_flight = free_flight_manager.active(free_flight_manager, "global")

		if in_free_flight then
			center_position = free_flight_manager.camera_position_rotation(free_flight_manager)
		end
	end

	local bp = Managers.state.conflict.level_analysis.cover_points_broadphase
	min_rad = min_rad * min_rad
	dot_threshold = dot_threshold or -0.9
	local MAX_RANGE = 40
	local num_found_cover_units = Broadphase.query(bp, center_position, math.min(max_rad, MAX_RANGE), found_cover_units)
	local red = Colors.get("red")
	local green = Colors.get("green")
	local vector3_normalize = Vector3.normalize
	local quaternion_forward = Quaternion.forward
	local unit_local_rotation = Unit.local_rotation
	local unit_local_position = Unit.local_position
	local vector3_dot = Vector3.dot
	local num_found = 0
	local num_to_avoid = #avoid_pos_list

	for i = 1, num_found_cover_units, 1 do
		local cover_unit = found_cover_units[i]
		local pos = unit_local_position(cover_unit, 0)
		local dist_squared = distance_squared(pos, center_position)

		if min_rad <= dist_squared then
			local rot = unit_local_rotation(cover_unit, 0)
			local num_valid = 0

			for j = 1, num_to_avoid, 1 do
				local avoid_pos = avoid_pos_list[j]
				local to_cover_point = vector3_normalize(pos - avoid_pos)

				Vector3.set_z(to_cover_point, 0)

				local dot = (dist_squared < 50 and dot_threshold) or -0.6
				local valid = vector3_dot(quaternion_forward(rot), to_cover_point) < dot

				if valid then
					num_valid = num_valid + 1
				else
					break
				end
			end

			if num_to_avoid == num_valid then
				num_found = num_found + 1
				hidden_cover_units[num_found] = cover_unit

				if script_data.debug_near_cover_points then
					QuickDrawer:sphere(pos, 0.8, green)
					QuickDrawer:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot) * 2 + Vector3(0, 0, 1), green)
				end
			elseif script_data.debug_near_cover_points then
				QuickDrawer:sphere(pos, 0.8, red)
				QuickDrawer:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot) * 2 + Vector3(0, 0, 1), red)
			end
		end
	end

	return num_found, hidden_cover_units
end
ConflictUtils.test_is_cover_point_hidden = function ()
	local bp = Managers.state.conflict.level_analysis.cover_points_broadphase
	local num_found_cover_units = Broadphase.query(bp, PLAYER_POSITIONS[1], 20, found_cover_units)
	local red = Colors.get("red")
	local green = Colors.get("green")
	local unit_local_rotation = Unit.local_rotation
	local unit_local_position = Unit.local_position
	local min_rad = 5

	for i = 1, num_found_cover_units, 1 do
		local cover_unit = found_cover_units[i]
		local pos = unit_local_position(cover_unit, 0)
		local rot = unit_local_rotation(cover_unit, 0)

		if ConflictUtils.is_cover_point_hidden(cover_unit, PLAYER_POSITIONS, min_rad) then
			QuickDrawer:sphere(pos, 0.8, green)
			QuickDrawer:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot) * 2 + Vector3(0, 0, 1), green)
		else
			QuickDrawer:sphere(pos, 0.8, red)
			QuickDrawer:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot) * 2 + Vector3(0, 0, 1), red)
		end
	end

	return 
end
ConflictUtils.is_cover_point_hidden = function (cover_point_unit, avoid_pos_list, min_rad, long_distance_sqr)
	local vector3_normalize = Vector3.normalize
	local quaternion_forward = Quaternion.forward
	local unit_local_rotation = Unit.local_rotation
	local unit_local_position = Unit.local_position
	local vector3_dot = Vector3.dot
	local long_distance_sqr = long_distance_sqr or 10000
	local pos = unit_local_position(cover_point_unit, 0)
	local rot = unit_local_rotation(cover_point_unit, 0)
	local num_to_avoid = #avoid_pos_list
	local num_valid = 0

	for j = 1, num_to_avoid, 1 do
		local avoid_pos = avoid_pos_list[j]
		local dist_squared = distance_squared(pos, avoid_pos)

		if dist_squared < min_rad then
			break
		end

		local to_cover_point = vector3_normalize(pos - avoid_pos)
		local dot = (dist_squared < 225 and -0.9) or -0.6
		local valid = vector3_dot(quaternion_forward(rot), to_cover_point) < dot or long_distance_sqr < dist_squared

		if valid then
			num_valid = num_valid + 1
		else
			break
		end
	end

	if num_valid == num_to_avoid then
		return true
	end

	return 
end
ConflictUtils.get_random_spawner_with_id = function (id, except_spawner_unit)
	local spawner_system = Managers.state.entity:system("spawner_system")
	local spawners = spawner_system._id_lookup[id]

	if spawners then
		local num = #spawners
		local index = Math.random(1, num)
		local spawner = spawners[index]

		if 1 < num and spawner == except_spawner_unit then
			index = (index - 1) % num + 1
			spawner = spawners[index]
		end

		return spawner, index
	end

	return 
end
ConflictUtils.get_random_hidden_spawner = function (center_pos, radius, pick_closest_spawner)
	local spawner_system = Managers.state.entity:system("spawner_system")
	local amount = Broadphase.query(spawner_system.hidden_spawners_broadphase, center_pos, radius, found_cover_units)

	if amount <= 0 then
		return 
	end

	if pick_closest_spawner then
		return found_cover_units[1]
	end

	local index = math.random(1, amount)

	return found_cover_units[index]
end
ConflictUtils.get_biggest_cluster = function (clusters_sizes)
	local biggest = 1

	for i = 2, #clusters_sizes, 1 do
		local size = clusters_sizes[i]

		if size then
			if clusters_sizes[biggest] < size then
				biggest = i
			end
		else
			break
		end
	end

	return biggest
end
ConflictUtils.filter_positions = function (center_pos, main_target_pos, spawner_units, min_dist, max_dist)
	local list = {}
	max_dist = max_dist * max_dist
	min_dist = min_dist * min_dist
	local behind_dist = distance_squared(center_pos, main_target_pos)

	for j = 1, #spawner_units, 1 do
		local unit = spawner_units[j]
		local unit_pos = Unit.local_position(unit, 0)
		local dist_squared = distance_squared(center_pos, unit_pos)

		if dist_squared < max_dist and min_dist < dist_squared then
			local dist_squared_to_players = distance_squared(main_target_pos, unit_pos)

			if dist_squared_to_players < behind_dist then
				list[#list + 1] = unit
			end
		end
	end

	return list
end
ConflictUtils.filter_horde_spawners = function (player_positions, spawner_units, hidden_spawner_units, min_dist, max_dist)
	local list = {}
	local hidden_list = {}
	max_dist = max_dist * max_dist
	min_dist = min_dist * min_dist

	for i = 1, #player_positions, 1 do
		local pos = player_positions[i]

		for j = 1, #spawner_units, 1 do
			local unit = spawner_units[j]
			local unit_pos = Unit.local_position(unit, 0)
			local dist_squared = distance_squared(pos, unit_pos)

			if dist_squared < max_dist and min_dist < dist_squared then
				list[#list + 1] = unit

				if hidden_spawner_units[unit] then
					hidden_list[#hidden_list + 1] = unit
				end
			end
		end
	end

	return list, hidden_list
end
ConflictUtils.filter_horde_spawners_strictly = function (player_positions, spawner_units, hidden_spawner_units, min_dist, max_dist)
	local list = {}
	local hidden_list = {}
	max_dist = max_dist * max_dist
	min_dist = min_dist * min_dist
	local num_player_pos = #player_positions

	for j = 1, #spawner_units, 1 do
		local unit = spawner_units[j]
		local spawner_pos = Unit.local_position(unit, 0)
		local count = 0

		for i = 1, num_player_pos, 1 do
			local pos = player_positions[i]
			local dist_squared = distance_squared(pos, spawner_pos)

			if dist_squared < max_dist and min_dist < dist_squared then
				count = count + 1
			end
		end

		if count == num_player_pos then
			list[#list + 1] = unit

			if hidden_spawner_units[unit] then
				hidden_list[#hidden_list + 1] = unit
			end
		end
	end

	return list, hidden_list
end
ConflictUtils.get_hidden_pos = function (world, nav_world, center_pos, avoid_positions, radius, radius_spread, avoid_dist_sqr, max_tries, cake_slice_dir, cake_slice_angle_radians)
	local h = Vector3(0, 0, 1)
	local half_radius_spread = radius_spread * 0.5
	local ignore_umbra = not World.umbra_available(world)
	local drawfunc = QuickDrawerStay

	for i = 1, max_tries, 1 do
		local check_pos = nil

		if cake_slice_dir then
			check_pos = ConflictUtils.get_spawn_pos_on_cake_slice(nav_world, center_pos, radius - half_radius_spread, radius + half_radius_spread, cake_slice_dir, cake_slice_angle_radians, 10)
		else
			check_pos = ConflictUtils.get_spawn_pos_on_circle(nav_world, center_pos, radius, radius_spread, 10)
		end

		local extra_pos = nil

		if check_pos then
			local hidden = true

			for j = 1, #avoid_positions, 1 do
				local avoid_pos = avoid_positions[j]
				local to_vec = check_pos - avoid_pos
				local los = ignore_umbra or World.umbra_has_line_of_sight(world, check_pos + h, avoid_pos + h)

				if los then
					hidden = false

					break
				end
			end

			if hidden then
				return check_pos
			end
		end
	end

	return 
end
local work_list = {}
local work_list_lookup = {}
ConflictUtils.condense_array_randomly = function (array, wanted_size)
	local array_size = #array

	if array_size <= wanted_size then
		return array
	end

	table.clear(work_list_lookup)
	table.clear(work_list)

	local index = math.random(1, array_size)

	for i = 1, wanted_size, 1 do
		while work_list_lookup[index] do
			index = math.random(1, array_size)
		end

		work_list[i] = array[index]
		work_list_lookup[index] = true
	end

	return work_list
end
ConflictUtils.find_center_tri = function (nav_world, pos)
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, pos, 30, 30)

	if success then
		pos.z = altitude

		return pos
	end

	return 
end
ConflictUtils.simulate_dummy_target = function (nav_world, center_pos, t)
	local radius = 15
	local add_vec = Vector3(radius, 0, 1)
	local angle_in_radians = (t / 3) % (math.pi * 2)
	local pos = center_pos + Quaternion.rotate(Quaternion(Vector3.up(), angle_in_radians), add_vec)
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, pos, 15, 15)

	if success then
		pos.z = altitude

		return pos
	end

	return pos
end
ConflictUtils.check_spawn_pos = function (mesh, pos)
	local poly = NavigationMesh.find_polygon(mesh, pos)

	if poly then
		local cpos, fail = NavigationMesh.constrain_to_polygon(mesh, pos, poly)

		if not fail then
			local p1, p2, p3 = NavigationMesh.polygon_vertices(mesh, poly)
			local triangle_center = (NavigationMesh.vertex(mesh, p1) + NavigationMesh.vertex(mesh, p2) + NavigationMesh.vertex(mesh, p3)) / 3

			if math.abs(cpos.z - triangle_center.z) < 3 then
				return true
			end
		end
	end

	return false
end
ConflictUtils.get_spawn_pos_on_circle_segment = function (nav_world, center_pos, radius, direction, width, tries)
	local lifted = center_pos + Vector3.up() * 1
	local _, base_angle = math.cartesian_to_polar(direction.x, direction.y)
	local r_steps = radius / tries

	for ii = 1, tries, 1 do
		local angle_offset = Math.random_range(-width / 2, width / 2)
		local angle = base_angle + angle_offset
		local dir = Vector3.normalize(direction)
		local distance = Math.random_range(radius - ii * r_steps, radius - (ii - 1) * r_steps)
		local x, y = math.polar_to_cartesian(distance, angle)
		local search_pos = center_pos + Vector3(x, y, direction.z)
		local pos = ConflictUtils.find_center_tri(nav_world, search_pos)

		if pos then
			return pos
		end
	end

	return false
end
ConflictUtils.test_cake_slice = function (nav_world, center_pos, t)
	local cake_slice_dir = Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(t % 20 / 20 * 360)), Vector3(0, 20, 0))

	QuickDrawer:line(center_pos + Vector3(0, 0, 1), center_pos + cake_slice_dir + Vector3(0, 0, 1), Color(0, 255, 175))

	for i = 1, 100, 1 do
		local v = ConflictUtils.get_spawn_pos_on_cake_slice(nav_world, center_pos, 1, 40, cake_slice_dir, math.pi / 4, 5)

		if v then
			QuickDrawer:sphere(v, 0.5, Color(0, 0, 175))
		end
	end

	return 
end
ConflictUtils.get_spawn_pos_on_cake_slice = function (nav_world, center_pos, radius1, radius2, cake_slice_dir, cake_slice_angle_radians, tries)
	local slice_angle = math.atan2(cake_slice_dir.x, cake_slice_dir.y)
	local half_slice_angle = cake_slice_angle_radians * 0.5
	local angle1 = slice_angle - half_slice_angle
	local angle2 = slice_angle + half_slice_angle

	for i = 1, tries, 1 do
		local x, y = math.get_uniformly_random_point_inside_sector(radius1, radius2, angle1, angle2)
		local pos = Vector3(center_pos.x + x, center_pos.y + y, center_pos.z)
		local success, z = GwNavQueries.triangle_from_position(nav_world, pos, 30, 30)

		if success then
			Vector3.set_z(pos, z)

			return pos
		end
	end

	return false
end
ConflictUtils.get_spawn_pos_on_circle = function (nav_world, center_pos, dist, spread, tries)
	for i = 1, tries, 1 do
		local add_vec = Vector3(dist + (math.random() - 0.5) * spread, 0, 1)
		local pos = center_pos + Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360))), add_vec)
		pos = ConflictUtils.find_center_tri(nav_world, pos)

		if pos then
			return pos
		end
	end

	return false
end
ConflictUtils.get_spawn_pos_on_circle_with_func = function (nav_world, center_pos, dist, spread, tries, filter_func, filter_data)
	for i = 1, tries, 1 do
		local add_vec = Vector3(dist + (math.random() - 0.5) * spread, 0, 1)
		local pos = center_pos + Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360))), add_vec)
		pos = ConflictUtils.find_center_tri(nav_world, pos)

		if pos and filter_func(pos, filter_data) then
			return pos
		end
	end

	return false
end
ConflictUtils.get_closest_spawn_dist = function (mesh, unit_list, ray_from, ray_to, dir, radius)
	if #unit_list == 0 then
		return ray_to
	end

	local closest = nil
	local min_ray_dist = math.huge

	for i = 1, #unit_list, 1 do
		local cu_pos = unit_list[i][1]
		local cu_rad = unit_list[i][2]
		local proj_pos = math.closest_point_on_line(cu_pos, ray_from, ray_to)
		local dist = Vector3.distance(proj_pos, cu_pos)

		if dist < cu_rad then
			local ray_dist = Vector3.distance(ray_from, proj_pos)

			if ray_dist < min_ray_dist then
				min_ray_dist = ray_dist
				closest = unit_list[i]
			end
		end
	end

	if closest then
		local spawn_pos = closest[1] + dir * (closest[2] + radius) * MonsterToppingsDef.spawn_dist_multiplier

		if ConflictUtils.check_spawn_pos(mesh, spawn_pos) then
			return spawn_pos
		end
	else
		return ray_to
	end

	return 
end
local MAX_TRIED_POSITIONS = 256
ConflictUtils.tetris_spawn = function (world, spawn_func, player, spawn_list, pos, rot)
	local already_spawned = {}
	local mesh = Managers.state.level:nav_mesh()
	local ray_dist = 10
	local max_dir_tries = 10
	local spawn_index = 1
	local loops = 0

	dprint("\tTETRIS SPAWN, UNITS: ", #spawn_list, " AT:", pos)

	while spawn_index <= #spawn_list and loops < MAX_TRIED_POSITIONS do
		local breed = spawn_list[spawn_index]
		local radius = breed.radius

		for i = 1, max_dir_tries, 1 do
			local radians = math.random() * 2 * math.pi
			local dir = Vector3(math.cos(radians), math.sin(radians), 0)
			local end_pos = pos + dir * ray_dist
			local spawn_pos = ConflictUtils.get_closest_spawn_dist(mesh, already_spawned, end_pos, pos, dir, radius)

			if spawn_pos then
				local spawn_rot = rot

				if GameTweakData.RANDOM_MONSTER_SPAWN_ROT then
					local add_rot = Quaternion(Vector3.up(), math.random() * GameTweakData.RANDOM_MONSTER_SPAWN_ROT - math.random() * GameTweakData.RANDOM_MONSTER_SPAWN_ROT)
					spawn_rot = Quaternion.multiply(add_rot, rot)
				end

				if spawn_func(world, breed, spawn_pos, spawn_rot, player) then
					already_spawned[#already_spawned + 1] = {
						spawn_pos,
						radius
					}
				end

				break
			else
				dprint("\t\tFAIL DIR-POS")
			end
		end

		loops = loops + 1
		spawn_index = spawn_index + 1
	end

	return 
end
ConflictUtils.boxify_pos_array = function (array)
	for i = 1, #array, 1 do
		array[i] = Vector3Box(array[i])
	end

	return 
end
ConflictUtils.draw_stack_of_balls = function (pos, a, r, g, b)
	QuickDrawer:sphere(pos + Vector3(0, 0, 1), 0.4, Color(a, r, g, b))
	QuickDrawer:sphere(pos + Vector3(0, 0, 1.5), 0.3, Color(a, r * 0.75, g * 0.75, b * 0.75))
	QuickDrawer:sphere(pos + Vector3(0, 0, 2), 0.2, Color(a, r * 0.5, g * 0.5, b * 0.5))
	QuickDrawer:sphere(pos + Vector3(0, 0, 2.5), 0.1, Color(a, r * 0.25, g * 0.25, b * 0.25))

	return 
end
local level_portals = {}
ConflictUtils.get_teleporter_portals = function ()
	local level_key = Managers.state.game_mode:level_key()
	local level_name = LevelSettings[level_key].level_name
	local portals = level_portals[level_name]

	if portals then
		return portals
	end

	portals = {}
	level_portals[level_name] = portals
	local unit_ind = LevelResource.unit_indices(level_name, "units/hub_elements/portal")

	for _, id in ipairs(unit_ind) do
		local pos = LevelResource.unit_position(level_name, id)
		local rot = LevelResource.unit_rotation(level_name, id)
		local unit_data = LevelResource.unit_data(level_name, id)
		local portal_id = DynamicData.get(unit_data, "id")
		local boxed_rot = QuaternionBox(rot)
		local boxed_pos = Vector3Box(pos)
		portals[portal_id] = {
			boxed_pos,
			boxed_rot
		}
	end

	return portals
end
local InterestPointUnitsLookup = InterestPointUnitsLookup
ConflictUtils.interest_point_outside_nav_mesh = function (nav_world, unit_name, pos, interest_point_rot)
	local lookup = InterestPointUnitsLookup[unit_name]

	for i = 1, #lookup, 1 do
		local point = lookup[i]
		local local_pos = point[1]:unbox()
		local_pos = Quaternion.rotate(interest_point_rot, local_pos)
		local point_world_position = pos + local_pos
		local is_position_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, point_world_position, 0.3, 0.3)

		if not is_position_on_navmesh then
			return point_world_position
		end
	end

	return 
end
ConflictUtils.generate_spawn_point_lookup = function (world)
	local InterestPointUnits = InterestPointUnits
	local lookup = {}
	local position = Vector3(0, 0, -1000)
	local rotation = Quaternion.identity()

	for size, unit_names in ipairs(InterestPointUnits) do
		if unit_names then
			for k, unit_name in ipairs(unit_names) do
				local unit = World.spawn_unit(world, unit_name, position, rotation)
				local p = {}
				local i = 0

				while Unit.has_data(unit, "interest_point", "points", i) do
					local node_name = Unit.get_data(unit, "interest_point", "points", i, "node")
					local node = Unit.node(unit, node_name)
					local point_position = (node_name == "root_point" and Vector3(0, 0, 0)) or Unit.local_position(unit, node)
					local point_rotation = Unit.local_rotation(unit, node)
					p[#p + 1] = {
						Vector3Box(point_position),
						QuaternionBox(point_rotation)
					}
					i = i + 1
				end

				lookup[unit_name] = p

				World.destroy_unit(world, unit)
			end
		end
	end

	InterestPointUnitsLookup = lookup

	return 
end
ConflictUtils.display_number_of_breeds = function (header, num_spawned, num_spawned_by_breed)
	local s = header .. tostring(num_spawned) .. ", "

	for breed_name, amount in pairs(num_spawned_by_breed) do
		if 0 < amount then
			s = s .. breed_name .. "=" .. amount .. ", "
		end
	end

	Debug.text(s)

	return 
end
ConflictUtils.show_where_ai_is = function (spawned)
	local POSITION_LOOKUP = POSITION_LOOKUP
	local h = Vector3(0, 0, 40)

	for i = 1, #spawned, 1 do
		local unit = spawned[i]
		local pos = POSITION_LOOKUP[unit]
		local breed = Unit.get_data(unit, "breed")

		QuickDrawer:line(pos, pos + h, Color(unpack(breed.debug_color)))
	end

	return 
end
ConflictUtils.get_level_units_with_id = function (unit_name, unit_list, id)
	unit_name = unit_name or "units/hub_elements/generic_ai_node"
	local level_key = Managers.state.game_mode:level_key()
	local level_name = LevelSettings[level_key].level_name
	local unit_ind = LevelResource.unit_indices(level_name, unit_name)

	for _, id in ipairs(unit_ind) do
		local pos = LevelResource.unit_position(level_name, id)
		local unit_data = LevelResource.unit_data(level_name, id)
		local portal_id = DynamicData.get(unit_data, "id")
		local boxed_rot = QuaternionBox(Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360))))
		local boxed_pos = Vector3Box(pos)
		unit_list[portal_id] = boxed_pos
	end

	return unit_list
end
ConflictUtils.make_roaming_spawns = function (self, nav_world, level_analysis)
	Profiler.start("make_spawns")

	local list = {}

	if LEVEL_EDITOR_TEST then
		return list
	end

	local density = CurrentConflictSettings.roaming.density or 0.01
	local n = {
		false,
		false,
		false
	}
	local offset = Vector3(0, 0, 0.1)
	local seed_pos = level_analysis.get_start_and_finish(level_analysis)

	if seed_pos then
		seed_pos = seed_pos.unbox(seed_pos)
	else
		local level_key = Managers.state.game_mode:level_key()
		local level_name = LevelSettings[level_key].level_name
		local unit_ind = LevelResource.unit_indices(level_name, "core/gwnav/units/seedpoint/seedpoint")

		for _, id in ipairs(unit_ind) do
			seed_pos = LevelResource.unit_position(level_name, id)

			break
		end
	end

	local triangle = GwNavTraversal.get_seed_triangle(nav_world, seed_pos)
	local triangles = {
		triangle
	}
	local num_triangles = 1
	local i = 0
	local lookup = {}
	local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, triangle)
	local p = (p1 + p2 + p3) / 3
	lookup[p.x * 0.0001 + p.y + p.z * 10000] = true

	while i < num_triangles do
		i = i + 1
		triangle = triangles[i]
		local a, b, c = Script.temp_count()
		local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, triangle)
		local triangle_center = (p1 + p2 + p3) / 3

		if math.random() < density then
			list[#list + 1] = Vector3Box(triangle_center)
		end

		QuickDrawerStay:line(p1, p1 + Vector3(0, 0, 10))
		Script.set_temp_count(a, b, c)

		local neighbors = {
			GwNavTraversal.get_neighboring_triangles(triangle)
		}

		for j = 1, #neighbors, 1 do
			local neighbour = neighbors[j]
			local a, b, c = Script.temp_count()
			p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, neighbour)
			local tri_center = (p1 + p2 + p3) / 3
			local key = tri_center.x * 0.0001 + tri_center.y + tri_center.z * 10000

			Script.set_temp_count(a, b, c)

			if not lookup[key] then
				num_triangles = num_triangles + 1
				triangles[num_triangles] = neighbour
				lookup[key] = true
			end
		end
	end

	Profiler.stop("make_spawns")

	return list
end

return 
