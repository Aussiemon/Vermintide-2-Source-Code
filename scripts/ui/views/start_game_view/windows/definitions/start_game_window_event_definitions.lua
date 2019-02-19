local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	menu_root = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			0
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	event_texture = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			480,
			564
		},
		position = {
			0,
			-60,
			1
		}
	},
	event_title = {
		vertical_alignment = "top",
		parent = "event_texture",
		horizontal_alignment = "center",
		size = {
			300,
			80
		},
		position = {
			0,
			-40,
			1
		}
	},
	description_text = {
		vertical_alignment = "bottom",
		parent = "event_texture",
		horizontal_alignment = "center",
		size = {
			300,
			120
		},
		position = {
			0,
			10,
			1
		}
	}
}
local event_title_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 52,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local description_text_style = {
	word_wrap = true,
	font_size = 22,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local widgets = {
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window"),
	background_mask = UIWidgets.create_simple_texture("mask_rect", "window"),
	window = UIWidgets.create_frame("window", window_size, window_frame, 20),
	description_text = UIWidgets.create_simple_text("", "description_text", nil, nil, description_text_style),
	event_title = UIWidgets.create_simple_text("", "event_title", nil, nil, event_title_text_style),
	event_texture = UIWidgets.create_simple_texture("adventure_icon", "event_texture")
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition
}
