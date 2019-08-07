return function ()
	define_rule({
		name = "pwh_wind_heavens_intro_banter_a",
		response = "pwh_wind_heavens_intro_banter_a",
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
				"wind_intro_banter_a"
			},
			{
				"global_context",
				"current_wind",
				OP.EQ,
				"heavens"
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
				"wind_heavens_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wind_heavens_intro_banter_b",
		response = "pwh_wind_heavens_intro_banter_b",
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
				"wind_heavens_intro_banter_a"
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
				"wind_heavens_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_wind_heavens_intro_banter_a",
		response = "pbw_wind_heavens_intro_banter_a",
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
				"wind_intro_banter_a"
			},
			{
				"global_context",
				"current_wind",
				OP.EQ,
				"heavens"
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
				"wind_heavens_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_wind_heavens_intro_banter_b",
		response = "pbw_wind_heavens_intro_banter_b",
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
				"wind_heavens_intro_banter_a"
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
				"wind_heavens_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wind_heavens_intro_banter_a",
		response = "pes_wind_heavens_intro_banter_a",
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
				"wind_intro_banter_a"
			},
			{
				"global_context",
				"current_wind",
				OP.EQ,
				"heavens"
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
				"wind_heavens_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wind_heavens_intro_banter_b",
		response = "pes_wind_heavens_intro_banter_b",
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
				"wind_heavens_intro_banter_a"
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
				"wind_heavens_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_wind_heavens_intro_banter_a",
		response = "pdr_wind_heavens_intro_banter_a",
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
				"wind_intro_banter_a"
			},
			{
				"global_context",
				"current_wind",
				OP.EQ,
				"heavens"
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
				"wind_heavens_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_wind_heavens_intro_banter_b",
		response = "pdr_wind_heavens_intro_banter_b",
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
				"wind_heavens_intro_banter_a"
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
				"wind_heavens_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_wind_heavens_intro_banter_a",
		response = "pwe_wind_heavens_intro_banter_a",
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
				"wind_intro_banter_a"
			},
			{
				"global_context",
				"current_wind",
				OP.EQ,
				"heavens"
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
				"wind_heavens_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_wind_heavens_intro_banter_b",
		response = "pwe_wind_heavens_intro_banter_b",
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
				"wind_heavens_intro_banter_a"
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
				"wind_heavens_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_celestial_weave_conversation_three_01",
		response = "pwh_celestial_weave_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
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
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pwh_celestial_weave_conversation_three_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_celestial_weave_conversation_three_01",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_celestial_weave_conversation_three_01",
		response = "pbw_celestial_weave_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_celestial_weave_conversation_three_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_celestial_weave_conversation_one_01",
		response = "pwe_celestial_weave_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pwe_celestial_weave_conversation_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_celestial_weave_conversation_one_01",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_celestial_weave_conversation_one_01",
		response = "pwh_celestial_weave_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_celestial_weave_conversation_one_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_celestial_weave_conversation_one_02",
		response = "pwe_celestial_weave_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_celestial_weave_conversation_one_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pes_wind_heavens_intro_banter_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_heavens",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_wind_heavens_intro_banter_a_01",
				[2.0] = "pes_wind_heavens_intro_banter_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wind_heavens_intro_banter_a_01",
				[2.0] = "pes_wind_heavens_intro_banter_a_02"
			},
			randomize_indexes = {}
		},
		pwe_wind_heavens_intro_banter_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_heavens",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_wind_heavens_intro_banter_b_01",
				[2.0] = "pwe_wind_heavens_intro_banter_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wind_heavens_intro_banter_b_01",
				[2.0] = "pwe_wind_heavens_intro_banter_b_02"
			},
			randomize_indexes = {}
		},
		pbw_wind_heavens_intro_banter_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_heavens",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_wind_heavens_intro_banter_b_01",
				[2.0] = "pbw_wind_heavens_intro_banter_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wind_heavens_intro_banter_b_01",
				[2.0] = "pbw_wind_heavens_intro_banter_b_02"
			},
			randomize_indexes = {}
		},
		pwh_celestial_weave_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_heavens",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_celestial_weave_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_celestial_weave_conversation_one_01"
			}
		},
		pwe_celestial_weave_conversation_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_heavens",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_celestial_weave_conversation_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_celestial_weave_conversation_one_02"
			}
		},
		pbw_wind_heavens_intro_banter_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_heavens",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_wind_heavens_intro_banter_a_01",
				[2.0] = "pbw_wind_heavens_intro_banter_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wind_heavens_intro_banter_a_01",
				[2.0] = "pbw_wind_heavens_intro_banter_a_02"
			},
			randomize_indexes = {}
		},
		pwh_celestial_weave_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_heavens",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_celestial_weave_conversation_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_celestial_weave_conversation_three_01"
			}
		},
		pdr_wind_heavens_intro_banter_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_heavens",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_wind_heavens_intro_banter_a_01",
				[2.0] = "pdr_wind_heavens_intro_banter_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wind_heavens_intro_banter_a_01",
				[2.0] = "pdr_wind_heavens_intro_banter_a_02"
			},
			randomize_indexes = {}
		},
		pes_wind_heavens_intro_banter_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_heavens",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_wind_heavens_intro_banter_b_01",
				[2.0] = "pes_wind_heavens_intro_banter_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wind_heavens_intro_banter_b_01",
				[2.0] = "pes_wind_heavens_intro_banter_b_02"
			},
			randomize_indexes = {}
		},
		pbw_celestial_weave_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_heavens",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_celestial_weave_conversation_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_celestial_weave_conversation_three_01"
			}
		},
		pwe_wind_heavens_intro_banter_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_heavens",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_wind_heavens_intro_banter_a_01",
				[2.0] = "pwe_wind_heavens_intro_banter_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wind_heavens_intro_banter_a_01",
				[2.0] = "pwe_wind_heavens_intro_banter_a_02"
			},
			randomize_indexes = {}
		},
		pwh_wind_heavens_intro_banter_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_heavens",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_wind_heavens_intro_banter_a_01",
				[2.0] = "pwh_wind_heavens_intro_banter_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wind_heavens_intro_banter_a_01",
				[2.0] = "pwh_wind_heavens_intro_banter_a_02"
			},
			randomize_indexes = {}
		},
		pwh_wind_heavens_intro_banter_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_heavens",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_wind_heavens_intro_banter_b_01",
				[2.0] = "pwh_wind_heavens_intro_banter_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wind_heavens_intro_banter_b_01",
				[2.0] = "pwh_wind_heavens_intro_banter_b_02"
			},
			randomize_indexes = {}
		},
		pdr_wind_heavens_intro_banter_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_heavens",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_wind_heavens_intro_banter_b_01",
				[2.0] = "pdr_wind_heavens_intro_banter_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wind_heavens_intro_banter_b_01",
				[2.0] = "pdr_wind_heavens_intro_banter_b_02"
			},
			randomize_indexes = {}
		},
		pwe_celestial_weave_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_heavens",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_celestial_weave_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_celestial_weave_conversation_one_01"
			}
		}
	})
end
