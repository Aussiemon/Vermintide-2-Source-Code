-- chunkname: @dialogues/generated/hero_conversations_bell.lua

return function ()
	define_rule({
		name = "pbw_level_bell_story_eight_01",
		response = "pbw_level_bell_story_eight_01",
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_eight",
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
		name = "pbw_level_bell_story_eight_02",
		response = "pbw_level_bell_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_bell_story_eight_01",
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
		name = "pbw_level_bell_story_five_01",
		response = "pbw_level_bell_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_bell_story_five_01",
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
		name = "pbw_level_bell_story_seven_01",
		response = "pbw_level_bell_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_bell_story_seven_01",
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
		name = "pbw_level_bell_story_seven_02",
		response = "pbw_level_bell_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_bell_story_seven_02",
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
		name = "pbw_level_bell_story_three_01",
		response = "pbw_level_bell_story_three_01",
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
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_three",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_three",
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
		name = "pbw_level_bell_story_three_02",
		response = "pbw_level_bell_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bell_story_three_01",
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
		name = "pdr_level_bell_story_eight_01",
		response = "pdr_level_bell_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bell_story_eight_01",
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
		name = "pdr_level_bell_story_eight_02",
		response = "pdr_level_bell_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bell_story_eight_02",
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
		name = "pdr_level_bell_story_eleven_01",
		response = "pdr_level_bell_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bell_story_eleven_01",
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
		name = "pdr_level_bell_story_five_01",
		response = "pdr_level_bell_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bell_story_five_01",
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
		name = "pdr_level_bell_story_four_01",
		response = "pdr_level_bell_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bell_story_four_02",
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
		name = "pdr_level_bell_story_seven_01",
		response = "pdr_level_bell_story_seven_01",
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
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_seven",
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
		name = "pdr_level_bell_story_seven_02",
		response = "pdr_level_bell_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bell_story_seven_01",
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
		name = "pdr_level_bell_story_seven_03",
		response = "pdr_level_bell_story_seven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bell_story_seven_02",
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
		name = "pdr_level_bell_story_twelve_01",
		response = "pdr_level_bell_story_twelve_01",
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
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_twelve",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_twelve",
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
		name = "pdr_level_bell_story_twelve_02",
		response = "pdr_level_bell_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bell_story_twelve_01",
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
		name = "pdr_level_bell_story_two_01",
		response = "pdr_level_bell_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bell_story_two_01",
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
		name = "pdr_level_bell_story_two_02",
		response = "pdr_level_bell_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bell_story_two_02",
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
		name = "pes_level_bell_story_eleven_01",
		response = "pes_level_bell_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bell_story_eleven_01",
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
		name = "pes_level_bell_story_eleven_02",
		response = "pes_level_bell_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_bell_story_eleven_01",
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
		name = "pes_level_bell_story_five_01",
		response = "pes_level_bell_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bell_story_five_01",
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
		name = "pes_level_bell_story_four_01",
		response = "pes_level_bell_story_four_01",
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
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_four",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_four",
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
		name = "pes_level_bell_story_four_02",
		response = "pes_level_bell_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bell_story_four_01",
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
		name = "pes_level_bell_story_nine_01",
		response = "pes_level_bell_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bell_story_nine_01",
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
		name = "pes_level_bell_story_nine_02",
		response = "pes_level_bell_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bell_story_nine_02",
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
		name = "pes_level_bell_story_one_01",
		response = "pes_level_bell_story_one_01",
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
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_one",
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
		name = "pes_level_bell_story_one_02",
		response = "pes_level_bell_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bell_story_one_01",
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
		name = "pes_level_bell_story_six_01",
		response = "pes_level_bell_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bell_story_six_01",
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
		name = "pes_level_bell_story_six_02",
		response = "pes_level_bell_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bell_story_six_01",
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
		name = "pes_level_bell_story_three_01",
		response = "pes_level_bell_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bell_story_three_01",
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
		name = "pwe_level_bell_story_four_01",
		response = "pwe_level_bell_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bell_story_four_01",
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
		name = "pwe_level_bell_story_four_02",
		response = "pwe_level_bell_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_bell_story_four_01",
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
		name = "pwe_level_bell_story_six_01",
		response = "pwe_level_bell_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bell_story_six_01",
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
		name = "pwe_level_bell_story_ten_01",
		response = "pwe_level_bell_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bell_story_ten_01",
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
		name = "pwe_level_bell_story_ten_02",
		response = "pwe_level_bell_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bell_story_ten_02",
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
		name = "pwe_level_bell_story_three_01",
		response = "pwe_level_bell_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bell_story_three_02",
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
		name = "pwe_level_bell_story_twelve_01",
		response = "pwe_level_bell_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_bell_story_twelve_01",
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
		name = "pwe_level_bell_story_two_01",
		response = "pwe_level_bell_story_two_01",
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
				"faction_memory",
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_two",
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
		name = "pwe_level_bell_story_two_02",
		response = "pwe_level_bell_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_bell_story_two_01",
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
		name = "pwh_level_bell_story_eight_01",
		response = "pwh_level_bell_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bell_story_eight_01",
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
		name = "pwh_level_bell_story_eleven_01",
		response = "pwh_level_bell_story_eleven_01",
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
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_eleven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_eleven",
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
		name = "pwh_level_bell_story_five_01",
		response = "pwh_level_bell_story_five_01",
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
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_five",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_five",
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
		name = "pwh_level_bell_story_nine_01",
		response = "pwh_level_bell_story_nine_01",
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
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_nine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_nine",
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
		name = "pwh_level_bell_story_nine_02",
		response = "pwh_level_bell_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bell_story_nine_01",
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
		name = "pwh_level_bell_story_one_01",
		response = "pwh_level_bell_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bell_story_one_01",
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
		name = "pwh_level_bell_story_one_02",
		response = "pwh_level_bell_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bell_story_one_02",
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
		name = "pwh_level_bell_story_six_01",
		response = "pwh_level_bell_story_six_01",
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
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_six",
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
		name = "pwh_level_bell_story_ten_01",
		response = "pwh_level_bell_story_ten_01",
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
				"level_bell_reaching_bell",
				OP.NOT,
				"level_bell_reaching_bell",
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
				"bell_story_ten",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bell_story_ten",
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
		name = "pwh_level_bell_story_ten_02",
		response = "pwh_level_bell_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bell_story_ten_01",
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
		name = "pwh_level_bell_story_twelve_01",
		response = "pwh_level_bell_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bell_story_twelve_01",
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
		pbw_level_bell_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pbw_level_bell_story_eight_01",
			},
			sound_events = {
				[1] = "pbw_level_bell_story_eight_01",
			},
			sound_events_duration = {
				[1] = 3.772979259491,
			},
		},
		pbw_level_bell_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pbw_level_bell_story_eight_02",
			},
			sound_events = {
				[1] = "pbw_level_bell_story_eight_02",
			},
			sound_events_duration = {
				[1] = 1.5409791469574,
			},
		},
		pbw_level_bell_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pbw_level_bell_story_five_01",
			},
			sound_events = {
				[1] = "pbw_level_bell_story_five_01",
			},
			sound_events_duration = {
				[1] = 3.3869791030884,
			},
		},
		pbw_level_bell_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pbw_level_bell_story_seven_01",
			},
			sound_events = {
				[1] = "pbw_level_bell_story_seven_01",
			},
			sound_events_duration = {
				[1] = 4.0169792175293,
			},
		},
		pbw_level_bell_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pbw_level_bell_story_seven_02",
			},
			sound_events = {
				[1] = "pbw_level_bell_story_seven_02",
			},
			sound_events_duration = {
				[1] = 2.0769791603088,
			},
		},
		pbw_level_bell_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pbw_level_bell_story_three_01",
			},
			sound_events = {
				[1] = "pbw_level_bell_story_three_01",
			},
			sound_events_duration = {
				[1] = 5.0899791717529,
			},
		},
		pbw_level_bell_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pbw_level_bell_story_three_02",
			},
			sound_events = {
				[1] = "pbw_level_bell_story_three_02",
			},
			sound_events_duration = {
				[1] = 6.3549790382385,
			},
		},
		pdr_level_bell_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_eight_01",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_eight_01",
			},
			sound_events_duration = {
				[1] = 5.8519792556763,
			},
		},
		pdr_level_bell_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_eight_02",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_eight_02",
			},
			sound_events_duration = {
				[1] = 2.8569791316986,
			},
		},
		pdr_level_bell_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_eleven_01",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 6.2299790382385,
			},
		},
		pdr_level_bell_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_five_01",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_five_01",
			},
			sound_events_duration = {
				[1] = 12.694978713989,
			},
		},
		pdr_level_bell_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_four_01",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_four_01",
			},
			sound_events_duration = {
				[1] = 9.9939794540405,
			},
		},
		pdr_level_bell_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_seven_01",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_seven_01",
			},
			sound_events_duration = {
				[1] = 6.2749791145325,
			},
		},
		pdr_level_bell_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_seven_02",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_seven_02",
			},
			sound_events_duration = {
				[1] = 5.8889789581299,
			},
		},
		pdr_level_bell_story_seven_03 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_seven_03",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_seven_03",
			},
			sound_events_duration = {
				[1] = 2.0479791164398,
			},
		},
		pdr_level_bell_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_twelve_01",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 5.6399793624878,
			},
		},
		pdr_level_bell_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_twelve_02",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 6.6389789581299,
			},
		},
		pdr_level_bell_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_two_01",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_two_01",
			},
			sound_events_duration = {
				[1] = 2.7399792671204,
			},
		},
		pdr_level_bell_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pdr_level_bell_story_two_02",
			},
			sound_events = {
				[1] = "pdr_level_bell_story_two_02",
			},
			sound_events_duration = {
				[1] = 3.6329791545868,
			},
		},
		pes_level_bell_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_eleven_01",
			},
			sound_events = {
				[1] = "pes_level_bell_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 4.39297914505,
			},
		},
		pes_level_bell_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_eleven_02",
			},
			sound_events = {
				[1] = "pes_level_bell_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 3.4399790763855,
			},
		},
		pes_level_bell_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_five_01",
			},
			sound_events = {
				[1] = "pes_level_bell_story_five_01",
			},
			sound_events_duration = {
				[1] = 1.7189791202545,
			},
		},
		pes_level_bell_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_four_01",
			},
			sound_events = {
				[1] = "pes_level_bell_story_four_01",
			},
			sound_events_duration = {
				[1] = 5.9659790992737,
			},
		},
		pes_level_bell_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_four_02",
			},
			sound_events = {
				[1] = "pes_level_bell_story_four_02",
			},
			sound_events_duration = {
				[1] = 3.8740000724792,
			},
		},
		pes_level_bell_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_nine_01",
			},
			sound_events = {
				[1] = "pes_level_bell_story_nine_01",
			},
			sound_events_duration = {
				[1] = 4.0499792098999,
			},
		},
		pes_level_bell_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_nine_02",
			},
			sound_events = {
				[1] = "pes_level_bell_story_nine_02",
			},
			sound_events_duration = {
				[1] = 1.2619999647141,
			},
		},
		pes_level_bell_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_one_01",
			},
			sound_events = {
				[1] = "pes_level_bell_story_one_01",
			},
			sound_events_duration = {
				[1] = 4.1729793548584,
			},
		},
		pes_level_bell_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_one_02",
			},
			sound_events = {
				[1] = "pes_level_bell_story_one_02",
			},
			sound_events_duration = {
				[1] = 6.2479791641235,
			},
		},
		pes_level_bell_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_six_01",
			},
			sound_events = {
				[1] = "pes_level_bell_story_six_01",
			},
			sound_events_duration = {
				[1] = 3.0249791145325,
			},
		},
		pes_level_bell_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_six_02",
			},
			sound_events = {
				[1] = "pes_level_bell_story_six_02",
			},
			sound_events_duration = {
				[1] = 3.988979101181,
			},
		},
		pes_level_bell_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pes_level_bell_story_three_01",
			},
			sound_events = {
				[1] = "pes_level_bell_story_three_01",
			},
			sound_events_duration = {
				[1] = 2.1040000915527,
			},
		},
		pwe_level_bell_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwe_level_bell_story_four_01",
			},
			sound_events = {
				[1] = "pwe_level_bell_story_four_01",
			},
			sound_events_duration = {
				[1] = 3.6799790859222,
			},
		},
		pwe_level_bell_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwe_level_bell_story_four_02",
			},
			sound_events = {
				[1] = "pwe_level_bell_story_four_02",
			},
			sound_events_duration = {
				[1] = 1.5849791765213,
			},
		},
		pwe_level_bell_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwe_level_bell_story_six_01",
			},
			sound_events = {
				[1] = "pwe_level_bell_story_six_01",
			},
			sound_events_duration = {
				[1] = 1.9679791927338,
			},
		},
		pwe_level_bell_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwe_level_bell_story_ten_01",
			},
			sound_events = {
				[1] = "pwe_level_bell_story_ten_01",
			},
			sound_events_duration = {
				[1] = 3.9259791374206,
			},
		},
		pwe_level_bell_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwe_level_bell_story_ten_02",
			},
			sound_events = {
				[1] = "pwe_level_bell_story_ten_02",
			},
			sound_events_duration = {
				[1] = 2.948979139328,
			},
		},
		pwe_level_bell_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwe_level_bell_story_three_01",
			},
			sound_events = {
				[1] = "pwe_level_bell_story_three_01",
			},
			sound_events_duration = {
				[1] = 4.5249791145325,
			},
		},
		pwe_level_bell_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwe_level_bell_story_twelve_01",
			},
			sound_events = {
				[1] = "pwe_level_bell_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 2.0699791908264,
			},
		},
		pwe_level_bell_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwe_level_bell_story_two_01",
			},
			sound_events = {
				[1] = "pwe_level_bell_story_two_01",
			},
			sound_events_duration = {
				[1] = 4.5109791755676,
			},
		},
		pwe_level_bell_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwe_level_bell_story_two_02",
			},
			sound_events = {
				[1] = "pwe_level_bell_story_two_02",
			},
			sound_events_duration = {
				[1] = 7.6959791183472,
			},
		},
		pwh_level_bell_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwh_level_bell_story_eight_01",
			},
			sound_events = {
				[1] = "pwh_level_bell_story_eight_01",
			},
			sound_events_duration = {
				[1] = 3.4549791812897,
			},
		},
		pwh_level_bell_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwh_level_bell_story_eleven_01",
			},
			sound_events = {
				[1] = "pwh_level_bell_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		pwh_level_bell_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwh_level_bell_story_five_01",
			},
			sound_events = {
				[1] = "pwh_level_bell_story_five_01",
			},
			sound_events_duration = {
				[1] = 9.4419794082642,
			},
		},
		pwh_level_bell_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwh_level_bell_story_nine_01",
			},
			sound_events = {
				[1] = "pwh_level_bell_story_nine_01",
			},
			sound_events_duration = {
				[1] = 4.7809791564941,
			},
		},
		pwh_level_bell_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwh_level_bell_story_nine_02",
			},
			sound_events = {
				[1] = "pwh_level_bell_story_nine_02",
			},
			sound_events_duration = {
				[1] = 8.326979637146,
			},
		},
		pwh_level_bell_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwh_level_bell_story_one_01",
			},
			sound_events = {
				[1] = "pwh_level_bell_story_one_01",
			},
			sound_events_duration = {
				[1] = 5.5529789924622,
			},
		},
		pwh_level_bell_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwh_level_bell_story_one_02",
			},
			sound_events = {
				[1] = "pwh_level_bell_story_one_02",
			},
			sound_events_duration = {
				[1] = 5.0729789733887,
			},
		},
		pwh_level_bell_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwh_level_bell_story_six_01",
			},
			sound_events = {
				[1] = "pwh_level_bell_story_six_01",
			},
			sound_events_duration = {
				[1] = 6.415979385376,
			},
		},
		pwh_level_bell_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwh_level_bell_story_ten_01",
			},
			sound_events = {
				[1] = "pwh_level_bell_story_ten_01",
			},
			sound_events_duration = {
				[1] = 6.290979385376,
			},
		},
		pwh_level_bell_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwh_level_bell_story_ten_02",
			},
			sound_events = {
				[1] = "pwh_level_bell_story_ten_02",
			},
			sound_events_duration = {
				[1] = 3.9869792461395,
			},
		},
		pwh_level_bell_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_bell",
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
				[1] = "pwh_level_bell_story_twelve_01",
			},
			sound_events = {
				[1] = "pwh_level_bell_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 6.9289793968201,
			},
		},
	})
end
