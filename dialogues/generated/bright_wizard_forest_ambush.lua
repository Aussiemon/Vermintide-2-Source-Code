return function ()
	define_rule({
		name = "pbw_objective_forest_ambush_reaching_skaven_camp",
		response = "pbw_objective_forest_ambush_reaching_skaven_camp",
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
		name = "pbw_objective_forest_ambush_finding_explosives",
		response = "pbw_objective_forest_ambush_finding_explosives",
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
		name = "pbw_objective_forest_ambush_doomwheel_objective_done",
		response = "pbw_objective_forest_ambush_doomwheel_objective_done",
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
		name = "pbw_objective_forest_ambush_back_to_ferry",
		response = "pbw_objective_forest_ambush_back_to_ferry",
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
		name = "pbw_objective_forest_ambush_ring_bell",
		response = "pbw_objective_forest_ambush_ring_bell",
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
		name = "pbw_objective_forest_ambush_crescendo_starting",
		response = "pbw_objective_forest_ambush_crescendo_starting",
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
		name = "pbw_objective_forest_ambush_boat_arrives",
		response = "pbw_objective_forest_ambush_boat_arrives",
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
		name = "pbw_objective_forest_ambush_spotting_bridge",
		response = "pbw_objective_forest_ambush_spotting_bridge",
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
		name = "pbw_objective_forest_ambush_spotting_watch_tower",
		response = "pbw_objective_forest_ambush_spotting_watch_tower",
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
		name = "pbw_objective_forest_ambush_spotting_ruins",
		response = "pbw_objective_forest_ambush_spotting_ruins",
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
		name = "pbw_objective_forest_ambush_spotting_coaching_inn",
		response = "pbw_objective_forest_ambush_spotting_coaching_inn",
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
		name = "pbw_objective_forest_ambush_spotting_trunk",
		response = "pbw_objective_forest_ambush_spotting_trunk",
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
		name = "pbw_objective_forest_ambush_spotting_first_doomwheel",
		response = "pbw_objective_forest_ambush_spotting_first_doomwheel",
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
		name = "pbw_objective_forest_ambush_spotting_lodge_ruins",
		response = "pbw_objective_forest_ambush_spotting_lodge_ruins",
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
		name = "pbw_objective_forest_ambush_spotting_broken_wagon",
		response = "pbw_objective_forest_ambush_spotting_broken_wagon",
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
		name = "pbw_forest_ambush_intro",
		response = "pbw_forest_ambush_intro",
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
		name = "pbw_forest_ambush_intro_b",
		response = "pbw_forest_ambush_intro_b",
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
				"bright_wizard"
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
		name = "pbw_forest_ambush_intro_c",
		response = "pbw_forest_ambush_intro_c",
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
				"bright_wizard"
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
		pbw_forest_ambush_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_forest_ambush_intro_c_01",
				[2.0] = "pbw_forest_ambush_intro_c_02"
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
				[1.0] = "pbw_forest_ambush_intro_c_01",
				[2.0] = "pbw_forest_ambush_intro_c_02"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_finding_explosives = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_finding_explosives_01",
				"pbw_objective_forest_ambush_finding_explosives_02",
				"pbw_objective_forest_ambush_finding_explosives_03",
				"pbw_objective_forest_ambush_finding_explosives_04"
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
				"pbw_objective_forest_ambush_finding_explosives_01",
				"pbw_objective_forest_ambush_finding_explosives_02",
				"pbw_objective_forest_ambush_finding_explosives_03",
				"pbw_objective_forest_ambush_finding_explosives_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_spotting_broken_wagon = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_spotting_broken_wagon_01",
				"pbw_objective_forest_ambush_spotting_broken_wagon_02",
				"pbw_objective_forest_ambush_spotting_broken_wagon_03",
				"pbw_objective_forest_ambush_spotting_broken_wagon_04"
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
				"pbw_objective_forest_ambush_spotting_broken_wagon_01",
				"pbw_objective_forest_ambush_spotting_broken_wagon_02",
				"pbw_objective_forest_ambush_spotting_broken_wagon_03",
				"pbw_objective_forest_ambush_spotting_broken_wagon_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_spotting_watch_tower = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_spotting_watch_tower_01",
				"pbw_objective_forest_ambush_spotting_watch_tower_02",
				"pbw_objective_forest_ambush_spotting_watch_tower_03",
				"pbw_objective_forest_ambush_spotting_watch_tower_04"
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
				"pbw_objective_forest_ambush_spotting_watch_tower_01",
				"pbw_objective_forest_ambush_spotting_watch_tower_02",
				"pbw_objective_forest_ambush_spotting_watch_tower_03",
				"pbw_objective_forest_ambush_spotting_watch_tower_04"
			},
			randomize_indexes = {}
		},
		pbw_forest_ambush_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_forest_ambush_intro_b_01",
				[2.0] = "pbw_forest_ambush_intro_b_02"
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
				[1.0] = "pbw_forest_ambush_intro_b_01",
				[2.0] = "pbw_forest_ambush_intro_b_02"
			},
			randomize_indexes = {}
		},
		pbw_forest_ambush_intro = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_forest_ambush_intro_a_01",
				[2.0] = "pbw_forest_ambush_intro_a_02"
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
				[1.0] = "pbw_forest_ambush_intro_a_01",
				[2.0] = "pbw_forest_ambush_intro_a_02"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_reaching_skaven_camp = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_reaching_skaven_camp_01",
				"pbw_objective_forest_ambush_reaching_skaven_camp_02",
				"pbw_objective_forest_ambush_reaching_skaven_camp_03",
				"pbw_objective_forest_ambush_reaching_skaven_camp_04"
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
				"pbw_objective_forest_ambush_reaching_skaven_camp_01",
				"pbw_objective_forest_ambush_reaching_skaven_camp_02",
				"pbw_objective_forest_ambush_reaching_skaven_camp_03",
				"pbw_objective_forest_ambush_reaching_skaven_camp_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_spotting_ruins = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_spotting_ruins_01",
				"pbw_objective_forest_ambush_spotting_ruins_02",
				"pbw_objective_forest_ambush_spotting_ruins_03",
				"pbw_objective_forest_ambush_spotting_ruins_04"
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
				"pbw_objective_forest_ambush_spotting_ruins_01",
				"pbw_objective_forest_ambush_spotting_ruins_02",
				"pbw_objective_forest_ambush_spotting_ruins_03",
				"pbw_objective_forest_ambush_spotting_ruins_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_ring_bell = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_ring_bell_01",
				"pbw_objective_forest_ambush_ring_bell_02",
				"pbw_objective_forest_ambush_ring_bell_03",
				"pbw_objective_forest_ambush_ring_bell_04"
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
				"pbw_objective_forest_ambush_ring_bell_01",
				"pbw_objective_forest_ambush_ring_bell_02",
				"pbw_objective_forest_ambush_ring_bell_03",
				"pbw_objective_forest_ambush_ring_bell_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_spotting_bridge = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_spotting_bridge_01",
				"pbw_objective_forest_ambush_spotting_bridge_02",
				"pbw_objective_forest_ambush_spotting_bridge_03",
				"pbw_objective_forest_ambush_spotting_bridge_04"
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
				"pbw_objective_forest_ambush_spotting_bridge_01",
				"pbw_objective_forest_ambush_spotting_bridge_02",
				"pbw_objective_forest_ambush_spotting_bridge_03",
				"pbw_objective_forest_ambush_spotting_bridge_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_spotting_coaching_inn = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_spotting_coaching_inn_01",
				"pbw_objective_forest_ambush_spotting_coaching_inn_02",
				"pbw_objective_forest_ambush_spotting_coaching_inn_03",
				"pbw_objective_forest_ambush_spotting_coaching_inn_04"
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
				"pbw_objective_forest_ambush_spotting_coaching_inn_01",
				"pbw_objective_forest_ambush_spotting_coaching_inn_02",
				"pbw_objective_forest_ambush_spotting_coaching_inn_03",
				"pbw_objective_forest_ambush_spotting_coaching_inn_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_spotting_lodge_ruins = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_spotting_lodge_ruins_01",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_02",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_03",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_04"
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
				"pbw_objective_forest_ambush_spotting_lodge_ruins_01",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_02",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_03",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_doomwheel_objective_done = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_doomwheel_objective_done_01",
				"pbw_objective_forest_ambush_doomwheel_objective_done_02",
				"pbw_objective_forest_ambush_doomwheel_objective_done_03",
				"pbw_objective_forest_ambush_doomwheel_objective_done_04"
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
				"pbw_objective_forest_ambush_doomwheel_objective_done_01",
				"pbw_objective_forest_ambush_doomwheel_objective_done_02",
				"pbw_objective_forest_ambush_doomwheel_objective_done_03",
				"pbw_objective_forest_ambush_doomwheel_objective_done_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_spotting_first_doomwheel = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_spotting_first_doomwheel_01",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_02",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_03",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_04"
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
				"pbw_objective_forest_ambush_spotting_first_doomwheel_01",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_02",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_03",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_boat_arrives = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_boat_arrives_01",
				"pbw_objective_forest_ambush_boat_arrives_02",
				"pbw_objective_forest_ambush_boat_arrives_03",
				"pbw_objective_forest_ambush_boat_arrives_04"
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
				"pbw_objective_forest_ambush_boat_arrives_01",
				"pbw_objective_forest_ambush_boat_arrives_02",
				"pbw_objective_forest_ambush_boat_arrives_03",
				"pbw_objective_forest_ambush_boat_arrives_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_back_to_ferry = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_back_to_ferry_01",
				"pbw_objective_forest_ambush_back_to_ferry_02",
				"pbw_objective_forest_ambush_back_to_ferry_03",
				"pbw_objective_forest_ambush_back_to_ferry_04"
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
				"pbw_objective_forest_ambush_back_to_ferry_01",
				"pbw_objective_forest_ambush_back_to_ferry_02",
				"pbw_objective_forest_ambush_back_to_ferry_03",
				"pbw_objective_forest_ambush_back_to_ferry_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_crescendo_starting = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_crescendo_starting_01",
				"pbw_objective_forest_ambush_crescendo_starting_02",
				"pbw_objective_forest_ambush_crescendo_starting_03",
				"pbw_objective_forest_ambush_crescendo_starting_04"
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
				"pbw_objective_forest_ambush_crescendo_starting_01",
				"pbw_objective_forest_ambush_crescendo_starting_02",
				"pbw_objective_forest_ambush_crescendo_starting_03",
				"pbw_objective_forest_ambush_crescendo_starting_04"
			},
			randomize_indexes = {}
		},
		pbw_objective_forest_ambush_spotting_trunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_forest_ambush",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_objective_forest_ambush_spotting_trunk_01",
				"pbw_objective_forest_ambush_spotting_trunk_02",
				"pbw_objective_forest_ambush_spotting_trunk_03",
				"pbw_objective_forest_ambush_spotting_trunk_04"
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
				"pbw_objective_forest_ambush_spotting_trunk_01",
				"pbw_objective_forest_ambush_spotting_trunk_02",
				"pbw_objective_forest_ambush_spotting_trunk_03",
				"pbw_objective_forest_ambush_spotting_trunk_04"
			},
			randomize_indexes = {}
		}
	})
end
