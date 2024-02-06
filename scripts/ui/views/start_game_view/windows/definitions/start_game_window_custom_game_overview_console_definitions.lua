-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_custom_game_overview_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local game_option_size = {
	window_size[1],
	194,
}
local window_text_width = window_size[1]
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	menu_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	window = {
		horizontal_alignment = "left",
		parent = "menu_root",
		vertical_alignment = "center",
		size = window_size,
		position = {
			220,
			0,
			1,
		},
	},
	window_game_mode_root = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			window_frame_height,
		},
		position = {
			0,
			-window_frame_height,
			1,
		},
	},
	custom_game_background = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1] + 70,
			290,
		},
		position = {
			0,
			0,
			1,
		},
	},
	custom_game_title = {
		horizontal_alignment = "center",
		parent = "custom_game_background",
		vertical_alignment = "top",
		size = {
			window_text_width,
			50,
		},
		position = {
			0,
			-30,
			1,
		},
	},
	custom_game_divider = {
		horizontal_alignment = "center",
		parent = "custom_game_title",
		vertical_alignment = "top",
		size = {
			264,
			32,
		},
		position = {
			0,
			-36,
			1,
		},
	},
	custom_game_description = {
		horizontal_alignment = "center",
		parent = "custom_game_divider",
		vertical_alignment = "top",
		size = {
			window_text_width,
			200,
		},
		position = {
			0,
			-36,
			1,
		},
	},
	game_option_3 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			-15,
			-75,
			1,
		},
	},
	game_option_2 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			-15,
			-75 + game_option_size[2],
			1,
		},
	},
	game_option_1 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			-15,
			-75 + game_option_size[2] * 2,
			1,
		},
	},
	play_button_console = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			0,
			-42,
			1,
		},
	},
	play_button = {
		horizontal_alignment = "center",
		parent = "play_button_console",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-165,
			0,
			1,
		},
	},
	selector = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2] + 22,
		},
		position = {
			0,
			0,
			1,
		},
	},
}
local custom_game_title_style = {
	dynamic_font_size = true,
	font_size = 50,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local custom_game_description_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local widgets = {
	custom_game_description_background = UIWidgets.create_rect_with_outer_frame("custom_game_background", scenegraph_definition.custom_game_background.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	custom_game_title = UIWidgets.create_simple_text(Localize("start_game_window_specific_title"), "custom_game_title", nil, nil, custom_game_title_style),
	custom_game_divider = UIWidgets.create_simple_texture("divider_01_top", "custom_game_divider"),
	custom_game_description = UIWidgets.create_simple_text(Localize("start_game_window_specific_desc"), "custom_game_description", nil, nil, custom_game_description_style),
	mission_setting = UIWidgets.create_start_game_console_setting_button("game_option_1", Localize("start_game_window_mission"), nil, nil, nil, scenegraph_definition.game_option_1.size),
	difficulty_setting = UIWidgets.create_start_game_console_setting_button("game_option_2", Localize("start_game_window_difficulty"), nil, "difficulty_option_1", nil, scenegraph_definition.game_option_2.size, true),
	play_button = UIWidgets.create_icon_and_name_button("play_button", "options_button_icon_quickplay", Localize("start_game_window_play")),
}
local selector_input_definition = {
	"mission_setting",
	"difficulty_setting",
	"play_button",
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widgets,
	animation_definitions = animation_definitions,
	selector_input_definition = selector_input_definition,
}
