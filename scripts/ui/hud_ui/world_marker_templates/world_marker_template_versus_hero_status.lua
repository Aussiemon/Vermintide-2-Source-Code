-- chunkname: @scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_hero_status.lua

WorldMarkerTemplates = WorldMarkerTemplates or {}

local NAME = "versus_hero_status"
local template = WorldMarkerTemplates[NAME] or {}

WorldMarkerTemplates[NAME] = template
template.max_distance = 25
template.unit_node = "j_head"
template.screen_clamp = false
template.position_offset = {
	0,
	0,
	0.4,
}
template.screen_margins = {
	down = 150,
	left = 150,
	right = 150,
	up = 150,
}

template.create_widget_definition = function (scenegraph_id)
	local health_bar_size = {
		80,
		12,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "rect",
					style_id = "health_bg",
					texture_id = "rect",
				},
				{
					pass_type = "rect",
					style_id = "health_bar",
					texture_id = "rect",
				},
				{
					pass_type = "text",
					style_id = "player_name",
					text_id = "player_name",
				},
				{
					pass_type = "text",
					style_id = "player_name_shadow",
					text_id = "player_name",
				},
			},
		},
		content = {
			frame = "versus_floating_hero_health_frame",
			player_name = "player_name",
			rect = "hud_player_ability_bar_glow",
		},
		style = {
			frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = health_bar_size,
				default_size = health_bar_size,
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					4,
				},
			},
			health_bg = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					health_bar_size[1] - 3,
					health_bar_size[2] - 7,
				},
				default_size = {
					health_bar_size[1] - 3,
					health_bar_size[2] - 7,
				},
				color = {
					255,
					50,
					50,
					50,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			health_bar = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					health_bar_size[1] - 3,
					health_bar_size[2] - 7,
				},
				default_size = {
					health_bar_size[1] - 3,
					health_bar_size[2] - 7,
				},
				color = {
					255,
					32,
					103,
					33,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			player_name = {
				dynamic_font_size = true,
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = {
					255,
					224,
					224,
					224,
				},
				offset = {
					-100,
					0,
					2,
				},
				size = {
					200,
					40,
				},
			},
			player_name_shadow = {
				dynamic_font_size = true,
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-98,
					-1,
					1,
				},
				size = {
					200,
					40,
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
	local unit = marker.unit

	if not Unit.alive(unit) then
		return false
	end

	local extensions = marker.extensions

	if not extensions then
		extensions = {
			career = ScriptUnit.extension(unit, "career_system"),
			health = ScriptUnit.extension(unit, "health_system"),
			status = ScriptUnit.extension(unit, "status_system"),
			inventory = ScriptUnit.extension(unit, "inventory_system"),
			buff = ScriptUnit.extension(unit, "buff_system"),
		}
		marker.extensions = extensions
	end

	local content = widget.content
	local style = widget.style
	local status_extension = extensions.status
	local health_extension = extensions.health
	local inventory_extension = extensions.inventory
	local is_wounded = status_extension:is_wounded()
	local is_knocked_down = status_extension:is_knocked_down()
	local is_ready_for_assisted_respawn = status_extension:is_ready_for_assisted_respawn()
	local is_dead = status_extension:is_dead()
	local total_health_percent = is_dead and 0 or health_extension:current_health_percent()

	if is_knocked_down or is_ready_for_assisted_respawn then
		total_health_percent = 0
	end

	local health_bar_style = style.health_bar
	local max_length = health_bar_style.default_size[1]
	local current_length = max_length * total_health_percent

	health_bar_style.texture_size[1] = current_length
	health_bar_style.offset[1] = -(max_length - current_length) / 2

	if total_health_percent >= 0.66 then
		health_bar_style.color = OutlineSettingsVS.colors.hero_healthy.color
	elseif total_health_percent >= 0.33 then
		health_bar_style.color = OutlineSettingsVS.colors.hero_hurt.color
	else
		health_bar_style.color = OutlineSettingsVS.colors.hero_dying.color
	end

	local marker_owner = Managers.player:owner(unit)
	local marker_owner_name = marker_owner:name()

	content.player_name = marker_owner_name

	return not is_dead
end

template.check_widget_visible = function (widget, vertical_pixel_overlap, horizontal_pixel_overlap)
	local style = widget.style
	local frame_style = style.frame
	local frame_size = frame_style.texture_size

	if horizontal_pixel_overlap and horizontal_pixel_overlap > frame_size[1] * 0.5 then
		return false
	end

	if vertical_pixel_overlap and vertical_pixel_overlap > frame_size[2] * 0.5 then
		return false
	end

	return true
end
