-- chunkname: @scripts/ui/hud_ui/world_marker_templates/world_marker_template_ping.lua

WorldMarkerTemplates = WorldMarkerTemplates or {}

local NAME = "ping"
local template = WorldMarkerTemplates[NAME] or {}

WorldMarkerTemplates[NAME] = template
template.max_distance = 200
template.screen_clamp = true
template.life_time = 15
template.position_offset = {
	0,
	0,
	0.5,
}
template.screen_margins = {
	down = 150,
	left = 150,
	right = 150,
	up = 150,
}

local WORLD_MARKER_CONTENT_LOOKUP = {
	"world_marker_response_1",
	"world_marker_response_2",
	"world_marker_response_3",
}
local WORLD_MARKER_ICON_LOOKUP = {
	"world_marker_icon_response_1",
	"world_marker_icon_response_2",
	"world_marker_icon_response_3",
}

template.create_widget_definition = function (scenegraph_id)
	local arrow_offset = 25

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon_bg",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "world_marker_icon_response_1",
					texture_id = "world_marker_icon_response_1",
					content_check_function = function (content)
						return content.world_marker_response_1.show
					end,
				},
				{
					pass_type = "texture",
					style_id = "world_marker_icon_response_2",
					texture_id = "world_marker_icon_response_2",
					content_check_function = function (content)
						return content.world_marker_response_2.show
					end,
				},
				{
					pass_type = "texture",
					style_id = "world_marker_icon_response_3",
					texture_id = "world_marker_icon_response_3",
					content_check_function = function (content)
						return content.world_marker_response_3.show
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_spawn_pulse",
					texture_id = "icon_pulse",
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
						return Managers.mechanism:current_mechanism_name() ~= "versus"
					end,
				},
				{
					pass_type = "text",
					style_id = "distance_text",
					text_id = "distance_text",
				},
			},
		},
		content = {
			arrow = "console_consumable_icon_arrow_02",
			distance_text = "",
			icon = "ping_friendly",
			icon_pulse = "ping_friendly",
			text = "",
			world_marker_icon_response_1 = "world_marker_ping_response_1",
			world_marker_icon_response_2 = "world_marker_ping_response_2",
			world_marker_icon_response_3 = "world_marker_ping_response_3",
		},
		style = {
			icon_bg = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					41,
					41,
				},
				default_size = {
					41,
					41,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					40,
					40,
				},
				default_size = {
					40,
					40,
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
					2,
				},
			},
			icon_spawn_pulse = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					40,
					40,
				},
				default_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				default_color = {
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
			world_marker_icon_response_1 = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					28,
					36,
				},
				default_size = {
					28,
					36,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				default_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-14,
					18,
					0,
				},
				default_offset = {
					-14,
					18,
					0,
				},
			},
			world_marker_icon_response_2 = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					28,
					36,
				},
				default_size = {
					28,
					36,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				default_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					14,
					18,
					0,
				},
				default_offset = {
					14,
					18,
					0,
				},
			},
			world_marker_icon_response_3 = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					56,
					36,
				},
				default_size = {
					56,
					36,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				default_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					-18,
					0,
				},
				default_offset = {
					0,
					-18,
					0,
				},
			},
			arrow = {
				angle = 0,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				pivot = {
					7 + arrow_offset,
					15,
				},
				texture_size = {
					14,
					30,
				},
				default_size = {
					14,
					30,
				},
				color = {
					255,
					160,
					160,
					160,
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
				word_wrap = false,
				size = {
					150,
					75,
				},
				text_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-75,
					-75,
					2,
				},
			},
			distance_text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				word_wrap = false,
				size = {
					150,
					150,
				},
				text_color = {
					255,
					216,
					216,
					216,
				},
				offset = {
					-75,
					-102,
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
	content.world_marker_response_1 = {}
	content.world_marker_response_2 = {}
	content.world_marker_response_3 = {}
end

local function update_spawn_pulse_animation(progress_timer, dt, style)
	progress_timer = progress_timer + dt

	local progress = math.min(progress_timer / 1, 1)
	local anim_progress = math.easeOutCubic(progress)
	local color = style.color
	local default_color = style.default_color
	local size = style.texture_size
	local default_size = style.default_size

	size[1] = default_size[1] + default_size[1] * anim_progress
	size[2] = default_size[2] + default_size[2] * anim_progress
	color[1] = default_color[1] - default_color[1] * anim_progress

	return progress, progress ~= 1
end

local function update_response_animation(progress_timer, dt, style)
	progress_timer = progress_timer + dt * 10

	local progress = math.min(progress_timer / 1, 1)
	local anim_progress = 1 - math.easeOutCubic(progress)
	local color = style.color
	local default_color = style.default_color
	local size = style.texture_size
	local default_size = style.default_size
	local offset = style.offset
	local default_offset = style.default_offset

	offset[1] = default_offset[1] + default_offset[1] * 100 * anim_progress
	offset[2] = default_offset[2] + default_offset[2] * 100 * anim_progress
	size[1] = default_size[1] + default_size[1] * 2 * anim_progress
	size[2] = default_size[2] + default_size[2] * 2 * anim_progress
	color[1] = default_color[1] - default_color[1] * anim_progress

	return progress, progress ~= 1
end

template.update_function = function (ui_renderer, widget, marker, settings, dt, t)
	local content = widget.content
	local style = widget.style
	local is_inside_frustum = content.is_inside_frustum
	local is_under = content.is_under
	local distance = content.distance
	local angle = content.angle

	if content.spawn_progress_timer then
		local progress, in_progress = update_spawn_pulse_animation(content.spawn_progress_timer, dt, style.icon_spawn_pulse)

		content.spawn_progress_timer = in_progress and progress or nil
	end

	for i = 1, 3 do
		local id = WORLD_MARKER_CONTENT_LOOKUP[i]
		local response = content[id]

		if response.timer then
			local icon_id = WORLD_MARKER_ICON_LOOKUP[i]
			local progress, in_progress = update_response_animation(response.timer, dt, style[icon_id])

			content[id].timer = in_progress and progress or nil
		end
	end

	local arrow_style = style.arrow

	arrow_style.angle = angle + math.pi * 0.5
	content.distance_text = distance > 1 and tostring(UIUtils.comma_value(math.floor(distance))) .. "m" or ""

	local am = math.clamp(0.3 + (1 - content.forward_dot_dir) * 499.99999999999955, 0, 1)

	if am ~= 1 then
		local alpha = 255 * am

		style.icon.color[1] = alpha
		style.icon_bg.color[1] = alpha
		style.arrow.color[1] = alpha
		style.text.text_color[1] = alpha
	end

	return true
end
