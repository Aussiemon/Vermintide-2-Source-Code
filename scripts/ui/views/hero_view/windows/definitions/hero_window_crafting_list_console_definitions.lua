-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_crafting_list_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local game_option_size = {
	window_size[1] - window_frame_width * 2,
	(window_size[2] - window_frame_height * 2) / 3.5,
}
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	list_background_bottom = {
		horizontal_alignment = "left",
		parent = "area_left",
		vertical_alignment = "bottom",
		size = {
			241,
			434,
		},
		position = {
			50,
			-30,
			1,
		},
	},
	list_background_top = {
		horizontal_alignment = "center",
		parent = "list_background_bottom",
		vertical_alignment = "bottom",
		size = {
			241,
			434,
		},
		position = {
			0,
			434,
			1,
		},
	},
	list_entry_root = {
		horizontal_alignment = "right",
		parent = "list_background_bottom",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			56,
			0,
			2,
		},
	},
	list_entry = {
		horizontal_alignment = "center",
		parent = "list_entry_root",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			2,
		},
	},
	description_text = {
		horizontal_alignment = "left",
		parent = "area_right",
		vertical_alignment = "top",
		size = {
			650,
			400,
		},
		position = {
			0,
			-140,
			2,
		},
	},
	tite_text = {
		horizontal_alignment = "center",
		parent = "description_text",
		vertical_alignment = "top",
		size = {
			600,
			50,
		},
		position = {
			0,
			-20,
			2,
		},
	},
	divider = {
		horizontal_alignment = "center",
		parent = "description_text",
		vertical_alignment = "top",
		size = {
			264,
			32,
		},
		position = {
			0,
			-70,
			1,
		},
	},
}
local title_text_style = {
	dynamic_font_size = true,
	font_size = 42,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local description_text_style = {
	font_size = 28,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		-20,
		2,
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
			description_text = "start_menu_switch_hero",
			input_action = "show_gamercard",
			priority = 2,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 3,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 4,
		},
	},
}

local function create_list_entry(scenegraph_id, index)
	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "selection",
					texture_id = "selection",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "rotated_texture",
					style_id = "holder",
					texture_id = "holder",
				},
			},
		},
		content = {
			background = "console_crafting_disc_small",
			holder = "console_crafting_recipe_holder",
			icon = "console_crafting_disc_small",
			selection = "console_crafting_disc_small_inner_glow",
			button_hotspot = {},
		},
		style = {
			hotspot = {
				size = {
					128,
					80,
				},
				offset = {
					-64,
					-40,
					0,
				},
			},
			background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					128,
					128,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					0,
				},
			},
			selection = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					128,
					128,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1,
				},
			},
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					128,
					128,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			holder = {
				angle = 0,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				pivot = {
					83.5,
					11,
				},
				texture_size = {
					39,
					22,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-64,
					0,
					3,
				},
			},
		},
		offset = {
			0,
			0,
			index * 4,
		},
		scenegraph_id = scenegraph_id,
	}
end

local title_button_definitions = {}
local num_buttons = 10

for i = 1, num_buttons do
	title_button_definitions[i] = create_list_entry("list_entry", i)
end

local widgets = {
	list_background_bottom = UIWidgets.create_simple_texture("console_crafting_recipe_bg", "list_background_bottom"),
	list_background_top = UIWidgets.create_simple_uv_texture("console_crafting_recipe_bg", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "list_background_top"),
	divider = UIWidgets.create_simple_texture("divider_01_top", "divider"),
	tite_text = UIWidgets.create_simple_text("n/a", "tite_text", nil, nil, title_text_style),
	description_text = UIWidgets.create_simple_text("n/a", "description_text", nil, nil, description_text_style),
	description_bg = UIWidgets.create_rect_with_outer_frame("description_text", scenegraph_definition.description_text.size, "frame_outer_fade_02", 0, UISettings.console_menu_rect_color),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				params.animation_settings.entry_alignment_progress = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
				params.animation_settings.entry_alignment_progress = anim_progress
				ui_scenegraph.area_left.local_position[1] = scenegraph_definition.area_left.position[1] + -100 * (1 - anim_progress)
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
	title_button_definitions = title_button_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
