local window_default_settings = UISettings.game_start_windows
local small_window_background = window_default_settings.background
local small_window_frame = window_default_settings.frame
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local large_window_frame = window_default_settings.large_window_frame
local large_window_frame_width = UIFrameSettings[large_window_frame].texture_sizes.vertical[1]
local inner_window_size = {
	small_window_size[1] * 3 + small_window_spacing * 2 + large_window_frame_width * 2,
	small_window_size[2] + 80
}
local window_size = {
	inner_window_size[1] + 50,
	inner_window_size[2]
}
local settings_window_size = window_default_settings.size
local settings_window_frame = window_default_settings.frame
local player_window_size = {
	settings_window_size[1] * 2 + small_window_spacing,
	100
}
local title_height = 40
local list_fade_height = 10
local list_window_size = {
	settings_window_size[1] * 2 + small_window_spacing,
	settings_window_size[2] - (player_window_size[2] + title_height + 20)
}
local list_scrollbar_size = {
	16,
	list_window_size[2]
}
local list_entry_size = {
	list_window_size[1] - 80,
	48
}
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
	screen = {
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
	console_cursor = {
		vertical_alignment = "center",
		parent = "screen",
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
	header = {
		vertical_alignment = "top",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = {
			1920,
			50
		},
		position = {
			0,
			-20,
			100
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			0
		}
	},
	window_background = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 5,
			window_size[2] - 5
		},
		position = {
			0,
			0,
			0
		}
	},
	window_background_mask = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 5,
			window_size[2] - 5
		},
		position = {
			0,
			0,
			1
		}
	},
	inner_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = inner_window_size,
		position = {
			0,
			0,
			1
		}
	},
	inner_window_header = {
		vertical_alignment = "top",
		parent = "inner_window",
		horizontal_alignment = "center",
		size = {
			inner_window_size[1],
			50
		},
		position = {
			0,
			0,
			1
		}
	},
	exit_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			380,
			42
		},
		position = {
			0,
			-16,
			10
		}
	},
	title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			658,
			60
		},
		position = {
			0,
			34,
			10
		}
	},
	title_bg = {
		vertical_alignment = "top",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			410,
			40
		},
		position = {
			0,
			-15,
			-1
		}
	},
	title_text = {
		vertical_alignment = "center",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			350,
			50
		},
		position = {
			0,
			-3,
			2
		}
	},
	settings_window = {
		vertical_alignment = "center",
		parent = "inner_window",
		horizontal_alignment = "left",
		size = settings_window_size,
		position = {
			small_window_spacing / 2,
			0,
			1
		}
	},
	season_title = {
		vertical_alignment = "top",
		parent = "settings_window",
		horizontal_alignment = "center",
		size = {
			settings_window_size[1] - 50,
			40
		},
		position = {
			0,
			-80,
			3
		}
	},
	season_title_divider = {
		vertical_alignment = "center",
		parent = "season_title",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-30,
			-1
		}
	},
	setting_stepper_1 = {
		vertical_alignment = "top",
		parent = "season_title_divider",
		horizontal_alignment = "center",
		size = {
			settings_window_size[1] - 100,
			100
		},
		position = {
			0,
			-51,
			4
		}
	},
	setting_stepper_2 = {
		vertical_alignment = "top",
		parent = "setting_stepper_1",
		horizontal_alignment = "center",
		size = {
			settings_window_size[1] - 100,
			100
		},
		position = {
			0,
			-105,
			0
		}
	},
	setting_stepper_3 = {
		vertical_alignment = "top",
		parent = "setting_stepper_2",
		horizontal_alignment = "center",
		size = {
			settings_window_size[1] - 100,
			100
		},
		position = {
			0,
			-105,
			0
		}
	},
	refresh_button = {
		vertical_alignment = "bottom",
		parent = "settings_window",
		horizontal_alignment = "center",
		size = {
			settings_window_size[1] - 100,
			72
		},
		position = {
			0,
			20,
			3
		}
	},
	player_window = {
		vertical_alignment = "bottom",
		parent = "inner_window",
		horizontal_alignment = "right",
		size = player_window_size,
		position = {
			-small_window_spacing / 2,
			40,
			1
		}
	},
	player_entry = {
		vertical_alignment = "center",
		parent = "player_window",
		horizontal_alignment = "left",
		size = list_entry_size,
		position = {
			25,
			0,
			10
		}
	},
	list_window = {
		vertical_alignment = "top",
		parent = "player_window",
		horizontal_alignment = "right",
		size = list_window_size,
		position = {
			0,
			list_window_size[2] + 20,
			1
		}
	},
	list_mask = {
		vertical_alignment = "center",
		parent = "list_window",
		horizontal_alignment = "center",
		size = {
			list_window_size[1],
			list_window_size[2]
		},
		position = {
			0,
			0,
			3
		}
	},
	list_scrollbar = {
		vertical_alignment = "top",
		parent = "list_mask",
		horizontal_alignment = "right",
		size = list_scrollbar_size,
		position = {
			-16,
			0,
			10
		}
	},
	list_scroll_root = {
		vertical_alignment = "top",
		parent = "list_mask",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			0
		}
	},
	list_entry = {
		vertical_alignment = "top",
		parent = "list_scroll_root",
		horizontal_alignment = "left",
		size = list_entry_size,
		position = {
			25,
			0,
			0
		}
	},
	loading_icon = {
		vertical_alignment = "center",
		parent = "list_window",
		horizontal_alignment = "center",
		size = {
			150,
			150
		},
		position = {
			0,
			0,
			19
		}
	},
	list_title_rank = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "left",
		size = {
			90,
			40
		},
		position = {
			30,
			40,
			1
		}
	},
	list_title_name = {
		vertical_alignment = "center",
		parent = "list_title_rank",
		horizontal_alignment = "right",
		size = {
			430,
			40
		},
		position = {
			438,
			0,
			0
		}
	},
	list_title_weave = {
		vertical_alignment = "center",
		parent = "list_title_name",
		horizontal_alignment = "right",
		size = {
			144,
			40
		},
		position = {
			152,
			0,
			0
		}
	},
	list_title_score = {
		vertical_alignment = "center",
		parent = "list_title_weave",
		horizontal_alignment = "right",
		size = {
			290,
			40
		},
		position = {
			298,
			0,
			0
		}
	}
}
local title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 28,
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
local no_placement_text_style = {
	font_size = 28,
	use_shadow = true,
	localize = false,
	dynamic_font_size_word_wrap = true,
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
local season_title_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 38,
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
local list_title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 24,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_list_mask(scenegraph_id, size, fade_height)
	fade_height = fade_height or 20
	local element = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "hotspot"
			},
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture"
			},
			{
				pass_type = "texture",
				style_id = "mask_top",
				texture_id = "mask_edge"
			},
			{
				pass_type = "rotated_texture",
				style_id = "mask_bottom",
				texture_id = "mask_edge"
			}
		}
	}
	local content = {
		mask_texture = "mask_rect",
		mask_edge = "mask_rect_edge_fade",
		hotspot = {}
	}
	local style = {
		mask = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				size[1],
				size[2] - fade_height * 2
			},
			color = {
				255,
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
		mask_top = {
			vertical_alignment = "top",
			horizontal_alignment = "center",
			texture_size = {
				size[1],
				fade_height
			},
			color = {
				255,
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
		mask_bottom = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			texture_size = {
				size[1],
				fade_height
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				0
			},
			angle = math.pi,
			pivot = {
				size[1] / 2,
				fade_height / 2
			}
		}
	}
	local widget = {
		element = element,
		content = content,
		style = style,
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}

	return widget
end

local function create_stepper(scenegraph_id, size)
	local arrow_icon_size = {
		17,
		27
	}
	local button_hotspot_size = {
		30,
		40
	}
	local left_button_offset = {
		0,
		0,
		0
	}
	local right_button_offset = {
		size[1] - button_hotspot_size[1],
		0,
		0
	}

	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "button_hotspot_left"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					pass_type = "texture",
					style_id = "title_background",
					texture_id = "title_background"
				},
				{
					style_id = "setting_text",
					pass_type = "text",
					text_id = "setting_text"
				},
				{
					style_id = "setting_text_shadow",
					pass_type = "text",
					text_id = "setting_text"
				},
				{
					style_id = "button_hotspot_left",
					pass_type = "hotspot",
					content_id = "button_hotspot_left"
				},
				{
					texture_id = "texture_id",
					style_id = "left_arrow_icon",
					pass_type = "texture",
					content_id = "arrow_icon"
				},
				{
					style_id = "button_hotspot_right",
					pass_type = "hotspot",
					content_id = "button_hotspot_right"
				},
				{
					texture_id = "texture_id",
					style_id = "right_arrow_icon",
					pass_type = "texture_uv",
					content_id = "arrow_icon"
				}
			}
		},
		content = {
			title_text = "title_text",
			title_background = "menu_subheader_bg",
			setting_text = "setting_text",
			arrow_icon = {
				texture_id = "settings_arrow_normal",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			},
			button_hotspot_left = {},
			button_hotspot_right = {}
		},
		style = {
			debug_rect = {
				color = {
					150,
					30,
					30,
					30
				},
				offset = {
					0,
					0,
					1
				}
			},
			title_background = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				texture_size = {
					467,
					59
				},
				color = {
					255,
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
			title_text = {
				word_wrap = true,
				upper_case = true,
				font_size = 24,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					size[2] - 59,
					4
				},
				size = {
					size[1],
					59
				}
			},
			title_text_shadow = {
				word_wrap = true,
				upper_case = true,
				font_size = 24,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					size[2] - 59 - 2,
					3
				},
				size = {
					size[1],
					59
				}
			},
			setting_text = {
				font_size = 24,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					button_hotspot_size[1] + 10,
					0,
					4
				},
				size = {
					size[1] - (button_hotspot_size[1] * 2 + 20),
					button_hotspot_size[2]
				}
			},
			setting_text_shadow = {
				font_size = 24,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					button_hotspot_size[1] + 10 + 2,
					-2,
					3
				},
				size = {
					size[1] - (button_hotspot_size[1] * 2 + 20),
					button_hotspot_size[2]
				}
			},
			button_hotspot_left = {
				color = {
					150,
					30,
					30,
					30
				},
				size = button_hotspot_size,
				offset = left_button_offset
			},
			left_arrow_icon = {
				size = arrow_icon_size,
				offset = {
					left_button_offset[1] + button_hotspot_size[1] / 2 - arrow_icon_size[1] / 2,
					left_button_offset[2] + button_hotspot_size[2] / 2 - arrow_icon_size[2] / 2,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			button_hotspot_right = {
				size = button_hotspot_size,
				offset = right_button_offset
			},
			right_arrow_icon = {
				angle = math.degrees_to_radians(180),
				pivot = {
					14,
					17
				},
				size = arrow_icon_size,
				offset = {
					right_button_offset[1] + button_hotspot_size[1] / 2 - arrow_icon_size[1] / 2,
					right_button_offset[2] + button_hotspot_size[2] / 2 - arrow_icon_size[2] / 2,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local disable_with_gamepad = true
local widgets = {
	window = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_11"),
	window_background = UIWidgets.create_tiled_texture("window_background", "menu_frame_bg_01", {
		960,
		1080
	}, nil, nil, {
		255,
		100,
		100,
		100
	}),
	window_background_mask = UIWidgets.create_tiled_texture("window_background_mask", "menu_frame_bg_01", {
		960,
		1080
	}, nil, true),
	exit_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_close"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title"), "title_text", nil, nil, title_text_style),
	list_title_rank = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title_rank"), "list_title_rank", nil, nil, list_title_text_style),
	list_title_name = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title_player_name"), "list_title_name", nil, nil, list_title_text_style),
	list_title_weave = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title_weave_number"), "list_title_weave", nil, nil, list_title_text_style),
	list_title_score = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_title_weave_score"), "list_title_score", nil, nil, list_title_text_style),
	settings_window = UIWidgets.create_frame("settings_window", scenegraph_definition.settings_window.size, settings_window_frame, 20),
	settings_background = UIWidgets.create_tiled_texture("settings_window", "quests_background", {
		50,
		156
	}, nil, nil, {
		255,
		200,
		200,
		200
	}),
	settings_background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "settings_window", nil, nil, nil, 2),
	season_title = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_season_title"), "season_title", nil, nil, season_title_text_style),
	season_title_divider = UIWidgets.create_simple_texture("divider_01_top", "season_title_divider"),
	refresh_button = UIWidgets.create_default_button("refresh_button", scenegraph_definition.refresh_button.size, nil, nil, Localize("menu_description_refresh"), 34, nil, nil, nil, disable_with_gamepad),
	list_window = UIWidgets.create_frame("list_window", scenegraph_definition.list_window.size, settings_window_frame, 20),
	list_background = UIWidgets.create_tiled_texture("list_window", "quests_background", {
		50,
		156
	}, nil, nil, {
		255,
		200,
		200,
		200
	}),
	list_background_fade = UIWidgets.create_frame("list_window", scenegraph_definition.list_window.size, "frame_inner_glow_01", 2, {
		255,
		0,
		0,
		0
	}),
	list_scrollbar = UIWidgets.create_chain_scrollbar("list_scrollbar", "list_mask", scenegraph_definition.list_scrollbar.size),
	list_mask = create_list_mask("list_mask", scenegraph_definition.list_mask.size, list_fade_height),
	player_window = UIWidgets.create_frame("player_window", scenegraph_definition.player_window.size, settings_window_frame, 20),
	player_window_background = UIWidgets.create_tiled_texture("player_window", "quests_background", {
		50,
		156
	}, nil, nil, {
		255,
		200,
		200,
		200
	}),
	player_window_background_fade = UIWidgets.create_frame("player_window", scenegraph_definition.player_window.size, "frame_inner_glow_01", 2, {
		255,
		0,
		0,
		0
	}),
	player_entry = UIWidgets.create_leaderboard_entry_definition("player_entry", scenegraph_definition.player_entry.size),
	no_placement_text = UIWidgets.create_simple_text(Localize("menu_weave_leaderboard_no_placement_text"), "player_entry", nil, nil, no_placement_text_style),
	setting_stepper_1 = create_stepper("setting_stepper_1", scenegraph_definition.setting_stepper_1.size),
	setting_stepper_2 = create_stepper("setting_stepper_2", scenegraph_definition.setting_stepper_2.size),
	loading_icon = UIWidgets.create_leaderboard_loading_icon("loading_icon", {
		"list_window",
		"player_window"
	})
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
				params.render_settings.alpha_multiplier = 1
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
				params.render_settings.alpha_multiplier = 1
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
			input_action = "special_1",
			priority = 1,
			description_text = "menu_description_refresh"
		},
		{
			input_action = "confirm",
			priority = 2,
			description_text = "input_description_select"
		},
		{
			input_action = "back",
			priority = 3,
			description_text = "input_description_close"
		}
	}
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
	generic_input_actions = generic_input_actions
}
