return function ()
	define_rule({
		name = "pdr_dialogue_01",
		response = "pdr_dialogue_01",
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
				OP.LT,
				2
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				300
			},
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_01",
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
		name = "pes_dialogue_response_04",
		response = "pes_dialogue_response_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_01"
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
		name = "pdr_dialogue_response_06",
		response = "pdr_dialogue_response_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_04"
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
		name = "pwe_dialogue_response_06",
		response = "pwe_dialogue_response_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_06"
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
		name = "pdr_dialogue_response_07",
		response = "pdr_dialogue_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_06"
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
		name = "pwe_dialogue_response_07",
		response = "pwe_dialogue_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_07"
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
		name = "pdr_dialogue_02",
		response = "pdr_dialogue_02",
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
				OP.LT,
				2
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				300
			},
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_02",
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
		name = "pwh_dialogue_response_07",
		response = "pwh_dialogue_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_02"
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
		name = "pdr_dialogue_response_08",
		response = "pdr_dialogue_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dialogue_response_07"
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
		name = "pbw_dialogue_response_04",
		response = "pbw_dialogue_response_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_08"
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
		name = "pdr_dialogue_response_09",
		response = "pdr_dialogue_response_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_04"
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
		name = "pwh_dialogue_response_08",
		response = "pwh_dialogue_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_09"
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
		name = "pdr_dialogue_response_09_1",
		response = "pdr_dialogue_response_09_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dialogue_response_08"
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
		name = "pwe_dialogue_response_08",
		response = "pwe_dialogue_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_09_1"
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
		name = "pdr_dialogue_response_10",
		response = "pdr_dialogue_response_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_08"
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
		name = "pwe_dialogue_03",
		response = "pwe_dialogue_03",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_03",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_03",
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
		name = "pbw_dialogue_response_05",
		response = "pbw_dialogue_response_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_03"
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
		name = "pwe_dialogue_response_09",
		response = "pwe_dialogue_response_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_05"
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
		name = "pwe_dialogue_06",
		response = "pwe_dialogue_06",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				300
			},
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_06",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_06",
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
		name = "pbw_dialogue_response_07",
		response = "pbw_dialogue_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_06"
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
		name = "pwe_dialogue_response_13",
		response = "pwe_dialogue_response_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_07"
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
		name = "pwh_dialogue_05",
		response = "pwh_dialogue_05",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_05",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_05",
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
		response = "pdr_dialogue_response_13",
		name = "pdr_dialogue_response_13",
		criterias = {}
	})
	define_rule({
		response = "pbw_dialogue_06",
		name = "pbw_dialogue_06",
		criterias = {}
	})
	define_rule({
		name = "pdr_dialogue_03",
		response = "pdr_dialogue_03",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				300
			},
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_03",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_03",
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
		name = "pes_dialogue_response_08",
		response = "pes_dialogue_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_03"
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
		name = "pdr_dialogue_response_15",
		response = "pdr_dialogue_response_15",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_08"
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
		name = "pbw_dialogue_response_08",
		response = "pbw_dialogue_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_15"
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
		name = "pwh_dialogue_06",
		response = "pwh_dialogue_06",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_06",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_06",
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
		name = "pwe_dialogue_response_16",
		response = "pwe_dialogue_response_16",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dialogue_06"
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
		name = "pwh_dialogue_response_13",
		response = "pwh_dialogue_response_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_16"
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
		name = "pes_dialogue_response_09",
		response = "pes_dialogue_response_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dialogue_response_13"
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
		name = "pwe_dialogue_response_17",
		response = "pwe_dialogue_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_09"
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
		name = "pwe_dialogue_07",
		response = "pwe_dialogue_07",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_07",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_07",
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
		name = "pes_dialogue_response_10",
		response = "pes_dialogue_response_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_07"
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
		name = "pwe_dialogue_response_18",
		response = "pwe_dialogue_response_18",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_10"
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
		name = "pes_dialogue_response_09a",
		response = "pes_dialogue_response_09a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_18"
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
		name = "pwe_dialogue_response_18a",
		response = "pwe_dialogue_response_18a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_09a"
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
		name = "pes_dialogue_02",
		response = "pes_dialogue_02",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				300
			},
			{
				"faction_memory",
				"once_per_level_pes_dialogue_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_dialogue_02",
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
		name = "pdr_dialogue_response_17",
		response = "pdr_dialogue_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_02"
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
		name = "pwh_dialogue_response_15",
		response = "pwh_dialogue_response_15",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_17"
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
		name = "pbw_dialogue_07",
		response = "pbw_dialogue_07",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				300
			},
			{
				"faction_memory",
				"once_per_level_pbw_dialogue_07",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_dialogue_07",
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
		name = "pdr_dialogue_response_18",
		response = "pdr_dialogue_response_18",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_07"
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
		name = "pwh_dialogue_response_17",
		response = "pwh_dialogue_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_18"
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
		name = "pes_dialogue_04",
		response = "pes_dialogue_04",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				300
			},
			{
				"faction_memory",
				"once_per_level_pes_dialogue_04",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_dialogue_04",
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
		name = "pdr_dialogue_response_19",
		response = "pdr_dialogue_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_04"
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
		name = "pbw_dialogue_response_13",
		response = "pbw_dialogue_response_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_19"
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
		name = "pes_dialogue_response_11",
		response = "pes_dialogue_response_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_13"
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
		name = "pwe_dialogue_09",
		response = "pwe_dialogue_09",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				"global_context",
				"current_act",
				OP.EQ,
				"act_1"
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				300
			},
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_09",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_09",
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
		name = "pbw_dialogue_response_19",
		response = "pbw_dialogue_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_09"
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
		name = "pwe_dialogue_response_22",
		response = "pwe_dialogue_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_19"
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
		name = "pbw_dialogue_response_20",
		response = "pbw_dialogue_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_22"
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
		name = "pwe_dialogue_09_1",
		response = "pwe_dialogue_09_1",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_09_1",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_09_1",
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
		name = "pes_dialogue_response_16",
		response = "pes_dialogue_response_16",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_09_1"
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
		name = "pbw_dialogue_response_23",
		response = "pbw_dialogue_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_16"
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
		name = "pes_dialogue_response_17",
		response = "pes_dialogue_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_23"
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
		name = "pbw_dialogue_response_24",
		response = "pbw_dialogue_response_24",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_17"
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
		name = "pwe_dialogue_10",
		response = "pwe_dialogue_10",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_10",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_10",
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
		name = "pes_dialogue_response_18",
		response = "pes_dialogue_response_18",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_10"
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
		name = "pbw_dialogue_response_25",
		response = "pbw_dialogue_response_25",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_18"
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
		name = "pbw_dialogue_08",
		response = "pbw_dialogue_08",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pbw_dialogue_08",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_dialogue_08",
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
		name = "pwh_dialogue_response_21",
		response = "pwh_dialogue_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_08"
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
		name = "pwe_dialogue_response_23",
		response = "pwe_dialogue_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dialogue_response_21"
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
		name = "pdr_dialogue_05",
		response = "pdr_dialogue_05",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_05",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_05",
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
		name = "pes_dialogue_response_20",
		response = "pes_dialogue_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_05"
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
		name = "pwh_dialogue_response_22",
		response = "pwh_dialogue_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_20"
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
		name = "pwe_dialogue_12",
		response = "pwe_dialogue_12",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_12",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_12",
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
		name = "pbw_dialogue_response_27",
		response = "pbw_dialogue_response_27",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_12"
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
		name = "pwe_dialogue_response_28",
		response = "pwe_dialogue_response_28",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_27"
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
		name = "pwh_dialogue_response_23",
		response = "pwh_dialogue_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_28"
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
		name = "pwe_dialogue_response_29",
		response = "pwe_dialogue_response_29",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dialogue_response_23"
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
		name = "pbw_dialogue_09",
		response = "pbw_dialogue_09",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pbw_dialogue_09",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_dialogue_09",
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
		name = "pwe_dialogue_response_30",
		response = "pwe_dialogue_response_30",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_09"
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
		name = "pbw_dialogue_response_28",
		response = "pbw_dialogue_response_28",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_=Data!P11"
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
		name = "pwe_dialogue_response_31",
		response = "pwe_dialogue_response_31",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_28"
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
		name = "pbw_dialogue_11",
		response = "pbw_dialogue_11",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pbw_dialogue_11",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_dialogue_11",
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
		name = "pdr_dialogue_response_26",
		response = "pdr_dialogue_response_26",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_11"
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
		name = "pbw_dialogue_response_29",
		response = "pbw_dialogue_response_29",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_26"
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
		name = "pdr_dialogue_response_26_1",
		response = "pdr_dialogue_response_26_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_29"
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
		name = "pdr_dialogue_07",
		response = "pdr_dialogue_07",
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
				OP.LT,
				2
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				300
			},
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_07",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_07",
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
		name = "pes_dialogue_response_24",
		response = "pes_dialogue_response_24",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_07"
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
		name = "pdr_dialogue_response_27",
		response = "pdr_dialogue_response_27",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_24"
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
		name = "pwe_dialogue_response_32",
		response = "pwe_dialogue_response_32",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_27"
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
		name = "pdr_dialogue_09",
		response = "pdr_dialogue_09",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_09",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_09",
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
		name = "pwh_dialogue_response_26",
		response = "pwh_dialogue_response_26",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_09"
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
		name = "pdr_dialogue_response_28",
		response = "pdr_dialogue_response_28",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dialogue_response_26"
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
		name = "pdr_dialogue_10",
		response = "pdr_dialogue_10",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_10",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_10",
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
		name = "pes_dialogue_response_25",
		response = "pes_dialogue_response_25",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_10"
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
		name = "pdr_dialogue_response_29",
		response = "pdr_dialogue_response_29",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_25"
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
		name = "pdr_dialogue_11",
		response = "pdr_dialogue_11",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_11",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_11",
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
		name = "pwe_dialogue_response_34",
		response = "pwe_dialogue_response_34",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_11"
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
		name = "pdr_dialogue_response_30",
		response = "pdr_dialogue_response_30",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_34"
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
		name = "pwe_dialogue_response_35",
		response = "pwe_dialogue_response_35",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_30"
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
		name = "pdr_dialogue_12",
		response = "pdr_dialogue_12",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				300
			},
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_12",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_12",
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
		name = "pwe_dialogue_response_36",
		response = "pwe_dialogue_response_36",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_12"
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
		name = "pdr_dialogue_response_32",
		response = "pdr_dialogue_response_32",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_36"
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
		name = "pbw_dialogue_response_31",
		response = "pbw_dialogue_response_31",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_32"
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
		name = "pwh_dialogue_08",
		response = "pwh_dialogue_08",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_08",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_08",
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
		name = "pbw_dialogue_response_32",
		response = "pbw_dialogue_response_32",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dialogue_08"
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
		name = "pwh_dialogue_09",
		response = "pwh_dialogue_09",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_09",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_09",
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
		name = "pbw_dialogue_response_33",
		response = "pbw_dialogue_response_33",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dialogue_09"
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
		name = "pwh_dialogue_respones_26b",
		response = "pwh_dialogue_respones_26b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_33"
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
		name = "pwh_dialogue_13",
		response = "pwh_dialogue_13",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_13",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_13",
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
		name = "pbw_dialogue_response_37",
		response = "pbw_dialogue_response_37",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dialogue_13"
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
		name = "pwh_dialogue_response_27",
		response = "pwh_dialogue_response_27",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_37"
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
		name = "pwh_dialogue_14",
		response = "pwh_dialogue_14",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_14",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_dialogue_14",
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
		name = "pes_dialogue_response_26",
		response = "pes_dialogue_response_26",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dialogue_14"
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
		name = "pwh_dialogue_response_28",
		response = "pwh_dialogue_response_28",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_26"
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
		name = "pes_dialogue_08",
		response = "pes_dialogue_08",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pes_dialogue_12",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_dialogue_12",
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
		name = "pwe_dialogue_response_37",
		response = "pwe_dialogue_response_37",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_08"
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
		name = "pes_dialogue_response_27",
		response = "pes_dialogue_response_27",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_37"
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
		name = "pwe_dialogue_response_37_1",
		response = "pwe_dialogue_response_37_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_27"
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
		name = "pwe_dialogue_13",
		response = "pwe_dialogue_13",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_13",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_dialogue_13",
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
		name = "pbw_dialogue_response_39",
		response = "pbw_dialogue_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_13"
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
		name = "pwe_dialogue_response_38",
		response = "pwe_dialogue_response_38",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_39"
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
		name = "pdr_dialogue_13",
		response = "pdr_dialogue_13",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_13",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_dialogue_13",
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
		name = "pwe_dialogue_response_39",
		response = "pwe_dialogue_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_13"
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
		name = "pdr_dialogue_response_33",
		response = "pdr_dialogue_response_33",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_39"
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
		name = "pwe_dialogue_response_40",
		response = "pwe_dialogue_response_40",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_33"
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
		name = "pdr_dialogue_response_34",
		response = "pdr_dialogue_response_34",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dialogue_response_40"
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
		name = "pwe_dialogue_response_41",
		response = "pwe_dialogue_response_41",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dialogue_response_34"
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
		name = "pbw_dialogue_12",
		response = "pbw_dialogue_12",
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
				OP.LT,
				4
			},
			{
				"user_context",
				"pacing_state",
				OP.EQ,
				"pacing_relax"
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				40
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
				300
			},
			{
				"faction_memory",
				"once_per_level_pbw_dialogue_12",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_dialogue_12",
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
		name = "pes_dialogue_response_29",
		response = "pes_dialogue_response_29",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_12"
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
		name = "pbw_dialogue_response_40",
		response = "pbw_dialogue_response_40",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_29"
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
		name = "pes_dialogue_response_30",
		response = "pes_dialogue_response_30",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dialogue_response_40"
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
		name = "pbw_dialogue_response_41",
		response = "pbw_dialogue_response_41",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dialogue_response_=Data!P11"
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
		response = "pdr_gameplay_killing_a_rat_ogre_01",
		name = "pdr_gameplay_killing_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_07",
		name = "pbw_gameplay_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_killing_a_rat_ogre_01"
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
		response = "pdr_gameplay_response_06",
		name = "pdr_gameplay_response_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_07"
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
		response = "pbw_gameplay_elf_killing_spawn_melee_01",
		name = "pbw_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_185",
		name = "pwe_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_spawn_melee_01"
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
		response = "pwh_gameplay_response_183",
		name = "pwh_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_185"
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
		response = "pdr_gameplay_elf_killing_spawn_melee_01",
		name = "pdr_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_180",
		name = "pwe_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_spawn_melee_01"
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
		response = "pwh_gameplay_response_177",
		name = "pwh_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_180"
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
		response = "pes_gameplay_elf_killing_spawn_melee_01",
		name = "pes_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_182",
		name = "pwe_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_187"
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
		response = "pdr_gameplay_response_181",
		name = "pdr_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_182"
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
		response = "pwh_gameplay_elf_killing_spawn_melee_01",
		name = "pwh_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_187",
		name = "pwe_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_spawn_melee_01"
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
		response = "pes_gameplay_response_175",
		name = "pes_gameplay_response_175",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_187"
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
		response = "pbw_gameplay_hunter_killing_spawn_melee_01",
		name = "pbw_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_184",
		name = "pwh_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_spawn_melee_01"
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
		response = "pdr_gameplay_response_185",
		name = "pdr_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_184"
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
		response = "pdr_gameplay_hunter_killing_spawn_melee_01",
		name = "pdr_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_178",
		name = "pwh_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_spawn_melee_01"
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
		response = "pes_gameplay_response_168",
		name = "pes_gameplay_response_168",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_178"
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
		response = "pes_gameplay_hunter_killing_spawn_melee_01",
		name = "pes_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_180",
		name = "pwh_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_spawn_melee_01"
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
		response = "pbw_gameplay_response_177",
		name = "pbw_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_180"
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
		response = "pwe_gameplay_hunter_killing_spawn_melee_01",
		name = "pwe_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_182",
		name = "pwh_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_spawn_melee_01"
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
		response = "pes_gameplay_response_171",
		name = "pes_gameplay_response_171",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_182"
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
		response = "pbw_gameplay_ranger_killing_spawn_melee_01",
		name = "pbw_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_184",
		name = "pdr_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_spawn_melee_01"
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
		response = "pes_gameplay_response_172",
		name = "pes_gameplay_response_172",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_184"
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
		response = "pes_gameplay_ranger_killing_spawn_melee_01",
		name = "pes_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_180",
		name = "pdr_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_spawn_melee_01"
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
		response = "pwh_gameplay_response_179",
		name = "pwh_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_180"
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
		response = "pwe_gameplay_ranger_killing_spawn_melee_01",
		name = "pwe_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_182",
		name = "pdr_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_spawn_melee_01"
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
		response = "pes_gameplay_response_169",
		name = "pes_gameplay_response_169",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_182"
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
		response = "pwh_gameplay_ranger_killing_spawn_melee_01",
		name = "pwh_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_186",
		name = "pdr_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_spawn_melee_01"
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
		response = "pbw_gameplay_response_179",
		name = "pbw_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_186"
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
		response = "pbw_gameplay_soldier_killing_spawn_melee_01",
		name = "pbw_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_173",
		name = "pes_gameplay_response_173",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pwe_gameplay_response_184",
		name = "pwe_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_173"
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
		response = "pdr_gameplay_soldier_killing_spawn_melee_01",
		name = "pdr_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_167",
		name = "pes_gameplay_response_167",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pbw_gameplay_response_174",
		name = "pbw_gameplay_response_174",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_167"
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
		response = "pwe_gameplay_soldier_killing_spawn_melee_01",
		name = "pwe_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_170",
		name = "pes_gameplay_response_170",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pwh_gameplay_response_181",
		name = "pwh_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_170"
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
		response = "pwh_gameplay_soldier_killing_spawn_melee_01",
		name = "pwh_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_174",
		name = "pes_gameplay_response_174",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pwe_gameplay_response_186",
		name = "pwe_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_174"
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
		response = "pdr_gameplay_wizard_killing_spawn_melee_01",
		name = "pdr_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_175",
		name = "pbw_gameplay_response_175",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_spawn_melee_01"
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
		response = "pwe_gameplay_response_181",
		name = "pwe_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_175"
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
		response = "pes_gameplay_wizard_killing_spawn_melee_01",
		name = "pes_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_176",
		name = "pbw_gameplay_response_176",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_spawn_melee_01"
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
		response = "pwe_gameplay_response_183",
		name = "pwe_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_176"
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
		response = "pwe_gameplay_wizard_killing_spawn_melee_01",
		name = "pwe_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_178",
		name = "pbw_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_spawn_melee_01"
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
		response = "pdr_gameplay_response_183",
		name = "pdr_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_178"
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
		response = "pwh_gameplay_wizard_killing_spawn_melee_01",
		name = "pwh_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_180",
		name = "pbw_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_spawn_melee_01"
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
		response = "pdr_gameplay_response_187",
		name = "pdr_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_180"
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
		response = "pbw_gameplay_elf_killing_spawn_ranged_01",
		name = "pbw_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_192",
		name = "pwe_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_spawn_ranged_01"
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
		response = "pdr_gameplay_response_193",
		name = "pdr_gameplay_response_193",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_192"
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
		response = "pdr_gameplay_elf_killing_spawn_ranged_01",
		name = "pdr_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_188",
		name = "pwe_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_spawn_ranged_01"
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
		response = "pes_gameplay_response_177",
		name = "pes_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_188"
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
		response = "pes_gameplay_elf_killing_spawn_ranged_01",
		name = "pes_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_191",
		name = "pwe_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_spawn_ranged_01"
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
		response = "pwh_gameplay_response_187",
		name = "pwh_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_191"
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
		response = "pwh_gameplay_elf_killing_spawn_ranged_01",
		name = "pwh_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_195",
		name = "pwe_gameplay_response_195",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_spawn_ranged_01"
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
		response = "pbw_gameplay_response_187",
		name = "pbw_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_195"
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
		response = "pbw_gameplay_hunter_killing_spawn_ranged_01",
		name = "pbw_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_192",
		name = "pwh_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_spawn_ranged_01"
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
		response = "pwe_gameplay_response_193",
		name = "pwe_gameplay_response_193",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_192"
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
		response = "pdr_gameplay_hunter_killing_spawn_ranged_01",
		name = "pdr_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_186",
		name = "pwh_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_spawn_ranged_01"
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
		response = "pwe_gameplay_response_189",
		name = "pwe_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_186"
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
		response = "pes_gameplay_hunter_killing_spawn_ranged_01",
		name = "pes_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_188",
		name = "pwh_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_spawn_ranged_01"
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
		response = "pbw_gameplay_response_184",
		name = "pbw_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_188"
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
		response = "pwe_gameplay_hunter_killing_spawn_ranged_01",
		name = "pwe_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_190",
		name = "pwh_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_spawn_ranged_01"
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
		response = "pbw_gameplay_response_186",
		name = "pbw_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_190"
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
		response = "pbw_gameplay_ranger_killing_spawn_ranged_01",
		name = "pbw_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_192",
		name = "pdr_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_spawn_ranged_01"
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
		response = "pes_gameplay_response_180",
		name = "pes_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_192"
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
		response = "pes_gameplay_ranger_killing_spawn_ranged_01",
		name = "pes_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_188",
		name = "pdr_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_spawn_ranged_01"
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
		response = "pwe_gameplay_response_190",
		name = "pwe_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_188"
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
		response = "pwe_gameplay_ranger_killing_spawn_ranged_01",
		name = "pwe_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_190",
		name = "pdr_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_spawn_ranged_01"
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
		response = "pwh_gameplay_response_189",
		name = "pwh_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_190"
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
		response = "pwh_gameplay_ranger_killing_spawn_ranged_01",
		name = "pwh_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_194",
		name = "pdr_gameplay_response_194",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_spawn_ranged_01"
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
		response = "pes_gameplay_response_182",
		name = "pes_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_194"
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
		response = "pbw_gameplay_soldier_killing_spawn_ranged_01",
		name = "pbw_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_181",
		name = "pes_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pwh_gameplay_response_191",
		name = "pwh_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_181"
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
		response = "pdr_gameplay_soldier_killing_spawn_ranged_01",
		name = "pdr_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_176",
		name = "pes_gameplay_response_176",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pbw_gameplay_response_181",
		name = "pbw_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_176"
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
		response = "pwe_gameplay_soldier_killing_spawn_ranged_01",
		name = "pwe_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_178",
		name = "pes_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pdr_gameplay_response_191",
		name = "pdr_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_178"
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
		response = "pwh_gameplay_soldier_killing_spawn_ranged_01",
		name = "pwh_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_183",
		name = "pes_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pwe_gameplay_response_194",
		name = "pwe_gameplay_response_194",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_183"
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
		response = "pdr_gameplay_wizard_killing_spawn_ranged_01",
		name = "pdr_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_182",
		name = "pbw_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_spawn_ranged_01"
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
		response = "pwh_gameplay_response_185",
		name = "pwh_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_182"
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
		response = "pes_gameplay_wizard_killing_spawn_ranged_01",
		name = "pes_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_183",
		name = "pbw_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_spawn_ranged_01"
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
		response = "pdr_gameplay_response_189",
		name = "pdr_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_183"
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
		response = "pwe_gameplay_wizard_killing_spawn_ranged_01",
		name = "pwe_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_185",
		name = "pbw_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_spawn_ranged_01"
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
		response = "pes_gameplay_response_179",
		name = "pes_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_185"
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
		response = "pwh_gameplay_wizard_killing_spawn_ranged_01",
		name = "pwh_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_188",
		name = "pbw_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_spawn_ranged_01"
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
		response = "pdr_gameplay_response_195",
		name = "pdr_gameplay_response_195",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_188"
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
		response = "pbw_gameplay_elf_killing_troll_melee_01",
		name = "pbw_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_152",
		name = "pwe_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_troll_melee_01"
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
		response = "pwh_gameplay_response_151",
		name = "pwh_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_152"
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
		response = "pdr_gameplay_elf_killing_troll_melee_01",
		name = "pdr_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_147",
		name = "pwe_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_troll_melee_01"
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
		response = "pes_gameplay_response_137",
		name = "pes_gameplay_response_137",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_147"
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
		response = "pes_gameplay_elf_killing_troll_melee_01",
		name = "pes_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_149",
		name = "pwe_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_troll_melee_01"
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
		response = "pdr_gameplay_response_150",
		name = "pdr_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149"
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
		response = "pwh_gameplay_elf_killing_troll_melee_01",
		name = "pwh_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_154",
		name = "pwe_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_troll_melee_01"
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
		response = "pbw_gameplay_response_147",
		name = "pbw_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149"
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
		response = "pbw_gameplay_hunter_killing_troll_melee_01",
		name = "pbw_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_152",
		name = "pwh_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_troll_melee_01"
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
		response = "pdr_gameplay_response_154",
		name = "pdr_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149"
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
		response = "pdr_gameplay_hunter_killing_troll_melee_01",
		name = "pdr_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_146",
		name = "pwh_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_troll_melee_01"
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
		response = "pbw_gameplay_response_142",
		name = "pbw_gameplay_response_142",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_146"
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
		response = "pes_gameplay_hunter_killing_troll_melee_01",
		name = "pes_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_148",
		name = "pwh_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_troll_melee_01"
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
		response = "pwe_gameplay_response_150",
		name = "pwe_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_148"
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
		response = "pwe_gameplay_hunter_killing_troll_melee_01",
		name = "pwe_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_150",
		name = "pwh_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_troll_melee_01"
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
		response = "pdr_gameplay_response_152",
		name = "pdr_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_150"
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
		response = "pbw_gameplay_ranger_killing_troll_melee_01",
		name = "pbw_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_153",
		name = "pdr_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_troll_melee_01"
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
		response = "pes_gameplay_response_140",
		name = "pes_gameplay_response_140",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_153"
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
		response = "pwe_gameplay_ranger_killing_troll_melee_01",
		name = "pwe_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_151",
		name = "pdr_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_troll_melee_01"
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
		response = "pwh_gameplay_response_149",
		name = "pwh_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_151"
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
		response = "pwh_gameplay_ranger_killing_troll_melee_01",
		name = "pwh_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_155",
		name = "pdr_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_troll_melee_01"
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
		response = "pes_gameplay_response_142",
		name = "pes_gameplay_response_142",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_155"
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
		response = "pbw_gameplay_soldier_killing_troll_melee_01",
		name = "pbw_gameplay_soldier_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_141",
		name = "pes_gameplay_response_141",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_troll_melee_01"
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
		response = "pwe_gameplay_response_151",
		name = "pwe_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_141"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_136",
		name = "pes_gameplay_response_136",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_troll_melee_01"
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
		response = "pwh_gameplay_response_145",
		name = "pwh_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_136"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_138",
		name = "pes_gameplay_response_138",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_troll_melee_01"
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
		response = "pbw_gameplay_response_145",
		name = "pbw_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_138"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_143",
		name = "pes_gameplay_response_143",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_troll_melee_01"
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
		response = "pbw_gameplay_response_199",
		name = "pbw_gameplay_response_199",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_143"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_141",
		name = "pbw_gameplay_response_141",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_troll_melee_01"
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
		response = "pwe_gameplay_response_148",
		name = "pwe_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_141"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_144",
		name = "pbw_gameplay_response_144",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_troll_melee_01"
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
		response = "pwh_gameplay_response_147",
		name = "pwh_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_144"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_146",
		name = "pbw_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_troll_melee_01"
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
		response = "pes_gameplay_response_139",
		name = "pes_gameplay_response_139",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_146"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_148",
		name = "pbw_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_troll_melee_01"
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
		response = "pes_gameplay_response_144",
		name = "pes_gameplay_response_144",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_148"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_159",
		name = "pwe_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_troll_ranged_01"
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
		response = "pdr_gameplay_response_161",
		name = "pdr_gameplay_response_161",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_159"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_155",
		name = "pwe_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_troll_ranged_01"
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
		response = "pes_gameplay_response_146",
		name = "pes_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_155"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_157",
		name = "pwe_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_troll_ranged_01"
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
		response = "pwh_gameplay_response_155",
		name = "pwh_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_157"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_162",
		name = "pwe_gameplay_response_162",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_156",
		name = "pbw_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_162"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_160",
		name = "pwh_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_troll_ranged_01"
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
		response = "pwe_gameplay_response_160",
		name = "pwe_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_160"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_154",
		name = "pwh_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_150",
		name = "pbw_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_154"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_156",
		name = "pwh_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_troll_ranged_01"
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
		response = "pdr_gameplay_response_157",
		name = "pdr_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_156"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_158",
		name = "pwh_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_troll_ranged_01"
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
		response = "pes_gameplay_response_148",
		name = "pes_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_158"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_160",
		name = "pdr_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_troll_ranged_01"
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
		response = "pes_gameplay_response_149",
		name = "pes_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_160"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_156",
		name = "pdr_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_151",
		name = "pbw_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_156"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_158",
		name = "pdr_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_troll_ranged_01"
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
		response = "pwh_gameplay_response_157",
		name = "pwh_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_158"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_162",
		name = "pdr_gameplay_response_162",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_155",
		name = "pbw_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_162"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_150",
		name = "pes_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pwh_gameplay_response_159",
		name = "pwh_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_150"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_145",
		name = "pes_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pwh_gameplay_response_153",
		name = "pwh_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_145"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_147",
		name = "pes_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_153",
		name = "pbw_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_147"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_151",
		name = "pes_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pwe_gameplay_response_161",
		name = "pwe_gameplay_response_161",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_151"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_149",
		name = "pbw_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_troll_ranged_01"
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
		response = "pwe_gameplay_response_156",
		name = "pwe_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_149"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_152",
		name = "pbw_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_troll_ranged_01"
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
		response = "pwe_gameplay_response_158",
		name = "pwe_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_152"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_159",
		name = "pdr_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_154",
		name = "pbw_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_159"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_chaos_troll",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_157",
		name = "pbw_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_troll_ranged_01"
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
		response = "pdr_gameplay_response_163",
		name = "pdr_gameplay_response_163",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_157"
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
		response = "pbw_gameplay_killing_rat_ogre_01",
		name = "pbw_gameplay_killing_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_04",
		name = "pes_gameplay_response_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_killing_rat_ogre_01"
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
		response = "pdr_gameplay_soldier_shooting_rat_ogre_01",
		name = "pdr_gameplay_soldier_shooting_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
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
		response = "pwh_gameplay_response_07",
		name = "pwh_gameplay_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_shooting_rat_ogre_01"
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
		response = "pes_gameplay_killing_rat_ogre_01",
		name = "pes_gameplay_killing_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_07",
		name = "pdr_gameplay_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_killing_rat_ogre_01"
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
		response = "pdr_hunter_shoots_rat_ogre_01",
		name = "pdr_hunter_shoots_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
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
		response = "pwh_gameplay_response_08",
		name = "pwh_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hunter_shoots_rat_ogre_01"
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
		response = "pbw_gameplay_response_08",
		name = "pbw_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_08"
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
		response = "pwh_gameplay_killing_a_rat_ogre_01",
		name = "pwh_gameplay_killing_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_08",
		name = "pwe_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_killing_a_rat_ogre_01"
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
		response = "pes_gameplay_elf_shoots_a_rat_ogre_01",
		name = "pes_gameplay_elf_shoots_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
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
		response = "pwe_gameplay_response_09",
		name = "pwe_gameplay_response_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_shoots_a_rat_ogre_01"
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
		response = "pwe_gameplay_killing_a_rat_ogre_01",
		name = "pwe_gameplay_killing_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_05",
		name = "pes_gameplay_response_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_killing_a_rat_ogre_01"
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
		response = "pdr_gameplay_killing_a_rat_ogre_crossbow_01",
		name = "pdr_gameplay_killing_a_rat_ogre_crossbow_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
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
				"query_context",
				"weapon_type",
				OP.EQ,
				"dr_crossbow"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_07",
		name = "pwe_gameplay_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_killing_a_rat_ogre_crossbow_01"
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
		response = "pdr_gameplay_wizard_fires_a_rat_ogre_01",
		name = "pdr_gameplay_wizard_fires_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"dot_type",
				OP.EQ,
				"burning_dot"
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_06",
		name = "pwh_gameplay_response_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_fires_a_rat_ogre_01"
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
		response = "pbw_gameplay_response_07_b",
		name = "pbw_gameplay_response_07_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_06"
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
		response = "pwe_gameplay_hunter_misses_bomb_01",
		name = "pwe_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwh_gameplay_response_19",
		name = "pwh_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_misses_bomb_01"
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
		response = "pwe_gameplay_response_20",
		name = "pwe_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_19"
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
		response = "pdr_gameplay_hunter_misses_bomb_01",
		name = "pdr_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwh_gameplay_response_20",
		name = "pwh_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_misses_bomb_01"
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
		response = "pdr_gameplay_response_17",
		name = "pdr_gameplay_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_20"
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
		response = "pbw_gameplay_hunter_misses_bomb_01",
		name = "pbw_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwh_gameplay_response_21",
		name = "pwh_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_misses_bomb_01"
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
		response = "pes_gameplay_hunter_misses_bomb_01",
		name = "pes_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwh_gameplay_response_22",
		name = "pwh_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_misses_bomb_01"
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
		response = "pwh_gameplay_elf_misses_bomb_01",
		name = "pwh_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwe_gameplay_response_21",
		name = "pwe_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_misses_bomb_01"
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
		response = "pdr_gameplay_elf_misses_bomb_01",
		name = "pdr_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwe_gameplay_response_22",
		name = "pwe_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_misses_bomb_01"
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
		response = "pbw_gameplay_elf_misses_bomb_01",
		name = "pbw_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwe_gameplay_response_23",
		name = "pwe_gameplay_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_misses_bomb_01"
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
		response = "pes_gameplay_elf_misses_bomb_01",
		name = "pes_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwe_gameplay_response_24",
		name = "pwe_gameplay_response_24",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_misses_bomb_01"
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
		response = "pwh_gameplay_wizard_misses_bomb_01",
		name = "pwh_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pbw_gameplay_response_21",
		name = "pbw_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_misses_bomb_01"
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
		response = "pdr_gameplay_wizard_misses_bomb_01",
		name = "pdr_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwb_gameplay_response_18",
		name = "pwb_gameplay_response_18",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_misses_bomb_01"
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
		response = "pwe_gameplay_wizard_misses_bomb_01",
		name = "pwe_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pbw_gameplay_response_19",
		name = "pbw_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_misses_bomb_01"
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
		response = "pes_gameplay_wizard_misses_bomb_01",
		name = "pes_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pbw_gameplay_response_20",
		name = "pbw_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_misses_bomb_01"
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
		response = "pwh_gameplay_solider_misses_bomb_01",
		name = "pwh_gameplay_solider_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pes_gameplay_response_16",
		name = "pes_gameplay_response_16",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_solider_misses_bomb_01"
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
		response = "pdr_gameplay_soldier_misses_bomb_01",
		name = "pdr_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pes_gameplay_response_13",
		name = "pes_gameplay_response_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_misses_bomb_01"
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
		response = "pdr_gameplay_response_18",
		name = "pdr_gameplay_response_18",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_13"
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
		response = "pwe_gameplay_soldier_misses_bomb_01",
		name = "pwe_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pes_gameplay_response_14",
		name = "pes_gameplay_response_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_misses_bomb_01"
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
		response = "pbw_gameplay_soldier_misses_bomb_01",
		name = "pbw_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pes_gameplay_response_15",
		name = "pes_gameplay_response_15",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_misses_bomb_01"
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
		response = "pwh_gameplay_ranger_misses_bomb_01",
		name = "pwh_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pdr_gameplay_response_19",
		name = "pdr_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_misses_bomb_01"
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
		response = "pes_gameplay_ranger_misses_bomb_01",
		name = "pes_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pdr_gameplay_response_22",
		name = "pdr_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_misses_bomb_01"
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
		response = "pes_gameplay_response_17",
		name = "pes_gameplay_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_22"
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
		response = "pdr_gameplay_response_23",
		name = "pdr_gameplay_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_17"
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
		response = "pwe_gameplay_ranger_misses_bomb_01",
		name = "pwe_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pdr_gameplay_response_20",
		name = "pdr_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_misses_bomb_01"
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
		response = "pbw_gameplay_ranger_misses_bomb_01",
		name = "pbw_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pdr_gameplay_response_21",
		name = "pdr_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_misses_bomb_01"
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
		pbw_dialogue_response_24 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_24"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_24"
			}
		},
		pwh_dialogue_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_response_07"
			}
		},
		pbw_dialogue_response_29 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_29"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_29"
			}
		},
		pes_dialogue_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_20"
			}
		},
		pwh_gameplay_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_07"
			}
		},
		pbw_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_misses_bomb_01"
			}
		},
		pes_dialogue_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_02"
			}
		},
		pes_gameplay_response_174 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_174"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_174"
			}
		},
		pes_dialogue_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_04"
			}
		},
		pwh_gameplay_response_160 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_160"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_160"
			}
		},
		pwe_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_184"
			}
		},
		pbw_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_188"
			}
		},
		pes_gameplay_response_173 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_173"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_173"
			}
		},
		pes_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_ranged_01"
			}
		},
		pdr_dialogue_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_02"
			}
		},
		pbw_gameplay_response_199 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_199",
				[2.0] = "pdr_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_199",
				[2.0] = "pdr_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pwh_dialogue_response_22 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_response_22"
			}
		},
		pes_dialogue_response_30 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_30"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_30"
			}
		},
		pdr_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_186"
			}
		},
		pwe_dialogue_response_35 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_35"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_35"
			}
		},
		pwe_dialogue_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_23"
			}
		},
		pwe_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_ranged_01"
			}
		},
		pwh_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pbw_gameplay_response_144 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_144"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_144"
			}
		},
		pwe_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pbw_gameplay_soldier_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_troll_melee_01"
			}
		},
		pwe_gameplay_response_191 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_191"
			}
		},
		pwe_gameplay_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_08"
			}
		},
		pwe_gameplay_response_161 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_161",
				[2.0] = "pdr_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_161",
				[2.0] = "pdr_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_dialogue_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_07"
			}
		},
		pwh_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pbw_dialogue_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_07"
			}
		},
		pes_gameplay_response_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_05"
			}
		},
		pes_gameplay_response_175 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_175"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_175"
			}
		},
		pdr_gameplay_response_161 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_gameplay_response_161",
				[2.0] = "pdr_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_161",
				[2.0] = "pdr_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pbw_dialogue_response_27 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_27"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_27"
			}
		},
		pdr_dialogue_response_13 = {
			sound_events_n = 0,
			face_animations_n = 0,
			database = "player_conversations_honduras",
			category = "default",
			dialogue_animations_n = 0,
			sound_events = {},
			dialogue_animations = {},
			face_animations = {},
			localization_strings = {}
		},
		pbw_gameplay_response_146 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_146"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_146"
			}
		},
		pbw_dialogue_response_19 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_19"
			}
		},
		pwh_gameplay_response_153 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_153",
				[2.0] = "pwe_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_153",
				[2.0] = "pwe_gameplay_soldier_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_response_151 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_151",
				[2.0] = "pdr_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_151",
				[2.0] = "pdr_gameplay_soldier_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pbw_dialogue_response_31 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_31"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_31"
			}
		},
		pwh_dialogue_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_response_08"
			}
		},
		pwe_dialogue_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_07"
			}
		},
		pes_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pwh_gameplay_response_155 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_155",
				[2.0] = "pwh_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_155",
				[2.0] = "pwh_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_180"
			}
		},
		pdr_gameplay_response_157 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_gameplay_response_157",
				[2.0] = "pwe_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_157",
				[2.0] = "pwe_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_dialogue_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_03"
			}
		},
		pes_dialogue_response_18 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_18"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_18"
			}
		},
		pdr_gameplay_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_07"
			}
		},
		pes_gameplay_response_171 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_171"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_171"
			}
		},
		pbw_gameplay_response_177 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_177"
			}
		},
		pbw_dialogue_response_25 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_25"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_25"
			}
		},
		pes_gameplay_response_168 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_168"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_168"
			}
		},
		pdr_gameplay_response_156 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_156"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_156"
			}
		},
		pdr_dialogue_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_05"
			}
		},
		pwe_dialogue_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_06"
			}
		},
		pwh_dialogue_response_15 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_response_15"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_response_15"
			}
		},
		pwh_gameplay_response_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_06"
			}
		},
		pwh_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_184"
			}
		},
		pwe_dialogue_response_17 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_17"
			}
		},
		pwh_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_186"
			}
		},
		pdr_dialogue_response_19 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_19"
			}
		},
		pes_gameplay_response_142 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_142"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_142"
			}
		},
		pwe_dialogue_response_36 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_36"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_36"
			}
		},
		pbw_dialogue_response_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_13"
			}
		},
		pwh_gameplay_response_177 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_177"
			}
		},
		pes_gameplay_response_179 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_179"
			}
		},
		pbw_dialogue_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_07"
			}
		},
		pwe_gameplay_soldier_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_misses_bomb_01"
			}
		},
		pwe_dialogue_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_09"
			}
		},
		pdr_dialogue_response_15 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_15"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_15"
			}
		},
		pwh_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pwe_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_182"
			}
		},
		pbw_dialogue_response_32 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_32"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_32"
			}
		},
		pwe_dialogue_response_30 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_30"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_30"
			}
		},
		pwe_gameplay_response_149 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_149"
			}
		},
		pes_gameplay_response_17 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_17"
			}
		},
		pbw_gameplay_response_141 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_141"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_141"
			}
		},
		pwe_gameplay_response_162 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_162"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_162"
			}
		},
		pbw_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pes_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pwe_dialogue_response_18a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_18a"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_18a"
			}
		},
		pes_gameplay_killing_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_killing_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_killing_rat_ogre_01"
			}
		},
		pdr_gameplay_response_151 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_151"
			}
		},
		pbw_gameplay_killing_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_killing_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_killing_rat_ogre_01"
			}
		},
		pes_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_150"
			}
		},
		pwh_dialogue_response_28 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_response_28"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_response_28"
			}
		},
		pbw_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_185"
			}
		},
		pwh_gameplay_response_191 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_191"
			}
		},
		pes_gameplay_response_138 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_138"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_138"
			}
		},
		pwe_dialogue_response_28 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_28"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_28"
			}
		},
		pbw_gameplay_response_154 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_154",
				[2.0] = "pwh_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_154",
				[2.0] = "pwh_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_21"
			}
		},
		pdr_dialogue_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_07"
			}
		},
		pbw_gameplay_response_155 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_155",
				[2.0] = "pbw_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_155",
				[2.0] = "pbw_gameplay_soldier_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_response_154 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_154"
			}
		},
		pdr_gameplay_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_23"
			}
		},
		pes_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_184"
			}
		},
		pwe_gameplay_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_23"
			}
		},
		pwh_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_181"
			}
		},
		pwe_dialogue_response_38 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_38"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_38"
			}
		},
		pwe_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_20"
			}
		},
		pwh_dialogue_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_08"
			}
		},
		pwe_gameplay_response_147 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_147"
			}
		},
		pdr_gameplay_response_154 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_154"
			}
		},
		pbw_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_180"
			}
		},
		pdr_dialogue_response_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_10"
			}
		},
		pbw_gameplay_response_179 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_179"
			}
		},
		pwe_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_melee_01"
			}
		},
		pbw_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_181"
			}
		},
		pwh_gameplay_response_159 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_159",
				[2.0] = "pdr_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_159",
				[2.0] = "pdr_gameplay_soldier_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_21"
			}
		},
		pes_gameplay_response_172 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_172"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_172"
			}
		},
		pwe_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_misses_bomb_01"
			}
		},
		pbw_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_misses_bomb_01"
			}
		},
		pdr_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_20"
			}
		},
		pwe_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_misses_bomb_01"
			}
		},
		pwh_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_21"
			}
		},
		pbw_dialogue_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_20"
			}
		},
		pdr_gameplay_response_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_06"
			}
		},
		pes_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_misses_bomb_01"
			}
		},
		pbw_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_184"
			}
		},
		pdr_gameplay_response_19 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_19"
			}
		},
		pwh_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_misses_bomb_01"
			}
		},
		pes_gameplay_response_15 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_15"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_15"
			}
		},
		pbw_gameplay_soldier_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_misses_bomb_01"
			}
		},
		pdr_dialogue_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_09"
			}
		},
		pes_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_misses_bomb_01"
			}
		},
		pes_gameplay_response_136 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_136"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_136"
			}
		},
		pwh_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_misses_bomb_01"
			}
		},
		pes_gameplay_response_14 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_14"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_14"
			}
		},
		pdr_gameplay_response_18 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_18"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_18"
			}
		},
		pbw_dialogue_response_37 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_37"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_37"
			}
		},
		pwh_dialogue_response_26 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_response_26"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_response_26"
			}
		},
		pwe_gameplay_ranger_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_troll_melee_01"
			}
		},
		pwe_gameplay_response_24 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_24"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_24"
			}
		},
		pdr_dialogue_response_09_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_09_1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_09_1"
			}
		},
		pwh_gameplay_response_178 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_178"
			}
		},
		pbw_gameplay_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_07"
			}
		},
		pwh_gameplay_solider_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_solider_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_solider_misses_bomb_01"
			}
		},
		pes_dialogue_response_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_10"
			}
		},
		pbw_gameplay_ranger_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_troll_melee_01"
			}
		},
		pwh_gameplay_response_179 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_179"
			}
		},
		pwh_dialogue_14 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_14"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_14"
			}
		},
		pbw_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_troll_melee_01"
			}
		},
		pwh_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_183"
			}
		},
		pwe_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_misses_bomb_01"
			}
		},
		pbw_gameplay_response_156 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_156",
				[2.0] = "pbw_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_156",
				[2.0] = "pbw_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_misses_bomb_01"
			}
		},
		pes_gameplay_response_178 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_178"
			}
		},
		pbw_gameplay_response_149 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_149"
			}
		},
		pbw_dialogue_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_12"
			}
		},
		pwh_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_misses_bomb_01"
			}
		},
		pwh_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_180"
			}
		},
		pwh_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_152"
			}
		},
		pes_gameplay_response_16 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_16"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_16"
			}
		},
		pwh_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pes_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_misses_bomb_01"
			}
		},
		pes_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_misses_bomb_01"
			}
		},
		pwh_dialogue_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_response_23"
			}
		},
		pwe_gameplay_response_22 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_22"
			}
		},
		pwe_gameplay_response_192 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_192"
			}
		},
		pdr_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_misses_bomb_01"
			}
		},
		pwe_dialogue_response_18 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_18"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_18"
			}
		},
		pwh_gameplay_response_22 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_22"
			}
		},
		pdr_gameplay_response_22 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_22"
			}
		},
		pdr_gameplay_response_17 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_17"
			}
		},
		pwh_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_20"
			}
		},
		pdr_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_misses_bomb_01"
			}
		},
		pes_gameplay_response_167 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_167"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_167"
			}
		},
		pwe_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pbw_dialogue_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_08"
			}
		},
		pwe_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_150"
			}
		},
		pbw_gameplay_response_07_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_07_b"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_07_b"
			}
		},
		pbw_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_wizard_fires_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_fires_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_fires_a_rat_ogre_01"
			}
		},
		pwe_gameplay_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_07"
			}
		},
		pdr_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pwh_gameplay_response_192 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_192"
			}
		},
		pwe_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pwe_gameplay_killing_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_killing_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_killing_a_rat_ogre_01"
			}
		},
		pwe_gameplay_response_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_09"
			}
		},
		pwh_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_150"
			}
		},
		pwh_gameplay_killing_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_killing_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_killing_a_rat_ogre_01"
			}
		},
		pbw_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_187"
			}
		},
		pes_dialogue_response_16 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_16"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_16"
			}
		},
		pes_gameplay_response_151 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_151"
			}
		},
		pes_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_melee_01"
			}
		},
		pbw_gameplay_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_08"
			}
		},
		pwe_dialogue_response_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_06"
			}
		},
		pbw_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pes_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pdr_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pwe_gameplay_response_193 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_193"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_193"
			}
		},
		pwh_gameplay_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_08"
			}
		},
		pwh_gameplay_response_158 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_158"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_158"
			}
		},
		pdr_gameplay_soldier_shooting_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_shooting_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_shooting_rat_ogre_01"
			}
		},
		pes_gameplay_response_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_04"
			}
		},
		pes_dialogue_response_27 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_27"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_27"
			}
		},
		pwb_gameplay_response_18 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwb_gameplay_response_18"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwb_gameplay_response_18"
			}
		},
		pdr_dialogue_response_26 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_26"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_26"
			}
		},
		pbw_dialogue_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_23"
			}
		},
		pbw_gameplay_response_157 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_157"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_157"
			}
		},
		pdr_gameplay_response_159 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_159"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_159"
			}
		},
		pwe_gameplay_response_158 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_158",
				[2.0] = "pwe_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_158",
				[2.0] = "pwe_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_152"
			}
		},
		pes_gameplay_response_177 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_177"
			}
		},
		pwe_gameplay_response_159 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_159"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_159"
			}
		},
		pbw_gameplay_response_153 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_153",
				[2.0] = "pwh_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_153",
				[2.0] = "pwh_gameplay_soldier_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwe_dialogue_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_13"
			}
		},
		pbw_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_misses_bomb_01"
			}
		},
		pwh_gameplay_response_157 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_157",
				[2.0] = "pwh_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_157",
				[2.0] = "pwh_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_dialogue_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_08"
			}
		},
		pwe_dialogue_response_31 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_31"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_31"
			}
		},
		pdr_gameplay_response_162 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_162"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_162"
			}
		},
		pbw_dialogue_06 = {
			sound_events_n = 0,
			face_animations_n = 0,
			database = "player_conversations_honduras",
			category = "default",
			dialogue_animations_n = 0,
			sound_events = {},
			dialogue_animations = {},
			face_animations = {},
			localization_strings = {}
		},
		pbw_gameplay_response_151 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_151",
				[2.0] = "pwe_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_151",
				[2.0] = "pwe_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_183"
			}
		},
		pbw_dialogue_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_39"
			}
		},
		pbw_dialogue_response_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_04"
			}
		},
		pes_gameplay_response_149 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_149",
				[2.0] = "pes_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_149",
				[2.0] = "pes_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_160 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_160"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_160"
			}
		},
		pes_gameplay_response_148 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_148",
				[2.0] = "pbw_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_148",
				[2.0] = "pbw_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_hunter_shoots_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_hunter_shoots_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_hunter_shoots_rat_ogre_01"
			}
		},
		pes_gameplay_response_176 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_176"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_176"
			}
		},
		pwh_gameplay_response_156 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_156"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_156"
			}
		},
		pbw_gameplay_response_150 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_150",
				[2.0] = "pes_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_150",
				[2.0] = "pes_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_response_194 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_194"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_194"
			}
		},
		pwh_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_182"
			}
		},
		pwe_gameplay_response_160 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_160",
				[2.0] = "pdr_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_160",
				[2.0] = "pdr_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_response_144 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_144",
				[2.0] = "pbw_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_144",
				[2.0] = "pbw_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_163 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_163"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_163"
			}
		},
		pwe_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_187"
			}
		},
		pwh_gameplay_response_147 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_147",
				[2.0] = "pwe_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_147",
				[2.0] = "pwe_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_183"
			}
		},
		pes_gameplay_response_146 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_146",
				[2.0] = "pes_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_146",
				[2.0] = "pes_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_response_155 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_155"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_155"
			}
		},
		pwe_gameplay_response_156 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_156",
				[2.0] = "pes_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_156",
				[2.0] = "pes_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_dialogue_response_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_11"
			}
		},
		pes_gameplay_response_139 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_139",
				[2.0] = "pwh_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_139",
				[2.0] = "pwh_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_response_148 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_148",
				[2.0] = "pes_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_148",
				[2.0] = "pes_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pes_dialogue_response_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_04"
			}
		},
		pes_gameplay_response_143 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_143"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_143"
			}
		},
		pdr_gameplay_killing_a_rat_ogre_crossbow_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_killing_a_rat_ogre_crossbow_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_rat_ogre_crossbow_01"
			}
		},
		pwe_dialogue_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_39"
			}
		},
		pes_gameplay_response_141 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_141"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_141"
			}
		},
		pdr_gameplay_response_194 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_194"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_194"
			}
		},
		pwh_gameplay_ranger_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_troll_melee_01"
			}
		},
		pwh_dialogue_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_05"
			}
		},
		pdr_dialogue_response_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_09"
			}
		},
		pdr_gameplay_soldier_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_misses_bomb_01"
			}
		},
		pes_dialogue_response_24 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_24"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_24"
			}
		},
		pwe_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_response_153 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_153"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_153"
			}
		},
		pes_gameplay_response_147 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_147"
			}
		},
		pdr_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_152"
			}
		},
		pdr_dialogue_response_26_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_26_1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_26_1"
			}
		},
		pes_gameplay_elf_shoots_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_shoots_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_shoots_a_rat_ogre_01"
			}
		},
		pdr_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_187"
			}
		},
		pwh_gameplay_response_189 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_189"
			}
		},
		pwh_gameplay_response_19 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_19"
			}
		},
		pwe_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_188"
			}
		},
		pes_dialogue_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_08"
			}
		},
		pwh_gameplay_response_146 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_146"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_146"
			}
		},
		pwe_gameplay_response_190 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_190"
			}
		},
		pwh_dialogue_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_09"
			}
		},
		pdr_dialogue_response_34 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_34"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_34"
			}
		},
		pwe_gameplay_response_157 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_157"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_157"
			}
		},
		pdr_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_150"
			}
		},
		pwe_dialogue_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_03"
			}
		},
		pwe_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_185"
			}
		},
		pwh_gameplay_response_145 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_145",
				[2.0] = "pwe_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_145",
				[2.0] = "pwe_gameplay_soldier_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pwh_dialogue_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_13"
			}
		},
		pwe_dialogue_response_40 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_40"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_40"
			}
		},
		pwe_gameplay_response_154 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_154"
			}
		},
		pwe_dialogue_response_32 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_32"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_32"
			}
		},
		pwe_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_152"
			}
		},
		pwe_dialogue_response_37 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_37"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_37"
			}
		},
		pes_gameplay_response_137 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_137"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_137"
			}
		},
		pbw_gameplay_response_178 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_178"
			}
		},
		pdr_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_troll_melee_01"
			}
		},
		pwh_gameplay_response_151 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_151"
			}
		},
		pes_gameplay_response_140 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_140"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_140"
			}
		},
		pdr_dialogue_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_13"
			}
		},
		pdr_dialogue_response_32 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_32"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_32"
			}
		},
		pwh_dialogue_response_27 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_response_27"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_response_27"
			}
		},
		pwe_dialogue_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_12"
			}
		},
		pbw_gameplay_response_19 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_19"
			}
		},
		pdr_dialogue_response_27 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_27"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_27"
			}
		},
		pdr_gameplay_response_195 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_195"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_195"
			}
		},
		pes_dialogue_response_26 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_26"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_26"
			}
		},
		pes_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_183"
			}
		},
		pes_dialogue_response_09a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_09a"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_09a"
			}
		},
		pbw_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_188"
			}
		},
		pbw_dialogue_response_40 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_40"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_40"
			}
		},
		pbw_gameplay_response_176 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_176"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_176"
			}
		},
		pwh_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_melee_01"
			}
		},
		pwe_dialogue_response_29 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_29"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_29"
			}
		},
		pwe_dialogue_response_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_09"
			}
		},
		pdr_gameplay_killing_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_killing_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_rat_ogre_01"
			}
		},
		pbw_gameplay_response_145 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_145",
				[2.0] = "pwh_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_145",
				[2.0] = "pwh_gameplay_soldier_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pdr_dialogue_response_28 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_28"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_28"
			}
		},
		pdr_gameplay_response_189 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_189"
			}
		},
		pwh_dialogue_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_response_21"
			}
		},
		pbw_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_melee_01"
			}
		},
		pbw_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_183"
			}
		},
		pdr_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pwh_dialogue_respones_26b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_respones_26b"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_respones_26b"
			}
		},
		pes_gameplay_response_170 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_170"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_170"
			}
		},
		pwh_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_185"
			}
		},
		pbw_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_182"
			}
		},
		pdr_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pes_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_180"
			}
		},
		pdr_dialogue_response_17 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_17"
			}
		},
		pbw_dialogue_response_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_05"
			}
		},
		pdr_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_melee_01"
			}
		},
		pes_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_spawn_melee_01"
			}
		},
		pdr_dialogue_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_01"
			}
		},
		pbw_gameplay_response_175 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_175"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_175"
			}
		},
		pwh_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_response_191 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_191"
			}
		},
		pbw_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_186"
			}
		},
		pdr_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_182"
			}
		},
		pwe_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pdr_dialogue_response_30 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_30"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_30"
			}
		},
		pbw_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_21"
			}
		},
		pwe_dialogue_response_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_13"
			}
		},
		pbw_dialogue_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_09"
			}
		},
		pbw_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pes_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_181"
			}
		},
		pdr_gameplay_response_192 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_192"
			}
		},
		pwh_dialogue_response_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_response_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_response_13"
			}
		},
		pes_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pes_dialogue_response_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_09"
			}
		},
		pbw_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_20"
			}
		},
		pes_gameplay_response_169 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_169"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_169"
			}
		},
		pdr_dialogue_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_10"
			}
		},
		pwe_dialogue_response_37_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_37_1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_37_1"
			}
		},
		pwe_dialogue_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_07"
			}
		},
		pwe_dialogue_09_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_09_1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_09_1"
			}
		},
		pbw_gameplay_response_147 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_147"
			}
		},
		pbw_gameplay_response_174 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_174"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_174"
			}
		},
		pbw_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_response_193 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_193"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_193"
			}
		},
		pwh_dialogue_response_17 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_response_17"
			}
		},
		pbw_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_response_155 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_155"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_155"
			}
		},
		pwh_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pwe_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pes_dialogue_response_25 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_25"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_25"
			}
		},
		pdr_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_185"
			}
		},
		pwe_dialogue_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_08"
			}
		},
		pwe_dialogue_response_16 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_16"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_16"
			}
		},
		pes_gameplay_response_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_13"
			}
		},
		pwe_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_181"
			}
		},
		pwe_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pdr_dialogue_response_33 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_33"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_33"
			}
		},
		pbw_dialogue_response_41 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_41"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_41"
			}
		},
		pwh_gameplay_response_190 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_190"
			}
		},
		pdr_dialogue_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_08"
			}
		},
		pwe_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_180"
			}
		},
		pwh_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_188"
			}
		},
		pwe_gameplay_response_195 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_195"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_195"
			}
		},
		pdr_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_ranged_01"
			}
		},
		pbw_dialogue_response_28 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_28"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_28"
			}
		},
		pdr_gameplay_response_158 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_158"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_158"
			}
		},
		pes_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_troll_melee_01"
			}
		},
		pwe_gameplay_response_189 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_189"
			}
		},
		pwh_gameplay_response_148 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_148"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_148"
			}
		},
		pdr_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_response_190 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_190"
			}
		},
		pbw_gameplay_response_148 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_148"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_148"
			}
		},
		pes_gameplay_response_145 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_145"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_145"
			}
		},
		pbw_dialogue_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_08"
			}
		},
		pdr_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_181"
			}
		},
		pes_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_182"
			}
		},
		pdr_dialogue_response_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_06"
			}
		},
		pwh_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_troll_melee_01"
			}
		},
		pes_dialogue_response_29 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_29"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_29"
			}
		},
		pwe_dialogue_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_10"
			}
		},
		pwe_dialogue_response_34 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_34"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_34"
			}
		},
		pwh_dialogue_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dialogue_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dialogue_06"
			}
		},
		pwe_dialogue_response_22 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_22"
			}
		},
		pes_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pwe_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_186"
			}
		},
		pes_dialogue_response_17 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dialogue_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dialogue_response_17"
			}
		},
		pdr_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pwh_gameplay_response_149 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_149"
			}
		},
		pbw_gameplay_response_142 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_142"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_142"
			}
		},
		pwh_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_187"
			}
		},
		pdr_dialogue_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_12"
			}
		},
		pbw_dialogue_response_33 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_response_33"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_response_33"
			}
		},
		pbw_dialogue_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dialogue_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dialogue_11"
			}
		},
		pdr_dialogue_response_29 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_29"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_29"
			}
		},
		pdr_dialogue_response_18 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_response_18"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_response_18"
			}
		},
		pdr_dialogue_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dialogue_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dialogue_11"
			}
		},
		pwe_dialogue_response_41 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "player_conversations_honduras",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dialogue_response_41"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dialogue_response_41"
			}
		}
	})

	return 
end
