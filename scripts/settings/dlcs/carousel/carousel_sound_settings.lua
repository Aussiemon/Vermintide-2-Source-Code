-- chunkname: @scripts/settings/dlcs/carousel/carousel_sound_settings.lua

local settings = DLCSettings.carousel

settings.dialogue_lookup = {
	"dialogues/generated/lookup_vs_player_vo_pactsworn",
	"dialogues/generated/lookup_vs_player_vo_heroes",
	"dialogues/generated/lookup_vs_mission_giver_pactsworn",
	"dialogues/generated/lookup_vs_mission_giver_heroes",
	"dialogues/generated/lookup_hub_conversations_carousel",
	"dialogues/generated/lookup_vs_level_bell_pvp",
	"dialogues/generated/lookup_vs_level_military_pvp",
	"dialogues/generated/lookup_vs_level_farmlands_pvp",
	"dialogues/generated/lookup_vs_level_fort_pvp",
	"dialogues/generated/lookup_vs_level_forest_ambush_pvp",
	"dialogues/generated/lookup_vs_level_dwarf_exterior_pvp",
}
settings.auto_load_files_mechanism = {
	versus = {
		"dialogues/generated/vs_player_vo_pactsworn",
		"dialogues/generated/vs_player_vo_heroes",
		"dialogues/generated/vs_mission_giver_pactsworn",
		"dialogues/generated/vs_mission_giver_heroes",
	},
}
settings.dialogue_settings = {
	carousel_hub = {
		"dialogues/generated/hub_conversations_carousel",
	},
	bell_pvp = {
		"dialogues/generated/vs_level_bell_pvp",
	},
	military_pvp = {
		"dialogues/generated/vs_level_military_pvp",
	},
	farmlands_pvp = {
		"dialogues/generated/vs_level_farmlands_pvp",
		"dialogues/generated/wood_elf_farmland",
		"dialogues/generated/empire_soldier_farmland",
		"dialogues/generated/bright_wizard_farmland",
		"dialogues/generated/dwarf_ranger_farmland",
		"dialogues/generated/witch_hunter_farmland",
	},
	fort_pvp = {
		"dialogues/generated/vs_level_fort_pvp",
	},
	forest_ambush_pvp = {
		"dialogues/generated/vs_level_forest_ambush_pvp",
	},
	dwarf_exterior_pvp = {
		"dialogues/generated/vs_level_dwarf_exterior_pvp",
	},
}
settings.network_sound_events = {
	"menu_wind_countdown_warning",
	"Play_hud_versus_objective_start",
	"Play_versus_hud_round_end_heroes_fail",
	"Play_versus_hud_round_end_heroes_win",
	"Play_hud_versus_score_0_final_tick",
	"Play_hud_versus_score_1_ticks_to_win",
	"Play_hud_versus_score_2_ticks_to_win",
	"Play_hud_versus_score_3_ticks_to_win",
	"Play_hud_versus_score_4_ticks_to_win",
	"Play_hud_versus_score_5_ticks_to_win",
	"versus_hud_player_lobby_match_found",
	"Play_vs_rat_ogre_jump_charge_vce_3p",
	"Stop_vs_rat_ogre_jump_charge_vce_3p",
}
settings.blocked_auto_load_files = {
	carousel_hub = true,
}
settings.versus_character_selection_clock_tick = {
	"Play_menu_versus_character_selection_clock_tick_10",
	"Play_menu_versus_character_selection_clock_tick_09",
	"Play_menu_versus_character_selection_clock_tick_08",
	"Play_menu_versus_character_selection_clock_tick_07",
	"Play_menu_versus_character_selection_clock_tick_06",
	"Play_menu_versus_character_selection_clock_tick_05",
	"Play_menu_versus_character_selection_clock_tick_04",
	"Play_menu_versus_character_selection_clock_tick_03",
	"Play_menu_versus_character_selection_clock_tick_02",
	"Play_menu_versus_character_selection_clock_tick_01",
}
settings.versus_round_start_safe_zone_countdown_tick = {
	"Play_versus_round_start_safe_zone_countdown_tick_11",
	"Play_versus_round_start_safe_zone_countdown_tick_10",
	"Play_versus_round_start_safe_zone_countdown_tick_09",
	"Play_versus_round_start_safe_zone_countdown_tick_08",
	"Play_versus_round_start_safe_zone_countdown_tick_07",
	"Play_versus_round_start_safe_zone_countdown_tick_06",
	"Play_versus_round_start_safe_zone_countdown_tick_05",
	"Play_versus_round_start_safe_zone_countdown_tick_04",
	"Play_versus_round_start_safe_zone_countdown_tick_03",
	"Play_versus_round_start_safe_zone_countdown_tick_02",
	"Play_versus_round_start_safe_zone_countdown_tick_01",
}
settings.versus_close_to_win_score_ticks = {
	"Play_hud_versus_score_0_final_tick",
	"Play_hud_versus_score_1_ticks_to_win",
	"Play_hud_versus_score_2_ticks_to_win",
	"Play_hud_versus_score_3_ticks_to_win",
	"Play_hud_versus_score_4_ticks_to_win",
	"Play_hud_versus_score_5_ticks_to_win",
}
settings.music_overrides = {
	carousel_hub = "Play_loading_screen_music_versus_small",
	versus_between_rounds = "Play_loading_screen_music_versus_small",
}
