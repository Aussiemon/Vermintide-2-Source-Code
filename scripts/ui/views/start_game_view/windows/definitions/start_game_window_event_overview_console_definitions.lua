local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local game_option_size = {
	window_size[1],
	194
}
local window_text_width = window_size[1]
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
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}
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
			UILayer.default
		}
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
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
	window = {
		vertical_alignment = "center",
		parent = "menu_root",
		horizontal_alignment = "left",
		size = window_size,
		position = {
			220,
			0,
			1
		}
	},
	window_game_mode_root = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			window_frame_height
		},
		position = {
			0,
			-window_frame_height,
			1
		}
	},
	event_background = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] + 70,
			230
		},
		position = {
			0,
			0,
			1
		}
	},
	event_title = {
		vertical_alignment = "top",
		parent = "event_background",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			50
		},
		position = {
			0,
			-30,
			1
		}
	},
	event_divider = {
		vertical_alignment = "top",
		parent = "event_title",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-36,
			1
		}
	},
	event_description = {
		vertical_alignment = "top",
		parent = "event_divider",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			200
		},
		position = {
			0,
			-36,
			1
		}
	},
	difficulty_setting = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = game_option_size,
		position = {
			-15,
			-15 + game_option_size[2] * 2,
			1
		}
	},
	play_button_console = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = game_option_size,
		position = {
			0,
			220,
			1
		}
	},
	play_button = {
		vertical_alignment = "center",
		parent = "play_button_console",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			-165,
			0,
			1
		}
	}
}
local event_title_style = {
	font_size = 50,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = false,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local event_description_style = {
	font_size = 28,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local widgets = {
	event_description_background = UIWidgets.create_rect_with_outer_frame("event_background", scenegraph_definition.event_background.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	event_title = UIWidgets.create_simple_text("", "event_title", nil, nil, event_title_style),
	event_divider = UIWidgets.create_simple_texture("divider_01_top", "event_divider"),
	event_description = UIWidgets.create_simple_text("start_game_window_event_desc", "event_description", nil, nil, event_description_style),
	difficulty_setting = UIWidgets.create_start_game_console_setting_button("difficulty_setting", Localize("start_game_window_difficulty"), nil, "difficulty_option_1", nil, scenegraph_definition.difficulty_setting.size, true),
	play_button_console = UIWidgets.create_start_game_console_play_button("play_button_console"),
	play_button = UIWidgets.create_icon_and_name_button("play_button", "options_button_icon_quickplay", Localize("start_game_window_play"))
}
local selector_input_definition = {
	"difficulty_setting"
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widgets,
	animation_definitions = animation_definitions,
	selector_input_definition = selector_input_definition
}
