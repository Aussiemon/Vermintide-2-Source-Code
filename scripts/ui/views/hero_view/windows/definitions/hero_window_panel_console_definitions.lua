-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_panel_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local game_option_size = {
	window_size[1] - window_frame_width * 2,
	(window_size[2] - window_frame_height * 2) / 3.5,
}
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
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
			UILayer.options_menu + 1,
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
			UILayer.options_menu + 10,
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
			UILayer.options_menu + 1,
		},
	},
	system_button = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			254,
			114,
		},
		position = {
			68,
			0,
			3,
		},
	},
	bot_customization_button = {
		horizontal_alignment = "right",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			250,
			105,
		},
		position = {
			-25,
			10,
			0,
		},
	},
	bot_customization_info_bar = {
		horizontal_alignment = "right",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			464,
			100,
		},
		position = {
			-180,
			20,
			3,
		},
	},
	panel_entry_area = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			900,
			70,
		},
		position = {
			320,
			0,
			1,
		},
	},
	panel_input_area_1 = {
		horizontal_alignment = "left",
		parent = "game_option_1",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-300,
			8,
			1,
		},
	},
	panel_input_area_2 = {
		horizontal_alignment = "right",
		parent = "game_option_4",
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
	game_option_pivot = {
		horizontal_alignment = "left",
		parent = "panel_entry_area",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			20,
			0,
			1,
		},
	},
	game_option_1 = {
		horizontal_alignment = "left",
		parent = "game_option_pivot",
		vertical_alignment = "top",
		size = {
			220,
			68,
		},
		position = {
			0,
			0,
			0,
		},
	},
	game_option_2 = {
		horizontal_alignment = "left",
		parent = "game_option_pivot",
		vertical_alignment = "top",
		size = {
			220,
			68,
		},
		position = {
			0,
			0,
			0,
		},
	},
	game_option_3 = {
		horizontal_alignment = "left",
		parent = "game_option_pivot",
		vertical_alignment = "top",
		size = {
			220,
			68,
		},
		position = {
			0,
			0,
			0,
		},
	},
	game_option_4 = {
		horizontal_alignment = "left",
		parent = "game_option_pivot",
		vertical_alignment = "top",
		size = {
			220,
			68,
		},
		position = {
			0,
			0,
			0,
		},
	},
	game_option_5 = {
		horizontal_alignment = "left",
		parent = "game_option_pivot",
		vertical_alignment = "top",
		size = {
			220,
			68,
		},
		position = {
			0,
			0,
			0,
		},
	},
	preorder_divider = {
		horizontal_alignment = "center",
		parent = "panel",
		vertical_alignment = "center",
		size = {
			264,
			32,
		},
		position = {
			0,
			-110,
			3,
		},
	},
	preorder_divider_effect = {
		horizontal_alignment = "center",
		parent = "preorder_divider",
		vertical_alignment = "bottom",
		size = {
			310,
			120,
		},
		position = {
			0,
			7,
			-1,
		},
	},
	preorder_divider_top = {
		horizontal_alignment = "center",
		parent = "preorder_divider",
		vertical_alignment = "center",
		size = {
			264,
			21,
		},
		position = {
			0,
			80,
			3,
		},
	},
	preorder_divider_top_effect = {
		horizontal_alignment = "center",
		parent = "preorder_divider_top",
		vertical_alignment = "bottom",
		size = {
			310,
			120,
		},
		position = {
			0,
			-106,
			-1,
		},
	},
	preorder_input = {
		horizontal_alignment = "center",
		parent = "preorder_divider",
		vertical_alignment = "center",
		size = {
			64,
			64,
		},
		position = {
			0,
			-3,
			1,
		},
	},
	preorder_text = {
		horizontal_alignment = "center",
		parent = "preorder_divider",
		vertical_alignment = "center",
		size = {
			220,
			40,
		},
		position = {
			0,
			36,
			10,
		},
	},
	preorder_text_bg = {
		horizontal_alignment = "center",
		parent = "preorder_text",
		vertical_alignment = "center",
		size = {
			600,
			120,
		},
		position = {
			0,
			0,
			-15,
		},
	},
	bot_warning = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "center",
		size = {
			464,
			80,
		},
		position = {
			1375,
			0,
			0,
		},
	},
	bot_information_mask = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "center",
		position = {
			1375,
			0,
			2,
		},
	},
}
local preorder_text_style = {
	dynamic_font_size = false,
	font_size = 42,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local menu_options_font_size = 32
local title_button_definitions = {}

title_button_definitions[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_1", scenegraph_definition.game_option_1.size, "hero_window_equipment", menu_options_font_size, nil, "center")
title_button_definitions[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_2", scenegraph_definition.game_option_2.size, "hero_window_talents", menu_options_font_size, nil, "center")
title_button_definitions[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_3", scenegraph_definition.game_option_3.size, "hero_window_crafting", menu_options_font_size, nil, "center")
title_button_definitions[#title_button_definitions + 1] = UIWidgets.create_console_panel_button("game_option_4", scenegraph_definition.game_option_4.size, "hero_window_cosmetics", menu_options_font_size, nil, "center")

local panel_color = UISettings.console_menu_rect_color
local widgets = {
	system_button = {
		scenegraph_id = "system_button",
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "selected_texture",
					texture_id = "selected_texture",
				},
			},
		},
		content = {
			selected_texture = "console_menu_system_highlight",
			texture_id = "console_menu_system",
			button_hotspot = {},
		},
		style = {
			button_hotspot = {
				size = {
					220,
					90,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					17,
					24,
					0,
				},
			},
			texture_id = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			selected_texture = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					1,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	panel_input_area_1 = UIWidgets.create_simple_texture("xbone_button_icon_lt", "panel_input_area_1"),
	panel_input_area_2 = UIWidgets.create_simple_texture("xbone_button_icon_rt", "panel_input_area_2"),
	panel = UIWidgets.create_simple_texture("menu_panel_bg", "panel", nil, nil, panel_color),
	panel_edge = UIWidgets.create_tiled_texture("panel_edge", "menu_frame_04_divider", {
		1920,
		4,
	}),
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
	preorder_text = UIWidgets.create_simple_text(Localize("preorder_now"), "preorder_text", nil, nil, preorder_text_style),
	preorder_divider = UIWidgets.create_simple_texture("divider_01_top", "preorder_divider"),
	preorder_divider_top = UIWidgets.create_simple_texture("divider_01_bottom", "preorder_divider_top"),
	preorder_divider_effect = UIWidgets.create_simple_texture("play_button_frame_glow", "preorder_divider_effect", nil, nil, Colors.get_color_table_with_alpha("light_sky_blue", 255)),
	preorder_divider_top_effect = UIWidgets.create_simple_uv_texture("play_button_frame_glow", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "preorder_divider_top_effect", nil, nil, Colors.get_color_table_with_alpha("light_sky_blue", 255)),
	preorder_input = UIWidgets.create_simple_texture("xbone_button_icon_show_large", "preorder_input"),
	preorder_text_bg = UIWidgets.create_simple_texture("bg_center_fade", "preorder_text_bg", nil, nil, panel_color),
	back_button = UIWidgets.create_layout_button("back_button", "layout_button_back", "layout_button_back_glow", {
		0,
		0,
		100,
	}),
	close_button = UIWidgets.create_layout_button("close_button", "layout_button_close", "layout_button_close_glow", {
		0,
		0,
		100,
	}),
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
	bot_info_enter = {
		{
			end_progress = 0.3,
			name = "bot_fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.bot_customization_button

				widget.content.progress = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	bot_info_exit = {
		{
			end_progress = 0.3,
			name = "bot_fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.bot_customization_button

				widget.content.progress = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	widgets = widgets,
	create_bot_cusomization_button = UIWidgets.create_bot_cusomization_button,
	title_button_definitions = title_button_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
