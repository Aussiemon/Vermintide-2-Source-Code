DLCSettings = DLCSettings or {
	store = {
		package_name = "resource_packages/dlcs/store",
		additional_settings = {
			common = "scripts/settings/dlcs/store/store_common_settings",
			ui = "scripts/settings/dlcs/store/store_ui_settings",
			equipment = "scripts/settings/dlcs/store/store_equipment_settings"
		}
	},
	bogenhafen = {
		package_name = "resource_packages/dlcs/bogenhafen",
		additional_settings = {
			common = "scripts/settings/dlcs/bogenhafen/bogenhafen_common_settings",
			sound = "scripts/settings/dlcs/bogenhafen/bogenhafen_sound_settings",
			level = "scripts/settings/dlcs/bogenhafen/bogenhafen_level_settings"
		}
	},
	holly = {
		package_name = "resource_packages/dlcs/holly",
		additional_settings = {
			common = "scripts/settings/dlcs/holly/holly_common_settings",
			achievements = "scripts/settings/dlcs/holly/holly_achievements_settings",
			sound = "scripts/settings/dlcs/holly/holly_sound_settings",
			level = "scripts/settings/dlcs/holly/holly_level_settings"
		}
	},
	celebrate = {
		package_name = "resource_packages/dlcs/celebrate",
		additional_settings = {
			equipment = "scripts/settings/dlcs/celebrate/celebrate_equipment_settings",
			common = "scripts/settings/dlcs/celebrate/celebrate_common_settings",
			pickups = "scripts/settings/dlcs/celebrate/celebrate_pickups_settings",
			buff = "scripts/settings/dlcs/celebrate/celebrate_buff_settings",
			sound = "scripts/settings/dlcs/celebrate/celebrate_sound_settings",
			level = "scripts/settings/dlcs/celebrate/celebrate_level_settings"
		}
	},
	penny_part_1 = {
		package_name = "resource_packages/dlcs/penny_part_1",
		additional_settings = {
			common = "scripts/settings/dlcs/penny/penny_common_settings_part_1",
			achievements = "scripts/settings/dlcs/penny/penny_achievements_settings_part_1",
			sound = "scripts/settings/dlcs/penny/penny_sound_settings_part_1",
			level = "scripts/settings/dlcs/penny/penny_level_settings_part_1"
		}
	},
	steak = {
		package_name = "resource_packages/dlcs/steak",
		additional_settings = {
			common = "scripts/settings/dlcs/steak/steak_common_settings",
			ai = "scripts/settings/dlcs/steak/steak_ai_settings",
			unit_variation = "scripts/settings/dlcs/steak/steak_unit_variation_settings",
			pickups = "scripts/settings/dlcs/steak/steak_pickups_settings",
			sound = "scripts/settings/dlcs/steak/steak_sound_settings",
			achievements = "scripts/settings/dlcs/steak/steak_achievements_settings",
			level = "scripts/settings/dlcs/steak/steak_level_settings"
		}
	},
	scorpion = {
		package_name = "resource_packages/dlcs/scorpion",
		level_settings = "levels/honduras_dlcs/scorpion/level_settings_scorpion",
		manager_settings = {},
		start_game_windows = {
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
			"scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_panel_console_definitions"
		},
		additional_settings = {
			common = "scripts/settings/dlcs/scorpion/scorpion_common_settings",
			conflict = "scripts/settings/dlcs/scorpion/scorpion_conflict_settings",
			equipment = "scripts/settings/dlcs/scorpion/scorpion_equipment_settings",
			pickups = "scripts/settings/dlcs/scorpion/scorpion_pickup_settings",
			sound = "scripts/settings/dlcs/scorpion/scorpion_sound_settings",
			achievements = "scripts/settings/dlcs/scorpion/scorpion_achievements_settings",
			ui = "scripts/settings/dlcs/scorpion/scorpion_ui_settings",
			backend = "scripts/settings/dlcs/scorpion/scorpion_backend_settings"
		},
		start_game_window_layout = {
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
					background_icon_name = "button_image_09",
					save_data_table = "weave",
					display_name = "start_game_window_ranked_weave_title",
					game_mode_option = false,
					name = "weave",
					weave_game_mode_option = true,
					close_on_exit = true,
					icon_name = "options_button_icon_event",
					windows = {
						weave_info = 4,
						weave_background = 1,
						weave_list = 3,
						weave_panel = 2
					}
				},
				{
					background_icon_name = "button_image_09",
					save_data_table = "weave",
					display_name = "start_game_window_weave_quickplay_title",
					game_mode_option = false,
					name = "weave_quickplay",
					weave_game_mode_option = true,
					close_on_exit = true,
					icon_name = "options_button_icon_event",
					windows = {
						weave_quickplay = 3,
						weave_background = 1,
						weave_panel = 2
					}
				}
			}
		},
		start_game_window_layout_console = {
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
				}
			},
			window_layouts = {
				{
					sound_event_enter = "play_gui_lobby_button_00_lobby_browser",
					name = "lobby_browser_weave",
					display_name = "start_game_window_lobby_browser",
					can_add_function_name = "_can_add_weave_lobby_browser_option",
					save_data_table = "lobby_browser",
					close_on_exit = true,
					weave_game_mode_option = true,
					windows = {
						lobby_browser = 3,
						weave_background = 2,
						weave_panel = 1
					}
				},
				{
					sound_event_enter = "play_gui_lobby_button_00_quickplay",
					save_data_table = "weave",
					display_name = "start_game_window_ranked_weave_title",
					game_mode_option = true,
					disable_function_name = "_weave_disable_function",
					weave_game_mode_option = true,
					name = "weave_ranked",
					can_add_function_name = "_can_add_weave_game_mode_option",
					close_on_exit = true,
					windows = {
						weave_info = 4,
						weave_background = 2,
						weave_list = 3,
						weave_panel = 1
					}
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
					sound_event_enter = "play_gui_lobby_button_00_quickplay",
					save_data_table = "weave",
					display_name = "start_game_window_weave_quickplay_title",
					game_mode_option = true,
					disable_function_name = "_weave_disable_function",
					weave_game_mode_option = true,
					name = "weave_quickplay",
					can_add_function_name = "_can_add_weave_game_mode_option",
					close_on_exit = true,
					windows = {
						weave_quickplay = 3,
						weave_background = 2,
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
	},
	gecko = {
		package_name = "resource_packages/dlcs/gecko",
		additional_settings = {
			common = "scripts/settings/dlcs/gecko/gecko_common_settings",
			achievements = "scripts/settings/dlcs/gecko/gecko_achievements_settings",
			equipment = "scripts/settings/dlcs/gecko/gecko_equipment_settings",
			ui = "scripts/settings/dlcs/gecko/gecko_ui_settings"
		}
	},
	paperweight = {
		package_name = "resource_packages/dlcs/paperweight",
		additional_settings = {
			equipment = "scripts/settings/dlcs/paperweight/paperweight_equipment_settings",
			achievements = "scripts/settings/dlcs/paperweight/paperweight_achievements_settings"
		}
	},
	anvil = {
		package_name = "resource_packages/dlcs/anvil",
		additional_settings = {
			equipment = "scripts/settings/dlcs/anvil/anvil_equipment_settings",
			common = "scripts/settings/dlcs/anvil/anvil_common_settings",
			pickups = "scripts/settings/dlcs/anvil/anvil_pickup_settings"
		}
	},
	belladonna = {
		ingame_package_name = "resource_packages/dlcs/belladonna_ingame",
		package_name = "resource_packages/dlcs/belladonna",
		additional_settings = {
			common = "scripts/settings/dlcs/belladonna/belladonna_common_settings",
			ai = "scripts/settings/dlcs/belladonna/belladonna_ai_settings",
			unit_variation = "scripts/settings/dlcs/belladonna/belladonna_unit_variation_settings",
			buff = "scripts/settings/dlcs/belladonna/belladonna_buff_settings",
			gibs = "scripts/settings/dlcs/belladonna/belladonna_gib_settings",
			achievements = "scripts/settings/dlcs/belladonna/belladonna_achievements_settings",
			equipment = "scripts/settings/dlcs/belladonna/belladonna_equipment_settings",
			sound = "scripts/settings/dlcs/belladonna/belladonna_sound_settings"
		}
	},
	mutators_batch_01 = {
		package_name = "resource_packages/dlcs/mutators_batch_01",
		additional_settings = {
			common = "scripts/settings/dlcs/mutators_batch_01/mutators_batch_01_common_settings",
			equipment = "scripts/settings/dlcs/mutators_batch_01/mutators_batch_01_equipment_settings",
			buff = "scripts/settings/dlcs/mutators_batch_01/mutators_batch_01_buff_settings"
		}
	},
	mutators_batch_02 = {
		package_name = "resource_packages/dlcs/mutators_batch_02",
		additional_settings = {
			equipment = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_equipment_settings",
			ai = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_ai_settings",
			common = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_common_settings",
			buff = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_buff_settings",
			pickups = "scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_pickups_settings"
		}
	}
}

return
