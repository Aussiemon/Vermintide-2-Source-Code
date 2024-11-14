-- chunkname: @dialogues/generated/hero_conversations_dlc_bogenhafen_slum.lua

return function ()
	define_rule({
		name = "pbw_level_bogenhafen_slum_story_eight_01",
		probability = 1,
		response = "pbw_level_bogenhafen_slum_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_eight_01",
			},
			{
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
		name = "pbw_level_bogenhafen_slum_story_eleven_01",
		probability = 1,
		response = "pbw_level_bogenhafen_slum_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bogenhafen_slum_story_eleven_01",
			},
			{
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
		name = "pbw_level_bogenhafen_slum_story_four_01",
		probability = 1,
		response = "pbw_level_bogenhafen_slum_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_four_01",
			},
			{
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
		name = "pbw_level_bogenhafen_slum_story_nine_01",
		probability = 1,
		response = "pbw_level_bogenhafen_slum_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_nine_01",
			},
			{
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
		name = "pbw_level_bogenhafen_slum_story_seven_01",
		probability = 1,
		response = "pbw_level_bogenhafen_slum_story_seven_01",
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
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pbw_level_bogenhafen_slum_story_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_bogenhafen_slum_story_seven_01",
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
		name = "pbw_level_bogenhafen_slum_story_seven_02",
		probability = 1,
		response = "pbw_level_bogenhafen_slum_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bogenhafen_slum_story_seven_01",
			},
			{
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
		name = "pbw_level_bogenhafen_slum_story_ten_01",
		probability = 1,
		response = "pbw_level_bogenhafen_slum_story_ten_01",
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
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pbw_level_bogenhafen_slum_story_ten_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_bogenhafen_slum_story_ten_01",
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
		name = "pbw_level_bogenhafen_slum_story_ten_02",
		probability = 1,
		response = "pbw_level_bogenhafen_slum_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_ten_01",
			},
			{
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
		name = "pbw_level_bogenhafen_slum_story_three_01",
		probability = 1,
		response = "pbw_level_bogenhafen_slum_story_three_01",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pbw_level_bogenhafen_slum_story_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_bogenhafen_slum_story_three_01",
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
		name = "pdr_level_bogenhafen_slum_story_five_01",
		probability = 1,
		response = "pdr_level_bogenhafen_slum_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bogenhafen_slum_story_five_02",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_eight_01",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_eight_01",
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
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pes_level_bogenhafen_slum_story_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_slum_story_eight_01",
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
		name = "pes_level_bogenhafen_slum_story_eight_02",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bogenhafen_slum_story_eight_01",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_five_01",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bogenhafen_slum_story_five_01",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_four_01",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_four_01",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_four_02",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bogenhafen_slum_story_four_01",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_one_01",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bogenhafen_slum_story_one_01",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_one_02",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bogenhafen_slum_story_one_02",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_six_01",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bogenhafen_slum_story_six_01",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_six_02",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bogenhafen_slum_story_six_02",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_three_01",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bogenhafen_slum_story_three_01",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_twelve_01",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_twelve_01",
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
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pes_level_bogenhafen_slum_story_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_bogenhafen_slum_story_twelve_01",
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
		name = "pes_level_bogenhafen_slum_story_twelve_02",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_twelve_01",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_twelve_03",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_twelve_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_twelve_02",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_two_01",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_two_01",
			},
			{
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
		name = "pes_level_bogenhafen_slum_story_two_02",
		probability = 1,
		response = "pes_level_bogenhafen_slum_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_two_02",
			},
			{
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
		name = "pwe_level_bogenhafen_slum_story_eleven_01",
		probability = 1,
		response = "pwe_level_bogenhafen_slum_story_eleven_01",
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
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pwe_level_bogenhafen_slum_story_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_bogenhafen_slum_story_eleven_01",
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
		name = "pwe_level_bogenhafen_slum_story_eleven_02",
		probability = 1,
		response = "pwe_level_bogenhafen_slum_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bogenhafen_slum_story_eleven_01",
			},
			{
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
		name = "pwe_level_bogenhafen_slum_story_five_01",
		probability = 1,
		response = "pwe_level_bogenhafen_slum_story_five_01",
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
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pwe_level_bogenhafen_slum_story_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_bogenhafen_slum_story_five_01",
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
		name = "pwe_level_bogenhafen_slum_story_five_02",
		probability = 1,
		response = "pwe_level_bogenhafen_slum_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_five_01",
			},
			{
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
		name = "pwe_level_bogenhafen_slum_story_one_01",
		probability = 1,
		response = "pwe_level_bogenhafen_slum_story_one_01",
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
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pwe_level_bogenhafen_slum_story_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_bogenhafen_slum_story_one_01",
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
		name = "pwe_level_bogenhafen_slum_story_one_02",
		probability = 1,
		response = "pwe_level_bogenhafen_slum_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_one_01",
			},
			{
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
		name = "pwe_level_bogenhafen_slum_story_seven_01",
		probability = 1,
		response = "pwe_level_bogenhafen_slum_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bogenhafen_slum_story_seven_01",
			},
			{
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
		name = "pwe_level_bogenhafen_slum_story_seven_02",
		probability = 1,
		response = "pwe_level_bogenhafen_slum_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bogenhafen_slum_story_seven_02",
			},
			{
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
		name = "pwe_level_bogenhafen_slum_story_six_01",
		probability = 1,
		response = "pwe_level_bogenhafen_slum_story_six_01",
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
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pwe_level_bogenhafen_slum_story_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_bogenhafen_slum_story_six_01",
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
		name = "pwe_level_bogenhafen_slum_story_six_02",
		probability = 1,
		response = "pwe_level_bogenhafen_slum_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_six_01",
			},
			{
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
		name = "pwe_level_bogenhafen_slum_story_three_01",
		probability = 1,
		response = "pwe_level_bogenhafen_slum_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_three_01",
			},
			{
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
		name = "pwh_level_bogenhafen_slum_story_four_01",
		probability = 1,
		response = "pwh_level_bogenhafen_slum_story_four_01",
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pwh_level_bogenhafen_slum_story_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_bogenhafen_slum_story_four_01",
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
		name = "pwh_level_bogenhafen_slum_story_nine_01",
		probability = 1,
		response = "pwh_level_bogenhafen_slum_story_nine_01",
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
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pwh_level_bogenhafen_slum_story_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_bogenhafen_slum_story_nine_01",
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
		name = "pwh_level_bogenhafen_slum_story_nine_02",
		probability = 1,
		response = "pwh_level_bogenhafen_slum_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bogenhafen_slum_story_nine_01",
			},
			{
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
		name = "pwh_level_bogenhafen_slum_story_ten_01",
		probability = 1,
		response = "pwh_level_bogenhafen_slum_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bogenhafen_slum_story_ten_01",
			},
			{
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
		name = "pwh_level_bogenhafen_slum_story_ten_02",
		probability = 1,
		response = "pwh_level_bogenhafen_slum_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bogenhafen_slum_story_ten_02",
			},
			{
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
		name = "pwh_level_bogenhafen_slum_story_three_01",
		probability = 1,
		response = "pwh_level_bogenhafen_slum_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_bogenhafen_slum_story_three_01",
			},
			{
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
		name = "pwh_level_bogenhafen_slum_story_twelve_01",
		probability = 1,
		response = "pwh_level_bogenhafen_slum_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_twelve_01",
			},
			{
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
		name = "pwh_level_bogenhafen_slum_story_twelve_02",
		probability = 1,
		response = "pwh_level_bogenhafen_slum_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_twelve_02",
			},
			{
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
		name = "pwh_level_bogenhafen_slum_story_two_01",
		probability = 1,
		response = "pwh_level_bogenhafen_slum_story_two_01",
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
				"level_bogenhafen_slum_tainted_food",
				OP.NOT,
				"level_bogenhafen_slum_tainted_food",
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
				"once_per_level_pwh_level_bogenhafen_slum_story_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_bogenhafen_slum_story_two_01",
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
		name = "pwh_level_bogenhafen_slum_story_two_02",
		probability = 1,
		response = "pwh_level_bogenhafen_slum_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_two_01",
			},
			{
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
		pbw_level_bogenhafen_slum_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_bogenhafen_slum_story_eight_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_slum_story_eight_01",
			},
			sound_events_duration = {
				[1] = 0.9911875128746,
			},
		},
		pbw_level_bogenhafen_slum_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_bogenhafen_slum_story_eleven_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_slum_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.0140416622162,
			},
		},
		pbw_level_bogenhafen_slum_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_bogenhafen_slum_story_four_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_slum_story_four_01",
			},
			sound_events_duration = {
				[1] = 2.3715000152588,
			},
		},
		pbw_level_bogenhafen_slum_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_bogenhafen_slum_story_nine_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_slum_story_nine_01",
			},
			sound_events_duration = {
				[1] = 6.3036665916443,
			},
		},
		pbw_level_bogenhafen_slum_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_bogenhafen_slum_story_seven_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_slum_story_seven_01",
			},
			sound_events_duration = {
				[1] = 2.8882083892822,
			},
		},
		pbw_level_bogenhafen_slum_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_bogenhafen_slum_story_seven_02",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_slum_story_seven_02",
			},
			sound_events_duration = {
				[1] = 2.4317917823791,
			},
		},
		pbw_level_bogenhafen_slum_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_bogenhafen_slum_story_ten_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_slum_story_ten_01",
			},
			sound_events_duration = {
				[1] = 4.3376665115356,
			},
		},
		pbw_level_bogenhafen_slum_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_level_bogenhafen_slum_story_ten_02",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_slum_story_ten_02",
			},
			sound_events_duration = {
				[1] = 3.2771666049957,
			},
		},
		pbw_level_bogenhafen_slum_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_level_bogenhafen_slum_story_three_01",
			},
			sound_events = {
				[1] = "pbw_level_bogenhafen_slum_story_three_01",
			},
			sound_events_duration = {
				[1] = 5.3747081756592,
			},
		},
		pdr_level_bogenhafen_slum_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_bogenhafen_slum_story_five_01",
			},
			sound_events = {
				[1] = "pdr_level_bogenhafen_slum_story_five_01",
			},
			sound_events_duration = {
				[1] = 1.7289375066757,
			},
		},
		pes_level_bogenhafen_slum_story_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_eight_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_eight_01",
			},
			sound_events_duration = {
				[1] = 3.9171249866486,
			},
		},
		pes_level_bogenhafen_slum_story_eight_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_eight_02",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_eight_02",
			},
			sound_events_duration = {
				[1] = 6.9904999732971,
			},
		},
		pes_level_bogenhafen_slum_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_five_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_five_01",
			},
			sound_events_duration = {
				[1] = 4.8032917976379,
			},
		},
		pes_level_bogenhafen_slum_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_four_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_four_01",
			},
			sound_events_duration = {
				[1] = 3.0868124961853,
			},
		},
		pes_level_bogenhafen_slum_story_four_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_four_02",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_four_02",
			},
			sound_events_duration = {
				[1] = 2.9458959102631,
			},
		},
		pes_level_bogenhafen_slum_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_one_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_one_01",
			},
			sound_events_duration = {
				[1] = 3.7324376106262,
			},
		},
		pes_level_bogenhafen_slum_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_one_02",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_one_02",
			},
			sound_events_duration = {
				[1] = 2.3885834217072,
			},
		},
		pes_level_bogenhafen_slum_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_six_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_six_01",
			},
			sound_events_duration = {
				[1] = 1.4869375228882,
			},
		},
		pes_level_bogenhafen_slum_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_six_02",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_six_02",
			},
			sound_events_duration = {
				[1] = 4.1567916870117,
			},
		},
		pes_level_bogenhafen_slum_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_three_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_three_01",
			},
			sound_events_duration = {
				[1] = 2.7419479489326,
			},
		},
		pes_level_bogenhafen_slum_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_twelve_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.1581041812897,
			},
		},
		pes_level_bogenhafen_slum_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_twelve_02",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 4.5505623817444,
			},
		},
		pes_level_bogenhafen_slum_story_twelve_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_twelve_03",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_twelve_03",
			},
			sound_events_duration = {
				[1] = 3.701812505722,
			},
		},
		pes_level_bogenhafen_slum_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_two_01",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_two_01",
			},
			sound_events_duration = {
				[1] = 7.320770740509,
			},
		},
		pes_level_bogenhafen_slum_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_bogenhafen_slum_story_two_02",
			},
			sound_events = {
				[1] = "pes_level_bogenhafen_slum_story_two_02",
			},
			sound_events_duration = {
				[1] = 8.3647499084473,
			},
		},
		pwe_level_bogenhafen_slum_story_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_slum_story_eleven_01",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_slum_story_eleven_01",
			},
			sound_events_duration = {
				[1] = 2.7458748817444,
			},
		},
		pwe_level_bogenhafen_slum_story_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_slum_story_eleven_02",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_slum_story_eleven_02",
			},
			sound_events_duration = {
				[1] = 3.1161458492279,
			},
		},
		pwe_level_bogenhafen_slum_story_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_slum_story_five_01",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_slum_story_five_01",
			},
			sound_events_duration = {
				[1] = 5.3063335418701,
			},
		},
		pwe_level_bogenhafen_slum_story_five_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_slum_story_five_02",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_slum_story_five_02",
			},
			sound_events_duration = {
				[1] = 6.3835000991821,
			},
		},
		pwe_level_bogenhafen_slum_story_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_slum_story_one_01",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_slum_story_one_01",
			},
			sound_events_duration = {
				[1] = 2.815708398819,
			},
		},
		pwe_level_bogenhafen_slum_story_one_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_slum_story_one_02",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_slum_story_one_02",
			},
			sound_events_duration = {
				[1] = 2.3948333263397,
			},
		},
		pwe_level_bogenhafen_slum_story_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_slum_story_seven_01",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_slum_story_seven_01",
			},
			sound_events_duration = {
				[1] = 5.3549585342407,
			},
		},
		pwe_level_bogenhafen_slum_story_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_slum_story_seven_02",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_slum_story_seven_02",
			},
			sound_events_duration = {
				[1] = 2.2747292518616,
			},
		},
		pwe_level_bogenhafen_slum_story_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_slum_story_six_01",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_slum_story_six_01",
			},
			sound_events_duration = {
				[1] = 6.747624874115,
			},
		},
		pwe_level_bogenhafen_slum_story_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_slum_story_six_02",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_slum_story_six_02",
			},
			sound_events_duration = {
				[1] = 4.2968335151672,
			},
		},
		pwe_level_bogenhafen_slum_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_slum_story_three_01",
			},
			sound_events = {
				[1] = "pwe_level_bogenhafen_slum_story_three_01",
			},
			sound_events_duration = {
				[1] = 3.6628541946411,
			},
		},
		pwh_level_bogenhafen_slum_story_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_four_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_four_01",
			},
			sound_events_duration = {
				[1] = 6.4991874694824,
			},
		},
		pwh_level_bogenhafen_slum_story_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_nine_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_nine_01",
			},
			sound_events_duration = {
				[1] = 6.8478956222534,
			},
		},
		pwh_level_bogenhafen_slum_story_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_nine_02",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_nine_02",
			},
			sound_events_duration = {
				[1] = 5.4561877250671,
			},
		},
		pwh_level_bogenhafen_slum_story_ten_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_ten_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_ten_01",
			},
			sound_events_duration = {
				[1] = 4.4000000953674,
			},
		},
		pwh_level_bogenhafen_slum_story_ten_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_ten_02",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_ten_02",
			},
			sound_events_duration = {
				[1] = 3.6445417404175,
			},
		},
		pwh_level_bogenhafen_slum_story_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_three_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_three_01",
			},
			sound_events_duration = {
				[1] = 3.7927916049957,
			},
		},
		pwh_level_bogenhafen_slum_story_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_twelve_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.4518749713898,
			},
		},
		pwh_level_bogenhafen_slum_story_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_twelve_02",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_twelve_02",
			},
			sound_events_duration = {
				[1] = 7.39297914505,
			},
		},
		pwh_level_bogenhafen_slum_story_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_two_01",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_two_01",
			},
			sound_events_duration = {
				[1] = 9.0761671066284,
			},
		},
		pwh_level_bogenhafen_slum_story_two_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_bogenhafen_slum",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_bogenhafen_slum_story_two_02",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_story_two_02",
			},
			sound_events_duration = {
				[1] = 2.8542709350586,
			},
		},
	})
end
