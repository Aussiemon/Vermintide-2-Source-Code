local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local game_option_size = {
	window_size[1] - window_frame_width * 2,
	(window_size[2] - window_frame_height * 2) / 3.5
}
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	top_banner = {
		vertical_alignment = "bottom",
		parent = "divider",
		horizontal_alignment = "center",
		size = {
			600,
			180
		},
		position = {
			0,
			40,
			2
		}
	},
	description_text = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			600,
			180
		},
		position = {
			0,
			-220,
			2
		}
	},
	divider = {
		vertical_alignment = "bottom",
		parent = "description_text",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-40,
			1
		}
	},
	divider_bottom = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-20,
			1
		}
	},
	background = {
		vertical_alignment = "top",
		parent = "divider",
		horizontal_alignment = "center",
		size = {
			574,
			90
		},
		position = {
			0,
			-12,
			-1
		}
	},
	title_entry = {
		vertical_alignment = "top",
		parent = "divider",
		horizontal_alignment = "center",
		size = {
			800,
			50
		},
		position = {
			0,
			-20,
			1
		}
	},
	logo = {
		vertical_alignment = "bottom",
		parent = "divider",
		horizontal_alignment = "center",
		size = {
			390,
			197
		},
		position = {
			0,
			80,
			1
		}
	}
}
local generic_input_actions = {
	default = {
		{
			input_action = "d_vertical",
			priority = 1,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
		{
			input_action = "confirm",
			priority = 2,
			description_text = "input_description_select"
		},
		{
			input_action = "back",
			priority = 3,
			description_text = "input_description_close"
		}
	}
}

local function create_title_button(scenegraph_id, text, font_size, optional_offset, optional_horizontal_alignment)
	local shadow_offset = {
		2,
		-2,
		3
	}

	if optional_offset then
		shadow_offset[1] = shadow_offset[1] + optional_offset[1]
		shadow_offset[2] = shadow_offset[2] + optional_offset[2]
		shadow_offset[3] = optional_offset[3] - 1
	end

	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text_field"
				},
				{
					style_id = "text_hover",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button and (content.button_hotspot.is_hover or content.button_hotspot.is_selected)
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button and not content.button_hotspot.is_hover and not content.button_hotspot.is_selected
					end
				},
				{
					style_id = "text_disabled",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return content.button_hotspot.disable_button
					end
				}
			}
		},
		content = {
			button_hotspot = {},
			text_field = text,
			default_font_size = font_size
		},
		style = {
			text = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = optional_offset or {
					0,
					0,
					4
				}
			},
			text_shadow = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = shadow_offset
			},
			text_hover = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = optional_offset or {
					0,
					0,
					4
				}
			},
			text_disabled = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("gray", 50),
				offset = optional_offset or {
					0,
					0,
					4
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

local title_button_definitions = {}
local num_buttons = 11

for i = 1, num_buttons, 1 do
	title_button_definitions[i] = create_title_button("title_entry", "n/a", 52, {
		0,
		-6,
		4
	}, "center")
end

local widgets = {
	divider = UIWidgets.create_simple_texture("divider_01_top", "divider"),
	divider_bottom = UIWidgets.create_simple_texture("divider_01_top", "divider_bottom"),
	background = UIWidgets.create_simple_texture("ingame_view_background_console", "background", nil, nil, {
		255,
		0,
		0,
		0
	}),
	logo = UIWidgets.create_simple_texture("hero_view_home_logo", "logo")
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
				ui_scenegraph.area_left.local_position[1] = scenegraph_definition.area_left.position[1] + -100 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	widgets = widgets,
	generic_input_actions = generic_input_actions,
	title_button_definitions = title_button_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
