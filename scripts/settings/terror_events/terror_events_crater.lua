﻿-- chunkname: @scripts/settings/terror_events/terror_events_crater.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local num_spawned_enemies = TerrorEventUtils.num_spawned_enemies
local count_breed = TerrorEventUtils.count_breed
local num_alive_standards = TerrorEventUtils.num_alive_standards
local HARD = TerrorEventUtils.HARD
local horde_sound_settings = {
	skaven = {
		stinger_sound_event = "enemy_horde_stinger",
		music_states = {
			horde = "horde",
		},
	},
	chaos = {
		stinger_sound_event = "enemy_horde_chaos_stinger",
		music_states = {
			horde = "horde_chaos",
			pre_ambush = "pre_ambush_chaos",
		},
	},
	beastmen = {
		stinger_sound_event = "enemy_horde_beastmen_stinger",
		music_states = {
			horde = "horde_beastmen",
			pre_ambush = "pre_ambush_beastmen",
		},
	},
}
local terror_event_blueprints = {
	crater_no_horde = {
		{
			"control_hordes",
			enable = false,
		},
	},
	crater_mid_event = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_master_event_running",
			name = "crater_mid_event",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 3,
			spawner_id = "crater_mid_event_door_horde_01",
			sound_settings = horde_sound_settings.beastmen,
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 3,
			spawner_id = "crater_mid_event_door_horde_02",
			sound_settings = horde_sound_settings.beastmen,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("beastmen_gor") < 1 and count_breed("beastmen_ungor") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "crater_mid_event_enable_gate",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "crater_bestigor_medium",
			limit_spawners = 1,
			spawner_id = "crater_mid_event_door_elite_02",
			sound_settings = horde_sound_settings.beastmen,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("beastmen_bestigor") < 1
			end,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"flow_event",
			flow_event_name = "crater_mid_event_done",
		},
	},
	crater_detour_specials = {
		{
			"event_horde",
			composition_type = "crater_detour",
			limit_spawners = 6,
			spawner_id = "crater_detour_specials",
		},
	},
	crater_end_event_manual_spawns = {
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_01",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_02",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_03",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_04",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_05",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_06",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_07",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_08",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_10",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_11",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_12",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_13",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_14",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor",
			spawner_id = "crater_end_event_manual_spawn_15",
		},
	},
	crater_end_event_intro_wave = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "crater_end_event_intro_wave",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 4,
			spawner_id = "crater_end_event_intro_wave",
		},
		{
			"delay",
			duration = 20,
		},
		{
			"continue_when",
			duration = 55,
			condition = function (t)
				return count_event_breed("beastmen_gor") < 4 and count_breed("beastmen_ungor") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_intro_wave_done",
		},
	},
	crater_end_event_wave_01 = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "crater_end_event_wave_01",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 8
			end,
		},
		{
			"spawn_special",
			breed_name = "beastmen_bestigor",
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return num_alive_standards() < 1 and count_event_breed("beastmen_gor") < 5 and count_event_breed("beastmen_ungor") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_wave_01_done",
		},
	},
	crater_end_event_wave_02 = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "crater_end_event_wave_02",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_large_beastmen",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 6
			end,
		},
		{
			"spawn_special",
			breed_name = "beastmen_bestigor",
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return num_alive_standards() < 1 and count_event_breed("beastmen_gor") < 5 and count_event_breed("beastmen_ungor") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_wave_02_done",
		},
	},
	crater_end_event_wave_03 = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "crater_end_event_wave_03",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 45,
			condition = function (t)
				return num_spawned_enemies() < 5
			end,
		},
		{
			"spawn_special",
			breed_name = "beastmen_bestigor",
			difficulty_amount = {
				cataclysm = 3,
				hard = 1,
				harder = 2,
				hardest = 3,
				normal = 1,
			},
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return num_alive_standards() < 1 and count_event_breed("beastmen_gor") < 5 and count_event_breed("beastmen_ungor") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_wave_03_done",
		},
	},
	crater_end_event_wave_04 = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "crater_end_event_wave_04",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"event_horde",
			composition_type = "event_large_beastmen",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return num_spawned_enemies() < 8
			end,
		},
		{
			"spawn_special",
			breed_name = "beastmen_bestigor",
			difficulty_amount = {
				cataclysm = 3,
				hard = 1,
				harder = 2,
				hardest = 3,
				normal = 1,
			},
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 4,
			spawner_id = "crater_end_event",
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_wave_04_repeat",
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return num_alive_standards() < 1 and count_event_breed("beastmen_gor") < 5 and count_event_breed("beastmen_ungor") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "crater_end_event_wave_04_done",
		},
	},
	crater_spawn_dummies = {
		{
			"spawn_at_raw",
			breed_name = "beastmen_gor_dummy",
			spawner_id = "crater_gor_dummy",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_ungor_dummy",
			spawner_id = "crater_ungor_dummy",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_bestigor_dummy",
			spawner_id = "crater_bestigor_dummy",
		},
	},
	crater_end_event_minotaur = {
		{
			"spawn_at_raw",
			breed_name = "beastmen_minotaur",
			spawner_id = "event_minotaur",
			difficulty_requirement = HARD,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("beastmen_minotaur") == 1
			end,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("beastmen_minotaur") < 1
			end,
		},
	},
}

return {
	terror_event_blueprints,
}
