local MAX_SCORE_PANEL_ROWS = 20
local num_players = 4
local player_score_size = {
	250,
	580
}
local topics_hover_length = 1400 + player_score_size[1]
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
	scores_topics = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			350,
			player_score_size[2]
		},
		position = {
			0,
			0,
			1
		}
	},
	summary_title = {
		vertical_alignment = "top",
		parent = "scores_topics",
		horizontal_alignment = "center",
		size = {
			1600,
			40
		},
		position = {
			0,
			0,
			1
		}
	},
	title_bg = {
		vertical_alignment = "center",
		parent = "summary_title",
		horizontal_alignment = "center",
		size = {
			334,
			60
		},
		position = {
			0,
			0,
			-1
		}
	},
	player_panel_1 = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = player_score_size,
		position = {
			-700,
			0,
			1
		}
	},
	player_panel_2 = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = player_score_size,
		position = {
			-375,
			0,
			1
		}
	},
	player_panel_3 = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = player_score_size,
		position = {
			375,
			0,
			1
		}
	},
	player_panel_4 = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = player_score_size,
		position = {
			700,
			0,
			1
		}
	},
	player_frame_1 = {
		vertical_alignment = "top",
		parent = "player_panel_1",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-15,
			10
		}
	},
	player_frame_2 = {
		vertical_alignment = "top",
		parent = "player_panel_2",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-15,
			10
		}
	},
	player_frame_3 = {
		vertical_alignment = "top",
		parent = "player_panel_3",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-15,
			10
		}
	},
	player_frame_4 = {
		vertical_alignment = "top",
		parent = "player_panel_4",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-15,
			10
		}
	}
}
local summary_title_style = {
	word_wrap = true,
	font_size = 52,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local tobii_title_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local tobii_description_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 20,
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
	summary_title = UIWidgets.create_simple_text(Localize("end_screen_scoreboard"), "summary_title", nil, nil, summary_title_style),
	title_bg = UIWidgets.create_simple_texture("tab_menu_bg_03", "title_bg"),
	scores_topics = UIWidgets.create_score_topics("scores_topics", scenegraph_definition.scores_topics.size, topics_hover_length, MAX_SCORE_PANEL_ROWS)
}

if Development.parameter("tobii_button") then
	scenegraph_definition.tobii_window = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			600,
			200
		},
		position = {
			0,
			-30,
			1
		}
	}
	scenegraph_definition.tobii_button = {
		vertical_alignment = "bottom",
		parent = "tobii_window",
		horizontal_alignment = "center",
		size = {
			300,
			70
		},
		position = {
			0,
			-33,
			30
		}
	}
	scenegraph_definition.tobii_description = {
		vertical_alignment = "bottom",
		parent = "tobii_window",
		horizontal_alignment = "center",
		size = {
			500,
			50
		},
		position = {
			0,
			60,
			10
		}
	}
	scenegraph_definition.tobii_title = {
		vertical_alignment = "center",
		parent = "tobii_window",
		horizontal_alignment = "center",
		size = {
			580,
			50
		},
		position = {
			0,
			60,
			10
		}
	}
	scenegraph_definition.tobii_title_divider = {
		vertical_alignment = "center",
		parent = "tobii_title",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-30,
			-3
		}
	}
	scenegraph_definition.tobii_title_effect = {
		vertical_alignment = "bottom",
		parent = "tobii_title_divider",
		horizontal_alignment = "center",
		size = {
			310,
			120
		},
		position = {
			0,
			7,
			-1
		}
	}
	scenegraph_definition.scores_topics.position[2] = -50
	scenegraph_definition.player_panel_1.position[2] = -50
	scenegraph_definition.player_panel_2.position[2] = -50
	scenegraph_definition.player_panel_3.position[2] = -50
	scenegraph_definition.player_panel_4.position[2] = -50
	widgets.tobii_description = UIWidgets.create_simple_text("did you beat the beta challenge leader with your time?", "tobii_description", nil, nil, tobii_description_style)
	widgets.tobii_title = UIWidgets.create_simple_text("check out your score and if you won!", "tobii_title", nil, nil, tobii_title_style)
	widgets.tobii_title_effect = UIWidgets.create_simple_texture("play_button_frame_glow", "tobii_title_effect")
	widgets.tobii_title_divider = UIWidgets.create_simple_texture("divider_01_top", "tobii_title_divider")
	widgets.tobii_button = UIWidgets.create_default_button("tobii_button", scenegraph_definition.tobii_button.size, nil, nil, "Read More", 24)
	widgets.tobii_window_frame = UIWidgets.create_frame("tobii_window", scenegraph_definition.tobii_window.size, "menu_frame_12", 10)
	widgets.tobii_window = UIWidgets.create_background("tobii_window", scenegraph_definition.tobii_window.size, "menu_frame_bg_01")
	widgets.tobii_window_background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "tobii_window", nil, nil, nil, 1)
end

local score_widgets = {
	player_score_1 = UIWidgets.create_score_entry("player_panel_1", scenegraph_definition.player_panel_1.size, MAX_SCORE_PANEL_ROWS, "left"),
	player_score_2 = UIWidgets.create_score_entry("player_panel_2", scenegraph_definition.player_panel_2.size, MAX_SCORE_PANEL_ROWS),
	player_score_3 = UIWidgets.create_score_entry("player_panel_3", scenegraph_definition.player_panel_3.size, MAX_SCORE_PANEL_ROWS, "left"),
	player_score_4 = UIWidgets.create_score_entry("player_panel_4", scenegraph_definition.player_panel_4.size, MAX_SCORE_PANEL_ROWS)
}
local hero_widgets = {
	player_frame_1 = UIWidgets.create_portrait_frame("player_frame_1", "default", "-", 1, nil, "unit_frame_portrait_default"),
	player_frame_2 = UIWidgets.create_portrait_frame("player_frame_2", "default", "-", 1, nil, "unit_frame_portrait_default"),
	player_frame_3 = UIWidgets.create_portrait_frame("player_frame_3", "default", "-", 1, nil, "unit_frame_portrait_default"),
	player_frame_4 = UIWidgets.create_portrait_frame("player_frame_4", "default", "-", 1, nil, "unit_frame_portrait_default")
}
local animation_definitions = {
	transition_enter = {
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
		},
		{
			name = "move_inner_panels",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(1 - progress)
				ui_scenegraph.player_panel_2.local_position[1] = -375 - 400 * anim_progress
				ui_scenegraph.player_panel_3.local_position[1] = 375 + 400 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "move_outer_panels",
			start_progress = 0,
			end_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(1 - progress)
				ui_scenegraph.player_panel_1.local_position[1] = -700 - 400 * anim_progress
				ui_scenegraph.player_panel_4.local_position[1] = 700 + 400 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	transition_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
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
	hero_widgets = hero_widgets,
	score_widgets = score_widgets,
	player_score_size = player_score_size,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
