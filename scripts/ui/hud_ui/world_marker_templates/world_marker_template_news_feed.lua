-- chunkname: @scripts/ui/hud_ui/world_marker_templates/world_marker_template_news_feed.lua

WorldMarkerTemplates = WorldMarkerTemplates or {}

local NAME = "news_feed"
local template = WorldMarkerTemplates[NAME] or {}

WorldMarkerTemplates[NAME] = template
template.position_offset = {
	0,
	0,
	2,
}
template.max_distance = nil
template.screen_clamp = true
template.screen_margins = {
	down = 150,
	left = 150,
	right = 150,
	up = 150,
}

template.create_widget_definition = function (scenegraph_id)
	local arrow_offset = 25

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "icon_pulse",
					texture_id = "icon_pulse",
				},
				{
					pass_type = "texture",
					style_id = "background_pulse_1",
					texture_id = "background_pulse_1",
				},
				{
					pass_type = "texture",
					style_id = "background_pulse_2",
					texture_id = "background_pulse_2",
				},
				{
					pass_type = "rotated_texture",
					style_id = "arrow",
					texture_id = "arrow",
					content_check_function = function (content)
						return content.is_clamped
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.is_clamped or content.distance > 5
					end,
				},
			},
		},
		content = {
			arrow = "page_button_arrow_glow",
			background_pulse_1 = "crosshair_03_large",
			background_pulse_2 = "crosshair_03_large",
			icon = "icon_new_star",
			icon_pulse = "icon_new_star",
			text = "",
		},
		style = {
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					35,
					35,
				},
				default_size = {
					35,
					35,
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
					3,
				},
			},
			icon_pulse = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					35,
					35,
				},
				default_size = {
					35,
					35,
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
					4,
				},
			},
			background_pulse_1 = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					111,
					111,
				},
				default_size = {
					111,
					111,
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
			background_pulse_2 = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					150,
					150,
				},
				default_size = {
					150,
					150,
				},
				color = {
					255,
					80,
					80,
					80,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			arrow = {
				angle = 0,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				pivot = {
					21.5 + arrow_offset,
					24,
				},
				texture_size = {
					43,
					48,
				},
				default_size = {
					43,
					48,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-arrow_offset,
					0,
					0,
				},
			},
			text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				word_wrap = true,
				size = {
					100,
					50,
				},
				text_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-50,
					-50,
					2,
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

template.on_enter = function (widget)
	local content = widget.content

	content.spawn_progress_timer = 0
end

template.update_function = function (ui_renderer, widget, marker, settings, dt, t)
	local animating = false
	local content = widget.content
	local style = widget.style
	local is_inside_frustum = content.is_inside_frustum
	local is_under = content.is_under
	local distance = content.distance
	local angle = content.angle
	local spawn_progress_timer = content.spawn_progress_timer

	if spawn_progress_timer then
		spawn_progress_timer = spawn_progress_timer + dt

		local duration = 1
		local progress = math.min(spawn_progress_timer / duration, 1)
		local anim_progress = math.easeOutCubic(progress)
		local inv_anim_progress = math.easeInCubic(1 - progress)

		content.spawn_progress_timer = progress ~= 1 and spawn_progress_timer or nil

		local icon_pulse_style = style.icon_pulse
		local icon_pulse_color = icon_pulse_style.color
		local icon_pulse_size = icon_pulse_style.texture_size
		local icon_pulse_default_size = icon_pulse_style.default_size

		icon_pulse_size[1] = icon_pulse_default_size[1] + icon_pulse_default_size[1] * inv_anim_progress
		icon_pulse_size[2] = icon_pulse_default_size[1] + icon_pulse_default_size[2] * inv_anim_progress
		icon_pulse_color[1] = 255 - 255 * anim_progress

		for i = 1, 2 do
			local background_pulse_style = style["background_pulse_" .. i]
			local background_pulse_color = background_pulse_style.color
			local background_pulse_size = background_pulse_style.texture_size
			local background_pulse_default_size = background_pulse_style.default_size

			background_pulse_size[1] = background_pulse_default_size[1] - background_pulse_default_size[1] * inv_anim_progress
			background_pulse_size[2] = background_pulse_default_size[1] - background_pulse_default_size[2] * inv_anim_progress
			background_pulse_color[1] = 255 - 255 * anim_progress
		end

		animating = true
	end

	local arrow_style = style.arrow

	arrow_style.angle = angle + math.pi * 0.5
	content.text = distance > 1 and tostring(UIUtils.comma_value(math.floor(distance))) .. "m" or ""

	return animating
end
