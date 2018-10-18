require("scripts/utils/strict_table")
require("scripts/ui/ui_scenegraph")
require("scripts/ui/ui_resolution")
require("scripts/utils/debug_key_handler")

local pdArray = require("foundation/scripts/util/array")
script_data.ui_debug_scenegraph = script_data.ui_debug_scenegraph or Development.parameter("ui_debug_scenegraph")
script_data.ui_debug_pixeldistance = script_data.ui_debug_pixeldistance or Development.parameter("ui_debug_pixeldistance")
script_data.ui_debug_draw_texture = script_data.ui_debug_draw_texture or Development.parameter("ui_debug_draw_texture")
UIRenderer = {}
local UIRenderer = UIRenderer
SNAP_PIXEL_POSITIONS = true
local relative_uvs = {
	{
		0,
		0
	},
	{
		1,
		1
	}
}

local function get_relative_uvs(global_uv00, global_uv11, local_uvs)
	local size_x = global_uv11[2] - global_uv00[2]
	local size_y = global_uv11[1] - global_uv00[1]
	relative_uvs[1][2] = global_uv00[2] + size_x * local_uvs[1][2]
	relative_uvs[2][2] = global_uv00[2] + size_x * local_uvs[2][2]
	relative_uvs[1][1] = global_uv00[1] + size_y * local_uvs[1][1]
	relative_uvs[2][1] = global_uv00[1] + size_y * local_uvs[2][1]

	return relative_uvs
end

local function snap_to_position(position)
	local ui_scale = RESOLUTION_LOOKUP.scale

	if ui_scale >= 1 then
		position[1] = math.round(position[1])
		position[2] = math.round(position[2])
	end

	return position
end

local Color = Color
local Vector2 = Vector2
local Vector3 = Vector3
local Gui_bitmap_uv = Gui.bitmap_uv
local Gui_bitmap = Gui.bitmap
local Gui_update_bitmap_uv = Gui.update_bitmap_uv
local Gui_update_bitmap = Gui.update_bitmap

UIRenderer.script_draw_bitmap = function (gui, render_settings, material, gui_position, gui_size, color, masked, saturated, retained_id)
	local snap_pixel_positions = render_settings and render_settings.snap_pixel_positions

	if snap_pixel_positions == nil then
		snap_pixel_positions = SNAP_PIXEL_POSITIONS
	end

	if snap_pixel_positions then
		gui_position = snap_to_position(gui_position)
	end

	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(material)
	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	if texture_settings then
		local uv00_table = texture_settings.uv00
		local uv11_table = texture_settings.uv11
		local uv00 = Vector2(uv00_table[1], uv00_table[2])
		local uv11 = Vector2(uv11_table[1], uv11_table[2])
		local material_name = nil

		if masked then
			if saturated then
				material_name = texture_settings.masked_saturated_material_name
			else
				material_name = texture_settings.masked_material_name
			end
		elseif saturated then
			material_name = texture_settings.saturated_material_name
		else
			material_name = texture_settings.material_name
		end

		if retained_id then
			Gui_update_bitmap_uv(gui, retained_id, material_name, uv00, uv11, gui_position, gui_size, color)
		else
			return Gui_bitmap_uv(gui, material_name, uv00, uv11, gui_position, gui_size, color)
		end
	elseif retained_id then
		Gui_update_bitmap(gui, retained_id, material, gui_position, gui_size, color)
	else
		return Gui_bitmap(gui, material, gui_position, gui_size, color)
	end
end

UIRenderer.script_draw_bitmap_uv = function (gui, render_settings, material, uvs, gui_position, gui_size, color, masked, saturated, retained_id)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(material)
	local snap_pixel_positions = render_settings and render_settings.snap_pixel_positions

	if snap_pixel_positions == nil then
		snap_pixel_positions = SNAP_PIXEL_POSITIONS
	end

	if snap_pixel_positions then
		gui_position = snap_to_position(gui_position)
	end

	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	if texture_settings then
		local new_uvs = get_relative_uvs(texture_settings.uv00, texture_settings.uv11, uvs)
		local new_uvs1 = new_uvs[1]
		local new_uvs2 = new_uvs[2]
		local uv00 = Vector2(new_uvs1[1], new_uvs1[2])
		local uv11 = Vector2(new_uvs2[1], new_uvs2[2])
		local material_name = nil

		if masked then
			material_name = texture_settings.masked_material_name
		elseif saturated then
			material_name = texture_settings.saturated_material_name
		else
			material_name = texture_settings.material_name
		end

		if retained_id then
			Gui_update_bitmap_uv(gui, retained_id, material_name, uv00, uv11, gui_position, gui_size, color)
		else
			return Gui_bitmap_uv(gui, material_name, uv00, uv11, gui_position, gui_size, color)
		end
	else
		local uv00 = uvs[1]
		local uv11 = uvs[2]

		if retained_id then
			Gui_update_bitmap_uv(gui, retained_id, material, Vector2(uv00[1], uv00[2]), Vector2(uv11[1], uv11[2]), gui_position, gui_size, color)
		else
			return Gui_bitmap_uv(gui, material, Vector2(uv00[1], uv00[2]), Vector2(uv11[1], uv11[2]), gui_position, gui_size, color)
		end
	end
end

local Gui_update_bitmap_3d_uv = Gui.update_bitmap_3d_uv
local Gui_bitmap_3d_uv = Gui.bitmap_3d_uv
local Gui_update_bitmap_3d = Gui.update_bitmap_3d
local Gui_bitmap_3d = Gui.bitmap_3d

UIRenderer.script_draw_bitmap_3d = function (gui, render_settings, material, tm, gui_layer, gui_size, color, optional_uvs, masked, retained_id)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(material)
	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	if texture_settings then
		local material_name = nil

		if masked then
			material_name = texture_settings.masked_material_name
		else
			material_name = texture_settings.material_name
		end

		local uv00, uv11 = nil

		if optional_uvs then
			local new_uvs = get_relative_uvs(texture_settings.uv00, texture_settings.uv11, optional_uvs)
			local new_uvs1 = new_uvs[1]
			local new_uvs2 = new_uvs[2]
			uv00 = Vector2(new_uvs1[1], new_uvs1[2])
			uv11 = Vector2(new_uvs2[1], new_uvs2[2])
		else
			uv11 = texture_settings.uv11
			uv00 = texture_settings.uv00
		end

		if retained_id then
			return Gui_update_bitmap_3d_uv(gui, retained_id, material_name, Vector2(uv00[1], uv00[2]), Vector2(uv11[1], uv11[2]), tm, Vector3.zero(), gui_layer, gui_size, color)
		else
			return Gui_bitmap_3d_uv(gui, material_name, Vector2(uv00[1], uv00[2]), Vector2(uv11[1], uv11[2]), tm, Vector3.zero(), gui_layer, gui_size, color)
		end
	elseif retained_id then
		return Gui_update_bitmap_3d(gui, retained_id, material, tm, Vector3.zero(), gui_layer, gui_size, color)
	else
		return Gui_bitmap_3d(gui, material, tm, Vector3.zero(), gui_layer, gui_size, color)
	end
end

UIRenderer.create = function (world, ...)
	local gui = World.create_screen_gui(world, "immediate", ...)
	local gui_retained = World.create_screen_gui(world, ...)

	return UIRenderer.create_ui_renderer(world, gui, gui_retained)
end

UIRenderer.create_ui_renderer = function (world, gui, gui_retained)
	UPDATE_RESOLUTION_LOOKUP()

	return ProtectMetaTable(MakeTableStrict({
		dt = 0,
		gui = gui,
		gui_retained = gui_retained,
		ui_scenegraph = StrictNil,
		ui_scenegraph_queue = pdArray.new(),
		input_service = StrictNil,
		video_player = StrictNil,
		world = world,
		wwise_world = Managers.world:wwise_world(world),
		clipping_rects = pdArray.new(),
		current_clipping_rect = StrictNil,
		mouse_clip = StrictNil,
		mouse_clip_pos = StrictNil,
		mouse_clip_size = StrictNil,
		debug_startpoint_direction = StrictNil,
		debug_startpoint = StrictNil,
		render_settings = StrictNil
	}))
end

UIRenderer.create_video_player = function (self, world, resource, set_loop)
	if script_data.disable_video_player then
		return
	end

	assert(not self.video_player)

	self.video_player = world:create_video_player(resource, set_loop)

	if set_loop == false then
		VideoPlayer.set_loop(self.video_player, false)
	end
end

UIRenderer.destroy_video_player = function (self, world)
	if script_data.disable_video_player then
		return
	end

	assert(self.video_player)
	World.destroy_video_player(world or self.world, self.video_player)

	self.video_player = nil
end

UIRenderer.destroy = function (self, world)
	if self.video_player then
		World.destroy_video_player(self.world, self.video_player)

		self.video_player = nil
	end

	World.destroy_gui(world, self.gui)
	World.destroy_gui(world, self.gui_retained)
end

UIRenderer.clear_scenegraph_queue = function (self)
	self.ui_scenegraph = nil

	pdArray.set_empty(self.ui_scenegraph_queue)
	pdArray.set_empty(self.clipping_rects)

	self.current_clipping_rect = nil
end

UIRenderer.begin_pass = function (self, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)
	if self.ui_scenegraph then
		local old_scenegraph = self.ui_scenegraph

		pdArray.push_back(self.ui_scenegraph_queue, old_scenegraph)

		self.ui_scenegraph = ui_scenegraph

		assert(parent_scenegraph_id, "Must provide parent scenegraph id when building multiple depth passes.")
		UISceneGraph.update_scenegraph(ui_scenegraph, old_scenegraph, parent_scenegraph_id)
	else
		self.ui_scenegraph = ui_scenegraph

		UISceneGraph.update_scenegraph(ui_scenegraph)
	end

	self.ui_scenegraph = ui_scenegraph
	self.input_service = input_service
	self.dt = dt
	self.render_settings = render_settings

	if script_data.ui_debug_scenegraph then
		if DebugKeyHandler.key_pressed("left shift", "Debug Child Scenegraphs", "UI") and parent_scenegraph_id then
			UISceneGraph.debug_render_scenegraph(self, ui_scenegraph)
		elseif not parent_scenegraph_id then
			UISceneGraph.debug_render_scenegraph(self, ui_scenegraph)
		end
	end

	if script_data.ui_debug_pixeldistance and not parent_scenegraph_id then
		local debug_pixeldistance_value = input_service and input_service:get("debug_pixeldistance")

		if debug_pixeldistance_value then
			local cursor = input_service:get("cursor")

			if not self.debug_startpoint then
				self.debug_startpoint = Vector3Aux.box({}, cursor)
				self.debug_startpoint[3] = 999
			end

			local debug_startpoint = self.debug_startpoint
			local cursor_distance = Vector3.distance(Vector3Aux.unbox(debug_startpoint), cursor)

			if cursor_distance > 0 then
				if math.abs(cursor.y - debug_startpoint[2]) < math.abs(cursor.x - debug_startpoint[1]) then
					local current_endpos = Vector3(cursor.x, debug_startpoint[2], 999)

					Gui.rect(self.gui, Vector3Aux.unbox(debug_startpoint), Vector2(cursor.x - debug_startpoint[1], 20), Color(128, 255, 255, 255))

					local text = string.format("%d pixels.", cursor.x - debug_startpoint[1])

					Gui.text(self.gui, text, "materials/fonts/gw_arial_16", 14, "gw_arial_16", Vector3Aux.unbox(debug_startpoint), Color(255, 255, 255, 255))
				else
					local current_endpos = Vector3(debug_startpoint[1], cursor.y, 999)

					Gui.rect(self.gui, Vector3Aux.unbox(debug_startpoint), Vector2(20, cursor.y - debug_startpoint[2]), Color(128, 255, 255, 255))

					local text = string.format("%d pixels.", cursor.y - debug_startpoint[2])

					Gui.text(self.gui, text, "materials/fonts/gw_arial_16", 14, "gw_arial_16", Vector3Aux.unbox(debug_startpoint), Color(255, 255, 255, 255))
				end
			end
		elseif self.debug_startpoint and not input_service:is_blocked() then
			self.debug_startpoint_direction = nil
			self.debug_startpoint = nil
		end
	end
end

UIRenderer.end_pass = function (self)
	self.render_settings = nil

	if pdArray.num_items(self.ui_scenegraph_queue) > 0 then
		self.ui_scenegraph = pdArray.pop_back(self.ui_scenegraph_queue)
	else
		self.ui_scenegraph = nil
	end
end

UIRenderer.draw_widget = function (self, ui_widget)
	local animations = ui_widget.animations

	if animations then
		for ui_animation, _ in pairs(animations) do
			UIAnimation.update(ui_animation, self.dt)

			if UIAnimation.completed(ui_animation) then
				animations[ui_animation] = nil
			end
		end
	end

	UIRenderer.draw_element(self, ui_widget.element, ui_widget.style, ui_widget.style_global, ui_widget.scenegraph_id, ui_widget.content, animations, ui_widget.offset)
end

local function nop()
	return
end

UIRenderer.draw_element = function (self, ui_element, ui_style, ui_style_global, scenegraph_id, ui_content, ui_animations, offset)
	local Profiler_start = Profiler.start
	local Profiler_stop = Profiler.stop

	Profiler_start("UIRenderer.draw_element")

	local ui_scenegraph = self.ui_scenegraph
	local position = Vector3(unpack(UISceneGraph.get_world_position(ui_scenegraph, scenegraph_id)))

	if offset then
		position = position + Vector3(unpack(offset))
	end

	local widget_optional_scale = ui_style_global and ui_style_global.scale
	local size = UISceneGraph.get_size_scaled(ui_scenegraph, scenegraph_id, widget_optional_scale)
	local input_service = self.input_service
	local global_visible = true
	local input_manager = Managers.input

	if input_manager then
		local gamepad_active = Managers.input:is_device_active("gamepad")
		ui_content.is_gamepad_active = gamepad_active

		if ui_content.disable_with_gamepad then
			global_visible = not gamepad_active
		end
	end

	local dt = self.dt
	local pass_datas = ui_element.pass_data
	local UIPasses = UIPasses
	local UISceneGraph_get_size_scaled = UISceneGraph.get_size_scaled
	local UISceneGraph_get_world_position = UISceneGraph.get_world_position
	local Vector3 = Vector3
	local Vector2 = Vector2

	for i, pass_info in ipairs(ui_element.passes) do
		repeat
			local pass_type = pass_info.pass_type
			Profiler_stop = Profiler.stop
			Profiler_start = Profiler.start

			Profiler_start(pass_type)

			local content_id = pass_info.content_id
			local element_content = (content_id and ui_content[content_id]) or ui_content
			local visible = global_visible

			if ui_content then
				if ui_content.visible == false then
					visible = false
				end

				if visible and content_id and element_content and element_content.visible == false then
					visible = false
				end

				if content_id then
					element_content.parent = ui_content
				end
			end

			local style_id = pass_info.style_id
			local style_data = (style_id and ui_style[style_id]) or ui_style

			assert(not style_id or (style_id and style_data), "No style data for style with id %s", style_id)

			if ui_style[style_id] then
				style_data.parent = ui_style
			end

			local ui_pass = UIPasses[pass_type]

			assert(ui_pass, "No such UI Pass: %s", pass_type)

			local content_check_function = pass_info.content_check_function

			if visible and content_check_function then
				visible = content_check_function(element_content, style_data)
			end

			local content_change_function = pass_info.content_change_function

			if visible and content_change_function then
				content_change_function(element_content, style_data, ui_animations, dt)
			end

			local pass_data = pass_datas[i]

			if ui_pass.update then
				ui_pass.update(self, pass_data, ui_scenegraph, pass_info, style_data, element_content, input_service, dt, ui_style_global, visible)
			end

			if pass_info.retained_mode then
				local visible_previous = pass_data.visible
				pass_data.visible = visible

				if visible_previous and not visible then
					ui_pass.destroy(self, pass_data, pass_info)
					Profiler_stop(pass_type)

					break
				elseif not visible_previous and visible then
					pass_data.dirty = true
				end

				if not ui_element.dirty and not pass_data.dirty then
					Profiler_stop(pass_type)
				end
			elseif not visible then
				Profiler_stop(pass_type)
			else
				local pass_size, pass_position = nil
				local pass_scenegraph_id = (style_data and style_data.scenegraph_id) or pass_info.scenegraph_id

				if pass_scenegraph_id then
					pass_size = UISceneGraph_get_size_scaled(ui_scenegraph, pass_scenegraph_id, widget_optional_scale)
					local world_pos = UISceneGraph_get_world_position(ui_scenegraph, pass_scenegraph_id)
					pass_position = Vector3(world_pos[1], world_pos[2], world_pos[3])
				else
					pass_size = size
					pass_position = position
				end

				if ui_element.dirty then
				end

				local style_data_size = style_data and style_data.size

				if style_data_size then
					pass_size = Vector2(style_data_size[1] or pass_size[1], style_data_size[2] or pass_size[2]) or pass_size
				end

				local style_offset = style_data and style_data.offset

				if style_offset then
					pass_position = pass_position + Vector3(style_offset[1], style_offset[2], style_offset[3] or 0) or pass_position
				end

				if widget_optional_scale then
					pass_size[1] = pass_size[1] * widget_optional_scale
					pass_size[2] = pass_size[2] * widget_optional_scale
					pass_position[1] = pass_position[1] * widget_optional_scale
					pass_position[2] = pass_position[2] * widget_optional_scale
				end

				Profiler_start("pass draw")
				ui_pass.draw(self, pass_data, ui_scenegraph, pass_info, style_data, element_content, pass_position, pass_size, input_service, dt, ui_style_global)
				Profiler_stop("pass draw")
				Profiler_stop(pass_type)
			end
		until true
	end

	ui_element.dirty = nil

	Profiler_stop("UIRenderer.draw_element")
end

UIRenderer.set_element_visible = function (self, ui_element, visible)
	local pass_datas = ui_element.pass_data
	local UIPasses = UIPasses

	for i, pass_info in ipairs(ui_element.passes) do
		repeat
			local pass_data = pass_datas[i]

			if pass_info.retained_mode then
				local visible_previous = pass_data.visible
				pass_data.visible = visible

				if visible_previous and not visible then
					local pass_type = pass_info.pass_type
					local ui_pass = UIPasses[pass_type]

					ui_pass.destroy(self, pass_data, pass_info)

					break
				elseif not visible_previous and visible then
					pass_data.dirty = true
				end
			end
		until true
	end
end

UIRenderer.draw_border_fill_rect = function (self, lower_left_corner, size, color)
	local Gui_rect = Gui.rect
	local math_min = math.min
	local math_max = math.max
	local screen_width = RESOLUTION_LOOKUP.res_w
	local screen_height = RESOLUTION_LOOKUP.res_h
	local draw_position = Vector3(0, 0, 0)
	local draw_size = Vector3(0, 0, 0)
	local position = UIScaleVectorToResolution(lower_left_corner)
	local size = UIScaleVectorToResolution(size)
	color = Color(unpack(color))
	draw_position.z = position.z
	local rect_left_width = math_max(position.x, 0)

	if rect_left_width > 0 then
		draw_position.x = 0
		draw_position.x = 0
		draw_size.x = rect_left_width
		draw_size.y = screen_height

		Gui_rect(self.gui, draw_position, draw_size, color)
	end

	local rect_right_width = screen_width - math_min(position.x + size.x, screen_width)

	if rect_right_width > 0 then
		draw_position.x = position.x + size.x
		draw_position.y = 0
		draw_size.x = rect_right_width
		draw_size.y = screen_height

		Gui_rect(self.gui, draw_position, draw_size, color)
	end

	local rect_bottom_height = math_max(position.y, 0)

	if rect_bottom_height > 0 then
		draw_position.x = 0
		draw_position.y = 0
		draw_size.x = screen_width
		draw_size.y = rect_bottom_height

		Gui_rect(self.gui, draw_position, draw_size, color)
	end

	local rect_top_height = screen_height - math_min(position.y + size.y, screen_height)

	if rect_top_height > 0 then
		draw_position.x = 0
		draw_position.y = position.y + size.y
		draw_size.x = screen_width
		draw_size.y = rect_top_height

		Gui_rect(self.gui, draw_position, draw_size, color)
	end
end

UIRenderer.draw_rect = function (self, lower_left_corner, size, color, retained_id)
	local render_settings = self.render_settings
	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	color = Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	if retained_id == true then
		return Gui.rect(self.gui_retained, UIScaleVectorToResolution(lower_left_corner), UIScaleVectorToResolution(size), color)
	elseif retained_id then
		return Gui.update_rect(self.gui_retained, retained_id, UIScaleVectorToResolution(lower_left_corner), UIScaleVectorToResolution(size), color)
	else
		return Gui.rect(self.gui, UIScaleVectorToResolution(lower_left_corner), UIScaleVectorToResolution(size), color)
	end
end

UIRenderer.draw_triangle = function (self, lower_left_corner, size, ui_style, retained_id)
	local render_settings = self.render_settings
	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	local color = Color(ui_style.color[1] * alpha_multiplier, ui_style.color[2], ui_style.color[3], ui_style.color[4])
	local layer = lower_left_corner[3]
	local base_pos = Vector3(lower_left_corner[1], 0, lower_left_corner[2])
	local pos1, pos2, pos3 = nil

	if ui_style.triangle_alignment == "top_left" then
		pos1 = base_pos
		pos2 = base_pos + Vector3(0, 0, size[2])
		pos3 = base_pos + Vector3(size[1], 0, size[2])
	elseif ui_style.triangle_alignment == "top_right" then
		pos1 = base_pos + Vector3(0, 0, size[2])
		pos2 = base_pos + Vector3(size[1], 0, size[2])
		pos3 = base_pos + Vector3(size[1], 0, 0)
	elseif ui_style.triangle_alignment == "bottom_left" then
		pos1 = base_pos
		pos2 = base_pos + Vector3(size[1], 0, 0)
		pos3 = base_pos + Vector3(0, 0, size[2])
	else
		pos1 = base_pos
		pos2 = base_pos + Vector3(size[1], 0, 0)
		pos3 = base_pos + Vector3(size[1], 0, size[2])
	end

	if retained_id == true then
		return Gui.triangle(self.gui_retained, UIScaleVectorToResolution(pos1, nil, true), UIScaleVectorToResolution(pos2, nil, true), UIScaleVectorToResolution(pos3, nil, true), layer, color)
	elseif retained_id then
		return Gui.update_triangle(self.gui_retained, retained_id, UIScaleVectorToResolution(pos1, nil, true), UIScaleVectorToResolution(pos2, nil, true), UIScaleVectorToResolution(pos3, nil, true), layer, color)
	else
		return Gui.triangle(self.gui, UIScaleVectorToResolution(pos1, nil, true), UIScaleVectorToResolution(pos2, nil, true), UIScaleVectorToResolution(pos3, nil, true), layer, color)
	end
end

UIRenderer.draw_rect_rotated = function (self, size, position, angle, pivot, color)
	size = UIScaleVectorToResolution(size)
	local scaled_pivot = UIScaleVectorToResolution(pivot)
	local tm = Rotation2D(Vector3.zero(), angle, Vector2(scaled_pivot[1], scaled_pivot[2]))
	local translation = Matrix4x4.translation(tm)
	local scaled_position = UIScaleVectorToResolution(position)
	translation.x = translation.x + scaled_position.x
	translation.z = translation.z + scaled_position.y

	Matrix4x4.set_translation(tm, translation)

	local render_settings = self.render_settings
	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	color = Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	Gui.rect_3d(self.gui, tm, Vector3.zero(), position[3], size, color)
end

local font_name = "gw_arial_16"
local font_mtrl = "materials/fonts/" .. font_name

local function debug_draw_texture(self, pos, size, texture)
	local layer = tostring(pos[3])
	local position = {
		pos[1],
		pos[2],
		990
	}
	local color = {
		64,
		255,
		0,
		0
	}
	local frame_color = {
		192,
		255,
		0,
		0
	}

	UIRenderer.draw_rect(self, position, {
		size[1],
		1
	}, frame_color)
	UIRenderer.draw_rect(self, position, {
		1,
		size[2]
	}, frame_color)
	UIRenderer.draw_rect(self, {
		position[1] + size[1],
		position[2] + size[2],
		position[3]
	}, {
		-size[1],
		1
	}, frame_color)
	UIRenderer.draw_rect(self, {
		position[1] + size[1],
		position[2] + size[2],
		position[3]
	}, {
		1,
		-size[2]
	}, frame_color)

	local inv_scale = RESOLUTION_LOOKUP.inv_scale

	if math.point_is_inside_2d_box(inv_scale * Mouse.axis(2), pos, size) then
		UIRenderer.draw_rect(self, position, size, color)

		local text = string.format("%s : %s", layer, texture)
		local text_w, text_h = UIRenderer.text_size(self, text, font_mtrl, 12)
		position[2] = position[2] - text_h

		if position[1] + text_w > 1920 then
			position[1] = position[1] - text_w + size[1]
		end

		if position[2] < 0 then
			position[2] = position[2] + size[2]
		end

		UIRenderer.draw_rect(self, position, {
			text_w,
			text_h
		}, frame_color)
		UIRenderer.draw_text(self, text, font_mtrl, 12, font_name, {
			position[1],
			position[2] + 6,
			position[3]
		})
	end
end

local uvs_draw_texture_flip_horizontal = {
	{
		1,
		0
	},
	{
		0,
		1
	}
}

UIRenderer.draw_texture_flip_horizontal = function (self, material, lower_left_corner, size, color, masked, saturated)
	if script_data.ui_debug_draw_texture and Keyboard.button(Keyboard.button_index("v")) > 0 then
		debug_draw_texture(self, lower_left_corner, size, material)
	end

	local gui_position = UIScaleVectorToResolution(lower_left_corner)
	size = UIScaleVectorToResolution(size)

	return UIRenderer.script_draw_bitmap_uv(self.gui, self.render_settings, material, uvs_draw_texture_flip_horizontal, gui_position, size, color, masked, saturated)
end

UIRenderer.draw_texture = function (self, material, lower_left_corner, size, color, masked, saturated, retained_id)
	local scale = RESOLUTION_LOOKUP.scale
	local gui_position = Vector3(lower_left_corner[1] * scale, lower_left_corner[2] * scale, lower_left_corner[3] or 0)
	local gui_size = Vector3(size[1] * scale, size[2] * scale, size[3] or 0)

	if retained_id == true then
		return UIRenderer.script_draw_bitmap(self.gui_retained, self.render_settings, material, gui_position, gui_size, color, masked, saturated, nil)
	elseif retained_id then
		return UIRenderer.script_draw_bitmap(self.gui_retained, self.render_settings, material, gui_position, gui_size, color, masked, saturated, retained_id)
	else
		return UIRenderer.script_draw_bitmap(self.gui, self.render_settings, material, gui_position, gui_size, color, masked, saturated)
	end
end

UIRenderer.draw_texture_uv = function (self, material, lower_left_corner, size, uvs, color, masked, saturated, retained_id)
	if script_data.ui_debug_draw_texture and Keyboard.button(Keyboard.button_index("v")) > 0 then
		debug_draw_texture(self, lower_left_corner, size, material)
	end

	local gui_position = UIScaleVectorToResolution(lower_left_corner)
	size = UIScaleVectorToResolution(size)

	if retained_id == true then
		return UIRenderer.script_draw_bitmap_uv(self.gui_retained, self.render_settings, material, uvs, gui_position, size, color, masked, saturated, nil)
	elseif retained_id then
		return UIRenderer.script_draw_bitmap_uv(self.gui_retained, self.render_settings, material, uvs, gui_position, size, color, masked, saturated, retained_id)
	else
		return UIRenderer.script_draw_bitmap_uv(self.gui, self.render_settings, material, uvs, gui_position, size, color, masked, saturated)
	end
end

UIRenderer.draw_gradient_mask_texture = function (self, material, lower_left_corner, size, color, masked, gradient_threshold, retained_id)
	if script_data.ui_debug_draw_texture and Keyboard.button(Keyboard.button_index("v")) > 0 then
		debug_draw_texture(self, lower_left_corner, size, material)
	end

	local gui = self.gui
	local gui_retained = self.gui_retained
	local gui_position = UIScaleVectorToResolution(lower_left_corner)
	local gui_size = UIScaleVectorToResolution(size)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(material)
	local gui_material = Gui.material((retained_id and gui_retained) or gui, (texture_settings and texture_settings.material_name) or material)

	Material.set_scalar(gui_material, "gradient_threshold", gradient_threshold)

	if retained_id == true then
		return UIRenderer.script_draw_bitmap(self.gui_retained, self.render_settings, material, gui_position, gui_size, color, masked, nil, nil)
	elseif retained_id then
		return UIRenderer.script_draw_bitmap(self.gui_retained, self.render_settings, material, gui_position, gui_size, color, masked, nil, retained_id)
	else
		return UIRenderer.script_draw_bitmap(self.gui, self.render_settings, material, gui_position, gui_size, color, masked, nil)
	end
end

local tile_sizes_dummy = {}

UIRenderer.draw_multi_texture = function (self, materials, lower_left_corner, texture_size, texture_sizes, texture_offsets, tile_sizes, axis, spacing, direction, draw_count, texture_colors, color, masked, texture_saturation, saturated, retained_ids)
	local UIRenderer_script_draw_bitmap = UIRenderer.script_draw_bitmap
	local UIRenderer_draw_tiled_texture = UIRenderer.draw_tiled_texture
	axis = axis or 1
	direction = direction or 1
	local position = UIScaleVectorToResolution(lower_left_corner)
	local draw_position = Vector3(lower_left_corner[1], lower_left_corner[2], lower_left_corner[3])
	local unscaled_position = {
		lower_left_corner[1],
		lower_left_corner[2],
		lower_left_corner[3]
	}
	local spacing = spacing and UIScaleVectorToResolution(spacing)
	local gui = self.gui
	local gui_retained = self.gui_retained
	tile_sizes = tile_sizes or tile_sizes_dummy
	local draw_backwards = direction == 2
	local num_draws = draw_count or #materials

	if num_draws <= 0 then
		return
	end

	local new_retained_ids = nil

	if retained_ids == true then
		new_retained_ids = {}
	end

	for i = 1, num_draws, 1 do
		local material = materials[i]

		if texture_sizes then
			texture_size = texture_sizes[i] or texture_size
		end

		local draw_color = color
		local draw_saturated = saturated

		if texture_colors then
			draw_color = texture_colors[i] or color
		end

		if texture_saturation then
			draw_saturated = texture_saturation[i] or saturated
		end

		local tile_size = tile_sizes[i]

		if tile_size then
			local scaled_tile_size = UIScaleVectorToResolution(tile_size)

			if i == 1 and draw_backwards then
				position[axis] = position[axis] - scaled_tile_size[axis]
				unscaled_position[axis] = unscaled_position[axis] - tile_size[axis]
			end

			local texture_offset = texture_offsets and texture_offsets[i]

			if texture_offset then
				local offset = UIScaleVectorToResolution(texture_offset)
				draw_position[1] = unscaled_position[1] + offset[1]
				draw_position[2] = unscaled_position[2] + offset[2]
				draw_position[3] = unscaled_position[3] + offset[3]
			else
				draw_position[1] = unscaled_position[1]
				draw_position[2] = unscaled_position[2]
				draw_position[3] = unscaled_position[3]
			end

			local retained_id = nil

			if retained_ids == true then
				retained_id = UIRenderer_draw_tiled_texture(self, material, draw_position, tile_size, texture_size, draw_color, masked, retained_ids)
			elseif retained_ids then
				retained_id = retained_ids[i]

				UIRenderer_draw_tiled_texture(self, material, draw_position, tile_size, texture_size, draw_color, masked, retained_id)
			else
				UIRenderer_draw_tiled_texture(self, material, draw_position, tile_size, texture_size, draw_color, masked)
			end

			if new_retained_ids then
				new_retained_ids[i] = retained_id
			end

			if draw_backwards then
				position[axis] = position[axis] - scaled_tile_size[axis]
				unscaled_position[axis] = unscaled_position[axis] - tile_size[axis]
			else
				position[axis] = position[axis] + scaled_tile_size[axis]
				unscaled_position[axis] = unscaled_position[axis] + tile_size[axis]
			end
		else
			local scaled_texture_size = UIScaleVectorToResolution(texture_size)

			if i == 1 and draw_backwards then
				position[axis] = position[axis] - scaled_texture_size[axis]
				unscaled_position[axis] = unscaled_position[axis] - texture_size[axis]
			end

			local texture_offset = texture_offsets and texture_offsets[i]

			if texture_offset then
				local offset = UIScaleVectorToResolution(texture_offset)
				draw_position[1] = position[1] + offset[1]
				draw_position[2] = position[2] + offset[2]
				draw_position[3] = position[3] + offset[3]
			else
				draw_position[1] = position[1]
				draw_position[2] = position[2]
				draw_position[3] = position[3]
			end

			local retained_id = nil

			if retained_ids == true then
				retained_id = UIRenderer_script_draw_bitmap(gui_retained, self.render_settings, material, draw_position, scaled_texture_size, draw_color, masked, draw_saturated, nil)
			elseif retained_ids then
				retained_id = retained_ids[i]

				UIRenderer_script_draw_bitmap(gui_retained, self.render_settings, material, draw_position, scaled_texture_size, draw_color, masked, draw_saturated, retained_id)
			else
				UIRenderer_script_draw_bitmap(gui, self.render_settings, material, draw_position, scaled_texture_size, draw_color, masked, draw_saturated)
			end

			if new_retained_ids then
				new_retained_ids[i] = retained_id
			end

			if draw_backwards then
				position[axis] = position[axis] - scaled_texture_size[axis]
				unscaled_position[axis] = unscaled_position[axis] - texture_size[axis]
			else
				position[axis] = position[axis] + scaled_texture_size[axis]
				unscaled_position[axis] = unscaled_position[axis] + texture_size[axis]
			end
		end

		if spacing then
			if direction == 2 then
				position[axis] = position[axis] - spacing[axis]
			else
				position[axis] = position[axis] + spacing[axis]
			end
		end
	end

	return new_retained_ids
end

local uvs_draw_tiled_texture = {
	{
		0,
		0
	},
	{
		1,
		1
	}
}

UIRenderer.draw_tiled_texture = function (self, material, lower_left_corner, size, texture_size, color, masked, saturated, retained_ids)
	local UIRenderer_script_draw_bitmap_uv = UIRenderer.script_draw_bitmap_uv
	local position = UIScaleVectorToResolution(lower_left_corner)
	local area_size = UIScaleVectorToResolution(size)
	texture_size = UIScaleVectorToResolution(texture_size)
	local texture_size_x = texture_size[1]
	local texture_size_y = texture_size[2]
	local num_x = area_size[1] / texture_size[1]
	local gui = self.gui
	local gui_retained = self.gui_retained
	local v, q, m = Script.temp_count()
	local uvs_1 = Vector2(0, 0)
	local uvs_2 = Vector2(1, 1)
	local default_y_position = position.y
	local retained_id = nil

	while num_x > 0 do
		position.y = default_y_position
		local num_y = area_size[2] / texture_size[2]
		local x_amount = (num_x >= 1 and 1) or num_x
		uvs_draw_tiled_texture[2][1] = x_amount
		local x_size = texture_size_x * x_amount

		while num_y > 0 do
			local y_amount = (num_y >= 1 and 1) or num_y
			local y_size = texture_size_y * y_amount
			local draw_size = Vector2(x_size, y_size)
			uvs_draw_tiled_texture[1][2] = 1 - y_amount

			if retained_ids == true then
				retained_id = UIRenderer_script_draw_bitmap_uv(gui_retained, self.render_settings, uvs_draw_tiled_texture, position, draw_size, color, masked, saturated, nil)
			elseif retained_ids then
				retained_id = retained_ids[i]

				UIRenderer_script_draw_bitmap_uv(gui_retained, self.render_settings, material, uvs_draw_tiled_texture, position, draw_size, color, masked, saturated, retained_id)
			else
				UIRenderer_script_draw_bitmap_uv(gui, self.render_settings, material, uvs_draw_tiled_texture, position, draw_size, color, masked, saturated)
			end

			num_y = num_y - 1
			position.y = position.y + texture_size_y
		end

		num_x = num_x - 1
		position.x = position.x + texture_size_x
	end

	Script.set_temp_count(v, q, m)

	return retained_id
end

UIRenderer.draw_centered_texture_amount = function (self, material, lower_left_corner, size, texture_size, texture_amount, axis, spacing, color, texture_colors, masked, retained_ids)
	local position = UIScaleVectorToResolution(lower_left_corner)
	local area_size = UIScaleVectorToResolution(size)
	texture_size = UIScaleVectorToResolution(texture_size)
	local distance_spacing = spacing or 0
	local draw_size = Vector2(texture_size[1], texture_size[2])
	local distance_between_textures = area_size[axis] / (texture_amount + 1)
	local is_material_table = type(material) == "table"
	local gui = self.gui
	local gui_retained = self.gui_retained
	local new_retained_ids = nil

	if retained_ids == true then
		new_retained_ids = {}
	end

	for i = 1, texture_amount, 1 do
		local texture_color = (texture_colors and texture_colors[i] and texture_colors[i]) or color
		local texture_position = Vector3(position.x, position.y, position.z)
		texture_position[axis] = texture_position[axis] + distance_between_textures * i - texture_size[axis] * 0.5

		if retained_ids == true then
			local retained_id = UIRenderer.script_draw_bitmap(gui_retained, self.render_settings, (is_material_table and material[i]) or material, texture_position, draw_size, texture_color, masked, nil, nil)
			new_retained_ids[i] = retained_id
		elseif retained_ids then
			local retained_id = retained_ids[i]

			UIRenderer.script_draw_bitmap(gui_retained, self.render_settings, (is_material_table and material[i]) or material, texture_position, draw_size, texture_color, masked, nil, retained_id)
		else
			UIRenderer.script_draw_bitmap(gui, self.render_settings, (is_material_table and material[i]) or material, texture_position, draw_size, texture_color, masked, nil)
		end
	end

	return new_retained_ids
end

UIRenderer.draw_centered_uv_texture_amount = function (self, material, lower_left_corner, size, default_texture_size, texture_sizes, texture_uvs, texture_amount, axis, spacing, color, masked, saturated)
	local position = UIScaleVectorToResolution(lower_left_corner)
	local area_size = UIScaleVectorToResolution(size)
	default_texture_size = UIScaleVectorToResolution(default_texture_size)
	local distance_spacing = spacing or 0
	local distance_between_textures = area_size[axis] / (texture_amount + 1)
	local is_material_table = type(material) == "table"
	local gui = self.gui

	for i = 1, texture_amount, 1 do
		local texture_position = Vector3(position.x, position.y, position.z)
		texture_position[axis] = texture_position[axis] + distance_between_textures * i - default_texture_size[axis] * 0.5
		local uvs = texture_uvs[i]
		local texture_size_vector = UIScaleVectorToResolution(texture_sizes[i])
		local draw_size = Vector2(texture_size_vector[1], texture_size_vector[2])

		UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, (is_material_table and material[i]) or material, uvs, texture_position, draw_size, color, masked, saturated)
	end
end

UIRenderer.draw_texture_rotated = function (self, material, size, position, angle, pivot, color, optional_uvs, masked, retained_id)
	size = UIScaleVectorToResolution(size)
	local scaled_pivot = UIScaleVectorToResolution(pivot)
	local tm = Rotation2D(Vector3.zero(), angle, Vector2(scaled_pivot[1], scaled_pivot[2]))
	local translation = Matrix4x4.translation(tm)
	local scaled_position = UIScaleVectorToResolution(position)
	translation.x = translation.x + scaled_position.x
	translation.z = translation.z + scaled_position.y
	local render_settings = self.render_settings
	local snap_pixel_positions = render_settings and render_settings.snap_pixel_positions

	if snap_pixel_positions == nil then
		snap_pixel_positions = SNAP_PIXEL_POSITIONS
	end

	if snap_pixel_positions then
		translation = snap_to_position(translation)
	end

	Matrix4x4.set_translation(tm, translation)

	local gui = self.gui
	local gui_retained = self.gui_retained

	if retained_id == true then
		return UIRenderer.script_draw_bitmap_3d(gui_retained, render_settings, material, tm, position[3], size, color, optional_uvs, masked, nil)
	elseif retained_id then
		return UIRenderer.script_draw_bitmap_3d(gui_retained, render_settings, material, tm, position[3], size, color, optional_uvs, masked, retained_id)
	else
		return UIRenderer.script_draw_bitmap_3d(gui, render_settings, material, tm, position[3], size, color, optional_uvs, masked)
	end
end

local draw_text_var_args = {}

UIRenderer.draw_text = function (self, text, font_material, font_size, font_name, position, color, retained_id, color_override)
	if self.current_clipping_rect then
		local min, max = Gui.text_extents(self.gui, text, font_material, font_size)
		local size = max - min

		if not UIRenderer.is_clipped(self, position, size) then
			return
		end
	end

	local ui_position = UIScaleVectorToResolution(position)
	local use_color_override = (color_override and #color_override > 0) or nil

	if use_color_override then
		draw_text_var_args[#draw_text_var_args + 1] = "color_override"
		draw_text_var_args[#draw_text_var_args + 1] = color_override
	end

	local use_var_args = #draw_text_var_args > 0
	local return_value = nil
	local render_settings = self.render_settings
	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])
	local offscreen_target = render_settings and render_settings.offscreen_target

	if offscreen_target then
		font_name = font_name .. "_offscreen"
	end

	if use_var_args then
		if retained_id == true then
			return_value = Gui.text(self.gui_retained, text, font_material, font_size, font_name, ui_position, color, unpack(draw_text_var_args))
		elseif retained_id then
			Gui.update_text(self.gui_retained, retained_id, text, font_material, font_size, font_name, ui_position, color, unpack(draw_text_var_args))
		else
			Gui.text(self.gui, text, font_material, font_size, font_name, ui_position, color, unpack(draw_text_var_args))
		end
	elseif retained_id == true then
		return_value = Gui.text(self.gui_retained, text, font_material, font_size, font_name, ui_position, color)
	elseif retained_id then
		Gui.update_text(self.gui_retained, retained_id, text, font_material, font_size, font_name, ui_position, color)
	else
		Gui.text(self.gui, text, font_material, font_size, font_name, ui_position, color)
	end

	if use_var_args then
		table.clear(draw_text_var_args)
	end

	return return_value
end

UIRenderer.draw_justified_text = function (self, text, font_material, font_size, font_name, position, color, retained_id, justify_width, ...)
	if self.current_clipping_rect then
		local min, max = Gui.text_extents(self.gui, text, font_material, font_size)
		local size = max - min

		if not UIRenderer.is_clipped(self, position, size) then
			return
		end
	end

	local ui_position = UIScaleVectorToResolution(position)
	local render_settings = self.render_settings
	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	if retained_id == true then
		return Gui.text(self.gui_retained, text, font_material, font_size, font_name, ui_position, color, "justify", UIScaleScalarToResolution(justify_width), ...)
	elseif retained_id then
		Gui.update_text(self.gui_retained, retained_id, text, font_material, font_size, font_name, ui_position, color, "justify", UIScaleScalarToResolution(justify_width), ...)
	else
		Gui.text(self.gui, text, font_material, font_size, font_name, ui_position, color, "justify", UIScaleScalarToResolution(justify_width), ...)
	end
end

UIRenderer.word_wrap = function (self, text, font_material, size, width, option)
	local whitespace = " \u3002\uff0c"
	local soft_dividers = "-+&/*"
	local return_dividers = "\n"
	local reuse_global_table = true
	local scale = RESOLUTION_LOOKUP.scale
	local rows, return_indices = nil

	if option then
		rows, return_indices = Gui.word_wrap(self.gui, text, font_material, size, width * scale, whitespace, soft_dividers, return_dividers, reuse_global_table, option)
	else
		rows, return_indices = Gui.word_wrap(self.gui, text, font_material, size, width * scale, whitespace, soft_dividers, return_dividers, reuse_global_table)
	end

	return rows, return_indices
end

UIRenderer.text_size = function (self, text, font_material, font_size, ...)
	local min, max, caret = Gui.text_extents(self.gui, text, font_material, font_size, ...)
	local inv_scaling = RESOLUTION_LOOKUP.inv_scale
	local width = (max.x + min.x) * inv_scaling
	local height = (max.y - min.y) * inv_scaling

	return width, height, min
end

UIRenderer.text_alignment_size = function (self, text, font_material, font_size, ...)
	local min, max, caret = Gui.text_extents(self.gui, text, font_material, font_size, ...)
	local inv_scaling = RESOLUTION_LOOKUP.inv_scale
	local width = (max.x + 0) * inv_scaling
	local height = (max.y - min.y) * inv_scaling

	return width, height, min
end

UIRenderer.draw_video = function (self, material_name, position, size, color, optional_video_player)
	if script_data.disable_video_player then
		return true
	end

	local gui = self.gui
	local video_player = optional_video_player or self.video_player
	local pixel_snap = true
	local render_settings = self.render_settings
	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	Gui.video(gui, material_name, video_player, UIScaleVectorToResolution(position), UIScaleVectorToResolution(size, pixel_snap), color)

	local is_complete = VideoPlayer.current_frame(video_player) == VideoPlayer.number_of_frames(video_player)

	return is_complete
end

UIRenderer.draw_splash_video = function (self, material_name, position, size, color, optional_video_player)
	if script_data.disable_video_player then
		return true
	end

	local video_player = optional_video_player or self.video_player

	if VideoPlayer.current_frame(video_player) == VideoPlayer.number_of_frames(video_player) then
		return true
	end

	local gui = self.gui
	local w, h = Gui.resolution()
	local aspect_ratio = w / h
	local default_aspect_ratio = 1.7777777777777777
	local height = h
	local width = w

	if math.abs(aspect_ratio - default_aspect_ratio) > 0.005 then
		width = w
		height = width / default_aspect_ratio

		if h < height then
			width = h * default_aspect_ratio
			height = h
		end
	end

	local render_settings = self.render_settings
	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	Gui.video(gui, material_name, video_player, Vector3(w * 0.5 - width * 0.5, h * 0.5 - height * 0.5, position[3]), Vector2(width, height), color)
end

local circleVerts = {}
local CIRCLE_VERTS = 32

for i = 1, CIRCLE_VERTS, 1 do
	local a = i / CIRCLE_VERTS * math.pi * 2
	circleVerts[i * 2 - 1] = math.cos(a)
	circleVerts[i * 2] = math.sin(a)
end

UIRenderer.draw_circle = function (self, position, radius, size, color)
	local gui = self.gui
	local Gui_triangle = Gui.triangle
	local render_settings = self.render_settings
	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])
	local layer = 999
	local p1 = Vector3(unpack(position))
	p1.z = p1.y
	local x = p1.x
	local y = p1.y
	local p2 = Vector3(x + circleVerts[1] * radius, 0, y + circleVerts[2] * radius)

	for i = 2, CIRCLE_VERTS, 1 do
		local p3 = Vector3(x + circleVerts[i * 2 - 1] * radius, 0, y + circleVerts[i * 2] * radius)

		Gui_triangle(gui, p1, p2, p3, layer, color)

		p2 = p3
	end

	local p3 = Vector3(x + circleVerts[1] * radius, 0, y + circleVerts[2] * radius)

	Gui_triangle(gui, p1, p2, p3, layer, color)
end

UIRenderer.draw_rounded_rect = function (self, position, size, radius, color)
	local Gui_triangle = Gui.triangle
	position = UIScaleVectorToResolution(position)
	size = UIScaleVectorToResolution(size)
	local n = CIRCLE_VERTS / 4
	local x = position[1]
	local y = position[2]
	local w = size[1]
	local h = size[2]
	local n_v = 0
	local gui = self.gui
	local layer = position[3]
	local p1 = Vector3(position[1] + w / 2, 0, position[2] + h / 2)
	local p2 = Vector3((x + w) - radius + circleVerts[1] * radius, 0, (y + h) - radius + circleVerts[2] * radius)
	local render_settings = self.render_settings
	local alpha_multiplier = (render_settings and render_settings.alpha_multiplier) or 1
	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	for i = 2, n, 1 do
		local p3 = Vector3((x + w) - radius + circleVerts[i * 2 - 1] * radius, 0, (y + h) - radius + circleVerts[i * 2] * radius)

		Gui_triangle(gui, p1, p2, p3, layer, color)

		p2 = p3
	end

	for i = n, n * 2, 1 do
		local p3 = Vector3(x + radius + circleVerts[i * 2 - 1] * radius, 0, (y + h) - radius + circleVerts[i * 2] * radius)

		Gui_triangle(gui, p1, p2, p3, layer, color)

		p2 = p3
	end

	for i = n * 2, n * 3, 1 do
		local p3 = Vector3(x + radius + circleVerts[i * 2 - 1] * radius, 0, y + radius + circleVerts[i * 2] * radius)

		Gui_triangle(gui, p1, p2, p3, layer, color)

		p2 = p3
	end

	for i = n * 3, n * 4, 1 do
		local p3 = Vector3((x + w) - radius + circleVerts[i * 2 - 1] * radius, 0, y + radius + circleVerts[i * 2] * radius)

		Gui_triangle(gui, p1, p2, p3, layer, color)

		p2 = p3
	end

	local p3 = Vector3((x + w) - radius + circleVerts[1] * radius, 0, y + radius + circleVerts[2] * radius)

	Gui_triangle(gui, p1, p2, p3, layer, color)

	p2 = p3
	p3 = Vector3((x + w) - radius + circleVerts[1] * radius, 0, (y + h) - radius + circleVerts[2] * radius)

	Gui_triangle(gui, p1, p2, p3, layer, color)
end

UIRenderer.is_clipped = function (self, position, size)
	local x0, y0, x1, y1 = unpack(self.current_clipping_rect)

	return position.y <= y1 and y0 <= position.y + size.y and position.x <= x1 and x0 <= position.x + size.x
end

UIRenderer.clip_is_enclosing = function (position, size)
	local x0, y0, x1, y1 = unpack(self.current_clipping_rect)

	return y0 <= position.y and y1 >= position.y + size.y and x0 <= position.x and x1 >= position.x + size.x
end

UIRenderer.push_mouse_clip = function (self, scenegraph_id)
	self.mouse_clip = scenegraph_id
	self.mouse_clip_pos = UISceneGraph.get_world_position(self.ui_scenegraph, scenegraph_id)
	self.mouse_clip_size = UISceneGraph.get_size(self.ui_scenegraph, scenegraph_id)
end

UIRenderer.pop_mouse_clip = function (self)
	self.mouse_clip = nil
	self.mouse_clip_pos = nil
	self.mouse_clip_size = nil
end

local NilCursor = {
	0,
	0,
	0
}

UIRenderer.scaled_cursor_position_by_scenegraph = function (input_service, scenegraph, scenegraph_id, ignore_scale)
	local cursor = input_service:get("cursor") or NilCursor
	local scaled_cursor = (not ignore_scale and UIInverseScaleVectorToResolution(cursor)) or cursor
	local scenegraph_position = UISceneGraph.get_world_position(scenegraph, scenegraph_id)
	scaled_cursor.x = scaled_cursor.x - scenegraph_position[1]
	scaled_cursor.y = scaled_cursor.y - scenegraph_position[2]

	return scaled_cursor
end

UIRenderer.crop_text = function (text, max_chars)
	local text_length = UTF8Utils.string_length(text)

	if max_chars < text_length then
		local cropped_text = UTF8Utils.sub_string(text, 1, max_chars) .. "..."

		return cropped_text
	end

	return text
end

local crop_suffix = "..."

UIRenderer.crop_text_width = function (self, text, max_width, style)
	local font, scaled_font_size = UIFontByResolution(style)
	local text_width = UIRenderer.text_size(self, text, font[1], scaled_font_size)
	local crop_suffix_width = UIRenderer.text_size(self, crop_suffix, font[1], scaled_font_size)

	if max_width < text_width then
		repeat
			local width_percent = 1 - (1 - (max_width - crop_suffix_width) / text_width) * 0.5
			local num_char = UTF8Utils.string_length(text)
			num_char = math.floor(num_char * width_percent)
			text = UTF8Utils.sub_string(text, 1, num_char)

			if num_char <= 0 then
				return text
			end

			text_width = math.floor(UIRenderer.text_size(self, text, font[1], scaled_font_size))
		until text_width <= max_width

		local num_char = UTF8Utils.string_length(text)
		text = UTF8Utils.sub_string(text, 1, num_char) .. "..."
	end

	return text
end

UIRenderer.scaled_font_size_by_width = function (self, text, max_width, style)
	local font, scaled_font_size = UIFontByResolution(style)
	local text_width = UIRenderer.text_size(self, text, font[1], scaled_font_size)
	local crop_suffix_width = UIRenderer.text_size(self, crop_suffix, font[1], scaled_font_size)
	local min_font_size = 1
	local current_font_size = style.font_size
	local new_font_size = current_font_size

	if max_width < text_width then
		repeat
			if style.font_size <= min_font_size then
				break
			end

			style.font_size = math.max(style.font_size - 1, min_font_size)
			font, scaled_font_size = UIFontByResolution(style)
			text_width = math.floor(UIRenderer.text_size(self, text, font[1], scaled_font_size))
		until text_width <= max_width

		local num_char = UTF8Utils.string_length(text)
		text = UTF8Utils.sub_string(text, 1, num_char) .. "..."
	end

	new_font_size = style.font_size
	style.font_size = current_font_size

	return new_font_size
end

local uvs = {
	{
		0,
		0
	},
	{
		0,
		0
	}
}
local uvs_r = {
	{
		0,
		0
	},
	{
		0,
		0
	}
}
local uvs_u = {
	{
		0,
		0
	},
	{
		0,
		0
	}
}

UIRenderer.draw_texture_frame = function (self, position, size, texture_id, texture_size, texture_sizes, color, masked, saturated, only_corners)
	local UIRenderer_script_draw_bitmap_uv = UIRenderer.script_draw_bitmap_uv
	local gui = self.gui
	position = UIScaleVectorToResolution(position)
	size = UIScaleVectorToResolution(size)
	local corner = UIScalePositionTableToResolution(texture_sizes.corner)
	local horizontal = UIScalePositionTableToResolution(texture_sizes.horizontal)
	local vertical = UIScalePositionTableToResolution(texture_sizes.vertical)
	texture_size = UIScalePositionTableToResolution(texture_size)
	local layer = position[3]

	Profiler.start("draw corners")

	local corner_size = corner
	local corner_size_x = corner_size[1]
	local corner_size_y = corner_size[2]
	local corner_size_vec = Vector2(unpack(corner_size))
	local x_pos = position.x
	local y_pos = position.y
	local texture_size_x = texture_size[1]
	local texture_size_y = texture_size[2]
	local x_size = size.x
	local y_size = size.y
	local corner_uv_size_x = corner_size_x / texture_size_x
	local corner_uv_size_y = corner_size_y / texture_size_y
	uvs[1][1] = 0
	uvs[1][2] = 1 - corner_uv_size_y
	uvs[2][1] = corner_uv_size_x
	uvs[2][2] = 1

	UIRenderer_script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(x_pos, y_pos, layer), corner_size_vec, color, masked, saturated)

	uvs[1][1] = 0
	uvs[1][2] = 0
	uvs[2][1] = corner_uv_size_x
	uvs[2][2] = corner_uv_size_y

	UIRenderer_script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(x_pos, (y_pos + y_size) - corner_size_y, layer), corner_size_vec, color, masked, saturated)

	uvs[1][1] = 1 - corner_uv_size_x
	uvs[1][2] = 0
	uvs[2][1] = 1
	uvs[2][2] = corner_uv_size_y

	UIRenderer_script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3((x_pos + x_size) - corner_size_x, (y_pos + y_size) - corner_size_y, layer), corner_size_vec, color, masked, saturated)

	uvs[1][1] = 1 - corner_uv_size_x
	uvs[1][2] = 1 - corner_uv_size_y
	uvs[2][1] = 1
	uvs[2][2] = 1

	UIRenderer_script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3((x_pos + x_size) - corner_size_x, y_pos, layer), corner_size_vec, color, masked, saturated)

	uvs[1][1] = corner_uv_size_x
	uvs[1][2] = corner_uv_size_y
	uvs[2][1] = 1 - corner_uv_size_x
	uvs[2][2] = 1 - corner_uv_size_y

	UIRenderer_script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(x_pos + corner_size_x, y_pos + corner_size_y, layer), size - corner_size_vec * 2, color, masked, saturated)
	Profiler.stop("draw corners")

	if only_corners then
		return
	end

	Profiler.start("tile bar vertical")

	local tile_vertical_size = vertical
	local tile_vertical_size_x = tile_vertical_size[1]
	local tile_vertical_size_y = tile_vertical_size[2]
	local tile_vertical_size_vec = Vector2(unpack(tile_vertical_size))
	local bar_height = size[2] - corner_size_y * 2
	tile_vertical_size_vec[2] = bar_height
	uvs[1][1] = 0
	uvs[1][2] = 0.5 - tile_vertical_size_y / size[2] * 0.5
	uvs[2][1] = tile_vertical_size_x / texture_size_x
	uvs[2][2] = 0.5 + tile_vertical_size_y / size[2] * 0.5
	uvs_r[1][1] = 1 - tile_vertical_size_x / texture_size_x
	uvs_r[1][2] = 0.5 - tile_vertical_size_y / size[2] * 0.5
	uvs_r[2][1] = 1
	uvs_r[2][2] = 0.5 + tile_vertical_size_y / size[2] * 0.5
	local math_floor = math.floor
	local tile_pos_y = y_pos + corner_size_y

	UIRenderer_script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(x_pos, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated)
	UIRenderer_script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs_r, Vector3((x_pos + x_size) - tile_vertical_size_x, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated)
	Profiler.stop("tile bar vertical")
	Profiler.start("tile bar horizontal")

	local tile_horizontal_size = horizontal
	local tile_horizontal_size_x = tile_horizontal_size[1]
	local tile_horizontal_size_y = tile_horizontal_size[2]
	local tile_horizontal_size_vec = Vector2(unpack(tile_horizontal_size))
	local bar_width = size[1] - corner_size_x * 2
	tile_horizontal_size_vec[1] = bar_width
	uvs_u[1][1] = 0.5 - tile_horizontal_size_x / size[1] * 0.5
	uvs_u[1][2] = 0
	uvs_u[2][1] = 0.5 + tile_horizontal_size_x / size[1] * 0.5
	uvs_u[2][2] = tile_horizontal_size_y / texture_size_y
	uvs[1][1] = 0.5 - tile_horizontal_size_x / size[1] * 0.5
	uvs[1][2] = 1 - tile_horizontal_size_y / texture_size_y
	uvs[2][1] = 0.5 + tile_horizontal_size_x / size[1] * 0.5
	uvs[2][2] = 1
	local tile_pos_x = x_pos + corner_size_x

	UIRenderer_script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(tile_pos_x, y_pos, layer), tile_horizontal_size_vec, color, masked, saturated)
	UIRenderer_script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs_u, Vector3(tile_pos_x, (y_pos + y_size) - tile_horizontal_size_y, layer), tile_horizontal_size_vec, color, masked, saturated)
	Profiler.stop("tile bar horizontal")
end

UIRenderer.destroy_bitmap = function (self, retained_id)
	Gui.destroy_bitmap(self.gui_retained, retained_id)
end

UIRenderer.destroy_text = function (self, retained_id)
	Gui.destroy_text(self.gui_retained, retained_id)
end

require("scripts/ui/ui_passes")

return
