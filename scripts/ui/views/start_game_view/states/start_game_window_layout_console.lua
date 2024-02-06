-- chunkname: @scripts/ui/views/start_game_view/states/start_game_window_layout_console.lua

local windows = {
	panel = {
		class_name = "StartGameWindowPanelConsole",
		ignore_alignment = true,
		name = "panel",
	},
	background = {
		class_name = "StartGameWindowBackgroundConsole",
		ignore_alignment = true,
		name = "background",
	},
	custom_game_overview = {
		class_name = "StartGameWindowCustomGameOverviewConsole",
		ignore_alignment = true,
		name = "custom_game_overview",
	},
	adventure_overview = {
		class_name = "StartGameWindowAdventureOverviewConsole",
		ignore_alignment = true,
		name = "adventure_overview",
	},
	additional_settings = {
		class_name = "StartGameWindowAdditionalSettingsConsole",
		ignore_alignment = true,
		name = "additional_settings",
	},
	mutator_overview = {
		class_name = "StartGameWindowHeroicDeedOverviewConsole",
		ignore_alignment = true,
		name = "mutator_overview",
	},
	mutator_grid = {
		class_name = "StartGameWindowMutatorGridConsole",
		ignore_alignment = true,
		name = "mutator_grid",
	},
	mutator_summary = {
		class_name = "StartGameWindowMutatorSummaryConsole",
		ignore_alignment = true,
		name = "mutator_summary",
	},
	difficulty = {
		class_name = "StartGameWindowDifficultyConsole",
		ignore_alignment = true,
		name = "difficulty",
	},
	mission_selection = {
		class_name = "StartGameWindowMissionSelectionConsole",
		ignore_alignment = true,
		name = "mission_selection",
	},
	area_selection = {
		class_name = "StartGameWindowAreaSelectionConsole",
		ignore_alignment = true,
		name = "area_selection",
	},
	twitch_overview = {
		class_name = "StartGameWindowTwitchOverviewConsole",
		ignore_alignment = true,
		name = "twitch_overview",
	},
	console_lobby_browser = {
		class_name = "StartGameWindowLobbyBrowserConsole",
		ignore_alignment = true,
		name = "console_lobby_browser",
	},
}
local window_layouts = {
	{
		background_flow_event = "quick_play",
		background_object_set = "quick_play",
		close_on_exit = true,
		disable_function_name = "_adventure_disable_function",
		display_name = "start_game_window_adventure_title",
		game_mode_option = true,
		input_focus_window = "adventure_overview",
		name = "adventure",
		panel_sorting = 10,
		save_data_table = "adventure",
		sound_event_enter = "play_gui_lobby_button_00_quickplay",
		windows = {
			adventure_overview = 3,
			background = 2,
			panel = 1,
		},
		can_add_function = function (overview)
			return overview:is_in_mechanism("adventure")
		end,
	},
	{
		background_flow_event = "custom_game",
		background_object_set = "custom_game",
		close_on_exit = true,
		disable_function_name = "_custom_game_disable_function",
		display_name = "start_game_window_specific_title",
		game_mode_option = true,
		input_focus_window = "custom_game_overview",
		name = "custom_game",
		panel_sorting = 20,
		save_data_table = "custom",
		sound_event_enter = "play_gui_lobby_button_00_custom",
		windows = {
			additional_settings = 4,
			background = 2,
			custom_game_overview = 3,
			panel = 1,
		},
		can_add_function = function (overview)
			return overview:is_in_mechanism("adventure")
		end,
	},
	{
		background_flow_event = "deeds",
		background_object_set = "deeds",
		close_on_exit = true,
		disable_function_name = "_heroic_deed_disable_function",
		display_name = "start_game_window_mutator_title",
		game_mode_option = true,
		input_focus_window = "mutator_overview",
		name = "heroic_deeds",
		panel_sorting = 30,
		save_data_table = "deeds",
		sound_event_enter = "play_gui_lobby_button_00_heroic_deed",
		windows = {
			background = 2,
			mutator_overview = 3,
			mutator_summary = 4,
			panel = 1,
		},
		can_add_function = function (overview)
			return overview:is_in_mechanism("adventure")
		end,
	},
	{
		background_flow_event = "twitch",
		background_object_set = "twitch",
		close_on_exit = true,
		disable_function_name = "_streaming_disable_function",
		display_name = "start_game_window_twitch",
		game_mode_option = true,
		input_focus_window = "twitch_overview",
		name = "twitch",
		panel_sorting = 40,
		save_data_table = "custom",
		sound_event_enter = "play_gui_lobby_button_00_custom",
		windows = {
			background = 2,
			panel = 1,
			twitch_overview = 3,
		},
		can_add_function = function (overview)
			return overview:is_in_mechanism("adventure") and overview:can_use_streaming()
		end,
	},
	{
		background_flow_event = "lobby_browser",
		background_object_set = "lobby_browser",
		close_on_exit = true,
		disable_function_name = "_lobby_browser_disable_function",
		display_name = "start_game_window_lobby_browser",
		name = "console_lobby_browser",
		panel_sorting = 100,
		save_data_table = "lobby_browser",
		sound_event_enter = "play_gui_lobby_button_00_lobby_browser",
		windows = {
			background = 2,
			console_lobby_browser = 3,
			panel = 1,
		},
		can_add_function = function (overview)
			return overview:is_in_mechanism("adventure") and not IS_XB1
		end,
	},
	{
		close_on_exit = false,
		input_focus_window = "difficulty",
		name = "difficulty_selection_adventure",
		save_data_table = "adventure",
		sound_event_enter = "play_gui_lobby_button_00_custom",
		windows = {
			background = 2,
			difficulty = 3,
			panel = 1,
		},
	},
	{
		close_on_exit = false,
		input_focus_window = "difficulty",
		name = "difficulty_selection_custom",
		save_data_table = "custom",
		sound_event_enter = "play_gui_lobby_button_00_custom",
		windows = {
			background = 2,
			difficulty = 3,
			panel = 1,
		},
	},
	{
		close_on_exit = false,
		input_focus_window = "area_selection",
		name = "area_selection",
		save_data_table = "custom",
		sound_event_enter = "play_gui_lobby_button_00_custom",
		windows = {
			area_selection = 3,
			background = 2,
			panel = 1,
		},
	},
	{
		close_on_exit = false,
		input_focus_window = "mission_selection",
		name = "mission_selection",
		save_data_table = "custom",
		sound_event_enter = "play_gui_lobby_button_00_custom",
		windows = {
			background = 2,
			mission_selection = 3,
			panel = 1,
		},
	},
	{
		close_on_exit = false,
		input_focus_window = "mutator_grid",
		name = "heroic_deed_selection",
		save_data_table = "deeds",
		sound_event_enter = "play_gui_lobby_button_04_heroic_deed_select",
		windows = {
			background = 2,
			mutator_grid = 3,
			mutator_summary = 4,
			panel = 1,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
		{
			description_text = "input_description_level_preferences",
			input_action = "right_stick_press",
			priority = 4,
			content_check_function = function ()
				return PLATFORM == "xb1" and DLCSettings.quick_play_preferences
			end,
		},
		{
			description_text = "map_friend_button_tooltip",
			input_action = "show_gamercard",
			priority = 5,
			content_check_function = function ()
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end,
		},
	},
	default_custom_game = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
		{
			description_text = "input_description_additional_options",
			input_action = "right_stick_press",
			priority = 4,
		},
		{
			description_text = "map_friend_button_tooltip",
			input_action = "show_gamercard",
			priority = 5,
			content_check_function = function ()
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end,
		},
	},
	offline_custom_game = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
	default_twitch = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
		{
			description_text = "input_description_connect",
			input_action = "special_1",
			priority = 4,
		},
		{
			description_text = "map_friend_button_tooltip",
			input_action = "show_gamercard",
			priority = 5,
			content_check_function = function ()
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end,
		},
	},
	default_twitch_connected = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
		{
			description_text = "input_description_disconnect",
			input_action = "special_1",
			priority = 4,
		},
		{
			description_text = "map_friend_button_tooltip",
			input_action = "show_gamercard",
			priority = 5,
			content_check_function = function ()
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end,
		},
	},
	default_twitch_client = {
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 1,
		},
		{
			description_text = "input_description_connect",
			input_action = "special_1",
			priority = 2,
		},
		{
			description_text = "map_friend_button_tooltip",
			input_action = "show_gamercard",
			priority = 3,
			content_check_function = function ()
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end,
		},
	},
	default_twitch_client_connected = {
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 1,
		},
		{
			description_text = "input_description_disconnect",
			input_action = "special_1",
			priority = 2,
		},
		{
			description_text = "map_friend_button_tooltip",
			input_action = "show_gamercard",
			priority = 3,
			content_check_function = function ()
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end,
		},
	},
	default_weave_quick_play = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 1,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
		{
			description_text = "map_friend_button_tooltip",
			input_action = "show_gamercard",
			priority = 4,
			content_check_function = function ()
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end,
		},
		{
			description_text = "start_game_window_adventure_header",
			input_action = "trigger_cycle_next",
			priority = 5,
		},
	},
	default_weave = {
		{
			description_text = "input_description_select",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 2,
		},
		{
			description_text = "map_friend_button_tooltip",
			input_action = "show_gamercard",
			priority = 3,
			content_check_function = function ()
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end,
		},
		{
			description_text = "start_game_window_adventure_header",
			input_action = "trigger_cycle_next",
			priority = 4,
		},
	},
	default_weave_find_group = {
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 2,
		},
		{
			description_text = "map_friend_button_tooltip",
			input_action = "show_gamercard",
			priority = 3,
			content_check_function = function ()
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end,
		},
	},
	select_difficulty = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_vertical",
				priority = 1,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 3,
			},
		},
	},
	select_difficulty_buy = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_vertical",
				priority = 1,
			},
			{
				description_text = "menu_weave_area_no_wom_button",
				input_action = "confirm",
				priority = 2,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 3,
			},
		},
	},
	select_difficulty_confirm = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_vertical",
				priority = 1,
			},
			{
				description_text = "input_description_select",
				input_action = "confirm",
				priority = 2,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 3,
			},
		},
	},
	select_area_buy = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_horizontal",
				priority = 1,
			},
			{
				input_action = "confirm",
				priority = 2,
				description_text = IS_XB1 and "dlc1_4_input_description_storepage" or "buy_now",
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 3,
			},
		},
	},
	select_area_base = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_horizontal",
				priority = 1,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 3,
			},
		},
	},
	select_area_confirm = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_horizontal",
				priority = 1,
			},
			{
				description_text = "input_description_select",
				input_action = "confirm",
				priority = 2,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 3,
			},
		},
	},
	select_mission = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 3,
			},
		},
	},
	select_mission_confirm = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "input_description_select",
				input_action = "confirm",
				priority = 2,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 3,
			},
		},
	},
	select_heroic_deed = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "input_description_select",
				input_action = "confirm",
				priority = 2,
			},
			{
				description_text = "input_description_back",
				input_action = "back",
				priority = 3,
			},
			{
				description_text = "input_description_mark_delete",
				input_action = "right_stick_press",
				priority = 4,
			},
			{
				description_text = "input_description_delete_selection",
				input_action = "special_1",
				priority = 5,
			},
			{
				description_text = "input_description_clear_all",
				input_action = "refresh",
				priority = 6,
			},
		},
	},
	play_available = {
		actions = {
			{
				description_text = "input_description_play",
				input_action = "refresh",
				priority = 6,
			},
		},
	},
	play_available_lock = {
		actions = {
			{
				description_text = "input_description_play",
				input_action = "refresh",
				priority = 6,
			},
			{
				description_text = "start_game_window_disallow_join",
				input_action = "right_stick_press",
				priority = 7,
			},
		},
	},
	search_available = {
		actions = {
			{
				description_text = "lb_search",
				input_action = "refresh",
				priority = 6,
			},
		},
	},
	cancel_matchmaking = {
		actions = {
			{
				description_text = "cancel_matchmaking",
				input_action = "refresh",
				priority = 6,
			},
		},
	},
	cancel_matchmaking_lock = {
		actions = {
			{
				description_text = "cancel_matchmaking",
				input_action = "refresh",
				priority = 6,
			},
			{
				description_text = "start_game_window_disallow_join",
				input_action = "right_stick_press",
				priority = 7,
			},
		},
	},
	set_next_weave_available = {
		actions = {
			{
				description_text = "input_description_play",
				input_action = "refresh",
				priority = 1,
			},
		},
	},
	play_available_set_next_weave_available = {
		actions = {
			{
				description_text = "input_description_set_next_weave",
				input_action = "special_1",
				priority = 1,
			},
			{
				description_text = "input_description_play",
				input_action = "refresh",
				priority = 6,
			},
		},
	},
	cancel_available_set_next_weave_available = {
		actions = {
			{
				description_text = "input_description_set_next_weave",
				input_action = "special_1",
				priority = 1,
			},
			{
				description_text = "cancel_matchmaking",
				input_action = "refresh",
				priority = 6,
			},
		},
	},
	set_next_weave_available = {
		actions = {
			{
				description_text = "input_description_set_next_weave",
				input_action = "special_1",
				priority = 1,
			},
		},
	},
	set_next_weave_available_lock = {
		actions = {
			{
				description_text = "input_description_play",
				input_action = "refresh",
				priority = 1,
			},
			{
				description_text = "start_game_window_disallow_join",
				input_action = "right_stick_press",
				priority = 7,
			},
		},
	},
	play_available_set_next_weave_available_lock = {
		actions = {
			{
				description_text = "input_description_set_next_weave",
				input_action = "special_1",
				priority = 1,
			},
			{
				description_text = "input_description_play",
				input_action = "refresh",
				priority = 6,
			},
			{
				description_text = "start_game_window_disallow_join",
				input_action = "right_stick_press",
				priority = 7,
			},
		},
	},
	cancel_available_set_next_weave_available_lock = {
		actions = {
			{
				description_text = "input_description_set_next_weave",
				input_action = "special_1",
				priority = 1,
			},
			{
				description_text = "cancel_matchmaking",
				input_action = "refresh",
				priority = 6,
			},
			{
				description_text = "start_game_window_disallow_join",
				input_action = "right_stick_press",
				priority = 7,
			},
		},
	},
	set_next_weave_available_lock = {
		actions = {
			{
				description_text = "input_description_set_next_weave",
				input_action = "special_1",
				priority = 1,
			},
			{
				description_text = "start_game_window_disallow_join",
				input_action = "right_stick_press",
				priority = 7,
			},
		},
	},
	default_lobby_browser = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "left_stick",
			priority = 1,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 10,
		},
	},
	filter = {
		actions = {
			{
				description_text = "menu_description_refresh",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "lb_reset_filters",
				input_action = "left_stick_press",
				priority = 3,
			},
			{
				description_text = "input_description_filter",
				input_action = "right_stick_press",
				priority = 4,
			},
		},
	},
	join_filter = {
		actions = {
			{
				description_text = "menu_description_refresh",
				input_action = "special_1",
				priority = 2,
			},
			{
				description_text = "lb_reset_filters",
				input_action = "left_stick_press",
				priority = 3,
			},
			{
				description_text = "input_description_filter",
				input_action = "right_stick_press",
				priority = 4,
			},
			{
				description_text = "join_menu_button_name",
				input_action = "refresh",
				priority = 5,
			},
		},
	},
	set_filter = {
		actions = {
			{
				description_text = "input_description_select",
				input_action = "confirm",
				priority = 2,
			},
		},
	},
}

DLCUtils.merge("start_game_layout_console_generic_inputs", generic_input_actions)

local mechanism_custom_game_settings = {
	adventure = {
		difficulty_index_getter_name = "completed_level_difficulty_index",
		game_mode_type = "custom",
		layout_name = "area_selection",
	},
}
local mechanism_twitch_settings = {
	adventure = {
		difficulty_index_getter_name = "completed_level_difficulty_index",
		game_mode_type = "twitch",
		layout_name = "area_selection",
	},
}
local mechanism_quickplay_settings = {
	adventure = {
		game_mode_type = "adventure",
		layout_name = "area_selection",
	},
}
local save_data_table_maps = {}

DLCUtils.map("start_game_window_layout_console", function (start_game_window_layout_console)
	local new_windows = start_game_window_layout_console.windows

	if new_windows then
		for name, window in pairs(new_windows) do
			windows[name] = window
		end
	end

	local new_window_layouts = start_game_window_layout_console.window_layouts

	if new_window_layouts then
		for i = 1, #new_window_layouts do
			window_layouts[#window_layouts + 1] = new_window_layouts[i]
		end
	end

	local dlc_mechanism_custom_game = start_game_window_layout_console.mechanism_custom_game

	if dlc_mechanism_custom_game then
		local mechanism_name = dlc_mechanism_custom_game.mechanism_name

		fassert(mechanism_custom_game_settings[mechanism_name] == nil, "Trying to set custom_game for the mechanism '%s' which is already set.", mechanism_name)

		mechanism_custom_game_settings[mechanism_name] = dlc_mechanism_custom_game
	end

	local dlc_mechanism_twitch = start_game_window_layout_console.mechanism_twitch

	if dlc_mechanism_twitch then
		local mechanism_name = dlc_mechanism_twitch.mechanism_name

		fassert(mechanism_twitch_settings[mechanism_name] == nil, "Trying to set twitch for the mechanism '%s' which is already set.", mechanism_name)

		mechanism_twitch_settings[mechanism_name] = dlc_mechanism_twitch
	end

	local dlc_mechanism_quickplay = start_game_window_layout_console.mechanism_quickplay

	if dlc_mechanism_quickplay then
		local mechanism_name = dlc_mechanism_quickplay.mechanism_name

		fassert(mechanism_quickplay_settings[mechanism_name] == nil, "Trying to set twitch for the mechanism '%s' which is already set.", mechanism_name)

		mechanism_quickplay_settings[mechanism_name] = dlc_mechanism_quickplay
	end
end)
DLCUtils.merge("start_game_save_data_table_map_console", save_data_table_maps)

local HUGE = math.huge

table.sort(window_layouts, function (a, b)
	return (a.panel_sorting or HUGE) < (b.panel_sorting or HUGE)
end)

local video_resources = {}

for area_name, settings in pairs(AreaSettings) do
	local video_settings = settings.video_settings

	video_resources[area_name] = video_settings
end

local MAX_ACTIVE_WINDOWS = 5

return {
	max_active_windows = MAX_ACTIVE_WINDOWS,
	windows = windows,
	window_layouts = window_layouts,
	generic_input_actions = generic_input_actions,
	video_resources = video_resources,
	mechanism_custom_game_settings = mechanism_custom_game_settings,
	mechanism_twitch_settings = mechanism_twitch_settings,
	mechanism_quickplay_settings = mechanism_quickplay_settings,
	save_data_table_maps = save_data_table_maps,
}
