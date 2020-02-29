return function ()
	define_rule({
		name = "pwe_level_elven_ruins_untouched",
		response = "pwe_level_elven_ruins_untouched",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_untouched"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_elven_ruins_untouched",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_untouched",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_ravine_approach",
		response = "pwe_level_elven_ruins_ravine_approach",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_ravine_approach"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_elven_ruins_ravine_approach",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_ravine_approach",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_great_glade",
		response = "pwe_level_elven_ruins_great_glade",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_great_glade"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_elven_ruins_great_glade",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_great_glade",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_skaven_banners",
		response = "pwe_level_elven_ruins_skaven_banners",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_skaven_banners"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_elven_ruins_skaven_banners",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_skaven_banners",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_maze_approach",
		response = "pwe_level_elven_ruins_maze_approach",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_maze_approach"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_elven_ruins_maze_approach",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_maze_approach",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_maze_interior",
		response = "pwe_level_elven_ruins_maze_interior",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_maze_approach"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_elven_ruins_maze_approach",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_maze_approach",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_broken_waystone",
		response = "pwe_level_elven_ruins_broken_waystone",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_broken_waystone"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_elven_ruins_broken_waystone",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_broken_waystone",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_cliff_edge",
		response = "pwe_level_elven_ruins_cliff_edge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_cliff_edge"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_elven_ruins_cliff_edge",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_cliff_edge",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_entering_ruins",
		response = "pwe_level_elven_ruins_entering_ruins",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_entering_ruins"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_elven_ruins_entering_ruins",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_entering_ruins",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_clearing",
		response = "pwe_level_elven_ruins_clearing",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_clearing"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_elven_ruins_clearing",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_clearing",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_big_tree",
		response = "pwe_level_elven_ruins_big_tree",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_big_tree"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_elven_ruins_big_tree",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_big_tree",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_shattered_temple",
		response = "pwe_level_elven_ruins_shattered_temple",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_shattered_temple"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_elven_ruins_shattered_temple",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_shattered_temple",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_seeing_puzzle",
		response = "pwe_level_elven_ruins_seeing_puzzle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_seeing_puzzle"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_elven_ruins_seeing_puzzle",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_seeing_puzzle",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_seeing_puzzle_crystals",
		response = "pwe_level_elven_ruins_seeing_puzzle_crystals",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_seeing_puzzle_crystals"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_elven_ruins_seeing_puzzle_crystals",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_seeing_puzzle_crystals",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_noisy_puzzle",
		response = "pwe_level_elven_ruins_noisy_puzzle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_noisy_puzzle"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_elven_ruins_noisy_puzzle",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_noisy_puzzle",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_first_aligned_pleasant_feeling",
		response = "pwe_level_elven_ruins_first_aligned_pleasant_feeling",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_first_aligned_pleasant_feeling"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_elven_ruins_first_aligned_pleasant_feeling",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_first_aligned_pleasant_feeling",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_second_aligned",
		response = "pwe_level_elven_ruins_second_aligned",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_second_aligned"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_elven_ruins_second_aligned",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_second_aligned",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_task_complete",
		response = "pwe_level_elven_ruins_task_complete",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_task_complete"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_elven_ruins_task_complete",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_elven_ruins_task_complete",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_elven_ruins_exit",
		response = "pwe_level_elven_ruins_exit",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_exit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"elven_ruins_exit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"elven_ruins_exit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_elven_ruins_intro_a",
		response = "pwe_elven_ruins_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"elven_ruins_intro_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"elven_ruins_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"elven_ruins_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_elven_ruins_intro_b",
		response = "pwe_elven_ruins_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"elven_ruins_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"elven_ruins_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"elven_ruins_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_elven_ruins_intro_c",
		response = "pwe_elven_ruins_intro_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"elven_ruins_intro_c"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"elven_ruins_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"elven_ruins_intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pwe_level_elven_ruins_great_glade = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_great_glade_01",
				"pwe_level_elven_ruins_great_glade_02",
				"pwe_level_elven_ruins_great_glade_03",
				"pwe_level_elven_ruins_great_glade_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				4.908625125885,
				4.0461459159851,
				4.3327083587647,
				8.3667707443237
			},
			localization_strings = {
				"pwe_level_elven_ruins_great_glade_01",
				"pwe_level_elven_ruins_great_glade_02",
				"pwe_level_elven_ruins_great_glade_03",
				"pwe_level_elven_ruins_great_glade_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_ravine_approach = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_ravine_approach_01",
				"pwe_level_elven_ruins_ravine_approach_02",
				"pwe_level_elven_ruins_ravine_approach_03",
				"pwe_level_elven_ruins_ravine_approach_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				4.0869998931885,
				3.3353750705719,
				5.2165832519531,
				4.2658333778381
			},
			localization_strings = {
				"pwe_level_elven_ruins_ravine_approach_01",
				"pwe_level_elven_ruins_ravine_approach_02",
				"pwe_level_elven_ruins_ravine_approach_03",
				"pwe_level_elven_ruins_ravine_approach_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_noisy_puzzle = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_noisy_puzzle_01",
				"pwe_level_elven_ruins_noisy_puzzle_02",
				"pwe_level_elven_ruins_noisy_puzzle_03",
				"pwe_level_elven_ruins_noisy_puzzle_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.8166041374206,
				4.8951873779297,
				2.3698749542236,
				2.2693541049957
			},
			localization_strings = {
				"pwe_level_elven_ruins_noisy_puzzle_01",
				"pwe_level_elven_ruins_noisy_puzzle_02",
				"pwe_level_elven_ruins_noisy_puzzle_03",
				"pwe_level_elven_ruins_noisy_puzzle_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_cliff_edge = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_cliff_edge_01",
				"pwe_level_elven_ruins_cliff_edge_02",
				"pwe_level_elven_ruins_cliff_edge_03",
				"pwe_level_elven_ruins_cliff_edge_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_contempt",
				"face_contempt",
				"face_neutral"
			},
			sound_events_duration = {
				3.5180208683014,
				2.6875624656677,
				4.8067498207092,
				3.3533749580383
			},
			localization_strings = {
				"pwe_level_elven_ruins_cliff_edge_01",
				"pwe_level_elven_ruins_cliff_edge_02",
				"pwe_level_elven_ruins_cliff_edge_03",
				"pwe_level_elven_ruins_cliff_edge_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_second_aligned = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_second_aligned_01",
				"pwe_level_elven_ruins_second_aligned_02",
				"pwe_level_elven_ruins_second_aligned_03",
				"pwe_level_elven_ruins_second_aligned_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.1353125572205,
				2.6021459102631,
				2.6596040725708,
				3.0942499637604
			},
			localization_strings = {
				"pwe_level_elven_ruins_second_aligned_01",
				"pwe_level_elven_ruins_second_aligned_02",
				"pwe_level_elven_ruins_second_aligned_03",
				"pwe_level_elven_ruins_second_aligned_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_big_tree = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_big_tree_01",
				"pwe_level_elven_ruins_big_tree_02",
				"pwe_level_elven_ruins_big_tree_03",
				"pwe_level_elven_ruins_big_tree_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.6173124313355,
				6.9906873703003,
				7.8157291412353,
				5.3315424919128
			},
			localization_strings = {
				"pwe_level_elven_ruins_big_tree_01",
				"pwe_level_elven_ruins_big_tree_02",
				"pwe_level_elven_ruins_big_tree_03",
				"pwe_level_elven_ruins_big_tree_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_maze_approach = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_maze_approach_01",
				"pwe_level_elven_ruins_maze_approach_02",
				"pwe_level_elven_ruins_maze_approach_03",
				"pwe_level_elven_ruins_maze_approach_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				5.6056666374206,
				5.2449584007263,
				5.8045835494995,
				3.1039373874664
			},
			localization_strings = {
				"pwe_level_elven_ruins_maze_approach_01",
				"pwe_level_elven_ruins_maze_approach_02",
				"pwe_level_elven_ruins_maze_approach_03",
				"pwe_level_elven_ruins_maze_approach_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_entering_ruins = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_entering_ruins_01",
				"pwe_level_elven_ruins_entering_ruins_02",
				"pwe_level_elven_ruins_entering_ruins_03",
				"pwe_level_elven_ruins_entering_ruins_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.2599792480469,
				5.7018542289734,
				5.8772916793823,
				4.0381460189819
			},
			localization_strings = {
				"pwe_level_elven_ruins_entering_ruins_01",
				"pwe_level_elven_ruins_entering_ruins_02",
				"pwe_level_elven_ruins_entering_ruins_03",
				"pwe_level_elven_ruins_entering_ruins_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_broken_waystone = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_broken_waystone_01",
				"pwe_level_elven_ruins_broken_waystone_02",
				"pwe_level_elven_ruins_broken_waystone_03",
				"pwe_level_elven_ruins_broken_waystone_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				5.0930418968201,
				2.8505415916443,
				3.5897083282471,
				6.8867917060852
			},
			localization_strings = {
				"pwe_level_elven_ruins_broken_waystone_01",
				"pwe_level_elven_ruins_broken_waystone_02",
				"pwe_level_elven_ruins_broken_waystone_03",
				"pwe_level_elven_ruins_broken_waystone_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_exit = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_exit_01",
				"pwe_level_elven_ruins_exit_02",
				"pwe_level_elven_ruins_exit_03",
				"pwe_level_elven_ruins_exit_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.2077083587647,
				2.4056251049042,
				1.8923958539963,
				2.9351665973663
			},
			localization_strings = {
				"pwe_level_elven_ruins_exit_01",
				"pwe_level_elven_ruins_exit_02",
				"pwe_level_elven_ruins_exit_03",
				"pwe_level_elven_ruins_exit_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_skaven_banners = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_skaven_banners_01",
				"pwe_level_elven_ruins_skaven_banners_02",
				"pwe_level_elven_ruins_skaven_banners_03",
				"pwe_level_elven_ruins_skaven_banners_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				2.7958750724792,
				4.312958240509,
				4.5076251029968,
				2.7218332290649
			},
			localization_strings = {
				"pwe_level_elven_ruins_skaven_banners_01",
				"pwe_level_elven_ruins_skaven_banners_02",
				"pwe_level_elven_ruins_skaven_banners_03",
				"pwe_level_elven_ruins_skaven_banners_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_task_complete = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_task_complete_01",
				"pwe_level_elven_ruins_task_complete_02",
				"pwe_level_elven_ruins_task_complete_03",
				"pwe_level_elven_ruins_task_complete_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.7635624408722,
				2.8215625286102,
				3.9272708892822,
				4.8551874160767
			},
			localization_strings = {
				"pwe_level_elven_ruins_task_complete_01",
				"pwe_level_elven_ruins_task_complete_02",
				"pwe_level_elven_ruins_task_complete_03",
				"pwe_level_elven_ruins_task_complete_04"
			},
			randomize_indexes = {}
		},
		pwe_elven_ruins_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_elven_ruins_intro_a_01",
				[2.0] = "pwe_elven_ruins_intro_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1409583091736,
				[2.0] = 4.4510416984558
			},
			localization_strings = {
				[1.0] = "pwe_elven_ruins_intro_a_01",
				[2.0] = "pwe_elven_ruins_intro_a_02"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_untouched = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_untouched_01",
				"pwe_level_elven_ruins_untouched_02",
				"pwe_level_elven_ruins_untouched_03",
				"pwe_level_elven_ruins_untouched_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				6.0912709236145,
				3.4207291603088,
				6.5170001983643,
				4.6549372673035
			},
			localization_strings = {
				"pwe_level_elven_ruins_untouched_01",
				"pwe_level_elven_ruins_untouched_02",
				"pwe_level_elven_ruins_untouched_03",
				"pwe_level_elven_ruins_untouched_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_first_aligned_pleasant_feeling = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_01",
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_02",
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_03",
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.5438332557678,
				3.6593959331513,
				3.388729095459,
				4.7251873016357
			},
			localization_strings = {
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_01",
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_02",
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_03",
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_04"
			},
			randomize_indexes = {}
		},
		pwe_elven_ruins_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_elven_ruins_intro_b_01",
				[2.0] = "pwe_elven_ruins_intro_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.940354347229,
				[2.0] = 4.2336249351502
			},
			localization_strings = {
				[1.0] = "pwe_elven_ruins_intro_b_01",
				[2.0] = "pwe_elven_ruins_intro_b_02"
			},
			randomize_indexes = {}
		},
		pwe_elven_ruins_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_elven_ruins_intro_c_01",
				[2.0] = "pwe_elven_ruins_intro_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7547500133514,
				[2.0] = 4.367666721344
			},
			localization_strings = {
				[1.0] = "pwe_elven_ruins_intro_c_01",
				[2.0] = "pwe_elven_ruins_intro_c_02"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_seeing_puzzle_crystals = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_seeing_puzzle_crystals_01",
				"pwe_level_elven_ruins_seeing_puzzle_crystals_02",
				"pwe_level_elven_ruins_seeing_puzzle_crystals_03",
				"pwe_level_elven_ruins_seeing_puzzle_crystals_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.2723333835602,
				3.9061665534973,
				3.6220624446869,
				5.3328123092651
			},
			localization_strings = {
				"pwe_level_elven_ruins_seeing_puzzle_crystals_01",
				"pwe_level_elven_ruins_seeing_puzzle_crystals_02",
				"pwe_level_elven_ruins_seeing_puzzle_crystals_03",
				"pwe_level_elven_ruins_seeing_puzzle_crystals_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_maze_interior = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_maze_interior_01",
				"pwe_level_elven_ruins_maze_interior_02",
				"pwe_level_elven_ruins_maze_interior_03",
				"pwe_level_elven_ruins_maze_interior_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				2.1049165725708,
				3.495395898819,
				3.5055208206177,
				2.3615417480469
			},
			localization_strings = {
				"pwe_level_elven_ruins_maze_interior_01",
				"pwe_level_elven_ruins_maze_interior_02",
				"pwe_level_elven_ruins_maze_interior_03",
				"pwe_level_elven_ruins_maze_interior_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_seeing_puzzle = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_seeing_puzzle_01",
				"pwe_level_elven_ruins_seeing_puzzle_02",
				"pwe_level_elven_ruins_seeing_puzzle_03",
				"pwe_level_elven_ruins_seeing_puzzle_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.7052083015442,
				4.2687501907349,
				4.0626459121704,
				3.9306874275208
			},
			localization_strings = {
				"pwe_level_elven_ruins_seeing_puzzle_01",
				"pwe_level_elven_ruins_seeing_puzzle_02",
				"pwe_level_elven_ruins_seeing_puzzle_03",
				"pwe_level_elven_ruins_seeing_puzzle_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_shattered_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_shattered_temple_01",
				"pwe_level_elven_ruins_shattered_temple_02",
				"pwe_level_elven_ruins_shattered_temple_03",
				"pwe_level_elven_ruins_shattered_temple_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				5.5849375724792,
				5.0223956108093,
				3.5611040592194,
				4.5556874275208
			},
			localization_strings = {
				"pwe_level_elven_ruins_shattered_temple_01",
				"pwe_level_elven_ruins_shattered_temple_02",
				"pwe_level_elven_ruins_shattered_temple_03",
				"pwe_level_elven_ruins_shattered_temple_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_clearing = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_clearing_01",
				"pwe_level_elven_ruins_clearing_02",
				"pwe_level_elven_ruins_clearing_03",
				"pwe_level_elven_ruins_clearing_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				7.6038541793823,
				5.9889373779297,
				6.9608540534973,
				6.8286876678467
			},
			localization_strings = {
				"pwe_level_elven_ruins_clearing_01",
				"pwe_level_elven_ruins_clearing_02",
				"pwe_level_elven_ruins_clearing_03",
				"pwe_level_elven_ruins_clearing_04"
			},
			randomize_indexes = {}
		}
	})
end
