﻿-- chunkname: @scripts/settings/terror_events/terror_events_dlc_dwarf_interior.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local terror_event_blueprints = {
	dwarf_interior_disable_pacing = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_hordes",
			enable = false,
		},
		{
			"control_specials",
			enable = false,
		},
	},
	dwarf_interior_enable_pacing = {
		{
			"control_pacing",
			enable = true,
		},
		{
			"control_hordes",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	dwarf_interior_bell_alert_01 = {
		{
			"set_master_event_running",
			name = "dwarf_interior_bell_alert",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_bell_alert_done",
		},
	},
	dwarf_interior_bell_alert_02 = {
		{
			"set_master_event_running",
			name = "dwarf_interior_bell_alert",
		},
		{
			"delay",
			duration = 4,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master",
				"skaven_ratling_gunner",
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_bell_alert_done",
		},
	},
	dwarf_interior_bell_alert_03 = {
		{
			"set_master_event_running",
			name = "dwarf_interior_bell_alert",
		},
		{
			"delay",
			duration = 6,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_bell_alert_done",
		},
	},
	dwarf_interior_bell_alert_04_dummy = {
		{
			"set_master_event_running",
			name = "dwarf_interior_bell_alert",
		},
		{
			"delay",
			duration = 10,
		},
	},
	dwarf_interior_bell_alert_05_construction = {
		{
			"set_master_event_running",
			name = "dwarf_interior_bell_alert",
		},
		{
			"delay",
			duration = 10,
		},
	},
	dwarf_interior_bell_alert_06_chasm = {
		{
			"set_master_event_running",
			name = "dwarf_interior_bell_alert",
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "bell_event_chasm_boss",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
			},
		},
		{
			"delay",
			duration = 10,
		},
	},
	dwarf_interior_static_guards_01 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_with_shield",
			spawner_id = "dwarf_interior_static_guard_spawner_01",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "dwarf_interior_static_guard_spawner_02",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_with_shield",
			spawner_id = "dwarf_interior_static_guard_spawner_03",
		},
	},
	dwarf_interior_static_guards_02 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_plague_monk",
			spawner_id = "dwarf_interior_static_guard_spawner_01",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "dwarf_interior_static_guard_spawner_02",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_plague_monk",
			spawner_id = "dwarf_interior_static_guard_spawner_03",
		},
	},
	dwarf_interior_static_guards_03 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "dwarf_interior_static_guard_spawner_01",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_plague_monk",
			spawner_id = "dwarf_interior_static_guard_spawner_02",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "dwarf_interior_static_guard_spawner_03",
		},
	},
	dwarf_interior_static_guards_04 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin",
			spawner_id = "dwarf_interior_static_guard_spawner_04",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "dwarf_interior_static_guard_spawner_05",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin",
			spawner_id = "dwarf_interior_static_guard_spawner_06",
		},
	},
	dwarf_interior_static_guards_05 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_with_shield",
			spawner_id = "dwarf_interior_static_guard_spawner_04",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_plague_monk",
			spawner_id = "dwarf_interior_static_guard_spawner_05",
		},
		{
			"delay",
			duration = 2,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_with_shield",
			spawner_id = "dwarf_interior_static_guard_spawner_06",
		},
	},
	dwarf_interior_static_guards_04_boss = {
		{
			"spawn_at_raw",
			"skaven_stormfiend",
			breed_name = "skaven_rat_ogre",
			spawner_id = "static_guards_04_boss_spawner",
		},
		{
			"delay",
			duration = 10,
		},
	},
	dwarf_interior_static_guards_dummy = {
		{
			"set_master_event_running",
			name = "dwarf_interior_static_guards_dummy",
		},
		{
			"delay",
			duration = 10,
		},
	},
	dwarf_interior_brewery_start = {
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
			enable = false,
		},
	},
	dwarf_interior_brewery_a = {
		{
			"set_master_event_running",
			name = "brewery_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 8,
			spawner_id = "brewery_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "dwarf_interior_brewery_specials_01",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_large",
			limit_spawners = 8,
			spawner_id = "brewery_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave", "skaven_storm_vermin_commander") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_restart",
		},
	},
	dwarf_interior_brewery_hard_a = {
		{
			"set_master_event_running",
			name = "brewery_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 8,
			spawner_id = "brewery_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "dwarf_interior_brewery_specials_01",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat", "skaven_slave", "skaven_clan_rat_with_shield") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_post_pause_start",
		},
	},
	dwarf_interior_brewery_b = {
		{
			"set_master_event_running",
			name = "brewery_event",
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
			composition_type = "event_extra_spice_medium",
			limit_spawners = 8,
			spawner_id = "brewery_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave", "skaven_storm_vermin_commander") < 5
			end,
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "dwarf_interior_brewery_specials_02",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_shields_small",
			limit_spawners = 4,
			spawner_id = "brewery_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_with_shield") < 3
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_restart",
		},
	},
	dwarf_interior_brewery_hard_b = {
		{
			"set_master_event_running",
			name = "brewery_event",
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
			composition_type = "event_small",
			limit_spawners = 8,
			spawner_id = "brewery_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "dwarf_interior_brewery_specials_02",
			breed_name = {
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_slave", "skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_post_pause_start",
		},
	},
	dwarf_interior_brewery_c = {
		{
			"set_master_event_running",
			name = "brewery_event",
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
			composition_type = "event_medium",
			limit_spawners = 8,
			spawner_id = "brewery_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave", "skaven_storm_vermin_commander") < 3
			end,
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "dwarf_interior_brewery_specials_03",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 4,
			spawner_id = "brewery_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave", "skaven_storm_vermin_commander") < 3
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_restart",
		},
	},
	dwarf_interior_brewery_hard_c = {
		{
			"set_master_event_running",
			name = "brewery_event",
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
			"spawn_at_raw",
			amount = 1,
			spawner_id = "dwarf_interior_brewery_specials_03",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_gutter_runner",
			},
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 8,
			spawner_id = "brewery_event_hard_c",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 7
			end,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_shields_small",
			limit_spawners = 8,
			spawner_id = "brewery_event_hard_c",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_storm_vermin_with_shield") < 3
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_post_pause_start",
		},
	},
	dwarf_interior_brewery_hard_d = {
		{
			"set_master_event_running",
			name = "brewery_event",
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
			composition_type = "plague_monks_small",
			limit_spawners = 4,
			spawner_id = "brewery_event_hard_d",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_shields_small",
			limit_spawners = 8,
			spawner_id = "brewery_event_hard_d",
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "dwarf_interior_brewery_specials_04",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat", "skaven_storm_vermin_with_shield") < 3 and count_event_breed("skaven_slave", "skaven_storm_vermin_commander") < 3
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_post_pause_start",
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_post_pause_start",
		},
	},
	dwarf_interior_brewery_pre_pause = {
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_hard_start",
		},
	},
	dwarf_interior_brewery_post_pause = {
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_restart",
		},
	},
	dwarf_interior_brewery_finale = {
		{
			"set_master_event_running",
			name = "brewery_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			limit_spawners = 8,
			spawner_id = "brewery_event_finale",
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "dwarf_interior_brewery_specials_04",
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 8,
			spawner_id = "brewery_event_finale",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave", "skaven_storm_vermin_commander") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_finale_end",
		},
	},
	dwarf_interior_brewery_loop = {
		{
			"set_master_event_running",
			name = "brewery_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 8,
			spawner_id = "brewery_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_shields_small",
			limit_spawners = 8,
			spawner_id = "brewery_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave", "skaven_storm_vermin_with_shield") < 3
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_brewery_loop_restart",
		},
	},
	dwarf_interior_brewery_stop = {
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_a",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_b",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_c",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_hard_a",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_hard_b",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_hard_c",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_hard_d",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_finale",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_pre_pause",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_post_pause",
		},
	},
	dwarf_interior_brewery_stop_chunk = {
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_a",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_b",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_brewery_c",
		},
	},
	dwarf_interior_great_hall_tunnels = {
		{
			"set_master_event_running",
			name = "great_hall_spawn",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"enable_bots_in_carry_event",
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 8,
			spawner_id = "tunnel_spawn",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "downstairs_tunnel_gutter_loop",
			breed_name = {
				"skaven_gutter_runner",
			},
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "back_tunnel_spawn_special",
			breed_name = {
				"skaven_ratling_gunner",
			},
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 4,
			spawner_id = "tunnel_spawn",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat", "skaven_clan_rat_with_shield", "skaven_storm_vermin_commander") < 5 and count_event_breed("skaven_gutter_runner", "skaven_ratling_gunner") < 1
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 8,
			spawner_id = "tunnel_spawn",
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "downstairs_tunnel_special_loop",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander", "skaven_clan_rat_with_shield") < 3
			end,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_great_hall_done",
		},
	},
	dwarf_interior_great_hall_extra_spice_event = {
		{
			"set_master_event_running",
			name = "great_hall_spawn",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"enable_bots_in_carry_event",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 8,
			spawner_id = "great_hall_air_vent_spawners",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_storm_vermin_commander") < 3 and count_event_breed("skaven_ratling_gunner", "skaven_warpfire_thrower", "skaven_poison_wind_globadier", "skaven_pack_master") < 1
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "dwarf_interior_great_hall_extra_spice_done",
		},
	},
	dwarf_interior_great_hall_tunnel_A_extra = {
		{
			"set_master_event_running",
			name = "great_hall_spawn",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"enable_bots_in_carry_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 4,
			spawner_id = "tunnel_A_extra_spawn",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
		},
		{
			"delay",
			duration = 10,
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
			flow_event_name = "dwarf_interior_great_hall_upstairs_tunnel_extra_done",
		},
	},
	dwarf_interior_great_hall_tunnel_B_extra = {
		{
			"set_master_event_running",
			name = "great_hall_spawn",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"enable_bots_in_carry_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 4,
			spawner_id = "tunnel_B_extra_spawn",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 4,
			spawner_id = "tunnel_B_extra_spawn",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 4,
			spawner_id = "tunnel_B_extra_spawn",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
			},
		},
		{
			"delay",
			duration = 10,
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
			flow_event_name = "dwarf_interior_great_hall_back_tunnel_extra_done",
		},
	},
	dwarf_interior_great_hall_tunnel_C_extra = {
		{
			"set_master_event_running",
			name = "great_hall_spawn",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"enable_bots_in_carry_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 8,
			spawner_id = "tunnel_C_extra_spawn",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			amount = 1,
			spawner_id = "tunnel_C_spawn_special",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
			},
		},
		{
			"delay",
			duration = 10,
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
			flow_event_name = "dwarf_interior_great_hall_downstairs_tunnel_extra_done",
		},
	},
	dwarf_interior_great_hall_stop = {
		{
			"delay",
			duration = 5,
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_great_hall_tunnels",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_great_hall_extra_spice_event",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_great_hall_tunnel_A_extra",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_great_hall_tunnel_B_extra",
		},
		{
			"stop_event",
			stop_event_name = "dwarf_interior_great_hall_tunnel_C_extra",
		},
		{
			"disable_bots_in_carry_event",
		},
		{
			"delay",
			duration = 10,
		},
	},
}

return {
	terror_event_blueprints,
}
