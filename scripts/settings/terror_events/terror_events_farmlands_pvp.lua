-- chunkname: @scripts/settings/terror_events/terror_events_farmlands_pvp.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local weighted_random_terror_events
local HARD = 3
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local terror_event_blueprints = {
	farmlands_oak_hill_event = {
		{
			"set_master_event_running",
			name = "farmlands_oak_hill_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"disable_kick",
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "oak_hill_event_spawner",
			difficulty_requirement = HARD,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "oak_hill_event_spawner",
			difficulty_requirement = HARD,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			spawner_id = "oak_hill_event_spawner",
			difficulty_requirement = HARD,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_clan_rat") < 2 and count_event_breed("skaven_clan_rat_with_shield") < 2 and count_event_breed("skaven_storm_vermin_commander") < 1 and count_event_breed("skaven_plague_monk") < 1
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_oak_hill_event_done",
		},
	},
	farmlands_rat_ogre = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			spawner_id = "farmlands_rat_ogre",
			difficulty_requirement = HARD,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre_3",
			breed_name = {
				"chaos_warrior",
			},
		},
		{
			"delay",
			duration = 3,
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre_up",
			breed_name = {
				"chaos_warrior",
			},
		},
		{
			"delay",
			duration = 1,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("chaos_warrior") < 1
			end,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_dead",
		},
	},
	farmlands_rat_ogre_loft = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "farmlands_rat_ogre_loft",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "event_small_fanatics",
			spawner_id = "farmlands_rat_ogre_loft",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 1 and count_event_breed("chaos_marauder_with_shield") < 1 and count_event_breed("chaos_fanatic") < 1
			end,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_rat_ogre_loft_done",
		},
	},
	farmlands_storm_fiend = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			spawner_id = "farmlands_rat_ogre",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre_3",
			breed_name = {
				"skaven_plague_monk",
			},
		},
		{
			"delay",
			duration = 3,
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre_up",
			breed_name = {
				"skaven_plague_monk",
			},
		},
		{
			"delay",
			duration = 3,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_plague_monk") < 1
			end,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_dead",
		},
	},
	farmlands_storm_fiend_loft = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			spawner_id = "farmlands_rat_ogre_loft",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("skaven_clan_rat_with_shield") < 1 and count_event_breed("skaven_clan_rat") < 1 and count_event_breed("skaven_storm_vermin_commander") < 1
			end,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_storm_fiend_loft_done",
		},
	},
	farmlands_chaos_troll = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"event_horde",
			composition_type = "chaos_berzerkers_medium",
			spawner_id = "farmlands_rat_ogre",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre_3",
			breed_name = {
				"chaos_berzerker",
			},
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre_5",
			breed_name = {
				"chaos_berzerker",
			},
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre_up",
			breed_name = {
				"chaos_berzerker",
			},
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre_4",
			breed_name = {
				"chaos_berzerker",
			},
		},
		{
			"delay",
			duration = 3,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("chaos_berzerker") < 1
			end,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_dead",
		},
	},
	farmlands_chaos_troll_loft = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"event_horde",
			composition_type = "chaos_raiders_medium",
			spawner_id = "farmlands_rat_ogre_loft",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"event_horde",
			composition_type = "event_small_chaos",
			spawner_id = "farmlands_rat_ogre_loft",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 1 and count_event_breed("chaos_marauder_with_shield") < 1 and count_event_breed("chaos_raider") < 1
			end,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_chaos_troll_loft_done",
		},
	},
	farmlands_chaos_spawn = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"event_horde",
			composition_type = "bestigors",
			spawner_id = "farmlands_rat_ogre",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			spawner_id = "farmlands_rat_ogre_4",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"event_horde",
			composition_type = "end_event_crater_medium",
			spawner_id = "farmlands_rat_ogre_5",
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre_3",
			breed_name = {
				"beastmen_bestigor",
			},
		},
		{
			"delay",
			duration = 3,
		},
		{
			"spawn_at_raw",
			spawner_id = "farmlands_rat_ogre_up",
			breed_name = {
				"beastmen_bestigor",
			},
		},
		{
			"delay",
			duration = 3,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("beastmen_ungor_archer") < 2 and count_event_breed("beastmen_bestigor") < 2
			end,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_barn_boss_dead",
		},
	},
	farmlands_chaos_spawn_loft = {
		{
			"set_master_event_running",
			name = "farmlands_boss_barn",
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			spawner_id = "farmlands_rat_ogre_loft",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "standard_bearer_ambush",
			spawner_id = "farmlands_rat_ogre_loft",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			spawner_id = "farmlands_rat_ogre_loft",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("beastmen_gor") < 1 and count_event_breed("beastmen_ungor_archer") < 1 and count_event_breed("beastmen_ungor") < 1
			end,
		},
		{
			"delay",
			duration = 3,
		},
		{
			"flow_event",
			flow_event_name = "farmlands_chaos_spawn_loft_done",
		},
	},
	farmlands_spawn_guards = {
		{
			"control_pacing",
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
	farmlands_pvp_pacing_off = {
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
	farmlands_pvp_pacing_on = {
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
			"control_pacing",
			enable = true,
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
