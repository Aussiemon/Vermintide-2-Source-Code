local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local window_size = {
	550,
	700
}
local inner_window_size = {
	window_size[1] - 84,
	window_size[2] - 84
}
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	window = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = window_size,
		position = {
			130,
			-215,
			10
		}
	},
	window_background = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = inner_window_size,
		position = {
			0,
			0,
			0
		}
	},
	paper_background = {
		vertical_alignment = "center",
		parent = "window_background",
		horizontal_alignment = "center",
		size = {
			470,
			620
		},
		position = {
			0,
			0,
			2
		}
	},
	top_banner = {
		vertical_alignment = "top",
		parent = "paper_background",
		horizontal_alignment = "center",
		size = {
			470,
			92
		},
		position = {
			0,
			20,
			1
		}
	},
	top_banner_fade = {
		vertical_alignment = "bottom",
		parent = "background_edge_top",
		horizontal_alignment = "center",
		size = {
			470,
			30
		},
		position = {
			0,
			-25,
			-1
		}
	},
	item_icon_holder = {
		vertical_alignment = "top",
		parent = "paper_background",
		horizontal_alignment = "center",
		size = {
			369,
			136
		},
		position = {
			0,
			-30,
			1
		}
	},
	item_icon = {
		vertical_alignment = "center",
		parent = "item_icon_holder",
		horizontal_alignment = "center",
		size = {
			80,
			80
		},
		position = {
			0,
			0,
			1
		}
	},
	item_icon_mask = {
		vertical_alignment = "center",
		parent = "item_icon_holder",
		horizontal_alignment = "center",
		size = {
			80,
			82
		},
		position = {
			0,
			0,
			1
		}
	},
	background_edge_top = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 42,
			42
		},
		position = {
			0,
			0,
			4
		}
	},
	background_edge_bottom = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 42,
			42
		},
		position = {
			0,
			0,
			4
		}
	},
	background_edge_left = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			42,
			window_size[2] - 42
		},
		position = {
			0,
			0,
			4
		}
	},
	background_edge_right = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			42,
			window_size[2] - 42
		},
		position = {
			0,
			0,
			4
		}
	},
	corner_bottom_left = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			151,
			151
		},
		position = {
			-6,
			-6,
			5
		}
	},
	corner_bottom_right = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			151,
			151
		},
		position = {
			6,
			-6,
			5
		}
	},
	corner_top_left = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			151,
			151
		},
		position = {
			-6,
			6,
			5
		}
	},
	corner_top_right = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			151,
			151
		},
		position = {
			6,
			6,
			5
		}
	},
	title_text = {
		vertical_alignment = "top",
		parent = "item_icon_holder",
		horizontal_alignment = "center",
		size = {
			380,
			40
		},
		position = {
			0,
			-140,
			2
		}
	},
	title_text_edge_top = {
		vertical_alignment = "top",
		parent = "title_text",
		horizontal_alignment = "center",
		size = {
			380,
			4
		},
		position = {
			0,
			4,
			1
		}
	},
	title_text_edge_bottom = {
		vertical_alignment = "bottom",
		parent = "title_text",
		horizontal_alignment = "center",
		size = {
			380,
			4
		},
		position = {
			0,
			-4,
			1
		}
	},
	sub_title_text = {
		vertical_alignment = "bottom",
		parent = "title_text",
		horizontal_alignment = "center",
		size = {
			320,
			30
		},
		position = {
			0,
			-35,
			2
		}
	},
	sub_title_text_edge_left = {
		vertical_alignment = "center",
		parent = "sub_title_text",
		horizontal_alignment = "left",
		size = {
			20,
			14
		},
		position = {
			-20,
			0,
			1
		}
	},
	sub_title_text_edge_right = {
		vertical_alignment = "center",
		parent = "sub_title_text",
		horizontal_alignment = "right",
		size = {
			20,
			14
		},
		position = {
			20,
			0,
			1
		}
	},
	sub_title_divider = {
		vertical_alignment = "bottom",
		parent = "sub_title_text",
		horizontal_alignment = "center",
		size = {
			200,
			20
		},
		position = {
			0,
			-25,
			1
		}
	},
	description_text = {
		vertical_alignment = "top",
		parent = "sub_title_text",
		horizontal_alignment = "center",
		size = {
			350,
			200
		},
		position = {
			0,
			-60,
			2
		}
	},
	career_icons_backgrounds = {
		vertical_alignment = "bottom",
		parent = "paper_background",
		horizontal_alignment = "center",
		size = {
			300,
			50
		},
		position = {
			0,
			30,
			2
		}
	},
	career_icons = {
		vertical_alignment = "center",
		parent = "career_icons_backgrounds",
		horizontal_alignment = "center",
		size = {
			300,
			40
		},
		position = {
			0,
			0,
			1
		}
	},
	hero_text_divider = {
		vertical_alignment = "top",
		parent = "career_icons_backgrounds",
		horizontal_alignment = "center",
		size = {
			200,
			20
		},
		position = {
			0,
			50,
			1
		}
	},
	hero_text = {
		vertical_alignment = "top",
		parent = "hero_text_divider",
		horizontal_alignment = "center",
		size = {
			320,
			30
		},
		position = {
			0,
			-18,
			1
		}
	}
}
local title_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 32,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	dynamic_font_size = false,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		-2,
		2
	}
}
local sub_title_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = false,
	font_size = 24,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = {
		255,
		30,
		30,
		30
	},
	offset = {
		0,
		0,
		2
	}
}
local description_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = false,
	font_size = 18,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	dynamic_font_size = false,
	font_type = "hell_shark",
	text_color = {
		255,
		20,
		20,
		20
	},
	offset = {
		0,
		0,
		2
	}
}
local widgets = {
	window_background = UIWidgets.create_tiled_texture("window_background", "menu_frame_bg_03", {
		256,
		256
	}),
	window_background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window_background", nil, nil, nil, 1),
	paper_background = UIWidgets.create_simple_texture("store_preview_info_paper", "paper_background"),
	top_banner = UIWidgets.create_simple_texture("store_preview_info_ribbon", "top_banner"),
	top_banner_fade = UIWidgets.create_simple_uv_texture("edge_fade_small", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "top_banner_fade"),
	item_icon_holder = UIWidgets.create_simple_texture("store_preview_info_icon_frame", "item_icon_holder"),
	item_icon = UIWidgets.create_simple_texture("options_window_fade_01", "item_icon", true),
	item_icon_mask = UIWidgets.create_simple_texture("store_preview_info_icon_mask", "item_icon_mask"),
	background_edge_top = UIWidgets.create_tiled_texture("background_edge_top", "store_frame_small_side_01", {
		128,
		42
	}),
	background_edge_bottom = UIWidgets.create_tiled_texture("background_edge_bottom", "store_frame_small_side_03", {
		128,
		42
	}),
	background_edge_left = UIWidgets.create_tiled_texture("background_edge_left", "store_frame_small_side_04", {
		42,
		128
	}),
	background_edge_right = UIWidgets.create_tiled_texture("background_edge_right", "store_frame_small_side_02", {
		42,
		128
	}),
	corner_bottom_left = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", 0, {
		75.5,
		75.5
	}, "corner_bottom_left"),
	corner_bottom_right = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", -math.pi / 2, {
		75.5,
		75.5
	}, "corner_bottom_right"),
	corner_top_left = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", math.pi / 2, {
		75.5,
		75.5
	}, "corner_top_left"),
	corner_top_right = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", math.pi, {
		75.5,
		75.5
	}, "corner_top_right"),
	title_text_background = UIWidgets.create_simple_texture("store_preview_info_text_backdrop", "title_text"),
	title_text_edge_top = UIWidgets.create_simple_texture("store_preview_info_backdrop_border", "title_text_edge_top"),
	title_text_edge_bottom = UIWidgets.create_simple_texture("store_preview_info_backdrop_border", "title_text_edge_bottom"),
	title_text = UIWidgets.create_simple_text("n/a", "title_text", nil, nil, title_text_style),
	sub_title_text = UIWidgets.create_simple_text("n/a", "sub_title_text", nil, nil, sub_title_text_style),
	sub_title_text_edge_right = UIWidgets.create_simple_uv_texture("store_preview_info_arrow", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "sub_title_text_edge_right"),
	sub_title_text_edge_left = UIWidgets.create_simple_texture("store_preview_info_arrow", "sub_title_text_edge_left"),
	sub_title_divider = UIWidgets.create_simple_texture("journal_content_divider_medium", "sub_title_divider"),
	description_text = UIWidgets.create_simple_text("n/a", "description_text", nil, nil, description_text_style),
	hero_text_divider = UIWidgets.create_simple_texture("journal_content_divider_medium", "hero_text_divider"),
	hero_text = UIWidgets.create_simple_text("n/a", "hero_text", nil, nil, sub_title_text_style),
	career_icons_backgrounds = UIWidgets.create_simple_centered_texture_amount("store_preview_info_career_icon_border", {
		48,
		50
	}, "career_icons_backgrounds", 5),
	career_icons = UIWidgets.create_simple_centered_texture_amount("store_preview_info_career_icon_border", {
		40,
		40
	}, "career_icons", 5)
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
				local addition_width = 250
				local animated_width = addition_width * anim_progress
				local default_window_position = scenegraph_definition.window.position
				ui_scenegraph.window.local_position[1] = math.floor((default_window_position[1] + addition_width) - animated_width)
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
	title_button_definitions = title_button_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
