local settings = DLCSettings.gecko
settings.start_game_windows = {
	"scripts/ui/views/start_game_view/windows/start_game_window_event",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_event_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_event_settings",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_event_settings_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_event_overview_console",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_event_overview_console_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_event_summary_console",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_event_summary_console_definitions"
}
settings.start_game_window_layout = {
	windows = {
		event = {
			class_name = "StartGameWindowEvent",
			name = "event"
		},
		event_settings = {
			class_name = "StartGameWindowEventSettings",
			name = "event_settings"
		}
	},
	window_layouts = {
		{
			sound_event_enter = "play_gui_lobby_button_00_quickplay",
			display_name = "start_game_window_event_title",
			background_icon_name = "button_image_09",
			name = "event",
			game_mode_option = true,
			save_data_table = "event",
			panel_sorting = 50,
			close_on_exit = true,
			icon_name = "options_button_icon_event",
			windows = {
				event = 2,
				game_mode = 1,
				event_settings = 3
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("adventure") and overview:is_weekly_event_active()
			end
		},
		{
			sound_event_enter = "play_gui_lobby_button_01_difficulty",
			name = "difficulty_selection_event",
			save_data_table = "event",
			close_on_exit = false,
			windows = {
				difficulty = 1
			}
		}
	}
}
settings.start_game_window_layout_console = {
	windows = {
		event_overview = {
			ignore_alignment = true,
			name = "event",
			class_name = "StartGameWindowEventOverviewConsole"
		},
		event_summary = {
			ignore_alignment = true,
			name = "mutator_summary",
			class_name = "StartGameWindowEventSummaryConsole"
		}
	},
	window_layouts = {
		{
			sound_event_enter = "play_gui_lobby_button_00_quickplay",
			disable_function_name = "_event_disable_function",
			display_name = "start_game_window_event_title",
			game_mode_option = true,
			name = "event",
			save_data_table = "event",
			panel_sorting = 50,
			background_object_set = "weekly",
			input_focus_window = "event_overview",
			close_on_exit = true,
			background_flow_event = "weekly",
			windows = {
				event_overview = 3,
				panel = 1,
				background = 2,
				event_summary = 4
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("adventure") and overview:is_weekly_event_active()
			end
		},
		{
			sound_event_enter = "play_gui_lobby_button_00_custom",
			name = "difficulty_selection_event",
			save_data_table = "event",
			input_focus_window = "difficulty",
			close_on_exit = false,
			windows = {
				difficulty = 3,
				panel = 1,
				background = 2
			}
		}
	}
}
