-- chunkname: @dialogues/generated/hero_conversations_ground_zero.lua

return function ()
	define_rule({
		name = "pbw_level_ground_zero_story_eleven_01",
		probability = 1,
		response = "pbw_level_ground_zero_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_ground_zero_story_eleven_01",
			},
			{
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
		name = "pbw_level_ground_zero_story_eleven_02",
		probability = 1,
		response = "pbw_level_ground_zero_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_ground_zero_story_eleven_02",
			},
			{
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
		name = "pbw_level_ground_zero_story_one_01",
		probability = 1,
		response = "pbw_level_ground_zero_story_one_01",
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
				"level_ground_zero_landslide",
				OP.NOT,
				"level_ground_zero_landslide",
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
				"once_per_level_pbw_level_ground_zero_story_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_ground_zero_story_one_01",
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
		name = "pbw_level_ground_zero_story_one_02",
		probability = 1,
		response = "pbw_level_ground_zero_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_ground_zero_story_one_01",
			},
			{
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
		name = "pbw_level_ground_zero_story_six_01",
		probability = 1,
		response = "pbw_level_ground_zero_story_six_01",
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
				"level_ground_zero_landslide",
				OP.NOT,
				"level_ground_zero_landslide",
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
				"once_per_level_pbw_level_ground_zero_story_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_ground_zero_story_six_01",
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
		name = "pbw_level_ground_zero_story_six_02",
		probability = 1,
		response = "pbw_level_ground_zero_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_ground_zero_story_six_01",
			},
			{
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
		name = "pbw_level_ground_zero_story_ten_01",
		probability = 1,
		response = "pbw_level_ground_zero_story_ten_01",
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
				"level_ground_zero_landslide",
				OP.NOT,
				"level_ground_zero_landslide",
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
				"once_per_level_pbw_level_ground_zero_story_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_ground_zero_story_ten_01",
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
		name = "pbw_level_ground_zero_story_ten_02",
		probability = 1,
		response = "pbw_level_ground_zero_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_ground_zero_story_ten_01",
			},
			{
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
		name = "pbw_level_ground_zero_story_three_01",
		probability = 1,
		response = "pbw_level_ground_zero_story_three_01",
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
				"level_ground_zero_landslide",
				OP.NOT,
				"level_ground_zero_landslide",
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
				"once_per_level_pbw_level_ground_zero_story_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_ground_zero_story_three_01",
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
		name = "pbw_level_ground_zero_story_three_02",
		probability = 1,
		response = "pbw_level_ground_zero_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_ground_zero_story_three_01",
			},
			{
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
		name = "pdr_level_ground_zero_story_nine_01",
		probability = 1,
		response = "pdr_level_ground_zero_story_nine_01",
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
				"level_ground_zero_landslide",
				OP.NOT,
				"level_ground_zero_landslide",
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
				"once_per_level_pdr_level_ground_zero_story_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_ground_zero_story_nine_01",
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
		name = "pdr_level_ground_zero_story_nine_02",
		probability = 1,
		response = "pdr_level_ground_zero_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_ground_zero_story_nine_01",
			},
			{
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
		name = "pdr_level_ground_zero_story_one_01",
		probability = 1,
		response = "pdr_level_ground_zero_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_ground_zero_story_one_01",
			},
			{
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
		name = "pdr_level_ground_zero_story_one_02",
		probability = 1,
		response = "pdr_level_ground_zero_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_ground_zero_story_one_02",
			},
			{
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
		name = "pdr_level_ground_zero_story_twelve_01",
		probability = 1,
		response = "pdr_level_ground_zero_story_twelve_01",
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
				"faction_memory",
				"level_ground_zero_landslide",
				OP.NOT,
				"level_ground_zero_landslide",
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
				"once_per_level_pdr_level_ground_zero_story_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_ground_zero_story_twelve_01",
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
		name = "pdr_level_ground_zero_story_twelve_02",
		probability = 1,
		response = "pdr_level_ground_zero_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_ground_zero_story_twelve_02",
			},
			{
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
		name = "pes_level_ground_zero_story_eleven_01",
		probability = 1,
		response = "pes_level_ground_zero_story_eleven_01",
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
				"level_ground_zero_landslide",
				OP.NOT,
				"level_ground_zero_landslide",
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
				"once_per_level_pes_level_ground_zero_story_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_ground_zero_story_eleven_01",
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
		name = "pes_level_ground_zero_story_eleven_02",
		probability = 1,
		response = "pes_level_ground_zero_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_ground_zero_story_eleven_01",
			},
			{
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
		name = "pes_level_ground_zero_story_four_01",
		probability = 1,
		response = "pes_level_ground_zero_story_four_01",
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
				"level_ground_zero_landslide",
				OP.NOT,
				"level_ground_zero_landslide",
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
				"once_per_level_pes_level_ground_zero_story_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_ground_zero_story_four_01",
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
		name = "pes_level_ground_zero_story_four_02",
		probability = 1,
		response = "pes_level_ground_zero_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_ground_zero_story_four_01",
			},
			{
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
		name = "pes_level_ground_zero_story_seven_01",
		probability = 1,
		response = "pes_level_ground_zero_story_seven_01",
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
				"level_ground_zero_landslide",
				OP.NOT,
				"level_ground_zero_landslide",
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
				"once_per_level_pes_level_ground_zero_story_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_ground_zero_story_seven_01",
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
		name = "pes_level_ground_zero_story_seven_02",
		probability = 1,
		response = "pes_level_ground_zero_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_ground_zero_story_seven_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_story_two_01",
		probability = 1,
		response = "pes_level_ground_zero_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_ground_zero_story_two_01",
			},
			{
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
		name = "pes_level_ground_zero_story_two_02",
		probability = 1,
		response = "pes_level_ground_zero_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_ground_zero_story_two_02",
			},
			{
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
		name = "pwe_level_ground_zero_story_eight_01",
		probability = 1,
		response = "pwe_level_ground_zero_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_ground_zero_story_eight_01",
			},
			{
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
		name = "pwe_level_ground_zero_story_eight_02",
		probability = 1,
		response = "pwe_level_ground_zero_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_ground_zero_story_eight_02",
			},
			{
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
		name = "pwe_level_ground_zero_story_nine_01",
		probability = 1,
		response = "pwe_level_ground_zero_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_ground_zero_story_nine_01",
			},
			{
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
		name = "pwe_level_ground_zero_story_nine_02",
		probability = 1,
		response = "pwe_level_ground_zero_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_ground_zero_story_nine_02",
			},
			{
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
		name = "pwe_level_ground_zero_story_seven_01",
		probability = 1,
		response = "pwe_level_ground_zero_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_ground_zero_story_seven_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_level_ground_zero_story_seven_02",
		probability = 1,
		response = "pwe_level_ground_zero_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_ground_zero_story_seven_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_level_ground_zero_story_six_01",
		probability = 1,
		response = "pwe_level_ground_zero_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_ground_zero_story_six_01",
			},
			{
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
		name = "pwe_level_ground_zero_story_six_02",
		probability = 1,
		response = "pwe_level_ground_zero_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_ground_zero_story_six_02",
			},
			{
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
		name = "pwe_level_ground_zero_story_ten_01",
		probability = 1,
		response = "pwe_level_ground_zero_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_ground_zero_story_ten_01",
			},
			{
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
		name = "pwe_level_ground_zero_story_ten_02",
		probability = 1,
		response = "pwe_level_ground_zero_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_ground_zero_story_ten_02",
			},
			{
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
		name = "pwe_level_ground_zero_story_two_01",
		probability = 1,
		response = "pwe_level_ground_zero_story_two_01",
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
				"faction_memory",
				"level_ground_zero_landslide",
				OP.NOT,
				"level_ground_zero_landslide",
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
				"once_per_level_pwe_level_ground_zero_story_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_ground_zero_story_two_01",
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
		name = "pwe_level_ground_zero_story_two_02",
		probability = 1,
		response = "pwe_level_ground_zero_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_ground_zero_story_two_01",
			},
			{
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
		name = "pwh_level_ground_zero_story_eight_01",
		probability = 1,
		response = "pwh_level_ground_zero_story_eight_01",
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
				"level_ground_zero_landslide",
				OP.NOT,
				"level_ground_zero_landslide",
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
				"once_per_level_pwh_level_ground_zero_story_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_ground_zero_story_eight_01",
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
		name = "pwh_level_ground_zero_story_eight_02",
		probability = 1,
		response = "pwh_level_ground_zero_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_ground_zero_story_eight_01",
			},
			{
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
		name = "pwh_level_ground_zero_story_four_01",
		probability = 1,
		response = "pwh_level_ground_zero_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_ground_zero_story_four_01",
			},
			{
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
		name = "pwh_level_ground_zero_story_three_01",
		probability = 1,
		response = "pwh_level_ground_zero_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_ground_zero_story_three_01",
			},
			{
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
		name = "pwh_level_ground_zero_story_three_02",
		probability = 1,
		response = "pwh_level_ground_zero_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_ground_zero_story_three_02",
			},
			{
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
		name = "pwh_level_ground_zero_story_twelve_01",
		probability = 1,
		response = "pwh_level_ground_zero_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_ground_zero_story_twelve_02",
			},
			{
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
		name = "pwh_level_ground_zero_story_twelve_02",
		probability = 1,
		response = "pwh_level_ground_zero_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_ground_zero_story_twelve_01",
			},
			{
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
		pbw_level_ground_zero_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_ground_zero_story_eleven_01",
			},
			sound_events = {
				[1] = "pbw_level_ground_zero_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.8706874847412,
			},
		},
		pbw_level_ground_zero_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_ground_zero_story_eleven_02",
			},
			sound_events = {
				[1] = "pbw_level_ground_zero_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 3.4606873989105,
			},
		},
		pbw_level_ground_zero_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_ground_zero_story_one_01",
			},
			sound_events = {
				[1] = "pbw_level_ground_zero_story_one_01",
			},
			sound_events_duration = {
				[1] = 4.9997291564941,
			},
		},
		pbw_level_ground_zero_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_ground_zero_story_one_02",
			},
			sound_events = {
				[1] = "pbw_level_ground_zero_story_one_02",
			},
			sound_events_duration = {
				[1] = 1.1582916975021,
			},
		},
		pbw_level_ground_zero_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_ground_zero_story_six_01",
			},
			sound_events = {
				[1] = "pbw_level_ground_zero_story_six_01",
			},
			sound_events_duration = {
				[1] = 4.701208114624,
			},
		},
		pbw_level_ground_zero_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_ground_zero_story_six_02",
			},
			sound_events = {
				[1] = "pbw_level_ground_zero_story_six_02",
			},
			sound_events_duration = {
				[1] = 4.3810210227966,
			},
		},
		pbw_level_ground_zero_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_ground_zero_story_ten_01",
			},
			sound_events = {
				[1] = "pbw_level_ground_zero_story_ten_01",
			},
			sound_events_duration = {
				[1] = 6.1303749084473,
			},
		},
		pbw_level_ground_zero_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_ground_zero_story_ten_02",
			},
			sound_events = {
				[1] = "pbw_level_ground_zero_story_ten_02",
			},
			sound_events_duration = {
				[1] = 2.8613750934601,
			},
		},
		pbw_level_ground_zero_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_ground_zero_story_three_01",
			},
			sound_events = {
				[1] = "pbw_level_ground_zero_story_three_01",
			},
			sound_events_duration = {
				[1] = 5.0359373092651,
			},
		},
		pbw_level_ground_zero_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_ground_zero_story_three_02",
			},
			sound_events = {
				[1] = "pbw_level_ground_zero_story_three_02",
			},
			sound_events_duration = {
				[1] = 4.1956248283386,
			},
		},
		pdr_level_ground_zero_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_ground_zero_story_nine_01",
			},
			sound_events = {
				[1] = "pdr_level_ground_zero_story_nine_01",
			},
			sound_events_duration = {
				[1] = 7.1077709197998,
			},
		},
		pdr_level_ground_zero_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_ground_zero_story_nine_02",
			},
			sound_events = {
				[1] = "pdr_level_ground_zero_story_nine_02",
			},
			sound_events_duration = {
				[1] = 2.6974792480469,
			},
		},
		pdr_level_ground_zero_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_ground_zero_story_one_01",
			},
			sound_events = {
				[1] = "pdr_level_ground_zero_story_one_01",
			},
			sound_events_duration = {
				[1] = 8.3395624160767,
			},
		},
		pdr_level_ground_zero_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_ground_zero_story_one_02",
			},
			sound_events = {
				[1] = "pdr_level_ground_zero_story_one_02",
			},
			sound_events_duration = {
				[1] = 3.938812494278,
			},
		},
		pdr_level_ground_zero_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_level_ground_zero_story_twelve_01",
			},
			sound_events = {
				[1] = "pdr_level_ground_zero_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 5.7736248970032,
			},
		},
		pdr_level_ground_zero_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_ground_zero_story_twelve_02",
			},
			sound_events = {
				[1] = "pdr_level_ground_zero_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 7.2628960609436,
			},
		},
		pes_level_ground_zero_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_ground_zero_story_eleven_01",
			},
			sound_events = {
				[1] = "pes_level_ground_zero_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 6.4214582443237,
			},
		},
		pes_level_ground_zero_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_ground_zero_story_eleven_02",
			},
			sound_events = {
				[1] = "pes_level_ground_zero_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 1.6136457920075,
			},
		},
		pes_level_ground_zero_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_ground_zero_story_four_01",
			},
			sound_events = {
				[1] = "pes_level_ground_zero_story_four_01",
			},
			sound_events_duration = {
				[1] = 2.8355417251587,
			},
		},
		pes_level_ground_zero_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_ground_zero_story_four_02",
			},
			sound_events = {
				[1] = "pes_level_ground_zero_story_four_02",
			},
			sound_events_duration = {
				[1] = 1.9314999580383,
			},
		},
		pes_level_ground_zero_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_ground_zero_story_seven_01",
			},
			sound_events = {
				[1] = "pes_level_ground_zero_story_seven_01",
			},
			sound_events_duration = {
				[1] = 4.2461252212524,
			},
		},
		pes_level_ground_zero_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_ground_zero_story_seven_02",
			},
			sound_events = {
				[1] = "pes_level_ground_zero_story_seven_02",
			},
			sound_events_duration = {
				[1] = 2.284083366394,
			},
		},
		pes_level_ground_zero_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_ground_zero_story_two_01",
			},
			sound_events = {
				[1] = "pes_level_ground_zero_story_two_01",
			},
			sound_events_duration = {
				[1] = 5.2305002212524,
			},
		},
		pes_level_ground_zero_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_ground_zero_story_two_02",
			},
			sound_events = {
				[1] = "pes_level_ground_zero_story_two_02",
			},
			sound_events_duration = {
				[1] = 8.7822704315185,
			},
		},
		pwe_level_ground_zero_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_eight_01",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_eight_01",
			},
			sound_events_duration = {
				[1] = 1.829958319664,
			},
		},
		pwe_level_ground_zero_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_eight_02",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_eight_02",
			},
			sound_events_duration = {
				[1] = 5.9905624389648,
			},
		},
		pwe_level_ground_zero_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_nine_01",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_nine_01",
			},
			sound_events_duration = {
				[1] = 5.8011040687561,
			},
		},
		pwe_level_ground_zero_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_nine_02",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_nine_02",
			},
			sound_events_duration = {
				[1] = 2.7184584140778,
			},
		},
		pwe_level_ground_zero_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_seven_01",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_seven_01",
			},
			sound_events_duration = {
				[1] = 5.3786039352417,
			},
		},
		pwe_level_ground_zero_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_seven_02",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_seven_02",
			},
			sound_events_duration = {
				[1] = 6.6902084350586,
			},
		},
		pwe_level_ground_zero_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_six_01",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_six_01",
			},
			sound_events_duration = {
				[1] = 3.4321875572205,
			},
		},
		pwe_level_ground_zero_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_six_02",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_six_02",
			},
			sound_events_duration = {
				[1] = 3.4273750782013,
			},
		},
		pwe_level_ground_zero_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_ten_01",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_ten_01",
			},
			sound_events_duration = {
				[1] = 5.8444375991821,
			},
		},
		pwe_level_ground_zero_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_ten_02",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_ten_02",
			},
			sound_events_duration = {
				[1] = 3.9926249980927,
			},
		},
		pwe_level_ground_zero_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_two_01",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_two_01",
			},
			sound_events_duration = {
				[1] = 4.9549999237061,
			},
		},
		pwe_level_ground_zero_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_ground_zero_story_two_02",
			},
			sound_events = {
				[1] = "pwe_level_ground_zero_story_two_02",
			},
			sound_events_duration = {
				[1] = 2.9235832691193,
			},
		},
		pwh_level_ground_zero_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_ground_zero_story_eight_01",
			},
			sound_events = {
				[1] = "pwh_level_ground_zero_story_eight_01",
			},
			sound_events_duration = {
				[1] = 5.5637083053589,
			},
		},
		pwh_level_ground_zero_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_ground_zero_story_eight_02",
			},
			sound_events = {
				[1] = "pwh_level_ground_zero_story_eight_02",
			},
			sound_events_duration = {
				[1] = 1.7372708320618,
			},
		},
		pwh_level_ground_zero_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_ground_zero_story_four_01",
			},
			sound_events = {
				[1] = "pwh_level_ground_zero_story_four_01",
			},
			sound_events_duration = {
				[1] = 6.6082081794739,
			},
		},
		pwh_level_ground_zero_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_ground_zero_story_three_01",
			},
			sound_events = {
				[1] = "pwh_level_ground_zero_story_three_01",
			},
			sound_events_duration = {
				[1] = 6.5702085494995,
			},
		},
		pwh_level_ground_zero_story_three_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_ground_zero_story_three_02",
			},
			sound_events = {
				[1] = "pwh_level_ground_zero_story_three_02",
			},
			sound_events_duration = {
				[1] = 2.9914166927338,
			},
		},
		pwh_level_ground_zero_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_ground_zero_story_twelve_01",
			},
			sound_events = {
				[1] = "pwh_level_ground_zero_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.6645624637604,
			},
		},
		pwh_level_ground_zero_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_ground_zero",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_ground_zero_story_twelve_02",
			},
			sound_events = {
				[1] = "pwh_level_ground_zero_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 3.2414791584015,
			},
		},
	})
end
