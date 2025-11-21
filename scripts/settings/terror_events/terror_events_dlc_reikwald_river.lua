-- chunkname: @scripts/settings/terror_events/terror_events_dlc_reikwald_river.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function count_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed(breed_name)
end

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_enemies()

	return #spawned_enemies
end

local NORMAL = 1
local HARD = 2
local HARDER = 3
local HARDEST = 4
local CATACLYSM = 5
local terror_event_blueprints = {
	reikwald_river_pacing_off = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"control_hordes",
			enable = true,
		},
	},
	reikwald_river_pacing_on = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
		{
			"control_hordes",
			enable = true,
		},
	},
	reikwald_river_enable_special_pacing = {
		{
			"control_specials",
			enable = true,
		},
	},
	reikwald_river_disable_special_pacing = {
		{
			"control_specials",
			enable = false,
		},
	},
	reikwald_river_enable_hordes_pacing = {
		{
			"control_hordes",
			enable = true,
		},
	},
	reikwald_river_disable_hordes_pacing = {
		{
			"control_hordes",
			enable = false,
		},
	},
	reikwald_river_plaza_01 = {
		{
			"delay",
			duration = 5,
		},
	},
	reikwald_river_troll = {
		{
			"set_master_event_running",
			name = "river_troll",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_troll",
			spawner_id = "troll_boss",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("chaos_troll") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_troll_done",
		},
	},
	reikwald_river_troll_flush = {
		{
			"set_master_event_running",
			name = "river_troll_flush",
		},
		{
			"event_horde",
			composition_type = "plaza_wave_2_04",
			spawner_id = "troll_cave_flush",
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_troll_flush_done",
		},
	},
	reikwald_river_barrel_ambush_01 = {
		{
			"set_master_event_running",
			name = "barrel_ambush",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "rescue_ship_ambush",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "rescue_ship_ambush",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "rescue_ship_ambush",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "barrel_ambush_done",
		},
	},
	reikwald_river_swamp = {
		{
			"set_master_event_running",
			name = "warcamp_swamp",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 2,
			spawner_id = "warcamp_swamp_event_l",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 1,
			spawner_id = "warcamp_swamp_event_l",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_small",
			limit_spawners = 1,
			spawner_id = "warcamp_swamp_event_r",
		},
		{
			"delay",
			duration = 10,
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "warcamp_swamp_event_l",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_pack_master",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
			},
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "warcamp_swamp_event_l",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "warcamp_swamp_event_l",
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "warcamp_swamp_event_r",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_poison_wind_globadier",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 2,
			spawner_id = "warcamp_swamp_event_l",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "warcamp_swamp_event_r",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "warcamp_swamp_event_r",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 1,
			spawner_id = "warcamp_swamp_event_r",
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "warcamp_swamp_event_r",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 1,
			spawner_id = "warcamp_swamp_event_l",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_swamp_done",
		},
	},
	reikwald_river_sea_battle_chaos_01 = {
		{
			"set_master_event_running",
			name = "chaos_ship_1",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_bulwark",
			spawner_id = "chaos_ship_01",
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			spawner_id = "chaos_ship_01",
		},
		{
			"delay",
			duration = 3,
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "chaos_ship_01",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"delay",
			duration = 4,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_sea_battle_chaos_01_done",
		},
	},
	reikwald_river_sea_battle_landside_01 = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "sea_battle_landside_raw_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "sea_battle_landside_raw_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "sea_battle_landside_raw_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "sea_battle_landside_raw_01",
		},
	},
	reikwald_river_sea_battle_right_01 = {
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "sea_battle_right_01",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "sea_battle_right_01",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_sea_battle_right_01_done",
		},
	},
	reikwald_river_sea_battle_left_01 = {
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "sea_battle_left_01",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "sea_battle_left_01",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_sea_battle_left_01_done",
		},
	},
	reikwald_river_sea_battle_right_02 = {
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "sea_battle_right_02",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "sea_battle_right_02",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "sea_battle_right_02",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_sea_battle_right_02_done",
		},
	},
	reikwald_river_sea_battle_left_02 = {
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "sea_battle_left_02",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "sea_battle_left_02",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "sea_battle_left_02",
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_sea_battle_left_02_done",
		},
	},
	reikwald_river_sea_battle_right_03 = {
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "sea_battle_right_03",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "sea_battle_right_03",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "sea_battle_right_03",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "sea_battle_right_03",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_sea_battle_right_03_done",
		},
	},
	reikwald_river_sea_battle_left_03 = {
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "sea_battle_left_03",
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "sea_battle_left_03",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "sea_battle_left_03",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "sea_battle_left_03",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_sea_battle_left_03_done",
		},
	},
	reikwald_river_sea_battle_front_03 = {
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "sea_battle_front_03",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "sea_battle_front_03",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_sea_battle_front_03_done",
		},
	},
	reikwald_river_sea_battle_replace_left_01 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_01_clan_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_01_clan_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_01_clan_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_01_clan_04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "raw_skaven_ship_left_01_captain",
		},
	},
	reikwald_river_sea_battle_replace_right_01 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_01_clan_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_01_clan_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_01_clan_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_01_clan_04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "raw_skaven_ship_right_01_captain",
		},
	},
	reikwald_river_sea_battle_replace_left_02 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_02_clan_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_02_clan_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_02_clan_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_02_clan_04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "raw_skaven_ship_left_02_captain",
		},
	},
	reikwald_river_sea_battle_replace_right_02 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_02_clan_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_02_clan_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_02_clan_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_02_clan_04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "raw_skaven_ship_right_02_captain",
		},
	},
	reikwald_river_sea_battle_replace_left_03 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_03_clan_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_03_clan_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_03_clan_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_left_03_clan_04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "raw_skaven_ship_left_03_captain",
		},
	},
	reikwald_river_sea_battle_replace_right_03 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_03_clan_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_03_clan_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_03_clan_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "raw_skaven_ship_right_03_clan_04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "raw_skaven_ship_right_03_captain",
		},
	},
	reikwald_river_chaos_sword_01 = {
		{
			"set_master_event_running",
			name = "chaos_sword",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 50,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "chaos_sword",
		},
		{
			"delay",
			duration = 3,
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			spawner_id = "chaos_sword",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_chaos_sword_done",
		},
	},
	reikwald_river_shore_crash_01 = {
		{
			"set_master_event_running",
			name = "survive_beach_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "shore_crash_01",
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "shore_crash_01",
		},
	},
	reikwald_river_gauntlet_01 = {
		{
			"set_master_event_running",
			name = "survive_beach_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "gauntlet_01_front",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "gauntlet_01",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "gauntlet_01",
		},
	},
	reikwald_river_gauntlet_02 = {
		{
			"set_master_event_running",
			name = "survive_beach_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "gauntlet_02",
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "gauntlet_02",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "gauntlet_02",
		},
	},
	reikwald_river_gauntlet_03 = {
		{
			"set_master_event_running",
			name = "survive_beach_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "gauntlet_03",
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "gauntlet_03",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "gauntlet_03",
		},
	},
	reikwald_river_survive_beach_01 = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"set_master_event_running",
			name = "survive_beach_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"flow_event",
			flow_event_name = "survive_beach_crescendo_starting",
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 2,
			spawner_id = "survive_beach_01",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "survive_beach_01",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 4
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
			limit_spawners = 4,
			spawner_id = "survive_beach_01",
		},
		{
			"disable_kick",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "survive_beach_01",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 4
			end,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "survive_beach_01",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_shields_small",
			limit_spawners = 1,
			spawner_id = "survive_beach_01",
		},
		{
			"delay",
			duration = 4,
		},
		{
			"spawn_special",
			amount = 2,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
			limit_spawners = 4,
			spawner_id = "survive_beach_01",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "survive_beach_01",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 1,
			spawner_id = "survive_beach_01",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 4
			end,
		},
		{
			"control_specials",
			enable = true,
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
			},
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "survive_beach_01",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
			limit_spawners = 2,
			spawner_id = "survive_beach_01",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "survive_beach_01",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 7 and count_event_breed("skaven_storm_vermin_commander") < 4
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
			limit_spawners = 4,
			spawner_id = "survive_beach_01",
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "survive_beach_01",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 2,
			spawner_id = "survive_beach_01",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 10 and count_event_breed("skaven_storm_vermin_commander") < 4 and count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "survive_beach_01",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
			limit_spawners = 4,
			spawner_id = "survive_beach_01",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave") < 10
			end,
		},
		{
			"flow_event",
			flow_event_name = "survive_beach_event_done",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"control_pacing",
			enable = true,
		},
	},
	reikwald_river_survive_chaos_01 = {
		{
			"set_master_event_running",
			name = "chaos_beach_1",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 50,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			spawner_id = "beach_chaos",
		},
		{
			"delay",
			duration = 3,
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			spawner_id = "beach_chaos",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small_fanatics",
			spawner_id = "beach_chaos",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_beach_chaos_01_done",
		},
	},
	reikwald_river_survive_chaos_spice_01 = {
		{
			"set_master_event_running",
			name = "chaos_beach_spice_1",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 50,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			spawner_id = "beach_chaos",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors_small",
			spawner_id = "beach_chaos",
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_raider") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_warrior") < 1
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_beach_chaos_spice_01_done",
		},
	},
	reikwald_river_survive_ambush_01 = {
		{
			"set_master_event_running",
			name = "survive_ambush",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 50,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "rescue_ship_ambush",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "rescue_ship_ambush",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "rescue_ship_ambush",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "survive_ambush_done",
		},
	},
	reikwald_river_doombringer_01 = {
		{
			"set_master_event_running",
			name = "reikwald_river_doombringer_01",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "finale_floor",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "finale_floor",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "doombringer_wreck",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "finale_floor",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_doombringer_01_done",
		},
	},
	reikwald_river_doombringer_02 = {
		{
			"set_master_event_running",
			name = "reikwald_river_doombringer_02",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "finale_floor",
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "finale_floor",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "doombringer_wreck",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "finale_floor",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_storm_vermin_commander") < 10
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_doombringer_02_done",
		},
	},
	reikwald_river_doombringer_03 = {
		{
			"set_master_event_running",
			name = "reikwald_river_doombringer_03",
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "finale_floor",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "doombringer_wreck",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_doombringer_03_done",
		},
	},
	reikwald_river_hooks = {
		{
			"set_master_event_running",
			name = "reikwald_river_hooks",
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "ship_sides",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_slave") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "ship_sides",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "crater_detour",
			spawner_id = "doombringer_specials",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "reikwald_river_hooks_done",
		},
	},
}

return {
	terror_event_blueprints,
}
