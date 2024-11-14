-- chunkname: @dialogues/generated/hero_conversations_crawl.lua

return function ()
	define_rule({
		name = "pbw_crawl_conversation_nine_01",
		probability = 1,
		response = "pbw_crawl_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_crawl_conversation_nine_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pbw_crawl_conversation_nine_02",
		probability = 1,
		response = "pbw_crawl_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_crawl_conversation_nine_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pbw_crawl_conversation_six_01",
		probability = 1,
		response = "pbw_crawl_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_crawl_conversation_six_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pbw_crawl_conversation_six_02",
		probability = 1,
		response = "pbw_crawl_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_crawl_conversation_six_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pbw_crawl_conversation_three_01",
		probability = 1,
		response = "pbw_crawl_conversation_three_01",
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
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_pub_horde_end",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"crawl_conversation_three",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_three",
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
		name = "pbw_crawl_conversation_three_02",
		probability = 1,
		response = "pbw_crawl_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_crawl_conversation_three_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pbw_crawl_conversation_two_01",
		probability = 1,
		response = "pbw_crawl_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_crawl_conversation_two_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pdr_crawl_conversation_eight_01",
		probability = 1,
		response = "pdr_crawl_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_crawl_conversation_eight_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pdr_crawl_conversation_eight_02",
		probability = 1,
		response = "pdr_crawl_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_crawl_conversation_eight_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pdr_crawl_conversation_five_01",
		probability = 1,
		response = "pdr_crawl_conversation_five_01",
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
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_pub_horde_end",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"crawl_conversation_five",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_five",
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
		name = "pdr_crawl_conversation_five_02",
		probability = 1,
		response = "pdr_crawl_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_crawl_conversation_five_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pdr_crawl_conversation_six_01",
		probability = 1,
		response = "pdr_crawl_conversation_six_01",
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
				"crawl_pub_horde_end",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"crawl_conversation_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_six",
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
		name = "pdr_crawl_conversation_six_02",
		probability = 1,
		response = "pdr_crawl_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_crawl_conversation_six_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pdr_crawl_conversation_ten_01",
		probability = 1,
		response = "pdr_crawl_conversation_ten_01",
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
				"crawl_pub_horde_end",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"crawl_conversation_ten",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_ten",
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
		name = "pdr_crawl_conversation_ten_02",
		probability = 1,
		response = "pdr_crawl_conversation_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_crawl_conversation_ten_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pes_crawl_conversation_five_01",
		probability = 1,
		response = "pes_crawl_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_crawl_conversation_five_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pes_crawl_conversation_five_02",
		probability = 1,
		response = "pes_crawl_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_crawl_conversation_five_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pes_crawl_conversation_four_01",
		probability = 1,
		response = "pes_crawl_conversation_four_01",
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
				"crawl_pub_horde_end",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"crawl_conversation_four",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_four",
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
		name = "pes_crawl_conversation_four_02",
		probability = 1,
		response = "pes_crawl_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_crawl_conversation_four_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pes_crawl_conversation_one_01",
		probability = 1,
		response = "pes_crawl_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_crawl_conversation_one_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pes_crawl_conversation_one_02",
		probability = 1,
		response = "pes_crawl_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_crawl_conversation_one_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pes_crawl_conversation_three_01",
		probability = 1,
		response = "pes_crawl_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_crawl_conversation_three_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pes_crawl_conversation_three_02",
		probability = 1,
		response = "pes_crawl_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_crawl_conversation_three_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwe_crawl_conversation_four_01",
		probability = 1,
		response = "pwe_crawl_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_crawl_conversation_four_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwe_crawl_conversation_nine_01",
		probability = 1,
		response = "pwe_crawl_conversation_nine_01",
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
				"crawl_pub_horde_end",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"crawl_conversation_nine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_nine",
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
		name = "pwe_crawl_conversation_nine_02",
		probability = 1,
		response = "pwe_crawl_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_crawl_conversation_nine_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwe_crawl_conversation_seven_01",
		probability = 1,
		response = "pwe_crawl_conversation_seven_01",
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
				"crawl_pub_horde_end",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"crawl_conversation_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_seven",
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
		name = "pwe_crawl_conversation_seven_02",
		probability = 1,
		response = "pwe_crawl_conversation_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_crawl_conversation_seven_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwe_crawl_conversation_seven_03",
		probability = 1,
		response = "pwe_crawl_conversation_seven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_crawl_conversation_seven_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwe_crawl_conversation_ten_01",
		probability = 1,
		response = "pwe_crawl_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_crawl_conversation_ten_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwe_crawl_conversation_ten_02",
		probability = 1,
		response = "pwe_crawl_conversation_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_crawl_conversation_ten_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwh_crawl_conversation_eight_01",
		probability = 1,
		response = "pwh_crawl_conversation_eight_01",
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_pub_horde_end",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"crawl_conversation_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_eight",
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
		name = "pwh_crawl_conversation_eight_02",
		probability = 1,
		response = "pwh_crawl_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_crawl_conversation_eight_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwh_crawl_conversation_one_01",
		probability = 1,
		response = "pwh_crawl_conversation_one_01",
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
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_pub_horde_end",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"crawl_conversation_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_one",
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
		name = "pwh_crawl_conversation_one_02",
		probability = 1,
		response = "pwh_crawl_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_crawl_conversation_one_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwh_crawl_conversation_one_03",
		probability = 1,
		response = "pwh_crawl_conversation_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_crawl_conversation_one_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwh_crawl_conversation_seven_01",
		probability = 1,
		response = "pwh_crawl_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_crawl_conversation_seven_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwh_crawl_conversation_seven_02",
		probability = 1,
		response = "pwh_crawl_conversation_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_crawl_conversation_seven_02",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		name = "pwh_crawl_conversation_two_01",
		probability = 1,
		response = "pwh_crawl_conversation_two_01",
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
				"crawl_pub_horde_end",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"crawl_conversation_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"crawl_conversation_two",
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
		name = "pwh_crawl_conversation_two_02",
		probability = 1,
		response = "pwh_crawl_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_crawl_conversation_two_01",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3,
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
		pbw_crawl_conversation_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pbw_crawl_conversation_nine_01",
			},
			sound_events = {
				[1] = "pbw_crawl_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 8.0358753204346,
			},
		},
		pbw_crawl_conversation_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pbw_crawl_conversation_nine_02",
			},
			sound_events = {
				[1] = "pbw_crawl_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 4.5683126449585,
			},
		},
		pbw_crawl_conversation_six_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pbw_crawl_conversation_six_01",
			},
			sound_events = {
				[1] = "pbw_crawl_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 7.9627289772034,
			},
		},
		pbw_crawl_conversation_six_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pbw_crawl_conversation_six_02",
			},
			sound_events = {
				[1] = "pbw_crawl_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 2.7851042747498,
			},
		},
		pbw_crawl_conversation_three_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pbw_crawl_conversation_three_01",
			},
			sound_events = {
				[1] = "pbw_crawl_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 3.7317707538605,
			},
		},
		pbw_crawl_conversation_three_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pbw_crawl_conversation_three_02",
			},
			sound_events = {
				[1] = "pbw_crawl_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 3.3836040496826,
			},
		},
		pbw_crawl_conversation_two_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pbw_crawl_conversation_two_01",
			},
			sound_events = {
				[1] = "pbw_crawl_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 2.762312412262,
			},
		},
		pdr_crawl_conversation_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pdr_crawl_conversation_eight_01",
			},
			sound_events = {
				[1] = "pdr_crawl_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 5.6063122749329,
			},
		},
		pdr_crawl_conversation_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pdr_crawl_conversation_eight_02",
			},
			sound_events = {
				[1] = "pdr_crawl_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 8.3614587783813,
			},
		},
		pdr_crawl_conversation_five_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pdr_crawl_conversation_five_01",
			},
			sound_events = {
				[1] = "pdr_crawl_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 5.3464164733887,
			},
		},
		pdr_crawl_conversation_five_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pdr_crawl_conversation_five_02",
			},
			sound_events = {
				[1] = "pdr_crawl_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 5.0065627098083,
			},
		},
		pdr_crawl_conversation_six_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pdr_crawl_conversation_six_01",
			},
			sound_events = {
				[1] = "pdr_crawl_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 2.7935209274292,
			},
		},
		pdr_crawl_conversation_six_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pdr_crawl_conversation_six_02",
			},
			sound_events = {
				[1] = "pdr_crawl_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 7.7598123550415,
			},
		},
		pdr_crawl_conversation_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pdr_crawl_conversation_ten_01",
			},
			sound_events = {
				[1] = "pdr_crawl_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 6.6923751831055,
			},
		},
		pdr_crawl_conversation_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pdr_crawl_conversation_ten_02",
			},
			sound_events = {
				[1] = "pdr_crawl_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 2.6574165821075,
			},
		},
		pes_crawl_conversation_five_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pes_crawl_conversation_five_01",
			},
			sound_events = {
				[1] = "pes_crawl_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 5.2924585342407,
			},
		},
		pes_crawl_conversation_five_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pes_crawl_conversation_five_02",
			},
			sound_events = {
				[1] = "pes_crawl_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 2.3338332176209,
			},
		},
		pes_crawl_conversation_four_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pes_crawl_conversation_four_01",
			},
			sound_events = {
				[1] = "pes_crawl_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 2.8873333930969,
			},
		},
		pes_crawl_conversation_four_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pes_crawl_conversation_four_02",
			},
			sound_events = {
				[1] = "pes_crawl_conversation_four_02",
			},
			sound_events_duration = {
				[1] = 5.5877709388733,
			},
		},
		pes_crawl_conversation_one_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pes_crawl_conversation_one_01",
			},
			sound_events = {
				[1] = "pes_crawl_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 3.3469998836517,
			},
		},
		pes_crawl_conversation_one_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pes_crawl_conversation_one_02",
			},
			sound_events = {
				[1] = "pes_crawl_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 4.527937412262,
			},
		},
		pes_crawl_conversation_three_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pes_crawl_conversation_three_01",
			},
			sound_events = {
				[1] = "pes_crawl_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 5.8731460571289,
			},
		},
		pes_crawl_conversation_three_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pes_crawl_conversation_three_02",
			},
			sound_events = {
				[1] = "pes_crawl_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 1.1869167089462,
			},
		},
		pwe_crawl_conversation_four_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwe_crawl_conversation_four_01",
			},
			sound_events = {
				[1] = "pwe_crawl_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 5.275812625885,
			},
		},
		pwe_crawl_conversation_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwe_crawl_conversation_nine_01",
			},
			sound_events = {
				[1] = "pwe_crawl_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 6.2093749046326,
			},
		},
		pwe_crawl_conversation_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwe_crawl_conversation_nine_02",
			},
			sound_events = {
				[1] = "pwe_crawl_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 6.2045207023621,
			},
		},
		pwe_crawl_conversation_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwe_crawl_conversation_seven_01",
			},
			sound_events = {
				[1] = "pwe_crawl_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 10.144520759583,
			},
		},
		pwe_crawl_conversation_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwe_crawl_conversation_seven_02",
			},
			sound_events = {
				[1] = "pwe_crawl_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 2.3214375972748,
			},
		},
		pwe_crawl_conversation_seven_03 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwe_crawl_conversation_seven_03",
			},
			sound_events = {
				[1] = "pwe_crawl_conversation_seven_03",
			},
			sound_events_duration = {
				[1] = 3.2339792251587,
			},
		},
		pwe_crawl_conversation_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwe_crawl_conversation_ten_01",
			},
			sound_events = {
				[1] = "pwe_crawl_conversation_ten_01",
			},
			sound_events_duration = {
				[1] = 8.5351247787476,
			},
		},
		pwe_crawl_conversation_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwe_crawl_conversation_ten_02",
			},
			sound_events = {
				[1] = "pwe_crawl_conversation_ten_02",
			},
			sound_events_duration = {
				[1] = 2.3052084445953,
			},
		},
		pwh_crawl_conversation_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwh_crawl_conversation_eight_01",
			},
			sound_events = {
				[1] = "pwh_crawl_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 14.767395973206,
			},
		},
		pwh_crawl_conversation_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwh_crawl_conversation_eight_02",
			},
			sound_events = {
				[1] = "pwh_crawl_conversation_eight_02",
			},
			sound_events_duration = {
				[1] = 4.5231041908264,
			},
		},
		pwh_crawl_conversation_one_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwh_crawl_conversation_one_01",
			},
			sound_events = {
				[1] = "pwh_crawl_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 3.5942709445953,
			},
		},
		pwh_crawl_conversation_one_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwh_crawl_conversation_one_02",
			},
			sound_events = {
				[1] = "pwh_crawl_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 6.6771249771118,
			},
		},
		pwh_crawl_conversation_one_03 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwh_crawl_conversation_one_03",
			},
			sound_events = {
				[1] = "pwh_crawl_conversation_one_03",
			},
			sound_events_duration = {
				[1] = 3.5225832462311,
			},
		},
		pwh_crawl_conversation_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwh_crawl_conversation_seven_01",
			},
			sound_events = {
				[1] = "pwh_crawl_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 5.4539375305176,
			},
		},
		pwh_crawl_conversation_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwh_crawl_conversation_seven_02",
			},
			sound_events = {
				[1] = "pwh_crawl_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 2.3595623970032,
			},
		},
		pwh_crawl_conversation_two_01 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwh_crawl_conversation_two_01",
			},
			sound_events = {
				[1] = "pwh_crawl_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 8.8224582672119,
			},
		},
		pwh_crawl_conversation_two_02 = {
			category = "story_talk",
			database = "hero_conversations_crawl",
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
				[1] = "pwh_crawl_conversation_two_02",
			},
			sound_events = {
				[1] = "pwh_crawl_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 8.4113330841065,
			},
		},
	})
end
