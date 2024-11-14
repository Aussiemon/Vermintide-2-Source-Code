-- chunkname: @dialogues/generated/hero_conversations_military.lua

return function ()
	define_rule({
		name = "pbw_level_helmgart_military_story_four_01",
		probability = 1,
		response = "pbw_level_helmgart_military_story_four_01",
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
				"time_since_helmgart_military_arriving_temple",
				OP.NOT,
				"time_since_helmgart_military_arriving_temple",
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
				"helmgart_military_story_four",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_story_four",
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
		name = "pbw_level_helmgart_military_story_four_02",
		probability = 1,
		response = "pbw_level_helmgart_military_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_four_02",
			},
			{
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
		name = "pbw_level_helmgart_military_story_nine_01",
		probability = 1,
		response = "pbw_level_helmgart_military_story_nine_01",
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
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_helmgart_military_arriving_temple",
				OP.NOT,
				"time_since_helmgart_military_arriving_temple",
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
				"helmgart_military_story_nine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_story_nine",
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
		name = "pbw_level_helmgart_military_story_nine_02",
		probability = 1,
		response = "pbw_level_helmgart_military_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_helmgart_military_story_nine_01",
			},
			{
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
		name = "pbw_level_helmgart_military_story_seven_01",
		probability = 1,
		response = "pbw_level_helmgart_military_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_helmgart_military_story_seven_01",
			},
			{
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
		name = "pbw_level_helmgart_military_story_two_01",
		probability = 1,
		response = "pbw_level_helmgart_military_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_helmgart_military_story_two_02",
			},
			{
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
		name = "pdr_level_helmgart_military_story_four_01",
		probability = 1,
		response = "pdr_level_helmgart_military_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_four_01",
			},
			{
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
		name = "pdr_level_helmgart_military_story_nine_01",
		probability = 1,
		response = "pdr_level_helmgart_military_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_helmgart_military_story_nine_01",
			},
			{
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
		name = "pdr_level_helmgart_military_story_six_01",
		probability = 1,
		response = "pdr_level_helmgart_military_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_six_01",
			},
			{
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
		name = "pdr_level_helmgart_military_story_six_02",
		probability = 1,
		response = "pdr_level_helmgart_military_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_six_02",
			},
			{
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
		name = "pdr_level_helmgart_military_story_ten_01",
		probability = 1,
		response = "pdr_level_helmgart_military_story_ten_01",
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
				"faction_memory",
				"time_since_helmgart_military_arriving_temple",
				OP.NOT,
				"time_since_helmgart_military_arriving_temple",
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
				"helmgart_military_story_ten",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_story_ten",
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
		name = "pdr_level_helmgart_military_story_ten_02",
		probability = 1,
		response = "pdr_level_helmgart_military_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_helmgart_military_story_ten_01",
			},
			{
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
		name = "pdr_level_helmgart_military_story_ten_03",
		probability = 1,
		response = "pdr_level_helmgart_military_story_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_helmgart_military_story_ten_02",
			},
			{
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
		name = "pdr_level_helmgart_military_story_three_01",
		probability = 1,
		response = "pdr_level_helmgart_military_story_three_01",
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
				"time_since_helmgart_military_arriving_temple",
				OP.NOT,
				"time_since_helmgart_military_arriving_temple",
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
				"helmgart_military_story_three",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_story_three",
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
		name = "pdr_level_helmgart_military_story_three_02",
		probability = 1,
		response = "pdr_level_helmgart_military_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_three_01",
			},
			{
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
		name = "pes_level_helmgart_military_story_eight_01",
		probability = 1,
		response = "pes_level_helmgart_military_story_eight_01",
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
				"user_context",
				"player_career",
				OP.NEQ,
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
				"time_since_helmgart_military_arriving_temple",
				OP.NOT,
				"time_since_helmgart_military_arriving_temple",
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
				"helmgart_military_story_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_story_eight",
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
		name = "pes_level_helmgart_military_story_eight_02",
		probability = 1,
		response = "pes_level_helmgart_military_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_helmgart_military_story_eight_01",
			},
			{
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
		name = "pes_level_helmgart_military_story_eight_03",
		probability = 1,
		response = "pes_level_helmgart_military_story_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_helmgart_military_story_eight_02",
			},
			{
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
		name = "pes_level_helmgart_military_story_five_01",
		probability = 1,
		response = "pes_level_helmgart_military_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_helmgart_military_story_five_01",
			},
			{
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
		name = "pes_level_helmgart_military_story_five_02",
		probability = 1,
		response = "pes_level_helmgart_military_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_helmgart_military_story_five_02",
			},
			{
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
		name = "pes_level_helmgart_military_story_five_a_01",
		probability = 1,
		response = "pes_level_helmgart_military_story_five_a_01",
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
				"user_context",
				"player_career",
				OP.EQ,
				"es_mercenary",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_helmgart_military_arriving_temple",
				OP.NOT,
				"time_since_helmgart_military_arriving_temple",
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
				"helmgart_military_story_five",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_story_five",
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
		name = "pes_level_helmgart_military_story_five_a_03",
		probability = 1,
		response = "pes_level_helmgart_military_story_five_a_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_helmgart_military_story_five_a_01",
			},
			{
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
		name = "pes_level_helmgart_military_story_four_01",
		probability = 1,
		response = "pes_level_helmgart_military_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_helmgart_military_story_four_01",
			},
			{
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
		name = "pes_level_helmgart_military_story_four_02",
		probability = 1,
		response = "pes_level_helmgart_military_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_helmgart_military_story_four_01",
			},
			{
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
		name = "pes_level_helmgart_military_story_one_01",
		probability = 1,
		response = "pes_level_helmgart_military_story_one_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				480,
			},
			{
				"faction_memory",
				"time_since_helmgart_military_arriving_temple",
				OP.NOT,
				"time_since_helmgart_military_arriving_temple",
			},
			{
				"faction_memory",
				"helmgart_military_story_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_story_one",
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
		name = "pes_level_helmgart_military_story_one_02",
		probability = 1,
		response = "pes_level_helmgart_military_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_helmgart_military_story_one_01",
			},
			{
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
		name = "pes_level_helmgart_military_story_one_03",
		probability = 1,
		response = "pes_level_helmgart_military_story_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_helmgart_military_story_one_02",
			},
			{
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
		name = "pes_level_helmgart_military_story_six_01",
		probability = 1,
		response = "pes_level_helmgart_military_story_six_01",
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
				"time_since_helmgart_military_arriving_temple",
				OP.NOT,
				"time_since_helmgart_military_arriving_temple",
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
				"helmgart_military_story_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_story_six",
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
		name = "pes_level_helmgart_military_story_six_02",
		probability = 1,
		response = "pes_level_helmgart_military_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_helmgart_military_story_six_01",
			},
			{
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
		name = "pes_level_helmgart_military_story_three_01",
		probability = 1,
		response = "pes_level_helmgart_military_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_helmgart_military_story_three_01",
			},
			{
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
		name = "pes_level_helmgart_military_story_three_02",
		probability = 1,
		response = "pes_level_helmgart_military_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_helmgart_military_story_three_02",
			},
			{
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
		name = "pwe_level_helmgart_military_story_five_01",
		probability = 1,
		response = "pwe_level_helmgart_military_story_five_01",
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
				"es_mercenary",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_helmgart_military_arriving_temple",
				OP.NOT,
				"time_since_helmgart_military_arriving_temple",
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
				"helmgart_military_story_five",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_story_five",
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
		name = "pwe_level_helmgart_military_story_five_02",
		probability = 1,
		response = "pwe_level_helmgart_military_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_five_01",
			},
			{
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
		name = "pwe_level_helmgart_military_story_five_a_01",
		probability = 1,
		response = "pwe_level_helmgart_military_story_five_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_five_a_01",
			},
			{
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
		name = "pwe_level_helmgart_military_story_five_a_04",
		probability = 1,
		response = "pwe_level_helmgart_military_story_five_a_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_five_a_03",
			},
			{
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
		name = "pwe_level_helmgart_military_story_one_01",
		probability = 1,
		response = "pwe_level_helmgart_military_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_one_01",
			},
			{
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
		name = "pwe_level_helmgart_military_story_one_02",
		probability = 1,
		response = "pwe_level_helmgart_military_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_one_02",
			},
			{
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
		name = "pwe_level_helmgart_military_story_one_03",
		probability = 1,
		response = "pwe_level_helmgart_military_story_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_one_03",
			},
			{
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
		name = "pwe_level_helmgart_military_story_ten_01",
		probability = 1,
		response = "pwe_level_helmgart_military_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_helmgart_military_story_ten_01",
			},
			{
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
		name = "pwe_level_helmgart_military_story_ten_02",
		probability = 1,
		response = "pwe_level_helmgart_military_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_helmgart_military_story_ten_02",
			},
			{
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
		name = "pwe_level_helmgart_military_story_two_01",
		probability = 1,
		response = "pwe_level_helmgart_military_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_helmgart_military_story_two_01",
			},
			{
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
		name = "pwh_level_helmgart_military_story_eight_01",
		probability = 1,
		response = "pwh_level_helmgart_military_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_eight_01",
			},
			{
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
		name = "pwh_level_helmgart_military_story_eight_02",
		probability = 1,
		response = "pwh_level_helmgart_military_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_helmgart_military_story_eight_02",
			},
			{
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
		name = "pwh_level_helmgart_military_story_nine_01",
		probability = 1,
		response = "pwh_level_helmgart_military_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_helmgart_military_story_nine_01",
			},
			{
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
		name = "pwh_level_helmgart_military_story_seven_01",
		probability = 1,
		response = "pwh_level_helmgart_military_story_seven_01",
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
				"time_since_helmgart_military_arriving_temple",
				OP.NOT,
				"time_since_helmgart_military_arriving_temple",
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
				"helmgart_military_story_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_story_seven",
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
		name = "pwh_level_helmgart_military_story_seven_02",
		probability = 1,
		response = "pwh_level_helmgart_military_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_helmgart_military_story_seven_01",
			},
			{
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
		name = "pwh_level_helmgart_military_story_two_01",
		probability = 1,
		response = "pwh_level_helmgart_military_story_two_01",
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
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_helmgart_military_arriving_temple",
				OP.NOT,
				"time_since_helmgart_military_arriving_temple",
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
				"helmgart_military_story_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_story_two",
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
		name = "pwh_level_helmgart_military_story_two_02",
		probability = 1,
		response = "pwh_level_helmgart_military_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_helmgart_military_story_two_01",
			},
			{
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
		pbw_level_helmgart_military_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_helmgart_military_story_four_01",
			},
			sound_events = {
				[1] = "pbw_level_helmgart_military_story_four_01",
			},
			sound_events_duration = {
				[1] = 3.9049999713898,
			},
		},
		pbw_level_helmgart_military_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_helmgart_military_story_four_02",
			},
			sound_events = {
				[1] = "pbw_level_helmgart_military_story_four_02",
			},
			sound_events_duration = {
				[1] = 2.2859792709351,
			},
		},
		pbw_level_helmgart_military_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_helmgart_military_story_nine_01",
			},
			sound_events = {
				[1] = "pbw_level_helmgart_military_story_nine_01",
			},
			sound_events_duration = {
				[1] = 2.14097905159,
			},
		},
		pbw_level_helmgart_military_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_helmgart_military_story_nine_02",
			},
			sound_events = {
				[1] = "pbw_level_helmgart_military_story_nine_02",
			},
			sound_events_duration = {
				[1] = 4.2579998970032,
			},
		},
		pbw_level_helmgart_military_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_helmgart_military_story_seven_01",
			},
			sound_events = {
				[1] = "pbw_level_helmgart_military_story_seven_01",
			},
			sound_events_duration = {
				[1] = 5.0119791030884,
			},
		},
		pbw_level_helmgart_military_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_helmgart_military_story_two_01",
			},
			sound_events = {
				[1] = "pbw_level_helmgart_military_story_two_01",
			},
			sound_events_duration = {
				[1] = 2.8889791965485,
			},
		},
		pdr_level_helmgart_military_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_helmgart_military_story_four_01",
			},
			sound_events = {
				[1] = "pdr_level_helmgart_military_story_four_01",
			},
			sound_events_duration = {
				[1] = 1.3609791994095,
			},
		},
		pdr_level_helmgart_military_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_helmgart_military_story_nine_01",
			},
			sound_events = {
				[1] = "pdr_level_helmgart_military_story_nine_01",
			},
			sound_events_duration = {
				[1] = 1.5499792098999,
			},
		},
		pdr_level_helmgart_military_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_helmgart_military_story_six_01",
			},
			sound_events = {
				[1] = "pdr_level_helmgart_military_story_six_01",
			},
			sound_events_duration = {
				[1] = 6.227979183197,
			},
		},
		pdr_level_helmgart_military_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_helmgart_military_story_six_02",
			},
			sound_events = {
				[1] = "pdr_level_helmgart_military_story_six_02",
			},
			sound_events_duration = {
				[1] = 3.9279792308807,
			},
		},
		pdr_level_helmgart_military_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_helmgart_military_story_ten_01",
			},
			sound_events = {
				[1] = "pdr_level_helmgart_military_story_ten_01",
			},
			sound_events_duration = {
				[1] = 2.9279792308807,
			},
		},
		pdr_level_helmgart_military_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_helmgart_military_story_ten_02",
			},
			sound_events = {
				[1] = "pdr_level_helmgart_military_story_ten_02",
			},
			sound_events_duration = {
				[1] = 2.6839792728424,
			},
		},
		pdr_level_helmgart_military_story_ten_03 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_helmgart_military_story_ten_03",
			},
			sound_events = {
				[1] = "pdr_level_helmgart_military_story_ten_03",
			},
			sound_events_duration = {
				[1] = 3.0669791698456,
			},
		},
		pdr_level_helmgart_military_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_helmgart_military_story_three_01",
			},
			sound_events = {
				[1] = "pdr_level_helmgart_military_story_three_01",
			},
			sound_events_duration = {
				[1] = 6.879979133606,
			},
		},
		pdr_level_helmgart_military_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_helmgart_military_story_three_02",
			},
			sound_events = {
				[1] = "pdr_level_helmgart_military_story_three_02",
			},
			sound_events_duration = {
				[1] = 5.254979133606,
			},
		},
		pes_level_helmgart_military_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_eight_01",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_eight_01",
			},
			sound_events_duration = {
				[1] = 5.8639793395996,
			},
		},
		pes_level_helmgart_military_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_eight_02",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_eight_02",
			},
			sound_events_duration = {
				[1] = 2.3829791545868,
			},
		},
		pes_level_helmgart_military_story_eight_03 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_eight_03",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_eight_03",
			},
			sound_events_duration = {
				[1] = 8.0699787139893,
			},
		},
		pes_level_helmgart_military_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_five_01",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_five_01",
			},
			sound_events_duration = {
				[1] = 7.4189791679382,
			},
		},
		pes_level_helmgart_military_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_five_02",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_five_02",
			},
			sound_events_duration = {
				[1] = 3.9419791698456,
			},
		},
		pes_level_helmgart_military_story_five_a_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_five_a_01",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_five_a_01",
			},
			sound_events_duration = {
				[1] = 3.919979095459,
			},
		},
		pes_level_helmgart_military_story_five_a_03 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_five_a_03",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_five_a_03",
			},
			sound_events_duration = {
				[1] = 1.6539791822434,
			},
		},
		pes_level_helmgart_military_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_four_01",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_four_01",
			},
			sound_events_duration = {
				[1] = 2.2299792766571,
			},
		},
		pes_level_helmgart_military_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_four_02",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_four_02",
			},
			sound_events_duration = {
				[1] = 1.8879791498184,
			},
		},
		pes_level_helmgart_military_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_one_01",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_one_01",
			},
			sound_events_duration = {
				[1] = 1.4119791984558,
			},
		},
		pes_level_helmgart_military_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_one_02",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_one_02",
			},
			sound_events_duration = {
				[1] = 0.36297917366028,
			},
		},
		pes_level_helmgart_military_story_one_03 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_one_03",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_one_03",
			},
			sound_events_duration = {
				[1] = 5.0579791069031,
			},
		},
		pes_level_helmgart_military_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_six_01",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_six_01",
			},
			sound_events_duration = {
				[1] = 3.4839792251587,
			},
		},
		pes_level_helmgart_military_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_six_02",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_six_02",
			},
			sound_events_duration = {
				[1] = 1.3999791145325,
			},
		},
		pes_level_helmgart_military_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_three_01",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_three_01",
			},
			sound_events_duration = {
				[1] = 4.5499792098999,
			},
		},
		pes_level_helmgart_military_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_helmgart_military_story_three_02",
			},
			sound_events = {
				[1] = "pes_level_helmgart_military_story_three_02",
			},
			sound_events_duration = {
				[1] = 1.5159791707993,
			},
		},
		pwe_level_helmgart_military_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_helmgart_military_story_five_01",
			},
			sound_events = {
				[1] = "pwe_level_helmgart_military_story_five_01",
			},
			sound_events_duration = {
				[1] = 4.687979221344,
			},
		},
		pwe_level_helmgart_military_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_helmgart_military_story_five_02",
			},
			sound_events = {
				[1] = "pwe_level_helmgart_military_story_five_02",
			},
			sound_events_duration = {
				[1] = 2.9139790534973,
			},
		},
		pwe_level_helmgart_military_story_five_a_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_helmgart_military_story_five_a_01",
			},
			sound_events = {
				[1] = "pwe_level_helmgart_military_story_five_a_01",
			},
			sound_events_duration = {
				[1] = 3.284979224205,
			},
		},
		pwe_level_helmgart_military_story_five_a_04 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_helmgart_military_story_five_a_04",
			},
			sound_events = {
				[1] = "pwe_level_helmgart_military_story_five_a_04",
			},
			sound_events_duration = {
				[1] = 8.1929788589478,
			},
		},
		pwe_level_helmgart_military_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_helmgart_military_story_one_01",
			},
			sound_events = {
				[1] = "pwe_level_helmgart_military_story_one_01",
			},
			sound_events_duration = {
				[1] = 2.9189791679382,
			},
		},
		pwe_level_helmgart_military_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_helmgart_military_story_one_02",
			},
			sound_events = {
				[1] = "pwe_level_helmgart_military_story_one_02",
			},
			sound_events_duration = {
				[1] = 2.4659790992737,
			},
		},
		pwe_level_helmgart_military_story_one_03 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_helmgart_military_story_one_03",
			},
			sound_events = {
				[1] = "pwe_level_helmgart_military_story_one_03",
			},
			sound_events_duration = {
				[1] = 1.7740000486374,
			},
		},
		pwe_level_helmgart_military_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_helmgart_military_story_ten_01",
			},
			sound_events = {
				[1] = "pwe_level_helmgart_military_story_ten_01",
			},
			sound_events_duration = {
				[1] = 4.8919792175293,
			},
		},
		pwe_level_helmgart_military_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_helmgart_military_story_ten_02",
			},
			sound_events = {
				[1] = "pwe_level_helmgart_military_story_ten_02",
			},
			sound_events_duration = {
				[1] = 4.0249791145325,
			},
		},
		pwe_level_helmgart_military_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_helmgart_military_story_two_01",
			},
			sound_events = {
				[1] = "pwe_level_helmgart_military_story_two_01",
			},
			sound_events_duration = {
				[1] = 3.7179999351502,
			},
		},
		pwh_level_helmgart_military_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_helmgart_military_story_eight_01",
			},
			sound_events = {
				[1] = "pwh_level_helmgart_military_story_eight_01",
			},
			sound_events_duration = {
				[1] = 8.0979795455933,
			},
		},
		pwh_level_helmgart_military_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_helmgart_military_story_eight_02",
			},
			sound_events = {
				[1] = "pwh_level_helmgart_military_story_eight_02",
			},
			sound_events_duration = {
				[1] = 6.665979385376,
			},
		},
		pwh_level_helmgart_military_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_helmgart_military_story_nine_01",
			},
			sound_events = {
				[1] = "pwh_level_helmgart_military_story_nine_01",
			},
			sound_events_duration = {
				[1] = 6.0469789505005,
			},
		},
		pwh_level_helmgart_military_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_helmgart_military_story_seven_01",
			},
			sound_events = {
				[1] = "pwh_level_helmgart_military_story_seven_01",
			},
			sound_events_duration = {
				[1] = 9.5819787979126,
			},
		},
		pwh_level_helmgart_military_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_helmgart_military_story_seven_02",
			},
			sound_events = {
				[1] = "pwh_level_helmgart_military_story_seven_02",
			},
			sound_events_duration = {
				[1] = 9.3899793624878,
			},
		},
		pwh_level_helmgart_military_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_helmgart_military_story_two_01",
			},
			sound_events = {
				[1] = "pwh_level_helmgart_military_story_two_01",
			},
			sound_events_duration = {
				[1] = 4.1719789505005,
			},
		},
		pwh_level_helmgart_military_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_military",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_helmgart_military_story_two_02",
			},
			sound_events = {
				[1] = "pwh_level_helmgart_military_story_two_02",
			},
			sound_events_duration = {
				[1] = 9.0199794769287,
			},
		},
	})
end
