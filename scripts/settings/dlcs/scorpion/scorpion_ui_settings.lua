local settings = DLCSettings.scorpion
settings.start_game_windows = {
	"scripts/ui/views/start_game_view/windows/start_game_window_weave_list",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_list_definitions",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_list_console_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_weave_info",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_info_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_weave_background",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_background_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_weave_panel",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_panel_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_weave_quickplay",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_quickplay_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_weave_background_console",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_background_console_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_weave_panel_console",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_panel_console_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_weave_lobby_browser_console"
}
settings.start_game_window_layout = {
	windows = {
		weave_list = {
			class_name = "StartGameWindowWeaveList",
			name = "weave"
		},
		weave_info = {
			class_name = "StartGameWindowWeaveInfo",
			name = "weave_info"
		},
		weave_background = {
			class_name = "StartGameWindowWeaveBackground",
			name = "weave_background"
		},
		weave_panel = {
			class_name = "StartGameWindowWeavePanel",
			name = "weave_panel"
		},
		weave_quickplay = {
			class_name = "StartGameWindowWeaveQuickplay",
			name = "weave_quickplay"
		}
	},
	window_layouts = {
		{
			game_mode_option = true,
			save_data_table = "weave",
			display_name = "start_game_window_ranked_weave_title",
			background_icon_name = "button_image_09",
			name = "weave",
			panel_sorting = 10,
			close_on_exit = true,
			icon_name = "options_button_icon_event",
			windows = {
				weave_info = 4,
				weave_background = 1,
				weave_list = 3,
				weave_panel = 2
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("weave")
			end
		},
		{
			game_mode_option = true,
			save_data_table = "weave",
			display_name = "start_game_window_weave_quickplay_title",
			background_icon_name = "button_image_09",
			name = "weave_quickplay",
			panel_sorting = 20,
			close_on_exit = true,
			icon_name = "options_button_icon_event",
			windows = {
				weave_quickplay = 3,
				weave_background = 1,
				weave_panel = 2
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("weave")
			end
		}
	}
}
settings.start_game_window_layout_console = {
	windows = {
		weave_background = {
			class_name = "StartGameWindowWeaveBackgroundConsole",
			name = "weave_background"
		},
		weave_overview = {
			class_name = "StartGameWindowWeaveOverviewConsole",
			name = "weave_info"
		},
		weave_list = {
			class_name = "StartGameWindowWeaveList",
			name = "weave"
		},
		weave_info = {
			class_name = "StartGameWindowWeaveInfo",
			name = "weave_info"
		},
		weave_quickplay = {
			class_name = "StartGameWindowWeaveQuickplay",
			name = "weave_quickplay"
		},
		weave_panel = {
			class_name = "StartGameWindowWeavePanelConsole",
			name = "weave_panel"
		},
		weave_console_lobby_browser = {
			ignore_alignment = true,
			name = "weave_console_lobby_browser",
			class_name = "StartGameWindowWeaveLobbyBrowserConsole"
		}
	},
	window_layouts = {
		{
			sound_event_enter = "play_gui_lobby_button_00_quickplay",
			disable_function_name = "_weave_disable_function",
			display_name = "start_game_window_ranked_weave_title",
			game_mode_option = true,
			name = "weave_ranked",
			save_data_table = "weave",
			panel_sorting = 10,
			close_on_exit = true,
			windows = {
				weave_info = 4,
				weave_background = 2,
				weave_list = 3,
				weave_panel = 1
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("weave")
			end
		},
		{
			sound_event_enter = "play_gui_lobby_button_00_quickplay",
			display_name = "start_game_window_weave_quickplay_title",
			game_mode_option = true,
			name = "weave_quickplay",
			disable_function_name = "_weave_disable_function",
			save_data_table = "weave",
			panel_sorting = 20,
			close_on_exit = true,
			windows = {
				weave_quickplay = 3,
				weave_background = 2,
				weave_panel = 1
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("weave")
			end
		},
		{
			sound_event_enter = "play_gui_lobby_button_00_lobby_browser",
			name = "lobby_browser_weave",
			display_name = "start_game_window_lobby_browser",
			save_data_table = "lobby_browser",
			close_on_exit = true,
			panel_sorting = 100,
			windows = {
				weave_console_lobby_browser = 3,
				weave_background = 2,
				weave_panel = 1
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("weave") and not IS_XB1
			end
		},
		{
			sound_event_enter = "play_gui_lobby_button_00_quickplay",
			name = "weave_selection",
			save_data_table = "weave",
			windows = {
				weave_info = 4,
				weave_background = 2,
				weave_list = 3,
				weave_panel = 1
			}
		},
		{
			sound_event_enter = "play_gui_lobby_button_00_custom",
			name = "difficulty_selection_weave_quick_play",
			save_data_table = "weave",
			input_focus_window = "difficulty",
			close_on_exit = false,
			windows = {
				weave_background = 2,
				difficulty = 3,
				weave_panel = 1
			}
		}
	}
}
settings.ingame_hud_components = {
	{
		use_hud_scale = true,
		class_name = "WeaveProgressUI",
		filename = "scripts/ui/hud_ui/weave_progress_ui",
		visibility_groups = {
			"game_mode_disable_hud",
			"dead",
			"alive"
		},
		validation_function = function ()
			local game_mechanism = Managers.mechanism:game_mechanism()

			return game_mechanism:get_state() == "weave"
		end
	},
	{
		use_hud_scale = true,
		class_name = "WeaveTimerUI",
		filename = "scripts/ui/hud_ui/weave_timer_ui",
		visibility_groups = {
			"game_mode_disable_hud",
			"dead",
			"alive"
		},
		validation_function = function ()
			local game_mechanism = Managers.mechanism:game_mechanism()

			return game_mechanism:get_state() == "weave"
		end
	}
}

return
