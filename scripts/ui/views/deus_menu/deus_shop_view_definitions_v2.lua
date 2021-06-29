require("scripts/ui/views/deus_menu/ui_widgets_deus")

local full_size = {
	1920,
	1080
}
local radu_offset = 200
local scenegraph_definition = {
	root = {
		is_root = true,
		size = full_size,
		position = {
			0,
			0,
			UILayer.default
		}
	},
	screen = {
		scale = "fit",
		size = full_size,
		position = {
			0,
			0,
			UILayer.default
		}
	},
	screen_center = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = full_size,
		position = {
			0,
			0,
			1
		}
	},
	window_overlay = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = full_size,
		position = {
			0,
			0,
			5
		}
	},
	window_frame = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = full_size,
		position = {
			0,
			0,
			30
		}
	},
	background_unit = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			full_size[1],
			full_size[2]
		},
		position = {
			0,
			0,
			3
		}
	},
	console_cursor = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			100
		}
	},
	bottom_glow = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			full_size[1],
			1200
		},
		position = {
			0,
			0,
			3
		}
	},
	bottom_glow_short = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			full_size[1],
			500
		},
		position = {
			0,
			0,
			4
		}
	},
	bottom_glow_shortest = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			full_size[1],
			200
		},
		position = {
			0,
			0,
			5
		}
	},
	background_wheel_01 = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = {
			188,
			188
		},
		position = {
			0.6666666666666666 * radu_offset,
			0,
			6
		}
	},
	background_wheel_02 = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = {
			461,
			461
		},
		position = {
			0.6666666666666666 * radu_offset,
			0,
			6
		}
	},
	background_wheel_03 = {
		vertical_alignment = "center",
		parent = "screen_center",
		horizontal_alignment = "center",
		size = {
			1074,
			1074
		},
		position = {
			0.6666666666666666 * radu_offset,
			0,
			6
		}
	},
	bottom_corner_left = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			110,
			110
		},
		position = {
			0,
			0,
			15
		}
	},
	options_background_mask = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			900,
			full_size[2]
		},
		position = {
			0,
			0,
			6
		}
	},
	options_background = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			900,
			full_size[2]
		},
		position = {
			0,
			0,
			6
		}
	},
	options_window_edge = {
		vertical_alignment = "center",
		parent = "options_background",
		horizontal_alignment = "right",
		size = {
			0,
			full_size[2]
		},
		position = {
			0,
			0,
			6
		}
	},
	options_background_edge = {
		vertical_alignment = "center",
		parent = "options_window_edge",
		horizontal_alignment = "right",
		size = {
			126,
			full_size[2]
		},
		position = {
			-443,
			0,
			1
		}
	},
	power_up_root = {
		vertical_alignment = "center",
		parent = "options_background",
		horizontal_alignment = "center",
		size = {
			484,
			194
		},
		position = {
			140,
			60,
			7
		}
	},
	blessing_root = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			484,
			194
		},
		position = {
			70 + radu_offset,
			60,
			10
		}
	},
	top_options_background = {
		vertical_alignment = "top",
		parent = "options_window_edge",
		horizontal_alignment = "right",
		size = {
			576,
			111
		},
		position = {
			0,
			0,
			10
		}
	},
	coins_text = {
		vertical_alignment = "center",
		parent = "top_options_background",
		horizontal_alignment = "center",
		size = {
			100,
			30
		},
		position = {
			40,
			20,
			1
		}
	},
	coins_icon = {
		vertical_alignment = "center",
		parent = "coins_text",
		horizontal_alignment = "left",
		size = {
			30,
			30
		},
		position = {
			-35,
			2,
			1
		}
	},
	bottom_options_background = {
		vertical_alignment = "bottom",
		parent = "options_window_edge",
		horizontal_alignment = "right",
		size = {
			576,
			111
		},
		position = {
			0,
			0,
			10
		}
	},
	bottom_text = {
		vertical_alignment = "bottom",
		parent = "bottom_options_background",
		horizontal_alignment = "center",
		size = {
			320,
			30
		},
		position = {
			0,
			20,
			1
		}
	},
	ready_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			300,
			60
		},
		position = {
			0,
			75,
			6
		}
	},
	timer_text = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			350,
			150
		},
		position = {
			0,
			-500,
			10
		}
	},
	player_pivot = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			75,
			-120,
			6
		}
	},
	player_1 = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			100,
			150,
			6
		}
	},
	player_2 = {
		vertical_alignment = "top",
		parent = "player_pivot",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			0,
			-220 * 0,
			1
		}
	},
	player_3 = {
		vertical_alignment = "top",
		parent = "player_pivot",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			0,
			-220,
			1
		}
	},
	player_4 = {
		vertical_alignment = "top",
		parent = "player_pivot",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			0,
			-440,
			1
		}
	},
	title_background = {
		vertical_alignment = "center",
		parent = "window_overlay",
		horizontal_alignment = "center",
		size = {
			400,
			150
		},
		position = {
			0 + 0.6666666666666666 * radu_offset,
			0,
			3
		}
	},
	shrine_title_text = {
		vertical_alignment = "center",
		parent = "title_background",
		horizontal_alignment = "center",
		size = {
			400,
			50
		},
		position = {
			0,
			50,
			4
		}
	},
	shrine_sub_title_text = {
		vertical_alignment = "top",
		parent = "shrine_title_text",
		horizontal_alignment = "center",
		size = {
			400,
			100
		},
		position = {
			0,
			-50,
			4
		}
	}
}
local shrine_title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = true,
	font_size = 42,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local shrine_sub_title_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = true,
	use_shadow = true,
	font_size = 22,
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
local coins_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 28,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local bottom_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_frame(scenegraph_id, alpha)
	alpha = alpha or 255
	local frame_settings = UIFrameSettings.frame_outer_fade_02
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local size = scenegraph_definition[scenegraph_id].size
	local frame_size = {
		size[1] + edge_height * 2,
		size[2] + edge_height * 2
	}
	frame_size = {
		frame_size[1],
		frame_size[2]
	}
	local frame_offset = {
		-edge_height,
		-edge_height,
		0
	}
	frame_offset = {
		frame_offset[1] + 1,
		frame_offset[2]
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					style_id = "rect",
					pass_type = "rect",
					retained_mode = false
				}
			}
		},
		content = {
			frame = frame_settings.texture
		},
		style = {
			frame = {
				color = Colors.get_color_table_with_alpha("black", alpha),
				size = frame_size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = frame_offset
			},
			rect = {
				color = Colors.get_color_table_with_alpha("black", alpha),
				offset = {
					0,
					0,
					0
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local coins_icon = {
	offset = {
		10,
		-30,
		0
	},
	texture_size = {
		20,
		20
	}
}

local function create_player_texts(scenegraph_id)
	local name_text = {
		vertical_alignment = "center",
		horizontal_alignment = "left",
		dynamic_font_size = true,
		font_size = 24,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			10,
			0,
			0
		},
		size = {
			180,
			24
		}
	}
	local name_text_shadow = table.clone(name_text)
	name_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	name_text_shadow.offset = {
		name_text.offset[1] + 2,
		name_text.offset[2] - 2,
		name_text.offset[3] - 1
	}
	local coins_text = {
		vertical_alignment = "center",
		horizontal_alignment = "left",
		dynamic_font_size = true,
		font_size = 26,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			coins_icon.offset[1] + coins_icon.texture_size[1] + 5,
			coins_icon.offset[2] - 1,
			coins_icon.offset[3]
		},
		size = {
			100,
			20
		}
	}
	local coins_text_shadow = table.clone(coins_text)
	coins_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	coins_text_shadow.offset = {
		coins_text.offset[1] + 2,
		coins_text.offset[2] - 2,
		coins_text.offset[3] - 1
	}

	return {
		element = {
			passes = {
				{
					style_id = "name_text",
					pass_type = "text",
					text_id = "name_text",
					content_check_function = function (content)
						return content.visible
					end
				},
				{
					style_id = "name_text_shadow",
					pass_type = "text",
					text_id = "name_text",
					content_check_function = function (content)
						return content.visible
					end
				},
				{
					style_id = "coins_text",
					pass_type = "text",
					text_id = "coins_text",
					content_check_function = function (content)
						return content.visible
					end
				},
				{
					style_id = "coins_text_shadow",
					pass_type = "text",
					text_id = "coins_text",
					content_check_function = function (content)
						return content.visible
					end
				},
				{
					pass_type = "texture",
					style_id = "coins_icon",
					texture_id = "coins_icon",
					content_check_function = function (content)
						return content.visible
					end
				}
			}
		},
		content = {
			visible = true,
			coins_text = "0",
			name_text = "",
			coins_icon = "deus_icons_coin"
		},
		style = {
			name_text = name_text,
			name_text_shadow = name_text_shadow,
			coins_text = coins_text,
			coins_text_shadow = coins_text_shadow,
			coins_icon = coins_icon
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_power_up_shop_item(scenegraph_id, size, masked, is_rectangular_icon)
	local background_color = {
		255,
		255,
		255,
		255
	}
	local icon = {
		vertical_alignment = "center",
		horizontal_alignment = "left",
		masked = masked,
		color = {
			255,
			138,
			172,
			235
		},
		offset = {
			7,
			0,
			5
		},
		texture_size = {
			66,
			66
		}
	}
	local icon_disabled = table.clone(icon)
	icon_disabled.color = {
		255,
		80,
		80,
		80
	}
	local title_text = {
		font_size = 20,
		upper_case = true,
		word_wrap = true,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		dynamic_font_size = true,
		color = {
			150,
			255,
			0,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			100,
			size[2] - 70,
			3
		},
		size = {
			size[1] - 260,
			30
		}
	}
	local title_text_disabled = table.clone(title_text)
	title_text_disabled.text_color = {
		255,
		100,
		100,
		100
	}
	local title_text_shadow = table.clone(title_text)
	title_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	title_text_shadow.offset = {
		title_text.offset[1] + 2,
		title_text.offset[2] - 2,
		title_text.offset[3] - 1
	}
	local rarity_text = {
		font_size = 20,
		word_wrap = true,
		horizontal_alignment = "right",
		vertical_alignment = "center",
		dynamic_font_size = true,
		color = {
			150,
			255,
			0,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			325,
			size[2] - 70,
			3
		},
		size = {
			100,
			30
		}
	}
	local rarity_text_shadow = table.clone(rarity_text)
	rarity_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	rarity_text_shadow.offset = {
		rarity_text.offset[1] + 2,
		rarity_text.offset[2] - 2,
		rarity_text.offset[3] - 1
	}
	local sub_text = {
		font_size = 18,
		word_wrap = true,
		dynamic_font_size_word_wrap = true,
		horizontal_alignment = "left",
		vertical_alignment = "top",
		color = {
			150,
			0,
			255,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			100,
			size[2] - 167,
			3
		},
		size = {
			size[1] - 160,
			100
		}
	}
	local sub_text_disabled = table.clone(sub_text)
	sub_text_disabled.text_color = {
		255,
		80,
		80,
		80
	}
	local sub_text_shadow = table.clone(sub_text)
	sub_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	sub_text_shadow.offset = {
		sub_text.offset[1] + 2,
		sub_text.offset[2] - 2,
		sub_text.offset[3] - 1
	}
	local price_text = {
		font_size = 22,
		word_wrap = true,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		dynamic_font_size = true,
		color = {
			150,
			255,
			0,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			-66,
			70,
			3
		},
		size = {
			55,
			20
		},
		color_override = {},
		color_override_table = {
			start_index = 0,
			end_index = 0,
			color = {
				255,
				121,
				193,
				229
			}
		}
	}
	local price_text_disabled = table.clone(price_text)
	price_text_disabled.text_color = Colors.get_color_table_with_alpha("red", 255)
	local price_text_shadow = table.clone(price_text)
	price_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	price_text_shadow.offset = {
		price_text.offset[1] + 2,
		price_text.offset[2] - 2,
		price_text.offset[3] - 1
	}
	local current_value_title_text = {
		font_size = 18,
		word_wrap = true,
		horizontal_alignment = "right",
		vertical_alignment = "center",
		dynamic_font_size = true,
		color = {
			150,
			255,
			0,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = {
			255,
			150,
			150,
			150
		},
		offset = {
			-155,
			40,
			3
		},
		size = {
			80,
			20
		}
	}
	local current_value_title_text_shadow = table.clone(current_value_title_text)
	current_value_title_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	current_value_title_text_shadow.offset = {
		current_value_title_text.offset[1] + 2,
		current_value_title_text.offset[2] - 2,
		current_value_title_text.offset[3] - 1
	}
	local current_value_text = {
		font_size = 18,
		word_wrap = true,
		horizontal_alignment = "right",
		vertical_alignment = "center",
		dynamic_font_size = true,
		color = {
			150,
			255,
			0,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			-60,
			40,
			3
		},
		size = {
			30,
			20
		}
	}
	local current_value_text_shadow = table.clone(current_value_text)
	current_value_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	current_value_text_shadow.offset = {
		current_value_text.offset[1] + 2,
		current_value_text.offset[2] - 2,
		current_value_text.offset[3] - 1
	}
	local max_value_title_text = table.clone(current_value_title_text)
	max_value_title_text.offset[2] = 15
	local max_value_title_text_shadow = table.clone(max_value_title_text)
	max_value_title_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	max_value_title_text_shadow.offset = {
		max_value_title_text.offset[1] + 2,
		max_value_title_text.offset[2] - 2,
		max_value_title_text.offset[3] - 1
	}
	local max_value_text = table.clone(current_value_text)
	max_value_text.offset[2] = 15
	max_value_text.text_color = Colors.get_color_table_with_alpha("font_title", 255)
	local max_value_text_shadow = table.clone(max_value_text)
	max_value_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	max_value_text_shadow.offset = {
		max_value_text.offset[1] + 2,
		max_value_text.offset[2] - 2,
		max_value_text.offset[3] - 1
	}
	local passes = {
		{
			pass_type = "hotspot",
			content_id = "button_hotspot"
		},
		{
			style_id = "background",
			pass_type = "texture_uv",
			content_id = "background"
		},
		{
			style_id = "frame",
			pass_type = "texture_uv",
			content_id = "frame"
		},
		{
			pass_type = "texture",
			style_id = "icon_bought_frame",
			texture_id = "icon_bought_frame"
		},
		{
			pass_type = "texture",
			style_id = "loading_frame",
			texture_id = "loading_frame",
			content_check_function = function (content)
				return not content.is_bought and not content.button_hotspot.disable_button
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_discount_frame",
			texture_id = "icon_discount_frame",
			content_check_function = function (content)
				return content.has_discount
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_hover_frame",
			texture_id = "icon_hover_frame"
		},
		{
			pass_type = "texture",
			style_id = "icon_background",
			texture_id = "icon_background"
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return content.is_bought or not content.button_hotspot.disable_button
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_disabled",
			texture_id = "icon",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end
		},
		{
			style_id = "sub_text_disabled",
			pass_type = "text",
			text_id = "sub_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end
		},
		{
			style_id = "sub_text",
			pass_type = "text",
			text_id = "sub_text",
			content_check_function = function (content)
				return content.is_bought or not content.button_hotspot.disable_button
			end
		},
		{
			style_id = "sub_text_shadow",
			pass_type = "text",
			text_id = "sub_text"
		},
		{
			style_id = "title_text_disabled",
			pass_type = "text",
			text_id = "title_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end
		},
		{
			style_id = "title_text",
			pass_type = "text",
			text_id = "title_text",
			content_check_function = function (content)
				return content.is_bought or not content.button_hotspot.disable_button
			end
		},
		{
			style_id = "title_text_shadow",
			pass_type = "text",
			text_id = "title_text"
		},
		{
			style_id = "rarity_text",
			pass_type = "text",
			text_id = "rarity_text"
		},
		{
			style_id = "rarity_text_shadow",
			pass_type = "text",
			text_id = "rarity_text"
		},
		{
			style_id = "price_text",
			pass_type = "text",
			text_id = "price_text",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button and not content.is_bought
			end
		},
		{
			style_id = "price_text_disabled",
			pass_type = "text",
			text_id = "price_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end
		},
		{
			style_id = "price_text_shadow",
			pass_type = "text",
			text_id = "price_text",
			content_check_function = function (content)
				return not content.is_bought
			end
		},
		{
			pass_type = "texture",
			style_id = "price_icon",
			texture_id = "price_icon",
			content_check_function = function (content)
				return not content.is_bought
			end
		},
		{
			style_id = "current_value_title_text",
			pass_type = "text",
			text_id = "current_value_title_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end
		},
		{
			style_id = "current_value_title_text_shadow",
			pass_type = "text",
			text_id = "current_value_title_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end
		},
		{
			style_id = "current_value_text",
			pass_type = "text",
			text_id = "current_value_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end
		},
		{
			style_id = "current_value_text_shadow",
			pass_type = "text",
			text_id = "current_value_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end
		},
		{
			style_id = "max_value_title_text",
			pass_type = "text",
			text_id = "max_value_title_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end
		},
		{
			style_id = "max_value_title_text_shadow",
			pass_type = "text",
			text_id = "max_value_title_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end
		},
		{
			style_id = "max_value_text",
			pass_type = "text",
			text_id = "max_value_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end
		},
		{
			style_id = "max_value_text_shadow",
			pass_type = "text",
			text_id = "max_value_text",
			content_check_function = function (content)
				return not content.is_bought and content.current_value_text and content.max_value_text
			end
		},
		{
			style_id = "unlocked_text",
			pass_type = "text",
			text_id = "unlocked_text",
			content_check_function = function (content)
				return content.is_bought
			end
		},
		{
			style_id = "hover",
			pass_type = "texture_uv",
			content_id = "hover"
		}
	}
	local content = {
		price_icon = "deus_icons_coin",
		icon_discount_frame = "menu_frame_12_gold",
		loading_frame = "deus_shop_square_gradient",
		icon_hover_frame = "frame_outer_glow_04",
		icon_background = "button_frame_01",
		is_bought = false,
		title_text = "",
		icon_bought_frame = "frame_outer_glow_04_big",
		icon = "icon_property_attack_speed",
		current_value_text = "10%",
		has_discount = false,
		max_value_text = "20%",
		sub_text = "",
		price_text = "0",
		rarity_text = "",
		has_buying_animation_played = false,
		button_hotspot = {},
		background = {
			texture_id = "shrine_blessing_bg",
			uvs = {
				{
					1,
					0
				},
				{
					0,
					1
				}
			}
		},
		hover = {
			texture_id = "shrine_blessing_bg_hover",
			uvs = {
				{
					1,
					0
				},
				{
					0,
					1
				}
			}
		},
		frame = {
			texture_id = "shrine_blessing_frame",
			uvs = {
				{
					1,
					0
				},
				{
					0,
					1
				}
			}
		},
		size = size,
		current_value_title_text = Localize("deus_shrine_current_value"),
		max_value_title_text = Localize("deus_shrine_max_value"),
		unlocked_text = Localize("deus_shrine_unlocked"),
		bought_glow_style_ids = {
			"icon_bought_frame"
		}
	}
	local style = {
		icon_bought_frame = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			masked = masked,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-39,
				0,
				2
			},
			texture_size = {
				158,
				158
			}
		},
		loading_frame = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			masked = masked,
			color = {
				0,
				255,
				152,
				15
			},
			offset = {
				-6,
				0,
				3
			},
			texture_size = {
				92,
				92
			}
		},
		icon_discount_frame = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			masked = masked,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				6
			},
			texture_size = {
				80,
				80
			}
		},
		icon_hover_frame = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			masked = masked,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-24,
				0,
				3
			},
			texture_size = {
				128,
				128
			}
		},
		icon_background = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			masked = masked,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				3
			},
			texture_size = {
				80,
				80
			}
		},
		icon = icon,
		icon_disabled = icon_disabled,
		background = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				0,
				0,
				0
			},
			texture_size = size
		},
		hover = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			masked = masked,
			color = {
				0,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				1
			},
			texture_size = size
		},
		frame = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				0,
				0,
				2
			},
			texture_size = size
		},
		price_icon = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-90,
				68
			},
			size = {
				20,
				20
			}
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
			font_size = 24,
			upper_case = true,
			word_wrap = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font_size = true,
			color = {
				150,
				255,
				0,
				0
			},
			font_type = (masked and "hell_shark_masked") or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				-130,
				40,
				3
			},
			size = {
				120,
				30
			}
		}
	}
	local widget = {}
	local element = {
		passes = passes
	}
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_blessing_shop_item(scenegraph_id, size, masked)
	local background_color = {
		255,
		255,
		255,
		255
	}
	local icon = {
		vertical_alignment = "center",
		horizontal_alignment = "right",
		masked = masked,
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			-1,
			-1,
			4
		},
		texture_size = {
			90,
			90
		}
	}
	local icon_disabled = table.clone(icon)
	icon_disabled.color = {
		255,
		80,
		80,
		80
	}
	local title_text = {
		font_size = 26,
		upper_case = true,
		word_wrap = true,
		horizontal_alignment = "right",
		vertical_alignment = "center",
		dynamic_font_size = true,
		color = {
			150,
			255,
			0,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			60,
			size[2] - 58,
			3
		},
		size = {
			size[1] - 160,
			40
		}
	}
	local title_text_disabled = table.clone(title_text)
	title_text_disabled.text_color = {
		255,
		100,
		100,
		100
	}
	local title_text_shadow = table.clone(title_text)
	title_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	title_text_shadow.offset = {
		title_text.offset[1] + 2,
		title_text.offset[2] - 2,
		title_text.offset[3] - 1
	}
	local sub_text = {
		font_size = 18,
		word_wrap = true,
		dynamic_font_size_word_wrap = true,
		horizontal_alignment = "right",
		vertical_alignment = "top",
		color = {
			150,
			0,
			255,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			55,
			size[2] - 173,
			3
		},
		size = {
			size[1] - 155,
			120
		}
	}
	local sub_text_disabled = table.clone(sub_text)
	sub_text_disabled.text_color = {
		255,
		80,
		80,
		80
	}
	local sub_text_shadow = table.clone(sub_text)
	sub_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	sub_text_shadow.offset = {
		sub_text.offset[1] + 2,
		sub_text.offset[2] - 2,
		sub_text.offset[3] - 1
	}
	local price_text = {
		font_size = 22,
		word_wrap = true,
		horizontal_alignment = "right",
		vertical_alignment = "center",
		dynamic_font_size = true,
		color = {
			150,
			255,
			0,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			size[1] + 12,
			88,
			3
		},
		size = {
			55,
			20
		}
	}
	local price_text_disabled = table.clone(price_text)
	price_text_disabled.text_color = Colors.get_color_table_with_alpha("red", 255)
	local price_text_shadow = table.clone(price_text)
	price_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	price_text_shadow.offset = {
		price_text.offset[1] + 2,
		price_text.offset[2] - 2,
		price_text.offset[3] - 1
	}
	local shared_text = {
		font_size = 18,
		upper_case = true,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		dynamic_font_size = true,
		color = {
			150,
			255,
			0,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			price_text.offset[1],
			price_text.offset[2] - 35,
			3
		},
		size = {
			80,
			30
		}
	}
	local shared_text_shadow = table.clone(shared_text)
	shared_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	shared_text_shadow.offset = {
		shared_text.offset[1] + 2,
		shared_text.offset[2] - 2,
		shared_text.offset[3] - 1
	}
	local bought_by_text = {
		font_size = 26,
		upper_case = true,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		dynamic_font_size = true,
		color = {
			150,
			255,
			0,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			size[1] + 10,
			40,
			3
		},
		size = {
			100,
			26
		}
	}
	local bought_by_text_shadow = table.clone(bought_by_text)
	bought_by_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	bought_by_text_shadow.offset = {
		bought_by_text.offset[1] + 2,
		bought_by_text.offset[2] - 2,
		bought_by_text.offset[3] - 1
	}
	local player_name_text = {
		font_size = 26,
		upper_case = true,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		dynamic_font_size = true,
		color = {
			150,
			255,
			0,
			0
		},
		font_type = (masked and "hell_shark_masked") or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("yellow", 255),
		offset = {
			size[1] + 10,
			18,
			3
		},
		size = {
			200,
			26
		}
	}
	local player_name_text_shadow = table.clone(player_name_text)
	player_name_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	player_name_text_shadow.offset = {
		player_name_text.offset[1] + 2,
		player_name_text.offset[2] - 2,
		player_name_text.offset[3] - 1
	}
	local portrait_offset = {
		496,
		80,
		9
	}
	local passes = {
		{
			pass_type = "hotspot",
			content_id = "button_hotspot"
		},
		{
			style_id = "background",
			pass_type = "texture_uv",
			content_id = "background"
		},
		{
			style_id = "frame",
			pass_type = "texture_uv",
			content_id = "frame"
		},
		{
			style_id = "frame_glow",
			pass_type = "texture_uv",
			content_id = "frame_glow"
		},
		{
			pass_type = "texture",
			style_id = "icon_bought_frame",
			texture_id = "icon_bought_frame"
		},
		{
			pass_type = "texture",
			style_id = "loading_frame",
			texture_id = "loading_frame",
			content_check_function = function (content)
				return not content.is_bought and not content.button_hotspot.disable_button
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_hover_frame",
			texture_id = "icon_hover_frame"
		},
		{
			pass_type = "texture",
			style_id = "icon_background",
			texture_id = "icon_background"
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return content.is_bought or not content.button_hotspot.disable_button
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_disabled",
			texture_id = "icon",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end
		},
		{
			style_id = "sub_text_disabled",
			pass_type = "text",
			text_id = "sub_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end
		},
		{
			style_id = "sub_text",
			pass_type = "text",
			text_id = "sub_text",
			content_check_function = function (content)
				return content.is_bought or not content.button_hotspot.disable_button
			end
		},
		{
			style_id = "sub_text_shadow",
			pass_type = "text",
			text_id = "sub_text"
		},
		{
			style_id = "shared_text",
			pass_type = "text",
			text_id = "shared_text",
			content_check_function = function (content)
				return not content.is_bought
			end
		},
		{
			style_id = "shared_text_shadow",
			pass_type = "text",
			text_id = "shared_text",
			content_check_function = function (content)
				return not content.is_bought
			end
		},
		{
			style_id = "title_text_disabled",
			pass_type = "text",
			text_id = "title_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end
		},
		{
			style_id = "title_text",
			pass_type = "text",
			text_id = "title_text",
			content_check_function = function (content)
				return content.is_bought or not content.button_hotspot.disable_button
			end
		},
		{
			style_id = "title_text_shadow",
			pass_type = "text",
			text_id = "title_text"
		},
		{
			style_id = "price_text",
			pass_type = "text",
			text_id = "price_text",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button and not content.is_bought
			end
		},
		{
			style_id = "price_text_disabled",
			pass_type = "text",
			text_id = "price_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button and not content.is_bought
			end
		},
		{
			style_id = "price_text_shadow",
			pass_type = "text",
			text_id = "price_text",
			content_check_function = function (content)
				return not content.is_bought
			end
		},
		{
			pass_type = "texture",
			style_id = "price_icon",
			texture_id = "price_icon",
			content_check_function = function (content)
				return not content.is_bought
			end
		},
		{
			style_id = "bought_by_text",
			pass_type = "text",
			text_id = "bought_by_text",
			content_check_function = function (content)
				return content.is_bought
			end
		},
		{
			style_id = "bought_by_text_shadow",
			pass_type = "text",
			text_id = "bought_by_text",
			content_check_function = function (content)
				return content.is_bought
			end
		},
		{
			style_id = "player_name_text",
			pass_type = "text",
			text_id = "player_name_text",
			content_check_function = function (content)
				return content.is_bought
			end
		},
		{
			style_id = "player_name_text_shadow",
			pass_type = "text",
			text_id = "player_name_text",
			content_check_function = function (content)
				return content.is_bought
			end
		},
		{
			pass_type = "texture",
			style_id = "character_portrait",
			texture_id = "character_portrait",
			content_check_function = function (content)
				return content.is_bought
			end
		},
		{
			style_id = "hover",
			pass_type = "texture_uv",
			content_id = "hover"
		}
	}
	local content = {
		price_icon = "deus_icons_coin",
		loading_frame = "deus_shop_circular_gradient",
		icon_background = "button_round_bg",
		icon_hover_frame = "button_round_highlight",
		title_text = "",
		sub_text = "",
		icon_bought_frame = "button_round_bought",
		player_name_text = "",
		icon = "blessing_abundance_02",
		character_portrait = "unit_frame_portrait_default",
		price_text = "9001",
		is_bought = false,
		has_buying_animation_played = false,
		button_hotspot = {},
		background = {
			texture_id = "shrine_blessing_bg",
			uvs = {
				{
					0,
					0
				},
				{
					1,
					1
				}
			}
		},
		hover = {
			texture_id = "shrine_blessing_bg_hover",
			uvs = {
				{
					0,
					0
				},
				{
					1,
					1
				}
			}
		},
		frame = {
			texture_id = "shrine_blessing_frame",
			uvs = {
				{
					0,
					0
				},
				{
					1,
					1
				}
			}
		},
		frame_glow = {
			texture_id = "athanor_entry_trait_glow",
			uvs = {
				{
					1,
					0
				},
				{
					0,
					1
				}
			}
		},
		bought_glow_style_ids = {
			"icon_bought_frame",
			"frame_glow"
		},
		size = size,
		shared_text = Localize("deus_blessing_shared"),
		bought_by_text = Localize("deus_shrine_buyer_title_text")
	}
	local style = {
		icon_bought_frame = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			masked = masked,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				50,
				-3,
				2
			},
			texture_size = {
				190,
				190
			}
		},
		loading_frame = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			masked = masked,
			color = {
				0,
				255,
				152,
				15
			},
			offset = {
				9,
				0,
				3
			},
			texture_size = {
				110,
				110
			}
		},
		icon_hover_frame = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			masked = masked,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				3,
				0,
				2
			},
			texture_size = {
				98,
				98
			}
		},
		icon_background = {
			vertical_alignment = "center",
			horizontal_alignment = "right",
			masked = masked,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-8,
				0,
				3
			},
			texture_size = {
				75,
				75
			}
		},
		icon = icon,
		icon_disabled = icon_disabled,
		background = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				0,
				0,
				0
			},
			texture_size = size
		},
		hover = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			masked = masked,
			color = {
				0,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				1
			},
			texture_size = size
		},
		frame = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				0,
				0,
				2
			},
			texture_size = size
		},
		frame_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			masked = masked,
			color = background_color,
			offset = {
				22,
				0,
				2
			},
			texture_size = {
				54,
				165
			}
		},
		price_icon = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] + 10,
				88,
				3
			},
			size = {
				20,
				20
			}
		},
		price_text = price_text,
		price_text_shadow = price_text_shadow,
		price_text_disabled = price_text_disabled,
		bought_by_text = bought_by_text,
		bought_by_text_shadow = bought_by_text_shadow,
		player_name_text = player_name_text,
		player_name_text_shadow = player_name_text_shadow,
		shared_text = shared_text,
		shared_text_shadow = shared_text_shadow,
		title_text_disabled = title_text_disabled,
		title_text = title_text,
		title_text_shadow = title_text_shadow,
		sub_text_disabled = sub_text_disabled,
		sub_text = sub_text,
		sub_text_shadow = sub_text_shadow,
		character_portrait = {
			size = {
				86,
				108
			},
			offset = portrait_offset,
			color = {
				255,
				255,
				255,
				255
			}
		}
	}
	local widget = {}
	local element = {
		passes = passes
	}
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_token_holder(scenegraph_id, size)
	local token_icon_size = 40
	local vertical_offset = 25
	local horizontal_offset = 45

	return {
		scenegraph_id = scenegraph_id,
		offset = {
			10,
			0,
			20
		},
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "token_icon_1",
					texture_id = "token_icon_1",
					content_check_function = function (content)
						return content.token_icon_1
					end
				},
				{
					pass_type = "texture",
					style_id = "token_icon_2",
					texture_id = "token_icon_2",
					content_check_function = function (content)
						return content.token_icon_2
					end
				},
				{
					pass_type = "texture",
					style_id = "token_icon_3",
					texture_id = "token_icon_3",
					content_check_function = function (content)
						return content.token_icon_3
					end
				},
				{
					pass_type = "texture",
					style_id = "token_icon_4",
					texture_id = "token_icon_4",
					content_check_function = function (content)
						return content.token_icon_4
					end
				}
			}
		},
		content = {},
		style = {
			token_icon_1 = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
				texture_size = {
					token_icon_size,
					token_icon_size
				},
				offset = {
					0,
					vertical_offset,
					0
				}
			},
			token_icon_2 = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
				texture_size = {
					token_icon_size,
					token_icon_size
				},
				offset = {
					0,
					-vertical_offset,
					0
				}
			},
			token_icon_3 = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
				texture_size = {
					token_icon_size,
					token_icon_size
				},
				offset = {
					-horizontal_offset,
					vertical_offset,
					0
				}
			},
			token_icon_4 = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
				texture_size = {
					token_icon_size,
					token_icon_size
				},
				offset = {
					-horizontal_offset,
					-vertical_offset,
					0
				}
			}
		}
	}
end

local function create_timer_widget(scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					retained_mode = false,
					content_check_function = function (content)
						return content.text
					end
				}
			}
		},
		content = {},
		style = {
			text = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				localize = false,
				font_size = 28,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					1
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local bottom_glow_back_ember_color = {
	130,
	215,
	150,
	0
}
local background_color = {
	255,
	25,
	21,
	36
}
local background_wheel_color = {
	255,
	159,
	154,
	210
}
local bottom_glow_back_smoke_color = {
	200,
	208,
	149,
	177
}
local bottom_glow_front_smoke_color = {
	200,
	94,
	67,
	101
}
local bottom_glow_front_2_smoke_color = {
	200,
	172,
	101,
	159
}
local bottom_glow_back_ember_color = {
	130,
	250,
	212,
	251
}
local widgets = {
	background_write_mask = UIWidgets.create_simple_texture("shrine_background_write_mask", "screen"),
	background_wheel_01 = UIWidgets.create_simple_rotated_texture("shrine_circle_background_01", 0, {
		94,
		94
	}, "background_wheel_01", nil, nil, background_wheel_color),
	background_wheel_02 = UIWidgets.create_simple_rotated_texture("shrine_circle_background_02", 0, {
		230.5,
		230.5
	}, "background_wheel_02", nil, nil, background_wheel_color),
	background_wheel_03 = UIWidgets.create_simple_rotated_texture("shrine_circle_background_03", 0, {
		537,
		537
	}, "background_wheel_03", nil, nil, background_wheel_color),
	bottom_glow_smoke_1 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_smoke_1", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_glow", nil, nil, bottom_glow_back_smoke_color),
	bottom_glow_smoke_2 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_smoke_2", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_glow_short", nil, nil, bottom_glow_front_smoke_color),
	bottom_glow_smoke_3 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_2", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_glow_shortest", nil, nil, bottom_glow_front_2_smoke_color),
	bottom_glow_embers_1 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_1", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_glow", nil, nil, bottom_glow_back_ember_color, 1),
	bottom_glow_embers_3 = UIWidgets.create_simple_uv_texture("forge_overview_bottom_glow_effect_embers_3", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_glow_short", nil, nil, bottom_glow_back_ember_color, 1),
	screen_background = UIWidgets.create_simple_rect("screen", {
		255,
		0,
		0,
		0
	}),
	window_background = UIWidgets.create_simple_rect("window", background_color),
	bottom_corner_left = UIWidgets.create_simple_uv_texture("athanor_decoration_corner", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_corner_left"),
	top_options_background = UIWidgets.create_simple_texture("athanor_decoration_headline", "top_options_background"),
	options_background_edge = UIWidgets.create_simple_texture("shrine_sidebar_background", "options_background_edge"),
	options_background = UIWidgets.create_tiled_texture("options_background", "menu_frame_bg_01", {
		960,
		1080
	}, nil, true, {
		255,
		120,
		120,
		120
	}),
	options_background_mask = UIWidgets.create_simple_uv_texture("shrine_sidebar_write_mask", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "options_background_mask"),
	options_background_bottom = UIWidgets.create_simple_uv_texture("athanor_decoration_headline", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_options_background"),
	bottom_text = UIWidgets.create_simple_text(nil, "bottom_text", nil, nil, bottom_text_style, nil, nil, true),
	ready_button = UIWidgets.create_default_button("ready_button", scenegraph_definition.ready_button.size, nil, nil, nil, 26, nil, "button_detail_02", nil, nil),
	ready_button_tokens = create_token_holder("ready_button", scenegraph_definition.ready_button.size),
	coins_icon = UIWidgets.create_simple_texture("deus_icons_coin", "coins_icon"),
	coins_text = UIWidgets.create_simple_text("0", "coins_text", nil, nil, coins_text_style),
	screen_overlay = UIWidgets.create_simple_rect("blessing_root", {
		0,
		255,
		10,
		10
	})
}
local top_widgets = {
	console_cursor = UIWidgets.create_console_cursor("console_cursor"),
	title_background = create_frame("title_background", 80),
	shrine_title_text = UIWidgets.create_simple_text("deus_shrine", "shrine_title_text", nil, nil, shrine_title_text_style),
	shrine_sub_title_text = UIWidgets.create_simple_text("deus_shrine_description", "shrine_sub_title_text", nil, nil, shrine_sub_title_text_style),
	timer_text = create_timer_widget("timer_text")
}
local player_widgets = {}
local player_widget_size = {
	0,
	0
}
local spacing_x = 300
local player_widget_initial_offset = {
	200,
	80
}
local player_texts_offset = {
	70,
	80
}
local player_amount = 4
local portraits_pos = {
	0,
	-55,
	1
}
local texts_pos = {
	50,
	20,
	0
}

for i = 1, player_amount, 1 do
	local num_player_widgets = i - 1
	local position = {
		player_widget_initial_offset[1] + (spacing_x + player_widget_size[1]) * num_player_widgets,
		player_widget_initial_offset[2],
		1
	}
	local portrait_scenegraph_id = "player_portrait_" .. i
	scenegraph_definition[portrait_scenegraph_id] = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		parent = "player_" .. i,
		size = {
			0,
			0
		},
		position = portraits_pos
	}
	local portrait_widget = UIWidgets.create_deus_player_status_portrait(portrait_scenegraph_id, nil, "")
	player_widgets[portrait_scenegraph_id] = portrait_widget
	local text_scenegraph_id = "player_texts_" .. i
	scenegraph_definition[text_scenegraph_id] = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		parent = "player_" .. i,
		size = {
			0,
			0
		},
		position = texts_pos
	}
	local text_widget = create_player_texts(text_scenegraph_id)
	player_widgets[text_scenegraph_id] = text_widget
end

local function create_blessing_portraits_frame(scenegraph_id, frame_settings_name, level_text, retained_mode, offset)
	local retained_mode = retained_mode
	local scenegraph_id = scenegraph_id
	local widget = {
		element = {
			passes = {}
		},
		content = {},
		style = {}
	}
	local frame_settings = UIPlayerPortraitFrameSettings[frame_settings_name]
	local default_color = {
		255,
		255,
		255,
		255
	}
	local default_offset = offset or {
		0,
		0,
		0
	}
	widget.content.frame_settings_name = frame_settings_name
	widget.content.is_bought = false

	for index, data in ipairs(frame_settings) do
		local name = "texture_" .. index
		local texture_name = data.texture or "icons_placeholder"
		local size = nil

		if UIAtlasHelper.has_atlas_settings_by_texture_name(texture_name) then
			local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
			size = texture_settings.size
		else
			size = data.size
		end

		size = (size and table.clone(size)) or {
			0,
			0
		}
		local offset = {}

		if data.offset then
			offset = table.clone(data.offset)
			offset[1] = default_offset[1] + -(size[1] / 2) + offset[1]
			offset[2] = default_offset[2] + 60 + offset[2]
			offset[3] = data.layer or 0
		else
			offset = table.clone(default_offset)
			offset[1] = -(size[1] / 2) + offset[1]
			offset[2] = offset[2]
			offset[3] = data.layer or 0
		end

		widget.element.passes[#widget.element.passes + 1] = {
			pass_type = "texture",
			texture_id = name,
			style_id = name,
			retained_mode = retained_mode,
			content_check_function = function (content)
				return content.is_bought
			end
		}
		widget.content[name] = texture_name
		widget.style[name] = {
			color = data.color or default_color,
			offset = offset,
			size = size
		}
	end

	local portrait_size = {
		portrait_size[1],
		portrait_size[2]
	}
	local level_offset = {
		default_offset[1] - 15,
		default_offset[2],
		default_offset[3] + 1
	}
	local level_name = "level"
	widget.element.passes[#widget.element.passes + 1] = {
		pass_type = "text",
		text_id = level_name,
		style_id = level_name,
		retained_mode = retained_mode,
		content_check_function = function (content)
			return content.is_bought
		end
	}
	widget.content[level_name] = level_text
	widget.style[level_name] = {
		vertical_alignment = "center",
		font_type = "hell_shark",
		font_size = 12,
		horizontal_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = level_offset,
		size = {
			30,
			20
		}
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

animations_definitions = {
	flash_icon = {
		{
			name = "flash_icon",
			start_progress = 0,
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.content.has_buying_animation_played = true
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local style = widgets.style
				local flash_value = 60 * math.sin(10 * Managers.time:time("ui"))
				style.icon.color[2] = 152 - flash_value
				style.icon.color[3] = 152 - flash_value
				style.icon.color[4] = 152 - flash_value
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local style = widgets.style
				style.icon.color[2] = 255
				style.icon.color[3] = 255
				style.icon.color[4] = 255
			end
		}
	}
}
local interaction_data = {
	interaction_started = false,
	purchase_duration = 0.4,
	interaction_ongoing = false,
	progress = 0,
	interaction_successful = false
}
local purchase_interaction = {
	start = function (interaction_data, t)
		interaction_data.done_time = t + interaction_data.purchase_duration
		interaction_data.interaction_started = true
		interaction_data.interaction_successful = false
	end,
	update = function (interaction_data, t)
		local time_left = math.max(interaction_data.done_time - t, 0)
		local progress = 1 - math.min(time_left / interaction_data.purchase_duration, 1)
		interaction_data.progress = progress

		if interaction_data.interaction_started and interaction_data.done_time and interaction_data.interaction_ongoing and time_left <= 0 then
			interaction_data.interaction_successful = true

			return true
		end

		return false
	end,
	successful = function (interaction_data)
		if interaction_data.interaction_successful then
			interaction_data.done_time = nil
			interaction_data.interaction_started = false
			interaction_data.interaction_ongoing = false
		end
	end,
	abort = function (interaction_data)
		interaction_data.done_time = nil
		interaction_data.interaction_started = false
		interaction_data.interaction_ongoing = false
	end
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widgets,
	top_widgets = top_widgets,
	player_widgets = player_widgets,
	create_blessing_portraits_frame = create_blessing_portraits_frame,
	create_power_up_shop_item = create_power_up_shop_item,
	create_blessing_shop_item = create_blessing_shop_item,
	discount_text_color = Colors.get_color_table_with_alpha("yellow", 255),
	single_price_offset = {
		0,
		-22
	},
	interaction_data = interaction_data,
	purchase_interaction = purchase_interaction,
	animations_definitions = animations_definitions
}
