return function ()
	define_rule({
		name = "pes_castle_conversation_one_01",
		response = "pes_castle_conversation_one_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_one_01",
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
		name = "pbw_castle_conversation_one_01",
		response = "pbw_castle_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_one_01"
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
		name = "pes_castle_conversation_two_01",
		response = "pes_castle_conversation_two_01",
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
				120
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_two_01",
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
		name = "pwe_castle_conversation_two_01",
		response = "pwe_castle_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_two_01"
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
		name = "pes_castle_conversation_two_02",
		response = "pes_castle_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_two_01"
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
		name = "pwe_castle_conversation_two_02",
		response = "pwe_castle_conversation_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_two_02"
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
		name = "pes_castle_conversation_three_01",
		response = "pes_castle_conversation_three_01",
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
				120
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_three_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_three_01",
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
		name = "pwe_castle_conversation_three_01",
		response = "pwe_castle_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_three_01"
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
		name = "pes_castle_conversation_three_02",
		response = "pes_castle_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_three_01"
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
		name = "pwe_castle_conversation_three_02",
		response = "pwe_castle_conversation_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_three_02"
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
		name = "pbw_castle_conversation_four_01",
		response = "pbw_castle_conversation_four_01",
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
				120
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pbw_castle_conversation_four_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_castle_conversation_four_01",
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
		name = "pwh_castle_conversation_four_01",
		response = "pwh_castle_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_castle_conversation_four_01"
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
		name = "pbw_castle_conversation_four_02",
		response = "pbw_castle_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_four_01"
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
		name = "pwh_castle_conversation_four_02",
		response = "pwh_castle_conversation_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_castle_conversation_four_02"
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
		name = "pwe_castle_conversation_five_01",
		response = "pwe_castle_conversation_five_01",
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
				120
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pwe_castle_conversation_five_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_castle_conversation_five_01",
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
		name = "pwh_castle_conversation_five_01",
		response = "pwh_castle_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_five_01"
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
		name = "pwe_castle_conversation_five_02",
		response = "pwe_castle_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_five_01"
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
		name = "pwh_castle_conversation_five_02",
		response = "pwh_castle_conversation_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_five_02"
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
		name = "pes_castle_conversation_six_01",
		response = "pes_castle_conversation_six_01",
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_six_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_six_01",
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
		name = "pbw_castle_conversation_six_01",
		response = "pbw_castle_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_six_01"
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
		name = "pes_castle_conversation_six_02",
		response = "pes_castle_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_castle_conversation_six_01"
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
		name = "pbw_castle_conversation_six_02",
		response = "pbw_castle_conversation_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_six_02"
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
		name = "pdr_castle_conversation_seven_01",
		response = "pdr_castle_conversation_seven_01",
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
				"witch_hunter",
				OP.EQ,
				1
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
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pdr_castle_conversation_seven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_castle_conversation_seven_01",
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
		name = "pwh_castle_conversation_seven_01",
		response = "pwh_castle_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_castle_conversation_seven_01"
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
		name = "pdr_castle_conversation_seven_02",
		response = "pdr_castle_conversation_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_seven_01"
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
		name = "pes_castle_conversation_eight_01",
		response = "pes_castle_conversation_eight_01",
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
				120
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_eight_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_eight_01",
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
		name = "pwh_castle_conversation_eight_01",
		response = "pwh_castle_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_eight_01"
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
		name = "pes_castle_conversation_eight_02",
		response = "pes_castle_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_eight_01"
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
		name = "pwh_castle_conversation_eight_02",
		response = "pwh_castle_conversation_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_eight_02"
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
		name = "pbw_castle_conversation_nine_01",
		response = "pbw_castle_conversation_nine_01",
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
				120
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pbw_castle_conversation_nine_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_castle_conversation_nine_01",
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
		name = "pdr_castle_conversation_nine_01",
		response = "pdr_castle_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_castle_conversation_nine_01"
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
		name = "pbw_castle_conversation_nine_02",
		response = "pbw_castle_conversation_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_castle_conversation_nine_01"
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
		name = "pes_castle_conversation_ten_01",
		response = "pes_castle_conversation_ten_01",
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
				120
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_ten_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_ten_01",
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
		name = "pwh_castle_conversation_ten_01",
		response = "pwh_castle_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_ten_01"
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
		name = "pwe_castle_conversation_ten_01",
		response = "pwe_castle_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_ten_01"
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
		name = "pwh_castle_conversation_ten_02",
		response = "pwh_castle_conversation_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_ten_01"
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
		name = "pdr_castle_conversation_eleven_01",
		response = "pdr_castle_conversation_eleven_01",
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
				"wood_elf",
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
				120
			},
			{
				"faction_memory",
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pdr_castle_conversation_eleven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_castle_conversation_eleven_01",
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
		name = "pwe_castle_conversation_eleven_01",
		response = "pwe_castle_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_castle_conversation_eleven_01"
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
		name = "pwh_castle_conversation_eleven_01",
		response = "pwh_castle_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_castle_conversation_eleven_01"
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
		name = "pwe_castle_conversation_eleven_02",
		response = "pwe_castle_conversation_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_castle_conversation_eleven_01"
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
		name = "pes_castle_conversation_twelve_01",
		response = "pes_castle_conversation_twelve_01",
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
				"witch_hunter",
				OP.EQ,
				1
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
				"castle_vo_approaching_throne_room",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_twelve_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_castle_conversation_twelve_01",
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
		name = "pbw_castle_conversation_twelve_01",
		response = "pbw_castle_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_twelve_01"
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
		name = "pes_castle_conversation_twelve_02",
		response = "pes_castle_conversation_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_castle_conversation_twelve_01"
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
		name = "pwh_castle_conversation_twelve_01",
		response = "pwh_castle_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_castle_conversation_twelve_02"
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
		pes_castle_conversation_twelve_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_twelve_02"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_twelve_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.2791042327881
			}
		},
		pes_castle_conversation_two_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_two_02"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_two_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.4886040687561
			}
		},
		pwe_castle_conversation_eleven_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_castle_conversation_eleven_02"
			},
			sound_events = {
				[1.0] = "pwe_castle_conversation_eleven_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.0758957862854
			}
		},
		pwe_castle_conversation_eleven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_castle_conversation_eleven_01"
			},
			sound_events = {
				[1.0] = "pwe_castle_conversation_eleven_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.2543125152588
			}
		},
		pwe_castle_conversation_three_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_castle_conversation_three_01"
			},
			sound_events = {
				[1.0] = "pwe_castle_conversation_three_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 0.81195831298828
			}
		},
		pdr_castle_conversation_seven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_castle_conversation_seven_01"
			},
			sound_events = {
				[1.0] = "pdr_castle_conversation_seven_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.176854133606
			}
		},
		pes_castle_conversation_two_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_two_01"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_two_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.7310833930969
			}
		},
		pwh_castle_conversation_twelve_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_castle_conversation_twelve_01"
			},
			sound_events = {
				[1.0] = "pwh_castle_conversation_twelve_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.8931040763855
			}
		},
		pes_castle_conversation_ten_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_ten_01"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_ten_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.2825520634651
			}
		},
		pes_castle_conversation_eight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_eight_01"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_eight_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 7.520124912262
			}
		},
		pwh_castle_conversation_five_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_castle_conversation_five_01"
			},
			sound_events = {
				[1.0] = "pwh_castle_conversation_five_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.9850206375122
			}
		},
		pes_castle_conversation_twelve_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_twelve_01"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_twelve_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 7.0163750648499
			}
		},
		pwh_castle_conversation_four_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_castle_conversation_four_01"
			},
			sound_events = {
				[1.0] = "pwh_castle_conversation_four_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 8.2908954620361
			}
		},
		pwh_castle_conversation_ten_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_castle_conversation_ten_01"
			},
			sound_events = {
				[1.0] = "pwh_castle_conversation_ten_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.5076665878296
			}
		},
		pwe_castle_conversation_five_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_castle_conversation_five_01"
			},
			sound_events = {
				[1.0] = "pwe_castle_conversation_five_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 7.0054998397827
			}
		},
		pdr_castle_conversation_nine_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_castle_conversation_nine_01"
			},
			sound_events = {
				[1.0] = "pdr_castle_conversation_nine_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 6.011125087738
			}
		},
		pwe_castle_conversation_three_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_castle_conversation_three_02"
			},
			sound_events = {
				[1.0] = "pwe_castle_conversation_three_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.8888957500458
			}
		},
		pbw_castle_conversation_twelve_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_castle_conversation_twelve_01"
			},
			sound_events = {
				[1.0] = "pbw_castle_conversation_twelve_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.1307916641235
			}
		},
		pes_castle_conversation_three_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_three_01"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_three_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.7854791879654
			}
		},
		pwh_castle_conversation_eight_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_castle_conversation_eight_01"
			},
			sound_events = {
				[1.0] = "pwh_castle_conversation_eight_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.7152500152588
			}
		},
		pwh_castle_conversation_eleven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_castle_conversation_eleven_01"
			},
			sound_events = {
				[1.0] = "pwh_castle_conversation_eleven_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.9296875
			}
		},
		pdr_castle_conversation_eleven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_castle_conversation_eleven_01"
			},
			sound_events = {
				[1.0] = "pdr_castle_conversation_eleven_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.2667293548584
			}
		},
		pwh_castle_conversation_ten_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_castle_conversation_ten_02"
			},
			sound_events = {
				[1.0] = "pwh_castle_conversation_ten_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.1597917079926
			}
		},
		pbw_castle_conversation_six_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_castle_conversation_six_01"
			},
			sound_events = {
				[1.0] = "pbw_castle_conversation_six_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 6.7494583129883
			}
		},
		pbw_castle_conversation_nine_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_castle_conversation_nine_01"
			},
			sound_events = {
				[1.0] = "pbw_castle_conversation_nine_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.2841668128967
			}
		},
		pbw_castle_conversation_nine_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_castle_conversation_nine_02"
			},
			sound_events = {
				[1.0] = "pbw_castle_conversation_nine_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.0107707977295
			}
		},
		pdr_castle_conversation_seven_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_castle_conversation_seven_02"
			},
			sound_events = {
				[1.0] = "pdr_castle_conversation_seven_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.9878749847412
			}
		},
		pwh_castle_conversation_eight_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_castle_conversation_eight_02"
			},
			sound_events = {
				[1.0] = "pwh_castle_conversation_eight_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.1067707538605
			}
		},
		pwe_castle_conversation_two_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_castle_conversation_two_01"
			},
			sound_events = {
				[1.0] = "pwe_castle_conversation_two_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.3880624771118
			}
		},
		pwh_castle_conversation_five_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_castle_conversation_five_02"
			},
			sound_events = {
				[1.0] = "pwh_castle_conversation_five_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.4943957328796
			}
		},
		pes_castle_conversation_eight_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_eight_02"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_eight_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.7464165687561
			}
		},
		pwh_castle_conversation_four_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_castle_conversation_four_02"
			},
			sound_events = {
				[1.0] = "pwh_castle_conversation_four_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.5106041431427
			}
		},
		pbw_castle_conversation_four_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_castle_conversation_four_02"
			},
			sound_events = {
				[1.0] = "pbw_castle_conversation_four_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.1587290763855
			}
		},
		pes_castle_conversation_three_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_three_02"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_three_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 6.1702291965485
			}
		},
		pes_castle_conversation_six_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_six_02"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_six_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 0.91431248188019
			}
		},
		pwe_castle_conversation_ten_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_castle_conversation_ten_01"
			},
			sound_events = {
				[1.0] = "pwe_castle_conversation_ten_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.0736665725708
			}
		},
		pes_castle_conversation_one_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_one_01"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_one_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.3467707633972
			}
		},
		pbw_castle_conversation_four_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_castle_conversation_four_01"
			},
			sound_events = {
				[1.0] = "pbw_castle_conversation_four_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 9.0182085037231
			}
		},
		pwe_castle_conversation_five_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_castle_conversation_five_02"
			},
			sound_events = {
				[1.0] = "pwe_castle_conversation_five_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 8.2855834960938
			}
		},
		pes_castle_conversation_six_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_castle_conversation_six_01"
			},
			sound_events = {
				[1.0] = "pes_castle_conversation_six_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.5153751373291
			}
		},
		pwe_castle_conversation_two_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_castle_conversation_two_02"
			},
			sound_events = {
				[1.0] = "pwe_castle_conversation_two_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.4278960227966
			}
		},
		pwh_castle_conversation_seven_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_castle_conversation_seven_01"
			},
			sound_events = {
				[1.0] = "pwh_castle_conversation_seven_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 9.3860626220703
			}
		},
		pbw_castle_conversation_one_01 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_castle_conversation_one_01"
			},
			sound_events = {
				[1.0] = "pbw_castle_conversation_one_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.4232499599457
			}
		},
		pbw_castle_conversation_six_02 = {
			face_animations_n = 1,
			database = "hero_conversations_dlc_drachenfels_castle",
			sound_events_n = 1,
			category = "story_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_castle_conversation_six_02"
			},
			sound_events = {
				[1.0] = "pbw_castle_conversation_six_02"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.9466874599457
			}
		}
	})
end
