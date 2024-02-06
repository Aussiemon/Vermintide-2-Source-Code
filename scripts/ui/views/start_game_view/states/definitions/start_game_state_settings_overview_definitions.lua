-- chunkname: @scripts/ui/views/start_game_view/states/definitions/start_game_state_settings_overview_definitions.lua

local window_default_settings = UISettings.game_start_windows
local small_window_background = window_default_settings.background
local small_window_frame = window_default_settings.frame
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local large_window_frame = window_default_settings.large_window_frame
local large_window_frame_width = UIFrameSettings[large_window_frame].texture_sizes.vertical[1]
local inner_window_size = {
	small_window_size[1] * 3 + small_window_spacing * 2 + large_window_frame_width * 2,
	small_window_size[2] + 80,
}
local window_size = {
	inner_window_size[1] + 50,
	inner_window_size[2],
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
	screen = {
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
	header = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "top",
		size = {
			1920,
			50,
		},
		position = {
			0,
			-20,
			100,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			0,
		},
	},
	window_background = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = {
			window_size[1] - 5,
			window_size[2] - 5,
		},
		position = {
			0,
			0,
			0,
		},
	},
	window_background_mask = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = {
			window_size[1] - 5,
			window_size[2] - 5,
		},
		position = {
			0,
			0,
			1,
		},
	},
	inner_window = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = inner_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	inner_window_header = {
		horizontal_alignment = "center",
		parent = "inner_window",
		vertical_alignment = "top",
		size = {
			inner_window_size[1],
			50,
		},
		position = {
			0,
			0,
			1,
		},
	},
	exit_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			380,
			42,
		},
		position = {
			0,
			-16,
			10,
		},
	},
	title = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			658,
			60,
		},
		position = {
			0,
			34,
			10,
		},
	},
	title_bg = {
		horizontal_alignment = "center",
		parent = "title",
		vertical_alignment = "top",
		size = {
			410,
			40,
		},
		position = {
			0,
			-15,
			-1,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "title",
		vertical_alignment = "center",
		size = {
			350,
			50,
		},
		position = {
			0,
			-3,
			2,
		},
	},
}
local title_text_style = {
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local disable_with_gamepad = true
local widgets = {
	window = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_11"),
	window_background = UIWidgets.create_tiled_texture("window_background", "menu_frame_bg_01", {
		960,
		1080,
	}, nil, nil, {
		255,
		100,
		100,
		100,
	}),
	window_background_mask = UIWidgets.create_tiled_texture("window_background_mask", "menu_frame_bg_01", {
		960,
		1080,
	}, nil, true),
	exit_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_close"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	back_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_back"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("start_game_view_title"), "title_text", nil, nil, title_text_style),
}
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

				params.render_settings.alpha_multiplier = 1
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
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
