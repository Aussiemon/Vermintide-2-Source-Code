-- chunkname: @scripts/ui/views/hero_view/states/definitions/hero_view_state_weave_forge_definitions.lua

local window_default_settings = UISettings.game_start_windows
local small_window_background = window_default_settings.background
local small_window_frame = window_default_settings.frame
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local large_window_frame = window_default_settings.large_window_frame
local large_window_frame_width = UIFrameSettings[large_window_frame].texture_sizes.vertical[1]
local inner_window_size = {
	small_window_size[1] * 3 + small_window_spacing * 2 + large_window_frame_width * 2,
	small_window_size[2] + 80,
}
local window_size = {
	inner_window_size[1] + 50,
	inner_window_size[2],
}
local window_frame_name = "menu_frame_11"
local window_frame = UIFrameSettings[window_frame_name]
local window_frame_width = window_frame.texture_sizes.vertical[1]
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
	console_cursor = {
		horizontal_alignment = "center",
		parent = "screen",
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
	header = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "top",
		size = {
			1920,
			50,
		},
		position = {
			0,
			-20,
			100,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1,
		},
	},
	window_frame = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			30,
		},
	},
	window_background = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = {
			window_size[1] - 5,
			window_size[2] - 5,
		},
		position = {
			0,
			0,
			0,
		},
	},
	loading_icon = {
		horizontal_alignment = "center",
		parent = "window_frame",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			-1,
		},
	},
	inner_window = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = inner_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	inner_window_header = {
		horizontal_alignment = "center",
		parent = "inner_window",
		vertical_alignment = "top",
		size = {
			inner_window_size[1],
			50,
		},
		position = {
			0,
			0,
			1,
		},
	},
	exit_button = {
		horizontal_alignment = "center",
		parent = "window_frame",
		vertical_alignment = "bottom",
		size = {
			380,
			42,
		},
		position = {
			0,
			-16,
			10,
		},
	},
	title = {
		horizontal_alignment = "center",
		parent = "window_frame",
		vertical_alignment = "top",
		size = {
			658,
			60,
		},
		position = {
			0,
			34,
			10,
		},
	},
	title_bg = {
		horizontal_alignment = "center",
		parent = "title",
		vertical_alignment = "top",
		size = {
			410,
			40,
		},
		position = {
			0,
			-15,
			-1,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "title",
		vertical_alignment = "center",
		size = {
			350,
			50,
		},
		position = {
			0,
			-3,
			2,
		},
	},
}
local windows = {
	cosmetics_inventory = {
		class_name = "HeroWindowCosmeticsInventory",
		name = "cosmetics_inventory",
	},
}
local window_layouts = {
	{
		close_on_exit = true,
		name = "test",
		sound_event_enter = "play_gui_equipment_button",
		sound_event_exit = "play_gui_equipment_close",
		windows = {},
	},
}
local title_text_style = {
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local disable_with_gamepad = true
local widgets = {
	window = UIWidgets.create_frame("window_frame", scenegraph_definition.window_frame.size, "menu_frame_11"),
	exit_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_close"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	back_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_back"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("menu_weave_forge_title"), "title_text", nil, nil, title_text_style),
	loading_icon = {
		scenegraph_id = "loading_icon",
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_change_function = function (content, style, _, dt)
						local progress = style.progress or 0

						progress = (progress + dt) % 1

						local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * (math.pi * 2)

						style.angle = angle
						style.progress = progress
					end,
				},
				{
					pass_type = "rect",
					style_id = "overlay_1",
				},
			},
		},
		content = {
			texture_id = "loot_loading",
		},
		style = {
			texture_id = {
				angle = 0,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					150,
					150,
				},
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
					1,
				},
			},
			overlay_1 = {
				color = {
					200,
					5,
					5,
					5,
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

				params.render_settings.alpha_multiplier = 1
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

				params.render_settings.alpha_multiplier = 1
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
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
	remove = {
		actions = {
			{
				description_text = "input_description_remove",
				input_action = "special_1",
				priority = 1,
			},
		},
	},
}

return {
	windows = windows,
	widgets = widgets,
	window_layouts = window_layouts,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
	generic_input_actions = generic_input_actions,
}
