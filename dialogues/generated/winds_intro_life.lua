return function ()
	define_rule({
		name = "pwh_wind_life_intro_banter_a",
		response = "pwh_wind_life_intro_banter_a",
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
				"current_wind",
				OP.EQ,
				"life"
			},
			{
				"faction_memory",
				"wind_life_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_life_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wind_life_intro_banter_b",
		response = "pwh_wind_life_intro_banter_b",
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
				"wind_life_intro_banter_a"
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
				"wind_life_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_life_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_wind_life_intro_banter_a",
		response = "pbw_wind_life_intro_banter_a",
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
				"global_context",
				"current_wind",
				OP.EQ,
				"life"
			},
			{
				"faction_memory",
				"wind_life_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_life_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_wind_life_intro_banter_b",
		response = "pbw_wind_life_intro_banter_b",
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
				"wind_life_intro_banter_a"
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
				"wind_life_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_life_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wind_life_intro_banter_a",
		response = "pes_wind_life_intro_banter_a",
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
				"global_context",
				"current_wind",
				OP.EQ,
				"life"
			},
			{
				"faction_memory",
				"wind_life_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_life_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wind_life_intro_banter_b",
		response = "pes_wind_life_intro_banter_b",
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
				"wind_life_intro_banter_a"
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
				"wind_life_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_life_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_wind_life_intro_banter_a",
		response = "pdr_wind_life_intro_banter_a",
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
				"global_context",
				"current_wind",
				OP.EQ,
				"life"
			},
			{
				"faction_memory",
				"wind_life_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_life_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_wind_life_intro_banter_b",
		response = "pdr_wind_life_intro_banter_b",
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
				"wind_life_intro_banter_a"
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
				"wind_life_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_life_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_wind_life_intro_banter_a",
		response = "pwe_wind_life_intro_banter_a",
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
				"current_wind",
				OP.EQ,
				"life"
			},
			{
				"faction_memory",
				"wind_life_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_life_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_wind_life_intro_banter_b",
		response = "pwe_wind_life_intro_banter_b",
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
				"wind_life_intro_banter_a"
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
				"wind_life_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_life_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_jade_weave_conversation_one_01",
		response = "pwe_jade_weave_conversation_one_01",
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
				"pwe_jade_weave_conversation_one_01_var",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"pwe_jade_weave_conversation_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_jade_weave_conversation_one_01",
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
		name = "pbw_jade_weave_conversation_one_01",
		response = "pbw_jade_weave_conversation_one_01",
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
				"pwe_jade_weave_conversation_one_01"
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
		name = "pwe_jade_weave_conversation_one_01_var",
		response = "pwe_jade_weave_conversation_one_01_var",
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
				0
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
				"empire_soldier",
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
				"pwe_jade_weave_conversation_one_01",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"pwe_jade_weave_conversation_one_01_var",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_jade_weave_conversation_one_01_var",
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
		name = "pes_jade_weave_conversation_one_01_2nd_line_var",
		response = "pes_jade_weave_conversation_one_01_2nd_line_var",
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
				"pwe_jade_weave_conversation_one_01"
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
				"empire_soldier"
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
		name = "pbw_jade_weave_conversation_two_01",
		response = "pbw_jade_weave_conversation_two_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
				"pbw_jade_weave_conversation_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_jade_weave_conversation_two_01",
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
		name = "pwh_jade_weave_conversation_two_01",
		response = "pwh_jade_weave_conversation_two_01",
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
				"pbw_jade_weave_conversation_two_01"
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
		name = "pwh_jade_weave_conversation_three_01",
		response = "pwh_jade_weave_conversation_three_01",
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
				"wood_elf",
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
				"pwh_jade_weave_conversation_three_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_jade_weave_conversation_three_01",
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
		name = "pwe_jade_weave_conversation_three_02",
		response = "pwe_jade_weave_conversation_three_02",
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
				"pwh_jade_weave_conversation_three_01"
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
		pwe_jade_weave_conversation_one_01 = {
			face_animations_n = 1,
			database = "winds_intro_life",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_jade_weave_conversation_one_01"
			},
			sound_events = {
				[1.0] = "pwe_jade_weave_conversation_one_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.7223749160767
			}
		},
		pes_wind_life_intro_banter_a = {
			face_animations_n = 2,
			database = "winds_intro_life",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_wind_life_intro_banter_a_01",
				[2.0] = "pes_wind_life_intro_banter_a_02"
			},
			sound_events = {
				[1.0] = "pes_wind_life_intro_banter_a_01",
				[2.0] = "pes_wind_life_intro_banter_a_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.2995417118073,
				[2.0] = 2.5005416870117
			}
		},
		pwh_wind_life_intro_banter_a = {
			face_animations_n = 2,
			database = "winds_intro_life",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_wind_life_intro_banter_a_01",
				[2.0] = "pwh_wind_life_intro_banter_a_02"
			},
			sound_events = {
				[1.0] = "pwh_wind_life_intro_banter_a_01",
				[2.0] = "pwh_wind_life_intro_banter_a_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.5865623950958,
				[2.0] = 2.6844375133514
			}
		},
		pbw_wind_life_intro_banter_a = {
			face_animations_n = 2,
			database = "winds_intro_life",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pbw_wind_life_intro_banter_a_01",
				[2.0] = "pbw_wind_life_intro_banter_a_02"
			},
			sound_events = {
				[1.0] = "pbw_wind_life_intro_banter_a_01",
				[2.0] = "pbw_wind_life_intro_banter_a_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.8145208358765,
				[2.0] = 2.9224374294281
			}
		},
		pwe_wind_life_intro_banter_a = {
			face_animations_n = 2,
			database = "winds_intro_life",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_wind_life_intro_banter_a_01",
				[2.0] = "pwe_wind_life_intro_banter_a_02"
			},
			sound_events = {
				[1.0] = "pwe_wind_life_intro_banter_a_01",
				[2.0] = "pwe_wind_life_intro_banter_a_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.5313541889191,
				[2.0] = 2.7441041469574
			}
		},
		pdr_wind_life_intro_banter_a = {
			face_animations_n = 2,
			database = "winds_intro_life",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_wind_life_intro_banter_a_01",
				[2.0] = "pdr_wind_life_intro_banter_a_02"
			},
			sound_events = {
				[1.0] = "pdr_wind_life_intro_banter_a_01",
				[2.0] = "pdr_wind_life_intro_banter_a_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.4911458492279,
				[2.0] = 1.3418749570847
			}
		},
		pwe_jade_weave_conversation_one_01_var = {
			face_animations_n = 1,
			database = "winds_intro_life",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_jade_weave_conversation_one_01"
			},
			sound_events = {
				[1.0] = "pwe_jade_weave_conversation_one_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.7223749160767
			}
		},
		pdr_wind_life_intro_banter_b = {
			face_animations_n = 2,
			database = "winds_intro_life",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_wind_life_intro_banter_b_01",
				[2.0] = "pdr_wind_life_intro_banter_b_02"
			},
			sound_events = {
				[1.0] = "pdr_wind_life_intro_banter_b_01",
				[2.0] = "pdr_wind_life_intro_banter_b_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.5987083911896,
				[2.0] = 1.4959583282471
			}
		},
		pbw_jade_weave_conversation_two_01 = {
			face_animations_n = 1,
			database = "winds_intro_life",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_jade_weave_conversation_two_01"
			},
			sound_events = {
				[1.0] = "pbw_jade_weave_conversation_two_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.4339790344238
			}
		},
		pbw_jade_weave_conversation_one_01 = {
			face_animations_n = 1,
			database = "winds_intro_life",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_jade_weave_conversation_one_01"
			},
			sound_events = {
				[1.0] = "pbw_jade_weave_conversation_one_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.0624165534973
			}
		},
		pes_jade_weave_conversation_one_01_2nd_line_var = {
			face_animations_n = 1,
			database = "winds_intro_life",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_jade_weave_conversation_one_01_2nd_line_var"
			},
			sound_events = {
				[1.0] = "pes_jade_weave_conversation_one_01_2nd_line_var"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.1771667003632
			}
		},
		pes_wind_life_intro_banter_b = {
			face_animations_n = 2,
			database = "winds_intro_life",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_wind_life_intro_banter_b_01",
				[2.0] = "pes_wind_life_intro_banter_b_02"
			},
			sound_events = {
				[1.0] = "pes_wind_life_intro_banter_b_01",
				[2.0] = "pes_wind_life_intro_banter_b_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.353458404541,
				[2.0] = 2.2652082443237
			}
		},
		pwe_jade_weave_conversation_three_02 = {
			face_animations_n = 1,
			database = "winds_intro_life",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_jade_weave_conversation_three_02"
			},
			sound_events = {
				[1.0] = "pwe_jade_weave_conversation_three_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.6940832138061
			}
		},
		pbw_wind_life_intro_banter_b = {
			face_animations_n = 2,
			database = "winds_intro_life",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pbw_wind_life_intro_banter_b_01",
				[2.0] = "pbw_wind_life_intro_banter_b_02"
			},
			sound_events = {
				[1.0] = "pbw_wind_life_intro_banter_b_01",
				[2.0] = "pbw_wind_life_intro_banter_b_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.3374999761581,
				[2.0] = 2.864937543869
			}
		},
		pwh_jade_weave_conversation_three_01 = {
			face_animations_n = 1,
			database = "winds_intro_life",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_jade_weave_conversation_three_01"
			},
			sound_events = {
				[1.0] = "pwh_jade_weave_conversation_three_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.4827084541321
			}
		},
		pwe_wind_life_intro_banter_b = {
			face_animations_n = 2,
			database = "winds_intro_life",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_wind_life_intro_banter_b_01",
				[2.0] = "pwe_wind_life_intro_banter_b_02"
			},
			sound_events = {
				[1.0] = "pwe_wind_life_intro_banter_b_01",
				[2.0] = "pwe_wind_life_intro_banter_b_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.8618957996368,
				[2.0] = 2.17222905159
			}
		},
		pwh_jade_weave_conversation_two_01 = {
			face_animations_n = 1,
			database = "winds_intro_life",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_jade_weave_conversation_two_01"
			},
			sound_events = {
				[1.0] = "pwh_jade_weave_conversation_two_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.4058125019074
			}
		},
		pwh_wind_life_intro_banter_b = {
			face_animations_n = 2,
			database = "winds_intro_life",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_wind_life_intro_banter_b_01",
				[2.0] = "pwh_wind_life_intro_banter_b_02"
			},
			sound_events = {
				[1.0] = "pwh_wind_life_intro_banter_b_01",
				[2.0] = "pwh_wind_life_intro_banter_b_02"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.8029582500458,
				[2.0] = 3.3555417060852
			}
		}
	})
end
