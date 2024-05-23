-- chunkname: @scripts/ui/mission_vote_ui/mission_voting_ui_definitions.lua

local window_default_settings = not IS_PS4 and UISettings.game_start_windows or UISettings.game_start_windows_console
local window_frame = window_default_settings.frame
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local window_size = {
	small_window_size[1] + small_window_spacing * 2,
	small_window_size[2] + 60,
}
local game_option_size = {
	small_window_size[1] - 20,
	233,
}
local deed_frame_name = "menu_frame_08"
local deed_frame_settings = UIFrameSettings[deed_frame_name]
local deed_frame_width = deed_frame_settings.texture_sizes.corner[1]
local event_summary_frame_size = {
	game_option_size[1],
	449,
}
local event_summary_size = {
	event_summary_frame_size[1] - 10,
	0,
}
local large_window_frame = window_default_settings.large_window_frame
local large_window_frame_width = UIFrameSettings[large_window_frame].texture_sizes.vertical[1]
local inner_window_size = {
	window_size[1] * 3 + small_window_spacing * 2 + large_window_frame_width * 2,
	window_size[2] + large_window_frame_width * 2,
}
local info_frame_size = {
	400,
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
	console_cursor = {
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
			-10,
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
	window = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1,
		},
	},
	deus_window = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			window_size[1] + 30,
			window_size[2] + 30,
		},
		position = {
			0,
			0,
			1,
		},
	},
	twitch_mode_info = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			400,
			200,
		},
		position = {
			0,
			-215,
			1,
		},
	},
	window_fade = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = window_size,
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
		size = small_window_size,
		position = {
			0,
			0,
			2,
		},
	},
	timer_bg = {
		horizontal_alignment = "center",
		parent = "button_confirm",
		vertical_alignment = "top",
		size = {
			500,
			16,
		},
		position = {
			0,
			not IS_PS4 and 25 or 15,
			3,
		},
	},
	timer_fg = {
		horizontal_alignment = "left",
		parent = "timer_bg",
		vertical_alignment = "center",
		size = {
			490,
			16,
		},
		position = {
			5,
			0,
			3,
		},
	},
	timer_glow = {
		horizontal_alignment = "right",
		parent = "timer_fg",
		vertical_alignment = "center",
		size = {
			45,
			80,
		},
		position = {
			22,
			0,
			3,
		},
	},
	deus_button_confirm = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 60,
			not IS_PS4 and 72 or 0,
		},
		position = {
			0,
			38,
			20,
		},
	},
	button_confirm = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			not IS_PS4 and 72 or 0,
		},
		position = {
			0,
			38,
			20,
		},
	},
	button_abort = {
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
			22,
		},
	},
	game_options_right_chain = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			16,
			window_size[2],
		},
		position = {
			195,
			0,
			2,
		},
	},
	game_options_left_chain = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			16,
			window_size[2],
		},
		position = {
			-195,
			0,
			2,
		},
	},
	title = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			570,
			60,
		},
		position = {
			0,
			34,
			22,
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
	game_option_1 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = game_option_size,
		position = {
			0,
			-36,
			3,
		},
	},
	game_option_2 = {
		horizontal_alignment = "center",
		parent = "game_option_1",
		vertical_alignment = "bottom",
		size = game_option_size,
		position = {
			0,
			-249,
			0,
		},
	},
	switch_mechanism_title = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			game_option_size[1],
			100,
		},
		position = {
			0,
			-66,
			2,
		},
	},
	switch_mechanism_subtitle = {
		horizontal_alignment = "center",
		parent = "switch_mechanism_title",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			40,
		},
		position = {
			0,
			10,
			2,
		},
	},
	switch_mechanism_description = {
		horizontal_alignment = "center",
		parent = "switch_mechanism_subtitle",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 40,
			100,
		},
		position = {
			0,
			-150,
			2,
		},
	},
	journey_name = {
		horizontal_alignment = "left",
		parent = "game_option_1",
		vertical_alignment = "top",
		size = {
			game_option_size[1] / 2,
			30,
		},
		position = {
			15,
			-55,
			1,
		},
	},
	journey_theme = {
		horizontal_alignment = "left",
		parent = "game_option_1",
		vertical_alignment = "center",
		size = {
			game_option_size[1] / 2,
			30,
		},
		position = {
			15,
			10,
			1,
		},
	},
	event_summary_frame = {
		horizontal_alignment = "center",
		parent = "game_option_1",
		vertical_alignment = "bottom",
		size = event_summary_frame_size,
		position = {
			0,
			-465,
			0,
		},
	},
	event_summary = {
		horizontal_alignment = "center",
		parent = "event_summary_frame",
		vertical_alignment = "top",
		size = event_summary_size,
		position = {
			0,
			-10,
			0,
		},
	},
	additional_option = {
		horizontal_alignment = "center",
		parent = "game_option_2",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			200,
		},
		position = {
			0,
			-216,
			0,
		},
	},
	private_button = {
		horizontal_alignment = "center",
		parent = "additional_option",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 20,
			40,
		},
		position = {
			0,
			12,
			10,
		},
	},
	private_button_frame = {
		horizontal_alignment = "center",
		parent = "private_button",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 20,
			45,
		},
		position = {
			0,
			0,
			10,
		},
	},
	host_button = {
		horizontal_alignment = "center",
		parent = "private_button",
		vertical_alignment = "top",
		size = {
			game_option_size[1] - 20,
			40,
		},
		position = {
			0,
			45,
			10,
		},
	},
	host_button_frame = {
		horizontal_alignment = "center",
		parent = "host_button",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 20,
			45,
		},
		position = {
			0,
			0,
			10,
		},
	},
	strict_matchmaking_button = {
		horizontal_alignment = "center",
		parent = "host_button",
		vertical_alignment = "top",
		size = {
			game_option_size[1] - 20,
			40,
		},
		position = {
			0,
			45,
			10,
		},
	},
	strict_matchmaking_button_frame = {
		horizontal_alignment = "center",
		parent = "strict_matchmaking_button",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 20,
			45,
		},
		position = {
			0,
			0,
			10,
		},
	},
	reward_presentation = {
		horizontal_alignment = "center",
		parent = "game_option_1",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			449,
		},
		position = {
			0,
			-465,
			0,
		},
	},
	weave_quickplay_presentation = {
		horizontal_alignment = "center",
		parent = "game_option_1",
		vertical_alignment = "bottom",
		size = {
			246,
			252,
		},
		position = {
			0,
			-465,
			0,
		},
	},
	deed_option_bg = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			game_option_size[1],
			700,
		},
		position = {
			0,
			-36,
			3,
		},
	},
	item_presentation = {
		horizontal_alignment = "center",
		parent = "game_option_1",
		vertical_alignment = "top",
		size = {
			game_option_size[1] - 10,
			0,
		},
		position = {
			0,
			-deed_frame_width,
			1,
		},
	},
	mutator_icon = {
		horizontal_alignment = "left",
		parent = "event_summary_frame",
		vertical_alignment = "top",
		size = {
			40,
			40,
		},
		position = {
			15,
			-50,
			5,
		},
	},
	mutator_icon_frame = {
		horizontal_alignment = "center",
		parent = "mutator_icon",
		vertical_alignment = "center",
		size = {
			60,
			60,
		},
		position = {
			0,
			0,
			1,
		},
	},
	mutator_title_text = {
		horizontal_alignment = "left",
		parent = "event_summary_frame",
		vertical_alignment = "top",
		size = {
			info_frame_size[1] * 0.6,
			50,
		},
		position = {
			15,
			-5,
			1,
		},
	},
	mutator_title_divider = {
		horizontal_alignment = "left",
		parent = "mutator_title_text",
		vertical_alignment = "bottom",
		size = {
			450,
			4,
		},
		position = {
			0,
			10,
			1,
		},
	},
	mutator_description_text = {
		horizontal_alignment = "left",
		parent = "mutator_icon",
		vertical_alignment = "top",
		size = {
			game_option_size[1] - 100,
			100,
		},
		position = {
			50,
			0,
			1,
		},
	},
	objective_title = {
		horizontal_alignment = "center",
		parent = "event_summary_frame",
		vertical_alignment = "top",
		size = {
			game_option_size[1],
			40,
		},
		position = {
			0,
			-175,
			3,
		},
	},
	objective_title_bg = {
		horizontal_alignment = "center",
		parent = "objective_title",
		vertical_alignment = "center",
		size = {
			game_option_size[1],
			59,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	objective_1 = {
		horizontal_alignment = "center",
		parent = "objective_title",
		vertical_alignment = "bottom",
		size = {
			info_frame_size[1],
			30,
		},
		position = {
			0,
			-35,
			3,
		},
	},
	objective_2 = {
		horizontal_alignment = "center",
		parent = "objective_1",
		vertical_alignment = "bottom",
		size = {
			info_frame_size[1],
			30,
		},
		position = {
			0,
			-35,
			0,
		},
	},
	private_checkbox = {
		horizontal_alignment = "center",
		parent = "event_summary_frame",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 20,
			40,
		},
		position = {
			0,
			5,
			1,
		},
	},
	game_option_deus_weekly_event = {
		horizontal_alignment = "center",
		parent = "game_option_1",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			449,
		},
		position = {
			0,
			-465,
			0,
		},
	},
	game_option_deus_weekly = {
		horizontal_alignment = "center",
		parent = "game_option_1",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 50,
			439,
		},
		position = {
			0,
			-465,
			0,
		},
	},
	game_option_deus_weekly_anchor = {
		parent = "game_option_deus_weekly",
		vertical_alignment = "center",
	},
	scrollbar_window = {
		parent = "game_option_deus_weekly",
		position = {
			-45,
			12.5,
			0,
		},
		size = {
			game_option_size[1],
			424,
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

local function deus_weekly_event_create_header(header, offset_y, header_type)
	local widget_definition = {}
	local element = {}
	local passes = {}
	local content = {}
	local style = {}

	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "header",
		text_id = "header",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "plus_horizontal",
		texture_id = "masked_rect",
		content_check_function = function (content, style)
			return header_type and header_type == "boon"
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "plus_vertical",
		texture_id = "masked_rect",
		content_check_function = function (content, style)
			return header_type and header_type == "boon"
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "minus",
		texture_id = "masked_rect",
		content_check_function = function (content, style)
			return header_type and header_type == "curse"
		end,
	}
	content.header = header
	content.masked_rect = "rect_masked"

	local font_size = 32

	style.header = {
		font_type = "hell_shark_header_masked",
		horizontal_alignment = "left",
		localize = true,
		upper_case = true,
		vertical_alignment = "top",
		font_size = font_size,
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			header_type and 25 or 0,
			0,
			2,
		},
	}
	style.plus_horizontal = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		color = {
			255,
			255,
			255,
			0,
		},
		texture_size = {
			20,
			4,
		},
		offset = {
			0,
			-14,
			0,
		},
	}
	style.plus_vertical = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		color = {
			255,
			255,
			255,
			0,
		},
		texture_size = {
			4,
			20,
		},
		offset = {
			8,
			-6,
			0,
		},
	}
	style.minus = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		color = {
			255,
			255,
			0,
			0,
		},
		texture_size = {
			20,
			4,
		},
		offset = {
			0,
			-14,
			0,
		},
	}
	element.passes = passes
	widget_definition.element = element
	widget_definition.content = content
	widget_definition.style = style
	widget_definition.scenegraph_id = "game_option_deus_weekly_anchor"
	widget_definition.offset = {
		0,
		offset_y,
		2,
	}

	return widget_definition
end

local function deus_weekly_event_create_entry_widget(icon, title, description, offset_y)
	local widget_definition = {}
	local element = {}
	local passes = {}
	local content = {}
	local style = {}

	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "title",
		text_id = "title",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "desc",
		text_id = "desc",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "icon",
		texture_id = "icon",
	}
	content.title = title
	content.desc = description
	content.icon = icon

	local indentation = 10

	style.title = {
		dynamic_font_size_word_wrap = true,
		font_size = 22,
		font_type = "hell_shark_masked",
		horizontal_alignment = "left",
		localize = true,
		vertical_alignment = "top",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			35 + indentation,
			-3,
			2,
		},
		area_size = {
			scenegraph_definition.game_option_deus_weekly.size[1] - 35 - indentation,
			50,
		},
	}
	style.desc = {
		font_size = 22,
		font_type = "hell_shark_masked",
		horizontal_alignment = "left",
		localize = false,
		vertical_alignment = "top",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			35 + indentation,
			-30,
			2,
		},
		area_size = {
			scenegraph_definition.game_option_deus_weekly.size[1] - 35 - indentation,
			50,
		},
	}
	style.icon = {
		horizontal_alignment = "left",
		masked = true,
		vertical_alignment = "top",
		color = {
			255,
			255,
			255,
			255,
		},
		texture_size = {
			25,
			25,
		},
		offset = {
			indentation,
			-5,
			0,
		},
	}
	element.passes = passes
	widget_definition.element = element
	widget_definition.content = content
	widget_definition.style = style
	widget_definition.scenegraph_id = "game_option_deus_weekly_anchor"
	widget_definition.offset = {
		0,
		offset_y,
		2,
	}

	return widget_definition
end

local function create_settings_option(scenegraph_id, size, title_text, icon_texture, background_texture, icon_visible)
	icon_texture = icon_texture or "map_frame_fade"

	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_texture)
	local icon_texture_size = icon_texture_settings and icon_texture_settings.size or {
		150,
		150,
	}

	icon_visible = icon_visible == nil or icon_visible
	background_texture = background_texture or "game_options_bg_02"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture",
					style_id = "icon_frame",
					texture_id = "icon_frame",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "text",
					style_id = "option_text",
					text_id = "option_text",
				},
				{
					pass_type = "text",
					style_id = "option_text_shadow",
					text_id = "option_text",
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
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg",
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge",
				},
			},
		},
		content = {
			icon_frame = "map_frame_00",
			option_text = "",
			title_bg = "playername_bg_02",
			title_edge = "game_option_divider",
			frame = frame_settings.texture,
			title_text = title_text or "n/a",
			icon = icon_texture,
			icon_visible = icon_visible,
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
			},
			background = {
				texture_tiling_size = {
					400,
					150,
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
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = icon_texture_size,
				offset = {
					size[1] / 2 - 120,
					0,
					5,
				},
			},
			icon_frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					180,
					180,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] / 2 - 120,
					0,
					6,
				},
			},
			title_bg = {
				size = {
					size[1],
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2,
				},
			},
			title_edge = {
				size = {
					size[1],
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4,
				},
			},
			title_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10,
				},
			},
			title_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9,
				},
			},
			option_text = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5,
					-55,
					10,
				},
			},
			option_text_shadow = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-57,
					9,
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

local function create_settings_option_deus(scenegraph_id, size, title_text, icon_texture, background_texture, icon_visible)
	icon_texture = icon_texture or "map_frame_fade"

	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_texture)
	local icon_texture_size = icon_texture_settings and icon_texture_settings.size or {
		150,
		150,
	}

	icon_visible = icon_visible == nil or icon_visible

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name("vote_background_morris")
	local frame_settings = UIFrameSettings.menu_frame_02_morris
	local frame_width = frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "background",
					pass_type = "texture",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "rotated_texture",
					style_id = "icon_mask",
					texture_id = "icon_mask",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "texture",
					style_id = "journey_border",
					texture_id = "journey_border",
					content_check_function = function (content)
						return content.icon_visible and content.show_journey_border and not content.with_belakor
					end,
				},
				{
					pass_type = "texture",
					style_id = "belakor_journey_border",
					texture_id = "belakor_journey_border",
					content_check_function = function (content)
						return content.icon_visible and content.show_journey_border and content.with_belakor
					end,
				},
				{
					pass_type = "text",
					style_id = "option_text",
					text_id = "option_text",
				},
				{
					pass_type = "text",
					style_id = "option_text_shadow",
					text_id = "option_text",
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
			belakor_journey_border = "vote_icon_border_belakor",
			icon_mask = "mask_rect",
			journey_border = "vote_expedition_border",
			option_text = "",
			show_journey_border = false,
			with_belakor = false,
			frame = frame_settings.texture,
			title_text = title_text or "n/a",
			icon = icon_texture,
			icon_visible = icon_visible,
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = background_texture_settings.texture_name,
			},
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
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
			icon_mask = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					117,
					117,
				},
				angle = math.degrees_to_radians(45),
				pivot = {
					58.5,
					58.5,
				},
				offset = {
					size[1] / 2 - 120,
					0,
					5,
				},
			},
			icon = {
				horizontal_alignment = "center",
				masked = true,
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = icon_texture_size,
				offset = {
					size[1] / 2 - 120,
					0,
					5,
				},
			},
			journey_border = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					180,
					180,
				},
				offset = {
					size[1] / 2 - 120,
					0,
					5,
				},
			},
			belakor_journey_border = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					210,
					210,
				},
				offset = {
					size[1] / 2 - 120,
					0,
					5,
				},
			},
			title_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10,
				},
			},
			title_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9,
				},
			},
			option_text = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5,
					-55,
					10,
				},
			},
			option_text_shadow = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-57,
					9,
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

local function create_settings_option_deus_weekly_event(scenegraph_id, size, title_text, icon_texture, background_texture, icon_visible)
	icon_texture = icon_texture or "map_frame_fade"

	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_texture)
	local icon_texture_size = icon_texture_settings and icon_texture_settings.size or {
		150,
		150,
	}

	icon_visible = icon_visible == nil or icon_visible

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name("vote_background_morris")
	local frame_settings = UIFrameSettings.menu_frame_02_morris
	local frame_width = frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "background",
					pass_type = "texture",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "rotated_texture",
					style_id = "icon_mask",
					texture_id = "icon_mask",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "texture",
					style_id = "journey_border",
					texture_id = "journey_border",
					content_check_function = function (content)
						return content.icon_visible and content.show_journey_border and not content.with_belakor
					end,
				},
				{
					pass_type = "texture",
					style_id = "belakor_journey_border",
					texture_id = "belakor_journey_border",
					content_check_function = function (content)
						return content.icon_visible and content.show_journey_border and content.with_belakor
					end,
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
				{
					pass_type = "text",
					style_id = "difficulty_text",
					text_id = "difficulty_text",
				},
				{
					pass_type = "text",
					style_id = "difficulty_text_shadow",
					text_id = "difficulty_text",
				},
				{
					pass_type = "text",
					style_id = "difficulty_title_text",
					text_id = "difficulty_title_text",
				},
				{
					pass_type = "text",
					style_id = "difficulty_title_text_shadow",
					text_id = "difficulty_title_text",
				},
				{
					pass_type = "texture",
					style_id = "difficulty_icon",
					texture_id = "difficulty_icon",
				},
			},
		},
		content = {
			belakor_journey_border = "vote_icon_border_belakor",
			difficulty_icon = "icons_placeholder",
			difficulty_text = "",
			icon_mask = "mask_rect",
			journey_border = "vote_expedition_border",
			option_text = "",
			show_journey_border = false,
			with_belakor = false,
			frame = frame_settings.texture,
			title_text = title_text or "n/a",
			icon = icon_texture,
			icon_visible = icon_visible,
			difficulty_title_text = Localize("start_game_window_difficulty"),
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = background_texture_settings.texture_name,
			},
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
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
			icon_mask = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					117,
					117,
				},
				angle = math.degrees_to_radians(45),
				pivot = {
					58.5,
					58.5,
				},
				offset = {
					size[1] / 2 - 120,
					0,
					5,
				},
			},
			icon = {
				horizontal_alignment = "center",
				masked = true,
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = icon_texture_size,
				offset = {
					size[1] / 2 - 120,
					0,
					5,
				},
			},
			journey_border = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					180,
					180,
				},
				offset = {
					size[1] / 2 - 120,
					0,
					6,
				},
			},
			belakor_journey_border = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					210,
					210,
				},
				offset = {
					size[1] / 2 - 120,
					0,
					6,
				},
			},
			title_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width - 5,
					10,
				},
			},
			title_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2) - 5,
					9,
				},
			},
			difficulty_icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					frame_width,
					-135,
					5,
				},
			},
			difficulty_title_text = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5 + 40,
					-135,
					10,
				},
			},
			difficulty_title_text_shadow = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2 + 40,
					-137,
					9,
				},
			},
			difficulty_text = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5 + 40,
					-165,
					10,
				},
			},
			difficulty_text_shadow = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2 + 40,
					-167,
					9,
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

local function create_weave_settings_option(scenegraph_id, size, title_text, icon_texture, background_texture, icon_visible)
	icon_texture = icon_texture or "map_frame_fade"

	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_texture)
	local icon_texture_size = icon_texture_settings and icon_texture_settings.size or {
		150,
		150,
	}

	icon_visible = icon_visible == nil or icon_visible
	background_texture = background_texture or "game_options_bg_02"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture",
					style_id = "icon_frame",
					texture_id = "icon_frame",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "texture",
					style_id = "wind_icon",
					texture_id = "wind_icon",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "texture",
					style_id = "wind_icon_bg",
					texture_id = "wind_icon_bg",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "texture",
					style_id = "wind_icon_glow",
					texture_id = "wind_icon_glow",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "texture",
					style_id = "wind_icon_slot",
					texture_id = "wind_icon_slot",
					content_check_function = function (content)
						return content.icon_visible
					end,
				},
				{
					pass_type = "text",
					style_id = "option_text",
					text_id = "option_text",
				},
				{
					pass_type = "text",
					style_id = "option_text_shadow",
					text_id = "option_text",
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
				{
					pass_type = "text",
					style_id = "mission_title",
					text_id = "mission_title",
				},
				{
					pass_type = "text",
					style_id = "mission_title_shadow",
					text_id = "mission_title",
				},
				{
					pass_type = "text",
					style_id = "mission_name",
					text_id = "mission_name",
				},
				{
					pass_type = "text",
					style_id = "mission_name_shadow",
					text_id = "mission_name",
				},
				{
					pass_type = "text",
					style_id = "wind_name",
					text_id = "wind_name",
				},
				{
					pass_type = "text",
					style_id = "wind_name_shadow",
					text_id = "wind_name",
				},
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg",
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge",
				},
			},
		},
		content = {
			icon_frame = "map_frame_weaves",
			option_text = "",
			title_bg = "playername_bg_02",
			title_edge = "game_option_divider",
			wind_icon = "icon_wind_azyr",
			wind_icon_bg = "weave_item_icon_border_selected",
			wind_icon_glow = "winds_icon_background_glow",
			wind_icon_slot = "weave_item_icon_border_center",
			wind_title = "Wind: ",
			frame = frame_settings.texture,
			title_text = title_text or "n/a",
			icon = icon_texture,
			icon_visible = icon_visible,
			mission_title = Localize("lb_level") .. ":",
			mission_name = Localize("level_name_farmlands"),
			wind_name = Localize("wind_metal_name"),
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			wind_icon = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					51.2,
					51.2,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-94,
					10,
					13,
				},
			},
			wind_icon_glow = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40.800000000000004,
					42.400000000000006,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-99,
					15,
					12,
				},
			},
			wind_icon_slot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					51.2,
					51.2,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-94,
					10,
					11,
				},
			},
			wind_icon_bg = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					58.400000000000006,
					58.400000000000006,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-91,
					7,
					10,
				},
			},
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
			},
			background = {
				texture_tiling_size = {
					400,
					150,
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
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = icon_texture_size,
				offset = {
					size[1] / 2 - 120,
					-15,
					5,
				},
			},
			icon_frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					164.8,
					164.8,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] / 2 - 120,
					-15,
					6,
				},
			},
			title_bg = {
				size = {
					size[1],
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2,
				},
			},
			title_edge = {
				size = {
					size[1],
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4,
				},
			},
			title_text = {
				dynamic_font_size = true,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				size = {
					game_option_size[1] - (frame_width + 10),
					game_option_size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				size = {
					game_option_size[1] - (frame_width + 10),
					game_option_size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9,
				},
			},
			mission_title = {
				dynamic_font_size = true,
				font_size = 22,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				size = {
					game_option_size[1] - (frame_width + 10),
					game_option_size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width - 50,
					12,
				},
			},
			mission_title_shadow = {
				dynamic_font_size = true,
				font_size = 18,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				size = {
					game_option_size[1] - (frame_width + 10),
					game_option_size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2) - 50,
					11,
				},
			},
			wind_title = {
				dynamic_font_size = true,
				font_size = 18,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = false,
				size = {
					game_option_size[1] - (frame_width + 10),
					game_option_size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width - 80,
					12,
				},
			},
			wind_title_shadow = {
				dynamic_font_size = true,
				font_size = 22,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = false,
				size = {
					game_option_size[1] - (frame_width + 10),
					game_option_size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2) - 80,
					11,
				},
			},
			mission_name = {
				dynamic_font_size = true,
				font_size = 26,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = false,
				size = {
					game_option_size[1] - (frame_width + 10),
					game_option_size[2],
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					frame_width + 5,
					-frame_width - 75,
					10,
				},
			},
			mission_name_shadow = {
				dynamic_font_size = true,
				font_size = 26,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = false,
				size = {
					game_option_size[1] - (frame_width + 10),
					game_option_size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2) - 75,
					9,
				},
			},
			wind_name = {
				dynamic_font_size = true,
				font_size = 22,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = false,
				size = {
					game_option_size[1] - (frame_width + 10),
					game_option_size[2],
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					frame_width + 5,
					-frame_width - 100,
					10,
				},
			},
			wind_name_shadow = {
				dynamic_font_size = true,
				font_size = 22,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = false,
				size = {
					game_option_size[1] - (frame_width + 10),
					game_option_size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2) - 100,
					9,
				},
			},
			option_text = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5,
					-55,
					10,
				},
			},
			option_text_shadow = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-57,
					9,
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

local function create_additional_settings_option(scenegraph_id, size, title_text, background_texture, frame_settings_name)
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture or "game_options_bg_02")

	frame_settings_name = frame_settings_name or "menu_frame_08"

	local frame_settings = UIFrameSettings[frame_settings_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
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
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg",
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge",
				},
				{
					pass_type = "text",
					style_id = "option_text",
					text_id = "option_text",
				},
				{
					pass_type = "text",
					style_id = "option_text_shadow",
					text_id = "option_text",
				},
			},
		},
		content = {
			option_text = "",
			title_bg = "playername_bg_02",
			title_edge = "game_option_divider",
			frame = frame_settings.texture,
			title_text = title_text or "n/a",
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = background_texture_settings.texture_name,
			},
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
			},
			background = {
				texture_tiling_size = {
					400,
					150,
				},
				color = {
					background_texture and 255 or 0,
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
			title_bg = {
				size = {
					size[1],
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2,
				},
			},
			title_edge = {
				size = {
					size[1],
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4,
				},
			},
			title_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10,
				},
			},
			title_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9,
				},
			},
			option_text = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width + 5,
					-55,
					10,
				},
			},
			option_text_shadow = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-57,
					9,
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

local function create_reward_presentation(scenegraph_id, size, frame_settings_name)
	local background_texture = "game_options_bg_05"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)

	frame_settings_name = frame_settings_name or "menu_frame_08"

	local frame_settings = UIFrameSettings[frame_settings_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "text",
					style_id = "option_text",
					text_id = "option_text",
				},
				{
					pass_type = "text",
					style_id = "option_text_shadow",
					text_id = "option_text",
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
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg",
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge",
				},
			},
		},
		content = {
			title_bg = "playername_bg_02",
			title_edge = "game_option_divider",
			button_hotspot = {},
			frame = frame_settings.texture,
			option_text = Localize("start_game_window_adventure_reward_desc"),
			title_text = Localize("start_game_window_adventure_reward_title"),
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
			},
			background = {
				texture_tiling_size = {
					400,
					150,
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
			title_bg = {
				size = {
					size[1],
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2,
				},
			},
			title_edge = {
				size = {
					size[1],
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4,
				},
			},
			title_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10,
				},
			},
			title_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9,
				},
			},
			option_text = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width,
					frame_width + 10,
					10,
				},
				size = {
					size[1] - frame_width * 2,
					size[2],
				},
			},
			option_text_shadow = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 2,
					frame_width + 8,
					9,
				},
				size = {
					size[1] - frame_width * 2,
					size[2],
				},
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5,
				},
				offset = {
					frame_width,
					frame_width,
					15,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
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

local function create_weave_quickplay_presentation(scenegraph_id, size)
	local background_texture = "weaves_icon"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "rect",
					style_id = "bg_color",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "text",
					style_id = "option_text",
					text_id = "option_text",
				},
				{
					pass_type = "text",
					style_id = "option_text_shadow",
					text_id = "option_text",
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
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg",
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge",
				},
				{
					content_id = "smoke_1",
					pass_type = "texture_uv",
					style_id = "smoke_1",
				},
				{
					content_id = "smoke_2",
					pass_type = "texture_uv",
					style_id = "smoke_2",
				},
				{
					content_id = "ember_1",
					pass_type = "texture_uv",
					style_id = "ember_1",
				},
				{
					content_id = "ember_2",
					pass_type = "texture_uv",
					style_id = "ember_2",
				},
				{
					content_id = "ember_3",
					pass_type = "texture_uv",
					style_id = "ember_3",
				},
			},
		},
		content = {
			title_bg = "playername_bg_02",
			title_edge = "game_option_divider",
			button_hotspot = {},
			frame = frame_settings.texture,
			option_text = Localize("menu_weave_quick_play_body"),
			title_text = Localize("start_game_window_weave_quickplay_title"),
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = background_texture,
			},
			smoke_1 = {
				texture_id = "forge_overview_bottom_glow_effect_smoke_1",
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
			smoke_2 = {
				texture_id = "forge_overview_bottom_glow_effect_smoke_2",
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
			ember_1 = {
				texture_id = "forge_overview_bottom_glow_effect_embers_1",
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
			ember_2 = {
				texture_id = "forge_overview_bottom_glow_effect_embers_2",
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
			ember_3 = {
				texture_id = "forge_overview_bottom_glow_effect_embers_3",
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
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
			},
			background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = background_texture_settings.size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					7,
				},
			},
			bg_color = {
				color = {
					255,
					0,
					0,
					0,
				},
			},
			title_bg = {
				size = {
					size[1],
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2,
				},
			},
			title_edge = {
				size = {
					size[1],
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4,
				},
			},
			title_text = {
				dynamic_font_size = true,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9,
				},
			},
			option_text = {
				font_size = 26,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					frame_width,
					frame_width + 10,
					10,
				},
				size = {
					size[1] - frame_width * 2,
					size[2],
				},
			},
			option_text_shadow = {
				font_size = 26,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 2,
					frame_width + 8,
					9,
				},
				size = {
					size[1] - frame_width * 2,
					size[2],
				},
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5,
				},
				offset = {
					frame_width,
					frame_width,
					15,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
			},
			smoke_1 = {
				color = {
					200,
					138,
					0,
					147,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			smoke_2 = {
				color = {
					255,
					138,
					0,
					187,
				},
				size = {
					size[1],
					size[2] * 0.5,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			ember_1 = {
				color = {
					200,
					128,
					0,
					217,
				},
				size = {
					size[1],
					size[2] * 0.3,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			ember_2 = {
				color = {
					130,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					4,
				},
			},
			ember_3 = {
				color = {
					130,
					255,
					255,
					255,
				},
				size = {
					size[1],
					size[2] * 0.7,
				},
				offset = {
					0,
					0,
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

	return widget
end

function create_twitch_disclaimer(is_server)
	local scenegraph_id = "twitch_mode_info"
	local size = scenegraph_definition[scenegraph_id].size
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local twitch_scale = {
		350 / size[1],
		108 / size[2],
	}
	local service_name = "Twitch"
	local disclaimer_text_id = is_server and "twitch_warning_text_server" or "twitch_warning_text_client"
	local disclaimer_text = string.format(Localize(disclaimer_text_id), service_name, service_name)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "rect",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "twitch_background",
					texture_id = "twitch_background_texture_id",
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
				{
					pass_type = "text",
					style_id = "disclaimer_text",
					text_id = "disclaimer_text",
				},
				{
					pass_type = "text",
					style_id = "disclaimer_text_shadow",
					text_id = "disclaimer_text",
				},
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg",
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge",
				},
			},
		},
		content = {
			title_bg = "playername_bg_02",
			title_edge = "game_option_divider",
			title_text = "twitch_disconnect_warning",
			twitch_background_texture_id = "menu_options_button_image_03",
			frame = frame_settings.texture,
			disclaimer_text = disclaimer_text,
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
			},
			background = {
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			twitch_background = {
				horizontal_alignment = "right",
				texture_size = {
					size[1] * twitch_scale[1],
					size[2] * twitch_scale[2],
				},
				color = {
					192,
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
			title_bg = {
				size = {
					size[1],
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2,
				},
			},
			title_edge = {
				size = {
					size[1],
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4,
				},
			},
			title_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("red", 255),
				default_text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10,
				},
			},
			title_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9,
				},
			},
			disclaimer_text = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					size[1] - 15,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width - 40,
					10,
				},
			},
			disclaimer_text_shadow = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					size[1] - 15,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2) - 40,
					9,
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

function create_twitch_mode(is_server)
	local scenegraph_id = "twitch_mode_info"
	local size = scenegraph_definition[scenegraph_id].size
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local twitch_scale = {
		350 / size[1],
		108 / size[2],
	}
	local service_name = "Twitch"
	local info_text_id = Localize("twitch_info_text_server")
	local info_text = string.format(info_text_id, service_name)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "rect",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "twitch_background",
					texture_id = "twitch_background_texture_id",
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
				{
					pass_type = "text",
					style_id = "info_text",
					text_id = "info_text",
				},
				{
					pass_type = "text",
					style_id = "info_text_shadow",
					text_id = "info_text",
				},
				{
					pass_type = "texture",
					style_id = "title_bg",
					texture_id = "title_bg",
				},
				{
					pass_type = "texture",
					style_id = "title_edge",
					texture_id = "title_edge",
				},
			},
		},
		content = {
			title_bg = "playername_bg_02",
			title_edge = "game_option_divider",
			title_text = "twitch_mode",
			twitch_background_texture_id = "menu_options_button_image_03",
			frame = frame_settings.texture,
			info_text = info_text,
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
			},
			background = {
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			twitch_background = {
				horizontal_alignment = "right",
				texture_size = {
					size[1] * twitch_scale[1],
					size[2] * twitch_scale[2],
				},
				color = {
					192,
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
			title_bg = {
				size = {
					size[1],
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					2,
				},
			},
			title_edge = {
				size = {
					size[1],
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 38 - frame_width,
					4,
				},
			},
			title_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					frame_width + 5,
					-frame_width,
					10,
				},
			},
			title_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2),
					9,
				},
			},
			info_text = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					size[1] - 15,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					frame_width + 5,
					-frame_width - 40,
					10,
				},
			},
			info_text_shadow = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					size[1] - 15,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					frame_width + 5 + 2,
					-(frame_width + 2) - 40,
					9,
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

local function create_objective(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end,
				},
			},
		},
		content = {
			background = "chest_upgrade_fill_glow",
			icon = "objective_icon_general",
			text = "-",
		},
		style = {
			background = {
				color = {
					0,
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
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					22,
					23,
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					1,
				},
			},
			text = {
				dynamic_font_size = true,
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "center",
				word_wrap = true,
				size = {
					size[1] - 60,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					50,
					0,
					2,
				},
			},
			text_shadow = {
				dynamic_font_size = true,
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "center",
				word_wrap = true,
				size = {
					size[1] - 60,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					52,
					-2,
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

local function create_modifier_info(scenegraph_id, icon)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return #content.text > 0
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return #content.text > 0
					end,
				},
			},
		},
		content = {
			text = "",
			icon = icon,
		},
		style = {
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					30,
					30,
				},
				offset = {
					0,
					0,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			text = {
				font_size = 26,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					40,
					0,
					0,
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

local mutator_title_text_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
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
local mutator_description_text_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
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
local objective_title_text_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2,
	},
}
local switch_mechanism_title_text_style = {
	font_size = 55,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = {
		255,
		162,
		102,
		74,
	},
	adventure_text_color = {
		255,
		162,
		102,
		74,
	},
	morris_text_color = {
		255,
		255,
		107,
		0,
	},
	offset = {
		0,
		0,
		2,
	},
}
local switch_mechanism_subtitle_text_style = {
	font_size = 32,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	adventure_text_color = {
		255,
		255,
		255,
		255,
	},
	morris_text_color = {
		255,
		255,
		107,
		0,
	},
	text_color = {
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
}
local switch_mechanism_description_text_style = table.clone(switch_mechanism_subtitle_text_style)

switch_mechanism_description_text_style.font_size = 32

local score_text_style = {
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		10,
		0,
		2,
	},
}
local journey_name_text_style = {
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = true,
	upper_case = false,
	vertical_alignment = "top",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		0,
	},
}
local disable_with_gamepad = true
local widgets = {
	background = {
		scenegraph_id = "screen",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "gradient_dice_game_reward",
		},
		style = {
			color = {
				255,
				255,
				255,
				255,
			},
		},
	},
	window = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_11", 10),
	window_background = UIWidgets.create_tiled_texture("window", "menu_frame_bg_01", {
		960,
		1080,
	}, nil, nil, {
		255,
		100,
		100,
		100,
	}),
	window_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window_fade"),
	button_confirm = UIWidgets.create_play_button("button_confirm", scenegraph_definition.button_confirm.size, "n/a", 34, disable_with_gamepad),
	button_abort = UIWidgets.create_default_button("button_abort", scenegraph_definition.button_abort.size, nil, nil, "n/a", 24, nil, "button_detail_04", 34, disable_with_gamepad),
	game_options_left_chain = UIWidgets.create_tiled_texture("game_options_left_chain", "chain_link_01", {
		16,
		19,
	}),
	game_options_right_chain = UIWidgets.create_tiled_texture("game_options_right_chain", "chain_link_01", {
		16,
		19,
	}),
	title = UIWidgets.create_simple_texture("frame_title_bg_02", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text("", "title_text", nil, nil, title_text_style),
	timer_bg = UIWidgets.create_simple_texture("timer_bg", "timer_bg"),
	timer_fg = UIWidgets.create_simple_uv_texture("timer_fg", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "timer_fg"),
	timer_glow = UIWidgets.create_simple_texture("timer_detail", "timer_glow"),
}
local widgets_deus = {
	background = {
		scenegraph_id = "screen",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "gradient_dice_game_reward",
		},
		style = {
			color = {
				255,
				255,
				255,
				255,
			},
		},
	},
	deus_window = UIWidgets.create_frame("deus_window", scenegraph_definition.deus_window.size, "menu_frame_04_morris", 10),
	window_background = UIWidgets.create_tiled_texture("window", "menu_frame_bg_01", {
		960,
		1080,
	}, nil, nil, {
		255,
		100,
		100,
		100,
	}),
	window_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window_fade"),
	button_confirm = UIWidgets.create_start_game_deus_play_button("deus_button_confirm", scenegraph_definition.deus_button_confirm.size, "n/a", 34, disable_with_gamepad),
	button_abort = UIWidgets.create_deus_default_button("button_abort", scenegraph_definition.button_abort.size, "n/a", 24, disable_with_gamepad),
	game_options_left_chain = UIWidgets.create_tiled_texture("game_options_left_chain", "chain_link_01", {
		16,
		19,
	}),
	game_options_right_chain = UIWidgets.create_tiled_texture("game_options_right_chain", "chain_link_01", {
		16,
		19,
	}),
	title = UIWidgets.create_simple_texture("header_vote_morris", "title"),
	title_text = UIWidgets.create_simple_text("", "title_text", nil, nil, title_text_style),
	timer_bg = UIWidgets.create_simple_texture("timer_bg_morris", "timer_bg"),
	timer_fg = UIWidgets.create_simple_uv_texture("timer_fg", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "timer_fg"),
	timer_glow = UIWidgets.create_simple_texture("timer_detail", "timer_glow"),
	window_decorations = {
		scenegraph_id = "deus_window",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "left",
				},
				{
					pass_type = "texture_uv",
					style_id = "right",
				},
			},
		},
		content = {
			texture_id = "menu_frame_detail_morris",
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
		style = {
			rect = {
				color = {
					127,
					255,
					255,
					255,
				},
			},
			left = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				offset = {
					-15,
					0,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					33,
					846,
				},
			},
			right = {
				horizontal_alignment = "right",
				vertical_alignment = "center",
				offset = {
					15,
					0,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					33,
					846,
				},
			},
		},
	},
}
local rating_texture_sizes = {}
local rating_textures = {}
local rating_bg_textures = {}

for i = 1, 5 do
	rating_textures[i] = "icon_score_rating"
	rating_bg_textures[i] = "icon_score_rating_empty"
	rating_texture_sizes[i] = {
		22,
		22,
	}
end

local event_summary_passes = {
	"event_mission",
	"mutators",
}
local adventure_game_widgets = {
	game_option_1 = create_settings_option("game_option_1", scenegraph_definition.game_option_1.size, Localize("start_game_window_difficulty"), "difficulty_option_1", "game_options_bg_02"),
	reward_presentation = create_reward_presentation("reward_presentation", scenegraph_definition.reward_presentation.size),
}
local game_mode_widgets = {
	game_mode_text = UIWidgets.create_simple_text("n/a", "mutator_description_text", nil, nil, objective_title_text_style),
	frame = UIWidgets.create_frame("deed_option_bg", scenegraph_definition.deed_option_bg.size, deed_frame_name, 20),
	bg = UIWidgets.create_simple_texture("game_options_bg_04", "deed_option_bg"),
}
local switch_mechanism_widgets = {
	title = UIWidgets.create_simple_text("n/a", "switch_mechanism_title", nil, nil, switch_mechanism_title_text_style),
	subtitle = UIWidgets.create_simple_text("n/a", "switch_mechanism_subtitle", nil, nil, switch_mechanism_subtitle_text_style),
	description = UIWidgets.create_simple_text("n/a", "switch_mechanism_description", nil, nil, switch_mechanism_description_text_style),
	frame = UIWidgets.create_frame("deed_option_bg", scenegraph_definition.deed_option_bg.size, deed_frame_name, 20),
	background = UIWidgets.create_simple_texture("vote_switch_mechanism_adventure_background", "deed_option_bg"),
}
local weave_quickplay_widgets = {
	game_option_1 = create_settings_option("game_option_1", scenegraph_definition.game_option_1.size, Localize("start_game_window_difficulty"), "difficulty_option_1", "game_options_bg_02"),
	reward_presentation = create_weave_quickplay_presentation("reward_presentation", scenegraph_definition.reward_presentation.size),
}
local custom_game_widgets = {
	game_option_1 = create_settings_option("game_option_1", scenegraph_definition.game_option_1.size, Localize("start_game_window_mission"), nil, "game_options_bg_01"),
	game_option_2 = create_settings_option("game_option_2", scenegraph_definition.game_option_2.size, Localize("start_game_window_difficulty"), "difficulty_option_1", "game_options_bg_02"),
	additional_option = create_additional_settings_option("additional_option", scenegraph_definition.additional_option.size, Localize("start_game_window_other_options_title"), "game_options_bg_03"),
	private_frame = UIWidgets.create_frame("private_button_frame", scenegraph_definition.private_button_frame.size, window_frame, 1),
	private_button = UIWidgets.create_default_checkbox_button("private_button", scenegraph_definition.private_button.size, Localize("start_game_window_other_options_private"), 24, {
		title = Localize("start_game_window_other_options_private"),
		description = Localize("start_game_window_other_options_private_description"),
	}),
	host_frame = UIWidgets.create_frame("host_button_frame", scenegraph_definition.host_button_frame.size, window_frame, 1),
	host_button = UIWidgets.create_default_checkbox_button("host_button", scenegraph_definition.host_button.size, Localize("start_game_window_other_options_always_host"), 24, {
		title = Localize("start_game_window_other_options_always_host"),
		description = Localize("start_game_window_other_options_always_host_description"),
	}),
	strict_matchmaking_frame = UIWidgets.create_frame("strict_matchmaking_button_frame", scenegraph_definition.strict_matchmaking_button_frame.size, window_frame, 1),
	strict_matchmaking_button = UIWidgets.create_default_checkbox_button("strict_matchmaking_button", scenegraph_definition.strict_matchmaking_button.size, Localize("start_game_window_other_options_strict_matchmaking"), 24, {
		title = Localize("start_game_window_other_options_strict_matchmaking"),
		description = Localize("start_game_window_other_options_strict_matchmaking_description"),
	}),
}
local deed_game_widgets = {
	item_presentation_frame = UIWidgets.create_frame("deed_option_bg", scenegraph_definition.deed_option_bg.size, deed_frame_name, 20),
	item_presentation_bg = UIWidgets.create_simple_texture("game_options_bg_04", "deed_option_bg"),
	item_presentation = UIWidgets.create_simple_item_presentation("item_presentation"),
}
local event_game_widgets = {
	game_option_1 = create_settings_option("game_option_1", scenegraph_definition.game_option_1.size, Localize("start_game_window_difficulty"), "difficulty_option_1", "game_options_bg_02"),
	event_summary_frame = UIWidgets.create_background_with_frame("event_summary_frame", scenegraph_definition.event_summary_frame.size, "game_options_bg_04", "menu_frame_08", true),
	event_summary = UIWidgets.create_simple_item_presentation("event_summary", event_summary_passes),
}
local weave_game_widgets = {
	game_option_1 = create_weave_settings_option("game_option_1", scenegraph_definition.game_option_1.size, Localize("start_game_window_mission"), nil, "game_options_bg_01"),
	event_summary_frame = UIWidgets.create_background_with_frame("event_summary_frame", scenegraph_definition.event_summary_frame.size, "game_options_bg_04", "menu_frame_08", true),
	mutator_icon = UIWidgets.create_simple_texture("icons_placeholder", "mutator_icon"),
	mutator_title_text = UIWidgets.create_simple_text("n/a", "mutator_title_text", nil, nil, mutator_title_text_style),
	mutator_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "mutator_title_divider"),
	mutator_description_text = UIWidgets.create_simple_text("n/a", "mutator_description_text", nil, nil, mutator_description_text_style),
	objective_title_bg = UIWidgets.create_simple_texture("menu_subheader_bg", "objective_title_bg"),
	objective_title = UIWidgets.create_simple_text("weave_objective_title", "objective_title", nil, nil, objective_title_text_style),
	objective_1 = create_objective("objective_1", scenegraph_definition.objective_1.size),
	objective_2 = create_objective("objective_2", scenegraph_definition.objective_2.size),
	private_checkbox = UIWidgets.create_default_checkbox_button("private_checkbox", scenegraph_definition.private_checkbox.size, Localize("start_game_window_join_disallowed"), 24, {
		title = Localize("start_game_window_join_disallowed"),
		description = Localize("start_game_window_disallow_join_description"),
	}, true),
}
local deus_quickplay_widget = {
	game_option_1 = create_settings_option_deus("game_option_1", scenegraph_definition.game_option_1.size, Localize("start_game_window_mission"), nil, true),
	reward_presentation = create_reward_presentation("reward_presentation", scenegraph_definition.reward_presentation.size, "menu_frame_02_morris"),
}
local deus_window_frame = "menu_frame_01_morris"
local deus_custom_widget = {
	game_option_1 = create_settings_option_deus("game_option_1", scenegraph_definition.game_option_1.size, Localize("start_game_window_mission"), nil, true),
	journey_name = UIWidgets.create_simple_text("n/a", "journey_name", nil, nil, journey_name_text_style),
	journey_theme = create_modifier_info("journey_theme"),
	game_option_2 = create_settings_option_deus("game_option_2", scenegraph_definition.game_option_2.size, Localize("start_game_window_difficulty"), "difficulty_option_1", nil),
	additional_option = create_additional_settings_option("additional_option", scenegraph_definition.additional_option.size, Localize("start_game_window_other_options_title"), false, "menu_frame_02_morris"),
	private_frame = UIWidgets.create_frame("private_button_frame", scenegraph_definition.private_button_frame.size, deus_window_frame, 1),
	private_button = UIWidgets.create_default_checkbox_button("private_button", scenegraph_definition.private_button.size, Localize("start_game_window_other_options_private"), 24, {
		title = Localize("start_game_window_other_options_private"),
		description = Localize("start_game_window_other_options_private_description"),
	}, nil, "menu_frame_03_morris"),
	host_frame = UIWidgets.create_frame("host_button_frame", scenegraph_definition.host_button_frame.size, deus_window_frame, 1),
	host_button = UIWidgets.create_default_checkbox_button("host_button", scenegraph_definition.host_button.size, Localize("start_game_window_other_options_always_host"), 24, {
		title = Localize("start_game_window_other_options_always_host"),
		description = Localize("start_game_window_other_options_always_host_description"),
	}, nil, "menu_frame_03_morris"),
	strict_matchmaking_frame = UIWidgets.create_frame("strict_matchmaking_button_frame", scenegraph_definition.strict_matchmaking_button_frame.size, deus_window_frame, 1),
	strict_matchmaking_button = UIWidgets.create_default_checkbox_button("strict_matchmaking_button", scenegraph_definition.strict_matchmaking_button.size, Localize("start_game_window_other_options_strict_matchmaking"), 24, {
		title = Localize("start_game_window_other_options_strict_matchmaking"),
		description = Localize("start_game_window_other_options_strict_matchmaking_description"),
	}, nil, "menu_frame_03_morris"),
}
local deus_window_frame = "menu_frame_01_morris"
local deus_weekly_event_widgets = {
	game_option_1 = create_settings_option_deus_weekly_event("game_option_1", scenegraph_definition.game_option_1.size, Localize("cw_weekly_expedition_name_long"), nil, true),
	journey_name = UIWidgets.create_simple_text("n/a", "journey_name", nil, nil, journey_name_text_style),
	journey_theme = create_modifier_info("journey_theme"),
	mask = UIWidgets.create_simple_texture("mask_rect", "game_option_deus_weekly", nil, nil, {
		255,
		255,
		255,
		255,
	}),
	deus_weekly_event_frame = UIWidgets.create_background_with_frame("game_option_deus_weekly_event", scenegraph_definition.game_option_deus_weekly_event.size, "vote_switch_mechanism_morris_background", "menu_frame_08", true, {
		255,
		50,
		50,
		50,
	}),
}
local versus_quickplay_widgets = {
	game_option_1 = create_settings_option("game_option_1", scenegraph_definition.game_option_1.size, Localize("start_game_window_difficulty"), "difficulty_option_1", "game_options_bg_02"),
	reward_presentation = create_reward_presentation("reward_presentation", scenegraph_definition.reward_presentation.size),
}
local versus_custom_widgets = {
	game_option_1 = create_settings_option("game_option_1", scenegraph_definition.game_option_1.size, Localize("start_game_window_mission"), nil, "game_options_bg_01"),
	game_option_2 = create_settings_option("game_option_2", scenegraph_definition.game_option_2.size, Localize("start_game_window_difficulty"), "difficulty_option_1", "game_options_bg_02"),
	additional_option = create_additional_settings_option("additional_option", scenegraph_definition.additional_option.size, Localize("start_game_window_other_options_title"), "game_options_bg_03"),
	player_hosted_frame = UIWidgets.create_frame("strict_matchmaking_button_frame", scenegraph_definition.strict_matchmaking_button_frame.size, window_frame, 1),
	player_hosted_button = UIWidgets.create_default_checkbox_button("strict_matchmaking_button", scenegraph_definition.strict_matchmaking_button.size, Localize("player_hosted_title"), 24, {
		title = Localize("player_hosted_title"),
		description = Localize("player_hosted_desc"),
	}),
	dedicated_server_win_frame = UIWidgets.create_frame("host_button_frame", scenegraph_definition.host_button_frame.size, window_frame, 1),
	dedicated_server_win_button = UIWidgets.create_default_checkbox_button("host_button", scenegraph_definition.host_button.size, Localize("dedicated_server_win_title"), 24, {
		title = Localize("dedicated_server_win_title"),
		description = Localize("dedicated_server_win_desc"),
	}),
	dedicated_server_aws_frame = UIWidgets.create_frame("private_button_frame", scenegraph_definition.private_button_frame.size, window_frame, 1),
	dedicated_server_aws_button = UIWidgets.create_default_checkbox_button("private_button", scenegraph_definition.private_button.size, Localize("dedicated_server_aws_title"), 24, {
		title = Localize("dedicated_server_aws_title"),
		description = Localize("dedicated_server_aws_desc"),
	}),
}
local twitch_mode_widget_funcs = {
	twitch_disclaimer = create_twitch_disclaimer,
	twitch_mode = create_twitch_mode,
}
local generic_input_actions = {
	default = {},
	default_voting = {
		actions = {
			{
				description_text = "menu_accept",
				input_action = "confirm",
				priority = 1,
			},
			{
				description_text = "dlc1_3_1_decline",
				input_action = "back",
				priority = 2,
			},
		},
	},
}

return {
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	adventure_game_widgets = adventure_game_widgets,
	game_mode_widgets = game_mode_widgets,
	custom_game_widgets = custom_game_widgets,
	deed_game_widgets = deed_game_widgets,
	event_game_widgets = event_game_widgets,
	weave_game_widgets = weave_game_widgets,
	deus_quickplay_widget = deus_quickplay_widget,
	deus_custom_widget = deus_custom_widget,
	weave_quickplay_widgets = weave_quickplay_widgets,
	twitch_mode_widget_funcs = twitch_mode_widget_funcs,
	switch_mechanism_widgets = switch_mechanism_widgets,
	versus_quickplay_widgets = versus_quickplay_widgets,
	versus_custom_widgets = versus_custom_widgets,
	widgets = widgets,
	widgets_deus = widgets_deus,
	deus_weekly_event_create_header = deus_weekly_event_create_header,
	deus_weekly_event_create_entry_widget = deus_weekly_event_create_entry_widget,
	deus_weekly_event_widgets = deus_weekly_event_widgets,
}
