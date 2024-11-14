-- chunkname: @dialogues/generated/hero_conversations_dlc_wizards_tower.lua

return function ()
	define_rule({
		name = "nfl_wizard_tower_conversation_five_a_01",
		probability = 1,
		response = "nfl_wizard_tower_conversation_five_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower",
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
				"level_time",
				OP.GT,
				50,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
			{
				"user_memory",
				"wizard_tower_conversation_five",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_five",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nfl_wizard_tower_conversation_four_a_01",
		probability = 1,
		response = "nfl_wizard_tower_conversation_four_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower",
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
				"level_time",
				OP.GT,
				50,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
			{
				"user_memory",
				"wizard_tower_conversation_four",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_four",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nfl_wizard_tower_conversation_six_a_01",
		probability = 1,
		response = "nfl_wizard_tower_conversation_six_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower",
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
				"level_time",
				OP.GT,
				50,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
			{
				"user_memory",
				"wizard_tower_conversation_six",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_six",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nfl_wizard_tower_conversation_three_a_01",
		probability = 1,
		response = "nfl_wizard_tower_conversation_three_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower",
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
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady",
			},
			{
				"user_memory",
				"wizard_tower_conversation_three",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_three",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_wizard_tower_conversation_one_a_01",
		probability = 1,
		response = "nik_wizard_tower_conversation_one_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower",
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
				"level_time",
				OP.GT,
				50,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"wizard_tower_conversation_one",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_one",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_wizard_tower_conversation_two_a_01",
		probability = 1,
		response = "nik_wizard_tower_conversation_two_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower",
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
				"level_time",
				OP.GT,
				50,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"wizard_tower_conversation_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_two",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_conversation_eight_a_01",
		probability = 1,
		response = "pbw_wizard_tower_conversation_eight_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
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
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew",
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"wizard_tower_conversation_eight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_conversation_eight",
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
		name = "pbw_wizard_tower_conversation_eight_e_01",
		probability = 1,
		response = "pbw_wizard_tower_conversation_eight_e_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_eight_d_01",
			},
			{
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
		name = "pbw_wizard_tower_conversation_four_b_01",
		probability = 1,
		response = "pbw_wizard_tower_conversation_four_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_wizard_tower_conversation_four_a_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_conversation_four_d_01",
		probability = 1,
		response = "pbw_wizard_tower_conversation_four_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_four_c_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_wizard_tower_conversation_seven_c_01",
		probability = 1,
		response = "pbw_wizard_tower_conversation_seven_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wizard_tower_conversation_seven_b_01",
			},
			{
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
		name = "pbw_wizard_tower_conversation_ten_c_01",
		probability = 1,
		response = "pbw_wizard_tower_conversation_ten_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_ten_b_01",
			},
			{
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
		name = "pbw_wizard_tower_conversation_two_c_01",
		probability = 1,
		response = "pbw_wizard_tower_conversation_two_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_two_b_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pdr_tower_npc_conversations_dummy_trigger",
		probability = 1,
		response = "pdr_tower_npc_conversations_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				18,
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
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew",
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.LT,
				6,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_tower_conversation_eight_c_01",
		probability = 1,
		response = "pdr_wizard_tower_conversation_eight_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_eight_b_01",
			},
			{
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
		name = "pdr_wizard_tower_conversation_five_b_01",
		probability = 1,
		response = "pdr_wizard_tower_conversation_five_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_wizard_tower_conversation_five_a_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_wizard_tower_conversation_five_d_01",
		probability = 1,
		response = "pdr_wizard_tower_conversation_five_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wizard_tower_conversation_five_c_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pes_wizard_tower_conversation_nine_b_01",
		probability = 1,
		response = "pes_wizard_tower_conversation_nine_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wizard_tower_conversation_nine_a_01",
			},
			{
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
		name = "pes_wizard_tower_conversation_one_b_01",
		probability = 1,
		response = "pes_wizard_tower_conversation_one_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_wizard_tower_conversation_one_a_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_wizard_tower_conversation_one_d_01",
		probability = 1,
		response = "pes_wizard_tower_conversation_one_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wizard_tower_conversation_one_c_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_wizard_tower_conversation_six_b_01",
		probability = 1,
		response = "pes_wizard_tower_conversation_six_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_wizard_tower_conversation_six_a_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_wizard_tower_conversation_six_d_01",
		probability = 1,
		response = "pes_wizard_tower_conversation_six_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wizard_tower_conversation_six_c_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_wizard_tower_conversation_ten_a_01",
		probability = 1,
		response = "pes_wizard_tower_conversation_ten_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
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
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew",
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"wizard_tower_conversation_ten",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_conversation_ten",
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
		name = "pes_wizard_tower_conversation_three_c_01",
		probability = 1,
		response = "pes_wizard_tower_conversation_three_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_three_b_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pwe_tower_npc_conversations_dummy_trigger",
		probability = 1,
		response = "pwe_tower_npc_conversations_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				18,
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew",
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_conversation_five_c_01",
		probability = 1,
		response = "pwe_wizard_tower_conversation_five_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_wizard_tower_conversation_five_b_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_conversation_nine_a_01",
		probability = 1,
		response = "pwe_wizard_tower_conversation_nine_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
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
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew",
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"wizard_tower_conversation_nine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_conversation_nine",
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
		name = "pwe_wizard_tower_conversation_nine_c_01",
		probability = 1,
		response = "pwe_wizard_tower_conversation_nine_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wizard_tower_conversation_nine_b_01",
			},
			{
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
		name = "pwe_wizard_tower_conversation_one_c_01",
		probability = 1,
		response = "pwe_wizard_tower_conversation_one_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wizard_tower_conversation_one_b_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_conversation_seven_b_01",
		probability = 1,
		response = "pwe_wizard_tower_conversation_seven_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_seven_a_01",
			},
			{
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
		name = "pwe_wizard_tower_conversation_six_c_01",
		probability = 1,
		response = "pwe_wizard_tower_conversation_six_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wizard_tower_conversation_six_b_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_wizard_tower_conversation_three_d_01",
		probability = 1,
		response = "pwe_wizard_tower_conversation_three_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wizard_tower_conversation_three_c_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwh_tower_npc_conversations_dummy_trigger",
		probability = 1,
		response = "pwh_tower_npc_conversations_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				18,
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
				"faction_memory",
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew",
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_wizard_tower_conversation_eight_b_01",
		probability = 1,
		response = "pwh_wizard_tower_conversation_eight_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wizard_tower_conversation_eight_a_01",
			},
			{
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
		name = "pwh_wizard_tower_conversation_eight_d_01",
		probability = 1,
		response = "pwh_wizard_tower_conversation_eight_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_wizard_tower_conversation_eight_c_01",
			},
			{
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
		name = "pwh_wizard_tower_conversation_four_c_01",
		probability = 1,
		response = "pwh_wizard_tower_conversation_four_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wizard_tower_conversation_four_b_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_wizard_tower_conversation_seven_a_01",
		probability = 1,
		response = "pwh_wizard_tower_conversation_seven_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
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
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew",
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240,
			},
			{
				"faction_memory",
				"wizard_tower_conversation_seven",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_conversation_seven",
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
		name = "pwh_wizard_tower_conversation_seven_d_01",
		probability = 1,
		response = "pwh_wizard_tower_conversation_seven_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wizard_tower_conversation_seven_c_01",
			},
			{
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
		name = "pwh_wizard_tower_conversation_ten_b_01",
		probability = 1,
		response = "pwh_wizard_tower_conversation_ten_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wizard_tower_conversation_ten_a_01",
			},
			{
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
		name = "pwh_wizard_tower_conversation_ten_d_01",
		probability = 1,
		response = "pwh_wizard_tower_conversation_ten_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wizard_tower_conversation_ten_c_01",
			},
			{
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
		name = "pwh_wizard_tower_conversation_three_b_01",
		probability = 1,
		response = "pwh_wizard_tower_conversation_three_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_wizard_tower_conversation_three_a_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_wizard_tower_conversation_two_b_01",
		probability = 1,
		response = "pwh_wizard_tower_conversation_two_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_wizard_tower_conversation_two_a_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_wizard_tower_conversation_two_d_01",
		probability = 1,
		response = "pwh_wizard_tower_conversation_two_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wizard_tower_conversation_two_c_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	add_dialogues({
		nfl_wizard_tower_conversation_five_a_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "nfl_wizard_tower_conversation_five_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nfl_wizard_tower_conversation_five_a_01",
			},
			sound_events_duration = {
				[1] = 5.1890206336975,
			},
		},
		nfl_wizard_tower_conversation_four_a_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "nfl_wizard_tower_conversation_four_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nfl_wizard_tower_conversation_four_a_01",
			},
			sound_events_duration = {
				[1] = 5.3672289848328,
			},
		},
		nfl_wizard_tower_conversation_six_a_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "nfl_wizard_tower_conversation_six_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nfl_wizard_tower_conversation_six_a_01",
			},
			sound_events_duration = {
				[1] = 8.9868955612183,
			},
		},
		nfl_wizard_tower_conversation_three_a_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "nfl_wizard_tower_conversation_three_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nfl_wizard_tower_conversation_three_a_01",
			},
			sound_events_duration = {
				[1] = 6.5687708854675,
			},
		},
		nik_wizard_tower_conversation_one_a_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "nik_wizard_tower_conversation_one_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_wizard_tower_conversation_one_a_01",
			},
			sound_events_duration = {
				[1] = 5.1730418205261,
			},
		},
		nik_wizard_tower_conversation_two_a_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "nik_wizard_tower_conversation_two_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_wizard_tower_conversation_two_a_01",
			},
			sound_events_duration = {
				[1] = 4.1984581947327,
			},
		},
		pbw_wizard_tower_conversation_eight_a_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pbw_wizard_tower_conversation_eight_a_01",
			},
			sound_events = {
				[1] = "pbw_wizard_tower_conversation_eight_a_01",
			},
			sound_events_duration = {
				[1] = 6.0359792709351,
			},
		},
		pbw_wizard_tower_conversation_eight_e_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wizard_tower_conversation_eight_e_01",
			},
			sound_events = {
				[1] = "pbw_wizard_tower_conversation_eight_e_01",
			},
			sound_events_duration = {
				[1] = 0.89397919178009,
			},
		},
		pbw_wizard_tower_conversation_four_b_01 = {
			category = "story_talk_must_reply",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pbw_wizard_tower_conversation_four_b_01",
			},
			sound_events = {
				[1] = "pbw_wizard_tower_conversation_four_b_01",
			},
			sound_events_duration = {
				[1] = 3.3769791126251,
			},
		},
		pbw_wizard_tower_conversation_four_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pbw_wizard_tower_conversation_four_d_01",
			},
			sound_events = {
				[1] = "pbw_wizard_tower_conversation_four_d_01",
			},
			sound_events_duration = {
				[1] = 2.1879999637604,
			},
		},
		pbw_wizard_tower_conversation_seven_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wizard_tower_conversation_seven_c_01",
			},
			sound_events = {
				[1] = "pbw_wizard_tower_conversation_seven_c_01",
			},
			sound_events_duration = {
				[1] = 3.8199791908264,
			},
		},
		pbw_wizard_tower_conversation_ten_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_wizard_tower_conversation_ten_c_01",
			},
			sound_events = {
				[1] = "pbw_wizard_tower_conversation_ten_c_01",
			},
			sound_events_duration = {
				[1] = 2.8499791622162,
			},
		},
		pbw_wizard_tower_conversation_two_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pbw_wizard_tower_conversation_two_c_01",
			},
			sound_events = {
				[1] = "pbw_wizard_tower_conversation_two_c_01",
			},
			sound_events_duration = {
				[1] = 3.0709791183472,
			},
		},
		pdr_tower_npc_conversations_dummy_trigger = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "story_conversations_tower",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pdr_wizard_tower_conversation_eight_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_wizard_tower_conversation_eight_c_01",
			},
			sound_events = {
				[1] = "pdr_wizard_tower_conversation_eight_c_01",
			},
			sound_events_duration = {
				[1] = 2.4300000667572,
			},
		},
		pdr_wizard_tower_conversation_five_b_01 = {
			category = "story_talk_must_reply",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pdr_wizard_tower_conversation_five_b_01",
			},
			sound_events = {
				[1] = "pdr_wizard_tower_conversation_five_b_01",
			},
			sound_events_duration = {
				[1] = 3.0219790935516,
			},
		},
		pdr_wizard_tower_conversation_five_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pdr_wizard_tower_conversation_five_d_01",
			},
			sound_events = {
				[1] = "pdr_wizard_tower_conversation_five_d_01",
			},
			sound_events_duration = {
				[1] = 3.3479790687561,
			},
		},
		pes_wizard_tower_conversation_nine_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_wizard_tower_conversation_nine_b_01",
			},
			sound_events = {
				[1] = "pes_wizard_tower_conversation_nine_b_01",
			},
			sound_events_duration = {
				[1] = 4.9639792442322,
			},
		},
		pes_wizard_tower_conversation_one_b_01 = {
			category = "story_talk_must_reply",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pes_wizard_tower_conversation_one_b_01",
			},
			sound_events = {
				[1] = "pes_wizard_tower_conversation_one_b_01",
			},
			sound_events_duration = {
				[1] = 3.6339790821075,
			},
		},
		pes_wizard_tower_conversation_one_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pes_wizard_tower_conversation_one_d_01",
			},
			sound_events = {
				[1] = "pes_wizard_tower_conversation_one_d_01",
			},
			sound_events_duration = {
				[1] = 2.3359999656677,
			},
		},
		pes_wizard_tower_conversation_six_b_01 = {
			category = "story_talk_must_reply",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pes_wizard_tower_conversation_six_b_01",
			},
			sound_events = {
				[1] = "pes_wizard_tower_conversation_six_b_01",
			},
			sound_events_duration = {
				[1] = 5.0219793319702,
			},
		},
		pes_wizard_tower_conversation_six_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pes_wizard_tower_conversation_six_d_01",
			},
			sound_events = {
				[1] = "pes_wizard_tower_conversation_six_d_01",
			},
			sound_events_duration = {
				[1] = 3.5899791717529,
			},
		},
		pes_wizard_tower_conversation_ten_a_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pes_wizard_tower_conversation_ten_a_01",
			},
			sound_events = {
				[1] = "pes_wizard_tower_conversation_ten_a_01",
			},
			sound_events_duration = {
				[1] = 5.0320000648499,
			},
		},
		pes_wizard_tower_conversation_three_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pes_wizard_tower_conversation_three_c_01",
			},
			sound_events = {
				[1] = "pes_wizard_tower_conversation_three_c_01",
			},
			sound_events_duration = {
				[1] = 2.4559791088104,
			},
		},
		pwe_tower_npc_conversations_dummy_trigger = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "story_conversations_tower",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pwe_wizard_tower_conversation_five_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pwe_wizard_tower_conversation_five_c_01",
			},
			sound_events = {
				[1] = "pwe_wizard_tower_conversation_five_c_01",
			},
			sound_events_duration = {
				[1] = 2.7639999389648,
			},
		},
		pwe_wizard_tower_conversation_nine_a_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pwe_wizard_tower_conversation_nine_a_01",
			},
			sound_events = {
				[1] = "pwe_wizard_tower_conversation_nine_a_01",
			},
			sound_events_duration = {
				[1] = 5.3390002250671,
			},
		},
		pwe_wizard_tower_conversation_nine_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wizard_tower_conversation_nine_c_01",
			},
			sound_events = {
				[1] = "pwe_wizard_tower_conversation_nine_c_01",
			},
			sound_events_duration = {
				[1] = 2.1630001068115,
			},
		},
		pwe_wizard_tower_conversation_one_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pwe_wizard_tower_conversation_one_c_01",
			},
			sound_events = {
				[1] = "pwe_wizard_tower_conversation_one_c_01",
			},
			sound_events_duration = {
				[1] = 2.6349792480469,
			},
		},
		pwe_wizard_tower_conversation_seven_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_wizard_tower_conversation_seven_b_01",
			},
			sound_events = {
				[1] = "pwe_wizard_tower_conversation_seven_b_01",
			},
			sound_events_duration = {
				[1] = 3.0959792137146,
			},
		},
		pwe_wizard_tower_conversation_six_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pwe_wizard_tower_conversation_six_c_01",
			},
			sound_events = {
				[1] = "pwe_wizard_tower_conversation_six_c_01",
			},
			sound_events_duration = {
				[1] = 3.9049999713898,
			},
		},
		pwe_wizard_tower_conversation_three_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pwe_wizard_tower_conversation_three_d_01",
			},
			sound_events = {
				[1] = "pwe_wizard_tower_conversation_three_d_01",
			},
			sound_events_duration = {
				[1] = 2.5199999809265,
			},
		},
		pwh_tower_npc_conversations_dummy_trigger = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "story_conversations_tower",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pwh_wizard_tower_conversation_eight_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wizard_tower_conversation_eight_b_01",
			},
			sound_events = {
				[1] = "pwh_wizard_tower_conversation_eight_b_01",
			},
			sound_events_duration = {
				[1] = 7.4839792251587,
			},
		},
		pwh_wizard_tower_conversation_eight_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wizard_tower_conversation_eight_d_01",
			},
			sound_events = {
				[1] = "pwh_wizard_tower_conversation_eight_d_01",
			},
			sound_events_duration = {
				[1] = 4.4929790496826,
			},
		},
		pwh_wizard_tower_conversation_four_c_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pwh_wizard_tower_conversation_four_c_01",
			},
			sound_events = {
				[1] = "pwh_wizard_tower_conversation_four_c_01",
			},
			sound_events_duration = {
				[1] = 4.9359998703003,
			},
		},
		pwh_wizard_tower_conversation_seven_a_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pwh_wizard_tower_conversation_seven_a_01",
			},
			sound_events = {
				[1] = "pwh_wizard_tower_conversation_seven_a_01",
			},
			sound_events_duration = {
				[1] = 5.6679792404175,
			},
		},
		pwh_wizard_tower_conversation_seven_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wizard_tower_conversation_seven_d_01",
			},
			sound_events = {
				[1] = "pwh_wizard_tower_conversation_seven_d_01",
			},
			sound_events_duration = {
				[1] = 3.9479792118073,
			},
		},
		pwh_wizard_tower_conversation_ten_b_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wizard_tower_conversation_ten_b_01",
			},
			sound_events = {
				[1] = "pwh_wizard_tower_conversation_ten_b_01",
			},
			sound_events_duration = {
				[1] = 8.3429794311523,
			},
		},
		pwh_wizard_tower_conversation_ten_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_wizard_tower_conversation_ten_d_01",
			},
			sound_events = {
				[1] = "pwh_wizard_tower_conversation_ten_d_01",
			},
			sound_events_duration = {
				[1] = 1.9239791631699,
			},
		},
		pwh_wizard_tower_conversation_three_b_01 = {
			category = "story_talk_must_reply",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pwh_wizard_tower_conversation_three_b_01",
			},
			sound_events = {
				[1] = "pwh_wizard_tower_conversation_three_b_01",
			},
			sound_events_duration = {
				[1] = 3.1599791049957,
			},
		},
		pwh_wizard_tower_conversation_two_b_01 = {
			category = "story_talk_must_reply",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pwh_wizard_tower_conversation_two_b_01",
			},
			sound_events = {
				[1] = "pwh_wizard_tower_conversation_two_b_01",
			},
			sound_events_duration = {
				[1] = 5.8249793052673,
			},
		},
		pwh_wizard_tower_conversation_two_d_01 = {
			category = "story_talk",
			database = "hero_conversations_dlc_wizards_tower",
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
				[1] = "pwh_wizard_tower_conversation_two_d_01",
			},
			sound_events = {
				[1] = "pwh_wizard_tower_conversation_two_d_01",
			},
			sound_events_duration = {
				[1] = 4.9699792861939,
			},
		},
	})
end
