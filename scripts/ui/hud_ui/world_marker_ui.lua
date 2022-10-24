require("scripts/ui/hud_ui/world_marker_templates/world_marker_template_ping")
require("scripts/ui/hud_ui/world_marker_templates/world_marker_template_text_box")
require("scripts/ui/hud_ui/world_marker_templates/world_marker_template_news_feed")
require("scripts/ui/hud_ui/world_marker_templates/world_marker_template_store")

local temp_array_markers_to_remove = {}
local temp_marker_raycast_queue = {}
local RAYCASTS_PER_FRAME = 1
local RAYCASTS_FRAME_DELAY = 5

local function raycast_sort_func(a, b)
	local a_frame_count = a.raycast_frame_count or 0
	local b_frame_count = b.raycast_frame_count or 0

	if a_frame_count == b_frame_count then
		local a_distance = a.widget.content.distance or 0
		local b_distance = b.widget.content.distance or 0

		return a_distance < b_distance
	end

	return b_frame_count < a_frame_count
end

DLCUtils.require_list("ui_world_marker_templates")

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
local DEBUG_MARKER = "ping"
WorldMarkerUI = class(WorldMarkerUI)

WorldMarkerUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = false
	}
	self._raycast_frame_counter = 0
	self._aiming_alpha_multiplier = 1
	self._game_world = ingame_ui_context.world_manager:world("level_world")
	self.local_player = ingame_ui_context.player

	self:_create_ui_elements()

	local event_manager = Managers.state.event

	event_manager:register(self, "add_world_marker_unit", "event_add_world_marker_unit")
	event_manager:register(self, "add_world_marker_position", "event_add_world_marker_position")
	event_manager:register(self, "remove_world_marker", "event_remove_world_marker")
	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
end

WorldMarkerUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager:unregister("add_world_marker_unit", self)
	event_manager:unregister("add_world_marker_position", self)
	event_manager:unregister("remove_world_marker", self)
	event_manager:unregister("on_spectator_target_changed", self)
end

WorldMarkerUI._create_ui_elements = function (self)
	self._id_counter = 0
	self._markers = {}
	self._markers_by_id = {}
	self._markers_by_type = {}
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widget_definitions_by_type = {}
	self._widget_definitions_by_type = widget_definitions_by_type

	for marker_type, settings in pairs(WorldMarkerTemplates) do
		widget_definitions_by_type[marker_type] = settings.create_widget_definition("pivot")
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
	local id = self:_register_marker({
		type = marker_type,
		unit = unit,
		widget = widget
	})
	local on_enter = WorldMarkerTemplates[marker_type].on_enter

	if on_enter then
		on_enter(widget)
	end

	if callback then
		callback(id, widget)
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
		callback(id, widget)
	end
end

WorldMarkerUI.on_spectator_target_changed = function (self, spectated_player_unit)
	self._spectated_player_unit = spectated_player_unit
	self._spectated_player = Managers.player:owner(spectated_player_unit)
	self._is_spectator = true
	self.local_player = self._spectated_player
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

			break
		end
	end

	local marker_type = marker.type
	local type_markers = markers_by_type[marker_type]

	for i = 1, #type_markers, 1 do
		if type_markers[i].id == id then
			table.remove(type_markers, i)

			break
		end
	end
end

WorldMarkerUI._create_widget_by_type = function (self, widget_type)
	local widget_definitions_by_type = self._widget_definitions_by_type
	local definition = widget_definitions_by_type[widget_type]

	return UIWidget.init(definition)
end

WorldMarkerUI.update = function (self, dt, t)
	return
end

WorldMarkerUI.post_update = function (self, dt, t)
	local player_unit = self.local_player.player_unit

	if not Unit.alive(player_unit) then
		return
	end

	Profiler.start("WorldMarkerUI")

	local raycasts_allowed = self._raycast_frame_counter == 0
	self._raycast_frame_counter = (self._raycast_frame_counter + 1) % RAYCASTS_FRAME_DELAY
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
		local markers_by_id = self._markers_by_id
		local markers_by_type = self._markers_by_type

		for marker_type, markers in pairs(markers_by_type) do
			local settings = WorldMarkerTemplates[marker_type]
			local screen_clamp = settings.screen_clamp
			local only_when_clamped = settings.only_when_clamped
			local draw_behind = settings.draw_behind
			local screen_margins = settings.screen_margins
			local max_distance = settings.max_distance
			local life_time = settings.life_time
			local check_line_of_sight = settings.check_line_of_sight

			for i = 1, #markers, 1 do
				local marker = markers[i]
				local id = marker.id
				local update = markers_by_id[id] ~= nil
				local remove = false
				local widget = marker.widget
				local content = widget.content
				local marker_position = nil

				if update then
					local world_position = marker.world_position

					if world_position then
						marker_position = world_position:unbox()
					else
						local unit = marker.unit

						if Unit.alive(unit) then
							local unit_node = settings.unit_node
							local node = (unit_node and Unit.node(unit, unit_node)) or 0
							marker_position = Unit.world_position(unit, node)
						else
							remove = true
						end
					end

					if life_time then
						local duration = marker.duration or 0
						duration = math.min(duration + dt, life_time)

						if life_time <= duration then
							remove = true
						else
							marker.duration = duration
						end
					end
				end

				if remove then
					update = false
					temp_array_markers_to_remove[#temp_array_markers_to_remove + 1] = marker
				end

				if update then
					local position_offset = settings.position_offset

					if position_offset then
						marker_position.x = marker_position.x + position_offset[1]
						marker_position.y = marker_position.y + position_offset[2]
						marker_position.z = marker_position.z + position_offset[3]
					end

					marker.position = marker_position
					local distance = Vector3.distance(marker_position, camera_position)
					content.distance = distance
					local out_of_reach = max_distance and max_distance < distance
					local animating = false
					local draw = not out_of_reach

					if not out_of_reach then
						local marker_direction = Vector3.normalize(marker_position - camera_position)
						local forward_dot_dir = Vector3.dot(camera_direction, marker_direction)
						local right_vector_dot = Vector3.dot(camera_right_vector, marker_direction)
						content.forward_dot_dir = forward_dot_dir
						local is_inside_frustum = Camera.inside_frustum(camera, marker_position) > 0
						local camera_left = Vector3.cross(camera_direction, Vector3.up())
						local left_dot_dir = Vector3.dot(camera_left, marker_direction)
						local angle = math.atan2(left_dot_dir, forward_dot_dir)
						local is_behind = (forward_dot_dir < 0 and true) or false
						local is_under = marker_position.z < camera_position.z
						local x, y, distance_from_camera = self:_convert_world_to_screen_position(camera, marker_position)
						local is_clamped = false

						if screen_clamp then
							if settings.screen_clamp_method == "tutorial" then
								local camera_forward_vector = Vector3.normalize(Vector3.flat(camera_forward))
								local direction_flat = Vector3.normalize(Vector3.flat(marker_direction))
								local forward_dot_flat = Vector3.dot(camera_forward_vector, direction_flat)
								local right_dot_flat = Vector3.dot(camera_right_vector, direction_flat)
								content.forward_dot_flat = forward_dot_flat
								content.right_dot_flat = right_dot_flat
								local clamped_x, clamped_y = nil
								clamped_x, clamped_y, is_clamped = self:_tutorial_clamp_to_screen(x, y, forward_dot_flat, right_dot_flat, settings)
								local lerp_speed = content._lerp_speed

								if not lerp_speed or is_clamped ~= content.is_clamped then
									lerp_speed = 0
								end

								lerp_speed = math.min(lerp_speed + dt, 1)
								local offset = widget.offset
								x = math.lerp(offset[1], clamped_x, lerp_speed)
								y = math.lerp(offset[2], clamped_y, lerp_speed)
								content._lerp_speed = lerp_speed
							else
								x, y, is_clamped = self:_normal_clamp_to_screen(x, y, screen_margins, is_behind, is_under, marker_position, camera_position_center, camera_position_left, camera_position_right, camera_position_up, camera_position_down)
							end
						end

						if not is_clamped then
							if only_when_clamped or (is_behind and not draw_behind) then
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

						if draw and check_line_of_sight then
							marker.raycast_frame_count = (marker.raycast_frame_count or 0) + 1

							if raycasts_allowed then
								temp_marker_raycast_queue[#temp_marker_raycast_queue + 1] = marker
							end
						end
					end

					marker.draw = draw
					content.do_update = not out_of_reach
				end
			end
		end

		if raycasts_allowed then
			local num_raycast_queue = #temp_marker_raycast_queue

			if num_raycast_queue > 1 then
				table.sort(temp_marker_raycast_queue, raycast_sort_func)
			end

			for i = 1, num_raycast_queue, 1 do
				if RAYCASTS_PER_FRAME < i then
					break
				end

				local marker = temp_marker_raycast_queue[i]
				local result = self:_raycast_marker(marker)
				marker.raycast_frame_count = 0
				marker.raycast_result = result
			end

			table.clear(temp_marker_raycast_queue)
		end

		local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
		local is_not_aiming = not status_extension:get_is_aiming()
		local alpha_multiplier = math.max(0.25, UIUtils.animate_value(self._aiming_alpha_multiplier, dt * 5, is_not_aiming))
		self._aiming_alpha_multiplier = alpha_multiplier

		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

		for marker_type, markers in pairs(markers_by_type) do
			local settings = WorldMarkerTemplates[marker_type]

			for i = 1, #markers, 1 do
				local marker = markers[i]
				local widget = marker.widget
				local content = widget.content
				local distance = content.distance
				local draw = marker.draw
				local animating = false
				local scale_settings = settings.scale_settings
				local update_function = settings.update_function

				if content.do_update and update_function then
					Profiler.start("WorldMarkerUI_ANIM")

					animating = update_function(ui_renderer, widget, marker, settings, dt, t)

					Profiler.stop("WorldMarkerUI_ANIM")
				end

				if not animating and scale_settings then
					local scale = self:_get_scale(scale_settings, distance)

					self:_apply_scale(widget, scale)
				end

				if draw then
					Profiler.start("WorldMarkerUI_DRAW")

					local widget_alpha_multiplier = widget.alpha_multiplier or 1

					if not settings.ignore_aiming then
						widget_alpha_multiplier = widget_alpha_multiplier * alpha_multiplier
					end

					render_settings.alpha_multiplier = widget_alpha_multiplier

					UIRenderer.draw_widget(ui_renderer, widget)
					Profiler.stop("WorldMarkerUI_DRAW")
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

	local markers_to_remove = #temp_array_markers_to_remove

	if markers_to_remove > 0 then
		for i = 1, markers_to_remove, 1 do
			local marker = temp_array_markers_to_remove[i]

			self:_unregister_marker(marker)
		end

		table.clear(temp_array_markers_to_remove)
	end

	Profiler.stop("WorldMarkerUI")
end

WorldMarkerUI._raycast_marker = function (self, marker)
	local widget = marker.widget
	local content = widget.content
	local marker_position = marker.position
	local distance = content.distance
	local world_manager = Managers.world
	local world_name = "level_world"

	if not world_manager:has_world(world_name) then
		return
	end

	local world = world_manager:world(world_name)
	local physics_world = World.get_data(world, "physics_world")
	local camera = self._camera
	local camera_position = Camera.local_position(camera)
	local camera_rotation = Camera.local_rotation(camera)

	return PhysicsWorld.immediate_raycast(physics_world, camera_position, Vector3.normalize(marker_position - camera_position), distance, "closest", "collision_filter", "filter_physics_projectile")
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
	local content = widget.content
	content.scale = scale
	local lerp_multiplier = 0.2

	for _, pass_style in pairs(style) do
		local default_size = pass_style.default_size

		if default_size then
			local current_size = pass_style.area_size or pass_style.texture_size or pass_style.size
			current_size[1] = math.lerp(current_size[1], default_size[1] * scale, lerp_multiplier)
			current_size[2] = math.lerp(current_size[2], default_size[2] * scale, lerp_multiplier)
		end

		local source_offset = pass_style.animation_offset or pass_style.default_offset

		if source_offset then
			local offset = pass_style.offset
			offset[1] = math.lerp(offset[1], source_offset[1] * scale, lerp_multiplier)
			offset[2] = math.lerp(offset[2], source_offset[2] * scale, lerp_multiplier)
			slot14 = pass_style.offset
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

WorldMarkerUI._normal_clamp_to_screen = function (self, x, y, screen_margins, is_behind, is_under, world_position, camera_position_center, camera_position_left, camera_position_right, camera_position_up, camera_position_down)
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
	local center_x = screen_width * 0.5
	local center_y = screen_height * 0.5
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

WorldMarkerUI._tutorial_clamp_to_screen = function (self, x, y, forward_dot, right_dot, settings)
	local resolution_lookup = RESOLUTION_LOOKUP
	local scale = resolution_lookup.scale
	local screen_x_half = resolution_lookup.res_w * 0.5
	local screen_y_half = resolution_lookup.res_h * 0.5
	local is_x_clamped = math.abs(x * scale - screen_x_half) > screen_x_half * 0.9
	local is_y_clamped = math.abs(screen_y_half - y * scale) > screen_y_half * 0.9
	local is_clamped = is_x_clamped or is_y_clamped or forward_dot < 0

	if is_clamped then
		local inverse_scale = resolution_lookup.inv_scale
		local distance_from_center = settings.distance_from_center
		x = inverse_scale * screen_x_half + right_dot * distance_from_center.width
		y = inverse_scale * screen_y_half + forward_dot * distance_from_center.height
	end

	return x, y, is_clamped
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
		self._broadphase = Broadphase(255, 15)
		self._broadphase_ids = {}
		local marker_type = "climbing"
		local nav_graph_system = Managers.state.entity:system("nav_graph_system")
		local jump_units = nav_graph_system:level_jump_units()
		local num_units = 0

		for unit, _ in pairs(jump_units) do
			if Unit.alive(unit) then
				local world_position = Unit.world_position(unit, 0)
				local id = Broadphase.add(self._broadphase, unit, world_position, 1)
				self._broadphase_ids[id] = unit
				num_units = num_units + 1
			end
		end

		local camera = self._camera
		local camera_position = Camera.local_position(camera)
		local broadphase_results = {}
		local num_hits = Broadphase.query(self._broadphase, camera_position, 10, broadphase_results)

		print("num_hits", num_hits, num_units)

		for i = 1, num_hits, 1 do
			local unit = broadphase_results[i]

			self:event_add_world_marker_unit(marker_type, unit)
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
