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
		name = "pwe_level_elven_ruins_ruins_proper",
		response = "pwe_level_elven_ruins_ruins_proper",
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
				"elven_ruins_ruins_proper"
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
				"elven_ruins_ruins_proper",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"elven_ruins_ruins_proper",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			localization_strings = {
				"pwe_level_elven_ruins_task_complete_01",
				"pwe_level_elven_ruins_task_complete_02",
				"pwe_level_elven_ruins_task_complete_03",
				"pwe_level_elven_ruins_task_complete_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_first_aligned_pleasant_feeling = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			localization_strings = {
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_01",
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_02",
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_03",
				"pwe_level_elven_ruins_first_aligned_pleasant_feeling_04"
			},
			randomize_indexes = {}
		},
		pwe_elven_ruins_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_elven_ruins",
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
			localization_strings = {
				[1.0] = "pwe_elven_ruins_intro_a_01",
				[2.0] = "pwe_elven_ruins_intro_a_02"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_untouched = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			localization_strings = {
				"pwe_level_elven_ruins_untouched_01",
				"pwe_level_elven_ruins_untouched_02",
				"pwe_level_elven_ruins_untouched_03",
				"pwe_level_elven_ruins_untouched_04"
			},
			randomize_indexes = {}
		},
		pwe_elven_ruins_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_elven_ruins",
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
			localization_strings = {
				[1.0] = "pwe_elven_ruins_intro_b_01",
				[2.0] = "pwe_elven_ruins_intro_b_02"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_clearing = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			localization_strings = {
				"pwe_level_elven_ruins_clearing_01",
				"pwe_level_elven_ruins_clearing_02",
				"pwe_level_elven_ruins_clearing_03",
				"pwe_level_elven_ruins_clearing_04"
			},
			randomize_indexes = {}
		},
		pwe_elven_ruins_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_elven_ruins",
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
			localization_strings = {
				[1.0] = "pwe_elven_ruins_intro_c_01",
				[2.0] = "pwe_elven_ruins_intro_c_02"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_seeing_puzzle_crystals = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
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
			localization_strings = {
				"pwe_level_elven_ruins_shattered_temple_01",
				"pwe_level_elven_ruins_shattered_temple_02",
				"pwe_level_elven_ruins_shattered_temple_03",
				"pwe_level_elven_ruins_shattered_temple_04"
			},
			randomize_indexes = {}
		},
		pwe_level_elven_ruins_ruins_proper = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_elven_ruins",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_elven_ruins_ruins_proper_01",
				"pwe_level_elven_ruins_ruins_proper_02",
				"pwe_level_elven_ruins_ruins_proper_03",
				"pwe_level_elven_ruins_ruins_proper_04"
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
			localization_strings = {
				"pwe_level_elven_ruins_ruins_proper_01",
				"pwe_level_elven_ruins_ruins_proper_02",
				"pwe_level_elven_ruins_ruins_proper_03",
				"pwe_level_elven_ruins_ruins_proper_04"
			},
			randomize_indexes = {}
		}
	})

	return 
end
