-- chunkname: @scripts/ui/hud_ui/boss_health_ui_definitions.lua

local_require("scripts/ui/ui_widgets")

local retained_mode = false
local bar_length = 440
local scenegraph_definition = {
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
	pivot_parent = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			bar_length,
			70,
		},
		position = {
			33,
			-44,
			0,
		},
	},
	pivot = {
		horizontal_alignment = "left",
		parent = "pivot_parent",
		vertical_alignment = "bottom",
		size = {
			bar_length,
			14,
		},
		position = {
			0,
			0,
			0,
		},
	},
	pivot_dragger = {
		horizontal_alignment = "left",
		parent = "pivot",
		vertical_alignment = "top",
		size = {
			bar_length,
			70,
		},
		position = {
			0,
			0,
			0,
		},
	},
}

if IS_CONSOLE then
	scenegraph_definition.screen.scale = "hud_fit"
end

local function create_health_bar_widget()
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local default_offset = {
		0,
		0,
		0,
	}
	local line1_y = -40
	local line2_y = -56
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "texture",
			style_id = "lower_marked_bg",
			texture_id = "lower_marked_bg",
			retained_mode = retained_mode,
			content_check_function = function (content)
				return content.attributes[1]
			end,
		},
		{
			pass_type = "texture",
			style_id = "lower_normal_bg",
			texture_id = "lower_normal_bg",
			retained_mode = retained_mode,
			content_check_function = function (content)
				return not content.attributes[1]
			end,
		},
		{
			pass_type = "texture",
			style_id = "marked_portrait_frame",
			texture_id = "marked_portrait_frame",
			retained_mode = retained_mode,
			content_check_function = function (content)
				return content.attributes[1]
			end,
		},
		{
			pass_type = "texture",
			style_id = "skull_divider1",
			texture_id = "skull_divider1",
			retained_mode = retained_mode,
			content_check_function = function (content)
				return content.attributes[2]
			end,
		},
		{
			pass_type = "texture",
			style_id = "skull_divider2",
			texture_id = "skull_divider2",
			retained_mode = retained_mode,
			content_check_function = function (content)
				return content.attributes[3]
			end,
		},
		{
			pass_type = "texture",
			style_id = "skull_divider3",
			texture_id = "skull_divider3",
			retained_mode = retained_mode,
			content_check_function = function (content)
				return content.attributes[5]
			end,
		},
		{
			pass_type = "texture",
			style_id = "skull_divider4",
			texture_id = "skull_divider4",
			retained_mode = retained_mode,
			content_check_function = function (content)
				return content.attributes[6]
			end,
		},
	}
	local content = {
		lower_marked_bg = "boss_hp_bar_marked_bg",
		lower_normal_bg = "boss_hp_bar_bottom",
		marked_portrait_frame = "unit_frame_portrait_enemy_marked",
		skull_divider1 = "skull_divider",
		skull_divider2 = "skull_divider",
		skull_divider3 = "skull_divider",
		skull_divider4 = "skull_divider",
	}
	local style = {
		lower_marked_bg = {
			size = {
				472,
				55,
			},
			offset = {
				-23,
				-83,
				2,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		lower_normal_bg = {
			size = {
				472,
				55,
			},
			offset = {
				-23,
				-83,
				2,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		marked_portrait_frame = {
			size = {
				60,
				70,
			},
			offset = {
				-62,
				-52,
				7,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		skull_divider1 = {
			size = {
				22,
				27,
			},
			offset = {
				4,
				line1_y,
				7,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		skull_divider2 = {
			size = {
				22,
				27,
			},
			offset = {
				34,
				line1_y,
				7,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		skull_divider3 = {
			size = {
				22,
				27,
			},
			offset = {
				64,
				line1_y,
				7,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		skull_divider4 = {
			size = {
				22,
				27,
			},
			offset = {
				430,
				line1_y,
				7,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
	}
	local text_style_ids = {}

	content.attributes = {}

	local bar_bg_name = "bar_bg"
	local bar_y = -24

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = bar_bg_name,
		style_id = bar_bg_name,
		retained_mode = retained_mode,
	}
	content[bar_bg_name] = "boss_hp_bar_bg"
	style[bar_bg_name] = {
		color = table.clone(default_color),
		offset = {
			0,
			bar_y,
			0,
		},
	}
	text_style_ids[#text_style_ids + 1] = bar_bg_name

	local bar_name = "bar"

	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = bar_name,
		style_id = bar_name,
		retained_mode = retained_mode,
	}
	style[bar_name] = {
		color = {
			255,
			255,
			255,
			255,
		},
		size = {
			bar_length,
			14,
		},
		offset = {
			0,
			bar_y,
			2,
		},
		default_offset = {
			0,
			0,
			2,
		},
		default_size = {
			bar_length,
			14,
		},
	}
	content[bar_name] = {
		texture_id = "boss_hp_bar_fill",
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
	}
	text_style_ids[#text_style_ids + 1] = bar_name

	local healing_bar_name = "healing_bar"

	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = healing_bar_name,
		style_id = healing_bar_name,
		retained_mode = retained_mode,
	}
	style[healing_bar_name] = {
		color = {
			200,
			255,
			255,
			255,
		},
		size = {
			bar_length,
			14,
		},
		offset = {
			0,
			bar_y,
			3,
		},
		default_offset = {
			0,
			0,
			3,
		},
		default_size = {
			bar_length,
			14,
		},
	}
	content[healing_bar_name] = {
		texture_id = "boss_hp_bar_healing",
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
	}
	text_style_ids[#text_style_ids + 1] = healing_bar_name

	local dead_space_bar_name = "dead_space_bar"

	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = dead_space_bar_name,
		style_id = dead_space_bar_name,
		retained_mode = retained_mode,
	}
	style[dead_space_bar_name] = {
		color = {
			255,
			255,
			255,
			255,
		},
		size = {
			bar_length,
			14,
		},
		offset = {
			0,
			bar_y,
			1,
		},
		default_offset = {
			0,
			0,
			1,
		},
		default_size = {
			bar_length,
			14,
		},
	}
	content[dead_space_bar_name] = {
		texture_id = "boss_hp_bar_dead_space",
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
	}
	text_style_ids[#text_style_ids + 1] = dead_space_bar_name

	local dead_space_bar_divider_name = "dead_space_bar_divider"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = dead_space_bar_divider_name,
		style_id = dead_space_bar_divider_name,
		retained_mode = retained_mode,
		content_check_function = function (content)
			local max_health_fraction = content.max_health_fraction or 1

			return max_health_fraction ~= 1
		end,
	}
	content[dead_space_bar_divider_name] = "boss_hp_divider"
	style[dead_space_bar_divider_name] = {
		default_width_offset = 11,
		color = table.clone(default_color),
		offset = {
			bar_length - 11,
			bar_y - 8,
			7,
		},
		size = {
			21,
			29,
		},
	}
	text_style_ids[#text_style_ids + 1] = dead_space_bar_divider_name

	local bar_edge_name = "bar_edge"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = bar_edge_name,
		style_id = bar_edge_name,
		retained_mode = retained_mode,
		content_check_function = function (content)
			local bar_edge_fraction = content.bar_edge_fraction or 1

			return bar_edge_fraction ~= 1
		end,
	}
	content[bar_edge_name] = "boss_hp_bar_edge"
	style[bar_edge_name] = {
		default_width_offset = 7,
		color = table.clone(default_color),
		offset = {
			bar_length - 7,
			bar_y,
			4,
		},
		size = {
			13,
			14,
		},
	}
	text_style_ids[#text_style_ids + 1] = bar_edge_name

	local bar_fg_name = "bar_fg"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = bar_fg_name,
		style_id = bar_fg_name,
		retained_mode = retained_mode,
	}
	content[bar_fg_name] = "boss_hp_bar"
	style[bar_fg_name] = {
		size = {
			459,
			75,
		},
		offset = {
			-6,
			-35,
			5,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}
	text_style_ids[#text_style_ids + 1] = bar_fg_name

	local portrait_name = "portrait"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = portrait_name,
		style_id = portrait_name,
		retained_mode = retained_mode,
	}
	content[portrait_name] = "boss_hp_bar"
	style[portrait_name] = {
		size = {
			60,
			70,
		},
		offset = {
			-62,
			-52,
			6,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}
	text_style_ids[#text_style_ids + 1] = portrait_name

	local portrait_healing_name = "portrait_healing"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = portrait_healing_name,
		style_id = portrait_healing_name,
		retained_mode = retained_mode,
	}
	content[portrait_healing_name] = "boss_portrait_heal"
	style[portrait_healing_name] = {
		size = {
			52,
			62,
		},
		offset = {
			-58,
			-48,
			7,
		},
		color = {
			255,
			0,
			255,
			0,
		},
	}
	text_style_ids[#text_style_ids + 1] = portrait_healing_name

	local title_y = 4
	local title_text = "title_text"

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = title_text,
		style_id = title_text,
		retained_mode = retained_mode,
	}
	content[title_text] = ""
	style[title_text] = {
		font_size = 24,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = false,
		vertical_alignment = "top",
		text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		offset = {
			4,
			4,
			7,
		},
	}
	text_style_ids[#text_style_ids + 1] = title_text

	local title_text_shadow = "title_text_shadow_shadow"

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = title_text,
		style_id = title_text_shadow,
		retained_mode = retained_mode,
	}
	content[title_text_shadow] = ""
	style[title_text_shadow] = {
		font_size = 24,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = true,
		vertical_alignment = "top",
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			6,
			title_y - 2,
			6,
		},
	}
	text_style_ids[#text_style_ids + 1] = title_text_shadow
	content.text_style_ids = text_style_ids

	local attribute_text = "attribute_text1"

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = attribute_text,
		style_id = attribute_text,
		retained_mode = retained_mode,
		content_check_function = function (content)
			return content.attributes[1]
		end,
	}
	content[attribute_text] = ""
	content.show_attributes = true
	style[attribute_text] = {
		font_size = 16,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = false,
		vertical_alignment = "top",
		text_color = Colors.get_color_table_with_alpha("orange", 255),
		offset = {
			4,
			line1_y,
			7,
		},
	}
	text_style_ids[#text_style_ids + 1] = attribute_text
	attribute_text = "attribute_text2"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = attribute_text,
		style_id = attribute_text,
		retained_mode = retained_mode,
		content_check_function = function (content)
			return content.attributes[2]
		end,
	}
	content[attribute_text] = ""
	content.show_attributes = true
	style[attribute_text] = {
		font_size = 16,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = false,
		vertical_alignment = "top",
		text_color = Colors.get_color_table_with_alpha("yellow", 255),
		offset = {
			4,
			line1_y,
			7,
		},
	}
	text_style_ids[#text_style_ids + 1] = attribute_text
	attribute_text = "attribute_text3"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = attribute_text,
		style_id = attribute_text,
		retained_mode = retained_mode,
		content_check_function = function (content)
			return content.attributes[3]
		end,
	}
	content[attribute_text] = ""
	content.show_attributes = true
	style[attribute_text] = {
		font_size = 16,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = false,
		vertical_alignment = "top",
		text_color = Colors.get_color_table_with_alpha("yellow", 255),
		offset = {
			4,
			line1_y,
			7,
		},
	}
	text_style_ids[#text_style_ids + 1] = attribute_text
	attribute_text = "attribute_text4"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = attribute_text,
		style_id = attribute_text,
		retained_mode = retained_mode,
		content_check_function = function (content)
			return content.attributes[4]
		end,
	}
	content[attribute_text] = ""
	content.show_attributes = true
	style[attribute_text] = {
		font_size = 16,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = false,
		vertical_alignment = "top",
		text_color = Colors.get_color_table_with_alpha("yellow", 255),
		offset = {
			4,
			line2_y,
			7,
		},
	}
	text_style_ids[#text_style_ids + 1] = attribute_text
	attribute_text = "attribute_text5"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = attribute_text,
		style_id = attribute_text,
		retained_mode = retained_mode,
		content_check_function = function (content)
			return content.attributes[5]
		end,
	}
	content[attribute_text] = ""
	content.show_attributes = true
	style[attribute_text] = {
		font_size = 16,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = false,
		vertical_alignment = "top",
		text_color = Colors.get_color_table_with_alpha("yellow", 255),
		offset = {
			4,
			line2_y,
			7,
		},
	}
	text_style_ids[#text_style_ids + 1] = attribute_text
	attribute_text = "attribute_text6"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = attribute_text,
		style_id = attribute_text,
		retained_mode = retained_mode,
		content_check_function = function (content)
			return content.attributes[6]
		end,
	}
	content[attribute_text] = ""
	content.show_attributes = true
	style[attribute_text] = {
		font_size = 16,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = false,
		vertical_alignment = "top",
		text_color = Colors.get_color_table_with_alpha("yellow", 255),
		offset = {
			4,
			line2_y,
			7,
		},
	}
	text_style_ids[#text_style_ids + 1] = attribute_text
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = "pivot"

	return widget
end

return {
	scenegraph_definition = scenegraph_definition,
	bar_length = bar_length,
	widget_create_func = create_health_bar_widget,
}
