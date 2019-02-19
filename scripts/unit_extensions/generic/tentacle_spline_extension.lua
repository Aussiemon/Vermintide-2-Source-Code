require("foundation/scripts/util/spline_curve")

TentacleSplineExtension = class(TentacleSplineExtension)
local debug_spline = false
local debug_dists = false
local astar_spline = false
local use_extra_anchor_point = false

TentacleSplineExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local is_server = Managers.player.is_server
	self._unit = unit
	self.is_server = is_server
	self.world = extension_init_context.world
end

TentacleSplineExtension.extensions_ready = function (self, world, unit)
	local blackboard = BLACKBOARDS[unit] or {}
	self.blackboard = blackboard
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self.nav_world = nav_world
	local tentacle_template_name = extension_init_data.tentacle_template_name
	local tentacle_template = TentacleTemplates[tentacle_template_name]
	self.tentacle_template_name = tentacle_template_name
	self.tentacle_template = tentacle_template
	local time_manager = Managers.time
	local t = time_manager:time("game")
	local tentacle_data, breed = self:spawn_chaos_tentacle(unit, blackboard, nav_world, is_server, t, extension_init_data, tentacle_template)
	self.tentacle_data = tentacle_data
	blackboard.tentacle_data = tentacle_data
	self.portal_unit = tentacle_data.portal_unit
	self.breed = breed
	self._last_good_ground_pos = Vector3Box(0, 0, 0)

	if tentacle_template.use_ik_chain then
		local start_pos = tentacle_data.wall_pos:unbox()
		local target_pos = (self.target_unit and POSITION_LOOKUP[self.target_unit]) or tentacle_data.last_target_pos:unbox()
		local joints = {}
		local segment_length = 0.5
		local length = segment_length * 10

		for i = 1, 10, 1 do
			joints[i] = Vector3(0, 0, i * segment_length)
		end

		self.ik_tentacle = IkChain:new(joints, start_pos, target_pos, 0.01)

		self.ik_tentacle:solve(t, 0.03333333333333333)
	end

	local bone_nodes, node_spacing, max_length, spiral_length = nil
	local node_data = breed.node_data

	if node_data then
		bone_nodes = node_data.bone_nodes
		node_spacing = node_data.node_spacing
		max_length = node_data.max_length
		spiral_length = node_data.spiral_length
	else
		bone_nodes, node_spacing, max_length = self:parse_nodes(unit, "j_tip")
		spiral_length = self:get_spiral_length(node_spacing)
		breed.node_data = {
			bone_nodes = bone_nodes,
			node_spacing = node_spacing,
			max_length = max_length,
			spiral_length = spiral_length
		}
	end

	tentacle_data.dists = {
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	tentacle_data.node_spacings = node_spacing
	tentacle_data.bone_nodes = bone_nodes
	tentacle_data.num_bone_nodes = #bone_nodes
	tentacle_data.max_length = max_length
	tentacle_data.spiral_length = spiral_length
	tentacle_data.travel_node_dir = Vector3Box()

	if is_server then
		Unit.set_unit_visibility(unit, false)

		local nav_cost_map_cost_table = GwNavCostMap.create_tag_cost_table()

		AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table, nil, 1)

		local traverse_logic = GwNavTraverseLogic.create(nav_world, nav_cost_map_cost_table)
		local navtag_layer_cost_table = GwNavTagLayerCostTable.create()

		GwNavTraverseLogic.set_navtag_layer_cost_table(traverse_logic, navtag_layer_cost_table)

		local a_star = GwNavAStar.create(nav_world)
		tentacle_data.a_star = a_star
		tentacle_data.traverse_logic = traverse_logic
		tentacle_data.navtag_layer_cost_table = navtag_layer_cost_table
		tentacle_data.nav_cost_map_cost_table = nav_cost_map_cost_table
	else
		self._server_time_delta = 0
	end
end

TentacleSplineExtension.get_spiral_length = function (self, node_spacing)
	local num_nodes = #node_spacing
	local length = 0

	for i = num_nodes - 21, num_nodes, 1 do
		length = length + node_spacing[i]
	end

	return length
end

TentacleSplineExtension.parse_nodes = function (self, unit, tip_node_name)
	local nodes = {}
	local node_spacing = {}
	local max_length = 0
	local node = Unit.node(unit, tip_node_name)
	nodes[1] = node
	local k = 2

	while node do
		node = Unit.scene_graph_parent(unit, node)

		if node then
			nodes[k] = node
		end

		k = k + 1
	end

	nodes[#nodes] = nil

	table.reverse(nodes)

	local p1 = Unit.world_position(unit, 0)
	local p2 = nil

	for i = 1, #nodes, 1 do
		p2 = Unit.world_position(unit, nodes[i])
		local spacing = Vector3.distance(p1, p2)
		node_spacing[i] = spacing
		max_length = max_length + spacing
		p1 = p2
	end

	if debug_spline then
		print("Num tentacle nodes:", #nodes, "max_length:", max_length)
		table.dump(node_spacing)
	end

	return nodes, node_spacing, max_length
end

TentacleSplineExtension.get_ground_pos_at_wall = function (self, unit, nav_world, wall_pos)
	local portal_forward = Quaternion.forward(Unit.local_rotation(unit, 0)) * 1.5
	local pos = wall_pos + portal_forward
	local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, pos, 0.3, 5)

	if success then
		local projected_pos = Vector3(pos.x, pos.y, altitude)

		return projected_pos
	end
end

TentacleSplineExtension.get_ground_pos_at_floor = function (self, unit, nav_world, floor_pos, target_pos)
	local target_unit = self.target_unit
	local to_target = Vector3.normalize(target_pos - floor_pos)
	local h = Vector3(0, 0, 1.3)
	local pos = floor_pos + h + to_target
	local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, pos, 1, 5)

	if success then
		local projected_pos = Vector3(pos.x, pos.y, altitude)

		return projected_pos
	end
end

TentacleSplineExtension.spawn_chaos_tentacle = function (self, unit, blackboard, nav_world, is_server, t, extension_init_data, tentacle_template)
	local breed = blackboard.breed or Breeds.chaos_tentacle
	local inside_wall_distance = breed.inside_wall_spawn_distance or 0
	local position = POSITION_LOOKUP[unit]
	local rot = Unit.local_rotation(unit, 0)
	local fwd = Vector3.normalize(Quaternion.forward(rot))
	local wall_pos = position + fwd * inside_wall_distance
	local portal_unit = nil

	if is_server then
		local portal_unit_name = tentacle_template.portal_unit_name
		local extension_init_data = {
			health_system = {
				health = 255
			},
			death_system = {
				death_reaction_template = "chaos_tentacle_portal",
				is_husk = false
			}
		}
		portal_unit = Managers.state.unit_spawner:spawn_network_unit(portal_unit_name, "ai_unit_tentacle_portal", extension_init_data, wall_pos, rot)
	else
		portal_unit = extension_init_data.portal_unit
	end

	if Unit.has_node(portal_unit, "a_surface_center") then
		local surface_node = Unit.node(portal_unit, "a_surface_center")

		WwiseUtils.trigger_unit_event(self.world, "Play_enemy_sorcerer_portal_activate", portal_unit, surface_node)
	end

	local dot = Vector3.dot(fwd, Vector3(0, 0, 1))
	local spawn_type = (dot > 0.707 and "floor") or "wall"
	local ground_pos = nil

	if spawn_type == "wall" then
		ground_pos = self:get_ground_pos_at_wall(unit, nav_world, wall_pos)
	end

	local spline_points, spline = nil
	local data = {
		state = "startup",
		current_length = 0,
		unit = unit,
		startup_time = t + breed.startup_time,
		root_pos = Vector3Box(position),
		ground_pos = ground_pos and Vector3Box(ground_pos),
		wall_pos = Vector3Box(wall_pos),
		spline_points = spline_points,
		spline = spline,
		last_target_pos = Vector3Box(position),
		path_type = (self.is_server and "no_path") or "straight",
		inside_wall_distance = inside_wall_distance,
		portal_unit = portal_unit,
		portal_spawn_type = spawn_type,
		tentacle_template = tentacle_template
	}

	return data, breed
end

TentacleSplineExtension.extensions_ready = function (self)
	return
end

TentacleSplineExtension.destroy = function (self)
	local unit = self._unit

	if Unit.alive(unit) then
		local breed = self.breed
		local head_node = Unit.node(unit, breed.sound_head_node)

		WwiseUtils.trigger_unit_event(self.world, "Stop_tentacle_movement", unit, head_node)
		self:update_global_movement_sound_intensity(self.unit, self.breed, 1)
	end

	self.portal_unit = nil

	if self.is_server then
		local tentacle_data = self.tentacle_data

		GwNavTagLayerCostTable.destroy(tentacle_data.navtag_layer_cost_table)
		GwNavCostMap.destroy_tag_cost_table(tentacle_data.nav_cost_map_cost_table)
		GwNavTraverseLogic.destroy(tentacle_data.traverse_logic)

		local astar = tentacle_data.astar

		if astar then
			if not GwNavAStar.processing_finished(astar) then
				GwNavAStar.cancel(astar)
			end

			GwNavAStar.destroy(astar)
		end
	end
end

TentacleSplineExtension.reset = function (self)
	return
end

local TentacleAlignFunctions = {
	attack = function (target_unit, spline_points, k)
		local lock_point_index = k
		k = k + 1
		local h = 0.7
		local w = 0.55
		local m = 0.35
		local m2 = 0.55
		local rotating = true

		if rotating then
			local head_node = Unit.node(target_unit, "j_head")
			local head_pos = Unit.world_position(target_unit, head_node)
			local s_node = Unit.node(target_unit, "j_hips")
			local s_pos = Unit.world_position(target_unit, s_node)
			local s_rot = Unit.world_rotation(target_unit, s_node)
			local to_head = head_pos - s_pos
			local player_fwd = Quaternion.forward(s_rot)
			local side = Vector3.cross(player_fwd, to_head)
			local fwd = Vector3.cross(side, to_head)
			local c = s_pos
			spline_points[k] = (c + side * w) - to_head * 0.2
			k = k + 1
			spline_points[k] = (c + fwd * m) - to_head * 0.1
			k = k + 1
			spline_points[k] = c - side * w - to_head * 0
			k = k + 1
			spline_points[k] = c - fwd * m + to_head * 0.1
			k = k + 1
			spline_points[k] = c + side * w + to_head * 0.2
			k = k + 1
			spline_points[k] = c + fwd * m + to_head * 0.3
			k = k + 1
			spline_points[k] = c - side * w + to_head * 0.4
			k = k + 1
			spline_points[k] = c - fwd * m2 + to_head * 0.5
			k = k + 1
			spline_points[k] = c + side * w + to_head * 0.6
			k = k + 1
			spline_points[k] = c + fwd * m + to_head * 0.7
			k = k + 1
			spline_points[k] = c - side * w + to_head * 0.8
		else
			local target_pos = POSITION_LOOKUP[target_unit]
			spline_points[k] = target_pos + side * w + Vector3(0, 0, h - 0.3)
			k = k + 1
			spline_points[k] = target_pos + to_player_dir * m + Vector3(0, 0, h - 0.2)
			k = k + 1
			spline_points[k] = target_pos - side * w + Vector3(0, 0, h - 0.1)
			k = k + 1
			spline_points[k] = target_pos - to_player_dir * m + Vector3(0, 0, h + 0)
			k = k + 1
			spline_points[k] = target_pos + side * w + Vector3(0, 0, h + 0.1)
			k = k + 1
			spline_points[k] = target_pos + to_player_dir * m + Vector3(0, 0, h + 0.2)
			k = k + 1
			spline_points[k] = target_pos - side * w + Vector3(0, 0, h + 0.3)
			k = k + 1
			spline_points[k] = target_pos - to_player_dir * m + Vector3(0, 0, h + 0.4)
			k = k + 1
			spline_points[k] = target_pos + side * w + Vector3(0, 0, h + 0.5)
			k = k + 1
			spline_points[k] = target_pos + to_player_dir * m + Vector3(0, 0, h + 0.6)
			k = k + 1
			spline_points[k] = target_pos - side * w + Vector3(0, 0, h + 0.7)
		end

		return lock_point_index
	end,
	evaded = function (target_unit, spline_points, k)
		local lock_point_index = k
		k = k + 1
		local h = 0.7
		local w = 0.55
		local m = 0.35
		local m2 = 0.55
		local head_node = Unit.node(target_unit, "j_head")
		local head_pos = Unit.world_position(target_unit, head_node)
		local s_node = Unit.node(target_unit, "j_hips")
		local s_pos = Unit.world_position(target_unit, s_node)
		local s_rot = Unit.world_rotation(target_unit, s_node)
		local to_head = head_pos - s_pos
		local player_fwd = Quaternion.forward(s_rot)
		local side = Vector3.cross(player_fwd, to_head)
		local fwd = Vector3.cross(side, to_head)
		local c = s_pos
		spline_points[k] = (c + side * w) - to_head * 0.2
		k = k + 1
		spline_points[k] = c - fwd * 1.5 - to_head * 0.1
		k = k + 1
		spline_points[k] = c - fwd * 5 - to_head * 0.5

		return lock_point_index
	end
}

TentacleSplineExtension.set_target = function (self, template_name, target_unit, reach_dist)
	self.target_unit = target_unit
	self.active_template_name = template_name
	self.tentacle_data.active_template_name = template_name
	self.reach_dist = math.clamp(reach_dist, 0, 31)
end

TentacleSplineExtension.set_reach_dist = function (self, reach_dist)
	self.reach_dist = math.clamp(reach_dist, 0, 31)
end

TentacleSplineExtension.set_target_unit = function (self, target_unit)
	self.target_unit = target_unit
end

TentacleSplineExtension.set_server_time = function (self, server_time)
	local t = Managers.time:time("main")
	self._server_time_delta = server_time - t
end

TentacleSplineExtension.set_astar_points = function (self, node_list)
	local tentacle_data = self.tentacle_data
	local num_nodes = #node_list

	if num_nodes > 0 then
		local root_pos = tentacle_data.root_pos:unbox()
		local ground_pos = tentacle_data.ground_pos:unbox()
		local p2 = Unit.local_position(self.portal_unit, 0)
		local p3 = Vector3(ground_pos.x, ground_pos.y, root_pos.z)

		table.insert(node_list, 1, root_pos)
		table.insert(node_list, 2, p2)
		table.insert(node_list, 3, p3)

		num_nodes = num_nodes + 3

		tentacle_data.travel_node_dir:store(Vector3.normalize(node_list[num_nodes - 1] - node_list[num_nodes]))
		LevelAnalysis.boxify_pos_array(node_list)

		tentacle_data.astar_node_list = node_list
		tentacle_data.path_type = "follow_astar"
		tentacle_data.travel_to_node_index = num_nodes - 1
	else
		tentacle_data.path_type = "straight"
	end

	tentacle_data.reset = true
	tentacle_data.astar_node_list = node_list
end

TentacleSplineExtension.update_global_movement_sound_intensity = function (self, unit, breed, dt)
	local previous_length = self.previous_reach_dist or 0
	local current_length = self.reach_dist or previous_length
	local scaling = breed.movement_sound_scaling
	local max_intensity = breed.movement_sound_max_intensity
	local new_intensity = math.min(math.abs(previous_length - current_length) / dt * scaling, max_intensity)
	local sound_parameter = breed.movement_sound_parameter
	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:set_global_parameter_with_lerp(sound_parameter, new_intensity)
end

TentacleSplineExtension.update = function (self, unit, input, dt, context, t)
	if not Unit.alive(self.target_unit) then
		return
	end

	local breed = self.breed
	local data = self.tentacle_data

	if data.state == "startup" and data.startup_time < t then
		data.state = "recalc_path"
		local head_node = Unit.node(unit, breed.sound_head_node)
		local body_node = Unit.node(unit, breed.sound_body_node)

		WwiseUtils.trigger_unit_event(self.world, "Play_tentacle_movement_head", unit, head_node)
		WwiseUtils.trigger_unit_event(self.world, "Play_tentacle_movement_body", unit, body_node)
		WwiseUtils.trigger_unit_event(self.world, "Play_enemy_sorcerer_tentacle_foley_grab_swing", unit, head_node)
	end

	if self.is_server then
		local target_unit = self.target_unit
		local target_pos = (self.target_unit and POSITION_LOOKUP[self.target_unit]) or data.last_target_pos:unbox()
		local root_pos = data.root_pos:unbox()
		local blackboard = self.blackboard

		if data.state == "spline_update" then
			Unit.set_unit_visibility(unit, true)
			self:align_tentacle(self.active_template_name, data, target_pos, self.reach_dist, t, dt)

			local game_session = Managers.state.network:game()
			local tentacle_unit_id = Managers.state.unit_storage:go_id(self._unit)

			GameSession.set_game_object_field(game_session, tentacle_unit_id, "reach_distance", self.reach_dist)
			data.last_target_pos:store(target_pos)
		elseif data.state == "calculate_path" then
			self:calculate_tentacle_path(unit, data, root_pos, target_pos)
		elseif data.state == "recalc_path" then
			local nav_world = blackboard.nav_world

			if not data.ground_pos and data.portal_spawn_type == "floor" then
				local wall_pos = data.wall_pos:unbox()
				local ground_pos = self:get_ground_pos_at_floor(unit, nav_world, wall_pos, target_pos)

				if ground_pos then
					data.ground_pos = Vector3Box(ground_pos)
				end
			end

			local success, altitude = GwNavQueries.triangle_from_position(nav_world, target_pos, 0.5, 1)

			if not success then
				local close_pos = GwNavQueries.inside_position_from_outside_position(nav_world, target_pos, 1, 4, 4, 1)

				if close_pos then
					print("Target was outside mesh, found a close position, near it")

					target_pos = close_pos
				end
			end

			if data.ground_pos then
				data.last_target_pos:store(target_pos)

				local a_star = data.a_star
				local ground_pos = data.ground_pos:unbox()

				GwNavAStar.start(a_star, nav_world, data.ground_pos:unbox(), target_pos, data.traverse_logic)

				data.state = "calculate_path"
			else
				print("fallback w/o a-star")

				self.tentacle_data.state = "spline_update"
				self.tentacle_data.path_type = "straight"
			end
		elseif data.state == "no_path_found" then
			local target_moved_dist_squared = Vector3.distance_squared(target_pos, data.last_target_pos:unbox())

			if target_moved_dist_squared > 1 then
				data.state = "recalc_path"
			end
		end
	else
		if self.tentacle_data.reset then
			self.tentacle_data.reset = nil
		end

		local server_time = t + self._server_time_delta
		local target_pos = (self.target_unit and POSITION_LOOKUP[self.target_unit]) or data.last_target_pos:unbox()
		local game_session = Managers.state.network:game()
		local target_unit_id = Managers.state.unit_storage:go_id(unit)
		local reach_dist = GameSession.game_object_field(game_session, target_unit_id, "reach_distance")
		self.reach_dist = reach_dist

		self:align_tentacle(self.active_template_name, self.tentacle_data, target_pos, reach_dist, server_time, dt)
		data.last_target_pos:store(target_pos)
	end

	self:update_global_movement_sound_intensity(unit, breed, dt)

	self.previous_reach_dist = self.reach_dist
end

TentacleSplineExtension.get_last_ground_pos = function (self)
	return self._last_good_ground_pos:unbox()
end

local function draw_node_list(nodes, quick_drawer)
	local drawer = quick_drawer or QuickDrawer

	for j = 1, #nodes, 1 do
		drawer:sphere(nodes[j]:unbox(), 0.4, Color(0, 255, 124))
	end
end

local a_dist = 0.6

TentacleSplineExtension.calculate_tentacle_path = function (self, unit, tentacle_data)
	local a_star = tentacle_data.a_star
	local result = GwNavAStar.processing_finished(a_star)

	if result then
		if GwNavAStar.path_found(a_star) then
			local num_nodes = GwNavAStar.node_count(a_star)

			print("Tentacle Found path! node-count:", num_nodes)

			local cost = GwNavAStar.path_cost(a_star)
			local dist = GwNavAStar.path_distance(a_star)
			tentacle_data.state = "spline_update"

			if num_nodes == 2 then
				tentacle_data.path_type = "straight"
			else
				tentacle_data.path_type = "follow_astar"
				local h = Vector3(0, 0, 1.3)
				local node_list = {}

				for j = 2, num_nodes, 1 do
					node_list[j - 1] = GwNavAStar.node_at_index(a_star, j) + h
				end

				local network_manager = Managers.state.network
				local tentacle_unit_id = network_manager:unit_game_object_id(unit)

				if debug_spline then
					table.dump(node_list, "node-list:")
				end

				network_manager.network_transmit:send_rpc_clients("rpc_sync_tentacle_path", tentacle_unit_id, node_list)

				local root_pos = tentacle_data.root_pos:unbox()
				local ground_pos = tentacle_data.ground_pos:unbox()
				local p2 = Unit.local_position(self.portal_unit, 0)
				local p3 = Vector3(ground_pos.x, ground_pos.y, root_pos.z)

				table.insert(node_list, 1, root_pos)
				table.insert(node_list, 2, p2)
				table.insert(node_list, 3, p3)

				num_nodes = num_nodes + 2
				local last_node_pos = node_list[num_nodes]
				local to_travel_dir = Vector3.normalize(node_list[num_nodes - 1] - last_node_pos)

				tentacle_data.travel_node_dir:store(to_travel_dir)

				tentacle_data.travel_to_node_index = num_nodes - 1

				LevelAnalysis.boxify_pos_array(node_list)

				tentacle_data.astar_node_list = node_list
			end

			tentacle_data.use_old_path = false
		elseif tentacle_data.path_type ~= "no_path" then
			print("Tentacle failed no path found")

			tentacle_data.state = "no_path_found"
		else
			print("Tentacle failed no path found - using old path")

			tentacle_data.state = "spline_update"
			tentacle_data.use_old_path = true
		end
	end
end

local index_lists = {
	first_part = {
		2,
		3
	},
	attack_test = {
		3,
		4,
		5,
		6,
		7
	},
	attack_a = {
		2,
		3,
		4,
		5
	}
}

TentacleSplineExtension.keep_tentacle_above_ground = function (self, nav_world, spline_points, start_index, check_list)
	for i = start_index, #check_list, 1 do
		local index = check_list[i]
		local pos = spline_points[index]
		local success, altitude = GwNavQueries.triangle_from_position(nav_world, pos, 4, 1)

		if success and pos.z < altitude then
			local d = pos.z - altitude
			local projected_pos = Vector3(pos.x, pos.y, altitude - d)
			spline_points[index] = projected_pos
		end
	end
end

TentacleSplineExtension.funnel_tentacle_to_center = function (self, spline_points, from, to, wall_pos, root_pos, portal_forward, root_to_align_dist, horiz_influence_dist)
	local influence_dist = 4

	Debug.text("influence dist: %.2f", influence_dist)

	for i = from, to, 1 do
		local point = spline_points[i]
		local p = Geometry.closest_point_on_line(point, root_pos, wall_pos + portal_forward * influence_dist)
		local dist_along_fwd = Vector3.length(p - root_pos)
		local outside_dist = dist_along_fwd - root_to_align_dist
		dist_along_fwd = math.clamp(outside_dist, 0, dist_along_fwd, influence_dist)
		local d = 1 - math.clamp(dist_along_fwd / influence_dist, 0, 1)

		Debug.text("D %d %.2f total dist: %.2f rdist: %.2f", i, d, Vector3.length(p - root_pos) - root_to_align_dist, root_to_align_dist)

		local straight_to_point = point - p
		local e = 1

		if horiz_influence_dist then
			local horiz_dist = Vector3.length(straight_to_point)
			e = 1 - math.clamp(horiz_dist / horiz_influence_dist, 0, 1)
			e = e * e
			p = point - straight_to_point * (d + e) * 0.5
		else
			p = point - straight_to_point * d
		end

		spline_points[i] = p
	end
end

TentacleSplineExtension.funnel_one_point = function (self, point, wall_pos, root_pos, portal_forward, root_to_align_dist, horiz_influence_dist)
	local influence_dist = 4
	local p = Geometry.closest_point_on_line(point, root_pos, wall_pos + portal_forward * influence_dist)
	local dist_along_fwd = Vector3.length(p - root_pos)
	dist_along_fwd = math.clamp(dist_along_fwd - root_to_align_dist, 0, dist_along_fwd)
	local d = 1 - math.clamp(dist_along_fwd / influence_dist, 0, 1)
	local straight_to_point = point - p
	local e = 1

	if horiz_influence_dist then
		local horiz_dist = Vector3.length(straight_to_point)
		e = 1 - math.clamp(horiz_dist / horiz_influence_dist, 0, 1)
		e = e * e
	end

	p = point - straight_to_point * (d + e) * 0.5

	return p, Vector3.length(straight_to_point)
end

local function get_path_point_from_back(nodes, dist)
	local travel_dist = 0

	for i = #nodes - 1, 1, -1 do
		local p1 = nodes[i + 1]:unbox()
		local p2 = nodes[i]:unbox()
		local vec = p2 - p1
		local p1p2_dist = Vector3.length(vec)
		travel_dist = travel_dist + p1p2_dist

		if dist < travel_dist then
			local missing = travel_dist - dist
			local left_over = p1p2_dist - missing
			local part = left_over / p1p2_dist
			local part_vec = vec * part
			local move_vec = p1 + part_vec

			return move_vec, i
		end
	end

	return path_list[1]:unbox(), 1
end

TentacleSplineExtension.align_tentacle = function (self, template_name, tentacle_data, target_pos, reach_dist, t, dt)
	local spline = tentacle_data.spline
	local portal_forward = Quaternion.forward(Unit.local_rotation(tentacle_data.portal_unit, 0))
	local root_pos = tentacle_data.root_pos:unbox()
	local wall_pos = tentacle_data.wall_pos:unbox()
	local to_player = target_pos - root_pos
	local to_player_dir = Vector3.normalize(to_player)
	local target_dist = Vector3.length(to_player)
	local portal_spawn_type = tentacle_data.portal_spawn_type
	local side = Vector3.cross(to_player_dir, Vector3.up())
	local spline_points = {}
	local lock_point_index = nil
	local k = 0

	if tentacle_data.path_type == "straight" then
		local index_list = index_lists.first_part

		if self.ik_tentacle then
			self.ik_tentacle:set_target_pos(target_pos + Vector3(0, 0, 1), 2)
			self.ik_tentacle:solve(t, dt)

			local joints = self.ik_tentacle.joints

			for i = 1, #joints, 1 do
				spline_points[i] = joints[i]:unbox()
			end

			k = #spline_points
		elseif target_dist < 30 then
			index_list = index_lists.attack_a
			local ampl = 1.5
			local tt = t * 1.5

			if portal_spawn_type == "wall" then
				local d = target_dist
				local base = root_pos + Vector3(0, 0, 0.5)
				spline_points[1] = root_pos
				spline_points[2] = base + to_player_dir * d * 0.1
				spline_points[3] = base + to_player_dir * d * 0.2
				spline_points[4] = base + to_player_dir * d * 0.3
				spline_points[5] = base + to_player_dir * d * 0.4
				spline_points[6] = base + to_player_dir * d * 0.5
				spline_points[7] = base + to_player_dir * d * 0.6
				spline_points[8] = base + to_player_dir * d * 0.7
				spline_points[9] = base + to_player_dir * d * 0.8
				spline_points[10] = base + to_player_dir * d * 0.9
				spline_points[11] = base + to_player_dir * d * 1

				for i = 1, #spline_points, 1 do
					QuickDrawer:sphere(spline_points[i], 0.26, Color(0, 255, 0))
				end
			else
				local Vector3_length = Vector3.length

				local function split(to_point, z_hi, z_low)
					local dist = Vector3_length(to_point)
					local e = math.clamp(dist / 4, 0, 1)

					return Vector3(to_point.x, to_point.y, e * z_hi + (e - 1) * z_low)
				end

				local h = Vector3(0, 0, 1)
				local list = {
					to_player_dir * target_dist * 0.1,
					to_player_dir * target_dist * 0.25 + side * 0.25 * math.sin((tt + 0) * ampl) + Vector3(0, 0, 0.5 + math.sin((tt + 0) * 0.5)) * 0.25,
					to_player_dir * target_dist * 0.5 + side * 0.5 * math.sin((tt + 0.6) * ampl) + Vector3(0, 0, 0.5 + math.sin((tt + 0.1) * 0.5)) * 0.5,
					to_player_dir * target_dist * 0.75 + side * math.sin((tt + 0.9) * ampl * 0.5) + Vector3(0, 0, 0.5 + math.sin((tt + 0.2) * 0.5))
				}
				spline_points[1] = root_pos
				local to_surface = wall_pos - root_pos

				for i = 1, 4, 1 do
					spline_points[i + 1] = root_pos + split(list[i], to_surface.z + 1, 0) + h
				end
			end

			k = 5
			k = #spline_points
		else
			spline_points[1] = root_pos
			spline_points[2] = root_pos + portal_forward * 3
			spline_points[3] = root_pos + to_player_dir * (6 + 1 * math.sin(t * 2)) + Vector3.cross(to_player_dir, Vector3.up()) * 2.5 * math.sin(t * 1.5)
			spline_points[4] = (root_pos + to_player_dir * 8.5) - Vector3.cross(to_player_dir, Vector3.up()) * 0.5 * (0.7 + 0.3 * math.cos(t * 3))
			k = 4
		end

		local to_funnel_index, root_to_align_dist = nil

		if portal_spawn_type == "floor" then
			to_funnel_index = k
			root_to_align_dist = 4

			self:funnel_tentacle_to_center(spline_points, 2, to_funnel_index, wall_pos, root_pos, portal_forward, root_to_align_dist, 3)
		else
			to_funnel_index = k
			root_to_align_dist = 2.5

			self:keep_tentacle_above_ground(self.nav_world, spline_points, 4, index_list)
			self:funnel_tentacle_to_center(spline_points, 2, to_funnel_index, wall_pos, root_pos, portal_forward, root_to_align_dist)
		end

		if template_name == "attack" then
			lock_point_index = TentacleAlignFunctions.attack(self.target_unit, spline_points, k)
		elseif template_name == "launch_out" then
			k = k + 1
			spline_points[k] = target_pos + side * 0.55 + Vector3(0, 0, 2)
		elseif template_name == "evaded" then
			lock_point_index = TentacleAlignFunctions.evaded(self.target_unit, spline_points, k)
		end

		Debug.reset_sticky_world_texts()
	elseif tentacle_data.path_type == "follow_astar" then
		local nodes = tentacle_data.astar_node_list
		local n = tentacle_data.travel_to_node_index
		local pos = target_pos + Vector3(0, 0, 1.3)
		local player_point_index = n + 1

		nodes[player_point_index]:store(pos)

		local travel_node_pos = nodes[n]:unbox()
		local to_travel_node = travel_node_pos - pos
		local travel_dir = Vector3.normalize(to_travel_node)
		local travel_node_dir = tentacle_data.travel_node_dir:unbox()
		local ap, aind, anchor_point_index = nil
		ap, aind = get_path_point_from_back(nodes, a_dist)

		if aind < n then
			anchor_point_index = aind
		end

		local anchor_point_pos = ap
		tentacle_data.look_dir = Vector3Box(Vector3.normalize(anchor_point_pos - pos))
		local anchor_point2_pos = (use_extra_anchor_point and anchor_point_pos - tentacle_data.look_dir:unbox() * 0.2) or nil

		if Vector3.dot(to_travel_node, travel_node_dir) < 0 and n > 1 then
			tentacle_data.travel_node_dir:store(Vector3.normalize(nodes[n - 1]:unbox() - nodes[n]:unbox()))

			tentacle_data.travel_to_node_index = n - 1
			nodes[n] = nodes[n + 1]
			nodes[n + 1] = nil
		end

		spline_points = {}
		local num_nodes = #nodes - 1
		local alpha = (2 * math.pi) / num_nodes

		for i = 1, num_nodes, 1 do
			local pos = nodes[i]:unbox()
			spline_points[i] = pos
		end

		num_nodes = num_nodes + 1

		if anchor_point_index then
			spline_points[anchor_point_index + 1] = anchor_point_pos

			for i = anchor_point_index + 2, #spline_points, 1 do
				spline_points[i] = nil
			end

			num_nodes = anchor_point_index + 1
		else
			spline_points[num_nodes] = anchor_point_pos
		end

		if use_extra_anchor_point then
			num_nodes = num_nodes + 1
			spline_points[num_nodes] = anchor_point2_pos
		end

		if template_name == "attack" then
			lock_point_index = TentacleAlignFunctions.attack(self.target_unit, spline_points, num_nodes)
		end
	end

	local spline = SplineCurve:new(spline_points, "Hermite", "SplineMovementHermiteInterpolatedMetered", "Tentacle", 3)
	self.spline = spline
	tentacle_data.spline = spline
	local lock_point_dist = nil

	if lock_point_index then
		lock_point_dist = spline:get_travel_dist_to_spline_point(lock_point_index) + 2
		self.lock_point_dist = lock_point_dist
		local pos, tangent, is_last = spline:get_point_at_distance(lock_point_dist)
		local pt = pos + Vector3(0, 0, 0.66)

		QuickDrawer:line(pos, pt, Color(255, 128, 0))
		QuickDrawer:sphere(pos, 0.25, Color(200, 128, 0))
	end

	local unit = tentacle_data.unit
	local root_pos = tentacle_data.root_pos:unbox()
	local nodes = tentacle_data.bone_nodes
	local num_nodes = tentacle_data.num_bone_nodes
	local scale = 1
	local parent_pos = root_pos
	local parent_rot = Unit.local_rotation(unit, 0)
	local parent_pose = Matrix4x4.from_quaternion_position(parent_rot, root_pos)
	local spacings = tentacle_data.node_spacings
	local num_spacings = #spacings
	local dist = reach_dist
	local dists = tentacle_data.dists

	for i = num_spacings, 1, -1 do
		dists[i] = dist
		local s = spacings[i]
		dist = dist - s

		if dist < 0 then
			dist = 0
		end
	end

	local alpha = (20 * math.pi) / num_spacings

	for i = 1, num_spacings, 1 do
		local node = nodes[i]
		local pos, tangent, is_last = spline:get_point_at_distance(dists[i])

		if lock_point_index and dists[i] < lock_point_dist - 2 then
			local a = math.sin(t * 6 + alpha * i) * 0.065
			pos = pos + Vector3(a, a, a)
		end

		local wanted_node_rot = Quaternion.look(tangent, Vector3.up())
		local world_pose = Matrix4x4.from_quaternion_position(wanted_node_rot, pos)
		local local_pose = Matrix4x4.multiply(world_pose, Matrix4x4.inverse(parent_pose))

		Unit.set_local_pose(unit, node, local_pose)

		parent_pos = pos
		parent_pose = world_pose
	end
end

return
