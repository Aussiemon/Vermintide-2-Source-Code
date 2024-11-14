-- chunkname: @scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_climbing.lua

local NAME = "climbing"

WorldMarkerTemplates = WorldMarkerTemplates or {}

local template = WorldMarkerTemplates[NAME] or {}

WorldMarkerTemplates[NAME] = template
template.check_line_of_sight = true
template.position_offset = {
	0,
	0,
	0,
}
template.screen_clamp = false
template.max_distance = 15
template.fade_distance = 3
template.scale_settings = {
	end_scale_distance = 4,
	min_scale = 0.25,
	start_scale_distance = 2,
}

template.create_widget_definition = function (scenegraph_id)
	return {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			-5,
		},
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
			},
		},
		content = {
			background = "world_marker_versus_pactsworn_background",
			icon = "world_marker_versus_pactsworn_interact_climbing",
		},
		style = {
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					0,
					0,
				},
				offset = {
					0,
					0,
					1,
				},
				default_size = {
					100,
					100,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				color_disabled = {
					10,
					190,
					190,
					190,
				},
				color_occluded = {
					100,
					190,
					190,
					190,
				},
				color_inactive = {
					200,
					255,
					255,
					255,
				},
				color_active = {
					200,
					128,
					255,
					36,
				},
			},
			background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					0,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
				default_size = {
					96,
					192,
				},
				default_offset = {
					-2,
					4,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
		},
	}
end

template.on_enter = function (widget)
	local content = widget.content

	content.progress = 0
end

template.update_function = function (ui_renderer, widget, marker, settings, dt, t)
	local content = widget.content
	local style = widget.style
	local icon_style = style.icon
	local distance = content.distance
	local progress = content.progress
	local climb_unit = marker.unit
	local interactable_extension = ScriptUnit.extension(climb_unit, "interactable_system")
	local enabled = interactable_extension:is_enabled()
	local attack_held = Managers.input:get_service("Player"):get("action_one_hold")

	if distance <= 3 and not marker.raycast_result and not attack_held and enabled then
		progress = math.min(1, progress + dt * 3.5)
	else
		progress = math.max(0, progress - dt * 15)
	end

	content.progress = progress
	style.background.color[1] = 175 * progress

	if not enabled then
		Colors.copy_to(icon_style.color, icon_style.color_disabled)
	elseif marker.raycast_result or attack_held or not enabled then
		Colors.copy_to(icon_style.color, icon_style.color_occluded)
	else
		Colors.lerp_color_tables(icon_style.color_inactive, icon_style.color_active, progress, icon_style.color)
	end

	local fade_progress = (settings.max_distance - distance) / settings.fade_distance

	if fade_progress < 1 then
		icon_style.color[1] = icon_style.color[1] * fade_progress
	end

	return false
end
