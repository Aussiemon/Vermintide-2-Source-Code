-- chunkname: @dialogues/generated/hero_conversations_farmlands.lua

return function ()
	define_rule({
		name = "pbw_level_farmlands_story_eleven_01",
		probability = 1,
		response = "pbw_level_farmlands_story_eleven_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pbw_level_farmlands_story_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_farmlands_story_eleven_01",
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
		name = "pbw_level_farmlands_story_eleven_02",
		probability = 1,
		response = "pbw_level_farmlands_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_eleven_01",
			},
			{
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
		name = "pbw_level_farmlands_story_eleven_03",
		probability = 1,
		response = "pbw_level_farmlands_story_eleven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_eleven_02",
			},
			{
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
		name = "pbw_level_farmlands_story_four_01",
		probability = 1,
		response = "pbw_level_farmlands_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_farmlands_story_four_01",
			},
			{
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
		name = "pbw_level_farmlands_story_one_01",
		probability = 1,
		response = "pbw_level_farmlands_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_one_02",
			},
			{
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
		name = "pbw_level_farmlands_story_seven_01",
		probability = 1,
		response = "pbw_level_farmlands_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_seven_01",
			},
			{
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
		name = "pbw_level_farmlands_story_ten_01",
		probability = 1,
		response = "pbw_level_farmlands_story_ten_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pbw_level_farmlands_story_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_farmlands_story_ten_01",
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
		name = "pbw_level_farmlands_story_ten_02",
		probability = 1,
		response = "pbw_level_farmlands_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_ten_01",
			},
			{
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
		name = "pbw_level_farmlands_story_ten_03",
		probability = 1,
		response = "pbw_level_farmlands_story_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_ten_02",
			},
			{
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
		name = "pbw_level_farmlands_story_three_01",
		probability = 1,
		response = "pbw_level_farmlands_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_three_01",
			},
			{
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
		name = "pbw_level_farmlands_story_three_02",
		probability = 1,
		response = "pbw_level_farmlands_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_three_01",
			},
			{
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
		name = "pdr_level_farmlands_story_five_01",
		probability = 1,
		response = "pdr_level_farmlands_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_five_01",
			},
			{
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
		name = "pdr_level_farmlands_story_five_02",
		probability = 1,
		response = "pdr_level_farmlands_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_five_01",
			},
			{
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
		name = "pdr_level_farmlands_story_four_01",
		probability = 1,
		response = "pdr_level_farmlands_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_four_01",
			},
			{
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
		name = "pdr_level_farmlands_story_four_02",
		probability = 1,
		response = "pdr_level_farmlands_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_four_01",
			},
			{
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
		name = "pdr_level_farmlands_story_twelve_01",
		probability = 1,
		response = "pdr_level_farmlands_story_twelve_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pdr_level_farmlands_story_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_farmlands_story_twelve_01",
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
		name = "pdr_level_farmlands_story_twelve_02",
		probability = 1,
		response = "pdr_level_farmlands_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_twelve_01",
			},
			{
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
		name = "pdr_level_farmlands_story_two_01",
		probability = 1,
		response = "pdr_level_farmlands_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_two_01",
			},
			{
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
		name = "pes_level_farmlands_story_eight_01",
		probability = 1,
		response = "pes_level_farmlands_story_eight_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_eight_01",
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
		name = "pes_level_farmlands_story_eight_02",
		probability = 1,
		response = "pes_level_farmlands_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_eight_02",
			},
			{
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
		name = "pes_level_farmlands_story_five_01",
		probability = 1,
		response = "pes_level_farmlands_story_five_01",
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
				"witch_hunter",
				OP.EQ,
				1,
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
				"once_per_level_pes_level_farmlands_story_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_five_01",
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
		name = "pes_level_farmlands_story_four_01",
		probability = 1,
		response = "pes_level_farmlands_story_four_01",
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
				"bright_wizard",
				OP.EQ,
				1,
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
				"once_per_level_pes_level_farmlands_story_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_four_01",
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
		name = "pes_level_farmlands_story_fourteen_01",
		probability = 1,
		response = "pes_level_farmlands_story_fourteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_fourteen_01",
			},
			{
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
		name = "pes_level_farmlands_story_one_01",
		probability = 1,
		response = "pes_level_farmlands_story_one_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_one_01",
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
		name = "pes_level_farmlands_story_one_02",
		probability = 1,
		response = "pes_level_farmlands_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_one_01",
			},
			{
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
		name = "pes_level_farmlands_story_seven_01",
		probability = 1,
		response = "pes_level_farmlands_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_seven_01",
			},
			{
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
		name = "pes_level_farmlands_story_thirteen_01",
		probability = 1,
		response = "pes_level_farmlands_story_thirteen_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_thirteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_thirteen_01",
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
		name = "pes_level_farmlands_story_two_01",
		probability = 1,
		response = "pes_level_farmlands_story_two_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_two_01",
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
		name = "pes_level_farmlands_story_two_02",
		probability = 1,
		response = "pes_level_farmlands_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_two_02",
			},
			{
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
		name = "pwe_level_farmlands_story_nine_01",
		probability = 1,
		response = "pwe_level_farmlands_story_nine_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pwe_level_farmlands_story_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_farmlands_story_nine_01",
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
		name = "pwe_level_farmlands_story_nine_02",
		probability = 1,
		response = "pwe_level_farmlands_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_nine_01",
			},
			{
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
		name = "pwe_level_farmlands_story_nine_03",
		probability = 1,
		response = "pwe_level_farmlands_story_nine_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_nine_02",
			},
			{
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
		name = "pwe_level_farmlands_story_one_01",
		probability = 1,
		response = "pwe_level_farmlands_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_one_01",
			},
			{
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
		name = "pwe_level_farmlands_story_six_01",
		probability = 1,
		response = "pwe_level_farmlands_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_six_01",
			},
			{
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
		name = "pwe_level_farmlands_story_six_02",
		probability = 1,
		response = "pwe_level_farmlands_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_six_02",
			},
			{
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
		name = "pwe_level_farmlands_story_six_03",
		probability = 1,
		response = "pwe_level_farmlands_story_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_six_03",
			},
			{
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
		name = "pwe_level_farmlands_story_ten_01",
		probability = 1,
		response = "pwe_level_farmlands_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_ten_01",
			},
			{
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
		name = "pwe_level_farmlands_story_ten_02",
		probability = 1,
		response = "pwe_level_farmlands_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_ten_02",
			},
			{
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
		name = "pwe_level_farmlands_story_ten_03",
		probability = 1,
		response = "pwe_level_farmlands_story_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_ten_03",
			},
			{
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
		name = "pwe_level_farmlands_story_thirteen_02",
		probability = 1,
		response = "pwe_level_farmlands_story_thirteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_thirteen_02",
			},
			{
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
		name = "pwe_level_farmlands_story_three_01",
		probability = 1,
		response = "pwe_level_farmlands_story_three_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pwe_level_farmlands_story_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_farmlands_story_three_01",
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
		name = "pwe_level_farmlands_story_twelve_01",
		probability = 1,
		response = "pwe_level_farmlands_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_farmlands_story_twelve_01",
			},
			{
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
		name = "pwe_level_farmlands_story_twelve_02",
		probability = 1,
		response = "pwe_level_farmlands_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_farmlands_story_twelve_02",
			},
			{
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
		name = "pwe_level_farmlands_story_two_01",
		probability = 1,
		response = "pwe_level_farmlands_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_two_01",
			},
			{
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
		name = "pwe_level_farmlands_story_two_02",
		probability = 1,
		response = "pwe_level_farmlands_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_farmlands_story_two_01",
			},
			{
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
		name = "pwe_level_farmlands_story_two_03",
		probability = 1,
		response = "pwe_level_farmlands_story_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_two_02",
			},
			{
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
		name = "pwh_level_farmlands_story_eight_02",
		probability = 1,
		response = "pwh_level_farmlands_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_eight_01",
			},
			{
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
		name = "pwh_level_farmlands_story_eight_03",
		probability = 1,
		response = "pwh_level_farmlands_story_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_eight_02",
			},
			{
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
		name = "pwh_level_farmlands_story_eleven_01",
		probability = 1,
		response = "pwh_level_farmlands_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_eleven_01",
			},
			{
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
		name = "pwh_level_farmlands_story_eleven_02",
		probability = 1,
		response = "pwh_level_farmlands_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_eleven_02",
			},
			{
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
		name = "pwh_level_farmlands_story_eleven_03",
		probability = 1,
		response = "pwh_level_farmlands_story_eleven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_eleven_03",
			},
			{
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
		name = "pwh_level_farmlands_story_five_01",
		probability = 1,
		response = "pwh_level_farmlands_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_farmlands_story_five_01",
			},
			{
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
		name = "pwh_level_farmlands_story_fourteen_01",
		probability = 1,
		response = "pwh_level_farmlands_story_fourteen_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pwh_level_farmlands_story_fourteen_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_farmlands_story_fourteen_01",
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
		name = "pwh_level_farmlands_story_fourteen_02",
		probability = 1,
		response = "pwh_level_farmlands_story_fourteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_fourteen_01",
			},
			{
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
		name = "pwh_level_farmlands_story_nine_01",
		probability = 1,
		response = "pwh_level_farmlands_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_nine_01",
			},
			{
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
		name = "pwh_level_farmlands_story_nine_02",
		probability = 1,
		response = "pwh_level_farmlands_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_nine_02",
			},
			{
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
		name = "pwh_level_farmlands_story_seven_01",
		probability = 1,
		response = "pwh_level_farmlands_story_seven_01",
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
				"empire_soldier",
				OP.EQ,
				1,
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
				"once_per_level_pwh_level_farmlands_story_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_farmlands_story_seven_01",
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
		name = "pwh_level_farmlands_story_six_01",
		probability = 1,
		response = "pwh_level_farmlands_story_six_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600,
			},
			{
				"faction_memory",
				"once_per_level_pwh_level_farmlands_story_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_farmlands_story_six_01",
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
		name = "pwh_level_farmlands_story_six_02",
		probability = 1,
		response = "pwh_level_farmlands_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_six_01",
			},
			{
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
		name = "pwh_level_farmlands_story_six_03",
		probability = 1,
		response = "pwh_level_farmlands_story_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_six_02",
			},
			{
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
		name = "pwh_level_farmlands_story_thirteen_02",
		probability = 1,
		response = "pwh_level_farmlands_story_thirteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_thirteen_01",
			},
			{
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
		name = "pwh_level_farmlands_story_thirteen_03",
		probability = 1,
		response = "pwh_level_farmlands_story_thirteen_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_thirteen_02",
			},
			{
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
		name = "pwh_level_farmlands_story_three_01",
		probability = 1,
		response = "pwh_level_farmlands_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_three_01",
			},
			{
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
		pbw_level_farmlands_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_farmlands_story_eleven_01",
			},
			sound_events = {
				[1] = "pbw_level_farmlands_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 4.8685626983643,
			},
		},
		pbw_level_farmlands_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_farmlands_story_eleven_02",
			},
			sound_events = {
				[1] = "pbw_level_farmlands_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 1.5045207738876,
			},
		},
		pbw_level_farmlands_story_eleven_03 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_farmlands_story_eleven_03",
			},
			sound_events = {
				[1] = "pbw_level_farmlands_story_eleven_03",
			},
			sound_events_duration = {
				[1] = 6.3526043891907,
			},
		},
		pbw_level_farmlands_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_farmlands_story_four_01",
			},
			sound_events = {
				[1] = "pbw_level_farmlands_story_four_01",
			},
			sound_events_duration = {
				[1] = 1.420041680336,
			},
		},
		pbw_level_farmlands_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_farmlands_story_one_01",
			},
			sound_events = {
				[1] = "pbw_level_farmlands_story_one_01",
			},
			sound_events_duration = {
				[1] = 2.5013332366943,
			},
		},
		pbw_level_farmlands_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_farmlands_story_seven_01",
			},
			sound_events = {
				[1] = "pbw_level_farmlands_story_seven_01",
			},
			sound_events_duration = {
				[1] = 4.6083331108093,
			},
		},
		pbw_level_farmlands_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_farmlands_story_ten_01",
			},
			sound_events = {
				[1] = "pbw_level_farmlands_story_ten_01",
			},
			sound_events_duration = {
				[1] = 1.9623124599457,
			},
		},
		pbw_level_farmlands_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_farmlands_story_ten_02",
			},
			sound_events = {
				[1] = "pbw_level_farmlands_story_ten_02",
			},
			sound_events_duration = {
				[1] = 5.2187085151672,
			},
		},
		pbw_level_farmlands_story_ten_03 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_farmlands_story_ten_03",
			},
			sound_events = {
				[1] = "pbw_level_farmlands_story_ten_03",
			},
			sound_events_duration = {
				[1] = 2.1339790821075,
			},
		},
		pbw_level_farmlands_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_farmlands_story_three_01",
			},
			sound_events = {
				[1] = "pbw_level_farmlands_story_three_01",
			},
			sound_events_duration = {
				[1] = 4.0402917861939,
			},
		},
		pbw_level_farmlands_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_farmlands_story_three_02",
			},
			sound_events = {
				[1] = "pbw_level_farmlands_story_three_02",
			},
			sound_events_duration = {
				[1] = 3.3455834388733,
			},
		},
		pdr_level_farmlands_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_farmlands_story_five_01",
			},
			sound_events = {
				[1] = "pdr_level_farmlands_story_five_01",
			},
			sound_events_duration = {
				[1] = 4.9099373817444,
			},
		},
		pdr_level_farmlands_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_farmlands_story_five_02",
			},
			sound_events = {
				[1] = "pdr_level_farmlands_story_five_02",
			},
			sound_events_duration = {
				[1] = 3.737104177475,
			},
		},
		pdr_level_farmlands_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_farmlands_story_four_01",
			},
			sound_events = {
				[1] = "pdr_level_farmlands_story_four_01",
			},
			sound_events_duration = {
				[1] = 2.4485833644867,
			},
		},
		pdr_level_farmlands_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_farmlands_story_four_02",
			},
			sound_events = {
				[1] = "pdr_level_farmlands_story_four_02",
			},
			sound_events_duration = {
				[1] = 3.1332499980927,
			},
		},
		pdr_level_farmlands_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_farmlands_story_twelve_01",
			},
			sound_events = {
				[1] = "pdr_level_farmlands_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.7648334503174,
			},
		},
		pdr_level_farmlands_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_farmlands_story_twelve_02",
			},
			sound_events = {
				[1] = "pdr_level_farmlands_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 2.4800832271576,
			},
		},
		pdr_level_farmlands_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_farmlands_story_two_01",
			},
			sound_events = {
				[1] = "pdr_level_farmlands_story_two_01",
			},
			sound_events_duration = {
				[1] = 8.2968120574951,
			},
		},
		pes_level_farmlands_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_eight_01",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_eight_01",
			},
			sound_events_duration = {
				[1] = 4.827291727066,
			},
		},
		pes_level_farmlands_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_eight_02",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_eight_02",
			},
			sound_events_duration = {
				[1] = 2.8288750648499,
			},
		},
		pes_level_farmlands_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_five_01",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_five_01",
			},
			sound_events_duration = {
				[1] = 5.0301666259766,
			},
		},
		pes_level_farmlands_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_four_01",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_four_01",
			},
			sound_events_duration = {
				[1] = 4.6477084159851,
			},
		},
		pes_level_farmlands_story_fourteen_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_fourteen_01",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_fourteen_01",
			},
			sound_events_duration = {
				[1] = 4.8675208091736,
			},
		},
		pes_level_farmlands_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_one_01",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_one_01",
			},
			sound_events_duration = {
				[1] = 4.0865416526794,
			},
		},
		pes_level_farmlands_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_one_02",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_one_02",
			},
			sound_events_duration = {
				[1] = 4.5065832138061,
			},
		},
		pes_level_farmlands_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_seven_01",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_seven_01",
			},
			sound_events_duration = {
				[1] = 1.6913958787918,
			},
		},
		pes_level_farmlands_story_thirteen_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_thirteen_01",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_thirteen_01",
			},
			sound_events_duration = {
				[1] = 5.8891248703003,
			},
		},
		pes_level_farmlands_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_two_01",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_two_01",
			},
			sound_events_duration = {
				[1] = 6.5535626411438,
			},
		},
		pes_level_farmlands_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_farmlands_story_two_02",
			},
			sound_events = {
				[1] = "pes_level_farmlands_story_two_02",
			},
			sound_events_duration = {
				[1] = 3.2353541851044,
			},
		},
		pwe_level_farmlands_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_nine_01",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_nine_01",
			},
			sound_events_duration = {
				[1] = 5.4439167976379,
			},
		},
		pwe_level_farmlands_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_nine_02",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_nine_02",
			},
			sound_events_duration = {
				[1] = 7.7117710113525,
			},
		},
		pwe_level_farmlands_story_nine_03 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_nine_03",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_nine_03",
			},
			sound_events_duration = {
				[1] = 4.3165001869202,
			},
		},
		pwe_level_farmlands_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_one_01",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_one_01",
			},
			sound_events_duration = {
				[1] = 7.7304372787476,
			},
		},
		pwe_level_farmlands_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_six_01",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_six_01",
			},
			sound_events_duration = {
				[1] = 4.4418749809265,
			},
		},
		pwe_level_farmlands_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_six_02",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_six_02",
			},
			sound_events_duration = {
				[1] = 3.5635209083557,
			},
		},
		pwe_level_farmlands_story_six_03 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_six_03",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_six_03",
			},
			sound_events_duration = {
				[1] = 4.1341667175293,
			},
		},
		pwe_level_farmlands_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_ten_01",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_ten_01",
			},
			sound_events_duration = {
				[1] = 0.95168751478195,
			},
		},
		pwe_level_farmlands_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_ten_02",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_ten_02",
			},
			sound_events_duration = {
				[1] = 2.0638332366943,
			},
		},
		pwe_level_farmlands_story_ten_03 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_ten_03",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_ten_03",
			},
			sound_events_duration = {
				[1] = 2.0848541259766,
			},
		},
		pwe_level_farmlands_story_thirteen_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_thirteen_02",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_thirteen_02",
			},
			sound_events_duration = {
				[1] = 2.8461666107178,
			},
		},
		pwe_level_farmlands_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_three_01",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_three_01",
			},
			sound_events_duration = {
				[1] = 4.8210206031799,
			},
		},
		pwe_level_farmlands_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_twelve_01",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.7319166660309,
			},
		},
		pwe_level_farmlands_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_twelve_02",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 7.3082499504089,
			},
		},
		pwe_level_farmlands_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_two_01",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_two_01",
			},
			sound_events_duration = {
				[1] = 6.6114373207092,
			},
		},
		pwe_level_farmlands_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_two_02",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_two_02",
			},
			sound_events_duration = {
				[1] = 3.6213126182556,
			},
		},
		pwe_level_farmlands_story_two_03 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_farmlands_story_two_03",
			},
			sound_events = {
				[1] = "pwe_level_farmlands_story_two_03",
			},
			sound_events_duration = {
				[1] = 4.3334794044495,
			},
		},
		pwh_level_farmlands_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_eight_02",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_eight_02",
			},
			sound_events_duration = {
				[1] = 3.6180624961853,
			},
		},
		pwh_level_farmlands_story_eight_03 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_eight_03",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_eight_03",
			},
			sound_events_duration = {
				[1] = 6.5187501907349,
			},
		},
		pwh_level_farmlands_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_eleven_01",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 6.1902918815613,
			},
		},
		pwh_level_farmlands_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_eleven_02",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 2.3693749904633,
			},
		},
		pwh_level_farmlands_story_eleven_03 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_eleven_03",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_eleven_03",
			},
			sound_events_duration = {
				[1] = 7.4405417442322,
			},
		},
		pwh_level_farmlands_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_five_01",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_five_01",
			},
			sound_events_duration = {
				[1] = 4.2492499351502,
			},
		},
		pwh_level_farmlands_story_fourteen_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_fourteen_01",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_fourteen_01",
			},
			sound_events_duration = {
				[1] = 2.4721667766571,
			},
		},
		pwh_level_farmlands_story_fourteen_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_fourteen_02",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_fourteen_02",
			},
			sound_events_duration = {
				[1] = 8.541895866394,
			},
		},
		pwh_level_farmlands_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_nine_01",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_nine_01",
			},
			sound_events_duration = {
				[1] = 2.7480208873749,
			},
		},
		pwh_level_farmlands_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_nine_02",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_nine_02",
			},
			sound_events_duration = {
				[1] = 3.0913333892822,
			},
		},
		pwh_level_farmlands_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_seven_01",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_seven_01",
			},
			sound_events_duration = {
				[1] = 3.9082500934601,
			},
		},
		pwh_level_farmlands_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_six_01",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_six_01",
			},
			sound_events_duration = {
				[1] = 5.6055207252502,
			},
		},
		pwh_level_farmlands_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_six_02",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_six_02",
			},
			sound_events_duration = {
				[1] = 0.97539585828781,
			},
		},
		pwh_level_farmlands_story_six_03 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_six_03",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_six_03",
			},
			sound_events_duration = {
				[1] = 3.0625624656677,
			},
		},
		pwh_level_farmlands_story_thirteen_02 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_thirteen_02",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_thirteen_02",
			},
			sound_events_duration = {
				[1] = 5.477020740509,
			},
		},
		pwh_level_farmlands_story_thirteen_03 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_thirteen_03",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_thirteen_03",
			},
			sound_events_duration = {
				[1] = 8.1850833892822,
			},
		},
		pwh_level_farmlands_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_farmlands",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_farmlands_story_three_01",
			},
			sound_events = {
				[1] = "pwh_level_farmlands_story_three_01",
			},
			sound_events_duration = {
				[1] = 3.4277708530426,
			},
		},
	})
end
