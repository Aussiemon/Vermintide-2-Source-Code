PatrolAnalysis = class(PatrolAnalysis)

require("scripts/utils/util")

local NAVTAG_LAYERS_STANDARD = {
	jumps = 1.5,
	ledges_with_fence = 1.5,
	doors = 1.5,
	teleporters = 5,
	ledges = 1.5
}
local NAVTAG_LAYERS_ROAMING = {
	jumps = 20,
	ledges_with_fence = 20,
	doors = 20,
	teleporters = 5,
	ledges = 20
}

local function make_colors(fill_table, f, g)
	local s = #fill_table
	fill_table[s + 1] = {
		255,
		0,
		f,
		0
	}
	fill_table[s + 2] = {
		255,
		0,
		0,
		f
	}
	fill_table[s + 3] = {
		255,
		f,
		0,
		0
	}
	fill_table[s + 4] = {
		255,
		f,
		f,
		0
	}
	fill_table[s + 5] = {
		255,
		0,
		f,
		f
	}
	fill_table[s + 6] = {
		255,
		f,
		0,
		f
	}
	fill_table[s + 7] = {
		255,
		g,
		g,
		f
	}
	fill_table[s + 8] = {
		255,
		f,
		g,
		g
	}
	fill_table[s + 9] = {
		255,
		g,
		f,
		g
	}
	fill_table[s + 10] = {
		255,
		f,
		g,
		0
	}
	fill_table[s + 11] = {
		255,
		f,
		0,
		g
	}
	fill_table[s + 12] = {
		255,
		0,
		g,
		f
	}
	fill_table[s + 1] = {
		255,
		g,
		0,
		f
	}

	return 
end

local debug_colors_lookup = {}

make_colors(debug_colors_lookup, 192, 64)
make_colors(debug_colors_lookup, 128, 255)

local num_debug_colors = #debug_colors_lookup
PatrolAnalysis.init = function (self, nav_world, using_editor, drawer)
	self.nav_world = nav_world
	self.using_editor = using_editor
	self.line_drawer = drawer
	local cost_table_standard = GwNavTagLayerCostTable.create()

	self.setup_nav(self, NAVTAG_LAYERS_STANDARD, cost_table_standard)

	local nav_cost_map_cost_table_standard = GwNavCostMap.create_tag_cost_table()

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table_standard)

	local cost_table_roaming = GwNavTagLayerCostTable.create()

	self.setup_nav(self, NAVTAG_LAYERS_ROAMING, cost_table_roaming)

	local nav_cost_map_cost_table_roaming = GwNavCostMap.create_tag_cost_table()

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table_roaming)

	self.patrol_waypoints = {}
	self.running_splines = {}
	self.ready_waypoints = {}
	self.free_navbots_lists = {
		standard = {},
		roaming = {}
	}
	self.navbot_setups = {
		standard = {
			nav_cost_map_cost_table = nav_cost_map_cost_table_standard,
			nav_cost_table = cost_table_standard
		},
		roaming = {
			nav_cost_map_cost_table = nav_cost_map_cost_table_roaming,
			nav_cost_table = cost_table_roaming
		}
	}

	return 
end
PatrolAnalysis.setup_nav = function (self, navtag_layer, cost_table)
	for layer_name, layer_cost in pairs(navtag_layer) do
		local layer_id = LAYER_ID_MAPPING[layer_name]

		GwNavTagLayerCostTable.allow_layer(cost_table, layer_id)
		GwNavTagLayerCostTable.set_layer_cost_multiplier(cost_table, layer_id, layer_cost)
	end

	return 
end
PatrolAnalysis.generate_patrol_splines = function (self, level_name, main_paths, drawer)
	print("Generating patrol splines for level", level_name)

	if not level_name then
		local level_key = Managers.state.game_mode:level_key()
		level_name = LevelSettings[level_key].level_name
	end

	self.running_splines = {}
	self.ready_waypoints = {}
	self.patrol_waypoints = {}
	self.free_navbots_lists = {
		standard = {},
		roaming = {}
	}
	self._spline_counter = 1
	local result = self._generate_patrol_spline(self, level_name, main_paths, "units/hub_elements/boss_waypoint", "boss_waypoint", drawer, "standard")

	if result ~= "success" then
		return result
	end

	result = self._generate_patrol_spline(self, level_name, main_paths, "units/hub_elements/patrol_waypoint", "patrol_waypoint", drawer, "roaming")

	if result ~= "success" then
		return result
	end

	result = self._generate_patrol_spline(self, level_name, main_paths, "units/hub_elements/event_waypoint", "event_waypoint", drawer, "standard")

	if result ~= "success" then
		return result
	end

	result = self._finilize_splines(self, main_paths, drawer)

	return result
end
PatrolAnalysis._finilize_splines = function (self, main_paths, drawer)
	local result = "success"
	local patrol_waypoints = self.patrol_waypoints
	local done = nil

	for patrol_id, spline in pairs(patrol_waypoints) do
		done = false

		while not done do
			done = true

			for i = 1, #spline - 1, 1 do
				if spline[i + 1].order < spline[i].order then
					local temp = spline[i]
					spline[i] = spline[i + 1]
					spline[i + 1] = temp
					done = false
				end
			end
		end
	end

	for id, spline in pairs(patrol_waypoints) do
		if #spline <= 1 then
			result = string.format("Spline of type '%s' with id '%s' has only one waypoint. Needs at least 2 waypoints.", spline.patrol_type, tostring(spline.id))
		end

		local p1 = spline[1].pos:unbox()
		local path_pos, travel_dist, total_path_dist, _ = MainPathUtils.closest_pos_at_main_path_lua(main_paths, p1)

		if not travel_dist then
			result = string.format("Patrol waypoint id '%s' cannot reach the main path. (%s) ", tostring(spline.id), spline.patrol_type)
		end

		spline.travel_dist = travel_dist

		print("Found spline of type:", spline.patrol_type, " with id:", id, " ,points:", #spline)

		local h = Vector3(0, 0, 1)
		local p2 = nil

		for i = 1, #spline, 1 do
			local waypoint = spline[i]
			local p2 = waypoint.pos:unbox()
			local path_pos, travel_dist, total_path_dist, _ = MainPathUtils.closest_pos_at_main_path_lua(main_paths, p1)
			waypoint.travel_dist = travel_dist
			local color = (spline.patrol_type == "boss_waypoint" and Color(255, 125, 0)) or Color(255, 255, 0)

			drawer.line(drawer, p1 + h, p2 + h, color)

			p1 = p2
		end
	end

	return result
end
PatrolAnalysis._generate_patrol_spline = function (self, level_name, main_paths, gizmo_unit_name, patrol_type, drawer, navbot_kind)
	local patrol_waypoints = self.patrol_waypoints
	local result = "success"

	print("[PatrolAnalysis] Generating " .. patrol_type .. " splines for level:", level_name, " Using gizmo-unit:", gizmo_unit_name)

	local index_offset = Script.index_offset()
	local level_objects = LevelEditor.objects

	for object_id, object in pairs(level_objects) do
		local unit = object._unit

		if Unit.alive(unit) and Unit.is_a(unit, gizmo_unit_name) then
			local pos = Unit.local_position(unit, index_offset)
			local script_data = object.script_data_overrides(object)
			local patrol_id = Unit.get_data(unit, "patrol_id")
			local map_section = Unit.get_data(unit, "map_section")
			local spline = patrol_waypoints[patrol_id]

			if not spline then
				spline = {
					wp_index = 2,
					id = patrol_id,
					patrol_type = patrol_type,
					map_section = map_section,
					navbot_kind = navbot_kind,
					index = self._spline_counter
				}
				patrol_waypoints[patrol_id] = spline
				self._spline_counter = self._spline_counter + 1
			end

			local order = Unit.get_data(unit, "order")
			local order = tonumber(order)
			local index = #spline + 1

			print("FOUND WAYPOINT:", patrol_id, order)

			local on_mesh = GwNavTraversal.get_seed_triangle(self.nav_world, pos)

			if not on_mesh then
				result = string.format("Patrol id '%s', waypoint with order '%s' is outside of navigation mesh. (%s)", tostring(patrol_id), tostring(order), object.name)
			end

			for i = 1, #spline, 1 do
				if order < spline[i].order then
					index = i

					break
				elseif order == spline[i].order then
					index = i
					result = string.format("Patrol id '%s', has two waypoints with the same order order '%s' (%s)", tostring(patrol_id), tostring(order), object.name)

					break
				end
			end

			table.insert(spline, index, {
				travel_dist = 0,
				pos = Vector3Box(pos),
				order = order
			})
		end
	end

	return result
end
local NAVIGATION_NAVMESH_RADIUS = 0.38
local use_nav_bot_splines = true
PatrolAnalysis.create_navbot = function (self, nav_world, pos, navbot_kind)
	local speed = 5
	local height = 1.6
	local navbot_data = self.navbot_setups[navbot_kind]
	local nav_cost_table = navbot_data.nav_cost_table
	local nav_cost_map_cost_table = navbot_data.nav_cost_map_cost_table
	local enable_crowd_dispersion = false
	local navbot = GwNavBot.create(nav_world, height, NAVIGATION_NAVMESH_RADIUS, speed, pos, nav_cost_map_cost_table, enable_crowd_dispersion)

	GwNavBot.set_use_avoidance(navbot, false)
	GwNavBot.set_navtag_layer_cost_table(navbot, nav_cost_table)

	if use_nav_bot_splines then
		local CHANNEL_RADIUS = 4
		local TURN_SAMPLING_ANGLE = 30
		local CHANNEL_SMOOTHING_ANGLE = 30
		local MIN_DISTANCE_BETWEEN_GATES = 1
		local MAX_DISTANCE_BETWEEN_GATES = 20

		GwNavBot.set_channel_computer_configuration(navbot, CHANNEL_RADIUS, TURN_SAMPLING_ANGLE, CHANNEL_SMOOTHING_ANGLE, MIN_DISTANCE_BETWEEN_GATES, MAX_DISTANCE_BETWEEN_GATES)

		local SCRIPT_DRIVEN = false
		local MAX_DISTANCE_TO_SPLINE_POSITION = 5
		local SPLINE_LENGTH = 100
		local SPLINE_DISTANCE_TO_BORDERS = 0.5
		local SPLINE_RECOMPUTION_RATIO = 1
		local TARGET_ON_SPLINE_DISTANCE = 0

		GwNavBot.set_spline_trajectory_configuration(navbot, SCRIPT_DRIVEN, MAX_DISTANCE_TO_SPLINE_POSITION, SPLINE_LENGTH, SPLINE_DISTANCE_TO_BORDERS, SPLINE_RECOMPUTION_RATIO, TARGET_ON_SPLINE_DISTANCE)
		GwNavBot.set_use_channel(navbot, true)
	end

	return navbot
end
PatrolAnalysis.inject_spline_path = function (self, spline, line_drawer)
	local navbot = spline.navbot
	local node_count = GwNavBot.get_path_nodes_count(navbot)
	local spline_points = spline.spline_points or {}
	local spline_points_index = spline.spline_points_index or 1
	local draw = self.using_editor or script_data.debug_storm_vermin_patrol

	if 0 < node_count then
		local previous_node_position = nil
		local current_node_index = GwNavBot.get_path_current_node_index(navbot)
		local offset = Vector3.up()*0.05

		for i = 0, node_count - 1, 1 do
			local position = GwNavBot.get_path_node_pos(navbot, i)
			spline_points[spline_points_index] = Vector3Box(position)
			spline_points_index = spline_points_index + 1

			if draw and line_drawer then
				local color_index = (spline.index - 1)%num_debug_colors + 1
				local ct = debug_colors_lookup[color_index]
				local color = Color(ct[1], ct[2], ct[3], ct[4])

				line_drawer.sphere(line_drawer, position + offset, 0.1, color)

				if previous_node_position then
					line_drawer.line(line_drawer, position + offset, previous_node_position + offset, color)
				end

				previous_node_position = position
			end
		end
	end

	local num_spline_points = #spline_points

	for i = num_spline_points, 2, -1 do
		local point_1 = spline_points[i]:unbox()
		local point_2 = spline_points[i - 1]:unbox()

		if Vector3.equal(point_1, point_2) then
			table.remove(spline_points, i)

			spline_points_index = spline_points_index - 1
		end
	end

	spline.spline_points = spline_points
	spline.spline_points_index = spline_points_index

	return 
end
local max_running_splines = 10
PatrolAnalysis.compute_spline_path = function (self, spline_name, spline_way_points, navbot_kind)
	local spline = {
		unique_navbot = true,
		wp_index = 2,
		id = spline_name,
		navbot_kind = navbot_kind
	}

	for i, spline_way_point in ipairs(spline_way_points) do
		table.insert(spline, i, {
			pos = spline_way_point,
			order = i
		})
	end

	self.patrol_waypoints[spline_name] = spline

	return 
end
PatrolAnalysis.spline = function (self, spline_name)
	local ready_waypoints = self.ready_waypoints

	for i, spline in ipairs(ready_waypoints) do
		local id = spline.id

		if id == spline_name then
			return spline
		end
	end

	return 
end
PatrolAnalysis.draw_raw_spline = function (self, spline_name)
	local spline = self.spline(self, spline_name)
	local p1 = spline[1].pos:unbox()

	QuickDrawerStay:sphere(p1, 0.33, Color(0, 200, 175))

	for j = 2, #spline, 1 do
		local p2 = spline[j].pos:unbox()

		QuickDrawerStay:sphere(p1, 0.33, Color(200, 40, 0))
		QuickDrawerStay:line(p1, p2, Color(0, 200, 175))

		p1 = p2
	end

	return 
end
PatrolAnalysis.draw_astar_spline = function (self, points)
	local p1 = points[1]:unbox()

	QuickDrawerStay:sphere(p1, 0.33, Color(0, 200, 175))

	for j = 2, #points, 1 do
		local p2 = points[j]:unbox()

		QuickDrawerStay:sphere(p1, 0.23, Color(0, 200, 175))
		QuickDrawerStay:line(p1, p2, Color(0, 200, 175))

		p1 = p2
	end

	return 
end
local Vector3_distance = Vector3.distance
local Vector3_length = Vector3.length
PatrolAnalysis.get_path_point = function (self, points, path_length, move_percent)
	local path_length = path_length or self.get_path_length(self, points)
	local travel_dist = 0
	local goal_dist = move_percent*path_length

	for i = 1, #points - 1, 1 do
		local p1 = points[i]:unbox()
		local p2 = points[i + 1]:unbox()
		local vec = p2 - p1
		local p1p2_dist = Vector3_length(vec)
		travel_dist = travel_dist + p1p2_dist

		if goal_dist < travel_dist then
			local missing = travel_dist - goal_dist
			local left_over = p1p2_dist - missing
			local part = left_over/p1p2_dist
			local part_vec = vec*part
			local move_vec = p1 + part_vec

			return move_vec, i
		end
	end

	return points[#points]:unbox(), #points
end
PatrolAnalysis.get_path_length = function (self, points)
	local total_len = 0
	local p1 = points[1]:unbox()

	for j = 2, #points, 1 do
		local p2 = points[j]:unbox()
		total_len = total_len + Vector3_distance(p1, p2)
		p1 = p2
	end

	return total_len
end
PatrolAnalysis.run = function (self)
	local line_drawer = self.line_drawer
	local running_splines = self.running_splines
	local free_navbots_lists = self.free_navbots_lists
	local patrol_waypoints = self.patrol_waypoints
	local ready_waypoints = self.ready_waypoints

	while #running_splines < max_running_splines do
		local id, spline = next(patrol_waypoints)

		if spline then
			running_splines[#running_splines + 1] = spline
			patrol_waypoints[id] = nil
			local p1 = spline[1].pos:unbox()
			local p2 = spline[2].pos:unbox()
			local navbot = nil
			local navbot_kind = spline.navbot_kind or "standard"
			local free_navbots = free_navbots_lists[navbot_kind]
			local num_free_navbots = #free_navbots
			local unique_navbot = spline.unique_navbot

			if num_free_navbots == 0 or unique_navbot then
				print("> starting new spline, using new navbot:", navbot_kind, ", id:", id)

				navbot = self.create_navbot(self, self.nav_world, p1, navbot_kind)
			else
				print("> starting new spline, recycling navbot of kind:", navbot_kind, ", id:", id)

				navbot = free_navbots[num_free_navbots]
				free_navbots[num_free_navbots] = nil
			end

			spline.navbot = navbot

			GwNavBot.update_position(navbot, p1)
			GwNavBot.compute_new_path(navbot, p2)
		else
			break
		end
	end

	local size = #running_splines
	local i = 1

	while i <= size do
		local spline = running_splines[i]
		local navbot = spline.navbot
		local path_computing_done = not GwNavBot.is_computing_new_path(navbot)

		if path_computing_done then
			local wp_index = spline.wp_index

			if wp_index < #spline then
				self.inject_spline_path(self, spline, line_drawer)
				print("\t> continuing spline", spline.id, "index:", wp_index)

				local p1 = spline[wp_index].pos:unbox()

				GwNavBot.update_position(navbot, p1)

				wp_index = wp_index + 1
				local p2 = spline[wp_index].pos:unbox()

				GwNavBot.compute_new_path(navbot, p2)

				spline.wp_index = wp_index
				i = i + 1
			else
				print("\t> spline completed", spline.id)
				self.inject_spline_path(self, spline, line_drawer)

				local unique_navbot = spline.unique_navbot

				if unique_navbot then
					GwNavBot.destroy(navbot)
				else
					local free_navbots = free_navbots_lists[spline.navbot_kind or "standard"]
					free_navbots[#free_navbots + 1] = navbot
				end

				spline.navbot = nil
				running_splines[i] = running_splines[size]
				running_splines[size] = nil
				ready_waypoints[#ready_waypoints + 1] = spline
				size = size - 1
			end
		else
			i = i + 1
		end
	end

	if size <= 0 then
		for kind, free_navbots in pairs(free_navbots_lists) do
			for i = 1, #free_navbots, 1 do
				local navbot = free_navbots[i]

				GwNavBot.destroy(navbot)
			end
		end

		return "success", ready_waypoints
	end

	return 
end

return 
