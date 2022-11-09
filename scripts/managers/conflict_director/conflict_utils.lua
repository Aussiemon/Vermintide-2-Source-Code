require("scripts/settings/breeds")
require("scripts/settings/patrol_formation_settings")
require("scripts/managers/conflict_director/breed_packs")

ConflictUtils = {}
local ConflictUtils = ConflictUtils
local distance_squared = Vector3.distance_squared
local math_random = Math.random
local quaternion_look = Quaternion.look

local function get_with_override(settings, key, difficulty, fallback_difficulty)
	local overrides = settings.difficulty_overrides
	local override_settings = overrides and (overrides[difficulty] or overrides[fallback_difficulty])

	return (override_settings and override_settings[key]) or settings[key]
end

ConflictUtils.random_interval = function (numbers)
	if type(numbers) == "table" then
		return math_random(numbers[1], numbers[2])
	else
		return numbers
	end
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

	while work_size > 0 do
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
	local num_positions = math.min(#positions, 4)

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

		if ALIVE[unit] then
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
	local bp = Managers.state.conflict.level_analysis.cover_points_broadphase
	min_rad = min_rad * min_rad
	dot_threshold = (dot_threshold and math.max(dot_threshold, -0.9)) or -0.9
	local MAX_RANGE = 40
	local num_found_cover_units = Broadphase.query(bp, center_position, math.min(max_rad, MAX_RANGE), found_cover_units)
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
			end
		end
	end

	return num_found, hidden_cover_units
end

ConflictUtils.debug_is_cover_point_hidden = function ()
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
end

ConflictUtils.get_random_spawner_with_id = function (id, except_spawner_unit)
	local spawner_system = Managers.state.entity:system("spawner_system")
	local spawners = spawner_system._id_lookup[id]

	if spawners then
		local num = #spawners
		local index = Math.random(1, num)
		local spawner = spawners[index]

		if num > 1 and spawner == except_spawner_unit then
			index = (index - 1) % num + 1
			spawner = spawners[index]
		end

		return spawner, index
	end
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

ConflictUtils.get_hidden_pos = function (world, nav_world, level, nav_tag_volume_handler, check_no_spawn_volumes, center_pos, avoid_positions, radius, radius_spread, avoid_dist_sqr, max_tries, cake_slice_dir, cake_slice_angle_radians)
	local h = Vector3(0, 0, 1)
	local half_radius_spread = radius_spread * 0.5
	local ignore_umbra = not World.umbra_available(world)

	for i = 1, max_tries, 1 do
		local check_pos = nil

		if cake_slice_dir then
			check_pos = ConflictUtils.get_spawn_pos_on_cake_slice(nav_world, center_pos, radius - half_radius_spread, radius + half_radius_spread, cake_slice_dir, cake_slice_angle_radians, 10, check_no_spawn_volumes, level, nav_tag_volume_handler)
		else
			check_pos = ConflictUtils.get_spawn_pos_on_circle(nav_world, center_pos, radius, radius_spread, 10, check_no_spawn_volumes, level, nav_tag_volume_handler)
		end

		if check_pos then
			local hidden = true

			for j = 1, #avoid_positions, 1 do
				local avoid_pos = avoid_positions[j]
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
end

ConflictUtils.is_position_inside_no_spawn_volume = function (level, nav_tag_volume_handler, pos)
	return NavTagVolumeUtils.inside_level_volume_layer(level, nav_tag_volume_handler, pos, "NO_SPAWN") or NavTagVolumeUtils.inside_level_volume_layer(level, nav_tag_volume_handler, pos, "NO_BOTS_NO_SPAWN")
end

ConflictUtils.find_center_tri = function (nav_world, pos, above_max, below_max)
	local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, pos, above_max or 30, below_max or 30)

	if success then
		pos.z = altitude

		return pos, p1, p2, p3
	end
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

ConflictUtils.test_cake_slice = function (nav_world, center_pos, t)
	local cake_slice_dir = Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(t % 20 / 20 * 360)), Vector3(0, 20, 0))

	QuickDrawer:line(center_pos + Vector3(0, 0, 1), center_pos + cake_slice_dir + Vector3(0, 0, 1), Color(0, 255, 175))

	for i = 1, 100, 1 do
		local v = ConflictUtils.get_spawn_pos_on_cake_slice(nav_world, center_pos, 1, 40, cake_slice_dir, math.pi / 4, 5)

		if v then
			QuickDrawer:sphere(v, 0.5, Color(0, 0, 175))
		end
	end
end

ConflictUtils.get_spawn_pos_on_cake_slice = function (nav_world, center_pos, radius1, radius2, cake_slice_dir, cake_slice_angle_radians, tries, check_no_spawn_volumes, level, nav_tag_volume_handler)
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

			if not check_no_spawn_volumes or not ConflictUtils.is_position_inside_no_spawn_volume(level, nav_tag_volume_handler, pos) then
				return pos
			end
		end
	end

	return false
end

ConflictUtils.get_spawn_pos_on_circle = function (nav_world, center_pos, dist, spread, tries, check_no_spawn_volumes, level, nav_tag_volume_handler, above_max, below_max)
	local p1, p2, p3 = nil

	for i = 1, tries, 1 do
		local add_vec = Vector3(dist + (math.random() - 0.5) * spread, 0, 1)
		local pos = center_pos + Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360))), add_vec)
		pos, p1, p2, p3 = ConflictUtils.find_center_tri(nav_world, pos, above_max, below_max)

		if pos and (not check_no_spawn_volumes or not ConflictUtils.is_position_inside_no_spawn_volume(level, nav_tag_volume_handler, pos)) then
			return pos, p1, p2, p3
		end
	end

	return false
end

ConflictUtils.get_furthest_pos_from_pos_on_circle = function (nav_world, center_pos, dist, spread, tries, avoid_pos)
	local positions = {}

	for i = 1, tries, 1 do
		local add_vec = Vector3(dist + (math.random() - 0.5) * spread, 0, 1)
		local pos = center_pos + Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360))), add_vec)
		pos = ConflictUtils.find_center_tri(nav_world, pos)

		if pos then
			positions[#positions + 1] = pos
		end
	end

	local max_dist = (dist + 0.5 * spread + 1) * 2 * (dist + 0.5 * spread + 1) * 2
	local furthest_pos = nil
	local furthest_distance = 0

	for i, pos in ipairs(positions) do
		if not furthest_pos then
			furthest_pos = pos
		elseif pos then
			local distance = Vector3.distance_squared(avoid_pos, pos)

			if furthest_distance < distance and distance <= max_dist then
				furthest_pos = pos
				furthest_distance = distance
			end
		end
	end

	if furthest_pos then
		return furthest_pos
	end

	return false
end

ConflictUtils.get_spawn_pos_on_circle_with_func = function (nav_world, center_pos, dist, spread, tries, filter_func, filter_data, above_max, below_max)
	for i = 1, tries, 1 do
		local add_vec = Vector3(dist + (math.random() - 0.5) * spread, 0, 1)
		local pos = center_pos + Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360))), add_vec)
		pos = ConflictUtils.find_center_tri(nav_world, pos, above_max, below_max)

		if pos and filter_func(pos, filter_data) then
			return pos
		end
	end

	return false
end

ConflictUtils.get_spawn_pos_on_circle_with_func_range = function (nav_world, center_pos, min_dist, max_dist, tries, filter_func, filter_data, above_max, below_max)
	for i = 1, tries, 1 do
		local add_vec = Vector3(math.lerp(min_dist, max_dist, math.random()), 0, 1)
		local pos = center_pos + Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360))), add_vec)
		pos = ConflictUtils.find_center_tri(nav_world, pos, above_max, below_max)

		if pos and filter_func(pos, filter_data) then
			return pos
		end
	end

	return false
end

ConflictUtils.draw_stack_of_balls = function (pos, a, r, g, b)
	QuickDrawer:sphere(pos + Vector3(0, 0, 1), 0.4, Color(a, r, g, b))
	QuickDrawer:sphere(pos + Vector3(0, 0, 1.5), 0.3, Color(a, r * 0.75, g * 0.75, b * 0.75))
	QuickDrawer:sphere(pos + Vector3(0, 0, 2), 0.2, Color(a, r * 0.5, g * 0.5, b * 0.5))
	QuickDrawer:sphere(pos + Vector3(0, 0, 2.5), 0.1, Color(a, r * 0.25, g * 0.25, b * 0.25))
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

ConflictUtils.interest_point_outside_nav_mesh = function (nav_world, unit_name, pos, interest_point_rot)
	local lookup = InterestPointUnitsLookup[unit_name]

	for i = 1, #lookup, 1 do
		local point = lookup[i]
		local local_pos = point[1]:unbox()
		local_pos = Quaternion.rotate(interest_point_rot, local_pos)
		local point_world_position = pos + local_pos
		local is_position_on_navmesh, _ = GwNavQueries.triangle_from_position(nav_world, point_world_position, 0.3, 0.3)

		if not is_position_on_navmesh then
			return point_world_position
		end
	end
end

ConflictUtils.generate_spawn_point_lookup = function (world)
	local InterestPointUnits = InterestPointUnits
	local lookup = {}
	local position = Vector3(0, 0, -1000)
	local rotation = Quaternion.identity()

	for _, unit_names in ipairs(InterestPointUnits) do
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
end

ConflictUtils.display_number_of_breeds = function (header, num_spawned, num_spawned_by_breed)
	local s = header .. tostring(num_spawned) .. ", "

	for breed_name, amount in pairs(num_spawned_by_breed) do
		if amount > 0 then
			s = s .. breed_name .. "=" .. amount .. ", "
		end
	end

	Debug.text(s)
end

local count_list = {}

ConflictUtils.display_number_of_breeds_in_segment = function (header, units_spawned_by_breed, zone_data)
	table.clear(count_list)

	local s = header .. ", "

	for breed_name, unit_list in pairs(units_spawned_by_breed) do
		for _, ai_unit in pairs(unit_list) do
			local health_extension = ScriptUnit.has_extension(ai_unit, "health_system")
			local hi_data1 = zone_data.hi_data
			local hi_data2 = health_extension.zone_data and health_extension.zone_data.hi_data

			if hi_data1 and hi_data1 == hi_data2 then
				count_list[breed_name] = (count_list[breed_name] or 0) + 1

				QuickDrawer:sphere(POSITION_LOOKUP[ai_unit], 0.75, Color(200, 0, 200))
			end
		end
	end

	Debug.text(s)

	for breed_name, amount in pairs(count_list) do
		s = s .. breed_name .. "=" .. amount .. ", "
	end

	return s
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
end

ConflictUtils.make_roaming_spawns = function (nav_world, level_analysis)
	local list = {}

	if LEVEL_EDITOR_TEST then
		return list
	end

	local density = CurrentConflictSettings.roaming.density or 0.01
	local seed_pos = level_analysis:get_start_and_finish()

	if seed_pos then
		seed_pos = seed_pos:unbox()
	else
		local level_key = Managers.state.game_mode:level_key()
		local level_name = LevelSettings[level_key].level_name
		local unit_ind = LevelResource.unit_indices(level_name, "core/gwnav/units/seedpoint/seedpoint")

		if #unit_ind > 0 then
			local id = unit_ind[1]
			seed_pos = LevelResource.unit_position(level_name, id)
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

	return list
end

local function add_breeds_from_patrol_formation(formation, difficulty, output)
	local difficulty_rows = formation[difficulty]

	if difficulty_rows then
		for i = 1, #difficulty_rows, 1 do
			local row = difficulty_rows[i]

			for j = 1, #row, 1 do
				local breed_name = row[j]

				if Breeds[breed_name] then
					output[breed_name] = true
				end
			end
		end
	end
end

local function add_breeds_from_horde_composition(output, composition_type, difficulty)
	local difficulty_index = DifficultySettings[difficulty].rank - 1
	local event_composition = HordeCompositions[composition_type][difficulty_index]

	fassert(event_composition ~= nil, string.format("No horde composition found for '%s' on difficulty '%s'", composition_type, difficulty))

	for j = 1, #event_composition, 1 do
		local composition = event_composition[j]
		local breeds = composition.breeds

		for k = 1, #breeds, 2 do
			local breed_name = breeds[k]
			output[breed_name] = true
		end
	end
end

local function add_breeds_from_breed_action(output, breed_name, difficulty)
	local actions = BreedActions[breed_name]

	if actions then
		for _, action in pairs(actions) do
			if action.difficulty_spawn_list or action.spawn_list then
				local spawn_list = action.difficulty_spawn_list[difficulty] or action.spawn_list

				for i = 1, #spawn_list, 1 do
					output[spawn_list[i]] = true
				end
			end

			if action.difficulty_spawn or action.spawn then
				local composition_type = action.difficulty_spawn[difficulty] or action.spawn

				add_breeds_from_horde_composition(output, composition_type, difficulty)
			end
		end
	end
end

local function add_breed_or_breeds(output, breed_name, difficulty)
	if type(breed_name) == "table" then
		for i = 1, #breed_name, 1 do
			local sub_breed_name = breed_name[i]
			output[sub_breed_name] = true

			add_breeds_from_breed_action(output, sub_breed_name, difficulty)
		end
	else
		output[breed_name] = true

		add_breeds_from_breed_action(output, breed_name, difficulty)
	end
end

ConflictUtils.add_breeds_from_event = function (event_name, event, difficulty, difficulty_rank, output, terror_event_lookup)
	for i = 1, #event, 1 do
		repeat
			local sub_event = event[i]
			local sub_event_name = sub_event[1]
			local difficulty_requirement = sub_event.difficulty_requirement

			if difficulty_requirement and (difficulty_rank or DifficultySettings.normal.rank) < difficulty_requirement then
				break
			end

			if sub_event_name == "spawn" or sub_event_name == "spawn_at_raw" or sub_event_name == "spawn_special" or sub_event_name == "spawn_weave_special" or sub_event_name == "spawn_weave_special_event" then
				add_breed_or_breeds(output, sub_event.breed_name, difficulty)
			elseif sub_event_name == "spawn_patrol" then
				local formations = sub_event.formations

				for j = 1, #formations, 1 do
					local formation_name = formations[j]
					local formation = PatrolFormationSettings[formation_name]

					add_breeds_from_patrol_formation(formation, difficulty, output)
				end
			elseif sub_event_name == "start_event" then
				local contained_event_name = sub_event.start_event_name
				local contained_event = terror_event_lookup[contained_event_name]

				if contained_event_name ~= event_name then
					ConflictUtils.add_breeds_from_event(event_name, contained_event, difficulty, difficulty_rank, output, terror_event_lookup)
				end
			elseif sub_event_name == "event_horde" or sub_event_name == "ambush_horde" then
				local event_composition_type = sub_event.composition_type

				add_breeds_from_horde_composition(output, event_composition_type, difficulty)
			end
		until true
	end
end

local function add_breeds_from_boss_settings(boss_settings, difficulty, fallback_difficulty, output)
	local difficulty_rank = DifficultySettings[difficulty].rank

	for key, _ in pairs(boss_settings) do
		local settings = get_with_override(boss_settings, key, difficulty, fallback_difficulty)

		if type(settings) == "table" then
			local event_lookup = settings.event_lookup

			for _, lookup in pairs(event_lookup) do
				for i = 1, #lookup, 1 do
					local event_name = lookup[i]
					local terror_event_lookup = GenericTerrorEvents
					local event = terror_event_lookup[event_name]

					ConflictUtils.add_breeds_from_event(event_name, event, difficulty, difficulty_rank, output, terror_event_lookup)
				end
			end
		end
	end
end

local function add_breeds_from_special_settings(special_settings, difficulty, fallback_difficulty, output)
	local breeds = get_with_override(special_settings, "breeds", difficulty, fallback_difficulty)

	for i = 1, #breeds, 1 do
		local breed_name = breeds[i]
		output[breed_name] = true
	end

	local rush_intervention = get_with_override(special_settings, "rush_intervention", difficulty, fallback_difficulty)
	local rush_intervention_breeds = rush_intervention.breeds

	for i = 1, #rush_intervention_breeds, 1 do
		local breed_name = rush_intervention_breeds[i]
		output[breed_name] = true
	end

	local speed_running_intervention = get_with_override(special_settings, "speed_running_intervention", difficulty, fallback_difficulty) or SpecialsSettings.default.speed_running_intervention
	local speed_running_intervention_breeds = speed_running_intervention.breeds

	for i = 1, #speed_running_intervention_breeds, 1 do
		local breed_name = speed_running_intervention_breeds[i]
		output[breed_name] = true
	end

	local speed_running_intervention_vector_horde_breeds = speed_running_intervention.vector_horde_breeds

	for i = 1, #speed_running_intervention_vector_horde_breeds, 1 do
		local breed_name = speed_running_intervention_vector_horde_breeds[i]
		output[breed_name] = true
	end
end

local function add_breeds_from_breed_packs(breed_packs, difficulty, output)
	local zone_checks = breed_packs.zone_checks
	local REPLACEMENT_BREED_INDEX = 3
	local clamp_breeds_low = zone_checks.clamp_breeds_low[difficulty]

	if clamp_breeds_low then
		for i = 1, #clamp_breeds_low, 1 do
			local clamp_breeds = clamp_breeds_low[i]
			local replacement_breed_name = clamp_breeds[REPLACEMENT_BREED_INDEX].name
			output[replacement_breed_name] = true
		end
	end

	local clamp_breeds_hi = zone_checks.clamp_breeds_hi[difficulty]

	if clamp_breeds_hi then
		for i = 1, #clamp_breeds_hi, 1 do
			local clamp_breeds = clamp_breeds_hi[i]
			local replacement_breed_name = clamp_breeds[REPLACEMENT_BREED_INDEX].name
			output[replacement_breed_name] = true
		end
	end

	for i = 1, #breed_packs, 1 do
		local pack = breed_packs[i]
		local breed_members = pack.members

		for j = 1, #breed_members, 1 do
			local breed = breed_members[j]
			local breed_name = breed.name
			output[breed_name] = true
		end
	end
end

local function add_breeds_from_pack_spawning_settings(pack_spawning_settings, difficulty, fallback_difficulty, output)
	local roaming_set = get_with_override(pack_spawning_settings, "roaming_set", difficulty, fallback_difficulty)
	local breed_packs_name = roaming_set.breed_packs
	local breed_packs = BreedPacks[breed_packs_name]

	add_breeds_from_breed_packs(breed_packs, difficulty, output)

	local PACK_OVERRIDE_BREED_INDEX = 1
	local breed_packs_override = roaming_set.breed_packs_override

	for i = 1, #breed_packs_override, 1 do
		local pack_override_data = breed_packs_override[i]
		local pack_override_name = pack_override_data[PACK_OVERRIDE_BREED_INDEX]
		local pack_override = BreedPacks[pack_override_name]

		add_breeds_from_breed_packs(pack_override, difficulty, output)
	end
end

local function add_breeds_from_horde_settings(horde_settings, difficulty, fallback_difficulty, output)
	local compositions_pacing = get_with_override(horde_settings, "compositions_pacing", difficulty, fallback_difficulty)
	local ambush_composition = get_with_override(horde_settings, "ambush_composition", difficulty, fallback_difficulty)

	if type(ambush_composition) == "table" then
		for i = 1, #ambush_composition, 1 do
			local wave_compositions = ambush_composition[i]
			local composition_wave_table = HordeWaveCompositions[wave_compositions]

			for j = 1, #composition_wave_table, 1 do
				local composition_name = composition_wave_table[j]
				local composition = compositions_pacing[composition_name]

				for h = 1, #composition, 1 do
					local variant = composition[h]
					local breeds = variant.breeds

					for k = 1, #breeds, 2 do
						local breed_name = breeds[k]
						output[breed_name] = true
					end
				end
			end
		end
	else
		local composition_table = compositions_pacing[ambush_composition]

		for i = 1, #composition_table, 1 do
			local composition = composition_table[i]
			local breeds = composition.breeds

			for j = 1, #breeds, 2 do
				local breed_name = breeds[j]
				output[breed_name] = true
			end
		end
	end

	local vector_composition = horde_settings.vector_composition

	if type(vector_composition) == "table" then
		for i = 1, #vector_composition, 1 do
			local wave_compositions = vector_composition[i]
			local composition_wave_table = HordeWaveCompositions[wave_compositions]

			for j = 1, #composition_wave_table, 1 do
				local composition_name = composition_wave_table[j]
				local composition = compositions_pacing[composition_name]

				for h = 1, #composition, 1 do
					local variant = composition[h]
					local breeds = variant.breeds

					for k = 1, #breeds, 2 do
						local breed_name = breeds[k]
						output[breed_name] = true
					end
				end
			end
		end
	else
		local composition_table = compositions_pacing[vector_composition]

		for i = 1, #composition_table, 1 do
			local composition = composition_table[i]
			local breeds = composition.breeds

			for j = 1, #breeds, 2 do
				local breed_name = breeds[j]
				output[breed_name] = true
			end
		end
	end

	local vector_blob_composition = horde_settings.vector_blob_composition

	if type(vector_blob_composition) == "table" then
		for i = 1, #vector_blob_composition, 1 do
			local wave_compositions = vector_blob_composition[i]
			local composition_wave_table = HordeWaveCompositions[wave_compositions]

			for j = 1, #composition_wave_table, 1 do
				local composition_name = composition_wave_table[j]
				local composition = compositions_pacing[composition_name]

				for h = 1, #composition, 1 do
					local variant = composition[h]
					local breeds = variant.breeds

					for k = 1, #breeds, 2 do
						local breed_name = breeds[k]
						output[breed_name] = true
					end
				end
			end
		end
	else
		local composition_table = compositions_pacing[vector_blob_composition]

		for i = 1, #composition_table, 1 do
			local composition = composition_table[i]
			local breeds = composition.breeds

			for j = 1, #breeds, 2 do
				local breed_name = breeds[j]
				output[breed_name] = true
			end
		end
	end

	local mini_patrol_composition_name = horde_settings.mini_patrol_composition
	local mini_patrol_composition = compositions_pacing[mini_patrol_composition_name]

	for i = 1, #mini_patrol_composition, 1 do
		local composition = mini_patrol_composition[i]
		local breeds = composition.breeds

		for j = 1, #breeds, 2 do
			local breed_name = breeds[j]
			output[breed_name] = true
		end
	end
end

ConflictUtils.find_conflict_director_breeds = function (conflict_director, difficulty, output)
	local fallback_difficulty = DifficultySettings[difficulty].fallback_difficulty

	if not conflict_director.boss.disabled then
		add_breeds_from_boss_settings(conflict_director.boss, difficulty, fallback_difficulty, output)
	end

	if not conflict_director.specials.disabled then
		add_breeds_from_special_settings(conflict_director.specials, difficulty, fallback_difficulty, output)
	end

	if not conflict_director.pack_spawning.disabled then
		add_breeds_from_pack_spawning_settings(conflict_director.pack_spawning, difficulty, fallback_difficulty, output)
	end

	if not conflict_director.horde.disabled then
		add_breeds_from_horde_settings(conflict_director.horde, difficulty, fallback_difficulty, output)
	end

	return output
end

ConflictUtils.patch_settings_with_difficulty = function (source_settings, difficulty, fallback_difficulty)
	local overrides = source_settings.difficulty_overrides
	local override_settings = overrides and (overrides[difficulty] or overrides[fallback_difficulty])

	if override_settings then
		for key, _ in pairs(source_settings) do
			if key ~= "difficulty_overrides" then
				source_settings[key] = override_settings[key] or source_settings[key]
			end
		end

		source_settings.difficulty_overrides = nil

		return source_settings
	else
		return source_settings
	end
end

ConflictUtils.patch_terror_events_with_weaves = function (level_key, weave_data, objective_index)
	local weave_name = weave_data.name
	local weave_template = WeaveSettings.templates[weave_name]
	local objectives = weave_template.objectives
	local weave_terror_events = TerrorEventBlueprints.weaves
	TerrorEventBlueprints[level_key] = TerrorEventBlueprints[level_key] or {}

	table.clear(TerrorEventBlueprints[level_key])

	local objective = objectives[objective_index]
	local spawning_settings = objective.spawning_settings

	if spawning_settings then
		local main_path_spawning = spawning_settings.main_path_spawning
		local terror_event_trickle = spawning_settings.terror_event_trickle

		if main_path_spawning then
			for j = 1, #main_path_spawning, 1 do
				local main_path_spawning_setting = main_path_spawning[j]
				local terror_event_name = main_path_spawning_setting.terror_event_name
				TerrorEventBlueprints[level_key][terror_event_name] = weave_terror_events[terror_event_name]
			end
		end

		if terror_event_trickle then
			TerrorEventBlueprints[level_key][terror_event_trickle] = weave_terror_events[terror_event_trickle]
		end
	end

	local objective_terror_events = objective.terror_events

	if objective_terror_events then
		for i = 1, #objective_terror_events, 1 do
			local objective_event = objective_terror_events[i]
			TerrorEventBlueprints[level_key][objective_event] = weave_terror_events[objective_event]
		end
	end
end

ConflictUtils.generate_conflict_director_locked_functions = function (level_key)
	local locked_director_functions = {}

	for director_name, locked_func in pairs(ConflictDirectorLockedFunctions) do
		if locked_func(level_key) then
			locked_director_functions[#locked_director_functions + 1] = director_name
		end
	end

	return locked_director_functions
end

ConflictUtils.teleport_ai_unit = function (unit, teleport_position, play_sound, play_effect)
	if teleport_position then
		local blackboard = BLACKBOARDS[unit]

		if ALIVE[unit] then
			local navigation_extension = blackboard.navigation_extension

			navigation_extension:set_navbot_position(teleport_position)

			local locomotion_extension = blackboard.locomotion_extension

			locomotion_extension:teleport_to(teleport_position)
			Managers.state.entity:system("ai_bot_group_system"):enemy_teleported(unit, teleport_position)
		end

		local ping_system = Managers.state.entity:system("ping_system")

		ping_system:remove_ping_from_unit(unit)

		if play_sound then
			local audio_system_extension = Managers.state.entity:system("audio_system")

			audio_system_extension:play_audio_unit_event(play_sound, unit)
		end

		if play_effect then
			local effect_name_id = NetworkLookup.effects[play_effect]
			local node_id = 0
			local rotation_offset = Quaternion.identity()
			local unit_pos = POSITION_LOOKUP[unit]
			local network_manager = Managers.state.network

			network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, unit_pos, rotation_offset, false)
			network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, teleport_position, rotation_offset, false)
		end
	end
end

ConflictUtils.look_at_position_flat = function (source_pos, target_pos)
	local look_at_direction_flat = Vector3.flat(target_pos - source_pos)
	local look_at_direction_flat_normalized = Vector3.normalize(look_at_direction_flat)
	local wanted_rot = quaternion_look(look_at_direction_flat_normalized, Vector3.up())

	return wanted_rot
end

ConflictUtils.get_closest_position = function (pos, pos_list)
	local min_dist = math.huge
	local closest_pos = nil

	for i = 1, #pos_list, 1 do
		local check_pos = pos_list[i]
		local dist = distance_squared(pos, check_pos)

		if dist < min_dist then
			min_dist = dist
			closest_pos = check_pos
		end
	end

	return closest_pos, min_dist
end

ConflictUtils.override_extension_init_data = function (breed, extension_init_data, optional_data)
	local override_extension_init_data = optional_data.extension_init_data

	if override_extension_init_data then
		for system_name, data in pairs(override_extension_init_data) do
			table.merge(extension_init_data[system_name], data)
		end
	end
end

local function check_if_in_line_of_sight(physics_world, unit, from, to)
	local dir = to - from
	local dist = Vector3.length(dir)
	dir = Vector3.normalize(dir)
	local hit, hit_position, _, _, hit_actor = PhysicsWorld.raycast(physics_world, from, dir, dist, "closest", "collision_filter", "filter_ai_line_of_sight_check")
	local hit_unit = hit and Actor.unit(hit_actor)

	return not hit or hit_unit == unit
end

ConflictUtils.find_positions_around_position = function (center_position, output_position_list, nav_world, min_distance, max_distance, num_of_positions, forbidden_position_list, distance_to_forbidden_position_list, tries, circle_subdivision, row_distance, above_max, below_max, check_line_of_sight, physics_world, line_of_sight_target)
	distance_to_forbidden_position_list = distance_to_forbidden_position_list or 1

	local function filter_func(pos)
		local distance_to_forbidden_position_list_sqr = math.pow(distance_to_forbidden_position_list, 2)

		if forbidden_position_list then
			for i = 1, #forbidden_position_list, 1 do
				local forbidden_position = forbidden_position_list[i]

				if Vector3.distance_squared(pos, forbidden_position) < distance_to_forbidden_position_list_sqr then
					return false
				end
			end
		end

		for i = 1, #output_position_list, 1 do
			local output_position = output_position_list[i]

			if Vector3.distance_squared(pos, output_position) < distance_to_forbidden_position_list_sqr then
				return false
			end
		end

		if check_line_of_sight then
			local ground_offset = Vector3(0, 0, 1)
			local offset_pos = pos + ground_offset
			local offset_center_position = center_position + ground_offset
			local in_line_of_sight = check_if_in_line_of_sight(physics_world, line_of_sight_target, offset_pos, offset_center_position)

			return in_line_of_sight
		end

		return true
	end

	local spread = max_distance - min_distance
	local distance = min_distance + spread * 0.5
	circle_subdivision = circle_subdivision or 4
	local radian_subdivision = (math.pi * 2) / circle_subdivision
	local spread_delta = row_distance or 2
	local two_pi = 2 * math.pi
	local start_spread = (math.random() - 0.5) * spread
	local current_spread = start_spread
	local start_radians = math.random() * two_pi
	local current_radians = start_radians
	local current_subdivision_count = 0
	tries = tries or 30

	local function get_next_pos()
		current_radians = current_radians + radian_subdivision

		if two_pi < current_radians then
			current_radians = current_radians - two_pi
		end

		current_subdivision_count = current_subdivision_count + 1

		if circle_subdivision < current_subdivision_count then
			current_spread = current_spread + spread_delta

			if current_spread > spread * 0.5 then
				current_spread = current_spread - spread
			end

			current_subdivision_count = 0
			current_radians = math.random() * two_pi
		end

		local add_vec = Vector3(distance + current_spread, 0, 0)
		local pos = center_position + Quaternion.rotate(Quaternion(Vector3.up(), current_radians), add_vec)

		return pos
	end

	for i = 1, num_of_positions, 1 do
		for try = 1, tries, 1 do
			local pos = get_next_pos()
			local spawn_pos = ConflictUtils.find_center_tri(nav_world, pos, above_max, below_max)

			if spawn_pos then
				local valid_position = filter_func(spawn_pos)

				if valid_position then
					output_position_list[#output_position_list + 1] = spawn_pos
				end

				break
			end
		end
	end

	return output_position_list
end

local function check_if_above_ground(physics_world, origin_position, distance)
	local hit, _, _, _, _ = PhysicsWorld.raycast(physics_world, origin_position, Vector3(0, 0, -1), distance, "closest", "types", "statics", "collision_filter", "filter_environment_overlap")

	return not hit
end

ConflictUtils.find_visible_positions_in_sphere_around_player = function (physics_world, position_count, player_unit, radius, from_pitch, to_pitch, pitch_delta, from_yaw, to_yaw, yaw_delta, forbidden_position_list, distance_to_forbidden_position_list, distance_between_positions, min_distance_from_floor)
	distance_to_forbidden_position_list = distance_to_forbidden_position_list or 0
	local distance_between_positions_sqr = math.pow(distance_between_positions, 2)
	local distance_to_forbidden_position_list_sqr = math.pow(distance_to_forbidden_position_list, 2)
	local center_position = POSITION_LOOKUP[player_unit]
	local full_pitch_delta = to_pitch - from_pitch
	local full_yaw_delta = to_yaw - from_yaw
	local start_pitch = from_pitch + full_pitch_delta * math.random()
	local start_yaw = from_yaw + full_yaw_delta * math.random()
	local start_pitch_switch_count = full_pitch_delta / pitch_delta
	local start_yaw_switch_count = full_yaw_delta / yaw_delta
	local pitch = start_pitch
	local pitch_switch_count = 0
	local yaw_switch_count = 0
	local yaw = start_yaw
	local valid_positions = {}

	while position_count > #valid_positions do
		pitch = pitch + pitch_delta
		pitch_switch_count = pitch_switch_count + 1

		if start_pitch_switch_count <= pitch_switch_count then
			pitch = start_pitch
			pitch_switch_count = 0
			yaw = yaw + yaw_delta
			yaw_switch_count = yaw_switch_count + 1

			if start_yaw_switch_count <= yaw_switch_count then
				break
			end
		end

		local new_position = center_position + Quaternion.rotate(Quaternion.from_yaw_pitch_roll(yaw, pitch, 0), Vector3.forward()) * radius
		local failed = false

		if forbidden_position_list then
			for i = 1, #forbidden_position_list, 1 do
				local forbidden_position = forbidden_position_list[i]

				if Vector3.distance_squared(new_position, forbidden_position) < distance_to_forbidden_position_list_sqr then
					failed = true

					break
				end
			end
		end

		if not failed then
			for i = 1, #valid_positions, 1 do
				local valid_position = valid_positions[i]

				if Vector3.distance_squared(new_position, valid_position) < distance_between_positions_sqr then
					failed = true

					break
				end
			end

			if not failed and check_if_in_line_of_sight(physics_world, player_unit, new_position, center_position) and check_if_above_ground(physics_world, new_position, min_distance_from_floor) then
				valid_positions[#valid_positions + 1] = new_position
			end
		end
	end

	return valid_positions
end

return
