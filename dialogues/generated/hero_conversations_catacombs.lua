-- chunkname: @dialogues/generated/hero_conversations_catacombs.lua

return function ()
	define_rule({
		name = "pbw_level_catacombs_story_eight_01",
		response = "pbw_level_catacombs_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_catacombs_story_eight_02",
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
		name = "pbw_level_catacombs_story_eleven_01",
		response = "pbw_level_catacombs_story_eleven_01",
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_catacombs_hear_chanting",
				OP.NOT,
				"time_since_catacombs_hear_chanting",
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
				"once_per_level_pbw_level_catacombs_story_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_catacombs_story_eleven_01",
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
		name = "pbw_level_catacombs_story_eleven_02",
		response = "pbw_level_catacombs_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_catacombs_story_eleven_01",
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
		name = "pbw_level_catacombs_story_five_01",
		response = "pbw_level_catacombs_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_catacombs_story_five_01",
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
		name = "pbw_level_catacombs_story_five_02",
		response = "pbw_level_catacombs_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_catacombs_story_five_02",
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
		name = "pbw_level_catacombs_story_one_01",
		response = "pbw_level_catacombs_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_catacombs_story_one_01",
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
		name = "pbw_level_catacombs_story_one_02",
		response = "pbw_level_catacombs_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_catacombs_story_one_02",
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
		name = "pbw_level_catacombs_story_seven_01",
		response = "pbw_level_catacombs_story_seven_01",
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
				"time_since_catacombs_hear_chanting",
				OP.NOT,
				"time_since_catacombs_hear_chanting",
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
				"once_per_level_pbw_level_catacombs_story_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_catacombs_story_seven_01",
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
		name = "pbw_level_catacombs_story_seven_02",
		response = "pbw_level_catacombs_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_catacombs_story_seven_01",
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
		name = "pbw_level_catacombs_story_ten_01",
		response = "pbw_level_catacombs_story_ten_01",
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
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_catacombs_hear_chanting",
				OP.NOT,
				"time_since_catacombs_hear_chanting",
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
				"once_per_level_pbw_level_catacombs_story_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_catacombs_story_ten_01",
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
		name = "pbw_level_catacombs_story_ten_02",
		response = "pbw_level_catacombs_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_catacombs_story_ten_01",
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
		name = "pbw_level_catacombs_story_ten_03",
		response = "pbw_level_catacombs_story_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_catacombs_story_ten_01",
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
		name = "pdr_level_catacombs_story_eight_01",
		response = "pdr_level_catacombs_story_eight_01",
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_catacombs_hear_chanting",
				OP.NOT,
				"time_since_catacombs_hear_chanting",
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
				"once_per_level_pdr_level_catacombs_story_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_catacombs_story_eight_01",
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
		name = "pdr_level_catacombs_story_eight_02",
		response = "pdr_level_catacombs_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_catacombs_story_eight_01",
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
		name = "pdr_level_catacombs_story_eight_03",
		response = "pdr_level_catacombs_story_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_eight_01",
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
		name = "pdr_level_catacombs_story_six_01",
		response = "pdr_level_catacombs_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_catacombs_story_six_01",
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
		name = "pdr_level_catacombs_story_six_02",
		response = "pdr_level_catacombs_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_catacombs_story_six_02",
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
		name = "pdr_level_catacombs_story_ten_01",
		response = "pdr_level_catacombs_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_ten_02",
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
		name = "pdr_level_catacombs_story_three_01",
		response = "pdr_level_catacombs_story_three_01",
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
				"pdr_level_catacombs_story_three_01",
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
				120,
			},
			{
				"faction_memory",
				"once_per_level_pdr_level_catacombs_story_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_catacombs_story_three_01",
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
		name = "pes_level_catacombs_story_eight_01",
		response = "pes_level_catacombs_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_catacombs_story_eight_01",
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
		name = "pes_level_catacombs_story_eleven_01",
		response = "pes_level_catacombs_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_eleven_01",
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
		name = "pes_level_catacombs_story_four_01",
		response = "pes_level_catacombs_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_catacombs_story_four_01",
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
		name = "pes_level_catacombs_story_four_02",
		response = "pes_level_catacombs_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_catacombs_story_four_02",
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
		name = "pes_level_catacombs_story_nine_01",
		response = "pes_level_catacombs_story_nine_01",
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
				"time_since_catacombs_hear_chanting",
				OP.NOT,
				"time_since_catacombs_hear_chanting",
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
				"once_per_level_pes_level_catacombs_story_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_catacombs_story_nine_01",
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
		name = "pes_level_catacombs_story_nine_02",
		response = "pes_level_catacombs_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_catacombs_story_nine_01",
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
		name = "pes_level_catacombs_story_nine_03",
		response = "pes_level_catacombs_story_nine_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_catacombs_story_nine_02",
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
		name = "pes_level_catacombs_story_one_01",
		response = "pes_level_catacombs_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"user_context",
				"item_tag",
				OP.EQ,
				"pes_level_catacombs_story_one_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_catacombs_story_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_catacombs_story_one_01",
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
		name = "pes_level_catacombs_story_one_02",
		response = "pes_level_catacombs_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_one_01",
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
		name = "pes_level_catacombs_story_six_01",
		response = "pes_level_catacombs_story_six_01",
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
				"faction_memory",
				"time_since_catacombs_hear_chanting",
				OP.NOT,
				"time_since_catacombs_hear_chanting",
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
				"once_per_level_pes_level_catacombs_story_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_catacombs_story_six_01",
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
		name = "pes_level_catacombs_story_six_02",
		response = "pes_level_catacombs_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_catacombs_story_six_01",
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
		name = "pes_level_catacombs_story_three_01",
		response = "pes_level_catacombs_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_catacombs_story_three_01",
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
		name = "pwe_level_catacombs_story_four_01",
		response = "pwe_level_catacombs_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"user_context",
				"item_tag",
				OP.EQ,
				"pwe_level_catacombs_story_four_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"once_per_level_pwe_level_catacombs_story_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_catacombs_story_four_01",
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
		name = "pwe_level_catacombs_story_four_02",
		response = "pwe_level_catacombs_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_catacombs_story_four_01",
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
		name = "pwe_level_catacombs_story_four_03",
		response = "pwe_level_catacombs_story_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_catacombs_story_four_02",
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
		name = "pwe_level_catacombs_story_seven_01",
		response = "pwe_level_catacombs_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_seven_01",
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
		name = "pwe_level_catacombs_story_ten_01",
		response = "pwe_level_catacombs_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_ten_01",
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
		name = "pwe_level_catacombs_story_two_01",
		response = "pwe_level_catacombs_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_catacombs_story_two_01",
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
		name = "pwe_level_catacombs_story_two_02",
		response = "pwe_level_catacombs_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_catacombs_story_two_02",
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
		name = "pwh_level_catacombs_story_eleven_01",
		response = "pwh_level_catacombs_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_catacombs_story_eleven_01",
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
		name = "pwh_level_catacombs_story_eleven_02",
		response = "pwh_level_catacombs_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_eleven_02",
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
		name = "pwh_level_catacombs_story_five_01",
		response = "pwh_level_catacombs_story_five_01",
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
				"time_since_catacombs_hear_chanting",
				OP.NOT,
				"time_since_catacombs_hear_chanting",
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
				"once_per_level_pbw_level_catacombs_story_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_catacombs_story_ten_01",
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
		name = "pwh_level_catacombs_story_five_02",
		response = "pwh_level_catacombs_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_five_01",
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
		name = "pwh_level_catacombs_story_nine_01",
		response = "pwh_level_catacombs_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_catacombs_story_nine_01",
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
		name = "pwh_level_catacombs_story_nine_02",
		response = "pwh_level_catacombs_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_catacombs_story_nine_02",
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
		name = "pwh_level_catacombs_story_seven_01",
		response = "pwh_level_catacombs_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_catacombs_story_seven_01",
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
		name = "pwh_level_catacombs_story_seven_02",
		response = "pwh_level_catacombs_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_seven_02",
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
		name = "pwh_level_catacombs_story_three_01",
		response = "pwh_level_catacombs_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_catacombs_story_three_01",
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
		name = "pwh_level_catacombs_story_two_01",
		response = "pwh_level_catacombs_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"user_context",
				"item_tag",
				OP.EQ,
				"pwh_level_catacombs_story_two_01",
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
				"once_per_level_pwh_level_catacombs_story_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_catacombs_story_two_01",
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
		name = "pwh_level_catacombs_story_two_02",
		response = "pwh_level_catacombs_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_catacombs_story_two_01",
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
		name = "pwh_level_catacombs_story_two_03",
		response = "pwh_level_catacombs_story_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_catacombs_story_two_02",
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
		pbw_level_catacombs_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_catacombs_story_eight_01",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_eight_01",
			},
			sound_events_duration = {
				[1] = 2.5752708911896,
			},
		},
		pbw_level_catacombs_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
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
				[1] = "pbw_level_catacombs_story_eleven_01",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 4.6247081756592,
			},
		},
		pbw_level_catacombs_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_catacombs_story_eleven_02",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 4.3098125457764,
			},
		},
		pbw_level_catacombs_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_catacombs_story_five_01",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_five_01",
			},
			sound_events_duration = {
				[1] = 2.5963957309723,
			},
		},
		pbw_level_catacombs_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_catacombs_story_five_02",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_five_02",
			},
			sound_events_duration = {
				[1] = 1.3918124437332,
			},
		},
		pbw_level_catacombs_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_catacombs_story_one_01",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_one_01",
			},
			sound_events_duration = {
				[1] = 2.4395208358765,
			},
		},
		pbw_level_catacombs_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_catacombs_story_one_02",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_one_02",
			},
			sound_events_duration = {
				[1] = 5.9745831489563,
			},
		},
		pbw_level_catacombs_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
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
				[1] = "pbw_level_catacombs_story_seven_01",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_seven_01",
			},
			sound_events_duration = {
				[1] = 2.464145898819,
			},
		},
		pbw_level_catacombs_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_catacombs_story_seven_02",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_seven_02",
			},
			sound_events_duration = {
				[1] = 2.3255000114441,
			},
		},
		pbw_level_catacombs_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
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
				[1] = "pbw_level_catacombs_story_ten_01",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_ten_01",
			},
			sound_events_duration = {
				[1] = 2.6924374103546,
			},
		},
		pbw_level_catacombs_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_catacombs_story_ten_02",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_ten_02",
			},
			sound_events_duration = {
				[1] = 1.9482707977295,
			},
		},
		pbw_level_catacombs_story_ten_03 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_catacombs_story_ten_03",
			},
			sound_events = {
				[1] = "pbw_level_catacombs_story_ten_03",
			},
			sound_events_duration = {
				[1] = 8.8697919845581,
			},
		},
		pdr_level_catacombs_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
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
				[1] = "pdr_level_catacombs_story_eight_01",
			},
			sound_events = {
				[1] = "pdr_level_catacombs_story_eight_01",
			},
			sound_events_duration = {
				[1] = 5.3439168930054,
			},
		},
		pdr_level_catacombs_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_catacombs_story_eight_02",
			},
			sound_events = {
				[1] = "pdr_level_catacombs_story_eight_02",
			},
			sound_events_duration = {
				[1] = 5.2941875457764,
			},
		},
		pdr_level_catacombs_story_eight_03 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_catacombs_story_eight_03",
			},
			sound_events = {
				[1] = "pdr_level_catacombs_story_eight_03",
			},
			sound_events_duration = {
				[1] = 4.9213333129883,
			},
		},
		pdr_level_catacombs_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_catacombs_story_six_01",
			},
			sound_events = {
				[1] = "pdr_level_catacombs_story_six_01",
			},
			sound_events_duration = {
				[1] = 4.7378540039063,
			},
		},
		pdr_level_catacombs_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_catacombs_story_six_02",
			},
			sound_events = {
				[1] = "pdr_level_catacombs_story_six_02",
			},
			sound_events_duration = {
				[1] = 3.3499999046326,
			},
		},
		pdr_level_catacombs_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_catacombs_story_ten_01",
			},
			sound_events = {
				[1] = "pdr_level_catacombs_story_ten_01",
			},
			sound_events_duration = {
				[1] = 4.4097084999084,
			},
		},
		pdr_level_catacombs_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
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
				[1] = "pdr_level_catacombs_story_three_01",
			},
			sound_events = {
				[1] = "pdr_level_catacombs_story_three_01",
			},
			sound_events_duration = {
				[1] = 1.9634166955948,
			},
		},
		pes_level_catacombs_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_catacombs_story_eight_01",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_eight_01",
			},
			sound_events_duration = {
				[1] = 4.8716249465942,
			},
		},
		pes_level_catacombs_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_catacombs_story_eleven_01",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.9698958396912,
			},
		},
		pes_level_catacombs_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_catacombs_story_four_01",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_four_01",
			},
			sound_events_duration = {
				[1] = 2.5377292633057,
			},
		},
		pes_level_catacombs_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_catacombs_story_four_02",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_four_02",
			},
			sound_events_duration = {
				[1] = 5.0665626525879,
			},
		},
		pes_level_catacombs_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
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
				[1] = "pes_level_catacombs_story_nine_01",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_nine_01",
			},
			sound_events_duration = {
				[1] = 5.4216666221619,
			},
		},
		pes_level_catacombs_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_catacombs_story_nine_02",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_nine_02",
			},
			sound_events_duration = {
				[1] = 5.9415729045868,
			},
		},
		pes_level_catacombs_story_nine_03 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_catacombs_story_nine_03",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_nine_03",
			},
			sound_events_duration = {
				[1] = 2.3159583806992,
			},
		},
		pes_level_catacombs_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_level_catacombs_story_one_01",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_one_01",
			},
			sound_events_duration = {
				[1] = 3.5661458969116,
			},
		},
		pes_level_catacombs_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_catacombs_story_one_02",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_one_02",
			},
			sound_events_duration = {
				[1] = 3.5216250419617,
			},
		},
		pes_level_catacombs_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
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
				[1] = "pes_level_catacombs_story_six_01",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_six_01",
			},
			sound_events_duration = {
				[1] = 8.387749671936,
			},
		},
		pes_level_catacombs_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_catacombs_story_six_02",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_six_02",
			},
			sound_events_duration = {
				[1] = 2.179229259491,
			},
		},
		pes_level_catacombs_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_catacombs_story_three_01",
			},
			sound_events = {
				[1] = "pes_level_catacombs_story_three_01",
			},
			sound_events_duration = {
				[1] = 7.7062706947327,
			},
		},
		pwe_level_catacombs_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
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
				[1] = "pwe_level_catacombs_story_four_01",
			},
			sound_events = {
				[1] = "pwe_level_catacombs_story_four_01",
			},
			sound_events_duration = {
				[1] = 5.7124376296997,
			},
		},
		pwe_level_catacombs_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_catacombs_story_four_02",
			},
			sound_events = {
				[1] = "pwe_level_catacombs_story_four_02",
			},
			sound_events_duration = {
				[1] = 4.3793959617615,
			},
		},
		pwe_level_catacombs_story_four_03 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_catacombs_story_four_03",
			},
			sound_events = {
				[1] = "pwe_level_catacombs_story_four_03",
			},
			sound_events_duration = {
				[1] = 4.4566249847412,
			},
		},
		pwe_level_catacombs_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_catacombs_story_seven_01",
			},
			sound_events = {
				[1] = "pwe_level_catacombs_story_seven_01",
			},
			sound_events_duration = {
				[1] = 9.717604637146,
			},
		},
		pwe_level_catacombs_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_catacombs_story_ten_01",
			},
			sound_events = {
				[1] = "pwe_level_catacombs_story_ten_01",
			},
			sound_events_duration = {
				[1] = 3.2149999141693,
			},
		},
		pwe_level_catacombs_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_catacombs_story_two_01",
			},
			sound_events = {
				[1] = "pwe_level_catacombs_story_two_01",
			},
			sound_events_duration = {
				[1] = 3.7436666488648,
			},
		},
		pwe_level_catacombs_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_catacombs_story_two_02",
			},
			sound_events = {
				[1] = "pwe_level_catacombs_story_two_02",
			},
			sound_events_duration = {
				[1] = 5.0349793434143,
			},
		},
		pwh_level_catacombs_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_catacombs_story_eleven_01",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 5.972770690918,
			},
		},
		pwh_level_catacombs_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwh_level_catacombs_story_eleven_02",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 5.7919373512268,
			},
		},
		pwh_level_catacombs_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
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
				[1] = "pwh_level_catacombs_story_five_01",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_five_01",
			},
			sound_events_duration = {
				[1] = 6.390166759491,
			},
		},
		pwh_level_catacombs_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_catacombs_story_five_02",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_five_02",
			},
			sound_events_duration = {
				[1] = 11.502854347229,
			},
		},
		pwh_level_catacombs_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_catacombs_story_nine_01",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_nine_01",
			},
			sound_events_duration = {
				[1] = 7.5825414657593,
			},
		},
		pwh_level_catacombs_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_catacombs_story_nine_02",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_nine_02",
			},
			sound_events_duration = {
				[1] = 1.3735417127609,
			},
		},
		pwh_level_catacombs_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_catacombs_story_seven_01",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_seven_01",
			},
			sound_events_duration = {
				[1] = 2.660395860672,
			},
		},
		pwh_level_catacombs_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_catacombs_story_seven_02",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_seven_02",
			},
			sound_events_duration = {
				[1] = 3.5850832462311,
			},
		},
		pwh_level_catacombs_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_catacombs_story_three_01",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_three_01",
			},
			sound_events_duration = {
				[1] = 4.1527915000916,
			},
		},
		pwh_level_catacombs_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
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
				[1] = "pwh_level_catacombs_story_two_01",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_two_01",
			},
			sound_events_duration = {
				[1] = 2.9936666488648,
			},
		},
		pwh_level_catacombs_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_catacombs_story_two_02",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_two_02",
			},
			sound_events_duration = {
				[1] = 3.5999999046326,
			},
		},
		pwh_level_catacombs_story_two_03 = {
			category = "story_talk",
			database = "hero_conversations_catacombs",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_catacombs_story_two_03",
			},
			sound_events = {
				[1] = "pwh_level_catacombs_story_two_03",
			},
			sound_events_duration = {
				[1] = 3.4231667518616,
			},
		},
	})
end
