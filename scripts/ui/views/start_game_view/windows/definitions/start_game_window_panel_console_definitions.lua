-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_panel_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local game_option_size = {
	220,
	68,
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
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	panel = {
		scale = "fit_width",
		vertical_alignment = "top",
		size = {
			1920,
			79,
		},
		position = {
			0,
			0,
			UILayer.default + 1,
		},
	},
	panel_edge = {
		scale = "fit_width",
		vertical_alignment = "top",
		size = {
			1920,
			4,
		},
		position = {
			0,
			0,
			UILayer.default + 10,
		},
	},
	bottom_panel = {
		scale = "fit_width",
		vertical_alignment = "bottom",
		size = {
			1920,
			79,
		},
		position = {
			0,
			0,
			UILayer.default + 1,
		},
	},
	back_button = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			40,
			-120,
			3,
		},
	},
	close_button = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			40,
			-34,
			3,
		},
	},
	panel_entry_area = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			1600,
			70,
		},
		position = {
			70,
			0,
			1,
		},
	},
	game_mode_option = {
		horizontal_alignment = "left",
		parent = "panel_entry_area",
		vertical_alignment = "top",
		size = game_option_size,
		position = {
			20,
			0,
			14,
		},
	},
	panel_input_area_1 = {
		horizontal_alignment = "left",
		parent = "game_mode_option",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-50,
			8,
			1,
		},
	},
	panel_input_area_2 = {
		horizontal_alignment = "right",
		parent = "game_mode_option",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			50,
			8,
			1,
		},
	},
	menu_root = {
		horizontal_alignment = "center",
		parent = "screen",
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
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1,
		},
	},
	title_text_glow = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			544,
			16,
		},
		position = {
			0,
			15,
			-1,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "title_text_glow",
		vertical_alignment = "center",
		size = {
			window_size[1],
			50,
		},
		position = {
			0,
			15,
			1,
		},
	},
}
local panel_color = UISettings.console_menu_rect_color
local widget_definitions = {
	panel_edge = UIWidgets.create_simple_texture("menu_frame_04_divider", "panel_edge"),
	panel_input_area_1 = UIWidgets.create_simple_texture("xbone_button_icon_lt", "panel_input_area_1"),
	panel_input_area_2 = UIWidgets.create_simple_texture("xbone_button_icon_rt", "panel_input_area_2"),
	panel = UIWidgets.create_simple_texture("menu_panel_bg", "panel", nil, nil, panel_color),
	bottom_panel = UIWidgets.create_simple_uv_texture("menu_panel_bg", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_panel", nil, nil, panel_color),
	back_button = UIWidgets.create_layout_button("back_button", "layout_button_back", "layout_button_back_glow"),
	close_button = UIWidgets.create_layout_button("close_button", "layout_button_close", "layout_button_close_glow"),
}

return {
	widget_definitions = widget_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	create_panel_button = UIWidgets.create_console_panel_button,
}
