-- chunkname: @scripts/settings/terror_events/terror_events_forest_ambush_pvp.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function count_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed(breed_name)
end

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_enemies()

	return #spawned_enemies
end

local function num_alive_standards()
	local alive_standards = Managers.state.conflict:alive_standards()

	return #alive_standards
end

local weighted_random_terror_events = {
	forest_end = {
		"forest_end_event_a",
		5,
		"forest_end_event_b",
		5,
		"forest_end_event_c",
		3,
	},
	forest_skaven_camp = {
		"forest_skaven_camp_a",
		1,
		"forest_skaven_camp_b",
		1,
		"forest_skaven_camp_c",
		1,
	},
}
local HARDER = 4
local HARDEST = 5
local terror_event_blueprints = {
	forest_ambush_pvp_pacing_off = {
		{
			"control_hordes",
			enable = false,
		},
		{
			"control_pacing",
			enable = false,
		},
	},
	forest_ambush_pvp_pacing_on = {
		{
			"control_hordes",
			enable = true,
		},
		{
			"control_pacing",
			enable = true,
		},
	},
	forest_end_event_start = {
		{
			"control_pacing",
			enable = false,
		},
		{
			"control_hordes",
			enable = false,
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_start_debug",
		},
		{
			"disable_kick",
		},
	},
	forest_skaven_icon_guards_01 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_icon_guards_spawn_01",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_slave",
			spawner_id = "forest_skaven_icon_guards_spawn_05a",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_icon_guards_spawn_05b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_slave",
			spawner_id = "forest_skaven_icon_guards_spawn_05c",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_icon_guards_01_done",
		},
	},
	forest_skaven_icon_guards_02 = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "forest_skaven_icon_guards_spawn_03",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_with_shield",
			spawner_id = "forest_skaven_icon_guards_spawn_02a",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_with_shield",
			spawner_id = "forest_skaven_icon_guards_spawn_02b",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_plague_monk",
			spawner_id = "forest_skaven_icon_guards_spawn_04a",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_plague_monk",
			spawner_id = "forest_skaven_icon_guards_spawn_04b",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_icon_guards_02_done",
		},
	},
	forest_black_crone_fen_event = {
		{
			"set_master_event_running",
			name = "forest_black_crone_fen_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "black_crone_fen_event_spawner",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			spawner_id = "black_crone_fen_event_spawner",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			spawner_id = "black_crone_fen_event_spawner",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 90,
			condition = function (t)
				return count_event_breed("skaven_slave") < 2 and count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_clan_rat_with_shield") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2 and count_event_breed("skaven_plague_monk") < 1
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "forest_black_crone_fen_event_done",
		},
	},
	watch_tower_guards_01 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_bestigor",
			spawner_id = "watch_tower_guards_spawn_01",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_ungor_archer",
			spawner_id = "watch_tower_guards_spawn_02",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_ungor_archer",
			spawner_id = "watch_tower_guards_spawn_03",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_ungor_archer",
			spawner_id = "watch_tower_guards_spawn_04",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_ungor_archer",
			spawner_id = "watch_tower_guards_spawn_05",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "watch_tower_guards_01_done",
		},
	},
	watch_tower_attack_loop = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "watch_tower_attack_loop",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 8,
			spawner_id = "watch_tower_intro_wave_spawn",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_standard_bearer",
			spawner_id = "watch_tower_event_01_banners",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("beastmen_gor") < 3 and count_event_breed("beastmen_ungor") < 3
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "watch_tower_attack_loop_done",
		},
	},
	watch_tower_event_wave_01 = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "watch_tower_event_wave_01",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 8,
			spawner_id = "watch_tower_event_wave_01_spawn",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("beastmen_gor") < 3 and count_event_breed("beastmen_ungor") < 3
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "bestigors",
			limit_spawners = 4,
			spawner_id = "beastmen_bestigor_spawn",
		},
		{
			"delay",
			duration = 3,
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			limit_spawners = 4,
			spawner_id = "watch_tower_event_wave_01_spawn",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("beastmen_bestigor") < 2 and count_event_breed("beastmen_ungor_archer") < 2
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "watch_tower_event_wave_01_done",
		},
	},
	watch_tower_event_wave_02 = {
		{
			"set_freeze_condition",
			max_active_enemies = 80,
		},
		{
			"set_master_event_running",
			name = "watch_tower_event_wave_02",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"event_horde",
			composition_type = "event_small_beastmen",
			limit_spawners = 8,
			spawner_id = "watch_tower_event_wave_02_spawn",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return count_event_breed("beastmen_gor") < 2 and count_event_breed("beastmen_ungor") < 2
			end,
		},
		{
			"flow_event",
			flow_event_name = "watch_tower_event_wave_02_done",
		},
	},
	forest_chaos_prisoners_guards_01 = {
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "forest_chaos_prisoners_guards_spawn_01",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_raider",
			spawner_id = "forest_chaos_prisoners_guards_spawn_02",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "forest_chaos_prisoners_guards_spawn_03",
		},
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "forest_chaos_prisoners_guards_spawn_05",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "forest_chaos_prisoners_guards_01_done",
		},
	},
	forest_chaos_prisoners_guards_02 = {
		{
			"delay",
			duration = 1,
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_raider",
			spawner_id = "forest_chaos_prisoners_guards_spawn_04a",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "forest_chaos_prisoners_guards_spawn_04b",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "forest_chaos_prisoners_guards_02_done",
		},
	},
	forest_skaven_camp_guards_01 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_01a",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_01b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_with_shield",
			spawner_id = "forest_skaven_camp_guards_01c",
		},
	},
	forest_skaven_camp_guards_02 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_02a",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_with_shield",
			spawner_id = "forest_skaven_camp_guards_02b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_02c",
		},
	},
	forest_skaven_camp_guards_03 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_with_shield",
			spawner_id = "forest_skaven_camp_guards_03a",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_03b",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "forest_skaven_camp_guards_03c",
		},
	},
	forest_skaven_camp_loop = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_master_event_running",
			name = "forest_camp",
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
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 8,
			spawner_id = "skaven_camp_loop",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 30,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_clan_rat") < 4
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_loop_restart",
		},
	},
	forest_skaven_camp_resistance_loop = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_master_event_running",
			name = "forest_camp",
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
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 8,
			spawner_id = "skaven_camp_loop",
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_clan_rat") < 4
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_resistance_loop_restart",
		},
	},
	forest_skaven_camp_a = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_master_event_running",
			name = "forest_camp",
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
			composition_type = "event_smaller",
			spawner_id = "forest_skaven_camp",
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = 15,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "forest_skaven_camp",
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_a_done",
		},
	},
	forest_skaven_camp_b = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_master_event_running",
			name = "forest_camp",
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
			composition_type = "event_smaller",
			spawner_id = "forest_skaven_camp",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			spawner_id = "forest_skaven_camp",
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4 and count_event_breed("skaven_plague_monk") < 1
			end,
		},
		{
			"delay",
			duration = 15,
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_b_done",
		},
	},
	forest_skaven_camp_c = {
		{
			"enable_bots_in_carry_event",
		},
		{
			"set_master_event_running",
			name = "forest_camp",
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
			composition_type = "event_smaller",
			spawner_id = "forest_skaven_camp",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = 15,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			spawner_id = "forest_skaven_camp",
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 4 and count_event_breed("skaven_slave") < 4
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "forest_skaven_camp_c_done",
		},
	},
	forest_end_event_a = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "forest_finale",
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
			composition_type = "event_small",
			spawner_id = "forest_end_event_a_skaven",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_shields_small",
			spawner_id = "forest_end_event_a_skaven",
		},
		{
			"event_horde",
			composition_type = "plague_monks_small",
			spawner_id = "forest_end_event_a_skaven",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_plague_monk") < 5
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart",
		},
	},
	forest_end_event_b = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "forest_finale",
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
			composition_type = "event_small_chaos",
			spawner_id = "forest_end_event_chaos",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 4 and count_event_breed("chaos_fanatic") < 4
			end,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_small",
			spawner_id = "forest_end_event_chaos",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("chaos_marauder") < 3 and count_event_breed("chaos_fanatic") < 3 and count_event_breed("chaos_raider") < 2
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart",
		},
	},
	forest_end_event_c = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "forest_finale",
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
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			spawner_id = "forest_end_event_c_skaven",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_small",
			spawner_id = "forest_end_event_c_skaven",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("skaven_storm_vermin") < 2
			end,
		},
		{
			"delay",
			duration = {
				3,
				7,
			},
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart",
		},
	},
	forest_end_finale = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "forest_finale",
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
			composition_type = "event_small",
			spawner_id = "forest_end_event_finale",
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			spawner_id = "forest_end_event_chaos",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5
			end,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 5 and count_event_breed("skaven_slave") < 5 and count_event_breed("chaos_warrior") < 2
			end,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_restart",
		},
	},
	forest_end_event_loop = {
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_master_event_running",
			name = "forest_finale",
		},
		{
			"event_horde",
			composition_type = "event_extra_spice_small",
			limit_spawners = 2,
			spawner_id = "forest_end_event",
		},
		{
			"delay",
			duration = 7,
		},
		{
			"continue_when",
			duration = 45,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3 and count_event_breed("skaven_storm_vermin_commander") < 2
			end,
		},
		{
			"delay",
			duration = 4,
		},
		{
			"flow_event",
			flow_event_name = "forest_end_event_loop_restart",
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
