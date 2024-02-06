-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_item_customization_definitions.lua

local window_size = {
	500,
	800,
}
local game_option_size = {
	window_size[1],
	100,
}
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	item_preview = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default + 1,
		},
	},
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	window = {
		horizontal_alignment = "left",
		parent = "area",
		vertical_alignment = "top",
		size = window_size,
		position = {
			25,
			0,
			1,
		},
	},
	info_window = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = window_size,
		position = {
			-75,
			-120,
			1,
		},
	},
	option_1 = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			150,
		},
		position = {
			0,
			0,
			1,
		},
	},
	option_2 = {
		horizontal_alignment = "left",
		parent = "option_1",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			140,
		},
		position = {
			0,
			-140,
			0,
		},
	},
	option_3 = {
		horizontal_alignment = "left",
		parent = "option_2",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			140,
		},
		position = {
			0,
			0,
			0,
		},
	},
	option_4 = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			110,
		},
		position = {
			0,
			0,
			1,
		},
	},
	sword_left = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			161,
			47,
		},
		position = {
			-81,
			-21,
			15,
		},
	},
	sword_right = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			161,
			47,
		},
		position = {
			81,
			-21,
			15,
		},
	},
	rarity_display = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			37,
			50,
		},
		position = {
			-74,
			-23,
			16,
		},
	},
	info_title = {
		horizontal_alignment = "left",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			40,
		},
		position = {
			0,
			-10,
			3,
		},
	},
	item_feature = {
		horizontal_alignment = "left",
		parent = "info_title",
		vertical_alignment = "bottom",
		size = {
			window_size[1] / 3,
			100,
		},
		position = {
			0,
			-110,
			2,
		},
	},
	weapon_stats_diagram = {
		horizontal_alignment = "left",
		parent = "item_feature",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			360,
		},
		position = {
			0,
			-370,
			1,
		},
	},
	keyword_divider_top = {
		horizontal_alignment = "center",
		parent = "weapon_stats_diagram",
		vertical_alignment = "bottom",
		size = {
			264,
			21,
		},
		position = {
			0,
			-20,
			2,
		},
	},
	info_keyword_text = {
		horizontal_alignment = "center",
		parent = "keyword_divider_top",
		vertical_alignment = "top",
		size = {
			window_size[1] - 20,
			300,
		},
		position = {
			0,
			-20,
			2,
		},
	},
	keyword_divider_bottom = {
		horizontal_alignment = "center",
		parent = "info_keyword_text",
		vertical_alignment = "bottom",
		size = {
			264,
			21,
		},
		position = {
			0,
			-10,
			2,
		},
	},
	info_description_text = {
		horizontal_alignment = "center",
		parent = "keyword_divider_bottom",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - 20,
			300,
		},
		position = {
			0,
			0,
			2,
		},
	},
	info_description_text_2 = {
		horizontal_alignment = "center",
		parent = "info_title",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - 20,
			300,
		},
		position = {
			0,
			0,
			1,
		},
	},
	description_2_divider = {
		horizontal_alignment = "center",
		parent = "info_description_text_2",
		vertical_alignment = "bottom",
		size = {
			264,
			21,
		},
		position = {
			0,
			-30,
			2,
		},
	},
	upgrade_icons = {
		horizontal_alignment = "center",
		parent = "info_description_text_2",
		vertical_alignment = "bottom",
		size = {
			650,
			217,
		},
		position = {
			0,
			-267,
			1,
		},
	},
	upgrade_title = {
		horizontal_alignment = "center",
		parent = "upgrade_icons",
		vertical_alignment = "bottom",
		size = {
			100,
			40,
		},
		position = {
			0,
			-50,
			1,
		},
	},
	upgrade_rarity_name = {
		horizontal_alignment = "center",
		parent = "upgrade_title",
		vertical_alignment = "bottom",
		size = {
			100,
			40,
		},
		position = {
			0,
			-40,
			1,
		},
	},
	upgrade_description_text = {
		horizontal_alignment = "center",
		parent = "upgrade_rarity_name",
		vertical_alignment = "top",
		size = {
			window_size[1] - 20,
			300,
		},
		position = {
			0,
			-110,
			1,
		},
	},
	property_options_title = {
		horizontal_alignment = "left",
		parent = "info_description_text_2",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - 20,
			20,
		},
		position = {
			0,
			-80,
			1,
		},
	},
	property_options = {
		horizontal_alignment = "left",
		parent = "scroll_root",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			10,
			0,
			1,
		},
	},
	scroll_root = {
		horizontal_alignment = "left",
		parent = "property_options_title",
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
	scroll_area = {
		horizontal_alignment = "left",
		parent = "property_options_title",
		vertical_alignment = "top",
		size = {
			window_size[1],
			300,
		},
		position = {
			-10,
			-20,
			0,
		},
	},
	scrollbar = {
		horizontal_alignment = "right",
		parent = "scroll_area",
		vertical_alignment = "top",
		size = {
			6,
			610,
		},
		position = {
			-16,
			0,
			1,
		},
	},
	trait_options = {
		horizontal_alignment = "left",
		parent = "scroll_root",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			25,
			0,
			1,
		},
	},
	craft_button_anchor = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			400,
			72,
		},
		position = {
			0,
			100,
			5,
		},
	},
	craft_button = {
		horizontal_alignment = "center",
		parent = "craft_button_anchor",
		vertical_alignment = "bottom",
		size = {
			400,
			72,
		},
		position = {
			0,
			0,
			0,
		},
	},
	button_top_edge = {
		horizontal_alignment = "center",
		parent = "craft_button",
		vertical_alignment = "top",
		size = {
			55,
			28,
		},
		position = {
			0,
			24,
			-1,
		},
	},
	button_top_edge_glow = {
		horizontal_alignment = "center",
		parent = "craft_button",
		vertical_alignment = "top",
		size = {
			55,
			28,
		},
		position = {
			0,
			24,
			-2,
		},
	},
	experience_bar = {
		horizontal_alignment = "left",
		parent = "craft_button",
		vertical_alignment = "bottom",
		size = {
			400,
			72,
		},
		position = {
			0,
			0,
			3,
		},
	},
	experience_bar_edge = {
		horizontal_alignment = "right",
		parent = "experience_bar",
		vertical_alignment = "center",
		size = {
			8,
			72,
		},
		position = {
			8,
			0,
			3,
		},
	},
	material_root = {
		horizontal_alignment = "center",
		parent = "craft_button",
		vertical_alignment = "top",
		size = {
			60,
			100,
		},
		position = {
			0,
			100,
			1,
		},
	},
	illusions_divider = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			700,
			21,
		},
		position = {
			0,
			236,
			2,
		},
	},
	illusions_title = {
		horizontal_alignment = "center",
		parent = "illusions_divider",
		vertical_alignment = "bottom",
		size = {
			650,
			40,
		},
		position = {
			0,
			0,
			2,
		},
	},
	illusions_name = {
		horizontal_alignment = "center",
		parent = "illusions_divider",
		vertical_alignment = "bottom",
		size = {
			650,
			40,
		},
		position = {
			0,
			-90,
			2,
		},
	},
	illusions_root = {
		horizontal_alignment = "center",
		parent = "illusions_divider",
		vertical_alignment = "bottom",
		size = {
			51,
			45,
		},
		position = {
			0,
			-50,
			2,
		},
	},
	loading_icon = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			150,
			150,
		},
		position = {
			0,
			200,
			10,
		},
	},
}
local upgrade_rarity_name_style = {
	font_size = 42,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local upgrade_title_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "bottom",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local illusion_title_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2,
	},
}
local illusion_counter_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "right",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2,
	},
}
local illusion_name_style = {
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local property_options_title_style = {
	font_size = 28,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local description_text_style = {
	font_size = 20,
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

local function create_illusion_button()
	return {
		scenegraph_id = "illusions_root",
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "icon_texture",
					texture_id = "icon_texture",
				},
				{
					pass_type = "texture",
					style_id = "hover_texture",
					texture_id = "hover_texture",
					content_check_function = function (content)
						local hotspot = content.button_hotspot

						return (hotspot.is_hover or hotspot.is_selected) and not content.equipped
					end,
				},
				{
					pass_type = "texture",
					style_id = "equipped_texture",
					texture_id = "equipped_texture",
					content_check_function = function (content)
						return content.equipped
					end,
				},
			},
		},
		content = {
			background_texture = "icons_placeholder",
			equipped_texture = "button_illusion_glow",
			frame_texture = "item_frame",
			hover_texture = "button_illusion_glow_white",
			icon_texture = "icons_placeholder",
			lock_texture = "hero_icon_locked",
			locked = false,
			selection_texture = "button_illusion_glow",
			button_hotspot = {},
		},
		style = {
			hotspot = {
				size = {
					41,
					45,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			background_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					80,
					80,
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
			icon_texture = {
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
			frame_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					80,
					80,
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
					2,
				},
			},
			equipped_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					63,
					57,
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
			lock_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					53.199999999999996,
					60.9,
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
					4,
				},
			},
			hover_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					63,
					57,
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
		},
		offset = {
			0,
			0,
			0,
		},
	}
end

local function create_property_option(scenegraph_id, text)
	local masked = true

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
			},
		},
		content = {
			texture_id = "icon_list_dot",
			text = text,
		},
		style = {
			texture_id = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				masked = masked,
				texture_size = {
					13,
					13,
				},
				color = Colors.get_color_table_with_alpha("corn_flower_blue", 255),
				offset = {
					0,
					0,
					1,
				},
			},
			text = {
				dynamic_font_size = true,
				font_size = 20,
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				size = {
					450,
					50,
				},
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("corn_flower_blue", 255),
				color_override = {},
				color_override_table = {
					end_index = 0,
					start_index = 0,
					color = Colors.get_color_table_with_alpha("font_default", 255),
				},
				offset = {
					15,
					-23,
					3,
				},
			},
			text_shadow = {
				dynamic_font_size = true,
				font_size = 20,
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				size = {
					450,
					50,
				},
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					16,
					-24,
					2,
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

local function create_trait_option(scenegraph_id, title_text, description_text, icon)
	local masked = true

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
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
					style_id = "description_text",
					text_id = "description_text",
				},
				{
					pass_type = "text",
					style_id = "description_text_shadow",
					text_id = "description_text",
				},
			},
		},
		content = {
			title_text = title_text,
			description_text = description_text,
			texture_id = icon,
		},
		style = {
			texture_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				masked = masked,
				texture_size = {
					40,
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
					0,
					1,
				},
			},
			title_text = {
				dynamic_font_size = true,
				font_size = 20,
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				size = {
					400,
					50,
				},
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					30,
					-5,
					3,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_size = 20,
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				size = {
					400,
					50,
				},
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					31,
					-6,
					2,
				},
			},
			description_text = {
				dynamic_font_size = false,
				font_size = 20,
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					400,
					50,
				},
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					30,
					-47,
					3,
				},
			},
			description_text_shadow = {
				dynamic_font_size = false,
				font_size = 20,
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					400,
					50,
				},
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					31,
					-48,
					2,
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

local function create_scroll_mask(scenegraph_id, size)
	local edge_height = 10
	local element = {
		passes = {
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture",
			},
			{
				pass_type = "texture",
				style_id = "mask_top",
				texture_id = "mask_edge",
			},
			{
				pass_type = "rotated_texture",
				style_id = "mask_bottom",
				texture_id = "mask_edge",
			},
		},
	}
	local content = {
		mask_edge = "mask_rect_edge_fade",
		mask_texture = "mask_rect",
	}
	local style = {
		mask = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			size = {
				size[1],
				size[2] - edge_height * 2,
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
		mask_top = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				size[1],
				edge_height,
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
		mask_bottom = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				size[1],
				edge_height,
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
			angle = math.pi,
			pivot = {
				size[1] / 2,
				edge_height / 2,
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

local function create_simple_centered_textures(textures, texture_size, scenegraph_id, spacing)
	local texture_colors = {}

	for i = 1, #textures do
		texture_colors[i] = {
			255,
			255,
			255,
			255,
		}
	end

	return {
		element = {
			passes = {
				{
					pass_type = "centered_texture_amount",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			texture_id = textures,
		},
		style = {
			texture_id = {
				texture_axis = 1,
				spacing = spacing or 8,
				texture_size = texture_size,
				texture_amount = #textures,
				color = {
					255,
					255,
					255,
					255,
				},
				texture_colors = texture_colors,
				offset = {
					0,
					0,
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

local function create_title_widget(scenegraph_id, title_text)
	local size = scenegraph_definition[scenegraph_id].size
	local text_spacing = 10
	local passes = {
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
		default_title_text = title_text,
		title_text = title_text,
		size = size,
		text_spacing = text_spacing,
	}
	local style = {
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

local preview_widgets = {
	mission_setting_preview = UIWidgets.create_game_option_mission_preview("info_window", scenegraph_definition.info_window.size),
}
local rarity_display_textures = {}
local rarity_display_sizes = {}

for i = 1, 5 do
	rarity_display_textures[i] = "item_tier_empty"
	rarity_display_sizes[i] = {
		37,
		50,
	}
end

local widgets = {
	window = UIWidgets.create_game_option_window("window", scenegraph_definition.window.size, {
		128,
		0,
		0,
		0,
	}),
	info_window = UIWidgets.create_game_option_window("info_window", scenegraph_definition.info_window.size, {
		128,
		0,
		0,
		0,
	}),
	info_title_background = UIWidgets.create_simple_texture("headline_bg_40", "info_title", nil, nil, {
		120,
		10,
		10,
		10,
	}),
	item_setting = UIWidgets.create_item_option_overview("option_1", scenegraph_definition.option_1.size),
	item_properties = UIWidgets.create_item_option_properties("option_2", scenegraph_definition.option_2.size),
	item_trait = UIWidgets.create_item_option_trait("option_3", scenegraph_definition.option_3.size),
	item_upgrade = UIWidgets.create_item_option_upgrade("option_4", scenegraph_definition.option_4.size),
	scroll_area = create_scroll_mask("scroll_area", scenegraph_definition.scroll_area.size),
	scrollbar = UIWidgets.create_scrollbar("scrollbar", scenegraph_definition.scrollbar.size, "scroll_area"),
	rarity_display = UIWidgets.create_simple_multi_texture(rarity_display_textures, rarity_display_sizes, 1, 1, {
		0,
		0,
	}, "rarity_display"),
	sword_left = UIWidgets.create_simple_texture("frame_detail_sword", "sword_left"),
	sword_right = UIWidgets.create_simple_uv_texture("frame_detail_sword", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "sword_right"),
	loading_icon = {
		scenegraph_id = "loading_icon",
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content, style)
						return content.active
					end,
					content_change_function = function (content, style, _, dt)
						local progress = style.progress or 0

						progress = (progress + dt) % 1

						local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * (math.pi * 2)

						style.angle = angle
						style.progress = progress
					end,
				},
			},
		},
		content = {
			active = false,
			texture_id = "loot_loading",
		},
		style = {
			texture_id = {
				angle = 0,
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
				offset = {
					0,
					0,
					0,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
}

function create_button(scenegraph_id, size, frame_name, background_texture, text, font_size, optional_color_name, optional_detail_texture, optional_detail_offset, disable_with_gamepad, skip_side_detail)
	background_texture = background_texture or "button_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = optional_detail_texture or "button_detail_01"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size
	local extra_detail_offset_x, extra_detail_offset_y

	if optional_detail_offset then
		if type(optional_detail_offset) == "table" then
			extra_detail_offset_x = optional_detail_offset[1]
			extra_detail_offset_y = optional_detail_offset[2]
		else
			extra_detail_offset_x = optional_detail_offset
		end
	end

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_check_function = function (content)
						return content.draw_frame
					end,
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
					pass_type = "rect",
					style_id = "disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					content_id = "side_detail",
					pass_type = "texture_uv",
					style_id = "side_detail_right",
					content_check_function = function (content)
						return not content.skip_side_detail
					end,
				},
				{
					content_id = "side_detail",
					pass_type = "texture",
					style_id = "side_detail_left",
					texture_id = "texture_id",
					content_check_function = function (content)
						return not content.skip_side_detail
					end,
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
			},
		},
		content = {
			background_fade = "button_bg_fade",
			draw_frame = true,
			glass = "button_glass_02",
			hover_glow = "button_state_default",
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
				skip_side_detail = skip_side_detail,
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
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			background = {
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
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_disabled = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					22,
					-2,
					5,
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
					8,
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
					size[2] - (frame_width + 11),
					4,
				},
				size = {
					size[1],
					11,
				},
			},
			glass_bottom = {
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
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					extra_detail_offset_x and -extra_detail_offset_x or -9,
					size[2] / 2 - side_detail_texture_size[2] / 2 + (extra_detail_offset_y or 0),
					9,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - side_detail_texture_size[1] + (extra_detail_offset_x or 9),
					size[2] / 2 - side_detail_texture_size[2] / 2 + (extra_detail_offset_y or 0),
					9,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
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

local disable_with_gamepad = false
local crafting_widgets = {
	craft_button = create_button("craft_button", scenegraph_definition.craft_button.size, nil, nil, "n/a", 32, nil, nil, nil, disable_with_gamepad),
	button_top_edge_left = UIWidgets.create_simple_uv_texture("frame_detail_04", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "button_top_edge", nil, nil, nil, nil, disable_with_gamepad),
	button_top_edge_right = UIWidgets.create_simple_uv_texture("frame_detail_04", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "button_top_edge", nil, nil, nil, nil, disable_with_gamepad),
	button_top_edge_glow = UIWidgets.create_simple_uv_texture("hero_panel_selection_glow", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "button_top_edge_glow", nil, nil, nil, nil, disable_with_gamepad),
	experience_bar_edge = UIWidgets.create_simple_texture("experience_bar_edge_glow", "experience_bar_edge"),
	experience_bar = UIWidgets.create_simple_uv_texture("experience_bar_fill", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "experience_bar"),
}
local info_widgets = {
	info_title = create_title_widget("info_title", Localize("input_description_information")),
	keyword_divider_top = UIWidgets.create_simple_texture("divider_01_bottom", "keyword_divider_top"),
	keyword_divider_bottom = UIWidgets.create_simple_texture("divider_01_bottom", "keyword_divider_bottom"),
}
local weapon_illusion_base_widgets = {
	illusions_divider = UIWidgets.create_simple_texture("divider_01_bottom", "illusions_divider"),
	illusions_title = UIWidgets.create_simple_text(Localize("inventory_screen_weapon_skins_title"), "illusions_title", nil, nil, illusion_title_style),
	illusions_counter = UIWidgets.create_simple_text(Localize("inventory_screen_weapon_skins_title"), "illusions_title", nil, nil, illusion_counter_style),
	illusions_name = UIWidgets.create_simple_text("", "illusions_name", nil, nil, illusion_name_style),
}
local property_reroll_widgets = {
	info_title = create_title_widget("info_title", Localize("hero_view_crafting_properties")),
	description_2_divider = UIWidgets.create_simple_texture("divider_01_bottom", "description_2_divider"),
	property_options_title = UIWidgets.create_simple_text(Localize("available_properties"), "property_options_title", nil, nil, property_options_title_style),
}
local trait_reroll_widgets = {
	info_title = create_title_widget("info_title", Localize("crafting_recipe_weapon_reroll_traits")),
	description_2_divider = UIWidgets.create_simple_texture("divider_01_bottom", "description_2_divider"),
	property_options_title = UIWidgets.create_simple_text(Localize("avilable_traits"), "property_options_title", nil, nil, property_options_title_style),
}
local upgrade_widgets = {
	info_title = create_title_widget("info_title", Localize("crafting_recipe_upgrade_item_rarity_common")),
	upgrade_title = UIWidgets.create_simple_text(Localize("next_upgrade_tier"), "upgrade_title", nil, nil, upgrade_title_style),
	upgrade_rarity_name = UIWidgets.create_simple_text(Localize("difficulty_veteran"), "upgrade_rarity_name", nil, nil, upgrade_rarity_name_style),
	upgrade_description_text = UIWidgets.create_simple_text(Localize("description_crafting_upgrade_item_rarity_common"), "upgrade_description_text", nil, nil, description_text_style),
	upgrade_icons = create_simple_centered_textures({
		"icon_add_property",
		"icon_add_property",
	}, {
		217,
		217,
	}, "upgrade_icons", 1),
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
				ui_scenegraph.window.local_position[1] = scenegraph_definition.window.position[1] + math.floor(-100 * (1 - anim_progress))
				ui_scenegraph.info_window.local_position[1] = scenegraph_definition.info_window.position[1] + math.floor(100 * (1 - anim_progress))
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
	on_crafting_enter = {
		{
			end_progress = 0.3,
			name = "crafting_fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.state_render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.state_render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_crafting_exit = {
		{
			end_progress = 0.3,
			name = "crafting_fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.state_render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.state_render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
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
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 2,
		},
		{
			description_text = "input_description_information",
			ignore_keybinding = true,
			priority = 3,
			input_action = IS_PS4 and "l2" or "left_trigger",
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 4,
		},
	},
	item_setting = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_select",
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 2,
		},
		{
			description_text = "crafting_recipe_apply_weapon_skin",
			input_action = "refresh",
			priority = 3,
		},
		{
			description_text = "input_description_information",
			ignore_keybinding = true,
			priority = 4,
			input_action = IS_PS4 and "l2" or "left_trigger",
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 5,
		},
	},
	item_properties = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "crafting_recipe_weapon_reroll_properties",
			input_action = "refresh",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
	item_trait = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_scroll_details",
			ignore_keybinding = true,
			input_action = "right_stick",
			priority = 2,
		},
		{
			description_text = "crafting_recipe_weapon_reroll_traits",
			input_action = "refresh",
			priority = 3,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 4,
		},
	},
	item_upgrade = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "hero_view_crafting_upgrade",
			input_action = "refresh",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
}

return {
	crafting_widgets = crafting_widgets,
	widgets = widgets,
	preview_widgets = preview_widgets,
	info_widgets = info_widgets,
	weapon_illusion_base_widgets = weapon_illusion_base_widgets,
	trait_reroll_widgets = trait_reroll_widgets,
	property_reroll_widgets = property_reroll_widgets,
	upgrade_widgets = upgrade_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	create_property_option = create_property_option,
	create_trait_option = create_trait_option,
	create_illusion_button = create_illusion_button,
	background_rect = UIWidgets.create_simple_rect("screen", {
		150,
		0,
		0,
		0,
	}),
	generic_input_actions = generic_input_actions,
}
