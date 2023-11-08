return function ()
	define_rule({
		name = "pbw_portals_conversation_eight_01",
		response = "pbw_portals_conversation_eight_01",
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
				"intensity",
				OP.LT,
				1
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
				180
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_eight_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_eight_01",
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
		name = "pbw_portals_conversation_eight_02",
		response = "pbw_portals_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_portals_conversation_eight_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pbw_portals_conversation_one_01",
		response = "pbw_portals_conversation_one_01",
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
				"intensity",
				OP.LT,
				1
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_one_01",
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
		name = "pbw_portals_conversation_one_02",
		response = "pbw_portals_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_portals_conversation_one_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pbw_portals_conversation_six_01",
		response = "pbw_portals_conversation_six_01",
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
				"intensity",
				OP.LT,
				1
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
				180
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_six_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_six_01",
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
		name = "pbw_portals_conversation_six_02",
		response = "pbw_portals_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_portals_conversation_six_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pbw_portals_conversation_twelve_01",
		response = "pbw_portals_conversation_twelve_01",
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
				"intensity",
				OP.LT,
				1
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
				"empire_soldier",
				OP.EQ,
				1
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
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_twelve_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_portals_conversation_twelve_01",
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
		name = "pbw_portals_conversation_twelve_02",
		response = "pbw_portals_conversation_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_portals_conversation_twelve_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pdr_portals_conversation_eleven_01",
		response = "pdr_portals_conversation_eleven_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_eleven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_eleven_01",
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
		name = "pdr_portals_conversation_eleven_02",
		response = "pdr_portals_conversation_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_portals_conversation_eleven_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pdr_portals_conversation_five_01",
		response = "pdr_portals_conversation_five_01",
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
				"intensity",
				OP.LT,
				1
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
				"witch_hunter",
				OP.EQ,
				1
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
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_five_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_five_01",
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
		name = "pdr_portals_conversation_five_02",
		response = "pdr_portals_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_portals_conversation_five_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pdr_portals_conversation_four_01",
		response = "pdr_portals_conversation_four_01",
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
				"intensity",
				OP.LT,
				1
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
				180
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_four_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_portals_conversation_four_01",
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
		name = "pdr_portals_conversation_four_02",
		response = "pdr_portals_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_portals_conversation_four_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pdr_portals_conversation_nine_01",
		response = "pdr_portals_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_portals_conversation_nine_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pdr_portals_conversation_nine_02",
		response = "pdr_portals_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_portals_conversation_nine_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pdr_portals_conversation_twelve_01",
		response = "pdr_portals_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_portals_conversation_twelve_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pdr_portals_conversation_twelve_02",
		response = "pdr_portals_conversation_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_portals_conversation_twelve_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pdr_portals_conversation_two_01",
		response = "pdr_portals_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_portals_conversation_two_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pes_portals_conversation_eleven_01",
		response = "pes_portals_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_portals_conversation_eleven_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pes_portals_conversation_nine_01",
		response = "pes_portals_conversation_nine_01",
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
				"intensity",
				OP.LT,
				1
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
				180
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_nine_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_nine_01",
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
		name = "pes_portals_conversation_nine_02",
		response = "pes_portals_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_portals_conversation_nine_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pes_portals_conversation_one_01",
		response = "pes_portals_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_portals_conversation_one_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pes_portals_conversation_one_02",
		response = "pes_portals_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_portals_conversation_one_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pes_portals_conversation_seven_01",
		response = "pes_portals_conversation_seven_01",
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
				"intensity",
				OP.LT,
				1
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
				"wood_elf",
				OP.EQ,
				1
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
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_seven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_seven_01",
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
		name = "pes_portals_conversation_three_01",
		response = "pes_portals_conversation_three_01",
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
				"intensity",
				OP.LT,
				1
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
				"dwarf_ranger",
				OP.EQ,
				1
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
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_three_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_portals_conversation_three_01",
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
		name = "pes_portals_conversation_three_02",
		response = "pes_portals_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_portals_conversation_three_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pes_portals_conversation_twelve_01",
		response = "pes_portals_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_portals_conversation_twelve_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwe_portals_conversation_eight_01",
		response = "pwe_portals_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_portals_conversation_eight_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwe_portals_conversation_eight_02",
		response = "pwe_portals_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_portals_conversation_eight_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwe_portals_conversation_four_01",
		response = "pwe_portals_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_portals_conversation_four_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwe_portals_conversation_four_02",
		response = "pwe_portals_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_portals_conversation_four_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwe_portals_conversation_seven_01",
		response = "pwe_portals_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_portals_conversation_seven_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwe_portals_conversation_ten_01",
		response = "pwe_portals_conversation_ten_01",
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
				"intensity",
				OP.LT,
				1
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				180
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pwe_portals_conversation_ten_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_portals_conversation_ten_01",
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
		name = "pwe_portals_conversation_two_01",
		response = "pwe_portals_conversation_two_01",
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
				"intensity",
				OP.LT,
				1
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
				180
			},
			{
				"faction_memory",
				"portals_secret_entrance_gate_opens",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pwe_portals_conversation_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_portals_conversation_two_01",
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
		name = "pwe_portals_conversation_two_02",
		response = "pwe_portals_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_portals_conversation_two_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwh_portals_conversation_five_01",
		response = "pwh_portals_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_portals_conversation_five_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwh_portals_conversation_five_02",
		response = "pwh_portals_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_portals_conversation_five_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwh_portals_conversation_seven_01",
		response = "pwh_portals_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_portals_conversation_seven_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwh_portals_conversation_seven_02",
		response = "pwh_portals_conversation_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_portals_conversation_seven_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwh_portals_conversation_six_01",
		response = "pwh_portals_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_portals_conversation_six_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwh_portals_conversation_ten_01",
		response = "pwh_portals_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_portals_conversation_ten_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwh_portals_conversation_three_01",
		response = "pwh_portals_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_portals_conversation_three_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		name = "pwh_portals_conversation_two_01",
		response = "pwh_portals_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_portals_conversation_two_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				3
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
		pbw_portals_conversation_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_portals_conversation_eight_01"
			},
			sound_events = {
				[1.0] = "pbw_portals_conversation_eight_01"
			},
			sound_events_duration = {
				[1.0] = 7.4613122940064
			}
		},
		pbw_portals_conversation_eight_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_portals_conversation_eight_02"
			},
			sound_events = {
				[1.0] = "pbw_portals_conversation_eight_02"
			},
			sound_events_duration = {
				[1.0] = 7.2133331298828
			}
		},
		pbw_portals_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_portals_conversation_one_01"
			},
			sound_events = {
				[1.0] = "pbw_portals_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 4.1936874389648
			}
		},
		pbw_portals_conversation_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_portals_conversation_one_02"
			},
			sound_events = {
				[1.0] = "pbw_portals_conversation_one_02"
			},
			sound_events_duration = {
				[1.0] = 2.8313541412353
			}
		},
		pbw_portals_conversation_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_portals_conversation_six_01"
			},
			sound_events = {
				[1.0] = "pbw_portals_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 4.4088540077209
			}
		},
		pbw_portals_conversation_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_portals_conversation_six_02"
			},
			sound_events = {
				[1.0] = "pbw_portals_conversation_six_02"
			},
			sound_events_duration = {
				[1.0] = 5.6041665077209
			}
		},
		pbw_portals_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_portals_conversation_twelve_01"
			},
			sound_events = {
				[1.0] = "pbw_portals_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 1.9794166088104
			}
		},
		pbw_portals_conversation_twelve_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_portals_conversation_twelve_02"
			},
			sound_events = {
				[1.0] = "pbw_portals_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 2.4713749885559
			}
		},
		pdr_portals_conversation_eleven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_portals_conversation_eleven_01"
			},
			sound_events = {
				[1.0] = "pdr_portals_conversation_eleven_01"
			},
			sound_events_duration = {
				[1.0] = 3.1011457443237
			}
		},
		pdr_portals_conversation_eleven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_portals_conversation_eleven_02"
			},
			sound_events = {
				[1.0] = "pdr_portals_conversation_eleven_02"
			},
			sound_events_duration = {
				[1.0] = 1.7944999933243
			}
		},
		pdr_portals_conversation_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_portals_conversation_five_01"
			},
			sound_events = {
				[1.0] = "pdr_portals_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 4.823166847229
			}
		},
		pdr_portals_conversation_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_portals_conversation_five_02"
			},
			sound_events = {
				[1.0] = "pdr_portals_conversation_five_02"
			},
			sound_events_duration = {
				[1.0] = 4.108916759491
			}
		},
		pdr_portals_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_portals_conversation_four_01"
			},
			sound_events = {
				[1.0] = "pdr_portals_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 6.0807709693909
			}
		},
		pdr_portals_conversation_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_portals_conversation_four_02"
			},
			sound_events = {
				[1.0] = "pdr_portals_conversation_four_02"
			},
			sound_events_duration = {
				[1.0] = 2.4935834407806
			}
		},
		pdr_portals_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_portals_conversation_nine_01"
			},
			sound_events = {
				[1.0] = "pdr_portals_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 7.2602291107178
			}
		},
		pdr_portals_conversation_nine_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_portals_conversation_nine_02"
			},
			sound_events = {
				[1.0] = "pdr_portals_conversation_nine_02"
			},
			sound_events_duration = {
				[1.0] = 1.8662291765213
			}
		},
		pdr_portals_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_portals_conversation_twelve_01"
			},
			sound_events = {
				[1.0] = "pdr_portals_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 4.532687664032
			}
		},
		pdr_portals_conversation_twelve_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_portals_conversation_twelve_02"
			},
			sound_events = {
				[1.0] = "pdr_portals_conversation_twelve_02"
			},
			sound_events_duration = {
				[1.0] = 6.754271030426
			}
		},
		pdr_portals_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_portals_conversation_two_01"
			},
			sound_events = {
				[1.0] = "pdr_portals_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 6.1015210151672
			}
		},
		pes_portals_conversation_eleven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_portals_conversation_eleven_01"
			},
			sound_events = {
				[1.0] = "pes_portals_conversation_eleven_01"
			},
			sound_events_duration = {
				[1.0] = 8.0599164962769
			}
		},
		pes_portals_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_portals_conversation_nine_01"
			},
			sound_events = {
				[1.0] = "pes_portals_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 4.0353331565857
			}
		},
		pes_portals_conversation_nine_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_portals_conversation_nine_02"
			},
			sound_events = {
				[1.0] = "pes_portals_conversation_nine_02"
			},
			sound_events_duration = {
				[1.0] = 2.7005832195282
			}
		},
		pes_portals_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_portals_conversation_one_01"
			},
			sound_events = {
				[1.0] = "pes_portals_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 5.2107501029968
			}
		},
		pes_portals_conversation_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_portals_conversation_one_02"
			},
			sound_events = {
				[1.0] = "pes_portals_conversation_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.0385208129883
			}
		},
		pes_portals_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_portals_conversation_seven_01"
			},
			sound_events = {
				[1.0] = "pes_portals_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 3.8166666030884
			}
		},
		pes_portals_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_portals_conversation_three_01"
			},
			sound_events = {
				[1.0] = "pes_portals_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 3.4044165611267
			}
		},
		pes_portals_conversation_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_portals_conversation_three_02"
			},
			sound_events = {
				[1.0] = "pes_portals_conversation_three_02"
			},
			sound_events_duration = {
				[1.0] = 2.4686665534973
			}
		},
		pes_portals_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_portals_conversation_twelve_01"
			},
			sound_events = {
				[1.0] = "pes_portals_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 7.7092709541321
			}
		},
		pwe_portals_conversation_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_portals_conversation_eight_01"
			},
			sound_events = {
				[1.0] = "pwe_portals_conversation_eight_01"
			},
			sound_events_duration = {
				[1.0] = 6.2406668663025
			}
		},
		pwe_portals_conversation_eight_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_portals_conversation_eight_02"
			},
			sound_events = {
				[1.0] = "pwe_portals_conversation_eight_02"
			},
			sound_events_duration = {
				[1.0] = 3.0948750972748
			}
		},
		pwe_portals_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_portals_conversation_four_01"
			},
			sound_events = {
				[1.0] = "pwe_portals_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 3.0972292423248
			}
		},
		pwe_portals_conversation_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_portals_conversation_four_02"
			},
			sound_events = {
				[1.0] = "pwe_portals_conversation_four_02"
			},
			sound_events_duration = {
				[1.0] = 5.1922707557678
			}
		},
		pwe_portals_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_portals_conversation_seven_01"
			},
			sound_events = {
				[1.0] = "pwe_portals_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 1.9544166326523
			}
		},
		pwe_portals_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_portals_conversation_ten_01"
			},
			sound_events = {
				[1.0] = "pwe_portals_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 4.7681665420532
			}
		},
		pwe_portals_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_portals_conversation_two_01"
			},
			sound_events = {
				[1.0] = "pwe_portals_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 3.782187461853
			}
		},
		pwe_portals_conversation_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_portals_conversation_two_02"
			},
			sound_events = {
				[1.0] = "pwe_portals_conversation_two_02"
			},
			sound_events_duration = {
				[1.0] = 2.1968333721161
			}
		},
		pwh_portals_conversation_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_portals_conversation_five_01"
			},
			sound_events = {
				[1.0] = "pwh_portals_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 7.2109375
			}
		},
		pwh_portals_conversation_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_portals_conversation_five_02"
			},
			sound_events = {
				[1.0] = "pwh_portals_conversation_five_02"
			},
			sound_events_duration = {
				[1.0] = 4.3492293357849
			}
		},
		pwh_portals_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_portals_conversation_seven_01"
			},
			sound_events = {
				[1.0] = "pwh_portals_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 4.0029168128967
			}
		},
		pwh_portals_conversation_seven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_portals_conversation_seven_02"
			},
			sound_events = {
				[1.0] = "pwh_portals_conversation_seven_02"
			},
			sound_events_duration = {
				[1.0] = 0.93883335590363
			}
		},
		pwh_portals_conversation_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_portals_conversation_six_01"
			},
			sound_events = {
				[1.0] = "pwh_portals_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 12.310978889465
			}
		},
		pwh_portals_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_portals_conversation_ten_01"
			},
			sound_events = {
				[1.0] = "pwh_portals_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 2.150687456131
			}
		},
		pwh_portals_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_portals_conversation_three_01"
			},
			sound_events = {
				[1.0] = "pwh_portals_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 5.6589999198914
			}
		},
		pwh_portals_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_portals",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_portals_conversation_two_01"
			},
			sound_events = {
				[1.0] = "pwh_portals_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 6.3521456718445
			}
		}
	})
end
