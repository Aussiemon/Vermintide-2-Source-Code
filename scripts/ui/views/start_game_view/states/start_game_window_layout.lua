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
	},
	area_selection = {
		class_name = "StartGameWindowAreaSelection",
		name = "area_selection"
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
		name = "twitch",
		save_data_table = "twitch",
		close_on_exit = true,
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
		save_data_table = "custom",
		windows = {
			area_selection = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		close_on_exit = false,
		save_data_table = "twitch",
		windows = {
			mission_selection = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		close_on_exit = false,
		save_data_table = "twitch",
		windows = {
			area_selection = 1
		}
	}
}
local MAX_ACTIVE_WINDOWS = 3

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts
}
