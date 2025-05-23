﻿-- chunkname: @scripts/settings/terror_events/terror_events_forest_ambush.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local weighted_random_terror_events = {
	forest_end = {
		"forest_end_event_a",
		5,
		"forest_end_event_b",
		5,
		"forest_end_event_c",
		3,
	},
	forest_skaven_camp = {
		"forest_skaven_camp_a",
		1,
		"forest_skaven_camp_b",
		1,
		"forest_skaven_camp_c",
		1,
	},
	generic_special_fun = {
		"generic_specials_fun_a",
		1,
		"generic_specials_fun_b",
		1,
	},
}
local terror_event_blueprints = {
	forest_end_event_start = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_start_debug",
		},
		{
			"disable_kick",
		},
	},
	forest_end_event_a = {
		{
			"set_master_event_running",
			name = "forest_finale",
		},
		{
			"disable_kick",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "forest_end_event",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "forest_end_event_specials",
		},
		{
			"event_horde",
			composition_type = "storm_vermin_shields_small",
			spawner_id = "forest_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "forest_end_event",
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			spawner_id = "forest_end_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_plague_monk") < 5
			end,
		},
		{
			"delay",
			duration = {
				3,
				7,
			},
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart",
		},
	},
	forest_end_event_b = {
		{
			"set_master_event_running",
			name = "forest_finale",
		},
		{
			"disable_kick",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			spawner_id = "forest_end_event_chaos",
		},
		{
			"spawn_special",
			amount = 1,
			spawner_id = "forest_end_event_specials",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			spawner_id = "forest_end_event_chaos",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			spawner_id = "forest_end_event_chaos",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 2
			end,
		},
		{
			"delay",
			duration = {
				10,
				15,
			},
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart",
		},
	},
	forest_end_event_c = {
		{
			"set_master_event_running",
			name = "forest_finale",
		},
		{
			"disable_kick",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"spawn_special",
			amount = 1,
			spawner_id = "forest_end_event_specials",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner",
			},
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "forest_end_event",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_medium",
			spawner_id = "forest_end_event_chaos",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin") < 2
			end,
		},
		{
			"delay",
			duration = {
				3,
				7,
			},
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart",
		},
	},
	forest_end_finale = {
		{
			"set_master_event_running",
			name = "forest_finale",
		},
		{
			"disable_kick",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "forest_end_event_finale",
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			spawner_id = "forest_end_event_chaos",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "forest_end_event_finale",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("chaos_warrior") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart",
		},
	},
	forest_end_event_loop = {
		{
			"set_master_event_running",
			name = "forest_finale",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "forest_end_event",
		},
		{
			"delay",
			duration = 7,
		},
		{
			"continue_when",
			duration = 45,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 4,
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_loop_restart",
		},
	},
	forest_end_cutscene = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "forest_cutscene_a",
		},
	},
	forest_skaven_camp_guards_01 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_01a",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_01b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_01c",
		},
	},
	forest_skaven_camp_guards_02 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_02a",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_02b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_02c",
		},
	},
	forest_skaven_camp_guards_03 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_03a",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_03b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_03c",
		},
	},
	forest_skaven_camp_loop = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_master_event_running",
			name = "forest_camp",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "skaven_camp_loop",
		},
		{
			"delay",
			duration = 4,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "skaven_camp_loop",
		},
		{
			"delay",
			duration = {
				2,
				4,
			},
		},
		{
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "forest_camp_specials",
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_poison_wind_globadier") < 1
			end,
		},
		{
			"delay",
			duration = {
				2,
				4,
			},
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_loop_restart",
		},
	},
	forest_skaven_camp_resistance_loop = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_master_event_running",
			name = "forest_camp",
		},
		{
			"spawn",
			{
				4,
				7,
			},
			breed_name = "skaven_plague_monk",
			spawner_id = "forest_camp_specials",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "skaven_camp_loop",
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_clan_rat") < 4
			end,
		},
		{
			"delay",
			duration = {
				13,
				17,
			},
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_resistance_loop_restart",
		},
	},
	forest_skaven_camp_a = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_master_event_running",
			name = "forest_camp",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "forest_skaven_camp",
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = {
				10,
				15,
			},
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "forest_skaven_camp",
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_a_done",
		},
	},
	forest_skaven_camp_b = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_master_event_running",
			name = "forest_camp",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "forest_skaven_camp",
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = {
				10,
				15,
			},
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_b_done",
		},
	},
	forest_skaven_camp_c = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_master_event_running",
			name = "forest_camp",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "forest_skaven_camp",
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = {
				10,
				15,
			},
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "forest_skaven_camp",
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_c_done",
		},
	},
	forest_skaven_camp_finale = {
		{
			"set_master_event_running",
			name = "forest_camp",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "forest_door_a",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "forest_skaven_camp",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"stop_master_event",
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_finale_done",
		},
		{
			"disable_bots_in_carry_event",
		},
		{
			"control_pacing",
			enable = true,
		},
	},
	generic_specials_fun_a = {
		{
			"spawn",
			{
				2,
				3,
			},
			breed_name = "skaven_poison_wind_globadier",
		},
	},
	generic_specials_fun_b = {
		{
			"spawn",
			{
				1,
				2,
			},
			breed_name = "skaven_ratling_gunner",
		},
	},
}

return {
	terror_event_blueprints,
	weighted_random_terror_events,
}
