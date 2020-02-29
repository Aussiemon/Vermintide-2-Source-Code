return function ()
	define_rule({
		name = "pwh_level_nurgle_outcast_lair",
		response = "pwh_level_nurgle_outcast_lair",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_nurgle_river",
		response = "pwh_level_nurgle_river",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_nurgle_drop_down",
		response = "pwh_level_nurgle_drop_down",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_nurgle_swift_river",
		response = "pwh_level_nurgle_swift_river",
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
		name = "pwh_level_nurgle_nurglification",
		response = "pwh_level_nurgle_nurglification",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_nurgle_nurglification_increase",
		response = "pwh_level_nurgle_nurglification_increase",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_nurgle_skaven_collapse",
		response = "pwh_level_nurgle_skaven_collapse",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_nurgle_digsite",
		response = "pwh_level_nurgle_digsite",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_nurgle_spotting_objective",
		response = "pwh_level_nurgle_spotting_objective",
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
		name = "pwh_level_nurgle_bury_objective",
		response = "pwh_level_nurgle_bury_objective",
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
		name = "pwh_level_nurgle_coming_down",
		response = "pwh_level_nurgle_coming_down",
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
		name = "pwh_nurgle_intro_a",
		response = "pwh_nurgle_intro_a",
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
		name = "pwh_nurgle_intro_b",
		response = "pwh_nurgle_intro_b",
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
				"witch_hunter"
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
	add_dialogues({
		pwh_level_nurgle_spotting_objective = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_nurgle",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_nurgle_spotting_objective_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 6.2820625305176
			},
			localization_strings = {
				[1.0] = "pwh_level_nurgle_spotting_objective_01"
			}
		},
		pwh_nurgle_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "witch_hunter_nurgle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_nurgle_intro_a_01",
				[2.0] = "pwh_nurgle_intro_a_02"
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
				[1.0] = 8.3753747940063,
				[2.0] = 8.6943330764771
			},
			localization_strings = {
				[1.0] = "pwh_nurgle_intro_a_01",
				[2.0] = "pwh_nurgle_intro_a_02"
			},
			randomize_indexes = {}
		},
		pwh_level_nurgle_skaven_collapse = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_nurgle",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_nurgle_skaven_collapse_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 6.7491250038147
			},
			localization_strings = {
				[1.0] = "pwh_level_nurgle_skaven_collapse_01"
			}
		},
		pwh_nurgle_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "witch_hunter_nurgle",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_nurgle_intro_b_01",
				[2.0] = "pwh_nurgle_intro_b_02"
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
				[1.0] = 8.8635416030884,
				[2.0] = 8.6546669006348
			},
			localization_strings = {
				[1.0] = "pwh_nurgle_intro_b_01",
				[2.0] = "pwh_nurgle_intro_b_02"
			},
			randomize_indexes = {}
		},
		pwh_level_nurgle_river = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_nurgle",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_nurgle_river_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.6269791126251
			},
			localization_strings = {
				[1.0] = "pwh_level_nurgle_river_01"
			}
		},
		pwh_level_nurgle_nurglification_increase = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_nurgle",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_nurgle_nurglification_increase_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 4.790020942688
			},
			localization_strings = {
				[1.0] = "pwh_level_nurgle_nurglification_increase_01"
			}
		},
		pwh_level_nurgle_bury_objective = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_nurgle",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_nurgle_bury_objective_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 5.7862915992737
			},
			localization_strings = {
				[1.0] = "pwh_level_nurgle_bury_objective_01"
			}
		},
		pwh_level_nurgle_nurglification = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_nurgle",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_nurgle_nurglification_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 4.2301459312439
			},
			localization_strings = {
				[1.0] = "pwh_level_nurgle_nurglification_01"
			}
		},
		pwh_level_nurgle_digsite = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_nurgle",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_nurgle_digsite_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 3.4481041431427
			},
			localization_strings = {
				[1.0] = "pwh_level_nurgle_digsite_01"
			}
		},
		pwh_level_nurgle_swift_river = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_nurgle",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_nurgle_swift_river_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			sound_events_duration = {
				[1.0] = 3.3006665706634
			},
			localization_strings = {
				[1.0] = "pwh_level_nurgle_swift_river_01"
			}
		},
		pwh_level_nurgle_drop_down = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_nurgle",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_nurgle_drop_down_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			sound_events_duration = {
				[1.0] = 4.0208334922791
			},
			localization_strings = {
				[1.0] = "pwh_level_nurgle_drop_down_01"
			}
		},
		pwh_level_nurgle_outcast_lair = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_nurgle",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_nurgle_outcast_lair_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.6056041717529
			},
			localization_strings = {
				[1.0] = "pwh_level_nurgle_outcast_lair_01"
			}
		},
		pwh_level_nurgle_coming_down = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_nurgle",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_nurgle_coming_down_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 5.8908748626709
			},
			localization_strings = {
				[1.0] = "pwh_level_nurgle_coming_down_01"
			}
		}
	})
end
