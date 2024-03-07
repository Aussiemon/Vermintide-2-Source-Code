-- chunkname: @dialogues/generated/hero_conversations_skaven_stronghold.lua

return function ()
	define_rule({
		name = "pbw_level_skaven_stronghold_story_nine_01",
		response = "pbw_level_skaven_stronghold_story_nine_01",
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
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_nine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_nine",
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
		name = "pbw_level_skaven_stronghold_story_nine_02",
		response = "pbw_level_skaven_stronghold_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_skaven_stronghold_story_nine_01",
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
		name = "pbw_level_skaven_stronghold_story_nine_03",
		response = "pbw_level_skaven_stronghold_story_nine_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_skaven_stronghold_story_nine_02",
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
		name = "pbw_level_skaven_stronghold_story_one_01",
		response = "pbw_level_skaven_stronghold_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_skaven_stronghold_story_one_01",
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
		name = "pbw_level_skaven_stronghold_story_six_01",
		response = "pbw_level_skaven_stronghold_story_six_01",
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
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_six",
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
		name = "pbw_level_skaven_stronghold_story_six_02",
		response = "pbw_level_skaven_stronghold_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_six_01",
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
		name = "pbw_level_skaven_stronghold_story_six_03",
		response = "pbw_level_skaven_stronghold_story_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_six_02",
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
		name = "pbw_level_skaven_stronghold_story_ten_01",
		response = "pbw_level_skaven_stronghold_story_ten_01",
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
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_ten",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_ten",
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
		name = "pbw_level_skaven_stronghold_story_ten_02",
		response = "pbw_level_skaven_stronghold_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_ten_01",
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
		name = "pbw_level_skaven_stronghold_story_ten_03",
		response = "pbw_level_skaven_stronghold_story_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_ten_02",
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
		name = "pbw_level_skaven_stronghold_story_twelve_01",
		response = "pbw_level_skaven_stronghold_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_skaven_stronghold_story_twelve_01",
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
		name = "pbw_level_skaven_stronghold_story_twelve_02",
		response = "pbw_level_skaven_stronghold_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_skaven_stronghold_story_twelve_02",
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
		name = "pdr_level_skaven_stronghold_story_eleven_01",
		response = "pdr_level_skaven_stronghold_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_skaven_stronghold_story_eleven_01",
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
		name = "pdr_level_skaven_stronghold_story_seven_01",
		response = "pdr_level_skaven_stronghold_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_skaven_stronghold_story_seven_01",
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
		name = "pdr_level_skaven_stronghold_story_seven_02",
		response = "pdr_level_skaven_stronghold_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_skaven_stronghold_story_seven_02",
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
		name = "pdr_level_skaven_stronghold_story_seven_03",
		response = "pdr_level_skaven_stronghold_story_seven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_skaven_stronghold_story_seven_03",
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
		name = "pdr_level_skaven_stronghold_story_six_01",
		response = "pdr_level_skaven_stronghold_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_skaven_stronghold_story_six_01",
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
		name = "pdr_level_skaven_stronghold_story_six_02",
		response = "pdr_level_skaven_stronghold_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_skaven_stronghold_story_six_02",
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
		name = "pdr_level_skaven_stronghold_story_ten_01",
		response = "pdr_level_skaven_stronghold_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_skaven_stronghold_story_ten_01",
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
		name = "pdr_level_skaven_stronghold_story_ten_02",
		response = "pdr_level_skaven_stronghold_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_skaven_stronghold_story_ten_02",
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
		name = "pdr_level_skaven_stronghold_story_ten_03",
		response = "pdr_level_skaven_stronghold_story_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_skaven_stronghold_story_ten_03",
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
		name = "pdr_level_skaven_stronghold_story_three_01",
		response = "pdr_level_skaven_stronghold_story_three_01",
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
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_three",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_three",
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
		name = "pdr_level_skaven_stronghold_story_three_02",
		response = "pdr_level_skaven_stronghold_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_skaven_stronghold_story_three_01",
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
		name = "pdr_level_skaven_stronghold_story_three_03",
		response = "pdr_level_skaven_stronghold_story_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_skaven_stronghold_story_three_02",
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
		name = "pdr_level_skaven_stronghold_story_two_01",
		response = "pdr_level_skaven_stronghold_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				7,
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
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_one",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_stronghold_story_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_two",
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
		name = "pdr_level_skaven_stronghold_story_two_02",
		response = "pdr_level_skaven_stronghold_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_skaven_stronghold_story_two_01",
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
		name = "pdr_level_skaven_stronghold_story_two_03",
		response = "pdr_level_skaven_stronghold_story_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_skaven_stronghold_story_two_02",
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
		name = "pes_level_skaven_stronghold_story_eight_01",
		response = "pes_level_skaven_stronghold_story_eight_01",
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
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_eight",
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
		name = "pes_level_skaven_stronghold_story_eight_02",
		response = "pes_level_skaven_stronghold_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_skaven_stronghold_story_eight_01",
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
		name = "pes_level_skaven_stronghold_story_eleven_01",
		response = "pes_level_skaven_stronghold_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger_disabled",
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
				"witch_hunter",
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
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_eleven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_eleven",
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
		name = "pes_level_skaven_stronghold_story_eleven_02",
		response = "pes_level_skaven_stronghold_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_eleven_01",
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
		name = "pes_level_skaven_stronghold_story_five_01",
		response = "pes_level_skaven_stronghold_story_five_01",
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
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_five",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_five",
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
		name = "pes_level_skaven_stronghold_story_five_02",
		response = "pes_level_skaven_stronghold_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_skaven_stronghold_story_five_01",
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
		name = "pes_level_skaven_stronghold_story_three_01",
		response = "pes_level_skaven_stronghold_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_three_01",
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
		name = "pes_level_skaven_stronghold_story_three_02",
		response = "pes_level_skaven_stronghold_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_three_02",
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
		name = "pes_level_skaven_stronghold_story_twelve_01",
		response = "pes_level_skaven_stronghold_story_twelve_01",
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
				"faction_memory",
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_twelve",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_twelve",
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
		name = "pes_level_skaven_stronghold_story_twelve_02",
		response = "pes_level_skaven_stronghold_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_skaven_stronghold_story_twelve_01",
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
		name = "pwe_level_skaven_stronghold_story_four_01",
		response = "pwe_level_skaven_stronghold_story_four_01",
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
				"faction_memory",
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_four",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_four",
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
		name = "pwe_level_skaven_stronghold_story_four_02",
		response = "pwe_level_skaven_stronghold_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_skaven_stronghold_story_four_02",
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
		name = "pwe_level_skaven_stronghold_story_nine_01",
		response = "pwe_level_skaven_stronghold_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_skaven_stronghold_story_nine_01",
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
		name = "pwe_level_skaven_stronghold_story_nine_02",
		response = "pwe_level_skaven_stronghold_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_skaven_stronghold_story_nine_02",
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
		name = "pwe_level_skaven_stronghold_story_seven_01",
		response = "pwe_level_skaven_stronghold_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				7,
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_seven",
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
		name = "pwe_level_skaven_stronghold_story_seven_02",
		response = "pwe_level_skaven_stronghold_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_seven_01",
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
		name = "pwe_level_skaven_stronghold_story_seven_03",
		response = "pwe_level_skaven_stronghold_story_seven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_seven_02",
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
		name = "pwh_level_skaven_stronghold_story_eight_01",
		response = "pwh_level_skaven_stronghold_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_skaven_stronghold_story_eight_01",
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
		name = "pwh_level_skaven_stronghold_story_eight_02",
		response = "pwh_level_skaven_stronghold_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_skaven_stronghold_story_eight_02",
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
		name = "pwh_level_skaven_stronghold_story_eleven_01",
		response = "pwh_level_skaven_stronghold_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_skaven_stronghold_story_eleven_02",
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
		name = "pwh_level_skaven_stronghold_story_five_01",
		response = "pwh_level_skaven_stronghold_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_skaven_stronghold_story_five_01",
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
		name = "pwh_level_skaven_stronghold_story_four_01",
		response = "pwh_level_skaven_stronghold_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_skaven_stronghold_story_four_01",
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
		name = "pwh_level_skaven_stronghold_story_four_02",
		response = "pwh_level_skaven_stronghold_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_skaven_stronghold_story_four_02",
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
		name = "pwh_level_skaven_stronghold_story_one_01",
		response = "pwh_level_skaven_stronghold_story_one_01",
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_skaven_stronghold_warlord_nest",
				OP.NOT,
				"level_skaven_stronghold_warlord_nest",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"level_stronghold_story_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_stronghold_story_one",
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
		name = "pwh_level_skaven_stronghold_story_one_02",
		response = "pwh_level_skaven_stronghold_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_skaven_stronghold_story_one_01",
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
		name = "pwh_level_skaven_stronghold_story_two_01",
		response = "pwh_level_skaven_stronghold_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_two_01",
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
		name = "pwh_level_skaven_stronghold_story_two_02",
		response = "pwh_level_skaven_stronghold_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_two_02",
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
		name = "pwh_level_skaven_stronghold_story_two_03",
		response = "pwh_level_skaven_stronghold_story_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_skaven_stronghold_story_two_03",
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
		pbw_level_skaven_stronghold_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_nine_01",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_nine_01",
			},
			sound_events_duration = {
				[1] = 2.352979183197,
			},
		},
		pbw_level_skaven_stronghold_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_nine_02",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_nine_02",
			},
			sound_events_duration = {
				[1] = 6.3389792442322,
			},
		},
		pbw_level_skaven_stronghold_story_nine_03 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_nine_03",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_nine_03",
			},
			sound_events_duration = {
				[1] = 4.8779792785644,
			},
		},
		pbw_level_skaven_stronghold_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_one_01",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_one_01",
			},
			sound_events_duration = {
				[1] = 2.4259791374206,
			},
		},
		pbw_level_skaven_stronghold_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_six_01",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_six_01",
			},
			sound_events_duration = {
				[1] = 2.5149791240692,
			},
		},
		pbw_level_skaven_stronghold_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_six_02",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_six_02",
			},
			sound_events_duration = {
				[1] = 3.988979101181,
			},
		},
		pbw_level_skaven_stronghold_story_six_03 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_six_03",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_six_03",
			},
			sound_events_duration = {
				[1] = 0.59500002861023,
			},
		},
		pbw_level_skaven_stronghold_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_ten_01",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_ten_01",
			},
			sound_events_duration = {
				[1] = 2.6929790973663,
			},
		},
		pbw_level_skaven_stronghold_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_ten_02",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_ten_02",
			},
			sound_events_duration = {
				[1] = 3.8369791507721,
			},
		},
		pbw_level_skaven_stronghold_story_ten_03 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_ten_03",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_ten_03",
			},
			sound_events_duration = {
				[1] = 1.1219999790192,
			},
		},
		pbw_level_skaven_stronghold_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_twelve_01",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.0899791717529,
			},
		},
		pbw_level_skaven_stronghold_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pbw_level_skaven_stronghold_story_twelve_02",
			},
			sound_events = {
				[1] = "pbw_level_skaven_stronghold_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 3.8099999427795,
			},
		},
		pdr_level_skaven_stronghold_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_eleven_01",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 4.745979309082,
			},
		},
		pdr_level_skaven_stronghold_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_seven_01",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_seven_01",
			},
			sound_events_duration = {
				[1] = 1.3859791755676,
			},
		},
		pdr_level_skaven_stronghold_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_seven_02",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_seven_02",
			},
			sound_events_duration = {
				[1] = 7.8559789657593,
			},
		},
		pdr_level_skaven_stronghold_story_seven_03 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_seven_03",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_seven_03",
			},
			sound_events_duration = {
				[1] = 3.6689791679382,
			},
		},
		pdr_level_skaven_stronghold_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_six_01",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_six_01",
			},
			sound_events_duration = {
				[1] = 5.6439790725708,
			},
		},
		pdr_level_skaven_stronghold_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_six_02",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_six_02",
			},
			sound_events_duration = {
				[1] = 6.5199790000916,
			},
		},
		pdr_level_skaven_stronghold_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_ten_01",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_ten_01",
			},
			sound_events_duration = {
				[1] = 2.9419791698456,
			},
		},
		pdr_level_skaven_stronghold_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_ten_02",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_ten_02",
			},
			sound_events_duration = {
				[1] = 6.8449792861939,
			},
		},
		pdr_level_skaven_stronghold_story_ten_03 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_ten_03",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_ten_03",
			},
			sound_events_duration = {
				[1] = 4.4689793586731,
			},
		},
		pdr_level_skaven_stronghold_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_three_01",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_three_01",
			},
			sound_events_duration = {
				[1] = 1.8679791688919,
			},
		},
		pdr_level_skaven_stronghold_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_three_02",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_three_02",
			},
			sound_events_duration = {
				[1] = 5.8839793205261,
			},
		},
		pdr_level_skaven_stronghold_story_three_03 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_three_03",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_three_03",
			},
			sound_events_duration = {
				[1] = 3.8199791908264,
			},
		},
		pdr_level_skaven_stronghold_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_two_01",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_two_01",
			},
			sound_events_duration = {
				[1] = 5.6749792098999,
			},
		},
		pdr_level_skaven_stronghold_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_two_02",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_two_02",
			},
			sound_events_duration = {
				[1] = 9.084979057312,
			},
		},
		pdr_level_skaven_stronghold_story_two_03 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pdr_level_skaven_stronghold_story_two_03",
			},
			sound_events = {
				[1] = "pdr_level_skaven_stronghold_story_two_03",
			},
			sound_events_duration = {
				[1] = 3.2880001068115,
			},
		},
		pes_level_skaven_stronghold_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pes_level_skaven_stronghold_story_eight_01",
			},
			sound_events = {
				[1] = "pes_level_skaven_stronghold_story_eight_01",
			},
			sound_events_duration = {
				[1] = 4.3829793930054,
			},
		},
		pes_level_skaven_stronghold_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pes_level_skaven_stronghold_story_eight_02",
			},
			sound_events = {
				[1] = "pes_level_skaven_stronghold_story_eight_02",
			},
			sound_events_duration = {
				[1] = 2.1619791984558,
			},
		},
		pes_level_skaven_stronghold_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pes_level_skaven_stronghold_story_eleven_01",
			},
			sound_events = {
				[1] = "pes_level_skaven_stronghold_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 4.2309789657593,
			},
		},
		pes_level_skaven_stronghold_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pes_level_skaven_stronghold_story_eleven_02",
			},
			sound_events = {
				[1] = "pes_level_skaven_stronghold_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 0.56497919559479,
			},
		},
		pes_level_skaven_stronghold_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pes_level_skaven_stronghold_story_five_01",
			},
			sound_events = {
				[1] = "pes_level_skaven_stronghold_story_five_01",
			},
			sound_events_duration = {
				[1] = 1.9784791469574,
			},
		},
		pes_level_skaven_stronghold_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pes_level_skaven_stronghold_story_five_02",
			},
			sound_events = {
				[1] = "pes_level_skaven_stronghold_story_five_02",
			},
			sound_events_duration = {
				[1] = 1.1699792146683,
			},
		},
		pes_level_skaven_stronghold_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pes_level_skaven_stronghold_story_three_01",
			},
			sound_events = {
				[1] = "pes_level_skaven_stronghold_story_three_01",
			},
			sound_events_duration = {
				[1] = 2.0589792728424,
			},
		},
		pes_level_skaven_stronghold_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pes_level_skaven_stronghold_story_three_02",
			},
			sound_events = {
				[1] = "pes_level_skaven_stronghold_story_three_02",
			},
			sound_events_duration = {
				[1] = 4.1459794044495,
			},
		},
		pes_level_skaven_stronghold_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pes_level_skaven_stronghold_story_twelve_01",
			},
			sound_events = {
				[1] = "pes_level_skaven_stronghold_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 6.2489790916443,
			},
		},
		pes_level_skaven_stronghold_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pes_level_skaven_stronghold_story_twelve_02",
			},
			sound_events = {
				[1] = "pes_level_skaven_stronghold_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 3.9319999217987,
			},
		},
		pwe_level_skaven_stronghold_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwe_level_skaven_stronghold_story_four_01",
			},
			sound_events = {
				[1] = "pwe_level_skaven_stronghold_story_four_01",
			},
			sound_events_duration = {
				[1] = 2.7529792785645,
			},
		},
		pwe_level_skaven_stronghold_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwe_level_skaven_stronghold_story_four_02",
			},
			sound_events = {
				[1] = "pwe_level_skaven_stronghold_story_four_02",
			},
			sound_events_duration = {
				[1] = 6.0389790534973,
			},
		},
		pwe_level_skaven_stronghold_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwe_level_skaven_stronghold_story_nine_01",
			},
			sound_events = {
				[1] = "pwe_level_skaven_stronghold_story_nine_01",
			},
			sound_events_duration = {
				[1] = 6.066978931427,
			},
		},
		pwe_level_skaven_stronghold_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwe_level_skaven_stronghold_story_nine_02",
			},
			sound_events = {
				[1] = "pwe_level_skaven_stronghold_story_nine_02",
			},
			sound_events_duration = {
				[1] = 3.2499895095825,
			},
		},
		pwe_level_skaven_stronghold_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwe_level_skaven_stronghold_story_seven_01",
			},
			sound_events = {
				[1] = "pwe_level_skaven_stronghold_story_seven_01",
			},
			sound_events_duration = {
				[1] = 5.4389791488647,
			},
		},
		pwe_level_skaven_stronghold_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwe_level_skaven_stronghold_story_seven_02",
			},
			sound_events = {
				[1] = "pwe_level_skaven_stronghold_story_seven_02",
			},
			sound_events_duration = {
				[1] = 2.2779791355133,
			},
		},
		pwe_level_skaven_stronghold_story_seven_03 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwe_level_skaven_stronghold_story_seven_03",
			},
			sound_events = {
				[1] = "pwe_level_skaven_stronghold_story_seven_03",
			},
			sound_events_duration = {
				[1] = 1.380979180336,
			},
		},
		pwh_level_skaven_stronghold_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwh_level_skaven_stronghold_story_eight_01",
			},
			sound_events = {
				[1] = "pwh_level_skaven_stronghold_story_eight_01",
			},
			sound_events_duration = {
				[1] = 5.7709794044495,
			},
		},
		pwh_level_skaven_stronghold_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwh_level_skaven_stronghold_story_eight_02",
			},
			sound_events = {
				[1] = "pwh_level_skaven_stronghold_story_eight_02",
			},
			sound_events_duration = {
				[1] = 9.3909788131714,
			},
		},
		pwh_level_skaven_stronghold_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwh_level_skaven_stronghold_story_eleven_01",
			},
			sound_events = {
				[1] = "pwh_level_skaven_stronghold_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		pwh_level_skaven_stronghold_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwh_level_skaven_stronghold_story_five_01",
			},
			sound_events = {
				[1] = "pwh_level_skaven_stronghold_story_five_01",
			},
			sound_events_duration = {
				[1] = 6.7389793395996,
			},
		},
		pwh_level_skaven_stronghold_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwh_level_skaven_stronghold_story_four_01",
			},
			sound_events = {
				[1] = "pwh_level_skaven_stronghold_story_four_01",
			},
			sound_events_duration = {
				[1] = 4.1609792709351,
			},
		},
		pwh_level_skaven_stronghold_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwh_level_skaven_stronghold_story_four_02",
			},
			sound_events = {
				[1] = "pwh_level_skaven_stronghold_story_four_02",
			},
			sound_events_duration = {
				[1] = 7.6009793281555,
			},
		},
		pwh_level_skaven_stronghold_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwh_level_skaven_stronghold_story_one_01",
			},
			sound_events = {
				[1] = "pwh_level_skaven_stronghold_story_one_01",
			},
			sound_events_duration = {
				[1] = 9.4099788665772,
			},
		},
		pwh_level_skaven_stronghold_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwh_level_skaven_stronghold_story_one_02",
			},
			sound_events = {
				[1] = "pwh_level_skaven_stronghold_story_one_02",
			},
			sound_events_duration = {
				[1] = 5.6579790115356,
			},
		},
		pwh_level_skaven_stronghold_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwh_level_skaven_stronghold_story_two_01",
			},
			sound_events = {
				[1] = "pwh_level_skaven_stronghold_story_two_01",
			},
			sound_events_duration = {
				[1] = 3.3239998817444,
			},
		},
		pwh_level_skaven_stronghold_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwh_level_skaven_stronghold_story_two_02",
			},
			sound_events = {
				[1] = "pwh_level_skaven_stronghold_story_two_02",
			},
			sound_events_duration = {
				[1] = 9.3239793777466,
			},
		},
		pwh_level_skaven_stronghold_story_two_03 = {
			category = "story_talk",
			database = "hero_conversations_skaven_stronghold",
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
				[1] = "pwh_level_skaven_stronghold_story_two_03",
			},
			sound_events = {
				[1] = "pwh_level_skaven_stronghold_story_two_03",
			},
			sound_events_duration = {
				[1] = 2.7699999809265,
			},
		},
	})
end
