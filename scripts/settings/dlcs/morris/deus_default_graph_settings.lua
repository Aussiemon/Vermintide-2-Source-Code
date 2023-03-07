DeusDefaultGraphs = DeusDefaultGraphs or {
	DEFAULT_GRAPH_1 = {
		start = {
			path = 0,
			layout_x = 0,
			weapon_pickup_seed = 111112,
			theme = "wastes",
			node_type = "start",
			level_seed = 111112,
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			shop = "harmony",
			layout_y = 0,
			run_progress = 0,
			level = "dlc_morris_map",
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				power_ups = 123456,
				pickups = 111112
			},
			next = {
				"forest_wastes"
			}
		},
		forest_wastes = {
			path = 1,
			layout_x = 0.1,
			theme = "wastes",
			weapon_pickup_seed = 111112,
			node_type = "ingame",
			level_seed = 111112,
			base_level = "pat_forest",
			run_progress = 0.2,
			shop = "strife",
			layout_y = 0.3,
			level_type = "TRAVEL",
			conflict_settings = "deus_skaven_beastmen",
			level = "pat_forest_wastes_path1",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				power_ups = 123456,
				pickups = 111112
			},
			next = {
				"gorge_khorne",
				"mountain_khorne"
			}
		},
		gorge_khorne = {
			run_progress = 0.4,
			curse = "curse_khorne_champions",
			weapon_pickup_seed = 111112,
			base_level = "sig_gorge",
			level_seed = 111112,
			path = 1,
			layout_y = 0.6,
			level = "sig_gorge_khorne_path1",
			layout_x = 0.3,
			theme = "khorne",
			node_type = "ingame",
			conflict_settings = "deus_skaven_chaos",
			shop = "harmony",
			level_type = "SIGNATURE",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 234567,
				mutator = 123456,
				power_ups = 234567,
				pickups = 111112
			},
			next = {
				"town_nurgle",
				"bay_khorne"
			}
		},
		mountain_khorne = {
			run_progress = 0.4,
			curse = "curse_khorne_champions",
			weapon_pickup_seed = 111112,
			base_level = "pat_mountain",
			level_seed = 111112,
			path = 1,
			layout_y = 0.2,
			level = "pat_mountain_khorne_path1",
			layout_x = 0.3,
			theme = "khorne",
			node_type = "ingame",
			conflict_settings = "deus_skaven_chaos",
			shop = "harmony",
			level_type = "TRAVEL",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 345678,
				mutator = 123456,
				power_ups = 345678,
				pickups = 111112
			},
			next = {
				"town_nurgle",
				"bay_khorne"
			}
		},
		town_nurgle = {
			run_progress = 0.8,
			curse = "curse_corrupted_flesh",
			weapon_pickup_seed = 111112,
			base_level = "pat_town",
			level_seed = 111112,
			path = 4,
			layout_y = 0.6,
			level = "pat_town_nurgle_path4",
			layout_x = 0.6,
			theme = "nurgle",
			node_type = "ingame",
			conflict_settings = "deus_skaven_chaos",
			shop = "fortune",
			level_type = "TRAVEL",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				power_ups = 567890,
				pickups = 111112
			},
			next = {
				"final"
			}
		},
		bay_khorne = {
			run_progress = 0.8,
			curse = "curse_khorne_champions",
			weapon_pickup_seed = 111112,
			base_level = "pat_bay",
			level_seed = 111112,
			path = 3,
			layout_y = 0.2,
			level = "pat_bay_khorne_path3",
			layout_x = 0.8,
			theme = "khorne",
			node_type = "ingame",
			conflict_settings = "deus_skaven_chaos",
			shop = "fortune",
			level_type = "SIGNATURE",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				power_ups = 567890,
				pickups = 111112
			},
			next = {
				"final"
			}
		},
		final = {
			path = 1,
			curse = "curse_khorne_champions",
			weapon_pickup_seed = 111112,
			theme = "khorne",
			node_type = "ingame",
			level_seed = 111112,
			base_level = "arena_ruin",
			layout_x = 0.9,
			run_progress = 0.9999999,
			layout_y = 0.9,
			level_type = "ARENA",
			conflict_settings = "deus_skaven_chaos",
			level = "arena_ruin_khorne_path1",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				power_ups = 567890,
				pickups = 111112
			},
			next = {}
		}
	},
	DEFAULT_GRAPH_2 = {
		start = {
			weapon_pickup_seed = 111112,
			layout_x = 0,
			theme = "wastes",
			conflict_settings = "disabled",
			node_type = "start",
			level_seed = 111112,
			base_level = "dlc_morris_map",
			layout_y = 0,
			run_progress = 0,
			level = "dlc_morris_map",
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				power_ups = 123456,
				pickups = 111112
			},
			next = {
				"town_wastes"
			}
		},
		town_wastes = {
			path = 5,
			layout_x = 0.1,
			theme = "wastes",
			weapon_pickup_seed = 222222,
			node_type = "ingame",
			level_seed = 222222,
			base_level = "pat_town",
			run_progress = 0.2,
			shop = "strife",
			layout_y = 0.1,
			level_type = "TRAVEL",
			conflict_settings = "deus_skaven_beastmen",
			level = "pat_town_wastes_path5",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				power_ups = 222222,
				pickups = 222222
			},
			next = {
				"gorge2",
				"bay2"
			}
		},
		gorge2 = {
			run_progress = 0.4,
			curse = "curse_khorne_champions",
			weapon_pickup_seed = 222222,
			base_level = "sig_gorge",
			level_seed = 222222,
			path = 2,
			layout_y = 0.2,
			level = "sig_gorge_khorne_path2",
			layout_x = 0.2,
			theme = "khorne",
			node_type = "ingame",
			conflict_settings = "deus_skaven_chaos",
			shop = "harmony",
			level_type = "SIGNATURE",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				power_ups = 222222,
				pickups = 222222
			},
			next = {
				"bay4",
				"forest2"
			}
		},
		bay2 = {
			run_progress = 0.4,
			curse = "curse_khorne_champions",
			weapon_pickup_seed = 222222,
			base_level = "pat_bay",
			level_seed = 222222,
			path = 2,
			layout_y = 0.3,
			level = "pat_bay_khorne_path2",
			layout_x = 0.3,
			theme = "khorne",
			node_type = "ingame",
			conflict_settings = "deus_skaven_chaos",
			shop = "harmony",
			level_type = "SIGNATURE",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				power_ups = 222222,
				pickups = 222222
			},
			next = {
				"forest2",
				"gorge3"
			}
		},
		bay4 = {
			path = 4,
			layout_x = 0.4,
			theme = "wastes",
			weapon_pickup_seed = 222222,
			node_type = "ingame",
			level_seed = 222222,
			base_level = "pat_bay",
			run_progress = 0.8,
			shop = "harmony",
			layout_y = 0.4,
			level_type = "SIGNATURE",
			conflict_settings = "deus_skaven_chaos",
			level = "pat_bay_wastes_path4",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				power_ups = 222222,
				pickups = 222222
			},
			next = {
				"final"
			}
		},
		forest2 = {
			path = 2,
			layout_x = 0.5,
			theme = "wastes",
			weapon_pickup_seed = 222222,
			node_type = "ingame",
			level_seed = 222222,
			base_level = "pat_forest",
			run_progress = 0.7,
			shop = "fortune",
			layout_y = 0.5,
			level_type = "TRAVEL",
			conflict_settings = "deus_skaven_chaos",
			level = "pat_forest_wastes_path2",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				power_ups = 222222,
				pickups = 222222
			},
			next = {
				"mountain5"
			}
		},
		mountain5 = {
			path = 5,
			layout_x = 0.6,
			theme = "wastes",
			weapon_pickup_seed = 222222,
			node_type = "ingame",
			level_seed = 222222,
			base_level = "pat_mountain",
			run_progress = 0.9,
			shop = "strife",
			layout_y = 0.6,
			level_type = "TRAVEL",
			conflict_settings = "deus_skaven_chaos",
			level = "pat_mountain_wastes_path5",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				power_ups = 222222,
				pickups = 222222
			},
			next = {
				"final"
			}
		},
		gorge3 = {
			run_progress = 0.8,
			curse = "curse_corrupted_flesh",
			weapon_pickup_seed = 222222,
			base_level = "sig_gorge",
			level_seed = 222222,
			path = 3,
			layout_y = 0.7,
			level = "sig_gorge_nurgle_path3",
			layout_x = 0.7,
			theme = "nurgle",
			node_type = "ingame",
			conflict_settings = "deus_skaven_chaos",
			shop = "strife",
			level_type = "SIGNATURE",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				power_ups = 222222,
				pickups = 222222
			},
			next = {
				"final"
			}
		},
		final = {
			path = 1,
			curse = "curse_khorne_champions",
			weapon_pickup_seed = 222222,
			theme = "khorne",
			node_type = "ingame",
			level_seed = 222222,
			base_level = "arena_cave",
			layout_x = 1,
			run_progress = 0.99999,
			layout_y = 1,
			level_type = "ARENA",
			conflict_settings = "deus_skaven_chaos",
			level = "arena_cave_khorne_path1",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 222222,
				mutator = 222222,
				power_ups = 222222,
				pickups = 222222
			},
			next = {}
		}
	},
	ONE_NODE = {
		start = {
			path = 1,
			key = "start",
			weapon_pickup_seed = 0,
			theme = "wastes",
			run_progress = 0.99,
			node_type = "ingame",
			level_seed = 0,
			base_level = "sig_gorge",
			layout_x = 0,
			conflict_settings = "deus_skaven_chaos",
			layout_y = 0,
			level_type = "SIGNATURE",
			level = "sig_gorge_wastes_path1",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				pickups = 0
			},
			next = {}
		}
	},
	TWO_NODES = {
		start = {
			path = 1,
			key = "start",
			weapon_pickup_seed = 0,
			theme = "wastes",
			run_progress = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "sig_gorge",
			layout_x = 0,
			conflict_settings = "deus_skaven_chaos",
			layout_y = 0,
			level_type = "SIGNATURE",
			level = "sig_gorge_wastes_path1",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				pickups = 0
			},
			next = {
				"final"
			}
		},
		final = {
			path = 1,
			key = "start",
			weapon_pickup_seed = 0,
			theme = "wastes",
			run_progress = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "sig_gorge",
			layout_x = 0.5,
			conflict_settings = "deus_skaven_chaos",
			layout_y = 0.5,
			level_type = "SIGNATURE",
			level = "sig_gorge_wastes_path1",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				pickups = 0
			},
			next = {}
		}
	},
	BENCHMARK_1 = {
		start = {
			base_level = "dlc_morris_map",
			layout_x = 0,
			weapon_pickup_seed = 0,
			theme = "wastes",
			node_type = "start",
			level_seed = 0,
			path = 0,
			conflict_settings = "disabled",
			layout_y = 0,
			run_progress = 0,
			level = "dlc_morris_map",
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"pacing_benchmark_1"
			}
		},
		pacing_benchmark_1 = {
			path = 0,
			layout_x = 0.2,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "pat_forest",
			run_progress = 0,
			shop = "strife",
			layout_y = 0.2,
			level_type = "TRAVEL",
			conflict_settings = "deus_skaven_chaos",
			level = "pat_pacing_benchmark",
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"pacing_benchmark_2"
			}
		},
		pacing_benchmark_2 = {
			path = 0,
			layout_x = 0.5,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "pat_forest",
			run_progress = 0.3333,
			shop = "harmony",
			layout_y = 0.5,
			level_type = "TRAVEL",
			conflict_settings = "deus_skaven_chaos",
			level = "pat_pacing_benchmark",
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"pacing_benchmark_3"
			}
		},
		pacing_benchmark_3 = {
			path = 0,
			layout_x = 0.7,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "sig_gorge",
			run_progress = 0.6666,
			shop = "harmony",
			layout_y = 0.7,
			level_type = "SIGNATURE",
			conflict_settings = "deus_skaven_chaos",
			level = "sig_pacing_benchmark",
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"final"
			}
		},
		final = {
			path = 1,
			layout_x = 1,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "arena_cave",
			run_progress = 0.9999,
			conflict_settings = "deus_skaven_chaos",
			layout_y = 1,
			level_type = "ARENA",
			level = "arena_cave_khorne_path1",
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {}
		}
	},
	BENCHMARK_2 = {
		start = {
			base_level = "dlc_morris_map",
			layout_x = 0,
			weapon_pickup_seed = 0,
			theme = "wastes",
			node_type = "start",
			level_seed = 0,
			path = 0,
			conflict_settings = "disabled",
			layout_y = 0,
			run_progress = 0,
			level = "dlc_morris_map",
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"pacing_benchmark_1"
			}
		},
		pacing_benchmark_1 = {
			path = 0,
			layout_x = 0.2,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "pat_forest",
			run_progress = 0,
			shop = "strife",
			layout_y = 0.2,
			level_type = "TRAVEL",
			conflict_settings = "deus_skaven_chaos",
			level = "pat_pacing_benchmark",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"pacing_benchmark_2"
			}
		},
		pacing_benchmark_2 = {
			path = 0,
			layout_x = 0.5,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "pat_forest",
			run_progress = 0.3333,
			shop = "harmony",
			layout_y = 0.5,
			level_type = "TRAVEL",
			conflict_settings = "deus_skaven_chaos",
			level = "pat_pacing_benchmark",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"pacing_benchmark_3"
			}
		},
		pacing_benchmark_3 = {
			path = 0,
			layout_x = 0.7,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "sig_gorge",
			run_progress = 0.6666,
			shop = "harmony",
			layout_y = 0.7,
			level_type = "SIGNATURE",
			conflict_settings = "deus_skaven_chaos",
			level = "sig_pacing_benchmark",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"final"
			}
		},
		final = {
			path = 1,
			layout_x = 1,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "arena_cave",
			run_progress = 0.9999,
			conflict_settings = "deus_skaven_chaos",
			layout_y = 1,
			level_type = "ARENA",
			level = "arena_cave_khorne_path1",
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {}
		}
	},
	BENCHMARK_3 = {
		start = {
			base_level = "dlc_morris_map",
			layout_x = 0,
			weapon_pickup_seed = 0,
			theme = "wastes",
			node_type = "start",
			level_seed = 0,
			path = 0,
			conflict_settings = "disabled",
			layout_y = 0,
			run_progress = 0,
			level = "dlc_morris_map",
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"pacing_benchmark_1"
			}
		},
		pacing_benchmark_1 = {
			path = 0,
			layout_x = 0.2,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "pat_forest",
			run_progress = 0,
			shop = "strife",
			layout_y = 0.2,
			level_type = "TRAVEL",
			conflict_settings = "deus_skaven_chaos",
			level = "pat_pacing_benchmark",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
				"easier_hordes"
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"pacing_benchmark_2"
			}
		},
		pacing_benchmark_2 = {
			path = 0,
			layout_x = 0.5,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "pat_forest",
			run_progress = 0.3333,
			shop = "harmony",
			layout_y = 0.5,
			level_type = "TRAVEL",
			conflict_settings = "deus_skaven_chaos",
			level = "pat_pacing_benchmark",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak",
				"easier_hordes"
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"pacing_benchmark_3"
			}
		},
		pacing_benchmark_3 = {
			path = 0,
			layout_x = 0.7,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "sig_gorge",
			run_progress = 0.6666,
			shop = "harmony",
			layout_y = 0.7,
			level_type = "SIGNATURE",
			conflict_settings = "deus_skaven_chaos",
			level = "sig_pacing_benchmark",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"final"
			}
		},
		final = {
			path = 1,
			layout_x = 1,
			theme = "wastes",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "arena_cave",
			run_progress = 0.9999,
			conflict_settings = "deus_skaven_chaos",
			layout_y = 1,
			level_type = "ARENA",
			level = "arena_cave_khorne_path1",
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {}
		}
	},
	CURSED_WORLD = {
		start = {
			path = 0,
			layout_x = 0,
			weapon_pickup_seed = 111112,
			theme = "wastes",
			node_type = "start",
			level_seed = 111112,
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			shop = "harmony",
			layout_y = 0,
			run_progress = 0,
			level = "dlc_morris_map",
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				power_ups = 123456,
				pickups = 111112
			},
			next = {
				"forest_tzeentch"
			}
		},
		forest_tzeentch = {
			run_progress = 0.2,
			curse = "curse_egg_of_tzeentch",
			weapon_pickup_seed = 111112,
			base_level = "pat_forest",
			level_seed = 111112,
			path = 1,
			layout_y = 0.3,
			level = "pat_forest_wastes_path1",
			layout_x = 0.1,
			theme = "tzeentch",
			node_type = "ingame",
			conflict_settings = "deus_skaven_beastmen",
			shop = "strife",
			level_type = "TRAVEL",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				power_ups = 123456,
				pickups = 111112
			},
			next = {
				"gorge_nurgle"
			}
		},
		gorge_nurgle = {
			run_progress = 0.4,
			curse = "curse_corrupted_flesh",
			weapon_pickup_seed = 111112,
			base_level = "sig_gorge",
			level_seed = 111112,
			path = 1,
			layout_y = 0.6,
			level = "sig_gorge_khorne_path1",
			layout_x = 0.3,
			theme = "nurgle",
			node_type = "ingame",
			conflict_settings = "deus_skaven_chaos",
			shop = "harmony",
			level_type = "SIGNATURE",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 234567,
				mutator = 123456,
				power_ups = 234567,
				pickups = 111112
			},
			next = {
				"bay_khorne"
			}
		},
		bay_khorne = {
			run_progress = 0.8,
			curse = "curse_skulls_of_fury",
			weapon_pickup_seed = 111112,
			base_level = "pat_bay",
			level_seed = 111112,
			path = 3,
			layout_y = 0.2,
			level = "pat_bay_khorne_path3",
			layout_x = 0.8,
			theme = "khorne",
			node_type = "ingame",
			conflict_settings = "deus_skaven_chaos",
			shop = "fortune",
			level_type = "SIGNATURE",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				power_ups = 567890,
				pickups = 111112
			},
			next = {
				"final"
			}
		},
		final = {
			path = 1,
			curse = "curse_empathy",
			weapon_pickup_seed = 111112,
			theme = "slaanesh",
			node_type = "ingame",
			level_seed = 111112,
			base_level = "arena_ruin",
			layout_x = 0.9,
			run_progress = 0.9999999,
			layout_y = 0.9,
			level_type = "ARENA",
			conflict_settings = "deus_skaven_chaos",
			level = "arena_ruin_khorne_path1",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				power_ups = 567890,
				pickups = 111112
			},
			next = {}
		}
	},
	SHOPPING_WORLD = {
		start = {
			path = 0,
			layout_x = 0,
			weapon_pickup_seed = 111112,
			theme = "wastes",
			node_type = "start",
			level_seed = 111112,
			base_level = "dlc_morris_map",
			conflict_settings = "disabled",
			shop = "harmony",
			layout_y = 0,
			run_progress = 0,
			level = "dlc_morris_map",
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				power_ups = 123456,
				pickups = 111112
			},
			next = {
				"forest_wastes"
			}
		},
		forest_wastes = {
			path = 0,
			layout_x = 0.1,
			theme = "wastes",
			weapon_pickup_seed = 111112,
			node_type = "shop",
			level_seed = 111112,
			base_level = "shop_strife",
			run_progress = 0.2,
			shop = "strife",
			layout_y = 0.3,
			level_type = "SHOP",
			conflict_settings = "deus_skaven_beastmen",
			level = "shop_strife",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 123456,
				mutator = 123456,
				power_ups = 123456,
				pickups = 111112
			},
			next = {
				"gorge_khorne",
				"mountain_khorne"
			}
		},
		gorge_khorne = {
			path = 0,
			layout_x = 0.3,
			theme = "wastes",
			weapon_pickup_seed = 111112,
			node_type = "shop",
			level_seed = 111112,
			base_level = "shop_strife",
			run_progress = 0.4,
			conflict_settings = "deus_skaven_chaos",
			layout_y = 0.6,
			level_type = "SHOP",
			level = "shop_strife",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 234567,
				mutator = 123456,
				power_ups = 234567,
				pickups = 111112
			},
			next = {
				"town_nurgle",
				"bay_khorne"
			}
		},
		mountain_khorne = {
			path = 0,
			layout_x = 0.3,
			theme = "wastes",
			weapon_pickup_seed = 111112,
			node_type = "ingame",
			level_seed = 111112,
			base_level = "shop_strife",
			run_progress = 0.4,
			conflict_settings = "deus_skaven_chaos",
			layout_y = 0.2,
			level_type = "SHOP",
			level = "shop_strife",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 345678,
				mutator = 123456,
				power_ups = 345678,
				pickups = 111112
			},
			next = {
				"town_nurgle",
				"bay_khorne"
			}
		},
		town_nurgle = {
			path = 0,
			layout_x = 0.6,
			theme = "wastes",
			weapon_pickup_seed = 111112,
			node_type = "shop",
			level_seed = 111112,
			base_level = "shop_strife",
			run_progress = 0.8,
			conflict_settings = "deus_skaven_chaos",
			layout_y = 0.6,
			level_type = "SHOP",
			level = "shop_strife",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				power_ups = 567890,
				pickups = 111112
			},
			next = {
				"final"
			}
		},
		bay_khorne = {
			path = 0,
			layout_x = 0.8,
			theme = "wastes",
			weapon_pickup_seed = 111112,
			node_type = "shop",
			level_seed = 111112,
			base_level = "shop_strife",
			run_progress = 0.8,
			conflict_settings = "deus_skaven_chaos",
			layout_y = 0.2,
			level_type = "SHOP",
			level = "shop_strife",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				power_ups = 567890,
				pickups = 111112
			},
			next = {
				"final"
			}
		},
		final = {
			path = 1,
			curse = "curse_khorne_champions",
			weapon_pickup_seed = 111112,
			theme = "khorne",
			node_type = "ingame",
			level_seed = 111112,
			base_level = "arena_ruin",
			layout_x = 0.9,
			run_progress = 0.9999999,
			layout_y = 0.9,
			level_type = "ARENA",
			conflict_settings = "deus_skaven_chaos",
			level = "arena_ruin_khorne_path1",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				power_ups = 567890,
				pickups = 111112
			},
			next = {}
		}
	},
	BELAKOR_VERTICAL_SLICE = {
		start = {
			base_level = "dlc_morris_map",
			layout_x = 0.1,
			weapon_pickup_seed = 0,
			theme = "wastes",
			node_type = "start",
			level_seed = 0,
			path = 0,
			conflict_settings = "disabled",
			layout_y = 0.1,
			run_progress = 0,
			level = "dlc_morris_map",
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"node_1"
			}
		},
		node_1 = {
			path = 0,
			curse = "curse_shadow_homing_skulls",
			weapon_pickup_seed = 0,
			theme = "belakor",
			node_type = "ingame",
			level_seed = 0,
			base_level = "sig_gorge",
			layout_x = 0.3,
			run_progress = 0,
			layout_y = 0.3,
			level_type = "SIGNATURE",
			conflict_settings = "deus_skaven_chaos",
			level = "sig_gorge_belakor_path4",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"node_2"
			}
		},
		node_2 = {
			path = 0,
			curse = "curse_belakor_totems",
			weapon_pickup_seed = 0,
			theme = "belakor",
			node_type = "ingame",
			level_seed = 0,
			base_level = "sig_gorge",
			layout_x = 0.5,
			run_progress = 0.3,
			layout_y = 0.5,
			level_type = "SIGNATURE",
			conflict_settings = "deus_skaven_chaos",
			level = "sig_gorge_belakor_path4",
			mutators = {
				"deus_pacing_tweak",
				"deus_difficulty_tweak"
			},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"final"
			}
		},
		final = {
			path = 0,
			layout_x = 0.9,
			theme = "belakor",
			weapon_pickup_seed = 0,
			node_type = "ingame",
			level_seed = 0,
			base_level = "arena_belakor",
			run_progress = 0.9999,
			conflict_settings = "deus_skaven_chaos",
			layout_y = 0.9,
			level_type = "ARENA",
			level = "arena_belakor",
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {}
		}
	},
	BELAKOR_ONLY_NEW_ARENA = {
		start = {
			base_level = "dlc_morris_map",
			layout_x = 0.1,
			weapon_pickup_seed = 0,
			theme = "wastes",
			node_type = "start",
			level_seed = 0,
			path = 0,
			conflict_settings = "disabled",
			layout_y = 0.1,
			run_progress = 0,
			level = "dlc_morris_map",
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"node_1"
			}
		},
		node_1 = {
			terror_event_power_up_rarity = "unique",
			base_level = "arena_belakor",
			run_progress = 0,
			level_seed = 0,
			path = 0,
			layout_y = 0.3,
			level = "arena_belakor",
			layout_x = 0.3,
			theme = "belakor",
			node_type = "ingame",
			weapon_pickup_seed = 0,
			conflict_settings = "deus_skaven_chaos",
			grant_random_power_up_count = 2,
			level_type = "ARENA",
			mutators = {},
			system_seeds = {
				blessings = 0,
				mutator = 0,
				power_ups = 0,
				pickups = 0
			},
			next = {
				"final"
			}
		},
		final = {
			path = 1,
			curse = "curse_khorne_champions",
			weapon_pickup_seed = 111112,
			theme = "khorne",
			node_type = "ingame",
			level_seed = 111112,
			base_level = "arena_ruin",
			layout_x = 0.9,
			run_progress = 0.9999999,
			layout_y = 0.9,
			level_type = "ARENA",
			conflict_settings = "deus_skaven_chaos",
			level = "arena_ruin_khorne_path1",
			mutators = {},
			system_seeds = {
				blessings = 567890,
				mutator = 654321,
				power_ups = 567890,
				pickups = 111112
			},
			next = {}
		}
	}
}
DeusDebugShrineNodeGraph = DeusDebugShrineNodeGraph or {
	start = {
		path = 0,
		layout_x = 0,
		weapon_pickup_seed = 111112,
		theme = "wastes",
		node_type = "start",
		level_seed = 111112,
		base_level = "dlc_morris_map",
		conflict_settings = "disabled",
		layout_y = 0,
		level_type = "START",
		run_progress = 0,
		level = "dlc_morris_map",
		system_seeds = {
			blessings = 123456,
			mutator = 123456,
			power_ups = 123456,
			pickups = 111112
		},
		next = {
			"shrine1",
			"shrine2",
			"shrine3"
		}
	},
	shrine1 = {
		path = 0,
		layout_x = 0,
		weapon_pickup_seed = 111112,
		theme = "wastes",
		node_type = "shop",
		level_seed = 111112,
		base_level = "shop_strife",
		conflict_settings = "deus_skaven_beastmen",
		layout_y = 0.5,
		level_type = "SHOP",
		run_progress = 0,
		level = "shop_strife",
		system_seeds = {
			blessings = 123456,
			mutator = 123456,
			power_ups = 123456,
			pickups = 111112
		},
		next = {
			"final"
		}
	},
	shrine2 = {
		path = 0,
		layout_x = 0.5,
		weapon_pickup_seed = 111112,
		theme = "wastes",
		node_type = "shop",
		level_seed = 111112,
		base_level = "shop_harmony",
		conflict_settings = "deus_skaven_beastmen",
		layout_y = 0.5,
		level_type = "SHOP",
		run_progress = 0,
		level = "shop_harmony",
		system_seeds = {
			blessings = 123456,
			mutator = 123456,
			power_ups = 123456,
			pickups = 111112
		},
		next = {
			"final"
		}
	},
	shrine3 = {
		path = 0,
		layout_x = 0.5,
		weapon_pickup_seed = 111112,
		theme = "wastes",
		node_type = "shop",
		level_seed = 111112,
		base_level = "shop_fortune",
		conflict_settings = "deus_skaven_beastmen",
		layout_y = 0,
		level_type = "SHOP",
		run_progress = 0,
		level = "shop_fortune",
		system_seeds = {
			blessings = 123456,
			mutator = 123456,
			power_ups = 123456,
			pickups = 111112
		},
		next = {
			"final"
		}
	},
	final = {
		path = 1,
		key = "final",
		weapon_pickup_seed = 0,
		theme = "wastes",
		run_progress = 0,
		node_type = "ingame",
		level_seed = 0,
		base_level = "sig_gorge",
		layout_x = 1,
		conflict_settings = "deus_skaven_chaos",
		layout_y = 1,
		level_type = "SIGNATURE",
		level = "sig_gorge_wastes_path1",
		mutators = {
			"deus_pacing_tweak",
			"deus_difficulty_tweak"
		},
		system_seeds = {
			pickups = 0
		},
		next = {}
	}
}
DeusDebugSpecificNodeGraph = DeusDebugSpecificNodeGraph or {
	start = {
		terror_event_power_up_rarity = "rare",
		key = "start",
		terror_event_power_up = "stamina",
		run_progress = 0,
		conflict_settings = "deus_skaven_chaos",
		level_seed = 0,
		path = 0,
		layout_y = 0,
		level = "TO_BE_REPLACED_IN_CODE",
		layout_x = 0,
		theme = "wastes",
		node_type = "ingame",
		weapon_pickup_seed = 0,
		base_level = "arena_cave",
		level_type = "TO_BE_REPLACED_IN_CODE",
		mutators = {
			"deus_pacing_tweak",
			"deus_difficulty_tweak"
		},
		system_seeds = {
			pickups = 0
		},
		next = {}
	}
}

for seed, graph in pairs(DeusDefaultGraphs) do
	for id, node_data in pairs(graph) do
		node_data.key = id
	end
end
