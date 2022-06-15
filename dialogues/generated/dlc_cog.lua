return function ()
	define_rule({
		name = "pwe_cog_conversation_one_01",
		response = "pwe_cog_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwe_cog_conversation_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_cog_conversation_one_01",
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
		name = "pdr_cog_conversation_one_01",
		response = "pdr_cog_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_one_01"
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
		name = "pwe_cog_conversation_one_02",
		response = "pwe_cog_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_one_01"
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
		name = "pdr_cog_conversation_one_02",
		response = "pdr_cog_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_one_02"
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
		name = "pwe_cog_conversation_two_01",
		response = "pwe_cog_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwe_cog_conversation_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_cog_conversation_two_01",
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
		name = "pdr_cog_conversation_two_01",
		response = "pdr_cog_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_two_01"
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
		name = "pwe_cog_conversation_two_02",
		response = "pwe_cog_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_two_01"
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
		name = "pdr_cog_conversation_two_02",
		response = "pdr_cog_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_two_02"
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
		name = "pdr_cog_conversation_three_01",
		response = "pdr_cog_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer"
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"pwe_cog_conversation_two_01",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"pdr_cog_conversation_three_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_cog_conversation_three_01",
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
		name = "pwe_cog_conversation_three_01",
		response = "pwe_cog_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_three_01"
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
		name = "pdr_cog_conversation_three_02",
		response = "pdr_cog_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_three_01"
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
		name = "pwe_cog_conversation_three_02",
		response = "pwe_cog_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_three_02"
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
		name = "pdr_cog_conversation_three_03",
		response = "pdr_cog_conversation_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_three_02"
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
		name = "pdr_cog_conversation_four_01",
		response = "pdr_cog_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
				0
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_engineer"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"pdr_cog_conversation_four_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_cog_conversation_four_01",
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
		name = "pwe_cog_conversation_four_01",
		response = "pwe_cog_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_four_01"
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
		name = "pdr_cog_conversation_four_02",
		response = "pdr_cog_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_four_01"
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
		name = "pwe_cog_conversation_four_02",
		response = "pwe_cog_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_four_02"
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
		name = "pwe_cog_conversation_five_01",
		response = "pwe_cog_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwe_cog_conversation_five_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_cog_conversation_five_01",
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
		name = "pdr_cog_conversation_five_01",
		response = "pdr_cog_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_five_01"
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
		name = "pwe_cog_conversation_five_02",
		response = "pwe_cog_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_five_01"
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
		name = "pdr_cog_conversation_five_02",
		response = "pdr_cog_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_five_02"
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
		name = "pwe_cog_conversation_six_01",
		response = "pwe_cog_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwe_cog_conversation_six_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_cog_conversation_six_01",
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
		name = "pdr_cog_conversation_six_01",
		response = "pdr_cog_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_six_01"
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
		name = "pwe_cog_conversation_six_02",
		response = "pwe_cog_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_six_01"
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
		name = "pdr_cog_conversation_six_02",
		response = "pdr_cog_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_six_02"
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
		name = "pwe_cog_conversation_six_03",
		response = "pwe_cog_conversation_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_six_02"
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
		name = "pdr_cog_conversation_six_03",
		response = "pdr_cog_conversation_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_cog_conversation_six_03"
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
		name = "pwe_cog_conversation_six_04",
		response = "pwe_cog_conversation_six_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_six_03"
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
		name = "pbw_cog_conversation_seven_01",
		response = "pbw_cog_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pbw_cog_conversation_seven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_seven_01",
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
		name = "pdr_cog_conversation_seven_01",
		response = "pdr_cog_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_seven_01"
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
		name = "pbw_cog_conversation_seven_02",
		response = "pbw_cog_conversation_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_seven_01"
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
		name = "pdr_cog_conversation_seven_02",
		response = "pdr_cog_conversation_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_seven_02"
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
		name = "pbw_cog_conversation_eight_01",
		response = "pbw_cog_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pbw_cog_conversation_eight_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_eight_01",
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
		name = "pdr_cog_conversation_eight_01",
		response = "pdr_cog_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_eight_01"
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
		name = "pbw_cog_conversation_eight_02",
		response = "pbw_cog_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_eight_01"
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
		name = "pdr_cog_conversation_eight_02",
		response = "pdr_cog_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_eight_02"
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
		name = "pbw_cog_conversation_nine_01",
		response = "pbw_cog_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pbw_cog_conversation_nine_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_nine_01",
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
		name = "pdr_cog_conversation_nine_01",
		response = "pdr_cog_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_nine_01"
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
		name = "pbw_cog_conversation_nine_02",
		response = "pbw_cog_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_nine_01"
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
		name = "pdr_cog_conversation_nine_02",
		response = "pdr_cog_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_nine_02"
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
		name = "pbw_cog_conversation_ten_01",
		response = "pbw_cog_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"pbw_cog_conversation_ten_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_ten_01",
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
		name = "pdr_cog_conversation_ten_01",
		response = "pdr_cog_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_ten_01"
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
		name = "pbw_cog_conversation_ten_02",
		response = "pbw_cog_conversation_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_ten_01"
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
		name = "pdr_cog_conversation_ten_02",
		response = "pdr_cog_conversation_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_ten_02"
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
		name = "pbw_cog_conversation_eleven_01",
		response = "pbw_cog_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pbw_cog_conversation_eleven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_eleven_01",
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
		name = "pdr_cog_conversation_eleven_01",
		response = "pdr_cog_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_eleven_01"
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
		name = "pbw_cog_conversation_eleven_02",
		response = "pbw_cog_conversation_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_eleven_01"
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
		name = "pdr_cog_conversation_eleven_02",
		response = "pdr_cog_conversation_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_eleven_02"
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
		name = "pbw_cog_conversation_twelve_01",
		response = "pbw_cog_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pbw_cog_conversation_twelve_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_cog_conversation_twelve_01",
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
		name = "pdr_cog_conversation_twelve_01",
		response = "pdr_cog_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_twelve_01"
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
		name = "pbw_cog_conversation_twelve_02",
		response = "pbw_cog_conversation_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twelve_01"
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
		name = "pdr_cog_conversation_twelve_02",
		response = "pdr_cog_conversation_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_twelve_02"
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
		name = "pes_cog_conversation_thirteen_01",
		response = "pes_cog_conversation_thirteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pes_cog_conversation_thirteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_thirteen_01",
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
		name = "pdr_cog_conversation_thirteen_01",
		response = "pdr_cog_conversation_thirteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_thirteen_01"
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
		name = "pes_cog_conversation_thirteen_02",
		response = "pes_cog_conversation_thirteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_thirteen_01"
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
		name = "pdr_cog_conversation_thirteen_02",
		response = "pdr_cog_conversation_thirteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_thirteen_02"
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
		name = "pes_cog_conversation_fourteen_01",
		response = "pes_cog_conversation_fourteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pes_cog_conversation_fourteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_fourteen_01",
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
		name = "pdr_cog_conversation_fourteen_01",
		response = "pdr_cog_conversation_fourteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_fourteen_01"
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
		name = "pes_cog_conversation_fourteen_02",
		response = "pes_cog_conversation_fourteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_fourteen_01"
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
		name = "pdr_cog_conversation_fourteen_02",
		response = "pdr_cog_conversation_fourteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_fourteen_02"
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
		name = "pes_cog_conversation_fifteen_01",
		response = "pes_cog_conversation_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pes_cog_conversation_fifteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_fifteen_01",
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
		name = "pdr_cog_conversation_fifteen_01",
		response = "pdr_cog_conversation_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_fifteen_01"
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
		name = "pes_cog_conversation_fifteen_02",
		response = "pes_cog_conversation_fifteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_fifteen_01"
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
		name = "pdr_cog_conversation_fifteen_02",
		response = "pdr_cog_conversation_fifteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_fifteen_02"
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
		name = "pes_cog_conversation_sixteen_01",
		response = "pes_cog_conversation_sixteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pes_cog_conversation_sixteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_sixteen_01",
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
		name = "pdr_cog_conversation_sixteen_01",
		response = "pdr_cog_conversation_sixteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_sixteen_01"
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
		name = "pes_cog_conversation_sixteen_02",
		response = "pes_cog_conversation_sixteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_sixteen_01"
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
		name = "pdr_cog_conversation_sixteen_02",
		response = "pdr_cog_conversation_sixteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_sixteen_02"
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
		name = "pes_cog_conversation_seventeen_01",
		response = "pes_cog_conversation_seventeen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pes_cog_conversation_seventeen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_seventeen_01",
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
		name = "pdr_cog_conversation_seventeen_01",
		response = "pdr_cog_conversation_seventeen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_seventeen_01"
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
		name = "pes_cog_conversation_seventeen_02",
		response = "pes_cog_conversation_seventeen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_seventeen_01"
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
		name = "pwh_cog_conversation_nineteen_01",
		response = "pwh_cog_conversation_nineteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwh_cog_conversation_nineteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_nineteen_01",
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
		name = "pdr_cog_conversation_nineteen_01",
		response = "pdr_cog_conversation_nineteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_nineteen_01"
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
		name = "pwh_cog_conversation_nineteen_02",
		response = "pwh_cog_conversation_nineteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_nineteen_01"
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
		name = "pdr_cog_conversation_nineteen_02",
		response = "pdr_cog_conversation_nineteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_nineteen_02"
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
		name = "pwh_cog_conversation_twenty_01",
		response = "pwh_cog_conversation_twenty_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwh_cog_conversation_twenty_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_twenty_01",
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
		name = "pdr_cog_conversation_twenty_01",
		response = "pdr_cog_conversation_twenty_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_twenty_01"
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
		name = "pwh_cog_conversation_twenty_02",
		response = "pwh_cog_conversation_twenty_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twenty_01"
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
		name = "pdr_cog_conversation_twenty_02",
		response = "pdr_cog_conversation_twenty_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_twenty_02"
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
		name = "pwh_cog_conversation_twenty_03",
		response = "pwh_cog_conversation_twenty_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twenty_02"
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
		name = "pdr_cog_conversation_twenty_03",
		response = "pdr_cog_conversation_twenty_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_twenty_03"
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
		name = "pwh_cog_conversation_twentyone_01",
		response = "pwh_cog_conversation_twentyone_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwh_cog_conversation_twentyone_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_twentyone_01",
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
		name = "pdr_cog_conversation_twentyone_01",
		response = "pdr_cog_conversation_twentyone_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_twentyone_01"
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
		name = "pwh_cog_conversation_twentyone_02",
		response = "pwh_cog_conversation_twentyone_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twentyone_01"
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
		name = "pdr_cog_conversation_twentyone_02",
		response = "pdr_cog_conversation_twentyone_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_twentyone_02"
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
		name = "pes_cog_conversation_eighteen_01",
		response = "pes_cog_conversation_eighteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pes_cog_conversation_eighteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_cog_conversation_eighteen_01",
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
		name = "pdr_cog_conversation_eighteen_01",
		response = "pdr_cog_conversation_eighteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_eighteen_01"
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
		name = "pes_cog_conversation_eighteen_02",
		response = "pes_cog_conversation_eighteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_eighteen_01"
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
		name = "pdr_cog_conversation_eighteen_02",
		response = "pdr_cog_conversation_eighteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_eighteen_02"
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
		name = "pwh_cog_conversation_eighteen_03_optional",
		response = "pwh_cog_conversation_eighteen_03_optional",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_eighteen_02"
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
		name = "pwh_cog_conversation_twentytwo_01",
		response = "pwh_cog_conversation_twentytwo_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwh_cog_conversation_twentytwo_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_twentytwo_01",
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
		name = "pdr_cog_conversation_twentytwo_01",
		response = "pdr_cog_conversation_twentytwo_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_twentytwo_01"
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
		name = "pwh_cog_conversation_twentytwo_02",
		response = "pwh_cog_conversation_twentytwo_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twentytwo_01"
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
		name = "pdr_cog_conversation_twentytwo_02",
		response = "pdr_cog_conversation_twentytwo_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_twentytwo_02"
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
		name = "pwh_cog_conversation_twentythree_01",
		response = "pwh_cog_conversation_twentythree_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwh_cog_conversation_twentythree_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_twentythree_01",
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
		name = "pdr_cog_conversation_twentythree_02",
		response = "pdr_cog_conversation_twentythree_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_twentythree_01"
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
		name = "pwh_cog_conversation_twentythree_03",
		response = "pwh_cog_conversation_twentythree_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twentythree_02"
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
		name = "pdr_cog_conversation_twentythree_04",
		response = "pdr_cog_conversation_twentythree_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_twentythree_03"
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
		name = "pwh_cog_conversation_twentyfour_01",
		response = "pwh_cog_conversation_twentyfour_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwh_cog_conversation_twentyfour_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_cog_conversation_twentyfour_01",
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
		name = "pdr_cog_conversation_twentyfour_02",
		response = "pdr_cog_conversation_twentyfour_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_twentyfour_01"
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
		name = "pwh_cog_conversation_twentyfour_03",
		response = "pwh_cog_conversation_twentyfour_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twentyfour_02"
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
		name = "pdr_cog_conversation_twentyfour_04",
		response = "pdr_cog_conversation_twentyfour_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_cog_conversation_twentyfour_03"
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
		name = "pwh_whisper_conversation_twelve_01",
		response = "pwh_whisper_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pbw_whisper_conversation_twelve_02_1",
		response = "pbw_whisper_conversation_twelve_02_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_whisper_conversation_twelve_01"
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
		name = "pwh_whisper_conversation_twelve_03_1",
		response = "pwh_whisper_conversation_twelve_03_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_whisper_conversation_twelve_02"
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
		name = "pwh_whisper_conversation_twelve_01_a",
		response = "pwh_whisper_conversation_twelve_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
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
				"level_time",
				OP.GT,
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pdr_whisper_conversation_twelve_02_1",
		response = "pdr_whisper_conversation_twelve_02_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_whisper_conversation_twelve_01"
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
		name = "pwh_whisper_conversation_twelve_03_2",
		response = "pwh_whisper_conversation_twelve_03_2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_whisper_conversation_twelve_02"
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
		name = "pwh_whisper_conversation_twelve_01_b",
		response = "pwh_whisper_conversation_twelve_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwe_whisper_conversation_twelve_02_1",
		response = "pwe_whisper_conversation_twelve_02_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_whisper_conversation_twelve_01"
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
		name = "pwh_whisper_conversation_twelve_03_3",
		response = "pwh_whisper_conversation_twelve_03_3",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_whisper_conversation_twelve_02"
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
		name = "pwh_whisper_conversation_twelve_01_c",
		response = "pwh_whisper_conversation_twelve_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pes_whisper_conversation_twelve_02_1",
		response = "pes_whisper_conversation_twelve_02_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_whisper_conversation_twelve_01"
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
		name = "pwh_whisper_conversation_twelve_03_4",
		response = "pwh_whisper_conversation_twelve_03_4",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_whisper_conversation_twelve_02"
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
		name = "pbw_whisper_conversation_twelve_01",
		response = "pbw_whisper_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwh_whisper_conversation_twelve_02_1",
		response = "pwh_whisper_conversation_twelve_02_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_whisper_conversation_twelve_01"
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
		name = "pbw_whisper_conversation_twelve_03_1",
		response = "pbw_whisper_conversation_twelve_03_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_whisper_conversation_twelve_02"
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
		name = "pbw_whisper_conversation_twelve_01_a",
		response = "pbw_whisper_conversation_twelve_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
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
				"level_time",
				OP.GT,
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pdr_whisper_conversation_twelve_02_2",
		response = "pdr_whisper_conversation_twelve_02_2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_whisper_conversation_twelve_01"
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
		name = "pbw_whisper_conversation_twelve_03_2",
		response = "pbw_whisper_conversation_twelve_03_2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_whisper_conversation_twelve_02"
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
		name = "pbw_whisper_conversation_twelve_01_b",
		response = "pbw_whisper_conversation_twelve_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwe_whisper_conversation_twelve_02_2",
		response = "pwe_whisper_conversation_twelve_02_2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_whisper_conversation_twelve_01"
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
		name = "pbw_whisper_conversation_twelve_03_3",
		response = "pbw_whisper_conversation_twelve_03_3",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_whisper_conversation_twelve_02"
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
		name = "pbw_whisper_conversation_twelve_01_c",
		response = "pbw_whisper_conversation_twelve_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pes_whisper_conversation_twelve_02_2",
		response = "pes_whisper_conversation_twelve_02_2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_whisper_conversation_twelve_01"
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
		name = "pbw_whisper_conversation_twelve_03_4",
		response = "pbw_whisper_conversation_twelve_03_4",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_whisper_conversation_twelve_02"
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
		name = "pdr_whisper_conversation_twelve_01",
		response = "pdr_whisper_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
				1
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwh_whisper_conversation_twelve_02_2",
		response = "pwh_whisper_conversation_twelve_02_2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_whisper_conversation_twelve_01"
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
		name = "pdr_whisper_conversation_twelve_03_1",
		response = "pdr_whisper_conversation_twelve_03_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_whisper_conversation_twelve_02"
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
		name = "pdr_whisper_conversation_twelve_01_a",
		response = "pdr_whisper_conversation_twelve_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pbw_whisper_conversation_twelve_02_2",
		response = "pbw_whisper_conversation_twelve_02_2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_whisper_conversation_twelve_01"
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
		name = "pdr_whisper_conversation_twelve_03_2",
		response = "pdr_whisper_conversation_twelve_03_2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_whisper_conversation_twelve_02"
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
		name = "pdr_whisper_conversation_twelve_01_b",
		response = "pdr_whisper_conversation_twelve_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwe_whisper_conversation_twelve_02_3",
		response = "pwe_whisper_conversation_twelve_02_3",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_whisper_conversation_twelve_01"
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
		name = "pdr_whisper_conversation_twelve_03_3",
		response = "pdr_whisper_conversation_twelve_03_3",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_whisper_conversation_twelve_02"
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
		name = "pdr_whisper_conversation_twelve_01_c",
		response = "pdr_whisper_conversation_twelve_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pes_whisper_conversation_twelve_02_3",
		response = "pes_whisper_conversation_twelve_02_3",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_whisper_conversation_twelve_01"
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
		name = "pdr_whisper_conversation_twelve_03_4",
		response = "pdr_whisper_conversation_twelve_03_4",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_whisper_conversation_twelve_02"
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
		name = "pwe_whisper_conversation_twelve_01",
		response = "pwe_whisper_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				1
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwh_whisper_conversation_twelve_02_3",
		response = "pwh_whisper_conversation_twelve_02_3",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_whisper_conversation_twelve_01"
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
		name = "pwe_whisper_conversation_twelve_03_1",
		response = "pwe_whisper_conversation_twelve_03_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_whisper_conversation_twelve_02"
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
		name = "pwe_whisper_conversation_twelve_01_a",
		response = "pwe_whisper_conversation_twelve_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pbw_whisper_conversation_twelve_02_3",
		response = "pbw_whisper_conversation_twelve_02_3",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_whisper_conversation_twelve_01"
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
		name = "pwe_whisper_conversation_twelve_03_2",
		response = "pwe_whisper_conversation_twelve_03_2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_whisper_conversation_twelve_02"
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
		name = "pwe_whisper_conversation_twelve_01_b",
		response = "pwe_whisper_conversation_twelve_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
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
				"level_time",
				OP.GT,
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pdr_whisper_conversation_twelve_02_3",
		response = "pdr_whisper_conversation_twelve_02_3",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_whisper_conversation_twelve_01"
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
		name = "pwe_whisper_conversation_twelve_03_3",
		response = "pwe_whisper_conversation_twelve_03_3",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_whisper_conversation_twelve_02"
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
		name = "pwe_whisper_conversation_twelve_01_c",
		response = "pwe_whisper_conversation_twelve_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pes_whisper_conversation_twelve_02_4",
		response = "pes_whisper_conversation_twelve_02_4",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_whisper_conversation_twelve_01"
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
		name = "pwe_whisper_conversation_twelve_03_4",
		response = "pwe_whisper_conversation_twelve_03_4",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_whisper_conversation_twelve_02"
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
		name = "pes_whisper_conversation_twelve_01",
		response = "pes_whisper_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
				1
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwh_whisper_conversation_twelve_02_4",
		response = "pwh_whisper_conversation_twelve_02_4",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_whisper_conversation_twelve_01"
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
		name = "pes_whisper_conversation_twelve_03_1",
		response = "pes_whisper_conversation_twelve_03_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_whisper_conversation_twelve_02"
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
		name = "pes_whisper_conversation_twelve_01_a",
		response = "pes_whisper_conversation_twelve_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pbw_whisper_conversation_twelve_02_4",
		response = "pbw_whisper_conversation_twelve_02_4",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_whisper_conversation_twelve_01"
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
		name = "pes_whisper_conversation_twelve_03_2",
		response = "pes_whisper_conversation_twelve_03_2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_whisper_conversation_twelve_02"
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
		name = "pes_whisper_conversation_twelve_01_b",
		response = "pes_whisper_conversation_twelve_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
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
				"level_time",
				OP.GT,
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pdr_whisper_conversation_twelve_02_4",
		response = "pdr_whisper_conversation_twelve_02_4",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_whisper_conversation_twelve_01"
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
		name = "pes_whisper_conversation_twelve_03_3",
		response = "pes_whisper_conversation_twelve_03_3",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_whisper_conversation_twelve_02"
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
		name = "pes_whisper_conversation_twelve_01_c",
		response = "pes_whisper_conversation_twelve_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
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
				2400
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"penny_epilogue",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"penny_epilogue",
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
		name = "pwe_whisper_conversation_twelve_02_4",
		response = "pwe_whisper_conversation_twelve_02_4",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_whisper_conversation_twelve_01"
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
		name = "pes_whisper_conversation_twelve_03_4",
		response = "pes_whisper_conversation_twelve_03_4",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_whisper_conversation_twelve_02"
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
		name = "nik_whispers_conversation_one_01",
		response = "nik_whispers_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversations"
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				3600
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_whispers_conversation_one_01",
		name = "pwh_whispers_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversation_one_01_done"
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
			}
		}
	})
	define_rule({
		name = "nik_whispers_conversation_two_01",
		response = "nik_whispers_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversations"
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
				3600
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_whispers_conversation_two_01",
		name = "pbw_whispers_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversation_two_01_done"
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
			}
		}
	})
	define_rule({
		name = "nik_whispers_conversation_three_01",
		response = "nik_whispers_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversations"
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				3600
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_whispers_conversation_three_01",
		name = "pdr_whispers_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversation_three_01_done"
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
			}
		}
	})
	define_rule({
		name = "nik_whispers_conversation_four_01",
		response = "nik_whispers_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversations"
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
				3600
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_whispers_conversation_four_01",
		name = "pwe_whispers_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversation_four_01_done"
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
			}
		}
	})
	define_rule({
		name = "nik_whispers_conversation_five_01",
		response = "nik_whispers_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversations"
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
				3600
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_whispers_conversation_five_01",
		name = "pes_whispers_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_whispers_conversation_five_01_done"
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
			}
		}
	})
	define_rule({
		name = "nfl_whisper_conversation_six_01",
		response = "nfl_whisper_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_six_01"
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nfl_whisper_conversation_six_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nfl_whisper_conversation_six_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_whisper_conversation_six_01",
		name = "pwh_whisper_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_six_01_done"
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
			}
		}
	})
	define_rule({
		name = "nfl_whisper_conversation_seven_01",
		response = "nfl_whisper_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_six_01"
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
				0
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0
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
				0
			},
			{
				"user_memory",
				"nfl_whisper_conversation_seven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nfl_whisper_conversation_seven_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_whisper_conversation_seven_01",
		name = "pbw_whisper_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_whisper_conversation_seven_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "nfl_whisper_conversation_eight_01",
		response = "nfl_whisper_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_eight_01"
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"nfl_whisper_conversation_eight_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nfl_whisper_conversation_eight_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_whisper_conversation_eight_01",
		name = "pdr_whisper_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_whisper_conversation_eight_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		name = "nfl_whisper_conversation_nine_01",
		response = "nfl_whisper_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_nine_01"
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"nfl_whisper_conversation_nine_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nfl_whisper_conversation_nine_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_whisper_conversation_nine_01",
		name = "pwe_whisper_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_whisper_conversation_nine_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "nfl_whisper_conversation_ten_01",
		response = "nfl_whisper_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_whisper_conversation_ten_01"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"nfl_whisper_conversation_ten_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nfl_whisper_conversation_ten_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_whisper_conversation_ten_01",
		name = "pes_whisper_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nfl_whisper_conversation_ten_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		name = "npp_whisper_conversation_eleven_01",
		response = "npp_whisper_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"npp_whisper_conversation_eleven_01"
			},
			{
				"user_memory",
				"npp_whisper_conversation_eleven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"npp_whisper_conversation_eleven_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nik_whisper_conversation_eleven_02",
		name = "nik_whisper_conversation_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"npp_whisper_conversation_eleven_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		name = "nik_comet_conversation_one_01",
		response = "nik_comet_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversations"
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
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_comet_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_comet_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_comet_conversation_one_01",
		name = "pwh_comet_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversation_one_01_done"
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
			}
		}
	})
	define_rule({
		response = "pes_comet_conversation_one_01",
		name = "pes_comet_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_comet_conversation_one_01"
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
			}
		}
	})
	define_rule({
		response = "pwh_comet_conversation_one_02",
		name = "pwh_comet_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_comet_conversation_one_01"
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
			}
		}
	})
	define_rule({
		name = "nik_comet_conversation_two_01",
		response = "nik_comet_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversations"
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
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_comet_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_comet_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_comet_conversation_two_01",
		name = "pbw_comet_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversation_two_01_done"
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
			}
		}
	})
	define_rule({
		response = "pwh_comet_conversation_two_01",
		name = "pwh_comet_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_comet_conversation_two_01"
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
			}
		}
	})
	define_rule({
		response = "pbw_comet_conversation_two_02",
		name = "pbw_comet_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_comet_conversation_two_01"
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
			}
		}
	})
	define_rule({
		name = "nik_comet_conversation_three_01",
		response = "nik_comet_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversations"
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
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_comet_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_comet_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_comet_conversation_three_01",
		name = "pdr_comet_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversation_three_01_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_comet_conversation_three_01",
		name = "pwe_comet_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_comet_conversation_three_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_comet_conversation_three_02",
		name = "pdr_comet_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_comet_conversation_three_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		name = "nik_comet_conversation_four_01",
		response = "nik_comet_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversations"
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
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_comet_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_comet_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_comet_conversation_four_01",
		name = "pwe_comet_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversation_four_01_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pbw__comet_conversation_four_01",
		name = "pbw__comet_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_comet_conversation_four_01"
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
			}
		}
	})
	define_rule({
		response = "pwe_comet_conversation_four_02",
		name = "pwe_comet_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw__comet_conversation_four_01"
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
			}
		}
	})
	define_rule({
		name = "nik_comet_conversation_five_01",
		response = "nik_comet_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversations"
			},
			{
				"global_context",
				"empire_soldier",
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
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_comet_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_comet_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_comet_conversation_five_01",
		name = "pes_comet_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_comet_conversation_five_01_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pbw_comet_conversation_five_01",
		name = "pbw_comet_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_comet_conversation_five_01"
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
			}
		}
	})
	define_rule({
		response = "pes_comet_conversation_five_02",
		name = "pes_comet_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_comet_conversation_five_01"
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
			}
		}
	})
	define_rule({
		name = "pwh_comet_conversation_six_01",
		response = "pwh_comet_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwh_comet_conversation_six_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_comet_conversation_six_01",
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
		name = "pbw_comet_conversation_six_01",
		response = "pbw_comet_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_comet_conversation_six_01"
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
		name = "pwh_comet_conversation_six_02",
		response = "pwh_comet_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_comet_conversation_six_01"
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
		name = "pbw_comet_conversation_six_02",
		response = "pbw_comet_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_comet_conversation_six_02"
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
		name = "pwh_comet_conversation_seven_01",
		response = "pwh_comet_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
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
				60
			},
			{
				"faction_memory",
				"pwh_comet_conversation_seven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_comet_conversation_seven_01",
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
		name = "pdr_comet_conversation_seven_01",
		response = "pdr_comet_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_comet_conversation_seven_01"
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
		name = "pwh_comet_conversation_seven_02",
		response = "pwh_comet_conversation_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_comet_conversation_seven_01"
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
		name = "pdr_comet_conversation_seven_02",
		response = "pdr_comet_conversation_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_comet_conversation_seven_02"
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
		name = "npp_comet_conversation_ten_01",
		response = "npp_comet_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"npp_comet_conversation_ten_01"
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
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"npp_comet_conversation_ten_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"npp_comet_conversation_ten_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_comet_conversation_ten_01",
		response = "pes_comet_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"npp_comet_conversation_ten_01"
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
		name = "pwh_comet_conversation_ten_01",
		response = "pwh_comet_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_comet_conversation_ten_01"
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
		name = "pes_comet_conversation_ten_02",
		response = "pes_comet_conversation_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_comet_conversation_ten_01"
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
		name = "pbw_comet_conversation_ten_01",
		response = "pbw_comet_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_comet_conversation_ten_02"
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
		name = "pwh_comet_conversation_eight_01",
		response = "pwh_comet_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwh_comet_conversation_eight_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_comet_conversation_eight_01",
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
		name = "pwe_comet_conversation_eight_01",
		response = "pwe_comet_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_comet_conversation_eight_01"
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
		name = "pwh_comet_conversation_eight_02",
		response = "pwh_comet_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_comet_conversation_eight_01"
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
		name = "pwe_comet_conversation_eight_02",
		response = "pwe_comet_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_comet_conversation_eight_02"
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
		name = "pwh_comet_conversation_nine_01",
		response = "pwh_comet_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"user_context",
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pwh_comet_conversation_nine_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_comet_conversation_nine_01",
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
		name = "pes_comet_conversation_nine_01",
		response = "pes_comet_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_comet_conversation_nine_01"
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
		name = "pwh_comet_conversation_nine_02",
		response = "pwh_comet_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_comet_conversation_nine_01"
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
		name = "pes_comet_conversation_nine_02",
		response = "pes_comet_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_comet_conversation_nine_02"
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
		name = "pwh_comet_conversation_nine_03",
		response = "pwh_comet_conversation_nine_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_comet_conversation_nine_02"
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
		name = "pdr_cog_conversation_thirtythree_01",
		response = "pdr_cog_conversation_thirtythree_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"friends_close",
				OP.GT,
				0
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
				60
			},
			{
				"faction_memory",
				"pdr_cog_conversation_thirtythree_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_cog_conversation_thirtythree_01",
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
		name = "pes_cog_conversation_thirtythree_01",
		response = "pes_cog_conversation_thirtythree_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_thirtythree_01"
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
		name = "nik_cog_conversation_twentyfive_01",
		response = "nik_cog_conversation_twentyfive_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_cog_conversations"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"global_context",
				"dr_engineer",
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
				"nik_cog_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_cog_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_cog_conversation_twentyfive_01",
		name = "pdr_cog_conversation_twentyfive_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_cog_conversation_twentyfive_01"
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
		response = "pes_cog_conversation_twentyfive_01",
		name = "pes_cog_conversation_twentyfive_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twentyfive_01"
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
		response = "pdr_cog_conversation_twentyfive_02",
		name = "pdr_cog_conversation_twentyfive_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_twentyfive_01"
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
		response = "pes_cog_conversation_twentyfive_02",
		name = "pes_cog_conversation_twentyfive_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twentyfive_02"
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
		name = "nik_cog_conversation_twentysix_01",
		response = "nik_cog_conversation_twentysix_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_cog_conversations"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"global_context",
				"dr_engineer",
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
				"nik_cog_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_cog_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_cog_conversation_twentysix_01",
		name = "pdr_cog_conversation_twentysix_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_cog_conversation_twentysix_01"
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
		response = "pes_cog_conversation_twentysix_01",
		name = "pes_cog_conversation_twentysix_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twentysix_01"
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
		response = "pdr_cog_conversation_twentysix_02",
		name = "pdr_cog_conversation_twentysix_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_cog_conversation_twentysix_01"
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
		response = "pes_cog_conversation_twentysix_02",
		name = "pes_cog_conversation_twentysix_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twentysix_02"
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
		name = "nik_cog_conversation_twentyseven_01",
		response = "nik_cog_conversation_twentyseven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_cog_conversations"
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"global_context",
				"dr_engineer",
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
				"nik_cog_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_cog_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_cog_conversation_twentyseven_01",
		name = "pdr_cog_conversation_twentyseven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_cog_conversation_twentyseven_01"
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
		response = "pbw_cog_conversation_twentyseven_01",
		name = "pbw_cog_conversation_twentyseven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_cog_conversation_twentyseven_01"
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
		response = "pdr_cog_conversation_twentyseven_02",
		name = "pdr_cog_conversation_twentyseven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_cog_conversation_twentyseven_01"
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
		name = "nik_cog_conversation_twentyeight_01",
		response = "nik_cog_conversation_twentyeight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_cog_conversations"
			},
			{
				"global_context",
				"dr_engineer",
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
				"nik_cog_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_cog_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_cog_conversation_twentyeight_01",
		name = "pdr_cog_conversation_twentyeight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_cog_conversation_twentyeight_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	add_dialogues({
		pes_cog_conversation_fourteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_fourteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_fourteen_02"
			},
			sound_events_duration = {
				[1.0] = 4.6543750762939
			}
		},
		pwh_whisper_conversation_twelve_03_3 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 0.43252083659172
			}
		},
		pwe_whisper_conversation_twelve_02_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.4909167289734
			}
		},
		pwh_whispers_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whispers_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_whispers_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 3.7157707214356
			}
		},
		pbw_comet_conversation_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_comet_conversation_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_comet_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 3.9485416412353
			}
		},
		pbw_whisper_conversation_twelve_02_2 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 3.8890209197998
			}
		},
		pbw_cog_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 6.4061040878296
			}
		},
		pbw__comet_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw__comet_conversation_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw__comet_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 3.0111041069031
			}
		},
		pwh_whisper_conversation_twelve_01_a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 3.2293748855591
			}
		},
		pdr_cog_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 14.887145996094
			}
		},
		pes_whisper_conversation_twelve_02_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 1.8397916555405
			}
		},
		pwe_cog_conversation_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_six_02"
			},
			sound_events_duration = {
				[1.0] = 2.6673958301544
			}
		},
		pbw_cog_conversation_ten_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_ten_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_ten_02"
			},
			sound_events_duration = {
				[1.0] = 6.5989165306091
			}
		},
		pbw_whisper_conversation_twelve_02_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 3.8890209197998
			}
		},
		pdr_whisper_conversation_twelve_02_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.46129155159
			}
		},
		pes_cog_conversation_sixteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_sixteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_sixteen_01"
			},
			sound_events_duration = {
				[1.0] = 4.9342918395996
			}
		},
		pdr_cog_conversation_eleven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_eleven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eleven_01"
			},
			sound_events_duration = {
				[1.0] = 6.7773542404175
			}
		},
		pbw_cog_conversation_seven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_seven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_seven_02"
			},
			sound_events_duration = {
				[1.0] = 4.0853543281555
			}
		},
		pdr_cog_conversation_twentyeight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentyeight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyeight_01"
			},
			sound_events_duration = {
				[1.0] = 4.0808334350586
			}
		},
		pwh_cog_conversation_twenty_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_twenty_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twenty_02"
			},
			sound_events_duration = {
				[1.0] = 1.3060208559036
			}
		},
		pdr_whisper_conversation_twelve_01_a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 4.2766456604004
			}
		},
		nfl_whisper_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_whisper_conversation_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_whisper_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 5.6835832595825
			}
		},
		pes_cog_conversation_fifteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_fifteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_fifteen_02"
			},
			sound_events_duration = {
				[1.0] = 5.6447081565857
			}
		},
		nik_cog_conversation_twentyeight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_cog_conversation_twentyeight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_cog_conversation_twentyeight_01"
			},
			sound_events_duration = {
				[1.0] = 5.5999999046326
			}
		},
		pes_cog_conversation_twentysix_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_twentysix_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_twentysix_01"
			},
			sound_events_duration = {
				[1.0] = 2.2315833568573
			}
		},
		pdr_cog_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 6.116729259491
			}
		},
		pdr_cog_conversation_twentyseven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentyseven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyseven_02"
			},
			sound_events_duration = {
				[1.0] = 5.8883123397827
			}
		},
		pdr_cog_conversation_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 2.8353958129883
			}
		},
		pes_cog_conversation_fifteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_fifteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_fifteen_01"
			},
			sound_events_duration = {
				[1.0] = 4.8191456794739
			}
		},
		pdr_cog_conversation_twentyseven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentyseven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyseven_01"
			},
			sound_events_duration = {
				[1.0] = 5
			}
		},
		pdr_cog_conversation_twenty_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twenty_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twenty_03"
			},
			sound_events_duration = {
				[1.0] = 3.5379583835602
			}
		},
		pwe_comet_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_comet_conversation_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_comet_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 2.2755417823791
			}
		},
		pdr_cog_conversation_twenty_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twenty_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twenty_01"
			},
			sound_events_duration = {
				[1.0] = 3.8791666030884
			}
		},
		pwe_cog_conversation_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 3.6344375610352
			}
		},
		pdr_cog_conversation_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eight_01"
			},
			sound_events_duration = {
				[1.0] = 3.8523540496826
			}
		},
		nik_cog_conversation_twentyseven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_cog_conversation_twentyseven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_cog_conversation_twentyseven_01"
			},
			sound_events_duration = {
				[1.0] = 4.691771030426
			}
		},
		pes_comet_conversation_nine_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_comet_conversation_nine_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_comet_conversation_nine_02"
			},
			sound_events_duration = {
				[1.0] = 6.9665832519531
			}
		},
		pes_cog_conversation_twentysix_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_twentysix_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_twentysix_02"
			},
			sound_events_duration = {
				[1.0] = 0.73054164648056
			}
		},
		pwh_comet_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 11.811645507813
			}
		},
		pdr_cog_conversation_twentysix_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentysix_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentysix_02"
			},
			sound_events_duration = {
				[1.0] = 4.5098123550415
			}
		},
		pes_whisper_conversation_twelve_02_3 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 1.8397916555405
			}
		},
		pwh_cog_conversation_twentythree_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_twentythree_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentythree_03"
			},
			sound_events_duration = {
				[1.0] = 5.7148332595825
			}
		},
		pdr_cog_conversation_twelve_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 3.1914999485016
			}
		},
		pdr_whisper_conversation_twelve_02_3 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.46129155159
			}
		},
		nik_cog_conversation_twentysix_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_cog_conversation_twentysix_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_cog_conversation_twentysix_01"
			},
			sound_events_duration = {
				[1.0] = 5.7794375419617
			}
		},
		pes_cog_conversation_twentyfive_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_twentyfive_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_twentyfive_02"
			},
			sound_events_duration = {
				[1.0] = 3.2541875839233
			}
		},
		pdr_cog_conversation_twentyfive_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentyfive_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyfive_02"
			},
			sound_events_duration = {
				[1.0] = 2.8175415992737
			}
		},
		pdr_cog_conversation_twentysix_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentysix_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentysix_01"
			},
			sound_events_duration = {
				[1.0] = 2.2151458263397
			}
		},
		pes_cog_conversation_seventeen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_seventeen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_seventeen_02"
			},
			sound_events_duration = {
				[1.0] = 3.7183542251587
			}
		},
		pbw_cog_conversation_eleven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_eleven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_eleven_01"
			},
			sound_events_duration = {
				[1.0] = 2.5271875858307
			}
		},
		nfl_whisper_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_whisper_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_whisper_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 8.6325836181641
			}
		},
		pbw_whisper_conversation_twelve_01_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 9.0235004425049
			}
		},
		pdr_cog_conversation_twenty_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twenty_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twenty_02"
			},
			sound_events_duration = {
				[1.0] = 3.9562499523163
			}
		},
		pdr_cog_conversation_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_four_02"
			},
			sound_events_duration = {
				[1.0] = 7.6249165534973
			}
		},
		pes_whisper_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 2.5439167022705
			}
		},
		pwh_whisper_conversation_twelve_02_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.7881457805634
			}
		},
		pbw_cog_conversation_eight_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_eight_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_eight_02"
			},
			sound_events_duration = {
				[1.0] = 3.7156040668488
			}
		},
		pdr_comet_conversation_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_comet_conversation_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_comet_conversation_three_02"
			},
			sound_events_duration = {
				[1.0] = 4.929229259491
			}
		},
		pwe_cog_conversation_six_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_six_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_six_04"
			},
			sound_events_duration = {
				[1.0] = 2.020124912262
			}
		},
		pdr_cog_conversation_thirtythree_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_thirtythree_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_thirtythree_01"
			},
			sound_events_duration = {
				[1.0] = 3.1781458854675
			}
		},
		pes_whisper_conversation_twelve_03_4 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.066645860672
			}
		},
		pbw_whisper_conversation_twelve_02_3 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 3.8890209197998
			}
		},
		pwh_comet_conversation_nine_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_nine_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_nine_03"
			},
			sound_events_duration = {
				[1.0] = 3.4854373931885
			}
		},
		nik_comet_conversation_four_01 = {
			override_awareness = "nik_comet_conversation_four_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_comet_conversation_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_comet_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 3.4497916698456
			}
		},
		pwh_comet_conversation_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.701708316803
			}
		},
		pbw_whisper_conversation_twelve_03_4 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 2.4632916450501
			}
		},
		pes_comet_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_comet_conversation_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_comet_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 2.3602707386017
			}
		},
		pwe_cog_conversation_six_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_six_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_six_03"
			},
			sound_events_duration = {
				[1.0] = 2.8377709388733
			}
		},
		pwh_cog_conversation_eighteen_03_optional = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_eighteen_03_optional"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_eighteen_03_optional"
			},
			sound_events_duration = {
				[1.0] = 1.1228541135788
			}
		},
		pbw_cog_conversation_eleven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_eleven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_eleven_02"
			},
			sound_events_duration = {
				[1.0] = 2.3788750171661
			}
		},
		pwh_comet_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 2.694000005722
			}
		},
		pes_whisper_conversation_twelve_03_2 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.066645860672
			}
		},
		pdr_cog_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 4.5415205955505
			}
		},
		pwe_cog_conversation_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_two_02"
			},
			sound_events_duration = {
				[1.0] = 4.0164375305176
			}
		},
		pdr_cog_conversation_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_three_03"
			},
			sound_events_duration = {
				[1.0] = 1.3155416250229
			}
		},
		pwh_comet_conversation_eight_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_eight_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_eight_02"
			},
			sound_events_duration = {
				[1.0] = 3.3627707958221
			}
		},
		pwe_comet_conversation_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_comet_conversation_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_comet_conversation_eight_01"
			},
			sound_events_duration = {
				[1.0] = 6.3860206604004
			}
		},
		pwh_comet_conversation_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_eight_01"
			},
			sound_events_duration = {
				[1.0] = 6.1999998092651
			}
		},
		pdr_comet_conversation_seven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_comet_conversation_seven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_comet_conversation_seven_02"
			},
			sound_events_duration = {
				[1.0] = 6.9253540039063
			}
		},
		nfl_whisper_conversation_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_whisper_conversation_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_whisper_conversation_eight_01"
			},
			sound_events_duration = {
				[1.0] = 5.9257707595825
			}
		},
		pwh_comet_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 4.7637915611267
			}
		},
		pbw_cog_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 2.7225415706634
			}
		},
		pbw_cog_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 6.3131041526794
			}
		},
		pes_comet_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_comet_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_comet_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 2.876312494278
			}
		},
		npp_comet_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "npp_comet_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "npp_comet_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 5.9561457633972
			}
		},
		pbw_comet_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_comet_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_comet_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 1.9469166994095
			}
		},
		pwe_comet_conversation_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_comet_conversation_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_comet_conversation_four_02"
			},
			sound_events_duration = {
				[1.0] = 6.3502292633057
			}
		},
		pdr_cog_conversation_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_two_02"
			},
			sound_events_duration = {
				[1.0] = 3.3457291126251
			}
		},
		pwe_whisper_conversation_twelve_01_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 5.2204375267029
			}
		},
		pes_comet_conversation_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_comet_conversation_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_comet_conversation_five_02"
			},
			sound_events_duration = {
				[1.0] = 2.9530625343323
			}
		},
		pwe_cog_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 1.6539583206177
			}
		},
		nik_comet_conversation_five_01 = {
			override_awareness = "nik_comet_conversation_five_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_comet_conversation_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_comet_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 3.6712708473206
			}
		},
		pwe_whisper_conversation_twelve_01_c = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 5.2204375267029
			}
		},
		pwh_comet_conversation_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_six_02"
			},
			sound_events_duration = {
				[1.0] = 3.0912916660309
			}
		},
		pwh_comet_conversation_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 6.1003956794739
			}
		},
		pbw_comet_conversation_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_comet_conversation_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_comet_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 1.9875832796097
			}
		},
		pdr_whispers_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whispers_conversation_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_whispers_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 4.7386665344238
			}
		},
		pwh_cog_conversation_twentyfour_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_twentyfour_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentyfour_01"
			},
			sound_events_duration = {
				[1.0] = 6.809645652771
			}
		},
		pdr_comet_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_comet_conversation_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_comet_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 9.2746458053589
			}
		},
		pwh_comet_conversation_seven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_seven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_seven_02"
			},
			sound_events_duration = {
				[1.0] = 2.9808542728424
			}
		},
		pwh_comet_conversation_nine_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_nine_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_nine_02"
			},
			sound_events_duration = {
				[1.0] = 3.5392291545868
			}
		},
		nik_whispers_conversation_three_01 = {
			override_awareness = "nik_whispers_conversation_three_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_whispers_conversation_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_whispers_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 5.6573543548584
			}
		},
		pes_cog_conversation_fourteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_fourteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_fourteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.0386877059936
			}
		},
		pdr_cog_conversation_fourteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_fourteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_fourteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.4086456298828
			}
		},
		pbw_cog_conversation_twelve_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.2721042633057
			}
		},
		pdr_cog_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 3.3367290496826
			}
		},
		pwe_comet_conversation_eight_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_comet_conversation_eight_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_comet_conversation_eight_02"
			},
			sound_events_duration = {
				[1.0] = 3.104875087738
			}
		},
		nik_comet_conversation_three_01 = {
			override_awareness = "nik_comet_conversation_three_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_comet_conversation_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_comet_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 3.0081250667572
			}
		},
		pdr_cog_conversation_nine_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_nine_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_nine_02"
			},
			sound_events_duration = {
				[1.0] = 4.8000001907349
			}
		},
		pbw_comet_conversation_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_comet_conversation_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_comet_conversation_two_02"
			},
			sound_events_duration = {
				[1.0] = 0.80383330583572
			}
		},
		pwh_comet_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 4.9106664657593
			}
		},
		nik_whispers_conversation_one_01 = {
			override_awareness = "nik_whispers_conversation_one_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_whispers_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_whispers_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 6.9405207633972
			}
		},
		pbw_whisper_conversation_twelve_03_3 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 2.4632916450501
			}
		},
		pdr_cog_conversation_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_three_02"
			},
			sound_events_duration = {
				[1.0] = 2.0420417785645
			}
		},
		pdr_whisper_conversation_twelve_03_3 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.8102083206177
			}
		},
		pes_whisper_conversation_twelve_03_3 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.066645860672
			}
		},
		pdr_cog_conversation_thirteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_thirteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_thirteen_02"
			},
			sound_events_duration = {
				[1.0] = 3.4449791908264
			}
		},
		npp_whisper_conversation_eleven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "npp_whisper_conversation_eleven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "npp_whisper_conversation_eleven_01"
			},
			sound_events_duration = {
				[1.0] = 10.045770645142
			}
		},
		nik_comet_conversation_two_01 = {
			override_awareness = "nik_comet_conversation_two_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_comet_conversation_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_comet_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 3.5139582157135
			}
		},
		pes_comet_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_comet_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_comet_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 2.5339999198914
			}
		},
		pwe_whisper_conversation_twelve_03_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.4925416707993
			}
		},
		nik_comet_conversation_one_01 = {
			override_awareness = "nik_comet_conversation_one_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_comet_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_comet_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 4.5180206298828
			}
		},
		nik_whisper_conversation_eleven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_whisper_conversation_eleven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "nik_whisper_conversation_eleven_02"
			},
			sound_events_duration = {
				[1.0] = 1.811979174614
			}
		},
		pbw_comet_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_comet_conversation_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_comet_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 5.6779999732971
			}
		},
		pdr_cog_conversation_nineteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_nineteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_nineteen_02"
			},
			sound_events_duration = {
				[1.0] = 3.6843540668488
			}
		},
		pwh_cog_conversation_twentytwo_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_twentytwo_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentytwo_01"
			},
			sound_events_duration = {
				[1.0] = 5.6853957176208
			}
		},
		pwh_comet_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_comet_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_comet_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 4.7072291374206
			}
		},
		pdr_cog_conversation_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_one_02"
			},
			sound_events_duration = {
				[1.0] = 2.5466248989105
			}
		},
		pes_cog_conversation_eighteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_eighteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_eighteen_01"
			},
			sound_events_duration = {
				[1.0] = 4.2832708358765
			}
		},
		pwh_whisper_conversation_twelve_02_4 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.7881457805634
			}
		},
		pdr_whisper_conversation_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_eight_01"
			},
			sound_events_duration = {
				[1.0] = 6.1473331451416
			}
		},
		pdr_cog_conversation_eighteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_eighteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eighteen_01"
			},
			sound_events_duration = {
				[1.0] = 3.9552500247955
			}
		},
		pdr_cog_conversation_fifteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_fifteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_fifteen_01"
			},
			sound_events_duration = {
				[1.0] = 2.3834791183472
			}
		},
		pbw_cog_conversation_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_eight_01"
			},
			sound_events_duration = {
				[1.0] = 3.718291759491
			}
		},
		pdr_cog_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 4.9110832214356
			}
		},
		pdr_cog_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 2.2037498950958
			}
		},
		pdr_cog_conversation_sixteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_sixteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_sixteen_01"
			},
			sound_events_duration = {
				[1.0] = 1.6837500333786
			}
		},
		pdr_cog_conversation_twentythree_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentythree_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentythree_02"
			},
			sound_events_duration = {
				[1.0] = 5.248583316803
			}
		},
		pbw_whisper_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 5.8308749198914
			}
		},
		pwh_whisper_conversation_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 6.5609169006348
			}
		},
		nfl_whisper_conversation_six_01 = {
			override_awareness = "nfl_whisper_conversation_six_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_whisper_conversation_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_whisper_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 5.0436873435974
			}
		},
		pdr_cog_conversation_fourteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_fourteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_fourteen_02"
			},
			sound_events_duration = {
				[1.0] = 4.379958152771
			}
		},
		nik_whispers_conversation_five_01 = {
			override_awareness = "nik_whispers_conversation_five_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_whispers_conversation_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_whispers_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 9.2056665420532
			}
		},
		pwe_whispers_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whispers_conversation_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_whispers_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 2.9549791812897
			}
		},
		pdr_cog_conversation_twentyone_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentyone_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyone_02"
			},
			sound_events_duration = {
				[1.0] = 6.2073335647583
			}
		},
		pwe_cog_conversation_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_five_02"
			},
			sound_events_duration = {
				[1.0] = 9.0612087249756
			}
		},
		nik_whispers_conversation_four_01 = {
			override_awareness = "nik_whispers_conversation_four_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_whispers_conversation_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_whispers_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 5.117645740509
			}
		},
		pes_cog_conversation_thirteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_thirteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_thirteen_02"
			},
			sound_events_duration = {
				[1.0] = 4.5328540802002
			}
		},
		pbw_cog_conversation_nine_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_nine_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_nine_02"
			},
			sound_events_duration = {
				[1.0] = 4.5795831680298
			}
		},
		pes_comet_conversation_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_comet_conversation_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_comet_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 2.6592500209808
			}
		},
		pdr_cog_conversation_sixteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_sixteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_sixteen_02"
			},
			sound_events_duration = {
				[1.0] = 4.7122707366943
			}
		},
		pdr_cog_conversation_twentyone_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentyone_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyone_01"
			},
			sound_events_duration = {
				[1.0] = 6.1236248016357
			}
		},
		pwe_whisper_conversation_twelve_02_4 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.4909167289734
			}
		},
		pes_whisper_conversation_twelve_01_c = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 3.7365000247955
			}
		},
		pdr_whisper_conversation_twelve_02_4 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.46129155159
			}
		},
		pes_whisper_conversation_twelve_01_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 3.7365000247955
			}
		},
		pdr_comet_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_comet_conversation_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_comet_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 4.5940418243408
			}
		},
		pbw_whisper_conversation_twelve_02_4 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 3.8890209197998
			}
		},
		pwh_cog_conversation_twentyone_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_twentyone_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentyone_02"
			},
			sound_events_duration = {
				[1.0] = 3.4999375343323
			}
		},
		pwh_cog_conversation_nineteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_nineteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_nineteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.3496041297913
			}
		},
		pes_whisper_conversation_twelve_01_a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 3.7365000247955
			}
		},
		pbw_whisper_conversation_twelve_03_2 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 2.4632916450501
			}
		},
		pdr_cog_conversation_eleven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_eleven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eleven_02"
			},
			sound_events_duration = {
				[1.0] = 6.8366875648499
			}
		},
		pdr_cog_conversation_fifteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_fifteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_fifteen_02"
			},
			sound_events_duration = {
				[1.0] = 3.6782290935516
			}
		},
		pwh_whisper_conversation_twelve_03_2 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 0.43252083659172
			}
		},
		pdr_whisper_conversation_twelve_01_c = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 4.2766456604004
			}
		},
		pwh_cog_conversation_twentyone_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_twentyone_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentyone_01"
			},
			sound_events_duration = {
				[1.0] = 4.6567707061768
			}
		},
		pes_whisper_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 3.7365000247955
			}
		},
		pwe_whisper_conversation_twelve_03_4 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.4925416707993
			}
		},
		pdr_cog_conversation_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_five_02"
			},
			sound_events_duration = {
				[1.0] = 10.867896080017
			}
		},
		pwh_cog_conversation_twenty_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_twenty_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twenty_03"
			},
			sound_events_duration = {
				[1.0] = 1.3673750162125
			}
		},
		pwe_whisper_conversation_twelve_03_2 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.4925416707993
			}
		},
		pdr_cog_conversation_seven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_seven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_seven_02"
			},
			sound_events_duration = {
				[1.0] = 2.1845207214356
			}
		},
		pbw_comet_conversation_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_comet_conversation_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_comet_conversation_six_02"
			},
			sound_events_duration = {
				[1.0] = 3.1821458339691
			}
		},
		pwh_whisper_conversation_twelve_03_4 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 0.43252083659172
			}
		},
		pwe_whisper_conversation_twelve_03_3 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.4925416707993
			}
		},
		pwe_comet_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_comet_conversation_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_comet_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 5.090416431427
			}
		},
		pwe_cog_conversation_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 3.4807500839233
			}
		},
		pdr_cog_conversation_nineteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_nineteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_nineteen_01"
			},
			sound_events_duration = {
				[1.0] = 6.6889791488647
			}
		},
		pes_whisper_conversation_twelve_02_4 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 1.8397916555405
			}
		},
		pwe_whisper_conversation_twelve_01_a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 5.2204375267029
			}
		},
		pwh_cog_conversation_twenty_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_twenty_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twenty_01"
			},
			sound_events_duration = {
				[1.0] = 5.5222082138061
			}
		},
		pwh_whisper_conversation_twelve_01_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 3.2293748855591
			}
		},
		nfl_whisper_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_whisper_conversation_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_whisper_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 4.2305417060852
			}
		},
		pwh_whisper_conversation_twelve_02_3 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.7881457805634
			}
		},
		pdr_cog_conversation_six_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_six_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_six_03"
			},
			sound_events_duration = {
				[1.0] = 3.6500000953674
			}
		},
		pwe_whisper_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 5.2204375267029
			}
		},
		pdr_cog_conversation_eight_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_eight_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eight_02"
			},
			sound_events_duration = {
				[1.0] = 6.0779581069946
			}
		},
		pes_cog_conversation_sixteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_sixteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_sixteen_02"
			},
			sound_events_duration = {
				[1.0] = 3.3329792022705
			}
		},
		pdr_whisper_conversation_twelve_03_4 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.8102083206177
			}
		},
		pwe_whisper_conversation_twelve_02_3 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.4909167289734
			}
		},
		pdr_whisper_conversation_twelve_01_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 4.2766456604004
			}
		},
		pdr_cog_conversation_eighteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_eighteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eighteen_02"
			},
			sound_events_duration = {
				[1.0] = 5.8000001907349
			}
		},
		pes_cog_conversation_eighteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_eighteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_eighteen_02"
			},
			sound_events_duration = {
				[1.0] = 3.7772707939148
			}
		},
		pdr_whisper_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 4.2766456604004
			}
		},
		pbw_whisper_conversation_twelve_01_c = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 9.0235004425049
			}
		},
		pdr_whisper_conversation_twelve_03_2 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.8102083206177
			}
		},
		pwh_whisper_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 3.2293748855591
			}
		},
		pdr_cog_conversation_seventeen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_seventeen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_seventeen_01"
			},
			sound_events_duration = {
				[1.0] = 4.3484168052673
			}
		},
		pwh_cog_conversation_twentytwo_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_twentytwo_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentytwo_02"
			},
			sound_events_duration = {
				[1.0] = 4.768458366394
			}
		},
		pdr_whisper_conversation_twelve_03_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.8102083206177
			}
		},
		pes_whispers_conversation_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whispers_conversation_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_whispers_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 4.6915416717529
			}
		},
		pwh_cog_conversation_nineteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_nineteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_nineteen_02"
			},
			sound_events_duration = {
				[1.0] = 4.6375832557678
			}
		},
		pwh_whisper_conversation_twelve_02_2 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.7881457805634
			}
		},
		pes_comet_conversation_ten_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_comet_conversation_ten_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_comet_conversation_ten_02"
			},
			sound_events_duration = {
				[1.0] = 2.3201665878296
			}
		},
		pdr_cog_conversation_twentytwo_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentytwo_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentytwo_02"
			},
			sound_events_duration = {
				[1.0] = 3.2482707500458
			}
		},
		pwe_cog_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 5.8594164848328
			}
		},
		pes_whisper_conversation_twelve_02_2 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 1.8397916555405
			}
		},
		pwe_whisper_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 5.8071875572205
			}
		},
		pes_cog_conversation_seventeen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_seventeen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_seventeen_01"
			},
			sound_events_duration = {
				[1.0] = 3.1968333721161
			}
		},
		pdr_cog_conversation_ten_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_ten_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_ten_02"
			},
			sound_events_duration = {
				[1.0] = 3.2525207996368
			}
		},
		pbw_cog_conversation_twentyseven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_twentyseven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_twentyseven_01"
			},
			sound_events_duration = {
				[1.0] = 5.0355625152588
			}
		},
		pwe_whisper_conversation_twelve_02_2 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.4909167289734
			}
		},
		pwh_cog_conversation_twentythree_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_twentythree_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentythree_01"
			},
			sound_events_duration = {
				[1.0] = 6.6789999008179
			}
		},
		pdr_cog_conversation_twentyfour_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentyfour_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyfour_04"
			},
			sound_events_duration = {
				[1.0] = 2.0934791564941
			}
		},
		pwe_cog_conversation_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_three_02"
			},
			sound_events_duration = {
				[1.0] = 2.7198541164398
			}
		},
		pwe_cog_conversation_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_four_02"
			},
			sound_events_duration = {
				[1.0] = 4.8628334999084
			}
		},
		pdr_cog_conversation_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_six_02"
			},
			sound_events_duration = {
				[1.0] = 10.091124534607
			}
		},
		pbw_whisper_conversation_twelve_01_a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 9.0235004425049
			}
		},
		pwe_cog_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 3.7999999523163
			}
		},
		pes_cog_conversation_thirtythree_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_thirtythree_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_thirtythree_01"
			},
			sound_events_duration = {
				[1.0] = 3.709625005722
			}
		},
		pbw_whisper_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 9.0235004425049
			}
		},
		pwh_whisper_conversation_twelve_03_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 0.43252083659172
			}
		},
		pwh_whisper_conversation_twelve_01_c = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 3.2293748855591
			}
		},
		pdr_cog_conversation_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 3.3094582557678
			}
		},
		pwe_cog_conversation_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_one_02"
			},
			sound_events_duration = {
				[1.0] = 2.021666765213
			}
		},
		pdr_cog_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 3.8287498950958
			}
		},
		pdr_cog_conversation_twentythree_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentythree_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentythree_04"
			},
			sound_events_duration = {
				[1.0] = 4.1367707252502
			}
		},
		pwh_cog_conversation_twentyfour_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_cog_conversation_twentyfour_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentyfour_03"
			},
			sound_events_duration = {
				[1.0] = 9.0544376373291
			}
		},
		pbw_whisper_conversation_twelve_03_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 2.4632916450501
			}
		},
		pbw_whispers_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_whispers_conversation_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_whispers_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 2.6285207271576
			}
		},
		nik_cog_conversation_twentyfive_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_cog_conversation_twentyfive_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_cog_conversation_twentyfive_01"
			},
			sound_events_duration = {
				[1.0] = 5.48202085495
			}
		},
		pdr_cog_conversation_twentyfour_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentyfour_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyfour_02"
			},
			sound_events_duration = {
				[1.0] = 5.0818333625794
			}
		},
		pes_cog_conversation_thirteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_thirteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_thirteen_01"
			},
			sound_events_duration = {
				[1.0] = 4.0050415992737
			}
		},
		pdr_whisper_conversation_twelve_02_2 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.46129155159
			}
		},
		pes_cog_conversation_twentyfive_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_twentyfive_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_twentyfive_01"
			},
			sound_events_duration = {
				[1.0] = 5.3104791641235
			}
		},
		pdr_cog_conversation_twentyfive_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentyfive_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyfive_01"
			},
			sound_events_duration = {
				[1.0] = 1.19431245327
			}
		},
		pdr_cog_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 5.0505208969116
			}
		},
		pwe_cog_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_cog_conversation_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 2.165020942688
			}
		},
		nik_whispers_conversation_two_01 = {
			override_awareness = "nik_whispers_conversation_two_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_whispers_conversation_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_whispers_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 8.4042081832886
			}
		},
		pes_whisper_conversation_twelve_03_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_whisper_conversation_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_03"
			},
			sound_events_duration = {
				[1.0] = 1.066645860672
			}
		},
		pbw_cog_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_cog_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 4.0466456413269
			}
		},
		pdr_cog_conversation_thirteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_thirteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_thirteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.9183750152588
			}
		},
		pdr_cog_conversation_twentytwo_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_cog_conversation_twentytwo_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentytwo_01"
			},
			sound_events_duration = {
				[1.0] = 5.7153539657593
			}
		}
	})
end
