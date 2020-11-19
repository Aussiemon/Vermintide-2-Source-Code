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
				0
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
				0
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
				0
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
				0
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
				"nik_whispers_conversation_one_01"
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
				"nik_whispers_conversation_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversation_one_01",
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
				"nik_whispers_conversation_two_01"
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
				"nik_whispers_conversation_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversation_two_01",
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
				"nik_whispers_conversation_three_01"
			},
			{
				"global_context",
				"dwarf_ranger",
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
				"nik_whispers_conversation_three_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversation_three_01",
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
				"nik_whispers_conversation_four_01"
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
				"nik_whispers_conversation_four_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversation_four_01",
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
				"nik_whispers_conversation_five_01"
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
				"nik_whispers_conversation_five_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_whispers_conversation_five_01",
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
	add_dialogues({
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
			sound_events_duration = {
				[1.0] = 9
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_five_02"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_ten_02"
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
			sound_events_duration = {
				[1.0] = 9
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentyfour_03"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_nine_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwe_whispers_conversation_four_01"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eight_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "nik_whispers_conversation_three_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_six_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_whispers_conversation_three_01"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_ten_01"
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
			sound_events_duration = {
				[1.0] = 10
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_five_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_nineteen_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eighteen_01"
			}
		},
		pes_cog_conversation_sixteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_cog_conversation_sixteen_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_sixteen_03"
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
			sound_events_duration = {
				[1.0] = 10
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_six_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pbw_whispers_conversation_two_01"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eleven_01"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_nineteen_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_fifteen_02"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_ten_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_nine_02"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twenty_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentytwo_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentytwo_02"
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
			sound_events_duration = {
				[1.0] = 10
			},
			localization_strings = {
				[1.0] = "npp_whisper_conversation_eleven_01"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_three_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_three_01"
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
			sound_events_duration = {
				[1.0] = 9
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyone_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_nine_01"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_ten_01"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eighteen_02"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_eighteen_02"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_seventeen_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_seventeen_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twenty_03"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_fourteen_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentytwo_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_one_02"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_fifteen_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eight_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_one_01"
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
			sound_events_duration = {
				[1.0] = 0
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_six_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twenty_01"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_nine_01"
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
			sound_events_duration = {
				[1.0] = 9
			},
			localization_strings = {
				[1.0] = "nik_whispers_conversation_five_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_six_04"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentythree_01"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_eleven_02"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pes_whispers_conversation_five_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_two_02"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_fourteen_02"
			}
		},
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_fourteen_02"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_nineteen_02"
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
			sound_events_duration = {
				[1.0] = 9
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_fifteen_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentyone_02"
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
			sound_events_duration = {
				[1.0] = 8
			},
			localization_strings = {
				[1.0] = "nfl_whisper_conversation_ten_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "nfl_whisper_conversation_nine_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_nineteen_02"
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
			sound_events_duration = {
				[1.0] = 9
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 0
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentythree_03"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_six_02"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyone_02"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_sixteen_01"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "nfl_whisper_conversation_eight_01"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_seven_01"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "nfl_whisper_conversation_seven_01"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_eleven_01"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_six_01"
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
			sound_events_duration = {
				[1.0] = 7
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_four_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "nfl_whisper_conversation_six_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_four_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_six_03"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "nik_whispers_conversation_four_01"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 8
			},
			localization_strings = {
				[1.0] = "nik_whispers_conversation_two_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pwh_whispers_conversation_one_01"
			}
		},
		nik_whispers_conversation_one_01 = {
			override_awareness = "nik_whispers_conversation_one_01_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dlc_cog",
			intended_player_profile = "witch_hunter",
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "nik_whispers_conversation_one_01"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_thirteen_02"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_thirteen_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_eight_01"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twenty_01"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentyone_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_three_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 14
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_four_01"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twenty_03"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_eleven_02"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentyfour_01"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_sixteen_01"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_three_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "nik_whisper_conversation_eleven_02"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_three_03"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_eighteen_03_optional"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_one_01"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_seventeen_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyfour_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentyfour_04"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_seven_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentythree_04"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_five_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_eighteen_01"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_eight_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_one_02"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 0
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_thirteen_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pes_cog_conversation_thirteen_01"
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
			sound_events_duration = {
				[1.0] = 9
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_two_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_five_01"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pes_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_nine_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pbw_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_fifteen_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_ten_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_two_01"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twenty_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_twentythree_02"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_sixteen_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_two_02"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pwe_whisper_conversation_twelve_02"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_eight_01"
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
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_seven_02"
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
			sound_events_duration = {
				[1.0] = 0
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_03"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pbw_cog_conversation_seven_02"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pwh_cog_conversation_twentytwo_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pwh_whisper_conversation_twelve_01"
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
			sound_events_duration = {
				[1.0] = 3
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_six_03"
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
			sound_events_duration = {
				[1.0] = 5
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_fourteen_01"
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
			sound_events_duration = {
				[1.0] = 1
			},
			localization_strings = {
				[1.0] = "pwe_cog_conversation_four_01"
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
			sound_events_duration = {
				[1.0] = 4
			},
			localization_strings = {
				[1.0] = "pdr_cog_conversation_seven_01"
			}
		}
	})
end
