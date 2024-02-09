-- chunkname: @dialogues/generated/hero_conversations_nurgle.lua

return function ()
	define_rule({
		name = "pbw_level_nurgle_story_eleven_01",
		response = "pbw_level_nurgle_story_eleven_01",
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
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_eleven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_eleven",
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
		name = "pbw_level_nurgle_story_five_01",
		response = "pbw_level_nurgle_story_five_01",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_five",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_five",
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
		name = "pbw_level_nurgle_story_five_02",
		response = "pbw_level_nurgle_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_nurgle_story_five_01",
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
		name = "pbw_level_nurgle_story_four_01",
		response = "pbw_level_nurgle_story_four_01",
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_four",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_four",
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
		name = "pbw_level_nurgle_story_seven_01",
		response = "pbw_level_nurgle_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_nurgle_story_seven_02",
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
		name = "pbw_level_nurgle_story_six_01",
		response = "pbw_level_nurgle_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_nurgle_story_six_01",
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
		name = "pbw_level_nurgle_story_six_02",
		response = "pbw_level_nurgle_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_nurgle_story_six_02",
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
		name = "pbw_level_nurgle_story_ten_01",
		response = "pbw_level_nurgle_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_nurgle_story_ten_01",
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
		name = "pbw_level_nurgle_story_three_01",
		response = "pbw_level_nurgle_story_three_01",
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
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_three",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_three",
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
		name = "pbw_level_nurgle_story_twelve_01",
		response = "pbw_level_nurgle_story_twelve_01",
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_twelve",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_twelve",
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
		name = "pbw_level_nurgle_story_twelve_02",
		response = "pbw_level_nurgle_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_nurgle_story_twelve_01",
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
		name = "pdr_level_nurgle_story_eight_01",
		response = "pdr_level_nurgle_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_nurgle_story_eight_01",
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
		name = "pdr_level_nurgle_story_eight_02",
		response = "pdr_level_nurgle_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_nurgle_story_eight_01",
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
		name = "pdr_level_nurgle_story_five_01",
		response = "pdr_level_nurgle_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_nurgle_story_five_02",
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
		name = "pdr_level_nurgle_story_four_01",
		response = "pdr_level_nurgle_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_nurgle_story_four_01",
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
		name = "pdr_level_nurgle_story_nine_01",
		response = "pdr_level_nurgle_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_nurgle_story_nine_01",
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
		name = "pdr_level_nurgle_story_nine_02",
		response = "pdr_level_nurgle_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_nurgle_story_nine_01",
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
		name = "pdr_level_nurgle_story_six_01",
		response = "pdr_level_nurgle_story_six_01",
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_six",
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
		name = "pdr_level_nurgle_story_six_02",
		response = "pdr_level_nurgle_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_nurgle_story_six_01",
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
		name = "pdr_level_nurgle_story_six_03",
		response = "pdr_level_nurgle_story_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_nurgle_story_six_02",
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
		name = "pdr_level_nurgle_story_ten_01",
		response = "pdr_level_nurgle_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_nurgle_story_ten_02",
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
		name = "pdr_level_nurgle_story_twelve_01",
		response = "pdr_level_nurgle_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_nurgle_story_twelve_01",
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
		name = "pdr_level_nurgle_story_two_01",
		response = "pdr_level_nurgle_story_two_01",
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
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_two",
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
		name = "pdr_level_nurgle_story_two_02",
		response = "pdr_level_nurgle_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_nurgle_story_two_01",
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
		name = "pes_level_nurgle_story_eight_01",
		response = "pes_level_nurgle_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_nurgle_story_eight_01",
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
		name = "pes_level_nurgle_story_four_01",
		response = "pes_level_nurgle_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_nurgle_story_four_01",
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
		name = "pes_level_nurgle_story_four_02",
		response = "pes_level_nurgle_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_nurgle_story_four_01",
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
		name = "pes_level_nurgle_story_one_01",
		response = "pes_level_nurgle_story_one_01",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_one",
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
		name = "pes_level_nurgle_story_one_02",
		response = "pes_level_nurgle_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_nurgle_story_one_01",
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
		name = "pes_level_nurgle_story_ten_01",
		response = "pes_level_nurgle_story_ten_01",
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_ten",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_ten",
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
		name = "pes_level_nurgle_story_ten_02",
		response = "pes_level_nurgle_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_nurgle_story_ten_01",
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
		name = "pes_level_nurgle_story_twelve_01",
		response = "pes_level_nurgle_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_nurgle_story_twelve_02",
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
		name = "pes_level_nurgle_story_two_01",
		response = "pes_level_nurgle_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_nurgle_story_two_01",
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
		name = "pwe_level_nurgle_story_eight_01",
		response = "pwe_level_nurgle_story_eight_01",
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
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_eight",
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
		name = "pwe_level_nurgle_story_eleven_01",
		response = "pwe_level_nurgle_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_nurgle_story_eleven_01",
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
		name = "pwe_level_nurgle_story_eleven_02",
		response = "pwe_level_nurgle_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_nurgle_story_eleven_01",
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
		name = "pwe_level_nurgle_story_five_01",
		response = "pwe_level_nurgle_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_nurgle_story_five_01",
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
		name = "pwe_level_nurgle_story_nine_01",
		response = "pwe_level_nurgle_story_nine_01",
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
				"dwarf_ranger",
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
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_nine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_nine",
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
		name = "pwe_level_nurgle_story_one_01",
		response = "pwe_level_nurgle_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_nurgle_story_one_02",
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
		name = "pwe_level_nurgle_story_seven_01",
		response = "pwe_level_nurgle_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_nurgle_story_seven_01",
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
		name = "pwe_level_nurgle_story_three_01",
		response = "pwe_level_nurgle_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_nurgle_story_three_01",
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
		name = "pwh_level_nurgle_story_eleven_01",
		response = "pwh_level_nurgle_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_nurgle_story_eleven_01",
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
		name = "pwh_level_nurgle_story_nine_01",
		response = "pwh_level_nurgle_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_nurgle_story_nine_01",
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
		name = "pwh_level_nurgle_story_one_01",
		response = "pwh_level_nurgle_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_nurgle_story_one_01",
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
		name = "pwh_level_nurgle_story_seven_01",
		response = "pwh_level_nurgle_story_seven_01",
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_nurgle_spotting_objective",
				OP.NOT,
				"level_nurgle_spotting_objective",
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
				"nurgle_story_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_story_seven",
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
		name = "pwh_level_nurgle_story_seven_02",
		response = "pwh_level_nurgle_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_nurgle_story_seven_01",
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
		name = "pwh_level_nurgle_story_seven_03",
		response = "pwh_level_nurgle_story_seven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_nurgle_story_seven_01",
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
		name = "pwh_level_nurgle_story_three_01",
		response = "pwh_level_nurgle_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_nurgle_story_three_01",
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
		name = "pwh_level_nurgle_story_three_02",
		response = "pwh_level_nurgle_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_nurgle_story_three_01",
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
		name = "pwh_level_nurgle_story_two_01",
		response = "pwh_level_nurgle_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_nurgle_story_two_01",
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
		pbw_level_nurgle_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pbw_level_nurgle_story_eleven_01",
			},
			sound_events = {
				[1] = "pbw_level_nurgle_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.1259791851044,
			},
		},
		pbw_level_nurgle_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pbw_level_nurgle_story_five_01",
			},
			sound_events = {
				[1] = "pbw_level_nurgle_story_five_01",
			},
			sound_events_duration = {
				[1] = 3.4009792804718,
			},
		},
		pbw_level_nurgle_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_nurgle_story_five_02",
			},
			sound_events = {
				[1] = "pbw_level_nurgle_story_five_02",
			},
			sound_events_duration = {
				[1] = 0.966000020504,
			},
		},
		pbw_level_nurgle_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pbw_level_nurgle_story_four_01",
			},
			sound_events = {
				[1] = "pbw_level_nurgle_story_four_01",
			},
			sound_events_duration = {
				[1] = 6.205979347229,
			},
		},
		pbw_level_nurgle_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_nurgle_story_seven_01",
			},
			sound_events = {
				[1] = "pbw_level_nurgle_story_seven_01",
			},
			sound_events_duration = {
				[1] = 4.2170000076294,
			},
		},
		pbw_level_nurgle_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_nurgle_story_six_01",
			},
			sound_events = {
				[1] = "pbw_level_nurgle_story_six_01",
			},
			sound_events_duration = {
				[1] = 7.1819791793823,
			},
		},
		pbw_level_nurgle_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_nurgle_story_six_02",
			},
			sound_events = {
				[1] = "pbw_level_nurgle_story_six_02",
			},
			sound_events_duration = {
				[1] = 3.7269792556763,
			},
		},
		pbw_level_nurgle_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_nurgle_story_ten_01",
			},
			sound_events = {
				[1] = "pbw_level_nurgle_story_ten_01",
			},
			sound_events_duration = {
				[1] = 5.2489790916443,
			},
		},
		pbw_level_nurgle_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pbw_level_nurgle_story_three_01",
			},
			sound_events = {
				[1] = "pbw_level_nurgle_story_three_01",
			},
			sound_events_duration = {
				[1] = 6.3249793052673,
			},
		},
		pbw_level_nurgle_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pbw_level_nurgle_story_twelve_01",
			},
			sound_events = {
				[1] = "pbw_level_nurgle_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.8499791622162,
			},
		},
		pbw_level_nurgle_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_nurgle_story_twelve_02",
			},
			sound_events = {
				[1] = "pbw_level_nurgle_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 3.6919791698456,
			},
		},
		pdr_level_nurgle_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_nurgle_story_eight_01",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_eight_01",
			},
			sound_events_duration = {
				[1] = 2.9179999828339,
			},
		},
		pdr_level_nurgle_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_nurgle_story_eight_02",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_eight_02",
			},
			sound_events_duration = {
				[1] = 7.0949792861939,
			},
		},
		pdr_level_nurgle_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_nurgle_story_five_01",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_five_01",
			},
			sound_events_duration = {
				[1] = 7.4909791946411,
			},
		},
		pdr_level_nurgle_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_nurgle_story_four_01",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_four_01",
			},
			sound_events_duration = {
				[1] = 6.6209998130798,
			},
		},
		pdr_level_nurgle_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_nurgle_story_nine_01",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_nine_01",
			},
			sound_events_duration = {
				[1] = 4.1329793930054,
			},
		},
		pdr_level_nurgle_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_nurgle_story_nine_02",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_nine_02",
			},
			sound_events_duration = {
				[1] = 5.4269790649414,
			},
		},
		pdr_level_nurgle_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pdr_level_nurgle_story_six_01",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_six_01",
			},
			sound_events_duration = {
				[1] = 6.6439790725708,
			},
		},
		pdr_level_nurgle_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_nurgle_story_six_02",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_six_02",
			},
			sound_events_duration = {
				[1] = 7.7249794006348,
			},
		},
		pdr_level_nurgle_story_six_03 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_nurgle_story_six_03",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_six_03",
			},
			sound_events_duration = {
				[1] = 3.7239792346954,
			},
		},
		pdr_level_nurgle_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_nurgle_story_ten_01",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_ten_01",
			},
			sound_events_duration = {
				[1] = 6.2899789810181,
			},
		},
		pdr_level_nurgle_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_nurgle_story_twelve_01",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 1.8270000219345,
			},
		},
		pdr_level_nurgle_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pdr_level_nurgle_story_two_01",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_two_01",
			},
			sound_events_duration = {
				[1] = 4.9460000991821,
			},
		},
		pdr_level_nurgle_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_nurgle_story_two_02",
			},
			sound_events = {
				[1] = "pdr_level_nurgle_story_two_02",
			},
			sound_events_duration = {
				[1] = 2.8019790649414,
			},
		},
		pes_level_nurgle_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_story_eight_01",
			},
			sound_events = {
				[1] = "pes_level_nurgle_story_eight_01",
			},
			sound_events_duration = {
				[1] = 2.618979215622,
			},
		},
		pes_level_nurgle_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_story_four_01",
			},
			sound_events = {
				[1] = "pes_level_nurgle_story_four_01",
			},
			sound_events_duration = {
				[1] = 6.9579792022705,
			},
		},
		pes_level_nurgle_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_story_four_02",
			},
			sound_events = {
				[1] = "pes_level_nurgle_story_four_02",
			},
			sound_events_duration = {
				[1] = 7.6679792404175,
			},
		},
		pes_level_nurgle_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pes_level_nurgle_story_one_01",
			},
			sound_events = {
				[1] = "pes_level_nurgle_story_one_01",
			},
			sound_events_duration = {
				[1] = 3.9100000858307,
			},
		},
		pes_level_nurgle_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_story_one_02",
			},
			sound_events = {
				[1] = "pes_level_nurgle_story_one_02",
			},
			sound_events_duration = {
				[1] = 1.4919791221619,
			},
		},
		pes_level_nurgle_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pes_level_nurgle_story_ten_01",
			},
			sound_events = {
				[1] = "pes_level_nurgle_story_ten_01",
			},
			sound_events_duration = {
				[1] = 5.4059791564941,
			},
		},
		pes_level_nurgle_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_story_ten_02",
			},
			sound_events = {
				[1] = "pes_level_nurgle_story_ten_02",
			},
			sound_events_duration = {
				[1] = 4.2609791755676,
			},
		},
		pes_level_nurgle_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_story_twelve_01",
			},
			sound_events = {
				[1] = "pes_level_nurgle_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.4499790668488,
			},
		},
		pes_level_nurgle_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_story_two_01",
			},
			sound_events = {
				[1] = "pes_level_nurgle_story_two_01",
			},
			sound_events_duration = {
				[1] = 1.6739791631699,
			},
		},
		pwe_level_nurgle_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pwe_level_nurgle_story_eight_01",
			},
			sound_events = {
				[1] = "pwe_level_nurgle_story_eight_01",
			},
			sound_events_duration = {
				[1] = 9.7679796218872,
			},
		},
		pwe_level_nurgle_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_nurgle_story_eleven_01",
			},
			sound_events = {
				[1] = "pwe_level_nurgle_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 5.8919792175293,
			},
		},
		pwe_level_nurgle_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_nurgle_story_eleven_02",
			},
			sound_events = {
				[1] = "pwe_level_nurgle_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 6.419979095459,
			},
		},
		pwe_level_nurgle_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_nurgle_story_five_01",
			},
			sound_events = {
				[1] = "pwe_level_nurgle_story_five_01",
			},
			sound_events_duration = {
				[1] = 6.3629789352417,
			},
		},
		pwe_level_nurgle_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pwe_level_nurgle_story_nine_01",
			},
			sound_events = {
				[1] = "pwe_level_nurgle_story_nine_01",
			},
			sound_events_duration = {
				[1] = 4.1809792518616,
			},
		},
		pwe_level_nurgle_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_nurgle_story_one_01",
			},
			sound_events = {
				[1] = "pwe_level_nurgle_story_one_01",
			},
			sound_events_duration = {
				[1] = 6.0029792785644,
			},
		},
		pwe_level_nurgle_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_nurgle_story_seven_01",
			},
			sound_events = {
				[1] = "pwe_level_nurgle_story_seven_01",
			},
			sound_events_duration = {
				[1] = 3.2909791469574,
			},
		},
		pwe_level_nurgle_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_nurgle_story_three_01",
			},
			sound_events = {
				[1] = "pwe_level_nurgle_story_three_01",
			},
			sound_events_duration = {
				[1] = 4.2709794044495,
			},
		},
		pwh_level_nurgle_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_story_eleven_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 5.8209791183472,
			},
		},
		pwh_level_nurgle_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_story_nine_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_story_nine_01",
			},
			sound_events_duration = {
				[1] = 3.6229791641235,
			},
		},
		pwh_level_nurgle_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_story_one_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_story_one_01",
			},
			sound_events_duration = {
				[1] = 6.0909790992737,
			},
		},
		pwh_level_nurgle_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
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
				[1] = "pwh_level_nurgle_story_seven_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_story_seven_01",
			},
			sound_events_duration = {
				[1] = 8.1529788970947,
			},
		},
		pwh_level_nurgle_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_story_seven_02",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_story_seven_02",
			},
			sound_events_duration = {
				[1] = 7.580979347229,
			},
		},
		pwh_level_nurgle_story_seven_03 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_story_seven_03",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_story_seven_03",
			},
			sound_events_duration = {
				[1] = 6.0389790534973,
			},
		},
		pwh_level_nurgle_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_story_three_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_story_three_01",
			},
			sound_events_duration = {
				[1] = 4.2409791946411,
			},
		},
		pwh_level_nurgle_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_story_three_02",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_story_three_02",
			},
			sound_events_duration = {
				[1] = 7.6559791564941,
			},
		},
		pwh_level_nurgle_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_story_two_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_story_two_01",
			},
			sound_events_duration = {
				[1] = 5.4849791526794,
			},
		},
	})
end
