local function count_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed(breed_name)
end

local weighted_random_terror_events = nil
local terror_event_blueprints = {
	event_horde = {
		{
			"control_pacing",
			enable = false
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "",
			composition_type = "event_smaller"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			limit_spawners = 2,
			spawner_id = "",
			composition_type = "event_smaller"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	test_raw_spawn = {
		{
			"control_specials",
			enable = false
		},
		{
			"spawn_at_raw",
			spawner_id = "roger",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = 10
		},
		{
			"control_specials",
			enable = true
		}
	},
	test_event_patrol = {
		{
			"spawn_patrol",
			patrol_template = "spline_patrol",
			formations = {
				"escorted_troll"
			},
			splines = {
				"event_1"
			}
		}
	},
	whitebox_dummy_troll_test = {
		{
			"force_load_breed_package",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "test_spawner_1",
			breed_name = "chaos_dummy_troll"
		},
		{
			"spawn_at_raw",
			spawner_id = "test_spawner_2",
			breed_name = "chaos_dummy_troll"
		}
	},
	morja_test_sorcerer_dummies = {
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_1",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_2",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_3",
			breed_name = "chaos_dummy_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "sorcerer_dummy_4",
			breed_name = "chaos_dummy_sorcerer"
		}
	},
	test_spawn_warcamp_exalted_champion = {
		{
			"spawn_at_raw",
			spawner_id = "exalted_champion_spawner",
			breed_name = "chaos_exalted_champion_warcamp"
		}
	},
	test_spawn_grey_seer_stormfiend = {
		{
			"spawn_at_raw",
			spawner_id = "grey_seer_stormfiend_spawner",
			breed_name = "skaven_grey_seer"
		},
		{
			"delay",
			duration = 20
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_stormfiend_boss") < 1
			end
		},
		{
			"set_time_challenge",
			time_challenge_name = "skittergate_speed_event"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_grey_seer") < 1
			end
		},
		{
			"has_completed_time_challenge",
			time_challenge_name = "skittergate_speed_event"
		}
	},
	test_spawn_exalted_sorcerer = {
		{
			"spawn_at_raw",
			spawner_id = "exalted_sorcerer_spawner",
			breed_name = "chaos_exalted_sorcerer"
		}
	},
	test_spawn_skaven_warlord = {
		{
			"spawn_at_raw",
			spawner_id = "skaven_warlord_spawner",
			breed_name = "skaven_storm_vermin_warlord"
		}
	},
	whitebox_combat_event_a = {
		{
			"control_pacing",
			enable = false
		},
		{
			"text",
			text = "Spawning horde",
			duration = 2
		},
		{
			"force_horde"
		},
		{
			"delay",
			duration = {
				5,
				7
			}
		},
		{
			"text",
			text = "Spawning Pack Master",
			duration = 2
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_pack_master"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"text",
			text = "Spawning Rat Ogre",
			duration = 2
		},
		{
			"spawn",
			breed_name = "skaven_rat_ogre"
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"force_horde"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_rat_ogre") == 0
			end
		},
		{
			"delay",
			duration = {
				10,
				15
			}
		},
		{
			"text",
			text = "Wave 2 incoming",
			duration = 2
		},
		{
			"force_horde"
		},
		{
			"text",
			text = "Spawning Globadier",
			duration = 2
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"delay",
			duration = {
				5,
				10
			}
		},
		{
			"text",
			text = "Wave 3 incoming",
			duration = 2
		},
		{
			"text",
			text = "Spawning Gutter Runner",
			duration = 2
		},
		{
			"spawn",
			{
				1,
				2
			},
			breed_name = "skaven_gutter_runner"
		},
		{
			"force_horde"
		},
		{
			"continue_when",
			condition = function (t)
				return count_breed("skaven_clan_rat") < 8
			end
		},
		{
			"text",
			text = "Event done",
			duration = 2
		},
		{
			"control_pacing",
			enable = true
		}
	},
	performance_test_1 = {
		{
			"event_horde",
			spawner_id = "performancetester",
			composition_type = "performance_test"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 0.5
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn",
			{
				1
			},
			breed_name = "skaven_rat_ogre"
		}
	},
	ai_benchmark_cycle = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		},
		{
			"enable_bots_in_carry_event"
		},
		{
			"text",
			text = "Turned off pacing and specials",
			duration = 5
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_slaves"
		},
		{
			"text",
			text = "Spawning 20 slaves (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_clanrat"
		},
		{
			"text",
			text = "Spawning 10 clanrats (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"text",
			text = "Spawning 10 shield clanrats (wait 30 sec until wipe) REMOVED BECAUSE OF CRASH",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_stormvermin"
		},
		{
			"text",
			text = "Spawning 4 storm vermin (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_stormvermin_shield"
		},
		{
			"text",
			text = "Spawning 4 shield storm vermin (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_plague_monks"
		},
		{
			"text",
			text = "Spawning 6 plague monks (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			2,
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"text",
			text = "Spawning 2 globadier",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_ratling_gunner"
		},
		{
			"text",
			text = "Spawning 2 ratling gunner",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_gutter_runner"
		},
		{
			"text",
			text = "Spawning 2 gutter runner",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"text",
			text = "Spawning 2 gutter runner",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "skaven_pack_master"
		},
		{
			"text",
			text = "Spawning 2 pack master (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "skaven_rat_ogre"
		},
		{
			"text",
			text = "Spawning 1 rat ogre (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "skaven_stormfiend"
		},
		{
			"text",
			text = "Spawning 1 stormfiend (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"text",
			text = "TIME FOR CHAOS",
			duration = 5
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_marauder"
		},
		{
			"text",
			text = "Spawning 10 marauders (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_marauder_shield"
		},
		{
			"text",
			text = "Spawning 10 shield marauders (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_berzerker"
		},
		{
			"text",
			text = "Spawning 10 berzerkers (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			limit_spawners = 2,
			composition_type = "ai_benchmark_cycle_chaos_raider"
		},
		{
			"text",
			text = "Spawning 10 raiders (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior1",
			breed_name = "chaos_warrior"
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior2",
			breed_name = "chaos_warrior"
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior3",
			breed_name = "chaos_warrior"
		},
		{
			"spawn_at_raw",
			spawner_id = "chaoswarrior4",
			breed_name = "chaos_warrior"
		},
		{
			"text",
			text = "Spawning 4 warriors (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			2,
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"text",
			text = "Spawning 2 Vortex Sorcerers",
			duration = 10
		},
		{
			"spawn",
			2,
			breed_name = "chaos_plague_sorcerer"
		},
		{
			"text",
			text = "Spawning 2 Plague Sorcerers (wait 30sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "chaos_troll"
		},
		{
			"text",
			text = "Spawning 1 Troll (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn",
			1,
			breed_name = "chaos_spawn"
		},
		{
			"text",
			text = "Spawning 1 Chaos Spawn (wait 30 sec until wipe)",
			duration = 30
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_wipe"
		},
		{
			"delay",
			duration = 1
		},
		{
			"text",
			text = "Restarting",
			duration = 5
		},
		{
			"flow_event",
			flow_event_name = "ai_benchmark_cycle_restart"
		}
	},
	pathfind_test_climb = {
		{
			"event_horde",
			spawner_id = "pathfind_test_climb",
			composition_type = "pathfind_test_light"
		}
	},
	pathfind_test_straight = {
		{
			"event_horde",
			spawner_id = "pathfind_test_straight",
			composition_type = "pathfind_test_light"
		}
	}
}

return terror_event_blueprints, weighted_random_terror_events
