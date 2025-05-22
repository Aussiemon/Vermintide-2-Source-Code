-- chunkname: @scripts/managers/conflict_director/conflict_director_tests.lua

ConflictDirectorTests = {}

local utility_comparison = false

ConflictDirectorTests.start_utility_comparison = function ()
	utility_comparison = true
end

local function compare_utility()
	local consideration = UtilityConsiderations.storm_vermin_push_attack.distance_to_target
	local blackboard_value = 0.7
	local f1 = EngineOptimized.utility_from_spline
	local utility

	for ii = 1, 1000 do
		utility = f1(consideration.engine_spline_index, blackboard_value)
	end

	local norm_value = math.clamp(blackboard_value / consideration.max_value, 0, 1)
	local f2 = Utility.GetUtilityValueFromSpline

	for ii = 1, 1000 do
		utility = f2(consideration.spline, norm_value)
	end
end

local function test_pointx(nodes, p)
	local best_point = Vector3(0, 0, 0)
	local best_dist = math.huge
	local best_sub_index = -1
	local p1 = nodes[1]:unbox()

	for j = 1, #nodes - 1 do
		local p2 = nodes[j + 1]:unbox()
		local closest_point = Geometry.closest_point_on_line(p, p1, p2)
		local d = Vector3.distance_squared(p, closest_point)

		if d < best_dist then
			best_dist = d
			best_sub_index = j

			Vector3.set_xyz(best_point, Vector3.to_elements(closest_point))
		end

		p1 = p2
	end

	Debug.text("SS: %.2f %d, %s", best_dist, best_sub_index, tostring(best_point))

	return best_point
end

local test_points = false
local last_data = false

ConflictDirectorTests.test_main_path_optimization = function (self, t, dt)
	local main_paths = self.main_path_info.main_paths

	if not main_paths then
		return
	end

	local num_points = 100

	if not test_points then
		local p = MainPathUtils.point_on_mainpath(main_paths, 10)
		local pos, best_travel_dist, move_percent, best_main_path, best_sub_index = MainPathUtils.closest_pos_at_main_path(main_paths, p)
		local total_path_dist = MainPathUtils.total_path_dist()

		test_points = {
			Vector3Box(p),
		}

		for i = 2, num_points do
			local wanted_distance = total_path_dist / num_points * i
			local pos, main_index = MainPathUtils.point_on_mainpath(main_paths, wanted_distance)

			if not pos then
				pos = test_points[1]:unbox()
				main_index = 1
			end

			local index = #test_points + 1

			test_points[index] = Vector3Box(pos)
		end
	end

	local main_path_info = self.main_path_info
	local closest_pos_at_main_path = MainPathUtils.closest_pos_at_collapsed_main_path
	local pr1 = MainPathUtils.point_on_mainpath
	local main_path_data = self.level_analysis.main_path_data
	local ti = #main_path_data.collapsed_path
	local pos = main_path_data.collapsed_path[ti]:unbox()

	QuickDrawer:sphere(pos, 10 + math.sin(t * 5) * 5)
	Debug.text("DISTANCE point: %d, distance %.1f", ti, main_path_data.collapsed_travel_dists[ti])

	for i = 1, num_points do
		closest_pos_at_main_path(main_path_data.collapsed_path, main_path_data.collapsed_travel_dists, main_path_data.breaks_lookup, pos, ti)
	end

	local closest_pos_at_main_path_opt = EngineOptimized.closest_pos_at_main_path
	local pr2 = EngineOptimized.point_on_mainpath

	for i = 1, num_points do
		closest_pos_at_main_path_opt(pos)
	end

	local p = self.hero_player_positions[1]
	local p1 = Vector3(100, 20, 130)
	local p2 = Vector3(-100, -420, 30)
	local res
	local EngineOptimized_closest_point_on_line = EngineOptimized.closest_point_on_line

	for i = 1, 250 do
		res = EngineOptimized_closest_point_on_line(p, p1, p2)
	end

	local Geometry_closest_point_on_line = Geometry.closest_point_on_line

	for i = 1, 250 do
		res = Geometry_closest_point_on_line(p, p1, p2)
	end

	local mpd = self.level_analysis.main_path_data
	local nodes = mpd.collapsed_path
	local pos2 = test_pointx(nodes, p)
	local posE, best_dist, best_index = EngineOptimized.closest_pos_at_main_path(p)
	local pos3, best_dist, best_index = MainPathUtils.closest_pos_at_main_path_lua(main_paths, p)

	QuickDrawer:sphere(posE, 1.05, Color(255, 0, 0))
	QuickDrawer:sphere(pos2, 1.2, Color(255, 255, 0))
	QuickDrawer:sphere(pos3, 0.9, Color(155, 155, 255))
	QuickDrawer:line(nodes[1]:unbox(), nodes[2]:unbox(), Color(100, 255, 0))

	local lol = math.random()
end

function test_spawn_pos_ahead_half_sphere(self)
	local main_path_info = self.main_path_info
	local ahead_unit = main_path_info.ahead_unit

	if ahead_unit then
		local player_pos = POSITION_LOOKUP[ahead_unit]
		local epicenter = self.specials_pacing:get_relative_main_path_pos(main_path_info.main_paths, self.main_path_player_info[ahead_unit], 20)

		QuickDrawer:cone(player_pos, player_pos + Vector3(0, 0, 2.5), 1, Color(200, 200, 0), 8, 8)

		local forward_path_dir = epicenter - player_pos
		local avoid_dist_sqr = 25
		local level = LevelHelper:current_level(self._world)
		local nav_tag_volume_handler = self.nav_tag_volume_handler

		for i = 1, 25 do
			local p = ConflictUtils.get_hidden_pos(self._world, self.nav_world, level, nav_tag_volume_handler, true, epicenter, self.hero_player_and_bot_positions, 30, 10, avoid_dist_sqr, 10, forward_path_dir, math.pi)

			if p then
				QuickDrawer:sphere(p, 1)
			end
		end
	end
end

function test_umbra_los(self)
	local world = self._world

	if not World.umbra_available(world) then
		return
	end

	local main_path_info = self.main_path_info
	local ahead_unit = main_path_info.ahead_unit
	local behind_unit = main_path_info.behind_unit

	if ahead_unit and behind_unit then
		local player_pos = POSITION_LOOKUP[ahead_unit]
		local behind_pos = POSITION_LOOKUP[behind_unit]
		local h = Vector3(0, 0, 1)
		local free_los = World.umbra_has_line_of_sight(world, player_pos + h, behind_pos + h)

		if free_los then
			QuickDrawer:line(player_pos + h, behind_pos + h, Color(0, 90, 200))
		else
			QuickDrawer:line(player_pos + h, behind_pos + h, Color(255, 0, 0))
		end
	end
end

function debug_bot_transitions(self, t)
	local ai_system = Managers.state.entity:system("ai_system")
	local gui = ai_system.ai_debugger and ai_system.ai_debugger.screen_gui

	AiUtils.debug_bot_transitions(gui, t, 0, 0)
end

function test_player_path_pos_and_50m_ahead(self)
	local pos = self.hero_player_positions[1]
	local main_paths = self.level_analysis.main_paths
	local path_pos, travel_dist = MainPathUtils.closest_pos_at_main_path(main_paths, pos)
	local total_path_dist = MainPathUtils.total_path_dist()
	local ahead_pos = MainPathUtils.point_on_mainpath(main_paths, travel_dist + 10)

	ahead_pos = ahead_pos or MainPathUtils.point_on_mainpath(main_paths, total_path_dist - 10)

	QuickDrawer:sphere(ahead_pos, 3)

	local end_pos = MainPathUtils.point_on_mainpath(main_paths, total_path_dist - 50)

	if end_pos then
		QuickDrawer:sphere(end_pos, 2.5, Color(255, 120, 0, 0))
	end
end

function test_angled_trajectory(self)
	local p1 = Vector3(0, 0, 2)
	local p2 = Vector3(19, 16, 2)
	local physics_world = World.get_data(self._world, "physics_world")
	local gravity = -9.82
	local jump_speed
	local angle = math.degrees_to_radians(45)
	local success, velocity, tof = WeaponHelper.test_angled_trajectory(physics_world, p1, p2, gravity, jump_speed, angle)

	QuickDrawer:sphere(p1, 1)
	QuickDrawer:sphere(p2, 1)
	Debug.text("Trajectory Success: " .. tostring(success))
end

ConflictDirectorTests.setup_reachable_coverpoints_test = function (self)
	local point_list = {}
	local num_found, cover_points = ConflictUtils.hidden_cover_points(self.hero_player_positions[1], self.hero_player_positions, 2, 45, 1)

	for i = 1, num_found do
		point_list[i] = Vector3Box(Unit.local_position(cover_points[i], 0))
	end

	self._reachable_processing = LevelAnalysis.setup_unreachable_processing(self.nav_world, self.main_path_info.main_paths, point_list, {
		max_concurrent_astars = 5,
		line_object = QuickDrawerStay,
	})

	print("Points to test:", num_found)
end

ConflictDirectorTests.process_reachable_coverpoints_test = function (self)
	if self._reachable_processing then
		local done = self.level_analysis.process_unreachable(self._reachable_processing)

		if done then
			self._reachable_processing = nil

			print("astar connect complete")
		end
	end
end

function setup_reachable_navgraph_test(self)
	local point_list = {}
	local level_key = Managers.state.game_mode:level_key()
	local level_name = LevelSettings[level_key].level_name
	local unit_ind = LevelResource.unit_indices(level_name, "core/gwnav/units/seedpoint/seedpoint")

	for _, id in ipairs(unit_ind) do
		point_list[#point_list + 1] = Vector3Box(LevelResource.unit_position(level_name, id))
	end

	self._reachable_navgraph_processing = LevelAnalysis.setup_unreachable_processing(self.nav_world, self.main_path_info.main_paths, point_list, {
		max_concurrent_astars = 5,
		line_object = QuickDrawerStay,
		fail_color = Color(212, 48, 0),
	})

	print("Points to test:", #point_list)
end

function process_reachable_navgraph_test(self)
	if self._reachable_navgraph_processing then
		local done = self.level_analysis.process_unreachable(self._reachable_navgraph_processing)

		if done then
			self._reachable_navgraph_processing = nil

			print("astar connect complete")
		end
	end
end

function print_point(p)
	print("(" .. p.x .. ", " .. p.y .. ")")

	return nil
end

function print_points(points, num)
	print("[")

	for i = 1, num do
		local p = points[i]

		if i > 1 then
			print(", ")
		end

		print_point(p)
	end

	print("]")

	return nil
end

function ccw(a, b, c)
	return (b.x - a.x) * (c.y - a.y) > (b.y - a.y) * (c.x - a.x)
end

local function left_right(left, right)
	return left.x < right.x
end

function convex_hull(points, h)
	local num_points = #points

	if num_points == 0 then
		return h, 0
	end

	table.sort(points, left_right)

	local num = 0

	for i = 1, num_points do
		local pt = points[i]

		while num >= 2 and not ccw(h[num - 1], h[num], pt) do
			num = num - 1
		end

		num = num + 1
		h[num] = pt
	end

	local t = num + 1

	for i = num_points, 1, -1 do
		local pt = points[i]

		while t <= num and not ccw(h[num - 1], h[num], pt) do
			num = num - 1
		end

		num = num + 1
		h[num] = pt
	end

	num = num - 1

	return h, num
end

function make_points_for_hull_test()
	local side = Managers.state.side:get_side(Managers.state.conflict.default_enemy_side_id)
	local units = side.units_lookup
	local points = table.clone(units)

	for unit, _ in pairs(units) do
		if HEALTH_ALIVE[unit] then
			points[#points + 1] = POSITION_LOOKUP[unit]
		end
	end

	return points
end

ConflictDirectorTests.update_jslots = function (self, unit)
	local jslot = {
		num = 0,
		slots = {},
		units = {},
		adjusted_dirs = {},
	}
	local p = POSITION_LOOKUP[unit]

	if not p then
		return
	end

	local num_ai_units = AiUtils.broadphase_query(p, 7, RESULT_TABLE)

	for i = 1, num_ai_units do
		local attacker_unit = RESULT_TABLE[i]
		local units = jslot.units

		if not units[attacker_unit] then
			local pa = POSITION_LOOKUP[attacker_unit]
			local slots = jslot.slots
			local first = slots[1]
			local slot_dist = 2
			local slot_wid = 1

			if first then
				local slot_dir = Vector3.normalize(pa - p)
				local num = jslot.num

				num = num + 1
				slots[num] = slot_dir * slot_dist
				jslot.num = num
				units[attacker_unit] = jslot.num
			else
				local first_slot_dir = Vector3.normalize(pa - p)

				jslot.slots[1] = first_slot_dir * slot_dist
				jslot.num = 1
				units[attacker_unit] = 1
			end
		end
	end

	local slots = jslot.slots
	local adjusted_dirs = jslot.adjusted_dirs

	for i = 1, #slots do
		QuickDrawer:line(p, p + slots[i], Color(23, 223, 100))
	end
end

local SPARSE_GRID = {}
local cell_size_xy = 0.3
local cell_size_z = 0.3

ConflictDirectorTests.draw_sparse_grid = function (pos)
	if not pos then
		return
	end

	local floor = math.floor
	local xp = floor(pos.x / cell_size_xy + 0.5)
	local yp = floor(pos.y / cell_size_xy + 0.5)
	local zp = floor(pos.z / cell_size_z + 0.5)
	local hash = xp * 0.0001 + yp + zp * 10000

	QuickDrawer:sphere(Vector3(floor(pos.x / cell_size_xy) * cell_size_xy, floor(pos.y / cell_size_xy) * cell_size_xy, floor(pos.z / cell_size_z) * cell_size_z), cell_size_xy * 0.5 - 0.01, Color(0, 200, 200))
	QuickDrawer:sphere(pos, 0.1, Color(255, 200, 100))

	for hash, cell in pairs(SPARSE_GRID) do
		QuickDrawer:sphere(Vector3(cell.x, cell.y, cell.z), cell_size_xy * 0.5, Color(0, 0, 200))
	end
end

ConflictDirectorTests.sparse_grid_test = function (pos, unit)
	local floor = math.floor
	local xp = floor(pos.x / cell_size_xy + 0.5)
	local yp = floor(pos.y / cell_size_xy + 0.5)
	local zp = floor(pos.z / cell_size_z + 0.5)
	local hash = xp * 0.0001 + yp + zp * 10000

	if SPARSE_GRID[hash] then
		Debug.text("SPARSE GRID: OCCUPIED")
	else
		SPARSE_GRID[hash] = {
			u = unit,
			x = xp * cell_size_xy,
			y = yp * cell_size_xy,
			z = zp * cell_size_z,
		}

		print("SPARSE GRID:", hash, pos)
		QuickDrawer:sphere(pos, 0.7, Color(200, 0, 0))
	end
end

ConflictDirectorTests.lean_slot_test = function ()
	local max_slots = 10
	local dist = 3
	local slot_angle = 2 * math.pi / max_slots
	local lean_slots = ConflictDirectorTests.lean_slots
	local side = Managers.state.side:get_side_from_name("heroes") or Managers.state.side:get_side(1)
	local pos = side.PLAYER_POSITIONS[1]

	if not pos then
		return
	end

	if lean_slots then
		local target_index = lean_slots.lean_dogpile + 1

		if max_slots < target_index then
			ConflictDirectorTests.lean_slots = nil
		else
			lean_slots.lean_dogpile = target_index

			local angle = lean_slots.center_angle + (target_index - 1) * slot_angle
			local slot_dist = dist * 0.5
			local x = math.cos(angle) * slot_dist
			local y = math.sin(angle) * slot_dist

			lean_slots[target_index] = {
				x,
				y,
				pos.z,
			}
		end
	else
		local x = pos.x + math.random(-5, 5)
		local y = pos.y + math.random(-5, 5)

		QuickDrawerStay:sphere(pos, 0.44, Color(250, 0, 0))
		QuickDrawerStay:sphere(Vector3(x, y, pos.z), 0.75, Color(0, 0, 255))

		local center_angle = math.atan2(y - pos.y, x - pos.x)
		local slot_dist = dist * 0.5

		x = math.cos(center_angle) * slot_dist
		y = math.sin(center_angle) * slot_dist
		lean_slots = {
			{
				x,
				y,
				pos.z,
			},
			lean_dogpile = 1,
			center_angle = center_angle,
		}
		ConflictDirectorTests.lean_slots = lean_slots
	end
end

ConflictDirectorTests.lean_slot_test_update = function (side)
	local lean_slots = ConflictDirectorTests.lean_slots

	if lean_slots then
		Debug.text("Slots %d", lean_slots.lean_dogpile)

		local pos = side.PLAYER_POSITIONS[1]

		for i = 1, #lean_slots do
			local slot_pos = lean_slots[i]

			QuickDrawer:sphere(Vector3(pos.x + slot_pos[1], pos.y + slot_pos[2], slot_pos[3]), 0.5, Color(255, 255, 0))
		end
	end
end

ConflictDirectorTests.drag_test_start = function (side)
	if ConflictDirectorTests.drag_test then
		ConflictDirectorTests.drag_test = nil
	else
		local start_pos = side.PLAYER_POSITIONS[1] + Vector3(0, 0, 1.8)
		local target_pos = side.PLAYER_POSITIONS[1] + Vector3(2, 0, 1.8)

		ConflictDirectorTests.drag_test = {
			pole_length = 2,
			apos = Vector3Box(start_pos),
			bpos = Vector3Box(target_pos),
		}
	end
end

ConflictDirectorTests.drag_test_update = function (side)
	if ConflictDirectorTests.drag_test then
		local drag_test = ConflictDirectorTests.drag_test
		local apos = drag_test.apos:unbox()
		local bpos = drag_test.bpos:unbox()
		local apos_new = side.PLAYER_POSITIONS[1] + Vector3(0, 0, 1.8)
		local pole_vec = Vector3.normalize(bpos - apos_new) * drag_test.pole_length
		local bpos_new = apos_new + pole_vec

		drag_test.bpos:store(bpos_new)
		drag_test.apos:store(apos_new)
		QuickDrawer:sphere(bpos_new, 0.3, Color(0, 200, 40))
		QuickDrawer:line(bpos_new, apos_new, Color(0, 200, 40))
	end
end

ConflictDirectorTests.tentacle_test_start = function (side, t, dt)
	if ConflictDirectorTests.ik_tentacle then
		ConflictDirectorTests.ik_tentacle = nil
	else
		print("Creating tentacle")

		local start_pos = side.PLAYER_POSITIONS[1] + Vector3(1, 0, 0)
		local target_pos = side.PLAYER_POSITIONS[1] + Vector3(0, 0, 1)
		local joints = {}

		for i = 1, 14 do
			joints[i] = Vector3(0, 0, i * 0.5)
		end

		ConflictDirectorTests.ik_tentacle = IkChain:new(joints, start_pos, target_pos, 0.01, 0.8)

		ConflictDirectorTests.ik_tentacle:solve(t, dt)
	end
end

ConflictDirectorTests.tentacle_test_update = function (side, t, dt)
	local PLAYER_POSITIONS = side.PLAYER_POSITIONS
	local ik_tentacle = ConflictDirectorTests.ik_tentacle

	if ik_tentacle then
		ik_tentacle:set_target_pos(side.PLAYER_POSITIONS[1] + Vector3(0, 0, 1), 20)
		ik_tentacle:solve(t, dt)
	end
end

local cylinder_obstacles = {}
local cylinder_state = "spawn"
local cut_type = "soft"

ConflictDirectorTests.spawn_mesh_cut = function (conflict_director)
	local world = conflict_director._world
	local nav_world = conflict_director.nav_world
	local position, distance, normal, actor = conflict_director:player_aim_raycast(world, false, "filter_ray_horde_spawn")

	if not position then
		print("No spawn pos found")

		return
	end

	for o, _ in pairs(cylinder_obstacles) do
		GwNavCylinderObstacle.set_does_trigger_tagvolume(o, false)
		GwNavCylinderObstacle.remove_from_world(o)
		GwNavCylinderObstacle.destroy(o)
	end

	table.clear(cylinder_obstacles)

	local spawn_pos = LocomotionUtils.pos_on_mesh(conflict_director.nav_world, position)

	if not spawn_pos then
		print("No mesh found at spawn pos")

		return
	end

	local xc = 1
	local yc = 2
	local cell_size = 2
	local radius = cell_size / 2 + 0.3

	for i = -xc, xc do
		for j = -yc, yc do
			local pos = spawn_pos + Vector3(i * cell_size, j * cell_size, -1)

			QuickDrawerStay:sphere(pos, radius)

			local o

			if cut_type == "soft" then
				o = GwNavCylinderObstacle.create(nav_world, pos, 3, radius, false, Color(255, 255, 0), LAYER_ID_MAPPING.fire_grenade)

				GwNavCylinderObstacle.add_to_world(o)
				GwNavCylinderObstacle.set_does_trigger_tagvolume(o, true)
			elseif cut_type == "hard" then
				o = GwNavCylinderObstacle.create_exclusive(nav_world, pos, 3, radius)

				GwNavCylinderObstacle.add_to_world(o)
				GwNavCylinderObstacle.set_does_trigger_tagvolume(o, true)
			else
				local t = GwNavTraversal.get_seed_triangle(nav_world, pos)
				local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, t)

				GwNavTraversal.get_neighboring_triangles(poly)
				GwNavNavTagVolume.create(nav_world, poly_line, pos.z - 2, pos.z + 2, false, Color(0, 200, 45), LAYER_ID_MAPPING.fire_grenade)
			end

			cylinder_obstacles[o] = true
		end
	end
end

ConflictDirectorTests.spawn_liquid_blob = function (conflict_director, t, dt)
	local position, distance, normal, actor = conflict_director:player_aim_raycast(conflict_director._world, false, "filter_ray_horde_spawn")

	if not position then
		print("No spawn pos found")

		return
	end

	local extension_init_data = {
		props_system = {
			duration = 0.5,
			end_size = 1,
			start_size = 0.3,
		},
	}
	local spawn_unit_name = "units/props/nurgle_liquid_blob/nurgle_liquid_blob_01"
	local network_template_name = "nurgle_liquid_blob"
	local blob_unit = Managers.state.unit_spawner:spawn_network_unit(spawn_unit_name, "nurgle_liquid_blob", extension_init_data, position)
end

ConflictDirectorTests.test_cover_points = function (self, side)
	local player_positions = side.PLAYER_POSITIONS

	if not player_positions[1] then
		return
	end

	local bp = self.level_analysis.cover_points_broadphase
	local green = Color(255, 0, 240, 0)
	local red = Color(255, 240, 0, 0)
	local found_units = {}

	Broadphase.query(bp, player_positions[1], 20, found_units)

	local player_pos = player_positions[1]

	for i = 1, #found_units do
		local unit = found_units[i]
		local pos = Unit.local_position(unit, 0)
		local rot = Unit.local_rotation(unit, 0)
		local to_cover_point = Vector3.normalize(player_pos - pos)
		local valid = Vector3.dot(Quaternion.forward(rot), to_cover_point) > 0.9

		if valid then
			QuickDrawerStay:sphere(pos, 1, green)
			QuickDrawerStay:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot) * 2 + Vector3(0, 0, 1), green)
		else
			QuickDrawerStay:sphere(pos, 1, red)
			QuickDrawerStay:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot) * 2 + Vector3(0, 0, 1), red)
		end
	end

	self.specials_pacing:get_special_spawn_pos()
end

ConflictDirectorTests.update_kill_tester = function (self)
	if not script_data.kill_test then
		return
	end

	local breeds = {
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
		"skaven_clan_rat",
		"chaos_marauder",
		"chaos_fanatic",
		"chaos_fanatic",
		"chaos_fanatic",
	}

	if not self._kill_list then
		self._kill_list = {}
		self._kill_spawn_index = 1
	end

	local kill_spawn_index = self._kill_spawn_index % #breeds + 1

	self._kill_spawn_index = kill_spawn_index

	local kill_list = self._kill_list
	local breed_name = breeds[kill_spawn_index]
	local breed = Breeds[breed_name]
	local optional_data = {
		ignore_breed_limits = true,
		spawned_func = function (ai_unit, breed, optional_data)
			table.insert(self._kill_list, 1, ai_unit)
		end,
	}
	local spawn_pos = Vector3Box(Vector3(0, 0, 0) + Vector3(kill_spawn_index * 1, 0, 0))
	local spawn_rot = QuaternionBox()

	self:spawn_queued_unit(breed, spawn_pos, spawn_rot, "debug_spawn", nil, nil, optional_data)

	local size = #kill_list

	if size >= 3 then
		local kill_unit = kill_list[size]

		kill_list[size] = nil

		local health_extension = ScriptUnit.has_extension(kill_unit, "health_system")

		if health_extension and health_extension:is_alive() then
			local damage_amount = 255
			local hit_zone_name = "full"
			local damage_type = "forced"
			local damage_direction = Vector3(0, 0, 1)

			DamageUtils.add_damage_network(kill_unit, kill_unit, damage_amount, hit_zone_name, damage_type, nil, damage_direction, "debug", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1)
		end
	end
end

ConflictDirectorTests.nav_group_astar_test = function (self, side)
	if not self.astar_path then
		print("ASTAR")

		local start, goal = self.level_analysis:get_start_and_finish()
		local tri1 = GwNavTraversal.get_seed_triangle(self.nav_world, side.PLAYER_POSITIONS[1])
		local tri2 = GwNavTraversal.get_seed_triangle(self.nav_world, goal:unbox())

		if not tri1 or not tri2 then
			return false
		end

		local group1 = self.navigation_group_manager:get_polygon_group(tri1)
		local group2 = self.navigation_group_manager:get_polygon_group(tri2)
		local nav_groups = self.navigation_group_manager._navigation_groups
		local path, length = LuaAStar.a_star_plain(nav_groups, group1, group2)

		self.astar_path = path

		print("Generated path:", #path, length)
	end
end

ConflictDirectorTests.update_group_astar_test = function (self, side)
	if self.astar_path then
		local path = self.astar_path
		local old_pos

		for i = 1, #path do
			local pos = path[i]:get_group_center():unbox()

			QuickDrawer:sphere(pos, 2)

			if old_pos then
				QuickDrawer:line(pos + Vector3(0, 0, 1), old_pos + Vector3(0, 0, 1), Color(255, 244, 143, 7))
			end

			old_pos = pos
		end
	end
end

local function fake_broadphase(in_list, pos, rad)
	out_list = {}

	for i = 1, #in_list do
		local u = in_list[i]
		local p = Vector3(u.pos[1], u.pos[2], 0)

		if rad > Vector3.distance(pos, u) then
			out_list[#out_list + 1] = u
		end
	end

	return num
end

local function get_lean_target(enemy_list)
	local best_dogpile_value = 99
	local target_blackboard, best_target_unit

	for i = 1, #enemy_list do
		local target_unit = enemy_list[i]

		target_blackboard = BLACKBOARDS[target_unit]

		local dogpile = target_blackboard.lean_dogpile

		if target_blackboard ~= blackboard and enemy_units_lookup[target_unit] and dogpile < best_dogpile_value then
			best_dogpile_value = dogpile
			best_target_unit = target_unit

			if blackboard.lean_target_unit == target_unit then
				break
			end

			if i > 5 then
				break
			end
		end
	end

	if best_target_unit then
		return best_target_unit, true
	else
		return nil, false
	end
end

function slot_testing(self)
	for i = 1, #a do
		unit = a[i]
	end
end

function setup_slot_testing()
	local units_1 = {
		{
			lean_dogpile = 0,
			pos = {
				-1,
				3,
			},
		},
		{
			lean_dogpile = 0,
			pos = {
				0,
				3,
			},
		},
		{
			lean_dogpile = 0,
			pos = {
				1,
				3,
			},
		},
		{
			lean_dogpile = 0,
			pos = {
				2,
				3,
			},
		},
		{
			lean_dogpile = 0,
			pos = {
				3,
				3,
			},
		},
	}
	local units_2 = {
		{
			lean_dogpile = 0,
			pos = {
				1,
				0,
			},
		},
		{
			lean_dogpile = 0,
			pos = {
				2,
				0,
			},
		},
	}

	slot_testing(units_1, units_2)
end

ConflictDirectorTests.start_test = function (conflict_director, t, dt, test)
	local side = Managers.state.side:get_side_from_name("heroes") or Managers.state.side:get_side(1)

	test = test or "spawn_encampment"
	conflict_director.conflict_director_tests_name = test

	print("starting test:", test)

	if test == "sparse" then
		for i = 1, 30 do
			for j = 1, 30 do
				local c = side.PLAYER_POSITIONS[1]
				local pos = Vector3(c[1] + i * 0.3, c[2] + j * 0.3, c[3])

				ConflictDirectorTests.sparse_grid_test(pos, side.PLAYER_UNITS[1])
			end
		end

		return
	elseif test == "lean_slot" then
		ConflictDirectorTests.lean_slot_test()
	elseif test == "drag_test" then
		ConflictDirectorTests.drag_test_start(side)
	elseif test == "tentacle" then
		ConflictDirectorTests.tentacle_test_start(side, t, dt)
	elseif test == "mesh_cut" then
		ConflictDirectorTests.spawn_mesh_cut(conflict_director)
	elseif test == "liquid_blob" then
		ConflictDirectorTests.spawn_liquid_blob(conflict_director)
	elseif test == "reachable_coverpoints" then
		ConflictDirectorTests.setup_reachable_coverpoints_test(conflict_director)
	elseif test == "reachable_navgraph" then
		ConflictDirectorTests.process_reachable_coverpoints_test(conflict_director)
	elseif test == "test_cover_points" then
		ConflictDirectorTests.test_cover_points(conflict_director, side)
	elseif test == "kill_tester" then
		script_data.kill_test = not script_data.kill_test
	elseif test == "nav_group_astar" then
		ConflictDirectorTests.nav_group_astar_test(conflict_director, side)
	elseif test == "spawn_encampment" then
		if not GenericTerrorEvents.encampment then
			print("Missing terror event: encampment")

			return
		end

		local position, distance, normal, actor = conflict_director:player_aim_raycast(conflict_director._world, false, "filter_ray_horde_spawn")

		if not position then
			print("No spawn pos found")

			return
		end

		local event_data = {
			side_id = conflict_director.debug_spawn_side_id,
			debug_pos = position,
			debug_dir = {
				0,
				1,
			},
		}

		TerrorEventMixer.start_event("encampment4", event_data)

		local event_data = {
			side_id = 1,
			debug_pos = position + Vector3(0, 8, 0),
			debug_dir = {
				0,
				-1,
			},
		}

		TerrorEventMixer.start_event("encampment4", event_data)

		return
	elseif test == "hull_test" then
		local points = make_points_for_hull_test()
		local hull, num = convex_hull(points, {})
		local z = 0.5

		for i = 1, num do
			local a = hull[i]
			local b

			if i == num then
				b = hull[1]
			else
				b = hull[i + 1]
			end

			local p1 = Vector3(a.x, a.y, z)
			local p2 = Vector3(b.x, b.y, z)

			QuickDrawerStay:line(p1, p2, Color(200, 100, 100))
		end

		print("Convex Hull: ")
		print_points(hull, num)
		print()
		print("Correct Output: Convex Hull: [(-9, -3), (-3, -9), (19, -8), (17, 5), (12, 17), (5, 19), (-3, 15)]")
	end
end

ConflictDirectorTests.update = function (conflict_director, t, dt)
	local test = conflict_director.conflict_director_tests_name
	local side = Managers.state.side:get_side_from_name("heroes") or Managers.state.side:get_side(1)

	conflict_director.hero_player_and_bot_positions = side.PLAYER_AND_BOT_POSITIONS
	conflict_director.hero_player_positions = side.PLAYER_POSITIONS

	if test == "sparse" then
		ConflictDirectorTests.draw_sparse_grid(side.PLAYER_POSITIONS[1])
	elseif test == "jslots" then
		ConflictDirectorTests.update_jslots(side.PLAYER_UNITS[1])
	elseif test == "lean_slot" then
		ConflictDirectorTests.lean_slot_test_update(side)
	elseif test == "drag_test" then
		ConflictDirectorTests.drag_test_update(side)
	elseif test == "tentacle" then
		ConflictDirectorTests.tentacle_test_update(side, t, dt)
	elseif test == "kill_test" then
		ConflictDirectorTests.update_kill_tester(conflict_director, side)
	elseif test == "nav_group_astar" then
		ConflictDirectorTests.update_group_astar_test(conflict_director, side)
	end
end
