return function ()
	define_rule({
		response = "pbw_level_elven_ruins_untouched",
		name = "pbw_level_elven_ruins_untouched",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_ravine_approach",
		response = "pbw_level_elven_ruins_ravine_approach",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		response = "pbw_level_elven_ruins_great_glade",
		name = "pbw_level_elven_ruins_great_glade",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_skaven_banners",
		response = "pbw_level_elven_ruins_skaven_banners",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_maze_approach",
		response = "pbw_level_elven_ruins_maze_approach",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		response = "pbw_level_elven_ruins_maze_interior",
		name = "pbw_level_elven_ruins_maze_interior",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_broken_waystone",
		response = "pbw_level_elven_ruins_broken_waystone",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		response = "pbw_level_elven_ruins_cliff_edge",
		name = "pbw_level_elven_ruins_cliff_edge",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_entering_ruins",
		response = "pbw_level_elven_ruins_entering_ruins",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_clearing",
		response = "pbw_level_elven_ruins_clearing",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_big_tree",
		response = "pbw_level_elven_ruins_big_tree",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_shattered_temple",
		response = "pbw_level_elven_ruins_shattered_temple",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_seeing_puzzle",
		response = "pbw_level_elven_ruins_seeing_puzzle",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_seeing_puzzle_crystals",
		response = "pbw_level_elven_ruins_seeing_puzzle_crystals",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_noisy_puzzle",
		response = "pbw_level_elven_ruins_noisy_puzzle",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_first_aligned_pleasant_feeling",
		response = "pbw_level_elven_ruins_first_aligned_pleasant_feeling",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_second_aligned",
		response = "pbw_level_elven_ruins_second_aligned",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_task_complete",
		response = "pbw_level_elven_ruins_task_complete",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_elven_ruins_exit",
		response = "pbw_level_elven_ruins_exit",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_elven_ruins_intro_a",
		response = "pbw_elven_ruins_intro_a",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_elven_ruins_intro_b",
		response = "pbw_elven_ruins_intro_b",
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
				"bright_wizard"
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
		name = "pbw_elven_ruins_intro_c",
		response = "pbw_elven_ruins_intro_c",
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
				"bright_wizard"
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
		pbw_elven_ruins_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_elven_ruins_intro_a_01",
				[2.0] = "pbw_elven_ruins_intro_a_02"
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
				[1.0] = 1.9390208721161,
				[2.0] = 3.5299582481384
			},
			localization_strings = {
				[1.0] = "pbw_elven_ruins_intro_a_01",
				[2.0] = "pbw_elven_ruins_intro_a_02"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_entering_ruins = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_entering_ruins_01",
				"pbw_level_elven_ruins_entering_ruins_02",
				"pbw_level_elven_ruins_entering_ruins_03",
				"pbw_level_elven_ruins_entering_ruins_04"
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
				3.0314373970032,
				4.5759582519531,
				6.4741668701172,
				4.0052499771118
			},
			localization_strings = {
				"pbw_level_elven_ruins_entering_ruins_01",
				"pbw_level_elven_ruins_entering_ruins_02",
				"pbw_level_elven_ruins_entering_ruins_03",
				"pbw_level_elven_ruins_entering_ruins_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_exit = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_exit_01",
				"pbw_level_elven_ruins_exit_02",
				"pbw_level_elven_ruins_exit_03",
				"pbw_level_elven_ruins_exit_04"
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
				2.6812083721161,
				1.9836875200272,
				4.0268750190735,
				4.9839582443237
			},
			localization_strings = {
				"pbw_level_elven_ruins_exit_01",
				"pbw_level_elven_ruins_exit_02",
				"pbw_level_elven_ruins_exit_03",
				"pbw_level_elven_ruins_exit_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_untouched = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_untouched_01",
				"pbw_level_elven_ruins_untouched_02",
				"pbw_level_elven_ruins_untouched_03",
				"pbw_level_elven_ruins_untouched_04"
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
				4.279354095459,
				3.7469999790192,
				5.4791460037231,
				4.6887083053589
			},
			localization_strings = {
				"pbw_level_elven_ruins_untouched_01",
				"pbw_level_elven_ruins_untouched_02",
				"pbw_level_elven_ruins_untouched_03",
				"pbw_level_elven_ruins_untouched_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_broken_waystone = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_broken_waystone_01",
				"pbw_level_elven_ruins_broken_waystone_02",
				"pbw_level_elven_ruins_broken_waystone_03",
				"pbw_level_elven_ruins_broken_waystone_04"
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
				3.3136458396912,
				7.9666042327881,
				6.5915622711182,
				4.9981460571289
			},
			localization_strings = {
				"pbw_level_elven_ruins_broken_waystone_01",
				"pbw_level_elven_ruins_broken_waystone_02",
				"pbw_level_elven_ruins_broken_waystone_03",
				"pbw_level_elven_ruins_broken_waystone_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_big_tree = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_big_tree_01",
				"pbw_level_elven_ruins_big_tree_02",
				"pbw_level_elven_ruins_big_tree_03",
				"pbw_level_elven_ruins_big_tree_04"
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
				4.6875414848328,
				5.2238125801086,
				5.7449164390564,
				3.9853749275208
			},
			localization_strings = {
				"pbw_level_elven_ruins_big_tree_01",
				"pbw_level_elven_ruins_big_tree_02",
				"pbw_level_elven_ruins_big_tree_03",
				"pbw_level_elven_ruins_big_tree_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_skaven_banners = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_skaven_banners_01",
				"pbw_level_elven_ruins_skaven_banners_02",
				"pbw_level_elven_ruins_skaven_banners_03",
				"pbw_level_elven_ruins_skaven_banners_04"
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
				6.2184166908264,
				4.2172708511353,
				5.7938957214356,
				5.3619999885559
			},
			localization_strings = {
				"pbw_level_elven_ruins_skaven_banners_01",
				"pbw_level_elven_ruins_skaven_banners_02",
				"pbw_level_elven_ruins_skaven_banners_03",
				"pbw_level_elven_ruins_skaven_banners_04"
			},
			randomize_indexes = {}
		},
		pbw_elven_ruins_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_elven_ruins_intro_b_01",
				[2.0] = "pbw_elven_ruins_intro_b_02"
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
				[1.0] = 3.2483124732971,
				[2.0] = 3.3885416984558
			},
			localization_strings = {
				[1.0] = "pbw_elven_ruins_intro_b_01",
				[2.0] = "pbw_elven_ruins_intro_b_02"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_seeing_puzzle = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_seeing_puzzle_01",
				"pbw_level_elven_ruins_seeing_puzzle_02",
				"pbw_level_elven_ruins_seeing_puzzle_03",
				"pbw_level_elven_ruins_seeing_puzzle_04"
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
				3.4800207614899,
				3.4573957920074,
				5.1213331222534,
				3.8838748931885
			},
			localization_strings = {
				"pbw_level_elven_ruins_seeing_puzzle_01",
				"pbw_level_elven_ruins_seeing_puzzle_02",
				"pbw_level_elven_ruins_seeing_puzzle_03",
				"pbw_level_elven_ruins_seeing_puzzle_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_cliff_edge = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_cliff_edge_01",
				"pbw_level_elven_ruins_cliff_edge_02",
				"pbw_level_elven_ruins_cliff_edge_03",
				"pbw_level_elven_ruins_cliff_edge_04"
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
				2.2653748989105,
				3.2619166374206,
				3.0420625209808,
				3.5169792175293
			},
			localization_strings = {
				"pbw_level_elven_ruins_cliff_edge_01",
				"pbw_level_elven_ruins_cliff_edge_02",
				"pbw_level_elven_ruins_cliff_edge_03",
				"pbw_level_elven_ruins_cliff_edge_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_second_aligned = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_second_aligned_01",
				"pbw_level_elven_ruins_second_aligned_02",
				"pbw_level_elven_ruins_second_aligned_03",
				"pbw_level_elven_ruins_second_aligned_04"
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
				2.9896874427795,
				3.0398750305176,
				2.6052083969116,
				2.9802498817444
			},
			localization_strings = {
				"pbw_level_elven_ruins_second_aligned_01",
				"pbw_level_elven_ruins_second_aligned_02",
				"pbw_level_elven_ruins_second_aligned_03",
				"pbw_level_elven_ruins_second_aligned_04"
			},
			randomize_indexes = {}
		},
		pbw_elven_ruins_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_elven_ruins_intro_c_01",
				[2.0] = "pbw_elven_ruins_intro_c_02"
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
				[1.0] = 2.4283125400543,
				[2.0] = 3.1933541297913
			},
			localization_strings = {
				[1.0] = "pbw_elven_ruins_intro_c_01",
				[2.0] = "pbw_elven_ruins_intro_c_02"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_task_complete = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_task_complete_01",
				"pbw_level_elven_ruins_task_complete_02",
				"pbw_level_elven_ruins_task_complete_03",
				"pbw_level_elven_ruins_task_complete_04"
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
				5.7445001602173,
				4.6038956642151,
				3.8854792118073,
				3.7695832252502
			},
			localization_strings = {
				"pbw_level_elven_ruins_task_complete_01",
				"pbw_level_elven_ruins_task_complete_02",
				"pbw_level_elven_ruins_task_complete_03",
				"pbw_level_elven_ruins_task_complete_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_maze_interior = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_maze_interior_01",
				"pbw_level_elven_ruins_maze_interior_02",
				"pbw_level_elven_ruins_maze_interior_03",
				"pbw_level_elven_ruins_maze_interior_04"
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
				2.3316042423248,
				6.0795207023621,
				2.1644375324249,
				3.1753749847412
			},
			localization_strings = {
				"pbw_level_elven_ruins_maze_interior_01",
				"pbw_level_elven_ruins_maze_interior_02",
				"pbw_level_elven_ruins_maze_interior_03",
				"pbw_level_elven_ruins_maze_interior_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_clearing = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_clearing_01",
				"pbw_level_elven_ruins_clearing_02",
				"pbw_level_elven_ruins_clearing_03",
				"pbw_level_elven_ruins_clearing_04"
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
				5.4004373550415,
				4.1624999046326,
				8.8686037063599,
				4.9757084846497
			},
			localization_strings = {
				"pbw_level_elven_ruins_clearing_01",
				"pbw_level_elven_ruins_clearing_02",
				"pbw_level_elven_ruins_clearing_03",
				"pbw_level_elven_ruins_clearing_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_first_aligned_pleasant_feeling = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_first_aligned_pleasant_feeling_01",
				"pbw_level_elven_ruins_first_aligned_pleasant_feeling_02",
				"pbw_level_elven_ruins_first_aligned_pleasant_feeling_03",
				"pbw_level_elven_ruins_first_aligned_pleasant_feeling_04"
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
				4.5847706794739,
				6.6561040878296,
				5.8943748474121,
				4.2808957099915
			},
			localization_strings = {
				"pbw_level_elven_ruins_first_aligned_pleasant_feeling_01",
				"pbw_level_elven_ruins_first_aligned_pleasant_feeling_02",
				"pbw_level_elven_ruins_first_aligned_pleasant_feeling_03",
				"pbw_level_elven_ruins_first_aligned_pleasant_feeling_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_maze_approach = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_maze_approach_01",
				"pbw_level_elven_ruins_maze_approach_02",
				"pbw_level_elven_ruins_maze_approach_03",
				"pbw_level_elven_ruins_maze_approach_04"
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
				4.2960414886475,
				5.5571041107178,
				4.7339582443237,
				6.6558332443237
			},
			localization_strings = {
				"pbw_level_elven_ruins_maze_approach_01",
				"pbw_level_elven_ruins_maze_approach_02",
				"pbw_level_elven_ruins_maze_approach_03",
				"pbw_level_elven_ruins_maze_approach_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_noisy_puzzle = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_noisy_puzzle_01",
				"pbw_level_elven_ruins_noisy_puzzle_02",
				"pbw_level_elven_ruins_noisy_puzzle_03",
				"pbw_level_elven_ruins_noisy_puzzle_04"
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
				2.5576667785645,
				2.1696875095367,
				2.7528750896454,
				3.9961042404175
			},
			localization_strings = {
				"pbw_level_elven_ruins_noisy_puzzle_01",
				"pbw_level_elven_ruins_noisy_puzzle_02",
				"pbw_level_elven_ruins_noisy_puzzle_03",
				"pbw_level_elven_ruins_noisy_puzzle_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_ravine_approach = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_ravine_approach_01",
				"pbw_level_elven_ruins_ravine_approach_02",
				"pbw_level_elven_ruins_ravine_approach_03",
				"pbw_level_elven_ruins_ravine_approach_04"
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
				1.5086874961853,
				4.0370626449585,
				7.26327085495,
				3.2806251049042
			},
			localization_strings = {
				"pbw_level_elven_ruins_ravine_approach_01",
				"pbw_level_elven_ruins_ravine_approach_02",
				"pbw_level_elven_ruins_ravine_approach_03",
				"pbw_level_elven_ruins_ravine_approach_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_seeing_puzzle_crystals = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_seeing_puzzle_crystals_01",
				"pbw_level_elven_ruins_seeing_puzzle_crystals_02",
				"pbw_level_elven_ruins_seeing_puzzle_crystals_03",
				"pbw_level_elven_ruins_seeing_puzzle_crystals_04"
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
				3.7913334369659,
				3.9460415840149,
				3.7585000991821,
				4.394166469574
			},
			localization_strings = {
				"pbw_level_elven_ruins_seeing_puzzle_crystals_01",
				"pbw_level_elven_ruins_seeing_puzzle_crystals_02",
				"pbw_level_elven_ruins_seeing_puzzle_crystals_03",
				"pbw_level_elven_ruins_seeing_puzzle_crystals_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_shattered_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_shattered_temple_01",
				"pbw_level_elven_ruins_shattered_temple_02",
				"pbw_level_elven_ruins_shattered_temple_03",
				"pbw_level_elven_ruins_shattered_temple_04"
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
				4.2396664619446,
				6.7200417518616,
				3.4223749637604,
				4.9836668968201
			},
			localization_strings = {
				"pbw_level_elven_ruins_shattered_temple_01",
				"pbw_level_elven_ruins_shattered_temple_02",
				"pbw_level_elven_ruins_shattered_temple_03",
				"pbw_level_elven_ruins_shattered_temple_04"
			},
			randomize_indexes = {}
		},
		pbw_level_elven_ruins_great_glade = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_elven_ruins",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_elven_ruins_great_glade_01",
				"pbw_level_elven_ruins_great_glade_02",
				"pbw_level_elven_ruins_great_glade_03",
				"pbw_level_elven_ruins_great_glade_04"
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
				4.1735625267029,
				3.4187707901001,
				3.334166765213,
				4.6230626106262
			},
			localization_strings = {
				"pbw_level_elven_ruins_great_glade_01",
				"pbw_level_elven_ruins_great_glade_02",
				"pbw_level_elven_ruins_great_glade_03",
				"pbw_level_elven_ruins_great_glade_04"
			},
			randomize_indexes = {}
		}
	})
end
