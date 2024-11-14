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
template.max_distance = 50
template.screen_clamp = true
template.only_when_clamped = false
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
					content_check_function = function (content)
						return content.is_clamped
					end,
				},
				{
					pass_type = "text",
					style_id = "ally_name",
					text_id = "ally_name",
				},
				{
					pass_type = "text",
					style_id = "ally_name_shadow",
					text_id = "ally_name",
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
					pass_type = "texture",
					style_id = "checkmark",
					texture_id = "checkmark",
					content_check_function = function (content)
						return content.countdown_over
					end,
				},
			},
		},
		content = {
			ally_name = "ally_name",
			arrow = "versus_world_marker_objective_arrow",
			checkmark = "matchmaking_checkbox",
			icon = "versus_hud_marker_objective",
			player_name = "player_name",
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
			ally_name = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "center",
				size = {
					200,
					30,
				},
				area_size = {
					200,
					30,
				},
				text_color = Colors.get_color_table_with_alpha("local_player_team", 255),
				offset = {
					-100,
					60,
					3,
				},
			},
			ally_name_shadow = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "center",
				size = {
					200,
					30,
				},
				area_size = {
					200,
					30,
				},
				text_color = {
					255,
					30,
					30,
					30,
				},
				offset = {
					-99,
					59,
					2,
				},
			},
			checkmark = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				size = {
					30,
					25,
				},
				offset = {
					0,
					5,
					3,
				},
				color = {
					255,
					255,
					255,
					255,
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
	local allow_name = Application.user_setting("toggle_pactsworn_overhead_name_ui")

	if content.just_entered then
		content.just_entered = false
		content.enter_timer = t

		local player_name_text_width = UIUtils.get_text_width(ui_renderer, style.ally_name, content.ally_name)

		style.checkmark.offset[1] = allow_name and -(player_name_text_width / 2) - 30 - 10 or 0
	end

	local am = math.clamp(0.5 + (1 - content.forward_dot_dir) * 499.99999999999955, 0, 1)
	local timer_delta = t - content.enter_timer
	local alpha = 255 * math.easeOutCubic(math.min(timer_delta, 1)) * am
	local fade_in_alpha = alpha * 0.7

	style.icon.color[1] = fade_in_alpha
	style.arrow.color[1] = fade_in_alpha
	style.arrow.angle = content.angle

	local ally_name_offset_y = content.is_clamped and 60 or 0

	style.ally_name.offset[2] = ally_name_offset_y
	style.ally_name_shadow.offset[2] = ally_name_offset_y

	local ally_name = allow_name and content.player_name or ""
	local ally_name_length = UTF8Utils.string_length(ally_name)

	if ally_name_length > 18 then
		ally_name = string.sub(ally_name, 1, 18) .. "..."
	end

	if content.respawn_timer and not content.countdown_over then
		local respawn_delta = content.respawn_timer - Managers.time:time("game")
		local countdown_over = respawn_delta <= 0

		ally_name = countdown_over and ally_name or string.format("{#size(20);color(255,255,255)}%d{#reset()}  %s", math.abs(respawn_delta), ally_name)
		content.countdown_over = countdown_over
	end

	if content.allow_name ~= allow_name then
		local player_name_text_width = UIUtils.get_text_width(ui_renderer, style.ally_name, ally_name)

		style.checkmark.offset[1] = allow_name and -(player_name_text_width / 2) - 30 - 10 or 0
		content.allow_name = allow_name
	end

	content.ally_name = ally_name

	return true
end
