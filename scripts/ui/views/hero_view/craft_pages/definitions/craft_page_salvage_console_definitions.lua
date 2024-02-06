-- chunkname: @scripts/ui/views/hero_view/craft_pages/definitions/craft_page_salvage_console_definitions.lua

local NUM_CRAFT_SLOTS_X = 3
local NUM_CRAFT_SLOTS_Y = 3
local NUM_CRAFT_SLOTS = NUM_CRAFT_SLOTS_X * NUM_CRAFT_SLOTS_Y
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local auto_fill_button_size = {
	80,
	80,
}
local auto_fill_button_offset = auto_fill_button_size[2] + 16
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	craft_bg_root = console_menu_scenegraphs.craft_bg_root,
	craft_button = console_menu_scenegraphs.craft_button,
	counter_text_root = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			6,
		},
	},
	counter_text = {
		horizontal_alignment = "center",
		parent = "counter_text_root",
		vertical_alignment = "center",
		size = {
			200,
			200,
		},
		position = {
			-16,
			0,
			1,
		},
	},
	max_counter_text = {
		horizontal_alignment = "left",
		parent = "counter_text_root",
		vertical_alignment = "center",
		size = {
			200,
			200,
		},
		position = {
			0,
			58,
			1,
		},
	},
	material_holder = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "center",
		size = {
			251,
			277,
		},
		position = {
			0,
			4,
			4,
		},
	},
	material_circle = {
		horizontal_alignment = "center",
		parent = "material_holder",
		vertical_alignment = "center",
		size = {
			136,
			136,
		},
		position = {
			0,
			0,
			1,
		},
	},
	material_cross = {
		horizontal_alignment = "center",
		parent = "material_holder",
		vertical_alignment = "center",
		size = {
			108,
			108,
		},
		position = {
			0,
			0,
			1,
		},
	},
	material_text_1 = {
		horizontal_alignment = "center",
		parent = "material_holder",
		vertical_alignment = "center",
		size = {
			60,
			100,
		},
		position = {
			-90,
			30,
			2,
		},
	},
	material_text_2 = {
		horizontal_alignment = "center",
		parent = "material_holder",
		vertical_alignment = "center",
		size = {
			60,
			100,
		},
		position = {
			-38,
			75,
			2,
		},
	},
	material_text_3 = {
		horizontal_alignment = "center",
		parent = "material_holder",
		vertical_alignment = "center",
		size = {
			60,
			100,
		},
		position = {
			38,
			75,
			2,
		},
	},
	material_text_4 = {
		horizontal_alignment = "center",
		parent = "material_holder",
		vertical_alignment = "center",
		size = {
			60,
			100,
		},
		position = {
			90,
			30,
			2,
		},
	},
	material_text_5 = {
		horizontal_alignment = "center",
		parent = "material_holder",
		vertical_alignment = "center",
		size = {
			60,
			100,
		},
		position = {
			70,
			-80,
			2,
		},
	},
	material_text_6 = {
		horizontal_alignment = "center",
		parent = "material_holder",
		vertical_alignment = "center",
		size = {
			60,
			100,
		},
		position = {
			0,
			-105,
			2,
		},
	},
	material_text_7 = {
		horizontal_alignment = "center",
		parent = "material_holder",
		vertical_alignment = "center",
		size = {
			60,
			100,
		},
		position = {
			-70,
			-80,
			2,
		},
	},
	auto_fill_area = {
		parent = "area_left",
		position = {
			0,
			0,
			0,
		},
		size = {
			0,
			0,
		},
	},
	auto_fill_buttons = {
		horizontal_alignment = "left",
		parent = "auto_fill_area",
		vertical_alignment = "bottom",
		size = auto_fill_button_size,
		position = {
			-42,
			93,
			6,
		},
	},
	auto_fill_plentiful = {
		horizontal_alignment = "left",
		parent = "auto_fill_buttons",
		vertical_alignment = "top",
		size = auto_fill_button_size,
		position = {
			80 + auto_fill_button_offset * 0,
			-125,
			1,
		},
	},
	auto_fill_common = {
		horizontal_alignment = "left",
		parent = "auto_fill_buttons",
		vertical_alignment = "top",
		size = auto_fill_button_size,
		position = {
			80 + auto_fill_button_offset * 1,
			-125,
			1,
		},
	},
	auto_fill_rare = {
		horizontal_alignment = "left",
		parent = "auto_fill_buttons",
		vertical_alignment = "top",
		size = auto_fill_button_size,
		position = {
			80 + auto_fill_button_offset * 2,
			-125,
			1,
		},
	},
	auto_fill_exotic = {
		horizontal_alignment = "left",
		parent = "auto_fill_buttons",
		vertical_alignment = "top",
		size = auto_fill_button_size,
		position = {
			80 + auto_fill_button_offset * 3,
			-125,
			1,
		},
	},
	auto_fill_clear = {
		horizontal_alignment = "left",
		parent = "auto_fill_buttons",
		vertical_alignment = "top",
		size = auto_fill_button_size,
		position = {
			80 + auto_fill_button_offset * 4,
			-125,
			1,
		},
	},
}
local counter_text_style = {
	font_size = 72,
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
		0,
		2,
	},
}
local max_counter_text_style = {
	font_size = 42,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}

local function create_craft_material_widget(scenegraph_id)
	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "rotated_texture",
					style_id = "effect",
					texture_id = "effect",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return not content.warning
					end,
				},
				{
					pass_type = "text",
					style_id = "text_warning",
					text_id = "text",
					content_check_function = function (content)
						return content.warning
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					item_id = "item",
					pass_type = "item_tooltip",
					content_check_function = function (content)
						return content.button_hotspot.is_hover and content.item
					end,
				},
			},
		},
		content = {
			effect = "sparkle_effect",
			icon = "icon_crafting_dust_01_small",
			text = "0",
			warning = false,
			button_hotspot = {},
		},
		style = {
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				texture_size = {
					50,
					50,
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
					3,
				},
			},
			effect = {
				angle = 0,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				offset = {
					110,
					120,
					4,
				},
				pivot = {
					128,
					128,
				},
				texture_size = {
					256,
					256,
				},
				color = Colors.get_color_table_with_alpha("white", 0),
			},
			text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					26,
					3,
				},
			},
			text_warning = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					26,
					3,
				},
			},
			text_shadow = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					24,
					2,
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

local function create_auto_fill_button(scenegraph_id, icon_name, hover_color, hover_texture, disable_with_gamepad)
	local size = auto_fill_button_size
	local background_texture = "menu_frame_bg_04"
	local frame_width = 7
	local bg_texture = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
				},
				{
					content_id = "border",
					pass_type = "texture_uv",
					style_id = "border",
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
					style_id = "texture_hover",
					texture_id = "texture_hover",
				},
				{
					content_id = "texture_icon",
					pass_type = "texture_uv",
					style_id = "texture_icon",
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			button_hotspot = {},
			border = {
				texture_id = "crafting_bg_03",
				uvs = {
					{
						0.08974358974358974,
						0.09183673469387756,
					},
					{
						0.9183673469387755,
						0.9183673469387755,
					},
				},
			},
			background = {
				uvs = {
					{
						0,
						0,
					},
					{
						size[1] / bg_texture.size[1],
						size[2] / bg_texture.size[2],
					},
				},
				texture_id = background_texture,
			},
			texture_hover = hover_texture or "crafting_icon_hover",
			texture_icon = {
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
				texture_id = icon_name,
			},
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			frame = {},
			border = {
				offset = {
					0,
					0,
					6,
				},
			},
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
					1,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
			},
			texture_hover = {
				color = {
					0,
					0,
					0,
					0,
				},
				default_color = {
					127,
					hover_color[2],
					hover_color[3],
					hover_color[4],
				},
				hover_color = hover_color,
				offset = {
					0,
					frame_width - 2,
					3,
				},
			},
			texture_icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = {
					0,
					0,
					0,
					0,
				},
				default_color = {
					200,
					255,
					255,
					255,
				},
				hover_color = {
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
	craft_button = UIWidgets.create_console_craft_button("craft_button", "console_crafting_recipe_icon_salvage"),
	counter_text = UIWidgets.create_simple_text("", "counter_text", nil, nil, counter_text_style),
	max_counter_text = UIWidgets.create_simple_text("", "max_counter_text", nil, nil, max_counter_text_style),
	material_holder = UIWidgets.create_simple_texture("console_crafting_salvage_bg", "material_holder"),
	material_circle = UIWidgets.create_simple_texture("console_crafting_salvage_ring", "material_circle"),
	material_cross = UIWidgets.create_simple_texture("console_crafting_salvage_cross", "material_cross"),
	material_text_1 = create_craft_material_widget("material_text_1"),
	material_text_2 = create_craft_material_widget("material_text_2"),
	material_text_3 = create_craft_material_widget("material_text_3"),
	material_text_4 = create_craft_material_widget("material_text_4"),
	material_text_5 = create_craft_material_widget("material_text_5"),
	material_text_6 = create_craft_material_widget("material_text_6"),
	material_text_7 = create_craft_material_widget("material_text_7"),
	auto_fill_plentiful = create_auto_fill_button("auto_fill_plentiful", "store_tag_icon_weapon_plentiful", Colors.get_table("plentiful"), nil, disable_with_gamepad),
	auto_fill_common = create_auto_fill_button("auto_fill_common", "store_tag_icon_weapon_common", Colors.get_table("common"), nil, disable_with_gamepad),
	auto_fill_rare = create_auto_fill_button("auto_fill_rare", "store_tag_icon_weapon_rare", Colors.get_table("rare"), nil, disable_with_gamepad),
	auto_fill_exotic = create_auto_fill_button("auto_fill_exotic", "store_tag_icon_weapon_exotic", Colors.get_table("exotic"), nil, disable_with_gamepad),
	auto_fill_clear = create_auto_fill_button("auto_fill_clear", "layout_button_back", {
		100,
		255,
		100,
		100,
	}, "button_state_default", disable_with_gamepad),
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
				ui_scenegraph.auto_fill_area.local_position[1] = scenegraph_definition.auto_fill_area.position[1] + -100 * (1 - anim_progress)
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
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	NUM_CRAFT_SLOTS = NUM_CRAFT_SLOTS,
}
