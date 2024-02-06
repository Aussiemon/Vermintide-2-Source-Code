-- chunkname: @scripts/ui/views/loading_view_definitions.lua

local_require("scripts/ui/ui_widgets")

local MAXIMUM_TIP_WIDTH = 1400
local ICON_SIZE = {
	26,
	26,
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			1,
		},
		size = {
			1920,
			1080,
		},
	},
	dead_space_filler = {
		scale = "fit",
		position = {
			0,
			0,
			0,
		},
		size = {
			1920,
			1080,
		},
	},
	press_to_continue = {
		horizontal_alignment = "right",
		parent = "dead_space_filler",
		vertical_alignment = "bottom",
		position = {
			-100,
			150,
			500,
		},
	},
	weave_loading_icon = {
		horizontal_alignment = "right",
		parent = "dead_space_filler",
		vertical_alignment = "bottom",
		position = {
			-90,
			114,
			99,
		},
		size = {
			114,
			114,
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
	background_image = {
		horizontal_alignment = "center",
		scale = "aspect_ratio",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			2,
		},
	},
	tip_title = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "bottom",
		size = {
			260,
			35,
		},
		position = {
			0,
			120,
			10,
		},
	},
	tip_text_prefix = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "bottom",
		size = {
			MAXIMUM_TIP_WIDTH,
			85,
		},
		position = {
			0,
			35,
			10,
		},
	},
	gamepad_input_icon = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "bottom",
		size = ICON_SIZE,
		position = {
			0,
			65,
			11,
		},
	},
	second_gamepad_input_icon = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "bottom",
		size = ICON_SIZE,
		position = {
			0,
			65,
			11,
		},
	},
	tip_text_suffix = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "bottom",
		size = {
			MAXIMUM_TIP_WIDTH,
			85,
		},
		position = {
			0,
			35,
			10,
		},
	},
	second_row_tip_text_prefix = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "bottom",
		size = {
			MAXIMUM_TIP_WIDTH,
			85,
		},
		position = {
			0,
			6,
			10,
		},
	},
	second_row_gamepad_input_icon = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "bottom",
		size = ICON_SIZE,
		position = {
			0,
			36,
			11,
		},
	},
	second_row_second_gamepad_input_icon = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "bottom",
		size = ICON_SIZE,
		position = {
			0,
			36,
			11,
		},
	},
	second_row_tip_text_suffix = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "bottom",
		size = {
			MAXIMUM_TIP_WIDTH,
			85,
		},
		position = {
			0,
			6,
			10,
		},
	},
	news_ticker_text = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "top",
		size = {
			1920,
			20,
		},
		position = {
			1960,
			-10,
			10,
		},
	},
	news_ticker_mask = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "top",
		size = {
			1920,
			40,
		},
		position = {
			6,
			0,
			11,
		},
	},
	act_name = {
		horizontal_alignment = "left",
		parent = "background_image",
		vertical_alignment = "top",
		size = {
			320,
			60,
		},
		position = {
			280,
			-71,
			4,
		},
	},
	act_name_bg = {
		horizontal_alignment = "center",
		parent = "act_name",
		vertical_alignment = "center",
		size = {
			520,
			60,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	level_name = {
		horizontal_alignment = "center",
		parent = "background_image",
		vertical_alignment = "top",
		size = {
			520,
			60,
		},
		position = {
			0,
			-20,
			4,
		},
	},
	level_name_bg = {
		horizontal_alignment = "center",
		parent = "level_name",
		vertical_alignment = "center",
		size = {
			320,
			60,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	game_difficulty = {
		horizontal_alignment = "right",
		parent = "background_image",
		vertical_alignment = "top",
		size = {
			320,
			60,
		},
		position = {
			-280,
			-71,
			4,
		},
	},
	game_difficulty_bg = {
		horizontal_alignment = "center",
		parent = "game_difficulty",
		vertical_alignment = "center",
		size = {
			320,
			60,
		},
		position = {
			0,
			0,
			-1,
		},
	},
}
local dead_space_filler = {
	scenegraph_id = "dead_space_filler",
	element = {
		passes = {
			{
				pass_type = "rect",
				style_id = "rect",
			},
		},
	},
	content = {},
	style = {
		rect = {
			color = {
				255,
				0,
				0,
				0,
			},
		},
	},
}
local press_to_continue_widget = {
	scenegraph_id = "press_to_continue",
	element = {
		passes = {
			{
				pass_type = "text",
				style_id = "text",
				text_id = "text",
				content_check_function = function (content, style)
					style.text_color[1] = 192 + math.sin(Managers.time:time("ui") * 4) * 64

					return true
				end,
			},
		},
	},
	content = {
		text = IS_WINDOWS and "press_any_key_to_continue" or "press_any_button_to_continue",
		color = Colors.get_color_table_with_alpha("white", 255),
	},
	style = {
		text = text_style or {
			font_size = 28,
			horizontal_alignment = "right",
			localize = true,
			vertical_alignment = "bottom",
			word_wrap = false,
			font_type = optional_font_style or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				-200,
				0,
				20,
			},
		},
	},
	offset = {
		0,
		0,
		0,
	},
}
local background_image = {
	scenegraph_id = "background_image",
	element = {
		passes = {
			{
				pass_type = "rect",
				style_id = "bg_rect",
			},
			{
				pass_type = "texture",
				texture_id = "bg_texture",
			},
			{
				pass_type = "texture",
				style_id = "fade_texture",
				texture_id = "fade_texture",
				content_check_function = function (content)
					return content.is_weave
				end,
			},
			{
				pass_type = "text",
				style_id = "location_header",
				text_id = "location_header",
				content_check_function = function (content)
					return content.is_weave
				end,
			},
			{
				pass_type = "text",
				style_id = "location_name",
				text_id = "location_name",
				content_check_function = function (content)
					return content.is_weave
				end,
			},
			{
				pass_type = "text",
				style_id = "location_name_shadow",
				text_id = "location_name",
				content_check_function = function (content)
					return content.is_weave
				end,
			},
			{
				pass_type = "text",
				style_id = "mutator_name",
				text_id = "mutator_name",
				content_check_function = function (content)
					return content.is_weave
				end,
			},
			{
				pass_type = "text",
				style_id = "mutator_description",
				text_id = "mutator_description",
				content_check_function = function (content)
					return content.is_weave
				end,
			},
			{
				pass_type = "texture",
				style_id = "objective_icon",
				texture_id = "objective_icon",
				content_check_function = function (content)
					return content.is_weave and not content.is_arena
				end,
			},
			{
				pass_type = "text",
				style_id = "objective_text",
				text_id = "objective_text",
				content_check_function = function (content)
					return content.is_weave and not content.is_arena
				end,
			},
		},
	},
	content = {
		bg_texture = "to_be_set",
		fade_texture = "loading_screen_fade",
		is_weave = false,
		location_header = "loading_view_location",
		location_name = "",
		mutator_description = "",
		mutator_name = "",
		objective_icon = "loading_objective_icon",
		objective_text = " ",
	},
	style = {
		bg_rect = {
			scenegraph_id = "root",
			color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				-1,
			},
		},
		fade_texture = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				5,
			},
			texture_size = {
				1920,
				599,
			},
		},
		location_header = {
			font_size = 24,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = true,
			upper_case = true,
			vertical_alignment = "bottom",
			text_color = {
				255,
				125,
				125,
				125,
			},
			offset = {
				130,
				445,
				6,
			},
		},
		location_name = {
			font_size = 58,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = true,
			upper_case = true,
			vertical_alignment = "bottom",
			text_color = {
				255,
				215,
				215,
				215,
			},
			offset = {
				130,
				380,
				6,
			},
		},
		location_name_shadow = {
			font_size = 58,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = true,
			upper_case = true,
			vertical_alignment = "bottom",
			text_color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				130,
				378,
				5,
			},
		},
		mutator_name = {
			font_size = 32,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = true,
			upper_case = false,
			vertical_alignment = "bottom",
			text_color = {
				255,
				215,
				215,
				215,
			},
			offset = {
				130,
				310,
				6,
			},
		},
		mutator_description = {
			font_size = 24,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = true,
			upper_case = false,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = {
				255,
				215,
				215,
				215,
			},
			size = {
				680,
				0,
			},
			offset = {
				130,
				310,
				6,
			},
		},
		objective_icon = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				130,
				284,
				10,
			},
			texture_size = {
				30,
				30,
			},
		},
		objective_text = {
			font_size = 24,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = true,
			upper_case = false,
			vertical_alignment = "bottom",
			text_color = {
				255,
				215,
				215,
				215,
			},
			offset = {
				170,
				280,
				6,
			},
		},
	},
}
local news_ticker_text_style = {
	font_size = 24,
	font_type = "hell_shark_masked",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
	offset = {
		0,
		0,
		2,
	},
}
local definitions = {
	scenegraph_definition = scenegraph_definition,
	dead_space_filler = dead_space_filler,
	background_image = background_image,
	logo_image = logo_image,
	press_to_continue_widget = press_to_continue_widget,
	act_name_widget = UIWidgets.create_simple_text("", "act_name", nil, nil, {
		font_size = 36,
		font_type = "hell_shark_header",
		horizontal_alignment = "center",
		vertical_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("loading_screen_stone", 255),
		offset = {
			0,
			0,
			2,
		},
	}),
	act_name_bg_widget = UIWidgets.create_simple_text("", "act_name_bg", nil, nil, {
		font_size = 36,
		font_type = "hell_shark_header",
		horizontal_alignment = "center",
		vertical_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("silver", 127),
		offset = {
			1,
			-1,
			-1,
		},
	}),
	level_name_widget = UIWidgets.create_simple_text("", "level_name", nil, nil, {
		font_size = 44,
		font_type = "hell_shark_header",
		horizontal_alignment = "center",
		vertical_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			0,
			0,
			2,
		},
	}),
	level_name_bg_widget = UIWidgets.create_simple_text("", "level_name_bg", nil, nil, {
		font_size = 44,
		font_type = "hell_shark_header",
		horizontal_alignment = "center",
		vertical_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("silver", 127),
		offset = {
			1,
			-1,
			-1,
		},
	}),
	game_difficulty_widget = UIWidgets.create_simple_text("", "game_difficulty", nil, nil, {
		font_size = 36,
		font_type = "hell_shark_header",
		horizontal_alignment = "center",
		vertical_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("loading_screen_stone", 255),
		offset = {
			0,
			0,
			2,
		},
	}),
	game_difficulty_bg_widget = UIWidgets.create_simple_text("", "game_difficulty_bg", nil, nil, {
		font_size = 36,
		font_type = "hell_shark_header",
		horizontal_alignment = "center",
		vertical_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("silver", 127),
		offset = {
			1,
			-1,
			-1,
		},
	}),
	tip_title_widget = UIWidgets.create_simple_text("loading_screen_tip_title", "tip_title", 32, Colors.get_color_table_with_alpha("font_default", 255)),
	tip_text_prefix_widget = UIWidgets.create_simple_text("", "tip_text_prefix", nil, nil, {
		font_size = 22,
		font_type = "hell_shark",
		horizontal_alignment = "right",
		vertical_alignment = "center",
		word_wrap = false,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			0,
			0,
			2,
		},
	}),
	gamepad_input_icon = {
		scenegraph_id = "gamepad_input_icon",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.texture_id
					end,
				},
			},
		},
		content = {},
		style = {
			texture_id = {
				offset = {
					0,
					0,
					1,
				},
			},
		},
	},
	second_gamepad_input_icon = {
		scenegraph_id = "second_gamepad_input_icon",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.texture_id
					end,
				},
			},
		},
		content = {},
		style = {
			texture_id = {
				offset = {
					0,
					0,
					1,
				},
			},
		},
	},
	tip_text_suffix_widget = UIWidgets.create_simple_text("", "tip_text_suffix", nil, nil, {
		font_size = 22,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		vertical_alignment = "center",
		word_wrap = false,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			0,
			0,
			2,
		},
	}),
	second_row_tip_text_prefix_widget = UIWidgets.create_simple_text("", "second_row_tip_text_prefix", nil, nil, {
		font_size = 22,
		font_type = "hell_shark",
		horizontal_alignment = "right",
		vertical_alignment = "center",
		word_wrap = false,
		text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
		offset = {
			0,
			0,
			2,
		},
	}),
	second_row_gamepad_input_icon = {
		scenegraph_id = "second_row_gamepad_input_icon",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.texture_id
					end,
				},
			},
		},
		content = {},
		style = {
			texture_id = {
				offset = {
					0,
					0,
					1,
				},
			},
		},
	},
	second_row_second_gamepad_input_icon = {
		scenegraph_id = "second_row_second_gamepad_input_icon",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.texture_id
					end,
				},
			},
		},
		content = {},
		style = {
			texture_id = {
				offset = {
					0,
					0,
					1,
				},
			},
		},
	},
	second_row_tip_text_suffix_widget = UIWidgets.create_simple_text("", "second_row_tip_text_suffix", nil, nil, {
		font_size = 22,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		vertical_alignment = "center",
		word_wrap = false,
		text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
		offset = {
			0,
			0,
			2,
		},
	}),
	news_ticker_text_widget = UIWidgets.create_simple_text("", "news_ticker_text", nil, nil, news_ticker_text_style),
	news_ticker_mask_widget = UIWidgets.create_simple_texture("mask_rect", "news_ticker_mask"),
	weave_loading_icon = UIWidgets.create_simple_texture("wom_loading", "weave_loading_icon"),
	MAXIMUM_TIP_WIDTH = MAXIMUM_TIP_WIDTH,
	ICON_SIZE = ICON_SIZE,
}

return definitions
