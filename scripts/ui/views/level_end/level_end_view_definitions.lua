local_require("scripts/ui/ui_widgets")

local MAX_SCORE_PANEL_ROWS = 20
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.end_screen
		}
	},
	page_background = {
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
			-55
		}
	},
	edge_rect_left = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			200,
			1080
		},
		position = {
			-200,
			0,
			25
		}
	},
	edge_rect_right = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			200,
			1080
		},
		position = {
			200,
			0,
			25
		}
	},
	edge_rect_top = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			200
		},
		position = {
			0,
			200,
			25
		}
	},
	edge_rect_bottom = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			200
		},
		position = {
			0,
			-200,
			25
		}
	},
	bottom_panel = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			160
		},
		position = {
			0,
			0,
			1
		}
	},
	bottom_panel_frame = {
		vertical_alignment = "top",
		parent = "bottom_panel",
		horizontal_alignment = "center",
		size = {
			1950,
			180
		},
		position = {
			0,
			0,
			1
		}
	},
	bottom_panel_fade_left = {
		vertical_alignment = "bottom",
		parent = "bottom_panel",
		horizontal_alignment = "left",
		size = {
			600,
			160
		},
		position = {
			0,
			0,
			3
		}
	},
	bottom_panel_fade_right = {
		vertical_alignment = "bottom",
		parent = "bottom_panel",
		horizontal_alignment = "right",
		size = {
			600,
			160
		},
		position = {
			0,
			0,
			3
		}
	},
	top_panel = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			160
		},
		position = {
			0,
			0,
			1
		}
	},
	top_panel_frame = {
		vertical_alignment = "bottom",
		parent = "top_panel",
		horizontal_alignment = "center",
		size = {
			1950,
			180
		},
		position = {
			0,
			0,
			1
		}
	},
	top_panel_fade_left = {
		vertical_alignment = "bottom",
		parent = "top_panel",
		horizontal_alignment = "left",
		size = {
			600,
			160
		},
		position = {
			0,
			0,
			3
		}
	},
	top_panel_fade_right = {
		vertical_alignment = "bottom",
		parent = "top_panel",
		horizontal_alignment = "right",
		size = {
			600,
			160
		},
		position = {
			0,
			0,
			3
		}
	},
	player_frame_1 = {
		vertical_alignment = "bottom",
		parent = "top_panel",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			-450,
			70,
			2
		}
	},
	player_frame_2 = {
		vertical_alignment = "bottom",
		parent = "top_panel",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			-150,
			70,
			2
		}
	},
	player_frame_3 = {
		vertical_alignment = "bottom",
		parent = "top_panel",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			150,
			70,
			2
		}
	},
	player_frame_4 = {
		vertical_alignment = "bottom",
		parent = "top_panel",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			450,
			70,
			2
		}
	},
	score_panel = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			700
		},
		position = {
			0,
			-600,
			10
		}
	},
	bottom_edge_fade = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			25
		},
		position = {
			0,
			0,
			13
		}
	},
	hero_root = {
		vertical_alignment = "top",
		parent = "score_panel",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			20,
			1
		}
	},
	hero_1 = {
		vertical_alignment = "center",
		parent = "hero_root",
		horizontal_alignment = "center",
		size = {
			250,
			270
		},
		position = {
			-450,
			0,
			1
		}
	},
	hero_2 = {
		vertical_alignment = "center",
		parent = "hero_root",
		horizontal_alignment = "center",
		size = {
			250,
			270
		},
		position = {
			-150,
			0,
			1
		}
	},
	hero_3 = {
		vertical_alignment = "center",
		parent = "hero_root",
		horizontal_alignment = "center",
		size = {
			250,
			270
		},
		position = {
			150,
			0,
			1
		}
	},
	hero_4 = {
		vertical_alignment = "center",
		parent = "hero_root",
		horizontal_alignment = "center",
		size = {
			250,
			270
		},
		position = {
			450,
			0,
			1
		}
	},
	reward_entry_root = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			300,
			300
		},
		position = {
			0,
			0,
			1
		}
	},
	reset_button = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
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
	level_up = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			354,
			180
		},
		position = {
			0,
			120,
			1
		}
	},
	summary_entry_root = {
		vertical_alignment = "top",
		parent = "top_panel",
		horizontal_alignment = "center",
		size = {
			1600,
			40
		},
		position = {
			0,
			-300,
			1
		}
	},
	timer_bg = {
		vertical_alignment = "top",
		parent = "ready_button",
		horizontal_alignment = "center",
		size = {
			334,
			60
		},
		position = {
			30,
			65,
			1
		}
	},
	timer_text = {
		vertical_alignment = "center",
		parent = "timer_bg",
		horizontal_alignment = "left",
		size = {
			1600,
			60
		},
		position = {
			0,
			0,
			1
		}
	},
	ready_button_alone = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			370,
			70
		},
		position = {
			0,
			80,
			15
		}
	},
	ready_button = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			370,
			70
		},
		position = {
			0,
			80,
			15
		}
	},
	retry_button = {
		vertical_alignment = "center",
		parent = "ready_button",
		horizontal_alignment = "center",
		size = {
			370,
			70
		},
		position = {
			-400,
			0,
			1
		}
	},
	page_selector = {
		vertical_alignment = "bottom",
		parent = "ready_button_alone",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-40,
			10
		}
	}
}
local timer_text_style = {
	vertical_alignment = "center",
	font_size = 52,
	localize = false,
	horizontal_alignment = "left",
	word_wrap = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local player_title_style = {
	vertical_alignment = "top",
	font_size = 20,
	localize = false,
	horizontal_alignment = "center",
	word_wrap = false,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local leave_party_text = (PLATFORM == "xb1" and "leave_party_xb1") or "leave_party"
local masked = true
local widgets_definitions = {
	timer_text = UIWidgets.create_simple_text("n/a", "timer_text", nil, nil, timer_text_style),
	timer_bg = UIWidgets.create_simple_texture("tab_menu_bg_03", "timer_bg"),
	retry_button = UIWidgets.create_default_button("retry_button", scenegraph_definition.retry_button.size, nil, nil, Localize("button_retry"), 32),
	ready_button = UIWidgets.create_default_button("ready_button", scenegraph_definition.ready_button.size, nil, nil, Localize("return_to_inn"), 32),
	reset_button = UIWidgets.create_simple_two_state_button("reset_button", "scroll_bar_button_up", "scroll_bar_button_up_clicked"),
	page_background = UIWidgets.create_simple_rect("page_background", {
		150,
		0,
		0,
		0
	})
}
local animations = {
	ready_button_entry = {
		{
			name = "entry",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.easeCubic(progress)
				local anim_progress = math.easeCubic(progress - 1)
				ui_scenegraph.ready_button_alone.local_position[2] = scenegraph_definition.ready_button_alone.position[2] - anim_progress*100
				params.render_settings.alpha_multiplier = alpha_progress

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	}
}

return {
	num_reward_entries = num_reward_entries,
	num_experience_entries = num_experience_entries,
	scenegraph_definition = scenegraph_definition,
	widgets_definitions = widgets_definitions,
	animations = animations
}
