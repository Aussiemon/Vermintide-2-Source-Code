-- chunkname: @dialogues/generated/hero_conversations_ussingen.lua

return function ()
	define_rule({
		name = "pbw_level_ussingen_story_eleven_01",
		probability = 1,
		response = "pbw_level_ussingen_story_eleven_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pbw_level_ussingen_story_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_ussingen_story_eleven_01",
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
		name = "pbw_level_ussingen_story_eleven_02",
		probability = 1,
		response = "pbw_level_ussingen_story_eleven_02",
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
				"pdr_level_ussingen_story_eleven_01",
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
		name = "pbw_level_ussingen_story_six_01",
		probability = 1,
		response = "pbw_level_ussingen_story_six_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pbw_level_ussingen_story_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_ussingen_story_six_01",
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
		name = "pbw_level_ussingen_story_six_02",
		probability = 1,
		response = "pbw_level_ussingen_story_six_02",
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
				"pdr_level_ussingen_story_six_01",
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
		name = "pbw_level_ussingen_story_six_03",
		probability = 1,
		response = "pbw_level_ussingen_story_six_03",
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
				"pdr_level_ussingen_story_six_02",
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
		name = "pbw_level_ussingen_story_two_01",
		probability = 1,
		response = "pbw_level_ussingen_story_two_01",
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
				"pes_level_ussingen_story_two_02",
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
		name = "pdr_level_ussingen_story_eight_01",
		probability = 1,
		response = "pdr_level_ussingen_story_eight_01",
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
				"pes_level_ussingen_story_eight_01",
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
		name = "pdr_level_ussingen_story_eight_02",
		probability = 1,
		response = "pdr_level_ussingen_story_eight_02",
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
				"pwe_level_ussingen_story_eight_01",
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
		name = "pdr_level_ussingen_story_eleven_01",
		probability = 1,
		response = "pdr_level_ussingen_story_eleven_01",
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
				"pbw_level_ussingen_story_eleven_01",
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
		name = "pdr_level_ussingen_story_eleven_02",
		probability = 1,
		response = "pdr_level_ussingen_story_eleven_02",
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
				"pbw_level_ussingen_story_eleven_02",
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
		name = "pdr_level_ussingen_story_four_01",
		probability = 1,
		response = "pdr_level_ussingen_story_four_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pdr_level_ussingen_story_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_ussingen_story_four_01",
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
		name = "pdr_level_ussingen_story_four_02",
		probability = 1,
		response = "pdr_level_ussingen_story_four_02",
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
				"pes_level_ussingen_story_four_01",
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
		name = "pdr_level_ussingen_story_four_03",
		probability = 1,
		response = "pdr_level_ussingen_story_four_03",
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
				"pdr_level_ussingen_story_eight_02",
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
		name = "pdr_level_ussingen_story_fourteen_01",
		probability = 1,
		response = "pdr_level_ussingen_story_fourteen_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pdr_level_ussingen_story_fourteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_ussingen_story_fourteen_01",
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
		name = "pdr_level_ussingen_story_fourteen_02",
		probability = 1,
		response = "pdr_level_ussingen_story_fourteen_02",
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
				"pes_level_ussingen_story_fourteen_01",
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
		name = "pdr_level_ussingen_story_nine_01",
		probability = 1,
		response = "pdr_level_ussingen_story_nine_01",
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
				"pwh_level_ussingen_story_nine_02",
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
		name = "pdr_level_ussingen_story_one_01",
		probability = 1,
		response = "pdr_level_ussingen_story_one_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pdr_level_ussingen_story_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_ussingen_story_one_01",
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
		name = "pdr_level_ussingen_story_one_02",
		probability = 1,
		response = "pdr_level_ussingen_story_one_02",
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
				"pwe_level_ussingen_story_one_01",
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
		name = "pdr_level_ussingen_story_six_01",
		probability = 1,
		response = "pdr_level_ussingen_story_six_01",
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
				"pbw_level_ussingen_story_six_01",
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
		name = "pdr_level_ussingen_story_six_02",
		probability = 1,
		response = "pdr_level_ussingen_story_six_02",
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
				"pbw_level_ussingen_story_six_02",
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
		name = "pdr_level_ussingen_story_ten_01",
		probability = 1,
		response = "pdr_level_ussingen_story_ten_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"empire_soldier",
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
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pdr_level_ussingen_story_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_ussingen_story_ten_01",
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
		name = "pdr_level_ussingen_story_ten_02",
		probability = 1,
		response = "pdr_level_ussingen_story_ten_02",
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
				"pes_level_ussingen_story_ten_01",
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
		name = "pes_level_ussingen_story_eight_01",
		probability = 1,
		response = "pes_level_ussingen_story_eight_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"ussingen",
			},
			{
				"faction_memory",
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pes_level_ussingen_story_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_ussingen_story_eight_01",
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
		name = "pes_level_ussingen_story_four_01",
		probability = 1,
		response = "pes_level_ussingen_story_four_01",
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
				"pdr_level_ussingen_story_four_01",
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
		name = "pes_level_ussingen_story_four_02",
		probability = 1,
		response = "pes_level_ussingen_story_four_02",
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
				"pdr_level_ussingen_story_four_02",
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
		name = "pes_level_ussingen_story_fourteen_01",
		probability = 1,
		response = "pes_level_ussingen_story_fourteen_01",
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
				"pdr_level_ussingen_story_fourteen_01",
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
		name = "pes_level_ussingen_story_nine_01",
		probability = 1,
		response = "pes_level_ussingen_story_nine_01",
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
				"pwh_level_ussingen_story_nine_01",
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
		name = "pes_level_ussingen_story_one_01",
		probability = 1,
		response = "pes_level_ussingen_story_one_01",
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
				"pdr_level_ussingen_story_one_02",
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
		name = "pes_level_ussingen_story_one_02",
		probability = 1,
		response = "pes_level_ussingen_story_one_02",
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
				"pwe_level_ussingen_story_one_02",
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
		name = "pes_level_ussingen_story_ten_01",
		probability = 1,
		response = "pes_level_ussingen_story_ten_01",
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
				"pdr_level_ussingen_story_ten_01",
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
		name = "pes_level_ussingen_story_thirteen_01",
		probability = 1,
		response = "pes_level_ussingen_story_thirteen_01",
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
				"pwh_level_ussingen_story_thirteen_01",
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
		name = "pes_level_ussingen_story_thirteen_02",
		probability = 1,
		response = "pes_level_ussingen_story_thirteen_02",
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
				"pwh_level_ussingen_story_thirteen_02",
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
		name = "pes_level_ussingen_story_three_01",
		probability = 1,
		response = "pes_level_ussingen_story_three_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pes_level_ussingen_story_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_ussingen_story_three_01",
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
		name = "pes_level_ussingen_story_three_02",
		probability = 1,
		response = "pes_level_ussingen_story_three_02",
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
				"pwe_level_ussingen_story_three_01",
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
		name = "pes_level_ussingen_story_three_03",
		probability = 1,
		response = "pes_level_ussingen_story_three_03",
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
				"pwe_level_ussingen_story_three_02",
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
		name = "pes_level_ussingen_story_three_04",
		probability = 1,
		response = "pes_level_ussingen_story_three_04",
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
				"pwe_level_ussingen_story_three_03",
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
		name = "pes_level_ussingen_story_twelve_01",
		probability = 1,
		response = "pes_level_ussingen_story_twelve_01",
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
				"pwe_level_ussingen_story_twelve_01",
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
		name = "pes_level_ussingen_story_twelve_02",
		probability = 1,
		response = "pes_level_ussingen_story_twelve_02",
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
				"pwh_level_ussingen_story_twelve_01",
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
		name = "pes_level_ussingen_story_two_01",
		probability = 1,
		response = "pes_level_ussingen_story_two_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"bright_wizard",
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
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pes_level_ussingen_story_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_ussingen_story_two_01",
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
		name = "pes_level_ussingen_story_two_02",
		probability = 1,
		response = "pes_level_ussingen_story_two_02",
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
				"pwh_level_ussingen_story_two_01",
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
		name = "pwe_level_ussingen_story_eight_01",
		probability = 1,
		response = "pwe_level_ussingen_story_eight_01",
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
				"pdr_level_ussingen_story_eight_01",
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
		name = "pwe_level_ussingen_story_eight_02",
		probability = 1,
		response = "pwe_level_ussingen_story_eight_02",
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
				"pdr_level_ussingen_story_eight_02",
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
		name = "pwe_level_ussingen_story_five_01",
		probability = 1,
		response = "pwe_level_ussingen_story_five_01",
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
				"pwh_level_ussingen_story_five_01",
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
		name = "pwe_level_ussingen_story_five_02",
		probability = 1,
		response = "pwe_level_ussingen_story_five_02",
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
				"pwh_level_ussingen_story_five_02",
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
		name = "pwe_level_ussingen_story_five_03",
		probability = 1,
		response = "pwe_level_ussingen_story_five_03",
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
				"pwh_level_ussingen_story_five_03",
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
		name = "pwe_level_ussingen_story_one_01",
		probability = 1,
		response = "pwe_level_ussingen_story_one_01",
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
				"pdr_level_ussingen_story_one_01",
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
		name = "pwe_level_ussingen_story_one_02",
		probability = 1,
		response = "pwe_level_ussingen_story_one_02",
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
				"pes_level_ussingen_story_one_01",
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
		name = "pwe_level_ussingen_story_seven_01",
		probability = 1,
		response = "pwe_level_ussingen_story_seven_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"global_context",
				"current_level",
				OP.EQ,
				"ussingen",
			},
			{
				"faction_memory",
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pwh_level_ussingen_story_thirteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_ussingen_story_thirteen_01",
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
		name = "pwe_level_ussingen_story_seven_03",
		probability = 1,
		response = "pwe_level_ussingen_story_seven_03",
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
				"pwh_level_ussingen_story_seven_02",
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
		name = "pwe_level_ussingen_story_ten_01",
		probability = 1,
		response = "pwe_level_ussingen_story_ten_01",
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
				"pdr_level_ussingen_story_ten_02",
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
		name = "pwe_level_ussingen_story_three_01",
		probability = 1,
		response = "pwe_level_ussingen_story_three_01",
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
				"pes_level_ussingen_story_three_01",
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
		name = "pwe_level_ussingen_story_three_02",
		probability = 1,
		response = "pwe_level_ussingen_story_three_02",
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
				"pes_level_ussingen_story_three_02",
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
		name = "pwe_level_ussingen_story_three_03",
		probability = 1,
		response = "pwe_level_ussingen_story_three_03",
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
				"pes_level_ussingen_story_three_03",
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
		name = "pwe_level_ussingen_story_twelve_01",
		probability = 1,
		response = "pwe_level_ussingen_story_twelve_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"empire_soldier",
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
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pwe_level_ussingen_story_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_ussingen_story_twelve_01",
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
		name = "pwh_level_ussingen_story_five_01",
		probability = 1,
		response = "pwh_level_ussingen_story_five_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pwh_level_ussingen_story_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_ussingen_story_five_01",
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
		name = "pwh_level_ussingen_story_five_02",
		probability = 1,
		response = "pwh_level_ussingen_story_five_02",
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
				"pwe_level_ussingen_story_five_01",
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
		name = "pwh_level_ussingen_story_five_03",
		probability = 1,
		response = "pwh_level_ussingen_story_five_03",
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
				"pwe_level_ussingen_story_five_02",
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
		name = "pwh_level_ussingen_story_nine_01",
		probability = 1,
		response = "pwh_level_ussingen_story_nine_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pwh_level_ussingen_story_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_ussingen_story_nine_01",
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
		name = "pwh_level_ussingen_story_nine_02",
		probability = 1,
		response = "pwh_level_ussingen_story_nine_02",
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
				"pes_level_ussingen_story_nine_01",
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
		name = "pwh_level_ussingen_story_nine_03",
		probability = 1,
		response = "pwh_level_ussingen_story_nine_03",
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
				"pdr_level_ussingen_story_nine_01",
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
		name = "pwh_level_ussingen_story_seven_02",
		probability = 1,
		response = "pwh_level_ussingen_story_seven_02",
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
				"pwe_level_ussingen_story_seven_01",
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
		name = "pwh_level_ussingen_story_seven_03",
		probability = 1,
		response = "pwh_level_ussingen_story_seven_03",
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
				"pwe_level_ussingen_story_seven_03",
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
		name = "pwh_level_ussingen_story_thirteen_01",
		probability = 1,
		response = "pwh_level_ussingen_story_thirteen_01",
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
				"intensity",
				OP.EQ,
				0,
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
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_ussingen_search_for_manor",
				OP.NOT,
				"level_ussingen_search_for_manor",
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
				"once_per_level_pwh_level_ussingen_story_thirteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_ussingen_story_thirteen_01",
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
		name = "pwh_level_ussingen_story_thirteen_02",
		probability = 1,
		response = "pwh_level_ussingen_story_thirteen_02",
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
				"pes_level_ussingen_story_thirteen_01",
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
		name = "pwh_level_ussingen_story_thirteen_03",
		probability = 1,
		response = "pwh_level_ussingen_story_thirteen_03",
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
				"pes_level_ussingen_story_thirteen_02",
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
		name = "pwh_level_ussingen_story_twelve_01",
		probability = 1,
		response = "pwh_level_ussingen_story_twelve_01",
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
				"pes_level_ussingen_story_twelve_01",
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
		name = "pwh_level_ussingen_story_two_01",
		probability = 1,
		response = "pwh_level_ussingen_story_two_01",
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
				"pes_level_ussingen_story_two_01",
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
		name = "pwh_level_ussingen_story_two_02",
		probability = 1,
		response = "pwh_level_ussingen_story_two_02",
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
				"pbw_level_ussingen_story_two_01",
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
		pbw_level_ussingen_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pbw_level_ussingen_story_eleven_01",
			},
			sound_events = {
				[1] = "pbw_level_ussingen_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.636958360672,
			},
		},
		pbw_level_ussingen_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pbw_level_ussingen_story_eleven_02",
			},
			sound_events = {
				[1] = "pbw_level_ussingen_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 4.7317914962769,
			},
		},
		pbw_level_ussingen_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pbw_level_ussingen_story_six_01",
			},
			sound_events = {
				[1] = "pbw_level_ussingen_story_six_01",
			},
			sound_events_duration = {
				[1] = 2.0354583263397,
			},
		},
		pbw_level_ussingen_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pbw_level_ussingen_story_six_02",
			},
			sound_events = {
				[1] = "pbw_level_ussingen_story_six_02",
			},
			sound_events_duration = {
				[1] = 4.306104183197,
			},
		},
		pbw_level_ussingen_story_six_03 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pbw_level_ussingen_story_six_03",
			},
			sound_events = {
				[1] = "pbw_level_ussingen_story_six_03",
			},
			sound_events_duration = {
				[1] = 3.9266250133514,
			},
		},
		pbw_level_ussingen_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pbw_level_ussingen_story_two_01",
			},
			sound_events = {
				[1] = "pbw_level_ussingen_story_two_01",
			},
			sound_events_duration = {
				[1] = 3.1507291793823,
			},
		},
		pdr_level_ussingen_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_eight_01",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_eight_01",
			},
			sound_events_duration = {
				[1] = 3.3023126125336,
			},
		},
		pdr_level_ussingen_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_eight_02",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_eight_02",
			},
			sound_events_duration = {
				[1] = 6.6363749504089,
			},
		},
		pdr_level_ussingen_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_eleven_01",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 2.973729133606,
			},
		},
		pdr_level_ussingen_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_eleven_02",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 7.7520833015442,
			},
		},
		pdr_level_ussingen_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_four_01",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_four_01",
			},
			sound_events_duration = {
				[1] = 1.7693749666214,
			},
		},
		pdr_level_ussingen_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_four_02",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_four_02",
			},
			sound_events_duration = {
				[1] = 3.0999999046326,
			},
		},
		pdr_level_ussingen_story_four_03 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_four_03",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_four_03",
			},
			sound_events_duration = {
				[1] = 6.9294166564941,
			},
		},
		pdr_level_ussingen_story_fourteen_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_fourteen_01",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_fourteen_01",
			},
			sound_events_duration = {
				[1] = 6.0147085189819,
			},
		},
		pdr_level_ussingen_story_fourteen_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_fourteen_02",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_fourteen_02",
			},
			sound_events_duration = {
				[1] = 7.4729375839233,
			},
		},
		pdr_level_ussingen_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_nine_01",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_nine_01",
			},
			sound_events_duration = {
				[1] = 1.4107083082199,
			},
		},
		pdr_level_ussingen_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_one_01",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_one_01",
			},
			sound_events_duration = {
				[1] = 2.3833124637604,
			},
		},
		pdr_level_ussingen_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_one_02",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_one_02",
			},
			sound_events_duration = {
				[1] = 4.4774165153503,
			},
		},
		pdr_level_ussingen_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_six_01",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_six_01",
			},
			sound_events_duration = {
				[1] = 3.9555416107178,
			},
		},
		pdr_level_ussingen_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_six_02",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_six_02",
			},
			sound_events_duration = {
				[1] = 2.8766458034515,
			},
		},
		pdr_level_ussingen_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_ten_01",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_ten_01",
			},
			sound_events_duration = {
				[1] = 4.6101665496826,
			},
		},
		pdr_level_ussingen_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pdr_level_ussingen_story_ten_02",
			},
			sound_events = {
				[1] = "pdr_level_ussingen_story_ten_02",
			},
			sound_events_duration = {
				[1] = 1.3178333044052,
			},
		},
		pes_level_ussingen_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_eight_01",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_eight_01",
			},
			sound_events_duration = {
				[1] = 3.4932291507721,
			},
		},
		pes_level_ussingen_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_four_01",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_four_01",
			},
			sound_events_duration = {
				[1] = 4.0553956031799,
			},
		},
		pes_level_ussingen_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_four_02",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_four_02",
			},
			sound_events_duration = {
				[1] = 3.4856250286102,
			},
		},
		pes_level_ussingen_story_fourteen_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_fourteen_01",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_fourteen_01",
			},
			sound_events_duration = {
				[1] = 1.4518541097641,
			},
		},
		pes_level_ussingen_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_nine_01",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_nine_01",
			},
			sound_events_duration = {
				[1] = 1.4442917108536,
			},
		},
		pes_level_ussingen_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_one_01",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_one_01",
			},
			sound_events_duration = {
				[1] = 0.81116664409637,
			},
		},
		pes_level_ussingen_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_one_02",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_one_02",
			},
			sound_events_duration = {
				[1] = 7.0544581413269,
			},
		},
		pes_level_ussingen_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_ten_01",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_ten_01",
			},
			sound_events_duration = {
				[1] = 8.8463954925537,
			},
		},
		pes_level_ussingen_story_thirteen_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_thirteen_01",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_thirteen_01",
			},
			sound_events_duration = {
				[1] = 2.5865209102631,
			},
		},
		pes_level_ussingen_story_thirteen_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_thirteen_02",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_thirteen_02",
			},
			sound_events_duration = {
				[1] = 4.0201458930969,
			},
		},
		pes_level_ussingen_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_three_01",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_three_01",
			},
			sound_events_duration = {
				[1] = 3.8455834388733,
			},
		},
		pes_level_ussingen_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_three_02",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_three_02",
			},
			sound_events_duration = {
				[1] = 3.2512917518616,
			},
		},
		pes_level_ussingen_story_three_03 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_three_03",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_three_03",
			},
			sound_events_duration = {
				[1] = 2.1305415630341,
			},
		},
		pes_level_ussingen_story_three_04 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_three_04",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_three_04",
			},
			sound_events_duration = {
				[1] = 2.0726666450501,
			},
		},
		pes_level_ussingen_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_twelve_01",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 5.3517498970032,
			},
		},
		pes_level_ussingen_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_twelve_02",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 5.8340001106262,
			},
		},
		pes_level_ussingen_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_two_01",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_two_01",
			},
			sound_events_duration = {
				[1] = 1.8284896016121,
			},
		},
		pes_level_ussingen_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pes_level_ussingen_story_two_02",
			},
			sound_events = {
				[1] = "pes_level_ussingen_story_two_02",
			},
			sound_events_duration = {
				[1] = 1.5821666717529,
			},
		},
		pwe_level_ussingen_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_eight_01",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_eight_01",
			},
			sound_events_duration = {
				[1] = 2.7598333358765,
			},
		},
		pwe_level_ussingen_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_eight_02",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_eight_02",
			},
			sound_events_duration = {
				[1] = 8.056562423706,
			},
		},
		pwe_level_ussingen_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_five_01",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_five_01",
			},
			sound_events_duration = {
				[1] = 4.4439792633057,
			},
		},
		pwe_level_ussingen_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_five_02",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_five_02",
			},
			sound_events_duration = {
				[1] = 3.2819375991821,
			},
		},
		pwe_level_ussingen_story_five_03 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_five_03",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_five_03",
			},
			sound_events_duration = {
				[1] = 4.5086665153503,
			},
		},
		pwe_level_ussingen_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_one_01",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_one_01",
			},
			sound_events_duration = {
				[1] = 5.1657085418701,
			},
		},
		pwe_level_ussingen_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_one_02",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_one_02",
			},
			sound_events_duration = {
				[1] = 6.3289165496826,
			},
		},
		pwe_level_ussingen_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_seven_01",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_seven_01",
			},
			sound_events_duration = {
				[1] = 9.8576879501343,
			},
		},
		pwe_level_ussingen_story_seven_03 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_seven_03",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_seven_03",
			},
			sound_events_duration = {
				[1] = 4.8006043434143,
			},
		},
		pwe_level_ussingen_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_ten_01",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_ten_01",
			},
			sound_events_duration = {
				[1] = 6.3051042556763,
			},
		},
		pwe_level_ussingen_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_three_01",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_three_01",
			},
			sound_events_duration = {
				[1] = 3.3949167728424,
			},
		},
		pwe_level_ussingen_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_three_02",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_three_02",
			},
			sound_events_duration = {
				[1] = 2.8091459274292,
			},
		},
		pwe_level_ussingen_story_three_03 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_three_03",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_three_03",
			},
			sound_events_duration = {
				[1] = 3.0096666812897,
			},
		},
		pwe_level_ussingen_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwe_level_ussingen_story_twelve_01",
			},
			sound_events = {
				[1] = "pwe_level_ussingen_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.2204375267029,
			},
		},
		pwh_level_ussingen_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_five_01",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_five_01",
			},
			sound_events_duration = {
				[1] = 3.5539791584015,
			},
		},
		pwh_level_ussingen_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_five_02",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_five_02",
			},
			sound_events_duration = {
				[1] = 6.039541721344,
			},
		},
		pwh_level_ussingen_story_five_03 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_five_03",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_five_03",
			},
			sound_events_duration = {
				[1] = 2.6441457271576,
			},
		},
		pwh_level_ussingen_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_nine_01",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_nine_01",
			},
			sound_events_duration = {
				[1] = 4.9710626602173,
			},
		},
		pwh_level_ussingen_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_nine_02",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_nine_02",
			},
			sound_events_duration = {
				[1] = 4.0347709655762,
			},
		},
		pwh_level_ussingen_story_nine_03 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_nine_03",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_nine_03",
			},
			sound_events_duration = {
				[1] = 2.2088541984558,
			},
		},
		pwh_level_ussingen_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_seven_02",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_seven_02",
			},
			sound_events_duration = {
				[1] = 11.077249526978,
			},
		},
		pwh_level_ussingen_story_seven_03 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_seven_03",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_seven_03",
			},
			sound_events_duration = {
				[1] = 3.4802083969116,
			},
		},
		pwh_level_ussingen_story_thirteen_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_thirteen_01",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_thirteen_01",
			},
			sound_events_duration = {
				[1] = 5.2590417861939,
			},
		},
		pwh_level_ussingen_story_thirteen_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_thirteen_02",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_thirteen_02",
			},
			sound_events_duration = {
				[1] = 14.718521118164,
			},
		},
		pwh_level_ussingen_story_thirteen_03 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_thirteen_03",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_thirteen_03",
			},
			sound_events_duration = {
				[1] = 3.2843749523163,
			},
		},
		pwh_level_ussingen_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_twelve_01",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 4.2802500724792,
			},
		},
		pwh_level_ussingen_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_two_01",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_two_01",
			},
			sound_events_duration = {
				[1] = 3.0954582691193,
			},
		},
		pwh_level_ussingen_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_ussingen",
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
				[1] = "pwh_level_ussingen_story_two_02",
			},
			sound_events = {
				[1] = "pwh_level_ussingen_story_two_02",
			},
			sound_events_duration = {
				[1] = 8.4987287521362,
			},
		},
	})
end
