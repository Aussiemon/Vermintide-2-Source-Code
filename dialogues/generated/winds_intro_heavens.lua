-- chunkname: @dialogues/generated/winds_intro_heavens.lua

return function ()
	define_rule({
		name = "pbw_celestial_weave_conversation_three_01",
		probability = 1,
		response = "pbw_celestial_weave_conversation_three_01",
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
				"pwh_celestial_weave_conversation_three_01",
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
		name = "pbw_wind_heavens_intro_banter_a",
		probability = 1,
		response = "pbw_wind_heavens_intro_banter_a",
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
				"heavens",
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
				"wind_heavens_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wind_heavens_intro_banter_b",
		probability = 1,
		response = "pbw_wind_heavens_intro_banter_b",
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
				"wind_heavens_intro_banter_a",
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
				"wind_heavens_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wind_heavens_intro_banter_a",
		probability = 1,
		response = "pdr_wind_heavens_intro_banter_a",
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
				"heavens",
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
				"wind_heavens_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wind_heavens_intro_banter_b",
		probability = 1,
		response = "pdr_wind_heavens_intro_banter_b",
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
				"wind_heavens_intro_banter_a",
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
				"wind_heavens_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_wind_heavens_intro_banter_a",
		probability = 1,
		response = "pes_wind_heavens_intro_banter_a",
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
				"heavens",
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
				"wind_heavens_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_wind_heavens_intro_banter_b",
		probability = 1,
		response = "pes_wind_heavens_intro_banter_b",
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
				"wind_heavens_intro_banter_a",
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
				"wind_heavens_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_celestial_weave_conversation_one_01",
		probability = 1,
		response = "pwe_celestial_weave_conversation_one_01",
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
				"pwe_celestial_weave_conversation_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_celestial_weave_conversation_one_01",
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
		name = "pwe_celestial_weave_conversation_one_02",
		probability = 1,
		response = "pwe_celestial_weave_conversation_one_02",
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
				"pwh_celestial_weave_conversation_one_01",
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
		name = "pwe_wind_heavens_intro_banter_a",
		probability = 1,
		response = "pwe_wind_heavens_intro_banter_a",
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
				"heavens",
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
				"wind_heavens_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wind_heavens_intro_banter_b",
		probability = 1,
		response = "pwe_wind_heavens_intro_banter_b",
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
				"wind_heavens_intro_banter_a",
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
				"wind_heavens_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_celestial_weave_conversation_one_01",
		probability = 1,
		response = "pwh_celestial_weave_conversation_one_01",
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
				"pwe_celestial_weave_conversation_one_01",
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
		name = "pwh_celestial_weave_conversation_three_01",
		probability = 1,
		response = "pwh_celestial_weave_conversation_three_01",
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
				"bright_wizard",
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
				"pwh_celestial_weave_conversation_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_celestial_weave_conversation_three_01",
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
		name = "pwh_wind_heavens_intro_banter_a",
		probability = 1,
		response = "pwh_wind_heavens_intro_banter_a",
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
				"heavens",
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
				"wind_heavens_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_wind_heavens_intro_banter_b",
		probability = 1,
		response = "pwh_wind_heavens_intro_banter_b",
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
				"wind_heavens_intro_banter_a",
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
				"wind_heavens_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_heavens_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_celestial_weave_conversation_three_01 = {
			category = "story_talk",
			database = "winds_intro_heavens",
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
				[1] = "pbw_celestial_weave_conversation_three_01",
			},
			sound_events = {
				[1] = "pbw_celestial_weave_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 4.1730623245239,
			},
		},
		pbw_wind_heavens_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_heavens",
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
				[1] = "pbw_wind_heavens_intro_banter_a_01",
				[2] = "pbw_wind_heavens_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wind_heavens_intro_banter_a_01",
				[2] = "pbw_wind_heavens_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.6520833969116,
				[2] = 3.8688125610352,
			},
		},
		pbw_wind_heavens_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_heavens",
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
				[1] = "pbw_wind_heavens_intro_banter_b_01",
				[2] = "pbw_wind_heavens_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wind_heavens_intro_banter_b_01",
				[2] = "pbw_wind_heavens_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 4.308000087738,
				[2] = 2.7584583759308,
			},
		},
		pdr_wind_heavens_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_heavens",
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
				[1] = "pdr_wind_heavens_intro_banter_a_01",
				[2] = "pdr_wind_heavens_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wind_heavens_intro_banter_a_01",
				[2] = "pdr_wind_heavens_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 2.5489165782928,
				[2] = 3.6083126068115,
			},
		},
		pdr_wind_heavens_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_heavens",
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
				[1] = "pdr_wind_heavens_intro_banter_b_01",
				[2] = "pdr_wind_heavens_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wind_heavens_intro_banter_b_01",
				[2] = "pdr_wind_heavens_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.0288751125336,
				[2] = 1.7463542222977,
			},
		},
		pes_wind_heavens_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_heavens",
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
				[1] = "pes_wind_heavens_intro_banter_a_01",
				[2] = "pes_wind_heavens_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wind_heavens_intro_banter_a_01",
				[2] = "pes_wind_heavens_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 5.4581251144409,
				[2] = 3.1040208339691,
			},
		},
		pes_wind_heavens_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_heavens",
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
				[1] = "pes_wind_heavens_intro_banter_b_01",
				[2] = "pes_wind_heavens_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wind_heavens_intro_banter_b_01",
				[2] = "pes_wind_heavens_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 1.923708319664,
				[2] = 2.1976041793823,
			},
		},
		pwe_celestial_weave_conversation_one_01 = {
			category = "story_talk",
			database = "winds_intro_heavens",
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
				[1] = "pwe_celestial_weave_conversation_one_01",
			},
			sound_events = {
				[1] = "pwe_celestial_weave_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 4.0012497901917,
			},
		},
		pwe_celestial_weave_conversation_one_02 = {
			category = "story_talk",
			database = "winds_intro_heavens",
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
				[1] = "pwe_celestial_weave_conversation_one_02",
			},
			sound_events = {
				[1] = "pwe_celestial_weave_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 4.3900418281555,
			},
		},
		pwe_wind_heavens_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_heavens",
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
				[1] = "pwe_wind_heavens_intro_banter_a_01",
				[2] = "pwe_wind_heavens_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wind_heavens_intro_banter_a_01",
				[2] = "pwe_wind_heavens_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 2.8211667537689,
				[2] = 3.5252709388733,
			},
		},
		pwe_wind_heavens_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_heavens",
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
				[1] = "pwe_wind_heavens_intro_banter_b_01",
				[2] = "pwe_wind_heavens_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wind_heavens_intro_banter_b_01",
				[2] = "pwe_wind_heavens_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.7699999809265,
				[2] = 2.771541595459,
			},
		},
		pwh_celestial_weave_conversation_one_01 = {
			category = "story_talk",
			database = "winds_intro_heavens",
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
				[1] = "pwh_celestial_weave_conversation_one_01",
			},
			sound_events = {
				[1] = "pwh_celestial_weave_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 3.6886041164398,
			},
		},
		pwh_celestial_weave_conversation_three_01 = {
			category = "story_talk",
			database = "winds_intro_heavens",
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
				[1] = "pwh_celestial_weave_conversation_three_01",
			},
			sound_events = {
				[1] = "pwh_celestial_weave_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 5.114354133606,
			},
		},
		pwh_wind_heavens_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_heavens",
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
				[1] = "pwh_wind_heavens_intro_banter_a_01",
				[2] = "pwh_wind_heavens_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_wind_heavens_intro_banter_a_01",
				[2] = "pwh_wind_heavens_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.3037707805634,
				[2] = 4.2955207824707,
			},
		},
		pwh_wind_heavens_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_heavens",
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
				[1] = "pwh_wind_heavens_intro_banter_b_01",
				[2] = "pwh_wind_heavens_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_wind_heavens_intro_banter_b_01",
				[2] = "pwh_wind_heavens_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.7459166049957,
				[2] = 3.0310416221619,
			},
		},
	})
end
