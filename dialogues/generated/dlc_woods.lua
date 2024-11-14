-- chunkname: @dialogues/generated/dlc_woods.lua

return function ()
	define_rule({
		name = "pbw_woods_conversation_twentyeight_01",
		probability = 1,
		response = "pbw_woods_conversation_twentyeight_01",
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
				"pwh_woods_conversation_twentyeight_01",
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
		name = "pbw_woods_conversation_twentyfive_01",
		probability = 1,
		response = "pbw_woods_conversation_twentyfive_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_twentyfive",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_twentyfive",
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
		name = "pbw_woods_conversation_twentyfive_02",
		probability = 1,
		response = "pbw_woods_conversation_twentyfive_02",
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
				"pwe_st_woods_conversation_twentyfive_01",
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
		name = "pbw_woods_conversation_twentyfour_01",
		probability = 1,
		response = "pbw_woods_conversation_twentyfour_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_twentyfour",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_twentyfour",
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
		name = "pbw_woods_conversation_twentyfour_02",
		probability = 1,
		response = "pbw_woods_conversation_twentyfour_02",
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
				"pwe_st_woods_conversation_twentyfour_01",
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
		name = "pbw_woods_conversation_twentynine_01",
		probability = 1,
		response = "pbw_woods_conversation_twentynine_01",
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
				"pwh_woods_conversation_twentynine_01",
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
		name = "pbw_woods_conversation_twentyone_01",
		probability = 1,
		response = "pbw_woods_conversation_twentyone_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_twentyone",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_twentyone",
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
		name = "pbw_woods_conversation_twentyone_02",
		probability = 1,
		response = "pbw_woods_conversation_twentyone_02",
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
				"pwe_st_woods_conversation_twentyone_01",
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
		name = "pbw_woods_conversation_twentyseven_01",
		probability = 1,
		response = "pbw_woods_conversation_twentyseven_01",
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
				"pwh_woods_conversation_twentyseven_01",
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
		name = "pbw_woods_conversation_twentysix_01",
		probability = 1,
		response = "pbw_woods_conversation_twentysix_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				2,
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
				"empire_soldier",
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
				60,
			},
			{
				"faction_memory",
				"woods_conversation_no_elf",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_no_elf",
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
		name = "pbw_woods_conversation_twentythree_01",
		probability = 1,
		response = "pbw_woods_conversation_twentythree_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_twentythree",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_twentythree",
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
		name = "pbw_woods_conversation_twentythree_02",
		probability = 1,
		response = "pbw_woods_conversation_twentythree_02",
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
				"pwe_st_woods_conversation_twentythree_01",
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
		name = "pbw_woods_conversation_twentythree_03",
		probability = 1,
		response = "pbw_woods_conversation_twentythree_03",
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
				"pwe_st_woods_conversation_twentythree_02",
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
		name = "pbw_woods_conversation_twentytwo_01",
		probability = 1,
		response = "pbw_woods_conversation_twentytwo_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_twentytwo",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_twentytwo",
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
		name = "pbw_woods_conversation_twentytwo_02",
		probability = 1,
		response = "pbw_woods_conversation_twentytwo_02",
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
				"pwe_st_woods_conversation_twentytwo_01",
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
		name = "pdr_de_woods_conversation_four_01",
		probability = 1,
		response = "pdr_de_woods_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_four",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_four",
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
		name = "pdr_de_woods_conversation_four_02",
		probability = 1,
		response = "pdr_de_woods_conversation_four_02",
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
				"pwe_st_woods_conversation_four_01",
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
		name = "pdr_de_woods_conversation_four_03",
		probability = 1,
		response = "pdr_de_woods_conversation_four_03",
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
				"pwe_st_woods_conversation_four_02",
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
		name = "pdr_de_woods_conversation_three_01",
		probability = 1,
		response = "pdr_de_woods_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_three",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_three",
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
		name = "pdr_de_woods_conversation_three_02",
		probability = 1,
		response = "pdr_de_woods_conversation_three_02",
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
				"pwe_st_woods_conversation_three_01",
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
		name = "pdr_woods_conversation_eleven_01",
		probability = 1,
		response = "pdr_woods_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"global_context",
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_eleven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_eleven",
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
		name = "pdr_woods_conversation_eleven_02",
		probability = 1,
		response = "pdr_woods_conversation_eleven_02",
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
				"pwe_st_woods_conversation_eleven_01",
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
		name = "pdr_woods_conversation_eleven_03",
		probability = 1,
		response = "pdr_woods_conversation_eleven_03",
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
				"pwe_st_woods_conversation_eleven_02",
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
		name = "pdr_woods_conversation_fifteen_01",
		probability = 1,
		response = "pdr_woods_conversation_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"global_context",
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_fifteen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_fifteen",
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
		name = "pdr_woods_conversation_fifteen_02",
		probability = 1,
		response = "pdr_woods_conversation_fifteen_02",
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
				"pwe_st_woods_conversation_fifteen_01",
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
		name = "pdr_woods_conversation_fourteen_01",
		probability = 1,
		response = "pdr_woods_conversation_fourteen_01",
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
				"pwe_st_woods_conversation_fourteen_01",
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
		name = "pdr_woods_conversation_fourteen_02",
		probability = 1,
		response = "pdr_woods_conversation_fourteen_02",
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
				"pwe_st_woods_conversation_fourteen_02",
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
		name = "pdr_woods_conversation_nine_01",
		probability = 1,
		response = "pdr_woods_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"global_context",
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_nine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_nine",
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
		name = "pdr_woods_conversation_nine_02",
		probability = 1,
		response = "pdr_woods_conversation_nine_02",
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
				"pwe_st_woods_conversation_nine_01",
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
		name = "pdr_woods_conversation_ten_01",
		probability = 1,
		response = "pdr_woods_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"global_context",
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_ten",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_ten",
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
		name = "pdr_woods_conversation_ten_02",
		probability = 1,
		response = "pdr_woods_conversation_ten_02",
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
				"pwe_st_woods_conversation_ten_01",
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
		name = "pdr_woods_conversation_thirteen_01",
		probability = 1,
		response = "pdr_woods_conversation_thirteen_01",
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
				"pwe_st_woods_conversation_thirteen_01",
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
		name = "pdr_woods_conversation_twelve_01",
		probability = 1,
		response = "pdr_woods_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"global_context",
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_twelve",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_twelve",
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
		name = "pdr_woods_conversation_twelve_02",
		probability = 1,
		response = "pdr_woods_conversation_twelve_02",
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
				"pwe_st_woods_conversation_twelve_01",
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
		name = "pdr_woods_conversation_twelve_03",
		probability = 1,
		response = "pdr_woods_conversation_twelve_03",
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
				"pwe_st_woods_conversation_twelve_02",
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
		name = "pdr_woods_conversation_twentyeight_01",
		probability = 1,
		response = "pdr_woods_conversation_twentyeight_01",
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
				"pbw_woods_conversation_twentyeight_01",
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
		name = "pdr_woods_conversation_twentynine_01",
		probability = 1,
		response = "pdr_woods_conversation_twentynine_01",
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
				"pes_woods_conversation_twentynine_01",
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
		name = "pdr_woods_conversation_twentyseven_01",
		probability = 1,
		response = "pdr_woods_conversation_twentyseven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				2,
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
				60,
			},
			{
				"faction_memory",
				"woods_conversation_no_elf",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_no_elf",
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
		name = "pdr_woods_conversation_twentysix_01",
		probability = 1,
		response = "pdr_woods_conversation_twentysix_01",
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
				"pes_woods_conversation_twentysix_01",
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
		name = "pes_gk_woods_conversation_one_01",
		probability = 1,
		response = "pes_gk_woods_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight",
			},
			{
				"global_context",
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_one",
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
		name = "pes_gk_woods_conversation_one_02",
		probability = 1,
		response = "pes_gk_woods_conversation_one_02",
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
				"pwe_st_woods_conversation_one_01",
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
		name = "pes_gk_woods_conversation_two_01",
		probability = 1,
		response = "pes_gk_woods_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight",
			},
			{
				"global_context",
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_two",
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
		name = "pes_gk_woods_conversation_two_02",
		probability = 1,
		response = "pes_gk_woods_conversation_two_02",
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
				"pwe_st_woods_conversation_two_01",
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
		name = "pes_woods_conversation_eight_01",
		probability = 1,
		response = "pes_woods_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_eight",
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
		name = "pes_woods_conversation_eight_02",
		probability = 1,
		response = "pes_woods_conversation_eight_02",
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
				"pwe_st_woods_conversation_eight_01",
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
		name = "pes_woods_conversation_eight_03",
		probability = 1,
		response = "pes_woods_conversation_eight_03",
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
				"pwe_st_woods_conversation_eight_02",
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
		name = "pes_woods_conversation_five_01",
		probability = 1,
		response = "pes_woods_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_five",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_five",
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
		name = "pes_woods_conversation_five_02",
		probability = 1,
		response = "pes_woods_conversation_five_02",
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
				"pwe_st_woods_conversation_five_01",
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
		name = "pes_woods_conversation_seven_01",
		probability = 1,
		response = "pes_woods_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_seven",
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
		name = "pes_woods_conversation_seven_02",
		probability = 1,
		response = "pes_woods_conversation_seven_02",
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
				"pwe_st_woods_conversation_seven_01",
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
		name = "pes_woods_conversation_six_01",
		probability = 1,
		response = "pes_woods_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_six",
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
		name = "pes_woods_conversation_six_02",
		probability = 1,
		response = "pes_woods_conversation_six_02",
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
				"pwe_st_woods_conversation_six_01",
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
		name = "pes_woods_conversation_six_03",
		probability = 1,
		response = "pes_woods_conversation_six_03",
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
				"pwe_st_woods_conversation_six_02",
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
		name = "pes_woods_conversation_twentyeight_01",
		probability = 1,
		response = "pes_woods_conversation_twentyeight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				2,
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
				60,
			},
			{
				"faction_memory",
				"woods_conversation_no_elf",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_no_elf",
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
		name = "pes_woods_conversation_twentyeight_02",
		probability = 1,
		response = "pes_woods_conversation_twentyeight_02",
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
				"pdr_woods_conversation_twentyeight_01",
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
		name = "pes_woods_conversation_twentynine_01",
		probability = 1,
		response = "pes_woods_conversation_twentynine_01",
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
				"pwh_woods_conversation_twentynine_02",
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
		name = "pes_woods_conversation_twentyseven_01",
		probability = 1,
		response = "pes_woods_conversation_twentyseven_01",
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
				"pdr_woods_conversation_twentyseven_01",
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
		name = "pes_woods_conversation_twentysix_01",
		probability = 1,
		response = "pes_woods_conversation_twentysix_01",
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
				"pwh_woods_conversation_twentysix_01",
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
		name = "pwe_st_lullaby_full",
		probability = 1,
		response = "pwe_st_lullaby_full",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"distant_voices",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				1500,
			},
			{
				"user_memory",
				"pwe_st_lullaby_full",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"pwe_st_lullaby_full",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_st_woods_conversation_eight_01",
		probability = 1,
		response = "pwe_st_woods_conversation_eight_01",
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
				"pes_woods_conversation_eight_01",
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
		name = "pwe_st_woods_conversation_eight_02",
		probability = 1,
		response = "pwe_st_woods_conversation_eight_02",
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
				"pes_woods_conversation_eight_02",
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
		name = "pwe_st_woods_conversation_eight_03",
		probability = 1,
		response = "pwe_st_woods_conversation_eight_03",
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
				"pes_woods_conversation_eight_03",
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
		name = "pwe_st_woods_conversation_eighteen_01",
		probability = 1,
		response = "pwe_st_woods_conversation_eighteen_01",
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
				"pwh_woods_conversation_eighteen_01",
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
		name = "pwe_st_woods_conversation_eighteen_02",
		probability = 1,
		response = "pwe_st_woods_conversation_eighteen_02",
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
				"pwh_woods_conversation_eighteen_02",
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
		name = "pwe_st_woods_conversation_eleven_01",
		probability = 1,
		response = "pwe_st_woods_conversation_eleven_01",
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
				"pdr_woods_conversation_eleven_01",
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
		name = "pwe_st_woods_conversation_eleven_02",
		probability = 1,
		response = "pwe_st_woods_conversation_eleven_02",
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
				"pdr_woods_conversation_eleven_02",
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
		name = "pwe_st_woods_conversation_eleven_03",
		probability = 1,
		response = "pwe_st_woods_conversation_eleven_03",
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
				"pdr_woods_conversation_eleven_03",
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
		name = "pwe_st_woods_conversation_fifteen_01",
		probability = 1,
		response = "pwe_st_woods_conversation_fifteen_01",
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
				"pdr_woods_conversation_fifteen_01",
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
		name = "pwe_st_woods_conversation_fifteen_02",
		probability = 1,
		response = "pwe_st_woods_conversation_fifteen_02",
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
				"pdr_woods_conversation_fifteen_02",
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
		name = "pwe_st_woods_conversation_five_01",
		probability = 1,
		response = "pwe_st_woods_conversation_five_01",
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
				"pes_woods_conversation_five_01",
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
		name = "pwe_st_woods_conversation_five_02",
		probability = 1,
		response = "pwe_st_woods_conversation_five_02",
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
				"pes_woods_conversation_five_02",
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
		name = "pwe_st_woods_conversation_four_01",
		probability = 1,
		response = "pwe_st_woods_conversation_four_01",
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
				"pdr_de_woods_conversation_four_01",
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
		name = "pwe_st_woods_conversation_four_02",
		probability = 1,
		response = "pwe_st_woods_conversation_four_02",
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
				"pdr_de_woods_conversation_four_02",
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
		name = "pwe_st_woods_conversation_fourteen_01",
		probability = 1,
		response = "pwe_st_woods_conversation_fourteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"player_career",
				OP.EQ,
				"we_thornsister",
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
				60,
			},
			{
				"faction_memory",
				"woods_conversation_fourteen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_fourteen",
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
		name = "pwe_st_woods_conversation_fourteen_02",
		probability = 1,
		response = "pwe_st_woods_conversation_fourteen_02",
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
				"pdr_woods_conversation_fourteen_01",
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
		name = "pwe_st_woods_conversation_nine_01",
		probability = 1,
		response = "pwe_st_woods_conversation_nine_01",
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
				"pdr_woods_conversation_nine_01",
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
		name = "pwe_st_woods_conversation_nine_02",
		probability = 1,
		response = "pwe_st_woods_conversation_nine_02",
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
				"pdr_woods_conversation_nine_02",
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
		name = "pwe_st_woods_conversation_nineteen_01",
		probability = 1,
		response = "pwe_st_woods_conversation_nineteen_01",
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
				"pwh_woods_conversation_nineteen_01",
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
		name = "pwe_st_woods_conversation_nineteen_02",
		probability = 1,
		response = "pwe_st_woods_conversation_nineteen_02",
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
				"pwh_woods_conversation_nineteen_02",
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
		name = "pwe_st_woods_conversation_one_01",
		probability = 1,
		response = "pwe_st_woods_conversation_one_01",
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
				"pes_gk_woods_conversation_one_01",
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
		name = "pwe_st_woods_conversation_one_02",
		probability = 1,
		response = "pwe_st_woods_conversation_one_02",
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
				"pes_gk_woods_conversation_one_02",
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
		name = "pwe_st_woods_conversation_seven_01",
		probability = 1,
		response = "pwe_st_woods_conversation_seven_01",
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
				"pes_woods_conversation_seven_01",
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
		name = "pwe_st_woods_conversation_seven_02",
		probability = 1,
		response = "pwe_st_woods_conversation_seven_02",
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
				"pes_woods_conversation_seven_02",
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
		name = "pwe_st_woods_conversation_seventeen_01",
		probability = 1,
		response = "pwe_st_woods_conversation_seventeen_01",
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
				"pwh_woods_conversation_seventeen_01",
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
		name = "pwe_st_woods_conversation_seventeen_02",
		probability = 1,
		response = "pwe_st_woods_conversation_seventeen_02",
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
				"pwh_woods_conversation_seventeen_02",
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
		name = "pwe_st_woods_conversation_six_01",
		probability = 1,
		response = "pwe_st_woods_conversation_six_01",
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
				"pes_woods_conversation_six_01",
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
		name = "pwe_st_woods_conversation_six_02",
		probability = 1,
		response = "pwe_st_woods_conversation_six_02",
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
				"pes_woods_conversation_six_02",
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
		name = "pwe_st_woods_conversation_sixteen_01",
		probability = 1,
		response = "pwe_st_woods_conversation_sixteen_01",
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
				"pwh_woods_conversation_sixteen_01",
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
		name = "pwe_st_woods_conversation_sixteen_02",
		probability = 1,
		response = "pwe_st_woods_conversation_sixteen_02",
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
				"pwh_woods_conversation_sixteen_02",
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
		name = "pwe_st_woods_conversation_ten_01",
		probability = 1,
		response = "pwe_st_woods_conversation_ten_01",
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
				"pdr_woods_conversation_ten_01",
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
		name = "pwe_st_woods_conversation_ten_02",
		probability = 1,
		response = "pwe_st_woods_conversation_ten_02",
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
				"pdr_woods_conversation_ten_02",
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
		name = "pwe_st_woods_conversation_thirteen_01",
		probability = 1,
		response = "pwe_st_woods_conversation_thirteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"player_career",
				OP.EQ,
				"we_thornsister",
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
				60,
			},
			{
				"faction_memory",
				"woods_conversation_thirteen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_thirteen",
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
		name = "pwe_st_woods_conversation_thirteen_02",
		probability = 1,
		response = "pwe_st_woods_conversation_thirteen_02",
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
				"pdr_woods_conversation_thirteen_01",
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
		name = "pwe_st_woods_conversation_three_01",
		probability = 1,
		response = "pwe_st_woods_conversation_three_01",
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
				"pdr_de_woods_conversation_three_01",
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
		name = "pwe_st_woods_conversation_three_02",
		probability = 1,
		response = "pwe_st_woods_conversation_three_02",
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
				"pdr_de_woods_conversation_three_02",
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
		name = "pwe_st_woods_conversation_twelve_01",
		probability = 1,
		response = "pwe_st_woods_conversation_twelve_01",
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
				"pdr_woods_conversation_twelve_01",
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
		name = "pwe_st_woods_conversation_twelve_02",
		probability = 1,
		response = "pwe_st_woods_conversation_twelve_02",
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
				"pdr_woods_conversation_twelve_02",
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
		name = "pwe_st_woods_conversation_twenty_01",
		probability = 1,
		response = "pwe_st_woods_conversation_twenty_01",
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
				"pwh_woods_conversation_twenty_01",
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
		name = "pwe_st_woods_conversation_twenty_02",
		probability = 1,
		response = "pwe_st_woods_conversation_twenty_02",
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
				"pwh_woods_conversation_twenty_02",
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
		name = "pwe_st_woods_conversation_twentyfive_01",
		probability = 1,
		response = "pwe_st_woods_conversation_twentyfive_01",
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
				"pbw_woods_conversation_twentyfive_01",
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
		name = "pwe_st_woods_conversation_twentyfive_02",
		probability = 1,
		response = "pwe_st_woods_conversation_twentyfive_02",
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
				"pbw_woods_conversation_twentyfive_02",
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
		name = "pwe_st_woods_conversation_twentyfour_01",
		probability = 1,
		response = "pwe_st_woods_conversation_twentyfour_01",
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
				"pbw_woods_conversation_twentyfour_01",
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
		name = "pwe_st_woods_conversation_twentyfour_02",
		probability = 1,
		response = "pwe_st_woods_conversation_twentyfour_02",
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
				"pbw_woods_conversation_twentyfour_02",
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
		name = "pwe_st_woods_conversation_twentyone_01",
		probability = 1,
		response = "pwe_st_woods_conversation_twentyone_01",
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
				"pbw_woods_conversation_twentyone_01",
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
		name = "pwe_st_woods_conversation_twentyone_02",
		probability = 1,
		response = "pwe_st_woods_conversation_twentyone_02",
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
				"pbw_woods_conversation_twentyone_02",
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
		name = "pwe_st_woods_conversation_twentythree_01",
		probability = 1,
		response = "pwe_st_woods_conversation_twentythree_01",
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
				"pbw_woods_conversation_twentythree_01",
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
		name = "pwe_st_woods_conversation_twentythree_02",
		probability = 1,
		response = "pwe_st_woods_conversation_twentythree_02",
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
				"pbw_woods_conversation_twentythree_02",
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
		name = "pwe_st_woods_conversation_twentythree_03",
		probability = 1,
		response = "pwe_st_woods_conversation_twentythree_03",
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
				"pbw_woods_conversation_twentythree_03",
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
		name = "pwe_st_woods_conversation_twentytwo_01",
		probability = 1,
		response = "pwe_st_woods_conversation_twentytwo_01",
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
				"pbw_woods_conversation_twentytwo_01",
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
		name = "pwe_st_woods_conversation_two_01",
		probability = 1,
		response = "pwe_st_woods_conversation_two_01",
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
				"pes_gk_woods_conversation_two_01",
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
		name = "pwe_st_woods_conversation_two_02",
		probability = 1,
		response = "pwe_st_woods_conversation_two_02",
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
				"pes_gk_woods_conversation_two_02",
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
		name = "pwh_woods_conversation_eighteen_01",
		probability = 1,
		response = "pwh_woods_conversation_eighteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_eighteen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_eighteen",
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
		name = "pwh_woods_conversation_eighteen_02",
		probability = 1,
		response = "pwh_woods_conversation_eighteen_02",
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
				"pwe_st_woods_conversation_eighteen_01",
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
		name = "pwh_woods_conversation_nineteen_01",
		probability = 1,
		response = "pwh_woods_conversation_nineteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_nineeen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_nineeen",
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
		name = "pwh_woods_conversation_nineteen_02",
		probability = 1,
		response = "pwh_woods_conversation_nineteen_02",
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
				"pwe_st_woods_conversation_nineteen_01",
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
		name = "pwh_woods_conversation_nineteen_03",
		probability = 1,
		response = "pwh_woods_conversation_nineteen_03",
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
				"pwe_st_woods_conversation_nineteen_02",
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
		name = "pwh_woods_conversation_seventeen_01",
		probability = 1,
		response = "pwh_woods_conversation_seventeen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_seventeen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_seventeen",
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
		name = "pwh_woods_conversation_seventeen_02",
		probability = 1,
		response = "pwh_woods_conversation_seventeen_02",
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
				"pwe_st_woods_conversation_seventeen_01",
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
		name = "pwh_woods_conversation_sixteen_01",
		probability = 1,
		response = "pwh_woods_conversation_sixteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_sixteen",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_sixteen",
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
		name = "pwh_woods_conversation_sixteen_02",
		probability = 1,
		response = "pwh_woods_conversation_sixteen_02",
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
				"pwe_st_woods_conversation_sixteen_01",
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
		name = "pwh_woods_conversation_twenty_01",
		probability = 1,
		response = "pwh_woods_conversation_twenty_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"we_thornsister",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
			{
				"faction_memory",
				"woods_conversation_twenty",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_twenty",
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
		name = "pwh_woods_conversation_twenty_02",
		probability = 1,
		response = "pwh_woods_conversation_twenty_02",
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
				"pwe_st_woods_conversation_twenty_01",
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
		name = "pwh_woods_conversation_twentyeight_01",
		probability = 1,
		response = "pwh_woods_conversation_twentyeight_01",
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
				"pes_woods_conversation_twentyeight_01",
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
		name = "pwh_woods_conversation_twentynine_01",
		probability = 1,
		response = "pwh_woods_conversation_twentynine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				2,
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
				"empire_soldier",
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
				60,
			},
			{
				"faction_memory",
				"woods_conversation_no_elf",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"woods_conversation_no_elf",
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
		name = "pwh_woods_conversation_twentynine_02",
		probability = 1,
		response = "pwh_woods_conversation_twentynine_02",
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
				"pbw_woods_conversation_twentynine_01",
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
		name = "pwh_woods_conversation_twentyseven_01",
		probability = 1,
		response = "pwh_woods_conversation_twentyseven_01",
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
				"pes_woods_conversation_twentyseven_01",
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
		name = "pwh_woods_conversation_twentysix_01",
		probability = 1,
		response = "pwh_woods_conversation_twentysix_01",
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
				"pbw_woods_conversation_twentysix_01",
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
		name = "pwh_woods_conversation_twentysix_02",
		probability = 1,
		response = "pwh_woods_conversation_twentysix_02",
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
				"pdr_woods_conversation_twentysix_01",
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
		pbw_woods_conversation_twentyeight_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentyeight_01",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 3.2229375839233,
			},
		},
		pbw_woods_conversation_twentyfive_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentyfive_01",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentyfive_01",
			},
			sound_events_duration = {
				[1] = 7.0784792900085,
			},
		},
		pbw_woods_conversation_twentyfive_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentyfive_02",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentyfive_02",
			},
			sound_events_duration = {
				[1] = 5.3591251373291,
			},
		},
		pbw_woods_conversation_twentyfour_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentyfour_01",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentyfour_01",
			},
			sound_events_duration = {
				[1] = 4.7118334770203,
			},
		},
		pbw_woods_conversation_twentyfour_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentyfour_02",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentyfour_02",
			},
			sound_events_duration = {
				[1] = 1.8613749742508,
			},
		},
		pbw_woods_conversation_twentynine_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentynine_01",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentynine_01",
			},
			sound_events_duration = {
				[1] = 3.6598124504089,
			},
		},
		pbw_woods_conversation_twentyone_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentyone_01",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentyone_01",
			},
			sound_events_duration = {
				[1] = 5.9022083282471,
			},
		},
		pbw_woods_conversation_twentyone_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentyone_02",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentyone_02",
			},
			sound_events_duration = {
				[1] = 2.447083234787,
			},
		},
		pbw_woods_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 8.2422294616699,
			},
		},
		pbw_woods_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 4.7419581413269,
			},
		},
		pbw_woods_conversation_twentythree_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentythree_01",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentythree_01",
			},
			sound_events_duration = {
				[1] = 2.7880208492279,
			},
		},
		pbw_woods_conversation_twentythree_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentythree_02",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentythree_02",
			},
			sound_events_duration = {
				[1] = 3.7586667537689,
			},
		},
		pbw_woods_conversation_twentythree_03 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentythree_03",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentythree_03",
			},
			sound_events_duration = {
				[1] = 6.9450206756592,
			},
		},
		pbw_woods_conversation_twentytwo_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentytwo_01",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentytwo_01",
			},
			sound_events_duration = {
				[1] = 5.5583958625794,
			},
		},
		pbw_woods_conversation_twentytwo_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pbw_woods_conversation_twentytwo_02",
			},
			sound_events = {
				[1] = "pbw_woods_conversation_twentytwo_02",
			},
			sound_events_duration = {
				[1] = 7.6355414390564,
			},
		},
		pdr_de_woods_conversation_four_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_de_woods_conversation_four_01",
			},
			sound_events = {
				[1] = "pdr_de_woods_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 3.3904583454132,
			},
		},
		pdr_de_woods_conversation_four_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_de_woods_conversation_four_02",
			},
			sound_events = {
				[1] = "pdr_de_woods_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 6.2716875076294,
			},
		},
		pdr_de_woods_conversation_four_03 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_de_woods_conversation_four_03",
			},
			sound_events = {
				[1] = "pdr_de_woods_conversation_four_03",
			},
			sound_events_duration = {
				[1] = 8.0264377593994,
			},
		},
		pdr_de_woods_conversation_three_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_de_woods_conversation_three_01",
			},
			sound_events = {
				[1] = "pdr_de_woods_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 7.1095209121704,
			},
		},
		pdr_de_woods_conversation_three_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_de_woods_conversation_three_02",
			},
			sound_events = {
				[1] = "pdr_de_woods_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 6.5318331718445,
			},
		},
		pdr_woods_conversation_eleven_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.5982291698456,
			},
		},
		pdr_woods_conversation_eleven_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_eleven_02",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 1.735687494278,
			},
		},
		pdr_woods_conversation_eleven_03 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_eleven_03",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_eleven_03",
			},
			sound_events_duration = {
				[1] = 2.1672291755676,
			},
		},
		pdr_woods_conversation_fifteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_fifteen_01",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_fifteen_01",
			},
			sound_events_duration = {
				[1] = 9.0372495651245,
			},
		},
		pdr_woods_conversation_fifteen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_fifteen_02",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_fifteen_02",
			},
			sound_events_duration = {
				[1] = 3.1250207424164,
			},
		},
		pdr_woods_conversation_fourteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_fourteen_01",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_fourteen_01",
			},
			sound_events_duration = {
				[1] = 5.1583542823792,
			},
		},
		pdr_woods_conversation_fourteen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_fourteen_02",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_fourteen_02",
			},
			sound_events_duration = {
				[1] = 3.0370833873749,
			},
		},
		pdr_woods_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_nine_01",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 6.040479183197,
			},
		},
		pdr_woods_conversation_nine_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_nine_02",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 4.5894165039063,
			},
		},
		pdr_woods_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_ten_01",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 3.2143542766571,
			},
		},
		pdr_woods_conversation_ten_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_ten_02",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 4.4997081756592,
			},
		},
		pdr_woods_conversation_thirteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_thirteen_01",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_thirteen_01",
			},
			sound_events_duration = {
				[1] = 1.553750038147,
			},
		},
		pdr_woods_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 2.9446666240692,
			},
		},
		pdr_woods_conversation_twelve_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 9.6448335647583,
			},
		},
		pdr_woods_conversation_twelve_03 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_twelve_03",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_twelve_03",
			},
			sound_events_duration = {
				[1] = 2.5810208320618,
			},
		},
		pdr_woods_conversation_twentyeight_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_twentyeight_01",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 3.1675000190735,
			},
		},
		pdr_woods_conversation_twentynine_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_twentynine_01",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_twentynine_01",
			},
			sound_events_duration = {
				[1] = 5.8583960533142,
			},
		},
		pdr_woods_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 2.6492290496826,
			},
		},
		pdr_woods_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pdr_woods_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "pdr_woods_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 3.302812576294,
			},
		},
		pes_gk_woods_conversation_one_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_gk_woods_conversation_one_01",
			},
			sound_events = {
				[1] = "pes_gk_woods_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 6.6810832023621,
			},
		},
		pes_gk_woods_conversation_one_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_gk_woods_conversation_one_02",
			},
			sound_events = {
				[1] = "pes_gk_woods_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 4.1367502212524,
			},
		},
		pes_gk_woods_conversation_two_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_gk_woods_conversation_two_01",
			},
			sound_events = {
				[1] = "pes_gk_woods_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 7.5194373130798,
			},
		},
		pes_gk_woods_conversation_two_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_gk_woods_conversation_two_02",
			},
			sound_events = {
				[1] = "pes_gk_woods_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 5.8981251716614,
			},
		},
		pes_woods_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_eight_01",
			},
			sound_events = {
				[1] = "pes_woods_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 6.3762497901917,
			},
		},
		pes_woods_conversation_eight_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_eight_02",
			},
			sound_events = {
				[1] = "pes_woods_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 4.1936249732971,
			},
		},
		pes_woods_conversation_eight_03 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_eight_03",
			},
			sound_events = {
				[1] = "pes_woods_conversation_eight_03",
			},
			sound_events_duration = {
				[1] = 4.1400418281555,
			},
		},
		pes_woods_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_five_01",
			},
			sound_events = {
				[1] = "pes_woods_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 6.7310209274292,
			},
		},
		pes_woods_conversation_five_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_five_02",
			},
			sound_events = {
				[1] = "pes_woods_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 1.0076667070389,
			},
		},
		pes_woods_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_seven_01",
			},
			sound_events = {
				[1] = "pes_woods_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 3.9776458740234,
			},
		},
		pes_woods_conversation_seven_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_seven_02",
			},
			sound_events = {
				[1] = "pes_woods_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 2.0822291374206,
			},
		},
		pes_woods_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_six_01",
			},
			sound_events = {
				[1] = "pes_woods_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 3.1072916984558,
			},
		},
		pes_woods_conversation_six_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_six_02",
			},
			sound_events = {
				[1] = "pes_woods_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 2.4635624885559,
			},
		},
		pes_woods_conversation_six_03 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_six_03",
			},
			sound_events = {
				[1] = "pes_woods_conversation_six_03",
			},
			sound_events_duration = {
				[1] = 1.778520822525,
			},
		},
		pes_woods_conversation_twentyeight_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_twentyeight_01",
			},
			sound_events = {
				[1] = "pes_woods_conversation_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 2.3159999847412,
			},
		},
		pes_woods_conversation_twentyeight_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_twentyeight_02",
			},
			sound_events = {
				[1] = "pes_woods_conversation_twentyeight_02",
			},
			sound_events_duration = {
				[1] = 4.724187374115,
			},
		},
		pes_woods_conversation_twentynine_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_twentynine_01",
			},
			sound_events = {
				[1] = "pes_woods_conversation_twentynine_01",
			},
			sound_events_duration = {
				[1] = 2.2927916049957,
			},
		},
		pes_woods_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "pes_woods_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 6.890625,
			},
		},
		pes_woods_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pes_woods_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "pes_woods_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 6.0025000572205,
			},
		},
		pwe_st_lullaby_full = {
			category = "story_talk_keep",
			database = "dlc_woods",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 30,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_st_lullaby_full",
			},
			sound_events = {
				[1] = "pwe_st_lullaby_full",
			},
			sound_events_duration = {
				[1] = 25.750770568848,
			},
		},
		pwe_st_woods_conversation_eight_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_eight_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 3.8123126029968,
			},
		},
		pwe_st_woods_conversation_eight_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_eight_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 8.3463954925537,
			},
		},
		pwe_st_woods_conversation_eight_03 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_eight_03",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_eight_03",
			},
			sound_events_duration = {
				[1] = 2.1943957805634,
			},
		},
		pwe_st_woods_conversation_eighteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_eighteen_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_eighteen_01",
			},
			sound_events_duration = {
				[1] = 10.481645584106,
			},
		},
		pwe_st_woods_conversation_eighteen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_eighteen_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_eighteen_02",
			},
			sound_events_duration = {
				[1] = 5.7369999885559,
			},
		},
		pwe_st_woods_conversation_eleven_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 2.3527083396912,
			},
		},
		pwe_st_woods_conversation_eleven_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_eleven_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 2.0048959255219,
			},
		},
		pwe_st_woods_conversation_eleven_03 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_eleven_03",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_eleven_03",
			},
			sound_events_duration = {
				[1] = 5.0545001029968,
			},
		},
		pwe_st_woods_conversation_fifteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_fifteen_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_fifteen_01",
			},
			sound_events_duration = {
				[1] = 11.014833450317,
			},
		},
		pwe_st_woods_conversation_fifteen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_fifteen_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_fifteen_02",
			},
			sound_events_duration = {
				[1] = 2.6185417175293,
			},
		},
		pwe_st_woods_conversation_five_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_five_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 8.9026250839233,
			},
		},
		pwe_st_woods_conversation_five_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_five_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 1.4894791841507,
			},
		},
		pwe_st_woods_conversation_four_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_four_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 10.720333099365,
			},
		},
		pwe_st_woods_conversation_four_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_four_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 7.8962497711182,
			},
		},
		pwe_st_woods_conversation_fourteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_fourteen_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_fourteen_01",
			},
			sound_events_duration = {
				[1] = 3.2710208892822,
			},
		},
		pwe_st_woods_conversation_fourteen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_fourteen_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_fourteen_02",
			},
			sound_events_duration = {
				[1] = 8.0805835723877,
			},
		},
		pwe_st_woods_conversation_nine_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_nine_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 2.6746873855591,
			},
		},
		pwe_st_woods_conversation_nine_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_nine_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 1.4189583063126,
			},
		},
		pwe_st_woods_conversation_nineteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_nineteen_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_nineteen_01",
			},
			sound_events_duration = {
				[1] = 4.8227081298828,
			},
		},
		pwe_st_woods_conversation_nineteen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_nineteen_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_nineteen_02",
			},
			sound_events_duration = {
				[1] = 7.5408749580383,
			},
		},
		pwe_st_woods_conversation_one_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_one_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 4.5351877212524,
			},
		},
		pwe_st_woods_conversation_one_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_one_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 5.4667291641235,
			},
		},
		pwe_st_woods_conversation_seven_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_seven_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 2.5082082748413,
			},
		},
		pwe_st_woods_conversation_seven_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_seven_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 5.8607292175293,
			},
		},
		pwe_st_woods_conversation_seventeen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_seventeen_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_seventeen_01",
			},
			sound_events_duration = {
				[1] = 5.950749874115,
			},
		},
		pwe_st_woods_conversation_seventeen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_seventeen_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_seventeen_02",
			},
			sound_events_duration = {
				[1] = 6.4578123092651,
			},
		},
		pwe_st_woods_conversation_six_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_six_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 4.4885625839233,
			},
		},
		pwe_st_woods_conversation_six_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_six_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 5.3573126792908,
			},
		},
		pwe_st_woods_conversation_sixteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_sixteen_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_sixteen_01",
			},
			sound_events_duration = {
				[1] = 5.1895833015442,
			},
		},
		pwe_st_woods_conversation_sixteen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_sixteen_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_sixteen_02",
			},
			sound_events_duration = {
				[1] = 6.3600625991821,
			},
		},
		pwe_st_woods_conversation_ten_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_ten_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 8.0117082595825,
			},
		},
		pwe_st_woods_conversation_ten_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_ten_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 1.4189583063126,
			},
		},
		pwe_st_woods_conversation_thirteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_thirteen_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_thirteen_01",
			},
			sound_events_duration = {
				[1] = 9.2917289733887,
			},
		},
		pwe_st_woods_conversation_thirteen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_thirteen_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_thirteen_02",
			},
			sound_events_duration = {
				[1] = 4.7106456756592,
			},
		},
		pwe_st_woods_conversation_three_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_three_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 6.1135206222534,
			},
		},
		pwe_st_woods_conversation_three_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_three_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 4.2234582901001,
			},
		},
		pwe_st_woods_conversation_twelve_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.5805625915527,
			},
		},
		pwe_st_woods_conversation_twelve_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 6.8540205955505,
			},
		},
		pwe_st_woods_conversation_twenty_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twenty_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twenty_01",
			},
			sound_events_duration = {
				[1] = 5.7306876182556,
			},
		},
		pwe_st_woods_conversation_twenty_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twenty_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twenty_02",
			},
			sound_events_duration = {
				[1] = 8.3498754501343,
			},
		},
		pwe_st_woods_conversation_twentyfive_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twentyfive_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twentyfive_01",
			},
			sound_events_duration = {
				[1] = 3.0193123817444,
			},
		},
		pwe_st_woods_conversation_twentyfive_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twentyfive_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twentyfive_02",
			},
			sound_events_duration = {
				[1] = 9.0924167633057,
			},
		},
		pwe_st_woods_conversation_twentyfour_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twentyfour_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twentyfour_01",
			},
			sound_events_duration = {
				[1] = 13.850250244141,
			},
		},
		pwe_st_woods_conversation_twentyfour_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twentyfour_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twentyfour_02",
			},
			sound_events_duration = {
				[1] = 2.7014999389648,
			},
		},
		pwe_st_woods_conversation_twentyone_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twentyone_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twentyone_01",
			},
			sound_events_duration = {
				[1] = 1.3881249427795,
			},
		},
		pwe_st_woods_conversation_twentyone_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twentyone_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twentyone_02",
			},
			sound_events_duration = {
				[1] = 7.7280206680298,
			},
		},
		pwe_st_woods_conversation_twentythree_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twentythree_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twentythree_01",
			},
			sound_events_duration = {
				[1] = 5.8555626869202,
			},
		},
		pwe_st_woods_conversation_twentythree_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twentythree_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twentythree_02",
			},
			sound_events_duration = {
				[1] = 5.0222916603088,
			},
		},
		pwe_st_woods_conversation_twentythree_03 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twentythree_03",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twentythree_03",
			},
			sound_events_duration = {
				[1] = 9.542854309082,
			},
		},
		pwe_st_woods_conversation_twentytwo_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_twentytwo_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_twentytwo_01",
			},
			sound_events_duration = {
				[1] = 1.3124582767487,
			},
		},
		pwe_st_woods_conversation_two_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_two_01",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 10.363145828247,
			},
		},
		pwe_st_woods_conversation_two_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwe_st_woods_conversation_two_02",
			},
			sound_events = {
				[1] = "pwe_st_woods_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 4.6217918395996,
			},
		},
		pwh_woods_conversation_eighteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_eighteen_01",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_eighteen_01",
			},
			sound_events_duration = {
				[1] = 8.5363960266113,
			},
		},
		pwh_woods_conversation_eighteen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_eighteen_02",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_eighteen_02",
			},
			sound_events_duration = {
				[1] = 2.6248333454132,
			},
		},
		pwh_woods_conversation_nineteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_nineteen_01",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_nineteen_01",
			},
			sound_events_duration = {
				[1] = 10.194458007813,
			},
		},
		pwh_woods_conversation_nineteen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_nineteen_02",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_nineteen_02",
			},
			sound_events_duration = {
				[1] = 4.3171043395996,
			},
		},
		pwh_woods_conversation_nineteen_03 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_nineteen_03",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_nineteen_03",
			},
			sound_events_duration = {
				[1] = 2.899854183197,
			},
		},
		pwh_woods_conversation_seventeen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_seventeen_01",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_seventeen_01",
			},
			sound_events_duration = {
				[1] = 6.3101043701172,
			},
		},
		pwh_woods_conversation_seventeen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_seventeen_02",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_seventeen_02",
			},
			sound_events_duration = {
				[1] = 2.4798541069031,
			},
		},
		pwh_woods_conversation_sixteen_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_sixteen_01",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_sixteen_01",
			},
			sound_events_duration = {
				[1] = 9.3411045074463,
			},
		},
		pwh_woods_conversation_sixteen_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_sixteen_02",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_sixteen_02",
			},
			sound_events_duration = {
				[1] = 3.974687576294,
			},
		},
		pwh_woods_conversation_twenty_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_twenty_01",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_twenty_01",
			},
			sound_events_duration = {
				[1] = 5.4894165992737,
			},
		},
		pwh_woods_conversation_twenty_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_twenty_02",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_twenty_02",
			},
			sound_events_duration = {
				[1] = 2.113041639328,
			},
		},
		pwh_woods_conversation_twentyeight_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_twentyeight_01",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_twentyeight_01",
			},
			sound_events_duration = {
				[1] = 5.3414793014526,
			},
		},
		pwh_woods_conversation_twentynine_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_twentynine_01",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_twentynine_01",
			},
			sound_events_duration = {
				[1] = 5.2253956794739,
			},
		},
		pwh_woods_conversation_twentynine_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_twentynine_02",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_twentynine_02",
			},
			sound_events_duration = {
				[1] = 2.3761458396912,
			},
		},
		pwh_woods_conversation_twentyseven_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_twentyseven_01",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_twentyseven_01",
			},
			sound_events_duration = {
				[1] = 2.8516249656677,
			},
		},
		pwh_woods_conversation_twentysix_01 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_twentysix_01",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_twentysix_01",
			},
			sound_events_duration = {
				[1] = 10.837187767029,
			},
		},
		pwh_woods_conversation_twentysix_02 = {
			category = "story_talk_keep",
			database = "dlc_woods",
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
				[1] = "pwh_woods_conversation_twentysix_02",
			},
			sound_events = {
				[1] = "pwh_woods_conversation_twentysix_02",
			},
			sound_events_duration = {
				[1] = 4.3541874885559,
			},
		},
	})
end
