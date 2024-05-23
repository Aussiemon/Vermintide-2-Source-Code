-- chunkname: @scripts/ui/ui_renderer.lua

print("[UIRenderer] Loading")
require("scripts/utils/strict_table")
require("scripts/ui/ui_scenegraph")
require("scripts/ui/ui_resolution")
require("scripts/utils/debug_key_handler")
require("scripts/helpers/ui_atlas_helper")

script_data.ui_debug_scenegraph = script_data.ui_debug_scenegraph or Development.parameter("ui_debug_scenegraph")
script_data.ui_debug_pixeldistance = script_data.ui_debug_pixeldistance or Development.parameter("ui_debug_pixeldistance")
script_data.ui_debug_draw_texture = script_data.ui_debug_draw_texture or Development.parameter("ui_debug_draw_texture")

local Color, Vector2, Vector3 = Color, Vector2, Vector3
local Gui_bitmap_uv, Gui_bitmap = Gui.bitmap_uv, Gui.bitmap
local Gui_update_bitmap_uv, Gui_update_bitmap = Gui.update_bitmap_uv, Gui.update_bitmap
local RESOLUTION_LOOKUP = RESOLUTION_LOOKUP
local UIAtlasHelper = UIAtlasHelper

UIRenderer = {}

local UIRenderer = UIRenderer

SNAP_PIXEL_POSITIONS = true

local relative_uvs = {
	{
		0,
		0,
	},
	{
		1,
		1,
	},
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

UIRenderer.script_draw_bitmap = function (gui, render_settings, material, gui_position, gui_size, color, masked, saturated, retained_id, point_sample, viewport_mask)
	local snap_pixel_positions = render_settings and render_settings.snap_pixel_positions

	if snap_pixel_positions == nil then
		snap_pixel_positions = SNAP_PIXEL_POSITIONS
	end

	if snap_pixel_positions then
		gui_position = snap_to_position(gui_position)
	end

	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1
	local texture_settings

	if UIAtlasHelper.has_atlas_settings_by_texture_name(material) then
		texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(material)
	end

	if not color then
		color = Color(255 * alpha_multiplier, 255, 255, 255)
	else
		color = Color(color[1] * alpha_multiplier, color[2], color[3], color[4])
	end

	if texture_settings then
		local uv00_table = texture_settings.uv00
		local uv11_table = texture_settings.uv11
		local uv00 = Vector2(uv00_table[1], uv00_table[2])
		local uv11 = Vector2(uv11_table[1], uv11_table[2])
		local material_name

		if not masked then
			if saturated then
				material_name = texture_settings.saturated_material_name
			elseif point_sample then
				material_name = texture_settings.point_sample_material_name
			elseif viewport_mask then
				material_name = texture_settings.viewport_mask_material_name
			else
				material_name = texture_settings.material_name
			end
		elseif saturated then
			material_name = texture_settings.masked_saturated_material_name
		elseif point_sample then
			material_name = texture_settings.masked_point_sample_material_name
		else
			material_name = texture_settings.masked_material_name
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

UIRenderer.script_draw_bitmap_uv = function (gui, render_settings, material, uvs, gui_position, gui_size, color, masked, saturated, retained_id, point_sample, viewport_mask)
	local snap_pixel_positions = render_settings and render_settings.snap_pixel_positions

	if snap_pixel_positions == nil then
		snap_pixel_positions = SNAP_PIXEL_POSITIONS
	end

	if snap_pixel_positions then
		gui_position = snap_to_position(gui_position)
	end

	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1

	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	local texture_settings

	if UIAtlasHelper.has_atlas_settings_by_texture_name(material) then
		texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(material)
	end

	if texture_settings then
		local new_uvs = get_relative_uvs(texture_settings.uv00, texture_settings.uv11, uvs)
		local new_uvs1, new_uvs2 = new_uvs[1], new_uvs[2]
		local uv00 = Vector2(new_uvs1[1], new_uvs1[2])
		local uv11 = Vector2(new_uvs2[1], new_uvs2[2])
		local material_name

		if masked then
			material_name = texture_settings.masked_material_name
		elseif saturated then
			material_name = texture_settings.saturated_material_name
		elseif viewport_mask then
			material_name = texture_settings.viewport_mask_material_name
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

local Gui_update_bitmap_3d_uv, Gui_bitmap_3d_uv, Gui_update_bitmap_3d, Gui_bitmap_3d = Gui.update_bitmap_3d_uv, Gui.bitmap_3d_uv, Gui.update_bitmap_3d, Gui.bitmap_3d

UIRenderer.script_draw_bitmap_3d = function (gui, render_settings, material, tm, gui_layer, gui_size, color, optional_uvs, masked, retained_id)
	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1

	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	local texture_settings

	if UIAtlasHelper.has_atlas_settings_by_texture_name(material) then
		texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(material)
	end

	if texture_settings then
		local material_name

		if masked then
			material_name = texture_settings.masked_material_name
		else
			material_name = texture_settings.material_name
		end

		local uv00, uv11

		if optional_uvs then
			local new_uvs = get_relative_uvs(texture_settings.uv00, texture_settings.uv11, optional_uvs)
			local new_uvs1, new_uvs2 = new_uvs[1], new_uvs[2]

			uv00 = Vector2(new_uvs1[1], new_uvs1[2])
			uv11 = Vector2(new_uvs2[1], new_uvs2[2])
		else
			uv00, uv11 = texture_settings.uv00, texture_settings.uv11
		end

		if retained_id then
			return Gui_update_bitmap_3d_uv(gui, retained_id, material_name, Vector2(uv00[1], uv00[2]), Vector2(uv11[1], uv11[2]), tm, Vector3.zero(), gui_layer, gui_size, color)
		else
			return Gui_bitmap_3d_uv(gui, material_name, Vector2(uv00[1], uv00[2]), Vector2(uv11[1], uv11[2]), tm, Vector3.zero(), gui_layer, gui_size, color)
		end
	elseif optional_uvs then
		local new_uvs1, new_uvs2 = optional_uvs[1], optional_uvs[2]
		local uv00, uv11

		uv00 = Vector2(new_uvs1[1], new_uvs1[2])
		uv11 = Vector2(new_uvs2[1], new_uvs2[2])

		if retained_id then
			return Gui_update_bitmap_3d_uv(gui, retained_id, material, Vector2(uv00[1], uv00[2]), Vector2(uv11[1], uv11[2]), tm, Vector3.zero(), gui_layer, gui_size, color)
		else
			return Gui_bitmap_3d_uv(gui, material, Vector2(uv00[1], uv00[2]), Vector2(uv11[1], uv11[2]), tm, Vector3.zero(), gui_layer, gui_size, color)
		end
	elseif retained_id then
		return Gui_update_bitmap_3d(gui, retained_id, material, tm, Vector3.zero(), gui_layer, gui_size, color)
	else
		return Gui_bitmap_3d(gui, material, tm, Vector3.zero(), gui_layer, gui_size, color)
	end
end

UIRenderer._injected_material_sets = {}

local function inject_materials(i, ...)
	local material = UIRenderer._injected_material_sets[i]

	if material then
		return "material", material, inject_materials(i + 1, ...)
	end

	return ...
end

UIRenderer.create = function (world, ...)
	local gui = World.create_screen_gui(world, "immediate", inject_materials(1, ...))
	local gui_retained = World.create_screen_gui(world, inject_materials(1, ...))

	return UIRenderer.create_ui_renderer(world, gui, gui_retained)
end

local UI_RENDERER_INTERFACE = table.set({
	"gui",
	"gui_retained",
	"ui_scenegraph",
	"scenegraph_queue",
	"input_service",
	"dt",
	"video_players",
	"world",
	"wwise_world",
	"render_settings",
	"debug_startpoint",
})

UIRenderer.create_ui_renderer = function (world, gui, gui_retained)
	return table.make_strict({
		gui = gui,
		gui_retained = gui_retained,
		scenegraph_queue = {},
		video_players = {},
		world = world,
		wwise_world = Managers.world:wwise_world(world),
	}, UI_RENDERER_INTERFACE)
end

UIRenderer.create_video_player = function (self, reference_name, world, resource, set_loop)
	if script_data.disable_video_player then
		return
	end

	local video_players = self.video_players

	assert(not video_players[reference_name])

	local video_world = world or self.world
	local video_player = World.create_video_player(video_world, resource, set_loop)

	video_players[reference_name] = video_player

	if set_loop == false then
		VideoPlayer.set_loop(video_player, false)
	end
end

UIRenderer.destroy_video_player = function (self, reference_name, world)
	if script_data.disable_video_player then
		return
	end

	local video_players = self.video_players
	local video_player = video_players[reference_name]

	assert(video_player)
	World.destroy_video_player(world or self.world, video_player)

	video_players[reference_name] = nil
end

UIRenderer.destroy = function (self, world)
	local video_players = self.video_players

	for reference_name, video_player in pairs(video_players) do
		World.destroy_video_player(world or self.world, video_player)

		video_players[reference_name] = nil
	end

	world = world or self.world

	World.destroy_gui(world, self.gui)
	World.destroy_gui(world, self.gui_retained)
end

UIRenderer.clear_scenegraph_queue = function (self)
	self.ui_scenegraph = nil

	table.clear(self.scenegraph_queue)
end

UIRenderer.begin_pass = function (self, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)
	if self.ui_scenegraph then
		local old_scenegraph = self.ui_scenegraph

		self.scenegraph_queue[#self.scenegraph_queue + 1] = old_scenegraph
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
end

UIRenderer.end_pass = function (self)
	self.render_settings = nil

	local queue = self.scenegraph_queue
	local n_queue = #queue

	if n_queue > 0 then
		self.ui_scenegraph = queue[n_queue]
		queue[n_queue] = nil
	else
		self.ui_scenegraph = nil
	end
end

local DUMMY = {
	alpha_multiplier = 1,
}

UIRenderer.draw_all_widgets = function (self, widget_list)
	local render_settings = self.render_settings or DUMMY
	local base_alpha_multiplier = render_settings.alpha_multiplier or 1
	local draw_widget = UIRenderer.draw_widget

	for _, widget in pairs(widget_list) do
		render_settings.alpha_multiplier = (widget.content.alpha_multiplier or 1) * base_alpha_multiplier

		draw_widget(self, widget)
	end

	render_settings.alpha_multiplier = base_alpha_multiplier
end

local Profiler_start, Profiler_stop = Profiler.start, Profiler.stop

UIRenderer.draw_widget = function (self, widget)
	local ui_animations = widget.animations

	if next(ui_animations) then
		for ui_animation in pairs(ui_animations) do
			UIAnimation.update(ui_animation, self.dt)

			if UIAnimation.completed(ui_animation) then
				ui_animations[ui_animation] = nil
			end
		end
	end

	local UIPasses = UIPasses
	local UISceneGraph_get_size_scaled = UISceneGraph.get_size_scaled
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_service
	local dt = self.dt
	local scenegraph_id = widget.scenegraph_id
	local world_pos = ui_scenegraph[scenegraph_id].world_position
	local offset = widget.offset or UISceneGraph.ZERO_VECTOR3
	local pos_x = world_pos[1] + offset[1]
	local pos_y = world_pos[2] + offset[2]
	local pos_z = world_pos[3] + offset[3]
	local widget_content = widget.content
	local widget_style = widget.style
	local size = UISceneGraph_get_size_scaled(ui_scenegraph, scenegraph_id)
	local widget_visible = true
	local input_manager = Managers.input

	if input_manager then
		local gamepad_active = input_manager:is_device_active("gamepad")

		widget_content.is_gamepad_active = gamepad_active

		if widget_content.disable_with_gamepad then
			widget_visible = not gamepad_active
		end
	end

	local widget_element = widget.element
	local widget_dirty = widget_element.dirty
	local passes = widget_element.passes
	local pass_datas = widget_element.pass_data

	for i = 1, #passes do
		do
			local pass = passes[i]
			local pass_type = pass.pass_type
			local visible = widget_visible

			if widget_content.visible == false then
				visible = false
			end

			local pass_content = widget_content

			do
				local content_id = pass.content_id

				if content_id then
					pass_content = widget_content[content_id]

					if not pass_content then
						pass_content = widget_content
					else
						pass_content.parent = widget_content

						if pass_content.visible == false then
							visible = false
						end
					end
				end
			end

			local pass_style = widget_style

			do
				local style_id = pass.style_id

				if style_id then
					pass_style = widget_style[style_id]

					if pass_style then
						pass_style.parent = widget_style
					else
						pass_style = widget_style
					end
				end
			end

			if visible then
				do
					local content_check_function = pass.content_check_function

					if content_check_function then
						visible = not not content_check_function(pass_content, pass_style)
					end
				end

				if visible then
					local content_change_function = pass.content_change_function

					if content_change_function then
						content_change_function(pass_content, pass_style, ui_animations, dt, self.render_settings)
					end
				end
			end

			local ui_pass = UIPasses[pass_type]
			local pass_data = pass_datas[i]

			if ui_pass.update then
				ui_pass.update(self, pass_data, ui_scenegraph, pass, pass_style, pass_content, input_service, dt, visible)
			end

			if pass.retained_mode then
				if visible == not pass_data.visible then
					pass_data.visible = visible

					if visible then
						pass_data.dirty = true
					else
						ui_pass.destroy(self, pass_data, pass)

						goto label_1_0
					end
				end

				if not widget_dirty and not pass_data.dirty then
					goto label_1_0
				end
			end

			if visible then
				local pass_size = size
				local pass_pos_x, pass_pos_y, pass_pos_z = pos_x, pos_y, pos_z

				do
					local pass_scenegraph_id = pass_style.scenegraph_id or pass.scenegraph_id

					if pass_scenegraph_id then
						pass_size = UISceneGraph_get_size_scaled(ui_scenegraph, pass_scenegraph_id)

						local pass_world_pos = ui_scenegraph[pass_scenegraph_id].world_position

						pass_pos_x, pass_pos_y, pass_pos_z = pass_world_pos[1], pass_world_pos[2], pass_world_pos[3]
					end
				end

				do
					local pass_style_size = pass_style.size

					if pass_style_size then
						pass_size = Vector2(pass_style_size[1] or pass_size[1], pass_style_size[2] or pass_size[2])
					end
				end

				do
					local style_offset = pass_style.offset

					if style_offset then
						pass_pos_x = pass_pos_x + style_offset[1]
						pass_pos_y = pass_pos_y + style_offset[2]
						pass_pos_z = pass_pos_z + (style_offset[3] or 0)
					end
				end

				ui_pass.draw(self, pass_data, ui_scenegraph, pass, pass_style, pass_content, Vector3(pass_pos_x, pass_pos_y, pass_pos_z), pass_size, input_service, dt)
			end
		end

		::label_1_0::
	end

	widget_element.dirty = nil
end

UIRenderer.set_element_visible = function (self, ui_element, visible)
	local UIPasses = UIPasses
	local pass_datas = ui_element.pass_data
	local element_passes = ui_element.passes

	for i = 1, #element_passes do
		local pass_info = element_passes[i]

		if pass_info.retained_mode then
			local pass_data = pass_datas[i]

			if visible ~= pass_data.visible then
				if visible then
					pass_data.dirty = true
				else
					local pass_type = pass_info.pass_type
					local ui_pass = UIPasses[pass_type]

					ui_pass.destroy(self, pass_data, pass_info)
				end

				pass_data.visible = visible
			end
		end
	end
end

UIRenderer.draw_rect = function (self, lower_left_corner, size, color, retained_id)
	local render_settings = self.render_settings
	local snap_pixel_positions = render_settings and render_settings.snap_pixel_positions

	if snap_pixel_positions == nil then
		snap_pixel_positions = SNAP_PIXEL_POSITIONS
	end

	if snap_pixel_positions then
		lower_left_corner = snap_to_position(lower_left_corner)
	end

	local scaled_position = UIScaleVectorToResolution(lower_left_corner)
	local scaled_size = UIScaleVectorToResolution(size)
	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1

	color = Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	if retained_id == true then
		return Gui.rect(self.gui_retained, scaled_position, scaled_size, color)
	elseif retained_id then
		return Gui.update_rect(self.gui_retained, retained_id, scaled_position, scaled_size, color)
	else
		return Gui.rect(self.gui, scaled_position, scaled_size, color)
	end
end

UIRenderer.draw_triangle = function (self, lower_left_corner, size, ui_style, retained_id)
	local render_settings = self.render_settings
	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1
	local color = Color(ui_style.color[1] * alpha_multiplier, ui_style.color[2], ui_style.color[3], ui_style.color[4])
	local layer = lower_left_corner[3]
	local base_pos = Vector3(lower_left_corner[1], 0, lower_left_corner[2])
	local pos1, pos2, pos3

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
	elseif ui_style.triangle_alignment == "up" then
		pos1 = base_pos
		pos2 = base_pos + Vector3(size[1], 0, 0)
		pos3 = base_pos + Vector3(size[1] * 0.5, 0, size[2])
	elseif ui_style.triangle_alignment == "down" then
		pos1 = base_pos + Vector3(0, 0, size[2])
		pos2 = base_pos + Vector3(size[1] * 0.5, 0, 0)
		pos3 = base_pos + Vector3(size[1], 0, size[2])
	elseif ui_style.triangle_alignment == "left" then
		pos1 = base_pos + Vector3(0, 0, size[2] * 0.5)
		pos2 = base_pos + Vector3(size[1], 0, 0)
		pos3 = base_pos + Vector3(0, 0, size[2])
	elseif ui_style.triangle_alignment == "right" then
		pos1 = base_pos + Vector3(0, 0, size[2])
		pos2 = base_pos + Vector3(size[1], 0, size[2] * 0.5)
		pos3 = base_pos + Vector3(0, 0, 0)
	else
		pos1 = base_pos
		pos2 = base_pos + Vector3(size[1], 0, 0)
		pos3 = base_pos + Vector3(size[1], 0, size[2])
	end

	if retained_id == true then
		return Gui.triangle(self.gui_retained, UIScaleVectorToResolutionRealCoordinates(pos1), UIScaleVectorToResolutionRealCoordinates(pos2), UIScaleVectorToResolutionRealCoordinates(pos3), layer, color)
	elseif retained_id then
		return Gui.update_triangle(self.gui_retained, retained_id, UIScaleVectorToResolutionRealCoordinates(pos1), UIScaleVectorToResolutionRealCoordinates(pos2), UIScaleVectorToResolutionRealCoordinates(pos3), layer, color)
	else
		return Gui.triangle(self.gui, UIScaleVectorToResolutionRealCoordinates(pos1), UIScaleVectorToResolutionRealCoordinates(pos2), UIScaleVectorToResolutionRealCoordinates(pos3), layer, color)
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
	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1

	color = Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	Gui.rect_3d(self.gui, tm, Vector3.zero(), position[3], size, color)
end

local DEBUG_FONT_NAME = "arial"
local DEBUG_FONT_MTRL = "materials/fonts/" .. DEBUG_FONT_NAME

local function debug_draw_texture(self, pos, size, texture)
	local layer = tostring(pos[3])
	local position = {
		pos[1],
		pos[2],
		990,
	}
	local color = {
		64,
		255,
		0,
		0,
	}
	local frame_color = {
		192,
		255,
		0,
		0,
	}

	UIRenderer.draw_rect(self, position, {
		size[1],
		1,
	}, frame_color)
	UIRenderer.draw_rect(self, position, {
		1,
		size[2],
	}, frame_color)
	UIRenderer.draw_rect(self, {
		position[1] + size[1],
		position[2] + size[2],
		position[3],
	}, {
		-size[1],
		1,
	}, frame_color)
	UIRenderer.draw_rect(self, {
		position[1] + size[1],
		position[2] + size[2],
		position[3],
	}, {
		1,
		-size[2],
	}, frame_color)

	local inv_scale = RESOLUTION_LOOKUP.inv_scale

	if math.point_is_inside_2d_box(inv_scale * Mouse.axis(2), pos, size) then
		UIRenderer.draw_rect(self, position, size, color)

		local text = string.format("%s : %s", layer, texture)
		local text_w, text_h = UIRenderer.text_size(self, text, DEBUG_FONT_MTRL, 12)

		position[2] = position[2] - text_h

		if position[1] + text_w > 1920 then
			position[1] = position[1] - text_w + size[1]
		end

		if position[2] < 0 then
			position[2] = position[2] + size[2]
		end

		UIRenderer.draw_rect(self, position, {
			text_w,
			text_h,
		}, frame_color)
		UIRenderer.draw_text(self, text, DEBUG_FONT_MTRL, 12, DEBUG_FONT_NAME, {
			position[1],
			position[2] + 6,
			position[3],
		})
	end
end

local uvs_draw_texture_flip_horizontal = {
	{
		1,
		0,
	},
	{
		0,
		1,
	},
}

UIRenderer.draw_texture_flip_horizontal = function (self, material, lower_left_corner, size, color, masked, saturated)
	if script_data.ui_debug_draw_texture and Keyboard.button(Keyboard.button_index("v")) > 0 then
		debug_draw_texture(self, lower_left_corner, size, material)
	end

	local gui_position = UIScaleVectorToResolution(lower_left_corner)

	size = UIScaleVectorToResolution(size)

	return UIRenderer.script_draw_bitmap_uv(self.gui, self.render_settings, material, uvs_draw_texture_flip_horizontal, gui_position, size, color, masked, saturated)
end

UIRenderer.draw_texture = function (self, material, position, size, color, masked, saturated, retained_id, point_sample, viewport_mask)
	local gui = self.gui

	if retained_id then
		gui = self.gui_retained

		if retained_id == true then
			retained_id = nil
		end
	end

	local scale = RESOLUTION_LOOKUP.scale

	return UIRenderer.script_draw_bitmap(gui, self.render_settings, material, Vector3(position[1] * scale, position[2] * scale, position[3] or 0), Vector3(size[1] * scale, size[2] * scale, size[3] or 0), color, masked, saturated, retained_id, point_sample, viewport_mask)
end

UIRenderer.draw_texture_uv = function (self, material, lower_left_corner, size, uvs, color, masked, saturated, retained_id, point_sample, viewport_mask)
	if script_data.ui_debug_draw_texture and Keyboard.button(Keyboard.button_index("v")) > 0 then
		debug_draw_texture(self, lower_left_corner, size, material)
	end

	local gui_position = UIScaleVectorToResolution(lower_left_corner)

	size = UIScaleVectorToResolution(size)

	if retained_id == true then
		return UIRenderer.script_draw_bitmap_uv(self.gui_retained, self.render_settings, material, uvs, gui_position, size, color, masked, saturated, nil, point_sample, viewport_mask)
	elseif retained_id then
		return UIRenderer.script_draw_bitmap_uv(self.gui_retained, self.render_settings, material, uvs, gui_position, size, color, masked, saturated, retained_id, point_sample, viewport_mask)
	else
		return UIRenderer.script_draw_bitmap_uv(self.gui, self.render_settings, material, uvs, gui_position, size, color, masked, saturated, nil, point_sample, viewport_mask)
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
	local gui_material = Gui.material(retained_id and gui_retained or gui, texture_settings and texture_settings.material_name or material)

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
	local unscaled_position = Vector3(lower_left_corner[1], lower_left_corner[2], lower_left_corner[3])

	spacing = spacing and UIScaleVectorToResolution(spacing)

	local gui = self.gui
	local gui_retained = self.gui_retained

	tile_sizes = tile_sizes or tile_sizes_dummy

	local draw_backwards = direction == 2
	local num_draws = draw_count or #materials

	if num_draws <= 0 then
		return
	end

	local new_retained_ids

	if retained_ids == true then
		new_retained_ids = {}
	end

	for i = 1, num_draws do
		local material = materials[i]

		texture_size = texture_sizes and texture_sizes[i] or texture_size

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

			local retained_id

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

			local retained_id

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
				position[1] = position[1] - spacing[1]
				position[2] = position[2] - spacing[2]
			else
				position[1] = position[1] + spacing[1]
				position[2] = position[2] + spacing[2]
			end
		end
	end

	return new_retained_ids
end

local uvs_draw_tiled_texture = {
	{
		0,
		0,
	},
	{
		1,
		1,
	},
}

UIRenderer.draw_tiled_texture = function (self, material, position, total_size, texture_size, color, masked, saturated, retained_ids)
	local scale = RESOLUTION_LOOKUP.scale
	local position_x = scale * position[1]
	local position_y = scale * position[2]

	position = Vector3(position_x, position_y, position[3] or 0)

	local texture_size_x = texture_size[1]
	local texture_size_y = texture_size[2]
	local num_x = total_size[1] / texture_size_x
	local num_y = total_size[2] / texture_size_y

	texture_size_x = scale * texture_size_x
	texture_size_y = scale * texture_size_y
	texture_size = Vector2(texture_size_x, texture_size_y)

	local script_draw_bitmap_uv = UIRenderer.script_draw_bitmap_uv
	local gui = self.gui
	local render_settings = self.render_settings
	local uvs = uvs_draw_tiled_texture

	uvs[2][1] = 1

	while num_x > 0 do
		if num_x < 1 then
			uvs[2][1] = num_x
			texture_size[1] = num_x * texture_size_x
		end

		local new_position_y = position_y

		position[2] = new_position_y
		uvs[2][2] = 1
		texture_size[2] = texture_size_y

		local new_num_y = num_y

		while new_num_y > 0 do
			if new_num_y < 1 then
				uvs[2][2] = new_num_y
				texture_size[2] = new_num_y * texture_size_y
			end

			script_draw_bitmap_uv(gui, render_settings, material, uvs, position, texture_size, color, masked, saturated)

			new_position_y = new_position_y + texture_size_y
			position[2] = new_position_y
			new_num_y = new_num_y - 1
		end

		position_x = position_x + texture_size_x
		position[1] = position_x
		num_x = num_x - 1
	end
end

UIRenderer.draw_centered_texture_amount = function (self, material, lower_left_corner, size, texture_size, texture_amount, axis, spacing, color, texture_colors, masked, retained_ids)
	local position = UIScaleVectorToResolution(lower_left_corner)
	local area_size = UIScaleVectorToResolution(size)

	texture_size = UIScaleVectorToResolution(texture_size)

	local draw_size = Vector2(texture_size[1], texture_size[2])
	local distance_between_textures = area_size[axis] / (texture_amount + 1)
	local is_material_table = type(material) == "table"
	local gui = self.gui
	local gui_retained = self.gui_retained
	local new_retained_ids

	if retained_ids == true then
		new_retained_ids = {}
	end

	for i = 1, texture_amount do
		local texture_color = texture_colors and texture_colors[i] and texture_colors[i] or color
		local texture_position = Vector3(position.x, position.y, position.z)

		texture_position[axis] = texture_position[axis] + (distance_between_textures * i - texture_size[axis] * 0.5)

		if retained_ids == true then
			local retained_id = UIRenderer.script_draw_bitmap(gui_retained, self.render_settings, is_material_table and material[i] or material, texture_position, draw_size, texture_color, masked, nil, nil)

			new_retained_ids[i] = retained_id
		elseif retained_ids then
			local retained_id = retained_ids[i]

			UIRenderer.script_draw_bitmap(gui_retained, self.render_settings, is_material_table and material[i] or material, texture_position, draw_size, texture_color, masked, nil, retained_id)
		else
			UIRenderer.script_draw_bitmap(gui, self.render_settings, is_material_table and material[i] or material, texture_position, draw_size, texture_color, masked, nil)
		end
	end

	return new_retained_ids
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
	local ui_position = UIScaleVectorToResolution(position)
	local use_color_override = color_override and #color_override > 0 or nil

	if use_color_override then
		draw_text_var_args[#draw_text_var_args + 1] = "color_override"
		draw_text_var_args[#draw_text_var_args + 1] = color_override
	end

	local use_var_args = #draw_text_var_args > 0
	local return_value
	local render_settings = self.render_settings
	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1

	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	local offscreen_target = render_settings and render_settings.offscreen_target

	if offscreen_target then
		font_name = font_name .. "_offscreen"
	end

	local flags = Gui.FormatDirectives
	local font = Fonts[font_name]
	local font_flags = font and font[4]

	if font_flags then
		flags = bit.bor(flags, font_flags)
	end

	if use_var_args then
		if retained_id == true then
			return_value = Gui.text(self.gui_retained, text, font_material, font_size, font_name, ui_position, color, flags, unpack(draw_text_var_args))
		elseif retained_id then
			Gui.update_text(self.gui_retained, retained_id, text, font_material, font_size, font_name, ui_position, color, flags, unpack(draw_text_var_args))
		else
			Gui.text(self.gui, text, font_material, font_size, font_name, ui_position, color, flags, unpack(draw_text_var_args))
		end
	elseif retained_id == true then
		return_value = Gui.text(self.gui_retained, text, font_material, font_size, font_name, ui_position, color, flags)
	elseif retained_id then
		Gui.update_text(self.gui_retained, retained_id, text, font_material, font_size, font_name, ui_position, color, flags)
	else
		Gui.text(self.gui, text, font_material, font_size, font_name, ui_position, color, flags)
	end

	if use_var_args then
		table.clear(draw_text_var_args)
	end

	return return_value
end

UIRenderer.draw_justified_text = function (self, text, font_material, font_size, font_name, position, color, retained_id, justify_width, ...)
	local ui_position = UIScaleVectorToResolution(position)
	local render_settings = self.render_settings
	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1

	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	local flags = 0
	local font = Fonts[font_name]

	if font then
		flags = font[4] or 0
	end

	local scaled_justify_width = justify_width * RESOLUTION_LOOKUP.scale

	if retained_id == true then
		return Gui.text(self.gui_retained, text, font_material, font_size, font_name, ui_position, color, flags, "justify", scaled_justify_width, ...)
	elseif retained_id then
		Gui.update_text(self.gui_retained, retained_id, text, font_material, font_size, font_name, ui_position, color, flags, "justify", scaled_justify_width, ...)
	else
		Gui.text(self.gui, text, font_material, font_size, font_name, ui_position, color, flags, "justify", scaled_justify_width, ...)
	end
end

UIRenderer.word_wrap = function (self, text, font_material, size, width, option, optional_font_name)
	local whitespace, soft_dividers, return_dividers = " 。，", " -+&/*", "\n"
	local reuse_global_table = true
	local scale = RESOLUTION_LOOKUP.scale
	local rows, return_indices
	local flags = Gui.FormatDirectives

	if optional_font_name then
		local font = Fonts[optional_font_name]
		local font_flags = font and font[4]

		if font[4] then
			flags = bit.bor(flags, font_flags)
		end
	end

	if option then
		rows, return_indices = Gui.word_wrap(self.gui, text, font_material, size, width * scale, whitespace, soft_dividers, return_dividers, reuse_global_table, option, flags)
	else
		rows, return_indices = Gui.word_wrap(self.gui, text, font_material, size, width * scale, whitespace, soft_dividers, return_dividers, reuse_global_table, flags)
	end

	return rows, return_indices
end

UIRenderer.text_size = function (self, text, font_material, font_size, ...)
	local min, max = Gui.text_extents(self.gui, text, font_material, font_size, Gui.FormatDirectives, ...)
	local inv_scaling = RESOLUTION_LOOKUP.inv_scale
	local width = (max.x + min.x) * inv_scaling
	local height = (max.y - min.y) * inv_scaling

	return width, height, min
end

UIRenderer.text_alignment_size = function (self, text, font_material, font_size, ...)
	local min, max = Gui.text_extents(self.gui, text, font_material, font_size, Gui.FormatDirectives, ...)
	local inv_scaling = RESOLUTION_LOOKUP.inv_scale
	local width = (max.x + 0) * inv_scaling
	local height = (max.y - min.y) * inv_scaling

	return width, height, min
end

UIRenderer.draw_video = function (self, material_name, position, size, color, video_player_reference, optional_video_player)
	if script_data.disable_video_player then
		return true
	end

	local gui = self.gui
	local video_player = optional_video_player or self.video_players[video_player_reference]
	local pixel_snap = true
	local render_settings = self.render_settings
	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1

	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	Gui.video(gui, material_name, video_player, UIScaleVectorToResolution(position), UIScaleVectorToResolution(size, pixel_snap), color)

	local is_complete = VideoPlayer.current_frame(video_player) == VideoPlayer.number_of_frames(video_player)

	return is_complete
end

UIRenderer.draw_splash_video = function (self, material_name, position, size, color, video_player_reference, optional_video_player)
	if script_data.disable_video_player then
		return true
	end

	local video_player = optional_video_player or self.video_players[video_player_reference]

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
	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1

	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	Gui.video(gui, material_name, video_player, Vector3(w * 0.5 - width * 0.5, h * 0.5 - height * 0.5, position[3]), Vector2(width, height), color)
end

local circleVerts = {}
local CIRCLE_VERTS = 32

for i = 1, CIRCLE_VERTS do
	local a = i / CIRCLE_VERTS * math.pi * 2

	circleVerts[i * 2 - 1] = math.cos(a)
	circleVerts[i * 2] = math.sin(a)
end

UIRenderer.draw_circle = function (self, position, radius, size, color)
	local gui = self.gui
	local Gui_triangle = Gui.triangle
	local render_settings = self.render_settings
	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1

	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	local layer = 999
	local p1 = Vector3(unpack(position))

	p1.z = p1.y

	local x = p1.x
	local y = p1.y
	local p2 = Vector3(x + circleVerts[1] * radius, 0, y + circleVerts[2] * radius)

	for i = 2, CIRCLE_VERTS do
		local p3 = Vector3(x + circleVerts[i * 2 - 1] * radius, 0, y + circleVerts[i * 2] * radius)

		Gui_triangle(gui, p1, p2, p3, layer, color)

		p2 = p3
	end

	local p3 = Vector3(x + circleVerts[1] * radius, 0, y + circleVerts[2] * radius)

	Gui_triangle(gui, p1, p2, p3, layer, color)
end

UIRenderer.draw_rounded_rect = function (self, position, size, radius, color)
	local scale = RESOLUTION_LOOKUP.scale
	local Gui_triangle = Gui.triangle

	position = UIScaleVectorToResolution(position)
	size = UIScaleVectorToResolution(size)
	radius = radius * scale

	local n = CIRCLE_VERTS / 4
	local x = position[1]
	local y = position[2]
	local w = size[1]
	local h = size[2]
	local gui = self.gui
	local layer = position[3]
	local p1 = Vector3(position[1] + w / 2, 0, position[2] + h / 2)
	local p2 = Vector3(x + w - radius + circleVerts[1] * radius, 0, y + h - radius + circleVerts[2] * radius)
	local render_settings = self.render_settings
	local alpha_multiplier = render_settings and render_settings.alpha_multiplier or 1

	color = color and Color(color[1] * alpha_multiplier, color[2], color[3], color[4])

	for i = 2, n do
		local p3 = Vector3(x + w - radius + circleVerts[i * 2 - 1] * radius, 0, y + h - radius + circleVerts[i * 2] * radius)

		Gui_triangle(gui, p1, p2, p3, layer, color)

		p2 = p3
	end

	for i = n, n * 2 do
		local p3 = Vector3(x + radius + circleVerts[i * 2 - 1] * radius, 0, y + h - radius + circleVerts[i * 2] * radius)

		Gui_triangle(gui, p1, p2, p3, layer, color)

		p2 = p3
	end

	for i = n * 2, n * 3 do
		local p3 = Vector3(x + radius + circleVerts[i * 2 - 1] * radius, 0, y + radius + circleVerts[i * 2] * radius)

		Gui_triangle(gui, p1, p2, p3, layer, color)

		p2 = p3
	end

	for i = n * 3, n * 4 do
		local p3 = Vector3(x + w - radius + circleVerts[i * 2 - 1] * radius, 0, y + radius + circleVerts[i * 2] * radius)

		Gui_triangle(gui, p1, p2, p3, layer, color)

		p2 = p3
	end

	local p3 = Vector3(x + w - radius + circleVerts[1] * radius, 0, y + radius + circleVerts[2] * radius)

	Gui_triangle(gui, p1, p2, p3, layer, color)

	p2 = p3
	p3 = Vector3(x + w - radius + circleVerts[1] * radius, 0, y + h - radius + circleVerts[2] * radius)

	Gui_triangle(gui, p1, p2, p3, layer, color)
end

local NilCursor = {
	0,
	0,
	0,
}

UIRenderer.scaled_cursor_position_by_scenegraph = function (input_service, scenegraph, scenegraph_id, ignore_scale)
	local cursor = input_service:get("cursor") or NilCursor
	local scaled_cursor = not ignore_scale and UIInverseScaleVectorToResolution(cursor) or cursor
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

UIRenderer.scaled_font_size_by_area = function (self, text, area_size, style)
	local area_width = area_size[1]
	local area_height = area_size[2]
	local font_type = style.font_type
	local font_material = Fonts[font_type][1]
	local gui = self.gui

	for font_size = style.font_size, 1, -0.5 do
		local _, font_min, font_max = UIGetFontHeight(gui, font_type, font_size)
		local texts = Gui.word_wrap(gui, text, font_material, font_size, area_width, " 。，", "-+&/*", "\n", true, Gui.FormatDirectives)
		local text_height = math.ceil(1.05 * (font_max - font_min) * #texts)

		if text_height < area_height then
			return font_size
		end
	end

	return 1
end

UIRenderer.scaled_font_size_by_width = function (self, text, max_width, style)
	local font, scaled_font_size = UIFontByResolution(style)
	local text_width = UIRenderer.text_size(self, text, font[1], scaled_font_size)
	local min_font_size = 1
	local current_font_size = style.font_size

	while max_width < text_width do
		if min_font_size >= style.font_size then
			break
		end

		style.font_size = math.max(style.font_size - 1, min_font_size)
		font, scaled_font_size = UIFontByResolution(style)
		text_width = math.floor(UIRenderer.text_size(self, text, font[1], scaled_font_size))
	end

	local new_font_size = style.font_size

	style.font_size = current_font_size

	return new_font_size
end

local uvs = {
	{
		0,
		0,
	},
	{
		0,
		0,
	},
}
local uvs_r = {
	{
		0,
		0,
	},
	{
		0,
		0,
	},
}
local uvs_u = {
	{
		0,
		0,
	},
	{
		0,
		0,
	},
}

UIRenderer.draw_texture_frame = function (self, position, size, texture_id, texture_size, texture_sizes, color, masked, saturated, only_corners, use_tiling, mirrored_tiling, skip_background, retained_ids)
	local gui = self.gui
	local gui_retained = self.gui_retained

	position = UIScaleVectorToResolution(position)
	size = UIScaleVectorToResolution(size)
	texture_size = UIScaleVectorToResolution(texture_size)

	local layer = position[3]
	local corner_size_vec = UIScaleVectorToResolution(texture_sizes.corner)
	local corner_size_x, corner_size_y = corner_size_vec[1], corner_size_vec[2]
	local x_pos, y_pos = position.x, position.y
	local texture_size_x, texture_size_y = texture_size[1], texture_size[2]
	local x_size, y_size = size.x, size.y
	local retained_id_index = 1
	local new_retained_ids

	if retained_ids == true then
		new_retained_ids = {}
	end

	local corner_uv_size_x, corner_uv_size_y = corner_size_x / texture_size_x, corner_size_y / texture_size_y

	uvs[1][1] = 0
	uvs[1][2] = 1 - corner_uv_size_y
	uvs[2][1] = corner_uv_size_x
	uvs[2][2] = 1

	if retained_ids == true then
		new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos, y_pos, layer), corner_size_vec, color, masked, saturated, nil)
	elseif retained_ids then
		local retained_id = retained_ids[retained_id_index]

		UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos, y_pos, layer), corner_size_vec, color, masked, saturated, retained_id)

		retained_id_index = retained_id_index + 1
	else
		UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(x_pos, y_pos, layer), corner_size_vec, color, masked, saturated)
	end

	uvs[1][1] = 0
	uvs[1][2] = 0
	uvs[2][1] = corner_uv_size_x
	uvs[2][2] = corner_uv_size_y

	if retained_ids == true then
		new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos, y_pos + y_size - corner_size_y, layer), corner_size_vec, color, masked, saturated, nil)
	elseif retained_ids then
		local retained_id = retained_ids[retained_id_index]

		UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos, y_pos + y_size - corner_size_y, layer), corner_size_vec, color, masked, saturated, retained_id)

		retained_id_index = retained_id_index + 1
	else
		UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(x_pos, y_pos + y_size - corner_size_y, layer), corner_size_vec, color, masked, saturated)
	end

	uvs[1][1] = 1 - corner_uv_size_x
	uvs[1][2] = 0
	uvs[2][1] = 1
	uvs[2][2] = corner_uv_size_y

	if retained_ids == true then
		new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos + x_size - corner_size_x, y_pos + y_size - corner_size_y, layer), corner_size_vec, color, masked, saturated, nil)
	elseif retained_ids then
		local retained_id = retained_ids[retained_id_index]

		UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos + x_size - corner_size_x, y_pos + y_size - corner_size_y, layer), corner_size_vec, color, masked, saturated, retained_id)

		retained_id_index = retained_id_index + 1
	else
		UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(x_pos + x_size - corner_size_x, y_pos + y_size - corner_size_y, layer), corner_size_vec, color, masked, saturated)
	end

	uvs[1][1] = 1 - corner_uv_size_x
	uvs[1][2] = 1 - corner_uv_size_y
	uvs[2][1] = 1
	uvs[2][2] = 1

	if retained_ids == true then
		new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos + x_size - corner_size_x, y_pos, layer), corner_size_vec, color, masked, saturated, nil)
	elseif retained_ids then
		local retained_id = retained_ids[retained_id_index]

		UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos + x_size - corner_size_x, y_pos, layer), corner_size_vec, color, masked, saturated, retained_id)

		retained_id_index = retained_id_index + 1
	else
		UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(x_pos + x_size - corner_size_x, y_pos, layer), corner_size_vec, color, masked, saturated)
	end

	if not skip_background then
		uvs[1][1] = corner_uv_size_x
		uvs[1][2] = corner_uv_size_y
		uvs[2][1] = 1 - corner_uv_size_x
		uvs[2][2] = 1 - corner_uv_size_y

		if retained_ids == true then
			new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos + corner_size_x, y_pos + corner_size_y, layer), size - corner_size_vec * 2, color, masked, saturated, nil)
		elseif retained_ids then
			local retained_id = retained_ids[retained_id_index]

			UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos + corner_size_x, y_pos + corner_size_y, layer), size - corner_size_vec * 2, color, masked, saturated, retained_id)

			retained_id_index = retained_id_index + 1
		else
			UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(x_pos + corner_size_x, y_pos + corner_size_y, layer), size - corner_size_vec * 2, color, masked, saturated)
		end
	end

	if only_corners then
		return
	end

	if use_tiling then
		local tile_vertical_size_vec = UIScaleVectorToResolution(texture_sizes.vertical)
		local tile_vertical_size_x, tile_vertical_size_y = tile_vertical_size_vec[1], tile_vertical_size_vec[2]
		local bar_height = size[2] - corner_size_y * 2

		tile_vertical_size_vec[2] = bar_height

		local total_size = bar_height
		local tile_pos_y = y_pos + corner_size_y
		local segments = math.max(math.ceil(total_size / tile_vertical_size_y), 1)

		for i = 1, segments do
			local segment_size = math.clamp(total_size / tile_vertical_size_y, 0, 1)
			local mirrored = i % 2 == 0

			uvs[1][1] = 0
			uvs[2][1] = tile_vertical_size_x / texture_size_x

			if mirrored and mirrored_tiling then
				uvs[1][2] = math.lerp(corner_size_y / texture_size_y, 1 - corner_size_y / texture_size_y, segment_size)
				uvs[2][2] = corner_size_y / texture_size_y
			else
				uvs[1][2] = math.lerp(1 - corner_size_y / texture_size_y, corner_size_y / texture_size_y, segment_size)
				uvs[2][2] = 1 - corner_size_y / texture_size_y
			end

			uvs_r[1][1] = 1 - tile_vertical_size_x / texture_size_x
			uvs_r[2][1] = 1

			if mirrored and mirrored_tiling then
				uvs_r[1][2] = math.lerp(corner_size_y / texture_size_y, 1 - corner_size_y / texture_size_y, segment_size)
				uvs_r[2][2] = corner_size_y / texture_size_y
			else
				uvs_r[1][2] = math.lerp(1 - corner_size_y / texture_size_y, corner_size_y / texture_size_y, segment_size)
				uvs_r[2][2] = 1 - corner_size_y / texture_size_y
			end

			tile_vertical_size_vec[2] = segment_size * tile_vertical_size_y

			if retained_ids == true then
				new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated, nil)
			elseif retained_ids then
				local retained_id = retained_ids[retained_id_index]

				UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated, retained_id)

				retained_id_index = retained_id_index + 1
			else
				UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(x_pos, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated)
			end

			if retained_ids == true then
				new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs_r, Vector3(x_pos + x_size - tile_vertical_size_x, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated, nil)
			elseif retained_ids then
				local retained_id = retained_ids[retained_id_index]

				UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs_r, Vector3(x_pos + x_size - tile_vertical_size_x, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated, retained_id)

				retained_id_index = retained_id_index + 1
			else
				UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs_r, Vector3(x_pos + x_size - tile_vertical_size_x, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated)
			end

			tile_pos_y = tile_pos_y + tile_vertical_size_y
			total_size = total_size - tile_vertical_size_y
		end

		local tile_horizontal_size_vec = UIScaleVectorToResolution(texture_sizes.horizontal)
		local tile_horizontal_size_x, tile_horizontal_size_y = tile_horizontal_size_vec[1], tile_horizontal_size_vec[2]
		local bar_width = size[1] - corner_size_x * 2

		tile_horizontal_size_vec[1] = bar_width
		total_size = bar_width

		local tile_pos_x = x_pos + corner_size_x

		segments = math.max(math.ceil(total_size / tile_vertical_size_y), 1)

		for i = 1, segments do
			local segment_size = math.clamp(total_size / tile_horizontal_size_x, 0, 1)
			local mirrored = i % 2 == 0

			if mirrored and mirrored_tiling then
				uvs[1][1] = 1 - corner_size_x / texture_size_x
				uvs[2][1] = math.lerp(1 - corner_size_x / texture_size_x, corner_size_x / texture_size_x, segment_size)
			else
				uvs[1][1] = corner_size_x / texture_size_x
				uvs[2][1] = math.lerp(corner_size_x / texture_size_x, 1 - corner_size_x / texture_size_x, segment_size)
			end

			uvs[1][2] = 1 - corner_size_y / texture_size_y
			uvs[2][2] = 1

			if mirrored and mirrored_tiling then
				uvs_u[1][1] = 1 - corner_size_x / texture_size_x
				uvs_u[2][1] = math.lerp(1 - corner_size_x / texture_size_x, corner_size_x / texture_size_x, segment_size)
			else
				uvs_u[1][1] = corner_size_x / texture_size_x
				uvs_u[2][1] = math.lerp(corner_size_x / texture_size_x, 1 - corner_size_x / texture_size_x, segment_size)
			end

			uvs_u[1][2] = 0
			uvs_u[2][2] = corner_size_y / texture_size_y
			tile_horizontal_size_vec[1] = segment_size * tile_horizontal_size_x

			if retained_ids == true then
				new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(tile_pos_x, y_pos, layer), tile_horizontal_size_vec, color, masked, saturated, nil)
			elseif retained_ids then
				local retained_id = retained_ids[retained_id_index]

				UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(tile_pos_x, y_pos, layer), tile_horizontal_size_vec, color, masked, saturated, retained_id)

				retained_id_index = retained_id_index + 1
			else
				UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(tile_pos_x, y_pos, layer), tile_horizontal_size_vec, color, masked, saturated)
			end

			if retained_ids == true then
				new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs_u, Vector3(tile_pos_x, y_pos + y_size - tile_horizontal_size_y, layer), tile_horizontal_size_vec, color, masked, saturated, nil)
			elseif retained_ids then
				local retained_id = retained_ids[retained_id_index]

				UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs_u, Vector3(tile_pos_x, y_pos + y_size - tile_horizontal_size_y, layer), tile_horizontal_size_vec, color, masked, saturated, retained_id)

				retained_id_index = retained_id_index + 1
			else
				UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs_u, Vector3(tile_pos_x, y_pos + y_size - tile_horizontal_size_y, layer), tile_horizontal_size_vec, color, masked, saturated)
			end

			tile_pos_x = tile_pos_x + tile_horizontal_size_x
			total_size = total_size - tile_horizontal_size_x
		end
	else
		local tile_vertical_size_vec = UIScaleVectorToResolution(texture_sizes.vertical)
		local tile_vertical_size_x, tile_vertical_size_y = tile_vertical_size_vec[1], tile_vertical_size_vec[2]
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

		local tile_pos_y = y_pos + corner_size_y

		if retained_ids == true then
			new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated, nil)
		elseif retained_ids then
			local retained_id = retained_ids[retained_id_index]

			UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(x_pos, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated, retained_id)

			retained_id_index = retained_id_index + 1
		else
			UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(x_pos, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated)
		end

		if retained_ids == true then
			new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs_r, Vector3(x_pos + x_size - tile_vertical_size_x, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated, nil)
		elseif retained_ids then
			local retained_id = retained_ids[retained_id_index]

			UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs_r, Vector3(x_pos + x_size - tile_vertical_size_x, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated, retained_id)

			retained_id_index = retained_id_index + 1
		else
			UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs_r, Vector3(x_pos + x_size - tile_vertical_size_x, tile_pos_y, layer), tile_vertical_size_vec, color, masked, saturated)
		end

		local tile_horizontal_size_vec = UIScaleVectorToResolution(texture_sizes.horizontal)
		local tile_horizontal_size_x, tile_horizontal_size_y = tile_horizontal_size_vec[1], tile_horizontal_size_vec[2]
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

		if retained_ids == true then
			new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(tile_pos_x, y_pos, layer), tile_horizontal_size_vec, color, masked, saturated, nil)
		elseif retained_ids then
			local retained_id = retained_ids[retained_id_index]

			UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs, Vector3(tile_pos_x, y_pos, layer), tile_horizontal_size_vec, color, masked, saturated, retained_id)

			retained_id_index = retained_id_index + 1
		else
			UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs, Vector3(tile_pos_x, y_pos, layer), tile_horizontal_size_vec, color, masked, saturated)
		end

		if retained_ids == true then
			new_retained_ids[#new_retained_ids + 1] = UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs_u, Vector3(tile_pos_x, y_pos + y_size - tile_horizontal_size_y, layer), tile_horizontal_size_vec, color, masked, saturated, nil)
		elseif retained_ids then
			local retained_id = retained_ids[retained_id_index]

			UIRenderer.script_draw_bitmap_uv(gui_retained, self.render_settings, texture_id, uvs_u, Vector3(tile_pos_x, y_pos + y_size - tile_horizontal_size_y, layer), tile_horizontal_size_vec, color, masked, saturated, retained_id)

			retained_id_index = retained_id_index + 1
		else
			UIRenderer.script_draw_bitmap_uv(gui, self.render_settings, texture_id, uvs_u, Vector3(tile_pos_x, y_pos + y_size - tile_horizontal_size_y, layer), tile_horizontal_size_vec, color, masked, saturated)
		end
	end

	return new_retained_ids
end

UIRenderer.destroy_bitmap = function (self, retained_id)
	Gui.destroy_bitmap(self.gui_retained, retained_id)
end

UIRenderer.destroy_text = function (self, retained_id)
	Gui.destroy_text(self.gui_retained, retained_id)
end

require("scripts/ui/ui_passes")
