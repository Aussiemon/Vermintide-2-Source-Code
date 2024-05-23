-- chunkname: @scripts/settings/dlcs/morris/morris_ui_settings.lua

require("scripts/utils/colors")

local settings = DLCSettings.morris

settings.ui_views = {
	{
		class_name = "DeusCursedChestView",
		file = "scripts/ui/views/deus_menu/deus_cursed_chest_view",
		name = "deus_cursed_chest",
		only_in_game = true,
		only_in_inn = false,
		mechanism_filter = {
			deus = true,
		},
		transitions = {
			deus_cursed_chest = function (self)
				self.current_view = "deus_cursed_chest"
			end,
		},
	},
	{
		class_name = "DeusDebugChangelogView",
		file = "scripts/ui/views/deus_menu/deus_debug_changelog_view",
		name = "deus_debug_changelog_view",
		only_in_game = false,
		only_in_inn = false,
		mechanism_filter = {
			deus = true,
		},
		transitions = {
			deus_debug_changelog_view = function (self)
				self.current_view = "deus_debug_changelog_view"
			end,
		},
	},
}
settings.ingame_hud_components = {
	{
		class_name = "EnergyBarUI",
		filename = "scripts/ui/hud_ui/energy_bar_ui",
		use_hud_scale = true,
		visibility_groups = {
			"alive",
		},
	},
}
settings.ui_end_screens = {
	deus_victory = {
		class_name = "DeusVictoryEndScreenUI",
		file_name = "scripts/ui/views/end_screens/deus_victory_end_screen_ui",
	},
}
settings.ui_materials = {
	"materials/ui/ui_1080p_morris_single_textures",
}
settings.start_game_windows = {
	"scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_panel",
	"scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_background",
	"scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_quickplay",
	"scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_custom_game",
	"scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_twitch",
	"scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_lobby_browser",
	"scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_additional_settings",
	"scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_chaos_god_information",
	"scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_weekly_event",
	"scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_journey_selection",
}
settings.start_game_save_data_table_map = {
	deus = {
		adventure = "deus_quickplay",
		custom = "deus_custom",
		difficulty_selection_adventure = "deus_quickplay",
		difficulty_selection_custom = "deus_custom",
		difficulty_selection_twitch = "deus_twitch",
		twitch = "deus_twitch",
	},
}

local deus_save_data_table_map = settings.start_game_save_data_table_map.deus

settings.start_game_save_data_table_map_console = table.clone(settings.start_game_save_data_table_map)

local deus_save_data_table_map_console = settings.start_game_save_data_table_map_console.deus

deus_save_data_table_map_console.twitch = "deus_custom"
deus_save_data_table_map_console.difficulty_selection_twitch = "deus_custom"
settings.start_game_window_layout_console = {
	windows = {
		deus_background = {
			class_name = "StartGameWindowDeusBackground",
			name = "deus_background",
		},
		deus_panel = {
			class_name = "StartGameWindowDeusPanel",
			name = "deus_panel",
		},
		deus_quickplay = {
			class_name = "StartGameWindowDeusQuickplay",
			name = "deus_quickplay",
		},
		deus_custom_game = {
			class_name = "StartGameWindowDeusCustomGame",
			name = "deus_custom_game",
		},
		deus_twitch = {
			class_name = "StartGameWindowDeusTwitch",
			name = "deus_twitch",
		},
		deus_lobby_browser = {
			class_name = "StartGameWindowDeusLobbyBrowser",
			name = "deus_lobby_browser",
		},
		deus_selection_journey = {
			class_name = "StartGameWindowDeusJourneySelection",
			name = "deus_selection_journey",
		},
		deus_additional_settings = {
			class_name = "StartGameWindowDeusAdditionalSettings",
			ignore_alignment = true,
			name = "deus_additional_settings",
			parent_window_name = "deus_custom_game",
		},
		deus_chaos_god_information = {
			class_name = "StartGameWindowDeusChaosGodInformation",
			ignore_alignment = true,
			name = "deus_chaos_god_information",
		},
		deus_weekly_event = {
			class_name = "StartGameWindowDeusWeeklyEvent",
			ignore_alignment = true,
			name = "deus_weekly_event",
		},
	},
	window_layouts = {
		{
			background_flow_event = "quick_play_chaos_wastes",
			background_object_set = "quick_play_chaos_wastes",
			close_on_exit = true,
			disable_function_name = "_deus_quickplay_disable_function",
			display_name = "start_game_window_adventure_title",
			game_mode_option = true,
			input_focus_window = "deus_quickplay",
			name = "deus_quickplay",
			panel_sorting = 10,
			sound_event_enter = "hud_morris_start_menu_category",
			windows = {
				deus_background = 2,
				deus_panel = 1,
				deus_quickplay = 3,
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("deus")
			end,
			save_data_table = deus_save_data_table_map_console.custom,
		},
		{
			background_flow_event = "custom_game_chaos_wastes",
			background_object_set = "custom_game_chaos_wastes",
			close_on_exit = true,
			disable_function_name = "_deus_custom_disable_function",
			display_name = "start_game_window_specific_title",
			game_mode_option = true,
			input_focus_window = "deus_custom_game",
			name = "deus_custom_game",
			panel_sorting = 20,
			sound_event_enter = "hud_morris_start_menu_category",
			windows = {
				deus_additional_settings = 4,
				deus_background = 2,
				deus_chaos_god_information = 5,
				deus_custom_game = 3,
				deus_panel = 1,
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("deus")
			end,
			save_data_table = deus_save_data_table_map_console.custom,
		},
		{
			background_flow_event = "twitch_chaos_wastes",
			background_object_set = "twitch_chaos_wastes",
			close_on_exit = true,
			display_name = "start_game_window_twitch",
			game_mode_option = true,
			input_focus_window = "deus_twitch",
			name = "deus_twitch",
			panel_sorting = 30,
			sound_event_enter = "hud_morris_start_menu_category",
			windows = {
				deus_background = 2,
				deus_chaos_god_information = 5,
				deus_panel = 1,
				deus_twitch = 3,
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("deus") and overview:can_use_streaming()
			end,
			should_draw_god_info = function (ingame_ui_context)
				return ingame_ui_context.is_server
			end,
			save_data_table = deus_save_data_table_map_console.twitch,
		},
		{
			background_flow_event = "custom_game_chaos_wastes",
			background_object_set = "custom_game_chaos_wastes",
			close_on_exit = true,
			display_name = "cw_weekly_expedition_name_long",
			game_mode_option = true,
			input_focus_window = "deus_weekly_event",
			name = "deus_weekly_event",
			panel_sorting = 25,
			sound_event_enter = "hud_morris_start_menu_category",
			windows = {
				deus_background = 2,
				deus_panel = 1,
				deus_weekly_event = 3,
			},
			can_add_function = function (overview)
				local offline_mode = Managers.account:offline_mode()

				if offline_mode then
					return false
				end

				local live_event_interface = Managers.backend:get_interface("live_events")
				local game_mode_data = live_event_interface:get_weekly_chaos_wastes_game_mode_data()

				return overview:is_in_mechanism("deus") and not table.is_empty(game_mode_data)
			end,
			save_data_table = deus_save_data_table_map_console.twitch,
		},
		{
			background_flow_event = "lobby_browser_chaos_wastes",
			background_object_set = "lobby_browser_chaos_wastes",
			close_on_exit = true,
			display_name = "start_game_window_lobby_browser",
			name = "deus_lobby_browser",
			panel_sorting = 100,
			sound_event_enter = "hud_morris_start_menu_category",
			windows = {
				deus_background = 2,
				deus_lobby_browser = 3,
				deus_panel = 1,
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("deus") and not IS_XB1
			end,
			save_data_table = deus_save_data_table_map_console.lobby_browser,
		},
		{
			input_focus_window = "deus_selection_journey",
			name = "deus_selection_journey_layout",
			sound_event_enter = "hud_morris_start_menu_category",
			windows = {
				background = 2,
				deus_selection_journey = 3,
				panel = 1,
			},
			save_data_table = deus_save_data_table_map_console.custom,
		},
		{
			input_focus_window = "deus_selection_journey",
			name = "deus_selection_journey_layout_twitch",
			sound_event_enter = "hud_morris_start_menu_category",
			windows = {
				background = 2,
				deus_selection_journey = 3,
				panel = 1,
			},
			save_data_table = deus_save_data_table_map_console.twitch,
		},
	},
	mechanism_custom_game = {
		difficulty_index_getter_name = "completed_journey_difficulty_index",
		game_mode_type = "deus_custom",
		layout_name = "deus_selection_journey_layout",
		mechanism_name = "deus",
	},
	mechanism_twitch = {
		difficulty_index_getter_name = "completed_journey_difficulty_index",
		game_mode_type = "deus_twitch",
		layout_name = "deus_selection_journey_layout_twitch",
		mechanism_name = "deus",
	},
	mechanism_quickplay = {
		game_mode_type = "deus_quickplay",
		layout_name = "deus_selection_journey_layout_quickplay",
		mechanism_name = "deus",
	},
}
settings.breed_textures = {
	chaos_greed_pinata = "unit_frame_portrait_enemy_sphere",
}
settings.chest_upgrade_score_topics = {
	deus = {
		{
			display_name = "end_screen_chest_view_mission_completed",
			name = "game_won",
			texture = "loot_mutator_icon_06",
		},
		{
			display_name = "end_screen_chest_view_quickplay_bonus",
			name = "quickplay",
			texture = "loot_mutator_icon_03",
		},
		{
			display_name = "end_screen_chest_view_cursed_chests_purified",
			name = "cursed_chests_purified",
			texture = "morris_loot_objective_icon_01",
		},
		{
			display_name = "end_screen_chest_view_cursed_levels_completed",
			name = "cursed_levels_completed",
			texture = "morris_loot_objective_icon_02",
		},
		{
			display_name = "end_screen_chest_view_coin_chests_collected",
			name = "coin_chests_collected",
			texture = "morris_loot_objective_icon_03",
		},
		{
			display_name = "end_screen_chest_view_random_bonus",
			name = "max_random_score",
			texture = "loot_mutator_icon_04",
		},
	},
}
settings.controller_settings = {
	IngameMenuKeymaps = {
		win32 = {
			hotkey_deus_inventory = {
				"keyboard",
				"i",
				"held",
			},
		},
		xb1 = {
			hotkey_deus_inventory = {
				"gamepad",
				"d_down",
				"pressed",
			},
		},
		ps4 = {
			hotkey_deus_inventory = {
				"gamepad",
				"down",
				"pressed",
			},
		},
		ps_pad = {
			hotkey_deus_inventory = {
				"ps_pad",
				"down",
				"pressed",
			},
		},
	},
}
settings.portrait_materials = {
	"materials/ui/ui_1080p_morris_single_textures",
}
settings.inventory_consumable_slot_colors = {
	potion_liquid_bravado_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_vampiric_draught_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_moot_milk_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_friendly_murderer_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_killer_in_the_shadows_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_pockets_full_of_bombs_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_hold_my_beer_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_poison_proof_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
}
settings.ui_settings = {
	deus = {
		show_coin_pickup_in_chat = false,
	},
}
settings.start_game_layout_console_generic_inputs = {
	deus_default = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 3,
			},
		},
	},
	deus_default_buy = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "menu_weave_area_no_wom_button",
				input_action = "confirm",
				priority = 2,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 3,
			},
		},
	},
	deus_default_play = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "input_description_play",
				input_action = "refresh",
				priority = 2,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 3,
			},
		},
	},
	deus_select_difficulty = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 3,
			},
			{
				description_text = "input_description_play",
				input_action = "refresh",
				priority = 6,
			},
		},
	},
	deus_select_difficulty_buy = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "menu_weave_area_no_wom_button",
				input_action = "confirm",
				priority = 2,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 3,
			},
		},
	},
	deus_play_available = {
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "input_description_play",
				input_action = "refresh",
				priority = 6,
			},
		},
	},
	default_deus_custom_game = {
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
	},
	default_deus_custom_game_play = {
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
				description_text = "input_description_play",
				input_action = "refresh",
				priority = 3,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 4,
			},
			{
				description_text = "input_description_additional_options",
				input_action = "right_stick_press",
				priority = 5,
			},
			{
				description_text = "map_friend_button_tooltip",
				input_action = "show_gamercard",
				priority = 6,
				content_check_function = function ()
					return not IS_WINDOWS and not Managers.account:offline_mode()
				end,
			},
		},
	},
	default_deus_custom_game_buy = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "menu_weave_area_no_wom_button",
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
	},
	default_deus_custom_game_offline = {
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
				description_text = "input_description_close",
				input_action = "back",
				priority = 3,
			},
		},
	},
	default_deus_custom_game_offline_buy = {
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "menu_weave_area_no_wom_button",
				input_action = "confirm",
				priority = 2,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 3,
			},
		},
	},
	default_deus_custom_game_offline_play = {
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
				description_text = "input_description_play",
				input_action = "refresh",
				priority = 3,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 4,
			},
		},
	},
	deus_default_twitch = {
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
	deus_twitch_buy_connected = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "menu_weave_area_no_wom_button",
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
	deus_twitch_buy = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "menu_weave_area_no_wom_button",
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
	deus_default_twitch_connected = {
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
	deus_default_twitch_client = {
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
	deus_default_twitch_client_connected = {
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
}
