local SIZE_X = 1920
local SIZE_Y = 1080
local content_margin = 50
local window_width = 1600
local window_height = 900

local_require("scripts/ui/views/deus_menu/ui_widgets_deus")

local content_width = window_width - content_margin * 2
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.item_display_popup
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	background = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			2
		},
		size = {
			window_width,
			window_height
		}
	},
	window_top_detail = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			6
		},
		size = {
			45,
			12
		}
	},
	body_text = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			-400,
			1
		},
		size = {
			content_width - 200,
			500
		}
	},
	ok_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			-16,
			10
		},
		size = {
			480,
			42
		}
	}
}
local title_text_style = {
	font_size = 72,
	upper_case = false,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = false,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local disable_with_gamepad = true
local widget_definitions = {
	window_background = UIWidgets.create_simple_texture("icons_placeholder", "window"),
	window_top_detail = UIWidgets.create_simple_texture("tab_selection_01_bottom", "window_top_detail"),
	window_frame = UIWidgets.create_frame("window", {
		scenegraph_definition.window.size[1] + 50,
		scenegraph_definition.window.size[2] + 50
	}, "menu_frame_11", 5),
	screen_background = UIWidgets.create_simple_rect("screen", {
		50,
		0,
		0,
		0
	}),
	body_text = UIWidgets.create_simple_text("not_assigned", "body_text", nil, nil, title_text_style),
	ok_button = UIWidgets.create_default_button("ok_button", scenegraph_definition.ok_button.size, nil, nil, Localize("not_assigned"), nil, nil, "button_detail_04", 34, disable_with_gamepad)
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = 1 - math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}
local generic_input_actions = {
	default = {
		{
			description = "button_ok",
			priority = 2,
			input_action = "back"
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions
}
