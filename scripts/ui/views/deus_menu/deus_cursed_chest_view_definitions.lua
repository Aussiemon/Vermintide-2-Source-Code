-- chunkname: @scripts/ui/views/deus_menu/deus_cursed_chest_view_definitions.lua

local window_default_settings = UISettings.game_start_windows
local small_window_size = {
	400,
	600,
}
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
	window_overlay = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			5,
		},
	},
	window_frame = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			30,
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
			100,
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
	background_wheel_01 = {
		horizontal_alignment = "center",
		parent = "screen_center",
		vertical_alignment = "center",
		size = {
			188,
			188,
		},
		position = {
			-100,
			0,
			6,
		},
	},
	background_wheel_02 = {
		horizontal_alignment = "center",
		parent = "screen_center",
		vertical_alignment = "center",
		size = {
			461,
			461,
		},
		position = {
			-100,
			0,
			6,
		},
	},
	background_wheel_03 = {
		horizontal_alignment = "center",
		parent = "screen_center",
		vertical_alignment = "center",
		size = {
			1074,
			1074,
		},
		position = {
			-100,
			0,
			6,
		},
	},
	exit_button = {
		horizontal_alignment = "center",
		parent = "window_frame",
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
		parent = "window_frame",
		vertical_alignment = "top",
		size = {
			658,
			60,
		},
		position = {
			0,
			34,
			20,
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
			1,
		},
	},
	top_corner_left = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "top",
		size = {
			110,
			110,
		},
		position = {
			0,
			0,
			15,
		},
	},
	bottom_corner_left = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			110,
			110,
		},
		position = {
			0,
			0,
			15,
		},
	},
	options_background_mask = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "center",
		size = {
			1000,
			window_size[2],
		},
		position = {
			0,
			0,
			6,
		},
	},
	options_background = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "center",
		size = {
			1000,
			900,
		},
		position = {
			0,
			0,
			6,
		},
	},
	options_window_edge = {
		horizontal_alignment = "right",
		parent = "options_background",
		vertical_alignment = "center",
		size = {
			0,
			900,
		},
		position = {
			0,
			0,
			6,
		},
	},
	options_background_edge = {
		horizontal_alignment = "right",
		parent = "options_window_edge",
		vertical_alignment = "center",
		size = {
			126,
			window_size[2] - 20,
		},
		position = {
			-493,
			0,
			1,
		},
	},
	power_up_root = {
		horizontal_alignment = "center",
		parent = "options_background",
		vertical_alignment = "center",
		size = {
			484,
			194,
		},
		position = {
			160,
			0,
			7,
		},
	},
	chest_name_text = {
		horizontal_alignment = "center",
		parent = "window_frame",
		vertical_alignment = "center",
		size = {
			400,
			50,
		},
		position = {
			-300,
			0,
			1,
		},
	},
	chest_lore_text = {
		horizontal_alignment = "center",
		parent = "chest_name_text",
		vertical_alignment = "center",
		size = {
			500,
			70,
		},
		position = {
			0,
			-50,
			1,
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
local chest_name_text_style = {
	dynamic_font_size = true,
	font_size = 46,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local chest_lore_text_style = {
	dynamic_font_size = true,
	font_size = 20,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}

local function create_power_up_shop_item(scenegraph_id, size, masked, is_rectangular_icon)
	local background_color = {
		255,
		255,
		255,
		255,
	}
	local icon = {
		horizontal_alignment = "left",
		vertical_alignment = "center",
		masked = masked,
		color = {
			255,
			138,
			172,
			235,
		},
		offset = {
			7,
			0,
			6,
		},
		texture_size = {
			66,
			66,
		},
	}
	local icon_disabled = table.clone(icon)

	icon_disabled.color = {
		255,
		80,
		80,
		80,
	}

	local title_text = {
		dynamic_font_size = true,
		font_size = 20,
		horizontal_alignment = "left",
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = true,
		color = {
			150,
			255,
			0,
			0,
		},
		font_type = masked and "hell_shark_masked" or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			100,
			size[2] - 70,
			3,
		},
		size = {
			size[1] - 270,
			30,
		},
	}
	local title_text_disabled = table.clone(title_text)

	title_text_disabled.text_color = {
		255,
		100,
		100,
		100,
	}

	local title_text_shadow = table.clone(title_text)

	title_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	title_text_shadow.offset = {
		title_text.offset[1] + 2,
		title_text.offset[2] - 2,
		title_text.offset[3] - 1,
	}

	local rarity_text = {
		dynamic_font_size = true,
		font_size = 20,
		horizontal_alignment = "right",
		vertical_alignment = "center",
		word_wrap = true,
		color = {
			150,
			255,
			0,
			0,
		},
		font_type = masked and "hell_shark_masked" or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			330,
			size[2] - 70,
			3,
		},
		size = {
			100,
			30,
		},
	}
	local rarity_text_shadow = table.clone(rarity_text)

	rarity_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	rarity_text_shadow.offset = {
		rarity_text.offset[1] + 2,
		rarity_text.offset[2] - 2,
		rarity_text.offset[3] - 1,
	}

	local sub_text = {
		dynamic_font_size_word_wrap = true,
		font_size = 18,
		horizontal_alignment = "left",
		vertical_alignment = "top",
		word_wrap = true,
		color = {
			150,
			0,
			255,
			0,
		},
		font_type = masked and "hell_shark_masked" or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			100,
			size[2] - 167,
			3,
		},
		size = {
			size[1] - 155,
			100,
		},
	}
	local sub_text_disabled = table.clone(sub_text)

	sub_text_disabled.text_color = {
		255,
		80,
		80,
		80,
	}

	local sub_text_shadow = table.clone(sub_text)

	sub_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	sub_text_shadow.offset = {
		sub_text.offset[1] + 2,
		sub_text.offset[2] - 2,
		sub_text.offset[3] - 1,
	}

	local price_text = {
		dynamic_font_size = true,
		font_size = 22,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		word_wrap = true,
		color = {
			150,
			255,
			0,
			0,
		},
		font_type = masked and "hell_shark_masked" or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			-60,
			70,
			3,
		},
		default_offset = {
			-60,
			70,
			3,
		},
		size = {
			55,
			20,
		},
		color_override = {},
		color_override_table = {
			end_index = 0,
			start_index = 0,
			color = {
				255,
				121,
				193,
				229,
			},
		},
	}
	local price_text_disabled = table.clone(price_text)

	price_text_disabled.text_color = Colors.get_color_table_with_alpha("red", 255)

	local price_text_shadow = table.clone(price_text)

	price_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	price_text_shadow.offset = {
		price_text.offset[1] + 2,
		price_text.offset[2] - 2,
		price_text.offset[3] - 1,
	}

	local current_value_title_text = {
		dynamic_font_size = true,
		font_size = 18,
		horizontal_alignment = "right",
		vertical_alignment = "center",
		word_wrap = true,
		color = {
			150,
			255,
			0,
			0,
		},
		font_type = masked and "hell_shark_masked" or "hell_shark",
		text_color = {
			255,
			150,
			150,
			150,
		},
		offset = {
			-155,
			40,
			3,
		},
		size = {
			80,
			20,
		},
	}
	local current_value_title_text_shadow = table.clone(current_value_title_text)

	current_value_title_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	current_value_title_text_shadow.offset = {
		current_value_title_text.offset[1] + 2,
		current_value_title_text.offset[2] - 2,
		current_value_title_text.offset[3] - 1,
	}

	local current_value_text = {
		dynamic_font_size = true,
		font_size = 18,
		horizontal_alignment = "right",
		vertical_alignment = "center",
		word_wrap = true,
		color = {
			150,
			255,
			0,
			0,
		},
		font_type = masked and "hell_shark_masked" or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			-60,
			40,
			3,
		},
		size = {
			30,
			20,
		},
	}
	local current_value_text_shadow = table.clone(current_value_text)

	current_value_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	current_value_text_shadow.offset = {
		current_value_text.offset[1] + 2,
		current_value_text.offset[2] - 2,
		current_value_text.offset[3] - 1,
	}

	local max_value_title_text = table.clone(current_value_title_text)

	max_value_title_text.offset[2] = 15

	local max_value_title_text_shadow = table.clone(max_value_title_text)

	max_value_title_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	max_value_title_text_shadow.offset = {
		max_value_title_text.offset[1] + 2,
		max_value_title_text.offset[2] - 2,
		max_value_title_text.offset[3] - 1,
	}

	local max_value_text = table.clone(current_value_text)

	max_value_text.offset[2] = 15
	max_value_text.text_color = Colors.get_color_table_with_alpha("font_title", 255)

	local max_value_text_shadow = table.clone(max_value_text)

	max_value_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	max_value_text_shadow.offset = {
		max_value_text.offset[1] + 2,
		max_value_text.offset[2] - 2,
		max_value_text.offset[3] - 1,
	}

	local passes = {
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
			content_id = "frame",
			pass_type = "texture_uv",
			style_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "icon_bought_frame",
			texture_id = "icon_bought_frame",
		},
		{
			pass_type = "texture",
			style_id = "icon_discount_frame",
			texture_id = "icon_discount_frame",
			content_check_function = function (content)
				return content.has_discount
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_hover_frame",
			texture_id = "icon_hover_frame",
		},
		{
			pass_type = "texture",
			style_id = "icon_background",
			texture_id = "icon_background",
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return content.is_bought or not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_disabled",
			texture_id = "icon",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end,
		},
		{
			pass_type = "text",
			style_id = "sub_text_disabled",
			text_id = "sub_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end,
		},
		{
			pass_type = "text",
			style_id = "sub_text",
			text_id = "sub_text",
			content_check_function = function (content)
				return content.is_bought or not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "sub_text_shadow",
			text_id = "sub_text",
		},
		{
			pass_type = "text",
			style_id = "title_text_disabled",
			text_id = "title_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end,
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
			content_check_function = function (content)
				return content.is_bought or not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "title_text_shadow",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "rarity_text",
			text_id = "rarity_text",
		},
		{
			pass_type = "text",
			style_id = "rarity_text_shadow",
			text_id = "rarity_text",
		},
		{
			pass_type = "text",
			style_id = "price_text",
			text_id = "price_text",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button and not content.is_bought
			end,
		},
		{
			pass_type = "text",
			style_id = "price_text_disabled",
			text_id = "price_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end,
		},
		{
			pass_type = "text",
			style_id = "price_text_shadow",
			text_id = "price_text",
			content_check_function = function (content)
				return not content.is_bought
			end,
		},
		{
			pass_type = "texture",
			style_id = "price_icon",
			texture_id = "price_icon",
			content_check_function = function (content)
				return not content.is_bought
			end,
		},
		{
			pass_type = "text",
			style_id = "current_value_title_text",
			text_id = "current_value_title_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end,
		},
		{
			pass_type = "text",
			style_id = "current_value_title_text_shadow",
			text_id = "current_value_title_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end,
		},
		{
			pass_type = "text",
			style_id = "current_value_text",
			text_id = "current_value_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end,
		},
		{
			pass_type = "text",
			style_id = "current_value_text_shadow",
			text_id = "current_value_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end,
		},
		{
			pass_type = "text",
			style_id = "max_value_title_text",
			text_id = "max_value_title_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end,
		},
		{
			pass_type = "text",
			style_id = "max_value_title_text_shadow",
			text_id = "max_value_title_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end,
		},
		{
			pass_type = "text",
			style_id = "max_value_text",
			text_id = "max_value_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end,
		},
		{
			pass_type = "text",
			style_id = "max_value_text_shadow",
			text_id = "max_value_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end,
		},
		{
			pass_type = "text",
			style_id = "unlocked_text",
			text_id = "unlocked_text",
			content_check_function = function (content)
				return content.is_bought
			end,
		},
		{
			content_id = "hover",
			pass_type = "texture_uv",
			style_id = "hover",
		},
		{
			pass_type = "text",
			style_id = "set_progression",
			text_id = "set_progression",
			content_check_function = function (content)
				return content.is_part_of_set
			end,
		},
	}
	local content = {
		current_value_text = "10%",
		has_discount = false,
		icon = "icon_property_attack_speed",
		icon_background = "button_frame_01",
		icon_bought_frame = "frame_outer_glow_04_big",
		icon_discount_frame = "button_detail_discount_01",
		icon_hover_frame = "frame_outer_glow_04",
		is_bought = false,
		is_part_of_set = false,
		max_value_text = "20%",
		price_icon = "deus_icons_coin",
		price_text = "0",
		rarity_text = "",
		sub_text = "",
		title_text = "",
		button_hotspot = {},
		background = {
			texture_id = "shrine_blessing_bg",
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
		hover = {
			texture_id = "shrine_blessing_bg_hover",
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
		frame = {
			texture_id = "shrine_blessing_frame",
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
		size = size,
		current_value_title_text = Localize("deus_shrine_current_value"),
		max_value_title_text = Localize("deus_shrine_max_value"),
		unlocked_text = Localize("deus_shrine_unlocked"),
		bought_glow_style_ids = {
			"icon_bought_frame",
		},
	}
	local style = {
		debug = {
			masked = masked,
			color = {
				255,
				255,
				0,
				0,
			},
			offset = {
				-1,
				-1,
				8,
			},
			size = {
				3,
				3,
			},
		},
		icon_bought_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-39,
				0,
				2,
			},
			texture_size = {
				158,
				158,
			},
		},
		icon_discount_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
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
			texture_size = {
				80,
				80,
			},
		},
		icon_hover_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-24,
				0,
				3,
			},
			texture_size = {
				128,
				128,
			},
		},
		icon_background = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			texture_size = {
				80,
				80,
			},
			offset = {
				0,
				0,
				3,
			},
		},
		icon = icon,
		icon_disabled = icon_disabled,
		icon_bg = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				7,
				0,
				5,
			},
			texture_size = {
				66,
				66,
			},
		},
		background = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				0,
				0,
				0,
			},
			texture_size = size,
		},
		hover = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
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
			texture_size = size,
		},
		frame = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				0,
				0,
				2,
			},
			texture_size = size,
		},
		price_icon = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-90,
				68,
			},
			size = {
				20,
				20,
			},
		},
		price_text = price_text,
		price_text_shadow = price_text_shadow,
		price_text_disabled = price_text_disabled,
		title_text_disabled = title_text_disabled,
		title_text = title_text,
		title_text_shadow = title_text_shadow,
		rarity_text = rarity_text,
		rarity_text_shadow = rarity_text_shadow,
		sub_text_disabled = sub_text_disabled,
		sub_text = sub_text,
		sub_text_shadow = sub_text_shadow,
		current_value_title_text = current_value_title_text,
		current_value_title_text_shadow = current_value_title_text_shadow,
		current_value_text = current_value_text,
		current_value_text_shadow = current_value_text_shadow,
		max_value_title_text = max_value_title_text,
		max_value_title_text_shadow = max_value_title_text_shadow,
		max_value_text = max_value_text,
		max_value_text_shadow = max_value_text_shadow,
		unlocked_text = {
			dynamic_font_size = true,
			font_size = 24,
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				-130,
				40,
				3,
			},
			size = {
				120,
				30,
			},
		},
		set_progression = {
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			upper_case = false,
			vertical_alignment = "center",
			word_wrap = false,
			progression_colors = {
				incomplete = Colors.get_color_table_with_alpha("font_default", 255),
				complete = Colors.get_color_table_with_alpha("lime_green", 255),
			},
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			area_size = {
				250,
				22,
			},
			size = {
				250,
				22,
			},
			offset = {
				110,
				24,
				10,
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
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

local background_color = {
	255,
	25,
	21,
	36,
}
local background_wheel_color = {
	255,
	159,
	154,
	210,
}
local bottom_glow_back_smoke_color = {
	200,
	208,
	149,
	177,
}
local bottom_glow_front_smoke_color = {
	200,
	94,
	67,
	101,
}
local bottom_glow_front_2_smoke_color = {
	200,
	172,
	101,
	159,
}
local bottom_glow_back_ember_color = {
	130,
	250,
	212,
	251,
}
local disable_with_gamepad = true
local background_widgets = {
	console_cursor = UIWidgets.create_console_cursor("console_cursor"),
	window_frame = UIWidgets.create_frame("window_frame", scenegraph_definition.window.size, "menu_frame_11", 10),
	background_write_mask = UIWidgets.create_simple_texture("shrine_background_write_mask", "window"),
	background_wheel_01 = UIWidgets.create_simple_rotated_texture("shrine_circle_background_01", 0, {
		94,
		94,
	}, "background_wheel_01", nil, nil, background_wheel_color),
	background_wheel_02 = UIWidgets.create_simple_rotated_texture("shrine_circle_background_02", 0, {
		230.5,
		230.5,
	}, "background_wheel_02", nil, nil, background_wheel_color),
	background_wheel_03 = UIWidgets.create_simple_rotated_texture("shrine_circle_background_03", 0, {
		537,
		537,
	}, "background_wheel_03", nil, nil, background_wheel_color),
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
	top_corner_left = UIWidgets.create_simple_texture("athanor_decoration_corner", "top_corner_left"),
	bottom_corner_left = UIWidgets.create_simple_uv_texture("athanor_decoration_corner", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_corner_left"),
	options_background_edge = UIWidgets.create_simple_texture("shrine_sidebar_background", "options_background_edge"),
	options_background = UIWidgets.create_tiled_texture("options_background", "menu_frame_bg_01", {
		960,
		1080,
	}, nil, true, {
		255,
		120,
		120,
		120,
	}),
	options_background_mask = UIWidgets.create_simple_uv_texture("shrine_sidebar_write_mask", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "options_background_mask"),
	exit_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_close"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("deus_cursed_chest_title"), "title_text", nil, nil, title_text_style),
	chest_name_text = UIWidgets.create_simple_text(Localize("deus_cursed_chest_title"), "chest_name_text", nil, nil, chest_name_text_style),
	chest_lore_text = UIWidgets.create_simple_text(Localize("deus_cursed_chest_lore"), "chest_lore_text", nil, nil, chest_lore_text_style),
}

return {
	scenegraph_definition = scenegraph_definition,
	background_widgets = background_widgets,
	create_power_up_shop_item = create_power_up_shop_item,
}
