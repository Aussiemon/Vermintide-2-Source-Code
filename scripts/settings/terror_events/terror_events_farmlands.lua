﻿-- chunkname: @scripts/settings/terror_events/terror_events_farmlands.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local weighted_random_terror_events
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local terror_event_blueprints = {
	farmlands_rat_ogre = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre",
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
			flow_event_name = "farmlands_barn_boss_spawned",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1 and count_event_breed("skaven_stormfiend") < 1 and count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_dead",
		},
	},
	farmlands_storm_fiend = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_stormfiend",
			spawner_id = "farmlands_rat_ogre",
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
			flow_event_name = "farmlands_barn_boss_spawned",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_stormfiend") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_dead",
		},
	},
	farmlands_chaos_troll = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_troll",
			spawner_id = "farmlands_rat_ogre",
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
			flow_event_name = "farmlands_barn_boss_spawned",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_troll") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_dead",
		},
	},
	farmlands_chaos_spawn = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_spawn",
			spawner_id = "farmlands_rat_ogre",
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
			flow_event_name = "farmlands_barn_boss_spawned",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_spawn") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_dead",
		},
	},
	farmlands_minotaur_spawn = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_minotaur",
			spawner_id = "farmlands_rat_ogre",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("beastmen_minotaur") == 1
			end,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_spawned",
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("beastmen_minotaur") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_dead",
		},
	},
	farmlands_spawn_guards = {
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
			breed_name = "chaos_raider",
			spawner_id = "wall_guard_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "wall_guard_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "wall_guard_03",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "windmill_guard",
		},
	},
	farmlands_prisoner_event_01 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
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
			"set_master_event_running",
			name = "farmlands_prisoner_event_01",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "square_front",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "hay_barn_bridge_invis",
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
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "square_center",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3
			end,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "sawmill_yard_invis",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier",
			},
			difficulty_requirement = HARDER,
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
			"event_horde",
			composition_type = "event_small",
			spawner_id = "hay_barn_back",
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
			duration = 5,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
	},
	farmlands_hay_barn_bridge_guards = {
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "hay_barn_bridge_guards",
		},
		{
			"set_time_challenge",
			time_challenge_name = "farmlands_speed_event",
		},
		{
			"set_time_challenge",
			time_challenge_name = "farmlands_speed_event_cata",
		},
	},
	farmlands_prisoner_event_hay_barn = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
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
			"disable_kick",
		},
		{
			"set_master_event_running",
			name = "farmlands_prisoner_event_hay_barn",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_raider",
			spawner_id = "hay_barn_guards",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "hay_barn_manual_spawns",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "hay_barn_cellar_invis",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "hay_barn_front_invis",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "hay_barn_interior",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_special",
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_poison_wind_globadier",
			},
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
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
			"event_horde",
			composition_type = "event_small",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_pack_master",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDEST,
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
			composition_type = "event_small",
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
			"event_horde",
			composition_type = "event_small",
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
	},
	farmlands_prisoner_event_upper_square = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
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
			"set_master_event_running",
			name = "farmlands_prisoner_event_upper_square",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "square_center",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "sawmill_yard_invis",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_gutter_runner",
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "sawmill_yard",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3
			end,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "sawmill_yard_invis",
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer",
			},
			difficulty_requirement = HARDEST,
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
			"event_horde",
			composition_type = "event_small",
			spawner_id = "sawmill_creek",
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
	},
	farmlands_saw_mill_guards = {
		{
			"spawn_at_raw",
			spawner_id = "saw_mill_guards",
			breed_name = {
				"skaven_ratling_gunner",
				"skaven_warpfire_thrower",
			},
		},
	},
	farmlands_prisoner_event_sawmill_door = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
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
			"set_master_event_running",
			name = "farmlands_prisoner_event_sawmill_door",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_id = "sawmill_interior",
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
	},
	farmlands_prisoner_event_sawmill = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
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
			"set_master_event_running",
			name = "farmlands_prisoner_event_sawmill",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "sawmill_interior",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "sawmill_interior_invis",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_warpfire_thrower",
			},
			difficulty_requirement = HARDEST,
		},
		{
			"continue_when",
			duration = 80,
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
			composition_type = "event_small",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "sawmill_yard",
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
			"spawn_special",
			amount = 1,
			breed_name = {
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner",
			},
			difficulty_requirement = HARDER,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
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
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 2,
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
	},
	farmlands_gate_open_event_challenge = {
		{
			"has_completed_time_challenge",
			time_challenge_name = "farmlands_speed_event",
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "farmlands_speed_event_cata",
		},
	},
	farmlands_gate_open_event_horde = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
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
			spawner_id = "sawmill_yard",
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
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
