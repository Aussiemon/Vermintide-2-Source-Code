-- chunkname: @scripts/settings/terror_events/terror_events_dlc_portals.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local HARDER = TerrorEventUtils.HARDER
local weighted_random_terror_events = {
	dlc_portals_end_event = {
		"dlc_portals_end_event_a",
		1,
		"dlc_portals_end_event_b",
		1,
	},
}
local terror_event_blueprints = {
	dlc_portals_control_pacing_disabled = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_hordes",
			enable = false,
		},
	},
	dlc_portals_control_pacing_enabled = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_hordes",
			enable = true,
		},
	},
	dlc_portals_temple_inside = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_temple_inside",
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
			spawner_id = "portals_temple_inside",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_portals_temple_inside_done",
		},
	},
	dlc_portals_temple_inside_specials = {
		{
			"event_horde",
			composition_type = "plague_monks_small",
			spawner_id = "portals_temple_inside_specials",
		},
	},
	dlc_portals_temple_yard = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_temple_yard",
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
			composition_type = "event_medium_chaos",
			spawner_id = "portals_temple_yard",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"spawn_special",
			amount = 1,
			spawner_id = "portals_temple_yard",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"skaven_warpfire_thrower",
			},
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			spawner_id = "portals_temple_yard_specials",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			spawner_id = "portals_temple_yard",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_portals_temple_yard_done",
		},
	},
	dlc_portals_temple_yard_exit = {
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "portals_temple_yard_exit",
		},
	},
	dlc_portals_end_event_a = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_end_event",
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
			composition_type = "event_medium",
			spawner_id = "portals_end_event_skaven",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"spawn_special",
			amount = 1,
			spawner_id = "portals_end_event_specials",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner",
			},
		},
		{
			"spawn_special",
			amount = 2,
			breed_name = "skaven_pack_master",
			spawner_id = "portals_end_event_specials",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 4,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "portals_end_event_skaven",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "portals_end_event_done",
		},
	},
	dlc_portals_end_event_b = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_end_event",
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
			composition_type = "event_large_chaos",
			spawner_id = "portals_end_event",
		},
		{
			"delay",
			duration = 7,
		},
		{
			"spawn_special",
			amount = 1,
			spawner_id = "portals_end_event_specials",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"skaven_warpfire_thrower",
			},
		},
		{
			"spawn_special",
			amount = 1,
			spawner_id = "portals_end_event_specials",
			breed_name = {
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 7,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"flow_event",
			flow_event_name = "portals_end_event_done",
		},
	},
	dlc_portals_end_event_c = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_end_event",
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
			composition_type = "event_large",
			spawner_id = "portals_end_event_skaven",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			spawner_id = "portals_end_event",
		},
		{
			"spawn_special",
			amount = 1,
			spawner_id = "portals_end_event_specials",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 4,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "portals_end_event_skaven",
		},
		{
			"delay",
			duration = 4,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_plague_monk") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "portals_end_event_done",
		},
	},
	dlc_portals_end_event_d = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_end_event",
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
			composition_type = "event_small_chaos",
			spawner_id = "portals_end_event",
		},
		{
			"delay",
			duration = 4,
		},
		{
			"spawn_special",
			amount = 2,
			spawner_id = "portals_end_event_specials",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"skaven_ratling_gunner",
			},
		},
		{
			"delay",
			duration = 8,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			spawner_id = "portals_end_event",
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			spawner_id = "portals_end_event",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 4,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "portals_end_event_done",
		},
	},
	dlc_portals_end_event_guards = {
		{
			"event_horde",
			composition_type = "chaos_warriors",
			spawner_id = "portals_end_event_guards",
		},
	},
	dlc_portals_end_escape_specials = {
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			spawner_id = "portals_end_escape_specials",
		},
	},
	dlc_portals_end_escape_a = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_end_escape",
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
			spawner_id = "portals_end_event_skaven",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"spawn_special",
			amount = 1,
			spawner_id = "portals_end_escape_specials",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner",
			},
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "portals_end_escape_skaven",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			spawner_id = "portals_end_escape",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "portals_end_escape_specials",
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "portals_end_escape_skaven",
		},
		{
			"delay",
			duration = 7,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_plague_monk") < 5
			end,
		},
		{
			"delay",
			duration = {
				1,
				4,
			},
		},
		{
			"flow_event",
			flow_event_name = "portals_end_escape_done",
		},
	},
	dlc_portals_end_escape_b = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_end_escape",
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
			composition_type = "event_medium_chaos",
			spawner_id = "portals_end_escape",
		},
		{
			"spawn_special",
			amount = 1,
			spawner_id = "portals_end_escape_specials",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"skaven_warpfire_thrower",
			},
		},
		{
			"delay",
			duration = 7,
		},
		{
			"continue_when",
			duration = 80,
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
			composition_type = "event_small_chaos",
			spawner_id = "portals_end_escape",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = "skaven_ratling_gunner",
			spawner_id = "portals_end_escape_specials",
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			spawner_id = "portals_end_escape",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 2
			end,
		},
		{
			"delay",
			duration = {
				1,
				4,
			},
		},
		{
			"flow_event",
			flow_event_name = "portals_end_escape_done",
		},
	},
	dlc_portals_end_escape_yard = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_end_escape_yard",
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
			spawner_id = "portals_end_escape_yard",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			spawner_id = "portals_end_escape_yard_specials",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			spawner_id = "portals_end_escape_yard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
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
			flow_event_name = "portals_end_escape_yard_done",
		},
	},
	dlc_portals_grapes_challenge = {
		{
			"set_master_event_running",
			name = "dlc_portals_grapes_challenge",
		},
		{
			"disable_kick",
		},
		{
			"control_pacing",
			enable = false,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "portals_grapes_challenge_01",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "portals_grapes_challenge_02",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "portals_grapes_challenge_03",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "portals_grapes_challenge_04",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_vortex_sorcerer") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_portals_grapes_challenge_done",
		},
		{
			"control_pacing",
			enable = true,
		},
	},
	dlc_portals_portal_challenge_01 = {
		{
			"set_master_event_running",
			name = "dlc_portals_portal_challenge_01",
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
			amount = 2,
			breed_name = "skaven_poison_wind_globadier",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "portals_portal_challenge_01",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_special",
			amount = 3,
			breed_name = "skaven_pack_master",
		},
		{
			"delay",
			duration = 4,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "portals_portal_challenge_01",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "portals_portal_challenge_01",
		},
		{
			"delay",
			duration = 4,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1 and count_event_breed("skaven_slave") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_poison_wind_globadier") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_portals_portal_challenge_01_done",
		},
		{
			"control_pacing",
			enable = true,
		},
	},
	dlc_portals_portal_challenge_02_horde = {
		{
			"set_master_event_running",
			name = "dlc_portals_portal_challenge_02_horde",
		},
		{
			"disable_kick",
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "portals_portal_challenge_02_horde",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_portals_portal_challenge_02_horde_done",
		},
	},
	dlc_portals_portal_challenge_02 = {
		{
			"set_master_event_running",
			name = "dlc_portals_portal_challenge_02",
		},
		{
			"disable_kick",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "portals_portal_challenge_02",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "dlc_portals_portal_challenge_02_done",
		},
	},
	dlc_portals_a = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_a",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
		},
		{
			"delay",
			duration = 20,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 8
			end,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
		},
		{
			"delay",
			duration = 20,
		},
		{
			"event_horde",
			composition_type = "event_medium",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_medium",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
		},
		{
			"delay",
			duration = 8,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_a",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"control_pacing",
			enable = true,
		},
		{
			"flow_event",
			flow_event_name = "portals_terror_event_a_complete",
		},
	},
	dlc_portals_b = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_b",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
		},
		{
			"delay",
			duration = 20,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 8
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_medium",
		},
		{
			"delay",
			duration = 20,
		},
		{
			"flow_event",
			flow_event_name = "event_portal_b_spawn_ogre",
		},
		{
			"delay",
			duration = 30,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_medium",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_b",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
		},
		{
			"flow_event",
			flow_event_name = "portals_terror_event_b_complete",
		},
	},
	dlc_portals_c = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "dlc_portals_c",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 2
			end,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"flow_event",
			flow_event_name = "event_portal_c_spawn_ogre",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_1",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "spawner_portal_c_2",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 6 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"control_pacing",
			enable = true,
		},
		{
			"flow_event",
			flow_event_name = "portals_terror_event_c_complete",
		},
	},
	dlc_portals_guards_cliff = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "spawner_manual_event_stormvermin_guard_1",
		},
	},
	dlc_portals_guards_portal_a = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "spawner_manual_event_stormvermin_guard_8",
		},
	},
	dlc_portals_guards_camp_a = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "spawner_manual_event_stormvermin_guard_3",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "spawner_manual_event_stormvermin_guard_7",
		},
	},
	dlc_portals_guards_portal_b = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "spawner_manual_event_stormvermin_guard_2",
		},
	},
	dlc_portals_guards_camp_b = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "spawner_manual_event_stormvermin_guard_4",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "spawner_manual_event_stormvermin_guard_6",
		},
	},
	dlc_portals_guards_portal_c = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "spawner_manual_event_stormvermin_guard_5",
		},
	},
	dlc_portals_b_ogre = {
		{
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "spawner_manual_event_portal_b",
		},
	},
	dlc_portals_c_ogre = {
		{
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "spawner_manual_event_portal_c_2",
		},
	},
}

return {
	terror_event_blueprints,
	weighted_random_terror_events,
}
