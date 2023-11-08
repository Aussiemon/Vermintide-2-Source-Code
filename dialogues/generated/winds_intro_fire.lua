return function ()
	define_rule({
		name = "pbw_bright_weave_conversation_one_01",
		response = "pbw_bright_weave_conversation_one_01",
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
				"pbw_bright_weave_conversation_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_bright_weave_conversation_one_01",
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
		name = "pbw_bright_weave_conversation_two_01",
		response = "pbw_bright_weave_conversation_two_01",
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
				"pwe_bright_weave_conversation_two_01"
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
		name = "pbw_wind_fire_intro_banter_a",
		response = "pbw_wind_fire_intro_banter_a",
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
				"fire"
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
				"wind_fire_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_fire_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_wind_fire_intro_banter_b",
		response = "pbw_wind_fire_intro_banter_b",
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
				"wind_fire_intro_banter_a"
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
				"wind_fire_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_fire_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_wind_fire_intro_banter_a",
		response = "pdr_wind_fire_intro_banter_a",
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
				"fire"
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
				"wind_fire_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_fire_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_wind_fire_intro_banter_b",
		response = "pdr_wind_fire_intro_banter_b",
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
				"wind_fire_intro_banter_a"
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
				"wind_fire_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_fire_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wind_fire_intro_banter_a",
		response = "pes_wind_fire_intro_banter_a",
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
				"fire"
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
				"wind_fire_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_fire_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wind_fire_intro_banter_b",
		response = "pes_wind_fire_intro_banter_b",
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
				"wind_fire_intro_banter_a"
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
				"wind_fire_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_fire_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_bright_weave_conversation_three_01",
		response = "pwe_bright_weave_conversation_three_01",
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
				"pwe_bright_weave_conversation_three_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_bright_weave_conversation_three_01",
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
		name = "pwe_bright_weave_conversation_three_02",
		response = "pwe_bright_weave_conversation_three_02",
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
				"pwh_bright_weave_conversation_three_01"
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
	define_rule({
		name = "pwe_bright_weave_conversation_two_01",
		response = "pwe_bright_weave_conversation_two_01",
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
				"pwe_bright_weave_conversation_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_bright_weave_conversation_two_01",
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
		name = "pwe_wind_fire_intro_banter_a",
		response = "pwe_wind_fire_intro_banter_a",
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
				"fire"
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
				"wind_fire_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_fire_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_wind_fire_intro_banter_b",
		response = "pwe_wind_fire_intro_banter_b",
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
				"wind_fire_intro_banter_a"
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
				"wind_fire_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_fire_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_bright_weave_conversation_one_01",
		response = "pwh_bright_weave_conversation_one_01",
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
				"pwh_gold_weave_conversation_two_01"
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
		name = "pwh_bright_weave_conversation_three_01",
		response = "pwh_bright_weave_conversation_three_01",
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
				"pwe_bright_weave_conversation_three_01"
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
		name = "pwh_wind_fire_intro_banter_a",
		response = "pwh_wind_fire_intro_banter_a",
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
				"fire"
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
				"wind_fire_intro_banter_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_fire_intro_banter_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_wind_fire_intro_banter_b",
		response = "pwh_wind_fire_intro_banter_b",
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
				"wind_fire_intro_banter_a"
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
				"wind_fire_intro_banter_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wind_fire_intro_banter_b",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_bright_weave_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_fire",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_bright_weave_conversation_one_01"
			},
			sound_events = {
				[1.0] = "pbw_bright_weave_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 4.3720626831055
			}
		},
		pbw_bright_weave_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_fire",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bright_weave_conversation_two_01"
			},
			sound_events = {
				[1.0] = "pbw_bright_weave_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 8.0505208969116
			}
		},
		pbw_wind_fire_intro_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_fire",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wind_fire_intro_banter_a_01",
				[2.0] = "pbw_wind_fire_intro_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wind_fire_intro_banter_a_01",
				[2.0] = "pbw_wind_fire_intro_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.969291806221,
				[2.0] = 2.9650208950043
			}
		},
		pbw_wind_fire_intro_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_fire",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wind_fire_intro_banter_b_01",
				[2.0] = "pbw_wind_fire_intro_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wind_fire_intro_banter_b_01",
				[2.0] = "pbw_wind_fire_intro_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.5753750801086,
				[2.0] = 2.5181250572205
			}
		},
		pdr_wind_fire_intro_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_fire",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wind_fire_intro_banter_a_01",
				[2.0] = "pdr_wind_fire_intro_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wind_fire_intro_banter_a_01",
				[2.0] = "pdr_wind_fire_intro_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.4413542747498,
				[2.0] = 2.3242082595825
			}
		},
		pdr_wind_fire_intro_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_fire",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wind_fire_intro_banter_b_01",
				[2.0] = "pdr_wind_fire_intro_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pdr_wind_fire_intro_banter_b_01",
				[2.0] = "pdr_wind_fire_intro_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.7286875247955,
				[2.0] = 2.3691458702087
			}
		},
		pes_wind_fire_intro_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_fire",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wind_fire_intro_banter_a_01",
				[2.0] = "pes_wind_fire_intro_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wind_fire_intro_banter_a_01",
				[2.0] = "pes_wind_fire_intro_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 1.706270813942,
				[2.0] = 3.0153748989105
			}
		},
		pes_wind_fire_intro_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_fire",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wind_fire_intro_banter_b_01",
				[2.0] = "pes_wind_fire_intro_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_wind_fire_intro_banter_b_01",
				[2.0] = "pes_wind_fire_intro_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 3.4887707233429,
				[2.0] = 3.4174375534058
			}
		},
		pwe_bright_weave_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_fire",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_bright_weave_conversation_three_01"
			},
			sound_events = {
				[1.0] = "pwe_bright_weave_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 3.9950625896454
			}
		},
		pwe_bright_weave_conversation_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_fire",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_bright_weave_conversation_three_02"
			},
			sound_events = {
				[1.0] = "pwe_bright_weave_conversation_three_02"
			},
			sound_events_duration = {
				[1.0] = 5.079083442688
			}
		},
		pwe_bright_weave_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_fire",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_bright_weave_conversation_two_01"
			},
			sound_events = {
				[1.0] = "pwe_bright_weave_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 3.1670000553131
			}
		},
		pwe_wind_fire_intro_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_fire",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wind_fire_intro_banter_a_01",
				[2.0] = "pwe_wind_fire_intro_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wind_fire_intro_banter_a_01",
				[2.0] = "pwe_wind_fire_intro_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.6453332901001,
				[2.0] = 3.0882084369659
			}
		},
		pwe_wind_fire_intro_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_fire",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wind_fire_intro_banter_b_01",
				[2.0] = "pwe_wind_fire_intro_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wind_fire_intro_banter_b_01",
				[2.0] = "pwe_wind_fire_intro_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 3.1641042232513,
				[2.0] = 3.540020942688
			}
		},
		pwh_bright_weave_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_fire",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_bright_weave_conversation_one_01"
			},
			sound_events = {
				[1.0] = "pwh_bright_weave_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 5.3893752098083
			}
		},
		pwh_bright_weave_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "winds_intro_fire",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_bright_weave_conversation_three_01"
			},
			sound_events = {
				[1.0] = "pwh_bright_weave_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 5.7587084770203
			}
		},
		pwh_wind_fire_intro_banter_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_fire",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wind_fire_intro_banter_a_01",
				[2.0] = "pwh_wind_fire_intro_banter_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wind_fire_intro_banter_a_01",
				[2.0] = "pwh_wind_fire_intro_banter_a_02"
			},
			sound_events_duration = {
				[1.0] = 2.516562461853,
				[2.0] = 2.7459166049957
			}
		},
		pwh_wind_fire_intro_banter_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "winds_intro_fire",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wind_fire_intro_banter_b_01",
				[2.0] = "pwh_wind_fire_intro_banter_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_wind_fire_intro_banter_b_01",
				[2.0] = "pwh_wind_fire_intro_banter_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.1198749542236,
				[2.0] = 2.5912292003632
			}
		}
	})
end
