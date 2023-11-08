return function ()
	define_rule({
		name = "pes_elven_ruins_intro_a",
		response = "pes_elven_ruins_intro_a",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_elven_ruins_intro_b",
		response = "pes_elven_ruins_intro_b",
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
				"empire_soldier"
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
		name = "pes_elven_ruins_intro_c",
		response = "pes_elven_ruins_intro_c",
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
				"elven_ruins_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
	define_rule({
		name = "pes_level_elven_ruins_big_tree",
		response = "pes_level_elven_ruins_big_tree",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
		name = "pes_level_elven_ruins_broken_waystone",
		response = "pes_level_elven_ruins_broken_waystone",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_elven_ruins_clearing",
		response = "pes_level_elven_ruins_clearing",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		response = "pes_level_elven_ruins_cliff_edge",
		name = "pes_level_elven_ruins_cliff_edge",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			}
		}
	})
	define_rule({
		name = "pes_level_elven_ruins_entering_ruins",
		response = "pes_level_elven_ruins_entering_ruins",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_elven_ruins_exit",
		response = "pes_level_elven_ruins_exit",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_elven_ruins_first_aligned_pleasant_feeling",
		response = "pes_level_elven_ruins_first_aligned_pleasant_feeling",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		response = "pes_level_elven_ruins_great_glade",
		name = "pes_level_elven_ruins_great_glade",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			}
		}
	})
	define_rule({
		name = "pes_level_elven_ruins_maze_approach",
		response = "pes_level_elven_ruins_maze_approach",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		response = "pes_level_elven_ruins_maze_interior",
		name = "pes_level_elven_ruins_maze_interior",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			}
		}
	})
	define_rule({
		name = "pes_level_elven_ruins_noisy_puzzle",
		response = "pes_level_elven_ruins_noisy_puzzle",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_elven_ruins_ravine_approach",
		response = "pes_level_elven_ruins_ravine_approach",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_elven_ruins_second_aligned",
		response = "pes_level_elven_ruins_second_aligned",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_elven_ruins_seeing_puzzle",
		response = "pes_level_elven_ruins_seeing_puzzle",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_elven_ruins_seeing_puzzle_crystals",
		response = "pes_level_elven_ruins_seeing_puzzle_crystals",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_elven_ruins_shattered_temple",
		response = "pes_level_elven_ruins_shattered_temple",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_elven_ruins_skaven_banners",
		response = "pes_level_elven_ruins_skaven_banners",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_elven_ruins_task_complete",
		response = "pes_level_elven_ruins_task_complete",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		response = "pes_level_elven_ruins_untouched",
		name = "pes_level_elven_ruins_untouched",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			}
		}
	})
	add_dialogues({
		pes_elven_ruins_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_elven_ruins_intro_a_01",
				[2.0] = "pes_elven_ruins_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_elven_ruins_intro_a_01",
				[2.0] = "pes_elven_ruins_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 2.5494999885559,
				[2.0] = 4.6153335571289
			}
		},
		pes_elven_ruins_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_elven_ruins_intro_b_01",
				[2.0] = "pes_elven_ruins_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_elven_ruins_intro_b_01",
				[2.0] = "pes_elven_ruins_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.2758333683014,
				[2.0] = 2.7555000782013
			}
		},
		pes_elven_ruins_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_elven_ruins_intro_c_01",
				[2.0] = "pes_elven_ruins_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_elven_ruins_intro_c_01",
				[2.0] = "pes_elven_ruins_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 1.9645416736603,
				[2.0] = 3.8037917613983
			}
		},
		pes_level_elven_ruins_big_tree = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_big_tree_01",
				"pes_level_elven_ruins_big_tree_02",
				"pes_level_elven_ruins_big_tree_03",
				"pes_level_elven_ruins_big_tree_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_big_tree_01",
				"pes_level_elven_ruins_big_tree_02",
				"pes_level_elven_ruins_big_tree_03",
				"pes_level_elven_ruins_big_tree_04"
			},
			sound_events_duration = {
				2.372750043869,
				3.616250038147,
				2.4063334465027,
				2.5651042461395
			}
		},
		pes_level_elven_ruins_broken_waystone = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_broken_waystone_01",
				"pes_level_elven_ruins_broken_waystone_02",
				"pes_level_elven_ruins_broken_waystone_03",
				"pes_level_elven_ruins_broken_waystone_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_broken_waystone_01",
				"pes_level_elven_ruins_broken_waystone_02",
				"pes_level_elven_ruins_broken_waystone_03",
				"pes_level_elven_ruins_broken_waystone_04"
			},
			sound_events_duration = {
				1.9333750009537,
				3.4000000953674,
				3.5138750076294,
				1.8037707805634
			}
		},
		pes_level_elven_ruins_clearing = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_clearing_01",
				"pes_level_elven_ruins_clearing_02",
				"pes_level_elven_ruins_clearing_03",
				"pes_level_elven_ruins_clearing_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_clearing_01",
				"pes_level_elven_ruins_clearing_02",
				"pes_level_elven_ruins_clearing_03",
				"pes_level_elven_ruins_clearing_04"
			},
			sound_events_duration = {
				3.1847290992737,
				4.0415625572205,
				3.926374912262,
				3.6608126163483
			}
		},
		pes_level_elven_ruins_cliff_edge = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_cliff_edge_01",
				"pes_level_elven_ruins_cliff_edge_02",
				"pes_level_elven_ruins_cliff_edge_03",
				"pes_level_elven_ruins_cliff_edge_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_cliff_edge_01",
				"pes_level_elven_ruins_cliff_edge_02",
				"pes_level_elven_ruins_cliff_edge_03",
				"pes_level_elven_ruins_cliff_edge_04"
			},
			sound_events_duration = {
				2.321145772934,
				3.755937576294,
				2.8040208816528,
				2.6163125038147
			}
		},
		pes_level_elven_ruins_entering_ruins = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_entering_ruins_01",
				"pes_level_elven_ruins_entering_ruins_02",
				"pes_level_elven_ruins_entering_ruins_03",
				"pes_level_elven_ruins_entering_ruins_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_entering_ruins_01",
				"pes_level_elven_ruins_entering_ruins_02",
				"pes_level_elven_ruins_entering_ruins_03",
				"pes_level_elven_ruins_entering_ruins_04"
			},
			sound_events_duration = {
				4.6710000038147,
				2.5437290668488,
				5.1385416984558,
				3.358895778656
			}
		},
		pes_level_elven_ruins_exit = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_exit_01",
				"pes_level_elven_ruins_exit_02",
				"pes_level_elven_ruins_exit_03",
				"pes_level_elven_ruins_exit_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_exit_01",
				"pes_level_elven_ruins_exit_02",
				"pes_level_elven_ruins_exit_03",
				"pes_level_elven_ruins_exit_04"
			},
			sound_events_duration = {
				2.1284792423248,
				2.0723125934601,
				1.6486458778381,
				2.1561875343323
			}
		},
		pes_level_elven_ruins_first_aligned_pleasant_feeling = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_first_aligned_pleasant_feeling_01",
				"pes_level_elven_ruins_first_aligned_pleasant_feeling_02",
				"pes_level_elven_ruins_first_aligned_pleasant_feeling_03",
				"pes_level_elven_ruins_first_aligned_pleasant_feeling_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_first_aligned_pleasant_feeling_01",
				"pes_level_elven_ruins_first_aligned_pleasant_feeling_02",
				"pes_level_elven_ruins_first_aligned_pleasant_feeling_03",
				"pes_level_elven_ruins_first_aligned_pleasant_feeling_04"
			},
			sound_events_duration = {
				6.2442083358765,
				3.2999999523163,
				3.754499912262,
				3.7999999523163
			}
		},
		pes_level_elven_ruins_great_glade = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_great_glade_01",
				"pes_level_elven_ruins_great_glade_02",
				"pes_level_elven_ruins_great_glade_03",
				"pes_level_elven_ruins_great_glade_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_great_glade_01",
				"pes_level_elven_ruins_great_glade_02",
				"pes_level_elven_ruins_great_glade_03",
				"pes_level_elven_ruins_great_glade_04"
			},
			sound_events_duration = {
				4.1007084846497,
				2.7314791679382,
				3.3926875591278,
				2.1526875495911
			}
		},
		pes_level_elven_ruins_maze_approach = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_maze_approach_01",
				"pes_level_elven_ruins_maze_approach_02",
				"pes_level_elven_ruins_maze_approach_03",
				"pes_level_elven_ruins_maze_approach_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_maze_approach_01",
				"pes_level_elven_ruins_maze_approach_02",
				"pes_level_elven_ruins_maze_approach_03",
				"pes_level_elven_ruins_maze_approach_04"
			},
			sound_events_duration = {
				1.5343542098999,
				2.6702709197998,
				0.99556249380112,
				2.4887707233429
			}
		},
		pes_level_elven_ruins_maze_interior = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_maze_interior_01",
				"pes_level_elven_ruins_maze_interior_02",
				"pes_level_elven_ruins_maze_interior_03",
				"pes_level_elven_ruins_maze_interior_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_maze_interior_01",
				"pes_level_elven_ruins_maze_interior_02",
				"pes_level_elven_ruins_maze_interior_03",
				"pes_level_elven_ruins_maze_interior_04"
			},
			sound_events_duration = {
				2.1585624217987,
				1.510583281517,
				2.0673749446869,
				2.2402291297913
			}
		},
		pes_level_elven_ruins_noisy_puzzle = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_noisy_puzzle_01",
				"pes_level_elven_ruins_noisy_puzzle_02",
				"pes_level_elven_ruins_noisy_puzzle_03",
				"pes_level_elven_ruins_noisy_puzzle_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_noisy_puzzle_01",
				"pes_level_elven_ruins_noisy_puzzle_02",
				"pes_level_elven_ruins_noisy_puzzle_03",
				"pes_level_elven_ruins_noisy_puzzle_04"
			},
			sound_events_duration = {
				2.9823541641235,
				2.0301876068115,
				3.25,
				2.8185832500458
			}
		},
		pes_level_elven_ruins_ravine_approach = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_ravine_approach_01",
				"pes_level_elven_ruins_ravine_approach_02",
				"pes_level_elven_ruins_ravine_approach_03",
				"pes_level_elven_ruins_ravine_approach_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_ravine_approach_01",
				"pes_level_elven_ruins_ravine_approach_02",
				"pes_level_elven_ruins_ravine_approach_03",
				"pes_level_elven_ruins_ravine_approach_04"
			},
			sound_events_duration = {
				2.6099998950958,
				2.0155000686645,
				1.9991874694824,
				2.5118541717529
			}
		},
		pes_level_elven_ruins_second_aligned = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_second_aligned_01",
				"pes_level_elven_ruins_second_aligned_02",
				"pes_level_elven_ruins_second_aligned_03",
				"pes_level_elven_ruins_second_aligned_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_second_aligned_01",
				"pes_level_elven_ruins_second_aligned_02",
				"pes_level_elven_ruins_second_aligned_03",
				"pes_level_elven_ruins_second_aligned_04"
			},
			sound_events_duration = {
				2.6863541603088,
				1.5787500143051,
				3.7585833072662,
				3.4622707366943
			}
		},
		pes_level_elven_ruins_seeing_puzzle = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_seeing_puzzle_01",
				"pes_level_elven_ruins_seeing_puzzle_02",
				"pes_level_elven_ruins_seeing_puzzle_03",
				"pes_level_elven_ruins_seeing_puzzle_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_seeing_puzzle_01",
				"pes_level_elven_ruins_seeing_puzzle_02",
				"pes_level_elven_ruins_seeing_puzzle_03",
				"pes_level_elven_ruins_seeing_puzzle_04"
			},
			sound_events_duration = {
				2.6220624446869,
				2.0131249427795,
				2.3350417613983,
				3.2668333053589
			}
		},
		pes_level_elven_ruins_seeing_puzzle_crystals = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_seeing_puzzle_crystals_01",
				"pes_level_elven_ruins_seeing_puzzle_crystals_02",
				"pes_level_elven_ruins_seeing_puzzle_crystals_03",
				"pes_level_elven_ruins_seeing_puzzle_crystals_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_seeing_puzzle_crystals_01",
				"pes_level_elven_ruins_seeing_puzzle_crystals_02",
				"pes_level_elven_ruins_seeing_puzzle_crystals_03",
				"pes_level_elven_ruins_seeing_puzzle_crystals_04"
			},
			sound_events_duration = {
				1.5299166440964,
				4.6691250801086,
				3.215562582016,
				2.85191655159
			}
		},
		pes_level_elven_ruins_shattered_temple = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_shattered_temple_01",
				"pes_level_elven_ruins_shattered_temple_02",
				"pes_level_elven_ruins_shattered_temple_03",
				"pes_level_elven_ruins_shattered_temple_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_shattered_temple_01",
				"pes_level_elven_ruins_shattered_temple_02",
				"pes_level_elven_ruins_shattered_temple_03",
				"pes_level_elven_ruins_shattered_temple_04"
			},
			sound_events_duration = {
				3.700395822525,
				2.9980416297913,
				4.5706458091736,
				5.1114583015442
			}
		},
		pes_level_elven_ruins_skaven_banners = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_skaven_banners_01",
				"pes_level_elven_ruins_skaven_banners_02",
				"pes_level_elven_ruins_skaven_banners_03",
				"pes_level_elven_ruins_skaven_banners_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_skaven_banners_01",
				"pes_level_elven_ruins_skaven_banners_02",
				"pes_level_elven_ruins_skaven_banners_03",
				"pes_level_elven_ruins_skaven_banners_04"
			},
			sound_events_duration = {
				2.2857916355133,
				3.2055416107178,
				3.672333240509,
				3.7665207386017
			}
		},
		pes_level_elven_ruins_task_complete = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_task_complete_01",
				"pes_level_elven_ruins_task_complete_02",
				"pes_level_elven_ruins_task_complete_03",
				"pes_level_elven_ruins_task_complete_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_task_complete_01",
				"pes_level_elven_ruins_task_complete_02",
				"pes_level_elven_ruins_task_complete_03",
				"pes_level_elven_ruins_task_complete_04"
			},
			sound_events_duration = {
				3.4585416316986,
				4.2148542404175,
				4.0107083320618,
				6.3778123855591
			}
		},
		pes_level_elven_ruins_untouched = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_elven_ruins",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pes_level_elven_ruins_untouched_01",
				"pes_level_elven_ruins_untouched_02",
				"pes_level_elven_ruins_untouched_03",
				"pes_level_elven_ruins_untouched_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_elven_ruins_untouched_01",
				"pes_level_elven_ruins_untouched_02",
				"pes_level_elven_ruins_untouched_03",
				"pes_level_elven_ruins_untouched_04"
			},
			sound_events_duration = {
				4.9708957672119,
				6.2138543128967,
				5.117208480835,
				2.5554583072662
			}
		}
	})
end
