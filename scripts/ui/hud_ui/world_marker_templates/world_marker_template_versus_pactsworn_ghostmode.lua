-- chunkname: @scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_pactsworn_ghostmode.lua

WorldMarkerTemplates = WorldMarkerTemplates or {}

local template = WorldMarkerTemplates.versus_pactsworn_ghostmode

if not template then
	template = {}
	WorldMarkerTemplates.versus_pactsworn_ghostmode = template
end

template.position_offset = {
	0,
	0,
	2,
}
template.max_distance = nil
template.screen_clamp = true
template.only_when_clamped = true
template.draw_behind = true
template.screen_margins = {
	down = 150,
	left = 150,
	right = 150,
	up = 200,
}

template.create_widget_definition = function (scenegraph_id)
	local icon_scale = 1
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
					pass_type = "rotated_texture",
					style_id = "arrow",
					texture_id = "arrow",
					content_check_function = function (content)
						return content.is_clamped
					end,
				},
			},
		},
		content = {
			arrow = "versus_world_marker_objective_arrow",
			icon = "versus_hud_marker_objective",
		},
		style = {
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					70 * icon_scale,
					90 * icon_scale,
				},
				default_size = {
					70 * icon_scale,
					90 * icon_scale,
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
	style.arrow.color[1] = fade_in_alpha
	style.arrow.angle = content.angle

	return true
end
