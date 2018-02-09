local SIZE_X = 1920
local SIZE_Y = 1080
local RETAINED_MODE_ENABLED = nil
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.item_display_popup
		}
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.item_display_popup
		}
	},
	menu_root = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			0
		}
	},
	popup_bg_parent = {
		vertical_alignment = "center",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = {
			715,
			958
		},
		position = {
			0,
			60,
			2
		}
	},
	popup_bg = {
		vertical_alignment = "center",
		parent = "popup_bg_parent",
		horizontal_alignment = "center",
		size = {
			715,
			958
		},
		position = {
			0,
			-10,
			0
		}
	},
	claim_button = {
		vertical_alignment = "bottom",
		parent = "popup_bg_parent",
		horizontal_alignment = "center",
		size = {
			454,
			83
		},
		position = {
			0,
			45,
			2
		}
	},
	button_glow = {
		vertical_alignment = "center",
		parent = "claim_button",
		horizontal_alignment = "center",
		size = {
			454,
			83
		},
		position = {
			0,
			0,
			8
		}
	},
	thumb_widgets_pivot = {
		vertical_alignment = "center",
		parent = "claim_button",
		horizontal_alignment = "center",
		size = {
			64,
			64
		},
		position = {
			0,
			85,
			2
		}
	},
	title_text = {
		vertical_alignment = "top",
		parent = "popup_bg_parent",
		horizontal_alignment = "center",
		size = {
			560,
			80
		},
		position = {
			0,
			-120,
			0
		}
	},
	description_text = {
		vertical_alignment = "top",
		parent = "popup_bg_parent",
		horizontal_alignment = "center",
		size = {
			560,
			80
		},
		position = {
			0,
			-155,
			0
		}
	},
	reward_name_text = {
		vertical_alignment = "bottom",
		parent = "popup_bg_parent",
		horizontal_alignment = "center",
		size = {
			560,
			50
		},
		position = {
			0,
			260,
			1
		}
	},
	reward_type_text = {
		vertical_alignment = "bottom",
		parent = "popup_bg_parent",
		horizontal_alignment = "center",
		size = {
			560,
			50
		},
		position = {
			0,
			230,
			3
		}
	},
	divider = {
		vertical_alignment = "bottom",
		parent = "popup_bg_parent",
		horizontal_alignment = "center",
		size = {
			379,
			8
		},
		position = {
			0,
			200,
			1
		}
	},
	hero_icon = {
		vertical_alignment = "center",
		parent = "reward_type_text",
		horizontal_alignment = "center",
		size = {
			46,
			46
		},
		position = {
			0,
			-30,
			-1
		}
	},
	hero_icon_tooltip = {
		vertical_alignment = "center",
		parent = "reward_type_text",
		horizontal_alignment = "center",
		size = {
			46,
			46
		},
		position = {
			0,
			-30,
			-1
		}
	}
}

local function create_reward_thumb_widget()
	local widget_definition = {
		scenegraph_id = "thumb_widgets_pivot",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				},
				{
					pass_type = "texture",
					style_id = "icon_glow",
					texture_id = "icon_glow"
				},
				{
					pass_type = "texture",
					style_id = "icon_frame",
					texture_id = "icon_frame",
					content_check_function = function (content)
						return content.draw_frame
					end
				},
				{
					pass_type = "texture",
					style_id = "selection",
					texture_id = "selection",
					content_check_function = function (content)
						return content.selected
					end
				}
			}
		},
		content = {
			first_time = true,
			selection = "popup_icon_selection",
			icon_frame = "frame_01",
			selected = false,
			icon = "icons_placeholder",
			draw_frame = true,
			icon_glow = "popup_icon_glow",
			button_hotspot = {}
		},
		style = {
			icon_glow = {
				size = {
					128,
					128
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-33.5,
					-33.5,
					0
				}
			},
			icon = {
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
			icon_frame = {
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
			selection = {
				size = {
					128,
					128
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-33.5,
					-33.5,
					3
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	}

	return widget_definition
end

local default_tooltip_style = {
	font_size = 24,
	max_width = 500,
	localize = false,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	line_colors = {},
	offset = {
		0,
		0,
		3
	}
}
local widget_definitions = {
	hero_icon = UIWidgets.create_simple_texture("hero_icon_medium_dwarf_ranger_yellow", "hero_icon"),
	hero_icon_tooltip = UIWidgets.create_simple_tooltip("", "hero_icon_tooltip", nil, default_tooltip_style),
	title_text = UIWidgets.create_simple_text("Summer Solstice!", "title_text", 56, Colors.get_color_table_with_alpha("cheeseburger", 255), nil, "hell_shark_header"),
	description_text = UIWidgets.create_simple_text("Holiday Bonus Rewards", "description_text", 28, Colors.get_color_table_with_alpha("white", 255), nil, "hell_shark_header"),
	reward_name_text = UIWidgets.create_simple_text("", "reward_name_text", 28, Colors.get_color_table_with_alpha("cheeseburger", 255)),
	reward_type_text = UIWidgets.create_simple_text("", "reward_type_text", 24, Colors.get_color_table_with_alpha("white", 255)),
	button_glow = UIWidgets.create_simple_texture("popup_button_glow", "button_glow"),
	divider = UIWidgets.create_simple_texture("popup_divider", "divider"),
	popup_bg = UIWidgets.create_simple_texture("reward_popup_bg", "popup_bg"),
	claim_button = UIWidgets.create_popup_button_long("gift_popup_button_text", "claim_button"),
	close_button = UIWidgets.create_popup_button_long("close", "claim_button"),
	background = UIWidgets.create_simple_rect("screen", {
		255,
		0,
		0,
		0
	})
}
local generic_input_actions = {
	default = {
		{
			input_action = "confirm",
			priority = 4,
			description_text = "input_description_select"
		}
	},
	selection = {
		{
			input_action = "back",
			priority = 5,
			description_text = "input_description_close"
		}
	}
}
local animation_definitions = {
	chest_unit_spawn = {
		{
			name = "rotation",
			start_progress = 0,
			end_progress = 0.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.popup_bg.style.texture_id.color[1] = 0
				local chest_unit = params.chest_unit
				params.rotation_value = 0

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local chest_unit = params.chest_unit

				if chest_unit and Unit.alive(chest_unit) then
					local anim_progress = math.easeCubic(progress)
					local degrees = anim_progress*720
					local radian_angle = math.degrees_to_radians(degrees)
					local unit_rotation = Quaternion.axis_angle(Vector3(0, 0, 1), radian_angle)

					Unit.set_local_rotation(chest_unit, 0, unit_rotation)
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "scale",
			start_progress = 0,
			end_progress = 0.25,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local chest_unit = params.chest_unit

				if chest_unit and Unit.alive(chest_unit) then
					local unit_box, box_dimension = Unit.box(chest_unit)

					if box_dimension then
						local max_value = 0.15
						local largest_value = 0

						if largest_value < box_dimension.x then
							largest_value = box_dimension.x
						end

						if largest_value < box_dimension.z then
							largest_value = box_dimension.z
						end

						if largest_value < box_dimension.y then
							largest_value = box_dimension.y
						end

						if max_value < largest_value then
							local diff = largest_value - max_value
							local scale_fraction = diff/largest_value - 1
							local scale = Vector3(0, 0, 0)

							Unit.set_local_scale(chest_unit, 0, scale)

							params.end_scale_fraction = scale_fraction
						end
					end
				end

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local chest_unit = params.chest_unit

				if chest_unit and Unit.alive(chest_unit) then
					local anim_progress = math.easeCubic(progress)
					local end_scale_fraction = params.end_scale_fraction or 0.15
					local scale_fraction = end_scale_fraction*anim_progress
					local scale = Vector3(scale_fraction, scale_fraction, scale_fraction)

					if progress == 1 then
						print("scale_fraction", scale_fraction)
					end

					Unit.set_local_scale(chest_unit, 0, scale)
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "position",
			start_progress = 0.01,
			end_progress = 0.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local chest_unit = params.chest_unit

				if chest_unit and Unit.alive(chest_unit) then
					local anim_progress = math.easeCubic(progress)
					local reward_viewport = params.reward_viewport
					local camera = ScriptViewport.camera(reward_viewport)
					local camera_rotation = ScriptCamera.rotation(camera)
					local camera_position = ScriptCamera.position(camera)
					local camera_forward_vector = Quaternion.forward(camera_rotation)
					local unit_spawn_position = camera_position + camera_forward_vector
					unit_spawn_position.z = unit_spawn_position.z - 0.3 + anim_progress*0.29
					local unit_box, box_dimension = Unit.box(chest_unit)
					local unit_center_position = Matrix4x4.translation(unit_box)
					local unit_root_position = Unit.world_position(chest_unit, 0)
					local offset = unit_center_position - unit_root_position
					local scale_fraction = params.end_scale_fraction or 0
					offset = offset*scale_fraction
					local display_position = unit_spawn_position - offset

					Unit.set_local_position(chest_unit, 0, display_position)
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "bg_fade_in",
			start_progress = 0.6,
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local divider = widgets.divider
				local popup_bg = widgets.popup_bg
				local title_text = widgets.title_text
				local description_text = widgets.description_text
				local alpha = anim_progress*255
				divider.style.texture_id.color[1] = alpha
				popup_bg.style.texture_id.color[1] = alpha
				title_text.style.text.text_color[1] = alpha
				description_text.style.text.text_color[1] = alpha

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "button_fade_in",
			start_progress = 1.4,
			end_progress = 1.71,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local alpha = anim_progress*255
				local claim_button = widgets.claim_button
				claim_button.style.texture.color[1] = alpha
				claim_button.style.text.text_color[1] = alpha
				claim_button.style.text_hover.text_color[1] = alpha
				claim_button.style.text_selected.text_color[1] = alpha
				claim_button.style.text_disabled.text_color[1] = alpha

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "animation_fall",
			start_progress = 0.65,
			end_progress = 0.71,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local chest_unit = params.chest_unit

				if chest_unit and Unit.alive(chest_unit) then
					Unit.flow_event(chest_unit, "loot_chest_fall")
				end

				return 
			end
		},
		{
			name = "chest_land",
			start_progress = 0.71,
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				WwiseWorld.trigger_event(params.wwise_world, "hud_reward_chest_land")

				return 
			end
		},
		{
			name = "animation_fall_xxx",
			start_progress = 0.71,
			end_progress = 1.71,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	chest_unit_open = {
		{
			name = "animation_open",
			start_progress = 0,
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local chest_unit = params.chest_unit

				if chest_unit and Unit.alive(chest_unit) then
					Unit.flow_event(chest_unit, "loot_chest_open")
				end

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "scale",
			start_progress = 1.1,
			end_progress = 1.25,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local chest_unit = params.chest_unit

				if chest_unit and Unit.alive(chest_unit) then
					local unit_box, box_dimension = Unit.box(chest_unit)

					if box_dimension then
						local max_value = 0.1
						local largest_value = 0

						if largest_value < box_dimension.x then
							largest_value = box_dimension.x
						end

						if largest_value < box_dimension.z then
							largest_value = box_dimension.z
						end

						if largest_value < box_dimension.y then
							largest_value = box_dimension.y
						end

						if max_value < largest_value then
							local diff = largest_value - max_value
							local scale_fraction = diff/largest_value - 1
							params.end_scale_fraction = scale_fraction
						end
					end
				end

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local chest_unit = params.chest_unit

				if chest_unit and Unit.alive(chest_unit) then
					local anim_progress = math.easeOutCubic(progress) - 1
					local end_scale_fraction = params.end_scale_fraction or 0.1
					local scale_fraction = end_scale_fraction*anim_progress
					local scale = Vector3(scale_fraction, scale_fraction, scale_fraction)

					Unit.set_local_scale(chest_unit, 0, scale)
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	thumbs_fade_in = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local thumb_widgets = widgets.thumb_widgets

				for slot9, slot10 in ipairs(thumb_widgets) do
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	}
}

return {
	widget_definitions = widget_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
	create_reward_thumb_widget = create_reward_thumb_widget
}
