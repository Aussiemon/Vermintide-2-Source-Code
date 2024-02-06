-- chunkname: @scripts/ui/views/start_game_view/states/start_game_window_layout.lua

local windows = {
	game_mode = {
		class_name = "StartGameWindowGameMode",
		name = "game_mode",
	},
	adventure = {
		class_name = "StartGameWindowAdventure",
		name = "adventure",
	},
	adventure_settings = {
		class_name = "StartGameWindowAdventureSettings",
		name = "adventure_settings",
	},
	settings = {
		class_name = "StartGameWindowSettings",
		name = "settings",
	},
	mission = {
		class_name = "StartGameWindowMission",
		name = "mission",
	},
	mutator = {
		class_name = "StartGameWindowMutator",
		name = "mutator",
	},
	mutator_list = {
		class_name = "StartGameWindowMutatorList",
		name = "mutator_list",
	},
	mutator_grid = {
		class_name = "StartGameWindowMutatorGrid",
		name = "mutator_grid",
	},
	mutator_summary = {
		class_name = "StartGameWindowMutatorSummary",
		name = "mutator_summary",
	},
	difficulty = {
		class_name = "StartGameWindowDifficulty",
		name = "difficulty",
	},
	mission_selection = {
		class_name = "StartGameWindowMissionSelection",
		name = "mission_selection",
	},
	twitch_login = {
		class_name = "StartGameWindowTwitchLogin",
		name = "twitch_login",
	},
	twitch_game_settings = {
		class_name = "StartGameWindowTwitchGameSettings",
		name = "twitch_game_settings",
	},
	lobby_browser = {
		class_name = "StartGameWindowLobbyBrowser",
		name = "lobby_browser",
	},
	area_selection = {
		class_name = "StartGameWindowAreaSelection",
		name = "area_selection",
	},
	adventure_mode = {
		class_name = "StartGameWindowAdventureMode",
		name = "adventure_mode",
	},
	adventure_mode_settings = {
		class_name = "StartGameWindowAdventureModeSettings",
		name = "adventure_mode_settings",
	},
}
local window_layouts = {
	{
		background_icon_name = "menu_options_button_image_02",
		close_on_exit = true,
		display_name = "start_game_window_adventure_title",
		game_mode_option = true,
		icon_name = "options_button_icon_quickplay",
		name = "adventure",
		panel_sorting = 10,
		save_data_table = "adventure",
		sound_event_enter = "play_gui_lobby_button_00_quickplay",
		windows = {
			adventure = 2,
			adventure_settings = 3,
			game_mode = 1,
		},
		can_add_function = function (overview)
			return overview:is_in_mechanism("adventure")
		end,
	},
	{
		background_icon_name = "menu_options_button_image_04",
		close_on_exit = true,
		display_name = "start_game_window_specific_title",
		game_mode_option = true,
		icon_name = "options_button_icon_custom",
		name = "custom_game",
		panel_sorting = 20,
		save_data_table = "custom",
		sound_event_enter = "play_gui_lobby_button_00_custom",
		windows = {
			game_mode = 1,
			mission = 2,
			settings = 3,
		},
		can_add_function = function (overview)
			return overview:is_in_mechanism("adventure")
		end,
	},
	{
		background_icon_name = "menu_options_button_image_05",
		close_on_exit = true,
		display_name = "start_game_window_mutator_title",
		game_mode_option = true,
		icon_name = "options_button_icon_deed",
		name = "heroic_deeds",
		panel_sorting = 30,
		save_data_table = "deeds",
		sound_event_enter = "play_gui_lobby_button_00_heroic_deed",
		windows = {
			game_mode = 1,
			mutator = 2,
			mutator_list = 3,
		},
		can_add_function = function (overview)
			return overview:is_in_mechanism("adventure")
		end,
	},
	{
		background_icon_name = "menu_options_button_image_03",
		close_on_exit = true,
		display_name = "start_game_window_twitch",
		game_mode_option = true,
		icon_name = "options_button_icon_twitch",
		name = "twitch",
		panel_sorting = 40,
		save_data_table = "twitch",
		sound_event_enter = "play_gui_lobby_button_00_custom",
		windows = {
			game_mode = 1,
			twitch_game_settings = 3,
			twitch_login = 2,
		},
		can_add_function = function (overview)
			return overview:is_in_mechanism("adventure") and overview:can_use_streaming()
		end,
	},
	{
		close_on_exit = false,
		display_name = "start_game_window_lobby_browser",
		icon_name = "lobby_browser_icon",
		name = "lobby_browser",
		reset_on_exit = true,
		save_data_table = "lobby_browser",
		sound_event_enter = "play_gui_lobby_button_00_lobby_browser",
		windows = {
			lobby_browser = 1,
		},
		can_add_function = function (overview)
			return overview:is_in_mechanism("adventure")
		end,
	},
	{
		close_on_exit = false,
		name = "difficulty_selection_adventure",
		save_data_table = "adventure",
		sound_event_enter = "play_gui_lobby_button_01_difficulty",
		windows = {
			difficulty = 1,
		},
	},
	{
		close_on_exit = false,
		display_name = "start_game_window_difficulty",
		name = "difficulty_selection_custom",
		save_data_table = "custom",
		sound_event_enter = "play_gui_lobby_button_01_difficulty",
		windows = {
			difficulty = 1,
		},
	},
	{
		close_on_exit = false,
		display_name = "start_game_window_difficulty",
		name = "difficulty_selection_twitch",
		save_data_table = "twitch",
		sound_event_enter = "play_gui_lobby_button_01_difficulty",
		windows = {
			difficulty = 1,
		},
	},
	{
		close_on_exit = false,
		display_name = "start_game_window_mission",
		name = "area_selection_custom",
		save_data_table = "custom",
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		windows = {
			area_selection = 1,
		},
	},
	{
		close_on_exit = false,
		name = "mission_selection_custom",
		save_data_table = "custom",
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		windows = {
			mission_selection = 1,
		},
	},
	{
		close_on_exit = false,
		display_name = "start_game_window_mission",
		name = "area_selection_twitch",
		save_data_table = "twitch",
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		windows = {
			area_selection = 1,
		},
	},
	{
		close_on_exit = false,
		name = "mission_selection_twitch",
		save_data_table = "twitch",
		sound_event_enter = "play_gui_lobby_button_02_mission_select",
		windows = {
			mission_selection = 1,
		},
	},
	{
		close_on_exit = false,
		display_name = "start_game_window_mutator_desc",
		name = "heroic_deed_selection",
		save_data_table = "deeds",
		sound_event_enter = "play_gui_lobby_button_04_heroic_deed_select",
		windows = {
			mutator_grid = 1,
			mutator_summary = 3,
		},
	},
}
local mechanism_custom_game_settings = {
	adventure = {
		difficulty_index_getter_name = "completed_level_difficulty_index",
		game_mode_type = "custom",
		layout_name = "area_selection_custom",
	},
}
local mechanism_twitch_settings = {
	adventure = {
		difficulty_index_getter_name = "completed_level_difficulty_index",
		game_mode_type = "twitch",
		layout_name = "area_selection_twitch",
	},
}
local mechanism_quickplay_settings = {
	adventure = {
		game_mode_type = "adventure",
		layout_name = "difficulty_selection_adventure",
	},
}
local save_data_table_maps = {}

DLCUtils.map("start_game_window_layout", function (start_game_window_layout)
	local new_windows = start_game_window_layout.windows

	if new_windows then
		for name, window in pairs(new_windows) do
			windows[name] = window
		end
	end

	local new_window_layouts = start_game_window_layout.window_layouts

	if new_window_layouts then
		for i = 1, #new_window_layouts do
			window_layouts[#window_layouts + 1] = new_window_layouts[i]
		end
	end

	local dlc_mechanism_custom_game = start_game_window_layout.mechanism_custom_game

	if dlc_mechanism_custom_game then
		local mechanism_name = dlc_mechanism_custom_game.mechanism_name

		fassert(mechanism_custom_game_settings[mechanism_name] == nil, "Trying to set custom_game for the mechanism '%s' which is already set.", mechanism_name)

		mechanism_custom_game_settings[mechanism_name] = dlc_mechanism_custom_game
	end

	local dlc_mechanism_twitch = start_game_window_layout.mechanism_twitch

	if dlc_mechanism_twitch then
		local mechanism_name = dlc_mechanism_twitch.mechanism_name

		fassert(mechanism_twitch_settings[mechanism_name] == nil, "Trying to set twitch for the mechanism '%s' which is already set.", mechanism_name)

		mechanism_twitch_settings[mechanism_name] = dlc_mechanism_twitch
	end

	local dlc_mechanism_quickplay = start_game_window_layout.mechanism_quickplay

	if dlc_mechanism_quickplay then
		local mechanism_name = dlc_mechanism_quickplay.mechanism_name
		local layout_name = dlc_mechanism_quickplay.layout_name
		local game_mode_type = dlc_mechanism_quickplay.game_mode_type

		fassert(mechanism_quickplay_settings[mechanism_name] == nil, "Trying to set twitch for the mechanism '%s' which is already set.", mechanism_name)

		mechanism_quickplay_settings[mechanism_name] = {
			layout_name = layout_name,
			game_mode_type = game_mode_type,
		}
	end
end)
DLCUtils.merge("start_game_save_data_table_map", save_data_table_maps)

local HUGE = math.huge

table.sort(window_layouts, function (a, b)
	return (a.panel_sorting or HUGE) < (b.panel_sorting or HUGE)
end)

local MAX_ACTIVE_WINDOWS = 4
local MAX_ALIGNMENT_WINDOWS = 3

return {
	max_alignment_windows = MAX_ALIGNMENT_WINDOWS,
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts,
	mechanism_custom_game_settings = mechanism_custom_game_settings,
	mechanism_twitch_settings = mechanism_twitch_settings,
	mechanism_quickplay_settings = mechanism_quickplay_settings,
	save_data_table_maps = save_data_table_maps,
}
