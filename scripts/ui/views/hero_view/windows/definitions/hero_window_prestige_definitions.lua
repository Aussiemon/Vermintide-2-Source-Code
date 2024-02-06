-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_prestige_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_width_offset = window_size[1] * 2 + window_spacing * 2
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
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
		size = {
			window_size[1] * 2 + window_spacing,
			window_size[2],
		},
		position = {
			0,
			0,
			1,
		},
	},
	title_text_glow = {
		horizontal_alignment = "center",
		parent = "window_frame",
		vertical_alignment = "top",
		size = {
			544,
			16,
		},
		position = {
			0,
			15,
			-1,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "title_text_glow",
		vertical_alignment = "center",
		size = {
			window_size[1],
			50,
		},
		position = {
			0,
			15,
			1,
		},
	},
	reward_window = {
		horizontal_alignment = "right",
		parent = "window_frame",
		vertical_alignment = "top",
		size = {
			450,
			500,
		},
		position = {
			-50,
			-100,
			1,
		},
	},
	reward_title_text = {
		horizontal_alignment = "center",
		parent = "reward_window",
		vertical_alignment = "top",
		size = {
			450,
			50,
		},
		position = {
			0,
			0,
			1,
		},
	},
	reward_description_text = {
		horizontal_alignment = "center",
		parent = "reward_window",
		vertical_alignment = "top",
		size = {
			400,
			225,
		},
		position = {
			0,
			-50,
			1,
		},
	},
	reward_portrait_root = {
		horizontal_alignment = "center",
		parent = "reward_window",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			5,
		},
	},
	reward_item_text_detail = {
		horizontal_alignment = "center",
		parent = "reward_portrait_root",
		vertical_alignment = "top",
		size = {
			264,
			32,
		},
		position = {
			0,
			-120,
			10,
		},
	},
	reward_item_text = {
		horizontal_alignment = "center",
		parent = "reward_item_text_detail",
		vertical_alignment = "center",
		size = {
			400,
			0,
		},
		position = {
			0,
			30,
			1,
		},
	},
	info_window = {
		horizontal_alignment = "left",
		parent = "window_frame",
		vertical_alignment = "top",
		size = {
			450,
			500,
		},
		position = {
			50,
			-100,
			1,
		},
	},
	info_title_text = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			450,
			50,
		},
		position = {
			0,
			0,
			1,
		},
	},
	info_description_text = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			400,
			225,
		},
		position = {
			0,
			-50,
			1,
		},
	},
	prestige_button = {
		horizontal_alignment = "center",
		parent = "window_frame",
		vertical_alignment = "bottom",
		size = {
			370,
			70,
		},
		position = {
			0,
			30,
			1,
		},
	},
	impact_title_text = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "bottom",
		size = {
			400,
			50,
		},
		position = {
			0,
			200,
			1,
		},
	},
	impact_description_text = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "bottom",
		size = {
			400,
			50,
		},
		position = {
			0,
			150,
			1,
		},
	},
	unable_description_text = {
		horizontal_alignment = "center",
		parent = "window_frame",
		vertical_alignment = "bottom",
		size = {
			800,
			50,
		},
		position = {
			0,
			130,
			1,
		},
	},
	warning_popup_background = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "center",
		size = {
			800,
			700,
		},
		position = {
			0,
			0,
			25,
		},
	},
	warning_popup_title_text = {
		horizontal_alignment = "center",
		parent = "warning_popup_background",
		vertical_alignment = "top",
		size = {
			800,
			50,
		},
		position = {
			0,
			0,
			2,
		},
	},
	warning_popup_desc = {
		horizontal_alignment = "center",
		parent = "warning_popup_background",
		vertical_alignment = "top",
		size = {
			750,
			650,
		},
		position = {
			0,
			-100,
			2,
		},
	},
	warning_popup_accept_button = {
		horizontal_alignment = "center",
		parent = "warning_popup_background",
		vertical_alignment = "bottom",
		size = {
			280,
			70,
		},
		position = {
			-200,
			50,
			2,
		},
	},
	warning_popup_decline_button = {
		horizontal_alignment = "center",
		parent = "warning_popup_background",
		vertical_alignment = "bottom",
		size = {
			280,
			70,
		},
		position = {
			200,
			50,
			2,
		},
	},
	debug_level_up_button = {
		horizontal_alignment = "center",
		parent = "window_frame",
		vertical_alignment = "top",
		size = {
			window_size[1] * 2 + window_spacing,
			35,
		},
		position = {
			0,
			-5,
			2,
		},
	},
}
local title_text_style = {
	font_size = 42,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	vertical_alignment = "bottom",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local reward_title_text_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local description_text_style = {
	font_size = 18,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local impact_text_style = {
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local unable_description_text_style = {
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
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

local function talent_row(scenegraph_id, size, amount, optional_color_name)
	local button_color_name

	if optional_color_name then
		button_color_name = "button_" .. optional_color_name
	else
		button_color_name = "button_normal"
	end

	local background_color = Colors.get_color_table_with_alpha(button_color_name, 255)
	local background_texture = "talent_slot_bg"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		amount = amount,
	}
	local style = {}
	local slot_width_spacing = 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local length_with_spacing = size[1] - slot_width_spacing * (amount - 1)
	local tab_width = length_with_spacing / amount
	local button_size = {
		tab_width,
		size[2],
	}
	local icon_size = {
		80,
		80,
	}
	local start_width_offset = 0

	for k = 1, amount do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1

		total_length = total_length + button_size[1] + slot_width_spacing

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
			pass_type = "texture_uv",
			content_id = background_name,
			style_id = background_name,
		}
		style[background_name] = {
			size = button_size,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				0,
			},
		}
		content[background_name] = {
			uvs = {
				{
					0,
					1 - math.min(button_size[2] / background_texture_settings.size[2], 1),
				},
				{
					math.min(button_size[1] / background_texture_settings.size[1], 1),
					1,
				},
			},
			texture_id = background_texture,
		}

		local title_text_name = "title_text" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_name,
		}
		style[title_text_name] = {
			font_size = 18,
			font_type = "hell_shark",
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
				offset[1] + 100,
				offset[2],
				2,
			},
		}
		content[title_text_name] = "n/a"

		local title_text_shadow_name = "title_text_shadow" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_shadow_name,
		}
		style[title_text_shadow_name] = {
			font_size = 18,
			font_type = "hell_shark",
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
				offset[1] + 100 + 2,
				offset[2] - 2,
				1,
			},
		}

		local background_glow_name = "background_glow" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = background_glow_name,
			style_id = background_glow_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.is_selected or hotspot.is_hover
			end,
		}
		style[background_glow_name] = {
			size = {
				button_size[1],
				button_size[2],
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2] + 5,
				2,
			},
		}
		content[background_glow_name] = "button_state_normal"

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
				offset[2] + button_size[2] - 3,
				1,
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
			size = icon_size,
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				offset[1] + 10,
				offset[2] + button_size[2] / 2 - icon_size[2] / 2,
				2,
			},
		}
		content[icon_name] = "talent_damage_dwarf"

		local icon_frame_name = "icon_frame" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = icon_frame_name,
			style_id = icon_frame_name,
		}
		style[icon_frame_name] = {
			size = icon_size,
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				offset[1] + 10,
				offset[2] + button_size[2] / 2 - icon_size[2] / 2,
				3,
			},
		}
		content[icon_frame_name] = "icon_talent_frame"

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
		start_width_offset = start_width_offset + tab_width + slot_width_spacing
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

local function create_vertical_window_divider(scenegraph_id, size)
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
			edge = "menu_frame_09_divider_vertical",
			edge_holder_bottom = "menu_frame_09_divider_bottom",
			edge_holder_top = "menu_frame_09_divider_top",
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

local info_description_text = Localize("hero_view_prestige_information_description")
local impact_description_text = Localize("hero_view_prestige_impact_description")
local reward_description_text = Localize("hero_view_prestige_reward_description")
local unable_description_text = Localize("hero_view_prestige_unable_description")
local reward_experience_title_text = Localize("hero_view_prestige_experience_required")
local reward_experience_value_text = "586020/600000"
local center_banner_holder_text = Localize("hero_view_prestige_current_prestige_level")
local warning_widgets = {
	warning_popup_accept_button = UIWidgets.create_default_button("warning_popup_accept_button", scenegraph_definition.warning_popup_accept_button.size, nil, nil, "Accept"),
	warning_popup_decline_button = UIWidgets.create_default_button("warning_popup_decline_button", scenegraph_definition.warning_popup_decline_button.size, nil, nil, "Decline"),
	warning_popup_background = UIWidgets.create_background_with_frame("warning_popup_background", scenegraph_definition.warning_popup_background.size),
	warning_popup_title_text = UIWidgets.create_title_widget("warning_popup_title_text", scenegraph_definition.warning_popup_title_text.size, "WARNING", true),
	warning_popup_desc = UIWidgets.create_simple_text("Increasing your Prestige level will: \n - Reset character level", "warning_popup_desc", nil, nil, description_text_style),
}
local widgets = {
	window_frame = UIWidgets.create_frame("window_frame", scenegraph_definition.window_frame.size, window_frame, 10),
	window = UIWidgets.create_background("window_frame", scenegraph_definition.window_frame.size, "talent_tree_bg_01"),
	prestige_button = UIWidgets.create_default_button("prestige_button", scenegraph_definition.prestige_button.size, nil, nil, Localize("hero_view_prestige"), 32),
	info_window_frame = UIWidgets.create_frame("info_window", scenegraph_definition.info_window.size, "menu_frame_06"),
	info_window = UIWidgets.create_simple_rect("info_window", {
		100,
		0,
		0,
		0,
	}),
	info_title_text = UIWidgets.create_title_widget("info_title_text", scenegraph_definition.info_title_text.size, Localize("hero_view_prestige_information"), true, true),
	info_description_text = UIWidgets.create_simple_text(info_description_text, "info_description_text", nil, nil, description_text_style),
	impact_title_text = UIWidgets.create_simple_text(Localize("hero_view_impact"), "impact_title_text", nil, nil, impact_text_style),
	impact_description_text = UIWidgets.create_simple_text(impact_description_text, "impact_description_text", nil, nil, description_text_style),
	reward_window_frame = UIWidgets.create_frame("reward_window", scenegraph_definition.reward_window.size, "menu_frame_06"),
	reward_window = UIWidgets.create_simple_rect("reward_window", {
		100,
		0,
		0,
		0,
	}),
	reward_title_text = UIWidgets.create_title_widget("reward_title_text", scenegraph_definition.reward_title_text.size, Localize("hero_view_prestige_reward"), true, true),
	reward_description_text = UIWidgets.create_simple_text(reward_description_text, "reward_description_text", nil, nil, description_text_style),
	reward_item_text = UIWidgets.create_simple_text("n/a", "reward_item_text", nil, nil, reward_title_text_style),
	reward_item_text_detail = UIWidgets.create_simple_texture("divider_01_top", "reward_item_text_detail"),
	unable_description_text = UIWidgets.create_simple_text(unable_description_text, "unable_description_text", nil, nil, unable_description_text_style),
	debug_level_up_button = create_window_button("debug_level_up_button", scenegraph_definition.debug_level_up_button.size, "DEBUG: Get Max Experience", 18, true),
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
	warning_widgets = warning_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
