-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_talents_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_width_offset = window_size[1] * 2 + window_spacing * 2
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local career_window_size = {
	window_size[1] * 2 + window_spacing,
	window_size[2],
}
local career_info_size = {
	math.floor(career_window_size[1] / 2 - 10),
	160,
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
	root_fit = {
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
	window_frame = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = career_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	career_window = {
		horizontal_alignment = "center",
		parent = "window_frame",
		vertical_alignment = "top",
		size = {
			career_window_size[1] - 20,
			career_info_size[2] + 40,
		},
		position = {
			0,
			-10,
			1,
		},
	},
	career_window_edge = {
		horizontal_alignment = "center",
		parent = "career_window",
		vertical_alignment = "bottom",
		size = {
			career_window_size[1] - 20,
			0,
		},
		position = {
			0,
			40,
			1,
		},
	},
	career_window_center_edge = {
		horizontal_alignment = "center",
		parent = "career_window",
		vertical_alignment = "top",
		size = {
			0,
			career_info_size[2] - 5,
		},
		position = {
			0,
			-5,
			1,
		},
	},
	passive_window = {
		horizontal_alignment = "left",
		parent = "career_window",
		vertical_alignment = "top",
		size = career_info_size,
		position = {
			0,
			0,
			1,
		},
	},
	passive_icon = {
		horizontal_alignment = "left",
		parent = "passive_window",
		vertical_alignment = "top",
		size = {
			80,
			80,
		},
		position = {
			10,
			-50,
			5,
		},
	},
	passive_icon_frame = {
		horizontal_alignment = "center",
		parent = "passive_icon",
		vertical_alignment = "center",
		size = {
			80,
			80,
		},
		position = {
			0,
			0,
			1,
		},
	},
	passive_title_text = {
		horizontal_alignment = "left",
		parent = "passive_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.6,
			50,
		},
		position = {
			10,
			-5,
			1,
		},
	},
	passive_title_divider = {
		horizontal_alignment = "left",
		parent = "passive_title_text",
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
	passive_type_title = {
		horizontal_alignment = "right",
		parent = "passive_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.3,
			50,
		},
		position = {
			-10,
			-5,
			1,
		},
	},
	passive_description_text = {
		horizontal_alignment = "left",
		parent = "passive_icon",
		vertical_alignment = "top",
		size = {
			career_info_size[1] - 110,
			career_info_size[2] - 50,
		},
		position = {
			90,
			0,
			1,
		},
	},
	active_window = {
		horizontal_alignment = "right",
		parent = "career_window",
		vertical_alignment = "top",
		size = career_info_size,
		position = {
			0,
			0,
			1,
		},
	},
	active_icon = {
		horizontal_alignment = "left",
		parent = "active_window",
		vertical_alignment = "top",
		size = {
			80,
			80,
		},
		position = {
			10,
			-50,
			5,
		},
	},
	active_icon_frame = {
		horizontal_alignment = "center",
		parent = "active_icon",
		vertical_alignment = "center",
		size = {
			80,
			80,
		},
		position = {
			0,
			0,
			1,
		},
	},
	active_title_text = {
		horizontal_alignment = "left",
		parent = "active_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.6,
			50,
		},
		position = {
			10,
			-5,
			1,
		},
	},
	active_title_divider = {
		horizontal_alignment = "left",
		parent = "active_title_text",
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
	active_type_title = {
		horizontal_alignment = "right",
		parent = "active_window",
		vertical_alignment = "top",
		size = {
			career_info_size[1] * 0.3,
			50,
		},
		position = {
			-10,
			-5,
			1,
		},
	},
	active_description_text = {
		horizontal_alignment = "left",
		parent = "active_icon",
		vertical_alignment = "top",
		size = {
			career_info_size[1] - 110,
			career_info_size[2] - 50,
		},
		position = {
			90,
			0,
			1,
		},
	},
	career_perks = {
		horizontal_alignment = "center",
		parent = "career_window",
		vertical_alignment = "bottom",
		size = {
			career_window_size[1] - 40,
			40,
		},
		position = {
			0,
			10,
			4,
		},
	},
	career_perk_1 = {
		horizontal_alignment = "center",
		parent = "career_perks",
		vertical_alignment = "center",
		size = {
			200,
			40,
		},
		position = {
			-350,
			-6,
			1,
		},
	},
	career_perk_2 = {
		horizontal_alignment = "center",
		parent = "career_perks",
		vertical_alignment = "center",
		size = {
			200,
			40,
		},
		position = {
			0,
			-6,
			1,
		},
	},
	career_perk_3 = {
		horizontal_alignment = "center",
		parent = "career_perks",
		vertical_alignment = "center",
		size = {
			200,
			40,
		},
		position = {
			350,
			-6,
			1,
		},
	},
	talent_title_text = {
		horizontal_alignment = "center",
		parent = "career_window",
		vertical_alignment = "bottom",
		size = {
			career_window_size[1],
			50,
		},
		position = {
			0,
			-50,
			1,
		},
	},
	talent_title_divider = {
		horizontal_alignment = "center",
		parent = "talent_title_text",
		vertical_alignment = "bottom",
		size = {
			264,
			21,
		},
		position = {
			0,
			-10,
			1,
		},
	},
	talents_window = {
		horizontal_alignment = "center",
		parent = "window_frame",
		vertical_alignment = "bottom",
		size = {
			career_window_size[1],
			505,
		},
		position = {
			0,
			0,
			1,
		},
	},
	talent_row_1 = {
		horizontal_alignment = "center",
		parent = "talent_row_2",
		vertical_alignment = "bottom",
		size = {
			career_window_size[1] - 20,
			80,
		},
		position = {
			0,
			90,
			0,
		},
	},
	talent_row_2 = {
		horizontal_alignment = "center",
		parent = "talent_row_3",
		vertical_alignment = "bottom",
		size = {
			career_window_size[1] - 20,
			80,
		},
		position = {
			0,
			90,
			0,
		},
	},
	talent_row_3 = {
		horizontal_alignment = "center",
		parent = "talent_row_4",
		vertical_alignment = "bottom",
		size = {
			career_window_size[1] - 20,
			80,
		},
		position = {
			0,
			90,
			0,
		},
	},
	talent_row_4 = {
		horizontal_alignment = "center",
		parent = "talent_row_5",
		vertical_alignment = "bottom",
		size = {
			career_window_size[1] - 20,
			80,
		},
		position = {
			0,
			90,
			0,
		},
	},
	talent_row_5 = {
		horizontal_alignment = "center",
		parent = "talent_row_6",
		vertical_alignment = "bottom",
		size = {
			career_window_size[1] - 20,
			80,
		},
		position = {
			0,
			90,
			0,
		},
	},
	talent_row_6 = {
		horizontal_alignment = "center",
		parent = "window_frame",
		vertical_alignment = "bottom",
		size = {
			career_window_size[1] - 20,
			80,
		},
		position = {
			0,
			10,
			5,
		},
	},
}
local title_text_style = {
	font_size = 42,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local description_text_style = {
	dynamic_font_size = true,
	dynamic_font_size_word_wrap = true,
	font_size = 17,
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
local type_title_text_style = {
	dynamic_font_size = true,
	font_size = 18,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("gray", 200),
	offset = {
		0,
		0,
		2,
	},
}
local sub_title_text_style = {
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
local talent_title_text_style = {
	font_size = 36,
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
		-6,
		2,
	},
}

local function create_window_button(scenegraph_id, size, button_text, font_size, use_bottom_edge, optional_color_name)
	local button_color_name

	if optional_color_name then
		button_color_name = "button_" .. optional_color_name
	else
		button_color_name = "button_normal"
	end

	local background_color = Colors.get_color_table_with_alpha(button_color_name, 255)
	local button_background_texture = "button_bg_01"
	local button_background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(button_background_texture)
	local widget = {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_background",
				},
				{
					content_id = "button_background",
					pass_type = "texture_uv",
					style_id = "button_background",
				},
				{
					pass_type = "tiled_texture",
					style_id = "button_edge",
					texture_id = "bottom_edge",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass_top",
				},
				{
					pass_type = "texture",
					style_id = "glow",
					texture_id = "glow",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_disabled",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_shadow",
					text_id = "button_text",
				},
				{
					pass_type = "rect",
					style_id = "button_clicked_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end,
				},
				{
					pass_type = "rect",
					style_id = "button_disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "tiled_texture",
					style_id = "bottom_edge",
					texture_id = "bottom_edge",
					content_check_function = function (content)
						return content.use_bottom_edge
					end,
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_left",
					texture_id = "edge_holder_left",
					content_check_function = function (content)
						return content.use_bottom_edge
					end,
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_right",
					texture_id = "edge_holder_right",
					content_check_function = function (content)
						return content.use_bottom_edge
					end,
				},
			},
		},
		content = {
			bottom_edge = "menu_frame_09_divider",
			edge_holder_left = "menu_frame_09_divider_left",
			edge_holder_right = "menu_frame_09_divider_right",
			glass_top = "button_glass_01",
			use_bottom_edge = use_bottom_edge,
			button_hotspot = {},
			button_text = button_text or "n/a",
			hover_glow = optional_color_name and "button_state_hover_" .. optional_color_name or "button_state_hover",
			glow = optional_color_name and "button_state_normal_" .. optional_color_name or "button_state_normal",
			button_background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / button_background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / button_background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = button_background_texture,
			},
		},
		style = {
			button_background = {
				color = background_color,
				offset = {
					0,
					0,
					2,
				},
				size = size,
			},
			button_edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2],
					3,
				},
				size = {
					size[1],
					5,
				},
				texture_tiling_size = {
					1,
					5,
				},
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 4,
					3,
				},
				size = {
					size[1],
					5,
				},
			},
			glow = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					5,
					3,
				},
				size = {
					size[1],
					size[2] - 5,
				},
			},
			hover_glow = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					5,
					2,
				},
				size = {
					size[1],
					size[2] - 5,
				},
			},
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
					1,
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
			button_text = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					5,
					4,
				},
				size = size,
			},
			button_text_disabled = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					5,
					4,
				},
				size = size,
			},
			button_text_shadow = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					3,
					3,
				},
				size = size,
			},
			button_clicked_rect = {
				color = {
					100,
					0,
					0,
					0,
				},
				offset = {
					5,
					0,
					5,
				},
				size = {
					size[1] - 10,
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
					5,
					0,
					5,
				},
				size = {
					size[1] - 10,
					size[2],
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

local function talent_row(scenegraph_id, size, amount)
	local frame_settings = UIFrameSettings.menu_frame_09
	local glow_frame_name = "frame_outer_glow_01"
	local glow_frame_settings = UIFrameSettings[glow_frame_name]
	local glow_frame_width = glow_frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame_lock",
			texture_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "lock",
			texture_id = "lock",
		},
		{
			pass_type = "rect",
			style_id = "lock_rect",
		},
		{
			pass_type = "text",
			style_id = "level_text",
			text_id = "level_text",
		},
		{
			pass_type = "text",
			style_id = "level_text_shadow",
			text_id = "level_text",
		},
		{
			pass_type = "texture_frame",
			style_id = "glow_frame",
			texture_id = "glow_frame",
		},
	}
	local content = {
		level_text = "0",
		lock = "talent_lock_fg",
		amount = amount,
		frame = frame_settings.texture,
		glow_frame = glow_frame_settings.texture,
	}
	local style = {
		frame = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			size = {
				size[1],
				size[2],
			},
			offset = {
				0,
				0,
				5,
			},
		},
		frame_lock = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			size = {
				103,
				size[2],
			},
			offset = {
				0,
				0,
				3,
			},
		},
		glow_frame = {
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				-2,
			},
			size = size,
			texture_size = glow_frame_settings.texture_size,
			texture_sizes = glow_frame_settings.texture_sizes,
			frame_margins = {
				-(glow_frame_width - 1),
				-(glow_frame_width - 1),
			},
		},
		lock_rect = {
			color = {
				100,
				0,
				0,
				0,
			},
			size = {
				100,
				size[2],
			},
			offset = {
				0,
				0,
				0,
			},
		},
		lock = {
			color = {
				255,
				255,
				255,
				255,
			},
			size = {
				97,
				size[2],
			},
			offset = {
				3,
				2,
				1,
			},
		},
		level_text = {
			font_size = 26,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				97,
				97,
			},
			offset = {
				3,
				-12,
				3,
			},
		},
		level_text_shadow = {
			font_size = 26,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				97,
				97,
			},
			offset = {
				5,
				-14,
				2,
			},
		},
	}
	local slot_width_spacing = 0
	local offset_layer = 0
	local button_size = {
		314,
		size[2],
	}
	local icon_size = {
		80,
		80,
	}
	local start_width_offset = size[1] - (button_size[1] * amount + slot_width_spacing * (amount - 1))

	for k = 1, amount do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1
		local offset = {
			start_width_offset,
			0,
			offset_layer,
		}
		local hotspot_name = "hotspot" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name,
		}
		style[hotspot_name] = {
			size = button_size,
			offset = offset,
		}
		content[hotspot_name] = {}

		local hotspot_content = content[hotspot_name]
		local background_name = "background" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "rect",
			style_id = background_name,
		}
		style[background_name] = {
			size = button_size,
			color = {
				100,
				0,
				0,
				0,
			},
			offset = {
				offset[1],
				offset[2],
				0,
			},
		}

		local frame_name = "frame" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture_frame",
			texture_id = frame_name,
			style_id = frame_name,
		}
		style[frame_name] = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			size = button_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				7,
			},
		}
		content[frame_name] = frame_settings.texture

		local selected_name = "selected" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = selected_name,
			style_id = selected_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.is_selected
			end,
		}
		style[selected_name] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				318,
				80,
			},
			size = button_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				28,
			},
		}
		content[selected_name] = "talent_selected"

		local title_text_name = "title_text" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return not hotspot.is_selected and not hotspot.disabled
			end,
		}
		style[title_text_name] = {
			font_size = 24,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				button_size[1] - 100,
				button_size[2],
			},
			offset = {
				offset[1] + 90,
				offset[2],
				3,
			},
		}
		content[title_text_name] = "n/a"

		local title_text_selected_name = "title_text_selected" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_selected_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.is_selected and not hotspot.disabled
			end,
		}
		style[title_text_selected_name] = {
			font_size = 24,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			size = {
				button_size[1] - 100,
				button_size[2],
			},
			offset = {
				offset[1] + 90,
				offset[2],
				3,
			},
		}

		local title_text_disabled_name = "title_text_disabled" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_disabled_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.disabled
			end,
		}
		style[title_text_disabled_name] = {
			font_size = 24,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = {
				255,
				50,
				50,
				50,
			},
			size = {
				button_size[1] - 100,
				button_size[2],
			},
			offset = {
				offset[1] + 90,
				offset[2],
				3,
			},
		}

		local title_text_shadow_name = "title_text_shadow" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_shadow_name,
		}
		style[title_text_shadow_name] = {
			font_size = 24,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				button_size[1] - 100,
				button_size[2],
			},
			offset = {
				offset[1] + 90 + 2,
				offset[2] - 2,
				2,
			},
		}

		local background_glow_name = "background_glow" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = background_glow_name,
			style_id = background_glow_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.is_hover
			end,
		}
		style[background_glow_name] = {
			size = button_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				3,
			},
		}
		content[background_glow_name] = "talent_bg_glow_01"

		local glass_top_name = "glass_top" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = glass_top_name,
			style_id = glass_top_name,
		}
		style[glass_top_name] = {
			size = {
				button_size[1],
				3,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2] + button_size[2] - 8,
				5,
			},
		}
		content[glass_top_name] = "button_glass_01"

		local icon_name = "icon" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = icon_name,
			style_id = icon_name,
		}
		style[icon_name] = {
			saturated = true,
			size = icon_size,
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				offset[1],
				offset[2] + button_size[2] / 2 - icon_size[2] / 2,
				3,
			},
		}
		content[icon_name] = "icons_placeholder"

		local icon_rect_name = "icon_rect" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "rect",
			style_id = icon_rect_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return not hotspot.disabled and not hotspot.is_selected
			end,
		}
		style[icon_rect_name] = {
			size = icon_size,
			color = {
				100,
				0,
				0,
				0,
			},
			offset = {
				offset[1],
				offset[2] + button_size[2] / 2 - icon_size[2] / 2,
				4,
			},
		}

		local icon_disabled_rect_name = "icon_disabled_rect" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "rect",
			style_id = icon_disabled_rect_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.disabled
			end,
		}
		style[icon_disabled_rect_name] = {
			size = icon_size,
			color = {
				200,
				0,
				0,
				0,
			},
			offset = {
				offset[1],
				offset[2] + button_size[2] / 2 - icon_size[2] / 2,
				4,
			},
		}

		local icon_divider_name = "icon_divider" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = icon_divider_name,
			style_id = icon_divider_name,
		}
		style[icon_divider_name] = {
			size = {
				5,
				icon_size[2] - 2,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				offset[1] + icon_size[1] - 5,
				offset[2] + button_size[2] / 2 - icon_size[2] / 2 + 1,
				6,
			},
		}
		content[icon_divider_name] = "menu_frame_09_divider_vertical"

		local tooltip_name = "tooltip" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "talent_tooltip",
			talent_id = "talent",
			content_id = hotspot_name,
			style_id = tooltip_name,
			content_check_function = function (content)
				return content.talent and content.is_hover
			end,
		}
		style[tooltip_name] = {
			size = button_size,
			offset = {
				offset[1],
				offset[2],
				offset[3] + 10,
			},
		}
		content[tooltip_name] = nil
		start_width_offset = start_width_offset + button_size[1] + slot_width_spacing
	end

	widget.element.passes = passes
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

local function create_window_divider(scenegraph_id, size, optional_texture_version)
	local texture_version = optional_texture_version or "09"
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
			edge_holder_left = "menu_frame_" .. texture_version .. "_divider_left",
			edge_holder_right = "menu_frame_" .. texture_version .. "_divider_right",
			bottom_edge = "menu_frame_" .. texture_version .. "_divider",
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

local function create_vertical_window_divider(scenegraph_id, size, optional_texture_version)
	local texture_version = optional_texture_version or "09"
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "edge",
					texture_id = "edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_top",
					texture_id = "edge_holder_top",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_bottom",
					texture_id = "edge_holder_bottom",
				},
			},
		},
		content = {
			edge_holder_top = "menu_frame_" .. texture_version .. "_divider_top",
			edge_holder_bottom = "menu_frame_" .. texture_version .. "_divider_bottom",
			edge = "menu_frame_" .. texture_version .. "_divider_vertical",
		},
		style = {
			edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					6,
					6,
				},
				size = {
					5,
					size[2] - 9,
				},
				texture_tiling_size = {
					5,
					size[2] - 9,
				},
			},
			edge_holder_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-6,
					size[2] - 7,
					10,
				},
				size = {
					17,
					9,
				},
			},
			edge_holder_bottom = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-6,
					3,
					10,
				},
				size = {
					17,
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

local function create_career_perk_text(text, scenegraph_id)
	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return not content.button_hotspot.is_hover
					end,
				},
				{
					pass_type = "text",
					style_id = "text_hover",
					text_id = "text",
					content_check_function = function (content)
						return content.button_hotspot.is_hover
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					additional_option_id = "tooltip_data",
					pass_type = "additional_option_tooltip",
					style_id = "tooltip",
					content_check_function = function (content)
						return content.button_hotspot.is_hover
					end,
				},
			},
		},
		content = {
			text = text,
			button_hotspot = {
				allow_multi_hover = true,
			},
		},
		style = {
			text = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			text_hover = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			text_shadow = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					0,
				},
			},
			tooltip = {
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "top",
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

local widgets = {
	talent_title_text = UIWidgets.create_simple_text(Localize("hero_window_talents"), "talent_title_text", nil, nil, talent_title_text_style),
	talent_row_1 = talent_row("talent_row_1", scenegraph_definition.talent_row_1.size, 3, "green"),
	talent_row_2 = talent_row("talent_row_2", scenegraph_definition.talent_row_2.size, 3),
	talent_row_3 = talent_row("talent_row_3", scenegraph_definition.talent_row_3.size, 3),
	talent_row_4 = talent_row("talent_row_4", scenegraph_definition.talent_row_4.size, 3),
	talent_row_5 = talent_row("talent_row_5", scenegraph_definition.talent_row_5.size, 3),
	talent_row_6 = talent_row("talent_row_6", scenegraph_definition.talent_row_6.size, 3),
	career_background = UIWidgets.create_background("window_frame", scenegraph_definition.window_frame.size, "talent_tree_bg_01"),
	career_window = UIWidgets.create_frame("window_frame", scenegraph_definition.window_frame.size, window_frame, 10),
	career_background_rect = UIWidgets.create_simple_rect("window_frame", {
		150,
		0,
		0,
		0,
	}, 1),
	career_info_window = UIWidgets.create_frame("career_window", scenegraph_definition.window_frame.size, window_frame, 10),
	career_info_window_rect = UIWidgets.create_simple_rect("career_window", {
		150,
		0,
		0,
		0,
	}, 1),
	career_info_window_bottom_edge = create_window_divider("career_window_edge", scenegraph_definition.career_window_edge.size),
	career_info_window_center_edge = create_vertical_window_divider("career_window_center_edge", scenegraph_definition.career_window_center_edge.size),
	career_perks_dots = UIWidgets.create_simple_centered_texture_amount("mission_objective_01", {
		54,
		22,
	}, "career_perks", 2),
	career_perks_dots_glow = UIWidgets.create_simple_centered_texture_amount("mission_objective_glow_02", {
		54,
		22,
	}, "career_perks", 2),
	career_perk_1 = create_career_perk_text("", "career_perk_1"),
	career_perk_2 = create_career_perk_text("", "career_perk_2"),
	career_perk_3 = create_career_perk_text("", "career_perk_3"),
	passive_title_text = UIWidgets.create_simple_text("n/a", "passive_title_text", nil, nil, sub_title_text_style),
	passive_type_title = UIWidgets.create_simple_text(Localize("hero_view_passive_ability"), "passive_type_title", nil, nil, type_title_text_style),
	passive_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "passive_title_divider"),
	passive_description_text = UIWidgets.create_simple_text("n/a", "passive_description_text", nil, nil, description_text_style),
	passive_icon = UIWidgets.create_simple_texture("icons_placeholder", "passive_icon"),
	passive_icon_frame = UIWidgets.create_simple_texture("talent_frame", "passive_icon_frame"),
	active_title_text = UIWidgets.create_simple_text("n/a", "active_title_text", nil, nil, sub_title_text_style),
	active_type_title = UIWidgets.create_simple_text(Localize("hero_view_activated_ability"), "active_type_title", nil, nil, type_title_text_style),
	active_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "active_title_divider"),
	active_description_text = UIWidgets.create_simple_text("n/a", "active_description_text", nil, nil, description_text_style),
	active_icon = UIWidgets.create_simple_texture("icons_placeholder", "active_icon"),
	active_icon_frame = UIWidgets.create_simple_texture("talent_frame", "active_icon_frame"),
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
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
	node_widgets = node_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
}
