-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_cosmetics_loadout_pose_inventory_console_definitions.lua

local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	item_tooltip = {
		horizontal_alignment = "left",
		parent = "area_right",
		vertical_alignment = "top",
		size = {
			400,
			0,
		},
		position = {
			-60,
			-90,
			0,
		},
	},
	item_tooltip_compare = {
		horizontal_alignment = "left",
		parent = "item_tooltip",
		vertical_alignment = "top",
		size = {
			400,
			0,
		},
		position = {
			440,
			0,
			0,
		},
	},
	item_grid = {
		horizontal_alignment = "center",
		parent = "area_left",
		vertical_alignment = "top",
		size = {
			520,
			690,
		},
		position = {
			-9,
			-100,
			1,
		},
	},
	page_text_area = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "bottom",
		size = {
			334,
			60,
		},
		position = {
			0,
			0,
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
	apply_illusion_button_anchor = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			400,
			72,
		},
		position = {
			0,
			70,
			5,
		},
	},
	apply_illusion_button = {
		horizontal_alignment = "center",
		parent = "apply_illusion_button_anchor",
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
	button_remove = {
		horizontal_alignment = "left",
		parent = "item_grid",
		vertical_alignment = "bottom",
		size = {
			214,
			60,
		},
		position = {
			153,
			-80,
			0,
		},
	},
}
local page_number_left_text_style = {
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		-172,
		4,
		2,
	},
}
local page_number_right_text_style = {
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		171,
		4,
		2,
	},
}
local page_number_center_text_style = {
	font_size = 26,
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
local category_settings = {
	{
		hero_specific_filter = true,
		item_filter = "slot_type == hat",
		name = "hats",
		wield = true,
		display_name = Localize("inventory_screen_hats_title"),
		item_types = {
			"hat",
		},
		icon = UISettings.slot_icons.hat,
	},
	{
		hero_specific_filter = true,
		item_filter = "slot_type == skin",
		name = "skin",
		wield = true,
		display_name = Localize("inventory_screen_skins_title"),
		item_types = {
			"skin",
		},
		icon = UISettings.slot_icons.skins,
	},
	{
		hero_specific_filter = true,
		item_filter = "slot_type == frame",
		name = "frames",
		display_name = Localize("inventory_screen_frames_title"),
		item_types = {
			"frame",
		},
		icon = UISettings.slot_icons.portrait_frame,
	},
	{
		hero_specific_filter = true,
		item_filter = "gather_weapon_pose_blueprints",
		name = "poses",
		wield = true,
		display_name = Localize("inventory_screen_poses_title"),
		item_types = {
			"weapon_pose",
		},
		icon = UISettings.slot_icons.portrait_frame,
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

local DISABLE_WITH_GAMEPAD = true
local widgets = {
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, 6, 5, 16, 10, false),
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
	item_tooltip = UIWidgets.create_simple_item_presentation("item_tooltip", UISettings.console_tooltip_pass_definitions),
	item_tooltip_compare = UIWidgets.create_simple_item_presentation("item_tooltip_compare", UISettings.console_tooltip_pass_definitions),
	button_remove = UIWidgets.create_default_button("button_remove", scenegraph_definition.button_remove.size, nil, nil, Localize("input_description_remove"), 32, nil, nil, nil, DISABLE_WITH_GAMEPAD, true),
}
local weapon_illusion_base_widgets = {
	illusions_divider = UIWidgets.create_simple_texture("divider_01_bottom", "illusions_divider"),
	illusions_title = UIWidgets.create_simple_text(Localize("inventory_screen_weapon_skins_title"), "illusions_title", nil, nil, illusion_title_style),
	illusions_counter = UIWidgets.create_simple_text(Localize("inventory_screen_weapon_skins_title"), "illusions_title", nil, nil, illusion_counter_style),
	illusions_name = UIWidgets.create_simple_text("", "illusions_name", nil, nil, illusion_name_style),
	apply_illusion_button = UIWidgets.create_default_button("apply_illusion_button", scenegraph_definition.apply_illusion_button.size, nil, nil, Localize("crafting_recipe_apply_weapon_skin"), 32, nil, nil, nil, false),
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "input_description_rotate_hero",
			ignore_keybinding = true,
			input_action = "right",
			priority = 2,
		},
		{
			description_text = "start_menu_switch_hero",
			input_action = "show_gamercard",
			priority = 3,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 4,
		},
		{
			description_text = "input_description_remove",
			input_action = "refresh",
			priority = 5,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 5,
		},
	},
	pose_selection = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "input_description_rotate_hero",
			ignore_keybinding = true,
			input_action = "right",
			priority = 2,
		},
		{
			description_text = "start_menu_switch_hero",
			input_action = "show_gamercard",
			priority = 3,
		},
		{
			description_text = "input_description_toggle_illusions",
			input_action = "special_1",
			priority = 4,
		},
		{
			description_text = "input_description_equip",
			input_action = "confirm",
			priority = 5,
		},
		{
			description_text = "input_description_remove",
			input_action = "refresh",
			priority = 6,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 7,
		},
	},
	weapon_skin = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 1,
		},
		{
			description_text = "input_description_rotate_hero",
			ignore_keybinding = true,
			input_action = "right",
			priority = 2,
		},
		{
			description_text = "start_menu_switch_hero",
			input_action = "show_gamercard",
			priority = 3,
		},
		{
			description_text = "input_description_toggle_illusions",
			input_action = "special_1",
			priority = 4,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 5,
		},
	},
	apply_weapon_skin = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 1,
		},
		{
			description_text = "input_description_rotate_hero",
			ignore_keybinding = true,
			input_action = "right",
			priority = 2,
		},
		{
			description_text = "start_menu_switch_hero",
			input_action = "show_gamercard",
			priority = 3,
		},
		{
			description_text = "input_description_toggle_illusions",
			input_action = "special_1",
			priority = 4,
		},
		{
			description_text = "crafting_recipe_apply_weapon_skin",
			input_action = "confirm",
			priority = 5,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 6,
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
				ui_scenegraph.area_left.local_position[1] = scenegraph_definition.area_left.position[1] + math.floor(-100 * (1 - anim_progress))
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
	animate_illusion_widgets = {
		{
			end_progress = 0.3,
			name = "animate_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local start_point = scenegraph_definition.apply_illusion_button_anchor.position[2] - 100

				ui_scenegraph.apply_illusion_button_anchor.local_position[2] = start_point

				local start_point = scenegraph_definition.illusions_divider.position[2] - 100

				ui_scenegraph.illusions_divider.local_position[2] = start_point
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local end_point = scenegraph_definition.apply_illusion_button_anchor.position[2]
				local start_point = end_point - 100

				ui_scenegraph.apply_illusion_button_anchor.local_position[2] = math.lerp(start_point, end_point, anim_progress)

				local end_point = scenegraph_definition.illusions_divider.position[2]
				local start_point = end_point - 100

				ui_scenegraph.illusions_divider.local_position[2] = math.lerp(start_point, end_point, anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	widgets = widgets,
	category_settings = category_settings,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
	create_illusion_button = create_illusion_button,
	weapon_illusion_base_widgets = weapon_illusion_base_widgets,
}
