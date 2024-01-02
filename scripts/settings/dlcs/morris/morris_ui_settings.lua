require("scripts/utils/colors")

local settings = DLCSettings.morris
settings.ui_views = {
	{
		name = "deus_cursed_chest",
		class_name = "DeusCursedChestView",
		file = "scripts/ui/views/deus_menu/deus_cursed_chest_view",
		only_in_game = true,
		only_in_inn = false,
		mechanism_filter = {
			deus = true
		},
		transitions = {
			deus_cursed_chest = function (self)
				self.current_view = "deus_cursed_chest"
			end
		}
	},
	{
		name = "deus_debug_changelog_view",
		class_name = "DeusDebugChangelogView",
		file = "scripts/ui/views/deus_menu/deus_debug_changelog_view",
		only_in_game = false,
		only_in_inn = false,
		mechanism_filter = {
			deus = true
		},
		transitions = {
			deus_debug_changelog_view = function (self)
				self.current_view = "deus_debug_changelog_view"
			end
		}
	}
}
settings.ingame_hud_components = {
	{
		use_hud_scale = true,
		class_name = "EnergyBarUI",
		filename = "scripts/ui/hud_ui/energy_bar_ui",
		visibility_groups = {
			"alive"
		}
	}
}
settings.ui_end_screens = {
	deus_victory = {
		file_name = "scripts/ui/views/end_screens/deus_victory_end_screen_ui",
		class_name = "DeusVictoryEndScreenUI"
	}
}
settings.ui_materials = {
	"materials/ui/ui_1080p_morris_single_textures"
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
	"scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_journey_selection"
}
settings.start_game_save_data_table_map = {
	deus = {
		difficulty_selection_custom = "deus_custom",
		custom = "deus_custom",
		adventure = "deus_quickplay",
		difficulty_selection_twitch = "deus_twitch",
		twitch = "deus_twitch",
		difficulty_selection_adventure = "deus_quickplay"
	}
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
			name = "deus_background"
		},
		deus_panel = {
			class_name = "StartGameWindowDeusPanel",
			name = "deus_panel"
		},
		deus_quickplay = {
			class_name = "StartGameWindowDeusQuickplay",
			name = "deus_quickplay"
		},
		deus_custom_game = {
			class_name = "StartGameWindowDeusCustomGame",
			name = "deus_custom_game"
		},
		deus_twitch = {
			class_name = "StartGameWindowDeusTwitch",
			name = "deus_twitch"
		},
		deus_lobby_browser = {
			class_name = "StartGameWindowDeusLobbyBrowser",
			name = "deus_lobby_browser"
		},
		deus_selection_journey = {
			class_name = "StartGameWindowDeusJourneySelection",
			name = "deus_selection_journey"
		},
		deus_additional_settings = {
			parent_window_name = "deus_custom_game",
			name = "deus_additional_settings",
			class_name = "StartGameWindowDeusAdditionalSettings",
			ignore_alignment = true
		},
		deus_chaos_god_information = {
			ignore_alignment = true,
			name = "deus_chaos_god_information",
			class_name = "StartGameWindowDeusChaosGodInformation"
		}
	},
	window_layouts = {
		{
			sound_event_enter = "hud_morris_start_menu_category",
			display_name = "start_game_window_adventure_title",
			game_mode_option = true,
			name = "deus_quickplay",
			disable_function_name = "_deus_quickplay_disable_function",
			panel_sorting = 10,
			background_object_set = "quick_play_chaos_wastes",
			input_focus_window = "deus_quickplay",
			close_on_exit = true,
			background_flow_event = "quick_play_chaos_wastes",
			windows = {
				deus_background = 2,
				deus_panel = 1,
				deus_quickplay = 3
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("deus")
			end,
			save_data_table = deus_save_data_table_map_console.custom
		},
		{
			sound_event_enter = "hud_morris_start_menu_category",
			display_name = "start_game_window_specific_title",
			game_mode_option = true,
			name = "deus_custom_game",
			disable_function_name = "_deus_custom_disable_function",
			panel_sorting = 20,
			background_object_set = "custom_game_chaos_wastes",
			input_focus_window = "deus_custom_game",
			close_on_exit = true,
			background_flow_event = "custom_game_chaos_wastes",
			windows = {
				deus_chaos_god_information = 5,
				deus_panel = 1,
				deus_additional_settings = 4,
				deus_custom_game = 3,
				deus_background = 2
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("deus")
			end,
			save_data_table = deus_save_data_table_map_console.custom
		},
		{
			sound_event_enter = "hud_morris_start_menu_category",
			display_name = "start_game_window_twitch",
			game_mode_option = true,
			name = "deus_twitch",
			panel_sorting = 30,
			background_object_set = "twitch_chaos_wastes",
			input_focus_window = "deus_twitch",
			close_on_exit = true,
			background_flow_event = "twitch_chaos_wastes",
			windows = {
				deus_chaos_god_information = 5,
				deus_panel = 1,
				deus_twitch = 3,
				deus_background = 2
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("deus") and overview:can_use_streaming()
			end,
			should_draw_god_info = function (ingame_ui_context)
				return ingame_ui_context.is_server
			end,
			save_data_table = deus_save_data_table_map_console.twitch
		},
		{
			sound_event_enter = "hud_morris_start_menu_category",
			display_name = "start_game_window_lobby_browser",
			name = "deus_lobby_browser",
			panel_sorting = 100,
			background_object_set = "lobby_browser_chaos_wastes",
			close_on_exit = true,
			background_flow_event = "lobby_browser_chaos_wastes",
			windows = {
				deus_background = 2,
				deus_panel = 1,
				deus_lobby_browser = 3
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("deus") and not IS_XB1
			end,
			save_data_table = deus_save_data_table_map_console.lobby_browser
		},
		{
			sound_event_enter = "hud_morris_start_menu_category",
			name = "deus_selection_journey_layout",
			input_focus_window = "deus_selection_journey",
			windows = {
				deus_selection_journey = 3,
				panel = 1,
				background = 2
			},
			save_data_table = deus_save_data_table_map_console.custom
		},
		{
			sound_event_enter = "hud_morris_start_menu_category",
			name = "deus_selection_journey_layout_twitch",
			input_focus_window = "deus_selection_journey",
			windows = {
				deus_selection_journey = 3,
				panel = 1,
				background = 2
			},
			save_data_table = deus_save_data_table_map_console.twitch
		}
	},
	mechanism_custom_game = {
		mechanism_name = "deus",
		game_mode_type = "deus_custom",
		difficulty_index_getter_name = "completed_journey_difficulty_index",
		layout_name = "deus_selection_journey_layout"
	},
	mechanism_twitch = {
		mechanism_name = "deus",
		game_mode_type = "deus_twitch",
		difficulty_index_getter_name = "completed_journey_difficulty_index",
		layout_name = "deus_selection_journey_layout_twitch"
	},
	mechanism_quickplay = {
		mechanism_name = "deus",
		game_mode_type = "deus_quickplay",
		layout_name = "deus_selection_journey_layout_quickplay"
	}
}
settings.breed_textures = {
	chaos_greed_pinata = "unit_frame_portrait_enemy_sphere"
}
settings.chest_upgrade_score_topics = {
	deus = {
		{
			texture = "loot_mutator_icon_06",
			name = "game_won",
			display_name = "end_screen_chest_view_mission_completed"
		},
		{
			texture = "loot_mutator_icon_03",
			name = "quickplay",
			display_name = "end_screen_chest_view_quickplay_bonus"
		},
		{
			texture = "morris_loot_objective_icon_01",
			name = "cursed_chests_purified",
			display_name = "end_screen_chest_view_cursed_chests_purified"
		},
		{
			texture = "morris_loot_objective_icon_02",
			name = "cursed_levels_completed",
			display_name = "end_screen_chest_view_cursed_levels_completed"
		},
		{
			texture = "morris_loot_objective_icon_03",
			name = "coin_chests_collected",
			display_name = "end_screen_chest_view_coin_chests_collected"
		},
		{
			texture = "loot_mutator_icon_04",
			name = "max_random_score",
			display_name = "end_screen_chest_view_random_bonus"
		}
	}
}
settings.controller_settings = {
	IngameMenuKeymaps = {
		win32 = {
			hotkey_deus_inventory = {
				"keyboard",
				"i",
				"held"
			}
		},
		xb1 = {
			hotkey_deus_inventory = {
				"gamepad",
				"d_down",
				"pressed"
			}
		},
		ps4 = {
			hotkey_deus_inventory = {
				"gamepad",
				"down",
				"pressed"
			}
		},
		ps_pad = {
			hotkey_deus_inventory = {
				"ps_pad",
				"down",
				"pressed"
			}
		}
	}
}
settings.portrait_materials = {
	"materials/ui/ui_1080p_morris_single_textures"
}
settings.inventory_consumable_slot_colors = {
	potion_liquid_bravado_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_vampiric_draught_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_moot_milk_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_friendly_murderer_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_killer_in_the_shadows_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_pockets_full_of_bombs_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_hold_my_beer_01 = Colors.get_color_table_with_alpha("deus_potion", 255),
	potion_poison_proof_01 = Colors.get_color_table_with_alpha("deus_potion", 255)
}
settings.ui_settings = {
	deus = {
		show_coin_pickup_in_chat = false
	}
}
settings.start_game_layout_console_generic_inputs = {
	deus_default = {
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
	deus_default_buy = {
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
				description_text = "menu_weave_area_no_wom_button"
			},
			{
				input_action = "back",
				priority = 3,
				description_text = "input_description_close"
			}
		}
	},
	deus_default_play = {
		ignore_generic_actions = true,
		actions = {
			{
				input_action = "d_pad",
				priority = 1,
				description_text = "input_description_navigate",
				ignore_keybinding = true
			},
			{
				input_action = "refresh",
				priority = 2,
				description_text = "input_description_play"
			},
			{
				input_action = "back",
				priority = 3,
				description_text = "input_description_close"
			}
		}
	},
	deus_select_difficulty = {
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
			},
			{
				input_action = "refresh",
				priority = 6,
				description_text = "input_description_play"
			}
		}
	},
	deus_select_difficulty_buy = {
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
				description_text = "menu_weave_area_no_wom_button"
			},
			{
				input_action = "back",
				priority = 3,
				description_text = "input_description_close"
			}
		}
	},
	deus_play_available = {
		actions = {
			{
				input_action = "d_pad",
				priority = 1,
				description_text = "input_description_navigate",
				ignore_keybinding = true
			},
			{
				input_action = "refresh",
				priority = 6,
				description_text = "input_description_play"
			}
		}
	},
	default_deus_custom_game = {
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
					return not IS_WINDOWS and not Managers.account:offline_mode()
				end
			}
		}
	},
	default_deus_custom_game_play = {
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
				input_action = "refresh",
				priority = 3,
				description_text = "input_description_play"
			},
			{
				input_action = "back",
				priority = 4,
				description_text = "input_description_close"
			},
			{
				input_action = "right_stick_press",
				priority = 5,
				description_text = "input_description_additional_options"
			},
			{
				input_action = "show_gamercard",
				priority = 6,
				description_text = "map_friend_button_tooltip",
				content_check_function = function ()
					return not IS_WINDOWS and not Managers.account:offline_mode()
				end
			}
		}
	},
	default_deus_custom_game_buy = {
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
				description_text = "menu_weave_area_no_wom_button"
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
					return not IS_WINDOWS and not Managers.account:offline_mode()
				end
			}
		}
	},
	default_deus_custom_game_offline = {
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
	default_deus_custom_game_offline_buy = {
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
				description_text = "menu_weave_area_no_wom_button"
			},
			{
				input_action = "back",
				priority = 3,
				description_text = "input_description_close"
			}
		}
	},
	default_deus_custom_game_offline_play = {
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
				input_action = "refresh",
				priority = 3,
				description_text = "input_description_play"
			},
			{
				input_action = "back",
				priority = 4,
				description_text = "input_description_close"
			}
		}
	},
	deus_default_twitch = {
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
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end
		}
	},
	deus_twitch_buy_connected = {
		{
			input_action = "d_pad",
			priority = 1,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
		{
			input_action = "confirm",
			priority = 2,
			description_text = "menu_weave_area_no_wom_button"
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
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end
		}
	},
	deus_twitch_buy = {
		{
			input_action = "d_pad",
			priority = 1,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
		{
			input_action = "confirm",
			priority = 2,
			description_text = "menu_weave_area_no_wom_button"
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
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end
		}
	},
	deus_default_twitch_connected = {
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
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end
		}
	},
	deus_default_twitch_client = {
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
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end
		}
	},
	deus_default_twitch_client_connected = {
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
				return not IS_WINDOWS and not Managers.account:offline_mode()
			end
		}
	}
}
