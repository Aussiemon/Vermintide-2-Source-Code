﻿-- chunkname: @scripts/settings/terror_events/terror_events_dlc_bastion.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local count_event_breed = TerrorEventUtils.count_event_breed
local HARDER = TerrorEventUtils.HARDER
local HARDEST = TerrorEventUtils.HARDEST
local terror_event_blueprints = {
	bastion_gate_event = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "bastion_gate_event",
		},
		{
			"control_hordes",
			enable = false,
		},
		{
			"control_specials",
			enable = true,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "bastion_gate_event_special",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "bastion_gate_event_special",
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 40,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "bastion_gate_event_special",
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "bastion_gate_event_special",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "bastion_gate_event_special",
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event",
		},
		{
			"event_horde",
			composition_type = "chaos_warriors_small",
			limit_spawners = 5,
			spawner_id = "bastion_gate_event_chaos",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 2 and count_event_breed("chaos_warrior") < 2
			end,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event_chaos",
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event_chaos",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors_small",
			limit_spawners = 5,
			spawner_id = "bastion_gate_event_chaos",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 8,
			spawner_id = "bastion_gate_event_chaos",
		},
		{
			"delay",
			duration = 7,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4 and count_event_breed("chaos_fanatic") < 4 and count_event_breed("chaos_warrior") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "bastion_gate_event_done",
		},
	},
	bastion_finale_sorcerer = {
		{
			"spawn_at_raw",
			breed_name = "chaos_dummy_exalted_sorcerer_drachenfels",
			spawner_id = "sorcerer_dummy",
		},
	},
	bastion_finale_event = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"disable_kick",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "bastion_finale_event",
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
			"delay",
			duration = 10,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 5,
			spawner_id = "bastion_finale_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "nngl_bastion_vo_sorcerer_taunt",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 5,
			spawner_id = "bastion_finale_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "nngl_bastion_vo_sorcerer_taunt",
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 5,
			spawner_id = "bastion_finale_event",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "bastion_finale_event_boss",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "bastion_finale_event_boss",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 5,
			spawner_id = "bastion_finale_event",
		},
		{
			"event_horde",
			composition_type = "storm_vermin_medium",
			limit_spawners = 5,
			spawner_id = "bastion_finale_event",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"spawn_at_raw",
			spawner_id = "bastion_finale_event_boss",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier",
				"skaven_poison_wind_globadier",
			},
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "nngl_bastion_vo_sorcerer_taunt",
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 5,
			spawner_id = "bastion_finale_event",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"spawn_at_raw",
			spawner_id = "bastion_finale_event_boss",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"skaven_poison_wind_globadier",
			},
		},
		{
			"delay",
			duration = 3,
		},
		{
			"spawn_at_raw",
			spawner_id = "bastion_finale_event_boss",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"skaven_poison_wind_globadier",
			},
			difficulty_requirement = HARDER,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"spawn_at_raw",
			spawner_id = "bastion_finale_event_boss",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
				"skaven_poison_wind_globadier",
			},
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
				return count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_warpfire_thrower") < 1 and count_event_breed("skaven_pack_master") < 1 and count_event_breed("skaven_poison_wind_globadier") < 1 and count_event_breed("skaven_gutter_runner") < 1
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 5,
			spawner_id = "bastion_finale_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"flow_event",
			flow_event_name = "bastion_vo_finale_tiring",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "nngl_bastion_vo_sorcerer_taunt",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "bastion_finale_event_boss",
		},
	},
	bastion_event_rat_ogre = {
		{
			"set_master_event_running",
			name = "bastion_event_boss",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "bastion_finale_event_boss",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "bastion_finale_event_boss",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "bastion_finale_event_boss",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "bastion_finale_event_escape",
		},
	},
	bastion_event_storm_fiend = {
		{
			"set_master_event_running",
			name = "bastion_event_boss",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_stormfiend",
			spawner_id = "bastion_finale_event_boss",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "bastion_finale_event_boss",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "bastion_finale_event_boss",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_stormfiend") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "bastion_finale_event_escape",
		},
	},
	bastion_event_chaos_spawn = {
		{
			"set_master_event_running",
			name = "bastion_event_boss",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_spawn",
			spawner_id = "bastion_finale_event_boss",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "bastion_finale_event_boss",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "bastion_finale_event_boss",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_spawn") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "bastion_finale_event_escape",
		},
	},
	bastion_finale_event_gauntlet = {
		{
			"event_horde",
			composition_type = "storm_vermin_medium",
			limit_spawners = 5,
			spawner_id = "bastion_finale_event_escape",
		},
		{
			"delay",
			duration = 7,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 5,
			spawner_id = "bastion_finale_event_escape",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 5
			end,
		},
	},
}

return {
	terror_event_blueprints,
}
