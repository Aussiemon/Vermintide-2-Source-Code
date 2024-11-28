-- chunkname: @scripts/ui/views/hero_view/states/definitions/hero_view_state_handbook_definitions.lua

local window_default_settings = UISettings.game_start_windows
local small_window_spacing = window_default_settings.spacing
local window_size = window_default_settings.large_window_size
local side_window_height = window_size[2]
local left_window_size = {
	math.floor((window_size[1] + 44) / 3),
	side_window_height,
}
local right_window_size = {
	window_size[1] + 22 - left_window_size[1],
	side_window_height,
}
local achievement_window_size = {
	right_window_size[1] - 22,
	right_window_size[2] - 104,
}
local achievement_scrollbar_size = {
	16,
	right_window_size[2] - 44,
}
local achievement_entry_width = achievement_window_size[1] - 150
local category_window_size = {
	left_window_size[1] - 22,
	left_window_size[2] - 48,
}
local tab_size = {
	left_window_size[1] - 120,
	60,
}
local tab_active_size = {
	tab_size[1] - small_window_spacing * 2,
	left_window_size[2] - tab_size[2] - tab_size[2],
}
local tab_list_entry_size = {
	tab_size[1] - small_window_spacing * 2,
	42,
}
local tab_list_entry_spacing = 5
local category_tab_info = {
	tab_size = tab_size,
	tab_active_size = tab_active_size,
	tab_list_entry_size = tab_list_entry_size,
	tab_list_entry_spacing = tab_list_entry_spacing,
}
local CATEGORY_LIST_LIMIT = 14
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
			1,
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
	left_window = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "bottom",
		size = left_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	left_window_fade = {
		horizontal_alignment = "center",
		parent = "left_window",
		vertical_alignment = "center",
		size = {
			left_window_size[1] - 44,
			left_window_size[2] - 44,
		},
		position = {
			0,
			0,
			1,
		},
	},
	right_window = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "bottom",
		size = right_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	right_window_fade = {
		horizontal_alignment = "center",
		parent = "right_window",
		vertical_alignment = "center",
		size = {
			right_window_size[1] - 44,
			right_window_size[2] - 44,
		},
		position = {
			0,
			0,
			1,
		},
	},
	category_window = {
		horizontal_alignment = "center",
		parent = "left_window",
		vertical_alignment = "center",
		size = category_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	category_window_mask = {
		horizontal_alignment = "center",
		parent = "category_window",
		vertical_alignment = "center",
		size = {
			category_window_size[1],
			left_window_size[2] - 44,
		},
		position = {
			0,
			0,
			0,
		},
	},
	category_window_mask_top = {
		horizontal_alignment = "center",
		parent = "category_window_mask",
		vertical_alignment = "top",
		size = {
			category_window_size[1],
			30,
		},
		position = {
			0,
			0,
			1,
		},
	},
	category_window_mask_bottom = {
		horizontal_alignment = "center",
		parent = "category_window_mask",
		vertical_alignment = "bottom",
		size = {
			category_window_size[1],
			30,
		},
		position = {
			0,
			0,
			1,
		},
	},
	category_root = {
		horizontal_alignment = "center",
		parent = "category_window",
		vertical_alignment = "top",
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
	category_scrollbar = {
		horizontal_alignment = "right",
		parent = "category_window",
		vertical_alignment = "center",
		size = achievement_scrollbar_size,
		position = {
			-small_window_spacing,
			0,
			3,
		},
	},
	gamepad_background = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			100,
		},
	},
	achievement_window = {
		horizontal_alignment = "center",
		parent = "right_window",
		vertical_alignment = "center",
		size = achievement_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	achievement_window_mask = {
		horizontal_alignment = "center",
		parent = "achievement_window",
		vertical_alignment = "center",
		size = {
			achievement_window_size[1],
			right_window_size[2] - 44,
		},
		position = {
			0,
			0,
			0,
		},
	},
	achievement_window_mask_top = {
		horizontal_alignment = "center",
		parent = "achievement_window_mask",
		vertical_alignment = "top",
		size = {
			achievement_window_size[1],
			30,
		},
		position = {
			0,
			0,
			1,
		},
	},
	achievement_window_mask_bottom = {
		horizontal_alignment = "center",
		parent = "achievement_window_mask",
		vertical_alignment = "bottom",
		size = {
			achievement_window_size[1],
			30,
		},
		position = {
			0,
			0,
			1,
		},
	},
	achievement_root = {
		horizontal_alignment = "center",
		parent = "achievement_window",
		vertical_alignment = "top",
		size = {
			achievement_entry_width,
			1,
		},
		position = {
			0,
			0,
			0,
		},
	},
	achievement_scrollbar = {
		horizontal_alignment = "right",
		parent = "achievement_window",
		vertical_alignment = "center",
		size = achievement_scrollbar_size,
		position = {
			-small_window_spacing,
			0,
			3,
		},
	},
	page_text_area = {
		horizontal_alignment = "center",
		parent = "right_window",
		vertical_alignment = "bottom",
		size = {
			334,
			60,
		},
		position = {
			0,
			30,
			3,
		},
	},
	input_icon_previous = {
		horizontal_alignment = "center",
		parent = "page_text_area",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-60,
			0,
			1,
		},
	},
	input_icon_next = {
		horizontal_alignment = "center",
		parent = "page_text_area",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			60,
			0,
			1,
		},
	},
	input_arrow_next = {
		horizontal_alignment = "center",
		parent = "input_icon_next",
		vertical_alignment = "center",
		size = {
			19,
			27,
		},
		position = {
			40,
			0,
			1,
		},
	},
	input_arrow_previous = {
		horizontal_alignment = "center",
		parent = "input_icon_previous",
		vertical_alignment = "center",
		size = {
			19,
			27,
		},
		position = {
			-40,
			0,
			1,
		},
	},
	page_button_next = {
		horizontal_alignment = "center",
		parent = "input_icon_next",
		vertical_alignment = "center",
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
	page_button_previous = {
		horizontal_alignment = "center",
		parent = "input_icon_previous",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-20,
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
			42,
		},
	},
	title = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "top",
		size = {
			570,
			60,
		},
		position = {
			0,
			34,
			46,
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
local page_number_left_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		-(window_size[1] * 0.1 + 5),
		4,
		2,
	},
}
local page_number_right_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		window_size[1] * 0.1 + 4,
		4,
		2,
	},
}
local page_number_center_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		4,
		2,
	},
}

local function create_tab(scenegraph_id, size, text, list_scenegraph_id)
	local masked = true
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = "button_detail_02"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size
	local small_side_detail_texture = "button_detail_03"
	local small_side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(small_side_detail_texture)
	local small_side_detail_texture_size = small_side_detail_texture_settings.size
	local list_content = {
		allow_multi_hover = true,
	}
	local item_styles = {}

	for i = 1, CATEGORY_LIST_LIMIT do
		local spacing = tab_list_entry_spacing

		list_content[i] = {
			background_fade = "button_bg_fade",
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			icon = "tooltip_marker",
			new = false,
			new_texture = "list_item_tag_new",
			rect_masked = "rect_masked",
			text = "n/a",
			button_hotspot = {},
			side_detail = {
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
				texture_id = small_side_detail_texture,
			},
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2],
					},
					{
						size[1] / background_texture_settings.size[1],
						1,
					},
				},
				texture_id = background_texture,
			},
		}
		item_styles[i] = {
			list_member_offset = {
				0,
				-(tab_list_entry_size[2] + spacing),
				0,
			},
			size = {
				tab_list_entry_size[1],
				tab_list_entry_size[2],
			},
			text = {
				font_size = 22,
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					40,
					0,
					14,
				},
			},
			text_hover = {
				font_size = 22,
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					40,
					0,
					14,
				},
			},
			text_selected = {
				font_size = 22,
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					40,
					0,
					14,
				},
			},
			text_shadow = {
				font_size = 22,
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					42,
					-2,
					13,
				},
			},
			rect = {
				masked = masked,
				size = {
					tab_list_entry_size[1],
					tab_list_entry_size[2],
				},
				color = {
					100,
					100,
					0,
					0,
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
				masked = masked,
				texture_size = {
					13,
					13,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					20,
					0,
					10,
				},
			},
			side_detail_left = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-9,
					tab_list_entry_size[2] / 2 - small_side_detail_texture_size[2] / 2,
					9,
				},
				size = small_side_detail_texture_size,
			},
			side_detail_right = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					tab_list_entry_size[1] - small_side_detail_texture_size[1] + 9,
					tab_list_entry_size[2] / 2 - small_side_detail_texture_size[2] / 2,
					9,
				},
				size = small_side_detail_texture_size,
			},
			frame = {
				masked = masked,
				size = tab_list_entry_size,
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
					8,
				},
			},
			background = {
				masked = masked,
				size = tab_list_entry_size,
				color = {
					255,
					150,
					150,
					150,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			background_fade = {
				masked = masked,
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					frame_width,
					frame_width - 2,
					2,
				},
				size = {
					tab_list_entry_size[1] - frame_width * 2,
					tab_list_entry_size[2] - frame_width * 2,
				},
			},
			hover_glow = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 2,
					3,
				},
				size = {
					tab_list_entry_size[1],
					math.min(tab_list_entry_size[2] - 5, 80),
				},
			},
			clicked_rect = {
				masked = masked,
				size = tab_list_entry_size,
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
				masked = masked,
				size = tab_list_entry_size,
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
			glass_top = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					tab_list_entry_size[2] - (frame_width + 11),
					4,
				},
				size = {
					tab_list_entry_size[1],
					11,
				},
			},
			glass_bottom = {
				masked = masked,
				color = {
					100,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 9,
					4,
				},
				size = {
					tab_list_entry_size[1],
					11,
				},
			},
			new_texture = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					tab_list_entry_size[1] - 63,
					tab_list_entry_size[2] / 2 - 12,
					12,
				},
				size = {
					63,
					25,
				},
			},
		}
	end

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_fade",
					texture_id = "background_fade",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "texture",
					style_id = "clicked_rect",
					texture_id = "rect_masked",
				},
				{
					pass_type = "texture",
					style_id = "disabled_rect",
					texture_id = "rect_masked",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					content_id = "side_detail",
					pass_type = "texture_uv",
					style_id = "side_detail_right",
				},
				{
					content_id = "side_detail",
					pass_type = "texture",
					style_id = "side_detail_left",
					texture_id = "texture_id",
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
					style_id = "glass_top",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "new_texture",
					texture_id = "new_texture",
					content_check_function = function (content)
						return content.new
					end,
				},
				{
					pass_type = "texture",
					style_id = "locked",
					texture_id = "locked",
					content_check_function = function (content)
						return content.button_hotspot.disable_button
					end,
				},
				{
					content_id = "list_content",
					pass_type = "list_pass",
					style_id = "list_style",
					content_check_function = function (content)
						return content.active
					end,
					passes = {
						{
							pass_type = "text",
							style_id = "text",
							text_id = "text",
							content_check_function = function (content)
								local button_hotspot = content.button_hotspot

								return not button_hotspot.is_hover and not button_hotspot.is_selected
							end,
						},
						{
							pass_type = "text",
							style_id = "text_hover",
							text_id = "text",
							content_check_function = function (content)
								local button_hotspot = content.button_hotspot

								return button_hotspot.is_hover and not button_hotspot.is_selected
							end,
						},
						{
							pass_type = "text",
							style_id = "text_selected",
							text_id = "text",
							content_check_function = function (content)
								return content.button_hotspot.is_selected
							end,
						},
						{
							pass_type = "text",
							style_id = "text_shadow",
							text_id = "text",
						},
						{
							pass_type = "texture",
							style_id = "icon",
							texture_id = "icon",
						},
						{
							content_id = "button_hotspot",
							pass_type = "hotspot",
						},
						{
							content_id = "side_detail",
							pass_type = "texture_uv",
							style_id = "side_detail_right",
						},
						{
							content_id = "side_detail",
							pass_type = "texture",
							style_id = "side_detail_left",
							texture_id = "texture_id",
						},
						{
							pass_type = "texture_frame",
							style_id = "frame",
							texture_id = "frame",
						},
						{
							content_id = "background",
							pass_type = "texture_uv",
							style_id = "background",
						},
						{
							pass_type = "texture",
							style_id = "background_fade",
							texture_id = "background_fade",
						},
						{
							pass_type = "texture",
							style_id = "hover_glow",
							texture_id = "hover_glow",
							content_check_function = function (content)
								local button_hotspot = content.button_hotspot

								return button_hotspot.is_hover or button_hotspot.is_selected
							end,
						},
						{
							pass_type = "texture",
							style_id = "clicked_rect",
							texture_id = "rect_masked",
						},
						{
							pass_type = "texture",
							style_id = "disabled_rect",
							texture_id = "rect_masked",
							content_check_function = function (content)
								local button_hotspot = content.button_hotspot

								return button_hotspot.disable_button
							end,
						},
						{
							pass_type = "texture",
							style_id = "glass_top",
							texture_id = "glass",
						},
						{
							pass_type = "texture",
							style_id = "glass_bottom",
							texture_id = "glass",
						},
						{
							pass_type = "texture",
							style_id = "glass_bottom",
							texture_id = "glass",
						},
						{
							pass_type = "texture",
							style_id = "new_texture",
							texture_id = "new_texture",
							content_check_function = function (content)
								return content.new
							end,
						},
					},
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			locked = "achievement_symbol_lock",
			new = false,
			new_texture = "list_item_tag_new",
			rect_masked = "rect_masked",
			list_content = list_content,
			side_detail = {
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
				texture_id = side_detail_texture,
			},
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2],
					},
					{
						size[1] / background_texture_settings.size[1],
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			list_style = {
				horizontal_alignment = "center",
				num_draws = 0,
				start_index = 1,
				vertical_alignment = "top",
				masked = masked,
				list_member_offset = {
					0,
					tab_list_entry_size[2],
					0,
				},
				size = {
					tab_list_entry_size[1],
					tab_list_entry_size[2],
				},
				scenegraph_id = list_scenegraph_id,
				item_styles = item_styles,
			},
			hotspot = {
				masked = masked,
				size = {
					size[1],
					size[2],
				},
				offset = {
					0,
					0,
					0,
				},
			},
			background = {
				masked = masked,
				color = {
					255,
					150,
					150,
					150,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			background_fade = {
				masked = masked,
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					frame_width,
					frame_width - 2,
					2,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
			},
			hover_glow = {
				masked = masked,
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 2,
					3,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			clicked_rect = {
				masked = masked,
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
				masked = masked,
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
				font_size = 24,
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					30,
					0,
					6,
				},
			},
			title_text_disabled = {
				font_size = 24,
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					30,
					0,
					6,
				},
			},
			title_text_shadow = {
				font_size = 24,
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					32,
					-2,
					5,
				},
			},
			frame = {
				masked = masked,
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
					8,
				},
			},
			glass_top = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - (frame_width + 11),
					4,
				},
				size = {
					size[1],
					11,
				},
			},
			glass_bottom = {
				masked = masked,
				color = {
					100,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 9,
					4,
				},
				size = {
					size[1],
					11,
				},
			},
			side_detail_left = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-9,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					9,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
			},
			side_detail_right = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - side_detail_texture_size[1] + 9,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					9,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
			},
			new_texture = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 126,
					size[2] / 2 - 25,
					10,
				},
				size = {
					126,
					51,
				},
			},
			locked = {
				masked = masked,
				color = {
					255,
					100,
					100,
					100,
				},
				offset = {
					size[1] - 64,
					size[2] / 2 - 20,
					10,
				},
				size = {
					56,
					40,
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

local disable_with_gamepad = true
local widgets = {
	window = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_11", 40),
	window_background = UIWidgets.create_tiled_texture("window_background", "menu_frame_bg_01", {
		960,
		1080,
	}, nil, nil, {
		255,
		100,
		100,
		100,
	}),
	left_window_mask = UIWidgets.create_simple_texture("mask_rect", "category_window"),
	category_window_mask_top = UIWidgets.create_simple_texture("mask_rect_edge_fade", "category_window_mask_top"),
	category_window_mask_bottom = UIWidgets.create_simple_uv_texture("mask_rect_edge_fade", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "category_window_mask_bottom"),
	right_window_frame = UIWidgets.create_frame("right_window", scenegraph_definition.right_window.size, "menu_frame_11", 20),
	right_window_fade = UIWidgets.create_simple_texture("options_window_fade_01", "right_window_fade"),
	right_window = UIWidgets.create_tiled_texture("right_window", "achievement_background_leather_02", {
		256,
		256,
	}, nil, nil, {
		255,
		180,
		180,
		180,
	}),
	right_window_mask = UIWidgets.create_simple_texture("mask_rect", "achievement_window"),
	achievement_window_mask_bottom = UIWidgets.create_simple_rotated_texture("mask_rect_edge_fade", math.pi, {
		achievement_window_size[1] / 2,
		15,
	}, "achievement_window_mask_bottom"),
	achievement_window_mask_top = UIWidgets.create_simple_texture("mask_rect_edge_fade", "achievement_window_mask_top"),
	exit_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_close"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	title = UIWidgets.create_simple_texture("frame_title_bg_02", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("tutorial_menu_header"), "title_text", nil, nil, title_text_style),
	achievement_scrollbar = UIWidgets.create_chain_scrollbar("achievement_scrollbar", nil, scenegraph_definition.achievement_scrollbar.size),
	category_scrollbar = UIWidgets.create_chain_scrollbar("category_scrollbar", "category_window_mask", scenegraph_definition.category_scrollbar.size),
	page_button_next = UIWidgets.create_arrow_button("page_button_next", math.pi),
	page_button_previous = UIWidgets.create_arrow_button("page_button_previous"),
	input_icon_next = UIWidgets.create_simple_texture("xbone_button_icon_a", "input_icon_next"),
	input_icon_previous = UIWidgets.create_simple_texture("xbone_button_icon_a", "input_icon_previous"),
	input_arrow_next = UIWidgets.create_simple_uv_texture("settings_arrow_normal", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "input_arrow_next"),
	input_arrow_previous = UIWidgets.create_simple_texture("settings_arrow_normal", "input_arrow_previous"),
	page_text_center = UIWidgets.create_simple_text("/", "page_text_area", nil, nil, page_number_center_text_style),
	page_text_left = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_left_text_style),
	page_text_right = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_right_text_style),
	page_text_area = UIWidgets.create_simple_texture("tab_menu_bg_03", "page_text_area"),
	achievement_window = {
		scenegraph_id = "achievement_window_mask",
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "scroll",
					scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis, dt)
						local axis_input = scroll_axis.y * -1

						if IS_XB1 and GameSettingsDevelopment.allow_keyboard_mouse and not ui_content.is_gamepad_active then
							axis_input = math.sign(scroll_axis.x) * -1
						end

						local hotspot = ui_content.hotspot

						if axis_input ~= 0 and hotspot.is_hover then
							ui_content.axis_input = axis_input
							ui_content.scroll_add = axis_input * ui_content.scroll_amount
						end

						local scroll_add = ui_content.scroll_add

						if scroll_add then
							local step = scroll_add * (dt * 5)

							scroll_add = scroll_add - step

							if math.abs(scroll_add) > 0 then
								ui_content.scroll_add = scroll_add
							else
								ui_content.scroll_add = nil
							end

							local current_scroll_value = ui_content.scroll_value

							ui_content.scroll_value = math.clamp(current_scroll_value + step, 0, 1)
						end
					end,
				},
			},
		},
		content = {
			scroll_amount = 0.1,
			scroll_value = 1,
			hotspot = {
				allow_multi_hover = true,
			},
		},
		style = {},
	},
}

local function create_category_tab_widgets(num_categories)
	local category_tab_widgets = {}

	for i = 1, num_categories + 1 do
		local first_entry = i == 1
		local scenegraph_id = "category_tab_" .. i
		local scenegraph_list_id = "category_tab_" .. i .. "_list"
		local previous_scenegraph_list_id = "category_tab_" .. i - 1 .. "_list"

		scenegraph_definition[scenegraph_id] = {
			horizontal_alignment = "center",
			parent = first_entry and "category_root" or previous_scenegraph_list_id,
			vertical_alignment = first_entry and "top" or "bottom",
			size = tab_size,
			position = {
				first_entry and -15 or 0,
				first_entry and -20 or -(tab_size[2] + tab_list_entry_spacing),
				0,
			},
		}
		scenegraph_definition[scenegraph_list_id] = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			parent = scenegraph_id,
			size = {
				tab_size[1],
				0,
			},
			position = {
				0,
				-(tab_size[2] + tab_list_entry_spacing),
				0,
			},
		}
		category_tab_widgets[i] = create_tab(scenegraph_id, tab_size, "n/a", scenegraph_list_id)
	end

	return category_tab_widgets
end

local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, in_scenegraph_definition, in_widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, in_scenegraph_definition, in_widgets, progress, params)
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, in_scenegraph_definition, in_widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, in_scenegraph_definition, in_widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, in_scenegraph_definition, in_widgets, progress, params)
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, in_scenegraph_definition, in_widgets, params)
				return
			end,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 1,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 4,
		},
	},
	has_pages = {
		actions = {
			{
				description_text = "input_description_change_tab",
				ignore_keybinding = true,
				input_action = "l1_r1",
				priority = 2,
			},
		},
	},
}

local function simple_tag_colorizer(inner)
	local is_kw, _, is_end = string.find(inner, "^<(/?)kw")

	if not is_kw then
		return inner
	end

	return is_end and "{#reset()}" or "{#color(255,193,91)}"
end

local function create_content_widget_spacing(context, entry)
	return {
		scenegraph_id = context.scenegraph_id,
		element = {
			passes = {},
		},
		content = {
			size = entry.size,
		},
		style = {},
	}
end

local function create_content_widget_text(context, entry)
	local size = {
		achievement_entry_width,
		0,
	}
	local text_content = Localize(entry.text or "n/a")

	if entry.inputs then
		local input_strings = {}

		for i, input_data in ipairs(entry.inputs) do
			local input_service = "Player"
			local input_action = input_data

			input_strings[i] = string.format("$KEY;%s__%s: ", input_service, input_action)
		end

		text_content = string.format(text_content, unpack(input_strings))
	end

	text_content = string.gsub(text_content, "%b<>", simple_tag_colorizer)

	local text_style = {
		font_size = 24,
		font_type = "hell_shark_masked",
		horizontal_alignment = "center",
		localize = false,
		vertical_alignment = "top",
		word_wrap = true,
		size = size,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
	}

	if entry.style then
		table.merge(text_style, entry.style)
	end

	local text_shadow_pass, text_shadow_content, text_shadow_style

	if text_style.use_shadow then
		text_shadow_pass = {
			pass_type = "text",
			style_id = "text_shadow",
			text_id = "text_shadow",
		}
		text_shadow_content = string.gsub(text_content, "%b{}", "")
		text_shadow_style = table.shallow_copy(text_style)
		text_shadow_style.offset = {
			2,
			2,
			-1,
		}
		text_shadow_style.skip_button_rendering = true
		text_shadow_style.text_color = {
			text_style.text_color[1],
			0,
			0,
			0,
		}

		if text_style.shadow_color then
			Colors.copy_no_alpha_to(text_shadow_style.text_color, text_style.shadow_color)
		end
	end

	size[2] = UIUtils.get_text_height(context.ui_renderer, size, text_style, text_content)

	return {
		scenegraph_id = context.scenegraph_id,
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				text_shadow_pass,
			},
		},
		content = {
			text = text_content,
			text_shadow = text_shadow_content,
			size = size,
			padding = entry.padding or 25,
		},
		style = {
			text = text_style,
			text_shadow = text_shadow_style,
		},
	}
end

local function create_content_widget_image(context, entry)
	local size = {
		674,
		380,
	}
	local horizontal_offset = 0.5 * (achievement_entry_width - size[1])
	local frame_settings = UIFrameSettings.menu_frame_06
	local shadow_settings = UIFrameSettings.shadow_frame_02
	local shadow_margin = -1 * shadow_settings.texture_sizes.horizontal[2]
	local shadow_margins = {
		shadow_margin,
		shadow_margin,
	}

	return {
		scenegraph_id = context.scenegraph_id,
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture",
					texture_id = "texture",
					content_check_function = function (content)
						return content.texture
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "shadow",
					texture_id = "shadow",
					content_check_function = function (content)
						return content.texture
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_check_function = function (content)
						return content.texture
					end,
				},
				{
					pass_type = "rotated_texture",
					style_id = "loading_icon",
					texture_id = "loading_icon",
					content_check_function = function (content)
						return not content.texture
					end,
					content_change_function = function (content, style, _, dt)
						local progress = (content.loading_progress + dt) % 1

						style.angle = 2^math.smoothstep(progress, 0, 1) * math.tau
						content.loading_progress = progress
					end,
				},
			},
		},
		content = {
			loading_icon = "loot_loading",
			loading_progress = 0,
			size = size,
			frame = frame_settings.texture,
			shadow = shadow_settings.texture,
			frame_detail = {
				texture_id = "frame_detail_03",
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
		},
		style = {
			texture = {
				horizontal_alignment = "center",
				masked = true,
				vertical_alignment = "bottom",
				texture_size = size,
			},
			shadow = {
				masked = true,
				offset = {
					horizontal_offset,
					0,
					0,
				},
				area_size = size,
				frame_margins = shadow_margins,
				texture_size = shadow_settings.texture_size,
				texture_sizes = shadow_settings.texture_sizes,
				color = {
					255,
					0,
					0,
					0,
				},
			},
			frame = {
				masked = true,
				offset = {
					horizontal_offset,
					0,
					1,
				},
				area_size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			frame_detail_left = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					230,
					59,
				},
				size = size,
				offset = {
					horizontal_offset - 40,
					16,
					2,
				},
			},
			frame_detail_right = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					230,
					59,
				},
				size = size,
				offset = {
					horizontal_offset + 50,
					12,
					2,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			loading_icon = {
				angle = 0,
				horizontal_alignment = "center",
				masked = true,
				vertical_alignment = "center",
				texture_size = {
					150,
					150,
				},
				offset = {
					horizontal_offset,
					0,
					0,
				},
				size = size,
				pivot = {
					75,
					75,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
		},
	}
end

local function create_content_widget_video(context, entry)
	local size = {
		852,
		480,
	}
	local horizontal_offset = 0.5 * (achievement_entry_width - size[1])
	local frame_settings = UIFrameSettings.menu_frame_06
	local shadow_settings = UIFrameSettings.shadow_frame_02
	local shadow_margin = -1 * shadow_settings.texture_sizes.horizontal[2]
	local shadow_margins = {
		shadow_margin,
		shadow_margin,
	}
	local video_resource = "video/tutorial_videos/" .. entry.path
	local video_player_reference = context.layout:create_video_player(video_resource)

	return {
		scenegraph_id = context.scenegraph_id,
		element = {
			passes = {
				{
					pass_type = "video",
					style_id = "video",
					content_check_function = function (content)
						return content.video_player_reference
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "shadow",
					texture_id = "shadow",
					content_check_function = function (content)
						return content.video_player_reference
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_check_function = function (content)
						return content.video_player_reference
					end,
				},
			},
		},
		content = {
			loading_icon = "loot_loading",
			loading_progress = 0,
			size = size,
			material_name = entry.path,
			video_player_reference = video_player_reference,
			frame = frame_settings.texture,
			shadow = shadow_settings.texture,
			frame_detail = {
				texture_id = "frame_detail_03",
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
		},
		style = {
			video = {
				size = size,
				offset = {
					horizontal_offset,
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
			shadow = {
				masked = true,
				offset = {
					horizontal_offset,
					0,
					0,
				},
				area_size = size,
				frame_margins = shadow_margins,
				texture_size = shadow_settings.texture_size,
				texture_sizes = shadow_settings.texture_sizes,
				color = {
					255,
					0,
					0,
					0,
				},
			},
			frame = {
				masked = true,
				offset = {
					horizontal_offset,
					0,
					1,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
			},
		},
	}
end

return {
	generic_input_actions = generic_input_actions,
	category_tab_info = category_tab_info,
	achievement_window_size = achievement_window_size,
	achievement_scrollbar_size = achievement_scrollbar_size,
	content_blueprints = {
		spacing = create_content_widget_spacing,
		text = create_content_widget_text,
		image = create_content_widget_image,
		video = create_content_widget_video,
	},
	widgets = widgets,
	create_category_tab_widgets_func = create_category_tab_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
}
