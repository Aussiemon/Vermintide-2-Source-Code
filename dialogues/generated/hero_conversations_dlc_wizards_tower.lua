return function ()
	define_rule({
		name = "pdr_tower_npc_conversations_dummy_trigger",
		response = "pdr_tower_npc_conversations_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				18
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				2
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew"
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.LT,
				6
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_tower_npc_conversations_dummy_trigger",
		response = "pwe_tower_npc_conversations_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				18
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				2
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew"
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.LT,
				5
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_tower_npc_conversations_dummy_trigger",
		response = "pwh_tower_npc_conversations_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				18
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				2
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew"
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.LT,
				5
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			},
			{
				"faction_memory",
				"wizard_tower_npc_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_conversation_one_a_01",
		response = "nik_wizard_tower_conversation_one_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				50
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_conversation_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_wizard_tower_conversation_one_b_01",
		name = "pes_wizard_tower_conversation_one_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_wizard_tower_conversation_one_a_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pwe_wizard_tower_conversation_one_c_01",
		name = "pwe_wizard_tower_conversation_one_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wizard_tower_conversation_one_b_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_wizard_tower_conversation_one_d_01",
		name = "pes_wizard_tower_conversation_one_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wizard_tower_conversation_one_c_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		name = "nik_wizard_tower_conversation_two_a_01",
		response = "nik_wizard_tower_conversation_two_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower"
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				50
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_tower_conversation_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_wizard_tower_conversation_two_b_01",
		name = "pwh_wizard_tower_conversation_two_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_wizard_tower_conversation_two_a_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_wizard_tower_conversation_two_c_01",
		name = "pbw_wizard_tower_conversation_two_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_two_b_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_wizard_tower_conversation_two_d_01",
		name = "pwh_wizard_tower_conversation_two_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wizard_tower_conversation_two_c_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_conversation_three_a_01",
		response = "nfl_wizard_tower_conversation_three_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower"
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_conversation_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_wizard_tower_conversation_three_b_01",
		name = "pwh_wizard_tower_conversation_three_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_wizard_tower_conversation_three_a_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pes_wizard_tower_conversation_three_c_01",
		name = "pes_wizard_tower_conversation_three_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_three_b_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pwe_wizard_tower_conversation_three_d_01",
		name = "pwe_wizard_tower_conversation_three_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wizard_tower_conversation_three_c_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_conversation_four_a_01",
		response = "nfl_wizard_tower_conversation_four_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower"
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				50
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_conversation_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_four",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_wizard_tower_conversation_four_b_01",
		name = "pbw_wizard_tower_conversation_four_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_wizard_tower_conversation_four_a_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pwh_wizard_tower_conversation_four_c_01",
		name = "pwh_wizard_tower_conversation_four_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wizard_tower_conversation_four_b_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_wizard_tower_conversation_four_d_01",
		name = "pbw_wizard_tower_conversation_four_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_four_c_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_conversation_five_a_01",
		response = "nfl_wizard_tower_conversation_five_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower"
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				50
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_conversation_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_five",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_wizard_tower_conversation_five_b_01",
		name = "pdr_wizard_tower_conversation_five_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_wizard_tower_conversation_five_a_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_wizard_tower_conversation_five_c_01",
		name = "pwe_wizard_tower_conversation_five_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_wizard_tower_conversation_five_b_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_wizard_tower_conversation_five_d_01",
		name = "pdr_wizard_tower_conversation_five_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wizard_tower_conversation_five_c_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		name = "nfl_wizard_tower_conversation_six_a_01",
		response = "nfl_wizard_tower_conversation_six_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_tower"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				50
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"wizard_tower_conversation_six",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_tower_conversation_six",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_wizard_tower_conversation_six_b_01",
		name = "pes_wizard_tower_conversation_six_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_wizard_tower_conversation_six_a_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pwe_wizard_tower_conversation_six_c_01",
		name = "pwe_wizard_tower_conversation_six_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wizard_tower_conversation_six_b_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pes_wizard_tower_conversation_six_d_01",
		name = "pes_wizard_tower_conversation_six_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wizard_tower_conversation_six_c_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_conversation_seven_a_01",
		response = "pwh_wizard_tower_conversation_seven_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
			},
			{
				"user_context",
				"intensity",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew"
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"wizard_tower_conversation_seven",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_conversation_seven",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_wizard_tower_conversation_seven_b_01",
		response = "pwe_wizard_tower_conversation_seven_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_seven_a_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_wizard_tower_conversation_seven_c_01",
		response = "pbw_wizard_tower_conversation_seven_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wizard_tower_conversation_seven_b_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_conversation_seven_d_01",
		response = "pwh_wizard_tower_conversation_seven_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wizard_tower_conversation_seven_c_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_wizard_tower_conversation_eight_a_01",
		response = "pbw_wizard_tower_conversation_eight_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
			},
			{
				"user_context",
				"intensity",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew"
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"wizard_tower_conversation_eight",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_conversation_eight",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_conversation_eight_b_01",
		response = "pwh_wizard_tower_conversation_eight_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wizard_tower_conversation_eight_a_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_wizard_tower_conversation_eight_c_01",
		response = "pdr_wizard_tower_conversation_eight_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_eight_b_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_conversation_eight_d_01",
		response = "pwh_wizard_tower_conversation_eight_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_wizard_tower_conversation_eight_c_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_wizard_tower_conversation_eight_e_01",
		response = "pbw_wizard_tower_conversation_eight_e_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_eight_d_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_wizard_tower_conversation_nine_a_01",
		response = "pwe_wizard_tower_conversation_nine_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
			},
			{
				"user_context",
				"intensity",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew"
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"wizard_tower_conversation_nine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_conversation_nine",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_wizard_tower_conversation_nine_b_01",
		response = "pes_wizard_tower_conversation_nine_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wizard_tower_conversation_nine_a_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_wizard_tower_conversation_nine_c_01",
		response = "pwe_wizard_tower_conversation_nine_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wizard_tower_conversation_nine_b_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_wizard_tower_conversation_ten_a_01",
		response = "pes_wizard_tower_conversation_ten_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_tower"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
			},
			{
				"user_context",
				"intensity",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"wizard_tower_brew",
				OP.NOT,
				"wizard_tower_brew"
			},
			{
				"faction_memory",
				"wizard_tower_intro_c",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"wizard_tower_conversation_ten",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_tower_conversation_ten",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_conversation_ten_b_01",
		response = "pwh_wizard_tower_conversation_ten_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wizard_tower_conversation_ten_a_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_wizard_tower_conversation_ten_c_01",
		response = "pbw_wizard_tower_conversation_ten_c_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wizard_tower_conversation_ten_b_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_wizard_tower_conversation_ten_d_01",
		response = "pwh_wizard_tower_conversation_ten_d_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wizard_tower_conversation_ten_c_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		nfl_wizard_tower_conversation_six_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_wizard_tower_conversation_six_a_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 8.9868955612183
			},
			localization_strings = {
				[1.0] = "nfl_wizard_tower_conversation_six_a_01"
			},
			sound_distance = math.huge
		},
		pbw_wizard_tower_conversation_eight_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_wizard_tower_conversation_eight_a_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.0359792709351
			},
			localization_strings = {
				[1.0] = "pbw_wizard_tower_conversation_eight_a_01"
			}
		},
		nfl_wizard_tower_conversation_five_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_wizard_tower_conversation_five_a_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1890206336975
			},
			localization_strings = {
				[1.0] = "nfl_wizard_tower_conversation_five_a_01"
			},
			sound_distance = math.huge
		},
		pbw_wizard_tower_conversation_seven_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_wizard_tower_conversation_seven_c_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.8199791908264
			},
			localization_strings = {
				[1.0] = "pbw_wizard_tower_conversation_seven_c_01"
			}
		},
		pdr_wizard_tower_conversation_five_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_wizard_tower_conversation_five_d_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3479790687561
			},
			localization_strings = {
				[1.0] = "pdr_wizard_tower_conversation_five_d_01"
			}
		},
		pwe_wizard_tower_conversation_three_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wizard_tower_conversation_three_d_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5199999809265
			},
			localization_strings = {
				[1.0] = "pwe_wizard_tower_conversation_three_d_01"
			}
		},
		pbw_wizard_tower_conversation_four_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_wizard_tower_conversation_four_d_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1879999637604
			},
			localization_strings = {
				[1.0] = "pbw_wizard_tower_conversation_four_d_01"
			}
		},
		pes_wizard_tower_conversation_six_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk_must_reply",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wizard_tower_conversation_six_b_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.0219793319702
			},
			localization_strings = {
				[1.0] = "pes_wizard_tower_conversation_six_b_01"
			}
		},
		pwe_wizard_tower_conversation_one_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wizard_tower_conversation_one_c_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6349792480469
			},
			localization_strings = {
				[1.0] = "pwe_wizard_tower_conversation_one_c_01"
			}
		},
		pwe_wizard_tower_conversation_six_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wizard_tower_conversation_six_c_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9049999713898
			},
			localization_strings = {
				[1.0] = "pwe_wizard_tower_conversation_six_c_01"
			}
		},
		pwh_wizard_tower_conversation_ten_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wizard_tower_conversation_ten_b_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 8.3429794311523
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_conversation_ten_b_01"
			}
		},
		pwh_tower_npc_conversations_dummy_trigger = {
			override_awareness = "story_conversations_tower",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "dummy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			},
			localization_strings = {
				[1.0] = "dummy"
			}
		},
		pwe_tower_npc_conversations_dummy_trigger = {
			override_awareness = "story_conversations_tower",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "dummy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			},
			localization_strings = {
				[1.0] = "dummy"
			}
		},
		nfl_wizard_tower_conversation_three_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_wizard_tower_conversation_three_a_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.5687708854675
			},
			localization_strings = {
				[1.0] = "nfl_wizard_tower_conversation_three_a_01"
			},
			sound_distance = math.huge
		},
		pwe_wizard_tower_conversation_five_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wizard_tower_conversation_five_c_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7639999389648
			},
			localization_strings = {
				[1.0] = "pwe_wizard_tower_conversation_five_c_01"
			}
		},
		pes_wizard_tower_conversation_one_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wizard_tower_conversation_one_d_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3359999656677
			},
			localization_strings = {
				[1.0] = "pes_wizard_tower_conversation_one_d_01"
			}
		},
		pes_wizard_tower_conversation_ten_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wizard_tower_conversation_ten_a_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.0320000648499
			},
			localization_strings = {
				[1.0] = "pes_wizard_tower_conversation_ten_a_01"
			}
		},
		nik_wizard_tower_conversation_one_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_wizard_tower_conversation_one_a_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1730418205261
			},
			localization_strings = {
				[1.0] = "nik_wizard_tower_conversation_one_a_01"
			},
			sound_distance = math.huge
		},
		pwh_wizard_tower_conversation_ten_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wizard_tower_conversation_ten_d_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.9239791631699
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_conversation_ten_d_01"
			}
		},
		pwh_wizard_tower_conversation_seven_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wizard_tower_conversation_seven_d_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.9479792118073
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_conversation_seven_d_01"
			}
		},
		pwe_wizard_tower_conversation_seven_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wizard_tower_conversation_seven_b_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.0959792137146
			},
			localization_strings = {
				[1.0] = "pwe_wizard_tower_conversation_seven_b_01"
			}
		},
		pwe_wizard_tower_conversation_nine_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wizard_tower_conversation_nine_c_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.1630001068115
			},
			localization_strings = {
				[1.0] = "pwe_wizard_tower_conversation_nine_c_01"
			}
		},
		pwh_wizard_tower_conversation_two_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk_must_reply",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wizard_tower_conversation_two_b_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.8249793052673
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_conversation_two_b_01"
			}
		},
		pes_wizard_tower_conversation_nine_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wizard_tower_conversation_nine_b_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.9639792442322
			},
			localization_strings = {
				[1.0] = "pes_wizard_tower_conversation_nine_b_01"
			}
		},
		pwe_wizard_tower_conversation_nine_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wizard_tower_conversation_nine_a_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.3390002250671
			},
			localization_strings = {
				[1.0] = "pwe_wizard_tower_conversation_nine_a_01"
			}
		},
		pwh_wizard_tower_conversation_eight_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wizard_tower_conversation_eight_b_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.4839792251587
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_conversation_eight_b_01"
			}
		},
		pbw_wizard_tower_conversation_eight_e_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_wizard_tower_conversation_eight_e_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 0.89397919178009
			},
			localization_strings = {
				[1.0] = "pbw_wizard_tower_conversation_eight_e_01"
			}
		},
		pwh_wizard_tower_conversation_eight_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wizard_tower_conversation_eight_d_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.4929790496826
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_conversation_eight_d_01"
			}
		},
		pdr_wizard_tower_conversation_eight_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_wizard_tower_conversation_eight_c_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.4300000667572
			},
			localization_strings = {
				[1.0] = "pdr_wizard_tower_conversation_eight_c_01"
			}
		},
		nfl_wizard_tower_conversation_four_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_wizard_tower_conversation_four_a_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.3672289848328
			},
			localization_strings = {
				[1.0] = "nfl_wizard_tower_conversation_four_a_01"
			},
			sound_distance = math.huge
		},
		pes_wizard_tower_conversation_one_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk_must_reply",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wizard_tower_conversation_one_b_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6339790821075
			},
			localization_strings = {
				[1.0] = "pes_wizard_tower_conversation_one_b_01"
			}
		},
		pdr_wizard_tower_conversation_five_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk_must_reply",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_wizard_tower_conversation_five_b_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0219790935516
			},
			localization_strings = {
				[1.0] = "pdr_wizard_tower_conversation_five_b_01"
			}
		},
		nik_wizard_tower_conversation_two_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_wizard_tower_conversation_two_a_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1984581947327
			},
			localization_strings = {
				[1.0] = "nik_wizard_tower_conversation_two_a_01"
			},
			sound_distance = math.huge
		},
		pwh_wizard_tower_conversation_four_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wizard_tower_conversation_four_c_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.9359998703003
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_conversation_four_c_01"
			}
		},
		pwh_wizard_tower_conversation_three_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk_must_reply",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wizard_tower_conversation_three_b_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1599791049957
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_conversation_three_b_01"
			}
		},
		pbw_wizard_tower_conversation_four_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk_must_reply",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_wizard_tower_conversation_four_b_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3769791126251
			},
			localization_strings = {
				[1.0] = "pbw_wizard_tower_conversation_four_b_01"
			}
		},
		pbw_wizard_tower_conversation_ten_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_wizard_tower_conversation_ten_c_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.8499791622162
			},
			localization_strings = {
				[1.0] = "pbw_wizard_tower_conversation_ten_c_01"
			}
		},
		pwh_wizard_tower_conversation_seven_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wizard_tower_conversation_seven_a_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.6679792404175
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_conversation_seven_a_01"
			}
		},
		pdr_tower_npc_conversations_dummy_trigger = {
			override_awareness = "story_conversations_tower",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "dummy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			},
			localization_strings = {
				[1.0] = "dummy"
			}
		},
		pbw_wizard_tower_conversation_two_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_wizard_tower_conversation_two_c_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0709791183472
			},
			localization_strings = {
				[1.0] = "pbw_wizard_tower_conversation_two_c_01"
			}
		},
		pes_wizard_tower_conversation_six_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wizard_tower_conversation_six_d_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5899791717529
			},
			localization_strings = {
				[1.0] = "pes_wizard_tower_conversation_six_d_01"
			}
		},
		pes_wizard_tower_conversation_three_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wizard_tower_conversation_three_c_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4559791088104
			},
			localization_strings = {
				[1.0] = "pes_wizard_tower_conversation_three_c_01"
			}
		},
		pwh_wizard_tower_conversation_two_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_tower",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wizard_tower_conversation_two_d_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.9699792861939
			},
			localization_strings = {
				[1.0] = "pwh_wizard_tower_conversation_two_d_01"
			}
		}
	})
end
