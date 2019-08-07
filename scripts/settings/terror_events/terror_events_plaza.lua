local function num_spawned_enemies()
	local spawned_enemies = Managers.state.conflict:spawned_units()

	return #spawned_enemies
end

local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local weighted_random_terror_events = nil
local terror_event_blueprints = {
	plaza_disable_pacing = {
		{
			"control_pacing",
			enable = false
		},
		{
			"control_specials",
			enable = false
		}
	},
	plaza_load_bosses = {
		{
			"force_load_breed_package",
			breed_name = "skaven_rat_ogre"
		},
		{
			"force_load_breed_package",
			breed_name = "skaven_stormfiend"
		},
		{
			"force_load_breed_package",
			breed_name = "chaos_spawn"
		},
		{
			"force_load_breed_package",
			breed_name = "chaos_troll"
		}
	},
	plaza_wave_1 = {
		{
			"set_master_event_running",
			name = "survival"
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
			spawner_id = "directional_a",
			composition_type = "plaza_wave_1_01"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_1_02"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_h",
			difficulty_requirement = HARDER
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "manual_e",
			difficulty_requirement = CATACLYSM
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_1_03"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "skaven_pack_master"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_1_04"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_1_04"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_1_complete"
		}
	},
	plaza_wave_2 = {
		{
			"set_master_event_running",
			name = "survival"
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
			spawner_id = "directional_a",
			composition_type = "plaza_wave_2_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 20
			end
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_2_02"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_c",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_a",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 2
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
			spawner_id = "directional_e",
			composition_type = "plaza_wave_2_03"
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_2_03"
		},
		{
			"delay",
			duration = 7
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_2_04"
		},
		{
			"delay",
			duration = 3
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_k",
			breed_name = "chaos_spawn"
		},
		{
			"delay",
			duration = 4
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_2_05"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_2_05"
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_j",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 2
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_k",
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_f",
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
			flow_event_name = "wave_2_complete"
		}
	},
	plaza_wave_3 = {
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = CATACLYSM
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = CATACLYSM
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 4
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_3_01"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_c",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_gutter_runner"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_a",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_d",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_i",
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_k",
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_b",
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_j",
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_h",
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_f",
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_h",
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_f",
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_i",
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 3
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 4
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_3_02"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 12
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_3_03"
		},
		{
			"event_horde",
			spawner_id = "directional_b",
			composition_type = "plaza_wave_3_03"
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_3_03"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_3_03"
		},
		{
			"delay",
			duration = 6
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"delay",
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_3_04"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_f",
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_k",
			difficulty_requirement = CATACLYSM
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_3_06"
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_3_05"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_3_complete"
		}
	},
	plaza_wave_4 = {
		{
			"set_master_event_running",
			name = "survival"
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
			duration = 3
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_4_01"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_4_01"
		},
		{
			"delay",
			duration = 8
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_e",
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_f",
			difficulty_requirement = CATACLYSM
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_4_02"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_4_02"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 20
			end
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_4_03"
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_4_03"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_k",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_a",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_b",
			difficulty_requirement = HARDEST
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_4_04"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_4_04"
		},
		{
			"delay",
			duration = 6
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 4
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 6
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_4_05"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_4_05"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_4_04"
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_b",
			breed_name = "skaven_pack_master"
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_i",
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_f",
			difficulty_requirement = CATACLYSM
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_4_complete"
		}
	},
	plaza_wave_5 = {
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
		},
		{
			"disable_kick"
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
			spawner_id = "directional_a",
			composition_type = "plaza_wave_5_01"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_a",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_d",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_b",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 2
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_5_02"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_5_02"
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_stormfiend"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_5_03"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_5_04"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_a",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_b",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_d",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_i",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_e",
			difficulty_requirement = HARDEST
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_5_04"
		},
		{
			"delay",
			duration = 10
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_5_05"
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_5_complete"
		}
	},
	plaza_wave_6 = {
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
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
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_6_04"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_6_05"
		},
		{
			"event_horde",
			spawner_id = "directional_b",
			composition_type = "plaza_wave_6_05"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_6_05"
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_6_05"
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_6_05"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_6_05"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 100,
			condition = function (t)
				return num_spawned_enemies() < 8
			end
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_6_01"
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_6_01"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_g",
			difficulty_requirement = HARDER
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_6_02"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_6_02"
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 8
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_k",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_a",
			difficulty_requirement = HARDER
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_b",
			composition_type = "plaza_wave_6_03"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_6_03"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_c",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_e",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_b",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_i",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_a",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_j",
			difficulty_requirement = CATACLYSM
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_c",
			difficulty_requirement = CATACLYSM
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_6_04"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_6_04"
		},
		{
			"delay",
			duration = 12
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return num_spawned_enemies() < 3
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_6_complete"
		}
	},
	plaza_wave_7 = {
		{
			"set_master_event_running",
			name = "survival"
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100
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
			spawner_id = "directional_a",
			composition_type = "plaza_wave_7_01"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_7_01"
		},
		{
			"delay",
			duration = 10
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 8
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_troll",
			spawner_id = "manual_a",
			difficulty_requirement = CATACLYSM
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_7_02"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_7_02"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_7_03"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_7_03"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_7_04"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_7_04"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_h",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_f",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_e",
			difficulty_requirement = HARDEST
		},
		{
			"continue_when",
			duration = 80,
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"delay",
			duration = 5
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_7_05"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_7_05"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_b",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_b",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_f",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_c",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 5
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_7_02"
		},
		{
			"continue_when",
			duration = 180,
			condition = function (t)
				return num_spawned_enemies() < 2
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_7_complete"
		}
	},
	plaza_wave_8 = {
		{
			"set_master_event_running",
			name = "survival"
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
			spawner_id = "directional_a",
			composition_type = "plaza_wave_8_01"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_8_01"
		},
		{
			"delay",
			duration = 20
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "chaos_troll"
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "manual_d",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return num_spawned_enemies() < 6
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_8_02"
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_in",
			composition_type = "plaza_wave_8_02"
		},
		{
			"delay",
			duration = 3
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 8
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_d",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_e",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return num_spawned_enemies() < 6
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_8_03"
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_8_03"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_i",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_e",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_8_02"
		},
		{
			"delay",
			duration = 12
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 6
			end
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_8_01"
		},
		{
			"delay",
			duration = 5
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_g",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_poison_wind_globadier",
			spawner_id = "manual_e",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 5
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 6
			end
		},
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger"
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_8_04"
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_8_04"
		},
		{
			"delay",
			duration = 15
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_pack_master",
			spawner_id = "manual_k",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_pack_master"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_ratling_gunner",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_rat_ogre",
			spawner_id = "manual_a",
			difficulty_requirement = HARDEST
		},
		{
			"delay",
			duration = 8,
			difficulty_requirement = CATACLYSM
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_stormfiend",
			spawner_id = "manual_b",
			difficulty_requirement = CATACLYSM
		},
		{
			"continue_when",
			duration = 120,
			condition = function (t)
				return num_spawned_enemies() < 6
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_8_05"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_8_08"
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_8_08"
		},
		{
			"delay",
			duration = 12
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"play_stinger",
			stinger_name = "enemy_gutterrunner_stinger",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 8
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_a",
			breed_name = "skaven_gutter_runner"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_gutter_runner",
			spawner_id = "manual_c",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_h",
			breed_name = "skaven_poison_wind_globadier"
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_ratling_gunner"
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 6
			end
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_8_06"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_8_06"
		},
		{
			"delay",
			duration = 12
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_a",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_d",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_8_09"
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_8_09"
		},
		{
			"delay",
			duration = 25
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_f",
			breed_name = "skaven_warpfire_thrower"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "skaven_warpfire_thrower",
			spawner_id = "manual_h",
			difficulty_requirement = HARDER
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_8_07"
		},
		{
			"delay",
			duration = 4
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_j",
			breed_name = "chaos_vortex_sorcerer"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_vortex_sorcerer",
			spawner_id = "manual_f",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1
		},
		{
			"spawn_at_raw",
			spawner_id = "manual_k",
			breed_name = "chaos_corruptor_sorcerer"
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDER
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_g",
			difficulty_requirement = HARDER
		},
		{
			"delay",
			duration = 1,
			difficulty_requirement = HARDEST
		},
		{
			"spawn_at_raw",
			breed_name = "chaos_corruptor_sorcerer",
			spawner_id = "manual_f",
			difficulty_requirement = HARDEST
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 10
			end
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_b",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_c",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_e",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_f",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_g",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 1
		},
		{
			"event_horde",
			spawner_id = "directional_h",
			composition_type = "plaza_wave_8_10"
		},
		{
			"delay",
			duration = 15
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_8_02"
		},
		{
			"delay",
			duration = 8
		},
		{
			"continue_when",
			duration = 160,
			condition = function (t)
				return num_spawned_enemies() < 5
			end
		},
		{
			"event_horde",
			spawner_id = "spawner_flush_out",
			composition_type = "plaza_wave_8_05"
		},
		{
			"event_horde",
			spawner_id = "directional_d",
			composition_type = "plaza_wave_8_07"
		},
		{
			"event_horde",
			spawner_id = "directional_a",
			composition_type = "plaza_wave_8_07"
		},
		{
			"delay",
			duration = 10
		},
		{
			"continue_when",
			duration = 300,
			condition = function (t)
				return num_spawned_enemies() < 1
			end
		},
		{
			"flow_event",
			flow_event_name = "wave_8_complete"
		}
	}
}

return terror_event_blueprints, weighted_random_terror_events
