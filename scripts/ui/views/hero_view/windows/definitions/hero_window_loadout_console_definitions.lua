-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_loadout_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local loadout_grid_spacing = 60
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	loadout_grid = {
		horizontal_alignment = "left",
		parent = "area_left",
		vertical_alignment = "top",
		size = {
			80,
			window_size[1],
		},
		position = {
			90,
			-250,
			1,
		},
	},
	disclaimer_text_background = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			520,
			60,
		},
		position = {
			-20,
			-80,
			9,
		},
	},
	disclaimer_text = {
		horizontal_alignment = "center",
		parent = "disclaimer_text_background",
		vertical_alignment = "center",
		size = {
			520,
			50,
		},
		position = {
			0,
			0,
			10,
		},
	},
}
local disclaimer_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local num_equipment_slots = #InventorySettings.equipment_slots
local widgets = {
	loadout_grid = UIWidgets.create_loadout_grid_console("loadout_grid", scenegraph_definition.loadout_grid.size, num_equipment_slots, loadout_grid_spacing, nil, true),
	disclaimer_text = UIWidgets.create_simple_text(Localize("inventory_morris_note"), "disclaimer_text", scenegraph_definition.disclaimer_text.size, nil, disclaimer_text_style),
	disclaimer_text_background = UIWidgets.create_rect_with_outer_frame("disclaimer_text_background", scenegraph_definition.disclaimer_text_background.size, "frame_outer_fade_02", nil, Colors.get_color_table_with_alpha("black", 125)),
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
			description_text = "input_description_select_loadout",
			ignore_keybinding = true,
			input_action = "l2_r2",
			priority = 2,
		},
		{
			description_text = "input_description_manage_loadouts",
			ignore_keybinding = false,
			input_action = "right_stick_press",
			priority = 3,
		},
		{
			description_text = "start_menu_swap_inventory",
			input_action = "show_gamercard",
			priority = 4,
		},
		{
			description_text = "start_menu_customize_item",
			input_action = "refresh",
			priority = 5,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 6,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 7,
		},
	},
	default_no_customization = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_select_loadout",
			ignore_keybinding = true,
			input_action = "l2_r2",
			priority = 2,
		},
		{
			description_text = "input_description_manage_loadouts",
			ignore_keybinding = false,
			input_action = "right_stick_press",
			priority = 3,
		},
		{
			description_text = "start_menu_swap_inventory",
			input_action = "show_gamercard",
			priority = 4,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 5,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 6,
		},
	},
	details = {
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
			description_text = "input_description_toggle_hero_details",
			ignore_keybinding = false,
			input_action = "right_stick_press",
			priority = 3,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 4,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 5,
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
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
