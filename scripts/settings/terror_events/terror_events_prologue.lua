local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local weighted_random_terror_events = nil
local terror_event_blueprints = {
	prologue_well_02 = {
		{
			"spawn_at_raw",
			spawner_id = "e02_r01",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r02",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r03",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r04",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r05",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "e02_r06",
			breed_name = "skaven_dummy_slave"
		},
		{
			"flow_event",
			flow_event_name = "prologue_well_02_done"
		}
	},
	prologue_special_ability_event = {
		{
			"spawn_at_raw",
			spawner_id = "ability_cr_01",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "ability_cr_02",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "ability_cr_03",
			breed_name = "skaven_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "ability_sv",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"flow_event",
			flow_event_name = "prologue_special_ability_event_done"
		}
	},
	prologue_melee_pickup = {
		{
			"set_master_event_running",
			name = "prologue_melee_pickup_roamer"
		},
		{
			"spawn_at_raw",
			spawner_id = "prologue_melee_pickup",
			breed_name = "skaven_clan_rat_tutorial"
		}
	},
	prologue_ranged_roamers = {
		{
			"set_master_event_running",
			name = "prologue_ranged_roamers"
		},
		{
			"spawn_at_raw",
			spawner_id = "ranged_roamer_01",
			breed_name = "skaven_clan_rat_tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "ranged_roamer_02",
			breed_name = "skaven_clan_rat_tutorial"
		},
		{
			"spawn_at_raw",
			spawner_id = "ranged_roamer_03",
			breed_name = "skaven_clan_rat_tutorial"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_clan_rat_tutorial") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_ranged_roamers_done"
		}
	},
	prologue_ranged_event = {
		{
			"set_master_event_running",
			name = "prologue_ranged"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_ranged",
			composition_type = "event_prologue_ranged"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_ranged_event_done"
		}
	},
	prologue_nodamage_event = {
		{
			"spawn_at_raw",
			spawner_id = "nodamage_spawn",
			breed_name = "chaos_warrior"
		}
	},
	prologue_nodamage_scaffold_event = {
		{
			"set_master_event_running",
			name = "prologue_nodamage_scaffold"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_nodamage_scaffold",
			composition_type = "event_prologue_ranged"
		}
	},
	prologue_push_event = {
		{
			"spawn_at_raw",
			spawner_id = "push_poor_rat",
			breed_name = "skaven_clan_rat_tutorial"
		}
	},
	prologue_block_event = {
		{
			"set_master_event_running",
			name = "prologue_block"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena_a",
			composition_type = "event_prologue_block"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_marauder_tutorial") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_block_event_done"
		}
	},
	prologue_dodge_event = {
		{
			"set_master_event_running",
			name = "prologue_dodge"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena_b",
			composition_type = "event_prologue_dodge"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("chaos_raider_tutorial") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_dodge_event_done"
		}
	},
	prologue_heavy_attack_event = {
		{
			"set_master_event_running",
			name = "prologue_heavy_attack"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "prologue_arena_c",
			composition_type = "event_prologue_practice_02"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_slave") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_heavy_attack_event_done"
		}
	},
	prologue_practice_end = {
		{
			"set_master_event_running",
			name = "prologue_practice_end"
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_arena_end",
			composition_type = "event_prologue_practice_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_practice_end_done"
		}
	},
	prologue_clanrats_event = {
		{
			"spawn_at_raw",
			spawner_id = "light_melee_01",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "light_melee_03",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "light_melee_04",
			breed_name = "skaven_clan_rat"
		}
	},
	prologue_roamers_event_01 = {
		{
			"spawn_at_raw",
			spawner_id = "group_01_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_01_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_01_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_01",
			breed_name = "skaven_storm_vermin_commander"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_02",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_03",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_04",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_02_roamer_05",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_04",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_03_roamer_05",
			breed_name = "chaos_marauder"
		}
	},
	prologue_roamers_event_02 = {
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_04",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_05_roamer_05",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_07_roamer_01",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_07_roamer_02",
			breed_name = "skaven_clan_rat"
		}
	},
	prologue_roamers_event_03 = {
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_06_roamer_04",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_08_roamer_01",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_08_roamer_02",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_08_roamer_03",
			breed_name = "skaven_clan_rat"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_01",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_02",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_03",
			breed_name = "chaos_marauder"
		},
		{
			"spawn_at_raw",
			spawner_id = "group_09_roamer_04",
			breed_name = "chaos_marauder"
		}
	},
	prologue_horde_event = {
		{
			"set_master_event_running",
			name = "prologue_horde"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "prologue_horde",
			composition_type = "event_prologue_horde"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return count_event_breed("skaven_clan_rat") < 3 and count_event_breed("skaven_slave") < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "prologue_horde_event_done"
		}
	},
	prologue_horde_event_2 = {
		{
			"set_master_event_running",
			name = "prologue_horde_2"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 8,
			spawner_id = "prologue_horde",
			composition_type = "event_prologue_horde"
		}
	},
	prologue_elevator = {
		{
			"set_master_event_running",
			name = "prologue_elevator"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"spawn_at_raw",
			spawner_id = "prologue_elevator_start",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "prologue_elevator_start",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "prologue_elevator_start_2",
			breed_name = "skaven_dummy_slave"
		},
		{
			"spawn_at_raw",
			spawner_id = "prologue_elevator_start_2",
			breed_name = "skaven_dummy_slave"
		},
		{
			"delay",
			duration = 14.5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_elevator_03",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 1,
			spawner_id = "prologue_elevator_04",
			composition_type = "event_smaller"
		},
		{
			"flow_event",
			flow_event_name = "prologue_helmgart_chase_done"
		}
	},
	prologue_intro_patrol = {
		{
			"spawn_patrol",
			spline_type = "event",
			patrol_template = "spline_patrol",
			formations = {
				"prologue_skittergate_patrol"
			},
			splines = {
				"event_1"
			}
		}
	}
}

return terror_event_blueprints, weighted_random_terror_events
