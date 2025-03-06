-- chunkname: @scripts/settings/terror_events/terror_events_dlc_morris_arena_cave.lua

local TerrorEventUtils = require("scripts/settings/terror_events/terror_event_utils")
local HARDEST = TerrorEventUtils.HARDEST
local boss_pre_spawn_func = TerrorEventUtils.add_enhancements_for_difficulty
local terror_event_blueprints = {
	arena_cave_terror = {
		{
			"inject_event",
			event_name = "arena_cave_terror_start",
		},
		{
			"inject_event",
			event_name = "arena_cave_terror_sequence",
		},
		{
			"inject_event",
			event_name = "arena_cave_terror_end",
		},
	},
	arena_cave_terror_sequence = {
		{
			"inject_event",
			event_name_list = {
				"deus_arena_cave_terror_skaven_chaos",
				"deus_arena_cave_terror_chaos_skaven",
			},
			faction_requirement_list = {
				"skaven",
				"chaos",
			},
		},
		{
			"inject_event",
			event_name_list = {
				"deus_arena_cave_terror_skaven_beastmen",
				"deus_arena_cave_terror_beastmen_skaven",
			},
			faction_requirement_list = {
				"skaven",
				"beastmen",
			},
		},
		{
			"inject_event",
			event_name_list = {
				"deus_arena_cave_terror_chaos_beastmen",
				"deus_arena_cave_terror_beastmen_chaos",
			},
			faction_requirement_list = {
				"chaos",
				"beastmen",
			},
		},
	},
	arena_cave_terror_start = {
		{
			"set_master_event_running",
			name = "arena_cave_terror",
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
			"enable_bots_in_carry_event",
		},
		{
			"set_freeze_condition",
			max_active_enemies = 100,
		},
		{
			"set_wwise_override_state",
			name = "terror_mb2",
		},
	},
	arena_cave_terror_end = {
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.boss <= 0 and counter.main <= 0 and counter.elite <= 0
			end,
		},
		{
			"flow_event",
			flow_event_name = "arena_cave_terror_done",
		},
		{
			"disable_bots_in_carry_event",
		},
		{
			"set_wwise_override_state",
			name = "false",
		},
	},
	deus_arena_cave_terror_skaven_chaos = {
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_skaven_wave_1",
			},
		},
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_chaos_wave_2",
			},
		},
	},
	deus_arena_cave_terror_skaven_beastmen = {
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_skaven_wave_1",
			},
		},
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_beastmen_wave_2",
			},
		},
	},
	deus_arena_cave_terror_chaos_skaven = {
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_chaos_wave_1",
			},
		},
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_skaven_wave_2",
			},
		},
	},
	deus_arena_cave_terror_chaos_beastmen = {
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_chaos_wave_1",
			},
		},
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_beastmen_wave_2",
			},
		},
	},
	deus_arena_cave_terror_beastmen_skaven = {
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_beastmen_wave_1",
			},
		},
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_skaven_wave_2",
			},
		},
	},
	deus_arena_cave_terror_beastmen_chaos = {
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_beastmen_wave_1",
			},
		},
		{
			"inject_event",
			event_name_list = {
				"arena_cave_terror_chaos_wave_2",
			},
		},
	},
	arena_cave_terror_skaven_wave_1 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_stinger",
		},
		{
			"flow_event",
			flow_event_name = "arena_cave_terror_skaven_special",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium",
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 20,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_medium",
			limit_spawners = 1,
			spawn_counter_category = "elite",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 10
			end,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 8
			end,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.elite < 4
			end,
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "boss",
			spawner_id = "arena_cave_event",
			breed_name = {
				"skaven_rat_ogre",
				"skaven_stormfiend",
			},
			pre_spawn_func = boss_pre_spawn_func,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_small",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.boss < 1
			end,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 10
			end,
		},
	},
	arena_cave_terror_skaven_wave_2 = {
		{
			"event_horde",
			composition_type = "event_large",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 20,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_medium",
			limit_spawners = 1,
			spawn_counter_category = "elite",
			spawner_id = "arena_cave_event",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 8
			end,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.elite < 4
			end,
		},
		{
			"event_horde",
			composition_type = "storm_vermin_medium",
			limit_spawners = 1,
			spawn_counter_category = "elite",
			spawner_id = "arena_cave_event",
		},
		{
			"event_horde",
			composition_type = "storm_vermin_shields_small",
			limit_spawners = 1,
			spawn_counter_category = "elite",
			spawner_id = "arena_cave_event",
		},
		{
			"event_horde",
			composition_type = "event_medium",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 10,
		},
	},
	arena_cave_terror_chaos_wave_1 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_chaos_stinger",
		},
		{
			"flow_event",
			flow_event_name = "arena_cave_terror_chaos_special",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 8
			end,
		},
		{
			"event_horde",
			composition_type = "military_end_event_berzerkers",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 15,
		},
		{
			"event_horde",
			composition_type = "event_chaos_extra_spice_medium",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 10
			end,
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "boss",
			spawner_id = "arena_cave_event",
			breed_name = {
				"chaos_troll",
				"chaos_spawn",
			},
			pre_spawn_func = boss_pre_spawn_func,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "morris_small_chaos",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "morris_small_chaos",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "morris_small_chaos",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.boss < 1
			end,
		},
		{
			"event_horde",
			composition_type = "morris_small_chaos",
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"event_horde",
			composition_type = "morris_elite_medium_chaos",
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 10
			end,
		},
	},
	arena_cave_terror_chaos_wave_2 = {
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"event_horde",
			composition_type = "military_end_event_berzerkers",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 10
			end,
		},
		{
			"event_horde",
			composition_type = "morris_small_chaos",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium_chaos",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 10
			end,
		},
		{
			"event_horde",
			composition_type = "chaos_warriors",
			limit_spawners = 2,
			spawn_counter_category = "elite",
			spawner_id = "arena_cave_event",
		},
		{
			"event_horde",
			composition_type = "morris_small_chaos",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 10,
		},
	},
	arena_cave_terror_beastmen_wave_1 = {
		{
			"play_stinger",
			stinger_name = "enemy_horde_beastmen_stinger",
		},
		{
			"flow_event",
			flow_event_name = "arena_cave_terror_beastmen_special",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_large_beastmen",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 20,
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "bestigors",
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.elite < 3
			end,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 10
			end,
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_minotaur",
			spawn_counter_category = "boss",
			spawner_id = "arena_cave_event",
			pre_spawn_func = boss_pre_spawn_func,
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "event_medium_beastmen",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 10,
		},
		{
			"event_horde",
			composition_type = "event_large_beastmen",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.boss < 1
			end,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 10
			end,
		},
	},
	arena_cave_terror_beastmen_wave_2 = {
		{
			"event_horde",
			composition_type = "event_large_beastmen",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 10
			end,
		},
		{
			"event_horde",
			composition_type = "bestigors",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"event_horde",
			composition_type = "event_large_beastmen",
			limit_spawners = 2,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 5,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.main < 10
			end,
		},
		{
			"event_horde",
			composition_type = "ungor_archers",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"event_horde",
			composition_type = "bestigors",
			limit_spawners = 1,
			spawn_counter_category = "main",
			spawner_id = "arena_cave_event",
		},
		{
			"delay",
			duration = 10,
		},
	},
	arena_cave_terror_skaven_special = {
		{
			"set_master_event_running",
			name = "arena_cave_terror",
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "special",
			spawner_id = "arena_cave_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_ratling_gunner",
			},
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "special",
			spawner_id = "arena_cave_event",
			breed_name = {
				"skaven_warpfire_thrower",
				"skaven_gutter_runner",
				"skaven_poison_wind_globadier",
				"skaven_pack_master",
				"skaven_ratling_gunner",
			},
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 1,
				hardest = 1,
				normal = 1,
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.special < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "arena_cave_terror_specials_done",
		},
	},
	arena_cave_terror_chaos_special = {
		{
			"set_master_event_running",
			name = "arena_cave_terror",
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "special",
			spawner_id = "arena_cave_event",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
			},
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 2,
				normal = 1,
			},
		},
		{
			"spawn_at_raw",
			spawn_counter_category = "special",
			spawner_id = "arena_cave_event",
			breed_name = {
				"chaos_corruptor_sorcerer",
				"chaos_vortex_sorcerer",
			},
			difficulty_amount = {
				cataclysm = 2,
				hard = 1,
				harder = 2,
				hardest = 1,
				normal = 1,
			},
			difficulty_requirement = HARDEST,
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.special < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "arena_cave_terror_specials_done",
		},
	},
	arena_cave_terror_beastmen_special = {
		{
			"set_master_event_running",
			name = "arena_cave_terror",
		},
		{
			"spawn_at_raw",
			breed_name = "beastmen_standard_bearer",
			spawn_counter_category = "special",
			spawner_id = "arena_cave_event",
			difficulty_amount = {
				cataclysm = 4,
				hard = 1,
				harder = 2,
				hardest = 3,
				normal = 1,
			},
		},
		{
			"delay",
			duration = 10,
		},
		{
			"continue_when_spawned_count",
			duration = 60,
			condition = function (counter)
				return counter.special < 1
			end,
		},
		{
			"flow_event",
			flow_event_name = "arena_cave_terror_specials_done",
		},
	},
}

return {
	terror_event_blueprints,
}
