local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_during_event()

	return spawned_enemies
end

local function get_random_table(source)
	local random_number = 1
	random_number = math.round(random_number)
	local random_table = source[random_number]

	return random_table
end

local weighted_random_terror_events = nil
local HARDER = 4
local HARDEST = 5
local gorge_terror_event_1_start = {
	{
		"set_master_event_running",
		name = "gorge_terror_event_1"
	},
	{
		"control_pacing",
		enable = false
	},
	{
		"set_freeze_condition",
		max_active_enemies = 100
	}
}
local gorge_terror_event_1_end = {
	{
		"continue_when",
		condition = function (t)
			return num_spawned_enemies() < 1
		end
	},
	{
		"flow_event",
		flow_event_name = "gorge_terror_event_1_done"
	},
	{
		"control_pacing",
		enable = true
	}
}
local gorge_terror_event_1_wave_1 = {
	{
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "gorge_terror_event_12oc",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_ids = {
				"gorge_terror_event_grotto_a",
				"gorge_terror_event_grotto_b"
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "gorge_terror_event_grotto_a_manual",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner"
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "gorge_terror_event_grotto_b_manual",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_gutter_runner"
			},
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 2
		}
	},
	{
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "gorge_terror_event_12oc",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			spawner_ids = {
				"gorge_terror_event_grotto_a",
				"gorge_terror_event_grotto_b"
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "gorge_terror_event_grotto_a_manual",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "gorge_terror_event_grotto_b_manual",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 2
		}
	},
	{
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger"
		},
		{
			"event_horde",
			spawner_id = "gorge_terror_event_12oc",
			composition_type = "event_large_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			spawner_ids = {
				"gorge_terror_event_grotto_a",
				"gorge_terror_event_grotto_b"
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			composition_type = "bestigors",
			spawner_ids = {
				"gorge_terror_event_grotto_a",
				"gorge_terror_event_grotto_b"
			}
		},
		{
			"event_horde",
			limit_spawners = 1,
			composition_type = "ungor_archers",
			spawner_ids = {
				"gorge_terror_event_grotto_a",
				"gorge_terror_event_grotto_b"
			},
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 2
		}
	}
}
local gorge_terror_event_1_wave_2 = {
	{
		{
			"event_horde",
			spawner_id = "gorge_terror_event_12oc",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawner_ids = {
				"gorge_terror_event_grotto_a",
				"gorge_terror_event_grotto_b"
			}
		},
		{
			"spawn_at_raw",
			spawner_ids = {
				"gorge_terror_event_grotto_a_manual",
				"gorge_terror_event_grotto_b_manual"
			},
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend"
			}
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") == 1 or count_event_breed("skaven_stormfiend") == 1
			end
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("skaven_rat_ogre") < 1 and count_event_breed("skaven_stormfiend") < 1
			end
		},
		{
			"delay",
			duration = 2
		}
	},
	{
		{
			"event_horde",
			spawner_id = "gorge_terror_event_12oc",
			composition_type = "event_large_chaos"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			spawner_ids = {
				"gorge_terror_event_grotto_a",
				"gorge_terror_event_grotto_b"
			}
		},
		{
			"spawn_at_raw",
			spawner_ids = {
				"gorge_terror_event_grotto_a_manual",
				"gorge_terror_event_grotto_b_manual"
			},
			breed_name = {
				"chaos_troll",
				"chaos_spawn"
			}
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("chaos_troll") == 1 or count_event_breed("chaos_spawn") == 1
			end
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("chaos_troll") < 1 and count_event_breed("chaos_spawn") < 1
			end
		},
		{
			"delay",
			duration = 2
		}
	},
	{
		{
			"event_horde",
			spawner_id = "gorge_terror_event_12oc",
			composition_type = "event_large_beastmen"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			spawner_ids = {
				"gorge_terror_event_grotto_a",
				"gorge_terror_event_grotto_b"
			}
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_minotaur",
			spawner_ids = {
				"gorge_terror_event_grotto_a_manual",
				"gorge_terror_event_grotto_b_manual"
			}
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("beastmen_minotaur") == 1
			end
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return count_event_breed("beastmen_minotaur") < 1
			end
		},
		{
			"delay",
			duration = 2
		}
	}
}
local gorge_terror_event_1 = {}

table.append(gorge_terror_event_1, {
	{
		"set_master_event_running",
		name = "gorge_terror_event_1"
	},
	{
		"control_pacing",
		enable = false
	},
	{
		"set_freeze_condition",
		max_active_enemies = 100
	}
})
table.append(gorge_terror_event_1, get_random_table(gorge_terror_event_1_wave_1))
table.append(gorge_terror_event_1, get_random_table(gorge_terror_event_1_wave_2))
table.append(gorge_terror_event_1, {
	{
		"continue_when",
		condition = function (t)
			return num_spawned_enemies() < 1
		end
	},
	{
		"flow_event",
		flow_event_name = "gorge_terror_event_1_done"
	},
	{
		"control_pacing",
		enable = true
	}
})

local terror_event_blueprints = {
	gorge_terror_event_1 = gorge_terror_event_1,
	gorge_terror_event_2 = {
		{
			"set_master_event_running",
			name = "gorge_terror_event_2"
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
			"event_horde",
			spawner_id = "gorge_terror_event_12oc",
			composition_type = "event_small_chaos"
		},
		{
			"event_horde",
			composition_type = "event_large_chaos",
			spawner_ids = {
				"gorge_terror_event_a_9oc",
				"gorge_terror_event_b_9oc",
				"gorge_terror_event_c_9oc"
			}
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"spawn_at_raw",
			spawner_ids = {
				"gorge_terror_event_a_9oc_manual",
				"gorge_terror_event_b_9oc_manual",
				"gorge_terror_event_c_9oc_manual"
			},
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			}
		},
		{
			"spawn_at_raw",
			spawner_id = "gorge_terror_event_3oc_manual",
			breed_name = {
				"chaos_vortex_sorcerer",
				"chaos_corruptor_sorcerer"
			},
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 2
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "gorge_terror_event_2_done"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	gorge_terror_event_4 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "gorge_terror_event_4"
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
			spawner_id = "gorge_terror_event_4",
			composition_type = "event_large"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() <= 25
			end
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "gorge_terror_event_4",
			composition_type = "event_medium"
		},
		{
			"event_horde",
			spawner_id = "gorge_terror_event_4_special",
			composition_type = "plague_monks_medium"
		},
		{
			"spawn_special",
			spawner_id = "gorge_terror_event_4_special",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "gorge_terror_event_4_special",
			difficulty_requirement = HARDER
		},
		{
			"spawn_special",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "gorge_terror_event_4_special",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "gorge_terror_event_4",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_special",
			spawner_id = "gorge_terror_event_4_special",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "gorge_terror_event_4_special",
			composition_type = "plague_monks_small"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_special",
			breed_name = "skaven_pack_master",
			spawner_id = "gorge_terror_event_4_special",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_special",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "gorge_terror_event_4_special",
			difficulty_requirement = HARDER
		},
		{
			"spawn_special",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "gorge_terror_event_4_special",
			difficulty_requirement = CATACLYSM
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "gorge_terror_event_4_done"
		},
		{
			"control_pacing",
			enable = true
		}
	},
	gorge_terror_event_5 = {
		{
			"control_pacing",
			enable = false
		},
		{
			"set_master_event_running",
			name = "gorge_terror_event_5"
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
			spawner_id = "gorge_terror_event_5",
			composition_type = "event_medium"
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() <= 25
			end
		},
		{
			"delay",
			duration = 7
		},
		{
			"event_horde",
			spawner_id = "gorge_terror_event_5",
			composition_type = "event_medium"
		},
		{
			"spawn_special",
			spawner_id = "gorge_terror_event_5_special",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"spawn_special",
			spawner_id = "gorge_terror_event_5_special",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_special",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "gorge_terror_event_5_special",
			difficulty_requirement = HARDER
		},
		{
			"spawn_special",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "gorge_terror_event_5_special",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "gorge_terror_event_5",
			composition_type = "event_medium"
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_special",
			spawner_id = "gorge_terror_event_5_special",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_special",
			spawner_id = "gorge_terror_event_5_special",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_special",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "gorge_terror_event_5_special",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_special",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "gorge_terror_event_5_special",
			difficulty_requirement = HARDER
		},
		{
			"spawn_special",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "gorge_terror_event_5_special",
			difficulty_requirement = CATACLYSM
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "gorge_terror_event_5_done"
		},
		{
			"control_pacing",
			enable = true
		}
	}
}

return terror_event_blueprints
