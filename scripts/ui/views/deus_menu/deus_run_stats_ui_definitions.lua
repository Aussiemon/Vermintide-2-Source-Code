-- chunkname: @scripts/ui/views/deus_menu/deus_run_stats_ui_definitions.lua

require("scripts/ui/views/deus_menu/ui_widgets_deus")

local full_size = {
	1920,
	1080,
}
local blessing_widget_size = {
	410,
	240,
}
local blessing_widget_spacing = {
	10,
	10,
}
local item_size = {
	410,
	0,
}
local item_spacing = 15
local title_size = {
	360,
	32,
}
local weapon_melee_position = {
	item_spacing,
	-50,
	1,
}
local slot_size = {
	400,
	250,
}
local healing_slot_position = {
	item_spacing + 5,
	80,
	1,
}
local potion_slot_position = {
	item_spacing + 5 + blessing_widget_spacing[1] + blessing_widget_size[1],
	80,
	1,
}
local grenade_slot_position = {
	item_spacing + 5 + (blessing_widget_spacing[1] + blessing_widget_size[1]) * 2,
	80,
	1,
}
local weapon_title_position = {
	item_size[1] * 0.5,
	0,
	1,
}
local weapon_ranged_position = {
	weapon_melee_position[1] + item_size[1] + item_spacing,
	weapon_melee_position[2],
	1,
}
local base_layer = UILayer.end_screen
local scenegraph = {
	fullscreen_fade = {
		horizontal_alignment = "center",
		scale = "fit",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			base_layer - 1,
		},
	},
	root = {
		is_root = true,
		size = full_size,
		position = {
			0,
			0,
			base_layer,
		},
	},
	screen = {
		scale = "fit",
		size = full_size,
		position = {
			0,
			0,
			base_layer + 100,
		},
	},
	screen_reminder = {
		scale = "fit",
		size = full_size,
		position = {
			0,
			0,
			base_layer,
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
		size = full_size,
		position = {
			0,
			0,
			1,
		},
	},
	power_up_description_root = {
		size = {
			484,
			194,
		},
		position = {
			0,
			0,
			base_layer + 200,
		},
	},
	center_title = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			200,
			60,
		},
		position = {
			-70,
			-50,
			1,
		},
	},
	options_background_mask = {
		horizontal_alignment = "right",
		scale = "fit_height",
		size = {
			1400,
			0,
		},
		position = {
			425,
			0,
			base_layer + 6,
		},
	},
	options_background = {
		horizontal_alignment = "right",
		scale = "fit_height",
		size = {
			900,
			0,
		},
		position = {
			425,
			0,
			base_layer + 6,
		},
	},
	options_background_edge = {
		horizontal_alignment = "right",
		scale = "fit_height",
		size = {
			200,
			0,
		},
		position = {
			-260,
			0,
			base_layer + 3,
		},
	},
	power_up_root = {
		horizontal_alignment = "left",
		parent = "options_background_edge",
		vertical_alignment = "center",
		size = {
			50,
			50,
		},
		position = {
			170,
			0,
			101,
		},
	},
	blessing_root = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			50,
			50,
		},
		position = {
			item_spacing + 5,
			-130,
			10,
		},
	},
	blessing_1 = {
		horizontal_alignment = "left",
		parent = "blessing_root",
		vertical_alignment = "center",
		size = blessing_widget_size,
		position = {
			0,
			20,
			10,
		},
	},
	blessing_2 = {
		horizontal_alignment = "left",
		parent = "blessing_1",
		vertical_alignment = "center",
		size = blessing_widget_size,
		position = {
			blessing_widget_size[1] + blessing_widget_spacing[1],
			0,
			10,
		},
	},
	blessing_3 = {
		horizontal_alignment = "left",
		parent = "blessing_2",
		vertical_alignment = "center",
		size = blessing_widget_size,
		position = {
			blessing_widget_size[1] + blessing_widget_spacing[1],
			0,
			10,
		},
	},
	blessing_4 = {
		horizontal_alignment = "left",
		parent = "blessing_root",
		vertical_alignment = "center",
		size = blessing_widget_size,
		position = {
			blessing_widget_size[1] + blessing_widget_spacing[1],
			0,
			10,
		},
	},
	blessing_5 = {
		horizontal_alignment = "left",
		parent = "blessing_4",
		vertical_alignment = "center",
		size = blessing_widget_size,
		position = {
			0,
			-blessing_widget_size[2] - blessing_widget_spacing[2],
			10,
		},
	},
	blessing_6 = {
		horizontal_alignment = "left",
		parent = "blessing_5",
		vertical_alignment = "center",
		size = blessing_widget_size,
		position = {
			0,
			-blessing_widget_size[2] - blessing_widget_spacing[2],
			10,
		},
	},
	no_blessings_text = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			400,
			30,
		},
		position = {
			-760,
			-130,
			10,
		},
	},
	deus_run_stats_input_description = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			564,
			30,
		},
		position = {
			0,
			20,
			-1,
		},
	},
	reminder_text = {
		horizontal_alignment = "center",
		parent = "screen_reminder",
		vertical_alignment = "bottom",
		size = {
			900,
			30,
		},
		position = {
			0,
			190,
			300,
		},
	},
	weapon_melee = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = weapon_melee_position,
	},
	weapon_ranged = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = weapon_ranged_position,
	},
	weapon_melee_title = {
		horizontal_alignment = "center",
		parent = "weapon_melee",
		vertical_alignment = "bottom",
		size = title_size,
		position = weapon_title_position,
	},
	weapon_ranged_title = {
		horizontal_alignment = "center",
		parent = "weapon_ranged",
		vertical_alignment = "bottom",
		size = title_size,
		position = weapon_title_position,
	},
	healing_slot = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = healing_slot_position,
	},
	potion_slot = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = potion_slot_position,
	},
	grenade_slot = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = grenade_slot_position,
	},
}
local player_career_name_style = {
	dynamic_font_size = true,
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	area_size = {
		350,
		200,
	},
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		0,
	},
}
local player_hero_name_style = {
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		0,
	},
}
local level_title_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "right",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		2,
	},
}
local difficulty_text_style = {
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		2,
	},
}
local center_title_style = {
	font_size = 68,
	font_type = "hell_shark_header",
	horizontal_alignment = "right",
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		-3,
		1,
	},
}
local no_active_items_text = {
	dynamic_font_size = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = color or Colors.get_color_table_with_alpha("white", 255),
	rect_color = rect_color or Colors.get_color_table_with_alpha("black", 150),
	line_colors = {},
	offset = {
		0,
		0,
		50,
	},
}

local function create_edge_divider(scenegraph_id, size, layer)
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
				size = {
					[2] = size[2],
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					5,
					0,
					layer,
				},
				texture_tiling_size = {
					size[1] - 10,
					5,
				},
			},
			edge_holder_left = {
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					-6,
					layer + 1,
				},
				texture_size = {
					9,
					17,
				},
			},
			edge_holder_right = {
				horizontal_alignment = "right",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					-6,
					layer + 1,
				},
				texture_size = {
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

local banner_color = {
	200,
	10,
	10,
	10,
}

function create_input_text(text, scenegraph_id, disable_with_gamepad)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content, style)
						return not ShowCursorStack.cursor_active()
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
					content_check_function = function (content, style)
						return not ShowCursorStack.cursor_active()
					end,
				},
			},
		},
		content = {
			text = text,
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "center",
				text_color = Colors.get_table("white"),
				offset = {
					0,
					0,
					2,
				},
			},
			text_shadow = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "center",
				text_color = Colors.get_table("black"),
				offset = {
					2,
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

local function create_power_up(scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "shrine_bg",
					texture_id = "shrine_bg",
					content_check_function = function (content)
						return not content.extend_left
					end,
				},
				{
					pass_type = "texture",
					style_id = "shrine_bg_left",
					texture_id = "shrine_bg",
					content_check_function = function (content)
						return content.extend_left
					end,
				},
				{
					content_id = "shrine_bg_frame_left",
					pass_type = "texture_uv",
					style_id = "shrine_bg_frame_left",
					content_check_function = function (content)
						return not content.parent.extend_left
					end,
				},
				{
					content_id = "shrine_bg_frame_right",
					pass_type = "texture_uv",
					style_id = "shrine_bg_frame_right",
					content_check_function = function (content)
						return content.parent.extend_left
					end,
				},
				{
					pass_type = "texture",
					style_id = "round_icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.icon and not content.is_rectangular_icon
					end,
				},
				{
					pass_type = "texture",
					style_id = "round_icon_bg",
					texture_id = "round_icon_bg",
					content_check_function = function (content)
						return content.icon and not content.is_rectangular_icon and false
					end,
				},
				{
					pass_type = "texture",
					style_id = "rectangular_icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.icon and content.is_rectangular_icon
					end,
				},
				{
					pass_type = "rect",
					style_id = "rectangular_bg",
					content_check_function = function (content)
						return content.icon and not content.is_rectangular_icon
					end,
				},
				{
					pass_type = "texture",
					style_id = "rectangular_icon_bg",
					texture_id = "rectangular_icon_bg",
					content_check_function = function (content)
						return true
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						return not content.extend_left
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
					content_check_function = function (content)
						return not content.extend_left
					end,
				},
				{
					pass_type = "text",
					style_id = "rarity_text",
					text_id = "rarity_text",
					content_check_function = function (content)
						return not content.extend_left
					end,
				},
				{
					pass_type = "text",
					style_id = "rarity_text_shadow",
					text_id = "rarity_text",
					content_check_function = function (content)
						return not content.extend_left
					end,
				},
				{
					pass_type = "text",
					style_id = "description_text",
					text_id = "description_text",
					content_check_function = function (content)
						return not content.extend_left
					end,
				},
				{
					pass_type = "text",
					style_id = "description_text_shadow",
					text_id = "description_text",
					content_check_function = function (content)
						return not content.extend_left
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_left",
					text_id = "title_text",
					content_check_function = function (content)
						return content.extend_left
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow_left",
					text_id = "title_text",
					content_check_function = function (content)
						return content.extend_left
					end,
				},
				{
					pass_type = "text",
					style_id = "rarity_text_left",
					text_id = "rarity_text",
					content_check_function = function (content)
						return content.extend_left
					end,
				},
				{
					pass_type = "text",
					style_id = "rarity_text_shadow_left",
					text_id = "rarity_text",
					content_check_function = function (content)
						return content.extend_left
					end,
				},
				{
					pass_type = "text",
					style_id = "description_text_left",
					text_id = "description_text",
					content_check_function = function (content)
						return content.extend_left
					end,
				},
				{
					pass_type = "text",
					style_id = "description_text_shadow_left",
					text_id = "description_text",
					content_check_function = function (content)
						return content.extend_left
					end,
				},
			},
		},
		content = {
			description_text = "description_text",
			extend_left = false,
			is_rectangular_icon = false,
			rarity_text = "rarity",
			rectangular_icon_bg = "button_frame_01",
			round_icon_bg = "button_round_bg",
			shrine_bg = "shrine_blessing_bg_hover",
			title_text = "header",
			visible = false,
			shrine_bg_frame_left = {
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
			shrine_bg_frame_right = {
				texture_id = "shrine_blessing_frame",
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
			},
		},
		style = {
			shrine_bg = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					50,
					0,
					0,
				},
				texture_size = {
					484,
					194,
				},
			},
			shrine_bg_left = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-384,
					0,
					0,
				},
				texture_size = {
					484,
					194,
				},
			},
			shrine_bg_frame_left = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					scenegraph.power_up_description_root.size[1],
					scenegraph.power_up_description_root.size[2],
				},
				offset = {
					0,
					0,
					1,
				},
			},
			shrine_bg_frame_right = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					scenegraph.power_up_description_root.size[1],
					scenegraph.power_up_description_root.size[2],
				},
				offset = {
					-384,
					0,
					1,
				},
			},
			round_icon = {
				horizontal_alignment = "left",
				masked = true,
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					28,
					0,
					10,
				},
				texture_size = {
					40,
					40,
				},
			},
			rectangular_icon = {
				horizontal_alignment = "left",
				masked = true,
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					17,
					0,
					10,
				},
				texture_size = {
					63,
					63,
				},
			},
			rectangular_bg = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					15,
					0,
					9,
				},
				texture_size = {
					63,
					63,
				},
			},
			round_icon_bg = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					10,
					0,
					9,
				},
				texture_size = {
					74,
					74,
				},
			},
			rectangular_icon_bg = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					10,
					0,
					9,
				},
				texture_size = {
					75,
					75,
				},
			},
			title_text = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				area_size = {
					250,
					scenegraph.power_up_description_root.size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					100,
					-30,
					3,
				},
			},
			rarity_text = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-60,
					-30,
					3,
				},
			},
			description_text = {
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "top",
				word_wrap = true,
				area_size = {
					320,
					100,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					100,
					-60,
					3,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				area_size = {
					250,
					scenegraph.power_up_description_root.size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					102,
					-32,
					2,
				},
			},
			rarity_text_shadow = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-58,
					-32,
					2,
				},
			},
			description_text_shadow = {
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "top",
				word_wrap = true,
				area_size = {
					320,
					120,
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					102,
					-62,
					2,
				},
			},
			title_text_left = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				area_size = {
					250,
					scenegraph.power_up_description_root.size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					-320,
					-30,
					3,
				},
			},
			rarity_text_left = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-480,
					-30,
					3,
				},
			},
			description_text_left = {
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "top",
				word_wrap = true,
				area_size = {
					320,
					120,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-320,
					-60,
					3,
				},
			},
			title_text_shadow_left = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				area_size = {
					250,
					scenegraph.power_up_description_root.size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-318,
					-32,
					2,
				},
			},
			rarity_text_shadow_left = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-478,
					-32,
					2,
				},
			},
			description_text_shadow_left = {
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "top",
				word_wrap = true,
				area_size = {
					320,
					120,
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-318,
					-62,
					2,
				},
			},
		},
		offset = {
			-15,
			-65,
			50,
		},
		scenegraph_id = scenegraph_id,
	}
end

local animations_definitions = {
	reminder = {
		{
			end_progress = 4.3,
			name = "fade_in_reminder_text",
			start_progress = 4,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				widget.style.text.text_color[1] = progress * 255
				widget.style.text_shadow.text_color[1] = progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
		{
			end_progress = 6.5,
			name = "fade_out_reminder_text",
			start_progress = 6,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				widget.style.text.text_color[1] = (1 - progress) * 255
				widget.style.text_shadow.text_color[1] = (1 - progress) * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
	},
}

function create_reminder_text(text, scenegraph_id, color)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "power_up_text",
					content_check_function = function (content)
						return content.info_type == "deus_power_up"
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "power_up_text",
					content_check_function = function (content)
						return content.info_type == "deus_power_up"
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "item_text",
					content_check_function = function (content)
						return content.info_type == "deus_item_tooltip"
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "item_text",
					content_check_function = function (content)
						return content.info_type == "deus_item_tooltip"
					end,
				},
			},
		},
		content = {
			info_type = "deus_item_tooltip",
			item_text = "reliquary_z_reminder",
			power_up_text = "reliquary_i_reminder",
		},
		style = {
			text = {
				font_size = 32,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 0),
				offset = {
					0,
					0,
					0,
				},
			},
			text_shadow = {
				font_size = 32,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 0),
				offset = {
					2,
					-2,
					-1,
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

local disable_with_gamepad = true
local widgets = {
	fullscreen_fade = UIWidgets.create_simple_rect("fullscreen_fade", {
		155,
		0,
		0,
		0,
	}),
	center_title = UIWidgets.create_simple_text(Localize("menu_weave_forge_options_sub_title_properties_utility"), "center_title", 32, nil, center_title_style),
	center_title_bg = UIWidgets.create_simple_texture("tab_menu_bg_03", "center_title"),
	options_background_edge = UIWidgets.create_simple_texture("shrine_sidebar_background", "options_background_edge"),
	options_background = UIWidgets.create_tiled_texture("options_background", "menu_frame_bg_01", {
		960,
		1400,
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
	no_blessings_text = UIWidgets.create_simple_text("", "no_blessings_text", nil, nil, no_active_items_text),
	input_description_text = create_input_text("player_list_show_mouse_description", "deus_run_stats_input_description", disable_with_gamepad),
	power_up_description = create_power_up("power_up_description_root"),
}

local function create_title_widget(scenegraph_id, text)
	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "bg",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_change_function = function (content, style)
						content.frame = UIFrameSettings[content.frame_settings_name].texture
						style.texture_size = UIFrameSettings[content.frame_settings_name].texture_size
						style.texture_sizes = UIFrameSettings[content.frame_settings_name].texture_sizes
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
			},
		},
		content = {
			frame_settings_name = "item_tooltip_frame_01",
			text = text,
		},
		style = {
			frame = {},
			bg = {
				color = {
					255,
					3,
					3,
					3,
				},
			},
			text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
			},
			text_shadow = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					1,
					-1,
					-1,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

local tooltip_passes = {
	"item_titles",
	"skin_applied",
	"ammunition",
	"fatigue",
	"item_power_level",
	"properties",
	"traits",
	"weapon_skin_title",
	"keywords",
	"light_attack_stats",
	"heavy_attack_stats",
	"detailed_stats_light",
	"detailed_stats_heavy",
	"detailed_stats_push",
	"detailed_stats_ranged_light",
	"detailed_stats_ranged_heavy",
}
local equipment_widgets = {
	weapon_melee = UIWidgets.create_simple_item_tooltip("weapon_melee", tooltip_passes),
	weapon_ranged = UIWidgets.create_simple_item_tooltip("weapon_ranged", tooltip_passes),
	weapon_melee_title = create_title_widget("weapon_melee_title", "deus_weapon_inspect_primary_title"),
	weapon_ranged_title = create_title_widget("weapon_ranged_title", "deus_weapon_inspect_secondary_title"),
	healing_slot = UIWidgets.create_framed_info_box("healing_slot", "menu_frame_12", "menu_frame_12", "menu_frame_12", Localize("deus_weapon_inspect_healing_title"), "consumables_empty_medpack", {
		50,
		50,
	}, "button_frame_01_gold", Localize("deus_weapon_inspect_title_unavailable"), Localize("deus_weapon_inspect_info_unavailable"), {
		400,
		100,
	}),
	potion_slot = UIWidgets.create_framed_info_box("potion_slot", "menu_frame_12", "menu_frame_12", "menu_frame_12", Localize("deus_weapon_inspect_potion_title"), "consumables_empty_potion", {
		50,
		50,
	}, "button_frame_01_gold", Localize("deus_weapon_inspect_title_unavailable"), Localize("deus_weapon_inspect_info_unavailable"), {
		400,
		100,
	}),
	grenade_slot = UIWidgets.create_framed_info_box("grenade_slot", "menu_frame_12", "menu_frame_12", "menu_frame_12", Localize("deus_weapon_inspect_grenade_title"), "consumables_empty_grenade", {
		50,
		50,
	}, "button_frame_01_gold", Localize("deus_weapon_inspect_title_unavailable"), Localize("deus_weapon_inspect_info_unavailable"), {
		400,
		100,
	}),
}
local weapon_melee_content = equipment_widgets.weapon_melee.content

weapon_melee_content.disable_fade_in = true
weapon_melee_content.no_equipped_item = true
weapon_melee_content.force_top_alignment = true

local weapon_ranged_content = equipment_widgets.weapon_ranged.content

weapon_ranged_content.disable_fade_in = true
weapon_ranged_content.no_equipped_item = true
weapon_ranged_content.force_top_alignment = true

local reminder_widgets = {
	reminder_text = create_reminder_text("n/a", "reminder_text"),
}
local power_up_widget_size = {
	64,
	64,
}
local power_up_widget_spacing = {
	20,
	10,
}
local max_power_up_amount = 18
local max_height = 600
local sine_strength = 0
local offset = {
	90,
	-5,
}
local total_height = 0
local column = 0

for i = 1, max_power_up_amount do
	if max_height < total_height then
		total_height = 0
		column = column + 1
	end

	local positive_offset_y = math.abs(offset[2])
	local relative_height = (positive_offset_y + total_height) / (max_height + positive_offset_y)
	local radians = math.degrees_to_radians(180 * relative_height)
	local sine_position_x = math.sin(radians) * sine_strength
	local position = {
		offset[1] + sine_position_x + column * (power_up_widget_size[1] + power_up_widget_spacing[1]),
		offset[2] + max_height / 2 - total_height,
		10,
	}

	total_height = total_height + power_up_widget_size[2] + power_up_widget_spacing[2]

	local scenegraph_id = "power_up_" .. i

	scenegraph[scenegraph_id] = {
		horizontal_alignment = "right",
		parent = "power_up_root",
		vertical_alignment = "center",
		size = power_up_widget_size,
		position = position,
	}
end

local blessing_widget_data = {
	icon_frame_name = "button_frame_01_gold",
	info_frame_name = "menu_frame_12",
	max_blessing_amount = 6,
	spacing = 0,
	title_frame_name = "menu_frame_12",
	icon_size = {
		50,
		50,
	},
	bottom_panel_size = {
		400,
		150,
	},
}
local round_power_up_widget_data = {
	background_icon = "button_frame_01",
	width = power_up_widget_size[1],
	icon_size = {
		35,
		35,
	},
	icon_offset = {
		15.5,
		14,
		1,
	},
	background_icon_size = {
		65,
		65,
	},
	background_icon_offset = {
		0,
		0,
		-1,
	},
}
local rectangular_power_up_widget_data = {
	background_icon = "button_frame_01",
	width = power_up_widget_size[1],
	icon_size = {
		58,
		58,
	},
	icon_offset = {
		5,
		5,
		0,
	},
	background_icon_size = {
		65,
		65,
	},
	background_icon_offset = {
		0,
		0,
		1,
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "left_stick",
			priority = 1,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 2,
		},
	},
}

return {
	generic_input_actions = generic_input_actions,
	scenegraph = scenegraph,
	widgets = widgets,
	equipment_widgets = equipment_widgets,
	reminder_widgets = reminder_widgets,
	blessing_widget_data = blessing_widget_data,
	max_power_up_amount = max_power_up_amount,
	round_power_up_widget_data = round_power_up_widget_data,
	rectangular_power_up_widget_data = rectangular_power_up_widget_data,
	animations_definitions = animations_definitions,
}
