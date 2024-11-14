-- chunkname: @dialogues/generated/hero_conversations_dlc_morris_level_banter.lua

return function ()
	define_rule({
		name = "pbw_de_morris_level_conversations_fortyseven_01",
		probability = 1,
		response = "pbw_de_morris_level_conversations_fortyseven_01",
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
				10,
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
				"dr_engineer",
				OP.EQ,
				1,
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
				240,
			},
			{
				"faction_memory",
				"pbw_de_morris_level_conversations_fortyseven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_de_morris_level_conversations_fortyseven",
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
		name = "pbw_gk_morris_level_conversations_fortyeight_01",
		probability = 1,
		response = "pbw_gk_morris_level_conversations_fortyeight_01",
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
				"pwe_gk_morris_level_conversations_fortyeight_01",
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
		name = "pbw_gk_morris_level_conversations_thirtynine_01",
		probability = 1,
		response = "pbw_gk_morris_level_conversations_thirtynine_01",
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
				10,
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
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pbw_gk_morris_level_conversations_thirtynine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_gk_morris_level_conversations_thirtynine",
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
		name = "pbw_morris_level_conversations_eight_01",
		probability = 1,
		response = "pbw_morris_level_conversations_eight_01",
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
				240,
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_eight_01",
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
		name = "pbw_morris_level_conversations_eight_02",
		probability = 1,
		response = "pbw_morris_level_conversations_eight_02",
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
				"pwe_morris_level_conversations_eight_01",
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
		name = "pbw_morris_level_conversations_four_01",
		probability = 1,
		response = "pbw_morris_level_conversations_four_01",
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_four_01",
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
		name = "pbw_morris_level_conversations_four_02",
		probability = 1,
		response = "pbw_morris_level_conversations_four_02",
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
				"pdr_morris_level_conversations_four_01",
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
		name = "pbw_morris_level_conversations_nine_01",
		probability = 1,
		response = "pbw_morris_level_conversations_nine_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_nine_01",
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
		name = "pbw_morris_level_conversations_nine_02",
		probability = 1,
		response = "pbw_morris_level_conversations_nine_02",
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
				"pwh_morris_level_conversations_nine_01",
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
		name = "pbw_morris_level_conversations_nineteen_01",
		probability = 1,
		response = "pbw_morris_level_conversations_nineteen_01",
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
				240,
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_nineteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_nineteen_01",
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
		name = "pbw_morris_level_conversations_nineteen_02",
		probability = 1,
		response = "pbw_morris_level_conversations_nineteen_02",
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
				"pwe_morris_level_conversations_nineteen_01",
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
		name = "pbw_morris_level_conversations_nineteen_03",
		probability = 1,
		response = "pbw_morris_level_conversations_nineteen_03",
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
				"pwe_morris_level_conversations_nineteen_02",
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
		name = "pbw_morris_level_conversations_one_01",
		probability = 1,
		response = "pbw_morris_level_conversations_one_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_one_01",
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
		name = "pbw_morris_level_conversations_one_02",
		probability = 1,
		response = "pbw_morris_level_conversations_one_02",
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
				"pwh_morris_level_conversations_one_01",
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
		name = "pbw_morris_level_conversations_seventeen_01",
		probability = 1,
		response = "pbw_morris_level_conversations_seventeen_01",
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
				"pdr_morris_level_conversations_seventeen_01",
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
		name = "pbw_morris_level_conversations_six_01",
		probability = 1,
		response = "pbw_morris_level_conversations_six_01",
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
				240,
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_six_01",
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
		name = "pbw_morris_level_conversations_six_02",
		probability = 1,
		response = "pbw_morris_level_conversations_six_02",
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
				"pwe_morris_level_conversations_six_01",
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
		name = "pbw_morris_level_conversations_sixteen_01",
		probability = 1,
		response = "pbw_morris_level_conversations_sixteen_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_sixteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_sixteen_01",
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
		name = "pbw_morris_level_conversations_sixteen_02",
		probability = 1,
		response = "pbw_morris_level_conversations_sixteen_02",
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
				"pwh_morris_level_conversations_sixteen_01",
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
		name = "pbw_morris_level_conversations_thirtytwo_01",
		probability = 1,
		response = "pbw_morris_level_conversations_thirtytwo_01",
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
				"pes_morris_level_conversations_thirtytwo_02",
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
		name = "pbw_morris_level_conversations_twenty_01",
		probability = 1,
		response = "pbw_morris_level_conversations_twenty_01",
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
				"pwe_morris_level_conversations_twenty_01",
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
		name = "pbw_morris_level_conversations_twenty_02",
		probability = 1,
		response = "pbw_morris_level_conversations_twenty_02",
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
				"pwe_morris_level_conversations_twenty_02",
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
		name = "pbw_morris_level_conversations_twentytwo_01",
		probability = 1,
		response = "pbw_morris_level_conversations_twentytwo_01",
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
				"pwh_morris_level_conversations_twentytwo_01",
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
		name = "pdr_de_gk_morris_level_conversations_fortyone_01",
		probability = 1,
		response = "pdr_de_gk_morris_level_conversations_fortyone_01",
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
				10,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
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
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer",
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pdr_de_gk_morris_level_conversations_fortyone",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_de_gk_morris_level_conversations_fortyone",
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
		name = "pdr_de_gk_morris_level_conversations_fortyone_02",
		probability = 1,
		response = "pdr_de_gk_morris_level_conversations_fortyone_02",
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
				"pes_gk_de_morris_level_conversations_fortyone_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_de_morris_level_conversations_fifty_01",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fifty_01",
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
				10,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
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
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fifty",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fifty",
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
		name = "pdr_de_morris_level_conversations_fifty_02",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fifty_02",
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
				"pes_de_morris_level_conversations_fifty_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_de_morris_level_conversations_fiftyone_01",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fiftyone_01",
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
				"pes_de_morris_level_conversations_fiftyone_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_de_morris_level_conversations_fortyfive_01",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fortyfive_01",
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
				10,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
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
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer",
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
				240,
			},
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fortyfive",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fortyfive",
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
		name = "pdr_de_morris_level_conversations_fortyfive_02",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fortyfive_02",
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
				"pwh_de_morris_level_conversations_fortyfive_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_de_morris_level_conversations_fortyfour_01",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fortyfour_01",
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
				"pes_de_morris_level_conversations_fortyfour_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_de_morris_level_conversations_fortyseven_01",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fortyseven_01",
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
				"pbw_de_morris_level_conversations_fortyseven_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_de_morris_level_conversations_fortyseven_02",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fortyseven_02",
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
				"pwh_de_morris_level_conversations_fortyseven_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_de_morris_level_conversations_fortysix_01",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fortysix_01",
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
				10,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
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
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fortysix",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fortysix",
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
		name = "pdr_de_morris_level_conversations_fortysix_02",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fortysix_02",
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
				"pes_de_morris_level_conversations_fortysix_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_de_morris_level_conversations_fortysix_03",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fortysix_03",
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
				"pes_de_morris_level_conversations_fortysix_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_de_morris_level_conversations_fortythree_01",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fortythree_01",
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
				"pes_de_morris_level_conversations_fortythree_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_de_morris_level_conversations_fortytwo_01",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fortytwo_01",
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
				10,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
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
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fortytwo",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fortytwo",
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
		name = "pdr_de_morris_level_conversations_fortytwo_02",
		probability = 1,
		response = "pdr_de_morris_level_conversations_fortytwo_02",
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
				"pes_de_morris_level_conversations_fortytwo_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_gk_morris_level_conversations_fortyeight_01",
		probability = 1,
		response = "pdr_gk_morris_level_conversations_fortyeight_01",
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
				5,
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
				"es_questingknight",
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
				240,
			},
			{
				"faction_memory",
				"pdr_gk_morris_level_conversations_fortyeight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_gk_morris_level_conversations_fortyeight",
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
		name = "pdr_gk_morris_level_conversations_fortynine_01",
		probability = 1,
		response = "pdr_gk_morris_level_conversations_fortynine_01",
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
				"pes_gk_morris_level_conversations_fortynine_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_gk_morris_level_conversations_thirtynine_01",
		probability = 1,
		response = "pdr_gk_morris_level_conversations_thirtynine_01",
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
				"pes_gk_morris_level_conversations_thirtynine_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_gk_morris_level_conversations_thirtyseven_01",
		probability = 1,
		response = "pdr_gk_morris_level_conversations_thirtyseven_01",
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
				"pes_gk_morris_level_conversations_thirtyseven_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_gk_morris_level_conversations_thirtysix_01",
		probability = 1,
		response = "pdr_gk_morris_level_conversations_thirtysix_01",
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
				10,
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
				"es_questingknight",
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
				240,
			},
			{
				"faction_memory",
				"pdr_gk_morris_level_conversations_thirtysix",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_gk_morris_level_conversations_thirtysix",
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
		name = "pdr_morris_level_conversations_fifteen_01",
		probability = 1,
		response = "pdr_morris_level_conversations_fifteen_01",
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
				"pwe_morris_level_conversations_fifteen_01",
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
				"dwarf_ranger",
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
		name = "pdr_morris_level_conversations_fifteen_02",
		probability = 1,
		response = "pdr_morris_level_conversations_fifteen_02",
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
				"pes_morris_level_conversations_fifteen_01",
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
				"dwarf_ranger",
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
		name = "pdr_morris_level_conversations_five_01",
		probability = 1,
		response = "pdr_morris_level_conversations_five_01",
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
				"pes_morris_level_conversations_five_01",
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
				"dwarf_ranger",
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
		name = "pdr_morris_level_conversations_five_02",
		probability = 1,
		response = "pdr_morris_level_conversations_five_02",
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
				"pes_morris_level_conversations_five_02",
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
				"dwarf_ranger",
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
		name = "pdr_morris_level_conversations_four_01",
		probability = 1,
		response = "pdr_morris_level_conversations_four_01",
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
				"pbw_morris_level_conversations_four_01",
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
				"dwarf_ranger",
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
		name = "pdr_morris_level_conversations_four_02",
		probability = 1,
		response = "pdr_morris_level_conversations_four_02",
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
				"pbw_morris_level_conversations_four_02",
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
				"dwarf_ranger",
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
		name = "pdr_morris_level_conversations_seven_01",
		probability = 1,
		response = "pdr_morris_level_conversations_seven_01",
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
				"pes_morris_level_conversations_seven_01",
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
				"dwarf_ranger",
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
		name = "pdr_morris_level_conversations_seven_02",
		probability = 1,
		response = "pdr_morris_level_conversations_seven_02",
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
				"pwh_morris_level_conversations_seven_01",
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
				"dwarf_ranger",
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
		name = "pdr_morris_level_conversations_seventeen_01",
		probability = 1,
		response = "pdr_morris_level_conversations_seventeen_01",
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pdr_morris_level_conversations_seventeen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_level_conversations_seventeen_01",
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
		name = "pdr_morris_level_conversations_seventeen_02",
		probability = 1,
		response = "pdr_morris_level_conversations_seventeen_02",
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
				"pbw_morris_level_conversations_seventeen_01",
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
				"dwarf_ranger",
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
		name = "pdr_morris_level_conversations_thirtyfive_01",
		probability = 1,
		response = "pdr_morris_level_conversations_thirtyfive_01",
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
				"pes_morris_level_conversations_thirtyfive_01",
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
				"dwarf_ranger",
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
		name = "pdr_morris_level_conversations_thirtyfive_02",
		probability = 1,
		response = "pdr_morris_level_conversations_thirtyfive_02",
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
				"pes_morris_level_conversations_thirtyfive_02",
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
				"dwarf_ranger",
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
		name = "pdr_morris_level_conversations_three_01",
		probability = 1,
		response = "pdr_morris_level_conversations_three_01",
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
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pdr_morris_level_conversations_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_level_conversations_three_01",
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
		name = "pdr_morris_level_conversations_three_02",
		probability = 1,
		response = "pdr_morris_level_conversations_three_02",
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
				"pwe_morris_level_conversations_three_01",
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
				"dwarf_ranger",
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
		name = "pes_de_morris_level_conversations_fifty_01",
		probability = 1,
		response = "pes_de_morris_level_conversations_fifty_01",
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
				"pdr_de_morris_level_conversations_fifty_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_de_morris_level_conversations_fifty_02",
		probability = 1,
		response = "pes_de_morris_level_conversations_fifty_02",
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
				"pdr_de_morris_level_conversations_fifty_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_de_morris_level_conversations_fiftyone_01",
		probability = 1,
		response = "pes_de_morris_level_conversations_fiftyone_01",
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
				10,
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
				"dr_engineer",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_fortynine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_fortynine",
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
		name = "pes_de_morris_level_conversations_fiftyone_02",
		probability = 1,
		response = "pes_de_morris_level_conversations_fiftyone_02",
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
				"pdr_de_morris_level_conversations_fiftyone_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_de_morris_level_conversations_fortyfour_01",
		probability = 1,
		response = "pes_de_morris_level_conversations_fortyfour_01",
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
				10,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
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
				"dr_engineer",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_de_morris_level_conversations_fortyfour",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_de_morris_level_conversations_fortyfour",
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
		name = "pes_de_morris_level_conversations_fortyfour_02",
		probability = 1,
		response = "pes_de_morris_level_conversations_fortyfour_02",
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
				"pdr_de_morris_level_conversations_fortyfour_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_de_morris_level_conversations_fortysix_01",
		probability = 1,
		response = "pes_de_morris_level_conversations_fortysix_01",
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
				"pdr_de_morris_level_conversations_fortysix_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_de_morris_level_conversations_fortysix_02",
		probability = 1,
		response = "pes_de_morris_level_conversations_fortysix_02",
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
				"pdr_de_morris_level_conversations_fortysix_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_de_morris_level_conversations_fortythree_01",
		probability = 1,
		response = "pes_de_morris_level_conversations_fortythree_01",
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
				10,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
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
				"dr_engineer",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_de_morris_level_conversations_fortythree",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_de_morris_level_conversations_fortythree",
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
		name = "pes_de_morris_level_conversations_fortythree_02",
		probability = 1,
		response = "pes_de_morris_level_conversations_fortythree_02",
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
				"pdr_de_morris_level_conversations_fortythree_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_de_morris_level_conversations_fortytwo_01",
		probability = 1,
		response = "pes_de_morris_level_conversations_fortytwo_01",
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
				"pdr_de_morris_level_conversations_fortytwo_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_gk_de_morris_level_conversations_fortyone_01",
		probability = 1,
		response = "pes_gk_de_morris_level_conversations_fortyone_01",
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
				"pdr_de_gk_morris_level_conversations_fortyone_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_gk_de_morris_level_conversations_fortyone_02",
		probability = 1,
		response = "pes_gk_de_morris_level_conversations_fortyone_02",
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
				"pdr_de_gk_morris_level_conversations_fortyone_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_gk_morris_level_conversations_forty_01",
		probability = 1,
		response = "pes_gk_morris_level_conversations_forty_01",
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
				"pwe_gk_morris_level_conversations_forty_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_gk_morris_level_conversations_forty_02",
		probability = 1,
		response = "pes_gk_morris_level_conversations_forty_02",
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
				"pwe_gk_morris_level_conversations_forty_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_gk_morris_level_conversations_fortyeight_01",
		probability = 1,
		response = "pes_gk_morris_level_conversations_fortyeight_01",
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
				"pdr_gk_morris_level_conversations_fortyeight_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_gk_morris_level_conversations_fortynine_01",
		probability = 1,
		response = "pes_gk_morris_level_conversations_fortynine_01",
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
				10,
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight",
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_fortynine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_fortynine",
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
		name = "pes_gk_morris_level_conversations_fortynine_02",
		probability = 1,
		response = "pes_gk_morris_level_conversations_fortynine_02",
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
				"pdr_gk_morris_level_conversations_fortynine_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_gk_morris_level_conversations_thirtyeight_01",
		probability = 1,
		response = "pes_gk_morris_level_conversations_thirtyeight_01",
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
				10,
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight",
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
				240,
			},
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_thirtyeight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_thirtyeight",
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
		name = "pes_gk_morris_level_conversations_thirtyeight_02",
		probability = 1,
		response = "pes_gk_morris_level_conversations_thirtyeight_02",
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
				"pwh_gk_morris_level_conversations_thirtyeight_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_gk_morris_level_conversations_thirtynine_01",
		probability = 1,
		response = "pes_gk_morris_level_conversations_thirtynine_01",
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
				"pbw_gk_morris_level_conversations_thirtynine_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_gk_morris_level_conversations_thirtynine_02",
		probability = 1,
		response = "pes_gk_morris_level_conversations_thirtynine_02",
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
				"pdr_gk_morris_level_conversations_thirtynine_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_gk_morris_level_conversations_thirtyseven_01",
		probability = 1,
		response = "pes_gk_morris_level_conversations_thirtyseven_01",
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
				10,
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_thirtyseven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_thirtyseven",
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
		name = "pes_gk_morris_level_conversations_thirtyseven_02",
		probability = 1,
		response = "pes_gk_morris_level_conversations_thirtyseven_02",
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
				"pwe_gk_morris_level_conversations_thirtyseven_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_gk_morris_level_conversations_thirtysix_01",
		probability = 1,
		response = "pes_gk_morris_level_conversations_thirtysix_01",
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
				"pdr_gk_morris_level_conversations_thirtysix_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_morris_level_conversations_eighteen_01",
		probability = 1,
		response = "pes_morris_level_conversations_eighteen_01",
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
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_eighteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_eighteen_01",
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
		name = "pes_morris_level_conversations_eighteen_02",
		probability = 1,
		response = "pes_morris_level_conversations_eighteen_02",
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
				"pwh_morris_level_conversations_eighteen_01",
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
				"empire_soldier",
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
		name = "pes_morris_level_conversations_fifteen_01",
		probability = 1,
		response = "pes_morris_level_conversations_fifteen_01",
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
				"pdr_morris_level_conversations_fifteen_01",
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
				"empire_soldier",
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
		name = "pes_morris_level_conversations_five_01",
		probability = 1,
		response = "pes_morris_level_conversations_five_01",
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_five_01",
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
		name = "pes_morris_level_conversations_five_02",
		probability = 1,
		response = "pes_morris_level_conversations_five_02",
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
				"pdr_morris_level_conversations_five_01",
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
				"empire_soldier",
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
		name = "pes_morris_level_conversations_fourteen_01",
		probability = 1,
		response = "pes_morris_level_conversations_fourteen_01",
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
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_fourteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_fourteen_01",
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
		name = "pes_morris_level_conversations_fourteen_02",
		probability = 1,
		response = "pes_morris_level_conversations_fourteen_02",
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
				"pwh_morris_level_conversations_fourteen_01",
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
				"empire_soldier",
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
		name = "pes_morris_level_conversations_seven_01",
		probability = 1,
		response = "pes_morris_level_conversations_seven_01",
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_seven_01",
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
		name = "pes_morris_level_conversations_thirtyfive_01",
		probability = 1,
		response = "pes_morris_level_conversations_thirtyfive_01",
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
				"witch_hunter",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_thirtyfive_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_thirtyfive_01",
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
		name = "pes_morris_level_conversations_thirtyfive_02",
		probability = 1,
		response = "pes_morris_level_conversations_thirtyfive_02",
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
				"pdr_morris_level_conversations_thirtyfive_01",
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
				"empire_soldier",
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
		name = "pes_morris_level_conversations_thirtyfive_03",
		probability = 1,
		response = "pes_morris_level_conversations_thirtyfive_03",
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
				"pdr_morris_level_conversations_thirtyfive_02",
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
				"empire_soldier",
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
		name = "pes_morris_level_conversations_thirtyfour_01",
		probability = 1,
		response = "pes_morris_level_conversations_thirtyfour_01",
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
				"pwh_morris_level_conversations_thirtyfour_01",
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
				"empire_soldier",
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
		name = "pes_morris_level_conversations_thirtyfour_02",
		probability = 1,
		response = "pes_morris_level_conversations_thirtyfour_02",
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
				"pwh_morris_level_conversations_thirtyfour_02",
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
				"empire_soldier",
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
		name = "pes_morris_level_conversations_thirtytwo_01",
		probability = 1,
		response = "pes_morris_level_conversations_thirtytwo_01",
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
				"witch_hunter",
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
				240,
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_thirtytwo_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_thirtytwo_01",
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
		name = "pes_morris_level_conversations_thirtytwo_02",
		probability = 1,
		response = "pes_morris_level_conversations_thirtytwo_02",
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
				"pwh_morris_level_conversations_thirtytwo_01",
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
				"empire_soldier",
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
		name = "pes_morris_level_conversations_thirtytwo_03",
		probability = 1,
		response = "pes_morris_level_conversations_thirtytwo_03",
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
				"pbw_morris_level_conversations_thirtytwo_01",
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
				"empire_soldier",
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
		name = "pes_morris_level_conversations_twentyone_01",
		probability = 1,
		response = "pes_morris_level_conversations_twentyone_01",
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
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_twentyone_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_twentyone_01",
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
		name = "pes_morris_level_conversations_twentyone_02",
		probability = 1,
		response = "pes_morris_level_conversations_twentyone_02",
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
				"pwe_morris_level_conversations_twentyone_01",
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
				"empire_soldier",
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
		name = "pes_morris_level_conversations_two_01",
		probability = 1,
		response = "pes_morris_level_conversations_two_01",
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
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_two_01",
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
		name = "pes_morris_level_conversations_two_02",
		probability = 1,
		response = "pes_morris_level_conversations_two_02",
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
				"pwh_morris_level_conversations_two_01",
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
				"empire_soldier",
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
		name = "pwe_gk_morris_level_conversations_forty_01",
		probability = 1,
		response = "pwe_gk_morris_level_conversations_forty_01",
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
				10,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
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
				"es_questingknight",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pwe_gk_morris_level_conversations_forty",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_gk_morris_level_conversations_forty",
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
		name = "pwe_gk_morris_level_conversations_forty_02",
		probability = 1,
		response = "pwe_gk_morris_level_conversations_forty_02",
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
				"pes_gk_morris_level_conversations_forty_01",
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
		name = "pwe_gk_morris_level_conversations_fortyeight_01",
		probability = 1,
		response = "pwe_gk_morris_level_conversations_fortyeight_01",
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
				"pes_gk_morris_level_conversations_fortyeight_01",
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
		name = "pwe_gk_morris_level_conversations_thirtyseven_01",
		probability = 1,
		response = "pwe_gk_morris_level_conversations_thirtyseven_01",
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
				"pes_gk_morris_level_conversations_thirtyseven_01",
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
		name = "pwe_gk_morris_level_conversations_thirtysix_01",
		probability = 1,
		response = "pwe_gk_morris_level_conversations_thirtysix_01",
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
				"pes_gk_morris_level_conversations_thirtysix_01",
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
		name = "pwe_morris_level_conversations_eight_01",
		probability = 1,
		response = "pwe_morris_level_conversations_eight_01",
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
				"pbw_morris_level_conversations_eight_01",
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
		name = "pwe_morris_level_conversations_eight_02",
		probability = 1,
		response = "pwe_morris_level_conversations_eight_02",
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
				"pbw_morris_level_conversations_eight_02",
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
		name = "pwe_morris_level_conversations_fifteen_01",
		probability = 1,
		response = "pwe_morris_level_conversations_fifteen_01",
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pwe_morris_level_conversations_fifteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_level_conversations_fifteen_01",
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
		name = "pwe_morris_level_conversations_nineteen_01",
		probability = 1,
		response = "pwe_morris_level_conversations_nineteen_01",
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
				"pbw_morris_level_conversations_nineteen_01",
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
		name = "pwe_morris_level_conversations_nineteen_02",
		probability = 1,
		response = "pwe_morris_level_conversations_nineteen_02",
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
				"pbw_morris_level_conversations_nineteen_02",
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
		name = "pwe_morris_level_conversations_six_01",
		probability = 1,
		response = "pwe_morris_level_conversations_six_01",
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
				"pbw_morris_level_conversations_six_01",
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
		name = "pwe_morris_level_conversations_six_02",
		probability = 1,
		response = "pwe_morris_level_conversations_six_02",
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
				"pbw_morris_level_conversations_six_02",
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
		name = "pwe_morris_level_conversations_three_01",
		probability = 1,
		response = "pwe_morris_level_conversations_three_01",
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
				"pdr_morris_level_conversations_three_01",
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
		name = "pwe_morris_level_conversations_three_02",
		probability = 1,
		response = "pwe_morris_level_conversations_three_02",
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
				"pdr_morris_level_conversations_three_02",
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
		name = "pwe_morris_level_conversations_twenty_01",
		probability = 1,
		response = "pwe_morris_level_conversations_twenty_01",
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pwe_morris_level_conversations_twenty_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_level_conversations_twenty_01",
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
		name = "pwe_morris_level_conversations_twenty_02",
		probability = 1,
		response = "pwe_morris_level_conversations_twenty_02",
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
				"pbw_morris_level_conversations_twenty_01",
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
		name = "pwe_morris_level_conversations_twenty_03",
		probability = 1,
		response = "pwe_morris_level_conversations_twenty_03",
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
				"pbw_morris_level_conversations_twenty_02",
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
		name = "pwe_morris_level_conversations_twentyone_01",
		probability = 1,
		response = "pwe_morris_level_conversations_twentyone_01",
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
				"pes_morris_level_conversations_twentyone_01",
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
		name = "pwe_morris_level_conversations_twentyone_02",
		probability = 1,
		response = "pwe_morris_level_conversations_twentyone_02",
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
				"pes_morris_level_conversations_twentyone_02",
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
		name = "pwe_morris_level_conversations_twentythree_01",
		probability = 1,
		response = "pwe_morris_level_conversations_twentythree_01",
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
				"pwh_morris_level_conversations_twentythree_01",
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
		name = "pwe_morris_level_conversations_twentythree_02",
		probability = 1,
		response = "pwe_morris_level_conversations_twentythree_02",
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
				"pwh_morris_level_conversations_twentythree_02",
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
		name = "pwh_de_morris_level_conversations_fortyfive_01",
		probability = 1,
		response = "pwh_de_morris_level_conversations_fortyfive_01",
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
				"pdr_de_morris_level_conversations_fortyfive_01",
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
		name = "pwh_de_morris_level_conversations_fortyseven_01",
		probability = 1,
		response = "pwh_de_morris_level_conversations_fortyseven_01",
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
				"pdr_de_morris_level_conversations_fortyseven_01",
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
		name = "pwh_gk_morris_level_conversations_fortyeight_01",
		probability = 1,
		response = "pwh_gk_morris_level_conversations_fortyeight_01",
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
				"pwe_gk_morris_level_conversations_fortyeight_01",
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
		name = "pwh_gk_morris_level_conversations_thirtyeight_01",
		probability = 1,
		response = "pwh_gk_morris_level_conversations_thirtyeight_01",
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
				"pes_gk_morris_level_conversations_thirtyeight_01",
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
		name = "pwh_morris_level_conversations_eighteen_01",
		probability = 1,
		response = "pwh_morris_level_conversations_eighteen_01",
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
				"pes_morris_level_conversations_eighteen_01",
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
		name = "pwh_morris_level_conversations_eighteen_02",
		probability = 1,
		response = "pwh_morris_level_conversations_eighteen_02",
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
				"pes_morris_level_conversations_eighteen_02",
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
		name = "pwh_morris_level_conversations_fourteen_01",
		probability = 1,
		response = "pwh_morris_level_conversations_fourteen_01",
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
				"pes_morris_level_conversations_fourteen_01",
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
		name = "pwh_morris_level_conversations_fourteen_02",
		probability = 1,
		response = "pwh_morris_level_conversations_fourteen_02",
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
				"pes_morris_level_conversations_fourteen_02",
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
		name = "pwh_morris_level_conversations_nine_01",
		probability = 1,
		response = "pwh_morris_level_conversations_nine_01",
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
				"pbw_morris_level_conversations_nine_01",
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
		name = "pwh_morris_level_conversations_nine_02",
		probability = 1,
		response = "pwh_morris_level_conversations_nine_02",
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
				"pbw_morris_level_conversations_nine_02",
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
		name = "pwh_morris_level_conversations_one_01",
		probability = 1,
		response = "pwh_morris_level_conversations_one_01",
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
				"pbw_morris_level_conversations_one_01",
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
		name = "pwh_morris_level_conversations_one_02",
		probability = 1,
		response = "pwh_morris_level_conversations_one_02",
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
				"pbw_morris_level_conversations_one_02",
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
		name = "pwh_morris_level_conversations_seven_01",
		probability = 1,
		response = "pwh_morris_level_conversations_seven_01",
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
				"pdr_morris_level_conversations_seven_01",
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
		name = "pwh_morris_level_conversations_sixteen_01",
		probability = 1,
		response = "pwh_morris_level_conversations_sixteen_01",
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
				"pbw_morris_level_conversations_sixteen_01",
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
		name = "pwh_morris_level_conversations_thirtyfour_01",
		probability = 1,
		response = "pwh_morris_level_conversations_thirtyfour_01",
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
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"pwh_morris_level_conversations_thirtyfour_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_level_conversations_thirtyfour_01",
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
		name = "pwh_morris_level_conversations_thirtyfour_02",
		probability = 1,
		response = "pwh_morris_level_conversations_thirtyfour_02",
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
				"pes_morris_level_conversations_thirtyfour_01",
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
		name = "pwh_morris_level_conversations_thirtytwo_01",
		probability = 1,
		response = "pwh_morris_level_conversations_thirtytwo_01",
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
				"pes_morris_level_conversations_thirtytwo_01",
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
		name = "pwh_morris_level_conversations_twentythree_01",
		probability = 1,
		response = "pwh_morris_level_conversations_twentythree_01",
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
				240,
			},
			{
				"faction_memory",
				"pwh_morris_level_conversations_twentythree_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_level_conversations_twentythree_01",
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
		name = "pwh_morris_level_conversations_twentythree_02",
		probability = 1,
		response = "pwh_morris_level_conversations_twentythree_02",
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
				"pwe_morris_level_conversations_twentythree_01",
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
		name = "pwh_morris_level_conversations_twentytwo_01",
		probability = 1,
		response = "pwh_morris_level_conversations_twentytwo_01",
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
				240,
			},
			{
				"faction_memory",
				"pwh_morris_level_conversations_twentytwo_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_level_conversations_twentytwo_01",
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
		name = "pwh_morris_level_conversations_twentytwo_02",
		probability = 1,
		response = "pwh_morris_level_conversations_twentytwo_02",
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
				"pbw_morris_level_conversations_twentytwo_01",
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
		name = "pwh_morris_level_conversations_two_01",
		probability = 1,
		response = "pwh_morris_level_conversations_two_01",
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
				"pes_morris_level_conversations_two_01",
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
	add_dialogues({
		pbw_de_morris_level_conversations_fortyseven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_de_morris_level_conversations_fortyseven_01",
			},
			sound_events = {
				[1] = "pbw_de_morris_level_conversations_fortyseven_01",
			},
			sound_events_duration = {
				[1] = 4.1126456260681,
			},
		},
		pbw_gk_morris_level_conversations_fortyeight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_gk_morris_level_conversations_fortyeight_01",
			},
			sound_events = {
				[1] = "pbw_gk_morris_level_conversations_fortyeight_01",
			},
			sound_events_duration = {
				[1] = 3.8040416240692,
			},
		},
		pbw_gk_morris_level_conversations_thirtynine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_gk_morris_level_conversations_thirtynine_01",
			},
			sound_events = {
				[1] = "pbw_gk_morris_level_conversations_thirtynine_01",
			},
			sound_events_duration = {
				[1] = 4.4111042022705,
			},
		},
		pbw_morris_level_conversations_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_eight_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_eight_01",
			},
			sound_events_duration = {
				[1] = 2.9697291851044,
			},
		},
		pbw_morris_level_conversations_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_eight_02",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_eight_02",
			},
			sound_events_duration = {
				[1] = 3.5529792308807,
			},
		},
		pbw_morris_level_conversations_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_four_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_four_01",
			},
			sound_events_duration = {
				[1] = 6.2698335647583,
			},
		},
		pbw_morris_level_conversations_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_four_02",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_four_02",
			},
			sound_events_duration = {
				[1] = 4.1993126869202,
			},
		},
		pbw_morris_level_conversations_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_nine_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_nine_01",
			},
			sound_events_duration = {
				[1] = 4.5400414466858,
			},
		},
		pbw_morris_level_conversations_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_nine_02",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_nine_02",
			},
			sound_events_duration = {
				[1] = 6.5923957824707,
			},
		},
		pbw_morris_level_conversations_nineteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_nineteen_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_nineteen_01",
			},
			sound_events_duration = {
				[1] = 2.1252083778381,
			},
		},
		pbw_morris_level_conversations_nineteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_nineteen_02",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_nineteen_02",
			},
			sound_events_duration = {
				[1] = 3.7353959083557,
			},
		},
		pbw_morris_level_conversations_nineteen_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_nineteen_03",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_nineteen_03",
			},
			sound_events_duration = {
				[1] = 8.7096042633057,
			},
		},
		pbw_morris_level_conversations_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_one_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_one_01",
			},
			sound_events_duration = {
				[1] = 4.730354309082,
			},
		},
		pbw_morris_level_conversations_one_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_one_02",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_one_02",
			},
			sound_events_duration = {
				[1] = 3.646666765213,
			},
		},
		pbw_morris_level_conversations_seventeen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_seventeen_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_seventeen_01",
			},
			sound_events_duration = {
				[1] = 2.1531250476837,
			},
		},
		pbw_morris_level_conversations_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_six_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_six_01",
			},
			sound_events_duration = {
				[1] = 2.2123334407806,
			},
		},
		pbw_morris_level_conversations_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_six_02",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_six_02",
			},
			sound_events_duration = {
				[1] = 5.4058332443237,
			},
		},
		pbw_morris_level_conversations_sixteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_sixteen_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_sixteen_01",
			},
			sound_events_duration = {
				[1] = 3.5462501049042,
			},
		},
		pbw_morris_level_conversations_sixteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_sixteen_02",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_sixteen_02",
			},
			sound_events_duration = {
				[1] = 2.4981665611267,
			},
		},
		pbw_morris_level_conversations_thirtytwo_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_thirtytwo_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_thirtytwo_01",
			},
			sound_events_duration = {
				[1] = 2.4717500209808,
			},
		},
		pbw_morris_level_conversations_twenty_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_twenty_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_twenty_01",
			},
			sound_events_duration = {
				[1] = 3.4713749885559,
			},
		},
		pbw_morris_level_conversations_twenty_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_twenty_02",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_twenty_02",
			},
			sound_events_duration = {
				[1] = 0.7247708439827,
			},
		},
		pbw_morris_level_conversations_twentytwo_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pbw_morris_level_conversations_twentytwo_01",
			},
			sound_events = {
				[1] = "pbw_morris_level_conversations_twentytwo_01",
			},
			sound_events_duration = {
				[1] = 3.8594374656677,
			},
		},
		pdr_de_gk_morris_level_conversations_fortyone_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_gk_morris_level_conversations_fortyone_01",
			},
			sound_events = {
				[1] = "pdr_de_gk_morris_level_conversations_fortyone_01",
			},
			sound_events_duration = {
				[1] = 1.999104142189,
			},
		},
		pdr_de_gk_morris_level_conversations_fortyone_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_gk_morris_level_conversations_fortyone_02",
			},
			sound_events = {
				[1] = "pdr_de_gk_morris_level_conversations_fortyone_02",
			},
			sound_events_duration = {
				[1] = 1.5016458034515,
			},
		},
		pdr_de_morris_level_conversations_fifty_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fifty_01",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fifty_01",
			},
			sound_events_duration = {
				[1] = 3.1936457157135,
			},
		},
		pdr_de_morris_level_conversations_fifty_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fifty_02",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fifty_02",
			},
			sound_events_duration = {
				[1] = 7.0132918357849,
			},
		},
		pdr_de_morris_level_conversations_fiftyone_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fiftyone_01",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fiftyone_01",
			},
			sound_events_duration = {
				[1] = 5.876437664032,
			},
		},
		pdr_de_morris_level_conversations_fortyfive_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fortyfive_01",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fortyfive_01",
			},
			sound_events_duration = {
				[1] = 4.5127501487732,
			},
		},
		pdr_de_morris_level_conversations_fortyfive_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fortyfive_02",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fortyfive_02",
			},
			sound_events_duration = {
				[1] = 4.4348125457764,
			},
		},
		pdr_de_morris_level_conversations_fortyfour_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fortyfour_01",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fortyfour_01",
			},
			sound_events_duration = {
				[1] = 5.7958126068115,
			},
		},
		pdr_de_morris_level_conversations_fortyseven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fortyseven_01",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fortyseven_01",
			},
			sound_events_duration = {
				[1] = 5.9302082061768,
			},
		},
		pdr_de_morris_level_conversations_fortyseven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fortyseven_02",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fortyseven_02",
			},
			sound_events_duration = {
				[1] = 9.8078336715698,
			},
		},
		pdr_de_morris_level_conversations_fortysix_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fortysix_01",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fortysix_01",
			},
			sound_events_duration = {
				[1] = 3.7976040840149,
			},
		},
		pdr_de_morris_level_conversations_fortysix_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fortysix_02",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fortysix_02",
			},
			sound_events_duration = {
				[1] = 8.0599374771118,
			},
		},
		pdr_de_morris_level_conversations_fortysix_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fortysix_03",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fortysix_03",
			},
			sound_events_duration = {
				[1] = 1.8569791316986,
			},
		},
		pdr_de_morris_level_conversations_fortythree_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fortythree_01",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fortythree_01",
			},
			sound_events_duration = {
				[1] = 7.044499874115,
			},
		},
		pdr_de_morris_level_conversations_fortytwo_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fortytwo_01",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fortytwo_01",
			},
			sound_events_duration = {
				[1] = 3.7932708263397,
			},
		},
		pdr_de_morris_level_conversations_fortytwo_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_de_morris_level_conversations_fortytwo_02",
			},
			sound_events = {
				[1] = "pdr_de_morris_level_conversations_fortytwo_02",
			},
			sound_events_duration = {
				[1] = 6.8717918395996,
			},
		},
		pdr_gk_morris_level_conversations_fortyeight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_gk_morris_level_conversations_fortyeight_01",
			},
			sound_events = {
				[1] = "pdr_gk_morris_level_conversations_fortyeight_01",
			},
			sound_events_duration = {
				[1] = 8.1847915649414,
			},
		},
		pdr_gk_morris_level_conversations_fortynine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_gk_morris_level_conversations_fortynine_01",
			},
			sound_events = {
				[1] = "pdr_gk_morris_level_conversations_fortynine_01",
			},
			sound_events_duration = {
				[1] = 3.573145866394,
			},
		},
		pdr_gk_morris_level_conversations_thirtynine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_gk_morris_level_conversations_thirtynine_01",
			},
			sound_events = {
				[1] = "pdr_gk_morris_level_conversations_thirtynine_01",
			},
			sound_events_duration = {
				[1] = 6.2345418930054,
			},
		},
		pdr_gk_morris_level_conversations_thirtyseven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_gk_morris_level_conversations_thirtyseven_01",
			},
			sound_events = {
				[1] = "pdr_gk_morris_level_conversations_thirtyseven_01",
			},
			sound_events_duration = {
				[1] = 3.2798750400543,
			},
		},
		pdr_gk_morris_level_conversations_thirtysix_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_gk_morris_level_conversations_thirtysix_01",
			},
			sound_events = {
				[1] = "pdr_gk_morris_level_conversations_thirtysix_01",
			},
			sound_events_duration = {
				[1] = 5.4813122749329,
			},
		},
		pdr_morris_level_conversations_fifteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_fifteen_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_fifteen_01",
			},
			sound_events_duration = {
				[1] = 6.1539998054504,
			},
		},
		pdr_morris_level_conversations_fifteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_fifteen_02",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_fifteen_02",
			},
			sound_events_duration = {
				[1] = 4.3912501335144,
			},
		},
		pdr_morris_level_conversations_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_five_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_five_01",
			},
			sound_events_duration = {
				[1] = 5.4265832901001,
			},
		},
		pdr_morris_level_conversations_five_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_five_02",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_five_02",
			},
			sound_events_duration = {
				[1] = 4.4161872863769,
			},
		},
		pdr_morris_level_conversations_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_four_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_four_01",
			},
			sound_events_duration = {
				[1] = 11.272853851318,
			},
		},
		pdr_morris_level_conversations_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_four_02",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_four_02",
			},
			sound_events_duration = {
				[1] = 2.5820000171661,
			},
		},
		pdr_morris_level_conversations_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_seven_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_seven_01",
			},
			sound_events_duration = {
				[1] = 6.9398126602173,
			},
		},
		pdr_morris_level_conversations_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_seven_02",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_seven_02",
			},
			sound_events_duration = {
				[1] = 4.5099582672119,
			},
		},
		pdr_morris_level_conversations_seventeen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_seventeen_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_seventeen_01",
			},
			sound_events_duration = {
				[1] = 5.2389373779297,
			},
		},
		pdr_morris_level_conversations_seventeen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_seventeen_02",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_seventeen_02",
			},
			sound_events_duration = {
				[1] = 3.3961040973663,
			},
		},
		pdr_morris_level_conversations_thirtyfive_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_thirtyfive_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_thirtyfive_01",
			},
			sound_events_duration = {
				[1] = 9.4361667633057,
			},
		},
		pdr_morris_level_conversations_thirtyfive_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_thirtyfive_02",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_thirtyfive_02",
			},
			sound_events_duration = {
				[1] = 3.5853333473206,
			},
		},
		pdr_morris_level_conversations_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_three_01",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_three_01",
			},
			sound_events_duration = {
				[1] = 4.9703960418701,
			},
		},
		pdr_morris_level_conversations_three_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pdr_morris_level_conversations_three_02",
			},
			sound_events = {
				[1] = "pdr_morris_level_conversations_three_02",
			},
			sound_events_duration = {
				[1] = 2.6625416278839,
			},
		},
		pes_de_morris_level_conversations_fifty_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_de_morris_level_conversations_fifty_01",
			},
			sound_events = {
				[1] = "pes_de_morris_level_conversations_fifty_01",
			},
			sound_events_duration = {
				[1] = 1.9630833864212,
			},
		},
		pes_de_morris_level_conversations_fifty_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_de_morris_level_conversations_fifty_02",
			},
			sound_events = {
				[1] = "pes_de_morris_level_conversations_fifty_02",
			},
			sound_events_duration = {
				[1] = 2.6430833339691,
			},
		},
		pes_de_morris_level_conversations_fiftyone_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_de_morris_level_conversations_fiftyone_01",
			},
			sound_events = {
				[1] = "pes_de_morris_level_conversations_fiftyone_01",
			},
			sound_events_duration = {
				[1] = 5.2859168052673,
			},
		},
		pes_de_morris_level_conversations_fiftyone_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_de_morris_level_conversations_fiftyone_02",
			},
			sound_events = {
				[1] = "pes_de_morris_level_conversations_fiftyone_02",
			},
			sound_events_duration = {
				[1] = 5.8417081832886,
			},
		},
		pes_de_morris_level_conversations_fortyfour_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_de_morris_level_conversations_fortyfour_01",
			},
			sound_events = {
				[1] = "pes_de_morris_level_conversations_fortyfour_01",
			},
			sound_events_duration = {
				[1] = 2.1275625228882,
			},
		},
		pes_de_morris_level_conversations_fortyfour_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_de_morris_level_conversations_fortyfour_02",
			},
			sound_events = {
				[1] = "pes_de_morris_level_conversations_fortyfour_02",
			},
			sound_events_duration = {
				[1] = 5.3201456069946,
			},
		},
		pes_de_morris_level_conversations_fortysix_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_de_morris_level_conversations_fortysix_01",
			},
			sound_events = {
				[1] = "pes_de_morris_level_conversations_fortysix_01",
			},
			sound_events_duration = {
				[1] = 3.0541040897369,
			},
		},
		pes_de_morris_level_conversations_fortysix_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_de_morris_level_conversations_fortysix_02",
			},
			sound_events = {
				[1] = "pes_de_morris_level_conversations_fortysix_02",
			},
			sound_events_duration = {
				[1] = 2.3776249885559,
			},
		},
		pes_de_morris_level_conversations_fortythree_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_de_morris_level_conversations_fortythree_01",
			},
			sound_events = {
				[1] = "pes_de_morris_level_conversations_fortythree_01",
			},
			sound_events_duration = {
				[1] = 3.192104101181,
			},
		},
		pes_de_morris_level_conversations_fortythree_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_de_morris_level_conversations_fortythree_02",
			},
			sound_events = {
				[1] = "pes_de_morris_level_conversations_fortythree_02",
			},
			sound_events_duration = {
				[1] = 4.1318335533142,
			},
		},
		pes_de_morris_level_conversations_fortytwo_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_de_morris_level_conversations_fortytwo_01",
			},
			sound_events = {
				[1] = "pes_de_morris_level_conversations_fortytwo_01",
			},
			sound_events_duration = {
				[1] = 1.9311250448227,
			},
		},
		pes_gk_de_morris_level_conversations_fortyone_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_de_morris_level_conversations_fortyone_01",
			},
			sound_events = {
				[1] = "pes_gk_de_morris_level_conversations_fortyone_01",
			},
			sound_events_duration = {
				[1] = 5.1128125190735,
			},
		},
		pes_gk_de_morris_level_conversations_fortyone_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_de_morris_level_conversations_fortyone_02",
			},
			sound_events = {
				[1] = "pes_gk_de_morris_level_conversations_fortyone_02",
			},
			sound_events_duration = {
				[1] = 4.4168124198914,
			},
		},
		pes_gk_morris_level_conversations_forty_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_forty_01",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_forty_01",
			},
			sound_events_duration = {
				[1] = 2.7962708473206,
			},
		},
		pes_gk_morris_level_conversations_forty_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_forty_02",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_forty_02",
			},
			sound_events_duration = {
				[1] = 3.7054374217987,
			},
		},
		pes_gk_morris_level_conversations_fortyeight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_fortyeight_01",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_fortyeight_01",
			},
			sound_events_duration = {
				[1] = 5.6230416297913,
			},
		},
		pes_gk_morris_level_conversations_fortynine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_fortynine_01",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_fortynine_01",
			},
			sound_events_duration = {
				[1] = 2.2426874637604,
			},
		},
		pes_gk_morris_level_conversations_fortynine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_fortynine_02",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_fortynine_02",
			},
			sound_events_duration = {
				[1] = 4.3681664466858,
			},
		},
		pes_gk_morris_level_conversations_thirtyeight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_thirtyeight_01",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_thirtyeight_01",
			},
			sound_events_duration = {
				[1] = 2.9712290763855,
			},
		},
		pes_gk_morris_level_conversations_thirtyeight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_thirtyeight_02",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_thirtyeight_02",
			},
			sound_events_duration = {
				[1] = 3.6582291126251,
			},
		},
		pes_gk_morris_level_conversations_thirtynine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_thirtynine_01",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_thirtynine_01",
			},
			sound_events_duration = {
				[1] = 3.1593749523163,
			},
		},
		pes_gk_morris_level_conversations_thirtynine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_thirtynine_02",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_thirtynine_02",
			},
			sound_events_duration = {
				[1] = 2.1045000553131,
			},
		},
		pes_gk_morris_level_conversations_thirtyseven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_thirtyseven_01",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_thirtyseven_01",
			},
			sound_events_duration = {
				[1] = 6.8049373626709,
			},
		},
		pes_gk_morris_level_conversations_thirtyseven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_thirtyseven_02",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_thirtyseven_02",
			},
			sound_events_duration = {
				[1] = 1.7029792070389,
			},
		},
		pes_gk_morris_level_conversations_thirtysix_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_gk_morris_level_conversations_thirtysix_01",
			},
			sound_events = {
				[1] = "pes_gk_morris_level_conversations_thirtysix_01",
			},
			sound_events_duration = {
				[1] = 2.7715001106262,
			},
		},
		pes_morris_level_conversations_eighteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_eighteen_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_eighteen_01",
			},
			sound_events_duration = {
				[1] = 3.3518333435059,
			},
		},
		pes_morris_level_conversations_eighteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_eighteen_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_eighteen_02",
			},
			sound_events_duration = {
				[1] = 3.1051249504089,
			},
		},
		pes_morris_level_conversations_fifteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_fifteen_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_fifteen_01",
			},
			sound_events_duration = {
				[1] = 2.4231040477753,
			},
		},
		pes_morris_level_conversations_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_five_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_five_01",
			},
			sound_events_duration = {
				[1] = 3.9928541183472,
			},
		},
		pes_morris_level_conversations_five_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_five_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_five_02",
			},
			sound_events_duration = {
				[1] = 1.7345207929611,
			},
		},
		pes_morris_level_conversations_fourteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_fourteen_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_fourteen_01",
			},
			sound_events_duration = {
				[1] = 5.0919585227966,
			},
		},
		pes_morris_level_conversations_fourteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_fourteen_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_fourteen_02",
			},
			sound_events_duration = {
				[1] = 5.1817917823792,
			},
		},
		pes_morris_level_conversations_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_seven_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_seven_01",
			},
			sound_events_duration = {
				[1] = 4.1268749237061,
			},
		},
		pes_morris_level_conversations_thirtyfive_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_thirtyfive_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_thirtyfive_01",
			},
			sound_events_duration = {
				[1] = 5.6421456336975,
			},
		},
		pes_morris_level_conversations_thirtyfive_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_thirtyfive_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_thirtyfive_02",
			},
			sound_events_duration = {
				[1] = 4.7153749465942,
			},
		},
		pes_morris_level_conversations_thirtyfive_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_thirtyfive_03",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_thirtyfive_03",
			},
			sound_events_duration = {
				[1] = 4.2775206565857,
			},
		},
		pes_morris_level_conversations_thirtyfour_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_thirtyfour_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_thirtyfour_01",
			},
			sound_events_duration = {
				[1] = 3.4744791984558,
			},
		},
		pes_morris_level_conversations_thirtyfour_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_thirtyfour_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_thirtyfour_02",
			},
			sound_events_duration = {
				[1] = 2.3745625019074,
			},
		},
		pes_morris_level_conversations_thirtytwo_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_thirtytwo_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_thirtytwo_01",
			},
			sound_events_duration = {
				[1] = 5.5916042327881,
			},
		},
		pes_morris_level_conversations_thirtytwo_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_thirtytwo_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_thirtytwo_02",
			},
			sound_events_duration = {
				[1] = 6.0187501907349,
			},
		},
		pes_morris_level_conversations_thirtytwo_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_thirtytwo_03",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_thirtytwo_03",
			},
			sound_events_duration = {
				[1] = 2.1939165592194,
			},
		},
		pes_morris_level_conversations_twentyone_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_twentyone_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_twentyone_01",
			},
			sound_events_duration = {
				[1] = 1.8286458253861,
			},
		},
		pes_morris_level_conversations_twentyone_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_twentyone_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_twentyone_02",
			},
			sound_events_duration = {
				[1] = 2.1964375972748,
			},
		},
		pes_morris_level_conversations_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_two_01",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_two_01",
			},
			sound_events_duration = {
				[1] = 5.3380832672119,
			},
		},
		pes_morris_level_conversations_two_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pes_morris_level_conversations_two_02",
			},
			sound_events = {
				[1] = "pes_morris_level_conversations_two_02",
			},
			sound_events_duration = {
				[1] = 2.9426250457764,
			},
		},
		pwe_gk_morris_level_conversations_forty_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_gk_morris_level_conversations_forty_01",
			},
			sound_events = {
				[1] = "pwe_gk_morris_level_conversations_forty_01",
			},
			sound_events_duration = {
				[1] = 3.2530000209808,
			},
		},
		pwe_gk_morris_level_conversations_forty_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_gk_morris_level_conversations_forty_02",
			},
			sound_events = {
				[1] = "pwe_gk_morris_level_conversations_forty_02",
			},
			sound_events_duration = {
				[1] = 4.9536876678467,
			},
		},
		pwe_gk_morris_level_conversations_fortyeight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_gk_morris_level_conversations_fortyeight_01",
			},
			sound_events = {
				[1] = "pwe_gk_morris_level_conversations_fortyeight_01",
			},
			sound_events_duration = {
				[1] = 5.746687412262,
			},
		},
		pwe_gk_morris_level_conversations_thirtyseven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_gk_morris_level_conversations_thirtyseven_01",
			},
			sound_events = {
				[1] = "pwe_gk_morris_level_conversations_thirtyseven_01",
			},
			sound_events_duration = {
				[1] = 1.676854133606,
			},
		},
		pwe_gk_morris_level_conversations_thirtysix_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_gk_morris_level_conversations_thirtysix_01",
			},
			sound_events = {
				[1] = "pwe_gk_morris_level_conversations_thirtysix_01",
			},
			sound_events_duration = {
				[1] = 1.6790416240692,
			},
		},
		pwe_morris_level_conversations_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_eight_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_eight_01",
			},
			sound_events_duration = {
				[1] = 7.839958190918,
			},
		},
		pwe_morris_level_conversations_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_eight_02",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_eight_02",
			},
			sound_events_duration = {
				[1] = 1.0511875152588,
			},
		},
		pwe_morris_level_conversations_fifteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_fifteen_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_fifteen_01",
			},
			sound_events_duration = {
				[1] = 7.2366042137146,
			},
		},
		pwe_morris_level_conversations_nineteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_nineteen_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_nineteen_01",
			},
			sound_events_duration = {
				[1] = 5.6934375762939,
			},
		},
		pwe_morris_level_conversations_nineteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_nineteen_02",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_nineteen_02",
			},
			sound_events_duration = {
				[1] = 0.99529165029526,
			},
		},
		pwe_morris_level_conversations_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_six_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_six_01",
			},
			sound_events_duration = {
				[1] = 7.4060416221619,
			},
		},
		pwe_morris_level_conversations_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_six_02",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_six_02",
			},
			sound_events_duration = {
				[1] = 8.3357915878296,
			},
		},
		pwe_morris_level_conversations_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_three_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_three_01",
			},
			sound_events_duration = {
				[1] = 7.4625205993652,
			},
		},
		pwe_morris_level_conversations_three_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_three_02",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_three_02",
			},
			sound_events_duration = {
				[1] = 4.9659376144409,
			},
		},
		pwe_morris_level_conversations_twenty_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_twenty_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_twenty_01",
			},
			sound_events_duration = {
				[1] = 4.3132915496826,
			},
		},
		pwe_morris_level_conversations_twenty_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_twenty_02",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_twenty_02",
			},
			sound_events_duration = {
				[1] = 6.1999793052673,
			},
		},
		pwe_morris_level_conversations_twenty_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_twenty_03",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_twenty_03",
			},
			sound_events_duration = {
				[1] = 1.1121875047684,
			},
		},
		pwe_morris_level_conversations_twentyone_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_twentyone_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_twentyone_01",
			},
			sound_events_duration = {
				[1] = 7.188000202179,
			},
		},
		pwe_morris_level_conversations_twentyone_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_twentyone_02",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_twentyone_02",
			},
			sound_events_duration = {
				[1] = 2.8745000362396,
			},
		},
		pwe_morris_level_conversations_twentythree_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_twentythree_01",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_twentythree_01",
			},
			sound_events_duration = {
				[1] = 4.3385624885559,
			},
		},
		pwe_morris_level_conversations_twentythree_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwe_morris_level_conversations_twentythree_02",
			},
			sound_events = {
				[1] = "pwe_morris_level_conversations_twentythree_02",
			},
			sound_events_duration = {
				[1] = 1.9917917251587,
			},
		},
		pwh_de_morris_level_conversations_fortyfive_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_de_morris_level_conversations_fortyfive_01",
			},
			sound_events = {
				[1] = "pwh_de_morris_level_conversations_fortyfive_01",
			},
			sound_events_duration = {
				[1] = 6.9487709999084,
			},
		},
		pwh_de_morris_level_conversations_fortyseven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_de_morris_level_conversations_fortyseven_01",
			},
			sound_events = {
				[1] = "pwh_de_morris_level_conversations_fortyseven_01",
			},
			sound_events_duration = {
				[1] = 2.9739167690277,
			},
		},
		pwh_gk_morris_level_conversations_fortyeight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_gk_morris_level_conversations_fortyeight_01",
			},
			sound_events = {
				[1] = "pwh_gk_morris_level_conversations_fortyeight_01",
			},
			sound_events_duration = {
				[1] = 6.4420833587647,
			},
		},
		pwh_gk_morris_level_conversations_thirtyeight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_gk_morris_level_conversations_thirtyeight_01",
			},
			sound_events = {
				[1] = "pwh_gk_morris_level_conversations_thirtyeight_01",
			},
			sound_events_duration = {
				[1] = 2.0434792041779,
			},
		},
		pwh_morris_level_conversations_eighteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_eighteen_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_eighteen_01",
			},
			sound_events_duration = {
				[1] = 3.2962915897369,
			},
		},
		pwh_morris_level_conversations_eighteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_eighteen_02",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_eighteen_02",
			},
			sound_events_duration = {
				[1] = 9.7302703857422,
			},
		},
		pwh_morris_level_conversations_fourteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_fourteen_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_fourteen_01",
			},
			sound_events_duration = {
				[1] = 6.3185415267944,
			},
		},
		pwh_morris_level_conversations_fourteen_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_fourteen_02",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_fourteen_02",
			},
			sound_events_duration = {
				[1] = 2.103333234787,
			},
		},
		pwh_morris_level_conversations_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_nine_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_nine_01",
			},
			sound_events_duration = {
				[1] = 7.3121876716614,
			},
		},
		pwh_morris_level_conversations_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_nine_02",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_nine_02",
			},
			sound_events_duration = {
				[1] = 2.0413959026337,
			},
		},
		pwh_morris_level_conversations_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_one_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_one_01",
			},
			sound_events_duration = {
				[1] = 2.228333234787,
			},
		},
		pwh_morris_level_conversations_one_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_one_02",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_one_02",
			},
			sound_events_duration = {
				[1] = 8.9644374847412,
			},
		},
		pwh_morris_level_conversations_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_seven_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_seven_01",
			},
			sound_events_duration = {
				[1] = 4.592791557312,
			},
		},
		pwh_morris_level_conversations_sixteen_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_sixteen_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_sixteen_01",
			},
			sound_events_duration = {
				[1] = 5.2483124732971,
			},
		},
		pwh_morris_level_conversations_thirtyfour_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_thirtyfour_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_thirtyfour_01",
			},
			sound_events_duration = {
				[1] = 6.2720832824707,
			},
		},
		pwh_morris_level_conversations_thirtyfour_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_thirtyfour_02",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_thirtyfour_02",
			},
			sound_events_duration = {
				[1] = 7.5852084159851,
			},
		},
		pwh_morris_level_conversations_thirtytwo_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_thirtytwo_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_thirtytwo_01",
			},
			sound_events_duration = {
				[1] = 2.4215624332428,
			},
		},
		pwh_morris_level_conversations_twentythree_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_twentythree_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_twentythree_01",
			},
			sound_events_duration = {
				[1] = 6.6722917556763,
			},
		},
		pwh_morris_level_conversations_twentythree_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_twentythree_02",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_twentythree_02",
			},
			sound_events_duration = {
				[1] = 3.176958322525,
			},
		},
		pwh_morris_level_conversations_twentytwo_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_twentytwo_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_twentytwo_01",
			},
			sound_events_duration = {
				[1] = 7.1193332672119,
			},
		},
		pwh_morris_level_conversations_twentytwo_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_twentytwo_02",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_twentytwo_02",
			},
			sound_events_duration = {
				[1] = 2.874041557312,
			},
		},
		pwh_morris_level_conversations_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_morris_level_banter",
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
				[1] = "pwh_morris_level_conversations_two_01",
			},
			sound_events = {
				[1] = "pwh_morris_level_conversations_two_01",
			},
			sound_events_duration = {
				[1] = 5.8586249351502,
			},
		},
	})
end
