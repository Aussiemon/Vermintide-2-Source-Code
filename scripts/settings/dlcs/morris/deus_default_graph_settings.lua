﻿-- chunkname: @scripts/settings/dlcs/morris/deus_default_graph_settings.lua

DeusDefaultGraphs = DeusDefaultGraphs or {
	DEFAULT_GRAPH_1 = {
		start = {
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			layout_x = 0,
			layout_y = 0,
			level = "dlc_morris_map",
			level_seed = 111112,
			node_type = "start",
			path = 0,
			run_progress = 0,
			shop = "harmony",
			theme = "wastes",
			weapon_pickup_seed = 111112,
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				pickups = 111112,
				power_ups = 123456,
			},
			next = {
				"forest_wastes",
			},
		},
		forest_wastes = {
			base_level = "pat_forest",
			conflict_settings = "deus_skaven_beastmen",
			layout_x = 0.1,
			layout_y = 0.3,
			level = "pat_forest_wastes_path1",
			level_seed = 111112,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 1,
			run_progress = 0.2,
			shop = "strife",
			theme = "wastes",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				pickups = 111112,
				power_ups = 123456,
			},
			next = {
				"gorge_khorne",
				"mountain_khorne",
			},
		},
		gorge_khorne = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_khorne_champions",
			layout_x = 0.3,
			layout_y = 0.6,
			level = "sig_gorge_khorne_path1",
			level_seed = 111112,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 1,
			run_progress = 0.4,
			shop = "harmony",
			theme = "khorne",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 234567,
				mutator = 123456,
				pickups = 111112,
				power_ups = 234567,
			},
			next = {
				"town_nurgle",
				"bay_khorne",
			},
		},
		mountain_khorne = {
			base_level = "pat_mountain",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_khorne_champions",
			layout_x = 0.3,
			layout_y = 0.2,
			level = "pat_mountain_khorne_path1",
			level_seed = 111112,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 1,
			run_progress = 0.4,
			shop = "harmony",
			theme = "khorne",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 345678,
				mutator = 123456,
				pickups = 111112,
				power_ups = 345678,
			},
			next = {
				"town_nurgle",
				"bay_khorne",
			},
		},
		town_nurgle = {
			base_level = "pat_town",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_corrupted_flesh",
			layout_x = 0.6,
			layout_y = 0.6,
			level = "pat_town_nurgle_path4",
			level_seed = 111112,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 4,
			run_progress = 0.8,
			shop = "fortune",
			theme = "nurgle",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				pickups = 111112,
				power_ups = 567890,
			},
			next = {
				"final",
			},
		},
		bay_khorne = {
			base_level = "pat_bay",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_khorne_champions",
			layout_x = 0.8,
			layout_y = 0.2,
			level = "pat_bay_khorne_path3",
			level_seed = 111112,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 3,
			run_progress = 0.8,
			shop = "fortune",
			theme = "khorne",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				pickups = 111112,
				power_ups = 567890,
			},
			next = {
				"final",
			},
		},
		final = {
			base_level = "arena_ruin",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_khorne_champions",
			layout_x = 0.9,
			layout_y = 0.9,
			level = "arena_ruin_khorne_path1",
			level_seed = 111112,
			level_type = "ARENA",
			node_type = "ingame",
			path = 1,
			run_progress = 0.9999999,
			theme = "khorne",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				pickups = 111112,
				power_ups = 567890,
			},
			next = {},
		},
	},
	DEFAULT_GRAPH_2 = {
		start = {
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			layout_x = 0,
			layout_y = 0,
			level = "dlc_morris_map",
			level_seed = 111112,
			node_type = "start",
			run_progress = 0,
			theme = "wastes",
			weapon_pickup_seed = 111112,
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				pickups = 111112,
				power_ups = 123456,
			},
			next = {
				"town_wastes",
			},
		},
		town_wastes = {
			base_level = "pat_town",
			conflict_settings = "deus_skaven_beastmen",
			layout_x = 0.1,
			layout_y = 0.1,
			level = "pat_town_wastes_path5",
			level_seed = 222222,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 5,
			run_progress = 0.2,
			shop = "strife",
			theme = "wastes",
			weapon_pickup_seed = 222222,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				pickups = 222222,
				power_ups = 222222,
			},
			next = {
				"gorge2",
				"bay2",
			},
		},
		gorge2 = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_khorne_champions",
			layout_x = 0.2,
			layout_y = 0.2,
			level = "sig_gorge_khorne_path2",
			level_seed = 222222,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 2,
			run_progress = 0.4,
			shop = "harmony",
			theme = "khorne",
			weapon_pickup_seed = 222222,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				pickups = 222222,
				power_ups = 222222,
			},
			next = {
				"bay4",
				"forest2",
			},
		},
		bay2 = {
			base_level = "pat_bay",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_khorne_champions",
			layout_x = 0.3,
			layout_y = 0.3,
			level = "pat_bay_khorne_path2",
			level_seed = 222222,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 2,
			run_progress = 0.4,
			shop = "harmony",
			theme = "khorne",
			weapon_pickup_seed = 222222,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				pickups = 222222,
				power_ups = 222222,
			},
			next = {
				"forest2",
				"gorge3",
			},
		},
		bay4 = {
			base_level = "pat_bay",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.4,
			layout_y = 0.4,
			level = "pat_bay_wastes_path4",
			level_seed = 222222,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 4,
			run_progress = 0.8,
			shop = "harmony",
			theme = "wastes",
			weapon_pickup_seed = 222222,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				pickups = 222222,
				power_ups = 222222,
			},
			next = {
				"final",
			},
		},
		forest2 = {
			base_level = "pat_forest",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.5,
			layout_y = 0.5,
			level = "pat_forest_wastes_path2",
			level_seed = 222222,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 2,
			run_progress = 0.7,
			shop = "fortune",
			theme = "wastes",
			weapon_pickup_seed = 222222,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				pickups = 222222,
				power_ups = 222222,
			},
			next = {
				"mountain5",
			},
		},
		mountain5 = {
			base_level = "pat_mountain",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.6,
			layout_y = 0.6,
			level = "pat_mountain_wastes_path5",
			level_seed = 222222,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 5,
			run_progress = 0.9,
			shop = "strife",
			theme = "wastes",
			weapon_pickup_seed = 222222,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				pickups = 222222,
				power_ups = 222222,
			},
			next = {
				"final",
			},
		},
		gorge3 = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_corrupted_flesh",
			layout_x = 0.7,
			layout_y = 0.7,
			level = "sig_gorge_nurgle_path3",
			level_seed = 222222,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 3,
			run_progress = 0.8,
			shop = "strife",
			theme = "nurgle",
			weapon_pickup_seed = 222222,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				pickups = 222222,
				power_ups = 222222,
			},
			next = {
				"final",
			},
		},
		final = {
			base_level = "arena_cave",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_khorne_champions",
			layout_x = 1,
			layout_y = 1,
			level = "arena_cave_khorne_path1",
			level_seed = 222222,
			level_type = "ARENA",
			node_type = "ingame",
			path = 1,
			run_progress = 0.99999,
			theme = "khorne",
			weapon_pickup_seed = 222222,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				pickups = 222222,
				power_ups = 222222,
			},
			next = {},
		},
	},
	ONE_NODE = {
		start = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			key = "start",
			layout_x = 0,
			layout_y = 0,
			level = "sig_gorge_wastes_path1",
			level_seed = 0,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 1,
			run_progress = 0.99,
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				pickups = 0,
			},
			next = {},
		},
	},
	TWO_NODES = {
		start = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			key = "start",
			layout_x = 0,
			layout_y = 0,
			level = "sig_gorge_wastes_path1",
			level_seed = 0,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 1,
			run_progress = 0,
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				pickups = 0,
			},
			next = {
				"final",
			},
		},
		final = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			key = "start",
			layout_x = 0.5,
			layout_y = 0.5,
			level = "sig_gorge_wastes_path1",
			level_seed = 0,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 1,
			run_progress = 0,
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				pickups = 0,
			},
			next = {},
		},
	},
	BENCHMARK_1 = {
		start = {
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			layout_x = 0,
			layout_y = 0,
			level = "dlc_morris_map",
			level_seed = 0,
			node_type = "start",
			path = 0,
			run_progress = 0,
			theme = "wastes",
			weapon_pickup_seed = 0,
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"pacing_benchmark_1",
			},
		},
		pacing_benchmark_1 = {
			base_level = "pat_forest",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.2,
			layout_y = 0.2,
			level = "pat_pacing_benchmark",
			level_seed = 0,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 0,
			run_progress = 0,
			shop = "strife",
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"pacing_benchmark_2",
			},
		},
		pacing_benchmark_2 = {
			base_level = "pat_forest",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.5,
			layout_y = 0.5,
			level = "pat_pacing_benchmark",
			level_seed = 0,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 0,
			run_progress = 0.3333,
			shop = "harmony",
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"pacing_benchmark_3",
			},
		},
		pacing_benchmark_3 = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.7,
			layout_y = 0.7,
			level = "sig_pacing_benchmark",
			level_seed = 0,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 0,
			run_progress = 0.6666,
			shop = "harmony",
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"final",
			},
		},
		final = {
			base_level = "arena_cave",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 1,
			layout_y = 1,
			level = "arena_cave_khorne_path1",
			level_seed = 0,
			level_type = "ARENA",
			node_type = "ingame",
			path = 1,
			run_progress = 0.9999,
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {},
		},
	},
	BENCHMARK_2 = {
		start = {
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			layout_x = 0,
			layout_y = 0,
			level = "dlc_morris_map",
			level_seed = 0,
			node_type = "start",
			path = 0,
			run_progress = 0,
			theme = "wastes",
			weapon_pickup_seed = 0,
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"pacing_benchmark_1",
			},
		},
		pacing_benchmark_1 = {
			base_level = "pat_forest",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.2,
			layout_y = 0.2,
			level = "pat_pacing_benchmark",
			level_seed = 0,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 0,
			run_progress = 0,
			shop = "strife",
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"pacing_benchmark_2",
			},
		},
		pacing_benchmark_2 = {
			base_level = "pat_forest",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.5,
			layout_y = 0.5,
			level = "pat_pacing_benchmark",
			level_seed = 0,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 0,
			run_progress = 0.3333,
			shop = "harmony",
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"pacing_benchmark_3",
			},
		},
		pacing_benchmark_3 = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.7,
			layout_y = 0.7,
			level = "sig_pacing_benchmark",
			level_seed = 0,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 0,
			run_progress = 0.6666,
			shop = "harmony",
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"final",
			},
		},
		final = {
			base_level = "arena_cave",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 1,
			layout_y = 1,
			level = "arena_cave_khorne_path1",
			level_seed = 0,
			level_type = "ARENA",
			node_type = "ingame",
			path = 1,
			run_progress = 0.9999,
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {},
		},
	},
	BENCHMARK_3 = {
		start = {
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			layout_x = 0,
			layout_y = 0,
			level = "dlc_morris_map",
			level_seed = 0,
			node_type = "start",
			path = 0,
			run_progress = 0,
			theme = "wastes",
			weapon_pickup_seed = 0,
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"pacing_benchmark_1",
			},
		},
		pacing_benchmark_1 = {
			base_level = "pat_forest",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.2,
			layout_y = 0.2,
			level = "pat_pacing_benchmark",
			level_seed = 0,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 0,
			run_progress = 0,
			shop = "strife",
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
				"easier_hordes",
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"pacing_benchmark_2",
			},
		},
		pacing_benchmark_2 = {
			base_level = "pat_forest",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.5,
			layout_y = 0.5,
			level = "pat_pacing_benchmark",
			level_seed = 0,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 0,
			run_progress = 0.3333,
			shop = "harmony",
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
				"easier_hordes",
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"pacing_benchmark_3",
			},
		},
		pacing_benchmark_3 = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.7,
			layout_y = 0.7,
			level = "sig_pacing_benchmark",
			level_seed = 0,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 0,
			run_progress = 0.6666,
			shop = "harmony",
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"final",
			},
		},
		final = {
			base_level = "arena_cave",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 1,
			layout_y = 1,
			level = "arena_cave_khorne_path1",
			level_seed = 0,
			level_type = "ARENA",
			node_type = "ingame",
			path = 1,
			run_progress = 0.9999,
			theme = "wastes",
			weapon_pickup_seed = 0,
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {},
		},
	},
	CURSED_WORLD = {
		start = {
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			layout_x = 0,
			layout_y = 0,
			level = "dlc_morris_map",
			level_seed = 111112,
			node_type = "start",
			path = 0,
			run_progress = 0,
			shop = "harmony",
			theme = "wastes",
			weapon_pickup_seed = 111112,
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				pickups = 111112,
				power_ups = 123456,
			},
			next = {
				"forest_tzeentch",
			},
		},
		forest_tzeentch = {
			base_level = "pat_forest",
			conflict_settings = "deus_skaven_beastmen",
			curse = "curse_egg_of_tzeentch",
			layout_x = 0.1,
			layout_y = 0.3,
			level = "pat_forest_wastes_path1",
			level_seed = 111112,
			level_type = "TRAVEL",
			node_type = "ingame",
			path = 1,
			run_progress = 0.2,
			shop = "strife",
			theme = "tzeentch",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				pickups = 111112,
				power_ups = 123456,
			},
			next = {
				"gorge_nurgle",
			},
		},
		gorge_nurgle = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_corrupted_flesh",
			layout_x = 0.3,
			layout_y = 0.6,
			level = "sig_gorge_khorne_path1",
			level_seed = 111112,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 1,
			run_progress = 0.4,
			shop = "harmony",
			theme = "nurgle",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 234567,
				mutator = 123456,
				pickups = 111112,
				power_ups = 234567,
			},
			next = {
				"bay_khorne",
			},
		},
		bay_khorne = {
			base_level = "pat_bay",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_skulls_of_fury",
			layout_x = 0.8,
			layout_y = 0.2,
			level = "pat_bay_khorne_path3",
			level_seed = 111112,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 3,
			run_progress = 0.8,
			shop = "fortune",
			theme = "khorne",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				pickups = 111112,
				power_ups = 567890,
			},
			next = {
				"final",
			},
		},
		final = {
			base_level = "arena_ruin",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_empathy",
			layout_x = 0.9,
			layout_y = 0.9,
			level = "arena_ruin_khorne_path1",
			level_seed = 111112,
			level_type = "ARENA",
			node_type = "ingame",
			path = 1,
			run_progress = 0.9999999,
			theme = "slaanesh",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				pickups = 111112,
				power_ups = 567890,
			},
			next = {},
		},
	},
	SHOPPING_WORLD = {
		start = {
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			layout_x = 0,
			layout_y = 0,
			level = "dlc_morris_map",
			level_seed = 111112,
			node_type = "start",
			path = 0,
			run_progress = 0,
			shop = "harmony",
			theme = "wastes",
			weapon_pickup_seed = 111112,
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				pickups = 111112,
				power_ups = 123456,
			},
			next = {
				"forest_wastes",
			},
		},
		forest_wastes = {
			base_level = "shop_strife",
			conflict_settings = "deus_skaven_beastmen",
			layout_x = 0.1,
			layout_y = 0.3,
			level = "shop_strife",
			level_seed = 111112,
			level_type = "SHOP",
			node_type = "shop",
			path = 0,
			run_progress = 0.2,
			shop = "strife",
			theme = "wastes",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				pickups = 111112,
				power_ups = 123456,
			},
			next = {
				"gorge_khorne",
				"mountain_khorne",
			},
		},
		gorge_khorne = {
			base_level = "shop_strife",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.3,
			layout_y = 0.6,
			level = "shop_strife",
			level_seed = 111112,
			level_type = "SHOP",
			node_type = "shop",
			path = 0,
			run_progress = 0.4,
			theme = "wastes",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 234567,
				mutator = 123456,
				pickups = 111112,
				power_ups = 234567,
			},
			next = {
				"town_nurgle",
				"bay_khorne",
			},
		},
		mountain_khorne = {
			base_level = "shop_strife",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.3,
			layout_y = 0.2,
			level = "shop_strife",
			level_seed = 111112,
			level_type = "SHOP",
			node_type = "ingame",
			path = 0,
			run_progress = 0.4,
			theme = "wastes",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 345678,
				mutator = 123456,
				pickups = 111112,
				power_ups = 345678,
			},
			next = {
				"town_nurgle",
				"bay_khorne",
			},
		},
		town_nurgle = {
			base_level = "shop_strife",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.6,
			layout_y = 0.6,
			level = "shop_strife",
			level_seed = 111112,
			level_type = "SHOP",
			node_type = "shop",
			path = 0,
			run_progress = 0.8,
			theme = "wastes",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				pickups = 111112,
				power_ups = 567890,
			},
			next = {
				"final",
			},
		},
		bay_khorne = {
			base_level = "shop_strife",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.8,
			layout_y = 0.2,
			level = "shop_strife",
			level_seed = 111112,
			level_type = "SHOP",
			node_type = "shop",
			path = 0,
			run_progress = 0.8,
			theme = "wastes",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				pickups = 111112,
				power_ups = 567890,
			},
			next = {
				"final",
			},
		},
		final = {
			base_level = "arena_ruin",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_khorne_champions",
			layout_x = 0.9,
			layout_y = 0.9,
			level = "arena_ruin_khorne_path1",
			level_seed = 111112,
			level_type = "ARENA",
			node_type = "ingame",
			path = 1,
			run_progress = 0.9999999,
			theme = "khorne",
			weapon_pickup_seed = 111112,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				pickups = 111112,
				power_ups = 567890,
			},
			next = {},
		},
	},
	BELAKOR_VERTICAL_SLICE = {
		start = {
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			layout_x = 0.1,
			layout_y = 0.1,
			level = "dlc_morris_map",
			level_seed = 0,
			node_type = "start",
			path = 0,
			run_progress = 0,
			theme = "wastes",
			weapon_pickup_seed = 0,
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"node_1",
			},
		},
		node_1 = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_shadow_homing_skulls",
			layout_x = 0.3,
			layout_y = 0.3,
			level = "sig_gorge_belakor_path4",
			level_seed = 0,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 0,
			run_progress = 0,
			theme = "belakor",
			weapon_pickup_seed = 0,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"node_2",
			},
		},
		node_2 = {
			base_level = "sig_gorge",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_belakor_totems",
			layout_x = 0.5,
			layout_y = 0.5,
			level = "sig_gorge_belakor_path4",
			level_seed = 0,
			level_type = "SIGNATURE",
			node_type = "ingame",
			path = 0,
			run_progress = 0.3,
			theme = "belakor",
			weapon_pickup_seed = 0,
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"final",
			},
		},
		final = {
			base_level = "arena_belakor",
			conflict_settings = "deus_skaven_chaos",
			layout_x = 0.9,
			layout_y = 0.9,
			level = "arena_belakor",
			level_seed = 0,
			level_type = "ARENA",
			node_type = "ingame",
			path = 0,
			run_progress = 0.9999,
			theme = "belakor",
			weapon_pickup_seed = 0,
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {},
		},
	},
	BELAKOR_ONLY_NEW_ARENA = {
		start = {
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			layout_x = 0.1,
			layout_y = 0.1,
			level = "dlc_morris_map",
			level_seed = 0,
			node_type = "start",
			path = 0,
			run_progress = 0,
			theme = "wastes",
			weapon_pickup_seed = 0,
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"node_1",
			},
		},
		node_1 = {
			base_level = "arena_belakor",
			conflict_settings = "deus_skaven_chaos",
			grant_random_power_up_count = 2,
			layout_x = 0.3,
			layout_y = 0.3,
			level = "arena_belakor",
			level_seed = 0,
			level_type = "ARENA",
			node_type = "ingame",
			path = 0,
			run_progress = 0,
			terror_event_power_up_rarity = "unique",
			theme = "belakor",
			weapon_pickup_seed = 0,
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				pickups = 0,
				power_ups = 0,
			},
			next = {
				"final",
			},
		},
		final = {
			base_level = "arena_ruin",
			conflict_settings = "deus_skaven_chaos",
			curse = "curse_khorne_champions",
			layout_x = 0.9,
			layout_y = 0.9,
			level = "arena_ruin_khorne_path1",
			level_seed = 111112,
			level_type = "ARENA",
			node_type = "ingame",
			path = 1,
			run_progress = 0.9999999,
			theme = "khorne",
			weapon_pickup_seed = 111112,
			mutators = {},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				pickups = 111112,
				power_ups = 567890,
			},
			next = {},
		},
	},
}
DeusDebugShrineNodeGraph = DeusDebugShrineNodeGraph or {
	start = {
		base_level = "dlc_morris_map",
		conflict_settings = "disabled",
		layout_x = 0,
		layout_y = 0,
		level = "dlc_morris_map",
		level_seed = 111112,
		level_type = "START",
		node_type = "start",
		path = 0,
		run_progress = 0,
		theme = "wastes",
		weapon_pickup_seed = 111112,
		system_seeds = {
			blessings = 123456,
			mutator = 123456,
			pickups = 111112,
			power_ups = 123456,
		},
		next = {
			"shrine1",
			"shrine2",
			"shrine3",
		},
	},
	shrine1 = {
		base_level = "shop_strife",
		conflict_settings = "deus_skaven_beastmen",
		layout_x = 0,
		layout_y = 0.5,
		level = "shop_strife",
		level_seed = 111112,
		level_type = "SHOP",
		node_type = "shop",
		path = 0,
		run_progress = 0,
		theme = "wastes",
		weapon_pickup_seed = 111112,
		system_seeds = {
			blessings = 123456,
			mutator = 123456,
			pickups = 111112,
			power_ups = 123456,
		},
		next = {
			"final",
		},
	},
	shrine2 = {
		base_level = "shop_harmony",
		conflict_settings = "deus_skaven_beastmen",
		layout_x = 0.5,
		layout_y = 0.5,
		level = "shop_harmony",
		level_seed = 111112,
		level_type = "SHOP",
		node_type = "shop",
		path = 0,
		run_progress = 0,
		theme = "wastes",
		weapon_pickup_seed = 111112,
		system_seeds = {
			blessings = 123456,
			mutator = 123456,
			pickups = 111112,
			power_ups = 123456,
		},
		next = {
			"final",
		},
	},
	shrine3 = {
		base_level = "shop_fortune",
		conflict_settings = "deus_skaven_beastmen",
		layout_x = 0.5,
		layout_y = 0,
		level = "shop_fortune",
		level_seed = 111112,
		level_type = "SHOP",
		node_type = "shop",
		path = 0,
		run_progress = 0,
		theme = "wastes",
		weapon_pickup_seed = 111112,
		system_seeds = {
			blessings = 123456,
			mutator = 123456,
			pickups = 111112,
			power_ups = 123456,
		},
		next = {
			"final",
		},
	},
	final = {
		base_level = "sig_gorge",
		conflict_settings = "deus_skaven_chaos",
		key = "final",
		layout_x = 1,
		layout_y = 1,
		level = "sig_gorge_wastes_path1",
		level_seed = 0,
		level_type = "SIGNATURE",
		node_type = "ingame",
		path = 1,
		run_progress = 0,
		theme = "wastes",
		weapon_pickup_seed = 0,
		mutators = {
			"deus_pacing_tweak",
			"deus_difficulty_tweak",
		},
		system_seeds = {
			pickups = 0,
		},
		next = {},
	},
}
DeusDebugSpecificNodeGraph = DeusDebugSpecificNodeGraph or {
	start = {
		base_level = "arena_cave",
		conflict_settings = "deus_skaven_chaos",
		key = "start",
		layout_x = 0,
		layout_y = 0,
		level = "TO_BE_REPLACED_IN_CODE",
		level_seed = 0,
		level_type = "TO_BE_REPLACED_IN_CODE",
		node_type = "ingame",
		path = 0,
		run_progress = 0,
		terror_event_power_up = "stamina",
		terror_event_power_up_rarity = "rare",
		theme = "wastes",
		weapon_pickup_seed = 0,
		mutators = {
			"deus_pacing_tweak",
			"deus_difficulty_tweak",
		},
		system_seeds = {
			pickups = 0,
		},
		next = {},
	},
}

for seed, graph in pairs(DeusDefaultGraphs) do
	for id, node_data in pairs(graph) do
		node_data.key = id
	end
end
