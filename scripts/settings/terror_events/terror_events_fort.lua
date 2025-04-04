﻿-- chunkname: @scripts/settings/terror_events/terror_events_fort.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local HARDEST = TerrorEventUtils.HARDEST
local weighted_random_terror_events = {
	fort_terror_event_inner_yard = {
		"fort_terror_event_inner_yard_skaven",
		1,
		"fort_terror_event_inner_yard_chaos",
		1,
	},
	fort_horde_cannon = {
		"fort_horde_cannon_skaven",
		1,
		"fort_horde_cannon_chaos",
		1,
	},
}
local terror_event_blueprints = {
	fort_pacing_off = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
	},
	fort_pacing_on = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	fort_terror_event_climb = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "fort_terror_event_climb",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "terror_event_climb",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end,
		},
		{
			"flow_event",
			flow_event_name = "fort_terror_event_climb_done",
		},
	},
	fort_terror_event_inner_yard_skaven = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "fort_terror_event_inner_yard",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "terror_event_inner_yard",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_slave") < 6
			end,
		},
		{
			"flow_event",
			flow_event_name = "fort_terror_event_inner_yard_done",
		},
	},
	fort_terror_event_inner_yard_chaos = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "fort_terror_event_inner_yard",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "terror_event_inner_yard",
		},
		{
			"delay",
			duration = 7,
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "fort_terror_event_inner_yard_done",
		},
	},
	fort_horde_gate = {
		{
			"set_master_event_running",
			name = "fort_horde_gate",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"disable_kick",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			spawner_id = "fort_horde_gate",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_gate_done",
		},
	},
	fort_horde_cannon_skaven = {
		{
			"set_master_event_running",
			name = "fort_horde_cannon",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_large",
			spawner_id = "fort_horde_cannon",
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_special_spawners",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 8,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "fort_horde_cannon",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_slave") < 10 and count_event_breed("skaven_clan_rat") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 3,
			spawner_id = "fort_horde_cannon",
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_special_spawners",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_slave") < 10 and count_event_breed("skaven_clan_rat") < 10
			end,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			limit_spawners = 3,
			spawner_id = "fort_horde_cannon",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 10,
			difficulty_requirement = HARDEST,
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_cannon_done",
		},
	},
	fort_horde_cannon_chaos = {
		{
			"set_master_event_running",
			name = "fort_horde_cannon",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "fort_horde_cannon",
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_special_spawners",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 3,
			spawner_id = "fort_horde_cannon",
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 3,
			spawner_id = "fort_horde_cannon",
			difficulty_requirement = HARDEST,
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_special_spawners",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_cannon_done",
		},
	},
	fort_horde_fleeing = {
		{
			"set_master_event_running",
			name = "fort_horde_fleeing",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "fort_horde_fleeing",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("skaven_slave") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "fort_horde_small_done",
		},
	},
	fort_siegers = {
		{
			"set_master_event_running",
			name = "fort_siegers",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "siege_1",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_berzerker",
			spawner_id = "siege_2",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "siege_3",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "siege_4",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_berzerker",
			spawner_id = "siege_5",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "siege_6",
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 2 and count_event_breed("chaos_raider") < 2 and count_event_breed("chaos_marauder") < 2 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "siege_broken",
		},
	},
}

return {
	terror_event_blueprints,
	weighted_random_terror_events,
}
