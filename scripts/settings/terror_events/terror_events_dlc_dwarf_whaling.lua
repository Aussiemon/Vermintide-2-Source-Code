-- chunkname: @scripts/settings/terror_events/terror_events_dlc_dwarf_whaling.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local HARDER = TerrorEventUtils.HARDER
local HARDEST = TerrorEventUtils.HARDEST
local CATACLYSM = TerrorEventUtils.CATACLYSM
local terror_event_blueprints = {
	dwarf_disable_pacing = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
	},
	dwarf_enable_pacing = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	whaling_burn = {
		{
			"set_master_event_running",
			name = "whaling_whaling",
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
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 2,
			spawner_id = "whaling_event_l",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 1,
			spawner_id = "whaling_event_l",
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
			spawner_id = "whaling_event_r",
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
			spawner_id = "whaling_event_l",
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
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "whaling_event_l",
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
			spawner_id = "whaling_event_l",
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "whaling_event_r",
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
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 2,
			spawner_id = "whaling_event_l",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "whaling_event_r",
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
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "whaling_event_r",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 1,
			spawner_id = "whaling_event_r",
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
			spawner_id = "whaling_event_r",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 1,
			spawner_id = "whaling_event_l",
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
			flow_event_name = "whaling_whaling",
		},
	},
	whaling_chaos_boss_01 = {
		{
			"spawn_at_raw",
			breed_name = "chaos_bulwark",
			spawner_id = "spawner_manual_shielded_warrior_001",
		},
	},
	whaling_chaos_boss_02 = {
		{
			"spawn_at_raw",
			breed_name = "chaos_bulwark",
			spawner_id = "spawner_manual_shielded_warrior_002",
		},
	},
	whaling_chaos_boss_03 = {
		{
			"spawn_at_raw",
			breed_name = "chaos_bulwark",
			spawner_id = "spawner_manual_shielded_warrior_003",
		},
	},
	whaling_mid_fanatics = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "whaling_mid_fanatics",
		},
		{
			"disable_kick",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "whaling_mid_event_chaos_01",
			limit_spawners = 8,
			spawner_id = "mid_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 10 and count_event_breed("chaos_marauder") < 6
			end,
		},
		{
			"delay",
			duration = 7,
		},
		{
			"flow_event",
			flow_event_name = "whaling_mid_fanatics_done",
		},
	},
	whaling_mid_event_fanatics = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "whaling_mid_event_fanatics",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "whaling_mid_event_chaos_01",
			limit_spawners = 8,
			spawner_id = "mid_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 10 and count_event_breed("chaos_marauder") < 6
			end,
		},
		{
			"delay",
			duration = 7,
		},
		{
			"flow_event",
			flow_event_name = "whaling_mid_event_fanatics_done",
		},
	},
	whaling_mid_event_specials = {
		{
			"set_master_event_running",
			name = "whaling_mid_event_fanatics",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"delay",
			duration = 15,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
			},
		},
		{
			"delay",
			duration = 25,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
			},
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "whaling_mid_event_specials_done",
		},
	},
	whaling_mid_event_spice_01 = {
		{
			"set_master_event_running",
			name = "whaling_mid_event_fanatics",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "whaling_mid_event_spice_chaos_raiders",
			limit_spawners = 1,
			spawner_id = "mid_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 15,
			condition = function (t)
				return count_event_breed("chaos_raider") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_mid_event_spice_01_done",
		},
	},
	whaling_mid_event_spice_02 = {
		{
			"set_master_event_running",
			name = "whaling_mid_event_fanatics",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "whaling_mid_event_spice_chaos_berzerkers",
			limit_spawners = 1,
			spawner_id = "mid_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 15,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_mid_event_spice_02_done",
		},
	},
	whaling_mid_event_spice_03 = {
		{
			"set_master_event_running",
			name = "whaling_mid_event_fanatics",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "whaling_mid_event_spice_chaos_shields",
			limit_spawners = 1,
			spawner_id = "mid_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 15,
			condition = function (t)
				return count_event_breed("chaos_shield") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_mid_event_spice_03_done",
		},
	},
	whaling_end_event_trickle = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "whaling_end_event",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "whaling_end_event_chaos_01",
			limit_spawners = 8,
			spawner_id = "lighthouse_event",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_marauder") < 5 and count_event_breed("chaos_raider") < 1 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_end_event_trickle_done",
		},
	},
	whaling_end_event_loop_01 = {
		{
			"set_master_event_running",
			name = "whaling_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "lighthouse_event",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_end_event_loop_done",
		},
	},
	whaling_end_event_loop_02 = {
		{
			"set_master_event_running",
			name = "whaling_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "lighthouse_event",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "lighthouse_event",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_raider") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_end_event_loop_done",
		},
	},
	whaling_end_event_loop_03 = {
		{
			"set_master_event_running",
			name = "whaling_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "lighthouse_event",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "lighthouse_event",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_end_event_loop_done",
		},
	},
	whaling_end_event_loop_04 = {
		{
			"set_master_event_running",
			name = "whaling_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 4,
			spawner_id = "lighthouse_event",
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_small",
			limit_spawners = 2,
			spawner_id = "lighthouse_event",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2 and count_event_breed("chaos_berzerker") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_end_event_loop_done",
		},
	},
	whaling_end_event_loop_05 = {
		{
			"set_master_event_running",
			name = "whaling_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "lighthouse_event",
		},
		{
			"event_horde",
			composition_type = "storm_vermin_small",
			limit_spawners = 4,
			spawner_id = "lighthouse_event",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_end_event_loop_done",
		},
	},
	whaling_end_event_loop_06 = {
		{
			"set_master_event_running",
			name = "whaling_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 2,
			spawner_id = "lighthouse_event",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_fanatic") < 4 and count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_raider") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_end_event_loop_done",
		},
	},
	whaling_end_event_specials_01 = {
		{
			"set_master_event_running",
			name = "whaling_end_event_specials",
		},
		{
			"spawn_special",
			amount = 2,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_gutter_runner",
			},
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_warpfire_thrower") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_end_event_specials_done",
		},
	},
	whaling_end_event_specials_02 = {
		{
			"set_master_event_running",
			name = "whaling_end_event_specials",
		},
		{
			"spawn_special",
			amount = 2,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_pack_master",
			},
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
			},
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_corruptor_sorcerer",
			},
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_gutter_runner") < 1 and count_event_breed("chaos_corruptor_sorcerer") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_end_event_specials_done",
		},
	},
	whaling_end_event_specials_03 = {
		{
			"set_master_event_running",
			name = "whaling_end_event_specials",
		},
		{
			"spawn_special",
			amount = 2,
			breed_name = {
				"skaven_ratling_gunner",
				"chaos_corruptor_sorcerer",
			},
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_pack_master",
			},
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
			},
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("chaos_corruptor_sorcerer") < 1 and count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_gutter_runner") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_end_event_specials_done",
		},
	},
	whaling_lighthouse = {
		{
			"set_master_event_running",
			name = "whaling_end_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "lighthouse_event",
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 2,
			spawner_id = "lighthouse_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_lighthouse_restart",
		},
	},
	whaling_bulwark_house = {
		{
			"spawn_at_raw",
			breed_name = "chaos_bulwark",
			spawner_id = "end_event_house",
		},
	},
	whaling_burning_window = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "whaling_burning_windows",
		},
		{
			"disable_kick",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 6,
			spawner_id = "burning_window",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 20,
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end,
		},
		{
			"delay",
			duration = 7,
		},
		{
			"flow_event",
			flow_event_name = "whaling_burning_windows_done",
		},
	},
	whaling_door_guard = {
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder_with_shield",
			spawner_id = "whaling_shield_dude_1",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder_with_shield",
			spawner_id = "whaling_shield_dude_2",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "whaling_sword_dude_1",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "whaling_sword_dude_2",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_raider",
			spawner_id = "whaling_2h_dude_1",
		},
	},
	whaling_sewer_event_a = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "whaling_sewer_event",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "chaos_shields",
			limit_spawners = 2,
			spawner_id = "sewer_spawn",
		},
		{
			"flow_event",
			flow_event_name = "whaling_sewer_event_a_done",
		},
	},
	whaling_sewer_event_b = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "whaling_sewer_event",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "sewer_spawn",
		},
		{
			"flow_event",
			flow_event_name = "whaling_sewer_event_b_done",
		},
	},
	whaling_sewer_event_c = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "whaling_sewer_event",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_small",
			limit_spawners = 2,
			spawner_id = "sewer_spawn",
		},
		{
			"flow_event",
			flow_event_name = "whaling_sewer_event_c_done",
		},
	},
	whaling_rat_ogre = {
		{
			"set_master_event_running",
			name = "whaling_boss_sewer",
		},
		{
			"spawn_at_raw",
			spawner_id = "whaling_boss_spawn_sewer",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn",
			},
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 1 or count_event_breed("skaven_stormfiend") == 1 or count_event_breed("chaos_troll") == 1 or count_event_breed("chaos_spawn") == 1
			end,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"flow_event",
			flow_event_name = "whaling_sewer_boss_spawned",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1 and count_event_breed("skaven_stormfiend") < 1 and count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_sewer_boss_dead",
		},
	},
	whaling_storm_fiend = {
		{
			"set_master_event_running",
			name = "whaling_boss_sewer",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_stormfiend",
			spawner_id = "whaling_boss_spawn_sewer",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_stormfiend") == 1
			end,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"flow_event",
			flow_event_name = "whaling_sewer_boss_spawned",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_stormfiend") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_sewer_boss_dead",
		},
	},
	whaling_chaos_troll = {
		{
			"set_master_event_running",
			name = "whaling_boss_sewer",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_troll",
			spawner_id = "whaling_boss_spawn_sewer",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_troll") == 1
			end,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"flow_event",
			flow_event_name = "whaling_sewer_boss_spawned",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_troll") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_sewer_boss_dead",
		},
	},
	whaling_chaos_spawn = {
		{
			"set_master_event_running",
			name = "whaling_boss_sewer",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_spawn",
			spawner_id = "whaling_boss_spawn_sewer",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_spawn") == 1
			end,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"flow_event",
			flow_event_name = "whaling_sewer_boss_spawned",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_spawn") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "whaling_sewer_boss_dead",
		},
	},
	whaling_outro = {
		{
			"flow_event",
			flow_event_name = "whaling_outro_start",
		},
	},
	whaling_bulwark_endslope = {
		{
			"spawn_at_raw",
			breed_name = "chaos_bulwark",
			spawner_id = "bulwark_end_1",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_bulwark",
			spawner_id = "bulwark_end_2",
			difficulty_requirement = HARDER,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_bulwark",
			spawner_id = "bulwark_end_3",
			difficulty_requirement = HARDEST,
		},
	},
}

return {
	terror_event_blueprints,
}
