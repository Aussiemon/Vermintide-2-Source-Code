-- chunkname: @dialogues/generated/winds_intro_beasts.lua

return function ()
	define_rule({
		name = "pbw_amber_weave_conversation_one_01",
		probability = 1,
		response = "pbw_amber_weave_conversation_one_01",
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
				"pwe_amber_weave_conversation_one_01",
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
		name = "pbw_amber_weave_conversation_three_01",
		probability = 1,
		response = "pbw_amber_weave_conversation_three_01",
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
				"pwh_amber_weave_conversation_three_01",
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
		name = "pbw_wind_beast_intro_banter_a",
		probability = 1,
		response = "pbw_wind_beast_intro_banter_a",
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
				"beasts",
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
				"wind_beast_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_beast_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wind_beast_intro_banter_b",
		probability = 1,
		response = "pbw_wind_beast_intro_banter_b",
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
				"wind_beast_intro_banter_a",
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
				"wind_beast_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_beast_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wind_beast_intro_banter_a",
		probability = 1,
		response = "pdr_wind_beast_intro_banter_a",
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
				"beasts",
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
				"wind_beast_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_beast_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wind_beast_intro_banter_b",
		probability = 1,
		response = "pdr_wind_beast_intro_banter_b",
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
				"wind_beast_intro_banter_a",
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
				"wind_beast_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_beast_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_wind_beast_intro_banter_a",
		probability = 1,
		response = "pes_wind_beast_intro_banter_a",
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
				"beasts",
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
				"wind_beast_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_beast_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_wind_beast_intro_banter_b",
		probability = 1,
		response = "pes_wind_beast_intro_banter_b",
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
				"wind_beast_intro_banter_a",
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
				"wind_beast_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_beast_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_amber_weave_conversation_one_01",
		probability = 1,
		response = "pwe_amber_weave_conversation_one_01",
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
				"pwh_amber_weave_conversation_one_01",
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
		name = "pwe_amber_weave_conversation_two_01",
		probability = 1,
		response = "pwe_amber_weave_conversation_two_01",
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
				"pwe_amber_weave_conversation_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_amber_weave_conversation_two_01",
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
		name = "pwe_wind_beast_intro_banter_a",
		probability = 1,
		response = "pwe_wind_beast_intro_banter_a",
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
				"beasts",
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
				"wind_beast_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_beast_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wind_beast_intro_banter_b",
		probability = 1,
		response = "pwe_wind_beast_intro_banter_b",
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
				"wind_beast_intro_banter_a",
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
				"wind_beast_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_beast_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_amber_weave_conversation_one_01",
		probability = 1,
		response = "pwh_amber_weave_conversation_one_01",
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
				"pwh_amber_weave_conversation_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_amber_weave_conversation_one_01",
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
		name = "pwh_amber_weave_conversation_three_01",
		probability = 1,
		response = "pwh_amber_weave_conversation_three_01",
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
				"pwh_amber_weave_conversation_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_amber_weave_conversation_three_01",
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
		name = "pwh_amber_weave_conversation_three_02",
		probability = 1,
		response = "pwh_amber_weave_conversation_three_02",
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
				"pbw_amber_weave_conversation_three_01",
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
		name = "pwh_amber_weave_conversation_two_01",
		probability = 1,
		response = "pwh_amber_weave_conversation_two_01",
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
				"pwe_amber_weave_conversation_two_01",
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
		name = "pwh_wind_beast_intro_banter_a",
		probability = 1,
		response = "pwh_wind_beast_intro_banter_a",
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
				"beasts",
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
				"wind_beast_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_beast_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_wind_beast_intro_banter_b",
		probability = 1,
		response = "pwh_wind_beast_intro_banter_b",
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
				"wind_beast_intro_banter_a",
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
				"wind_beast_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_beast_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_amber_weave_conversation_one_01 = {
			category = "story_talk",
			database = "winds_intro_beasts",
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
				[1] = "pbw_amber_weave_conversation_one_01",
			},
			sound_events = {
				[1] = "pbw_amber_weave_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 4.5578331947327,
			},
		},
		pbw_amber_weave_conversation_three_01 = {
			category = "story_talk",
			database = "winds_intro_beasts",
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
				[1] = "pbw_amber_weave_conversation_three_01",
			},
			sound_events = {
				[1] = "pbw_amber_weave_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 5.206458568573,
			},
		},
		pbw_wind_beast_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_beasts",
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
				[1] = "pbw_wind_beast_intro_banter_a_01",
				[2] = "pbw_wind_beast_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wind_beast_intro_banter_a_01",
				[2] = "pbw_wind_beast_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 4.143958568573,
				[2] = 1.9023958444595,
			},
		},
		pbw_wind_beast_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_beasts",
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
				[1] = "pbw_wind_beast_intro_banter_b_01",
				[2] = "pbw_wind_beast_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wind_beast_intro_banter_b_01",
				[2] = "pbw_wind_beast_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 3.5154376029968,
				[2] = 3.2656874656677,
			},
		},
		pdr_wind_beast_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_beasts",
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
				[1] = "pdr_wind_beast_intro_banter_a_01",
				[2] = "pdr_wind_beast_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wind_beast_intro_banter_a_01",
				[2] = "pdr_wind_beast_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 2.0545415878296,
				[2] = 2.2407290935516,
			},
		},
		pdr_wind_beast_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_beasts",
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
				[1] = "pdr_wind_beast_intro_banter_b_01",
				[2] = "pdr_wind_beast_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wind_beast_intro_banter_b_01",
				[2] = "pdr_wind_beast_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.221479177475,
				[2] = 2.0224375724792,
			},
		},
		pes_wind_beast_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_beasts",
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
				[1] = "pes_wind_beast_intro_banter_a_01",
				[2] = "pes_wind_beast_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wind_beast_intro_banter_a_01",
				[2] = "pes_wind_beast_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 1.853354215622,
				[2] = 2.8241457939148,
			},
		},
		pes_wind_beast_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_beasts",
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
				[1] = "pes_wind_beast_intro_banter_b_01",
				[2] = "pes_wind_beast_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wind_beast_intro_banter_b_01",
				[2] = "pes_wind_beast_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.2848124504089,
				[2] = 2.1279165744781,
			},
		},
		pwe_amber_weave_conversation_one_01 = {
			category = "story_talk",
			database = "winds_intro_beasts",
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
				[1] = "pwe_amber_weave_conversation_one_01",
			},
			sound_events = {
				[1] = "pwe_amber_weave_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 9.9088125228882,
			},
		},
		pwe_amber_weave_conversation_two_01 = {
			category = "story_talk",
			database = "winds_intro_beasts",
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
				[1] = "pwe_amber_weave_conversation_two_01",
			},
			sound_events = {
				[1] = "pwe_amber_weave_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 3.8039581775665,
			},
		},
		pwe_wind_beast_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_beasts",
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
				[1] = "pwe_wind_beast_intro_banter_a_01",
				[2] = "pwe_wind_beast_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wind_beast_intro_banter_a_01",
				[2] = "pwe_wind_beast_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.1837499141693,
				[2] = 3.054229259491,
			},
		},
		pwe_wind_beast_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_beasts",
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
				[1] = "pwe_wind_beast_intro_banter_b_01",
				[2] = "pwe_wind_beast_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wind_beast_intro_banter_b_01",
				[2] = "pwe_wind_beast_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.4219374656677,
				[2] = 2.8054165840149,
			},
		},
		pwh_amber_weave_conversation_one_01 = {
			category = "story_talk",
			database = "winds_intro_beasts",
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
				[1] = "pwh_amber_weave_conversation_one_01",
			},
			sound_events = {
				[1] = "pwh_amber_weave_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 3.6591665744781,
			},
		},
		pwh_amber_weave_conversation_three_01 = {
			category = "story_talk",
			database = "winds_intro_beasts",
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
				[1] = "pwh_amber_weave_conversation_three_01",
			},
			sound_events = {
				[1] = "pwh_amber_weave_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 6.6432290077209,
			},
		},
		pwh_amber_weave_conversation_three_02 = {
			category = "story_talk",
			database = "winds_intro_beasts",
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
				[1] = "pwh_amber_weave_conversation_three_02",
			},
			sound_events = {
				[1] = "pwh_amber_weave_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 2.4490416049957,
			},
		},
		pwh_amber_weave_conversation_two_01 = {
			category = "story_talk",
			database = "winds_intro_beasts",
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
				[1] = "pwh_amber_weave_conversation_two_01",
			},
			sound_events = {
				[1] = "pwh_amber_weave_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 2.8677291870117,
			},
		},
		pwh_wind_beast_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_beasts",
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
				[1] = "pwh_wind_beast_intro_banter_a_01",
				[2] = "pwh_wind_beast_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_wind_beast_intro_banter_a_01",
				[2] = "pwh_wind_beast_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.2530207633972,
				[2] = 3.8821876049042,
			},
		},
		pwh_wind_beast_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_beasts",
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
				[1] = "pwh_wind_beast_intro_banter_b_01",
				[2] = "pwh_wind_beast_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_wind_beast_intro_banter_b_01",
				[2] = "pwh_wind_beast_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 1.6921875476837,
				[2] = 4.3575000762939,
			},
		},
	})
end
