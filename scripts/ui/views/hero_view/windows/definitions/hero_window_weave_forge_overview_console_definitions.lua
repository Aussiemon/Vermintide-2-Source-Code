-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_weave_forge_overview_console_definitions.lua

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
local gamepad_offset = 30

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
	viewport_1 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - window_frame_width * 2,
			window_size[2] - window_frame_width * 2,
		},
		position = {
			0,
			window_frame_width,
			3,
		},
	},
	viewport_2 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - window_frame_width * 2,
			window_size[2] - window_frame_width * 2,
		},
		position = {
			0,
			window_frame_width,
			3,
		},
	},
	viewport_3 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - window_frame_width * 2,
			window_size[2] - window_frame_width * 2,
		},
		position = {
			0,
			window_frame_width,
			3,
		},
	},
	viewport_panel_1 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			450,
			100,
		},
		position = {
			-545,
			75,
			3,
		},
	},
	viewport_panel_2 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			450,
			100,
		},
		position = {
			0,
			75,
			3,
		},
	},
	viewport_panel_3 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			450,
			100,
		},
		position = {
			545,
			75,
			3,
		},
	},
	viewport_button_1 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_1",
		vertical_alignment = "bottom",
		size = {
			545,
			540,
		},
		position = {
			0,
			160,
			0,
		},
	},
	viewport_button_2 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_2",
		vertical_alignment = "bottom",
		size = {
			545,
			540,
		},
		position = {
			0,
			160,
			0,
		},
	},
	viewport_button_3 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_3",
		vertical_alignment = "bottom",
		size = {
			545,
			540,
		},
		position = {
			0,
			160,
			0,
		},
	},
	viewport_button_highlight_1 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			545,
			window_size[2] - window_frame_width * 2,
		},
		position = {
			-545,
			window_frame_width,
			1,
		},
	},
	viewport_button_highlight_2 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			545,
			window_size[2] - window_frame_width * 2,
		},
		position = {
			0,
			window_frame_width,
			1,
		},
	},
	viewport_button_highlight_3 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			545,
			window_size[2] - window_frame_width * 2,
		},
		position = {
			545,
			window_frame_width,
			1,
		},
	},
	viewport_panel_divider_1 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_1",
		vertical_alignment = "top",
		size = {
			68,
			19,
		},
		position = {
			0,
			gamepad_offset,
			1,
		},
	},
	viewport_panel_divider_2 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_2",
		vertical_alignment = "top",
		size = {
			68,
			19,
		},
		position = {
			0,
			gamepad_offset,
			1,
		},
	},
	viewport_panel_divider_3 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_3",
		vertical_alignment = "top",
		size = {
			68,
			19,
		},
		position = {
			0,
			gamepad_offset,
			1,
		},
	},
	viewport_panel_divider_left_1 = {
		horizontal_alignment = "left",
		parent = "viewport_panel_divider_1",
		vertical_alignment = "center",
		size = {
			55,
			19,
		},
		position = {
			-166,
			0,
			0,
		},
	},
	viewport_panel_divider_right_1 = {
		horizontal_alignment = "right",
		parent = "viewport_panel_divider_1",
		vertical_alignment = "center",
		size = {
			55,
			19,
		},
		position = {
			166,
			0,
			0,
		},
	},
	viewport_panel_divider_left_2 = {
		horizontal_alignment = "left",
		parent = "viewport_panel_divider_2",
		vertical_alignment = "center",
		size = {
			55,
			19,
		},
		position = {
			-166,
			0,
			0,
		},
	},
	viewport_panel_divider_right_2 = {
		horizontal_alignment = "right",
		parent = "viewport_panel_divider_2",
		vertical_alignment = "center",
		size = {
			55,
			19,
		},
		position = {
			166,
			0,
			0,
		},
	},
	viewport_panel_divider_left_3 = {
		horizontal_alignment = "left",
		parent = "viewport_panel_divider_3",
		vertical_alignment = "center",
		size = {
			55,
			19,
		},
		position = {
			-166,
			0,
			0,
		},
	},
	viewport_panel_divider_right_3 = {
		horizontal_alignment = "right",
		parent = "viewport_panel_divider_3",
		vertical_alignment = "center",
		size = {
			55,
			19,
		},
		position = {
			166,
			0,
			0,
		},
	},
	panel_level_title_1 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_1",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			-90,
			0 + gamepad_offset,
			2,
		},
	},
	panel_level_value_1 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_1",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			-90,
			-30 + gamepad_offset,
			2,
		},
	},
	panel_power_title_1 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_1",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			90,
			0 + gamepad_offset,
			2,
		},
	},
	panel_power_value_1 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_1",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			90,
			-30 + gamepad_offset,
			2,
		},
	},
	panel_level_title_2 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_2",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			-90,
			0 + gamepad_offset,
			2,
		},
	},
	panel_level_value_2 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_2",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			-90,
			-30 + gamepad_offset,
			2,
		},
	},
	panel_power_title_2 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_2",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			90,
			0 + gamepad_offset,
			2,
		},
	},
	panel_power_value_2 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_2",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			90,
			-30 + gamepad_offset,
			2,
		},
	},
	panel_level_title_3 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_3",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			-90,
			0 + gamepad_offset,
			2,
		},
	},
	panel_level_value_3 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_3",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			-90,
			-30 + gamepad_offset,
			2,
		},
	},
	panel_power_title_3 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_3",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			90,
			0 + gamepad_offset,
			2,
		},
	},
	panel_power_value_3 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_3",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			90,
			-30 + gamepad_offset,
			2,
		},
	},
	panel_level_1 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_1",
		vertical_alignment = "top",
		size = {
			120,
			30,
		},
		position = {
			-77,
			-22,
			1,
		},
	},
	panel_level_2 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_2",
		vertical_alignment = "top",
		size = {
			120,
			30,
		},
		position = {
			-77,
			-22,
			1,
		},
	},
	panel_level_3 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_3",
		vertical_alignment = "top",
		size = {
			120,
			30,
		},
		position = {
			-77,
			-22,
			1,
		},
	},
	panel_power_1 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_1",
		vertical_alignment = "top",
		size = {
			120,
			30,
		},
		position = {
			77,
			-22,
			1,
		},
	},
	panel_power_2 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_2",
		vertical_alignment = "top",
		size = {
			120,
			30,
		},
		position = {
			77,
			-22,
			1,
		},
	},
	panel_power_3 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_3",
		vertical_alignment = "top",
		size = {
			120,
			30,
		},
		position = {
			77,
			-22,
			1,
		},
	},
	viewport_title_1 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_1",
		vertical_alignment = "top",
		size = {
			450,
			50,
		},
		position = {
			0,
			70 + gamepad_offset,
			3,
		},
	},
	viewport_title_2 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_2",
		vertical_alignment = "top",
		size = {
			450,
			50,
		},
		position = {
			0,
			70 + gamepad_offset,
			3,
		},
	},
	viewport_title_3 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_3",
		vertical_alignment = "top",
		size = {
			450,
			50,
		},
		position = {
			0,
			70 + gamepad_offset,
			3,
		},
	},
	viewport_sub_title_1 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_1",
		vertical_alignment = "top",
		size = {
			450,
			50,
		},
		position = {
			0,
			40 + gamepad_offset,
			3,
		},
	},
	viewport_sub_title_2 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_2",
		vertical_alignment = "top",
		size = {
			450,
			50,
		},
		position = {
			0,
			40 + gamepad_offset,
			3,
		},
	},
	viewport_sub_title_3 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_3",
		vertical_alignment = "top",
		size = {
			450,
			50,
		},
		position = {
			0,
			40 + gamepad_offset,
			3,
		},
	},
	change_button_1 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_1",
		vertical_alignment = "bottom",
		size = {
			74,
			74,
		},
		position = {
			0,
			0 + gamepad_offset,
			1,
		},
	},
	change_button_2 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_2",
		vertical_alignment = "bottom",
		size = {
			74,
			74,
		},
		position = {
			0,
			0 + gamepad_offset,
			1,
		},
	},
	change_button_3 = {
		horizontal_alignment = "center",
		parent = "viewport_panel_3",
		vertical_alignment = "bottom",
		size = {
			74,
			74,
		},
		position = {
			0,
			0 + gamepad_offset,
			1,
		},
	},
	upgrade_button = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "top",
		size = {
			532,
			126,
		},
		position = {
			-window_frame_width,
			-window_frame_width,
			4,
		},
	},
	forge_level_title = {
		horizontal_alignment = "center",
		parent = "upgrade_button",
		vertical_alignment = "center",
		size = {
			300,
			20,
		},
		position = {
			20,
			35,
			3,
		},
	},
	forge_level_text = {
		horizontal_alignment = "center",
		parent = "forge_level_title",
		vertical_alignment = "center",
		size = {
			150,
			40,
		},
		position = {
			0,
			0,
			0,
		},
	},
	tutorial_text_title = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = {
			350,
			60,
		},
		position = {
			0,
			70,
			2,
		},
	},
	tutorial_text_body = {
		horizontal_alignment = "center",
		parent = "tutorial_text_title",
		vertical_alignment = "top",
		size = {
			350,
			400,
		},
		position = {
			0,
			-60,
			2,
		},
	},
	skull_circle = {
		horizontal_alignment = "center",
		parent = "screen_center",
		vertical_alignment = "center",
		size = {
			675,
			675,
		},
		position = {
			0,
			0,
			10,
		},
	},
	skull_circle_shade = {
		horizontal_alignment = "center",
		parent = "screen_center",
		vertical_alignment = "center",
		size = {
			675,
			675,
		},
		position = {
			0,
			0,
			9,
		},
	},
	upgrade_bg = {
		horizontal_alignment = "center",
		parent = "screen_center",
		vertical_alignment = "center",
		size = {
			900,
			400,
		},
		position = {
			0,
			10,
			11,
		},
	},
	upgrade_text = {
		horizontal_alignment = "center",
		parent = "screen_center",
		vertical_alignment = "center",
		size = {
			600,
			50,
		},
		position = {
			0,
			0,
			12,
		},
	},
}
local upgrade_title_style = {
	dynamic_font_size = true,
	font_size = 52,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = false,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = {
		180,
		0,
		0,
		0,
	},
	offset = {
		0,
		0,
		2,
	},
}
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
local viewport_title_text_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local viewport_sub_title_text_style = {
	dynamic_font_size = true,
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "center",
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
local panel_value_title_style = {
	dynamic_font_size = true,
	font_size = 18,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		120,
		120,
		120,
	},
	offset = {
		0,
		0,
		2,
	},
}
local panel_value_text_style = {
	dynamic_font_size = true,
	font_size = 38,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local forge_level_text_style = {
	font_size = 22,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local forge_value_text_style = {
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local tutorial_title_text_style = {
	dynamic_font_size = true,
	font_size = 44,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local tutorial_body_text_style = {
	dynamic_font_size = false,
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
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

local function create_viewport_highlight(scenegraph_id)
	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					content_id = "top_bg",
					pass_type = "texture_uv",
					style_id = "top_bg",
				},
				{
					content_id = "bottom_bg",
					pass_type = "texture_uv",
					style_id = "bottom_bg",
				},
				{
					content_id = "top_highlight",
					pass_type = "texture_uv",
					style_id = "top_highlight",
				},
				{
					content_id = "bottom_highlight",
					pass_type = "texture_uv",
					style_id = "bottom_highlight",
				},
				{
					pass_type = "texture",
					style_id = "wheel",
					texture_id = "wheel",
				},
			},
		},
		content = {
			wheel = "athanor_temper_bg",
			button_hotspot = {
				allow_multi_hover = true,
			},
			top_bg = {
				texture_id = "play_glow_mask",
				uvs = {
					{
						0,
						1,
					},
					{
						1,
						0,
					},
				},
			},
			bottom_bg = {
				texture_id = "play_glow_mask",
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
			top_highlight = {
				texture_id = "play_glow_mask",
				uvs = {
					{
						0,
						1,
					},
					{
						1,
						0,
					},
				},
			},
			bottom_highlight = {
				texture_id = "play_glow_mask",
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
		},
		style = {
			wheel = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					273,
					273,
				},
				color = {
					255,
					138,
					0,
					187,
				},
				offset = {
					0,
					50,
					2,
				},
			},
			top_bg = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				texture_size = {
					545,
					800,
				},
				color = {
					255,
					138,
					0,
					187,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			bottom_bg = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				texture_size = {
					545,
					800,
				},
				color = {
					255,
					138,
					0,
					187,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			top_highlight = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				texture_size = {
					400,
					500,
				},
				color = {
					200,
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
			bottom_highlight = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				texture_size = {
					400,
					500,
				},
				color = {
					200,
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
		scenegraph_id = scenegraph_id,
	}
end

local function create_viewport_highlight_text(scenegraph_id)
	return {
		element = {
			passes = {
				{
					content_id = "background_top",
					pass_type = "texture_uv",
					style_id = "background_top",
				},
				{
					content_id = "background_top",
					pass_type = "texture_uv",
					style_id = "background_top_light",
				},
				{
					content_id = "background_bottom",
					pass_type = "texture_uv",
					style_id = "background_bottom",
				},
				{
					content_id = "background_bottom",
					pass_type = "texture_uv",
					style_id = "background_bottom_light",
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
			},
		},
		content = {
			title_text = Localize("menu_weave_forge_customize_loadout_button"),
			background_top = {
				texture_id = "wom_text_highlight",
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
			background_bottom = {
				texture_id = "wom_text_highlight",
				uvs = {
					{
						0,
						1,
					},
					{
						1,
						0,
					},
				},
			},
		},
		style = {
			background_top = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					500,
					130,
				},
				color = {
					255,
					138,
					0,
					147,
				},
				offset = {
					0,
					65,
					0,
				},
			},
			background_top_light = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					400,
					90,
				},
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					0,
					45,
					1,
				},
			},
			background_bottom = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					500,
					130,
				},
				color = {
					255,
					138,
					0,
					147,
				},
				offset = {
					0,
					-65,
					0,
				},
			},
			background_bottom_light = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					400,
					90,
				},
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					0,
					-45,
					1,
				},
			},
			title_text = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					3,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					2,
				},
			},
		},
		offset = {
			0,
			50,
			3,
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_upgrade_button(scenegraph_id, size, text, font_size, disable_with_gamepad)
	local icon = "athanor_icon_upgrade"
	local icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon)
	local icon_size = icon_settings.size
	local loading_icon = "athanor_icon_loading"
	local loading_icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(loading_icon)
	local loading_icon_size = loading_icon_settings.size

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					content_id = "tooltip_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					additional_option_id = "tooltip",
					pass_type = "additional_option_tooltip",
					style_id = "tooltip",
					content_passes = {
						"weave_progression_slot_titles",
						"athanor_upgrade_tooltip",
					},
					content_check_function = function (content)
						return content.tooltip and content.tooltip_hotspot.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "price_icon",
					texture_id = "price_icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "price_icon_disabled",
					texture_id = "price_icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "rotated_texture",
					style_id = "loading_icon",
					texture_id = "loading_icon",
					content_check_function = function (content)
						return content.upgrading
					end,
					content_change_function = function (content, style, _, dt)
						local progress = style.progress or 0

						progress = (progress + dt) % 1

						local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * (math.pi * 2)

						style.angle = angle
						style.progress = progress
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.icon and not button_hotspot.disable_button and not content.upgrading
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_disabled",
					texture_id = "icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button and content.icon and not content.upgrading
					end,
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "texture",
					style_id = "texture_highlight",
					texture_id = "texture_highlight",
					content_check_function = function (content)
						return content.highlighted
					end,
				},
				{
					pass_type = "texture",
					style_id = "clicked_rect",
					texture_id = "overlay",
				},
				{
					pass_type = "texture",
					style_id = "disabled_rect",
					texture_id = "overlay",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "texture",
					style_id = "button_icon",
					texture_id = "button_icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "button_icon_glow",
					texture_id = "button_icon_glow",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
			},
		},
		content = {
			background = "athanor_upgrade_bg",
			button_icon = "athanor_upgrade_kettle_inactive",
			button_icon_glow = "athanor_upgrade_kettle_active",
			highlighted = false,
			hover_glow = "athanor_upgrade_bg_highlight",
			overlay = "athanor_upgrade_bg_overlay",
			price_icon = "icon_crafting_essence_small",
			texture_highlight = "tutorial_overlay_round",
			upgrading = false,
			size = size,
			button_hotspot = {
				allow_multi_hover = true,
			},
			tooltip_hotspot = {},
			icon = icon,
			loading_icon = loading_icon,
			title_text = text or "n/a",
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			tooltip = {
				grow_downwards = true,
				horizontal_alignment = "center",
				max_width = 325,
				vertical_alignment = "bottom",
				offset = {
					60,
					10,
					0,
				},
			},
			button_hotspot = {
				size = {
					size[1] - 160,
					size[2] - 30,
				},
				color = {
					100,
					255,
					255,
					255,
				},
				offset = {
					115,
					28,
					0,
				},
			},
			loading_icon = {
				angle = 0,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				pivot = {
					loading_icon_size[1] / 2,
					loading_icon_size[2] / 2,
				},
				texture_size = {
					loading_icon_size[1],
					loading_icon_size[2],
				},
				color = {
					255,
					80,
					80,
					80,
				},
				offset = {
					127,
					-8,
					7,
				},
			},
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					icon_size[1],
					icon_size[2],
				},
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					130,
					-8,
					6,
				},
			},
			icon_disabled = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					icon_size[1],
					icon_size[2],
				},
				color = {
					255,
					80,
					80,
					80,
				},
				offset = {
					130,
					-8,
					6,
				},
			},
			button_icon = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					64,
					80,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-75,
					40,
					9,
				},
			},
			button_icon_glow = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					87,
					97,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-64,
					35,
					10,
				},
			},
			price_icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					32,
					32,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					6,
				},
			},
			price_icon_disabled = {
				horizontal_alignment = "center",
				saturated = true,
				vertical_alignment = "center",
				texture_size = {
					32,
					32,
				},
				color = {
					255,
					120,
					120,
					120,
				},
				offset = {
					0,
					0,
					6,
				},
			},
			background = {
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
			hover_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			texture_highlight = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					96,
					96,
				},
				offset = {
					96,
					-8,
					6,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					7,
				},
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			title_text = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				default_offset = {
					40,
					0,
					6,
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_disabled = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				default_offset = {
					40,
					0,
					6,
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				default_offset = {
					42,
					-2,
					5,
				},
				offset = {
					22,
					-2,
					5,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}
end

local masked = true
local bottom_widgets = {
	viewport_button_highlight_1 = create_viewport_highlight("viewport_button_highlight_1"),
	viewport_button_highlight_2 = create_viewport_highlight("viewport_button_highlight_2"),
	viewport_button_highlight_3 = create_viewport_highlight("viewport_button_highlight_3"),
}
local top_hdr_widgets = {
	top_hdr_background_write_mask = UIWidgets.create_simple_texture("ui_write_mask", "window"),
	upgrade_bg = UIWidgets.create_simple_texture("weave_menu_athanor_upgrade_bg", "upgrade_bg"),
}
local bottom_hdr_widgets = {
	skull_circle = UIWidgets.create_simple_texture("weave_menu_upgrade_skull_circle", "skull_circle"),
	skull_circle_shade = UIWidgets.create_simple_texture("weave_menu_upgrade_skull_circle_shade", "skull_circle_shade"),
}
local top_widgets = {
	upgrade_text = UIWidgets.create_simple_text(Localize("menu_weave_forge_upgraded_effect_title"), "upgrade_text", nil, nil, upgrade_title_style),
	viewport_button_text_highlight_1 = create_viewport_highlight_text("viewport_button_highlight_1"),
	viewport_button_text_highlight_2 = create_viewport_highlight_text("viewport_button_highlight_2"),
	viewport_button_text_highlight_3 = create_viewport_highlight_text("viewport_button_highlight_3"),
	viewport_button_1 = UIWidgets.create_simple_hotspot("viewport_button_1"),
	viewport_button_2 = UIWidgets.create_simple_hotspot("viewport_button_2"),
	viewport_button_3 = UIWidgets.create_simple_hotspot("viewport_button_3"),
	viewport_panel_divider_1 = UIWidgets.create_simple_texture("athanor_item_divider_middle", "viewport_panel_divider_1"),
	viewport_panel_divider_2 = UIWidgets.create_simple_texture("athanor_item_divider_middle", "viewport_panel_divider_2"),
	viewport_panel_divider_3 = UIWidgets.create_simple_texture("athanor_item_divider_middle", "viewport_panel_divider_3"),
	viewport_panel_divider_left_1 = UIWidgets.create_simple_uv_texture("athanor_item_divider_edge", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "viewport_panel_divider_left_1"),
	viewport_panel_divider_right_1 = UIWidgets.create_simple_texture("athanor_item_divider_edge", "viewport_panel_divider_right_1"),
	viewport_panel_divider_left_2 = UIWidgets.create_simple_uv_texture("athanor_item_divider_edge", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "viewport_panel_divider_left_2"),
	viewport_panel_divider_right_2 = UIWidgets.create_simple_texture("athanor_item_divider_edge", "viewport_panel_divider_right_2"),
	viewport_panel_divider_left_3 = UIWidgets.create_simple_uv_texture("athanor_item_divider_edge", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "viewport_panel_divider_left_3"),
	viewport_panel_divider_right_3 = UIWidgets.create_simple_texture("athanor_item_divider_edge", "viewport_panel_divider_right_3"),
	viewport_level_title_1 = UIWidgets.create_simple_text(Localize("menu_weave_forge_magic_level_title"), "panel_level_title_1", nil, nil, panel_value_title_style),
	viewport_level_value_1 = UIWidgets.create_simple_text("0", "panel_level_value_1", nil, nil, panel_value_text_style),
	viewport_power_title_1 = UIWidgets.create_simple_text(Localize("menu_weave_forge_loadout_power_title"), "panel_power_title_1", nil, nil, panel_value_title_style),
	viewport_power_value_1 = UIWidgets.create_simple_text("0", "panel_power_value_1", nil, nil, panel_value_text_style),
	viewport_level_title_2 = UIWidgets.create_simple_text(Localize("menu_weave_forge_magic_level_title"), "panel_level_title_2", nil, nil, panel_value_title_style),
	viewport_level_value_2 = UIWidgets.create_simple_text("0", "panel_level_value_2", nil, nil, panel_value_text_style),
	viewport_power_title_2 = UIWidgets.create_simple_text(Localize("menu_weave_forge_loadout_power_title"), "panel_power_title_2", nil, nil, panel_value_title_style),
	viewport_power_value_2 = UIWidgets.create_simple_text("0", "panel_power_value_2", nil, nil, panel_value_text_style),
	viewport_level_title_3 = UIWidgets.create_simple_text(Localize("menu_weave_forge_magic_level_title"), "panel_level_title_3", nil, nil, panel_value_title_style),
	viewport_level_value_3 = UIWidgets.create_simple_text("0", "panel_level_value_3", nil, nil, panel_value_text_style),
	viewport_power_title_3 = UIWidgets.create_simple_text(Localize("menu_weave_forge_loadout_power_title"), "panel_power_title_3", nil, nil, panel_value_title_style),
	viewport_power_value_3 = UIWidgets.create_simple_text("0", "panel_power_value_3", nil, nil, panel_value_text_style),
	viewport_title_1 = UIWidgets.create_simple_text("", "viewport_title_1", nil, nil, viewport_title_text_style),
	viewport_title_2 = UIWidgets.create_simple_text("", "viewport_title_2", nil, nil, viewport_title_text_style),
	viewport_title_3 = UIWidgets.create_simple_text("", "viewport_title_3", nil, nil, viewport_title_text_style),
	viewport_sub_title_1 = UIWidgets.create_simple_text("", "viewport_sub_title_1", nil, nil, viewport_sub_title_text_style),
	viewport_sub_title_2 = UIWidgets.create_simple_text("", "viewport_sub_title_2", nil, nil, viewport_sub_title_text_style),
	viewport_sub_title_3 = UIWidgets.create_simple_text("", "viewport_sub_title_3", nil, nil, viewport_sub_title_text_style),
	change_button_1 = UIWidgets.create_weave_equipment_button("change_button_1"),
	change_button_3 = UIWidgets.create_weave_equipment_button("change_button_3"),
	change_button_1_tooltip = UIWidgets.create_additional_option_tooltip("change_button_1", scenegraph_definition.change_button_1.size, nil, {
		title = Localize("menu_weave_forge_tooltip_choose_weapon_title"),
		description = Localize("menu_weave_forge_tooltip_choose_weapon_description"),
	}, nil, nil, "top", nil, {
		0,
		7,
		0,
	}),
	change_button_3_tooltip = UIWidgets.create_additional_option_tooltip("change_button_3", scenegraph_definition.change_button_3.size, nil, {
		title = Localize("menu_weave_forge_tooltip_choose_weapon_title"),
		description = Localize("menu_weave_forge_tooltip_choose_weapon_description"),
	}, nil, nil, "top", nil, {
		0,
		7,
		0,
	}),
	upgrade_button = create_upgrade_button("upgrade_button", scenegraph_definition.upgrade_button.size, Localize("menu_weave_forge_upgrade_button"), 20),
	forge_level_title = UIWidgets.create_simple_text(Localize("menu_weave_forge_level_title"), "forge_level_title", nil, nil, forge_level_text_style),
	forge_level_text = UIWidgets.create_simple_text("0", "forge_level_text", nil, nil, forge_value_text_style),
}
local weapon_crafting_tutorial_definitions = {
	tutorial_title = UIWidgets.create_simple_text("menu_weave_tutorial_athanor_01_empty_state_info_title", "tutorial_text_title", nil, nil, tutorial_title_text_style),
	tutorial_body = UIWidgets.create_simple_text("menu_weave_tutorial_athanor_01_empty_state_info_body", "tutorial_text_body", nil, nil, tutorial_body_text_style),
}
local animation_definitions = {
	upgrade = {
		{
			end_progress = 1,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local upgrade_bg = widgets.upgrade_bg
				local skull_circle = widgets.skull_circle
				local upgrade_text = widgets.upgrade_text
				local skull_circle_shade = widgets.skull_circle_shade

				upgrade_bg.alpha_multiplier = 0
				skull_circle.alpha_multiplier = 0
				upgrade_text.alpha_multiplier = 0
				skull_circle_shade.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local upgrade_bg = widgets.upgrade_bg
				local skull_circle = widgets.skull_circle
				local skull_circle_shade = widgets.skull_circle_shade
				local upgrade_text = widgets.upgrade_text

				upgrade_bg.alpha_multiplier = anim_progress
				skull_circle.alpha_multiplier = anim_progress
				upgrade_text.alpha_multiplier = anim_progress
				skull_circle_shade.alpha_multiplier = 0.02 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2,
			name = "fade_out",
			start_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(1 - progress)
				local upgrade_bg = widgets.upgrade_bg
				local skull_circle = widgets.skull_circle
				local upgrade_text = widgets.upgrade_text

				upgrade_bg.alpha_multiplier = anim_progress
				upgrade_text.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2,
			name = "font_size_increase",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local upgrade_text = widgets.upgrade_text

				upgrade_text.offset[2] = -40 + 50 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "dissolve_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local parent = params.parent
				local hdr_renderer = parent:hdr_renderer()
				local gui = hdr_renderer.gui
				local skull_circle_shade = widgets.skull_circle_shade
				local skull_circle = widgets.skull_circle
				local texture_skull_circle_shade = skull_circle_shade.content.texture_id
				local texture_skull_circle = skull_circle.content.texture_id
				local gui_material_skull_circle_shade = Gui.material(gui, texture_skull_circle_shade)
				local gui_material_skull_circle = Gui.material(gui, texture_skull_circle)
				local start_value = 0

				Material.set_scalar(gui_material_skull_circle_shade, "progress", start_value)
				Material.set_scalar(gui_material_skull_circle, "progress", start_value)
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local parent = params.parent
				local hdr_renderer = parent:hdr_renderer()
				local gui = hdr_renderer.gui
				local upgrade_bg = widgets.upgrade_bg
				local skull_circle = widgets.skull_circle
				local skull_circle_shade = widgets.skull_circle_shade
				local texture_upgrade_bg = upgrade_bg.content.texture_id
				local texture_skull_circle = skull_circle.content.texture_id
				local texture_skull_circle_shade = skull_circle_shade.content.texture_id
				local gui_material_upgrade_bg = Gui.material(gui, texture_upgrade_bg)
				local gui_material_skull_circle = Gui.material(gui, texture_skull_circle)
				local gui_material_skull_circle_shade = Gui.material(gui, texture_skull_circle_shade)

				Material.set_scalar(gui_material_skull_circle, "progress", progress)
				Material.set_scalar(gui_material_skull_circle_shade, "progress", progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2,
			name = "intensity",
			start_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local parent = params.parent
				local hdr_renderer = parent:hdr_renderer()
				local gui = hdr_renderer.gui
				local skull_circle = widgets.skull_circle
				local texture_skull_circle = skull_circle.content.texture_id
				local gui_material_skull_circle = Gui.material(gui, texture_skull_circle)
				local start_value = 2

				Material.set_scalar(gui_material_skull_circle, "intensity", start_value)
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local parent = params.parent
				local hdr_renderer = parent:hdr_renderer()
				local gui = hdr_renderer.gui
				local skull_circle = widgets.skull_circle
				local texture_skull_circle = skull_circle.content.texture_id
				local gui_material_skull_circle = Gui.material(gui, texture_skull_circle)
				local min = 2
				local max = 10
				local value = min + math.clamp(progress, 0, 1) * max

				Material.set_scalar(gui_material_skull_circle, "intensity", value)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2.5,
			name = "dissolve_out",
			start_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(1 - progress)
				local parent = params.parent
				local hdr_renderer = parent:hdr_renderer()
				local gui = hdr_renderer.gui
				local skull_circle_shade = widgets.skull_circle_shade
				local skull_circle = widgets.skull_circle
				local texture_skull_circle_shade = skull_circle_shade.content.texture_id
				local texture_skull_circle = skull_circle.content.texture_id
				local gui_material_skull_circle_shade = Gui.material(gui, texture_skull_circle_shade)
				local gui_material_skull_circle = Gui.material(gui, texture_skull_circle)

				Material.set_scalar(gui_material_skull_circle, "progress", anim_progress)
				Material.set_scalar(gui_material_skull_circle_shade, "progress", anim_progress)

				skull_circle_shade.alpha_multiplier = 0.02 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 4,
			name = "size_increase",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local upgrade_bg = widgets.upgrade_bg
				local skull_circle = widgets.skull_circle
				local skull_circle_shade = widgets.skull_circle_shade
				local upgrade_bg_scenegraph_id = upgrade_bg.scenegraph_id
				local skull_circle_scenegraph_id = skull_circle.scenegraph_id
				local skull_circle_shade_scenegraph_id = skull_circle_shade.scenegraph_id
				local upgrade_bg_definition = scenegraph_definition[upgrade_bg_scenegraph_id]
				local skull_circle_definition = scenegraph_definition[skull_circle_scenegraph_id]
				local skull_circle_shade_definition = scenegraph_definition[skull_circle_shade_scenegraph_id]
				local upgrade_bg_default_size = upgrade_bg_definition.size
				local skull_circle_default_size = skull_circle_definition.size
				local skull_circle_shade_default_size = skull_circle_shade_definition.size
				local upgrade_bg_scenegraph = ui_scenegraph[upgrade_bg_scenegraph_id]
				local skull_circle_scenegraph = ui_scenegraph[skull_circle_scenegraph_id]
				local skull_circle_shade_scenegraph = ui_scenegraph[skull_circle_shade_scenegraph_id]
				local upgrade_bg_size = upgrade_bg_scenegraph.size
				local skull_circle_size = skull_circle_scenegraph.size
				local skull_circle_shade_size = skull_circle_shade_scenegraph.size

				skull_circle_size[1] = skull_circle_default_size[1]
				skull_circle_size[2] = skull_circle_default_size[2]
				skull_circle_shade_size[1] = skull_circle_shade_default_size[1]
				skull_circle_shade_size[2] = skull_circle_shade_default_size[2]
				upgrade_bg_size[1] = upgrade_bg_default_size[1]
				upgrade_bg_size[2] = upgrade_bg_default_size[2]
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local upgrade_bg = widgets.upgrade_bg
				local skull_circle = widgets.skull_circle
				local skull_circle_shade = widgets.skull_circle_shade
				local upgrade_bg_scenegraph_id = upgrade_bg.scenegraph_id
				local skull_circle_scenegraph_id = skull_circle.scenegraph_id
				local skull_circle_shade_scenegraph_id = skull_circle_shade.scenegraph_id
				local upgrade_bg_definition = scenegraph_definition[upgrade_bg_scenegraph_id]
				local skull_circle_definition = scenegraph_definition[skull_circle_scenegraph_id]
				local skull_circle_shade_definition = scenegraph_definition[skull_circle_shade_scenegraph_id]
				local upgrade_bg_default_size = upgrade_bg_definition.size
				local skull_circle_default_size = skull_circle_definition.size
				local skull_circle_shade_default_size = skull_circle_shade_definition.size
				local upgrade_bg_scenegraph = ui_scenegraph[upgrade_bg_scenegraph_id]
				local skull_circle_scenegraph = ui_scenegraph[skull_circle_scenegraph_id]
				local skull_circle_shade_scenegraph = ui_scenegraph[skull_circle_shade_scenegraph_id]
				local upgrade_bg_size = upgrade_bg_scenegraph.size
				local skull_circle_size = skull_circle_scenegraph.size
				local skull_circle_shade_size = skull_circle_shade_scenegraph.size
				local size_increase = 600
				local shade_size_increase = 2200

				skull_circle_size[1] = skull_circle_default_size[1] + size_increase * anim_progress
				skull_circle_size[2] = skull_circle_default_size[2] + size_increase * anim_progress
				skull_circle_shade_size[1] = skull_circle_shade_default_size[1] + shade_size_increase * anim_progress
				skull_circle_shade_size[2] = skull_circle_shade_default_size[2] + shade_size_increase * anim_progress
				upgrade_bg_size[1] = upgrade_bg_default_size[1] + 200 * (1 - anim_progress)
				upgrade_bg_size[2] = upgrade_bg_default_size[2] + 200 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
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
	top_widgets = top_widgets,
	bottom_widgets = bottom_widgets,
	top_hdr_widgets = top_hdr_widgets,
	bottom_hdr_widgets = bottom_hdr_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	weapon_crafting_tutorial_definitions = weapon_crafting_tutorial_definitions,
}
