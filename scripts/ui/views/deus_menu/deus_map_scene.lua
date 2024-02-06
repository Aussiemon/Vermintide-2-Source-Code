-- chunkname: @scripts/ui/views/deus_menu/deus_map_scene.lua

require("scripts/settings/dlcs/morris/deus_map_visibility_settings")

DeusMapScene = class(DeusMapScene)

local START_NODE_UNIT = "units/morris_map/deus_starting_position_token_01"
local SIG_NODE_UNIT = "units/morris_map/deus_map_base_sig_belakor_01"
local TRAVEL_NODE_UNIT = "units/morris_map/deus_map_base_travel_belakor_01"
local SHRINE_NODE_UNIT = "units/morris_map/deus_map_base_shrine_01"
local ARENA_NODE_UNIT = "units/morris_map/deus_map_base_arena_belakor_01"
local EDGE_UNIT = "units/morris_map/deus_map_symbol_03"
local TOKEN_WH = "units/morris_map/player_token/victor_token"
local TOKEN_BW = "units/morris_map/player_token/sienna_token"
local TOKEN_DR = "units/morris_map/player_token/bardin_token"
local TOKEN_WE = "units/morris_map/player_token/kerillian_token"
local TOKEN_ES = "units/morris_map/player_token/markus_token"
local VISIBILITY_LEVEL_MAP = {
	[DeusMapVisibilitySettings.WEAK_FOG_LEVEL] = 0,
	[DeusMapVisibilitySettings.WEAK_FOG_LEVEL + 1] = 0.333,
	[DeusMapVisibilitySettings.WEAK_FOG_LEVEL + 2] = 0.666,
	[DeusMapVisibilitySettings.WEAK_FOG_LEVEL + 3] = 1,
}
local FINAL_HOLE_RADIUS = 0.2
local HOLE_RADIUS = 0.15
local BORDER_INSET_U = 0.05
local BORDER_INSET_V = 0.1
local FOG_U_OFFSET = 0.015
local FOG_V_OFFSET = -0.01
local DEBUG_RAYCASTS = false
local DEBUG_FOG_MESH = false

local function setup_scene()
	local world = Application.main_world()
	local physics_world = World.physics_world(world)
	local level = LevelHelper:current_level(world)
	local viewports = World.get_data(world, "viewports")
	local _, viewport = next(viewports)
	local wwise_world = Managers.world:wwise_world(world)
	local ref_camera_unit = Level.flow_variable(level, "initial_camera")
	local ref_camera_pose = Unit.local_pose(ref_camera_unit, 0)
	local ref_camera = Unit.camera(ref_camera_unit, "camera")
	local camera = ScriptViewport.camera(viewport)
	local fov = Camera.vertical_fov(ref_camera)

	Camera.set_vertical_fov(camera, fov)
	ScriptCamera.set_local_pose(camera, ref_camera_pose)
	ScriptCamera.force_update(world, camera)
	ScriptWorld.activate_viewport(world, viewport)

	return world, physics_world, camera, fov, level
end

local function random_z_offset_to_fix_z_fighting()
	return math.random() * 0.002 - 0.001
end

local function get_level_ref_values(level)
	local bottom_left_unit = Level.flow_variable(level, "map_bottom_left")
	local bottom_right_unit = Level.flow_variable(level, "map_bottom_right")
	local top_left_unit = Level.flow_variable(level, "map_top_left")
	local fog_bottom_left_unit = Level.flow_variable(level, "fog_bottom_left")
	local fog_bottom_right_unit = Level.flow_variable(level, "fog_bottom_right")
	local fog_top_left_unit = Level.flow_variable(level, "fog_top_left")
	local ref_a_node_from = Level.flow_variable(level, "ref_a_node_from")
	local ref_a_edge = Level.flow_variable(level, "ref_a_edge")
	local ref_a_node_to = Level.flow_variable(level, "ref_a_node_to")
	local ref_b_node_from = Level.flow_variable(level, "ref_b_node_from")
	local ref_b_edge = Level.flow_variable(level, "ref_b_edge")
	local ref_b_node_to = Level.flow_variable(level, "ref_b_node_to")
	local ref_token_1 = Level.flow_variable(level, "ref_token_1")
	local ref_token_2 = Level.flow_variable(level, "ref_token_2")
	local ref_token_3 = Level.flow_variable(level, "ref_token_3")
	local ref_token_4 = Level.flow_variable(level, "ref_token_4")
	local ref_token_node = Level.flow_variable(level, "ref_token_node")
	local camera_bottom_left = Level.flow_variable(level, "base_camera_bottom_left")
	local camera_top_right = Level.flow_variable(level, "base_camera_top_right")
	local camera_zoom_bottom_left = Level.flow_variable(level, "zoom_camera_bottom_left")
	local camera_zoom_top_right = Level.flow_variable(level, "zoom_camera_top_right")
	local token_node_pose = Unit.local_pose(ref_token_node, 0)
	local inverse_token_node_pose = Matrix4x4.inverse(token_node_pose)
	local token_1_pose = Unit.local_pose(ref_token_1, 0)
	local token_2_pose = Unit.local_pose(ref_token_2, 0)
	local token_3_pose = Unit.local_pose(ref_token_3, 0)
	local token_4_pose = Unit.local_pose(ref_token_4, 0)
	local referenced_token_1_pose = Matrix4x4.multiply(token_1_pose, inverse_token_node_pose)
	local referenced_token_2_pose = Matrix4x4.multiply(token_2_pose, inverse_token_node_pose)
	local referenced_token_3_pose = Matrix4x4.multiply(token_3_pose, inverse_token_node_pose)
	local referenced_token_4_pose = Matrix4x4.multiply(token_4_pose, inverse_token_node_pose)
	local data = {
		map_bottom_left_pos = Vector3Box(Unit.local_position(bottom_left_unit, 0)),
		map_bottom_right_pos = Vector3Box(Unit.local_position(bottom_right_unit, 0)),
		map_top_left_pos = Vector3Box(Unit.local_position(top_left_unit, 0)),
		fog_bottom_left_pos = Vector3Box(Unit.local_position(fog_bottom_left_unit, 0)),
		fog_bottom_right_pos = Vector3Box(Unit.local_position(fog_bottom_right_unit, 0)),
		fog_top_left_pos = Vector3Box(Unit.local_position(fog_top_left_unit, 0)),
		referenced_token_poses = {
			Matrix4x4Box(referenced_token_1_pose),
			Matrix4x4Box(referenced_token_2_pose),
			Matrix4x4Box(referenced_token_3_pose),
			(Matrix4x4Box(referenced_token_4_pose)),
		},
		camera_zoom_bottom_left_pose = Matrix4x4Box(Unit.local_pose(camera_zoom_bottom_left, 0)),
		camera_zoom_top_right_pose = Matrix4x4Box(Unit.local_pose(camera_zoom_top_right, 0)),
		camera_bottom_left_pose = Matrix4x4Box(Unit.local_pose(camera_bottom_left, 0)),
		camera_top_right_pose = Matrix4x4Box(Unit.local_pose(camera_top_right, 0)),
		ref_a_node_from_pos = Vector3Box(Unit.local_position(ref_a_node_from, 0)),
		ref_a_node_to_pos = Vector3Box(Unit.local_position(ref_a_node_to, 0)),
		ref_a_edge_pos = Vector3Box(Unit.local_position(ref_a_edge, 0)),
		ref_a_edge_scale = Vector3Box(Unit.local_scale(ref_a_edge, 0)),
		ref_b_node_from_pos = Vector3Box(Unit.local_position(ref_b_node_from, 0)),
		ref_b_node_to_pos = Vector3Box(Unit.local_position(ref_b_node_to, 0)),
		ref_b_edge_pos = Vector3Box(Unit.local_position(ref_b_edge, 0)),
		ref_b_edge_scale = Vector3Box(Unit.local_scale(ref_b_edge, 0)),
	}

	Unit.disable_physics(ref_a_node_from)
	Unit.disable_physics(ref_a_edge)
	Unit.disable_physics(ref_a_node_to)
	Unit.disable_physics(ref_b_node_from)
	Unit.disable_physics(ref_b_edge)
	Unit.disable_physics(ref_b_node_to)
	Unit.disable_physics(ref_token_1)
	Unit.disable_physics(ref_token_2)
	Unit.disable_physics(ref_token_3)
	Unit.disable_physics(ref_token_4)
	Unit.disable_physics(ref_token_node)
	Unit.set_unit_visibility(ref_a_node_from, false)
	Unit.set_unit_visibility(ref_a_edge, false)
	Unit.set_unit_visibility(ref_a_node_to, false)
	Unit.set_unit_visibility(ref_b_node_from, false)
	Unit.set_unit_visibility(ref_b_edge, false)
	Unit.set_unit_visibility(ref_b_node_to, false)
	Unit.set_unit_visibility(ref_token_1, false)
	Unit.set_unit_visibility(ref_token_2, false)
	Unit.set_unit_visibility(ref_token_3, false)
	Unit.set_unit_visibility(ref_token_4, false)
	Unit.set_unit_visibility(ref_token_node, false)

	return data
end

local function spawn_graph_units(world, level_ref_values, graph)
	local map_bottom_left_pos = level_ref_values.map_bottom_left_pos:unbox()
	local map_bottom_right_pos = level_ref_values.map_bottom_right_pos:unbox()
	local map_top_left_pos = level_ref_values.map_top_left_pos:unbox()
	local ref_a_node_from_pos = level_ref_values.ref_a_node_from_pos:unbox()
	local ref_a_node_to_pos = level_ref_values.ref_a_node_to_pos:unbox()
	local ref_a_edge_pos = level_ref_values.ref_a_edge_pos:unbox()
	local ref_a_edge_scale = level_ref_values.ref_a_edge_scale:unbox()
	local ref_b_node_from_pos = level_ref_values.ref_b_node_from_pos:unbox()
	local ref_b_node_to_pos = level_ref_values.ref_b_node_to_pos:unbox()
	local ref_b_edge_pos = level_ref_values.ref_b_edge_pos:unbox()
	local ref_b_edge_scale = level_ref_values.ref_b_edge_scale:unbox()
	local node_to_units = {}
	local edges_to_units = {}
	local positions = {}
	local bottom_vector = map_bottom_right_pos - map_bottom_left_pos
	local left_vector = map_top_left_pos - map_bottom_left_pos

	for key, node in pairs(graph) do
		local bottom_part = bottom_vector * node.layout_x
		local left_part = left_vector * node.layout_y
		local pos = map_bottom_left_pos + (bottom_part + left_part)

		pos.z = pos.z + random_z_offset_to_fix_z_fighting()
		positions[key] = pos
	end

	local distance_a_squared = Vector3.length_squared(ref_a_node_to_pos - ref_a_node_from_pos)
	local distance_b_squared = Vector3.length_squared(ref_b_node_to_pos - ref_b_node_from_pos)
	local distance_to_edge_a_squared = Vector3.length_squared(ref_a_edge_pos - ref_a_node_from_pos)
	local distance_to_edge_b_squared = Vector3.length_squared(ref_b_edge_pos - ref_b_node_from_pos)

	for key, node in pairs(graph) do
		local level_name = node.level
		local node_unit_name

		if key == "start" then
			node_unit_name = START_NODE_UNIT
		else
			local prefix = string.sub(level_name, 1, string.find(level_name, "_") - 1)

			if prefix == "sig" then
				node_unit_name = SIG_NODE_UNIT
			elseif prefix == "pat" then
				node_unit_name = TRAVEL_NODE_UNIT
			elseif prefix == "arena" then
				node_unit_name = ARENA_NODE_UNIT
			else
				node_unit_name = SHRINE_NODE_UNIT
			end
		end

		local pos = positions[key]
		local node_unit = World.spawn_unit(world, node_unit_name, pos)

		node_to_units[key] = node_unit

		Unit.set_data(node_unit, "deus_node_key", key)
		Unit.set_data(node_unit, "theme", node.theme)
		Unit.set_data(node_unit, "level", node.base_level)

		edges_to_units[key] = {}

		for _, next in pairs(node.next) do
			local next_pos = positions[next]
			local between_nodes_vector = next_pos - pos
			local edge_unit = World.spawn_unit(world, EDGE_UNIT)

			edges_to_units[key][next] = edge_unit

			local direction = Vector3.normalize(between_nodes_vector)
			local rotation = Quaternion.look(direction, Vector3.up())

			Unit.set_local_rotation(edge_unit, 0, rotation)

			local new_distance_squared = Vector3.length_squared(next_pos - pos)
			local lerp_ratio = (new_distance_squared - distance_a_squared) / (distance_b_squared - distance_a_squared)
			local distance_to_edge_squared = math.lerp(distance_to_edge_a_squared, distance_to_edge_b_squared, lerp_ratio)
			local distance_to_edge = distance_to_edge_squared >= 0 and math.sqrt(distance_to_edge_squared) or 0
			local edge_pos = pos + direction * distance_to_edge

			edge_pos.z = edge_pos.z + random_z_offset_to_fix_z_fighting()

			Unit.set_local_position(edge_unit, 0, edge_pos)

			local new_scale = math.lerp(ref_a_edge_scale, ref_b_edge_scale, lerp_ratio)

			Unit.set_local_scale(edge_unit, 0, new_scale)
			Unit.set_data(edge_unit, "highlighted", false)
			Unit.flow_event(edge_unit, "update_visuals")
		end

		Unit.flow_event(node_unit, "update_visuals")
	end

	local token_wh = World.spawn_unit(world, TOKEN_WH)
	local token_bw = World.spawn_unit(world, TOKEN_BW)
	local token_dr = World.spawn_unit(world, TOKEN_DR)
	local token_we = World.spawn_unit(world, TOKEN_WE)
	local token_es = World.spawn_unit(world, TOKEN_ES)
	local profile_index_to_token = {
		token_wh,
		token_bw,
		token_dr,
		token_we,
		token_es,
	}

	return node_to_units, edges_to_units, profile_index_to_token
end

local function apply_visibility_to_units(nodes_to_units, edges_to_units, visibility_data)
	for node_key, level in pairs(visibility_data) do
		local unit = nodes_to_units[node_key]

		Unit.set_data(unit, "visibility_level", level)
		Unit.flow_event(unit, "update_visuals")

		for _, edge_unit in pairs(edges_to_units[node_key]) do
			Unit.set_data(edge_unit, "visibility_level", level)
		end
	end
end

local function setup_fog_plane(world, level_ref_values, graph_data, visibility_data, debug_drawer)
	local map_bottom_left_pos = level_ref_values.map_bottom_left_pos:unbox()
	local map_bottom_right_pos = level_ref_values.map_bottom_right_pos:unbox()
	local map_top_left_pos = level_ref_values.map_top_left_pos:unbox()
	local fog_bottom_left_pos = level_ref_values.fog_bottom_left_pos:unbox()
	local fog_bottom_right_pos = level_ref_values.fog_bottom_right_pos:unbox()
	local fog_top_left_pos = level_ref_values.fog_top_left_pos:unbox()
	local bottom_fog_vector = fog_bottom_right_pos - fog_bottom_left_pos
	local bottom_vector = map_bottom_right_pos - map_bottom_left_pos
	local left_fog_vector = fog_top_left_pos - fog_bottom_left_pos
	local left_vector = map_top_left_pos - map_bottom_left_pos
	local uv_scale = Vector2(bottom_vector.x / bottom_fog_vector.x, left_vector.y / left_fog_vector.y)
	local bottom_left_vector = map_bottom_left_pos - fog_bottom_left_pos
	local uv_offset = Vector2(bottom_left_vector.x / bottom_fog_vector.x, bottom_left_vector.y / left_fog_vector.y)
	local w, h = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h

	local function transform_uv(u, v)
		return u * uv_scale.x + uv_offset.x + FOG_U_OFFSET, v * uv_scale.y + uv_offset.y + FOG_V_OFFSET
	end

	local gui = World.create_screen_gui(world, "material", "materials/deus_map_fog_mask/deus_map_fog_mask", "immediate")
	local width_ratio = Vector3.length(bottom_fog_vector) / Vector3.length(left_fog_vector)

	Gui.bitmap(gui, "default_deus_map_fog_mask_clear", Vector3(0, 0, 0), Vector2(w, h), Color(255, 0, 0, 0))

	local function draw_triangle(material, from_multiplier, to_multiplier, x1, y1, x2, y2, x3, y3, u1, v1, u2, v2, u3, v3)
		Gui.triangle(gui, Vector3(x1, 0, y1), Vector3(x2, 0, y2), Vector3(x3, 0, y3), 0, Color(255, from_multiplier * 255, to_multiplier * 255, 255), material, Vector2(u1, v1), Vector2(u2, v2), Vector2(u3, v3))
	end

	local function draw_quad(material, from_multiplier, to_multiplier, x1, y1, x2, y2, x3, y3, x4, y4, u1, v1, u2, v2, u3, v3, u4, v4)
		draw_triangle(material, from_multiplier, to_multiplier, x1, y1, x2, y2, x3, y3, u1, v1, u2, v2, u3, v3)
		draw_triangle(material, from_multiplier, to_multiplier, x3, y3, x4, y4, x1, y1, u3, v3, u4, v4, u1, v1)
	end

	local function draw_edge(start_node_key, end_node_key)
		local start_alpha = VISIBILITY_LEVEL_MAP[visibility_data[start_node_key]]
		local end_alpha = VISIBILITY_LEVEL_MAP[visibility_data[end_node_key]]
		local start_node = graph_data[start_node_key]
		local end_node = graph_data[end_node_key]
		local start_layout_x, start_layout_y = transform_uv(start_node.layout_x, start_node.layout_y)

		start_layout_x = start_layout_x * w
		start_layout_y = start_layout_y * h

		local end_layout_x, end_layout_y = transform_uv(end_node.layout_x, end_node.layout_y)

		end_layout_x = end_layout_x * w
		end_layout_y = end_layout_y * h

		local vector_x = end_layout_x - start_layout_x
		local vector_y = end_layout_y - start_layout_y
		local distance = math.sqrt(vector_x * vector_x + vector_y * vector_y)
		local unit_vector_x = vector_x / distance
		local unit_vector_y = vector_y / distance
		local hole_radius = start_node_key == "final" and FINAL_HOLE_RADIUS or HOLE_RADIUS
		local hole_width = hole_radius * w
		local hole_height = hole_radius * width_ratio * h
		local start_a_x = start_layout_x + unit_vector_y * hole_width
		local start_a_y = start_layout_y - unit_vector_x * hole_height
		local start_b_x = start_layout_x - unit_vector_y * hole_width
		local start_b_y = start_layout_y + unit_vector_x * hole_height
		local end_a_x = end_layout_x + unit_vector_y * hole_width
		local end_a_y = end_layout_y - unit_vector_x * hole_height
		local end_b_x = end_layout_x - unit_vector_y * hole_width
		local end_b_y = end_layout_y + unit_vector_x * hole_height

		draw_quad("default_deus_map_fog_mask_edge", start_alpha, end_alpha, end_a_x, end_a_y, start_a_x, start_a_y, start_b_x, start_b_y, end_b_x, end_b_y, 1, 0, 0, 0, 0, 1, 1, 1)
	end

	local function draw_node(node_key)
		local alpha = VISIBILITY_LEVEL_MAP[visibility_data[node_key]]
		local node = graph_data[node_key]
		local layout_x, layout_y = transform_uv(node.layout_x, node.layout_y)

		layout_x = layout_x * w
		layout_y = layout_y * h

		local hole_radius = node_key == "final" and FINAL_HOLE_RADIUS or HOLE_RADIUS
		local hole_width = hole_radius * w
		local hole_height = hole_radius * width_ratio * h
		local start_a_x = layout_x - hole_width
		local start_a_y = layout_y - hole_height
		local start_b_x = layout_x + hole_width
		local start_b_y = layout_y - hole_height
		local end_a_x = layout_x - hole_width
		local end_a_y = layout_y + hole_height
		local end_b_x = layout_x + hole_width
		local end_b_y = layout_y + hole_height

		draw_quad("default_deus_map_fog_mask_node", alpha, alpha, end_a_x, end_a_y, start_a_x, start_a_y, start_b_x, start_b_y, end_b_x, end_b_y, 1, 0, 0, 0, 0, 1, 1, 1)
	end

	local function draw_fog_from(node_key)
		local node = graph_data[node_key]

		draw_node(node_key)

		for _, next_node_key in ipairs(node.next) do
			draw_edge(node_key, next_node_key)
			draw_fog_from(next_node_key)
		end
	end

	draw_fog_from("start")

	local start_layout_x, _ = transform_uv(graph_data.start.layout_x, graph_data.start.layout_y)
	local ab2_x, ab2_y = 0, 1
	local ab1_x, ab1_y = 0, 1 - BORDER_INSET_V
	local ab4_x, ab4_y = start_layout_x, 1
	local ab3_x, ab3_y = start_layout_x, 1 - BORDER_INSET_V
	local aa2_x, aa2_y = 0, BORDER_INSET_V
	local aa1_x, aa1_y = 0, 0
	local aa4_x, aa4_y = start_layout_x, BORDER_INSET_V
	local aa3_x, aa3_y = start_layout_x, 0
	local ba2_x, ba2_y = 1 - BORDER_INSET_U, BORDER_INSET_V
	local ba1_x, ba1_y = 1 - BORDER_INSET_U, 0
	local ba4_x, ba4_y = 1, BORDER_INSET_V
	local ba3_x, ba3_y = 1, 0
	local bb2_x, bb2_y = 1 - BORDER_INSET_U, 1
	local bb1_x, bb1_y = 1 - BORDER_INSET_U, 1 - BORDER_INSET_V
	local bb4_x, bb4_y = 1, 1
	local bb3_x, bb3_y = 1, 1 - BORDER_INSET_V

	draw_quad("default_deus_map_fog_mask_border", 1, 0, ab1_x * w, ab1_y * h, aa2_x * w, aa2_y * h, aa4_x * w, aa4_y * h, ab3_x * w, ab3_y * h, 0, 0, 0, 0, 1, 0, 1, 0)
	draw_quad("default_deus_map_fog_mask_border", 1, 0, ab1_x * w, ab1_y * h, ab3_x * w, ab3_y * h, ab4_x * w, ab4_y * h, ab2_x * w, ab2_y * h, 0, 0, 1, 0, 0, 0, 0, 0)
	draw_quad("default_deus_map_fog_mask_border", 1, 0, ab3_x * w, ab3_y * h, bb1_x * w, bb1_y * h, bb2_x * w, bb2_y * h, ab4_x * w, ab4_y * h, 1, 0, 1, 0, 0, 0, 0, 0)
	draw_quad("default_deus_map_fog_mask_border", 1, 0, bb1_x * w, bb1_y * h, bb3_x * w, bb3_y * h, bb4_x * w, bb4_y * h, bb2_x * w, bb2_y * h, 1, 0, 0, 0, 0, 0, 0, 0)
	draw_quad("default_deus_map_fog_mask_border", 1, 0, bb1_x * w, bb1_y * h, ba2_x * w, ba2_y * h, ba4_x * w, ba4_y * h, bb3_x * w, bb3_y * h, 1, 0, 1, 0, 0, 0, 0, 0)
	draw_quad("default_deus_map_fog_mask_border", 1, 0, ba1_x * w, ba1_y * h, ba3_x * w, ba3_y * h, ba4_x * w, ba4_y * h, ba2_x * w, ba2_y * h, 0, 0, 0, 0, 0, 0, 1, 0)
	draw_quad("default_deus_map_fog_mask_border", 1, 0, aa4_x * w, aa4_y * h, aa3_x * w, aa3_y * h, ba1_x * w, ba1_y * h, ba2_x * w, ba2_y * h, 1, 0, 0, 0, 0, 0, 1, 0)
	draw_quad("default_deus_map_fog_mask_border", 1, 0, aa1_x * w, aa1_y * h, aa3_x * w, aa3_y * h, aa4_x * w, aa4_y * h, aa2_x * w, aa2_y * h, 0, 0, 0, 0, 1, 0, 0, 0)
end

local function raycast_screen(camera, physics_world, screen_position, result_type, range, collision_filter, debug_drawer)
	local position = Camera.screen_to_world(camera, screen_position, 0)
	local direction = Camera.screen_to_world(camera, Vector3(screen_position.x, screen_position.y, 0), 1) - position
	local raycast_dir = Vector3.normalize(direction)

	return PhysicsWorld.immediate_raycast(physics_world, position, raycast_dir, range, result_type, "types", "statics", "collision_filter", collision_filter)
end

local function get_interpolated_camera_pose(bottom_left_pose, top_right_pose, x, y)
	local translation_bottom_left = Matrix4x4.translation(bottom_left_pose)
	local translation_top_right = Matrix4x4.translation(top_right_pose)
	local rotation_bottom_left = Matrix4x4.rotation(bottom_left_pose)
	local rotation_top_right = Matrix4x4.rotation(top_right_pose)
	local lerp_z = (x + y) / math.sqrt(2)
	local new_translation = Vector3(math.lerp(translation_bottom_left[1], translation_top_right[1], x), math.lerp(translation_bottom_left[2], translation_top_right[2], y), math.lerp(translation_bottom_left[3], translation_top_right[3], lerp_z))
	local new_rotation = Quaternion.lerp(rotation_bottom_left, rotation_top_right, lerp_z)
	local new_pose = Matrix4x4.from_quaternion_position(new_rotation, new_translation)

	return new_pose
end

local function animate_camera(camera, fov, source_pose, target_pose, start_time, end_time, time)
	local progress
	local interpolation_time = end_time - start_time

	if interpolation_time <= 0.001 then
		progress = 1
	else
		progress = math.clamp((time - start_time) / interpolation_time, 0, 1)
		progress = (3 - 2 * progress) * progress^2
	end

	local new_pose = Matrix4x4.lerp(source_pose, target_pose, progress)

	ScriptCamera.set_local_pose(camera, new_pose)
	Camera.set_vertical_fov(camera, fov)
end

local function set_camera_pose(camera, fov, pose)
	ScriptCamera.set_local_pose(camera, pose)
	Camera.set_vertical_fov(camera, fov)
end

local STATES = {
	active = "active",
	initialized = "initialized",
	paused = "paused",
}

DeusMapScene.init = function (self)
	self._state = STATES.initialized
end

DeusMapScene.on_enter = function (self, graph_data, input_service, node_pressed_cb, node_hovered_cb, node_unhovered_cb)
	self:_clear()

	self._state = STATES.active
	self._world, self._physics_world, self._camera, self._fov, self._level = setup_scene()
	self._selected_unit = nil
	self._cursor_update_enabled = true
	self._input_service = input_service
	self._node_pressed_cb = node_pressed_cb
	self._node_hovered_cb = node_hovered_cb
	self._node_unhovered_cb = node_unhovered_cb
	self._level_ref_values = get_level_ref_values(self._level)
	self._graph_data = graph_data
	self._nodes_to_units, self._edges_to_units, self._profile_index_to_token = spawn_graph_units(self._world, self._level_ref_values, graph_data)

	for profile_index, _ in pairs(self._profile_index_to_token) do
		self:_hide_token(profile_index)
	end

	self._event_manager = Managers.state.event

	self._event_manager:register(self, "on_game_options_changed", "_on_game_options_changed")
end

DeusMapScene.on_finish = function (self)
	if self._hovered_node_key then
		self._node_unhovered_cb()

		self._hovered_node_key = nil
	end

	self._cursor_update_enabled = false

	self._event_manager:unregister("on_game_options_changed", self)

	self._event_manager = nil
end

DeusMapScene.update = function (self, dt, t, gamepad_active)
	local should_regenerate_fog = RESOLUTION_LOOKUP.modified or self._game_options_changed

	if should_regenerate_fog and self._last_visibility_data then
		self:setup_fog(self._last_visibility_data)
	end

	self._game_options_changed = false

	if self._state == STATES.active and self._cursor_update_enabled then
		self:_update_cursor(gamepad_active)
	end
end

DeusMapScene.post_update = function (self, dt, t)
	if self._state ~= STATES.initialized then
		self:_update_camera(t)
	end
end

DeusMapScene.destroy = function (self)
	self:_clear()

	if self._event_manager then
		self._event_manager:unregister("on_game_options_changed", self)

		self._event_manager = nil
	end
end

DeusMapScene._clear = function (self)
	self._node_pressed_cb = nil
	self._node_hovered_cb = nil
	self._node_unhovered_cb = nil

	if self._nodes_to_units then
		for _, unit in pairs(self._nodes_to_units) do
			World.destroy_unit(self._world, unit)
		end
	end

	if self._profile_index_to_token then
		for _, unit in pairs(self._profile_index_to_token) do
			World.destroy_unit(self._world, unit)
		end
	end

	if self._edges_to_units then
		for _, other_units in pairs(self._edges_to_units) do
			for _, unit in pairs(other_units) do
				World.destroy_unit(self._world, unit)
			end
		end
	end

	self._profile_index_to_token = nil
	self._nodes_to_units = nil
	self._edges_to_units = nil
	self._own_hero_name = nil
end

DeusMapScene._update_camera = function (self, t)
	if not self._camera_animation_start_time then
		self._camera_animation_start_time = t
		self._camera_animation_end_time = t + self._camera_animation_duration
	end

	local camera = self._camera

	animate_camera(camera, self._fov, self._camera_source_pose:unbox(), self._camera_target_pose:unbox(), self._camera_animation_start_time, self._camera_animation_end_time, t)
	ScriptCamera.force_update(self._world, camera)
end

local NilCursor = {
	0,
	0,
	0,
}

DeusMapScene._update_cursor = function (self, gamepad_active)
	local cursor = self._input_service:get("cursor") or NilCursor
	local cursor_position

	if IS_XB1 and not gamepad_active then
		cursor_position = UIScaleVectorToResolution(Vector3(cursor[1], 1080 - cursor[2], cursor[3]))
	elseif gamepad_active then
		cursor_position = UIScaleVectorToResolution(cursor)
	else
		cursor_position = cursor
	end

	local raycast, _, _, _, actor = raycast_screen(self._camera, self._physics_world, cursor_position, "closest", 3, "filter_deus_map_node_click", self._debug_drawer_stay)
	local node_key_under_cursor

	if raycast then
		local unit_under_cursor = Actor.unit(actor)

		node_key_under_cursor = Unit.get_data(unit_under_cursor, "deus_node_key")
	end

	if node_key_under_cursor then
		if self._selectables and (self._input_service:get("confirm_press") or self._input_service:get("left_press")) and table.contains(self._selectables, node_key_under_cursor) then
			self._node_pressed_cb(node_key_under_cursor)
		end

		if self._hovered_node_key ~= node_key_under_cursor then
			if self._hovered_node_key then
				self._node_unhovered_cb()
			end

			self._hovered_node_key = node_key_under_cursor

			self._node_hovered_cb(node_key_under_cursor)
		end

		if gamepad_active then
			Managers.input:set_hovering(true)
		end
	elseif self._hovered_node_key then
		self._node_unhovered_cb()

		self._hovered_node_key = nil
	end
end

DeusMapScene.setup_fog = function (self, visibility_data)
	self._last_visibility_data = visibility_data

	setup_fog_plane(self._world, self._level_ref_values, self._graph_data, self._last_visibility_data, self._debug_drawer)
	apply_visibility_to_units(self._nodes_to_units, self._edges_to_units, self._last_visibility_data)
end

DeusMapScene._on_game_options_changed = function (self)
	self._game_options_changed = true
end

DeusMapScene.animate_camera_to = function (self, x, y, duration)
	self._started_once = true
	self._camera_animation_duration = duration
	self._camera_animation_start_time = nil
	self._camera_animation_end_time = nil
	self._camera_source_pose = Matrix4x4Box(ScriptCamera.pose(self._camera))

	local bottom_left_pose = self._level_ref_values.camera_bottom_left_pose:unbox()
	local top_right_pose = self._level_ref_values.camera_top_right_pose:unbox()

	self._camera_target_pose = Matrix4x4Box(get_interpolated_camera_pose(bottom_left_pose, top_right_pose, x, y))
end

DeusMapScene.zoom_camera_to = function (self, x, y, duration)
	self._started_once = true
	self._camera_animation_duration = duration
	self._camera_animation_start_time = nil
	self._camera_animation_end_time = nil
	self._camera_source_pose = Matrix4x4Box(ScriptCamera.pose(self._camera))

	local bottom_left_pose = self._level_ref_values.camera_zoom_bottom_left_pose:unbox()
	local top_right_pose = self._level_ref_values.camera_zoom_top_right_pose:unbox()

	self._camera_target_pose = Matrix4x4Box(get_interpolated_camera_pose(bottom_left_pose, top_right_pose, x, y))
end

DeusMapScene.set_zoomed_camera_to = function (self, x, y)
	local bottom_left_pose = self._level_ref_values.camera_zoom_bottom_left_pose:unbox()
	local top_right_pose = self._level_ref_values.camera_zoom_top_right_pose:unbox()
	local pose = get_interpolated_camera_pose(bottom_left_pose, top_right_pose, x, y)

	set_camera_pose(self._camera, self._fov, pose)
end

DeusMapScene.place_token = function (self, profile_index, slot, node_key)
	self:_place_token(profile_index, slot, node_key)
end

DeusMapScene.hide_token = function (self, profile_index)
	self:_hide_token(profile_index)
end

DeusMapScene.set_own_hero_name = function (self, hero_name)
	if self._own_hero_name ~= hero_name then
		for _, node_unit in pairs(self._nodes_to_units) do
			Unit.set_data(node_unit, "hero_name", hero_name)
			Unit.flow_event(node_unit, "update_visuals")
		end
	end

	self._own_hero_name = hero_name
end

DeusMapScene.undiscover_node = function (self, node_key)
	local unit = self._nodes_to_units[node_key]

	Unit.set_data(unit, "discovered", false)
	Unit.flow_event(unit, "update_visuals")
end

DeusMapScene.discover_node = function (self, node_key)
	local unit = self._nodes_to_units[node_key]

	Unit.set_data(unit, "discovered", true)
	Unit.flow_event(unit, "update_visuals")
end

DeusMapScene.selectable_node = function (self, node_key)
	local unit = self._nodes_to_units[node_key]

	Unit.set_data(unit, "selectable", true)
	Unit.flow_event(unit, "update_visuals")

	self._selectables = self._selectables or {}

	for _, selectable in ipairs(self._selectables) do
		if selectable == node_key then
			return
		end
	end

	self._selectables[#self._selectables + 1] = node_key
end

DeusMapScene.unselectable_node = function (self, node_key)
	local unit = self._nodes_to_units[node_key]

	Unit.set_data(unit, "selectable", false)
	Unit.flow_event(unit, "update_visuals")

	if self._selectables then
		local index = table.index_of(self._selectables, node_key)

		if index ~= -1 then
			table.swap_delete(self._selectables, index)
		end
	end
end

DeusMapScene.untraversed_node = function (self, node_key)
	local unit = self._nodes_to_units[node_key]

	Unit.set_data(unit, "traversed", false)
	Unit.flow_event(unit, "update_visuals")
end

DeusMapScene.traversed_node = function (self, node_key)
	local unit = self._nodes_to_units[node_key]

	Unit.set_data(unit, "traversed", true)
	Unit.flow_event(unit, "update_visuals")
end

DeusMapScene.unreachable_node = function (self, node_key)
	local unit = self._nodes_to_units[node_key]

	Unit.set_data(unit, "unreachable", true)
	Unit.flow_event(unit, "update_visuals")
end

DeusMapScene.select_node = function (self, node_key, sound_event)
	local unit = self._nodes_to_units[node_key]

	Unit.set_data(unit, "selected", true)
	Unit.flow_event(unit, "update_visuals")

	if sound_event and Managers.state.network:game() then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_2d_audio_event(sound_event)
	end
end

DeusMapScene.unselect_node = function (self, node_key)
	local unit = self._nodes_to_units[node_key]

	Unit.set_data(unit, "selected", false)
	Unit.flow_event(unit, "update_visuals")
end

DeusMapScene.set_final_node = function (self, node_key)
	local unit = self._nodes_to_units[node_key]

	Unit.set_data(unit, "selected", true)
	Unit.set_data(unit, "selectable", true)
	Unit.flow_event(unit, "update_visuals")
end

DeusMapScene.highlight_edge = function (self, from, to)
	local unit = self._edges_to_units[from][to]

	if not unit then
		local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()
		local traversed_nodes = deus_run_controller:get_traversed_nodes()
		local graph_data = deus_run_controller:get_graph_data()

		printf("self._edges_to_units:%s\ntraversed_nodes:%s\ngraph:%s", table.tostring(self._edges_to_units), table.tostring(traversed_nodes), table.tostring(graph_data, 2))
		ferror("[DeusMapScene] edge from<%s> to<%s> doesn't exist!", from, to)
	end

	Unit.set_data(unit, "highlighted", true)
	Unit.flow_event(unit, "update_visuals")
end

DeusMapScene.unhighlight_edge = function (self, from, to)
	local unit = self._edges_to_units[from][to]

	if not unit then
		local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()
		local traversed_nodes = deus_run_controller:get_traversed_nodes()
		local graph_data = deus_run_controller:get_graph_data()

		printf("self._edges_to_units:%s\ntraversed_nodes:%s\ngraph:%s", table.tostring(self._edges_to_units), table.tostring(traversed_nodes), table.tostring(graph_data, 2))
		ferror("[DeusMapScene] edge from<%s> to<%s> doesn't exist!", from, to)
	end

	Unit.set_data(unit, "highlighted", false)
	Unit.flow_event(unit, "update_visuals")
end

DeusMapScene.hover_node = function (self, node)
	local unit = self._nodes_to_units[node]

	Unit.set_data(unit, "hovered", true)
	Unit.flow_event(unit, "update_visuals")
end

DeusMapScene.unhover_node = function (self, node)
	local unit = self._nodes_to_units[node]

	Unit.set_data(unit, "hovered", false)
	Unit.flow_event(unit, "update_visuals")
end

DeusMapScene.get_screen_pos_of_node = function (self, node_key)
	local unit = self._nodes_to_units[node_key]

	return Camera.world_to_screen(self._camera, Unit.local_position(unit, 0))
end

DeusMapScene.animate_arena_belakor_node = function (self, node_key)
	local unit = self._nodes_to_units[node_key]

	Unit.flow_event(unit, "first_time_seeing_arena_belakor_node")
end

DeusMapScene._place_token = function (self, profile_index, slot, node_key)
	local token = self._profile_index_to_token[profile_index]
	local node = self._nodes_to_units[node_key]
	local referenced_token_pose = self._level_ref_values.referenced_token_poses[slot]
	local pose = Matrix4x4.multiply(Unit.local_pose(node, 0), referenced_token_pose:unbox())

	Unit.set_unit_visibility(token, true)
	Unit.set_local_pose(token, 0, pose)
end

DeusMapScene._hide_token = function (self, profile_index)
	local token = self._profile_index_to_token[profile_index]

	Unit.set_unit_visibility(token, false)
end
