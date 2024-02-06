-- chunkname: @scripts/ui/weave_tutorial/weave_tutorial_popup_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local content_margin = 50
local window_w = 460
local content_w = window_w - content_margin * 2
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.item_display_popup,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			0,
			2,
		},
		size = {
			window_w,
			500,
		},
	},
	window_top_detail = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		position = {
			0,
			0,
			6,
		},
		size = {
			45,
			12,
		},
	},
	title = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		position = {
			0,
			-30,
			1,
		},
		size = {
			content_w,
			60,
		},
	},
	sub_title = {
		horizontal_alignment = "center",
		parent = "title",
		vertical_alignment = "top",
		position = {
			0,
			-40,
			0,
		},
		size = {
			content_w,
			50,
		},
	},
	body = {
		horizontal_alignment = "center",
		parent = "sub_title",
		vertical_alignment = "top",
		position = {
			0,
			-60,
			0,
		},
		size = {
			content_w,
			380,
		},
	},
	paragraph_divider = {
		horizontal_alignment = "center",
		parent = "body",
		vertical_alignment = "top",
		position = {
			0,
			0,
			0,
		},
		size = {
			200,
			8,
		},
	},
	button_1 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		position = {
			0,
			-20,
			10,
		},
		size = {
			160,
			50,
		},
	},
	button_2 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		position = {
			0,
			-20,
			10,
		},
		size = {
			160,
			50,
		},
	},
}
local title_text_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("orange", 255),
	offset = {
		0,
		0,
		2,
	},
}
local sub_title_text_style = {
	dynamic_font_size = true,
	font_size = 24,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("orange", 255),
	offset = {
		0,
		0,
		2,
	},
}
local body_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
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
local disable_with_gamepad = true

local function create_button(scenegraph_id, size, text)
	local widget = UIWidgets.create_default_button(scenegraph_id, size, "button_detail_03_gold", "button_bg_01", text, nil, nil, "button_detail_03_gold", nil, disable_with_gamepad)

	widget.content.draw_frame = false

	local style = widget.style

	style.background.size = {
		size[1],
		size[2] - 8,
	}
	style.background.offset = {
		0,
		4,
		0,
	}
	style.background_fade.offset = {
		0,
		4,
		2,
	}
	style.background_fade.size = {
		size[1],
		size[2] - 8,
	}
	style.hover_glow.offset = {
		0,
		5,
		3,
	}
	style.clicked_rect.offset = {
		0,
		4,
		7,
	}
	style.clicked_rect.size = {
		size[1],
		size[2] - 8,
	}
	style.glass_top.offset = {
		0,
		size[2] - 16,
		4,
	}
	style.glass_bottom.offset = {
		0,
		-4,
		4,
	}

	return widget
end

local widget_definitions = {
	window_background = UIWidgets.create_tiled_texture("window", "mission_select_screen_bg", {
		1065,
		770,
	}),
	window_top_detail = UIWidgets.create_simple_texture("tab_selection_01_bottom", "window_top_detail"),
	window_frame = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_12_gold", 5),
	screen_background = UIWidgets.create_simple_rect("screen", {
		150,
		0,
		0,
		0,
	}),
	title_text = UIWidgets.create_simple_text("", "title", nil, nil, title_text_style),
	sub_title_text = UIWidgets.create_simple_text("", "sub_title", nil, nil, sub_title_text_style),
	button_1 = create_button("button_1", scenegraph_definition.button_1.size, Localize("menu_weave_tutorial_popup_confirm_button")),
	button_2 = create_button("button_2", scenegraph_definition.button_2.size, ""),
}
local body_definitions = {
	body_text = UIWidgets.create_simple_text("", "body", nil, nil, body_text_style),
	paragraph_divider = UIWidgets.create_simple_texture("popup_divider", "paragraph_divider"),
}
local animation_definitions = {
	transition_enter = {
		{
			end_progress = 0.2,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
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
			description_text = "button_ok",
			input_action = "confirm",
			priority = 2,
		},
	},
}

return {
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	body_definitions = body_definitions,
	animation_definitions = animation_definitions,
}
