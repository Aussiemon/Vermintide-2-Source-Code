-- chunkname: @dialogues/generated/hero_conversations_mines.lua

return function ()
	define_rule({
		name = "pbw_level_mine_story_eight_01",
		response = "pbw_level_mine_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_eight_01",
			},
			{
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
		name = "pbw_level_mine_story_five_01",
		response = "pbw_level_mine_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_mine_story_five_01",
			},
			{
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
		name = "pbw_level_mine_story_four_01",
		response = "pbw_level_mine_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_mine_story_four_01",
			},
			{
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
		name = "pbw_level_mine_story_four_03",
		response = "pbw_level_mine_story_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_mine_story_four_02",
			},
			{
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
		name = "pbw_level_mine_story_four_04",
		response = "pbw_level_mine_story_four_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_mine_story_four_03",
			},
			{
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
		name = "pbw_level_mine_story_seven_a_01",
		response = "pbw_level_mine_story_seven_a_01",
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
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_seven",
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
		name = "pbw_level_mine_story_ten_01",
		response = "pbw_level_mine_story_ten_01",
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
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_ten",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_ten",
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
		name = "pbw_level_mine_story_ten_02",
		response = "pbw_level_mine_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_ten_01",
			},
			{
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
		name = "pbw_level_mine_story_two_01",
		response = "pbw_level_mine_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_two_02",
			},
			{
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
		name = "pdr_level_mine_story_eight_01",
		response = "pdr_level_mine_story_eight_01",
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_eight",
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
		name = "pdr_level_mine_story_eight_02",
		response = "pdr_level_mine_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_mine_story_eight_01",
			},
			{
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
		name = "pdr_level_mine_story_eight_03",
		response = "pdr_level_mine_story_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_mine_story_eight_02",
			},
			{
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
		name = "pdr_level_mine_story_eleven_01",
		response = "pdr_level_mine_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_eleven_01",
			},
			{
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
		name = "pdr_level_mine_story_eleven_02",
		response = "pdr_level_mine_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_eleven_02",
			},
			{
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
		name = "pdr_level_mine_story_eleven_a_01",
		response = "pdr_level_mine_story_eleven_a_01",
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
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_eleven_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_eleven_a",
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
		name = "pdr_level_mine_story_nine_01",
		response = "pdr_level_mine_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_mine_story_nine_01",
			},
			{
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
		name = "pdr_level_mine_story_nine_02",
		response = "pdr_level_mine_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_mine_story_nine_02",
			},
			{
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
		name = "pdr_level_mine_story_nine_03",
		response = "pdr_level_mine_story_nine_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_mine_story_nine_03",
			},
			{
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
		name = "pdr_level_mine_story_one_01",
		response = "pdr_level_mine_story_one_01",
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
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_one",
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
		name = "pdr_level_mine_story_one_02",
		response = "pdr_level_mine_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_mine_story_one_01",
			},
			{
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
		name = "pdr_level_mine_story_one_03",
		response = "pdr_level_mine_story_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_mine_story_one_01",
			},
			{
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
		name = "pdr_level_mine_story_seven_01",
		response = "pdr_level_mine_story_seven_01",
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
				"es_mercenary",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_seven",
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
		name = "pdr_level_mine_story_seven_02",
		response = "pdr_level_mine_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_seven_01",
			},
			{
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
		name = "pdr_level_mine_story_seven_a_01",
		response = "pdr_level_mine_story_seven_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_mine_story_seven_a_01",
			},
			{
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
		name = "pdr_level_mine_story_ten_01",
		response = "pdr_level_mine_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_mine_story_ten_01",
			},
			{
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
		name = "pdr_level_mine_story_ten_02",
		response = "pdr_level_mine_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_ten_02",
			},
			{
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
		name = "pdr_level_mine_story_twelve_01",
		response = "pdr_level_mine_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_mine_story_twelve_01",
			},
			{
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
		name = "pdr_level_mine_story_two_01",
		response = "pdr_level_mine_story_two_01",
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
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_two",
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
		name = "pdr_level_mine_story_two_02",
		response = "pdr_level_mine_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_two_01",
			},
			{
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
		name = "pdr_level_mine_story_two_03",
		response = "pdr_level_mine_story_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_mine_story_two_01",
			},
			{
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
		name = "pes_level_mine_story_eleven_01",
		response = "pes_level_mine_story_eleven_01",
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
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_eleven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_eleven",
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
		name = "pes_level_mine_story_eleven_02",
		response = "pes_level_mine_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_eleven_01",
			},
			{
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
		name = "pes_level_mine_story_eleven_a_01",
		response = "pes_level_mine_story_eleven_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_eleven_a_01",
			},
			{
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
		name = "pes_level_mine_story_eleven_a_02",
		response = "pes_level_mine_story_eleven_a_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_mine_story_eleven_a_01",
			},
			{
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
		name = "pes_level_mine_story_five_01",
		response = "pes_level_mine_story_five_01",
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_five",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_five",
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
		name = "pes_level_mine_story_five_02",
		response = "pes_level_mine_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_mine_story_five_01",
			},
			{
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
		name = "pes_level_mine_story_seven_01",
		response = "pes_level_mine_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_seven_01",
			},
			{
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
		name = "pes_level_mine_story_seven_02",
		response = "pes_level_mine_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_seven_02",
			},
			{
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
		name = "pes_level_mine_story_six_01",
		response = "pes_level_mine_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_mine_story_six_01",
			},
			{
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
		name = "pes_level_mine_story_six_02",
		response = "pes_level_mine_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_mine_story_six_02",
			},
			{
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
		name = "pes_level_mine_story_six_a_01",
		response = "pes_level_mine_story_six_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_mine_story_six_a_01",
			},
			{
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
		name = "pes_level_mine_story_six_a_02",
		response = "pes_level_mine_story_six_a_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_mine_story_six_a_02",
			},
			{
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
		name = "pes_level_mine_story_ten_01",
		response = "pes_level_mine_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_ten_01",
			},
			{
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
		name = "pes_level_mine_story_ten_02",
		response = "pes_level_mine_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_mine_story_ten_02",
			},
			{
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
		name = "pes_level_mine_story_ten_03",
		response = "pes_level_mine_story_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_ten_02",
			},
			{
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
		name = "pes_level_mine_story_three_01",
		response = "pes_level_mine_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_mine_story_three_01",
			},
			{
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
		name = "pes_level_mine_story_twelve_01",
		response = "pes_level_mine_story_twelve_01",
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
				"faction_memory",
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_twelve",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_twelve",
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
		name = "pes_level_mine_story_two_01",
		response = "pes_level_mine_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_two_01",
			},
			{
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
		name = "pwe_level_mine_story_eleven_a_01",
		response = "pwe_level_mine_story_eleven_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_eleven_a_01",
			},
			{
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
		name = "pwe_level_mine_story_eleven_a_02",
		response = "pwe_level_mine_story_eleven_a_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_eleven_a_02",
			},
			{
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
		name = "pwe_level_mine_story_five_01",
		response = "pwe_level_mine_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_five_01",
			},
			{
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
		name = "pwe_level_mine_story_five_02",
		response = "pwe_level_mine_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_five_02",
			},
			{
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
		name = "pwe_level_mine_story_nine_01",
		response = "pwe_level_mine_story_nine_01",
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
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_nine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_nine",
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
		name = "pwe_level_mine_story_nine_02",
		response = "pwe_level_mine_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_nine_01",
			},
			{
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
		name = "pwe_level_mine_story_nine_03",
		response = "pwe_level_mine_story_nine_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_nine_02",
			},
			{
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
		name = "pwe_level_mine_story_nine_04",
		response = "pwe_level_mine_story_nine_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_nine_03",
			},
			{
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
		name = "pwe_level_mine_story_one_01",
		response = "pwe_level_mine_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_one_01",
			},
			{
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
		name = "pwe_level_mine_story_seven_a_01",
		response = "pwe_level_mine_story_seven_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_mine_story_seven_a_01",
			},
			{
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
		name = "pwe_level_mine_story_three_01",
		response = "pwe_level_mine_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_mine_story_three_02",
			},
			{
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
		name = "pwe_level_mine_story_twelve_01",
		response = "pwe_level_mine_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_twelve_01",
			},
			{
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
		name = "pwh_level_mine_story_eight_02",
		response = "pwh_level_mine_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_eight_02",
			},
			{
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
		name = "pwh_level_mine_story_four_01",
		response = "pwh_level_mine_story_four_01",
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
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_four",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_four",
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
		name = "pwh_level_mine_story_four_02",
		response = "pwh_level_mine_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_mine_story_four_01",
			},
			{
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
		name = "pwh_level_mine_story_four_03",
		response = "pwh_level_mine_story_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_mine_story_four_03",
			},
			{
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
		name = "pwh_level_mine_story_one_01",
		response = "pwh_level_mine_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_mine_story_one_02",
			},
			{
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
		name = "pwh_level_mine_story_six_01",
		response = "pwh_level_mine_story_six_01",
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
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_six",
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
		name = "pwh_level_mine_story_six_02",
		response = "pwh_level_mine_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_six_01",
			},
			{
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
		name = "pwh_level_mine_story_six_03",
		response = "pwh_level_mine_story_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_six_02",
			},
			{
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
		name = "pwh_level_mine_story_six_a_01",
		response = "pwh_level_mine_story_six_a_01",
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
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_six",
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
		name = "pwh_level_mine_story_six_a_02",
		response = "pwh_level_mine_story_six_a_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_six_a_01",
			},
			{
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
		name = "pwh_level_mine_story_three_01",
		response = "pwh_level_mine_story_three_01",
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
				"level_mine_big_troll_cave",
				OP.NOT,
				"level_mine_big_troll_cave",
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
				"level_mine_story_three",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_mine_story_three",
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
		name = "pwh_level_mine_story_three_02",
		response = "pwh_level_mine_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_mine_story_three_01",
			},
			{
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
		name = "pwh_level_mine_story_three_03",
		response = "pwh_level_mine_story_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_mine_story_three_01",
			},
			{
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
		pbw_level_mine_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_mine_story_eight_01",
			},
			sound_events = {
				[1] = "pbw_level_mine_story_eight_01",
			},
			sound_events_duration = {
				[1] = 2.2939791679382,
			},
		},
		pbw_level_mine_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_mine_story_five_01",
			},
			sound_events = {
				[1] = "pbw_level_mine_story_five_01",
			},
			sound_events_duration = {
				[1] = 2.0539999008179,
			},
		},
		pbw_level_mine_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_mine_story_four_01",
			},
			sound_events = {
				[1] = "pbw_level_mine_story_four_01",
			},
			sound_events_duration = {
				[1] = 4.8020000457764,
			},
		},
		pbw_level_mine_story_four_03 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_mine_story_four_03",
			},
			sound_events = {
				[1] = "pbw_level_mine_story_four_03",
			},
			sound_events_duration = {
				[1] = 2.6749792098999,
			},
		},
		pbw_level_mine_story_four_04 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_mine_story_four_04",
			},
			sound_events = {
				[1] = "pbw_level_mine_story_four_04",
			},
			sound_events_duration = {
				[1] = 3.0759792327881,
			},
		},
		pbw_level_mine_story_seven_a_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_mine_story_seven_a_01",
			},
			sound_events = {
				[1] = "pbw_level_mine_story_seven_a_01",
			},
			sound_events_duration = {
				[1] = 3.0329792499542,
			},
		},
		pbw_level_mine_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_mine_story_ten_01",
			},
			sound_events = {
				[1] = "pbw_level_mine_story_ten_01",
			},
			sound_events_duration = {
				[1] = 2.3649792671204,
			},
		},
		pbw_level_mine_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_mine_story_ten_02",
			},
			sound_events = {
				[1] = "pbw_level_mine_story_ten_02",
			},
			sound_events_duration = {
				[1] = 2.0220000743866,
			},
		},
		pbw_level_mine_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_mine_story_two_01",
			},
			sound_events = {
				[1] = "pbw_level_mine_story_two_01",
			},
			sound_events_duration = {
				[1] = 3.8289792537689,
			},
		},
		pdr_level_mine_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_eight_01",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_eight_01",
			},
			sound_events_duration = {
				[1] = 2.2159790992737,
			},
		},
		pdr_level_mine_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_eight_02",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_eight_02",
			},
			sound_events_duration = {
				[1] = 4.2059998512268,
			},
		},
		pdr_level_mine_story_eight_03 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_eight_03",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_eight_03",
			},
			sound_events_duration = {
				[1] = 6.7079792022705,
			},
		},
		pdr_level_mine_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_eleven_01",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.3420000076294,
			},
		},
		pdr_level_mine_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_eleven_02",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 4.4800000190735,
			},
		},
		pdr_level_mine_story_eleven_a_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_eleven_a_01",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_eleven_a_01",
			},
			sound_events_duration = {
				[1] = 5.3179793357849,
			},
		},
		pdr_level_mine_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_nine_01",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_nine_01",
			},
			sound_events_duration = {
				[1] = 3.9029791355133,
			},
		},
		pdr_level_mine_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_nine_02",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_nine_02",
			},
			sound_events_duration = {
				[1] = 2.4679999351502,
			},
		},
		pdr_level_mine_story_nine_03 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_nine_03",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_nine_03",
			},
			sound_events_duration = {
				[1] = 3.3659791946411,
			},
		},
		pdr_level_mine_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_one_01",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_one_01",
			},
			sound_events_duration = {
				[1] = 5.3019790649414,
			},
		},
		pdr_level_mine_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_one_02",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_one_02",
			},
			sound_events_duration = {
				[1] = 4.1149792671204,
			},
		},
		pdr_level_mine_story_one_03 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_one_03",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_one_03",
			},
			sound_events_duration = {
				[1] = 5.2079792022705,
			},
		},
		pdr_level_mine_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_seven_01",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_seven_01",
			},
			sound_events_duration = {
				[1] = 4.9319791793823,
			},
		},
		pdr_level_mine_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_seven_02",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_seven_02",
			},
			sound_events_duration = {
				[1] = 2.5079791545868,
			},
		},
		pdr_level_mine_story_seven_a_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_seven_a_01",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_seven_a_01",
			},
			sound_events_duration = {
				[1] = 3.8559792041779,
			},
		},
		pdr_level_mine_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_ten_01",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_ten_01",
			},
			sound_events_duration = {
				[1] = 6.9069790840149,
			},
		},
		pdr_level_mine_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_ten_02",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_ten_02",
			},
			sound_events_duration = {
				[1] = 4.9209790229797,
			},
		},
		pdr_level_mine_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_twelve_01",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.6369791030884,
			},
		},
		pdr_level_mine_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_two_01",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_two_01",
			},
			sound_events_duration = {
				[1] = 5.1449790000916,
			},
		},
		pdr_level_mine_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_two_02",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_two_02",
			},
			sound_events_duration = {
				[1] = 2.6969792842865,
			},
		},
		pdr_level_mine_story_two_03 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_mine_story_two_03",
			},
			sound_events = {
				[1] = "pdr_level_mine_story_two_03",
			},
			sound_events_duration = {
				[1] = 6.441978931427,
			},
		},
		pes_level_mine_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_eleven_01",
			},
			sound_events = {
				[1] = "pes_level_mine_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.5249791145325,
			},
		},
		pes_level_mine_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_eleven_02",
			},
			sound_events = {
				[1] = "pes_level_mine_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 2.1469790935516,
			},
		},
		pes_level_mine_story_eleven_a_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_eleven_a_01",
			},
			sound_events = {
				[1] = "pes_level_mine_story_eleven_a_01",
			},
			sound_events_duration = {
				[1] = 4.9979791641235,
			},
		},
		pes_level_mine_story_eleven_a_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_eleven_a_02",
			},
			sound_events = {
				[1] = "pes_level_mine_story_eleven_a_02",
			},
			sound_events_duration = {
				[1] = 1.4819791316986,
			},
		},
		pes_level_mine_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_five_01",
			},
			sound_events = {
				[1] = "pes_level_mine_story_five_01",
			},
			sound_events_duration = {
				[1] = 5.522979259491,
			},
		},
		pes_level_mine_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_five_02",
			},
			sound_events = {
				[1] = "pes_level_mine_story_five_02",
			},
			sound_events_duration = {
				[1] = 6.9029793739319,
			},
		},
		pes_level_mine_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_seven_01",
			},
			sound_events = {
				[1] = "pes_level_mine_story_seven_01",
			},
			sound_events_duration = {
				[1] = 2.7929792404175,
			},
		},
		pes_level_mine_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_seven_02",
			},
			sound_events = {
				[1] = "pes_level_mine_story_seven_02",
			},
			sound_events_duration = {
				[1] = 6.3249793052673,
			},
		},
		pes_level_mine_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_six_01",
			},
			sound_events = {
				[1] = "pes_level_mine_story_six_01",
			},
			sound_events_duration = {
				[1] = 2.1109790802002,
			},
		},
		pes_level_mine_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_six_02",
			},
			sound_events = {
				[1] = "pes_level_mine_story_six_02",
			},
			sound_events_duration = {
				[1] = 1.5080000162125,
			},
		},
		pes_level_mine_story_six_a_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_six_a_01",
			},
			sound_events = {
				[1] = "pes_level_mine_story_six_a_01",
			},
			sound_events_duration = {
				[1] = 4.9299998283386,
			},
		},
		pes_level_mine_story_six_a_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_six_a_02",
			},
			sound_events = {
				[1] = "pes_level_mine_story_six_a_02",
			},
			sound_events_duration = {
				[1] = 2.9829790592194,
			},
		},
		pes_level_mine_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_ten_01",
			},
			sound_events = {
				[1] = "pes_level_mine_story_ten_01",
			},
			sound_events_duration = {
				[1] = 4.120979309082,
			},
		},
		pes_level_mine_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_ten_02",
			},
			sound_events = {
				[1] = "pes_level_mine_story_ten_02",
			},
			sound_events_duration = {
				[1] = 3.988979101181,
			},
		},
		pes_level_mine_story_ten_03 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_ten_03",
			},
			sound_events = {
				[1] = "pes_level_mine_story_ten_03",
			},
			sound_events_duration = {
				[1] = 0.72997915744782,
			},
		},
		pes_level_mine_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_three_01",
			},
			sound_events = {
				[1] = "pes_level_mine_story_three_01",
			},
			sound_events_duration = {
				[1] = 1.9190000295639,
			},
		},
		pes_level_mine_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_twelve_01",
			},
			sound_events = {
				[1] = "pes_level_mine_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.8269791603088,
			},
		},
		pes_level_mine_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_mine_story_two_01",
			},
			sound_events = {
				[1] = "pes_level_mine_story_two_01",
			},
			sound_events_duration = {
				[1] = 2.9839999675751,
			},
		},
		pwe_level_mine_story_eleven_a_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_eleven_a_01",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_eleven_a_01",
			},
			sound_events_duration = {
				[1] = 5.0119791030884,
			},
		},
		pwe_level_mine_story_eleven_a_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_eleven_a_02",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_eleven_a_02",
			},
			sound_events_duration = {
				[1] = 1.2139895558357,
			},
		},
		pwe_level_mine_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_five_01",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_five_01",
			},
			sound_events_duration = {
				[1] = 4.2009792327881,
			},
		},
		pwe_level_mine_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_five_02",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_five_02",
			},
			sound_events_duration = {
				[1] = 4.169979095459,
			},
		},
		pwe_level_mine_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_nine_01",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_nine_01",
			},
			sound_events_duration = {
				[1] = 4.2169790267944,
			},
		},
		pwe_level_mine_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_nine_02",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_nine_02",
			},
			sound_events_duration = {
				[1] = 2.3629791736603,
			},
		},
		pwe_level_mine_story_nine_03 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_nine_03",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_nine_03",
			},
			sound_events_duration = {
				[1] = 6.2109789848328,
			},
		},
		pwe_level_mine_story_nine_04 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_nine_04",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_nine_04",
			},
			sound_events_duration = {
				[1] = 3.5519790649414,
			},
		},
		pwe_level_mine_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_one_01",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_one_01",
			},
			sound_events_duration = {
				[1] = 1.7000000476837,
			},
		},
		pwe_level_mine_story_seven_a_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_seven_a_01",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_seven_a_01",
			},
			sound_events_duration = {
				[1] = 7.0199790000916,
			},
		},
		pwe_level_mine_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_three_01",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_three_01",
			},
			sound_events_duration = {
				[1] = 6.0369791984558,
			},
		},
		pwe_level_mine_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_mine_story_twelve_01",
			},
			sound_events = {
				[1] = "pwe_level_mine_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 4.8679790496826,
			},
		},
		pwh_level_mine_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_eight_02",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_eight_02",
			},
			sound_events_duration = {
				[1] = 7.7819790840149,
			},
		},
		pwh_level_mine_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_four_01",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_four_01",
			},
			sound_events_duration = {
				[1] = 8.7639789581299,
			},
		},
		pwh_level_mine_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_four_02",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_four_02",
			},
			sound_events_duration = {
				[1] = 2.368979215622,
			},
		},
		pwh_level_mine_story_four_03 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_four_03",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_four_03",
			},
			sound_events_duration = {
				[1] = 10.043978691101,
			},
		},
		pwh_level_mine_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_one_01",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_one_01",
			},
			sound_events_duration = {
				[1] = 3.0949790477753,
			},
		},
		pwh_level_mine_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_six_01",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_six_01",
			},
			sound_events_duration = {
				[1] = 5.4979791641235,
			},
		},
		pwh_level_mine_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_six_02",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_six_02",
			},
			sound_events_duration = {
				[1] = 1.6289792060852,
			},
		},
		pwh_level_mine_story_six_03 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_six_03",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_six_03",
			},
			sound_events_duration = {
				[1] = 7.6779789924622,
			},
		},
		pwh_level_mine_story_six_a_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_six_a_01",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_six_a_01",
			},
			sound_events_duration = {
				[1] = 7.5169792175293,
			},
		},
		pwh_level_mine_story_six_a_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_six_a_02",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_six_a_02",
			},
			sound_events_duration = {
				[1] = 1.0989791154861,
			},
		},
		pwh_level_mine_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_three_01",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_three_01",
			},
			sound_events_duration = {
				[1] = 8.8059787750244,
			},
		},
		pwh_level_mine_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_three_02",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_three_02",
			},
			sound_events_duration = {
				[1] = 5.3189792633057,
			},
		},
		pwh_level_mine_story_three_03 = {
			category = "story_talk",
			database = "hero_conversations_mines",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_mine_story_three_03",
			},
			sound_events = {
				[1] = "pwh_level_mine_story_three_03",
			},
			sound_events_duration = {
				[1] = 0.57723958790302,
			},
		},
	})
end
