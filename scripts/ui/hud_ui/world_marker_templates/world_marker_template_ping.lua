WorldMarkerTemplates = WorldMarkerTemplates or {}
local NAME = "ping"
local template = WorldMarkerTemplates[NAME] or {}
WorldMarkerTemplates[NAME] = template
template.max_distance = 200
template.screen_clamp = true
template.screen_margins = {
	down = 150,
	up = 150,
	left = 150,
	right = 150
}

template.create_widget_defintion = function (scenegraph_id)
	local arrow_offset = 25

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				},
				{
					pass_type = "texture",
					style_id = "icon_pulse",
					texture_id = "icon_pulse"
				},
				{
					pass_type = "rotated_texture",
					style_id = "arrow",
					texture_id = "arrow",
					content_check_function = function (content)
						return content.is_clamped
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			text = "",
			icon = "icon_property_stamina",
			arrow = "console_consumable_icon_arrow_02",
			icon_pulse = "icon_property_stamina"
		},
		style = {
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					50,
					50
				},
				default_size = {
					50,
					50
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			},
			icon_pulse = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					50,
					50
				},
				default_size = {
					50,
					50
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				}
			},
			arrow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				angle = 0,
				pivot = {
					7 + arrow_offset,
					15
				},
				texture_size = {
					14,
					30
				},
				default_size = {
					14,
					30
				},
				color = {
					255,
					160,
					160,
					160
				},
				offset = {
					-arrow_offset,
					0,
					0
				}
			},
			text = {
				word_wrap = true,
				font_size = 20,
				localize = false,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				size = {
					100,
					50
				},
				text_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-50,
					-50,
					2
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

template.on_enter = function (widget)
	local content = widget.content
	content.spawn_progress_timer = 0
end

template.animation_update = function (ui_renderer, widget, settings, dt, t)
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
		content.spawn_progress_timer = (progress ~= 1 and spawn_progress_timer) or nil
		local icon_pulse_style = style.icon_pulse
		local icon_pulse_color = icon_pulse_style.color
		local icon_pulse_size = icon_pulse_style.texture_size
		local icon_pulse_default_size = icon_pulse_style.default_size
		icon_pulse_size[1] = icon_pulse_default_size[1] + icon_pulse_default_size[1] * anim_progress
		icon_pulse_size[2] = icon_pulse_default_size[1] + icon_pulse_default_size[2] * anim_progress
		icon_pulse_color[1] = 255 - 255 * anim_progress
		animating = true
	end

	local arrow_style = style.arrow
	arrow_style.angle = angle + math.pi * 0.5
	content.text = (distance > 1 and tostring(WeaveUtils.comma_value(math.floor(distance))) .. "m") or ""

	return animating
end

return
