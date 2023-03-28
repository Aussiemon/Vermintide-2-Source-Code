local num_difficulties = 4
local difficulty_spacing = 40
local difficulty_button_size = {
	250,
	250
}
local difficulty_image_size = {
	250,
	250
}
local difficulty_option_size = {
	difficulty_button_size[1] * num_difficulties + difficulty_spacing * (num_difficulties - 1),
	difficulty_button_size[2]
}
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
			UILayer.default
		}
	},
	right_side_root = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			0,
			1080
		},
		position = {
			0,
			0,
			1
		}
	},
	left_side_root = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			0,
			1080
		},
		position = {
			0,
			0,
			1
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
	menu_options_panel = {
		vertical_alignment = "top",
		parent = "left_side_root",
		horizontal_alignment = "left",
		size = {
			260,
			103
		},
		position = {
			130,
			-300,
			6
		}
	},
	play_button = {
		vertical_alignment = "bottom",
		parent = "menu_options_panel",
		horizontal_alignment = "center",
		size = {
			380,
			70
		},
		position = {
			0,
			-85,
			1
		}
	},
	options_button = {
		vertical_alignment = "center",
		parent = "play_button",
		horizontal_alignment = "center",
		size = {
			380,
			70
		},
		position = {
			0,
			-85,
			1
		}
	},
	tutorial_button = {
		vertical_alignment = "center",
		parent = "options_button",
		horizontal_alignment = "center",
		size = {
			380,
			70
		},
		position = {
			0,
			-85,
			1
		}
	},
	cinematics_button = {
		vertical_alignment = "center",
		parent = "tutorial_button",
		horizontal_alignment = "center",
		size = {
			380,
			70
		},
		position = {
			0,
			-85,
			1
		}
	},
	credits_button = {
		vertical_alignment = "center",
		parent = "cinematics_button",
		horizontal_alignment = "center",
		size = {
			380,
			70
		},
		position = {
			0,
			-85,
			1
		}
	},
	quit_button = {
		vertical_alignment = "center",
		parent = "credits_button",
		horizontal_alignment = "center",
		size = {
			300,
			70
		},
		position = {
			0,
			-85,
			1
		}
	},
	game_options_title = {
		vertical_alignment = "top",
		parent = "right_side_root",
		horizontal_alignment = "right",
		size = {
			465,
			171
		},
		position = {
			-75,
			-70,
			6
		}
	},
	game_options_window = {
		vertical_alignment = "center",
		parent = "game_options_title",
		horizontal_alignment = "center",
		size = {
			380,
			150
		},
		position = {
			0,
			-150,
			1
		}
	},
	selection_info = {
		vertical_alignment = "top",
		parent = "right_side_root",
		horizontal_alignment = "right",
		size = {
			264,
			130
		},
		position = {
			-85,
			-446,
			1
		}
	},
	selection_info_top = {
		vertical_alignment = "top",
		parent = "selection_info",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			14,
			1
		}
	},
	selection_info_bottom = {
		vertical_alignment = "bottom",
		parent = "selection_info",
		horizontal_alignment = "center",
		size = {
			264,
			21
		},
		position = {
			0,
			-1,
			1
		}
	},
	info_career_name = {
		vertical_alignment = "top",
		parent = "selection_info",
		horizontal_alignment = "center",
		size = {
			400,
			25
		},
		position = {
			0,
			-23,
			1
		}
	},
	info_hero_name = {
		vertical_alignment = "top",
		parent = "info_career_name",
		horizontal_alignment = "center",
		size = {
			400,
			25
		},
		position = {
			0,
			-35,
			1
		}
	},
	info_hero_level = {
		vertical_alignment = "top",
		parent = "info_hero_name",
		horizontal_alignment = "center",
		size = {
			450,
			25
		},
		position = {
			0,
			-30,
			1
		}
	},
	hero_button = {
		vertical_alignment = "bottom",
		parent = "selection_info",
		horizontal_alignment = "center",
		size = {
			300,
			60
		},
		position = {
			0,
			-85,
			1
		}
	},
	portrait_root = {
		vertical_alignment = "top",
		parent = "selection_info",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			80,
			1
		}
	},
	logo = {
		vertical_alignment = "top",
		parent = "left_side_root",
		horizontal_alignment = "left",
		size = {
			390,
			197
		},
		position = {
			64,
			-45,
			1
		}
	},
	game_options_right_chain = {
		vertical_alignment = "top",
		parent = "selection_info",
		horizontal_alignment = "center",
		size = {
			16,
			105
		},
		position = {
			100,
			-130,
			-4
		}
	},
	game_options_left_chain = {
		vertical_alignment = "top",
		parent = "selection_info",
		horizontal_alignment = "center",
		size = {
			16,
			90
		},
		position = {
			-100,
			-130,
			-4
		}
	},
	game_options_right_chain_end = {
		vertical_alignment = "bottom",
		parent = "game_options_right_chain",
		horizontal_alignment = "center",
		size = {
			19,
			20
		},
		position = {
			-1,
			-20,
			1
		}
	},
	game_options_left_chain_end = {
		vertical_alignment = "bottom",
		parent = "game_options_left_chain",
		horizontal_alignment = "center",
		size = {
			19,
			20
		},
		position = {
			-1,
			-20,
			1
		}
	},
	menu_options_right_chain = {
		vertical_alignment = "top",
		parent = "menu_options_panel",
		horizontal_alignment = "center",
		size = {
			16,
			450
		},
		position = {
			100,
			-90,
			-4
		}
	},
	menu_options_left_chain = {
		vertical_alignment = "top",
		parent = "menu_options_panel",
		horizontal_alignment = "center",
		size = {
			16,
			480
		},
		position = {
			-100,
			-90,
			-4
		}
	},
	menu_options_right_chain_end = {
		vertical_alignment = "bottom",
		parent = "menu_options_right_chain",
		horizontal_alignment = "center",
		size = {
			19,
			20
		},
		position = {
			-1,
			-20,
			1
		}
	},
	menu_options_left_chain_end = {
		vertical_alignment = "bottom",
		parent = "menu_options_left_chain",
		horizontal_alignment = "center",
		size = {
			19,
			20
		},
		position = {
			-1,
			-20,
			1
		}
	}
}

if Development.parameter("tobii_button") then
	scenegraph_definition.tobii_window = {
		vertical_alignment = "bottom",
		parent = "right_side_root",
		horizontal_alignment = "right",
		size = {
			600,
			200
		},
		position = {
			-90,
			80,
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
			50,
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
end

local hero_career_style = {
	font_size = 36,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
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
local hero_name_style = {
	word_wrap = true,
	use_shadow = true,
	localize = false,
	font_size = 24,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_level_style = {
	word_wrap = true,
	font_size = 20,
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
local tobii_title_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 36,
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
	tutorial_button = UIWidgets.create_default_button("tutorial_button", scenegraph_definition.tutorial_button.size, nil, nil, Localize("start_menu_tutorial"), 24),
	cinematics_button = UIWidgets.create_default_button("cinematics_button", scenegraph_definition.cinematics_button.size, nil, nil, Localize("start_menu_cinematics"), 24),
	credits_button = UIWidgets.create_default_button("credits_button", scenegraph_definition.credits_button.size, nil, nil, Localize("start_menu_credits"), 24),
	quit_button = UIWidgets.create_default_button("quit_button", scenegraph_definition.quit_button.size, nil, nil, Localize("start_menu_quit"), 24),
	play_button = UIWidgets.create_default_button("play_button", scenegraph_definition.play_button.size, nil, nil, Localize("start_menu_play"), 24, "green"),
	options_button = UIWidgets.create_default_button("options_button", scenegraph_definition.options_button.size, nil, nil, Localize("start_menu_options"), 24),
	hero_button = UIWidgets.create_default_button("hero_button", scenegraph_definition.hero_button.size, nil, nil, Localize("start_menu_switch_hero"), 24, nil, "button_detail_02"),
	game_options_right_chain_end = UIWidgets.create_simple_texture("chain_link_02", "game_options_right_chain_end"),
	game_options_left_chain_end = UIWidgets.create_simple_texture("chain_link_02", "game_options_left_chain_end"),
	game_options_left_chain = UIWidgets.create_tiled_texture("game_options_left_chain", "chain_link_01", {
		16,
		19
	}),
	game_options_right_chain = UIWidgets.create_tiled_texture("game_options_right_chain", "chain_link_01", {
		16,
		19
	}),
	menu_options_right_chain_end = UIWidgets.create_simple_texture("chain_link_02", "menu_options_right_chain_end"),
	menu_options_left_chain_end = UIWidgets.create_simple_texture("chain_link_02", "menu_options_left_chain_end"),
	menu_options_left_chain = UIWidgets.create_tiled_texture("menu_options_left_chain", "chain_link_01", {
		16,
		19
	}),
	menu_options_right_chain = UIWidgets.create_tiled_texture("menu_options_right_chain", "chain_link_01", {
		16,
		19
	}),
	menu_options_panel = UIWidgets.create_simple_texture("esc_menu_top", "menu_options_panel"),
	logo = UIWidgets.create_simple_texture("hero_view_home_logo", "logo"),
	selection_info_top = UIWidgets.create_simple_texture("divider_01_top", "selection_info_top"),
	selection_info_bottom = UIWidgets.create_simple_texture("divider_01_bottom", "selection_info_bottom"),
	selection_info = UIWidgets.create_simple_texture("divider_01_bg", "selection_info", nil, nil, {
		255,
		0,
		0,
		0
	}),
	info_career_name = UIWidgets.create_simple_text("n/a", "info_career_name", nil, nil, hero_career_style),
	info_hero_name = UIWidgets.create_simple_text("n/a", "info_hero_name", nil, nil, hero_name_style),
	info_hero_level = UIWidgets.create_simple_text("n/a", "info_hero_level", nil, nil, hero_level_style)
}

if Development.parameter("tobii_button") then
	widgets.tobii_description = UIWidgets.create_simple_text("Rush into the chance to win exclusive prizes", "tobii_description", nil, nil, tobii_description_style)
	widgets.tobii_title = UIWidgets.create_simple_text("JOIN AN EPIC CHALLENGE", "tobii_title", nil, nil, tobii_title_style)
	widgets.tobii_title_effect = UIWidgets.create_simple_texture("play_button_frame_glow", "tobii_title_effect")
	widgets.tobii_title_divider = UIWidgets.create_simple_texture("divider_01_top", "tobii_title_divider")
	widgets.tobii_button = UIWidgets.create_default_button("tobii_button", scenegraph_definition.tobii_button.size, nil, nil, "Read More", 24)
	widgets.tobii_window_frame = UIWidgets.create_frame("tobii_window", scenegraph_definition.tobii_window.size, "menu_frame_12", 10)
	widgets.tobii_window = UIWidgets.create_background("tobii_window", scenegraph_definition.tobii_window.size, "menu_frame_bg_01")
	widgets.tobii_window_background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "tobii_window", nil, nil, nil, 1)
end

local generic_input_actions = {
	default = {
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
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * (1 - anim_progress)
				ui_scenegraph.right_side_root.local_position[1] = scenegraph_definition.right_side_root.position[1] + 100 * (1 - anim_progress)
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
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * anim_progress
				ui_scenegraph.right_side_root.local_position[1] = scenegraph_definition.right_side_root.position[1] + 100 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	widgets = widgets,
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor")
}
