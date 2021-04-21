local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_during_event()

	return spawned_enemies
end

local HARDER = 4
local terror_event_blueprints = {
	pat_mines_1_terror_event = {
		{
			"set_master_event_running",
			name = "pat_mines_1_arena_survival"
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
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_front",
			composition_type = "chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_front",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_side",
			composition_type = "event_chaos_extra_spice_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "mines_horde_spawners_side_manual",
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
			duration = 120,
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
			flow_event_name = "pat_mines_1_arena_survival_done"
		}
	},
	pat_mines_2_terror_event = {
		{
			"set_master_event_running",
			name = "pat_mines_2_arena_survival"
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
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_front",
			composition_type = "chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_front",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_side",
			composition_type = "event_chaos_extra_spice_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "mines_horde_spawners_side_manual",
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
			duration = 120,
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
			flow_event_name = "pat_mines_2_arena_survival_done"
		}
	},
	pat_mines_3_terror_event = {
		{
			"set_master_event_running",
			name = "pat_mines_3_arena_survival"
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
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_front",
			composition_type = "chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_front",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_side",
			composition_type = "event_chaos_extra_spice_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "mines_horde_spawners_side_manual",
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
			duration = 120,
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
			flow_event_name = "pat_mines_3_arena_survival_done"
		}
	},
	pat_mines_4_terror_event = {
		{
			"set_master_event_running",
			name = "pat_mines_4_arena_survival"
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
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_front",
			composition_type = "chaos_berzerkers_medium"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_front",
			composition_type = "event_medium_chaos"
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners_side",
			composition_type = "event_chaos_extra_spice_small"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "mines_horde_spawners_side_manual",
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
			duration = 120,
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
			flow_event_name = "pat_mines_4_arena_survival_done"
		}
	},
	pat_mines_5_terror_event = {
		{
			"set_master_event_running",
			name = "pat_mines_5_arena_survival"
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
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "mines_horde_spawners_manual",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_special",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_special",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"event_horde",
			spawner_id = "mines_horde_spawners",
			composition_type = "event_large_chaos"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"control_hordes",
			enable = true
		},
		{
			"flow_event",
			flow_event_name = "pat_mines_5_arena_survival_done"
		}
	}
}

return terror_event_blueprints
