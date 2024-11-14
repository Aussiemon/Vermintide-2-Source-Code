-- chunkname: @scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_objective.lua

WorldMarkerTemplates = WorldMarkerTemplates or {}

local template = WorldMarkerTemplates.versus_objective

if not template then
	template = {}
	WorldMarkerTemplates.versus_objective = template
end

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
	up = 200,
}

template.create_widget_definition = function (scenegraph_id)
	local icon_scale = 0.5
	local arrow_offset = 60 * icon_scale

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
					style_id = "background_pulse_1",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_pulse_2",
					texture_id = "background",
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
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
					content_check_function = function (content)
						return content.is_clamped or content.distance > 5
					end,
				},
			},
		},
		content = {
			arrow = "versus_world_marker_objective_arrow",
			background = "versus_world_marker_objective_border",
			icon = "versus_hud_marker_objective",
			text = "",
			value = "2",
		},
		style = {
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					80 * icon_scale,
					80 * icon_scale,
				},
				default_size = {
					80 * icon_scale,
					80 * icon_scale,
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
			background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					100 * icon_scale,
					100 * icon_scale,
				},
				default_size = {
					100 * icon_scale,
					100 * icon_scale,
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
			background_pulse_1 = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					100 * icon_scale,
					100 * icon_scale,
				},
				default_size = {
					100 * icon_scale,
					100 * icon_scale,
				},
				color = {
					200,
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
					100 * icon_scale,
					100 * icon_scale,
				},
				default_size = {
					100 * icon_scale,
					100 * icon_scale,
				},
				color = {
					200,
					255,
					255,
					255,
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
					22,
					11.5 - arrow_offset,
				},
				texture_size = {
					44,
					23,
				},
				default_size = {
					44,
					23,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					arrow_offset,
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
					170,
					170,
					170,
				},
				offset = {
					-50,
					-55,
					3,
				},
			},
			text_shadow = {
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
					0,
					0,
					0,
				},
				offset = {
					-49,
					-56,
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
	local objective_system = Managers.state.entity:system("objective_system")

	widget.content.icon = objective_system:current_objective_icon()
	content.just_entered = true
	content.t = 0
end

template.update_function = function (ui_renderer, widget, marker, settings, dt, t)
	local content = widget.content
	local style = widget.style

	if content.just_entered then
		content.just_entered = false
		content.enter_timer = t
	end

	local am = math.clamp(0.5 + (1 - content.forward_dot_dir) * 499.99999999999955, 0, 1)
	local timer_delta = t - content.enter_timer
	local alpha = 255 * math.easeOutCubic(math.min(timer_delta, 1)) * am
	local fade_in_alpha = alpha * 0.7

	style.icon.color[1] = fade_in_alpha
	style.background.color[1] = fade_in_alpha
	style.arrow.color[1] = fade_in_alpha
	style.text.text_color[1] = alpha
	style.text_shadow.text_color[1] = alpha
	style.arrow.angle = content.angle

	local distance = content.distance

	content.text = distance > 1 and UIUtils.comma_value(math.floor(distance)) .. "m" or ""

	local df = math.min(1, 15 / distance)
	local ct = content.t + dt * df

	content.t = ct

	for i = 1, 2 do
		local pulse_progress = 1 - (1 - (ct + 0.5 * i) % 1)^2
		local bg_pulse_style = style["background_pulse_" .. i]
		local bg_pulse_size = bg_pulse_style.texture_size
		local bg_pulse_size_base = bg_pulse_style.default_size

		bg_pulse_size[1] = bg_pulse_size_base[1] * (1 + pulse_progress)
		bg_pulse_size[2] = bg_pulse_size_base[2] * (1 + pulse_progress)
		bg_pulse_style.color[1] = 255 * (1 - pulse_progress) * df * am
	end

	return true
end
