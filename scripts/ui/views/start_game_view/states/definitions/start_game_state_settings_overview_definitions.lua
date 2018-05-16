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
	}
}
local windows = {
	game_mode = {
		class_name = "StartGameWindowGameMode",
		name = "game_mode"
	},
	adventure = {
		class_name = "StartGameWindowAdventure",
		name = "adventure"
	},
	adventure_settings = {
		class_name = "StartGameWindowAdventureSettings",
		name = "adventure_settings"
	},
	settings = {
		class_name = "StartGameWindowSettings",
		name = "settings"
	},
	mission = {
		class_name = "StartGameWindowMission",
		name = "mission"
	},
	mutator = {
		class_name = "StartGameWindowMutator",
		name = "mutator"
	},
	mutator_list = {
		class_name = "StartGameWindowMutatorList",
		name = "mutator_list"
	},
	mutator_grid = {
		class_name = "StartGameWindowMutatorGrid",
		name = "mutator_grid"
	},
	mutator_summary = {
		class_name = "StartGameWindowMutatorSummary",
		name = "mutator_summary"
	},
	difficulty = {
		class_name = "StartGameWindowDifficulty",
		name = "difficulty"
	},
	mission_selection = {
		class_name = "StartGameWindowMissionSelection",
		name = "mission_selection"
	},
	twitch_login = {
		class_name = "StartGameWindowTwitchLogin",
		name = "twitch_login"
	},
	twitch_game_settings = {
		class_name = "StartGameWindowTwitchGameSettings",
		name = "twitch_game_settings"
	},
	lobby_browser = {
		class_name = "StartGameWindowLobbyBrowser",
		name = "lobby_browser"
	}
}
local window_layouts = {
	{
		sound_event_enter = "play_gui_lobby_button_00_quickplay",
		close_on_exit = true,
		save_data_table = "adventure",
		windows = {
			adventure_settings = 3,
			game_mode = 1,
			adventure = 2
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_custom",
		close_on_exit = true,
		save_data_table = "custom",
		windows = {
			settings = 3,
			game_mode = 1,
			mission = 2
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_heroic_deed",
		close_on_exit = true,
		save_data_table = "deeds",
		windows = {
			mutator = 2,
			game_mode = 1,
			mutator_list = 3
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_custom",
		close_on_exit = true,
		save_data_table = "twitch",
		windows = {
			twitch_login = 2,
			game_mode = 1,
			twitch_game_settings = 3
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_01_difficulty",
		close_on_exit = false,
		save_data_table = "custom",
		windows = {
			difficulty = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		close_on_exit = false,
		save_data_table = "custom",
		windows = {
			mission_selection = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_04_heroic_deed_select",
		close_on_exit = false,
		save_data_table = "deeds",
		windows = {
			mutator_summary = 3,
			mutator_grid = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_lobby_browser",
		reset_on_exit = true,
		save_data_table = "lobby_browser",
		close_on_exit = false,
		windows = {
			lobby_browser = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_01_difficulty",
		close_on_exit = false,
		save_data_table = "adventure",
		windows = {
			difficulty = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_01_difficulty",
		close_on_exit = false,
		save_data_table = "twitch",
		windows = {
			difficulty = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		close_on_exit = false,
		save_data_table = "twitch",
		windows = {
			mission_selection = 1
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
	back_button = UIWidgets.create_default_button("exit_button", scenegraph_definition.exit_button.size, nil, nil, Localize("menu_back"), 24, nil, "button_detail_04", 34, disable_with_gamepad),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("start_game_view_title"), "title_text", nil, nil, title_text_style)
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

return {
	windows = windows,
	widgets = widgets,
	window_layouts = window_layouts,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
