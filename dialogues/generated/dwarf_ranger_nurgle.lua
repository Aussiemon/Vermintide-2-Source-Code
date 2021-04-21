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
		pdr_level_nurgle_river = {
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_river_01",
				"pdr_level_nurgle_river_02",
				"pdr_level_nurgle_river_03",
				"pdr_level_nurgle_river_04"
			},
			sound_events = {
				"pdr_level_nurgle_river_01",
				"pdr_level_nurgle_river_02",
				"pdr_level_nurgle_river_03",
				"pdr_level_nurgle_river_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.7442290782928,
				4.5801458358765,
				2.6410000324249,
				3.8118124008179
			}
		},
		pdr_level_nurgle_skaven_collapse = {
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_skaven_collapse_01",
				"pdr_level_nurgle_skaven_collapse_02",
				"pdr_level_nurgle_skaven_collapse_03",
				"pdr_level_nurgle_skaven_collapse_04"
			},
			sound_events = {
				"pdr_level_nurgle_skaven_collapse_01",
				"pdr_level_nurgle_skaven_collapse_02",
				"pdr_level_nurgle_skaven_collapse_03",
				"pdr_level_nurgle_skaven_collapse_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.5858960151672,
				5.1330208778381,
				5.6378750801086,
				7.0721459388733
			}
		},
		pdr_nurgle_intro_c = {
			face_animations_n = 2,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_nurgle_intro_c_01",
				[2.0] = "pdr_nurgle_intro_c_02"
			},
			sound_events = {
				[1.0] = "pdr_nurgle_intro_c_01",
				[2.0] = "pdr_nurgle_intro_c_02"
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
				[1.0] = 8.1897287368774,
				[2.0] = 12.3578748703
			}
		},
		pdr_nurgle_intro_b = {
			face_animations_n = 2,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_nurgle_intro_b_01",
				[2.0] = "pdr_nurgle_intro_b_02"
			},
			sound_events = {
				[1.0] = "pdr_nurgle_intro_b_01",
				[2.0] = "pdr_nurgle_intro_b_02"
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
				[1.0] = 8.7668542861938,
				[2.0] = 9.5424585342407
			}
		},
		pdr_level_nurgle_outcast_lair = {
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_outcast_lair_01",
				"pdr_level_nurgle_outcast_lair_02",
				"pdr_level_nurgle_outcast_lair_03",
				"pdr_level_nurgle_outcast_lair_04"
			},
			sound_events = {
				"pdr_level_nurgle_outcast_lair_01",
				"pdr_level_nurgle_outcast_lair_02",
				"pdr_level_nurgle_outcast_lair_03",
				"pdr_level_nurgle_outcast_lair_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.4281873703003,
				4.6405835151672,
				7,
				5.8246665000916
			}
		},
		pdr_nurgle_intro_a = {
			face_animations_n = 2,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_nurgle_intro_a_01",
				[2.0] = "pdr_nurgle_intro_a_02"
			},
			sound_events = {
				[1.0] = "pdr_nurgle_intro_a_01",
				[2.0] = "pdr_nurgle_intro_a_02"
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
				[1.0] = 6.0226039886475,
				[2.0] = 7.5646247863769
			}
		},
		pdr_level_nurgle_swift_river = {
			face_animations_n = 3,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_swift_river_01",
				"pdr_level_nurgle_swift_river_02",
				"pdr_level_nurgle_swift_river_04"
			},
			sound_events = {
				"pdr_level_nurgle_swift_river_01",
				"pdr_level_nurgle_swift_river_02",
				"pdr_level_nurgle_swift_river_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.0960416793823,
				4.2201042175293,
				4.2268748283386
			}
		},
		pdr_level_nurgle_digsite = {
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_digsite_01",
				"pdr_level_nurgle_digsite_02",
				"pdr_level_nurgle_digsite_03",
				"pdr_level_nurgle_digsite_04"
			},
			sound_events = {
				"pdr_level_nurgle_digsite_01",
				"pdr_level_nurgle_digsite_02",
				"pdr_level_nurgle_digsite_03",
				"pdr_level_nurgle_digsite_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.8348751068115,
				1.7398958206177,
				2.325395822525,
				2.5513124465942
			}
		},
		pdr_level_nurgle_coming_down = {
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_coming_down_01",
				"pdr_level_nurgle_coming_down_02",
				"pdr_level_nurgle_coming_down_03",
				"pdr_level_nurgle_coming_down_04"
			},
			sound_events = {
				"pdr_level_nurgle_coming_down_01",
				"pdr_level_nurgle_coming_down_02",
				"pdr_level_nurgle_coming_down_03",
				"pdr_level_nurgle_coming_down_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.5545415878296,
				3.9698958396912,
				3.870500087738,
				5.5206875801086
			}
		},
		pdr_level_nurgle_ruins = {
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_ruins_01",
				"pdr_level_nurgle_ruins_02",
				"pdr_level_nurgle_ruins_03",
				"pdr_level_nurgle_ruins_04"
			},
			sound_events = {
				"pdr_level_nurgle_ruins_01",
				"pdr_level_nurgle_ruins_02",
				"pdr_level_nurgle_ruins_03",
				"pdr_level_nurgle_ruins_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.2727708816528,
				3.6241457462311,
				4.0157709121704,
				5.4194793701172
			}
		},
		pdr_level_nurgle_bury_objective = {
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_bury_objective_01",
				"pdr_level_nurgle_bury_objective_02",
				"pdr_level_nurgle_bury_objective_03",
				"pdr_level_nurgle_bury_objective_04"
			},
			sound_events = {
				"pdr_level_nurgle_bury_objective_01",
				"pdr_level_nurgle_bury_objective_02",
				"pdr_level_nurgle_bury_objective_03",
				"pdr_level_nurgle_bury_objective_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				6.2639999389648,
				5.3131666183472,
				6.3484582901001,
				5.5076251029968
			}
		},
		pdr_level_nurgle_spotting_objective = {
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_spotting_objective_01",
				"pdr_level_nurgle_spotting_objective_02",
				"pdr_level_nurgle_spotting_objective_03",
				"pdr_level_nurgle_spotting_objective_04"
			},
			sound_events = {
				"pdr_level_nurgle_spotting_objective_01",
				"pdr_level_nurgle_spotting_objective_02",
				"pdr_level_nurgle_spotting_objective_03",
				"pdr_level_nurgle_spotting_objective_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.0470623970032,
				4.6342082023621,
				6.8122081756592,
				5.8176040649414
			}
		},
		pdr_level_nurgle_nurglification = {
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_nurglification_01",
				"pdr_level_nurgle_nurglification_02",
				"pdr_level_nurgle_nurglification_03",
				"pdr_level_nurgle_nurglification_04"
			},
			sound_events = {
				"pdr_level_nurgle_nurglification_01",
				"pdr_level_nurgle_nurglification_02",
				"pdr_level_nurgle_nurglification_03",
				"pdr_level_nurgle_nurglification_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.3679790496826,
				6.2063956260681,
				5.5415625572205,
				6.4866251945496
			}
		},
		pdr_level_nurgle_nurglification_increase = {
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_nurglification_increase_01",
				"pdr_level_nurgle_nurglification_increase_02",
				"pdr_level_nurgle_nurglification_increase_03",
				"pdr_level_nurgle_nurglification_increase_04"
			},
			sound_events = {
				"pdr_level_nurgle_nurglification_increase_01",
				"pdr_level_nurgle_nurglification_increase_02",
				"pdr_level_nurgle_nurglification_increase_03",
				"pdr_level_nurgle_nurglification_increase_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				7.2811875343323,
				7.2309165000916,
				5.527458190918,
				8.772271156311
			}
		},
		pdr_level_nurgle_drop_down = {
			face_animations_n = 4,
			database = "dwarf_ranger_nurgle",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_nurgle_drop_down_01",
				"pdr_level_nurgle_drop_down_02",
				"pdr_level_nurgle_drop_down_03",
				"pdr_level_nurgle_drop_down_04"
			},
			sound_events = {
				"pdr_level_nurgle_drop_down_01",
				"pdr_level_nurgle_drop_down_02",
				"pdr_level_nurgle_drop_down_03",
				"pdr_level_nurgle_drop_down_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.1513957977295,
				3.5757708549499,
				2.672833442688,
				3.2512500286102
			}
		}
	})
end
