-- chunkname: @scripts/settings/dlcs/divine/dlc_reikwald_river_level_settings.lua

local settings = DLCSettings.divine

settings.level_settings = "levels/honduras_dlcs/divine/level_settings_dlc_reikwald_river"
settings.level_unlock_settings = "levels/honduras_dlcs/divine/level_unlock_settings_divine"
settings.terror_event_blueprints_filename = "scripts/settings/terror_events/terror_events_dlc_reikwald_river"
settings.missions = {
	river_reik_look_for_sword = {
		mission_template_name = "goal",
		text = "mission_river_reik_look_for_sword",
	},
	river_reik_blow_open_entrance = {
		mission_template_name = "goal",
		text = "mission_river_reik_blow_open_entrance",
	},
	river_reik_find_a_way_out_01 = {
		mission_template_name = "goal",
		text = "mission_river_reik_find_a_way_out_01",
	},
	river_reik_find_a_way_out_02 = {
		mission_template_name = "goal",
		text = "mission_river_reik_find_a_way_out_02",
	},
	river_reik_chaos_camp = {
		mission_template_name = "goal",
		text = "mission_river_reik_chaos_camp",
	},
	river_reik_chaos_camp_exit = {
		mission_template_name = "goal",
		text = "river_reik_chaos_camp_exit",
	},
	river_reik_goto_ship = {
		mission_template_name = "goal",
		text = "mission_river_reik_goto_ship",
	},
	river_reik_search_hut = {
		mission_template_name = "goal",
		text = "mission_river_reik_search_hut",
	},
	river_reik_use_ship = {
		mission_template_name = "goal",
		text = "mission_river_reik_use_ship",
	},
	river_reik_sail_on = {
		mission_template_name = "goal",
		text = "mission_river_reik_sail_on",
	},
	river_reik_chaos_battle = {
		collect_amount = 2,
		mission_template_name = "collect",
		text = "mission_river_reik_chaos_battle",
	},
	river_reik_skaven_battle_1 = {
		collect_amount = 2,
		mission_template_name = "collect",
		text = "mission_river_reik_skaven_battle_1",
	},
	river_reik_skaven_battle_2 = {
		collect_amount = 4,
		mission_template_name = "collect",
		text = "mission_river_reik_skaven_battle_2",
	},
	river_reik_skaven_battle_3 = {
		collect_amount = 2,
		mission_template_name = "collect",
		text = "mission_river_reik_skaven_battle_3",
	},
	river_reik_skaven_battle_3_done = {
		mission_template_name = "goal",
		text = "mission_river_reik_skaven_battle_3_done",
	},
	river_reik_find_sword = {
		mission_template_name = "goal",
		text = "mission_river_reik_find_sword",
	},
	river_reik_burn_everything_dawnrunner = {
		collect_amount = 4,
		mission_template_name = "collect",
		text = "mission_river_reik_burn_everything_dawnrunner",
	},
	river_reik_search_thief = {
		mission_template_name = "goal",
		text = "mission_river_reik_search_thief",
	},
	river_reik_head_to_ship = {
		mission_template_name = "goal",
		text = "mission_river_reik_head_to_ship",
	},
	river_reik_signal_ship = {
		mission_template_name = "goal",
		text = "mission_river_reik_signal_ship",
	},
	river_reik_survive_beach = {
		mission_template_name = "goal",
		text = "mission_river_reik_survive_beach",
	},
	river_reik_board_ship = {
		mission_template_name = "goal",
		text = "mission_river_reik_board_ship",
	},
	river_reik_doombringer = {
		collect_amount = 16,
		mission_template_name = "collect",
		text = "mission_river_reik_doombringer",
	},
	river_reik_un_hook_ship = {
		collect_amount = 2,
		mission_template_name = "collect",
		text = "mission_river_unhook_ship",
	},
	river_reik_sail_home = {
		mission_template_name = "goal",
		text = "mission_river_reik_sail_home",
	},
}
