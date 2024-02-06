-- chunkname: @scripts/settings/terror_events/terror_events_prologue.lua

local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local weighted_random_terror_events
local terror_event_blueprints = {
	prologue_well_02 = {
		{
			"spawn_at_raw",
			breed_name = "skaven_dummy_slave",
			spawner_id = "e02_r01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_dummy_slave",
			spawner_id = "e02_r02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_dummy_slave",
			spawner_id = "e02_r03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_dummy_slave",
			spawner_id = "e02_r04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_dummy_slave",
			spawner_id = "e02_r05",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_dummy_slave",
			spawner_id = "e02_r06",
		},
		{
			"flow_event",
			flow_event_name = "prologue_well_02_done",
		},
	},
	prologue_special_ability_event = {
		{
			"spawn_at_raw",
			breed_name = "skaven_slave",
			spawner_id = "ability_cr_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_slave",
			spawner_id = "ability_cr_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_slave",
			spawner_id = "ability_cr_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "ability_sv",
		},
		{
			"flow_event",
			flow_event_name = "prologue_special_ability_event_done",
		},
	},
	prologue_melee_pickup = {
		{
			"set_master_event_running",
			name = "prologue_melee_pickup_roamer",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_tutorial",
			spawner_id = "prologue_melee_pickup",
		},
	},
	prologue_ranged_roamers = {
		{
			"set_master_event_running",
			name = "prologue_ranged_roamers",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_tutorial",
			spawner_id = "ranged_roamer_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_tutorial",
			spawner_id = "ranged_roamer_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_tutorial",
			spawner_id = "ranged_roamer_03",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat_tutorial") < 3
			end,
		},
		{
			"flow_event",
			flow_event_name = "prologue_ranged_roamers_done",
		},
	},
	prologue_ranged_event = {
		{
			"set_master_event_running",
			name = "prologue_ranged",
		},
		{
			"event_horde",
			composition_type = "event_prologue_ranged",
			limit_spawners = 1,
			spawner_id = "prologue_ranged",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 3
			end,
		},
		{
			"flow_event",
			flow_event_name = "prologue_ranged_event_done",
		},
	},
	prologue_nodamage_event = {
		{
			"spawn_at_raw",
			breed_name = "chaos_warrior",
			spawner_id = "nodamage_spawn",
		},
	},
	prologue_nodamage_scaffold_event = {
		{
			"set_master_event_running",
			name = "prologue_nodamage_scaffold",
		},
		{
			"event_horde",
			composition_type = "event_prologue_ranged",
			limit_spawners = 1,
			spawner_id = "prologue_nodamage_scaffold",
		},
	},
	prologue_push_event = {
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat_tutorial",
			spawner_id = "push_poor_rat",
		},
	},
	prologue_block_event = {
		{
			"set_master_event_running",
			name = "prologue_block",
		},
		{
			"event_horde",
			composition_type = "event_prologue_block",
			limit_spawners = 1,
			spawner_id = "prologue_arena_a",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_marauder_tutorial") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "prologue_block_event_done",
		},
	},
	prologue_dodge_event = {
		{
			"set_master_event_running",
			name = "prologue_dodge",
		},
		{
			"event_horde",
			composition_type = "event_prologue_dodge",
			limit_spawners = 1,
			spawner_id = "prologue_arena_b",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_raider_tutorial") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "prologue_dodge_event_done",
		},
	},
	prologue_heavy_attack_event = {
		{
			"set_master_event_running",
			name = "prologue_heavy_attack",
		},
		{
			"event_horde",
			composition_type = "event_prologue_practice_02",
			limit_spawners = 2,
			spawner_id = "prologue_arena_c",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "prologue_heavy_attack_event_done",
		},
	},
	prologue_practice_end = {
		{
			"set_master_event_running",
			name = "prologue_practice_end",
		},
		{
			"event_horde",
			composition_type = "event_prologue_practice_01",
			limit_spawners = 1,
			spawner_id = "prologue_arena_end",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "prologue_practice_end_done",
		},
	},
	prologue_clanrats_event = {
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "light_melee_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "light_melee_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "light_melee_04",
		},
	},
	prologue_roamers_event_01 = {
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_01_roamer_01",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_01_roamer_02",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_01_roamer_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_storm_vermin_commander",
			spawner_id = "group_02_roamer_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "group_02_roamer_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "group_02_roamer_03",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "group_02_roamer_04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "group_02_roamer_05",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_03_roamer_01",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_03_roamer_02",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_03_roamer_03",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_03_roamer_04",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_03_roamer_05",
		},
	},
	prologue_roamers_event_02 = {
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_05_roamer_01",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_05_roamer_02",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_05_roamer_03",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_05_roamer_04",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_05_roamer_05",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "group_07_roamer_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "group_07_roamer_02",
		},
	},
	prologue_roamers_event_03 = {
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_06_roamer_01",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_06_roamer_02",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_06_roamer_03",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_06_roamer_04",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "group_08_roamer_01",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "group_08_roamer_02",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_clan_rat",
			spawner_id = "group_08_roamer_03",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_09_roamer_01",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_09_roamer_02",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_09_roamer_03",
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_marauder",
			spawner_id = "group_09_roamer_04",
		},
	},
	prologue_horde_event = {
		{
			"set_master_event_running",
			name = "prologue_horde",
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
			composition_type = "event_prologue_horde",
			limit_spawners = 8,
			spawner_id = "prologue_horde",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3
			end,
		},
		{
			"flow_event",
			flow_event_name = "prologue_horde_event_done",
		},
	},
	prologue_horde_event_2 = {
		{
			"set_master_event_running",
			name = "prologue_horde_2",
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
			composition_type = "event_prologue_horde",
			limit_spawners = 8,
			spawner_id = "prologue_horde",
		},
	},
	prologue_elevator = {
		{
			"set_master_event_running",
			name = "prologue_elevator",
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_dummy_slave",
			spawner_id = "prologue_elevator_start",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_dummy_slave",
			spawner_id = "prologue_elevator_start",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_dummy_slave",
			spawner_id = "prologue_elevator_start_2",
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_dummy_slave",
			spawner_id = "prologue_elevator_start_2",
		},
		{
			"delay",
			duration = 14.5,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 1,
			spawner_id = "prologue_elevator_03",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_smaller",
			limit_spawners = 1,
			spawner_id = "prologue_elevator_04",
		},
		{
			"flow_event",
			flow_event_name = "prologue_helmgart_chase_done",
		},
	},
	prologue_intro_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			spline_type = "event",
			formations = {
				"prologue_skittergate_patrol",
			},
			splines = {
				"event_1",
			},
		},
	},
}

return terror_event_blueprints, weighted_random_terror_events
