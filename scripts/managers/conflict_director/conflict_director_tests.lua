ConflictDirectorTests = {}
local player_and_bot_positions = PLAYER_AND_BOT_POSITIONS
local player_positions = PLAYER_POSITIONS
local player_units = PLAYER_UNITS
local players_and_bot_units = PLAYER_AND_BOT_UNITS
local utility_comparison = false
ConflictDirectorTests.start_utility_comparison = function ()
	utility_comparison = true

	return 
end

local function compare_utility()
	local consideration = UtilityConsiderations.storm_vermin_push_attack.distance_to_target
	local blackboard_value = 0.7
	local f1 = EngineOptimized.utility_from_spline

	Profiler.start("UTIL ENG")

	local utility = nil

	for ii = 1, 1000, 1 do
		utility = f1(consideration.engine_spline_index, blackboard_value)
	end

	Profiler.stop("UTIL ENG")

	local norm_value = math.clamp(blackboard_value/consideration.max_value, 0, 1)
	local f2 = Utility.GetUtilityValueFromSpline

	Profiler.start("UTIL LUA")

	for ii = 1, 1000, 1 do
		utility = f2(consideration.spline, norm_value)
	end

	Profiler.stop("UTIL LUA")

	return 
end

local function test_pointx(nodes, p)
	local best_point = Vector3(0, 0, 0)
	local best_dist = math.huge
	local best_sub_index = -1
	local p1 = nodes[1]:unbox()

	for j = 1, #nodes - 1, 1 do
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
			Vector3Box(p)
		}

		for i = 2, num_points, 1 do
			local wanted_distance = total_path_dist/num_points*i
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

	QuickDrawer:sphere(pos, math.sin(t*5)*5 + 10)
	Debug.text("DISTANCE point: %d, distance %.1f", ti, main_path_data.collapsed_travel_dists[ti])
	Profiler.start("main_path_a")

	for i = 1, num_points, 1 do
		closest_pos_at_main_path(main_path_data.collapsed_path, main_path_data.collapsed_travel_dists, main_path_data.breaks_lookup, pos, ti)
	end

	Profiler.stop("main_path_a")

	local closest_pos_at_main_path_opt = EngineOptimized.closest_pos_at_main_path
	local pr2 = EngineOptimized.point_on_mainpath

	Profiler.start("main_path_b")

	for i = 1, num_points, 1 do
		closest_pos_at_main_path_opt(pos)
	end

	Profiler.stop("main_path_b")

	local p = PLAYER_POSITIONS[1]
	local p1 = Vector3(100, 20, 130)
	local p2 = Vector3(-100, -420, 30)
	local res = nil
	local EngineOptimized_closest_point_on_line = EngineOptimized.closest_point_on_line

	Profiler.start("closest_point Opt")

	for i = 1, 250, 1 do
		res = EngineOptimized_closest_point_on_line(p, p1, p2)
	end

	Profiler.stop("closest_point Opt")

	local Geometry_closest_point_on_line = Geometry.closest_point_on_line

	Profiler.start("closest_point Script")

	for i = 1, 250, 1 do
		res = Geometry_closest_point_on_line(p, p1, p2)
	end

	Profiler.stop("closest_point Script")

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

	return 
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

		for i = 1, 25, 1 do
			local p = ConflictUtils.get_hidden_pos(self._world, self.nav_world, epicenter, player_and_bot_positions, 30, 10, avoid_dist_sqr, 10, forward_path_dir, math.pi)

			if p then
				QuickDrawer:sphere(p, 1)
			end
		end
	end

	return 
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

	return 
end

function debug_bot_transitions(self, t)
	local ai_system = Managers.state.entity:system("ai_system")
	local gui = ai_system.ai_debugger and ai_system.ai_debugger.screen_gui

	AiUtils.debug_bot_transitions(gui, t, 0, 0)

	return 
end

function test_player_path_pos_and_50m_ahead(self)
	local pos = player_positions[1]
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

	return 
end

function test_angled_trajectory(self)
	local p1 = Vector3(0, 0, 2)
	local p2 = Vector3(19, 16, 2)
	local physics_world = World.get_data(self._world, "physics_world")
	local gravity = -9.82
	local jump_speed = nil
	local angle = math.degrees_to_radians(45)
	local success, velocity, tof = WeaponHelper.test_angled_trajectory(physics_world, p1, p2, gravity, jump_speed, angle)

	QuickDrawer:sphere(p1, 1)
	QuickDrawer:sphere(p2, 1)
	Debug.text("Trajectory Success: " .. tostring(success))

	return 
end

function setup_reachable_coverpoints_test(self)
	local point_list = {}
	local num_found, cover_points = ConflictUtils.hidden_cover_points(player_positions[1], PLAYER_POSITIONS, 2, 45, 1)

	for i = 1, num_found, 1 do
		point_list[i] = Vector3Box(Unit.local_position(cover_points[i], 0))
	end

	self._reachable_processing = LevelAnalysis.setup_unreachable_processing(self.nav_world, self.main_path_info.main_paths, point_list, {
		max_concurrent_astars = 5,
		line_object = QuickDrawerStay
	})

	print("Points to test:", num_found)

	return 
end

function process_reachable_coverpoints_test(self)
	if self._reachable_processing then
		local done = self.level_analysis.process_unreachable(self._reachable_processing)

		if done then
			self._reachable_processing = nil

			print("astar connect complete")
		end
	end

	return 
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
		fail_color = Color(212, 48, 0)
	})

	print("Points to test:", #point_list)

	return 
end

function process_reachable_navgraph_test(self)
	if self._reachable_navgraph_processing then
		local done = self.level_analysis.process_unreachable(self._reachable_navgraph_processing)

		if done then
			self._reachable_navgraph_processing = nil

			print("astar connect complete")
		end
	end

	return 
end

ConflictDirectorTests.update = function (conflict_director, t, dt)
	return 
end

return 
