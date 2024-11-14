-- chunkname: @scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_hero_status.lua

WorldMarkerTemplates = WorldMarkerTemplates or {}

local NAME = "versus_hero_status"
local template = WorldMarkerTemplates[NAME] or {}

WorldMarkerTemplates[NAME] = template

local function pulsate_glow(should_pulsate)
	if not should_pulsate then
		return 255
	end

	return 165 + 90 * math.sin(5 * Managers.time:time("ui"))
end

template.max_distance = 50
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
		10,
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
					style_id = "total_health_bar",
					texture_id = "rect",
				},
				{
					pass_type = "rect",
					style_id = "perm_health_bar",
					texture_id = "rect",
				},
				{
					pass_type = "rect",
					style_id = "streak_health_bar",
					texture_id = "rect",
					content_check_function = function (content)
						return content.streak_damage_percent > 0
					end,
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
			rect = "versus_floating_hero_health_fill",
			stored_health_percent = 1,
			streak_damage_percent = 0,
		},
		style = {
			frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = health_bar_size,
				default_size = health_bar_size,
				color = {
					255,
					45,
					33,
					27,
				},
				offset = {
					0,
					0,
					5,
				},
			},
			health_bg = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					health_bar_size[1] - 4,
					health_bar_size[2] - 3,
				},
				default_size = {
					health_bar_size[1] - 4,
					health_bar_size[2] - 3,
				},
				color = {
					100,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			perm_health_bar = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					health_bar_size[1] - 4,
					health_bar_size[2] - 3,
				},
				default_size = {
					health_bar_size[1] - 4,
					health_bar_size[2] - 3,
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
					4,
				},
			},
			streak_health_bar = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					health_bar_size[1] - 4,
					health_bar_size[2] - 3,
				},
				default_size = {
					health_bar_size[1] - 4,
					health_bar_size[2] - 3,
				},
				color = {
					255,
					139,
					0,
					0,
				},
				offset = {
					0,
					0,
					4,
				},
			},
			total_health_bar = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					health_bar_size[1] - 4,
					health_bar_size[2] - 3,
				},
				default_size = {
					health_bar_size[1] - 4,
					health_bar_size[2] - 3,
				},
				color = {
					255,
					195,
					195,
					195,
				},
				base_color = {
					255,
					195,
					195,
					195,
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
				use_shadow = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("opponent_team", 255),
				offset = {
					-100,
					-4,
					2,
				},
				size = {
					200,
					40,
				},
				shadow_offset = {
					-1,
					1,
					0,
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
					-99,
					-5,
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
	local is_knocked_down = status_extension:is_knocked_down()
	local is_ready_for_assisted_respawn = status_extension:is_ready_for_assisted_respawn()
	local is_dead = status_extension:is_dead()
	local total_health_percent = is_dead and 0 or health_extension:current_health_percent()
	local perm_health_percent = status_extension:is_dead() and 0 or health_extension:current_permanent_health_percent()

	if is_ready_for_assisted_respawn then
		total_health_percent = 0
	end

	local total_health_bar_style = style.total_health_bar
	local max_length = total_health_bar_style.default_size[1]
	local current_length = max_length * total_health_percent

	total_health_bar_style.texture_size[1] = current_length
	total_health_bar_style.offset[1] = -(max_length - current_length) / 2
	total_health_bar_style.color = is_knocked_down and OutlineSettingsVS.colors.hero_dying.color or total_health_bar_style.base_color

	local streak_health_bar_style = style.streak_health_bar
	local is_alive = not is_knocked_down and not is_dead and not is_ready_for_assisted_respawn

	if is_alive then
		if perm_health_percent > content.stored_health_percent then
			streak_health_bar_style.color[1] = 0
			content.streak_damage_timestamp = nil
			content.stored_health_percent = perm_health_percent
			content.streak_damage_percent = 0
		elseif perm_health_percent < 1 then
			local stored_health_percent = content.stored_health_percent
			local streak_damage_percent = stored_health_percent - perm_health_percent

			if streak_damage_percent > content.streak_damage_percent then
				content.streak_damage_percent = streak_damage_percent
				content.streak_damage_timestamp = t + 2.2
			end
		else
			streak_health_bar_style.color[1] = 0
			content.streak_damage_timestamp = nil
			content.stored_health_percent = perm_health_percent
			content.streak_damage_percent = 0
		end
	else
		streak_health_bar_style.color[1] = 0
		content.streak_damage_timestamp = nil
		content.stored_health_percent = perm_health_percent
		content.streak_damage_percent = 0
	end

	if content.streak_damage_timestamp then
		local streak_damage_decline_time = 0.5
		local diff = math.clamp(content.streak_damage_timestamp + streak_damage_decline_time - t, 0, 1)
		local streak_length_mutliplier = math.lerp(0, 1, diff)
		local max_streak_length = streak_health_bar_style.default_size[1]
		local current_streak_length = max_streak_length * content.streak_damage_percent * math.easeCubic(streak_length_mutliplier)

		streak_health_bar_style.color[1] = 255
		streak_health_bar_style.texture_size[1] = current_streak_length
		streak_health_bar_style.offset[1] = -max_length / 2 + current_length + current_streak_length / 2

		if t > content.streak_damage_timestamp + streak_damage_decline_time then
			content.streak_damage_timestamp = nil
			streak_health_bar_style.color[1] = 0
			content.streak_damage_percent = 0
			content.stored_health_percent = perm_health_percent
		end
	end

	local perm_health_bar_style = style.perm_health_bar
	local max_length = perm_health_bar_style.default_size[1]
	local current_length = max_length * perm_health_percent

	perm_health_bar_style.texture_size[1] = current_length
	perm_health_bar_style.offset[1] = -(max_length - current_length) / 2

	local should_pulsate = status_extension:wounded_and_on_last_wound()
	local bar_alpha = pulsate_glow(should_pulsate)

	perm_health_bar_style.color[1] = bar_alpha
	total_health_bar_style.color[1] = bar_alpha

	local marker_owner = Managers.player:owner(unit)
	local marker_owner_name = marker_owner and marker_owner:name() or ""
	local marker_owner_name_length = UTF8Utils.string_length(marker_owner_name)

	if marker_owner_name_length > 18 then
		marker_owner_name = string.sub(marker_owner_name, 1, 18) .. "..."
	end

	content.player_name = marker_owner_name

	local distance = content.distance
	local max_distance = settings.max_distance
	local alpha_modifier = distance / max_distance

	widget.alpha_multiplier = 1 - alpha_modifier

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
