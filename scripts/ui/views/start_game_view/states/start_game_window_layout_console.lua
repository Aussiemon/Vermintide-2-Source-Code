local windows = {
	panel = {
		ignore_alignment = true,
		name = "panel",
		class_name = "StartGameWindowPanelConsole"
	},
	background = {
		ignore_alignment = true,
		name = "background",
		class_name = "StartGameWindowBackgroundConsole"
	},
	custom_game_overview = {
		ignore_alignment = true,
		name = "custom_game_overview",
		class_name = "StartGameWindowCustomGameOverviewConsole"
	},
	adventure_overview = {
		ignore_alignment = true,
		name = "adventure_overview",
		class_name = "StartGameWindowAdventureOverviewConsole"
	},
	additional_settings = {
		ignore_alignment = true,
		name = "additional_settings",
		class_name = "StartGameWindowAdditionalSettingsConsole"
	},
	mutator_overview = {
		ignore_alignment = true,
		name = "mutator_overview",
		class_name = "StartGameWindowHeroicDeedOverviewConsole"
	},
	mutator_grid = {
		ignore_alignment = true,
		name = "mutator_grid",
		class_name = "StartGameWindowMutatorGridConsole"
	},
	mutator_summary = {
		ignore_alignment = true,
		name = "mutator_summary",
		class_name = "StartGameWindowMutatorSummaryConsole"
	},
	difficulty = {
		ignore_alignment = true,
		name = "difficulty",
		class_name = "StartGameWindowDifficultyConsole"
	},
	mission_selection = {
		ignore_alignment = true,
		name = "mission_selection",
		class_name = "StartGameWindowMissionSelectionConsole"
	},
	area_selection = {
		ignore_alignment = true,
		name = "area_selection",
		class_name = "StartGameWindowAreaSelectionConsole"
	},
	twitch_overview = {
		ignore_alignment = true,
		name = "twitch_overview",
		class_name = "StartGameWindowTwitchOverviewConsole"
	},
	twitch_login = {
		ignore_alignment = true,
		name = "twitch_login",
		class_name = "StartGameWindowTwitchLoginConsole"
	},
	lobby_browser = {
		ignore_alignment = true,
		name = "lobby_browser",
		class_name = "StartGameWindowLobbyBrowserConsole"
	}
}
local window_layouts = {
	{
		sound_event_enter = "play_gui_lobby_button_00_quickplay",
		name = "adventure",
		save_data_table = "adventure",
		input_focus_window = "adventure_overview",
		close_on_exit = true,
		windows = {
			adventure_overview = 3,
			panel = 1,
			background = 2
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_custom",
		name = "custom_game",
		save_data_table = "custom",
		input_focus_window = "custom_game_overview",
		close_on_exit = true,
		windows = {
			custom_game_overview = 3,
			panel = 1,
			background = 2,
			additional_settings = 4
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_heroic_deed",
		name = "heroic_deeds",
		save_data_table = "deeds",
		input_focus_window = "mutator_overview",
		close_on_exit = true,
		windows = {
			mutator_overview = 3,
			panel = 1,
			background = 2,
			mutator_summary = 4
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_custom",
		name = "twitch",
		save_data_table = "custom",
		input_focus_window = "twitch_overview",
		close_on_exit = true,
		windows = {
			twitch_overview = 3,
			panel = 1,
			background = 2
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_lobby_browser",
		name = "lobby_browser",
		save_data_table = "lobby_browser",
		close_on_exit = true,
		windows = {
			lobby_browser = 3,
			panel = 1,
			background = 2
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_custom",
		name = "mission_selection",
		save_data_table = "custom",
		input_focus_window = "mission_selection",
		close_on_exit = false,
		windows = {
			panel = 1,
			background = 2,
			mission_selection = 3
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_custom",
		name = "difficulty_selection_custom",
		save_data_table = "custom",
		input_focus_window = "difficulty",
		close_on_exit = false,
		windows = {
			difficulty = 3,
			panel = 1,
			background = 2
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_custom",
		name = "difficulty_selection_adventure",
		save_data_table = "adventure",
		input_focus_window = "difficulty",
		close_on_exit = false,
		windows = {
			difficulty = 3,
			panel = 1,
			background = 2
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_04_heroic_deed_select",
		name = "heroic_deed_selection",
		save_data_table = "deeds",
		input_focus_window = "mutator_grid",
		close_on_exit = false,
		windows = {
			mutator_grid = 3,
			panel = 1,
			background = 2,
			mutator_summary = 4
		}
	},
	{
		sound_event_enter = "play_gui_lobby_button_00_custom",
		name = "area_selection",
		save_data_table = "custom",
		input_focus_window = "area_selection",
		close_on_exit = false,
		windows = {
			area_selection = 3,
			panel = 1,
			background = 2
		}
	}
}
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
		},
		{
			input_action = "show_gamercard",
			priority = 5,
			description_text = "map_friend_button_tooltip",
			content_check_function = function ()
				return PLATFORM ~= "win32" and not Managers.account:offline_mode()
			end
		}
	},
	default_custom_game = {
		{
			input_action = "d_vertical",
			priority = 1,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
		{
			input_action = "confirm",
			priority = 2,
			description_text = "input_description_select"
		},
		{
			input_action = "back",
			priority = 3,
			description_text = "input_description_close"
		},
		{
			input_action = "right_stick_press",
			priority = 4,
			description_text = "input_description_additional_options"
		},
		{
			input_action = "show_gamercard",
			priority = 5,
			description_text = "map_friend_button_tooltip",
			content_check_function = function ()
				return PLATFORM ~= "win32" and not Managers.account:offline_mode()
			end
		}
	},
	offline_custom_game = {
		{
			input_action = "d_vertical",
			priority = 1,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
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
	},
	default_twitch = {
		{
			input_action = "d_vertical",
			priority = 1,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
		{
			input_action = "confirm",
			priority = 2,
			description_text = "input_description_select"
		},
		{
			input_action = "back",
			priority = 3,
			description_text = "input_description_close"
		},
		{
			input_action = "special_1",
			priority = 4,
			description_text = "input_description_connect"
		},
		{
			input_action = "show_gamercard",
			priority = 5,
			description_text = "map_friend_button_tooltip",
			content_check_function = function ()
				return PLATFORM ~= "win32" and not Managers.account:offline_mode()
			end
		}
	},
	default_twitch_connected = {
		{
			input_action = "d_vertical",
			priority = 1,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
		{
			input_action = "confirm",
			priority = 2,
			description_text = "input_description_select"
		},
		{
			input_action = "back",
			priority = 3,
			description_text = "input_description_close"
		},
		{
			input_action = "special_1",
			priority = 4,
			description_text = "input_description_disconnect"
		},
		{
			input_action = "show_gamercard",
			priority = 5,
			description_text = "map_friend_button_tooltip",
			content_check_function = function ()
				return PLATFORM ~= "win32" and not Managers.account:offline_mode()
			end
		}
	},
	default_twitch_client = {
		{
			input_action = "back",
			priority = 1,
			description_text = "input_description_close"
		},
		{
			input_action = "special_1",
			priority = 2,
			description_text = "input_description_connect"
		},
		{
			input_action = "show_gamercard",
			priority = 3,
			description_text = "map_friend_button_tooltip",
			content_check_function = function ()
				return PLATFORM ~= "win32" and not Managers.account:offline_mode()
			end
		}
	},
	default_twitch_client_connected = {
		{
			input_action = "back",
			priority = 1,
			description_text = "input_description_close"
		},
		{
			input_action = "special_1",
			priority = 2,
			description_text = "input_description_disconnect"
		},
		{
			input_action = "show_gamercard",
			priority = 3,
			description_text = "map_friend_button_tooltip",
			content_check_function = function ()
				return PLATFORM ~= "win32" and not Managers.account:offline_mode()
			end
		}
	},
	select_difficulty = {
		ignore_generic_actions = true,
		actions = {
			{
				input_action = "d_vertical",
				priority = 1,
				description_text = "input_description_navigate",
				ignore_keybinding = true
			},
			{
				input_action = "back",
				priority = 3,
				description_text = "input_description_close"
			}
		}
	},
	select_difficulty_confirm = {
		ignore_generic_actions = true,
		actions = {
			{
				input_action = "d_vertical",
				priority = 1,
				description_text = "input_description_navigate",
				ignore_keybinding = true
			},
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
	},
	select_area_buy = {
		ignore_generic_actions = true,
		actions = {
			{
				input_action = "d_horizontal",
				priority = 1,
				description_text = "input_description_navigate",
				ignore_keybinding = true
			},
			{
				input_action = "confirm",
				priority = 2,
				description_text = (PLATFORM == "xb1" and "dlc1_4_input_description_storepage") or "buy_now"
			},
			{
				input_action = "back",
				priority = 3,
				description_text = "input_description_close"
			}
		}
	},
	select_area_confirm = {
		ignore_generic_actions = true,
		actions = {
			{
				input_action = "d_horizontal",
				priority = 1,
				description_text = "input_description_navigate",
				ignore_keybinding = true
			},
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
	},
	select_mission = {
		ignore_generic_actions = true,
		actions = {
			{
				input_action = "d_pad",
				priority = 1,
				description_text = "input_description_navigate",
				ignore_keybinding = true
			},
			{
				input_action = "back",
				priority = 3,
				description_text = "input_description_close"
			}
		}
	},
	select_mission_confirm = {
		ignore_generic_actions = true,
		actions = {
			{
				input_action = "d_pad",
				priority = 1,
				description_text = "input_description_navigate",
				ignore_keybinding = true
			},
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
	},
	select_heroic_deed = {
		ignore_generic_actions = true,
		actions = {
			{
				input_action = "d_pad",
				priority = 1,
				description_text = "input_description_navigate",
				ignore_keybinding = true
			},
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
	},
	play_available = {
		actions = {
			{
				input_action = "refresh",
				priority = 6,
				description_text = "input_description_play"
			}
		}
	},
	default_lobby_browser = {
		{
			input_action = "left_stick",
			priority = 1,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
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
	video_resources = video_resources
}
