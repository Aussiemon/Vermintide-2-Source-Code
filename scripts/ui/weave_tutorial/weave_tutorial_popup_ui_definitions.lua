local SIZE_X = 1920
local SIZE_Y = 1080
local content_margin = 50
local window_w = 460
local content_w = window_w - content_margin * 2
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
			window_w,
			500
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
	title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			-30,
			1
		},
		size = {
			content_w,
			60
		}
	},
	sub_title = {
		vertical_alignment = "top",
		parent = "title",
		horizontal_alignment = "center",
		position = {
			0,
			-40,
			0
		},
		size = {
			content_w,
			50
		}
	},
	body = {
		vertical_alignment = "top",
		parent = "sub_title",
		horizontal_alignment = "center",
		position = {
			0,
			-60,
			0
		},
		size = {
			content_w,
			380
		}
	},
	paragraph_divider = {
		vertical_alignment = "top",
		parent = "body",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			200,
			8
		}
	},
	button_1 = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			-20,
			10
		},
		size = {
			160,
			50
		}
	},
	button_2 = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			-20,
			10
		},
		size = {
			160,
			50
		}
	}
}
local title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = true,
	font_size = 32,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("orange", 255),
	offset = {
		0,
		0,
		2
	}
}
local sub_title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = true,
	font_size = 24,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("orange", 255),
	offset = {
		0,
		0,
		2
	}
}
local body_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 20,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local disable_with_gamepad = true

local function create_button(scenegraph_id, size, text)
	local widget = UIWidgets.create_default_button(scenegraph_id, size, "button_detail_03_gold", "button_bg_01", text, nil, nil, "button_detail_03_gold", nil, disable_with_gamepad)
	widget.content.draw_frame = false
	local style = widget.style
	style.background.size = {
		size[1],
		size[2] - 8
	}
	style.background.offset = {
		0,
		4,
		0
	}
	style.background_fade.offset = {
		0,
		4,
		2
	}
	style.background_fade.size = {
		size[1],
		size[2] - 8
	}
	style.hover_glow.offset = {
		0,
		5,
		3
	}
	style.clicked_rect.offset = {
		0,
		4,
		7
	}
	style.clicked_rect.size = {
		size[1],
		size[2] - 8
	}
	style.glass_top.offset = {
		0,
		size[2] - 16,
		4
	}
	style.glass_bottom.offset = {
		0,
		-4,
		4
	}

	return widget
end

local widget_definitions = {
	window_background = UIWidgets.create_tiled_texture("window", "mission_select_screen_bg", {
		1065,
		770
	}),
	window_top_detail = UIWidgets.create_simple_texture("tab_selection_01_bottom", "window_top_detail"),
	window_frame = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_12_gold", 5),
	screen_background = UIWidgets.create_simple_rect("screen", {
		150,
		0,
		0,
		0
	}),
	title_text = UIWidgets.create_simple_text("", "title", nil, nil, title_text_style),
	sub_title_text = UIWidgets.create_simple_text("", "sub_title", nil, nil, sub_title_text_style),
	button_1 = create_button("button_1", scenegraph_definition.button_1.size, Localize("menu_weave_tutorial_popup_confirm_button")),
	button_2 = create_button("button_2", scenegraph_definition.button_2.size, "")
}
local body_definitions = {
	body_text = UIWidgets.create_simple_text("", "body", nil, nil, body_text_style),
	paragraph_divider = UIWidgets.create_simple_texture("popup_divider", "paragraph_divider")
}
local animation_definitions = {
	transition_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
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
			input_action = "confirm",
			priority = 1,
			description_text = "button_ok"
		}
	}
}

return {
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	body_definitions = body_definitions,
	animation_definitions = animation_definitions
}
