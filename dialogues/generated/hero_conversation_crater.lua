return function ()
	define_rule({
		name = "pbw_crater_conversation_eight_01",
		response = "pbw_crater_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				15
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
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_dummy",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.NOT,
				"crater_plan_banter_a"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pbw_crater_conversation_eight_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_crater_conversation_eight_01",
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
		name = "pbw_crater_conversation_five_01",
		response = "pbw_crater_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				15
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
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_dummy",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.NOT,
				"crater_plan_banter_a"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pbw_crater_conversation_five_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_crater_conversation_five_01",
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
		name = "pbw_crater_conversation_five_02",
		response = "pbw_crater_conversation_five_02",
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
				"pwe_crater_conversation_five_01"
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
		name = "pbw_crater_conversation_nine_01",
		response = "pbw_crater_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				15
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
				"dwarf_ranger",
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
				"crater_dummy",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.NOT,
				"crater_plan_banter_a"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pbw_crater_conversation_nine_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_crater_conversation_nine_01",
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
		name = "pbw_crater_conversation_nine_02",
		response = "pbw_crater_conversation_nine_02",
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
				"pdr_crater_conversation_nine_01"
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
		name = "pbw_crater_conversation_two_01",
		response = "pbw_crater_conversation_two_01",
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
				"pwh_crater_conversation_two_01"
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
		name = "pbw_crater_conversation_two_02",
		response = "pbw_crater_conversation_two_02",
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
				"pwh_crater_conversation_two_02"
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
		name = "pdr_crater_conversation_four_01",
		response = "pdr_crater_conversation_four_01",
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
				"pes_crater_conversation_four_01"
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
		name = "pdr_crater_conversation_nine_01",
		response = "pdr_crater_conversation_nine_01",
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
				"pwh_crater_conversation_nine_01"
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
		name = "pdr_crater_conversation_nine_02",
		response = "pdr_crater_conversation_nine_02",
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
				"pbw_crater_conversation_nine_02"
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
		name = "pdr_crater_conversation_seven_01",
		response = "pdr_crater_conversation_seven_01",
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
				"pwe_crater_conversation_seven_01"
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
		name = "pdr_crater_conversation_seven_02",
		response = "pdr_crater_conversation_seven_02",
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
				"pwe_crater_conversation_seven_02"
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
		name = "pdr_crater_conversation_six_01",
		response = "pdr_crater_conversation_six_01",
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
				"pwh_crater_conversation_six_01"
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
		name = "pes_crater_conversation_eight_02",
		response = "pes_crater_conversation_eight_02",
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
				"pbw_crater_conversation_eight_01"
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
		name = "pes_crater_conversation_four_01",
		response = "pes_crater_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				15
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
				"crater_dummy",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.NOT,
				"crater_plan_banter_a"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pes_crater_conversation_four_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_crater_conversation_four_01",
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
		name = "pes_crater_conversation_four_02",
		response = "pes_crater_conversation_four_02",
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
				"pwe_crater_conversation_four_01"
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
		name = "pes_crater_conversation_one_01",
		response = "pes_crater_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				15
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
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_dummy",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.NOT,
				"crater_plan_banter_a"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pes_crater_conversation_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_crater_conversation_one_01",
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
		name = "pes_crater_conversation_one_02",
		response = "pes_crater_conversation_one_02",
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
				"pwe_crater_conversation_one_01"
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
		name = "pes_crater_conversation_one_03",
		response = "pes_crater_conversation_one_03",
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
				"pwe_crater_conversation_one_02"
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
		name = "pes_crater_conversation_ten_01",
		response = "pes_crater_conversation_ten_01",
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
				"pwh_crater_conversation_ten_01"
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
		name = "pes_crater_conversation_ten_02",
		response = "pes_crater_conversation_ten_02",
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
				"pwh_crater_conversation_ten_02"
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
		name = "pwe_crater_conversation_five_01",
		response = "pwe_crater_conversation_five_01",
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
				"pbw_crater_conversation_five_01"
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
		name = "pwe_crater_conversation_five_02",
		response = "pwe_crater_conversation_five_02",
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
				"pbw_crater_conversation_five_02"
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
		name = "pwe_crater_conversation_four_01",
		response = "pwe_crater_conversation_four_01",
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
				"pdr_crater_conversation_four_01"
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
		name = "pwe_crater_conversation_one_01",
		response = "pwe_crater_conversation_one_01",
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
				"pes_crater_conversation_one_01"
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
		name = "pwe_crater_conversation_one_02",
		response = "pwe_crater_conversation_one_02",
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
				"pes_crater_conversation_one_02"
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
		name = "pwe_crater_conversation_seven_01",
		response = "pwe_crater_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				15
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
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_dummy",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.NOT,
				"crater_plan_banter_a"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pwe_crater_conversation_seven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_crater_conversation_seven_01",
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
		name = "pwe_crater_conversation_seven_02",
		response = "pwe_crater_conversation_seven_02",
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
				"pdr_crater_conversation_seven_01"
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
		name = "pwe_crater_conversation_three_01",
		response = "pwe_crater_conversation_three_01",
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
				"pwh_crater_conversation_three_01"
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
		name = "pwe_crater_conversation_three_02",
		response = "pwe_crater_conversation_three_02",
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
				"pwh_crater_conversation_three_02"
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
		name = "pwh_crater_conversation_nine_01",
		response = "pwh_crater_conversation_nine_01",
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
				"pbw_crater_conversation_nine_01"
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
		name = "pwh_crater_conversation_six_01",
		response = "pwh_crater_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				15
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
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_dummy",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.NOT,
				"crater_plan_banter_a"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pwh_crater_conversation_six_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_crater_conversation_six_01",
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
		name = "pwh_crater_conversation_six_02",
		response = "pwh_crater_conversation_six_02",
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
				"pdr_crater_conversation_six_01"
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
		name = "pwh_crater_conversation_ten_01",
		response = "pwh_crater_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				15
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
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_dummy",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.NOT,
				"crater_plan_banter_a"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pwh_crater_conversation_ten_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_crater_conversation_ten_01",
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
		name = "pwh_crater_conversation_ten_02",
		response = "pwh_crater_conversation_ten_02",
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
				"pes_crater_conversation_ten_01"
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
		name = "pwh_crater_conversation_three_01",
		response = "pwh_crater_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				15
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
				"faction_memory",
				"crater_dummy",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.NOT,
				"crater_plan_banter_a"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pwh_crater_conversation_three_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_crater_conversation_three_01",
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
		name = "pwh_crater_conversation_three_02",
		response = "pwh_crater_conversation_three_02",
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
				"pwe_crater_conversation_three_01"
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
		name = "pwh_crater_conversation_two_01",
		response = "pwh_crater_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				15
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
				"faction_memory",
				"crater_dummy",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"crater_plan_banter_a",
				OP.NOT,
				"crater_plan_banter_a"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"pwh_crater_conversation_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_crater_conversation_two_01",
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
		name = "pwh_crater_conversation_two_02",
		response = "pwh_crater_conversation_two_02",
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
				"pbw_crater_conversation_two_01"
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
		pbw_crater_conversation_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_crater_conversation_eight_01"
			},
			sound_events = {
				[1.0] = "pbw_crater_conversation_eight_01"
			},
			sound_events_duration = {
				[1.0] = 6.6674165725708
			}
		},
		pbw_crater_conversation_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_crater_conversation_five_01"
			},
			sound_events = {
				[1.0] = "pbw_crater_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 2.806104183197
			}
		},
		pbw_crater_conversation_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_crater_conversation_five_02"
			},
			sound_events = {
				[1.0] = "pbw_crater_conversation_five_02"
			},
			sound_events_duration = {
				[1.0] = 3.3930208683014
			}
		},
		pbw_crater_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_crater_conversation_nine_01"
			},
			sound_events = {
				[1.0] = "pbw_crater_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 7.653395652771
			}
		},
		pbw_crater_conversation_nine_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_crater_conversation_nine_02"
			},
			sound_events = {
				[1.0] = "pbw_crater_conversation_nine_02"
			},
			sound_events_duration = {
				[1.0] = 5.8262500762939
			}
		},
		pbw_crater_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_crater_conversation_two_01"
			},
			sound_events = {
				[1.0] = "pbw_crater_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 4.0991249084473
			}
		},
		pbw_crater_conversation_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_crater_conversation_two_02"
			},
			sound_events = {
				[1.0] = "pbw_crater_conversation_two_02"
			},
			sound_events_duration = {
				[1.0] = 5.648895740509
			}
		},
		pdr_crater_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_crater_conversation_four_01"
			},
			sound_events = {
				[1.0] = "pdr_crater_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 9.2842502593994
			}
		},
		pdr_crater_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_crater_conversation_nine_01"
			},
			sound_events = {
				[1.0] = "pdr_crater_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 1.642416715622
			}
		},
		pdr_crater_conversation_nine_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_crater_conversation_nine_02"
			},
			sound_events = {
				[1.0] = "pdr_crater_conversation_nine_02"
			},
			sound_events_duration = {
				[1.0] = 1.1065833568573
			}
		},
		pdr_crater_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_crater_conversation_seven_01"
			},
			sound_events = {
				[1.0] = "pdr_crater_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 5.3349165916443
			}
		},
		pdr_crater_conversation_seven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_crater_conversation_seven_02"
			},
			sound_events = {
				[1.0] = "pdr_crater_conversation_seven_02"
			},
			sound_events_duration = {
				[1.0] = 5.1369166374206
			}
		},
		pdr_crater_conversation_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_crater_conversation_six_01"
			},
			sound_events = {
				[1.0] = "pdr_crater_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 6.2901043891907
			}
		},
		pes_crater_conversation_eight_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_conversation_eight_02"
			},
			sound_events = {
				[1.0] = "pes_crater_conversation_eight_02"
			},
			sound_events_duration = {
				[1.0] = 14.932708740234
			}
		},
		pes_crater_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_crater_conversation_four_01"
			},
			sound_events = {
				[1.0] = "pes_crater_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 2.4878542423248
			}
		},
		pes_crater_conversation_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_conversation_four_02"
			},
			sound_events = {
				[1.0] = "pes_crater_conversation_four_02"
			},
			sound_events_duration = {
				[1.0] = 4.9756875038147
			}
		},
		pes_crater_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_crater_conversation_one_01"
			},
			sound_events = {
				[1.0] = "pes_crater_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 2.5605416297913
			}
		},
		pes_crater_conversation_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_conversation_one_02"
			},
			sound_events = {
				[1.0] = "pes_crater_conversation_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.9530625343323
			}
		},
		pes_crater_conversation_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_conversation_one_03"
			},
			sound_events = {
				[1.0] = "pes_crater_conversation_one_03"
			},
			sound_events_duration = {
				[1.0] = 1.0258333683014
			}
		},
		pes_crater_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_conversation_ten_01"
			},
			sound_events = {
				[1.0] = "pes_crater_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 2.0626459121704
			}
		},
		pes_crater_conversation_ten_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_conversation_ten_02"
			},
			sound_events = {
				[1.0] = "pes_crater_conversation_ten_02"
			},
			sound_events_duration = {
				[1.0] = 3.1555936336517
			}
		},
		pwe_crater_conversation_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_conversation_five_01"
			},
			sound_events = {
				[1.0] = "pwe_crater_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 8.7399997711182
			}
		},
		pwe_crater_conversation_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_conversation_five_02"
			},
			sound_events = {
				[1.0] = "pwe_crater_conversation_five_02"
			},
			sound_events_duration = {
				[1.0] = 5.8620209693909
			}
		},
		pwe_crater_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_conversation_four_01"
			},
			sound_events = {
				[1.0] = "pwe_crater_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 6.2974791526794
			}
		},
		pwe_crater_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_conversation_one_01"
			},
			sound_events = {
				[1.0] = "pwe_crater_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 4.5388751029968
			}
		},
		pwe_crater_conversation_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_conversation_one_02"
			},
			sound_events = {
				[1.0] = "pwe_crater_conversation_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.3679375648499
			}
		},
		pwe_crater_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_crater_conversation_seven_01"
			},
			sound_events = {
				[1.0] = "pwe_crater_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 6.5570831298828
			}
		},
		pwe_crater_conversation_seven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_conversation_seven_02"
			},
			sound_events = {
				[1.0] = "pwe_crater_conversation_seven_02"
			},
			sound_events_duration = {
				[1.0] = 12.084145545959
			}
		},
		pwe_crater_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_conversation_three_01"
			},
			sound_events = {
				[1.0] = "pwe_crater_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 3.7014582157135
			}
		},
		pwe_crater_conversation_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_crater_conversation_three_02"
			},
			sound_events = {
				[1.0] = "pwe_crater_conversation_three_02"
			},
			sound_events_duration = {
				[1.0] = 5.2758331298828
			}
		},
		pwh_crater_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_crater_conversation_nine_01"
			},
			sound_events = {
				[1.0] = "pwh_crater_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 6.6173334121704
			}
		},
		pwh_crater_conversation_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crater_conversation_six_01"
			},
			sound_events = {
				[1.0] = "pwh_crater_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 11.765062332153
			}
		},
		pwh_crater_conversation_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_crater_conversation_six_02"
			},
			sound_events = {
				[1.0] = "pwh_crater_conversation_six_02"
			},
			sound_events_duration = {
				[1.0] = 10.934791564941
			}
		},
		pwh_crater_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crater_conversation_ten_01"
			},
			sound_events = {
				[1.0] = "pwh_crater_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 5.8783750534058
			}
		},
		pwh_crater_conversation_ten_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_crater_conversation_ten_02"
			},
			sound_events = {
				[1.0] = "pwh_crater_conversation_ten_02"
			},
			sound_events_duration = {
				[1.0] = 3.8666875362396
			}
		},
		pwh_crater_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crater_conversation_three_01"
			},
			sound_events = {
				[1.0] = "pwh_crater_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 3.7144167423248
			}
		},
		pwh_crater_conversation_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_crater_conversation_three_02"
			},
			sound_events = {
				[1.0] = "pwh_crater_conversation_three_02"
			},
			sound_events_duration = {
				[1.0] = 2.9652917385101
			}
		},
		pwh_crater_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crater_conversation_two_01"
			},
			sound_events = {
				[1.0] = "pwh_crater_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 5.2149791717529
			}
		},
		pwh_crater_conversation_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversation_crater",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_crater_conversation_two_02"
			},
			sound_events = {
				[1.0] = "pwh_crater_conversation_two_02"
			},
			sound_events_duration = {
				[1.0] = 7.9120001792908
			}
		}
	})
end
