﻿-- chunkname: @scripts/settings/terror_events/terror_events_dlc_dwarf_exterior.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local spawned_during_event = TerrorEventUtils.spawned_during_event
local HARDEST = TerrorEventUtils.HARDEST
local CATACLYSM = TerrorEventUtils.CATACLYSM
local terror_event_blueprints = {
	dwarf_exterior_disable_pacing = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
	},
	dwarf_exterior_enable_pacing = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	dwarf_exterior_courtyard_event_start = {
		{
			"control_hordes",
			enable = false,
		},
	},
	dwarf_exterior_courtyard_event_01 = {
		{
			"control_hordes",
			enable = false,
		},
		{
			"set_master_event_running",
			name = "dwarf_exterior_courtyard",
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
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "courtyard_hidden",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "courtyard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return spawned_during_event() < 8
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 8,
			spawner_id = "courtyard_hidden",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "courtyard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return spawned_during_event() < 10
			end,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_small",
			limit_spawners = 8,
			spawner_id = "courtyard_hidden",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_military_courtyard_plague_monks",
			limit_spawners = 2,
			spawner_id = "courtyard_hidden",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 8,
			spawner_id = "courtyard_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("chaos_corruptor_sorcerer") < 1 and count_event_breed("skaven_warpfire_thrower") < 1
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 8,
			spawner_id = "courtyard",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "courtyard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return spawned_during_event() < 6
			end,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
			spawner_id = "courtyard_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return spawned_during_event() < 6
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_courtyard_event_done",
		},
	},
	dwarf_exterior_courtyard_event_02 = {
		{
			"control_hordes",
			enable = false,
		},
		{
			"set_master_event_running",
			name = "dwarf_exterior_courtyard",
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
			composition_type = "event_large",
			limit_spawners = 4,
			spawner_id = "courtyard_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return spawned_during_event() < 8
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 8,
			spawner_id = "courtyard",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "courtyard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return spawned_during_event() < 10
			end,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			limit_spawners = 8,
			spawner_id = "courtyard_hidden",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_military_courtyard_plague_monks",
			limit_spawners = 2,
			spawner_id = "courtyard_hidden",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 8,
			spawner_id = "courtyard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("chaos_corruptor_sorcerer") < 1 and count_event_breed("chaos_vortex_sorcerer") < 1 and count_event_breed("skaven_warpfire_thrower") < 1
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 4,
			spawner_id = "courtyard_hidden",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return spawned_during_event() < 6
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 8,
			spawner_id = "courtyard",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "courtyard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return spawned_during_event() < 6
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_courtyard_event_done",
		},
	},
	dwarf_exterior_courtyard_event_end = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	dwarf_exterior_courtyard_event_specials_01 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_courtyard",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			difficulty_amount = {
				cataclysm = 3,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_ratling_gunner",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_poison_wind_globadier") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_courtyard_event_specials_done",
		},
	},
	dwarf_exterior_courtyard_event_specials_02 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_courtyard",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"spawn_special",
			breed_name = "chaos_vortex_sorcerer",
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"spawn_special",
			breed_name = "chaos_corruptor_sorcerer",
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("chaos_corruptor_sorcerer") < 1 and count_event_breed("chaos_vortex_sorcerer") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_courtyard_event_specials_done",
		},
	},
	dwarf_exterior_courtyard_event_specials_03 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_courtyard",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"spawn_special",
			breed_name = "chaos_vortex_sorcerer",
			difficulty_amount = {
				cataclysm = 3,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_ratling_gunner",
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_poison_wind_globadier",
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("chaos_vortex_sorcerer") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_courtyard_event_specials_done",
		},
	},
	dwarf_exterior_courtyard_event_specials_04 = {
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"spawn_special",
			breed_name = "skaven_warpfire_thrower",
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"spawn_special",
			breed_name = "skaven_pack_master",
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 1,
				normal = 1,
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_pack_master") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_courtyard_event_specials_done",
		},
	},
	dwarf_exterior_courtyard_event_specials_05 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_courtyard",
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"spawn_special",
			breed_name = "skaven_ratling_gunner",
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 1,
				normal = 1,
			},
		},
		{
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1 and count_event_breed("skaven_poison_wind_globadier") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_courtyard_event_specials_done",
		},
	},
	dwarf_exterior_temple_guards = {
		{
			"disable_kick",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "temple_guards02",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder_with_shield",
			spawner_id = "temple_guards05",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "temple_guards06",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder_with_shield",
			spawner_id = "temple_guards07",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "temple_guards09",
		},
	},
	dwarf_exterior_chamber_guards = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chamber_guards01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chamber_guards02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chamber_guards03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chamber_guards04",
		},
	},
	dwarf_exterior_escape_guards = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards05",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "escape_guards06",
		},
	},
	dwarf_exterior_end_event_survival_globadiers = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_survival",
		},
		{
			"spawn",
			{
				2,
				3,
			},
			breed_name = "skaven_poison_wind_globadier",
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_survival_globadiers_done",
		},
	},
	dwarf_exterior_end_event_survival_01 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_survival",
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 4,
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 7 and count_event_breed("skaven_slave") < 8 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_survival_01_done",
		},
	},
	dwarf_exterior_end_event_survival_02 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 7 and count_event_breed("skaven_slave") < 8 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_survival_02_done",
		},
	},
	dwarf_exterior_end_event_survival_end = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_survival",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 4,
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "end_event_survival",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_survival_end_done",
		},
	},
	dwarf_exterior_end_event_survival_stop = {
		{
			"stop_event",
			stop_event_name = "dwarf_exterior_end_event_survival_01",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_exterior_end_event_survival_02",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_exterior_end_event_survival_end",
		},
	},
	dwarf_exterior_end_event_escape = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_escape",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_escape_done",
		},
	},
	dwarf_exterior_end_event_escape_02 = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_escape",
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 2,
			spawner_id = "end_event_escape",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_escape_02_done",
		},
	},
	dwarf_exterior_end_event_sound = {},
	dwarf_exterior_end_event_start = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"disable_kick",
		},
		{
			"enable_bots_in_carry_event",
		},
	},
	dwarf_exterior_end_event_invasion = {
		{
			"set_master_event_running",
			name = "dwarf_exterior_end_event_invasion",
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 2,
			spawner_id = "tunnel_invaders",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 2,
			spawner_id = "tunnel_invaders",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_exterior_end_event_invasion_done",
		},
	},
	dwarf_water_boss = {
		{
			"spawn_at_raw",
			"skaven_stormfiend",
			"chaos_troll",
			"chaos_spawn",
			breed_name = "skaven_rat_ogre",
			spawner_id = "lake_manual",
		},
	},
	dwarf_exterior_end_event_guards = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_01b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_02b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_03b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_04b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_05",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_05b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_06",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "chain_guard_06b",
		},
	},
}

return {
	terror_event_blueprints,
}
