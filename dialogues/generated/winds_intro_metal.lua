-- chunkname: @dialogues/generated/winds_intro_metal.lua

return function ()
	define_rule({
		name = "pbw_gold_weave_conversation_three_01",
		response = "pbw_gold_weave_conversation_three_01",
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
				"pbw_gold_weave_conversation_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_gold_weave_conversation_three_01",
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
		name = "pbw_gold_weave_conversation_three_02",
		response = "pbw_gold_weave_conversation_three_02",
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
				"pwe_gold_weave_conversation_three_01",
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
		name = "pbw_wind_metal_intro_banter_a",
		response = "pbw_wind_metal_intro_banter_a",
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
				"current_wind",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"wind_metal_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_metal_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wind_metal_intro_banter_b",
		response = "pbw_wind_metal_intro_banter_b",
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
				"wind_metal_intro_banter_a",
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
				"wind_metal_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_metal_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wind_metal_intro_banter_a",
		response = "pdr_wind_metal_intro_banter_a",
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
				"global_context",
				"current_wind",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"wind_metal_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_metal_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wind_metal_intro_banter_b",
		response = "pdr_wind_metal_intro_banter_b",
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
				"wind_metal_intro_banter_a",
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
				"wind_metal_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_metal_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_wind_metal_intro_banter_a",
		response = "pes_wind_metal_intro_banter_a",
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
				"global_context",
				"current_wind",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"wind_metal_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_metal_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_wind_metal_intro_banter_b",
		response = "pes_wind_metal_intro_banter_b",
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
				"wind_metal_intro_banter_a",
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
				"wind_metal_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_metal_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_gold_weave_conversation_one_01",
		response = "pwe_gold_weave_conversation_one_01",
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
				"pwe_gold_weave_conversation_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_gold_weave_conversation_one_01",
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
		name = "pwe_gold_weave_conversation_one_02",
		response = "pwe_gold_weave_conversation_one_02",
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
				"pwh_gold_weave_conversation_one_01",
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
		name = "pwe_gold_weave_conversation_three_01",
		response = "pwe_gold_weave_conversation_three_01",
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
				"pbw_gold_weave_conversation_three_01",
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
		name = "pwe_gold_weave_conversation_two_01",
		response = "pwe_gold_weave_conversation_two_01",
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
				"pwh_gold_weave_conversation_two_01",
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
		name = "pwe_wind_metal_intro_banter_a",
		response = "pwe_wind_metal_intro_banter_a",
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
				"current_wind",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"wind_metal_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_metal_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wind_metal_intro_banter_b",
		response = "pwe_wind_metal_intro_banter_b",
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
				"wind_metal_intro_banter_a",
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
				"wind_metal_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_metal_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_gold_weave_conversation_one_01",
		response = "pwh_gold_weave_conversation_one_01",
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
				"pwe_gold_weave_conversation_one_01",
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
		name = "pwh_gold_weave_conversation_one_02",
		response = "pwh_gold_weave_conversation_one_02",
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
				"pwe_gold_weave_conversation_one_02",
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
		name = "pwh_gold_weave_conversation_two_01",
		response = "pwh_gold_weave_conversation_two_01",
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
				"pwh_gold_weave_conversation_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_gold_weave_conversation_two_01",
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
		name = "pwh_wind_metal_intro_banter_a",
		response = "pwh_wind_metal_intro_banter_a",
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
				"current_wind",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"wind_metal_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_metal_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_wind_metal_intro_banter_b",
		response = "pwh_wind_metal_intro_banter_b",
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
				"wind_metal_intro_banter_a",
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
				"wind_metal_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_metal_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_gold_weave_conversation_three_01 = {
			category = "story_talk",
			database = "winds_intro_metal",
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
				[1] = "pbw_gold_weave_conversation_three_01",
			},
			sound_events = {
				[1] = "pbw_gold_weave_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 3.1087501049042,
			},
		},
		pbw_gold_weave_conversation_three_02 = {
			category = "story_talk",
			database = "winds_intro_metal",
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
				[1] = "pbw_gold_weave_conversation_three_02",
			},
			sound_events = {
				[1] = "pbw_gold_weave_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 1.4614791870117,
			},
		},
		pbw_wind_metal_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_metal",
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
				[1] = "pbw_wind_metal_intro_banter_a_01",
				[2] = "pbw_wind_metal_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wind_metal_intro_banter_a_01",
				[2] = "pbw_wind_metal_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.4465415477753,
				[2] = 2.2249166965485,
			},
		},
		pbw_wind_metal_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_metal",
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
				[1] = "pbw_wind_metal_intro_banter_b_01",
				[2] = "pbw_wind_metal_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wind_metal_intro_banter_b_01",
				[2] = "pbw_wind_metal_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.2242083549499,
				[2] = 2.3039166927338,
			},
		},
		pdr_wind_metal_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_metal",
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
				[1] = "pdr_wind_metal_intro_banter_a_01",
				[2] = "pdr_wind_metal_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wind_metal_intro_banter_a_01",
				[2] = "pdr_wind_metal_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 2.0930624008179,
				[2] = 2.3434791564941,
			},
		},
		pdr_wind_metal_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_metal",
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
				[1] = "pdr_wind_metal_intro_banter_b_01",
				[2] = "pdr_wind_metal_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wind_metal_intro_banter_b_01",
				[2] = "pdr_wind_metal_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 3.0561249256134,
				[2] = 1.4574583768845,
			},
		},
		pes_wind_metal_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_metal",
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
				[1] = "pes_wind_metal_intro_banter_a_01",
				[2] = "pes_wind_metal_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wind_metal_intro_banter_a_01",
				[2] = "pes_wind_metal_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 2.2799167633057,
				[2] = 1.1963332891464,
			},
		},
		pes_wind_metal_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_metal",
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
				[1] = "pes_wind_metal_intro_banter_b_01",
				[2] = "pes_wind_metal_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wind_metal_intro_banter_b_01",
				[2] = "pes_wind_metal_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.6035416126251,
				[2] = 2.5103542804718,
			},
		},
		pwe_gold_weave_conversation_one_01 = {
			category = "story_talk",
			database = "winds_intro_metal",
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
				[1] = "pwe_gold_weave_conversation_one_01",
			},
			sound_events = {
				[1] = "pwe_gold_weave_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 3.2642500400543,
			},
		},
		pwe_gold_weave_conversation_one_02 = {
			category = "story_talk",
			database = "winds_intro_metal",
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
				[1] = "pwe_gold_weave_conversation_one_02",
			},
			sound_events = {
				[1] = "pwe_gold_weave_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 4.0315833091736,
			},
		},
		pwe_gold_weave_conversation_three_01 = {
			category = "story_talk",
			database = "winds_intro_metal",
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
				[1] = "pwe_gold_weave_conversation_three_01",
			},
			sound_events = {
				[1] = "pwe_gold_weave_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 3.0582709312439,
			},
		},
		pwe_gold_weave_conversation_two_01 = {
			category = "story_talk",
			database = "winds_intro_metal",
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
				[1] = "pwe_gold_weave_conversation_two_01",
			},
			sound_events = {
				[1] = "pwe_gold_weave_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 4.446750164032,
			},
		},
		pwe_wind_metal_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_metal",
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
				[1] = "pwe_wind_metal_intro_banter_a_01",
				[2] = "pwe_wind_metal_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wind_metal_intro_banter_a_01",
				[2] = "pwe_wind_metal_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3,
				[2] = 2.1961667537689,
			},
		},
		pwe_wind_metal_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_metal",
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
				[1] = "pwe_wind_metal_intro_banter_b_01",
				[2] = "pwe_wind_metal_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wind_metal_intro_banter_b_01",
				[2] = "pwe_wind_metal_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.4208958148956,
				[2] = 1.719166636467,
			},
		},
		pwh_gold_weave_conversation_one_01 = {
			category = "story_talk",
			database = "winds_intro_metal",
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
				[1] = "pwh_gold_weave_conversation_one_01",
			},
			sound_events = {
				[1] = "pwh_gold_weave_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 5.2443122863769,
			},
		},
		pwh_gold_weave_conversation_one_02 = {
			category = "story_talk",
			database = "winds_intro_metal",
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
				[1] = "pwh_gold_weave_conversation_one_02",
			},
			sound_events = {
				[1] = "pwh_gold_weave_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 2.7225208282471,
			},
		},
		pwh_gold_weave_conversation_two_01 = {
			category = "story_talk",
			database = "winds_intro_metal",
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
				[1] = "pwh_gold_weave_conversation_two_01",
			},
			sound_events = {
				[1] = "pwh_gold_weave_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 8.8161878585815,
			},
		},
		pwh_wind_metal_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_metal",
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
				[1] = "pwh_wind_metal_intro_banter_a_01",
				[2] = "pwh_wind_metal_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_wind_metal_intro_banter_a_01",
				[2] = "pwh_wind_metal_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 2.5399792194366,
				[2] = 2.5912292003632,
			},
		},
		pwh_wind_metal_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_metal",
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
				[1] = "pwh_wind_metal_intro_banter_b_01",
				[2] = "pwh_wind_metal_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_wind_metal_intro_banter_b_01",
				[2] = "pwh_wind_metal_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 4.4414582252502,
				[2] = 3.3229167461395,
			},
		},
	})
end
