-- chunkname: @scripts/settings/terror_events/terror_events_farmlands_pvp.lua

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
				"skaven_pack_master",
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
				"skaven_warpfire_thrower",
				"skaven_ratling_gunner",
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
			"control_pacing",
			enable = true,
		},
		{
			"control_specials",
			enable = true,
		},
	},
	farmlands_pvp_event_su01_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_small",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 6,
		},
	},
	farmlands_pvp_event_su01_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 2,
		},
	},
	farmlands_pvp_event_su01_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 4,
		},
	},
	farmlands_pvp_event_su01_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 2,
		},
	},
	farmlands_pvp_event_su02_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_medium",
			limit_spawners = 4,
		},
	},
	farmlands_pvp_event_su02_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_chaos_extra_spice_medium",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
	},
	farmlands_pvp_event_su02_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 2,
		},
	},
	farmlands_pvp_event_su02_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "bestigors",
			limit_spawners = 8,
		},
	},
	farmlands_pvp_event_su03_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "bestigors_small",
			limit_spawners = 6,
		},
	},
	farmlands_pvp_event_su03_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 6,
		},
	},
	farmlands_pvp_event_su03_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 4,
		},
	},
	farmlands_pvp_event_su03_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_small_chaos",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
		},
	},
	farmlands_pvp_event_su04_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_small_chaos",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 4,
		},
	},
	farmlands_pvp_event_su04_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 6,
		},
	},
	farmlands_pvp_event_su04_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "bestigors",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 2,
		},
	},
	farmlands_pvp_event_su04_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 2,
		},
	},
	farmlands_pvp_event_su05_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "event_large_beastmen",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_large_beastmen",
			limit_spawners = 2,
		},
	},
	farmlands_pvp_event_su05_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "plague_monks_medium",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 2,
		},
	},
	farmlands_pvp_event_su05_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_medium_shield",
			limit_spawners = 2,
		},
	},
	farmlands_pvp_event_su05_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
	},
	farmlands_pvp_event_su06_01 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			limit_spawners = 4,
		},
	},
	farmlands_pvp_event_su06_02 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "bestigors",
			limit_spawners = 2,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 6,
		},
	},
	farmlands_pvp_event_su06_03 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			limit_spawners = 2,
		},
		{
			"event_horde",
			composition_type = "event_large_beastmen",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "bestigors",
			limit_spawners = 2,
		},
	},
	farmlands_pvp_event_su06_04 = {
		{
			"set_master_event_running",
			name = "horde_surge_event",
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
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			limit_spawners = 4,
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
