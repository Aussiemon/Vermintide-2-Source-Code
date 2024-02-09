-- chunkname: @scripts/settings/dlcs/carousel/carousel_ui_settings.lua

local settings = DLCSettings.carousel
local UNASSIGNED_KEY = UNASSIGNED_KEY or "unassigned_keymap"

settings.ui_views = {
	{
		file = "scripts/ui/views/versus_menu/base_view",
	},
	{
		class_name = "VersusPartyCharSelectionView",
		file = "scripts/ui/views/versus_menu/versus_party_char_selection_view",
		name = "versus_party_char_selection_view",
		only_in_game = true,
		only_in_inn = false,
		mechanism_filter = {
			versus = true,
		},
		transitions = {
			versus_party_char_selection_view = function (self)
				self.current_view = "versus_party_char_selection_view"
			end,
			versus_party_char_view_from_character_selection = function (self)
				self.current_view = "versus_party_char_selection_view"
				self.views[self.current_view].new_character = true
			end,
		},
	},
	{
		class_name = "VersusTeamParadingViewV2",
		file = "scripts/ui/views/versus_menu/versus_team_parading_view_v2",
		name = "versus_team_parading_view",
		only_in_game = true,
		only_in_inn = false,
		mechanism_filter = {
			versus = true,
		},
		transitions = {
			versus_team_parading_view = function (self)
				self.current_view = "versus_team_parading_view"
			end,
		},
	},
}
settings.ui_world_marker_templates = {
	"scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_hero_status",
	"scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_objective",
	"scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_climbing",
	"scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_crawl_tunneling",
	"scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_crawl_spawning",
	"scripts/ui/hud_ui/world_marker_templates/world_marker_template_versus_pactsworn_ghostmode",
}
settings.ui_end_screens = {
	carousel_round_end = {
		class_name = "VersusRoundEndScreenUI",
		file_name = "scripts/ui/views/end_screens/versus_round_end_screen_ui",
	},
	carousel_draw = {
		class_name = "VersusDrawEndScreenUI",
		file_name = "scripts/ui/views/end_screens/versus_draw_end_screen_ui",
	},
}
settings.ui_materials = {
	"materials/ui/ui_1080p_carousel_atlas",
}
settings.ui_texture_settings = {
	filenames = {
		"scripts/ui/atlas_settings/gui_carousel_atlas",
	},
	atlas_settings = {
		carousel_atlas = {
			masked_material_name = "gui_carousel_atlas_masked",
			masked_offscreen_material_name = "gui_carousel_atlas_masked_offscreen",
			masked_point_sample_material_name = "gui_carousel_atlas_point_sample_masked",
			masked_point_sample_offscreen_material_name = "gui_carousel_atlas_point_sample_masked_offscreen",
			masked_saturated_material_name = "gui_carousel_atlas_masked_saturated",
			material_name = "gui_carousel_atlas",
			offscreen_material_name = "gui_carousel_atlas_offscreen",
			point_sample_material_name = "gui_carousel_atlas_point_sample",
			point_sample_offscreen_material_name = "gui_carousel_atlas_point_sample_offscreen",
			saturated_material_name = "gui_carousel_atlas_saturated",
			saturated_offscreen_material_name = "gui_carousel_atlas_saturated",
		},
	},
	single_textures = {
		"unit_frame_portrait_vs_corruptor",
		"unit_frame_portrait_vs_corruptor_twitch",
		"unit_frame_portrait_vs_corruptor_masked",
		"unit_frame_portrait_vs_corruptor_twitch_icon",
		"unit_frame_portrait_vs_corruptor_saturated",
		"unit_frame_portrait_vs_packmaster",
		"unit_frame_portrait_vs_packmaster_twitch",
		"unit_frame_portrait_vs_packmaster_masked",
		"unit_frame_portrait_vs_packmaster_twitch_icon",
		"unit_frame_portrait_vs_packmaster_saturated",
		"unit_frame_portrait_vs_gutter_runner",
		"unit_frame_portrait_vs_gutter_runner_twitch",
		"unit_frame_portrait_vs_gutter_runner_masked",
		"unit_frame_portrait_vs_gutter_runner_twitch_icon",
		"unit_frame_portrait_vs_gutter_runner_saturated",
		"unit_frame_portrait_vs_poison_wind_globadier",
		"unit_frame_portrait_vs_poison_wind_globadier_twitch",
		"unit_frame_portrait_vs_poison_wind_globadier_masked",
		"unit_frame_portrait_vs_poison_wind_globadier_twitch_icon",
		"unit_frame_portrait_vs_poison_wind_globadier_saturated",
		"unit_frame_portrait_vs_warpfire_thrower",
		"unit_frame_portrait_vs_warpfire_thrower_twitch",
		"unit_frame_portrait_vs_warpfire_thrower_masked",
		"unit_frame_portrait_vs_warpfire_thrower_twitch_icon",
		"unit_frame_portrait_vs_warpfire_thrower_saturated",
		"unit_frame_portrait_vs_vortex_sorcerer",
		"unit_frame_portrait_vs_vortex_sorcerer_twitch",
		"unit_frame_portrait_vs_vortex_sorcerer_masked",
		"unit_frame_portrait_vs_vortex_sorcerer_twitch_icon",
		"unit_frame_portrait_vs_vortex_sorcerer_saturated",
		"unit_frame_portrait_vs_ratling_gunner",
		"unit_frame_portrait_vs_ratling_gunner_twitch",
		"unit_frame_portrait_vs_ratling_gunner_masked",
		"unit_frame_portrait_vs_ratling_gunner_twitch_icon",
		"unit_frame_portrait_vs_ratling_gunner_saturated",
		"unit_frame_portrait_vs_chaos_spawn",
		"unit_frame_portrait_vs_chaos_spawn_twitch",
		"unit_frame_portrait_vs_chaos_spawn_masked",
		"unit_frame_portrait_vs_chaos_spawn_twitch_icon",
		"unit_frame_portrait_vs_chaos_spawn_saturated",
		"unit_frame_portrait_vs_stormfiend",
		"unit_frame_portrait_vs_stormfiend_twitch",
		"unit_frame_portrait_vs_stormfiend_masked",
		"unit_frame_portrait_vs_stormfiend_twitch_icon",
		"unit_frame_portrait_vs_stormfiend_saturated",
		"unit_frame_portrait_vs_rat_ogre",
		"unit_frame_portrait_vs_rat_ogre_twitch",
		"unit_frame_portrait_vs_rat_ogre_masked",
		"unit_frame_portrait_vs_rat_ogre_twitch_icon",
		"unit_frame_portrait_vs_rat_ogre_saturated",
		"vs_info_ghost_spawn",
		"vs_info_ghost_cantspawn",
		"vs_info_ghost_catchup",
	},
}
settings.start_game_windows = {
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_panel",
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_background",
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_quickplay",
}
settings.start_game_layout_console_generic_inputs = {
	versus_default = {
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
	versus_default_play = {
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
	versus_quickplay_default = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "input_description_additional_options",
				input_action = "right_stick_press",
				priority = 2,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 3,
			},
		},
	},
	versus_quickplay_play = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "d_pad",
				priority = 1,
			},
			{
				description_text = "input_description_additional_options",
				input_action = "right_stick_press",
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
}
settings.start_game_save_data_table_map = {
	versus = {
		custom = "versus_custom",
		quickplay = "versus_quickplay",
	},
}

local versus_save_data_table_map = settings.start_game_save_data_table_map.versus

settings.start_game_save_data_table_map_console = table.clone(settings.start_game_save_data_table_map)

local versus_save_data_table_map_console = settings.start_game_save_data_table_map_console.versus

settings.start_game_window_layout_console = {
	windows = {
		versus_panel = {
			class_name = "StartGameWindowVersusPanel",
			ignore_alignment = true,
			name = "versus_panel",
		},
		versus_background = {
			class_name = "StartGameWindowVersusBackground",
			ignore_alignment = true,
			name = "versus_background",
		},
		versus_quickplay = {
			class_name = "StartGameWindowVersusQuickplay",
			ignore_alignment = true,
			name = "versus_quickplay",
		},
	},
	window_layouts = {
		{
			background_flow_event = "quick_play_chaos_wastes",
			background_object_set = "quick_play_chaos_wastes",
			close_on_exit = true,
			disable_function_name = "_versus_quickplay_disable_function",
			display_name = "start_game_window_adventure_title",
			game_mode_option = true,
			input_focus_window = "versus_quickplay",
			name = "versus_quickplay",
			panel_sorting = 10,
			sound_event_enter = "hud_morris_start_menu_category",
			windows = {
				versus_background = 2,
				versus_panel = 1,
				versus_quickplay = 3,
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("versus")
			end,
			save_data_table = versus_save_data_table_map_console.quickplay,
		},
	},
	mechanism_quickplay_settings = {
		game_mode_type = "versus_quickplay",
		layout_name = "area_selection",
		mechanism_name = "versus",
	},
	mechanism_custom_game = {
		difficulty_index_getter_name = "completed_level_difficulty_index",
		game_mode_type = "versus_custom",
		layout_name = "area_selection",
		mechanism_name = "versus",
	},
}
settings.controller_settings = {
	PlayerControllerKeymaps = {
		win32 = {
			ping_only_enemy = {
				"keyboard",
				UNASSIGNED_KEY,
				"pressed",
			},
			ping_only_movement = {
				"keyboard",
				UNASSIGNED_KEY,
				"pressed",
			},
			ping_only_item = {
				"keyboard",
				UNASSIGNED_KEY,
				"pressed",
			},
		},
	},
}
settings.hud_component_list_path = "scripts/ui/hud_ui/component_list_definitions/hud_component_list_versus"
settings.teams_ui_assets = {
	undecided = {
		background_frame = "team_icon_bg_frame",
		background_texture = "team_icon_bg",
		display_name = "versus_team_name_undecided",
		icon = "icons_placeholder",
		team_icon = "icons_placeholder",
	},
	team_hammers = {
		background_frame = "team_icon_bg_frame",
		background_texture = "team_icon_bg",
		display_name = "versus_team_name_hammers",
		icon = "team_one_banner",
		team_icon = "team_hammers_icon",
	},
	team_skulls = {
		background_frame = "team_icon_bg_frame",
		background_texture = "team_icon_bg",
		display_name = "versus_team_name_skulls",
		icon = "team_two_banner",
		team_icon = "team_skulls_icon",
	},
}
settings.ui_settings = {
	teams_ui_assets = settings.teams_ui_assets,
}
settings.sides_localization_lookup = {
	dark_pact = "vs_lobby_dark_pact_team_name",
	heroes = "vs_lobby_hero_team_name",
	spectator = "not_assigned",
	undecided = "vs_undecided",
}
