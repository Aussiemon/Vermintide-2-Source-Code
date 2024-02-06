-- chunkname: @scripts/settings/dlcs/gecko/gecko_ui_settings.lua

local settings = DLCSettings.gecko

settings.start_game_windows = {
	"scripts/ui/views/start_game_view/windows/start_game_window_event",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_event_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_event_settings",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_event_settings_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_event_overview_console",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_event_overview_console_definitions",
	"scripts/ui/views/start_game_view/windows/start_game_window_event_summary_console",
	"scripts/ui/views/start_game_view/windows/definitions/start_game_window_event_summary_console_definitions",
}
settings.start_game_window_layout = {
	windows = {
		event = {
			class_name = "StartGameWindowEvent",
			name = "event",
		},
		event_settings = {
			class_name = "StartGameWindowEventSettings",
			name = "event_settings",
		},
	},
	window_layouts = {
		{
			background_icon_name = "button_image_09",
			close_on_exit = true,
			display_name = "start_game_window_event_title",
			game_mode_option = true,
			icon_name = "options_button_icon_event",
			name = "event",
			panel_sorting = 50,
			save_data_table = "event",
			sound_event_enter = "play_gui_lobby_button_00_quickplay",
			windows = {
				event = 2,
				event_settings = 3,
				game_mode = 1,
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("adventure") and overview:is_weekly_event_active()
			end,
		},
		{
			close_on_exit = false,
			name = "difficulty_selection_event",
			save_data_table = "event",
			sound_event_enter = "play_gui_lobby_button_01_difficulty",
			windows = {
				difficulty = 1,
			},
		},
	},
}
settings.start_game_window_layout_console = {
	windows = {
		event_overview = {
			class_name = "StartGameWindowEventOverviewConsole",
			ignore_alignment = true,
			name = "event",
		},
		event_summary = {
			class_name = "StartGameWindowEventSummaryConsole",
			ignore_alignment = true,
			name = "mutator_summary",
		},
	},
	window_layouts = {
		{
			background_flow_event = "weekly",
			background_object_set = "weekly",
			close_on_exit = true,
			disable_function_name = "_event_disable_function",
			display_name = "start_game_window_event_title",
			game_mode_option = true,
			input_focus_window = "event_overview",
			name = "event",
			panel_sorting = 50,
			save_data_table = "event",
			sound_event_enter = "play_gui_lobby_button_00_quickplay",
			windows = {
				background = 2,
				event_overview = 3,
				event_summary = 4,
				panel = 1,
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("adventure") and overview:is_weekly_event_active()
			end,
		},
		{
			close_on_exit = false,
			input_focus_window = "difficulty",
			name = "difficulty_selection_event",
			save_data_table = "event",
			sound_event_enter = "play_gui_lobby_button_00_custom",
			windows = {
				background = 2,
				difficulty = 3,
				panel = 1,
			},
		},
	},
}
