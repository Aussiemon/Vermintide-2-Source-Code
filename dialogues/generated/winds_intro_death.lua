-- chunkname: @dialogues/generated/winds_intro_death.lua

return function ()
	define_rule({
		name = "pbw_amethyst_weave_conversation_three_01",
		probability = 1,
		response = "pbw_amethyst_weave_conversation_three_01",
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
				"witch_hunter",
				OP.EQ,
				1,
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
				"pbw_amethyst_weave_conversation_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_amethyst_weave_conversation_three_01",
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
		name = "pbw_amethyst_weave_conversation_three_02",
		probability = 1,
		response = "pbw_amethyst_weave_conversation_three_02",
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
				"pwe_amethyst_weave_conversation_three_01",
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
		name = "pbw_amethyst_weave_conversation_two_01",
		probability = 1,
		response = "pbw_amethyst_weave_conversation_two_01",
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
				"pwe_amethyst_weave_conversation_two_01",
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
		name = "pbw_wind_death_intro_banter_a",
		probability = 1,
		response = "pbw_wind_death_intro_banter_a",
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
				"death",
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
				"wind_death_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_death_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wind_death_intro_banter_b",
		probability = 1,
		response = "pbw_wind_death_intro_banter_b",
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
				"wind_death_intro_banter_a",
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
				"wind_death_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_death_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wind_death_intro_banter_a",
		probability = 1,
		response = "pdr_wind_death_intro_banter_a",
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
				"death",
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
				"wind_death_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_death_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wind_death_intro_banter_b",
		probability = 1,
		response = "pdr_wind_death_intro_banter_b",
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
				"wind_death_intro_banter_a",
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
				"wind_death_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_death_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_wind_death_intro_banter_a",
		probability = 1,
		response = "pes_wind_death_intro_banter_a",
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
				"death",
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
				"wind_death_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_death_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_wind_death_intro_banter_b",
		probability = 1,
		response = "pes_wind_death_intro_banter_b",
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
				"wind_death_intro_banter_a",
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
				"wind_death_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_death_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_amethyst_weave_conversation_one_01",
		probability = 1,
		response = "pwe_amethyst_weave_conversation_one_01",
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
				"pwe_amethyst_weave_conversation_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_amethyst_weave_conversation_one_01",
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
		name = "pwe_amethyst_weave_conversation_three_01",
		probability = 1,
		response = "pwe_amethyst_weave_conversation_three_01",
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
				"pbw_amethyst_weave_conversation_three_01",
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
		name = "pwe_amethyst_weave_conversation_two_01",
		probability = 1,
		response = "pwe_amethyst_weave_conversation_two_01",
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
				"pwh_amethyst_weave_conversation_two_01",
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
		name = "pwe_wind_death_intro_banter_a",
		probability = 1,
		response = "pwe_wind_death_intro_banter_a",
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
				"death",
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
				"wind_death_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_death_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wind_death_intro_banter_b",
		probability = 1,
		response = "pwe_wind_death_intro_banter_b",
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
				"wind_death_intro_banter_a",
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
				"wind_death_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_death_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_amethyst_weave_conversation_one_01",
		probability = 1,
		response = "pwh_amethyst_weave_conversation_one_01",
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
				"pwe_amethyst_weave_conversation_one_01",
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
		name = "pwh_amethyst_weave_conversation_three_01",
		probability = 1,
		response = "pwh_amethyst_weave_conversation_three_01",
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
				"pbw_amethyst_weave_conversation_three_02",
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
		name = "pwh_amethyst_weave_conversation_two_01",
		probability = 1,
		response = "pwh_amethyst_weave_conversation_two_01",
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
				"pwh_amethyst_weave_conversation_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_amethyst_weave_conversation_two_01",
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
		name = "pwh_wind_death_intro_banter_a",
		probability = 1,
		response = "pwh_wind_death_intro_banter_a",
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
				"death",
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
				"wind_death_intro_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_death_intro_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_wind_death_intro_banter_b",
		probability = 1,
		response = "pwh_wind_death_intro_banter_b",
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
				"wind_death_intro_banter_a",
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
				"wind_death_intro_banter_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wind_death_intro_banter_b",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_amethyst_weave_conversation_three_01 = {
			category = "story_talk",
			database = "winds_intro_death",
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
				[1] = "pbw_amethyst_weave_conversation_three_01",
			},
			sound_events = {
				[1] = "pbw_amethyst_weave_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 2.4016041755676,
			},
		},
		pbw_amethyst_weave_conversation_three_02 = {
			category = "story_talk",
			database = "winds_intro_death",
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
				[1] = "pbw_amethyst_weave_conversation_three_02",
			},
			sound_events = {
				[1] = "pbw_amethyst_weave_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 2.7727084159851,
			},
		},
		pbw_amethyst_weave_conversation_two_01 = {
			category = "story_talk",
			database = "winds_intro_death",
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
				[1] = "pbw_amethyst_weave_conversation_two_01",
			},
			sound_events = {
				[1] = "pbw_amethyst_weave_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 3.529833316803,
			},
		},
		pbw_wind_death_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_death",
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
				[1] = "pbw_wind_death_intro_banter_a_01",
				[2] = "pbw_wind_death_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wind_death_intro_banter_a_01",
				[2] = "pbw_wind_death_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 4.3811041116715,
				[2] = 3.2407083511352,
			},
		},
		pbw_wind_death_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_death",
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
				[1] = "pbw_wind_death_intro_banter_b_01",
				[2] = "pbw_wind_death_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_wind_death_intro_banter_b_01",
				[2] = "pbw_wind_death_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 1.993124961853,
				[2] = 2.8034791946411,
			},
		},
		pdr_wind_death_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_death",
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
				[1] = "pdr_wind_death_intro_banter_a_01",
				[2] = "pdr_wind_death_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wind_death_intro_banter_a_01",
				[2] = "pdr_wind_death_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.319375038147,
				[2] = 2.5039792060852,
			},
		},
		pdr_wind_death_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_death",
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
				[1] = "pdr_wind_death_intro_banter_b_01",
				[2] = "pdr_wind_death_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wind_death_intro_banter_b_01",
				[2] = "pdr_wind_death_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.2407290935516,
				[2] = 3.6853542327881,
			},
		},
		pes_wind_death_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_death",
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
				[1] = "pes_wind_death_intro_banter_a_01",
				[2] = "pes_wind_death_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wind_death_intro_banter_a_01",
				[2] = "pes_wind_death_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.8343749046326,
				[2] = 2.6345000267029,
			},
		},
		pes_wind_death_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_death",
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
				[1] = "pes_wind_death_intro_banter_b_01",
				[2] = "pes_wind_death_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_wind_death_intro_banter_b_01",
				[2] = "pes_wind_death_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 1.6432917118073,
				[2] = 1.884604215622,
			},
		},
		pwe_amethyst_weave_conversation_one_01 = {
			category = "story_talk",
			database = "winds_intro_death",
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
				[1] = "pwe_amethyst_weave_conversation_one_01",
			},
			sound_events = {
				[1] = "pwe_amethyst_weave_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 2.3268959522247,
			},
		},
		pwe_amethyst_weave_conversation_three_01 = {
			category = "story_talk",
			database = "winds_intro_death",
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
				[1] = "pwe_amethyst_weave_conversation_three_01",
			},
			sound_events = {
				[1] = "pwe_amethyst_weave_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 3.9010000228882,
			},
		},
		pwe_amethyst_weave_conversation_two_01 = {
			category = "story_talk",
			database = "winds_intro_death",
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
				[1] = "pwe_amethyst_weave_conversation_two_01",
			},
			sound_events = {
				[1] = "pwe_amethyst_weave_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 5.9670414924622,
			},
		},
		pwe_wind_death_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_death",
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
				[1] = "pwe_wind_death_intro_banter_a_01",
				[2] = "pwe_wind_death_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wind_death_intro_banter_a_01",
				[2] = "pwe_wind_death_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 2.1948957443237,
				[2] = 1.7602291107178,
			},
		},
		pwe_wind_death_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_death",
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
				[1] = "pwe_wind_death_intro_banter_b_01",
				[2] = "pwe_wind_death_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_wind_death_intro_banter_b_01",
				[2] = "pwe_wind_death_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 3.2840623855591,
				[2] = 1.791791677475,
			},
		},
		pwh_amethyst_weave_conversation_one_01 = {
			category = "story_talk",
			database = "winds_intro_death",
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
				[1] = "pwh_amethyst_weave_conversation_one_01",
			},
			sound_events = {
				[1] = "pwh_amethyst_weave_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 6.8485417366028,
			},
		},
		pwh_amethyst_weave_conversation_three_01 = {
			category = "story_talk",
			database = "winds_intro_death",
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
				[1] = "pwh_amethyst_weave_conversation_three_01",
			},
			sound_events = {
				[1] = "pwh_amethyst_weave_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 2.753312587738,
			},
		},
		pwh_amethyst_weave_conversation_two_01 = {
			category = "story_talk",
			database = "winds_intro_death",
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
				[1] = "pwh_amethyst_weave_conversation_two_01",
			},
			sound_events = {
				[1] = "pwh_amethyst_weave_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 4.7140417098999,
			},
		},
		pwh_wind_death_intro_banter_a = {
			category = "level_talk",
			database = "winds_intro_death",
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
				[1] = "pwh_wind_death_intro_banter_a_01",
				[2] = "pwh_wind_death_intro_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_wind_death_intro_banter_a_01",
				[2] = "pwh_wind_death_intro_banter_a_02",
			},
			sound_events_duration = {
				[1] = 2.1928749084473,
				[2] = 3.116229057312,
			},
		},
		pwh_wind_death_intro_banter_b = {
			category = "level_talk",
			database = "winds_intro_death",
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
				[1] = "pwh_wind_death_intro_banter_b_01",
				[2] = "pwh_wind_death_intro_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_wind_death_intro_banter_b_01",
				[2] = "pwh_wind_death_intro_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.4731874465942,
				[2] = 2.8698959350586,
			},
		},
	})
end
