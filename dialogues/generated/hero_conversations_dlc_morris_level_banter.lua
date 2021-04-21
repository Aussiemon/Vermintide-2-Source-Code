return function ()
	define_rule({
		name = "pbw_morris_level_conversations_one_01",
		response = "pbw_morris_level_conversations_one_01",
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
				"pbw_morris_level_conversations_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_one_01",
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
		name = "pwh_morris_level_conversations_one_01",
		response = "pwh_morris_level_conversations_one_01",
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
				"pbw_morris_level_conversations_one_01"
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
		name = "pbw_morris_level_conversations_one_02",
		response = "pbw_morris_level_conversations_one_02",
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
				"pwh_morris_level_conversations_one_01"
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
		name = "pwh_morris_level_conversations_one_02",
		response = "pwh_morris_level_conversations_one_02",
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
				"pbw_morris_level_conversations_one_02"
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
		name = "pes_morris_level_conversations_two_01",
		response = "pes_morris_level_conversations_two_01",
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
				"pes_morris_level_conversations_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_two_01",
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
		name = "pwh_morris_level_conversations_two_01",
		response = "pwh_morris_level_conversations_two_01",
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
				"pes_morris_level_conversations_two_01"
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
		name = "pes_morris_level_conversations_two_02",
		response = "pes_morris_level_conversations_two_02",
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
				"pwh_morris_level_conversations_two_01"
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
		name = "pdr_morris_level_conversations_three_01",
		response = "pdr_morris_level_conversations_three_01",
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
				"pdr_morris_level_conversations_three_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_level_conversations_three_01",
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
		name = "pwe_morris_level_conversations_three_01",
		response = "pwe_morris_level_conversations_three_01",
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
				"pdr_morris_level_conversations_three_01"
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
		name = "pdr_morris_level_conversations_three_02",
		response = "pdr_morris_level_conversations_three_02",
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
				"pwe_morris_level_conversations_three_01"
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
		name = "pwe_morris_level_conversations_three_02",
		response = "pwe_morris_level_conversations_three_02",
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
				"pdr_morris_level_conversations_three_02"
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
		name = "pbw_morris_level_conversations_four_01",
		response = "pbw_morris_level_conversations_four_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_four_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_four_01",
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
		name = "pdr_morris_level_conversations_four_01",
		response = "pdr_morris_level_conversations_four_01",
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
				"pbw_morris_level_conversations_four_01"
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
		name = "pbw_morris_level_conversations_four_02",
		response = "pbw_morris_level_conversations_four_02",
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
				"pdr_morris_level_conversations_four_01"
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
		name = "pdr_morris_level_conversations_four_02",
		response = "pdr_morris_level_conversations_four_02",
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
				"pbw_morris_level_conversations_four_02"
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
		name = "pes_morris_level_conversations_five_01",
		response = "pes_morris_level_conversations_five_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_five_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_five_01",
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
		name = "pdr_morris_level_conversations_five_01",
		response = "pdr_morris_level_conversations_five_01",
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
				"pes_morris_level_conversations_five_01"
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
		name = "pes_morris_level_conversations_five_02",
		response = "pes_morris_level_conversations_five_02",
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
				"pdr_morris_level_conversations_five_01"
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
		name = "pdr_morris_level_conversations_five_02",
		response = "pdr_morris_level_conversations_five_02",
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
				"pes_morris_level_conversations_five_02"
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
		name = "pes_morris_level_conversations_seven_01",
		response = "pes_morris_level_conversations_seven_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_seven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_seven_01",
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
		name = "pdr_morris_level_conversations_seven_01",
		response = "pdr_morris_level_conversations_seven_01",
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
				"pes_morris_level_conversations_seven_01"
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
		name = "pwh_morris_level_conversations_seven_01",
		response = "pwh_morris_level_conversations_seven_01",
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
				"pdr_morris_level_conversations_seven_01"
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
		name = "pdr_morris_level_conversations_seven_02",
		response = "pdr_morris_level_conversations_seven_02",
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
				"pwh_morris_level_conversations_seven_01"
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
		name = "pbw_morris_level_conversations_eight_01",
		response = "pbw_morris_level_conversations_eight_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_eight_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_eight_01",
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
		name = "pwe_morris_level_conversations_eight_01",
		response = "pwe_morris_level_conversations_eight_01",
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
				"pbw_morris_level_conversations_eight_01"
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
		name = "pbw_morris_level_conversations_eight_02",
		response = "pbw_morris_level_conversations_eight_02",
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
				"pwe_morris_level_conversations_eight_01"
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
		name = "pwe_morris_level_conversations_eight_02",
		response = "pwe_morris_level_conversations_eight_02",
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
				"pbw_morris_level_conversations_eight_02"
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
		name = "pbw_morris_level_conversations_nine_01",
		response = "pbw_morris_level_conversations_nine_01",
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
				"pbw_morris_level_conversations_nine_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_nine_01",
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
		name = "pwh_morris_level_conversations_nine_01",
		response = "pwh_morris_level_conversations_nine_01",
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
				"pbw_morris_level_conversations_nine_01"
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
		name = "pbw_morris_level_conversations_nine_02",
		response = "pbw_morris_level_conversations_nine_02",
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
				"pwh_morris_level_conversations_nine_01"
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
		name = "pwh_morris_level_conversations_nine_02",
		response = "pwh_morris_level_conversations_nine_02",
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
				"pbw_morris_level_conversations_nine_02"
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
		name = "pbw_morris_level_conversations_six_01",
		response = "pbw_morris_level_conversations_six_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_six_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_six_01",
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
		name = "pwe_morris_level_conversations_six_01",
		response = "pwe_morris_level_conversations_six_01",
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
				"pbw_morris_level_conversations_six_01"
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
		name = "pbw_morris_level_conversations_six_02",
		response = "pbw_morris_level_conversations_six_02",
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
				"pwe_morris_level_conversations_six_01"
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
		name = "pwe_morris_level_conversations_six_02",
		response = "pwe_morris_level_conversations_six_02",
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
				"pbw_morris_level_conversations_six_02"
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
		name = "pes_morris_level_conversations_fourteen_01",
		response = "pes_morris_level_conversations_fourteen_01",
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
				"pes_morris_level_conversations_fourteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_fourteen_01",
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
		name = "pwh_morris_level_conversations_fourteen_01",
		response = "pwh_morris_level_conversations_fourteen_01",
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
				"pes_morris_level_conversations_fourteen_01"
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
		name = "pes_morris_level_conversations_fourteen_02",
		response = "pes_morris_level_conversations_fourteen_02",
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
				"pwh_morris_level_conversations_fourteen_01"
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
		name = "pwh_morris_level_conversations_fourteen_02",
		response = "pwh_morris_level_conversations_fourteen_02",
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
				"pes_morris_level_conversations_fourteen_02"
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
		name = "pwe_morris_level_conversations_fifteen_01",
		response = "pwe_morris_level_conversations_fifteen_01",
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
				"pwe_morris_level_conversations_fifteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_level_conversations_fifteen_01",
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
		name = "pdr_morris_level_conversations_fifteen_01",
		response = "pdr_morris_level_conversations_fifteen_01",
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
				"pwe_morris_level_conversations_fifteen_01"
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
		name = "pes_morris_level_conversations_fifteen_01",
		response = "pes_morris_level_conversations_fifteen_01",
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
				"pdr_morris_level_conversations_fifteen_01"
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
		name = "pdr_morris_level_conversations_fifteen_02",
		response = "pdr_morris_level_conversations_fifteen_02",
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
				"pes_morris_level_conversations_fifteen_01"
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
		name = "pbw_morris_level_conversations_sixteen_01",
		response = "pbw_morris_level_conversations_sixteen_01",
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
				"pbw_morris_level_conversations_sixteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_sixteen_01",
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
		name = "pwh_morris_level_conversations_sixteen_01",
		response = "pwh_morris_level_conversations_sixteen_01",
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
				"pbw_morris_level_conversations_sixteen_01"
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
		name = "pbw_morris_level_conversations_sixteen_02",
		response = "pbw_morris_level_conversations_sixteen_02",
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
				"pwh_morris_level_conversations_sixteen_01"
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
		name = "pdr_morris_level_conversations_seventeen_01",
		response = "pdr_morris_level_conversations_seventeen_01",
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
				"bright_wizard",
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
				"pdr_morris_level_conversations_seventeen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_level_conversations_seventeen_01",
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
		name = "pbw_morris_level_conversations_seventeen_01",
		response = "pbw_morris_level_conversations_seventeen_01",
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
				"pdr_morris_level_conversations_seventeen_01"
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
		name = "pdr_morris_level_conversations_seventeen_02",
		response = "pdr_morris_level_conversations_seventeen_02",
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
				"pbw_morris_level_conversations_seventeen_01"
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
		name = "pes_morris_level_conversations_eighteen_01",
		response = "pes_morris_level_conversations_eighteen_01",
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
				"pes_morris_level_conversations_eighteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_eighteen_01",
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
		name = "pwh_morris_level_conversations_eighteen_01",
		response = "pwh_morris_level_conversations_eighteen_01",
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
				"pes_morris_level_conversations_eighteen_01"
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
		name = "pes_morris_level_conversations_eighteen_02",
		response = "pes_morris_level_conversations_eighteen_02",
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
				"pwh_morris_level_conversations_eighteen_01"
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
		name = "pwh_morris_level_conversations_eighteen_02",
		response = "pwh_morris_level_conversations_eighteen_02",
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
				"pes_morris_level_conversations_eighteen_02"
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
		name = "pbw_morris_level_conversations_nineteen_01",
		response = "pbw_morris_level_conversations_nineteen_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pbw_morris_level_conversations_nineteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_level_conversations_nineteen_01",
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
		name = "pwe_morris_level_conversations_nineteen_01",
		response = "pwe_morris_level_conversations_nineteen_01",
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
				"pbw_morris_level_conversations_nineteen_01"
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
		name = "pbw_morris_level_conversations_nineteen_02",
		response = "pbw_morris_level_conversations_nineteen_02",
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
				"pwe_morris_level_conversations_nineteen_01"
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
		name = "pwe_morris_level_conversations_nineteen_02",
		response = "pwe_morris_level_conversations_nineteen_02",
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
				"pbw_morris_level_conversations_nineteen_02"
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
		name = "pbw_morris_level_conversations_nineteen_03",
		response = "pbw_morris_level_conversations_nineteen_03",
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
				"pwe_morris_level_conversations_nineteen_02"
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
		name = "pwe_morris_level_conversations_twenty_01",
		response = "pwe_morris_level_conversations_twenty_01",
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
				"bright_wizard",
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
				"pwe_morris_level_conversations_twenty_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_level_conversations_twenty_01",
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
		name = "pbw_morris_level_conversations_twenty_01",
		response = "pbw_morris_level_conversations_twenty_01",
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
				"pwe_morris_level_conversations_twenty_01"
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
		name = "pwe_morris_level_conversations_twenty_02",
		response = "pwe_morris_level_conversations_twenty_02",
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
				"pbw_morris_level_conversations_twenty_01"
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
		name = "pbw_morris_level_conversations_twenty_02",
		response = "pbw_morris_level_conversations_twenty_02",
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
				"pwe_morris_level_conversations_twenty_02"
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
		name = "pwe_morris_level_conversations_twenty_03",
		response = "pwe_morris_level_conversations_twenty_03",
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
				"pbw_morris_level_conversations_twenty_02"
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
		name = "pes_morris_level_conversations_twentyone_01",
		response = "pes_morris_level_conversations_twentyone_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_twentyone_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_twentyone_01",
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
		name = "pwe_morris_level_conversations_twentyone_01",
		response = "pwe_morris_level_conversations_twentyone_01",
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
				"pes_morris_level_conversations_twentyone_01"
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
		name = "pes_morris_level_conversations_twentyone_02",
		response = "pes_morris_level_conversations_twentyone_02",
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
				"pwe_morris_level_conversations_twentyone_01"
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
		name = "pwe_morris_level_conversations_twentyone_02",
		response = "pwe_morris_level_conversations_twentyone_02",
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
				"pes_morris_level_conversations_twentyone_02"
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
		name = "pwh_morris_level_conversations_twentytwo_01",
		response = "pwh_morris_level_conversations_twentytwo_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pwh_morris_level_conversations_twentytwo_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_level_conversations_twentytwo_01",
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
		name = "pbw_morris_level_conversations_twentytwo_01",
		response = "pbw_morris_level_conversations_twentytwo_01",
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
				"pwh_morris_level_conversations_twentytwo_01"
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
		name = "pwh_morris_level_conversations_twentytwo_02",
		response = "pwh_morris_level_conversations_twentytwo_02",
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
				"pbw_morris_level_conversations_twentytwo_01"
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
		name = "pwh_morris_level_conversations_twentythree_01",
		response = "pwh_morris_level_conversations_twentythree_01",
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
				"pwh_morris_level_conversations_twentythree_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_level_conversations_twentythree_01",
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
		name = "pwe_morris_level_conversations_twentythree_01",
		response = "pwe_morris_level_conversations_twentythree_01",
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
				"pwh_morris_level_conversations_twentythree_01"
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
		name = "pwh_morris_level_conversations_twentythree_02",
		response = "pwh_morris_level_conversations_twentythree_02",
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
				"pwe_morris_level_conversations_twentythree_01"
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
		name = "pwe_morris_level_conversations_twentythree_02",
		response = "pwe_morris_level_conversations_twentythree_02",
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
				"pwh_morris_level_conversations_twentythree_02"
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
		name = "pes_morris_level_conversations_thirtytwo_01",
		response = "pes_morris_level_conversations_thirtytwo_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pes_morris_level_conversations_thirtytwo_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_thirtytwo_01",
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
		name = "pwh_morris_level_conversations_thirtytwo_01",
		response = "pwh_morris_level_conversations_thirtytwo_01",
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
				"pes_morris_level_conversations_thirtytwo_01"
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
		name = "pes_morris_level_conversations_thirtytwo_02",
		response = "pes_morris_level_conversations_thirtytwo_02",
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
				"pwh_morris_level_conversations_thirtytwo_01"
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
		name = "pbw_morris_level_conversations_thirtytwo_01",
		response = "pbw_morris_level_conversations_thirtytwo_01",
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
				"pes_morris_level_conversations_thirtytwo_02"
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
		name = "pes_morris_level_conversations_thirtytwo_03",
		response = "pes_morris_level_conversations_thirtytwo_03",
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
				"pbw_morris_level_conversations_thirtytwo_01"
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
		name = "pwh_morris_level_conversations_thirtyfour_01",
		response = "pwh_morris_level_conversations_thirtyfour_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pwh_morris_level_conversations_thirtyfour_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_level_conversations_thirtyfour_01",
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
		name = "pes_morris_level_conversations_thirtyfour_01",
		response = "pes_morris_level_conversations_thirtyfour_01",
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
				"pwh_morris_level_conversations_thirtyfour_01"
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
		name = "pwh_morris_level_conversations_thirtyfour_02",
		response = "pwh_morris_level_conversations_thirtyfour_02",
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
				"pes_morris_level_conversations_thirtyfour_01"
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
		name = "pes_morris_level_conversations_thirtyfour_02",
		response = "pes_morris_level_conversations_thirtyfour_02",
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
				"pwh_morris_level_conversations_thirtyfour_02"
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
		name = "pes_morris_level_conversations_thirtyfive_01",
		response = "pes_morris_level_conversations_thirtyfive_01",
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
				"witch_hunter",
				OP.EQ,
				0
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
				"pes_morris_level_conversations_thirtyfive_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_level_conversations_thirtyfive_01",
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
		name = "pdr_morris_level_conversations_thirtyfive_01",
		response = "pdr_morris_level_conversations_thirtyfive_01",
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
				"pes_morris_level_conversations_thirtyfive_01"
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
		name = "pes_morris_level_conversations_thirtyfive_02",
		response = "pes_morris_level_conversations_thirtyfive_02",
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
				"pdr_morris_level_conversations_thirtyfive_01"
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
		name = "pdr_morris_level_conversations_thirtyfive_02",
		response = "pdr_morris_level_conversations_thirtyfive_02",
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
				"pes_morris_level_conversations_thirtyfive_02"
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
		name = "pes_morris_level_conversations_thirtyfive_03",
		response = "pes_morris_level_conversations_thirtyfive_03",
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
				"pdr_morris_level_conversations_thirtyfive_02"
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
	add_dialogues({
		pdr_morris_level_conversations_three_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_three_02"
			},
			sound_events_duration = {
				[1.0] = 2.6625416278839
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_fourteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_fourteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.0919585227966
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_fourteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_eight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_eight_01"
			},
			sound_events_duration = {
				[1.0] = 2.9697291851044
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_twentytwo_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_twentytwo_01"
			},
			sound_events_duration = {
				[1.0] = 7.1193332672119
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_twentytwo_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_twenty_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_twenty_01"
			},
			sound_events_duration = {
				[1.0] = 3.4713749885559
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_twenty_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_three_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_three_02"
			},
			sound_events_duration = {
				[1.0] = 4.9659581184387
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_twentytwo_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_twentytwo_02"
			},
			sound_events_duration = {
				[1.0] = 2.874041557312
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_twentytwo_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_twentythree_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_twentythree_02"
			},
			sound_events_duration = {
				[1.0] = 1.9918124675751
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twentythree_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_nineteen_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_nineteen_03"
			},
			sound_events_duration = {
				[1.0] = 8.7096042633057
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_nineteen_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_eighteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_eighteen_02"
			},
			sound_events_duration = {
				[1.0] = 3.1051249504089
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_eighteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_fifteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_fifteen_02"
			},
			sound_events_duration = {
				[1.0] = 4.3912501335144
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_fifteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_six_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_six_01"
			},
			sound_events_duration = {
				[1.0] = 7.4060626029968
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_twenty_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_twenty_01"
			},
			sound_events_duration = {
				[1.0] = 4.3133125305176
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twenty_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_nineteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_nineteen_02"
			},
			sound_events_duration = {
				[1.0] = 3.7353959083557
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_nineteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_nine_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_nine_02"
			},
			sound_events_duration = {
				[1.0] = 6.5923957824707
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_nine_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_one_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_one_02"
			},
			sound_events_duration = {
				[1.0] = 8.9644374847412
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_nine_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_nine_01"
			},
			sound_events_duration = {
				[1.0] = 4.5400414466858
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_six_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_six_02"
			},
			sound_events_duration = {
				[1.0] = 8.3358125686646
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_thirtyfive_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_thirtyfive_02"
			},
			sound_events_duration = {
				[1.0] = 4.7153749465942
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtyfive_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_thirtyfive_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_thirtyfive_03"
			},
			sound_events_duration = {
				[1.0] = 4.2775206565857
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtyfive_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_fourteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_fourteen_01"
			},
			sound_events_duration = {
				[1.0] = 6.3185415267944
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_fourteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_fourteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_fourteen_02"
			},
			sound_events_duration = {
				[1.0] = 5.1817917823792
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_fourteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_seventeen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_seventeen_01"
			},
			sound_events_duration = {
				[1.0] = 5.2389373779297
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_seventeen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_three_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_three_01"
			},
			sound_events_duration = {
				[1.0] = 7.4625415802002
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_seventeen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_seventeen_01"
			},
			sound_events_duration = {
				[1.0] = 2.1531250476837
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_seventeen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_thirtytwo_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_thirtytwo_01"
			},
			sound_events_duration = {
				[1.0] = 2.4215624332428
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_thirtytwo_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_thirtyfour_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_thirtyfour_02"
			},
			sound_events_duration = {
				[1.0] = 7.5852084159851
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_thirtyfour_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_twentyone_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_twentyone_02"
			},
			sound_events_duration = {
				[1.0] = 2.1964375972748
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_twentyone_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_five_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_five_01"
			},
			sound_events_duration = {
				[1.0] = 5.4265832901001
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_five_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_five_01"
			},
			sound_events_duration = {
				[1.0] = 3.9928541183472
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_twenty_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_twenty_02"
			},
			sound_events_duration = {
				[1.0] = 6.1999998092651
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twenty_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_one_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_one_01"
			},
			sound_events_duration = {
				[1.0] = 4.730354309082
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_thirtytwo_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_thirtytwo_01"
			},
			sound_events_duration = {
				[1.0] = 2.4717500209808
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_thirtytwo_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_two_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_two_02"
			},
			sound_events_duration = {
				[1.0] = 2.9426250457764
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_nineteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_nineteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.6934585571289
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_nineteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_three_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_three_01"
			},
			sound_events_duration = {
				[1.0] = 4.9703960418701
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_thirtytwo_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_thirtytwo_01"
			},
			sound_events_duration = {
				[1.0] = 5.5916042327881
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtytwo_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_eighteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_eighteen_01"
			},
			sound_events_duration = {
				[1.0] = 3.2962915897369
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_eighteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_eight_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_eight_02"
			},
			sound_events_duration = {
				[1.0] = 3.5529792308807
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_eight_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_thirtyfive_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_thirtyfive_02"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_thirtyfive_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_thirtyfive_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_thirtyfive_01"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_thirtyfive_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_four_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_four_02"
			},
			sound_events_duration = {
				[1.0] = 4.1993126869202
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_thirtyfour_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_thirtyfour_02"
			},
			sound_events_duration = {
				[1.0] = 2.3745625019074
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtyfour_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_nineteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_nineteen_01"
			},
			sound_events_duration = {
				[1.0] = 2.1252083778381
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_nineteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_thirtyfour_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_thirtyfour_01"
			},
			sound_events_duration = {
				[1.0] = 3.4744791984558
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtyfour_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_thirtyfour_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_thirtyfour_01"
			},
			sound_events_duration = {
				[1.0] = 6.2720832824707
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_thirtyfour_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_one_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.646666765213
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_twenty_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_twenty_02"
			},
			sound_events_duration = {
				[1.0] = 0.7247708439827
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_twenty_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_seven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_seven_01"
			},
			sound_events_duration = {
				[1.0] = 6.9398126602173
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_thirtytwo_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_thirtytwo_02"
			},
			sound_events_duration = {
				[1.0] = 6.0187501907349
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtytwo_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_two_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_two_01"
			},
			sound_events_duration = {
				[1.0] = 5.8586249351502
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_nineteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_nineteen_02"
			},
			sound_events_duration = {
				[1.0] = 0.99529165029526
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_nineteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_thirtytwo_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_thirtytwo_03"
			},
			sound_events_duration = {
				[1.0] = 2.1939165592194
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtytwo_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_twentythree_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_twentythree_01"
			},
			sound_events_duration = {
				[1.0] = 4.3385834693909
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twentythree_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_seven_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_seven_02"
			},
			sound_events_duration = {
				[1.0] = 4.5099582672119
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_seven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_seven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_seven_01"
			},
			sound_events_duration = {
				[1.0] = 4.592791557312
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_twentythree_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_twentythree_01"
			},
			sound_events_duration = {
				[1.0] = 6.6722917556763
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_twentythree_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_two_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_two_01"
			},
			sound_events_duration = {
				[1.0] = 5.3380832672119
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_thirtyfive_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_thirtyfive_01"
			},
			sound_events_duration = {
				[1.0] = 5.6421456336975
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtyfive_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_twentyone_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_twentyone_02"
			},
			sound_events_duration = {
				[1.0] = 2.874520778656
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twentyone_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_seven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_seven_01"
			},
			sound_events_duration = {
				[1.0] = 4.1268749237061
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_twentyone_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_twentyone_01"
			},
			sound_events_duration = {
				[1.0] = 1.8286458253861
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_twentyone_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_sixteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_sixteen_02"
			},
			sound_events_duration = {
				[1.0] = 2.4981665611267
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_sixteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_twenty_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_twenty_03"
			},
			sound_events_duration = {
				[1.0] = 1.1121875047684
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twenty_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_twentyone_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_twentyone_01"
			},
			sound_events_duration = {
				[1.0] = 7.1880207061768
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twentyone_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_twentythree_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_twentythree_02"
			},
			sound_events_duration = {
				[1.0] = 3.176958322525
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_twentythree_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_fifteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_fifteen_01"
			},
			sound_events_duration = {
				[1.0] = 2.4231040477753
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_fifteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_fifteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_fifteen_01"
			},
			sound_events_duration = {
				[1.0] = 6.1539998054504
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_fifteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_six_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_six_01"
			},
			sound_events_duration = {
				[1.0] = 2.2123334407806
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_eighteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_eighteen_02"
			},
			sound_events_duration = {
				[1.0] = 9.7302703857422
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_eighteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_sixteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_sixteen_01"
			},
			sound_events_duration = {
				[1.0] = 3.5462501049042
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_sixteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_seventeen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_seventeen_02"
			},
			sound_events_duration = {
				[1.0] = 3.3961040973663
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_seventeen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_nine_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_nine_02"
			},
			sound_events_duration = {
				[1.0] = 2.0413959026337
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_nine_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_twentytwo_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_twentytwo_01"
			},
			sound_events_duration = {
				[1.0] = 3.8594374656677
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_twentytwo_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_six_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_six_02"
			},
			sound_events_duration = {
				[1.0] = 5.4058332443237
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_five_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_five_02"
			},
			sound_events_duration = {
				[1.0] = 4.4161872863769
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_five_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_five_02"
			},
			sound_events_duration = {
				[1.0] = 1.7345207929611
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_fourteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_fourteen_02"
			},
			sound_events_duration = {
				[1.0] = 2.103333234787
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_fourteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_eight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_eight_01"
			},
			sound_events_duration = {
				[1.0] = 7.8399791717529
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_morris_level_conversations_four_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_morris_level_conversations_four_01"
			},
			sound_events_duration = {
				[1.0] = 6.2698335647583
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_four_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_four_02"
			},
			sound_events_duration = {
				[1.0] = 2.5820000171661
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_fifteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_fifteen_01"
			},
			sound_events_duration = {
				[1.0] = 7.2366251945496
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_fifteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_morris_level_conversations_four_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_morris_level_conversations_four_01"
			},
			sound_events_duration = {
				[1.0] = 11.272853851318
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_nine_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_nine_01"
			},
			sound_events_duration = {
				[1.0] = 7.3121876716614
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_one_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_one_01"
			},
			sound_events_duration = {
				[1.0] = 2.228333234787
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_morris_level_conversations_sixteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_morris_level_conversations_sixteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.2483124732971
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_sixteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_morris_level_conversations_eighteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_morris_level_conversations_eighteen_01"
			},
			sound_events_duration = {
				[1.0] = 3.3518333435059
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_eighteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_morris_level_conversations_eight_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_morris_level_conversations_eight_02"
			},
			sound_events_duration = {
				[1.0] = 1.0511875152588
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_eight_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		}
	})
end
