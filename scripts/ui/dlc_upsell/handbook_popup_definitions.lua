-- chunkname: @scripts/ui/dlc_upsell/handbook_popup_definitions.lua

local window_default_settings = UISettings.game_start_windows
local small_window_spacing = window_default_settings.spacing
local window_size = {
	1128,
	900,
}
local side_window_height = window_size[2]
local right_window_size = {
	window_size[1],
	side_window_height,
}
local achievement_window_size = {
	right_window_size[1] - 22,
	right_window_size[2] - 104,
}
local achievement_scrollbar_size = {
	16,
	right_window_size[2] - 44,
}
local achievement_entry_width = achievement_window_size[1] - 150
local scenegraph_definition = {
	screen = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.item_display_popup,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			50,
			1,
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
	right_window = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "bottom",
		size = right_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	right_window_fade = {
		horizontal_alignment = "center",
		parent = "right_window",
		vertical_alignment = "center",
		size = {
			right_window_size[1] - 44,
			right_window_size[2] - 44,
		},
		position = {
			0,
			0,
			1,
		},
	},
	achievement_window = {
		horizontal_alignment = "center",
		parent = "right_window",
		vertical_alignment = "center",
		size = achievement_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	achievement_window_mask = {
		horizontal_alignment = "center",
		parent = "achievement_window",
		vertical_alignment = "center",
		size = {
			achievement_window_size[1],
			right_window_size[2] - 44,
		},
		position = {
			0,
			0,
			0,
		},
	},
	achievement_window_mask_top = {
		horizontal_alignment = "center",
		parent = "achievement_window_mask",
		vertical_alignment = "top",
		size = {
			achievement_window_size[1],
			30,
		},
		position = {
			0,
			0,
			1,
		},
	},
	achievement_window_mask_bottom = {
		horizontal_alignment = "center",
		parent = "achievement_window_mask",
		vertical_alignment = "bottom",
		size = {
			achievement_window_size[1],
			30,
		},
		position = {
			0,
			0,
			1,
		},
	},
	achievement_root = {
		horizontal_alignment = "center",
		parent = "achievement_window",
		vertical_alignment = "top",
		size = {
			achievement_entry_width,
			1,
		},
		position = {
			0,
			0,
			10,
		},
	},
	achievement_scrollbar = {
		horizontal_alignment = "right",
		parent = "achievement_window",
		vertical_alignment = "center",
		size = achievement_scrollbar_size,
		position = {
			-small_window_spacing,
			0,
			3,
		},
	},
	exit_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			380,
			42,
		},
		position = {
			0,
			-16,
			42,
		},
	},
	page_text_area = {
		horizontal_alignment = "center",
		parent = "right_window",
		vertical_alignment = "bottom",
		size = {
			334,
			60,
		},
		position = {
			0,
			30,
			20,
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
local page_window_size = UISettings.game_start_windows.large_window_size
local page_number_left_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		-(page_window_size[1] * 0.1 + 5),
		4,
		2,
	},
}
local page_number_right_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		page_window_size[1] * 0.1 + 4,
		4,
		2,
	},
}
local page_number_center_text_style = {
	font_size = 20,
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
local disable_with_gamepad = true
local widget_definitions = {
	window = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_11", 40),
	window_background = UIWidgets.create_tiled_texture("window_background", "menu_frame_bg_01", {
		960,
		1080,
	}, nil, nil, {
		255,
		100,
		100,
		100,
	}),
	right_window_fade = UIWidgets.create_simple_texture("options_window_fade_01", "right_window_fade"),
	right_window = UIWidgets.create_tiled_texture("right_window", "achievement_background_leather_02", {
		256,
		256,
	}, nil, nil, {
		255,
		180,
		180,
		180,
	}),
	right_window_mask = UIWidgets.create_simple_texture("mask_rect", "achievement_window"),
	achievement_window_mask_bottom = UIWidgets.create_simple_rotated_texture("mask_rect_edge_fade", math.pi, {
		achievement_window_size[1] / 2,
		15,
	}, "achievement_window_mask_bottom"),
	achievement_window_mask_top = UIWidgets.create_simple_texture("mask_rect_edge_fade", "achievement_window_mask_top"),
	exit_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_close"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	achievement_scrollbar = UIWidgets.create_chain_scrollbar("achievement_scrollbar", nil, scenegraph_definition.achievement_scrollbar.size),
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
	achievement_window = {
		scenegraph_id = "achievement_window_mask",
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "scroll",
					scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis, dt)
						local axis_input = scroll_axis.y * -1

						if IS_XB1 and GameSettingsDevelopment.allow_keyboard_mouse and not ui_content.is_gamepad_active then
							axis_input = math.sign(scroll_axis.x) * -1
						end

						local hotspot = ui_content.hotspot

						if axis_input ~= 0 and hotspot.is_hover then
							ui_content.axis_input = axis_input
							ui_content.scroll_add = axis_input * ui_content.scroll_amount
						end

						local scroll_add = ui_content.scroll_add

						if scroll_add then
							local step = scroll_add * (dt * 5)

							scroll_add = scroll_add - step

							if math.abs(scroll_add) > 0 then
								ui_content.scroll_add = scroll_add
							else
								ui_content.scroll_add = nil
							end

							local current_scroll_value = ui_content.scroll_value

							ui_content.scroll_value = math.clamp(current_scroll_value + step, 0, 1)
						end
					end,
				},
			},
		},
		content = {
			scroll_amount = 0.1,
			scroll_value = 1,
			hotspot = {
				allow_multi_hover = true,
			},
		},
		style = {},
	},
}
local animation_definitions = {
	on_enter = {
		{
			duration = 0.6,
			name = "fade_in",
			init = function (ui_scenegraph, _scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, _scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, _scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			duration = 0.1,
			name = "fade_out",
			init = function (ui_scenegraph, _scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, _scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = 1 - math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, _scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 2,
		},
	},
	has_pages = {
		actions = {
			{
				description_text = "input_description_change_tab",
				ignore_keybinding = true,
				input_action = "l1_r1",
				priority = 2,
			},
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
	achievement_window_size = achievement_window_size,
	achievement_scrollbar_size = achievement_scrollbar_size,
}
