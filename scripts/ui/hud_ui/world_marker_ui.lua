require("scripts/ui/hud_ui/world_marker_templates/world_marker_template_ping")
require("scripts/ui/hud_ui/world_marker_templates/world_marker_template_text_box")
require("scripts/ui/hud_ui/world_marker_templates/world_marker_template_news_feed")

local scenegraph_definition = {
	root = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud_inventory
		},
		size = {
			1920,
			1080
		}
	},
	pivot = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			0
		},
		size = {
			0,
			0
		}
	}
}
local RELOAD_UI = true
local DEBUG_MARKER = "ping"
WorldMarkerUI = class(WorldMarkerUI)

WorldMarkerUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self._render_settings = {
		snap_pixel_positions = false
	}
	local world_manager = Managers.world
	local world_name = "level_world"
	local world = world_manager:world(world_name)
	self._game_world = world
	self.local_player = Managers.player:local_player()

	self:create_ui_elements()

	local event_manager = Managers.state.event

	event_manager:register(self, "add_world_marker_unit", "event_add_world_marker_unit")
	event_manager:register(self, "add_world_marker_position", "event_add_world_marker_position")
	event_manager:register(self, "remove_world_marker", "event_remove_world_marker")
end

WorldMarkerUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager:unregister("add_world_marker_unit", self)
	event_manager:unregister("add_world_marker_position", self)
	event_manager:unregister("remove_world_marker", self)
end

WorldMarkerUI.create_ui_elements = function (self)
	RELOAD_UI = false
	self._id_counter = 0
	self._markers = {}
	self._markers_by_id = {}
	self._markers_by_type = {}
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local scenegraph_id = "pivot"
	local widget_definitions_by_type = {}
	self._widget_definitions_by_type = widget_definitions_by_type

	for marker_type, settings in pairs(WorldMarkerTemplates) do
		local create_widget_defintion = settings.create_widget_defintion
		widget_definitions_by_type[marker_type] = create_widget_defintion(scenegraph_id)
	end
end

WorldMarkerUI.event_remove_world_marker = function (self, id)
	local marker_to_remove = nil
	local markers = self._markers

	for i = 1, #markers, 1 do
		local marker = markers[i]

		if marker.id == id then
			marker_to_remove = marker

			break
		end
	end

	if marker_to_remove then
		self:_unregister_marker(marker_to_remove)
	end
end

WorldMarkerUI.event_add_world_marker_unit = function (self, marker_type, unit, callback)
	local widget = self:_create_widget_by_type(marker_type)
	local marker = {
		type = marker_type,
		unit = unit,
		widget = widget
	}
	local id = self:_register_marker(marker)
	local settings = WorldMarkerTemplates[marker_type]
	local on_enter = settings.on_enter

	if on_enter then
		on_enter(widget)
	end

	if callback then
		callback(id)
	end
end

WorldMarkerUI.event_add_world_marker_position = function (self, marker_type, world_position, callback)
	local widget = self:_create_widget_by_type(marker_type)
	local marker = {
		type = marker_type,
		world_position = Vector3Box(world_position),
		widget = widget
	}
	local id = self:_register_marker(marker)
	local settings = WorldMarkerTemplates[marker_type]
	local on_enter = settings.on_enter

	if on_enter then
		on_enter(widget)
	end

	if callback then
		callback(id)
	end
end

WorldMarkerUI._register_marker = function (self, marker)
	local markers = self._markers
	local markers_by_id = self._markers_by_id
	local markers_by_type = self._markers_by_type
	self._id_counter = self._id_counter + 1
	local id = self._id_counter
	marker.id = id
	markers_by_id[id] = marker
	markers[#markers + 1] = marker
	local marker_type = marker.type
	local type_markers = markers_by_type[marker_type] or {}
	markers_by_type[marker_type] = type_markers
	type_markers[#type_markers + 1] = marker

	return id
end

WorldMarkerUI._unregister_marker = function (self, marker)
	local markers = self._markers
	local markers_by_id = self._markers_by_id
	local markers_by_type = self._markers_by_type
	local id = marker.id
	markers_by_id[id] = nil

	for i = 1, #markers, 1 do
		if markers[i].id == id then
			table.remove(markers, i)
		end
	end

	local marker_type = marker.type
	local type_markers = markers_by_type[marker_type]

	for i = 1, #type_markers, 1 do
		if type_markers[i].id == id then
			table.remove(type_markers, i)
		end
	end
end

WorldMarkerUI._create_widget_by_type = function (self, widget_type)
	local widget_definitions_by_type = self._widget_definitions_by_type
	local definition = widget_definitions_by_type[widget_type]

	return UIWidget.init(definition)
end

WorldMarkerUI.update = function (self, dt, t)
	if RELOAD_UI then
		self:create_ui_elements()
	end
end

WorldMarkerUI.post_update = function (self, dt, t)
	if script_data.debug_world_marker_ping then
		self:_test_raycast()
	end

	local player_unit = self.local_player.player_unit

	if not Unit.alive(player_unit) then
		return
	end

	local camera = self._camera

	if camera then
		local ui_renderer = self.ui_renderer
		local ui_scenegraph = self.ui_scenegraph
		local input_service = self.input_manager:get_service("Player")
		local render_settings = self._render_settings
		local camera_position = Camera.local_position(camera)
		local camera_rotation = Camera.local_rotation(camera)
		local camera_forward = Quaternion.forward(camera_rotation)
		local camera_direction = Quaternion.forward(camera_rotation)
		local camera_up = Quaternion.up(camera_rotation)
		local camera_right_vector = Quaternion.right(camera_rotation)
		camera_right_vector = Vector3.normalize(Vector3.flat(camera_right_vector))
		local camera_near_range = Camera.near_range(camera)
		local camera_position_center = camera_position + camera_forward
		local camera_pose = Camera.local_pose(camera)
		local camera_position_right = Matrix4x4.right(camera_pose)
		local camera_position_left = -camera_position_right
		local camera_position_up = Matrix4x4.up(camera_pose)
		local camera_position_down = -camera_position_up

		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

		local markers_by_type = self._markers_by_type

		for marker_type, markers in pairs(markers_by_type) do
			local settings = WorldMarkerTemplates[marker_type]
			local screen_clamp = settings.screen_clamp
			local screen_margins = settings.screen_margins
			local scale_settings = settings.scale_settings
			local max_distance = settings.max_distance
			local animation_update = settings.animation_update

			for i = 1, #markers, 1 do
				local marker = markers[i]
				local widget = marker.widget
				local content = widget.content
				local world_position = marker.world_position
				local unboxed_world_position = world_position:unbox()
				local position_offset = settings.position_offset

				if position_offset then
					unboxed_world_position.x = unboxed_world_position.x + position_offset[1]
					unboxed_world_position.y = unboxed_world_position.y + position_offset[2]
					unboxed_world_position.z = unboxed_world_position.z + position_offset[3]
				end

				local distance = Vector3.distance(unboxed_world_position, camera_position)
				local out_of_reach = max_distance and max_distance < distance
				local animating = false

				if not out_of_reach then
					local marker_direction = Vector3.normalize(unboxed_world_position - camera_position)
					marker_direction = Vector3.normalize(marker_direction)
					local forward_dot_dir = Vector3.dot(camera_direction, marker_direction)
					local right_vector_dot = Vector3.dot(camera_right_vector, marker_direction)
					local is_inside_frustum = Camera.inside_frustum(camera, unboxed_world_position) > 0
					local camera_left = Vector3.cross(camera_direction, Vector3.up())
					local left_dot_dir = Vector3.dot(camera_left, marker_direction)
					local angle = math.atan2(left_dot_dir, forward_dot_dir)
					local is_behind = (forward_dot_dir < 0 and true) or false
					local is_under = unboxed_world_position.z < camera_position.z
					local x, y, distance_from_camera = self:_convert_world_to_screen_position(camera, unboxed_world_position)
					local is_clamped = false

					if screen_clamp then
						local clamped_x = 0
						local clamped_y = 0
						clamped_x, clamped_y, is_clamped = self:_clamp_to_screen(x, y, screen_margins, is_behind, is_under, unboxed_world_position, camera_position_center, camera_position_left, camera_position_right, camera_position_up, camera_position_down)
						x = clamped_x
						y = clamped_y
					end

					local draw = true

					if not is_clamped then
						if is_behind then
							draw = false
						elseif not is_inside_frustum then
							local root_size = UISceneGraph.get_size_scaled(ui_scenegraph, "root")
							local vertical_pixel_overlap, horizontal_pixel_overlap = nil

							if x < 0 then
								horizontal_pixel_overlap = math.abs(x)
							elseif root_size[1] < x then
								horizontal_pixel_overlap = x - root_size[1]
							end

							if y < 0 then
								vertical_pixel_overlap = math.abs(y)
							elseif root_size[2] < y then
								vertical_pixel_overlap = y - root_size[2]
							end

							if vertical_pixel_overlap or horizontal_pixel_overlap then
								draw = false
								local check_widget_visible = settings.check_widget_visible

								if check_widget_visible then
									draw = check_widget_visible(widget, vertical_pixel_overlap, horizontal_pixel_overlap)
								end
							else
								draw = false
							end
						end
					end

					content.is_inside_frustum = is_inside_frustum
					content.is_clamped = is_clamped
					content.is_under = is_under
					content.distance = distance
					content.angle = angle
					local offset = widget.offset
					offset[1] = x
					offset[2] = y

					if animation_update then
						animating = animation_update(ui_renderer, widget, settings, dt, t)
					end

					if not animating and scale_settings then
						local scale = self:_get_scale(scale_settings, distance)

						self:_apply_scale(widget, scale)
					end

					if draw then
						UIRenderer.draw_widget(ui_renderer, widget)
					end
				end
			end
		end

		UIRenderer.end_pass(ui_renderer)
	else
		local viewport_name = "player_1"
		local game_world = self._game_world

		if Managers.state.camera:has_viewport(viewport_name) then
			local viewport = ScriptWorld.viewport(game_world, viewport_name)
			self._camera = ScriptViewport.camera(viewport)
		end
	end
end

WorldMarkerUI._get_scale = function (self, settings, distance)
	local min_scale = settings.min_scale
	local start_scale_distance = settings.start_scale_distance
	local end_scale_distance = settings.end_scale_distance

	if start_scale_distance < distance then
		local scale_distance = distance - start_scale_distance
		local distance = math.min(end_scale_distance, scale_distance)
		distance = math.max(0, distance)
		local scale = math.max(min_scale, 1 - distance / end_scale_distance)

		return scale
	end

	return 1
end

WorldMarkerUI._apply_scale = function (self, widget, scale)
	local style = widget.style
	local lerp_multiplier = 0.2

	for _, pass_style in pairs(style) do
		local default_size = pass_style.default_size

		if default_size then
			local current_size = pass_style.area_size or pass_style.texture_size or pass_style.size
			current_size[1] = math.lerp(current_size[1], default_size[1] * scale, lerp_multiplier)
			current_size[2] = math.lerp(current_size[2], default_size[2] * scale, lerp_multiplier)
		end

		local default_offset = pass_style.default_offset

		if default_offset then
			local offset = pass_style.offset
			offset[1] = math.lerp(offset[1], default_offset[1] * scale, lerp_multiplier)
			offset[2] = math.lerp(offset[2], default_offset[2] * scale, lerp_multiplier)
		end
	end
end

WorldMarkerUI._convert_world_to_screen_position = function (self, camera, world_position)
	if camera then
		local world_to_screen, distance = Camera.world_to_screen(camera, world_position)
		local inv_scale = RESOLUTION_LOOKUP.inv_scale

		return world_to_screen.x * inv_scale, world_to_screen.y * inv_scale, distance
	end
end

WorldMarkerUI._clamp_to_screen = function (self, x, y, screen_margins, is_behind, is_under, world_position, camera_position_center, camera_position_left, camera_position_right, camera_position_up, camera_position_down)
	local root_size = UISceneGraph.get_size_scaled(self.ui_scenegraph, "root")
	local margin_up = (screen_margins and screen_margins.up) or 0
	local margin_down = (screen_margins and screen_margins.down) or 0
	local margin_left = (screen_margins and screen_margins.left) or 0
	local margin_right = (screen_margins and screen_margins.right) or 0
	local clamped_x = math.max(margin_left, math.min(x, root_size[1] - margin_right))
	local clamped_y = math.max(margin_down, math.min(y, root_size[2] - margin_up))
	local is_clamped = clamped_x ~= x or clamped_y ~= y or is_behind

	if is_behind then
		local camera_distance_left = Vector3.distance(Vector3.flat(world_position), Vector3.flat(camera_position_center + camera_position_left))
		local camera_distance_right = Vector3.distance(Vector3.flat(world_position), Vector3.flat(camera_position_center + camera_position_right))
		local camera_distances_difference_horizontal = camera_distance_left - camera_distance_right
		local x_percent = math.abs(camera_distances_difference_horizontal) / 2
		local camera_distance_up = Vector3.distance(Vector3.flat(world_position), Vector3.flat(camera_position_center + camera_position_up))
		local camera_distance_down = Vector3.distance(Vector3.flat(world_position), Vector3.flat(camera_position_center + camera_position_down))
		local camera_distances_difference_vertical = (camera_distance_up - camera_distance_down) / 2
		local y_percent = math.abs(camera_distances_difference_vertical) / 1 - 1

		if camera_distance_left < camera_distance_right then
			clamped_x = math.lerp(margin_left, (root_size[1] - margin_right) * 0.5, 1 - x_percent)
		else
			clamped_x = math.lerp((root_size[1] - margin_right) * 0.5, root_size[1] - margin_right, x_percent)
		end

		if camera_distance_up < camera_distance_down then
			clamped_y = math.lerp(margin_down, (root_size[2] - margin_up) * 0.5, 1 - y_percent)
		else
			clamped_y = math.lerp((root_size[2] - margin_up) * 0.5, root_size[2] - margin_up, y_percent)
		end

		if is_under then
			clamped_y = clamped_y * -1
		end

		if margin_left <= clamped_x or clamped_x <= root_size[2] - margin_right then
			if clamped_y > root_size[2] / 2 or not is_under then
				clamped_y = root_size[2] - margin_up
			else
				clamped_y = margin_down
			end
		end
	end

	return clamped_x, clamped_y, is_clamped
end

WorldMarkerUI._is_clamped = function (self, x, y)
	local root_size = UISceneGraph.get_size_scaled(self.ui_scenegraph, "root")
	local scale = RESOLUTION_LOOKUP.scale
	local scaled_root_size_x = root_size[1] * scale
	local scaled_root_size_y = root_size[2] * scale
	local scaled_root_size_x_half = root_size[1] * 0.5
	local scaled_root_size_y_half = root_size[2] * 0.5
	local screen_width = RESOLUTION_LOOKUP.res_w
	local screen_height = RESOLUTION_LOOKUP.res_h
	local center_x = screen_width / 2
	local center_y = screen_height / 2
	local x_diff = x - center_x
	local y_diff = center_y - y
	local is_x_clamped = false
	local is_y_clamped = false

	if math.abs(x_diff) > scaled_root_size_x_half * 0.9 then
		is_x_clamped = true
	end

	if math.abs(y_diff) > scaled_root_size_y_half * 0.9 then
		is_y_clamped = true
	end

	return ((is_x_clamped or is_y_clamped) and true) or false
end

WorldMarkerUI._get_floating_icon_position = function (self, x, y, forward_dot, right_dot, tooltip_settings)
	local root_size = UISceneGraph.get_size_scaled(self.ui_scenegraph, "root")
	local scale = RESOLUTION_LOOKUP.scale
	local scaled_root_size_x = root_size[1] * scale
	local scaled_root_size_y = root_size[2] * scale
	local scaled_root_size_x_half = scaled_root_size_x * 0.5
	local scaled_root_size_y_half = scaled_root_size_y * 0.5
	local screen_width = RESOLUTION_LOOKUP.res_w
	local screen_height = RESOLUTION_LOOKUP.res_h
	local center_x = screen_width / 2
	local center_y = screen_height / 2
	local x_diff = x - center_x
	local y_diff = center_y - y
	local is_x_clamped = false
	local is_y_clamped = false

	if math.abs(x_diff) > scaled_root_size_x_half * 0.9 then
		is_x_clamped = true
	end

	if math.abs(y_diff) > scaled_root_size_y_half * 0.9 then
		is_y_clamped = true
	end

	local clamped_x = x
	local clamped_y = y
	local is_behind = (forward_dot < 0 and true) or false
	local is_clamped = ((is_x_clamped or is_y_clamped) and true) or false

	if is_clamped or is_behind then
		local distance_from_center = tooltip_settings.distance_from_center
		clamped_x = scaled_root_size_x_half + right_dot * distance_from_center.width * scale
		clamped_y = scaled_root_size_y_half + forward_dot * distance_from_center.height * scale
	else
		local screen_pos_diff_x = screen_width - scaled_root_size_x
		local screen_pos_diff_y = screen_height - scaled_root_size_y
		clamped_x = clamped_x - screen_pos_diff_x / 2
		clamped_y = clamped_y - screen_pos_diff_y / 2
	end

	local inverse_scale = RESOLUTION_LOOKUP.inv_scale
	clamped_x = clamped_x * inverse_scale
	clamped_y = clamped_y * inverse_scale

	return clamped_x, clamped_y, is_clamped, is_behind
end

local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4

WorldMarkerUI._test_raycast = function (self)
	local player_unit = self.local_player.player_unit

	if not Unit.alive(player_unit) then
		return
	end

	local input_action = "ping"
	local input_service = self.input_manager:get_service("Player")
	local input_pressed = input_service:get(input_action)

	if input_pressed then
		local world_manager = Managers.world
		local world_name = "level_world"

		if world_manager:has_world(world_name) then
			local world = world_manager:world(world_name)
			local physics_world = World.get_data(world, "physics_world")
			local camera = nil
			local viewport_name = "player_1"

			if Managers.state.camera:has_viewport(viewport_name) then
				local viewport = ScriptWorld.viewport(world, viewport_name)
				camera = ScriptViewport.camera(viewport)
			end

			if camera then
				local from = Camera.local_position(camera)
				local camera_rotation = Camera.local_rotation(camera)
				local to = Quaternion.forward(camera_rotation)
				local collision_filter = "filter_ray_ping"
				local raycast_position = self:_get_raycast_position(player_unit, from, to, physics_world, collision_filter)

				if raycast_position then
					self:event_add_world_marker_position(DEBUG_MARKER, raycast_position)
				end
			end
		end
	end
end

WorldMarkerUI._get_raycast_position = function (self, unit, from, to, physics_world, collision_filter)
	local result = PhysicsWorld.immediate_raycast(physics_world, from, to, 100, "all", "collision_filter", collision_filter)

	if not result then
		return
	end

	local closest_distance = math.huge
	local closest_hit = nil
	local owner_unit = self.owner_unit
	local num_hits = #result

	for i = 1, num_hits, 1 do
		local hit = result[i]
		local hit_position = hit[INDEX_POSITION]
		local hit_distance = hit[INDEX_DISTANCE]
		local hit_normal = hit[INDEX_NORMAL]
		local hit_actor = hit[INDEX_ACTOR]
		local hit_unit = Actor.unit(hit_actor)
		local hit_self = hit_unit == unit or hit_unit == owner_unit

		if not hit_self and hit_distance < closest_distance then
			closest_distance = hit_distance
			closest_hit = hit
		end
	end

	if closest_hit then
		return closest_hit[INDEX_POSITION]
	end
end

return
