-- chunkname: @dialogues/generated/hero_conversations_dlc_cowbell_banter.lua

return function ()
	define_rule({
		name = "pbw_shadow_curse_conversation_eight",
		probability = 1,
		response = "pbw_shadow_curse_conversation_eight",
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
				"enemies_distant",
				OP.LT,
				8,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				2,
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
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_eight",
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
		name = "pbw_shadow_curse_conversation_eight_e_01",
		probability = 1,
		response = "pbw_shadow_curse_conversation_eight_e_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_eight_d_01",
			},
			{
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
		name = "pbw_shadow_curse_conversation_eleven_e_01",
		probability = 1,
		response = "pbw_shadow_curse_conversation_eleven_e_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_conversation_eleven_d_01",
			},
			{
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
		name = "pbw_shadow_curse_conversation_four_c_01",
		probability = 1,
		response = "pbw_shadow_curse_conversation_four_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_four_b_01",
			},
			{
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
		name = "pbw_shadow_curse_conversation_seven_e_01",
		probability = 1,
		response = "pbw_shadow_curse_conversation_seven_e_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shadow_curse_conversation_seven_d_01",
			},
			{
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
		name = "pbw_shadow_curse_conversation_ten_c_01",
		probability = 1,
		response = "pbw_shadow_curse_conversation_ten_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_conversation_ten_b_01",
			},
			{
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
		name = "pbw_shadow_curse_conversation_three",
		probability = 1,
		response = "pbw_shadow_curse_conversation_three",
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
				"friends_close",
				OP.GT,
				2,
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
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_three",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_three",
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
		name = "pbw_shadow_curse_conversation_twelve_e_01",
		probability = 1,
		response = "pbw_shadow_curse_conversation_twelve_e_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_twelve_d_01",
			},
			{
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
		name = "pbw_shadow_curse_conversation_two_c_01",
		probability = 1,
		response = "pbw_shadow_curse_conversation_two_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_two_b_01",
			},
			{
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
		name = "pdr_shadow_curse_conversation_eight_c_01",
		probability = 1,
		response = "pdr_shadow_curse_conversation_eight_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_eight_b_01",
			},
			{
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
		name = "pdr_shadow_curse_conversation_five_b_01",
		probability = 1,
		response = "pdr_shadow_curse_conversation_five_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_five_a_01",
			},
			{
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
		name = "pdr_shadow_curse_conversation_one",
		probability = 1,
		response = "pdr_shadow_curse_conversation_one",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_one",
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
		name = "pdr_shadow_curse_conversation_six",
		probability = 1,
		response = "pdr_shadow_curse_conversation_six",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_six",
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
		name = "pdr_shadow_curse_conversation_ten_e_01",
		probability = 1,
		response = "pdr_shadow_curse_conversation_ten_e_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_conversation_ten_d_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_eleven_b_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_eleven_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_eleven_a_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_five_d_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_five_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_five_c_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_four",
		probability = 1,
		response = "pes_shadow_curse_conversation_four",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_four",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_four",
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
		name = "pes_shadow_curse_conversation_nine_b_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_nine_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_conversation_nine_a_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_nine_d_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_nine_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_conversation_nine_c_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_one_b_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_one_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shadow_curse_conversation_one_a_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_one_d_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_one_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_conversation_one_c_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_seven_b_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_seven_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_seven_a_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_seven_d_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_seven_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_seven_c_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_seven_f_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_seven_f_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_shadow_curse_conversation_seven_e_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_six_b_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_six_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shadow_curse_conversation_six_a_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_six_d_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_six_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_conversation_six_c_01",
			},
			{
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
		name = "pes_shadow_curse_conversation_ten",
		probability = 1,
		response = "pes_shadow_curse_conversation_ten",
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
				"friends_close",
				OP.GT,
				2,
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_ten",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_ten",
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
		name = "pes_shadow_curse_conversation_three_c_01",
		probability = 1,
		response = "pes_shadow_curse_conversation_three_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_three_b_01",
			},
			{
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
		name = "pwe_shadow_curse_conversation_eleven_d_01",
		probability = 1,
		response = "pwe_shadow_curse_conversation_eleven_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_eleven_c_01",
			},
			{
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
		name = "pwe_shadow_curse_conversation_nine",
		probability = 1,
		response = "pwe_shadow_curse_conversation_nine",
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
				"enemies_distant",
				OP.LT,
				15,
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
				1,
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
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_nine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_nine",
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
		name = "pwe_shadow_curse_conversation_nine_c_01",
		probability = 1,
		response = "pwe_shadow_curse_conversation_nine_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shadow_curse_conversation_nine_b_01",
			},
			{
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
		name = "pwe_shadow_curse_conversation_one_c_01",
		probability = 1,
		response = "pwe_shadow_curse_conversation_one_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shadow_curse_conversation_one_b_01",
			},
			{
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
		name = "pwe_shadow_curse_conversation_six_c_01",
		probability = 1,
		response = "pwe_shadow_curse_conversation_six_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shadow_curse_conversation_six_b_01",
			},
			{
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
		name = "pwe_shadow_curse_conversation_ten_b_01",
		probability = 1,
		response = "pwe_shadow_curse_conversation_ten_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shadow_curse_conversation_ten_a_01",
			},
			{
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
		name = "pwe_shadow_curse_conversation_ten_d_01",
		probability = 1,
		response = "pwe_shadow_curse_conversation_ten_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_shadow_curse_conversation_ten_c_01",
			},
			{
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
		name = "pwe_shadow_curse_conversation_three_d_01",
		probability = 1,
		response = "pwe_shadow_curse_conversation_three_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shadow_curse_conversation_three_c_01",
			},
			{
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
		name = "pwe_shadow_curse_conversation_twelve",
		probability = 1,
		response = "pwe_shadow_curse_conversation_twelve",
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
				"enemies_distant",
				OP.LT,
				9,
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
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_twelve",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_twelve",
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
		name = "pwe_shadow_curse_conversation_twelve_c_01",
		probability = 1,
		response = "pwe_shadow_curse_conversation_twelve_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_twelve_b_01",
			},
			{
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
		name = "pwe_shadow_curse_conversation_two",
		probability = 1,
		response = "pwe_shadow_curse_conversation_two",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_two",
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
		name = "pwe_shadow_curse_conversation_two_e_01",
		probability = 1,
		response = "pwe_shadow_curse_conversation_two_e_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_conversation_two_d_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_eight_b_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_eight_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_shadow_curse_conversation_eight_a_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_eight_d_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_eight_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shadow_curse_conversation_eight_c_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_eight_f_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_eight_f_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_shadow_curse_conversation_eight_e_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_eleven",
		probability = 1,
		response = "pwh_shadow_curse_conversation_eleven",
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
				"friends_close",
				OP.GT,
				2,
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
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_eleven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_eleven",
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
		name = "pwh_shadow_curse_conversation_eleven_c_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_eleven_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shadow_curse_conversation_eleven_b_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_eleven_f_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_eleven_f_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_shadow_curse_conversation_eleven_e_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_five",
		probability = 1,
		response = "pwh_shadow_curse_conversation_five",
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
				"enemies_distant",
				OP.LT,
				15,
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
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_five",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_five",
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
		name = "pwh_shadow_curse_conversation_five_c_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_five_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shadow_curse_conversation_five_b_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_four_b_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_four_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shadow_curse_conversation_four_a_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_four_d_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_four_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_shadow_curse_conversation_four_c_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_seven",
		probability = 1,
		response = "pwh_shadow_curse_conversation_seven",
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
				"enemies_distant",
				OP.LT,
				8,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				2,
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
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor",
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180,
			},
			{
				"faction_memory",
				"shadow_curse_conversation_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"shadow_curse_conversation_seven",
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
		name = "pwh_shadow_curse_conversation_seven_c_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_seven_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shadow_curse_conversation_seven_b_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_three_b_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_three_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_shadow_curse_conversation_three_a_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_twelve_b_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_twelve_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_conversation_twelve_a_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_twelve_d_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_twelve_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_conversation_twelve_c_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_two_b_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_two_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_conversation_two_a_01",
			},
			{
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
		name = "pwh_shadow_curse_conversation_two_d_01",
		probability = 1,
		response = "pwh_shadow_curse_conversation_two_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_shadow_curse_conversation_two_c_01",
			},
			{
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
		pbw_shadow_curse_conversation_eight = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_shadow_curse_conversation_eight_a_01",
			},
			sound_events = {
				[1] = "pbw_shadow_curse_conversation_eight_a_01",
			},
			sound_events_duration = {
				[1] = 4.4649791717529,
			},
		},
		pbw_shadow_curse_conversation_eight_e_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pbw_shadow_curse_conversation_eight_e_01",
			},
			sound_events = {
				[1] = "pbw_shadow_curse_conversation_eight_e_01",
			},
			sound_events_duration = {
				[1] = 1.8159999847412,
			},
		},
		pbw_shadow_curse_conversation_eleven_e_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pbw_shadow_curse_conversation_eleven_e_01",
			},
			sound_events = {
				[1] = "pbw_shadow_curse_conversation_eleven_e_01",
			},
			sound_events_duration = {
				[1] = 5.6979789733887,
			},
		},
		pbw_shadow_curse_conversation_four_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pbw_shadow_curse_conversation_four_c_01",
			},
			sound_events = {
				[1] = "pbw_shadow_curse_conversation_four_c_01",
			},
			sound_events_duration = {
				[1] = 4.2039999961853,
			},
		},
		pbw_shadow_curse_conversation_seven_e_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pbw_shadow_curse_conversation_seven_e_01",
			},
			sound_events = {
				[1] = "pbw_shadow_curse_conversation_seven_e_01",
			},
			sound_events_duration = {
				[1] = 2.7249791622162,
			},
		},
		pbw_shadow_curse_conversation_ten_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pbw_shadow_curse_conversation_ten_c_01",
			},
			sound_events = {
				[1] = "pbw_shadow_curse_conversation_ten_c_01",
			},
			sound_events_duration = {
				[1] = 2.3199999332428,
			},
		},
		pbw_shadow_curse_conversation_three = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_shadow_curse_conversation_three_a_01",
			},
			sound_events = {
				[1] = "pbw_shadow_curse_conversation_three_a_01",
			},
			sound_events_duration = {
				[1] = 4.0609793663025,
			},
		},
		pbw_shadow_curse_conversation_twelve_e_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pbw_shadow_curse_conversation_twelve_e_01",
			},
			sound_events = {
				[1] = "pbw_shadow_curse_conversation_twelve_e_01",
			},
			sound_events_duration = {
				[1] = 5.6729793548584,
			},
		},
		pbw_shadow_curse_conversation_two_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pbw_shadow_curse_conversation_two_c_01",
			},
			sound_events = {
				[1] = "pbw_shadow_curse_conversation_two_c_01",
			},
			sound_events_duration = {
				[1] = 7.8839793205261,
			},
		},
		pdr_shadow_curse_conversation_eight_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pdr_shadow_curse_conversation_eight_c_01",
			},
			sound_events = {
				[1] = "pdr_shadow_curse_conversation_eight_c_01",
			},
			sound_events_duration = {
				[1] = 2.7469792366028,
			},
		},
		pdr_shadow_curse_conversation_five_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pdr_shadow_curse_conversation_five_b_01",
			},
			sound_events = {
				[1] = "pdr_shadow_curse_conversation_five_b_01",
			},
			sound_events_duration = {
				[1] = 3.2889790534973,
			},
		},
		pdr_shadow_curse_conversation_one = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_shadow_curse_conversation_one_a_01",
			},
			sound_events = {
				[1] = "pdr_shadow_curse_conversation_one_a_01",
			},
			sound_events_duration = {
				[1] = 3.5379791259766,
			},
		},
		pdr_shadow_curse_conversation_six = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_shadow_curse_conversation_six_a_01",
			},
			sound_events = {
				[1] = "pdr_shadow_curse_conversation_six_a_01",
			},
			sound_events_duration = {
				[1] = 5.3449997901917,
			},
		},
		pdr_shadow_curse_conversation_ten_e_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pdr_shadow_curse_conversation_ten_e_01",
			},
			sound_events = {
				[1] = "pdr_shadow_curse_conversation_ten_e_01",
			},
			sound_events_duration = {
				[1] = 3.9909791946411,
			},
		},
		pes_shadow_curse_conversation_eleven_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_eleven_b_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_eleven_b_01",
			},
			sound_events_duration = {
				[1] = 6.8470001220703,
			},
		},
		pes_shadow_curse_conversation_five_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_five_d_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_five_d_01",
			},
			sound_events_duration = {
				[1] = 1.6609791517258,
			},
		},
		pes_shadow_curse_conversation_four = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_shadow_curse_conversation_four_a_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_four_a_01",
			},
			sound_events_duration = {
				[1] = 2.6619999408722,
			},
		},
		pes_shadow_curse_conversation_nine_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_nine_b_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_nine_b_01",
			},
			sound_events_duration = {
				[1] = 4.3219790458679,
			},
		},
		pes_shadow_curse_conversation_nine_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_nine_d_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_nine_d_01",
			},
			sound_events_duration = {
				[1] = 2.4869792461395,
			},
		},
		pes_shadow_curse_conversation_one_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_one_b_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_one_b_01",
			},
			sound_events_duration = {
				[1] = 3.3409790992737,
			},
		},
		pes_shadow_curse_conversation_one_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_one_d_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_one_d_01",
			},
			sound_events_duration = {
				[1] = 2.9279999732971,
			},
		},
		pes_shadow_curse_conversation_seven_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_seven_b_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_seven_b_01",
			},
			sound_events_duration = {
				[1] = 4.4289793968201,
			},
		},
		pes_shadow_curse_conversation_seven_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_seven_d_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_seven_d_01",
			},
			sound_events_duration = {
				[1] = 5.8809790611267,
			},
		},
		pes_shadow_curse_conversation_seven_f_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_seven_f_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_seven_f_01",
			},
			sound_events_duration = {
				[1] = 3.8710000514984,
			},
		},
		pes_shadow_curse_conversation_six_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_six_b_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_six_b_01",
			},
			sound_events_duration = {
				[1] = 5.9289793968201,
			},
		},
		pes_shadow_curse_conversation_six_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_six_d_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_six_d_01",
			},
			sound_events_duration = {
				[1] = 2.0420000553131,
			},
		},
		pes_shadow_curse_conversation_ten = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_shadow_curse_conversation_ten_a_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_ten_a_01",
			},
			sound_events_duration = {
				[1] = 4.0939998626709,
			},
		},
		pes_shadow_curse_conversation_three_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pes_shadow_curse_conversation_three_c_01",
			},
			sound_events = {
				[1] = "pes_shadow_curse_conversation_three_c_01",
			},
			sound_events_duration = {
				[1] = 2.7309999465942,
			},
		},
		pwe_shadow_curse_conversation_eleven_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwe_shadow_curse_conversation_eleven_d_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_eleven_d_01",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		pwe_shadow_curse_conversation_nine = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_shadow_curse_conversation_nine_a_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_nine_a_01",
			},
			sound_events_duration = {
				[1] = 6.5489792823792,
			},
		},
		pwe_shadow_curse_conversation_nine_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwe_shadow_curse_conversation_nine_c_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_nine_c_01",
			},
			sound_events_duration = {
				[1] = 2.716979265213,
			},
		},
		pwe_shadow_curse_conversation_one_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwe_shadow_curse_conversation_one_c_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_one_c_01",
			},
			sound_events_duration = {
				[1] = 5.4179792404175,
			},
		},
		pwe_shadow_curse_conversation_six_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwe_shadow_curse_conversation_six_c_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_six_c_01",
			},
			sound_events_duration = {
				[1] = 2.7969999313355,
			},
		},
		pwe_shadow_curse_conversation_ten_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwe_shadow_curse_conversation_ten_b_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_ten_b_01",
			},
			sound_events_duration = {
				[1] = 8.5559787750244,
			},
		},
		pwe_shadow_curse_conversation_ten_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwe_shadow_curse_conversation_ten_d_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_ten_d_01",
			},
			sound_events_duration = {
				[1] = 1.9359999895096,
			},
		},
		pwe_shadow_curse_conversation_three_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwe_shadow_curse_conversation_three_d_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_three_d_01",
			},
			sound_events_duration = {
				[1] = 2.8299791812897,
			},
		},
		pwe_shadow_curse_conversation_twelve = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_shadow_curse_conversation_twelve_a_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_twelve_a_01",
			},
			sound_events_duration = {
				[1] = 4.7989997863769,
			},
		},
		pwe_shadow_curse_conversation_twelve_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwe_shadow_curse_conversation_twelve_c_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_twelve_c_01",
			},
			sound_events_duration = {
				[1] = 5.1309790611267,
			},
		},
		pwe_shadow_curse_conversation_two = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_shadow_curse_conversation_two_a_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_two_a_01",
			},
			sound_events_duration = {
				[1] = 4.9069790840149,
			},
		},
		pwe_shadow_curse_conversation_two_e_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwe_shadow_curse_conversation_two_e_01",
			},
			sound_events = {
				[1] = "pwe_shadow_curse_conversation_two_e_01",
			},
			sound_events_duration = {
				[1] = 2.4929790496826,
			},
		},
		pwh_shadow_curse_conversation_eight_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_eight_b_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_eight_b_01",
			},
			sound_events_duration = {
				[1] = 6.4359793663025,
			},
		},
		pwh_shadow_curse_conversation_eight_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_eight_d_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_eight_d_01",
			},
			sound_events_duration = {
				[1] = 3.9539792537689,
			},
		},
		pwh_shadow_curse_conversation_eight_f_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_eight_f_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_eight_f_01",
			},
			sound_events_duration = {
				[1] = 2.7429790496826,
			},
		},
		pwh_shadow_curse_conversation_eleven = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_shadow_curse_conversation_eleven_a_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_eleven_a_01",
			},
			sound_events_duration = {
				[1] = 10.60297870636,
			},
		},
		pwh_shadow_curse_conversation_eleven_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_eleven_c_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_eleven_c_01",
			},
			sound_events_duration = {
				[1] = 8.0740003585815,
			},
		},
		pwh_shadow_curse_conversation_eleven_f_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_eleven_f_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_eleven_f_01",
			},
			sound_events_duration = {
				[1] = 8.7259998321533,
			},
		},
		pwh_shadow_curse_conversation_five = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_shadow_curse_conversation_five_a_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_five_a_01",
			},
			sound_events_duration = {
				[1] = 11.683979034424,
			},
		},
		pwh_shadow_curse_conversation_five_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_five_c_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_five_c_01",
			},
			sound_events_duration = {
				[1] = 8.4319791793823,
			},
		},
		pwh_shadow_curse_conversation_four_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_four_b_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_four_b_01",
			},
			sound_events_duration = {
				[1] = 9.4759788513184,
			},
		},
		pwh_shadow_curse_conversation_four_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_four_d_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_four_d_01",
			},
			sound_events_duration = {
				[1] = 6.0609793663025,
			},
		},
		pwh_shadow_curse_conversation_seven = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_shadow_curse_conversation_seven_a_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_seven_a_01",
			},
			sound_events_duration = {
				[1] = 7.6039791107178,
			},
		},
		pwh_shadow_curse_conversation_seven_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_seven_c_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_seven_c_01",
			},
			sound_events_duration = {
				[1] = 5.9809789657593,
			},
		},
		pwh_shadow_curse_conversation_three_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_three_b_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_three_b_01",
			},
			sound_events_duration = {
				[1] = 5.7159790992737,
			},
		},
		pwh_shadow_curse_conversation_twelve_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_twelve_b_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_twelve_b_01",
			},
			sound_events_duration = {
				[1] = 4.2009792327881,
			},
		},
		pwh_shadow_curse_conversation_twelve_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_twelve_d_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_twelve_d_01",
			},
			sound_events_duration = {
				[1] = 3.6869790554047,
			},
		},
		pwh_shadow_curse_conversation_two_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_two_b_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_two_b_01",
			},
			sound_events_duration = {
				[1] = 6.4679789543152,
			},
		},
		pwh_shadow_curse_conversation_two_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_cowbell_banter",
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
				[1] = "pwh_shadow_curse_conversation_two_d_01",
			},
			sound_events = {
				[1] = "pwh_shadow_curse_conversation_two_d_01",
			},
			sound_events_duration = {
				[1] = 5.8159790039063,
			},
		},
	})
end
