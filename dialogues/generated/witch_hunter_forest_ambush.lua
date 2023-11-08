return function ()
	define_rule({
		name = "pwh_forest_ambush_intro",
		response = "pwh_forest_ambush_intro",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_forest_ambush_intro_b",
		response = "pwh_forest_ambush_intro_b",
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
				"witch_hunter"
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
		name = "pwh_forest_ambush_intro_c",
		response = "pwh_forest_ambush_intro_c",
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
				"witch_hunter"
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
	define_rule({
		name = "pwh_objective_forest_ambush_back_to_ferry",
		response = "pwh_objective_forest_ambush_back_to_ferry",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_boat_arrives",
		response = "pwh_objective_forest_ambush_boat_arrives",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_crescendo_starting",
		response = "pwh_objective_forest_ambush_crescendo_starting",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_doomwheel_objective_done",
		response = "pwh_objective_forest_ambush_doomwheel_objective_done",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_finding_explosives",
		response = "pwh_objective_forest_ambush_finding_explosives",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_reaching_skaven_camp",
		response = "pwh_objective_forest_ambush_reaching_skaven_camp",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_ring_bell",
		response = "pwh_objective_forest_ambush_ring_bell",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_spotting_bridge",
		response = "pwh_objective_forest_ambush_spotting_bridge",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_spotting_broken_wagon",
		response = "pwh_objective_forest_ambush_spotting_broken_wagon",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_spotting_coaching_inn",
		response = "pwh_objective_forest_ambush_spotting_coaching_inn",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_spotting_first_doomwheel",
		response = "pwh_objective_forest_ambush_spotting_first_doomwheel",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_spotting_lodge_ruins",
		response = "pwh_objective_forest_ambush_spotting_lodge_ruins",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_spotting_ruins",
		response = "pwh_objective_forest_ambush_spotting_ruins",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_spotting_trunk",
		response = "pwh_objective_forest_ambush_spotting_trunk",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_objective_forest_ambush_spotting_watch_tower",
		response = "pwh_objective_forest_ambush_spotting_watch_tower",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
	add_dialogues({
		pwh_forest_ambush_intro = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_forest_ambush",
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
				[1.0] = "pwh_forest_ambush_intro_a_01",
				[2.0] = "pwh_forest_ambush_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_forest_ambush_intro_a_01",
				[2.0] = "pwh_forest_ambush_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.0649583339691,
				[2.0] = 3.4363541603088
			}
		},
		pwh_forest_ambush_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_forest_ambush",
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
				[1.0] = "pwh_forest_ambush_intro_b_01",
				[2.0] = "pwh_forest_ambush_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_forest_ambush_intro_b_01",
				[2.0] = "pwh_forest_ambush_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.8750624656677,
				[2.0] = 4.8032917976379
			}
		},
		pwh_forest_ambush_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_forest_ambush",
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
				[1.0] = "pwh_forest_ambush_intro_c_01",
				[2.0] = "pwh_forest_ambush_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_forest_ambush_intro_c_01",
				[2.0] = "pwh_forest_ambush_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 3.8222916126251,
				[2.0] = 2.5718958377838
			}
		},
		pwh_objective_forest_ambush_back_to_ferry = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_back_to_ferry_01",
				"pwh_objective_forest_ambush_back_to_ferry_02",
				"pwh_objective_forest_ambush_back_to_ferry_03",
				"pwh_objective_forest_ambush_back_to_ferry_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_back_to_ferry_01",
				"pwh_objective_forest_ambush_back_to_ferry_02",
				"pwh_objective_forest_ambush_back_to_ferry_03",
				"pwh_objective_forest_ambush_back_to_ferry_04"
			},
			sound_events_duration = {
				4.4431457519531,
				2.8795416355133,
				4.6130418777466,
				3.5479791164398
			}
		},
		pwh_objective_forest_ambush_boat_arrives = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_boat_arrives_01",
				"pwh_objective_forest_ambush_boat_arrives_02",
				"pwh_objective_forest_ambush_boat_arrives_03",
				"pwh_objective_forest_ambush_boat_arrives_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_boat_arrives_01",
				"pwh_objective_forest_ambush_boat_arrives_02",
				"pwh_objective_forest_ambush_boat_arrives_03",
				"pwh_objective_forest_ambush_boat_arrives_04"
			},
			sound_events_duration = {
				1.1015416383743,
				2.0301666259766,
				2.6105833053589,
				1.6853333711624
			}
		},
		pwh_objective_forest_ambush_crescendo_starting = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_crescendo_starting_01",
				"pwh_objective_forest_ambush_crescendo_starting_02",
				"pwh_objective_forest_ambush_crescendo_starting_03",
				"pwh_objective_forest_ambush_crescendo_starting_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_crescendo_starting_01",
				"pwh_objective_forest_ambush_crescendo_starting_02",
				"pwh_objective_forest_ambush_crescendo_starting_03",
				"pwh_objective_forest_ambush_crescendo_starting_04"
			},
			sound_events_duration = {
				2.7158124446869,
				4.8415622711182,
				5.0608539581299,
				5.2053127288818
			}
		},
		pwh_objective_forest_ambush_doomwheel_objective_done = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_doomwheel_objective_done_01",
				"pwh_objective_forest_ambush_doomwheel_objective_done_02",
				"pwh_objective_forest_ambush_doomwheel_objective_done_03",
				"pwh_objective_forest_ambush_doomwheel_objective_done_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_doomwheel_objective_done_01",
				"pwh_objective_forest_ambush_doomwheel_objective_done_02",
				"pwh_objective_forest_ambush_doomwheel_objective_done_03",
				"pwh_objective_forest_ambush_doomwheel_objective_done_04"
			},
			sound_events_duration = {
				3.4138123989105,
				4.1237916946411,
				4.3378958702087,
				3.7784583568573
			}
		},
		pwh_objective_forest_ambush_finding_explosives = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_finding_explosives_01",
				"pwh_objective_forest_ambush_finding_explosives_02",
				"pwh_objective_forest_ambush_finding_explosives_03",
				"pwh_objective_forest_ambush_finding_explosives_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_finding_explosives_01",
				"pwh_objective_forest_ambush_finding_explosives_02",
				"pwh_objective_forest_ambush_finding_explosives_03",
				"pwh_objective_forest_ambush_finding_explosives_04"
			},
			sound_events_duration = {
				3.9742500782013,
				3.4910833835602,
				4.805645942688,
				4.6984376907349
			}
		},
		pwh_objective_forest_ambush_reaching_skaven_camp = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_reaching_skaven_camp_01",
				"pwh_objective_forest_ambush_reaching_skaven_camp_02",
				"pwh_objective_forest_ambush_reaching_skaven_camp_03",
				"pwh_objective_forest_ambush_reaching_skaven_camp_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_reaching_skaven_camp_01",
				"pwh_objective_forest_ambush_reaching_skaven_camp_02",
				"pwh_objective_forest_ambush_reaching_skaven_camp_03",
				"pwh_objective_forest_ambush_reaching_skaven_camp_04"
			},
			sound_events_duration = {
				6.945812702179,
				5.7699375152588,
				5.9624166488647,
				6.2432293891907
			}
		},
		pwh_objective_forest_ambush_ring_bell = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
			sound_events_n = 4,
			category = "player_feedback",
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
				"pwh_objective_forest_ambush_ring_bell_01",
				"pwh_objective_forest_ambush_ring_bell_02",
				"pwh_objective_forest_ambush_ring_bell_03",
				"pwh_objective_forest_ambush_ring_bell_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_ring_bell_01",
				"pwh_objective_forest_ambush_ring_bell_02",
				"pwh_objective_forest_ambush_ring_bell_03",
				"pwh_objective_forest_ambush_ring_bell_04"
			},
			sound_events_duration = {
				2.0468332767487,
				4.1363124847412,
				5.7446250915527,
				3.7992498874664
			}
		},
		pwh_objective_forest_ambush_spotting_bridge = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_spotting_bridge_01",
				"pwh_objective_forest_ambush_spotting_bridge_02",
				"pwh_objective_forest_ambush_spotting_bridge_03",
				"pwh_objective_forest_ambush_spotting_bridge_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_spotting_bridge_01",
				"pwh_objective_forest_ambush_spotting_bridge_02",
				"pwh_objective_forest_ambush_spotting_bridge_03",
				"pwh_objective_forest_ambush_spotting_bridge_04"
			},
			sound_events_duration = {
				2.0553123950958,
				3.4140832424164,
				1.5814791917801,
				1.8647083044052
			}
		},
		pwh_objective_forest_ambush_spotting_broken_wagon = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_spotting_broken_wagon_01",
				"pwh_objective_forest_ambush_spotting_broken_wagon_02",
				"pwh_objective_forest_ambush_spotting_broken_wagon_03",
				"pwh_objective_forest_ambush_spotting_broken_wagon_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_spotting_broken_wagon_01",
				"pwh_objective_forest_ambush_spotting_broken_wagon_02",
				"pwh_objective_forest_ambush_spotting_broken_wagon_03",
				"pwh_objective_forest_ambush_spotting_broken_wagon_04"
			},
			sound_events_duration = {
				4.7719583511353,
				3.7915000915527,
				5.8000001907349,
				5.5507917404175
			}
		},
		pwh_objective_forest_ambush_spotting_coaching_inn = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_spotting_coaching_inn_01",
				"pwh_objective_forest_ambush_spotting_coaching_inn_02",
				"pwh_objective_forest_ambush_spotting_coaching_inn_03",
				"pwh_objective_forest_ambush_spotting_coaching_inn_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_spotting_coaching_inn_01",
				"pwh_objective_forest_ambush_spotting_coaching_inn_02",
				"pwh_objective_forest_ambush_spotting_coaching_inn_03",
				"pwh_objective_forest_ambush_spotting_coaching_inn_04"
			},
			sound_events_duration = {
				2.4703333377838,
				2.8575415611267,
				2.1939375400543,
				3.5334374904633
			}
		},
		pwh_objective_forest_ambush_spotting_first_doomwheel = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_spotting_first_doomwheel_01",
				"pwh_objective_forest_ambush_spotting_first_doomwheel_02",
				"pwh_objective_forest_ambush_spotting_first_doomwheel_03",
				"pwh_objective_forest_ambush_spotting_first_doomwheel_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_spotting_first_doomwheel_01",
				"pwh_objective_forest_ambush_spotting_first_doomwheel_02",
				"pwh_objective_forest_ambush_spotting_first_doomwheel_03",
				"pwh_objective_forest_ambush_spotting_first_doomwheel_04"
			},
			sound_events_duration = {
				5.1891250610352,
				5.8108959197998,
				5.2631669044495,
				3.3738124370575
			}
		},
		pwh_objective_forest_ambush_spotting_lodge_ruins = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_spotting_lodge_ruins_01",
				"pwh_objective_forest_ambush_spotting_lodge_ruins_02",
				"pwh_objective_forest_ambush_spotting_lodge_ruins_03",
				"pwh_objective_forest_ambush_spotting_lodge_ruins_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_spotting_lodge_ruins_01",
				"pwh_objective_forest_ambush_spotting_lodge_ruins_02",
				"pwh_objective_forest_ambush_spotting_lodge_ruins_03",
				"pwh_objective_forest_ambush_spotting_lodge_ruins_04"
			},
			sound_events_duration = {
				8.4282503128052,
				6.2415623664856,
				8.1663331985474,
				7.529812335968
			}
		},
		pwh_objective_forest_ambush_spotting_ruins = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_spotting_ruins_01",
				"pwh_objective_forest_ambush_spotting_ruins_02",
				"pwh_objective_forest_ambush_spotting_ruins_03",
				"pwh_objective_forest_ambush_spotting_ruins_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_spotting_ruins_01",
				"pwh_objective_forest_ambush_spotting_ruins_02",
				"pwh_objective_forest_ambush_spotting_ruins_03",
				"pwh_objective_forest_ambush_spotting_ruins_04"
			},
			sound_events_duration = {
				3.9742708206177,
				6.2985835075378,
				5.1447706222534,
				3.4718542098999
			}
		},
		pwh_objective_forest_ambush_spotting_trunk = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_spotting_trunk_01",
				"pwh_objective_forest_ambush_spotting_trunk_02",
				"pwh_objective_forest_ambush_spotting_trunk_03",
				"pwh_objective_forest_ambush_spotting_trunk_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_spotting_trunk_01",
				"pwh_objective_forest_ambush_spotting_trunk_02",
				"pwh_objective_forest_ambush_spotting_trunk_03",
				"pwh_objective_forest_ambush_spotting_trunk_04"
			},
			sound_events_duration = {
				4.2152915000916,
				3.3174166679382,
				2.4510207176209,
				3.1588542461395
			}
		},
		pwh_objective_forest_ambush_spotting_watch_tower = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_forest_ambush",
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
				"pwh_objective_forest_ambush_spotting_watch_tower_01",
				"pwh_objective_forest_ambush_spotting_watch_tower_02",
				"pwh_objective_forest_ambush_spotting_watch_tower_03",
				"pwh_objective_forest_ambush_spotting_watch_tower_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_spotting_watch_tower_01",
				"pwh_objective_forest_ambush_spotting_watch_tower_02",
				"pwh_objective_forest_ambush_spotting_watch_tower_03",
				"pwh_objective_forest_ambush_spotting_watch_tower_04"
			},
			sound_events_duration = {
				2.6624791622162,
				1.8191250562668,
				2.3138959407806,
				3.4567
			}
		}
	})
end
