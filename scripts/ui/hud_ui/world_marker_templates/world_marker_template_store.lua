local NAME = "store"
WorldMarkerTemplates = WorldMarkerTemplates or {}
local template = WorldMarkerTemplates[NAME] or {}
WorldMarkerTemplates[NAME] = template
template.check_line_of_sight = false
template.position_offset = {
	0.25,
	0.25,
	0.9
}
template.screen_clamp = true
template.screen_clamp_method = "tutorial"
template.distance_from_center = {
	width = 400,
	height = 200
}
template.scale_settings = {
	end_scale_distance = 100,
	start_scale_distance = 10,
	min_scale = 0.5
}

template.create_widget_definition = function (scenegraph_id)
	local size_scale = 1

	return {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		},
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				},
				{
					pass_type = "texture",
					style_id = "star",
					texture_id = "star",
					content_check_function = function (content)
						return content.show_star
					end
				},
				{
					texture_id = "arrow",
					style_id = "arrow",
					pass_type = "rotated_texture",
					content_check_function = function (content, style)
						return style.color[1] > 0
					end
				}
			}
		},
		content = {
			arrow = "indicator",
			icon = "hud_store_icon",
			star = "list_item_tag_new",
			show_star = true
		},
		style = {
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					0,
					0
				},
				offset = {
					0,
					0,
					0
				},
				default_size = {
					size_scale * 64,
					size_scale * 64
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			star = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					126,
					51
				},
				offset = {
					0,
					25,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			arrow = {
				vertical_alignment = "center",
				angle = 0,
				horizontal_alignment = "center",
				texture_size = {
					38,
					18
				},
				pivot = {
					19,
					9
				},
				offset = {
					0,
					0,
					0
				},
				color = {
					0,
					255,
					255,
					255
				}
			}
		}
	}
end

template.on_enter = function (widget)
	local content = widget.content
	content.progress = 1
end

local function get_arrow_angle_and_offset(forward_dot, right_dot, arrow_size, icon_size, height_from_center)
	local static_angle_value = 1.57079633
	local offset_x = 0
	local offset_y = 0
	local offset_z = 0
	local angle = math.atan2(right_dot, forward_dot)

	if height_from_center < -400 and forward_dot > 0.6 then
		offset_y = -(icon_size[2] * 0.5 + arrow_size[2])
		static_angle_value = static_angle_value * 2
	elseif height_from_center > 400 and forward_dot > 0.6 then
		offset_y = icon_size[2] * 0.5 + arrow_size[2]
		static_angle_value = 0
	elseif angle >= 0 then
		offset_x = icon_size[2] * 0.5 + arrow_size[2]
	elseif angle < 0 then
		offset_x = -(icon_size[2] * 0.5 + arrow_size[2])
		static_angle_value = -static_angle_value
	end

	return static_angle_value, offset_x, offset_y, offset_z
end

template.update_function = function (ui_renderer, widget, marker, settings, dt, t)
	local content = widget.content
	local style = widget.style
	local icon_style = style.icon
	local star_style = style.star
	local arrow_style = style.arrow
	local is_clamped = content.is_clamped
	local clamped_alpha = 100
	icon_style.color[1] = is_clamped and 100 or 255
	star_style.color[1] = is_clamped and 100 or 200
	arrow_style.color[1] = is_clamped and 100 or 0
	arrow_style.angle = content.angle
	local angle, ox, oy, oz = get_arrow_angle_and_offset(content.forward_dot_flat, content.right_dot_flat, arrow_style.texture_size, icon_style.texture_size, widget.offset[2] - 540)
	arrow_style.angle = angle
	arrow_style.offset[1] = ox
	arrow_style.offset[2] = oy
	arrow_style.offset[3] = oz
	widget.alpha_multiplier = 1

	if content.show_star and not ItemHelper.has_unseen_shop_items() then
		content.show_star = false
	end

	return false
end
