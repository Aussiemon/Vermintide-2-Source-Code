return function ()
	define_rule({
		name = "pes_objective_forest_ambush_reaching_skaven_camp",
		response = "pes_objective_forest_ambush_reaching_skaven_camp",
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
				"forest_ambush_reaching_skaven_camp"
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
				"time_since_forest_ambush_reaching_skaven_camp",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_reaching_skaven_camp",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_finding_explosives",
		response = "pes_objective_forest_ambush_finding_explosives",
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
				"forest_ambush_finding_explosives"
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
				"time_since_forest_ambush_finding_explosives",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_finding_explosives",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_doomwheel_objective_done",
		response = "pes_objective_forest_ambush_doomwheel_objective_done",
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
				"forest_ambush_doomwheel_objective_done"
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
				"time_since_forest_ambush_doomwheel_objective_done",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_doomwheel_objective_done",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_back_to_ferry",
		response = "pes_objective_forest_ambush_back_to_ferry",
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
				"forest_ambush_back_to_ferry"
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
				"time_since_forest_ambush_back_to_ferry",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_back_to_ferry",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_ring_bell",
		response = "pes_objective_forest_ambush_ring_bell",
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
				"forest_ambush_ring_bell"
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
				"time_since_forest_ambush_ring_bell",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_ring_bell",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_crescendo_starting",
		response = "pes_objective_forest_ambush_crescendo_starting",
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
				"forest_ambush_crescendo_starting"
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
				"time_since_forest_ambush_crescendo_starting",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_crescendo_starting",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_boat_arrives",
		response = "pes_objective_forest_ambush_boat_arrives",
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
				"forest_ambush_boat_arrives"
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
				"time_since_forest_ambush_boat_arrives",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_boat_arrives",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_spotting_bridge",
		response = "pes_objective_forest_ambush_spotting_bridge",
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
				"forest_ambush_spotting_bridge"
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
				"time_since_forest_ambush_spotting_bridge",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_bridge",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_spotting_watch_tower",
		response = "pes_objective_forest_ambush_spotting_watch_tower",
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
				"forest_ambush_spotting_watch_tower"
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
				"time_since_forest_ambush_spotting_watch_tower",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_watch_tower",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_spotting_ruins",
		response = "pes_objective_forest_ambush_spotting_ruins",
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
				"forest_ambush_spotting_ruins"
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
				"time_since_forest_ambush_spotting_ruins",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_ruins",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_spotting_coaching_inn",
		response = "pes_objective_forest_ambush_spotting_coaching_inn",
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
				"forest_ambush_spotting_coaching_inn"
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
				"time_since_forest_ambush_spotting_coaching_inn",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_coaching_inn",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_spotting_trunk",
		response = "pes_objective_forest_ambush_spotting_trunk",
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
				"forest_ambush_spotting_trunk"
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
				"time_since_forest_ambush_spotting_trunk",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_trunk",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_spotting_first_doomwheel",
		response = "pes_objective_forest_ambush_spotting_first_doomwheel",
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
				"forest_ambush_spotting_first_doomwheel"
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
				"time_since_forest_ambush_spotting_first_doomwheel",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_first_doomwheel",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_spotting_lodge_ruins",
		response = "pes_objective_forest_ambush_spotting_lodge_ruins",
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
				"forest_ambush_spotting_lodge_ruins"
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
				"time_since_forest_ambush_spotting_lodge_ruins",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_lodge_ruins",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_objective_forest_ambush_spotting_broken_wagon",
		response = "pes_objective_forest_ambush_spotting_broken_wagon",
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
				"forest_ambush_spotting_broken_wagon"
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
				"time_since_forest_ambush_spotting_broken_wagon",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_broken_wagon",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_forest_ambush_intro",
		response = "pes_forest_ambush_intro",
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
				"forest_ambush_intro"
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
				"time_since_forest_ambush_intro",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_intro",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_forest_ambush_intro_b",
		response = "pes_forest_ambush_intro_b",
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
				"forest_ambush_intro"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_forest_ambush_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_forest_ambush_intro_c",
		response = "pes_forest_ambush_intro_c",
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
				"forest_ambush_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_forest_ambush_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pes_objective_forest_ambush_back_to_ferry = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_back_to_ferry_01",
				"pes_objective_forest_ambush_back_to_ferry_02",
				"pes_objective_forest_ambush_back_to_ferry_03",
				"pes_objective_forest_ambush_back_to_ferry_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_back_to_ferry_01",
				"pes_objective_forest_ambush_back_to_ferry_02",
				"pes_objective_forest_ambush_back_to_ferry_03",
				"pes_objective_forest_ambush_back_to_ferry_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.2028124332428,
				1.6503125429153,
				4.0612292289734,
				2.9705834388733
			}
		},
		pes_objective_forest_ambush_reaching_skaven_camp = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_reaching_skaven_camp_01",
				"pes_objective_forest_ambush_reaching_skaven_camp_02",
				"pes_objective_forest_ambush_reaching_skaven_camp_03",
				"pes_objective_forest_ambush_reaching_skaven_camp_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_reaching_skaven_camp_01",
				"pes_objective_forest_ambush_reaching_skaven_camp_02",
				"pes_objective_forest_ambush_reaching_skaven_camp_03",
				"pes_objective_forest_ambush_reaching_skaven_camp_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.0616874694824,
				1.9731874465942,
				2.2230417728424,
				2.9316458702087
			}
		},
		pes_objective_forest_ambush_spotting_broken_wagon = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_spotting_broken_wagon_01",
				"pes_objective_forest_ambush_spotting_broken_wagon_02",
				"pes_objective_forest_ambush_spotting_broken_wagon_03",
				"pes_objective_forest_ambush_spotting_broken_wagon_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_spotting_broken_wagon_01",
				"pes_objective_forest_ambush_spotting_broken_wagon_02",
				"pes_objective_forest_ambush_spotting_broken_wagon_03",
				"pes_objective_forest_ambush_spotting_broken_wagon_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.8791251182556,
				1.2572083473206,
				1.4580625295639,
				1.3379374742508
			}
		},
		pes_forest_ambush_intro_b = {
			face_animations_n = 2,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_forest_ambush_intro_b_01",
				[2.0] = "pes_forest_ambush_intro_b_02"
			},
			sound_events = {
				[1.0] = "pes_forest_ambush_intro_b_01",
				[2.0] = "pes_forest_ambush_intro_b_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.5757501125336,
				[2.0] = 3.8884167671204
			}
		},
		pes_objective_forest_ambush_spotting_coaching_inn = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_spotting_coaching_inn_01",
				"pes_objective_forest_ambush_spotting_coaching_inn_02",
				"pes_objective_forest_ambush_spotting_coaching_inn_03",
				"pes_objective_forest_ambush_spotting_coaching_inn_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_spotting_coaching_inn_01",
				"pes_objective_forest_ambush_spotting_coaching_inn_02",
				"pes_objective_forest_ambush_spotting_coaching_inn_03",
				"pes_objective_forest_ambush_spotting_coaching_inn_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				0.85241669416428,
				2.2281250953674,
				3.7980625629425,
				0.93333333730698
			}
		},
		pes_objective_forest_ambush_crescendo_starting = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_crescendo_starting_01",
				"pes_objective_forest_ambush_crescendo_starting_02",
				"pes_objective_forest_ambush_crescendo_starting_03",
				"pes_objective_forest_ambush_crescendo_starting_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_crescendo_starting_01",
				"pes_objective_forest_ambush_crescendo_starting_02",
				"pes_objective_forest_ambush_crescendo_starting_03",
				"pes_objective_forest_ambush_crescendo_starting_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.6168124675751,
				2.1230416297913,
				1.8164166212082,
				1.5796874761581
			}
		},
		pes_objective_forest_ambush_spotting_ruins = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_spotting_ruins_01",
				"pes_objective_forest_ambush_spotting_ruins_02",
				"pes_objective_forest_ambush_spotting_ruins_03",
				"pes_objective_forest_ambush_spotting_ruins_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_spotting_ruins_01",
				"pes_objective_forest_ambush_spotting_ruins_02",
				"pes_objective_forest_ambush_spotting_ruins_03",
				"pes_objective_forest_ambush_spotting_ruins_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.9456666707993,
				3.7279167175293,
				1.5405207872391,
				3.5606353282928
			}
		},
		pes_objective_forest_ambush_spotting_first_doomwheel = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_spotting_first_doomwheel_01",
				"pes_objective_forest_ambush_spotting_first_doomwheel_02",
				"pes_objective_forest_ambush_spotting_first_doomwheel_03",
				"pes_objective_forest_ambush_spotting_first_doomwheel_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_spotting_first_doomwheel_01",
				"pes_objective_forest_ambush_spotting_first_doomwheel_02",
				"pes_objective_forest_ambush_spotting_first_doomwheel_03",
				"pes_objective_forest_ambush_spotting_first_doomwheel_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1452708244324,
				2.9336667060852,
				2.4978749752045,
				5.1306247711182
			}
		},
		pes_objective_forest_ambush_boat_arrives = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_boat_arrives_01",
				"pes_objective_forest_ambush_boat_arrives_02",
				"pes_objective_forest_ambush_boat_arrives_03",
				"pes_objective_forest_ambush_boat_arrives_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_boat_arrives_01",
				"pes_objective_forest_ambush_boat_arrives_02",
				"pes_objective_forest_ambush_boat_arrives_03",
				"pes_objective_forest_ambush_boat_arrives_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.0425000190735,
				0.77499997615814,
				0.6319375038147,
				1.3798333406448
			}
		},
		pes_objective_forest_ambush_finding_explosives = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_finding_explosives_01",
				"pes_objective_forest_ambush_finding_explosives_02",
				"pes_objective_forest_ambush_finding_explosives_03",
				"pes_objective_forest_ambush_finding_explosives_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_finding_explosives_01",
				"pes_objective_forest_ambush_finding_explosives_02",
				"pes_objective_forest_ambush_finding_explosives_03",
				"pes_objective_forest_ambush_finding_explosives_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.517874956131,
				2.5,
				2.3084375858307,
				2.5292499065399
			}
		},
		pes_forest_ambush_intro = {
			face_animations_n = 2,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_forest_ambush_intro_a_01",
				[2.0] = "pes_forest_ambush_intro_a_02"
			},
			sound_events = {
				[1.0] = "pes_forest_ambush_intro_a_01",
				[2.0] = "pes_forest_ambush_intro_a_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.4372708797455,
				[2.0] = 2.6786251068115
			}
		},
		pes_forest_ambush_intro_c = {
			face_animations_n = 2,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_forest_ambush_intro_c_01",
				[2.0] = "pes_forest_ambush_intro_c_02"
			},
			sound_events = {
				[1.0] = "pes_forest_ambush_intro_c_01",
				[2.0] = "pes_forest_ambush_intro_c_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.3410832881927,
				[2.0] = 2.7739999294281
			}
		},
		pes_objective_forest_ambush_spotting_trunk = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_spotting_trunk_01",
				"pes_objective_forest_ambush_spotting_trunk_02",
				"pes_objective_forest_ambush_spotting_trunk_03",
				"pes_objective_forest_ambush_spotting_trunk_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_spotting_trunk_01",
				"pes_objective_forest_ambush_spotting_trunk_02",
				"pes_objective_forest_ambush_spotting_trunk_03",
				"pes_objective_forest_ambush_spotting_trunk_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.8967499732971,
				3.1182916164398,
				2.1122915744781,
				1.3918958902359
			}
		},
		pes_objective_forest_ambush_ring_bell = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_ring_bell_01",
				"pes_objective_forest_ambush_ring_bell_02",
				"pes_objective_forest_ambush_ring_bell_03",
				"pes_objective_forest_ambush_ring_bell_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_ring_bell_01",
				"pes_objective_forest_ambush_ring_bell_02",
				"pes_objective_forest_ambush_ring_bell_03",
				"pes_objective_forest_ambush_ring_bell_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.6306458711624,
				2.0294582843781,
				3.3487915992737,
				2.4155209064484
			}
		},
		pes_objective_forest_ambush_doomwheel_objective_done = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_doomwheel_objective_done_01",
				"pes_objective_forest_ambush_doomwheel_objective_done_02",
				"pes_objective_forest_ambush_doomwheel_objective_done_03",
				"pes_objective_forest_ambush_doomwheel_objective_done_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_doomwheel_objective_done_01",
				"pes_objective_forest_ambush_doomwheel_objective_done_02",
				"pes_objective_forest_ambush_doomwheel_objective_done_03",
				"pes_objective_forest_ambush_doomwheel_objective_done_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.8449062108993,
				1.7062292098999,
				3.0207917690277,
				2.629604101181
			}
		},
		pes_objective_forest_ambush_spotting_lodge_ruins = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_spotting_lodge_ruins_01",
				"pes_objective_forest_ambush_spotting_lodge_ruins_02",
				"pes_objective_forest_ambush_spotting_lodge_ruins_03",
				"pes_objective_forest_ambush_spotting_lodge_ruins_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_spotting_lodge_ruins_01",
				"pes_objective_forest_ambush_spotting_lodge_ruins_02",
				"pes_objective_forest_ambush_spotting_lodge_ruins_03",
				"pes_objective_forest_ambush_spotting_lodge_ruins_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				6.2458748817444,
				4.2232084274292,
				6.1353960037231,
				4.6176772117615
			}
		},
		pes_objective_forest_ambush_spotting_bridge = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_spotting_bridge_01",
				"pes_objective_forest_ambush_spotting_bridge_02",
				"pes_objective_forest_ambush_spotting_bridge_03",
				"pes_objective_forest_ambush_spotting_bridge_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_spotting_bridge_01",
				"pes_objective_forest_ambush_spotting_bridge_02",
				"pes_objective_forest_ambush_spotting_bridge_03",
				"pes_objective_forest_ambush_spotting_bridge_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.1302291154861,
				1.1564166545868,
				2.1568124294281,
				1.017874956131
			}
		},
		pes_objective_forest_ambush_spotting_watch_tower = {
			face_animations_n = 4,
			database = "empire_soldier_forest_ambush",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_objective_forest_ambush_spotting_watch_tower_01",
				"pes_objective_forest_ambush_spotting_watch_tower_02",
				"pes_objective_forest_ambush_spotting_watch_tower_03",
				"pes_objective_forest_ambush_spotting_watch_tower_04"
			},
			sound_events = {
				"pes_objective_forest_ambush_spotting_watch_tower_01",
				"pes_objective_forest_ambush_spotting_watch_tower_02",
				"pes_objective_forest_ambush_spotting_watch_tower_03",
				"pes_objective_forest_ambush_spotting_watch_tower_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.8702917098999,
				1.4823958873749,
				1.4618124961853,
				2.220166683197
			}
		}
	})
end
