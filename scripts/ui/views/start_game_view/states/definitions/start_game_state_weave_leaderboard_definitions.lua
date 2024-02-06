-- chunkname: @scripts/ui/views/start_game_view/states/definitions/start_game_state_weave_leaderboard_definitions.lua

local window_default_settings = UISettings.game_start_windows
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local window_frame_name = "menu_frame_11"
local window_frame = UIFrameSettings[window_frame_name]
local window_frame_width = window_frame.texture_sizes.vertical[1]
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
local option_tabs_height = 40
local list_fade_height = 10
local list_window_size = {
	window_size[1] - window_frame_width * 2,
	window_size[2] - window_frame_width * 2,
}
local list_mask_size = {
	list_window_size[1] - 100,
	list_window_size[2] - 280,
}
local list_scrollbar_size = {
	16,
	list_mask_size[2],
}
local list_entry_size = {
	list_mask_size[1] - 80,
	48,
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
	console_cursor = {
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
	list_window = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = list_window_size,
		position = {
			window_frame_width,
			0,
			1,
		},
	},
	list_mask = {
		horizontal_alignment = "center",
		parent = "list_window",
		vertical_alignment = "bottom",
		size = list_mask_size,
		position = {
			0,
			80,
			3,
		},
	},
	list_scrollbar = {
		horizontal_alignment = "right",
		parent = "list_mask",
		vertical_alignment = "bottom",
		size = list_scrollbar_size,
		position = {
			-16,
			0,
			10,
		},
	},
	list_scroll_root = {
		horizontal_alignment = "left",
		parent = "list_mask",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			0,
		},
	},
	list_entry = {
		horizontal_alignment = "left",
		parent = "list_scroll_root",
		vertical_alignment = "top",
		size = list_entry_size,
		position = {
			25,
			0,
			0,
		},
	},
	setting_stepper_1 = {
		horizontal_alignment = "center",
		parent = "list_window",
		vertical_alignment = "top",
		size = {
			list_window_size[1] / 3,
			85,
		},
		position = {
			list_window_size[1] / 5,
			-(option_tabs_height + 13),
			4,
		},
	},
	setting_stepper_2 = {
		horizontal_alignment = "center",
		parent = "list_window",
		vertical_alignment = "top",
		size = {
			list_window_size[1] / 3,
			85,
		},
		position = {
			-list_window_size[1] / 5,
			-(option_tabs_height + 13),
			4,
		},
	},
	loading_icon = {
		horizontal_alignment = "center",
		parent = "list_mask",
		vertical_alignment = "center",
		size = {
			150,
			150,
		},
		position = {
			0,
			0,
			19,
		},
	},
	list_title_rank = {
		horizontal_alignment = "left",
		parent = "list_mask",
		vertical_alignment = "top",
		size = {
			90,
			40,
		},
		position = {
			112,
			45,
			1,
		},
	},
	list_title_name = {
		horizontal_alignment = "right",
		parent = "list_title_rank",
		vertical_alignment = "center",
		size = {
			430,
			40,
		},
		position = {
			748,
			0,
			0,
		},
	},
	list_title_weave = {
		horizontal_alignment = "right",
		parent = "list_title_name",
		vertical_alignment = "center",
		size = {
			144,
			40,
		},
		position = {
			306,
			0,
			0,
		},
	},
	list_title_score = {
		horizontal_alignment = "right",
		parent = "list_title_weave",
		vertical_alignment = "center",
		size = {
			290,
			40,
		},
		position = {
			261,
			0,
			0,
		},
	},
	option_tabs = {
		horizontal_alignment = "center",
		parent = "list_window",
		vertical_alignment = "top",
		size = {
			list_window_size[1],
			option_tabs_height,
		},
		position = {
			0,
			0,
			1,
		},
	},
	option_tabs_segments = {
		horizontal_alignment = "center",
		parent = "option_tabs",
		vertical_alignment = "bottom",
		size = {
			list_window_size[1],
			0,
		},
		position = {
			0,
			5,
			1,
		},
	},
	option_tabs_segments_top = {
		horizontal_alignment = "center",
		parent = "option_tabs",
		vertical_alignment = "top",
		size = {
			list_window_size[1],
			0,
		},
		position = {
			0,
			-7,
			10,
		},
	},
	option_tabs_segments_bottom = {
		horizontal_alignment = "center",
		parent = "option_tabs",
		vertical_alignment = "bottom",
		size = {
			list_window_size[1],
			0,
		},
		position = {
			0,
			3,
			10,
		},
	},
	option_tabs_divider = {
		horizontal_alignment = "center",
		parent = "option_tabs",
		vertical_alignment = "bottom",
		size = {
			list_window_size[1] + 6,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	},
	refresh_button = {
		horizontal_alignment = "left",
		parent = "list_mask",
		vertical_alignment = "bottom",
		size = {
			30,
			30,
		},
		position = {
			0,
			-50,
			3,
		},
	},
	refresh_text = {
		horizontal_alignment = "left",
		parent = "refresh_button",
		vertical_alignment = "center",
		size = {
			list_window_size[1] - 40,
			30,
		},
		position = {
			40,
			0,
			1,
		},
	},
	no_placement_text = {
		horizontal_alignment = "center",
		parent = "inner_window",
		vertical_alignment = "center",
		size = {
			1280,
			100,
		},
		position = {
			8,
			0,
			10,
		},
	},
}

if not IS_WINDOWS then
	scenegraph_definition.setting_stepper_1 = {
		horizontal_alignment = "center",
		parent = "list_window",
		vertical_alignment = "top",
		size = {
			list_window_size[1] / 3.5,
			85,
		},
		position = {
			list_window_size[1] / 3,
			-(option_tabs_height + 13),
			4,
		},
	}
	scenegraph_definition.setting_stepper_2 = {
		horizontal_alignment = "center",
		parent = "list_window",
		vertical_alignment = "top",
		size = {
			list_window_size[1] / 3.5,
			85,
		},
		position = {
			0,
			-(option_tabs_height + 13),
			4,
		},
	}
	scenegraph_definition.setting_stepper_3 = {
		horizontal_alignment = "center",
		parent = "list_window",
		vertical_alignment = "top",
		size = {
			list_window_size[1] / 3.5,
			85,
		},
		position = {
			-list_window_size[1] / 3,
			-(option_tabs_height + 13),
			4,
		},
	}
end

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
local list_title_text_style = {
	dynamic_font_size = true,
	font_size = 20,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
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
local refresh_text_style = {
	dynamic_font_size = true,
	font_size = 18,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "bottom",
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
local no_placement_text_style = {
	dynamic_font_size = true,
	font_size = 52,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
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

local function create_list_mask(scenegraph_id, size, fade_height)
	fade_height = fade_height or 20

	local element = {
		passes = {
			{
				content_id = "hotspot",
				pass_type = "hotspot",
			},
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture",
			},
			{
				pass_type = "texture",
				style_id = "mask_top",
				texture_id = "mask_edge",
			},
			{
				pass_type = "rotated_texture",
				style_id = "mask_bottom",
				texture_id = "mask_edge",
			},
		},
	}
	local content = {
		mask_edge = "mask_rect_edge_fade",
		mask_texture = "mask_rect",
		hotspot = {
			allow_multi_hover = true,
		},
	}
	local style = {
		mask = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				size[1],
				size[2] - fade_height * 2,
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
				0,
			},
		},
		mask_top = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				size[1],
				fade_height,
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
				0,
			},
		},
		mask_bottom = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				size[1],
				fade_height,
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
				0,
			},
			angle = math.pi,
			pivot = {
				size[1] / 2,
				fade_height / 2,
			},
		},
	}
	local widget = {}

	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_stepper(scenegraph_id, size)
	local arrow_icon_size = {
		17,
		27,
	}
	local button_hotspot_size = {
		30,
		40,
	}
	local left_button_offset = {
		0,
		0,
		0,
	}
	local right_button_offset = {
		size[1] - button_hotspot_size[1],
		0,
		0,
	}

	return {
		element = {
			passes = {
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
				{
					pass_type = "texture",
					style_id = "setting_background",
					texture_id = "setting_background",
				},
				{
					pass_type = "text",
					style_id = "setting_text",
					text_id = "setting_text",
				},
				{
					pass_type = "text",
					style_id = "setting_text_shadow",
					text_id = "setting_text",
				},
				{
					content_id = "button_hotspot_left",
					pass_type = "hotspot",
					style_id = "button_hotspot_left",
				},
				{
					content_id = "arrow_icon",
					pass_type = "texture",
					style_id = "left_arrow_icon",
					texture_id = "texture_id",
				},
				{
					content_id = "button_hotspot_right",
					pass_type = "hotspot",
					style_id = "button_hotspot_right",
				},
				{
					content_id = "arrow_icon",
					pass_type = "texture_uv",
					style_id = "right_arrow_icon",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			setting_background = "menu_subheader_bg",
			setting_text = "setting_text",
			title_text = "title_text",
			arrow_icon = {
				texture_id = "settings_arrow_normal",
				uvs = {
					{
						1,
						0,
					},
					{
						0,
						1,
					},
				},
			},
			button_hotspot_left = {},
			button_hotspot_right = {},
		},
		style = {
			setting_background = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				texture_size = {
					400,
					59,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					-10,
					0,
				},
			},
			title_text = {
				dynamic_font = true,
				font_size = 20,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				pixel_perfect = true,
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					size[2] - 50,
					4,
				},
				size = {
					size[1],
					59,
				},
			},
			title_text_shadow = {
				dynamic_font = true,
				font_size = 20,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				pixel_perfect = true,
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					size[2] - 50 - 2,
					3,
				},
				size = {
					size[1],
					59,
				},
			},
			setting_text = {
				dynamic_font = true,
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				pixel_perfect = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					button_hotspot_size[1] + 10,
					0,
					4,
				},
				size = {
					size[1] - (button_hotspot_size[1] * 2 + 20),
					button_hotspot_size[2],
				},
			},
			setting_text_shadow = {
				dynamic_font = true,
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				pixel_perfect = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					button_hotspot_size[1] + 10 + 2,
					-2,
					3,
				},
				size = {
					size[1] - (button_hotspot_size[1] * 2 + 20),
					button_hotspot_size[2],
				},
			},
			button_hotspot_left = {
				color = {
					150,
					30,
					30,
					30,
				},
				size = button_hotspot_size,
				offset = left_button_offset,
			},
			left_arrow_icon = {
				size = arrow_icon_size,
				offset = {
					left_button_offset[1] + (button_hotspot_size[1] / 2 - arrow_icon_size[1] / 2),
					left_button_offset[2] + (button_hotspot_size[2] / 2 - arrow_icon_size[2] / 2),
					2,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			button_hotspot_right = {
				size = button_hotspot_size,
				offset = right_button_offset,
			},
			right_arrow_icon = {
				angle = math.degrees_to_radians(180),
				pivot = {
					14,
					17,
				},
				size = arrow_icon_size,
				offset = {
					right_button_offset[1] + (button_hotspot_size[1] / 2 - arrow_icon_size[1] / 2),
					right_button_offset[2] + (button_hotspot_size[2] / 2 - arrow_icon_size[2] / 2),
					2,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "bottom_edge",
					texture_id = "bottom_edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_left",
					texture_id = "edge_holder_left",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_right",
					texture_id = "edge_holder_right",
				},
			},
		},
		content = {
			bottom_edge = "menu_frame_09_divider",
			edge_holder_left = "menu_frame_09_divider_left",
			edge_holder_right = "menu_frame_09_divider_right",
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					5,
					0,
					6,
				},
				size = {
					size[1] - 10,
					5,
				},
				texture_tiling_size = {
					size[1] - 10,
					5,
				},
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					3,
					-6,
					10,
				},
				size = {
					9,
					17,
				},
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 12,
					-6,
					10,
				},
				size = {
					9,
					17,
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

	return widget
end

local function create_refresh_button(scenegraph_id, size)
	local frame_settings = UIFrameSettings.menu_frame_09
	local element = {
		passes = {
			{
				content_id = "button_hotspot",
				pass_type = "hotspot",
				style_id = "button",
			},
			{
				pass_type = "rect",
				style_id = "button",
			},
			{
				pass_type = "texture_frame",
				style_id = "frame",
				texture_id = "frame",
			},
			{
				pass_type = "texture",
				style_id = "icon",
				texture_id = "icon",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover
				end,
			},
			{
				pass_type = "texture",
				style_id = "icon_hover",
				texture_id = "icon",
				content_check_function = function (content)
					return content.button_hotspot.is_hover
				end,
			},
			{
				pass_type = "texture",
				style_id = "hover",
				texture_id = "hover",
				content_check_function = function (content)
					return content.button_hotspot.is_hover
				end,
			},
		},
	}
	local content = {
		hover = "button_state_default_2",
		icon = "leaderboard_icon_refresh",
		button_hotspot = {},
		frame = frame_settings.texture,
	}
	local style = {
		button = {
			color = Colors.get_color_table_with_alpha("black", 200),
			offset = {
				0,
				0,
				0,
			},
		},
		icon = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				15,
				13,
			},
			color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				0,
				0,
				3,
			},
		},
		icon_hover = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				15,
				13,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				3,
			},
		},
		frame = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		hover = {
			color = {
				255,
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
	}
	local widget = {}

	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local disable_with_gamepad = true
local widgets = {
	window = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_11"),
	window_background = UIWidgets.create_tiled_texture("window_background", "quests_background", {
		50,
		156,
	}, {
		0,
		0,
		-1,
	}, nil, {
		255,
		200,
		200,
		200,
	}),
	exit_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_close"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title"), "title_text", nil, nil, title_text_style),
	option_tabs_divider = create_window_divider("option_tabs_divider", scenegraph_definition.option_tabs_divider.size),
	list_title_rank = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title_rank"), "list_title_rank", nil, nil, list_title_text_style),
	list_title_name = UIWidgets.create_simple_text(not IS_XB1 and Localize("menu_weave_leaderboard_title_player_name") or Localize("menu_weave_leaderboard_title_gamertag"), "list_title_name", nil, nil, list_title_text_style),
	list_title_weave = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title_weave_number"), "list_title_weave", nil, nil, list_title_text_style),
	list_title_score = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title_weave_score"), "list_title_score", nil, nil, list_title_text_style),
	no_placement_text = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_no_placement_text"), "no_placement_text", nil, nil, no_placement_text_style),
	refresh_button = create_refresh_button("refresh_button", scenegraph_definition.refresh_button.size),
	refresh_text = UIWidgets.create_simple_text(Localize("menu_description_refresh"), "refresh_text", nil, nil, refresh_text_style),
	list_window_fade = UIWidgets.create_simple_texture("options_window_fade_01", "list_window", nil, nil, nil, -1),
	list_scrollbar = UIWidgets.create_chain_scrollbar("list_scrollbar", "list_mask", scenegraph_definition.list_scrollbar.size),
	list_mask = create_list_mask("list_mask", scenegraph_definition.list_mask.size, list_fade_height),
	list_mask_window = UIWidgets.create_rect_with_outer_frame("list_mask", scenegraph_definition.list_mask.size, "shadow_frame_02", nil, {
		100,
		0,
		0,
		0,
	}, {
		255,
		0,
		0,
		0,
	}),
	setting_stepper_1 = create_stepper("setting_stepper_1", scenegraph_definition.setting_stepper_1.size),
	setting_stepper_2 = create_stepper("setting_stepper_2", scenegraph_definition.setting_stepper_2.size),
	loading_icon = UIWidgets.create_leaderboard_loading_icon("loading_icon", {
		"list_mask",
	}),
}

if not IS_WINDOWS then
	widgets.setting_stepper_3 = create_stepper("setting_stepper_3", scenegraph_definition.setting_stepper_3.size)
end

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
local generic_input_actions = {
	default = {
		{
			description_text = "menu_description_refresh",
			input_action = "special_1",
			priority = 3,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 4,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 5,
		},
	},
	open_profile = {
		actions = {
			{
				description_text = "input_description_show_profile",
				input_action = "refresh",
				priority = 1,
			},
		},
	},
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
	generic_input_actions = generic_input_actions,
}
