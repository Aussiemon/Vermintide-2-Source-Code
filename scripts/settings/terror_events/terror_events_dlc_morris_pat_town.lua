local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_during_event()

	return spawned_enemies
end

local weighted_random_terror_events = nil
local RECRUIT = 2
local VETERAN = 3
local CHAMPION = 4
local LEGENDARY = 5
local CATACLYSM = 6
local terror_event_blueprints = {
	pat_town_1_arena_event = {
		{
			"set_master_event_running",
			name = "pat_town_1_arena_survival"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "arena_horde_12oc",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_horde_nook_manual",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			spawner_id = "arena_horde_climb",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_horde_12oc_manual",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 1 or count_event_breed("skaven_stormfiend") == 1 or count_event_breed("chaos_troll") == 1 or count_event_breed("chaos_spawn") == 1
			end
		},
		{
			"continue_when",
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1 and count_event_breed("skaven_stormfiend") < 1 and count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "pat_town_arena_path_1_event_survival_done"
		}
	},
	pat_town_2_arena_event = {
		{
			"set_master_event_running",
			name = "pat_town_2_arena_survival"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "arena_horde_3oc",
			composition_type = "event_medium_chaos"
		},
		{
			"event_horde",
			spawner_id = "arena_horde_9oc",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_horde_platform_manual",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_horde_platform_manual",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 60,
			condition = function (t)
				return num_spawned_enemies() < 20
			end
		},
		{
			"event_horde",
			spawner_id = "arena_horde_3oc",
			composition_type = "chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "arena_horde_4oc",
			composition_type = "chaos_warriors"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("chaos_warrior") < 1 and count_event_breed("chaos_berzerker") < 1
			end
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "pat_town_arena_path_2_event_survival_done"
		}
	},
	pat_town_3_arena_event = {
		{
			"set_master_event_running",
			name = "pat_town_3_arena_survival"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_horde_12oc_manual",
			breed_name = {
				"skaven_stormfiend"
			}
		},
		{
			"event_horde",
			spawner_id = "arena_horde_6oc",
			composition_type = "storm_vermin_shields_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_horde_platform_manual",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"event_horde",
			spawner_id = "arena_horde_12oc",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_horde_platform_manual",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier",
				"skaven_ratling_gunner"
			},
			difficulty_amount = {
				hardest = 2,
				hard = 1,
				harder = 2,
				cataclysm = 2,
				normal = 1
			}
		},
		{
			"event_horde",
			spawner_id = "arena_horde_4oc",
			composition_type = "plague_monks_medium"
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "pat_town_arena_path_3_event_survival_done"
		}
	},
	pat_town_4_arena_event = {
		{
			"set_master_event_running",
			name = "pat_town_4_arena_survival"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "arena_horde_12oc",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "arena_horde_7oc",
			composition_type = "chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "arena_horde_6oc",
			composition_type = "chaos_raiders_medium"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "arena_horde_12oc",
			composition_type = "chaos_warriors"
		},
		{
			"delay",
			duration = 10
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "pat_town_arena_path_4_event_survival_done"
		}
	},
	pat_town_5_arena_event = {
		{
			"set_master_event_running",
			name = "pat_town_5_arena_survival"
		},
		{
			"control_pacing",
			enable = false
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"event_horde",
			spawner_id = "arena_horde_12oc",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_horde_3oc_manual",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_horde_12oc_manual",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_horde_9oc_manual",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "arena_horde_nook_manual",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return count_event_breed("skaven_ratling_gunner") < 1
			end
		},
		{
			"control_pacing",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "pat_town_arena_path_5_event_survival_done"
		}
	}
}

return terror_event_blueprints
