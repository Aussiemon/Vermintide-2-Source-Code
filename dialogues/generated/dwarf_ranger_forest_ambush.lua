return function ()
	define_rule({
		name = "pdr_forest_ambush_intro",
		response = "pdr_forest_ambush_intro",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_forest_ambush_intro_b",
		response = "pdr_forest_ambush_intro_b",
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
				"dwarf_ranger"
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
		name = "pdr_forest_ambush_intro_c",
		response = "pdr_forest_ambush_intro_c",
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
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_back_to_ferry",
		response = "pdr_objective_forest_ambush_back_to_ferry",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_boat_arrives",
		response = "pdr_objective_forest_ambush_boat_arrives",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_crescendo_starting",
		response = "pdr_objective_forest_ambush_crescendo_starting",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_doomwheel_objective_done",
		response = "pdr_objective_forest_ambush_doomwheel_objective_done",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_finding_explosives",
		response = "pdr_objective_forest_ambush_finding_explosives",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_reaching_skaven_camp",
		response = "pdr_objective_forest_ambush_reaching_skaven_camp",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_ring_bell",
		response = "pdr_objective_forest_ambush_ring_bell",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_spotting_bridge",
		response = "pdr_objective_forest_ambush_spotting_bridge",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_spotting_coaching_inn",
		response = "pdr_objective_forest_ambush_spotting_coaching_inn",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_spotting_first_doomwheel",
		response = "pdr_objective_forest_ambush_spotting_first_doomwheel",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_spotting_ruins",
		response = "pdr_objective_forest_ambush_spotting_ruins",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_spotting_trunk",
		response = "pdr_objective_forest_ambush_spotting_trunk",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_forest_ambush_spotting_watch_tower",
		response = "pdr_objective_forest_ambush_spotting_watch_tower",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		pdr_forest_ambush_intro = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_forest_ambush",
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
				[1.0] = "pdr_forest_ambush_intro_a_01",
				[2.0] = "pdr_forest_ambush_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_forest_ambush_intro_a_01",
				[2.0] = "pdr_forest_ambush_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 4.9276041984558,
				[2.0] = 3.4657292366028
			}
		},
		pdr_forest_ambush_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_forest_ambush",
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
				[1.0] = "pdr_forest_ambush_intro_b_01",
				[2.0] = "pdr_forest_ambush_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_forest_ambush_intro_b_01",
				[2.0] = "pdr_forest_ambush_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.4748959541321,
				[2.0] = 3.0017499923706
			}
		},
		pdr_forest_ambush_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_forest_ambush",
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
				[1.0] = "pdr_forest_ambush_intro_c_01",
				[2.0] = "pdr_forest_ambush_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_forest_ambush_intro_c_01",
				[2.0] = "pdr_forest_ambush_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 3.2580416202545,
				[2.0] = 2.9193749427795
			}
		},
		pdr_objective_forest_ambush_back_to_ferry = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_back_to_ferry_01",
				"pdr_objective_forest_ambush_back_to_ferry_02",
				"pdr_objective_forest_ambush_back_to_ferry_03",
				"pdr_objective_forest_ambush_back_to_ferry_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_back_to_ferry_01",
				"pdr_objective_forest_ambush_back_to_ferry_02",
				"pdr_objective_forest_ambush_back_to_ferry_03",
				"pdr_objective_forest_ambush_back_to_ferry_04"
			},
			sound_events_duration = {
				0.71060419082642,
				1.9992707967758,
				3.5546667575836,
				2.2718124389648
			}
		},
		pdr_objective_forest_ambush_boat_arrives = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_boat_arrives_01",
				"pdr_objective_forest_ambush_boat_arrives_02",
				"pdr_objective_forest_ambush_boat_arrives_03",
				"pdr_objective_forest_ambush_boat_arrives_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_boat_arrives_01",
				"pdr_objective_forest_ambush_boat_arrives_02",
				"pdr_objective_forest_ambush_boat_arrives_03",
				"pdr_objective_forest_ambush_boat_arrives_04"
			},
			sound_events_duration = {
				0.85000002384186,
				1.2641667127609,
				3.9430832862854,
				1.2961250543594
			}
		},
		pdr_objective_forest_ambush_crescendo_starting = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_crescendo_starting_01",
				"pdr_objective_forest_ambush_crescendo_starting_02",
				"pdr_objective_forest_ambush_crescendo_starting_03",
				"pdr_objective_forest_ambush_crescendo_starting_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_crescendo_starting_01",
				"pdr_objective_forest_ambush_crescendo_starting_02",
				"pdr_objective_forest_ambush_crescendo_starting_03",
				"pdr_objective_forest_ambush_crescendo_starting_04"
			},
			sound_events_duration = {
				2,
				3.6017916202545,
				6.5245833396912,
				0.71927082538605
			}
		},
		pdr_objective_forest_ambush_doomwheel_objective_done = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_doomwheel_objective_done_01",
				"pdr_objective_forest_ambush_doomwheel_objective_done_02",
				"pdr_objective_forest_ambush_doomwheel_objective_done_03",
				"pdr_objective_forest_ambush_doomwheel_objective_done_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_doomwheel_objective_done_01",
				"pdr_objective_forest_ambush_doomwheel_objective_done_02",
				"pdr_objective_forest_ambush_doomwheel_objective_done_03",
				"pdr_objective_forest_ambush_doomwheel_objective_done_04"
			},
			sound_events_duration = {
				1.8719791173935,
				3.0031666755676,
				3.0786874294281,
				2.4349167346954
			}
		},
		pdr_objective_forest_ambush_finding_explosives = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_finding_explosives_01",
				"pdr_objective_forest_ambush_finding_explosives_02",
				"pdr_objective_forest_ambush_finding_explosives_03",
				"pdr_objective_forest_ambush_finding_explosives_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_finding_explosives_01",
				"pdr_objective_forest_ambush_finding_explosives_02",
				"pdr_objective_forest_ambush_finding_explosives_03",
				"pdr_objective_forest_ambush_finding_explosives_04"
			},
			sound_events_duration = {
				4.1950626373291,
				2.8487915992737,
				3.7163124084473,
				3.2264583110809
			}
		},
		pdr_objective_forest_ambush_reaching_skaven_camp = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_reaching_skaven_camp_01",
				"pdr_objective_forest_ambush_reaching_skaven_camp_02",
				"pdr_objective_forest_ambush_reaching_skaven_camp_03",
				"pdr_objective_forest_ambush_reaching_skaven_camp_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_reaching_skaven_camp_01",
				"pdr_objective_forest_ambush_reaching_skaven_camp_02",
				"pdr_objective_forest_ambush_reaching_skaven_camp_03",
				"pdr_objective_forest_ambush_reaching_skaven_camp_04"
			},
			sound_events_duration = {
				1.9360208511352,
				3.5152292251587,
				2.720624923706,
				5.6372289657593
			}
		},
		pdr_objective_forest_ambush_ring_bell = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_forest_ambush",
			category = "player_feedback",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_objective_forest_ambush_ring_bell_01"
			},
			sound_events = {
				[1.0] = "pdr_objective_forest_ambush_ring_bell_01"
			},
			sound_events_duration = {
				[1.0] = 1.194375038147
			}
		},
		pdr_objective_forest_ambush_spotting_bridge = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_spotting_bridge_01",
				"pdr_objective_forest_ambush_spotting_bridge_02",
				"pdr_objective_forest_ambush_spotting_bridge_03",
				"pdr_objective_forest_ambush_spotting_bridge_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_spotting_bridge_01",
				"pdr_objective_forest_ambush_spotting_bridge_02",
				"pdr_objective_forest_ambush_spotting_bridge_03",
				"pdr_objective_forest_ambush_spotting_bridge_04"
			},
			sound_events_duration = {
				0.85312497615814,
				2.049708366394,
				2.3151874542236,
				1.6655625104904
			}
		},
		pdr_objective_forest_ambush_spotting_coaching_inn = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_spotting_coaching_inn_01",
				"pdr_objective_forest_ambush_spotting_coaching_inn_02",
				"pdr_objective_forest_ambush_spotting_coaching_inn_03",
				"pdr_objective_forest_ambush_spotting_coaching_inn_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_spotting_coaching_inn_01",
				"pdr_objective_forest_ambush_spotting_coaching_inn_02",
				"pdr_objective_forest_ambush_spotting_coaching_inn_03",
				"pdr_objective_forest_ambush_spotting_coaching_inn_04"
			},
			sound_events_duration = {
				2.3725416660309,
				1.9426250457764,
				2.0893957614899,
				1.7776875495911
			}
		},
		pdr_objective_forest_ambush_spotting_first_doomwheel = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_spotting_first_doomwheel_01",
				"pdr_objective_forest_ambush_spotting_first_doomwheel_02",
				"pdr_objective_forest_ambush_spotting_first_doomwheel_03",
				"pdr_objective_forest_ambush_spotting_first_doomwheel_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_spotting_first_doomwheel_01",
				"pdr_objective_forest_ambush_spotting_first_doomwheel_02",
				"pdr_objective_forest_ambush_spotting_first_doomwheel_03",
				"pdr_objective_forest_ambush_spotting_first_doomwheel_04"
			},
			sound_events_duration = {
				4.3349165916443,
				4.7958331108093,
				3.3401041030884,
				2.5383958816528
			}
		},
		pdr_objective_forest_ambush_spotting_ruins = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_spotting_ruins_01",
				"pdr_objective_forest_ambush_spotting_ruins_02",
				"pdr_objective_forest_ambush_spotting_ruins_03",
				"pdr_objective_forest_ambush_spotting_ruins_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_spotting_ruins_01",
				"pdr_objective_forest_ambush_spotting_ruins_02",
				"pdr_objective_forest_ambush_spotting_ruins_03",
				"pdr_objective_forest_ambush_spotting_ruins_04"
			},
			sound_events_duration = {
				2.0327084064484,
				3.4281041622162,
				2.7330000400543,
				3.1281666755676
			}
		},
		pdr_objective_forest_ambush_spotting_trunk = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_spotting_trunk_01",
				"pdr_objective_forest_ambush_spotting_trunk_02",
				"pdr_objective_forest_ambush_spotting_trunk_03",
				"pdr_objective_forest_ambush_spotting_trunk_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_spotting_trunk_01",
				"pdr_objective_forest_ambush_spotting_trunk_02",
				"pdr_objective_forest_ambush_spotting_trunk_03",
				"pdr_objective_forest_ambush_spotting_trunk_04"
			},
			sound_events_duration = {
				3.2739999294281,
				1.2503957748413,
				1.4872708320618,
				2.9344582557678
			}
		},
		pdr_objective_forest_ambush_spotting_watch_tower = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_forest_ambush",
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
				"pdr_objective_forest_ambush_spotting_watch_tower_01",
				"pdr_objective_forest_ambush_spotting_watch_tower_02",
				"pdr_objective_forest_ambush_spotting_watch_tower_03",
				"pdr_objective_forest_ambush_spotting_watch_tower_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_spotting_watch_tower_01",
				"pdr_objective_forest_ambush_spotting_watch_tower_02",
				"pdr_objective_forest_ambush_spotting_watch_tower_03",
				"pdr_objective_forest_ambush_spotting_watch_tower_04"
			},
			sound_events_duration = {
				2.5332915782928,
				1.3034374713898,
				3.2565624713898,
				2.8687083721161
			}
		}
	})
end
