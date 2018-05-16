return function ()
	define_rule({
		name = "pdr_level_nurgle_ruins",
		response = "pdr_level_nurgle_ruins",
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
				"level_nurgle_ruins"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_nurgle_ruins",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_ruins",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_nurgle_outcast_lair",
		response = "pdr_level_nurgle_outcast_lair",
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
				"level_nurgle_outcast_lair"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_nurgle_outcast_lair",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_outcast_lair",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_nurgle_river",
		response = "pdr_level_nurgle_river",
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
				"level_nurgle_river"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_nurgle_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_nurgle_drop_down",
		response = "pdr_level_nurgle_drop_down",
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
				"level_nurgle_drop_down"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_nurgle_drop_down",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_drop_down",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_nurgle_swift_river",
		response = "pdr_level_nurgle_swift_river",
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
				"level_nurgle_swift_river"
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
				"level_nurgle_swift_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_swift_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_nurgle_nurglification",
		response = "pdr_level_nurgle_nurglification",
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
				"level_nurgle_nurglification"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_nurgle_nurglification",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_nurglification",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_nurgle_nurglification_increase",
		response = "pdr_level_nurgle_nurglification_increase",
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
				"level_nurgle_nurglification_increase"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_nurgle_nurglification_increase",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_nurglification_increase",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_nurgle_skaven_collapse",
		response = "pdr_level_nurgle_skaven_collapse",
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
				"level_nurgle_skaven_collapse"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_nurgle_skaven_collapse",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_skaven_collapse",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_nurgle_digsite",
		response = "pdr_level_nurgle_digsite",
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
				"level_nurgle_digsite"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_nurgle_digsite",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_digsite",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_nurgle_spotting_objective",
		response = "pdr_level_nurgle_spotting_objective",
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
				"level_nurgle_spotting_objective"
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
				"level_nurgle_spotting_objective",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_spotting_objective",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_nurgle_bury_objective",
		response = "pdr_level_nurgle_bury_objective",
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
				"level_nurgle_bury_objective"
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
				"level_nurgle_bury_objective",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_bury_objective",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_nurgle_coming_down",
		response = "pdr_level_nurgle_coming_down",
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
				"level_nurgle_coming_down"
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
				"level_nurgle_coming_down",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_coming_down",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_nurgle_intro_a",
		response = "pdr_nurgle_intro_a",
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
				"nurgle_intro_a"
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
				"nurgle_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_nurgle_intro_b",
		response = "pdr_nurgle_intro_b",
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
				"nurgle_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"nurgle_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_nurgle_intro_c",
		response = "pdr_nurgle_intro_c",
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
				"nurgle_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"nurgle_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pdr_level_nurgle_ruins = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_nurgle_ruins_01",
				"pdr_level_nurgle_ruins_02",
				"pdr_level_nurgle_ruins_03",
				"pdr_level_nurgle_ruins_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pdr_level_nurgle_ruins_01",
				"pdr_level_nurgle_ruins_02",
				"pdr_level_nurgle_ruins_03",
				"pdr_level_nurgle_ruins_04"
			},
			randomize_indexes = {}
		},
		pdr_level_nurgle_nurglification_increase = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_nurgle_nurglification_increase_01",
				"pdr_level_nurgle_nurglification_increase_02",
				"pdr_level_nurgle_nurglification_increase_03",
				"pdr_level_nurgle_nurglification_increase_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_level_nurgle_nurglification_increase_01",
				"pdr_level_nurgle_nurglification_increase_02",
				"pdr_level_nurgle_nurglification_increase_03",
				"pdr_level_nurgle_nurglification_increase_04"
			},
			randomize_indexes = {}
		},
		pdr_nurgle_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_nurgle_intro_c_01",
				[2.0] = "pdr_nurgle_intro_c_02"
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
				[1.0] = "pdr_nurgle_intro_c_01",
				[2.0] = "pdr_nurgle_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_nurgle_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_nurgle_intro_b_01",
				[2.0] = "pdr_nurgle_intro_b_02"
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
				[1.0] = "pdr_nurgle_intro_b_01",
				[2.0] = "pdr_nurgle_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_nurgle_drop_down = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_nurgle_drop_down_01",
				"pdr_level_nurgle_drop_down_02",
				"pdr_level_nurgle_drop_down_03",
				"pdr_level_nurgle_drop_down_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_level_nurgle_drop_down_01",
				"pdr_level_nurgle_drop_down_02",
				"pdr_level_nurgle_drop_down_03",
				"pdr_level_nurgle_drop_down_04"
			},
			randomize_indexes = {}
		},
		pdr_nurgle_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_nurgle_intro_a_01",
				[2.0] = "pdr_nurgle_intro_a_02"
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
				[1.0] = "pdr_nurgle_intro_a_01",
				[2.0] = "pdr_nurgle_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_level_nurgle_spotting_objective = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_nurgle_spotting_objective_01",
				"pdr_level_nurgle_spotting_objective_02",
				"pdr_level_nurgle_spotting_objective_03",
				"pdr_level_nurgle_spotting_objective_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_level_nurgle_spotting_objective_01",
				"pdr_level_nurgle_spotting_objective_02",
				"pdr_level_nurgle_spotting_objective_03",
				"pdr_level_nurgle_spotting_objective_04"
			},
			randomize_indexes = {}
		},
		pdr_level_nurgle_coming_down = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_nurgle_coming_down_01",
				"pdr_level_nurgle_coming_down_02",
				"pdr_level_nurgle_coming_down_03",
				"pdr_level_nurgle_coming_down_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_level_nurgle_coming_down_01",
				"pdr_level_nurgle_coming_down_02",
				"pdr_level_nurgle_coming_down_03",
				"pdr_level_nurgle_coming_down_04"
			},
			randomize_indexes = {}
		},
		pdr_level_nurgle_skaven_collapse = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_nurgle_skaven_collapse_01",
				"pdr_level_nurgle_skaven_collapse_02",
				"pdr_level_nurgle_skaven_collapse_03",
				"pdr_level_nurgle_skaven_collapse_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_level_nurgle_skaven_collapse_01",
				"pdr_level_nurgle_skaven_collapse_02",
				"pdr_level_nurgle_skaven_collapse_03",
				"pdr_level_nurgle_skaven_collapse_04"
			},
			randomize_indexes = {}
		},
		pdr_level_nurgle_bury_objective = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_nurgle_bury_objective_01",
				"pdr_level_nurgle_bury_objective_02",
				"pdr_level_nurgle_bury_objective_03",
				"pdr_level_nurgle_bury_objective_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_level_nurgle_bury_objective_01",
				"pdr_level_nurgle_bury_objective_02",
				"pdr_level_nurgle_bury_objective_03",
				"pdr_level_nurgle_bury_objective_04"
			},
			randomize_indexes = {}
		},
		pdr_level_nurgle_outcast_lair = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_nurgle_outcast_lair_01",
				"pdr_level_nurgle_outcast_lair_02",
				"pdr_level_nurgle_outcast_lair_03",
				"pdr_level_nurgle_outcast_lair_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pdr_level_nurgle_outcast_lair_01",
				"pdr_level_nurgle_outcast_lair_02",
				"pdr_level_nurgle_outcast_lair_03",
				"pdr_level_nurgle_outcast_lair_04"
			},
			randomize_indexes = {}
		},
		pdr_level_nurgle_digsite = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_nurgle_digsite_01",
				"pdr_level_nurgle_digsite_02",
				"pdr_level_nurgle_digsite_03",
				"pdr_level_nurgle_digsite_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_level_nurgle_digsite_01",
				"pdr_level_nurgle_digsite_02",
				"pdr_level_nurgle_digsite_03",
				"pdr_level_nurgle_digsite_04"
			},
			randomize_indexes = {}
		},
		pdr_level_nurgle_nurglification = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_nurgle_nurglification_01",
				"pdr_level_nurgle_nurglification_02",
				"pdr_level_nurgle_nurglification_03",
				"pdr_level_nurgle_nurglification_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_level_nurgle_nurglification_01",
				"pdr_level_nurgle_nurglification_02",
				"pdr_level_nurgle_nurglification_03",
				"pdr_level_nurgle_nurglification_04"
			},
			randomize_indexes = {}
		},
		pdr_level_nurgle_river = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_nurgle_river_01",
				"pdr_level_nurgle_river_02",
				"pdr_level_nurgle_river_03",
				"pdr_level_nurgle_river_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pdr_level_nurgle_river_01",
				"pdr_level_nurgle_river_02",
				"pdr_level_nurgle_river_03",
				"pdr_level_nurgle_river_04"
			},
			randomize_indexes = {}
		},
		pdr_level_nurgle_swift_river = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "dwarf_ranger_nurgle",
			category = "level_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pdr_level_nurgle_swift_river_01",
				"pdr_level_nurgle_swift_river_02",
				"pdr_level_nurgle_swift_river_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_level_nurgle_swift_river_01",
				"pdr_level_nurgle_swift_river_02",
				"pdr_level_nurgle_swift_river_04"
			},
			randomize_indexes = {}
		}
	})
end
