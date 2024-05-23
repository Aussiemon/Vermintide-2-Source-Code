-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_loadout_inventory_console_definitions.lua

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
			10,
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
			description_text = "start_menu_switch_hero",
			input_action = "show_gamercard",
			priority = 2,
		},
		{
			description_text = "lb_add_to_favorites",
			input_action = "hotkey_mark_favorite_item",
			priority = 3,
		},
		{
			description_text = "input_description_toggle_compare",
			input_action = "special_1",
			priority = 5,
		},
		{
			description_text = "input_description_equip",
			input_action = "confirm",
			priority = 6,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 7,
		},
	},
	details = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "input_description_scroll_details",
			ignore_keybinding = true,
			input_action = "right_stick",
			priority = 2,
		},
		{
			description_text = "lb_add_to_favorites",
			input_action = "hotkey_mark_favorite_item",
			priority = 3,
		},
		{
			description_text = "input_description_toggle_hero_details",
			ignore_keybinding = false,
			input_action = "right_stick_press",
			priority = 4,
		},
		{
			description_text = "input_description_toggle_compare",
			input_action = "special_1",
			priority = 5,
		},
		{
			description_text = "input_description_equip",
			input_action = "confirm",
			priority = 6,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 7,
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
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
}
