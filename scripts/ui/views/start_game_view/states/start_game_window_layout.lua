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
		save_data_table = "adventure",
		display_name = "start_game_window_adventure_title",
		background_icon_name = "menu_options_button_image_02",
		name = "adventure",
		game_mode_option = true,
		sorting = 10,
		close_on_exit = true,
		icon_name = "options_button_icon_quickplay",
		windows = {
			adventure_settings = 3,
			game_mode = 1,
			adventure = 2
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_custom",
		save_data_table = "custom",
		display_name = "start_game_window_specific_title",
		background_icon_name = "menu_options_button_image_04",
		name = "custom_game",
		game_mode_option = true,
		sorting = 20,
		close_on_exit = true,
		icon_name = "options_button_icon_custom",
		windows = {
			settings = 3,
			game_mode = 1,
			mission = 2
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_heroic_deed",
		save_data_table = "deeds",
		display_name = "start_game_window_mutator_title",
		background_icon_name = "menu_options_button_image_05",
		name = "heroic_deeds",
		game_mode_option = true,
		sorting = 30,
		close_on_exit = true,
		icon_name = "options_button_icon_deed",
		windows = {
			mutator = 2,
			game_mode = 1,
			mutator_list = 3
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_custom",
		save_data_table = "twitch",
		display_name = "start_game_window_twitch",
		background_icon_name = "menu_options_button_image_03",
		name = "twitch",
		game_mode_option = true,
		sorting = 40,
		close_on_exit = true,
		icon_name = "options_button_icon_twitch",
		windows = {
			twitch_login = 2,
			game_mode = 1,
			twitch_game_settings = 3
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_lobby_browser",
		name = "lobby_browser",
		display_name = "start_game_window_lobby_browser",
		icon_name = "lobby_browser_icon",
		reset_on_exit = true,
		close_on_exit = false,
		save_data_table = "lobby_browser",
		windows = {
			lobby_browser = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_01_difficulty",
		name = "difficulty_selection_adventure",
		save_data_table = "adventure",
		close_on_exit = false,
		windows = {
			difficulty = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_01_difficulty",
		name = "difficulty_selection_custom",
		display_name = "start_game_window_difficulty",
		save_data_table = "custom",
		close_on_exit = false,
		windows = {
			difficulty = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_01_difficulty",
		name = "difficulty_selection_twitch",
		display_name = "start_game_window_difficulty",
		save_data_table = "twitch",
		close_on_exit = false,
		windows = {
			difficulty = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		name = "area_selection_custom",
		display_name = "start_game_window_mission",
		save_data_table = "custom",
		close_on_exit = false,
		windows = {
			area_selection = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		name = "mission_selection_custom",
		save_data_table = "custom",
		close_on_exit = false,
		windows = {
			mission_selection = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		name = "area_selection_twitch",
		display_name = "start_game_window_mission",
		save_data_table = "twitch",
		close_on_exit = false,
		windows = {
			area_selection = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		name = "mission_selection_twitch",
		save_data_table = "twitch",
		close_on_exit = false,
		windows = {
			mission_selection = 1
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_04_heroic_deed_select",
		name = "heroic_deed_selection",
		display_name = "start_game_window_mutator_desc",
		save_data_table = "deeds",
		close_on_exit = false,
		windows = {
			mutator_summary = 3,
			mutator_grid = 1
		}
	}
}

for _, dlc in pairs(DLCSettings) do
	local start_game_window_layout = dlc.start_game_window_layout

	if start_game_window_layout then
		local new_windows = start_game_window_layout.windows

		if new_windows then
			for name, window in pairs(new_windows) do
				windows[name] = window
			end
		end

		local new_window_layouts = start_game_window_layout.window_layouts

		if new_window_layouts then
			for i = 1, #new_window_layouts, 1 do
				table.insert(window_layouts, 1, new_window_layouts[i])
			end
		end
	end
end

table.sort(window_layouts, function (a, b)
	if a.sorting and b.sorting then
		return a.sorting < b.sorting
	end
end)

local MAX_ACTIVE_WINDOWS = 3

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts
}
