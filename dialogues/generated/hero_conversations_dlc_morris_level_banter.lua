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
	define_rule({
		name = "pdr_gk_morris_level_conversations_thirtysix_01",
		response = "pdr_gk_morris_level_conversations_thirtysix_01",
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
				10
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
				"es_questingknight",
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
				"pdr_gk_morris_level_conversations_thirtysix",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_gk_morris_level_conversations_thirtysix",
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
		name = "pes_gk_morris_level_conversations_thirtysix_01",
		response = "pes_gk_morris_level_conversations_thirtysix_01",
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
				"pdr_gk_morris_level_conversations_thirtysix_01"
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
		name = "pwe_gk_morris_level_conversations_thirtysix_01",
		response = "pwe_gk_morris_level_conversations_thirtysix_01",
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
				"pes_gk_morris_level_conversations_thirtysix_01"
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
		name = "pes_gk_morris_level_conversations_thirtyseven_01",
		response = "pes_gk_morris_level_conversations_thirtyseven_01",
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
				10
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
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight"
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_thirtyseven",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_thirtyseven",
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
		name = "pwe_gk_morris_level_conversations_thirtyseven_01",
		response = "pwe_gk_morris_level_conversations_thirtyseven_01",
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
				"pes_gk_morris_level_conversations_thirtyseven_01"
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
		name = "pes_gk_morris_level_conversations_thirtyseven_02",
		response = "pes_gk_morris_level_conversations_thirtyseven_02",
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
				"pwe_gk_morris_level_conversations_thirtyseven_01"
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
		name = "pdr_gk_morris_level_conversations_thirtyseven_01",
		response = "pdr_gk_morris_level_conversations_thirtyseven_01",
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
				"pes_gk_morris_level_conversations_thirtyseven_02"
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
		name = "pes_gk_morris_level_conversations_thirtyeight_01",
		response = "pes_gk_morris_level_conversations_thirtyeight_01",
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
				10
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
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight"
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
				"pes_gk_morris_level_conversations_thirtyeight",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_thirtyeight",
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
		name = "pwh_gk_morris_level_conversations_thirtyeight_01",
		response = "pwh_gk_morris_level_conversations_thirtyeight_01",
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
				"pes_gk_morris_level_conversations_thirtyeight_01"
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
		name = "pes_gk_morris_level_conversations_thirtyeight_02",
		response = "pes_gk_morris_level_conversations_thirtyeight_02",
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
				"pwh_gk_morris_level_conversations_thirtyeight_01"
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
		name = "pbw_gk_morris_level_conversations_thirtynine_01",
		response = "pbw_gk_morris_level_conversations_thirtynine_01",
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
				10
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
				"es_questingknight",
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
				"pbw_gk_morris_level_conversations_thirtynine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_gk_morris_level_conversations_thirtynine",
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
		name = "pes_gk_morris_level_conversations_thirtynine_01",
		response = "pes_gk_morris_level_conversations_thirtynine_01",
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
				"pbw_gk_morris_level_conversations_thirtynine_01"
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
		name = "pdr_gk_morris_level_conversations_thirtynine_01",
		response = "pdr_gk_morris_level_conversations_thirtynine_01",
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
				"pes_gk_morris_level_conversations_thirtynine_01"
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
		name = "pes_gk_morris_level_conversations_thirtynine_02",
		response = "pes_gk_morris_level_conversations_thirtynine_02",
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
				"pdr_gk_morris_level_conversations_thirtynine_01"
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
		name = "pwe_gk_morris_level_conversations_forty_01",
		response = "pwe_gk_morris_level_conversations_forty_01",
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
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				"es_questingknight",
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
				"pwe_gk_morris_level_conversations_forty",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_gk_morris_level_conversations_forty",
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
		name = "pes_gk_morris_level_conversations_forty_01",
		response = "pes_gk_morris_level_conversations_forty_01",
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
				"pwe_gk_morris_level_conversations_forty_01"
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
		name = "pwe_gk_morris_level_conversations_forty_02",
		response = "pwe_gk_morris_level_conversations_forty_02",
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
				"pes_gk_morris_level_conversations_forty_01"
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
		name = "pes_gk_morris_level_conversations_forty_02",
		response = "pes_gk_morris_level_conversations_forty_02",
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
				"pwe_gk_morris_level_conversations_forty_02"
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
		name = "pwe_gk_morris_level_conversations_fortyone_01",
		response = "pwe_gk_morris_level_conversations_fortyone_01",
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
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				"es_questingknight",
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
				"pwe_gk_morris_level_conversations_fortyone",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_gk_morris_level_conversations_fortyone",
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
		name = "pes_gk_morris_level_conversations_fortyone_01",
		response = "pes_gk_morris_level_conversations_fortyone_01",
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
				"pwe_gk_morris_level_conversations_fortyone_01"
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
		name = "pwe_gk_morris_level_conversations_fortyone_02",
		response = "pwe_gk_morris_level_conversations_fortyone_02",
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
				"pes_gk_morris_level_conversations_fortyone_01"
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
		name = "pes_gk_morris_level_conversations_fortyone_02",
		response = "pes_gk_morris_level_conversations_fortyone_02",
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
				"pwe_gk_morris_level_conversations_fortyone_02"
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
		name = "pdr_de_gk_morris_level_conversations_fortyone_01",
		response = "pdr_de_gk_morris_level_conversations_fortyone_01",
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
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer"
			},
			{
				"global_context",
				"es_questingknight",
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
				"pdr_de_gk_morris_level_conversations_fortyone",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_de_gk_morris_level_conversations_fortyone",
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
		name = "pes_gk_de_morris_level_conversations_fortyone_01",
		response = "pes_gk_de_morris_level_conversations_fortyone_01",
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
				"pdr_de_gk_morris_level_conversations_fortyone_01"
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
		name = "pdr_de_gk_morris_level_conversations_fortyone_02",
		response = "pdr_de_gk_morris_level_conversations_fortyone_02",
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
				"pes_gk_de_morris_level_conversations_fortyone_01"
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
		name = "pes_gk_de_morris_level_conversations_fortyone_02",
		response = "pes_gk_de_morris_level_conversations_fortyone_02",
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
				"pdr_de_gk_morris_level_conversations_fortyone_02"
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
		name = "pdr_de_morris_level_conversations_fortytwo_01",
		response = "pdr_de_morris_level_conversations_fortytwo_01",
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
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer"
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
				"pdr_de_morris_level_conversations_fortytwo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fortytwo",
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
		name = "pes_de_morris_level_conversations_fortytwo_01",
		response = "pes_de_morris_level_conversations_fortytwo_01",
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
				"pdr_de_morris_level_conversations_fortytwo_01"
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
		name = "pdr_de_morris_level_conversations_fortytwo_02",
		response = "pdr_de_morris_level_conversations_fortytwo_02",
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
				"pes_de_morris_level_conversations_fortytwo_01"
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
		name = "pes_de_morris_level_conversations_fortythree_01",
		response = "pes_de_morris_level_conversations_fortythree_01",
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
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				"dr_engineer",
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
				"pes_de_morris_level_conversations_fortythree",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_de_morris_level_conversations_fortythree",
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
		name = "pdr_de_morris_level_conversations_fortythree_01",
		response = "pdr_de_morris_level_conversations_fortythree_01",
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
				"pes_de_morris_level_conversations_fortythree_01"
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
		name = "pes_de_morris_level_conversations_fortythree_02",
		response = "pes_de_morris_level_conversations_fortythree_02",
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
				"pdr_de_morris_level_conversations_fortythree_01"
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
		name = "pes_de_morris_level_conversations_fortyfour_01",
		response = "pes_de_morris_level_conversations_fortyfour_01",
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
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				"dr_engineer",
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
				"pes_de_morris_level_conversations_fortyfour",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_de_morris_level_conversations_fortyfour",
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
		name = "pdr_de_morris_level_conversations_fortyfour_01",
		response = "pdr_de_morris_level_conversations_fortyfour_01",
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
				"pes_de_morris_level_conversations_fortyfour_01"
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
		name = "pes_de_morris_level_conversations_fortyfour_02",
		response = "pes_de_morris_level_conversations_fortyfour_02",
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
				"pdr_de_morris_level_conversations_fortyfour_01"
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
		name = "pdr_de_morris_level_conversations_fortyfive_01",
		response = "pdr_de_morris_level_conversations_fortyfive_01",
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
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer"
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
				"pdr_de_morris_level_conversations_fortyfive",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fortyfive",
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
		name = "pwh_de_morris_level_conversations_fortyfive_01",
		response = "pwh_de_morris_level_conversations_fortyfive_01",
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
				"pdr_de_morris_level_conversations_fortyfive_01"
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
		name = "pdr_de_morris_level_conversations_fortyfive_02",
		response = "pdr_de_morris_level_conversations_fortyfive_02",
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
				"pwh_de_morris_level_conversations_fortyfive_01"
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
		name = "pdr_de_morris_level_conversations_fortysix_01",
		response = "pdr_de_morris_level_conversations_fortysix_01",
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
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer"
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
				"pdr_de_morris_level_conversations_fortysix",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fortysix",
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
		name = "pes_de_morris_level_conversations_fortysix_01",
		response = "pes_de_morris_level_conversations_fortysix_01",
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
				"pdr_de_morris_level_conversations_fortysix_01"
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
		name = "pdr_de_morris_level_conversations_fortysix_02",
		response = "pdr_de_morris_level_conversations_fortysix_02",
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
				"pes_de_morris_level_conversations_fortysix_01"
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
		name = "pes_de_morris_level_conversations_fortysix_02",
		response = "pes_de_morris_level_conversations_fortysix_02",
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
				"pdr_de_morris_level_conversations_fortysix_02"
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
		name = "pdr_de_morris_level_conversations_fortysix_03",
		response = "pdr_de_morris_level_conversations_fortysix_03",
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
				"pes_de_morris_level_conversations_fortysix_02"
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
		name = "pbw_de_morris_level_conversations_fortyseven_01",
		response = "pbw_de_morris_level_conversations_fortyseven_01",
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
				10
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
				"dr_engineer",
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
				"pbw_de_morris_level_conversations_fortyseven",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_de_morris_level_conversations_fortyseven",
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
		name = "pdr_de_morris_level_conversations_fortyseven_01",
		response = "pdr_de_morris_level_conversations_fortyseven_01",
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
				"pbw_de_morris_level_conversations_fortyseven_01"
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
		name = "pwh_de_morris_level_conversations_fortyseven_01",
		response = "pwh_de_morris_level_conversations_fortyseven_01",
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
				"pdr_de_morris_level_conversations_fortyseven_01"
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
		name = "pdr_de_morris_level_conversations_fortyseven_02",
		response = "pdr_de_morris_level_conversations_fortyseven_02",
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
				"pwh_de_morris_level_conversations_fortyseven_01"
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
		name = "pdr_gk_morris_level_conversations_fortyeight_01",
		response = "pdr_gk_morris_level_conversations_fortyeight_01",
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
				5
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
				"es_questingknight",
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
				"pdr_gk_morris_level_conversations_fortyeight",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_gk_morris_level_conversations_fortyeight",
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
		name = "pes_gk_morris_level_conversations_fortyeight_01",
		response = "pes_gk_morris_level_conversations_fortyeight_01",
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
				"pdr_gk_morris_level_conversations_fortyeight_01"
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
		name = "pwe_gk_morris_level_conversations_fortyeight_01",
		response = "pwe_gk_morris_level_conversations_fortyeight_01",
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
				"pes_gk_morris_level_conversations_fortyeight_01"
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
		name = "pbw_gk_morris_level_conversations_fortyeight_01",
		response = "pbw_gk_morris_level_conversations_fortyeight_01",
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
				"pwe_gk_morris_level_conversations_fortyeight_01"
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
		name = "pwh_gk_morris_level_conversations_fortyeight_01",
		response = "pwh_gk_morris_level_conversations_fortyeight_01",
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
				"pwe_gk_morris_level_conversations_fortyeight_01"
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
		name = "pes_gk_morris_level_conversations_fortynine_01",
		response = "pes_gk_morris_level_conversations_fortynine_01",
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
				10
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
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight"
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
				"pes_gk_morris_level_conversations_fortynine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_fortynine",
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
		name = "pdr_gk_morris_level_conversations_fortynine_01",
		response = "pdr_gk_morris_level_conversations_fortynine_01",
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
				"pes_gk_morris_level_conversations_fortynine_01"
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
		name = "pes_gk_morris_level_conversations_fortynine_02",
		response = "pes_gk_morris_level_conversations_fortynine_02",
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
				"pdr_gk_morris_level_conversations_fortynine_01"
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
		name = "pdr_de_morris_level_conversations_fifty_01",
		response = "pdr_de_morris_level_conversations_fifty_01",
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
				10
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer"
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
				"pdr_de_morris_level_conversations_fifty",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_de_morris_level_conversations_fifty",
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
		name = "pes_de_morris_level_conversations_fifty_01",
		response = "pes_de_morris_level_conversations_fifty_01",
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
				"pdr_de_morris_level_conversations_fifty_01"
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
		name = "pdr_de_morris_level_conversations_fifty_02",
		response = "pdr_de_morris_level_conversations_fifty_02",
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
				"pes_de_morris_level_conversations_fifty_01"
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
		name = "pes_de_morris_level_conversations_fifty_02",
		response = "pes_de_morris_level_conversations_fifty_02",
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
				"pdr_de_morris_level_conversations_fifty_02"
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
		name = "pes_de_morris_level_conversations_fiftyone_01",
		response = "pes_de_morris_level_conversations_fiftyone_01",
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
				10
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
				"dr_engineer",
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
				"pes_gk_morris_level_conversations_fortynine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_gk_morris_level_conversations_fortynine",
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
		name = "pdr_de_morris_level_conversations_fiftyone_01",
		response = "pdr_de_morris_level_conversations_fiftyone_01",
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
				"pes_de_morris_level_conversations_fiftyone_01"
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
		name = "pes_de_morris_level_conversations_fiftyone_02",
		response = "pes_de_morris_level_conversations_fiftyone_02",
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
				"pdr_de_morris_level_conversations_fiftyone_01"
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
				[1.0] = 6.1999793052673
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twenty_02"
			}
		},
		pes_gk_morris_level_conversations_thirtynine_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_thirtynine_02"
			},
			sound_events_duration = {
				[1.0] = 2.1045000553131
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_thirtynine_02"
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
				[1.0] = 8.3357915878296
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_six_02"
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
				[1.0] = 5.6934375762939
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_nineteen_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_eighteen_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_two_02"
			}
		},
		pwe_gk_morris_level_conversations_thirtysix_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gk_morris_level_conversations_thirtysix_01"
			},
			sound_events_duration = {
				[1.0] = 1.6790416240692
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_gk_morris_level_conversations_thirtysix_01"
			}
		},
		pbw_de_morris_level_conversations_fortyseven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_de_morris_level_conversations_fortyseven_01"
			},
			sound_events_duration = {
				[1.0] = 4.1126456260681
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_de_morris_level_conversations_fortyseven_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_nineteen_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_twentyone_02"
			}
		},
		pes_gk_morris_level_conversations_thirtyeight_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_thirtyeight_02"
			},
			sound_events_duration = {
				[1.0] = 3.6582291126251
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_thirtyeight_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtytwo_03"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_eighteen_02"
			}
		},
		pdr_de_morris_level_conversations_fiftyone_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fiftyone_01"
			},
			sound_events_duration = {
				[1.0] = 5.876437664032
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fiftyone_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_sixteen_02"
			}
		},
		pdr_de_gk_morris_level_conversations_fortyone_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_gk_morris_level_conversations_fortyone_02"
			},
			sound_events_duration = {
				[1.0] = 1.5016458034515
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_gk_morris_level_conversations_fortyone_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_fifteen_02"
			}
		},
		pwe_gk_morris_level_conversations_forty_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gk_morris_level_conversations_forty_02"
			},
			sound_events_duration = {
				[1.0] = 4.9536876678467
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_gk_morris_level_conversations_forty_02"
			}
		},
		pes_gk_de_morris_level_conversations_fortyone_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_de_morris_level_conversations_fortyone_01"
			},
			sound_events_duration = {
				[1.0] = 5.1128125190735
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_de_morris_level_conversations_fortyone_01"
			}
		},
		pdr_de_morris_level_conversations_fortyseven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fortyseven_01"
			},
			sound_events_duration = {
				[1.0] = 5.9302082061768
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fortyseven_01"
			}
		},
		pes_de_morris_level_conversations_fiftyone_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_de_morris_level_conversations_fiftyone_01"
			},
			sound_events_duration = {
				[1.0] = 5.2859168052673
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_de_morris_level_conversations_fiftyone_01"
			}
		},
		pdr_de_morris_level_conversations_fortyfive_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fortyfive_02"
			},
			sound_events_duration = {
				[1.0] = 4.4348125457764
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fortyfive_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_seven_01"
			}
		},
		pdr_de_morris_level_conversations_fortysix_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fortysix_02"
			},
			sound_events_duration = {
				[1.0] = 8.0599374771118
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fortysix_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_six_02"
			}
		},
		pes_de_morris_level_conversations_fortysix_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_de_morris_level_conversations_fortysix_02"
			},
			sound_events_duration = {
				[1.0] = 2.3776249885559
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_de_morris_level_conversations_fortysix_02"
			}
		},
		pdr_gk_morris_level_conversations_thirtysix_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gk_morris_level_conversations_thirtysix_01"
			},
			sound_events_duration = {
				[1.0] = 5.4813122749329
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_gk_morris_level_conversations_thirtysix_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtyfour_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_twentytwo_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_sixteen_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_two_01"
			}
		},
		pes_de_morris_level_conversations_fortytwo_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_de_morris_level_conversations_fortytwo_01"
			},
			sound_events_duration = {
				[1.0] = 1.9311250448227
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_de_morris_level_conversations_fortytwo_01"
			}
		},
		pdr_de_morris_level_conversations_fortysix_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fortysix_03"
			},
			sound_events_duration = {
				[1.0] = 1.8569791316986
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fortysix_03"
			}
		},
		pdr_gk_morris_level_conversations_thirtyseven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gk_morris_level_conversations_thirtyseven_01"
			},
			sound_events_duration = {
				[1.0] = 3.2798750400543
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_gk_morris_level_conversations_thirtyseven_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_eight_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_one_02"
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
				[1.0] = 1.9917917251587
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twentythree_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_twentythree_02"
			}
		},
		pes_gk_morris_level_conversations_thirtyeight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_thirtyeight_01"
			},
			sound_events_duration = {
				[1.0] = 2.9712290763855
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_thirtyeight_01"
			}
		},
		pdr_de_morris_level_conversations_fortyseven_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fortyseven_02"
			},
			sound_events_duration = {
				[1.0] = 9.8078336715698
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fortyseven_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_thirtyfour_02"
			}
		},
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_three_02"
			}
		},
		pes_gk_de_morris_level_conversations_fortyone_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_de_morris_level_conversations_fortyone_02"
			},
			sound_events_duration = {
				[1.0] = 4.4168124198914
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_de_morris_level_conversations_fortyone_02"
			}
		},
		pes_gk_morris_level_conversations_fortyone_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_fortyone_02"
			},
			sound_events_duration = {
				[1.0] = 2.3799583911896
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_fortyone_02"
			}
		},
		pwh_gk_morris_level_conversations_thirtyeight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gk_morris_level_conversations_thirtyeight_01"
			},
			sound_events_duration = {
				[1.0] = 2.0434792041779
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_gk_morris_level_conversations_thirtyeight_01"
			}
		},
		pes_de_morris_level_conversations_fifty_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_de_morris_level_conversations_fifty_02"
			},
			sound_events_duration = {
				[1.0] = 2.6430833339691
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_de_morris_level_conversations_fifty_02"
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
				[1.0] = 4.3385624885559
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twentythree_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_nine_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_five_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_five_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_eight_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_twentythree_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_sixteen_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_four_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_four_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_fifteen_01"
			}
		},
		pdr_de_morris_level_conversations_fortytwo_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fortytwo_02"
			},
			sound_events_duration = {
				[1.0] = 6.8717918395996
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fortytwo_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_fifteen_01"
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
				[1.0] = 7.839958190918
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_eight_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_twenty_02"
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
				[1.0] = 4.3132915496826
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twenty_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_thirtytwo_01"
			}
		},
		pes_de_morris_level_conversations_fortythree_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_de_morris_level_conversations_fortythree_01"
			},
			sound_events_duration = {
				[1.0] = 3.192104101181
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_de_morris_level_conversations_fortythree_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_nineteen_02"
			}
		},
		pwh_gk_morris_level_conversations_fortyeight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gk_morris_level_conversations_fortyeight_01"
			},
			sound_events_duration = {
				[1.0] = 6.4420833587647
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_gk_morris_level_conversations_fortyeight_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_nine_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_twenty_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_nineteen_03"
			}
		},
		pdr_de_morris_level_conversations_fortyfour_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fortyfour_01"
			},
			sound_events_duration = {
				[1.0] = 5.7958126068115
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fortyfour_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_nineteen_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_four_01"
			}
		},
		pes_de_morris_level_conversations_fortyfour_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_de_morris_level_conversations_fortyfour_02"
			},
			sound_events_duration = {
				[1.0] = 5.3201456069946
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_de_morris_level_conversations_fortyfour_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_four_01"
			}
		},
		pes_de_morris_level_conversations_fortythree_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_de_morris_level_conversations_fortythree_02"
			},
			sound_events_duration = {
				[1.0] = 4.1318335533142
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_de_morris_level_conversations_fortythree_02"
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
				[1.0] = 4.9659376144409
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_three_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtyfive_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_three_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtyfive_01"
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
				[1.0] = 9.4361667633057
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_thirtyfive_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_one_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_fourteen_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtytwo_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_seventeen_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_one_02"
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
				[1.0] = 7.4625205993652
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_three_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_thirtytwo_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_one_01"
			}
		},
		pwe_gk_morris_level_conversations_fortyeight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gk_morris_level_conversations_fortyeight_01"
			},
			sound_events_duration = {
				[1.0] = 5.746687412262
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_gk_morris_level_conversations_fortyeight_01"
			}
		},
		pdr_de_morris_level_conversations_fifty_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fifty_02"
			},
			sound_events_duration = {
				[1.0] = 7.0132918357849
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fifty_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_two_01"
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
				[1.0] = 7.2366042137146
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_fifteen_01"
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
				[1.0] = 7.4060416221619
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_six_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtyfive_03"
			}
		},
		pdr_gk_morris_level_conversations_fortynine_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gk_morris_level_conversations_fortynine_01"
			},
			sound_events_duration = {
				[1.0] = 3.573145866394
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_gk_morris_level_conversations_fortynine_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_seven_01"
			}
		},
		pes_gk_morris_level_conversations_fortynine_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_fortynine_01"
			},
			sound_events_duration = {
				[1.0] = 2.2426874637604
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_fortynine_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_five_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_five_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_seventeen_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_fourteen_02"
			}
		},
		pbw_gk_morris_level_conversations_fortyeight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gk_morris_level_conversations_fortyeight_01"
			},
			sound_events_duration = {
				[1.0] = 3.8040416240692
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_gk_morris_level_conversations_fortyeight_01"
			}
		},
		pes_de_morris_level_conversations_fiftyone_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_de_morris_level_conversations_fiftyone_02"
			},
			sound_events_duration = {
				[1.0] = 5.8417081832886
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_de_morris_level_conversations_fiftyone_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_twentytwo_01"
			}
		},
		pwe_gk_morris_level_conversations_fortyone_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gk_morris_level_conversations_fortyone_01"
			},
			sound_events_duration = {
				[1.0] = 1.9698541164398
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_gk_morris_level_conversations_fortyone_01"
			}
		},
		pdr_gk_morris_level_conversations_fortyeight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gk_morris_level_conversations_fortyeight_01"
			},
			sound_events_duration = {
				[1.0] = 8.1847915649414
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_gk_morris_level_conversations_fortyeight_01"
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
				[1.0] = 3.5853333473206
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_thirtyfive_02"
			}
		},
		pwh_de_morris_level_conversations_fortyseven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_de_morris_level_conversations_fortyseven_01"
			},
			sound_events_duration = {
				[1.0] = 2.9739167690277
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_de_morris_level_conversations_fortyseven_01"
			}
		},
		pdr_de_morris_level_conversations_fortyfive_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fortyfive_01"
			},
			sound_events_duration = {
				[1.0] = 4.5127501487732
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fortyfive_01"
			}
		},
		pdr_de_morris_level_conversations_fortysix_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fortysix_01"
			},
			sound_events_duration = {
				[1.0] = 3.7976040840149
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fortysix_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_six_01"
			}
		},
		pdr_de_morris_level_conversations_fortytwo_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fortytwo_01"
			},
			sound_events_duration = {
				[1.0] = 3.7932708263397
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fortytwo_01"
			}
		},
		pes_de_morris_level_conversations_fortysix_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_de_morris_level_conversations_fortysix_01"
			},
			sound_events_duration = {
				[1.0] = 3.0541040897369
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_de_morris_level_conversations_fortysix_01"
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
				[1.0] = 2.8745000362396
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twentyone_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_seventeen_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_thirtyfour_01"
			}
		},
		pes_de_morris_level_conversations_fortyfour_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_de_morris_level_conversations_fortyfour_01"
			},
			sound_events_duration = {
				[1.0] = 2.1275625228882
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_de_morris_level_conversations_fortyfour_01"
			}
		},
		pes_gk_morris_level_conversations_forty_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_forty_02"
			},
			sound_events_duration = {
				[1.0] = 3.7054374217987
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_forty_02"
			}
		},
		pes_gk_morris_level_conversations_fortyone_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_fortyone_01"
			},
			sound_events_duration = {
				[1.0] = 2.4524583816528
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_fortyone_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_nine_02"
			}
		},
		pdr_de_morris_level_conversations_fortythree_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fortythree_01"
			},
			sound_events_duration = {
				[1.0] = 7.044499874115
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fortythree_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_seven_01"
			}
		},
		pwh_de_morris_level_conversations_fortyfive_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_de_morris_level_conversations_fortyfive_01"
			},
			sound_events_duration = {
				[1.0] = 6.9487709999084
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_de_morris_level_conversations_fortyfive_01"
			}
		},
		pdr_de_gk_morris_level_conversations_fortyone_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_gk_morris_level_conversations_fortyone_01"
			},
			sound_events_duration = {
				[1.0] = 1.999104142189
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_gk_morris_level_conversations_fortyone_01"
			}
		},
		pes_gk_morris_level_conversations_fortynine_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_fortynine_02"
			},
			sound_events_duration = {
				[1.0] = 4.3681664466858
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_fortynine_02"
			}
		},
		pwe_gk_morris_level_conversations_fortyone_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gk_morris_level_conversations_fortyone_02"
			},
			sound_events_duration = {
				[1.0] = 5.9004998207092
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_gk_morris_level_conversations_fortyone_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtytwo_02"
			}
		},
		pes_gk_morris_level_conversations_thirtyseven_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_thirtyseven_02"
			},
			sound_events_duration = {
				[1.0] = 1.7029792070389
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_thirtyseven_02"
			}
		},
		pwe_gk_morris_level_conversations_thirtyseven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gk_morris_level_conversations_thirtyseven_01"
			},
			sound_events_duration = {
				[1.0] = 1.676854133606
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_gk_morris_level_conversations_thirtyseven_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_eighteen_01"
			}
		},
		pwe_gk_morris_level_conversations_forty_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gk_morris_level_conversations_forty_01"
			},
			sound_events_duration = {
				[1.0] = 3.2530000209808
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_gk_morris_level_conversations_forty_01"
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
				[1.0] = 7.188000202179
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twentyone_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_eight_02"
			}
		},
		pes_de_morris_level_conversations_fifty_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_de_morris_level_conversations_fifty_01"
			},
			sound_events_duration = {
				[1.0] = 1.9630833864212
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_de_morris_level_conversations_fifty_01"
			}
		},
		pdr_de_morris_level_conversations_fifty_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_de_morris_level_conversations_fifty_01"
			},
			sound_events_duration = {
				[1.0] = 3.1936457157135
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_de_morris_level_conversations_fifty_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_thirtyfour_02"
			}
		},
		pes_gk_morris_level_conversations_thirtynine_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_thirtynine_01"
			},
			sound_events_duration = {
				[1.0] = 3.1593749523163
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_thirtynine_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_fourteen_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_morris_level_conversations_seven_02"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_twentytwo_02"
			}
		},
		pes_gk_morris_level_conversations_thirtyseven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_thirtyseven_01"
			},
			sound_events_duration = {
				[1.0] = 6.8049373626709
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_thirtyseven_01"
			}
		},
		pdr_gk_morris_level_conversations_thirtynine_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gk_morris_level_conversations_thirtynine_01"
			},
			sound_events_duration = {
				[1.0] = 6.2345418930054
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pdr_gk_morris_level_conversations_thirtynine_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_morris_level_conversations_nine_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_eighteen_01"
			}
		},
		pes_gk_morris_level_conversations_forty_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_forty_01"
			},
			sound_events_duration = {
				[1.0] = 2.7962708473206
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_forty_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_morris_level_conversations_twentyone_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwh_morris_level_conversations_fourteen_02"
			}
		},
		pes_gk_morris_level_conversations_thirtysix_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_thirtysix_01"
			},
			sound_events_duration = {
				[1.0] = 2.7715001106262
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_thirtysix_01"
			}
		},
		pbw_gk_morris_level_conversations_thirtynine_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gk_morris_level_conversations_thirtynine_01"
			},
			sound_events_duration = {
				[1.0] = 4.4111042022705
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pbw_gk_morris_level_conversations_thirtynine_01"
			}
		},
		pes_gk_morris_level_conversations_fortyeight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_level_banter",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gk_morris_level_conversations_fortyeight_01"
			},
			sound_events_duration = {
				[1.0] = 5.6230416297913
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pes_gk_morris_level_conversations_fortyeight_01"
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
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			localization_strings = {
				[1.0] = "pwe_morris_level_conversations_twenty_03"
			}
		}
	})
end
