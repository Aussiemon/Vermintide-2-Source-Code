-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_character_summary_definitions.lua

local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local list_spacing = 2
local list_entry_size = {
	400,
	20,
}
local career_info_size = {
	450,
	170,
}
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	item_list_window = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			list_entry_size[1] + 60,
			740,
		},
		position = {
			0,
			-100,
			1,
		},
	},
	item_list_mask = {
		horizontal_alignment = "center",
		parent = "item_list_window",
		vertical_alignment = "bottom",
		size = {
			list_entry_size[1] + 60,
			690,
		},
		position = {
			0,
			0,
			1,
		},
	},
	item_list = {
		horizontal_alignment = "center",
		parent = "item_list_mask",
		vertical_alignment = "top",
		size = {
			list_entry_size[1] + 60,
			672,
		},
		position = {
			0,
			-14,
			1,
		},
	},
	list_scrollbar = {
		horizontal_alignment = "right",
		parent = "item_list_mask",
		vertical_alignment = "top",
		size = {
			16,
			690,
		},
		position = {
			-12,
			0,
			1,
		},
	},
	list_scroll_root = {
		horizontal_alignment = "left",
		parent = "item_list_mask",
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
	list_item = {
		horizontal_alignment = "left",
		parent = "list_scroll_root",
		vertical_alignment = "top",
		size = list_entry_size,
		position = {
			12,
			-10,
			1,
		},
	},
	window_title = {
		horizontal_alignment = "left",
		parent = "item_list_window",
		vertical_alignment = "top",
		size = {
			list_entry_size[1] + 40,
			40,
		},
		position = {
			0,
			-10,
			1,
		},
	},
	passive_window = {
		horizontal_alignment = "left",
		parent = "item_list_window",
		vertical_alignment = "top",
		size = career_info_size,
		position = {
			0,
			-60,
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
			career_info_size[2] - 90,
		},
		position = {
			90,
			0,
			1,
		},
	},
	active_window = {
		horizontal_alignment = "left",
		parent = "passive_window",
		vertical_alignment = "top",
		size = career_info_size,
		position = {
			0,
			-career_info_size[2],
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
			career_info_size[2] - 90,
		},
		position = {
			90,
			0,
			1,
		},
	},
	perk_title_text = {
		horizontal_alignment = "left",
		parent = "active_window",
		vertical_alignment = "bottom",
		size = {
			career_info_size[1] * 0.6,
			50,
		},
		position = {
			10,
			-50,
			1,
		},
	},
	perk_title_divider = {
		horizontal_alignment = "left",
		parent = "perk_title_text",
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
	career_perk_1 = {
		horizontal_alignment = "left",
		parent = "perk_title_divider",
		vertical_alignment = "bottom",
		size = {
			420,
			1,
		},
		position = {
			10,
			-30,
			1,
		},
	},
	career_perk_2 = {
		horizontal_alignment = "left",
		parent = "career_perk_1",
		vertical_alignment = "center",
		size = {
			420,
			1,
		},
		position = {
			0,
			0,
			1,
		},
	},
	career_perk_3 = {
		horizontal_alignment = "left",
		parent = "career_perk_2",
		vertical_alignment = "center",
		size = {
			420,
			1,
		},
		position = {
			0,
			0,
			1,
		},
	},
	talent_root = {
		horizontal_alignment = "left",
		parent = "item_list_window",
		vertical_alignment = "bottom",
		size = {
			80,
			80,
		},
		position = {
			0,
			-86,
			10,
		},
	},
	hero_root = {
		horizontal_alignment = "left",
		parent = "item_list_window",
		vertical_alignment = "top",
		size = {
			110,
			130,
		},
		position = {
			106,
			-56,
			1,
		},
	},
	hero_icon_root = {
		horizontal_alignment = "left",
		parent = "hero_root",
		vertical_alignment = "center",
		size = {
			80,
			80,
		},
		position = {
			-93,
			0,
			1,
		},
	},
	hero_selection_button = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			465,
			110,
		},
		position = {
			0,
			0,
			30,
		},
	},
	hero_selection_warning = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			465,
			30,
		},
		position = {
			0,
			-70,
			1,
		},
	},
}

local function create_talent_widget(scenegraph_id)
	local size = scenegraph_definition[scenegraph_id].size
	local shadow_frame_name = "shadow_frame_02"
	local shadow_frame_settings = UIFrameSettings[shadow_frame_name]
	local shadow_edge_height = shadow_frame_settings.texture_sizes.horizontal[2]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_edge_height = hover_frame_settings.texture_sizes.horizontal[2]
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			style_id = "button_hotspot",
			content_check_function = function (content)
				return not content.parent.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "selected_frame",
			texture_id = "selected_frame",
			content_check_function = function (content)
				return content.selected
			end,
		},
		{
			pass_type = "texture",
			style_id = "lock",
			texture_id = "lock",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "level_text",
			text_id = "level_text",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "level_text_shadow",
			text_id = "level_text",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "shadow_frame",
			texture_id = "shadow_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame",
		},
		{
			pass_type = "talent_tooltip",
			style_id = "talent",
			talent_id = "talent",
			content_check_function = function (content)
				return content.talent and content.button_hotspot.is_hover
			end,
		},
	}
	local content = {
		background = "simple_rect_texture",
		frame = "talent_frame",
		icon = "talent_lock_fg",
		level_text = "-",
		lock = "talent_lock_fg",
		locked = false,
		selected = false,
		selected_frame = "item_icon_selection",
		button_hotspot = {},
		shadow_frame = shadow_frame_settings.texture,
		hover_frame = hover_frame_settings.texture,
		size = size,
	}
	local style = {
		talent = {
			offset = {
				-244,
				-80,
				10,
			},
		},
		button_hotspot = {
			offset = {
				0,
				0,
				0,
			},
		},
		lock = {
			saturated = true,
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
		icon = {
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
				2,
			},
		},
		selected_frame = {
			color = {
				255,
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
		background = {
			color = {
				255,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		shadow_frame = {
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
			frame_margins = {
				-shadow_edge_height,
				-shadow_edge_height,
			},
			texture_size = shadow_frame_settings.texture_size,
			texture_sizes = shadow_frame_settings.texture_sizes,
		},
		hover_frame = {
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				16,
			},
			frame_margins = {
				-hover_edge_height,
				-hover_edge_height,
			},
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
		},
		level_text = {
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("red", 255),
			offset = {
				0,
				-5,
				4,
			},
		},
		level_text_shadow = {
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-7,
				3,
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

local function create_stat_widget(scenegraph_id, masked)
	local size = scenegraph_definition[scenegraph_id].size
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			style_id = "button_hotspot",
		},
		{
			pass_type = "text",
			style_id = "name",
			text_id = "name",
		},
		{
			pass_type = "text",
			style_id = "name_shadow",
			text_id = "name",
		},
		{
			pass_type = "text",
			style_id = "title",
			text_id = "title",
		},
		{
			pass_type = "text",
			style_id = "title_shadow",
			text_id = "title",
		},
		{
			pass_type = "text",
			style_id = "value",
			text_id = "value",
		},
		{
			pass_type = "text",
			style_id = "value_shadow",
			text_id = "value",
		},
	}
	local content = {
		background = "headline_bg_40",
		name = "n/a",
		title = "n/a",
		value = "n/a",
		button_hotspot = {},
		size = size,
	}
	local style = {
		button_hotspot = {
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
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		name = {
			font_size = 20,
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				0,
				0,
				2,
			},
		},
		name_shadow = {
			font_size = 20,
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				1,
				-1,
				1,
			},
		},
		title = {
			font_size = 24,
			horizontal_alignment = "left",
			localize = false,
			upper_case = true,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				0,
				0,
				2,
			},
		},
		title_shadow = {
			font_size = 24,
			horizontal_alignment = "left",
			localize = false,
			upper_case = true,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-2,
				1,
			},
		},
		value = {
			font_size = 20,
			horizontal_alignment = "right",
			localize = false,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				0,
				0,
				2,
			},
		},
		value_shadow = {
			font_size = 20,
			horizontal_alignment = "right",
			localize = false,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				1,
				-1,
				1,
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

local function create_toggle_title_widget(scenegraph_id, title_text1, title_text2)
	local size = scenegraph_definition[scenegraph_id].size
	local text_spacing = 10
	local passes = {
		{
			content_id = "hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "text",
			style_id = "title_text1",
			text_id = "title_text1",
		},
		{
			pass_type = "text",
			style_id = "title_text1_shadow",
			text_id = "title_text1",
		},
		{
			pass_type = "text",
			style_id = "title_text2",
			text_id = "title_text2",
		},
		{
			pass_type = "text",
			style_id = "title_text2_shadow",
			text_id = "title_text2",
		},
		{
			pass_type = "text",
			style_id = "divider",
			text_id = "divider",
		},
		{
			pass_type = "text",
			style_id = "divider_shadow",
			text_id = "divider",
		},
	}
	local content = {
		background = "headline_bg_40",
		divider = "  /  ",
		hotspot = {},
		default_title_text1 = title_text1,
		title_text1 = title_text1,
		default_title_text2 = title_text2,
		title_text2 = title_text2,
		size = size,
		text_spacing = text_spacing,
	}
	local style = {
		background = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			texture_size = size,
			color = {
				120,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		title_text1 = {
			default_font_size = 28,
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "right",
			upper_case = true,
			vertical_alignment = "bottom",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			default_color = {
				255,
				120,
				120,
				120,
			},
			selected_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				0,
				-7,
				2,
			},
			default_offset = {
				0,
				-7,
				2,
			},
		},
		title_text1_shadow = {
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "right",
			upper_case = true,
			vertical_alignment = "bottom",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-9,
				1,
			},
			default_offset = {
				2,
				-9,
				1,
			},
		},
		title_text2 = {
			default_font_size = 28,
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "bottom",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			default_color = {
				255,
				120,
				120,
				120,
			},
			selected_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				0,
				-7,
				2,
			},
			default_offset = {
				0,
				-7,
				2,
			},
		},
		title_text2_shadow = {
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "bottom",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-9,
				1,
			},
			default_offset = {
				2,
				-9,
				1,
			},
		},
		divider = {
			default_font_size = 28,
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "bottom",
			text_color = {
				255,
				120,
				120,
				120,
			},
			offset = {
				0,
				-7,
				2,
			},
		},
		divider_shadow = {
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "bottom",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-9,
				1,
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

local function create_title_widget(scenegraph_id, title_text)
	local size = scenegraph_definition[scenegraph_id].size
	local text_spacing = 10
	local passes = {
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
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
	}
	local content = {
		background = "headline_bg_40",
		default_title_text = title_text,
		title_text = title_text,
		size = size,
		text_spacing = text_spacing,
	}
	local style = {
		background = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			texture_size = size,
			color = {
				120,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		title_text = {
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				text_spacing,
				-3,
				2,
			},
			size = {
				size[1] - text_spacing,
				size[2],
			},
		},
		title_text_shadow = {
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				text_spacing + 2,
				-5,
				1,
			},
			size = {
				size[1] - text_spacing,
				size[2],
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

local function create_window(scenegraph_id)
	local size = scenegraph_definition[scenegraph_id].size
	local frame_settings = UIFrameSettings.frame_outer_glow_01
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local passes = {
		{
			pass_type = "rect",
			style_id = "background",
		},
		{
			pass_type = "tiled_texture",
			style_id = "pattern",
			texture_id = "pattern",
		},
		{
			pass_type = "texture",
			style_id = "pattern_mask",
			texture_id = "pattern_mask",
		},
		{
			pass_type = "tiled_texture",
			style_id = "top_edge",
			texture_id = "edge",
		},
		{
			pass_type = "tiled_texture",
			style_id = "bottom_edge",
			texture_id = "edge",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			content_id = "top_corner",
			pass_type = "texture_uv",
			style_id = "top_corner",
		},
		{
			content_id = "bottom_corner",
			pass_type = "texture_uv",
			style_id = "bottom_corner",
		},
	}
	local content = {
		background = "headline_bg_40",
		edge = "edge_divider_01_horizontal",
		pattern = "background_pattern_01_transparent",
		pattern_mask = "background_pattern_fade_write_mask",
		top_corner = {
			texture_id = "divider_corner_01",
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
		bottom_corner = {
			texture_id = "divider_corner_01",
			uvs = {
				{
					1,
					1,
				},
				{
					0,
					0,
				},
			},
		},
		frame = frame_settings.texture,
		size = size,
	}
	local style = {
		background = {
			color = {
				0,
				0,
				0,
				0,
			},
			default_color = {
				0,
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
		frame = {
			frame_margins = {
				-edge_height,
				-edge_height,
			},
			color = {
				150,
				0,
				0,
				0,
			},
			default_color = {
				150,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				0,
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
		},
		pattern = {
			texture_tiling_size = {
				256,
				256,
			},
			color = {
				255,
				10,
				10,
				10,
			},
			default_color = {
				255,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				1,
			},
		},
		pattern_mask = {
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
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
		top_edge = {
			horizontal_alignment = "left",
			use_parent_height = false,
			use_parent_width = true,
			vertical_alignment = "top",
			texture_size = {
				64,
				4,
			},
			texture_tiling_size = {
				64,
				4,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
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
		bottom_edge = {
			horizontal_alignment = "left",
			use_parent_height = false,
			use_parent_width = true,
			vertical_alignment = "bottom",
			texture_size = {
				64,
				4,
			},
			texture_tiling_size = {
				64,
				4,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
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
		top_corner = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = {
				28,
				28,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				9,
			},
		},
		bottom_corner = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			texture_size = {
				28,
				28,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				9,
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

local function create_list_mask(scenegraph_id)
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
		},
	}
	local content = {
		mask_texture = "mask_rect",
		hotspot = {},
	}
	local style = {
		mask = {
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
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

local function create_career_perk_text(scenegraph_id)
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
					pass_type = "text",
					style_id = "description_text",
					text_id = "description_text",
				},
				{
					pass_type = "text",
					style_id = "description_text_shadow",
					text_id = "description_text",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
			},
		},
		content = {
			description_text = "n/a",
			icon = "tooltip_marker",
			title_text = "n/a",
		},
		style = {
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				texture_size = {
					13,
					13,
				},
				offset = {
					-5,
					6,
					2,
				},
			},
			title_text = {
				dynamic_font_size = true,
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					15,
					-5,
					2,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					17,
					-7,
					0,
				},
			},
			description_text = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					15,
					0,
					2,
				},
			},
			description_text_shadow = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					17,
					-2,
					0,
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

local function create_hero_widget(scenegraph_id)
	local size = scenegraph_definition[scenegraph_id].size
	local frame_style = "menu_frame_12"
	local frame_settings = UIFrameSettings[frame_style]
	local shadow_frame_name = "shadow_frame_02"
	local shadow_frame_settings = UIFrameSettings[shadow_frame_name]
	local shadow_edge_height = shadow_frame_settings.texture_sizes.horizontal[2]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_edge_height = hover_frame_settings.texture_sizes.horizontal[2]

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "portrait",
					texture_id = "portrait",
				},
				{
					pass_type = "rect",
					style_id = "rect",
				},
				{
					pass_type = "texture",
					style_id = "lock_texture",
					texture_id = "lock_texture",
					content_check_function = function (content)
						return content.locked
					end,
				},
				{
					pass_type = "texture",
					style_id = "taken_texture",
					texture_id = "taken_texture",
					content_check_function = function (content)
						return content.taken and not content.locked
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "rect",
					style_id = "overlay_locked",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.locked
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "hover_frame",
					texture_id = "hover_frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "shadow_frame",
					texture_id = "shadow_frame",
				},
			},
		},
		content = {
			lock_texture = "hero_icon_locked",
			locked = false,
			portrait = "icons_placeholder",
			taken = false,
			taken_texture = "hero_icon_unavailable",
			button_hotspot = {},
			frame = frame_settings.texture,
			hover_frame = hover_frame_settings.texture,
			shadow_frame = shadow_frame_settings.texture,
			size = size,
		},
		style = {
			rect = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = size,
				color = {
					200,
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
			portrait = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = size,
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
			lock_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					76,
					87,
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
					5,
				},
			},
			taken_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					112,
					112,
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
			overlay_locked = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = size,
				color = {
					200,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					2,
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
					4,
				},
			},
			shadow_frame = {
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
				frame_margins = {
					-shadow_edge_height,
					-shadow_edge_height,
				},
				texture_size = shadow_frame_settings.texture_size,
				texture_sizes = shadow_frame_settings.texture_sizes,
			},
			hover_frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					5,
				},
				frame_margins = {
					-hover_edge_height,
					-hover_edge_height,
				},
				texture_size = hover_frame_settings.texture_size,
				texture_sizes = hover_frame_settings.texture_sizes,
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

local function create_hero_icon_widget(scenegraph_id)
	local size = scenegraph_definition[scenegraph_id].size

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "icon_highlight",
					texture_id = "icon_highlight",
				},
			},
		},
		content = {
			icon = "hero_icon_large_bright_wizard",
			icon_highlight = "hero_icon_large_bright_wizard",
			size = size,
		},
		style = {
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = size,
				color = {
					200,
					80,
					80,
					80,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			icon_highlight = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = size,
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

local description_text_style = {
	font_size = 18,
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
local hero_selection_warning_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		2,
	},
}
local widgets = {
	summary_title = create_toggle_title_widget("window_title", "Overview", "Statistics"),
	hero_selection_title = create_title_widget("window_title", Localize("popup_choice_switch_hero")),
	item_list_window = create_window("item_list_window"),
	item_list_mask = create_list_mask("item_list_mask", scenegraph_definition.item_list_mask.size, 20),
	list_scrollbar = UIWidgets.create_chain_scrollbar("list_scrollbar", "item_list_window", scenegraph_definition.list_scrollbar.size),
	hero_selection_button = UIWidgets.create_simple_hotspot("hero_selection_button"),
	window_button = UIWidgets.create_simple_hotspot("item_list_window"),
	hero_selection_warning = UIWidgets.create_simple_text("Currently playing as another hero", "hero_selection_warning", nil, nil, hero_selection_warning_style),
}
local career_info_widgets = {
	perk_title_text = UIWidgets.create_simple_text(Localize("hero_view_perk_title"), "perk_title_text", nil, nil, sub_title_text_style),
	perk_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "perk_title_divider"),
	career_perk_1 = create_career_perk_text("career_perk_1"),
	career_perk_2 = create_career_perk_text("career_perk_2"),
	career_perk_3 = create_career_perk_text("career_perk_3"),
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
				ui_scenegraph.item_list_window.local_position[1] = scenegraph_definition.item_list_window.position[1] + math.floor(100 * (1 - anim_progress))
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	widgets = widgets,
	career_info_widgets = career_info_widgets,
	list_spacing = list_spacing,
	create_hero_icon_widget = create_hero_icon_widget,
	create_hero_widget = create_hero_widget,
	create_stat_widget = create_stat_widget,
	create_talent_widget = create_talent_widget,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
