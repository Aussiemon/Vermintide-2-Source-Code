local POPUP_W = 550
local POPUP_H = 400
local scenegraph_definition = {
	overlay = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			900
		}
	},
	popup_window = {
		vertical_alignment = "center",
		parent = "overlay",
		horizontal_alignment = "center",
		size = {
			POPUP_W,
			POPUP_H
		},
		position = {
			0,
			0,
			1
		}
	},
	popup_spine_top = {
		vertical_alignment = "top",
		parent = "popup_window",
		horizontal_alignment = "center",
		size = {
			POPUP_W + 11,
			97
		},
		position = {
			0,
			40,
			0
		}
	},
	popup_spine_bot = {
		vertical_alignment = "bottom",
		parent = "popup_window",
		horizontal_alignment = "center",
		size = {
			POPUP_W + 11,
			97
		},
		position = {
			0,
			-40,
			0
		}
	},
	popup_corner_top_left = {
		vertical_alignment = "top",
		parent = "popup_spine_top",
		horizontal_alignment = "left",
		size = {
			23,
			97
		},
		position = {
			-8,
			0,
			1
		}
	},
	popup_corner_top_right = {
		vertical_alignment = "top",
		parent = "popup_spine_top",
		horizontal_alignment = "right",
		size = {
			23,
			97
		},
		position = {
			8,
			0,
			1
		}
	},
	popup_corner_bottom_left = {
		vertical_alignment = "bottom",
		parent = "popup_spine_bot",
		horizontal_alignment = "left",
		size = {
			23,
			97
		},
		position = {
			-8,
			0,
			1
		}
	},
	popup_corner_bottom_right = {
		vertical_alignment = "bottom",
		parent = "popup_spine_bot",
		horizontal_alignment = "right",
		size = {
			23,
			97
		},
		position = {
			8,
			0,
			1
		}
	},
	button_close = {
		vertical_alignment = "top",
		parent = "popup_window",
		horizontal_alignment = "right",
		size = {
			40.5,
			42.5
		},
		position = {
			-16,
			-16,
			0
		}
	},
	label_title = {
		vertical_alignment = "top",
		parent = "popup_window",
		horizontal_alignment = "left",
		size = {
			100,
			10
		},
		position = {
			50,
			-60,
			0
		}
	},
	label_text = {
		vertical_alignment = "bottom",
		parent = "label_title",
		horizontal_alignment = "left",
		size = {
			100,
			10
		},
		position = {
			0,
			-40,
			0
		}
	},
	text_input = {
		vertical_alignment = "bottom",
		parent = "label_text",
		horizontal_alignment = "left",
		size = {
			450,
			48
		},
		position = {
			0,
			-108,
			0
		}
	},
	label_error = {
		vertical_alignment = "bottom",
		parent = "text_input",
		horizontal_alignment = "center",
		size = {
			450,
			50
		},
		position = {
			0,
			-58,
			0
		}
	},
	button_ok = {
		vertical_alignment = "bottom",
		parent = "text_input",
		horizontal_alignment = "center",
		size = {
			370,
			70
		},
		position = {
			0,
			-145,
			0
		}
	}
}
local label_title_style = {
	vertical_alignment = "center",
	font_size = 48,
	localize = true,
	dynamic_font_size = false,
	word_wrap = false,
	horizontal_alignment = "left",
	font_type = "hell_shark_header",
	text_color = {
		255,
		255,
		255,
		255
	}
}
local label_text_style = {
	vertical_alignment = "center",
	font_size = 24,
	localize = true,
	dynamic_font_size = false,
	word_wrap = false,
	horizontal_alignment = "left",
	font_type = "hell_shark",
	text_color = {
		255,
		165,
		165,
		165
	}
}
local label_error_style = {
	vertical_alignment = "center",
	font_size = 20,
	localize = false,
	dynamic_font_size = false,
	word_wrap = true,
	horizontal_alignment = "center",
	font_type = "hell_shark",
	text_color = {
		255,
		165,
		65,
		65
	}
}
local widget_definitions = {
	overlay = UIWidgets.create_simple_rect("overlay", {
		200,
		15,
		15,
		15
	}),
	popup_window = UIWidgets.create_simple_rect("popup_window", {
		255,
		15,
		15,
		15
	}),
	popup_spine_top = UIWidgets.create_tiled_texture("popup_spine_top", "divider_skull_middle", {
		64,
		97
	}),
	popup_spine_bot = UIWidgets.create_tiled_texture("popup_spine_bot", "divider_skull_middle_down", {
		64,
		97
	}),
	popup_corner_top_left = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "popup_corner_top_left"),
	popup_corner_top_right = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "popup_corner_top_right"),
	popup_corner_bottom_left = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			1,
			1
		},
		{
			0,
			0
		}
	}, "popup_corner_bottom_left"),
	popup_corner_bottom_right = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "popup_corner_bottom_right"),
	label_title = UIWidgets.create_simple_text("store_golden_key_popup_title", "label_title", nil, nil, label_title_style),
	label_text = UIWidgets.create_simple_text("store_golden_key_popup_text", "label_text", nil, nil, label_text_style),
	label_error = {
		scenegraph_id = "label_error",
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.show_error
					end
				}
			}
		},
		content = {
			text = Localize("menu_store_purchase_confirmation_denied")
		},
		style = {
			text = label_error_style
		}
	},
	button_close = {
		scenegraph_id = "button_close",
		element = UIElements.SimpleButton,
		content = {
			texture_hover_id = "layout_button_close_glow",
			texture_id = "layout_button_close",
			button_hotspot = {}
		},
		style = {}
	},
	text_input = UIWidgets.create_text_input_rect("text_input", scenegraph_definition.text_input.size, {
		5,
		10,
		0
	}, 18),
	button_ok = UIWidgets.create_default_button("button_ok", scenegraph_definition.button_ok.size, nil, nil, Localize("menu_store_purchase_button_unlock"), 22)
}
local text_input_style = widget_definitions.text_input.style.text
text_input_style.caret_size = {
	2,
	30
}
text_input_style.caret_offset = {
	0,
	-2.5,
	0
}
text_input_style.caret_color = {
	255,
	255,
	255,
	255
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_def, widgets, render_settings)
				render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets, progress, render_settings)
				render_settings.alpha_multiplier = math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widgets, render_settings)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_def, widgets, render_settings)
				render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets, progress, render_settings)
				render_settings.alpha_multiplier = 1 - math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widgets, render_settings)
				return
			end
		}
	}
}

return {
	widget_definitions = widget_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
