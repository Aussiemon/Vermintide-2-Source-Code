local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - window_frame_width * 2
local mutator_window_width = window_size[1] - 20
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
	title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			50
		},
		position = {
			0,
			-5,
			10
		}
	},
	level_title = {
		vertical_alignment = "bottom",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			window_text_width - 10,
			40
		},
		position = {
			0,
			-40,
			2
		}
	},
	level_image_frame = {
		vertical_alignment = "bottom",
		parent = "level_title",
		horizontal_alignment = "center",
		size = {
			206,
			206
		},
		position = {
			0,
			-190,
			2
		}
	},
	level_image = {
		vertical_alignment = "center",
		parent = "level_image_frame",
		horizontal_alignment = "center",
		size = {
			168,
			168
		},
		position = {
			0,
			0,
			-1
		}
	},
	level_image_mask_top = {
		vertical_alignment = "top",
		parent = "level_image",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			25
		},
		position = {
			0,
			0,
			0
		}
	},
	level_image_mask = {
		vertical_alignment = "top",
		parent = "level_image_mask_top",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			125
		},
		position = {
			0,
			-25,
			0
		}
	},
	level_image_mask_bottom = {
		vertical_alignment = "bottom",
		parent = "level_image",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			50
		},
		position = {
			0,
			0,
			0
		}
	},
	wind_icon_bg = {
		vertical_alignment = "bottom",
		parent = "level_image_frame",
		horizontal_alignment = "center",
		size = {
			73,
			73
		},
		position = {
			0,
			-20,
			2
		}
	},
	wind_icon_slot = {
		vertical_alignment = "center",
		parent = "wind_icon_bg",
		horizontal_alignment = "center",
		size = {
			64,
			64
		},
		position = {
			0,
			0,
			1
		}
	},
	wind_icon_glow = {
		vertical_alignment = "center",
		parent = "wind_icon_slot",
		horizontal_alignment = "center",
		size = {
			51,
			53
		},
		position = {
			0,
			0,
			1
		}
	},
	wind_icon = {
		vertical_alignment = "center",
		parent = "wind_icon_slot",
		horizontal_alignment = "center",
		size = {
			64,
			64
		},
		position = {
			0,
			0,
			2
		}
	},
	wind_title = {
		vertical_alignment = "bottom",
		parent = "level_image_frame",
		horizontal_alignment = "center",
		size = {
			window_text_width - 10,
			40
		},
		position = {
			0,
			-60,
			3
		}
	},
	mutator_window = {
		vertical_alignment = "bottom",
		parent = "level_image",
		horizontal_alignment = "center",
		size = {
			mutator_window_width,
			140
		},
		position = {
			0,
			-240,
			1
		}
	},
	mutator_icon = {
		vertical_alignment = "top",
		parent = "mutator_window",
		horizontal_alignment = "left",
		size = {
			40,
			40
		},
		position = {
			10,
			-50,
			5
		}
	},
	mutator_title_text = {
		vertical_alignment = "top",
		parent = "mutator_window",
		horizontal_alignment = "left",
		size = {
			mutator_window_width * 0.6,
			50
		},
		position = {
			10,
			-5,
			1
		}
	},
	mutator_title_divider = {
		vertical_alignment = "bottom",
		parent = "mutator_title_text",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			0,
			10,
			1
		}
	},
	mutator_description_text = {
		vertical_alignment = "top",
		parent = "mutator_icon",
		horizontal_alignment = "left",
		size = {
			mutator_window_width - 70,
			80
		},
		position = {
			50,
			0,
			1
		}
	},
	objective_title_bg = {
		vertical_alignment = "center",
		parent = "objective_title",
		horizontal_alignment = "center",
		size = {
			467,
			59
		},
		position = {
			0,
			0,
			-1
		}
	},
	objective_title = {
		vertical_alignment = "bottom",
		parent = "mutator_window",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			40
		},
		position = {
			0,
			-40,
			3
		}
	},
	objective_1 = {
		vertical_alignment = "bottom",
		parent = "objective_title",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			30
		},
		position = {
			0,
			-35,
			3
		}
	},
	objective_2 = {
		vertical_alignment = "bottom",
		parent = "objective_1",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			30
		},
		position = {
			0,
			-35,
			0
		}
	},
	score_title_bg = {
		vertical_alignment = "center",
		parent = "score_title",
		horizontal_alignment = "center",
		size = {
			467,
			59
		},
		position = {
			0,
			0,
			-1
		}
	},
	score_title = {
		vertical_alignment = "bottom",
		parent = "objective_2",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			40
		},
		position = {
			0,
			-60,
			3
		}
	},
	score = {
		vertical_alignment = "center",
		parent = "score_title",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			40
		},
		position = {
			-100,
			-40,
			1
		}
	},
	rating_bg = {
		vertical_alignment = "center",
		parent = "score_title",
		horizontal_alignment = "center",
		size = {
			130,
			22
		},
		position = {
			100,
			-42,
			1
		}
	},
	rating = {
		vertical_alignment = "center",
		parent = "rating_bg",
		horizontal_alignment = "center",
		size = {
			130,
			22
		},
		position = {
			0,
			0,
			1
		}
	},
	select_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 100,
			72
		},
		position = {
			0,
			18,
			20
		}
	}
}
local title_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 36,
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
local score_text_style = {
	font_size = 36,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		10,
		0,
		2
	}
}
local objective_title_text_style = {
	font_size = 28,
	upper_case = true,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2
	}
}
local rating_title_text_style = {
	font_size = 28,
	upper_case = true,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "right",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		-10,
		0,
		2
	}
}
local level_title_text_style = {
	font_size = 26,
	upper_case = false,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local wind_title_text_style = {
	font_size = 32,
	upper_case = false,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local mutator_title_text_style = {
	font_size = 32,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local mutator_description_text_style = {
	font_size = 18,
	use_shadow = true,
	localize = false,
	dynamic_font_size_word_wrap = true,
	word_wrap = true,
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

local function create_objective(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					texture_id = "background",
					style_id = "background",
					pass_type = "texture"
				},
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			text = "-",
			icon = "objective_icon_general",
			background = "chest_upgrade_fill_glow"
		},
		style = {
			background = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					22,
					23
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					1
				}
			},
			text = {
				word_wrap = true,
				localize = true,
				font_size = 26,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				size = {
					size[1],
					size[2]
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					2
				}
			},
			text_shadow = {
				word_wrap = true,
				localize = true,
				font_size = 26,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				size = {
					size[1],
					size[2]
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					1
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local rating_texture_sizes = {}
local rating_textures = {}
local rating_bg_textures = {}

for i = 1, 5, 1 do
	rating_textures[i] = "icon_score_rating"
	rating_bg_textures[i] = "icon_score_rating_empty"
	rating_texture_sizes[i] = {
		22,
		22
	}
end

local disable_with_gamepad = true
local widgets = {
	window = UIWidgets.create_rect_with_outer_frame("window", scenegraph_definition.window.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("menu_select"), 34, nil, nil, nil, disable_with_gamepad),
	title = UIWidgets.create_simple_text("n/a", "title", nil, nil, title_text_style),
	mutator_icon = UIWidgets.create_simple_texture("icons_placeholder", "mutator_icon"),
	mutator_title_text = UIWidgets.create_simple_text("n/a", "mutator_title_text", nil, nil, mutator_title_text_style),
	mutator_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "mutator_title_divider"),
	mutator_description_text = UIWidgets.create_simple_text("n/a", "mutator_description_text", nil, nil, mutator_description_text_style),
	wind_icon = UIWidgets.create_simple_texture("icon_wind_azyr", "wind_icon"),
	wind_icon_glow = UIWidgets.create_simple_texture("winds_icon_background_glow", "wind_icon_glow"),
	wind_icon_bg = UIWidgets.create_simple_texture("weave_item_icon_border_selected", "wind_icon_bg"),
	wind_icon_slot = UIWidgets.create_simple_texture("weave_item_icon_border_center", "wind_icon_slot"),
	wind_title = UIWidgets.create_simple_text("n/a", "wind_title", nil, nil, wind_title_text_style),
	level_image = UIWidgets.create_simple_texture("game_options_bg_03", "level_image"),
	level_image_frame = UIWidgets.create_simple_texture("map_frame_weaves", "level_image_frame"),
	level_title = UIWidgets.create_simple_text("n/a", "level_title", nil, nil, level_title_text_style),
	objective_title_bg = UIWidgets.create_simple_texture("menu_subheader_bg", "objective_title_bg"),
	objective_title = UIWidgets.create_simple_text("weave_objective_title", "objective_title", nil, nil, objective_title_text_style),
	objective_1 = create_objective("objective_1", scenegraph_definition.objective_1.size),
	objective_2 = create_objective("objective_2", scenegraph_definition.objective_2.size)
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
