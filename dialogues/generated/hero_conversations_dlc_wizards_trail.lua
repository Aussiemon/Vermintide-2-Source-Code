return function ()
	define_rule({
		name = "nik_wizard_trail_conversation_five_a_01",
		response = "nik_wizard_trail_conversation_five_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_trail"
			},
			{
				"global_context",
				"wood_elf",
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
				"wizard_trail_conversation_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_conversation_five",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_conversation_four_a_01",
		response = "nik_wizard_trail_conversation_four_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_trail"
			},
			{
				"global_context",
				"wood_elf",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_conversation_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_conversation_four",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_conversation_one_a_01",
		response = "nik_wizard_trail_conversation_one_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_trail"
			},
			{
				"global_context",
				"bright_wizard",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"wizard_trail_conversation_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_conversation_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_conversation_three_a_01",
		response = "nik_wizard_trail_conversation_three_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_trail"
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
				"wizard_trail_conversation_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_conversation_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_wizard_trail_conversation_two_a_01",
		response = "nik_wizard_trail_conversation_two_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_conversations_trail"
			},
			{
				"global_context",
				"wood_elf",
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
				"wizard_trail_conversation_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"wizard_trail_conversation_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_wizard_trail_conversation_five_b_01",
		name = "pbw_wizard_trail_conversation_five_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_conversation_five_done"
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
		response = "pbw_wizard_trail_conversation_one_b_01",
		name = "pbw_wizard_trail_conversation_one_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_conversation_one_done"
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
		name = "pbw_wizard_trail_conversation_seven_a_01",
		response = "pbw_wizard_trail_conversation_seven_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_trail"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				50
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
				"wood_elf",
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
				"wizard_trail_illusion_fades_a",
				OP.NOT,
				"wizard_trail_illusion_fades_a"
			},
			{
				"faction_memory",
				"wizard_trail_conversation",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_conversation",
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
		name = "pbw_wizard_trail_conversation_six_b_01",
		response = "pbw_wizard_trail_conversation_six_b_01",
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
				"pwh_wizard_trail_conversation_six_a_01"
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
		name = "pbw_wizard_trail_conversation_six_d_01",
		response = "pbw_wizard_trail_conversation_six_d_01",
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
				"pes_wizard_trail_conversation_six_c_01"
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
		name = "pdr_trail_npc_conversations_dummy_trigger",
		response = "pdr_trail_npc_conversations_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_trail"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				22
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				50
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"dlc_wizards_trail"
			},
			{
				"faction_memory",
				"wizard_trail_illusion_fades_a",
				OP.NOT,
				"wizard_trail_illusion_fades_a"
			},
			{
				"faction_memory",
				"wizard_trail_conversation",
				OP.EQ,
				0
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
				"wizard_trail_conversation",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_wizard_trail_conversation_eight_a_01",
		response = "pdr_wizard_trail_conversation_eight_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_trail"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				50
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"global_context",
				"witch_hunter",
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
				"wizard_trail_illusion_fades_a",
				OP.NOT,
				"wizard_trail_illusion_fades_a"
			},
			{
				"faction_memory",
				"wizard_trail_conversation",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_conversation",
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
		response = "pdr_wizard_trail_conversation_four_c_01",
		name = "pdr_wizard_trail_conversation_four_c_01",
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
				"pwe_wizard_trail_conversation_four_b_01"
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
		response = "pdr_wizard_trail_conversation_four_e_01",
		name = "pdr_wizard_trail_conversation_four_e_01",
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
				"pes_wizard_trail_conversation_four_d_01"
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
		name = "pdr_wizard_trail_conversation_nine_c_01",
		response = "pdr_wizard_trail_conversation_nine_c_01",
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
				"pwh_wizard_trail_conversation_nine_b_01"
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
		response = "pdr_wizard_trail_conversation_one_c_01",
		name = "pdr_wizard_trail_conversation_one_c_01",
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
				"pbw_wizard_trail_conversation_one_b_01"
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
		name = "pdr_wizard_trail_conversation_ten_b_01",
		response = "pdr_wizard_trail_conversation_ten_b_01",
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
				"pes_wizard_trail_conversation_ten_a_01"
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
		name = "pes_wizard_trail_conversation_eight_b_01",
		response = "pes_wizard_trail_conversation_eight_b_01",
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
				"pdr_wizard_trail_conversation_eight_a_01"
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
		name = "pes_wizard_trail_conversation_eight_d_01",
		response = "pes_wizard_trail_conversation_eight_d_01",
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
				"pwh_wizard_trail_conversation_eight_c_01"
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
		response = "pes_wizard_trail_conversation_four_d_01",
		name = "pes_wizard_trail_conversation_four_d_01",
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
				"pdr_wizard_trail_conversation_four_c_01"
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
		response = "pes_wizard_trail_conversation_one_d_01",
		name = "pes_wizard_trail_conversation_one_d_01",
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
				"pdr_wizard_trail_conversation_one_c_01"
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
		name = "pes_wizard_trail_conversation_six_c_01",
		response = "pes_wizard_trail_conversation_six_c_01",
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
				"pbw_wizard_trail_conversation_six_b_01"
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
		name = "pes_wizard_trail_conversation_six_e_01",
		response = "pes_wizard_trail_conversation_six_e_01",
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
				"pbw_wizard_trail_conversation_six_d_01"
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
		name = "pes_wizard_trail_conversation_ten_a_01",
		response = "pes_wizard_trail_conversation_ten_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_trail"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				50
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"wizard_trail_illusion_fades_a",
				OP.NOT,
				"wizard_trail_illusion_fades_a"
			},
			{
				"faction_memory",
				"wizard_trail_conversation",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_conversation",
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
		name = "pes_wizard_trail_conversation_ten_c_01",
		response = "pes_wizard_trail_conversation_ten_c_01",
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
				"pdr_wizard_trail_conversation_ten_b_01"
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
		response = "pes_wizard_trail_conversation_three_c_01",
		name = "pes_wizard_trail_conversation_three_c_01",
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
				"pwh_wizard_trail_conversation_three_b_01"
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
		response = "pes_wizard_trail_conversation_two_c_01",
		name = "pes_wizard_trail_conversation_two_c_01",
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
				"pwe_wizard_trail_conversation_two_b_01"
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
		name = "pwe_trail_npc_conversations_dummy_trigger",
		response = "pwe_trail_npc_conversations_dummy_trigger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_trail"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				22
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				50
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
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
				"current_level",
				OP.EQ,
				"dlc_wizards_trail"
			},
			{
				"faction_memory",
				"wizard_trail_illusion_fades_a",
				OP.NOT,
				"wizard_trail_illusion_fades_a"
			},
			{
				"faction_memory",
				"wizard_trail_conversation",
				OP.EQ,
				0
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
				"wizard_trail_conversation",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_wizard_trail_conversation_five_c_01",
		name = "pwe_wizard_trail_conversation_five_c_01",
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
				"pbw_wizard_trail_conversation_five_b_01"
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
		response = "pwe_wizard_trail_conversation_four_b_01",
		name = "pwe_wizard_trail_conversation_four_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_conversation_four_done"
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
		name = "pwe_wizard_trail_conversation_nine_a_01",
		response = "pwe_wizard_trail_conversation_nine_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_trail"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				50
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"wizard_trail_illusion_fades_a",
				OP.NOT,
				"wizard_trail_illusion_fades_a"
			},
			{
				"faction_memory",
				"wizard_trail_conversation",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_conversation",
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
		name = "pwe_wizard_trail_conversation_seven_c_01",
		response = "pwe_wizard_trail_conversation_seven_c_01",
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
				"pwh_wizard_trail_conversation_seven_b_01"
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
		name = "pwe_wizard_trail_conversation_ten_d_01",
		response = "pwe_wizard_trail_conversation_ten_d_01",
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
				"pes_wizard_trail_conversation_ten_c_01"
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
		response = "pwe_wizard_trail_conversation_two_b_01",
		name = "pwe_wizard_trail_conversation_two_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_conversation_two_done"
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
		name = "pwh_wizard_trail_conversation_eight_c_01",
		response = "pwh_wizard_trail_conversation_eight_c_01",
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
				"pes_wizard_trail_conversation_eight_b_01"
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
		name = "pwh_wizard_trail_conversation_nine_b_01",
		response = "pwh_wizard_trail_conversation_nine_b_01",
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
				"pwe_wizard_trail_conversation_nine_a_01"
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
		name = "pwh_wizard_trail_conversation_nine_d_01",
		response = "pwh_wizard_trail_conversation_nine_d_01",
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
				"pdr_wizard_trail_conversation_nine_c_01"
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
		name = "pwh_wizard_trail_conversation_seven_b_01",
		response = "pwh_wizard_trail_conversation_seven_b_01",
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
				"pbw_wizard_trail_conversation_seven_a_01"
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
		name = "pwh_wizard_trail_conversation_seven_d_01",
		response = "pwh_wizard_trail_conversation_seven_d_01",
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
				"pwe_wizard_trail_conversation_seven_c_01"
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
		name = "pwh_wizard_trail_conversation_six_a_01",
		response = "pwh_wizard_trail_conversation_six_a_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_conversation_trail"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				50
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
				"empire_soldier",
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
				"wizard_trail_illusion_fades_a",
				OP.NOT,
				"wizard_trail_illusion_fades_a"
			},
			{
				"faction_memory",
				"wizard_trail_conversation",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_conversation",
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
		response = "pwh_wizard_trail_conversation_three_b_01",
		name = "pwh_wizard_trail_conversation_three_b_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_conversation_three_done"
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
		response = "pwh_wizard_trail_conversation_three_d_01",
		name = "pwh_wizard_trail_conversation_three_d_01",
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
				"pes_wizard_trail_conversation_three_c_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	add_dialogues({
		nik_wizard_trail_conversation_five_a_01 = {
			override_awareness = "nik_wizard_trail_conversation_five_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_wizard_trail_conversation_five_a_01"
			},
			sound_events = {
				[1.0] = "nik_wizard_trail_conversation_five_a_01"
			},
			sound_events_duration = {
				[1.0] = 4.6995210647583
			}
		},
		nik_wizard_trail_conversation_four_a_01 = {
			override_awareness = "nik_wizard_trail_conversation_four_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_wizard_trail_conversation_four_a_01"
			},
			sound_events = {
				[1.0] = "nik_wizard_trail_conversation_four_a_01"
			},
			sound_events_duration = {
				[1.0] = 4.9236664772034
			}
		},
		nik_wizard_trail_conversation_one_a_01 = {
			override_awareness = "nik_wizard_trail_conversation_one_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_wizard_trail_conversation_one_a_01"
			},
			sound_events = {
				[1.0] = "nik_wizard_trail_conversation_one_a_01"
			},
			sound_events_duration = {
				[1.0] = 6.4488959312439
			}
		},
		nik_wizard_trail_conversation_three_a_01 = {
			override_awareness = "nik_wizard_trail_conversation_three_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_wizard_trail_conversation_three_a_01"
			},
			sound_events = {
				[1.0] = "nik_wizard_trail_conversation_three_a_01"
			},
			sound_events_duration = {
				[1.0] = 4.2631874084473
			}
		},
		nik_wizard_trail_conversation_two_a_01 = {
			override_awareness = "nik_wizard_trail_conversation_two_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_wizard_trail_conversation_two_a_01"
			},
			sound_events = {
				[1.0] = "nik_wizard_trail_conversation_two_a_01"
			},
			sound_events_duration = {
				[1.0] = 6.681125164032
			}
		},
		pbw_wizard_trail_conversation_five_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk_must_reply",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_wizard_trail_conversation_five_b_01"
			},
			sound_events = {
				[1.0] = "pbw_wizard_trail_conversation_five_b_01"
			},
			sound_events_duration = {
				[1.0] = 5.3869791030884
			}
		},
		pbw_wizard_trail_conversation_one_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk_must_reply",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_wizard_trail_conversation_one_b_01"
			},
			sound_events = {
				[1.0] = "pbw_wizard_trail_conversation_one_b_01"
			},
			sound_events_duration = {
				[1.0] = 3.7789790630341
			}
		},
		pbw_wizard_trail_conversation_seven_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_wizard_trail_conversation_seven_a_01"
			},
			sound_events = {
				[1.0] = "pbw_wizard_trail_conversation_seven_a_01"
			},
			sound_events_duration = {
				[1.0] = 3.1559998989105
			}
		},
		pbw_wizard_trail_conversation_six_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wizard_trail_conversation_six_b_01"
			},
			sound_events = {
				[1.0] = "pbw_wizard_trail_conversation_six_b_01"
			},
			sound_events_duration = {
				[1.0] = 4.7600002288818
			}
		},
		pbw_wizard_trail_conversation_six_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wizard_trail_conversation_six_d_01"
			},
			sound_events = {
				[1.0] = "pbw_wizard_trail_conversation_six_d_01"
			},
			sound_events_duration = {
				[1.0] = 0.75599998235703
			}
		},
		pdr_trail_npc_conversations_dummy_trigger = {
			override_awareness = "story_conversations_trail",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "dummy"
			},
			sound_events = {
				[1.0] = "dummy"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			}
		},
		pdr_wizard_trail_conversation_eight_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_wizard_trail_conversation_eight_a_01"
			},
			sound_events = {
				[1.0] = "pdr_wizard_trail_conversation_eight_a_01"
			},
			sound_events_duration = {
				[1.0] = 4.1189789772034
			}
		},
		pdr_wizard_trail_conversation_four_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_wizard_trail_conversation_four_c_01"
			},
			sound_events = {
				[1.0] = "pdr_wizard_trail_conversation_four_c_01"
			},
			sound_events_duration = {
				[1.0] = 4.4549789428711
			}
		},
		pdr_wizard_trail_conversation_four_e_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_wizard_trail_conversation_four_e_01"
			},
			sound_events = {
				[1.0] = "pdr_wizard_trail_conversation_four_e_01"
			},
			sound_events_duration = {
				[1.0] = 1.8890000581741
			}
		},
		pdr_wizard_trail_conversation_nine_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wizard_trail_conversation_nine_c_01"
			},
			sound_events = {
				[1.0] = "pdr_wizard_trail_conversation_nine_c_01"
			},
			sound_events_duration = {
				[1.0] = 1.7969791889191
			}
		},
		pdr_wizard_trail_conversation_one_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_wizard_trail_conversation_one_c_01"
			},
			sound_events = {
				[1.0] = "pdr_wizard_trail_conversation_one_c_01"
			},
			sound_events_duration = {
				[1.0] = 5.7469792366028
			}
		},
		pdr_wizard_trail_conversation_ten_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wizard_trail_conversation_ten_b_01"
			},
			sound_events = {
				[1.0] = "pdr_wizard_trail_conversation_ten_b_01"
			},
			sound_events_duration = {
				[1.0] = 2.3089792728424
			}
		},
		pes_wizard_trail_conversation_eight_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_conversation_eight_b_01"
			},
			sound_events = {
				[1.0] = "pes_wizard_trail_conversation_eight_b_01"
			},
			sound_events_duration = {
				[1.0] = 3.9570000171661
			}
		},
		pes_wizard_trail_conversation_eight_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_conversation_eight_d_01"
			},
			sound_events = {
				[1.0] = "pes_wizard_trail_conversation_eight_d_01"
			},
			sound_events_duration = {
				[1.0] = 2.9409999847412
			}
		},
		pes_wizard_trail_conversation_four_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_conversation_four_d_01"
			},
			sound_events = {
				[1.0] = "pes_wizard_trail_conversation_four_d_01"
			},
			sound_events_duration = {
				[1.0] = 2.8469791412353
			}
		},
		pes_wizard_trail_conversation_one_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_conversation_one_d_01"
			},
			sound_events = {
				[1.0] = "pes_wizard_trail_conversation_one_d_01"
			},
			sound_events_duration = {
				[1.0] = 2.5050001144409
			}
		},
		pes_wizard_trail_conversation_six_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_conversation_six_c_01"
			},
			sound_events = {
				[1.0] = "pes_wizard_trail_conversation_six_c_01"
			},
			sound_events_duration = {
				[1.0] = 1.7529791593552
			}
		},
		pes_wizard_trail_conversation_six_e_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_conversation_six_e_01"
			},
			sound_events = {
				[1.0] = "pes_wizard_trail_conversation_six_e_01"
			},
			sound_events_duration = {
				[1.0] = 5.2969999313355
			}
		},
		pes_wizard_trail_conversation_ten_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_conversation_ten_a_01"
			},
			sound_events = {
				[1.0] = "pes_wizard_trail_conversation_ten_a_01"
			},
			sound_events_duration = {
				[1.0] = 3.7409791946411
			}
		},
		pes_wizard_trail_conversation_ten_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_conversation_ten_c_01"
			},
			sound_events = {
				[1.0] = "pes_wizard_trail_conversation_ten_c_01"
			},
			sound_events_duration = {
				[1.0] = 4.495979309082
			}
		},
		pes_wizard_trail_conversation_three_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_conversation_three_c_01"
			},
			sound_events = {
				[1.0] = "pes_wizard_trail_conversation_three_c_01"
			},
			sound_events_duration = {
				[1.0] = 3.1939792633057
			}
		},
		pes_wizard_trail_conversation_two_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_conversation_two_c_01"
			},
			sound_events = {
				[1.0] = "pes_wizard_trail_conversation_two_c_01"
			},
			sound_events_duration = {
				[1.0] = 3.4159998893738
			}
		},
		pwe_trail_npc_conversations_dummy_trigger = {
			override_awareness = "story_conversations_trail",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "dummy"
			},
			sound_events = {
				[1.0] = "dummy"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			}
		},
		pwe_wizard_trail_conversation_five_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_wizard_trail_conversation_five_c_01"
			},
			sound_events = {
				[1.0] = "pwe_wizard_trail_conversation_five_c_01"
			},
			sound_events_duration = {
				[1.0] = 2.683000087738
			}
		},
		pwe_wizard_trail_conversation_four_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk_must_reply",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_wizard_trail_conversation_four_b_01"
			},
			sound_events = {
				[1.0] = "pwe_wizard_trail_conversation_four_b_01"
			},
			sound_events_duration = {
				[1.0] = 4.0109791755676
			}
		},
		pwe_wizard_trail_conversation_nine_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_wizard_trail_conversation_nine_a_01"
			},
			sound_events = {
				[1.0] = "pwe_wizard_trail_conversation_nine_a_01"
			},
			sound_events_duration = {
				[1.0] = 2.6870000362396
			}
		},
		pwe_wizard_trail_conversation_seven_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wizard_trail_conversation_seven_c_01"
			},
			sound_events = {
				[1.0] = "pwe_wizard_trail_conversation_seven_c_01"
			},
			sound_events_duration = {
				[1.0] = 1.8549791574478
			}
		},
		pwe_wizard_trail_conversation_ten_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wizard_trail_conversation_ten_d_01"
			},
			sound_events = {
				[1.0] = "pwe_wizard_trail_conversation_ten_d_01"
			},
			sound_events_duration = {
				[1.0] = 4.3239998817444
			}
		},
		pwe_wizard_trail_conversation_two_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk_must_reply",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_wizard_trail_conversation_two_b_01"
			},
			sound_events = {
				[1.0] = "pwe_wizard_trail_conversation_two_b_01"
			},
			sound_events_duration = {
				[1.0] = 2.2170000076294
			}
		},
		pwh_wizard_trail_conversation_eight_c_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_trail_conversation_eight_c_01"
			},
			sound_events = {
				[1.0] = "pwh_wizard_trail_conversation_eight_c_01"
			},
			sound_events_duration = {
				[1.0] = 6.1559791564941
			}
		},
		pwh_wizard_trail_conversation_nine_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_trail_conversation_nine_b_01"
			},
			sound_events = {
				[1.0] = "pwh_wizard_trail_conversation_nine_b_01"
			},
			sound_events_duration = {
				[1.0] = 5.8589792251587
			}
		},
		pwh_wizard_trail_conversation_nine_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_trail_conversation_nine_d_01"
			},
			sound_events = {
				[1.0] = "pwh_wizard_trail_conversation_nine_d_01"
			},
			sound_events_duration = {
				[1.0] = 0.77300000190735
			}
		},
		pwh_wizard_trail_conversation_seven_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_trail_conversation_seven_b_01"
			},
			sound_events = {
				[1.0] = "pwh_wizard_trail_conversation_seven_b_01"
			},
			sound_events_duration = {
				[1.0] = 7.7739791870117
			}
		},
		pwh_wizard_trail_conversation_seven_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_trail_conversation_seven_d_01"
			},
			sound_events = {
				[1.0] = "pwh_wizard_trail_conversation_seven_d_01"
			},
			sound_events_duration = {
				[1.0] = 4.8759999275208
			}
		},
		pwh_wizard_trail_conversation_six_a_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_trail_conversation_six_a_01"
			},
			sound_events = {
				[1.0] = "pwh_wizard_trail_conversation_six_a_01"
			},
			sound_events_duration = {
				[1.0] = 2.6459791660309
			}
		},
		pwh_wizard_trail_conversation_three_b_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk_must_reply",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_trail_conversation_three_b_01"
			},
			sound_events = {
				[1.0] = "pwh_wizard_trail_conversation_three_b_01"
			},
			sound_events_duration = {
				[1.0] = 4.4799790382385
			}
		},
		pwh_wizard_trail_conversation_three_d_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_wizards_trail",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_wizard_trail_conversation_three_d_01"
			},
			sound_events = {
				[1.0] = "pwh_wizard_trail_conversation_three_d_01"
			},
			sound_events_duration = {
				[1.0] = 7.3689789772034
			}
		}
	})
end
