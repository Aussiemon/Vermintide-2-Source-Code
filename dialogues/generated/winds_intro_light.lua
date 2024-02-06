-- chunkname: @dialogues/generated/winds_intro_light.lua

return function ()
	define_rule({
		name = "pbw_light_weave_conversation_two_01",
		response = "pbw_light_weave_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"pbw_light_weave_conversation_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_light_weave_conversation_two_01",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_light_weave_conversation_two_02",
		response = "pbw_light_weave_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_light_weave_conversation_two_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_wind_light_intro_banter_a",
		response = "pbw_wind_light_intro_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wind_intro_banter_a",
			},
			{
				"global_context",
				"current_wind",
				OP.EQ,
				"light",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wind_light_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_light_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wind_light_intro_banter_b",
		response = "pbw_wind_light_intro_banter_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"wind_light_intro_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"wind_light_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_light_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wind_light_intro_banter_a",
		response = "pdr_wind_light_intro_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wind_intro_banter_a",
			},
			{
				"global_context",
				"current_wind",
				OP.EQ,
				"light",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"wind_light_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_light_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wind_light_intro_banter_b",
		response = "pdr_wind_light_intro_banter_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"wind_light_intro_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"wind_light_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_light_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_wind_light_intro_banter_a",
		response = "pes_wind_light_intro_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wind_intro_banter_a",
			},
			{
				"global_context",
				"current_wind",
				OP.EQ,
				"light",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"wind_light_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_light_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_wind_light_intro_banter_b",
		response = "pes_wind_light_intro_banter_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"wind_light_intro_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"wind_light_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_light_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_light_weave_conversation_one_01",
		response = "pwe_light_weave_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_light_weave_conversation_one_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_light_weave_conversation_three_01",
		response = "pwe_light_weave_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"pwe_light_weave_conversation_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_light_weave_conversation_three_01",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_light_weave_conversation_three_02",
		response = "pwe_light_weave_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_light_weave_conversation_three_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_light_weave_conversation_two_01",
		response = "pwe_light_weave_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_light_weave_conversation_two_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_wind_light_intro_banter_a",
		response = "pwe_wind_light_intro_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wind_intro_banter_a",
			},
			{
				"global_context",
				"current_wind",
				OP.EQ,
				"light",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"wind_light_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_light_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wind_light_intro_banter_b",
		response = "pwe_wind_light_intro_banter_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"wind_light_intro_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"wind_light_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_light_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_light_weave_conversation_one_01",
		response = "pwh_light_weave_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"pwh_light_weave_conversation_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_light_weave_conversation_one_01",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_light_weave_conversation_three_01",
		response = "pwh_light_weave_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_light_weave_conversation_three_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwh_wind_light_intro_banter_a",
		response = "pwh_wind_light_intro_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"wind_intro_banter_a",
			},
			{
				"global_context",
				"current_wind",
				OP.EQ,
				"light",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"wind_light_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_light_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_wind_light_intro_banter_b",
		response = "pwh_wind_light_intro_banter_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"wind_light_intro_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"wind_light_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_light_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_light_weave_conversation_two_01 = {
			category = "story_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_light_weave_conversation_two_01",
			},
			sound_events = {
				[1] = "pbw_light_weave_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 3.0715832710266,
			},
		},
		pbw_light_weave_conversation_two_02 = {
			category = "story_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_light_weave_conversation_two_02",
			},
			sound_events = {
				[1] = "pbw_light_weave_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 2.2046041488648,
			},
		},
		pbw_wind_light_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wind_light_intro_banter_a_01",
				[2] = "pbw_wind_light_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wind_light_intro_banter_a_01",
				[2] = "pbw_wind_light_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 1.7220417261124,
				[2] = 3.7949583530426,
			},
		},
		pbw_wind_light_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wind_light_intro_banter_b_01",
				[2] = "pbw_wind_light_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wind_light_intro_banter_b_01",
				[2] = "pbw_wind_light_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 3.7192709445953,
				[2] = 3.8438541889191,
			},
		},
		pdr_wind_light_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_wind_light_intro_banter_a_01",
				[2] = "pdr_wind_light_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wind_light_intro_banter_a_01",
				[2] = "pdr_wind_light_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 2.6773333549499,
				[2] = 2.7929167747498,
			},
		},
		pdr_wind_light_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_wind_light_intro_banter_b_01",
				[2] = "pdr_wind_light_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wind_light_intro_banter_b_01",
				[2] = "pdr_wind_light_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.1380207538605,
				[2] = 2.4526250362396,
			},
		},
		pes_wind_light_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_wind_light_intro_banter_a_01",
				[2] = "pes_wind_light_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wind_light_intro_banter_a_01",
				[2] = "pes_wind_light_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.2866249084473,
				[2] = 2.5171248912811,
			},
		},
		pes_wind_light_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_wind_light_intro_banter_b_01",
				[2] = "pes_wind_light_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wind_light_intro_banter_b_01",
				[2] = "pes_wind_light_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 3.1822707653046,
				[2] = 2.5562500953674,
			},
		},
		pwe_light_weave_conversation_one_01 = {
			category = "story_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_light_weave_conversation_one_01",
			},
			sound_events = {
				[1] = "pwe_light_weave_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 3.4364583492279,
			},
		},
		pwe_light_weave_conversation_three_01 = {
			category = "story_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_light_weave_conversation_three_01",
			},
			sound_events = {
				[1] = "pwe_light_weave_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 8.1078128814697,
			},
		},
		pwe_light_weave_conversation_three_02 = {
			category = "story_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_light_weave_conversation_three_02",
			},
			sound_events = {
				[1] = "pwe_light_weave_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 3.5476665496826,
			},
		},
		pwe_light_weave_conversation_two_01 = {
			category = "story_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_light_weave_conversation_two_01",
			},
			sound_events = {
				[1] = "pwe_light_weave_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 3.1942083835602,
			},
		},
		pwe_wind_light_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wind_light_intro_banter_a_01",
				[2] = "pwe_wind_light_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wind_light_intro_banter_a_01",
				[2] = "pwe_wind_light_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 2.9171874523163,
				[2] = 4.2813334465027,
			},
		},
		pwe_wind_light_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wind_light_intro_banter_b_01",
				[2] = "pwe_wind_light_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wind_light_intro_banter_b_01",
				[2] = "pwe_wind_light_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 3.1306457519531,
				[2] = 3.1120417118073,
			},
		},
		pwh_light_weave_conversation_one_01 = {
			category = "story_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_light_weave_conversation_one_01",
			},
			sound_events = {
				[1] = "pwh_light_weave_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 6.9145832061768,
			},
		},
		pwh_light_weave_conversation_three_01 = {
			category = "story_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_light_weave_conversation_three_01",
			},
			sound_events = {
				[1] = "pwh_light_weave_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 7.0750832557678,
			},
		},
		pwh_wind_light_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wind_light_intro_banter_a_01",
				[2] = "pwh_wind_light_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_wind_light_intro_banter_a_01",
				[2] = "pwh_wind_light_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.9979999065399,
				[2] = 4.8533959388733,
			},
		},
		pwh_wind_light_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_light",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wind_light_intro_banter_b_01",
				[2] = "pwh_wind_light_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_wind_light_intro_banter_b_01",
				[2] = "pwh_wind_light_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 3.266583442688,
				[2] = 3.2108125686645,
			},
		},
	})
end
