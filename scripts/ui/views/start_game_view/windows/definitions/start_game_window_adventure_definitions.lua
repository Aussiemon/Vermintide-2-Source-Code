local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
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
	description_text = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			window_size[2] / 2
		},
		position = {
			0,
			0,
			1
		}
	},
	adventure_texture = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			383,
			383
		},
		position = {
			0,
			0,
			1
		}
	},
	adventure_title_divider = {
		vertical_alignment = "bottom",
		parent = "adventure_texture",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			10,
			1
		}
	},
	adventure_title = {
		vertical_alignment = "bottom",
		parent = "adventure_title_divider",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			50
		},
		position = {
			0,
			20,
			1
		}
	},
	reward_texture = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			250,
			250
		},
		position = {
			0,
			90,
			1
		}
	},
	reward_title = {
		vertical_alignment = "bottom",
		parent = "reward_texture",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			50
		},
		position = {
			0,
			-10,
			1
		}
	},
	reward_description = {
		vertical_alignment = "bottom",
		parent = "reward_title",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			50
		},
		position = {
			0,
			-50,
			1
		}
	}
}
local title_text_style = {
	font_size = 42,
	upper_case = true,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local adventure_title_text_style = {
	font_size = 36,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local description_text_style = {
	word_wrap = true,
	font_size = 18,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
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
	description_text = UIWidgets.create_simple_text(Localize("start_game_window_adventure_desc"), "description_text", nil, nil, description_text_style),
	adventure_title = UIWidgets.create_simple_text(Localize("start_game_window_adventure_title"), "adventure_title", nil, nil, adventure_title_text_style),
	adventure_texture = UIWidgets.create_simple_texture("adventure_icon", "adventure_texture"),
	adventure_title_divider = UIWidgets.create_simple_texture("divider_01_top", "adventure_title_divider")
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
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
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	widgets = widgets,
	node_widgets = node_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
