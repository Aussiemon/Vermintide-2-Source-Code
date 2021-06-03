return function ()
	define_rule({
		name = "pwh_morris_extra_one_01",
		response = "pwh_morris_extra_one_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_01",
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
		name = "pes_morris_extra_one_01",
		response = "pes_morris_extra_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_fourteen_01"
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
		name = "pwh_morris_extra_one_02",
		response = "pwh_morris_extra_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_fourteen_01"
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
		name = "pbw_morris_extra_two_01",
		response = "pbw_morris_extra_two_01",
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
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_02",
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
		name = "pwh_morris_extra_two_01",
		response = "pwh_morris_extra_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_three_01"
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
		name = "pbw_morris_extra_two_02",
		response = "pbw_morris_extra_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bw_backstory_three_01"
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
		name = "pwh_morris_extra_two_02",
		response = "pwh_morris_extra_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_three_02"
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
		name = "pbw_morris_extra_two_03",
		response = "pbw_morris_extra_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bw_backstory_three_02"
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
		name = "pwh_morris_extra_two_03",
		response = "pwh_morris_extra_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_three_03"
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
		name = "pes_morris_extra_three_01",
		response = "pes_morris_extra_three_01",
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
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_03",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_03",
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
		name = "pwh_morris_extra_three_01",
		response = "pwh_morris_extra_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_three_01"
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
		name = "pes_morris_extra_three_02",
		response = "pes_morris_extra_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_es_backstory_three_01"
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
		name = "pwh_morris_extra_three_02",
		response = "pwh_morris_extra_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_three_02"
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
		name = "pes_morris_extra_three_03",
		response = "pes_morris_extra_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_es_backstory_three_02"
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
		name = "pwh_morris_extra_three_03",
		response = "pwh_morris_extra_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_three_03"
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
		name = "pdr_morris_extra_four_01",
		response = "pdr_morris_extra_four_01",
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
				0
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_04",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_04",
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
		name = "pes_morris_extra_four_01",
		response = "pes_morris_extra_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_backstory_five_01"
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
		name = "pwe_morris_extra_four_01",
		response = "pwe_morris_extra_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_backstory_five_01"
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
		name = "pes_morris_extra_four_02",
		response = "pes_morris_extra_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_five_01"
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
		name = "pdr_morris_extra_four_02",
		response = "pdr_morris_extra_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_backstory_five_02"
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
		name = "pwe_morris_extra_four_02",
		response = "pwe_morris_extra_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_backstory_five_02"
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
		name = "pdr_morris_extra_four_03",
		response = "pdr_morris_extra_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_five_02"
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
		name = "pwe_morris_extra_four_03",
		response = "pwe_morris_extra_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_backstory_five_03"
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
		name = "pwh_morris_extra_five_01",
		response = "pwh_morris_extra_five_01",
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
				"morris_extra_conversation_05",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_05",
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
		name = "pwe_morris_extra_five_01",
		response = "pwe_morris_extra_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_ground_zero_story_eight_01"
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
		name = "pwh_morris_extra_five_02",
		response = "pwh_morris_extra_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_ground_zero_story_eight_01"
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
		name = "pwe_morris_extra_five_02",
		response = "pwe_morris_extra_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_ground_zero_story_eight_02"
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
		name = "pes_morris_extra_six_01",
		response = "pes_morris_extra_six_01",
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
				"morris_extra_conversation_06",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_06",
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
		name = "pwe_morris_extra_six_01",
		response = "pwe_morris_extra_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_four_01"
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
		name = "pes_morris_extra_six_02",
		response = "pes_morris_extra_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_four_01"
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
		name = "pwe_morris_extra_six_02",
		response = "pwe_morris_extra_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_four_02"
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
		name = "pes_morris_extra_six_03",
		response = "pes_morris_extra_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_four_02"
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
		name = "pes_morris_extra_seven_01",
		response = "pes_morris_extra_seven_01",
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
				"morris_extra_conversation_07",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_07",
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
		name = "pwh_morris_extra_seven_01",
		response = "pwh_morris_extra_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_nine_01"
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
		name = "pes_morris_extra_seven_02",
		response = "pes_morris_extra_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_elven_ruins_story_nine_01"
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
		name = "pwh_morris_extra_seven_02",
		response = "pwh_morris_extra_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_elven_ruins_story_nine_02"
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
		name = "pdr_morris_extra_eight_01",
		response = "pdr_morris_extra_eight_01",
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
				"morris_extra_conversation_08",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_08",
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
		name = "pwe_morris_extra_eight_01",
		response = "pwe_morris_extra_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_eleven_01"
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
		name = "pdr_morris_extra_eight_02",
		response = "pdr_morris_extra_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_eleven_01"
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
		name = "pwe_morris_extra_eight_02",
		response = "pwe_morris_extra_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_eleven_02"
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
		name = "pdr_morris_extra_eight_03",
		response = "pdr_morris_extra_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_eleven_02"
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
		name = "pwe_morris_extra_eight_03",
		response = "pwe_morris_extra_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_eleven_03"
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
		name = "pdr_morris_extra_eight_04",
		response = "pdr_morris_extra_eight_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_elven_ruins_story_eleven_03"
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
		name = "pwe_morris_extra_eight_04",
		response = "pwe_morris_extra_eight_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_elven_ruins_story_eleven_04"
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
		name = "pwe_morris_extra_nine_01",
		response = "pwe_morris_extra_nine_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_09",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_09",
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
		name = "pdr_morris_extra_nine_01",
		response = "pdr_morris_extra_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_fort_story_on_the_way_five_01"
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
		name = "pwe_morris_extra_nine_02",
		response = "pwe_morris_extra_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_fort_story_on_the_way_five_01"
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
		name = "pdr_morris_extra_nine_02",
		response = "pdr_morris_extra_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_fort_story_on_the_way_five_02"
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
		name = "pwh_morris_extra_ten_01",
		response = "pwh_morris_extra_ten_01",
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
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_10",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_10",
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
		name = "pwe_morris_extra_ten_01",
		response = "pwe_morris_extra_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_two_01"
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
		name = "pwh_morris_extra_ten_02",
		response = "pwh_morris_extra_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wh_backstory_two_01"
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
		name = "pwe_morris_extra_ten_02",
		response = "pwe_morris_extra_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_two_02"
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
		name = "pwh_morris_extra_ten_03",
		response = "pwh_morris_extra_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wh_backstory_two_02"
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
		name = "pwe_morris_extra_ten_03",
		response = "pwe_morris_extra_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_two_03"
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
		name = "pwh_morris_extra_ten_04",
		response = "pwh_morris_extra_ten_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wh_backstory_two_03"
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
		name = "pwe_morris_extra_ten_04",
		response = "pwe_morris_extra_ten_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_two_04"
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
		name = "pwh_morris_extra_ten_05",
		response = "pwh_morris_extra_ten_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wh_backstory_two_04"
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
		name = "pwh_morris_extra_eleven_01",
		response = "pwh_morris_extra_eleven_01",
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
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_11",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_11",
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
		name = "pwe_morris_extra_eleven_01",
		response = "pwe_morris_extra_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_we_backstory_two_01"
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
		name = "pwh_morris_extra_eleven_02",
		response = "pwh_morris_extra_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_two_02"
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
		name = "pwe_morris_extra_eleven_02",
		response = "pwe_morris_extra_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_we_backstory_two_02"
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
		name = "pwh_morris_extra_eleven_03",
		response = "pwh_morris_extra_eleven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_two_03"
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
		name = "pbw_morris_extra_twelve_01",
		response = "pbw_morris_extra_twelve_01",
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
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_12",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_12",
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
		name = "pwe_morris_extra_twelve_01",
		response = "pwe_morris_extra_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_we_backstory_one_01"
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
		name = "pbw_morris_extra_twelve_02",
		response = "pbw_morris_extra_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_one_01"
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
		name = "pwe_morris_extra_twelve_02",
		response = "pwe_morris_extra_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_we_backstory_one_02"
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
		name = "pbw_morris_extra_twelve_03",
		response = "pbw_morris_extra_twelve_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_one_02"
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
		name = "pwe_morris_extra_twelve_03",
		response = "pwe_morris_extra_twelve_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_we_backstory_one_03"
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
		name = "pes_morris_extra_thirteen_01",
		response = "pes_morris_extra_thirteen_01",
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
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_13",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_13",
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
		name = "pbw_morris_extra_thirteen_01",
		response = "pbw_morris_extra_thirteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bw_backstory_seven_03"
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
		name = "pes_morris_extra_thirteen_02",
		response = "pes_morris_extra_thirteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_seven_03"
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
		name = "pbw_morris_extra_thirteen_02",
		response = "pbw_morris_extra_thirteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bw_backstory_seven_04"
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
		name = "pes_morris_extra_thirteen_03",
		response = "pes_morris_extra_thirteen_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_seven_04"
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
		name = "pdr_morris_extra_fourteen_01",
		response = "pdr_morris_extra_fourteen_01",
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
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_14",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_14",
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
		name = "pbw_morris_extra_fourteen_01",
		response = "pbw_morris_extra_fourteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bw_backstory_five_01"
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
		name = "pdr_morris_extra_fourteen_02",
		response = "pdr_morris_extra_fourteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_five_01"
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
		name = "pbw_morris_extra_fourteen_02",
		response = "pbw_morris_extra_fourteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bw_backstory_five_02"
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
		name = "pbw_morris_extra_fifteen_01",
		response = "pbw_morris_extra_fifteen_01",
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
				"morris_extra_conversation_15",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_15",
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
		name = "pwe_morris_extra_fifteen_01",
		response = "pwe_morris_extra_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_ten_01"
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
		name = "pbw_morris_extra_fifteen_02",
		response = "pbw_morris_extra_fifteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_catacombs_story_ten_01"
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
		name = "pdr_morris_extra_fifteen_01",
		response = "pdr_morris_extra_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_catacombs_story_ten_02"
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
		name = "pbw_morris_extra_fifteen_03",
		response = "pbw_morris_extra_fifteen_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_catacombs_story_ten_01"
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
		name = "pwh_morris_extra_seventeen_01",
		response = "pwh_morris_extra_seventeen_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_17",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_17",
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
		name = "pes_morris_extra_seventeen_01",
		response = "pes_morris_extra_seventeen_01",
		criterias = {
			{
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
		name = "pwh_morris_extra_seventeen_02",
		response = "pwh_morris_extra_seventeen_02",
		criterias = {
			{
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
		name = "pes_morris_extra_seventeen_02",
		response = "pes_morris_extra_seventeen_02",
		criterias = {
			{
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
		name = "pes_morris_extra_sixteen_01",
		response = "pes_morris_extra_sixteen_01",
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
				"user_context",
				"player_career",
				OP.NEQ,
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
				"morris_extra_conversation_16",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_16",
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
		name = "pwh_morris_extra_sixteen_01",
		response = "pwh_morris_extra_sixteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_twelve_01"
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
		name = "pes_morris_extra_sixteen_02",
		response = "pes_morris_extra_sixteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_twelve_01"
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
		name = "pwh_morris_extra_sixteen_02",
		response = "pwh_morris_extra_sixteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_slum_story_twelve_02"
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
		name = "pes_morris_extra_sixteen_03",
		response = "pes_morris_extra_sixteen_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_bogenhafen_slum_story_twelve_02"
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
		name = "pes_morris_extra_eighteen_01",
		response = "pes_morris_extra_eighteen_01",
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				240
			},
			{
				"faction_memory",
				"morris_extra_conversation_18",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"morris_extra_conversation_18",
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
		name = "pwe_morris_extra_eighteen_01",
		response = "pwe_morris_extra_eighteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_city_story_three_01"
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
		name = "pes_morris_extra_eighteen_02",
		response = "pes_morris_extra_eighteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_bogenhafen_city_story_three_01"
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
		name = "pbw_morris_extra_eighteen_01",
		response = "pbw_morris_extra_eighteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_bogenhafen_city_story_three_02"
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
		name = "pdr_morris_bardin_song",
		response = "pdr_morris_bardin_song",
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
				7
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
				"level_time",
				OP.GT,
				600
			},
			{
				"global_context",
				"times_map_visited",
				OP.GT,
				2
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			},
			{
				"faction_memory",
				"pdr_morris_bardin_song",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pes_morris_extra_seven_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.5850207805634
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_elven_ruins_story_nine_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_level_elven_ruins_story_nine_02"
			}
		},
		pes_morris_extra_thirteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 0.87479168176651
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_seven_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_bw_backstory_seven_04"
			}
		},
		pwh_morris_extra_eleven_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.8466665744781
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_we_backstory_two_03"
			}
		},
		pwh_morris_extra_two_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.1572499275208
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_bw_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_bw_backstory_three_01"
			}
		},
		pbw_morris_extra_fourteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 10.121083259583
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_five_02"
			}
		},
		pwe_morris_extra_ten_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.0732917785645
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wh_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_wh_backstory_two_02"
			}
		},
		pwe_morris_extra_four_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 6.1680417060852
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_backstory_five_02"
			}
		},
		pes_morris_extra_six_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.8480000495911
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_elven_ruins_story_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_level_elven_ruins_story_four_01"
			}
		},
		pwh_morris_extra_five_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.7372708320618
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_ground_zero_story_eight_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_level_ground_zero_story_eight_02"
			}
		},
		pbw_morris_extra_fifteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.9482707977295
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_catacombs_story_ten_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_level_catacombs_story_ten_02"
			}
		},
		pdr_morris_extra_nine_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.5929789543152
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_on_the_way_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_on_the_way_five_02"
			}
		},
		pwe_morris_extra_eighteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 6.5022082328796
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_bogenhafen_city_story_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_bogenhafen_city_story_three_01"
			}
		},
		pwe_morris_extra_six_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 6.1950001716614
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_elven_ruins_story_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_elven_ruins_story_four_01"
			}
		},
		pdr_morris_extra_eight_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.4435625076294
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_elven_ruins_story_eleven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_level_elven_ruins_story_eleven_02"
			}
		},
		pwh_morris_extra_seventeen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.8783750534058
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_crater_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_crater_conversation_ten_01"
			}
		},
		pwe_morris_extra_eight_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.7037084102631
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_elven_ruins_story_eleven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_elven_ruins_story_eleven_02"
			}
		},
		pwe_morris_extra_eight_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.6988542079926
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_elven_ruins_story_eleven_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_elven_ruins_story_eleven_03"
			}
		},
		pes_morris_extra_eighteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.7211875915527
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_bogenhafen_city_story_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_level_bogenhafen_city_story_three_01"
			}
		},
		pdr_morris_bardin_song = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 12,
			category = "casual_talk",
			dialogue_animations_n = 12,
			sound_events_duration = {
				4.9493751525879,
				8.2154998779297,
				10.848187446594,
				6.8586039543152,
				4.7080416679382,
				7.3645834922791,
				7.2409377098083,
				9.6389579772949,
				10.927645683289,
				8.935625076294,
				6.1999998092651,
				3.4129583835602
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_neutral",
				"face_happy",
				"face_neutral",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			randomize_indexes = {},
			localization_strings = {
				"pdr_morris_bardin_song_01",
				"pdr_morris_bardin_song_02",
				"pdr_morris_bardin_song_03",
				"pdr_morris_bardin_song_04",
				"pdr_morris_bardin_song_05",
				"pdr_morris_bardin_song_06",
				"pdr_morris_bardin_song_07",
				"pdr_morris_bardin_song_08",
				"pdr_morris_bardin_song_09",
				"pdr_morris_bardin_song_10",
				"pdr_morris_bardin_song_11",
				"pdr_morris_bardin_song_12"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"pdr_morris_bardin_song_01",
				"pdr_morris_bardin_song_02",
				"pdr_morris_bardin_song_03",
				"pdr_morris_bardin_song_04",
				"pdr_morris_bardin_song_05",
				"pdr_morris_bardin_song_06",
				"pdr_morris_bardin_song_07",
				"pdr_morris_bardin_song_08",
				"pdr_morris_bardin_song_09",
				"pdr_morris_bardin_song_10",
				"pdr_morris_bardin_song_11",
				"pdr_morris_bardin_song_12"
			}
		},
		pwe_morris_extra_nine_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 6.5626459121704
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_on_the_way_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_on_the_way_five_02"
			}
		},
		pwe_morris_extra_six_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.7526249885559
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_elven_ruins_story_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_elven_ruins_story_four_02"
			}
		},
		pes_morris_extra_sixteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.1581041812897
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_bogenhafen_slum_story_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_level_bogenhafen_slum_story_twelve_01"
			}
		},
		pwh_morris_extra_ten_04 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 10.645041465759
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_backstory_two_04"
			}
		},
		pwh_morris_extra_seven_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.0540623664856
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_elven_ruins_story_nine_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_level_elven_ruins_story_nine_02"
			}
		},
		pwe_morris_extra_five_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.9905624389648
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_ground_zero_story_eight_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_ground_zero_story_eight_02"
			}
		},
		pes_morris_extra_six_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.804229259491
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_elven_ruins_story_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_level_elven_ruins_story_four_02"
			}
		},
		pwh_morris_extra_three_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.2699375152588
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_es_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_es_backstory_three_02"
			}
		},
		pwh_morris_extra_sixteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 7.39297914505
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_bogenhafen_slum_story_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_level_bogenhafen_slum_story_twelve_02"
			}
		},
		pes_morris_extra_six_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 4.9957709312439
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_elven_ruins_story_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_level_elven_ruins_story_four_03"
			}
		},
		pwh_morris_extra_two_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.830020904541
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_bw_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_bw_backstory_three_02"
			}
		},
		pwh_morris_extra_ten_05 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.1951665878296
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_two_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_backstory_two_05"
			}
		},
		pwh_morris_extra_sixteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.4518749713898
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_bogenhafen_slum_story_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_level_bogenhafen_slum_story_twelve_01"
			}
		},
		pdr_morris_extra_fourteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.4642915725708
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_bw_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_bw_backstory_five_01"
			}
		},
		pbw_morris_extra_fourteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 8.2277498245239
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_five_01"
			}
		},
		pwe_morris_extra_eleven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.5494999885559
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_backstory_two_02"
			}
		},
		pes_morris_extra_sixteen_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.701812505722
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_bogenhafen_slum_story_twelve_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_level_bogenhafen_slum_story_twelve_03"
			}
		},
		pwh_morris_extra_one_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 8.541895866394
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_fourteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_fourteen_02"
			}
		},
		pwh_morris_extra_seven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 6.1801042556763
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_elven_ruins_story_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_level_elven_ruins_story_nine_01"
			}
		},
		pbw_morris_extra_eighteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.3082082271576
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_bogenhafen_city_story_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_level_bogenhafen_city_story_three_01"
			}
		},
		pbw_morris_extra_two_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.8146874904633
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_three_01"
			}
		},
		pes_morris_extra_thirteen_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.9123333692551
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_seven_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_bw_backstory_seven_05"
			}
		},
		pes_morris_extra_eighteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.5469584465027
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_bogenhafen_city_story_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_level_bogenhafen_city_story_three_02"
			}
		},
		pwh_morris_extra_one_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.4721667766571
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_fourteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_fourteen_01"
			}
		},
		pdr_morris_extra_fourteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.229875087738
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_bw_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_bw_backstory_five_02"
			}
		},
		pes_morris_extra_seventeen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.1555936336517
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_conversation_ten_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_crater_conversation_ten_02"
			}
		},
		pes_morris_extra_three_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 4.1442289352417
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_backstory_three_01"
			}
		},
		pbw_morris_extra_fifteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.6924374103546
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_level_catacombs_story_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_level_catacombs_story_ten_01"
			}
		},
		pes_morris_extra_one_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 4.8675208091736
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_fourteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_level_farmlands_story_fourteen_01"
			}
		},
		pes_morris_extra_four_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 4.6642708778381
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_backstory_five_01"
			}
		},
		pes_morris_extra_seventeen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.0626459121704
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_crater_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_crater_conversation_ten_01"
			}
		},
		pbw_morris_extra_fifteen_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 8.8697919845581
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_catacombs_story_ten_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_level_catacombs_story_ten_03"
			}
		},
		pdr_morris_extra_eight_04 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.3024792671204
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_elven_ruins_story_eleven_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_level_elven_ruins_story_eleven_04"
			}
		},
		pwe_morris_extra_five_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.829958319664
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_ground_zero_story_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_ground_zero_story_eight_01"
			}
		},
		pdr_morris_extra_fifteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 4.4097084999084
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_catacombs_story_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_level_catacombs_story_ten_01"
			}
		},
		pwe_morris_extra_fifteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.2149999141693
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_catacombs_story_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_catacombs_story_ten_01"
			}
		},
		pwh_morris_extra_seventeen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.8666875362396
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_crater_conversation_ten_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_crater_conversation_ten_02"
			}
		},
		pbw_morris_extra_two_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.1752707958221
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_three_02"
			}
		},
		pes_morris_extra_sixteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 4.5505623817444
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_bogenhafen_slum_story_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_level_bogenhafen_slum_story_twelve_02"
			}
		},
		pdr_morris_extra_four_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 4.7444581985474
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_we_backstory_five_02"
			}
		},
		pwe_morris_extra_twelve_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.8041458129883
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_backstory_one_03"
			}
		},
		pbw_morris_extra_thirteen_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 8.9575004577637
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_seven_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_seven_04"
			}
		},
		pdr_morris_extra_eight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 6.3811874389648
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_level_elven_ruins_story_eleven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_level_elven_ruins_story_eleven_01"
			}
		},
		pbw_morris_extra_thirteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.6063957214356
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_seven_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_seven_03"
			}
		},
		pwe_morris_extra_eleven_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.1905832290649
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_backstory_two_03"
			}
		},
		pwh_morris_extra_ten_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 4.8822498321533
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_backstory_two_02"
			}
		},
		pwe_morris_extra_eight_04 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.9796458482742
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_elven_ruins_story_eleven_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_elven_ruins_story_eleven_04"
			}
		},
		pes_morris_extra_four_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.0471665859222
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_backstory_five_02"
			}
		},
		pwe_morris_extra_twelve_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 7.2468333244324
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_backstory_one_02"
			}
		},
		pbw_morris_extra_twelve_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.0568333864212
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_we_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_we_backstory_one_02"
			}
		},
		pwh_morris_extra_two_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 9.5503540039063
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_bw_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_bw_backstory_three_03"
			}
		},
		pbw_morris_extra_twelve_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.6452708244324
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_we_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_we_backstory_one_03"
			}
		},
		pwe_morris_extra_twelve_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.344583272934
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_backstory_one_01"
			}
		},
		pwh_morris_extra_three_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 6.9128332138061
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_es_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_es_backstory_three_03"
			}
		},
		pdr_morris_extra_nine_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.9148958921433
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_on_the_way_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_on_the_way_five_01"
			}
		},
		pdr_morris_extra_four_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.228354215622
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_we_backstory_five_01"
			}
		},
		pdr_morris_extra_eight_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.8186874389648
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_elven_ruins_story_eleven_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_level_elven_ruins_story_eleven_03"
			}
		},
		pes_morris_extra_three_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 6.4248957633972
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_backstory_three_02"
			}
		},
		pbw_morris_extra_twelve_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 3.5214791297913
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_we_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_we_backstory_one_01"
			}
		},
		pes_morris_extra_thirteen_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.1843748092651
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_seven_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_bw_backstory_seven_03"
			}
		},
		pwh_morris_extra_five_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.5637083053589
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_level_ground_zero_story_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_level_ground_zero_story_eight_01"
			}
		},
		pwe_morris_extra_ten_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.9249166250229
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wh_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_wh_backstory_two_01"
			}
		},
		pwh_morris_extra_eleven_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 5.0313749313355
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_we_backstory_two_02"
			}
		},
		pwh_morris_extra_eleven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.246333360672
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_we_backstory_two_01"
			}
		},
		pwe_morris_extra_four_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.2940833568573
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_backstory_five_03"
			}
		},
		pwe_morris_extra_ten_04 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.4274582862854
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wh_backstory_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_wh_backstory_two_04"
			}
		},
		pdr_morris_extra_four_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.376416683197
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_we_backstory_five_03"
			}
		},
		pwh_morris_extra_ten_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.2073957920074
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_backstory_two_03"
			}
		},
		pwh_morris_extra_ten_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 4.570291519165
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_backstory_two_01"
			}
		},
		pwh_morris_extra_three_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 4.8949584960938
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_es_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_es_backstory_three_01"
			}
		},
		pwe_morris_extra_four_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.0916874408722
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_backstory_five_01"
			}
		},
		pwe_morris_extra_nine_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 6.2733335494995
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_on_the_way_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_on_the_way_five_01"
			}
		},
		pwe_morris_extra_eight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 4.3473958969116
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_elven_ruins_story_eleven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_level_elven_ruins_story_eleven_01"
			}
		},
		pes_morris_extra_seven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 2.2701354026794
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_elven_ruins_story_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_level_elven_ruins_story_nine_01"
			}
		},
		pwe_morris_extra_ten_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 7.5326042175293
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wh_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_wh_backstory_two_03"
			}
		},
		pes_morris_extra_three_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 7.544041633606
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_backstory_three_03"
			}
		},
		pbw_morris_extra_two_03 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_morris_extras",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events_duration = {
				[1.0] = 1.3995208740234
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_three_03"
			}
		}
	})
end
