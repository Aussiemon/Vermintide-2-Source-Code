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
		"unit_frame_portrait_vs_chaos_troll",
		"unit_frame_portrait_vs_chaos_troll_twitch",
		"unit_frame_portrait_vs_chaos_troll_masked",
		"unit_frame_portrait_vs_chaos_troll_twitch_icon",
		"unit_frame_portrait_vs_chaos_troll_saturated",
		"vs_info_ghost_spawn",
		"vs_info_ghost_cantspawn",
		"vs_info_ghost_catchup",
	},
}
settings.start_game_windows = {
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_panel",
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_background",
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_quickplay",
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_custom_game",
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_additional_settings",
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_player_hosted_lobby",
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_mission_selection",
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_host_versus_additional_settings",
	"scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_lobby_browser",
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
				input_action = "d_vertical",
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
	versus_player_hosted_lobby = {
		ignore_generic_actions = true,
		actions = {
			{
				description_text = "input_description_navigate",
				ignore_keybinding = true,
				input_action = "left_stick",
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
				description_text = "input_description_cancel",
				input_action = "cancel_matchmaking",
				priority = 4,
			},
			{
				description_text = "input_description_close",
				input_action = "back",
				priority = 5,
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
		versus_custom_game = {
			class_name = "StartGameWindowVersusCustomGame",
			ignore_alignment = true,
			name = "versus_custom_game",
		},
		versus_additional_quickplay_settings = {
			class_name = "StartGameWindowVersusAdditionalSettings",
			ignore_alignment = true,
			name = "versus_additional_quickplay_settings",
			parent_window_name = "versus_quickplay",
		},
		versus_additional_custom_settings = {
			class_name = "StartGameWindowHostVersusAdditionalSettings",
			ignore_alignment = true,
			name = "versus_additional_custom_settings",
			parent_window_name = "versus_custom_game",
		},
		versus_player_hosted_lobby = {
			class_name = "StartGameWindowVersusPlayerHostedLobby",
			ignore_alignment = true,
			name = "versus_player_hosted_lobby",
		},
		versus_mission_selection = {
			class_name = "StartGameWindowVersusMissionSelection",
			ignore_alignment = true,
			name = "versus_mission_selection",
		},
		versus_lobby_browser = {
			class_name = "StartGameWindowVersusLobbyBrowser",
			ignore_alignment = true,
			name = "versus_lobby_browser",
		},
	},
	window_layouts = {
		{
			background_flow_event = "versus_menu",
			background_object_set = "versus_menu",
			close_on_exit = true,
			disable_function_name = "_versus_quickplay_disable_function",
			display_name = "start_game_window_adventure_title",
			game_mode_option = true,
			input_focus_window = "versus_quickplay",
			name = "versus_quickplay",
			panel_sorting = 10,
			sound_event_enter = "Play_vs_hud_play_menu_category",
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
		{
			background_flow_event = "skaven_cosmetics_view",
			background_object_set = "skaven_cosmetics_view",
			close_on_exit = true,
			disable_function_name = "_versus_custom_disable_function",
			display_name = "start_game_window_other_options_always_host",
			game_mode_option = true,
			input_focus_window = "versus_custom_game",
			name = "versus_custom_game",
			panel_sorting = 20,
			sound_event_enter = "Play_vs_hud_play_menu_category",
			windows = {
				versus_additional_custom_settings = 4,
				versus_background = 2,
				versus_custom_game = 3,
				versus_panel = 1,
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("versus")
			end,
			save_data_table = versus_save_data_table_map_console.custom,
		},
		{
			background_flow_event = "skaven_cosmetics_view",
			background_object_set = "skaven_cosmetics_view",
			close_on_exit = true,
			display_name = "player_hosted_title",
			name = "versus_player_hosted_lobby",
			sound_event_enter = "Play_vs_hud_play_menu_category",
			windows = {
				versus_background = 2,
				versus_panel = 1,
				versus_player_hosted_lobby = 3,
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("versus")
			end,
			save_data_table = versus_save_data_table_map_console.custom,
		},
		{
			close_on_exit = false,
			input_focus_window = "versus_mission_selection",
			name = "versus_mission_selection",
			sound_event_enter = "play_gui_lobby_button_00_custom",
			windows = {
				background = 2,
				panel = 1,
				versus_mission_selection = 3,
			},
			save_data_table = versus_save_data_table_map_console.custom,
		},
		{
			background_flow_event = "",
			background_object_set = "",
			close_on_exit = true,
			display_name = "start_game_window_lobby_browser",
			name = "versus_lobby_browser",
			panel_sorting = 100,
			sound_event_enter = "Play_vs_hud_play_menu_category",
			windows = {
				versus_background = 2,
				versus_lobby_browser = 3,
				versus_panel = 1,
			},
			can_add_function = function (overview)
				return overview:is_in_mechanism("versus") and not IS_XB1
			end,
			save_data_table = versus_save_data_table_map_console.lobby_browser,
		},
	},
	mechanism_quickplay_settings = {
		force_area_name = "versus",
		game_mode_type = "versus_quickplay",
		layout_name = "mission_selection",
		mechanism_name = "versus",
	},
	mechanism_custom_game = {
		difficulty_index_getter_name = "completed_level_difficulty_index",
		force_area_name = "versus",
		game_mode_type = "versus_custom",
		layout_name = "versus_mission_selection",
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
		background_texture = "team_icon_background",
		display_name = "versus_team_name_undecided",
		icon = "icons_placeholder",
		team_icon = "icons_placeholder",
	},
	team_hammers = {
		background_frame = "team_icon_bg_frame",
		background_texture = "team_icon_background",
		display_name = "versus_team_name_hammers",
		icon = "team_one_banner",
		local_flag_long_texture = "banner_hammers_local_long",
		local_flag_texture = "banner_hammers_local",
		opponent_flag_long_texture = "banner_hammers_opponent_long",
		opponent_flag_texture = "banner_hammers_opponent",
		team_icon = "team_icon_hammers",
	},
	team_skulls = {
		background_frame = "team_icon_bg_frame",
		background_texture = "team_icon_background",
		display_name = "versus_team_name_skulls",
		icon = "team_two_banner",
		local_flag_long_texture = "banner_skulls_local_long",
		local_flag_texture = "banner_skulls_local",
		opponent_flag_long_texture = "banner_skulls_opponent_long",
		opponent_flag_texture = "banner_skulls_opponent",
		team_icon = "team_icon_skulls",
	},
}
settings.ui_settings = {
	teams_ui_assets = settings.teams_ui_assets,
}
settings.sides_localization_lookup = {
	dark_pact = "vs_lobby_dark_pact_team_name",
	heroes = "vs_lobby_hero_team_name",
	spectator = "not_assigned",
}
settings.hero_window_mood_settings = {
	default = "default",
	pactsworn = "menu_versus",
}
settings.hero_window_pactsworn_stats_by_name = {
	vs_chaos_troll = {
		{
			"eliminations_as_breed",
			"vs_chaos_troll",
		},
		{
			"damage_dealt_as_breed",
			"vs_chaos_troll",
		},
	},
	vs_gutter_runner = {
		{
			"eliminations_as_breed",
			"vs_gutter_runner",
		},
		{
			"damage_dealt_as_breed",
			"vs_gutter_runner",
		},
	},
	vs_packmaster = {
		{
			"eliminations_as_breed",
			"vs_packmaster",
		},
		{
			"damage_dealt_as_breed",
			"vs_packmaster",
		},
	},
	vs_ratling_gunner = {
		{
			"eliminations_as_breed",
			"vs_ratling_gunner",
		},
		{
			"damage_dealt_as_breed",
			"vs_ratling_gunner",
		},
	},
	vs_warpfire_thrower = {
		{
			"eliminations_as_breed",
			"vs_warpfire_thrower",
		},
		{
			"damage_dealt_as_breed",
			"vs_warpfire_thrower",
		},
	},
	vs_poison_wind_globadier = {
		{
			"eliminations_as_breed",
			"vs_poison_wind_globadier",
		},
		{
			"damage_dealt_as_breed",
			"vs_poison_wind_globadier",
		},
	},
	default = {
		{
			"vs_game_won",
		},
		{
			"vs_hero_monster_kill",
		},
	},
}
settings.stats_string_lookup = {
	damage_dealt_as_breed = "inventory_screen_compare_damage_tooltip",
	eliminations_as_breed = "vs_scoreboard_eliminations",
	vs_game_won = "not_assigned",
	vs_hero_monster_kill = "not_assigned",
}
settings.item_type_store_icons = {
	weapon_pose = "store_tag_icon_pose",
}
settings.stats_icons_lookup = {
	damage_dealt_as_breed = "icon_damage",
	eliminations_as_breed = "killfeed_icon_12",
	vs_game_won = "icons_placeholder",
	vs_hero_monster_kill = "icons_placeholder",
}
