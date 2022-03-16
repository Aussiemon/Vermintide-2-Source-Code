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
	list_background_bottom = {
		vertical_alignment = "bottom",
		parent = "area_left",
		horizontal_alignment = "left",
		size = {
			241,
			434
		},
		position = {
			50,
			-30,
			1
		}
	},
	list_background_top = {
		vertical_alignment = "bottom",
		parent = "list_background_bottom",
		horizontal_alignment = "center",
		size = {
			241,
			434
		},
		position = {
			0,
			434,
			1
		}
	},
	list_entry_root = {
		vertical_alignment = "top",
		parent = "list_background_bottom",
		horizontal_alignment = "right",
		size = {
			0,
			0
		},
		position = {
			56,
			0,
			2
		}
	},
	list_entry = {
		vertical_alignment = "center",
		parent = "list_entry_root",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			2
		}
	},
	description_text = {
		vertical_alignment = "top",
		parent = "area_right",
		horizontal_alignment = "left",
		size = {
			650,
			400
		},
		position = {
			0,
			-140,
			2
		}
	},
	tite_text = {
		vertical_alignment = "top",
		parent = "description_text",
		horizontal_alignment = "center",
		size = {
			600,
			50
		},
		position = {
			0,
			-20,
			2
		}
	},
	divider = {
		vertical_alignment = "top",
		parent = "description_text",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-70,
			1
		}
	}
}
local title_text_style = {
	font_size = 42,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = false,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local description_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		-20,
		2
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
			input_action = "show_gamercard",
			priority = 2,
			description_text = "start_menu_switch_hero"
		},
		{
			input_action = "confirm",
			priority = 3,
			description_text = "input_description_select"
		},
		{
			input_action = "back",
			priority = 4,
			description_text = "input_description_close"
		}
	}
}

local function create_list_entry(scenegraph_id, index)
	return {
		element = {
			passes = {
				{
					style_id = "hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "background",
					style_id = "background",
					pass_type = "texture"
				},
				{
					texture_id = "selection",
					style_id = "selection",
					pass_type = "texture"
				},
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture"
				},
				{
					texture_id = "holder",
					style_id = "holder",
					pass_type = "rotated_texture"
				}
			}
		},
		content = {
			holder = "console_crafting_recipe_holder",
			background = "console_crafting_disc_small",
			icon = "console_crafting_disc_small",
			selection = "console_crafting_disc_small_inner_glow",
			button_hotspot = {}
		},
		style = {
			hotspot = {
				size = {
					128,
					80
				},
				offset = {
					-64,
					-40,
					0
				}
			},
			background = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					128,
					128
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					0
				}
			},
			selection = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					128,
					128
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1
				}
			},
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					128,
					128
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2
				}
			},
			holder = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				angle = 0,
				pivot = {
					83.5,
					11
				},
				texture_size = {
					39,
					22
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-64,
					0,
					3
				}
			}
		},
		offset = {
			0,
			0,
			index * 4
		},
		scenegraph_id = scenegraph_id
	}
end

local title_button_definitions = {}
local num_buttons = 10

for i = 1, num_buttons, 1 do
	title_button_definitions[i] = create_list_entry("list_entry", i)
end

local widgets = {
	list_background_bottom = UIWidgets.create_simple_texture("console_crafting_recipe_bg", "list_background_bottom"),
	list_background_top = UIWidgets.create_simple_uv_texture("console_crafting_recipe_bg", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "list_background_top"),
	divider = UIWidgets.create_simple_texture("divider_01_top", "divider"),
	tite_text = UIWidgets.create_simple_text("n/a", "tite_text", nil, nil, title_text_style),
	description_text = UIWidgets.create_simple_text("n/a", "description_text", nil, nil, description_text_style),
	description_bg = UIWidgets.create_rect_with_outer_frame("description_text", scenegraph_definition.description_text.size, "frame_outer_fade_02", 0, UISettings.console_menu_rect_color)
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				params.animation_settings.entry_alignment_progress = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
				params.animation_settings.entry_alignment_progress = anim_progress
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
