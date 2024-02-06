-- chunkname: @scripts/ui/hud_ui/world_marker_templates/world_marker_template_text_box.lua

WorldMarkerTemplates = WorldMarkerTemplates or {}

local NAME = "text_box"
local template = WorldMarkerTemplates[NAME] or {}

WorldMarkerTemplates[NAME] = template
template.max_distance = 20
template.screen_clamp = false
template.screen_margins = nil

template.create_widget_definition = function (scenegraph_id)
	local frame_name = "shadow_frame_02"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_height = frame_settings.texture_sizes.horizontal[2]

	return {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						local scale_progress = content.scale_progress

						return scale_progress and scale_progress < 1
					end,
				},
				{
					pass_type = "rect",
					style_id = "background",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						local text_progress = content.text_progress

						return text_progress and text_progress > 0
					end,
				},
			},
		},
		content = {
			icon = "icon_property_stamina",
			icon_pulse = "icon_property_stamina",
			text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
			frame = frame_settings.texture,
		},
		style = {
			text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				word_wrap = true,
				size = {
					200,
					200,
				},
				text_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					50,
					50,
				},
				default_size = {
					50,
					50,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					50,
					50,
				},
				default_size = {
					50,
					50,
				},
				color = {
					150,
					10,
					10,
					10,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				area_size = {
					50,
					50,
				},
				default_size = {
					50,
					50,
				},
				frame_margins = {
					-frame_height,
					-frame_height,
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					1,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

template.check_widget_visible = function (widget, vertical_pixel_overlap, horizontal_pixel_overlap)
	local style = widget.style
	local background_style = style.background
	local background_size = background_style.texture_size

	if horizontal_pixel_overlap and horizontal_pixel_overlap > background_size[1] * 0.5 then
		return false
	end

	if vertical_pixel_overlap and vertical_pixel_overlap > background_size[2] * 0.5 then
		return false
	end

	return true
end

template.on_enter = function (widget)
	local content = widget.content

	content.spawn_progress_timer = 0
end

template.update_function = function (ui_renderer, widget, marker, settings, dt, t)
	local animating = false
	local content = widget.content
	local style = widget.style
	local is_under = content.is_under
	local distance = content.distance
	local angle = content.angle
	local scale_speed = 3
	local scale_progress = content.scale_progress or 0
	local text_progress = content.text_progress or 0

	if distance <= 5 then
		scale_progress = math.min(scale_progress + dt * scale_speed, 1)
	elseif text_progress == 0 then
		scale_progress = math.max(scale_progress - dt * scale_speed, 0)
	end

	if scale_progress == 1 and distance <= 5 then
		text_progress = math.min(text_progress + dt * scale_speed, 1)
	else
		text_progress = math.max(text_progress - dt * scale_speed, 0)
	end

	local text_anim_progress = math.easeCubic(text_progress)
	local anim_progress = math.easeCubic(scale_progress)
	local text = content.text
	local text_style = style.text
	local text_size = text_style.size
	local text_offset = text_style.offset
	local text_color = text_style.text_color
	local text_width = content.text_width
	local text_height = content.text_height

	if not text_width then
		text_width = UIUtils.get_text_width(ui_renderer, text_style, text)
		text_width = math.min(text_width, 600)
		text_size[1] = text_width
		text_height = UIUtils.get_text_height(ui_renderer, text_size, text_style, text)
		content.text_width = text_width
		content.text_height = text_height
	end

	text_color[1] = 255 * text_anim_progress

	local icon_style = style.icon
	local icon_color = icon_style.color

	icon_color[1] = 255 - 255 * scale_progress

	local background_style = style.background
	local background_color = background_style.color
	local background_size = background_style.texture_size
	local background_default_size = background_style.default_size
	local new_width = text_width * anim_progress
	local new_height = text_height * anim_progress

	background_size[1] = background_default_size[1] + new_width
	background_size[2] = background_default_size[2] + new_height

	local frame_style = style.frame
	local frame_size = frame_style.area_size

	frame_size[1] = background_size[1]
	frame_size[2] = background_size[2]
	text_size[1] = text_width
	text_size[2] = text_height
	text_offset[1] = -text_width / 2
	text_offset[2] = -text_height / 2
	animating = scale_progress ~= content.scale_progress or text_progress ~= content.text_progress
	content.scale_progress = scale_progress
	content.text_progress = text_progress

	return animating
end
