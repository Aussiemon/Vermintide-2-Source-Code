-- chunkname: @dialogues/generated/hero_conversations_dlc_drachenfels_bastion.lua

return function ()
	define_rule({
		name = "pbw_bastion_conversation_eleven_01",
		probability = 1,
		response = "pbw_bastion_conversation_eleven_01",
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
				120,
			},
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pbw_bastion_conversation_eleven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_bastion_conversation_eleven_01",
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
		name = "pbw_bastion_conversation_eleven_02",
		probability = 1,
		response = "pbw_bastion_conversation_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bastion_conversation_eleven_01",
			},
			{
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
		name = "pbw_bastion_conversation_seven_01",
		probability = 1,
		response = "pbw_bastion_conversation_seven_01",
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
				120,
			},
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pbw_bastion_conversation_seven_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_bastion_conversation_seven_01",
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
		name = "pbw_bastion_conversation_seven_02",
		probability = 1,
		response = "pbw_bastion_conversation_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bastion_conversation_seven_01",
			},
			{
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
		name = "pbw_bastion_conversation_three_01",
		probability = 1,
		response = "pbw_bastion_conversation_three_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pbw_bastion_conversation_three_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_bastion_conversation_three_01",
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
		name = "pbw_bastion_conversation_three_02",
		probability = 1,
		response = "pbw_bastion_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bastion_conversation_three_01",
			},
			{
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
		name = "pbw_bastion_conversation_three_03",
		probability = 1,
		response = "pbw_bastion_conversation_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bastion_conversation_three_02",
			},
			{
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
		name = "pbw_bastion_conversation_twelve_01",
		probability = 1,
		response = "pbw_bastion_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bastion_conversation_twelve_01",
			},
			{
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
		name = "pbw_bastion_conversation_twelve_02",
		probability = 1,
		response = "pbw_bastion_conversation_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bastion_conversation_twelve_02",
			},
			{
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
		name = "pbw_bastion_conversation_two_01",
		probability = 1,
		response = "pbw_bastion_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bastion_conversation_two_01",
			},
			{
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
		name = "pdr_bastion_conversation_five_01",
		probability = 1,
		response = "pdr_bastion_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bastion_conversation_five_01",
			},
			{
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
		name = "pdr_bastion_conversation_five_02",
		probability = 1,
		response = "pdr_bastion_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bastion_conversation_five_02",
			},
			{
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
		name = "pdr_bastion_conversation_four_01",
		probability = 1,
		response = "pdr_bastion_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bastion_conversation_four_01",
			},
			{
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
		name = "pdr_bastion_conversation_one_01",
		probability = 1,
		response = "pdr_bastion_conversation_one_01",
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
				"witch_hunter",
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
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pdr_bastion_conversation_one_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_bastion_conversation_one_01",
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
		name = "pdr_bastion_conversation_three_01",
		probability = 1,
		response = "pdr_bastion_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bastion_conversation_three_01",
			},
			{
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
		name = "pdr_bastion_conversation_three_02",
		probability = 1,
		response = "pdr_bastion_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bastion_conversation_three_02",
			},
			{
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
		name = "pes_bastion_conversation_eight_01",
		probability = 1,
		response = "pes_bastion_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bastion_conversation_eight_01",
			},
			{
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
		name = "pes_bastion_conversation_nine_01",
		probability = 1,
		response = "pes_bastion_conversation_nine_01",
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
				120,
			},
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_bastion_conversation_nine_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_bastion_conversation_nine_01",
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
		name = "pes_bastion_conversation_nine_02",
		probability = 1,
		response = "pes_bastion_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bastion_conversation_nine_01",
			},
			{
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
		name = "pes_bastion_conversation_nine_03",
		probability = 1,
		response = "pes_bastion_conversation_nine_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bastion_conversation_nine_02",
			},
			{
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
		name = "pes_bastion_conversation_one_01",
		probability = 1,
		response = "pes_bastion_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bastion_conversation_one_01",
			},
			{
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
		name = "pes_bastion_conversation_one_02",
		probability = 1,
		response = "pes_bastion_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bastion_conversation_one_01",
			},
			{
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
		name = "pes_bastion_conversation_six_01",
		probability = 1,
		response = "pes_bastion_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bastion_conversation_six_01",
			},
			{
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
		name = "pes_bastion_conversation_six_02",
		probability = 1,
		response = "pes_bastion_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bastion_conversation_six_02",
			},
			{
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
		name = "pes_bastion_conversation_twelve_01",
		probability = 1,
		response = "pes_bastion_conversation_twelve_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_bastion_conversation_twelve_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_bastion_conversation_twelve_01",
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
		name = "pes_bastion_conversation_twelve_02",
		probability = 1,
		response = "pes_bastion_conversation_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bastion_conversation_twelve_01",
			},
			{
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
		name = "pwe_bastion_conversation_eight_01",
		probability = 1,
		response = "pwe_bastion_conversation_eight_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pwe_bastion_conversation_eight_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_bastion_conversation_eight_01",
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
		name = "pwe_bastion_conversation_eleven_01",
		probability = 1,
		response = "pwe_bastion_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bastion_conversation_eleven_01",
			},
			{
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
		name = "pwe_bastion_conversation_four_01",
		probability = 1,
		response = "pwe_bastion_conversation_four_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pwe_bastion_conversation_four_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_bastion_conversation_four_01",
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
		name = "pwe_bastion_conversation_seven_01",
		probability = 1,
		response = "pwe_bastion_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bastion_conversation_seven_01",
			},
			{
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
		name = "pwe_bastion_conversation_six_01",
		probability = 1,
		response = "pwe_bastion_conversation_six_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pes_bastion_conversation_six_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_bastion_conversation_six_01",
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
		name = "pwe_bastion_conversation_six_02",
		probability = 1,
		response = "pwe_bastion_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bastion_conversation_six_01",
			},
			{
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
		name = "pwe_bastion_conversation_six_03",
		probability = 1,
		response = "pwe_bastion_conversation_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bastion_conversation_six_02",
			},
			{
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
		name = "pwh_bastion_conversation_five_01",
		probability = 1,
		response = "pwh_bastion_conversation_five_01",
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
				"dwarf_ranger",
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
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pwh_bastion_conversation_five_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_bastion_conversation_five_01",
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
		name = "pwh_bastion_conversation_five_02",
		probability = 1,
		response = "pwh_bastion_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bastion_conversation_five_01",
			},
			{
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
		name = "pwh_bastion_conversation_nine_01",
		probability = 1,
		response = "pwh_bastion_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bastion_conversation_nine_01",
			},
			{
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
		name = "pwh_bastion_conversation_nine_02",
		probability = 1,
		response = "pwh_bastion_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bastion_conversation_nine_02",
			},
			{
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
		name = "pwh_bastion_conversation_one_01",
		probability = 1,
		response = "pwh_bastion_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bastion_conversation_one_01",
			},
			{
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
		name = "pwh_bastion_conversation_two_01",
		probability = 1,
		response = "pwh_bastion_conversation_two_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"once_per_level_pwh_bastion_conversation_two_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_bastion_conversation_two_01",
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
		name = "pwh_bastion_conversation_two_02",
		probability = 1,
		response = "pwh_bastion_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bastion_conversation_two_01",
			},
			{
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
		pbw_bastion_conversation_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_bastion_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pbw_bastion_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 3.0649790763855,
			},
		},
		pbw_bastion_conversation_eleven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pbw_bastion_conversation_eleven_02",
			},
			sound_events = {
				[1] = "pbw_bastion_conversation_eleven_02",
			},
			sound_events_duration = {
				[1] = 5.1529793739319,
			},
		},
		pbw_bastion_conversation_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_bastion_conversation_seven_01",
			},
			sound_events = {
				[1] = "pbw_bastion_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 4.580979347229,
			},
		},
		pbw_bastion_conversation_seven_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pbw_bastion_conversation_seven_02",
			},
			sound_events = {
				[1] = "pbw_bastion_conversation_seven_02",
			},
			sound_events_duration = {
				[1] = 2.0299792289734,
			},
		},
		pbw_bastion_conversation_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_bastion_conversation_three_01",
			},
			sound_events = {
				[1] = "pbw_bastion_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 7.397979259491,
			},
		},
		pbw_bastion_conversation_three_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pbw_bastion_conversation_three_02",
			},
			sound_events = {
				[1] = "pbw_bastion_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 3.1229791641235,
			},
		},
		pbw_bastion_conversation_three_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pbw_bastion_conversation_three_03",
			},
			sound_events = {
				[1] = "pbw_bastion_conversation_three_03",
			},
			sound_events_duration = {
				[1] = 1.1529791355133,
			},
		},
		pbw_bastion_conversation_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pbw_bastion_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pbw_bastion_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.823979139328,
			},
		},
		pbw_bastion_conversation_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pbw_bastion_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pbw_bastion_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 1.0709791183472,
			},
		},
		pbw_bastion_conversation_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pbw_bastion_conversation_two_01",
			},
			sound_events = {
				[1] = "pbw_bastion_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 3.687979221344,
			},
		},
		pdr_bastion_conversation_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pdr_bastion_conversation_five_01",
			},
			sound_events = {
				[1] = "pdr_bastion_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 4.0539793968201,
			},
		},
		pdr_bastion_conversation_five_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pdr_bastion_conversation_five_02",
			},
			sound_events = {
				[1] = "pdr_bastion_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 2.8569791316986,
			},
		},
		pdr_bastion_conversation_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pdr_bastion_conversation_four_01",
			},
			sound_events = {
				[1] = "pdr_bastion_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 8.798978805542,
			},
		},
		pdr_bastion_conversation_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_bastion_conversation_one_01",
			},
			sound_events = {
				[1] = "pdr_bastion_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 5.5959792137146,
			},
		},
		pdr_bastion_conversation_three_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pdr_bastion_conversation_three_01",
			},
			sound_events = {
				[1] = "pdr_bastion_conversation_three_01",
			},
			sound_events_duration = {
				[1] = 6.0009789466858,
			},
		},
		pdr_bastion_conversation_three_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pdr_bastion_conversation_three_02",
			},
			sound_events = {
				[1] = "pdr_bastion_conversation_three_02",
			},
			sound_events_duration = {
				[1] = 5.1039791107178,
			},
		},
		pes_bastion_conversation_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pes_bastion_conversation_eight_01",
			},
			sound_events = {
				[1] = "pes_bastion_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 6.0779790878296,
			},
		},
		pes_bastion_conversation_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_bastion_conversation_nine_01",
			},
			sound_events = {
				[1] = "pes_bastion_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 4.1764687299728,
			},
		},
		pes_bastion_conversation_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pes_bastion_conversation_nine_02",
			},
			sound_events = {
				[1] = "pes_bastion_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 5.6889791488647,
			},
		},
		pes_bastion_conversation_nine_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pes_bastion_conversation_nine_03",
			},
			sound_events = {
				[1] = "pes_bastion_conversation_nine_03",
			},
			sound_events_duration = {
				[1] = 4.8919792175293,
			},
		},
		pes_bastion_conversation_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pes_bastion_conversation_one_01",
			},
			sound_events = {
				[1] = "pes_bastion_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 4.2189793586731,
			},
		},
		pes_bastion_conversation_one_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pes_bastion_conversation_one_02",
			},
			sound_events = {
				[1] = "pes_bastion_conversation_one_02",
			},
			sound_events_duration = {
				[1] = 2.5089790821075,
			},
		},
		pes_bastion_conversation_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pes_bastion_conversation_six_01",
			},
			sound_events = {
				[1] = "pes_bastion_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 2.312979221344,
			},
		},
		pes_bastion_conversation_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pes_bastion_conversation_six_02",
			},
			sound_events = {
				[1] = "pes_bastion_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 7.455979347229,
			},
		},
		pes_bastion_conversation_twelve_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_bastion_conversation_twelve_01",
			},
			sound_events = {
				[1] = "pes_bastion_conversation_twelve_01",
			},
			sound_events_duration = {
				[1] = 3.6369791030884,
			},
		},
		pes_bastion_conversation_twelve_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pes_bastion_conversation_twelve_02",
			},
			sound_events = {
				[1] = "pes_bastion_conversation_twelve_02",
			},
			sound_events_duration = {
				[1] = 1.1210000514984,
			},
		},
		pwe_bastion_conversation_eight_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_bastion_conversation_eight_01",
			},
			sound_events = {
				[1] = "pwe_bastion_conversation_eight_01",
			},
			sound_events_duration = {
				[1] = 5.026978969574,
			},
		},
		pwe_bastion_conversation_eleven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pwe_bastion_conversation_eleven_01",
			},
			sound_events = {
				[1] = "pwe_bastion_conversation_eleven_01",
			},
			sound_events_duration = {
				[1] = 7.3289790153503,
			},
		},
		pwe_bastion_conversation_four_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_bastion_conversation_four_01",
			},
			sound_events = {
				[1] = "pwe_bastion_conversation_four_01",
			},
			sound_events_duration = {
				[1] = 6.2569789886475,
			},
		},
		pwe_bastion_conversation_seven_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pwe_bastion_conversation_seven_01",
			},
			sound_events = {
				[1] = "pwe_bastion_conversation_seven_01",
			},
			sound_events_duration = {
				[1] = 3.7719790935516,
			},
		},
		pwe_bastion_conversation_six_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_bastion_conversation_six_01",
			},
			sound_events = {
				[1] = "pwe_bastion_conversation_six_01",
			},
			sound_events_duration = {
				[1] = 5.9359793663025,
			},
		},
		pwe_bastion_conversation_six_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pwe_bastion_conversation_six_02",
			},
			sound_events = {
				[1] = "pwe_bastion_conversation_six_02",
			},
			sound_events_duration = {
				[1] = 2.0299792289734,
			},
		},
		pwe_bastion_conversation_six_03 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pwe_bastion_conversation_six_03",
			},
			sound_events = {
				[1] = "pwe_bastion_conversation_six_03",
			},
			sound_events_duration = {
				[1] = 4.1999793052673,
			},
		},
		pwh_bastion_conversation_five_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_bastion_conversation_five_01",
			},
			sound_events = {
				[1] = "pwh_bastion_conversation_five_01",
			},
			sound_events_duration = {
				[1] = 9.3199787139893,
			},
		},
		pwh_bastion_conversation_five_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pwh_bastion_conversation_five_02",
			},
			sound_events = {
				[1] = "pwh_bastion_conversation_five_02",
			},
			sound_events_duration = {
				[1] = 1.8799999952316,
			},
		},
		pwh_bastion_conversation_nine_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pwh_bastion_conversation_nine_01",
			},
			sound_events = {
				[1] = "pwh_bastion_conversation_nine_01",
			},
			sound_events_duration = {
				[1] = 2.9329791069031,
			},
		},
		pwh_bastion_conversation_nine_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pwh_bastion_conversation_nine_02",
			},
			sound_events = {
				[1] = "pwh_bastion_conversation_nine_02",
			},
			sound_events_duration = {
				[1] = 1.0109791755676,
			},
		},
		pwh_bastion_conversation_one_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pwh_bastion_conversation_one_01",
			},
			sound_events = {
				[1] = "pwh_bastion_conversation_one_01",
			},
			sound_events_duration = {
				[1] = 5.3859791755676,
			},
		},
		pwh_bastion_conversation_two_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_bastion_conversation_two_01",
			},
			sound_events = {
				[1] = "pwh_bastion_conversation_two_01",
			},
			sound_events_duration = {
				[1] = 7.6849789619446,
			},
		},
		pwh_bastion_conversation_two_02 = {
			category = "story_talk",
			database = "hero_conversations_dlc_drachenfels_bastion",
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
				[1] = "pwh_bastion_conversation_two_02",
			},
			sound_events = {
				[1] = "pwh_bastion_conversation_two_02",
			},
			sound_events_duration = {
				[1] = 3.9139790534973,
			},
		},
	})
end
