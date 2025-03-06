-- chunkname: @scripts/settings/terror_events/terror_events_ussingen.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local HARDER = TerrorEventUtils.HARDER
local HARDEST = TerrorEventUtils.HARDEST
local CATACLYSM = TerrorEventUtils.CATACLYSM
local weighted_random_terror_events = {
	ussingen_payload_event_loop = {
		"ussingen_payload_event_loop_01",
		1,
		"ussingen_payload_event_loop_02",
		1,
		"ussingen_payload_event_loop_03",
		1,
		"ussingen_payload_event_loop_04",
		1,
	},
}
local terror_event_blueprints = {
	generic_disable_pacing = GenericTerrorEvents.generic_disable_pacing,
	ussingen_gate_guards = {
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "gate_spawner_1",
		},
		{
			"delay",
			duration = 0.8,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "gate_spawner_2",
		},
	},
	ussingen_gate_open_event = {
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
			composition_type = "event_ussingen_gate_group",
			spawner_id = "ussingen_gate_open",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	ussingen_payload_event_01 = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"disable_kick",
		},
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "ussingen_payload_event",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_start",
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 4,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 7 and count_event_breed("chaos_raider") < 5 and count_event_breed("chaos_marauder") < 8 and count_event_breed("chaos_marauder_with_shield") < 6
			end,
		},
		{
			"flow_event",
			flow_event_name = "ussingen_payload_event_01_done",
		},
	},
	ussingen_payload_event_loop_01 = {
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_transit",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_transit",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_ratling_gunner",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
				"skaven_poison_wind_globadier",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 6,
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_transit",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 6 and count_event_breed("chaos_raider") < 6 and count_event_breed("chaos_marauder") < 6 and count_event_breed("chaos_marauder_with_shield") < 6
			end,
		},
		{
			"flow_event",
			flow_event_name = "ussingen_payload_event_loop_done",
		},
	},
	ussingen_payload_event_loop_02 = {
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_transit",
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
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
			duration = 50,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "ussingen_payload_square",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
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
			flow_event_name = "ussingen_payload_event_loop_done",
		},
	},
	ussingen_payload_event_loop_03 = {
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_corruptor_sorcerer",
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"chaos_vortex_sorcerer",
			},
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "ussingen_payload_event_loop_done",
		},
	},
	ussingen_payload_event_loop_04 = {
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_transit",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"skaven_pack_master",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 50,
			condition = function (t)
				return count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_square",
		},
		{
			"delay",
			duration = 5,
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
			flow_event_name = "ussingen_payload_event_loop_done",
		},
	},
	ussingen_payload_event_02 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "ussingen_payload_event",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			spawner_id = "ussingen_payload_square",
		},
		{
			"delay",
			duration = 4,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"chaos_vortex_sorcerer",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "ussingen_payload_transit",
			difficulty_requirement = HARDER,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			spawner_id = "ussingen_payload_square",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_pack_master",
				"skaven_gutter_runner",
				"chaos_vortex_sorcerer",
			},
			difficulty_requirement = CATACLYSM,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 4,
			spawner_id = "ussingen_payload_square",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors_small",
			limit_spawners = 4,
			spawner_id = "ussingen_payload_square",
			difficulty_requirement = HARDER,
		},
		{
			"flow_event",
			flow_event_name = "ussingen_payload_event_02_done",
		},
	},
	ussingen_payload_event_03 = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
		{
			"disable_bots_in_carry_event",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "ussingen_mansion_garden_payload",
		},
	},
	ussingen_escape = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "ussingen_escape",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			limit_spawners = 2,
			spawner_id = "ussingen_escape_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 3 and count_event_breed("chaos_raider") < 3 and count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_marauder_with_shield") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "ussingen_escape_restart",
		},
	},
}

return {
	terror_event_blueprints,
	weighted_random_terror_events,
}
