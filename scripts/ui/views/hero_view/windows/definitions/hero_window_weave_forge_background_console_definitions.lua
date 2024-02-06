-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_weave_forge_background_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
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
local window_frame_name = "menu_frame_11"
local window_frame = UIFrameSettings[window_frame_name]
local window_frame_width = window_frame.texture_sizes.vertical[1]
local window_default_settings = UISettings.game_start_windows

window_frame_width = 0
window_size = {
	1920,
	1080,
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
	screen_center = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "screen_center",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1,
		},
	},
	bottom_glow = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - window_frame_width * 2,
			1000,
		},
		position = {
			0,
			window_frame_width,
			3,
		},
	},
	bottom_glow_short = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - window_frame_width * 2,
			500,
		},
		position = {
			0,
			window_frame_width,
			4,
		},
	},
	bottom_glow_shortest = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - window_frame_width * 2,
			200,
		},
		position = {
			0,
			window_frame_width,
			5,
		},
	},
}

scenegraph_definition.window.scale = "fit"

local title_text_style = {
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local essence_text_style = {
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("corn_flower_blue", 255),
	offset = {
		0,
		0,
		2,
	},
}
local loadout_title_text_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local forge_level_text_style = {
	font_size = 62,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local mastery_text_style = {
	font_size = 62,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("corn_flower_blue", 255),
	offset = {
		0,
		0,
		2,
	},
}
local level_text_style = {
	font_size = 20,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local power_text_style = {
	font_size = 20,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local background_color = {
	255,
	0,
	0,
	0,
}
local bottom_glow_back_smoke_color = {
	200,
	138,
	0,
	147,
}
local bottom_glow_front_smoke_color = {
	255,
	138,
	0,
	187,
}
local bottom_glow_front_2_smoke_color = {
	200,
	128,
	0,
	217,
}
local bottom_glow_back_ember_color = {
	130,
	255,
	255,
	255,
}
local widgets = {
	bottom_glow_smoke_1 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_smoke_1", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_glow", nil, nil, bottom_glow_back_smoke_color),
	bottom_glow_smoke_2 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_smoke_2", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_glow_short", nil, nil, bottom_glow_front_smoke_color),
	bottom_glow_smoke_3 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_2", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_glow_shortest", nil, nil, bottom_glow_front_2_smoke_color),
	bottom_glow_embers_1 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_1", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_glow", nil, nil, bottom_glow_back_ember_color, 1),
	bottom_glow_embers_3 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_3", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_glow_short", nil, nil, bottom_glow_back_ember_color, 1),
	window_background = UIWidgets.create_simple_rect("window", background_color),
	screen_background = UIWidgets.create_simple_rect("screen", background_color),
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

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
