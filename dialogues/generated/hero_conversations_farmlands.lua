return function ()
	define_rule({
		name = "pdr_level_farmlands_story_twelve_01",
		response = "pdr_level_farmlands_story_twelve_01",
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
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pdr_level_farmlands_story_twelve_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_farmlands_story_twelve_01",
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
		name = "pwe_level_farmlands_story_twelve_01",
		response = "pwe_level_farmlands_story_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_farmlands_story_twelve_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pdr_level_farmlands_story_twelve_02",
		response = "pdr_level_farmlands_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_twelve_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwe_level_farmlands_story_twelve_02",
		response = "pwe_level_farmlands_story_twelve_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_farmlands_story_twelve_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pbw_level_farmlands_story_ten_01",
		response = "pbw_level_farmlands_story_ten_01",
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
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pbw_level_farmlands_story_ten_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_farmlands_story_ten_01",
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
		name = "pwe_level_farmlands_story_ten_01",
		response = "pwe_level_farmlands_story_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_ten_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pbw_level_farmlands_story_ten_02",
		response = "pbw_level_farmlands_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_ten_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwe_level_farmlands_story_ten_02",
		response = "pwe_level_farmlands_story_ten_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_ten_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pbw_level_farmlands_story_ten_03",
		response = "pbw_level_farmlands_story_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_ten_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwe_level_farmlands_story_ten_03",
		response = "pwe_level_farmlands_story_ten_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_ten_03"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pes_level_farmlands_story_thirteen_01",
		response = "pes_level_farmlands_story_thirteen_01",
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
				"global_context",
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pes_level_farmlands_story_thirteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_thirteen_01",
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
		name = "pwh_level_farmlands_story_thirteen_02",
		response = "pwh_level_farmlands_story_thirteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_thirteen_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwe_level_farmlands_story_thirteen_02",
		response = "pwe_level_farmlands_story_thirteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_thirteen_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_thirteen_03",
		response = "pwh_level_farmlands_story_thirteen_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_thirteen_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pes_level_farmlands_story_five_01",
		response = "pes_level_farmlands_story_five_01",
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
				"global_context",
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pes_level_farmlands_story_five_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_five_01",
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
		name = "pdr_level_farmlands_story_five_01",
		response = "pdr_level_farmlands_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_five_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_five_01",
		response = "pwh_level_farmlands_story_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_farmlands_story_five_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pdr_level_farmlands_story_five_02",
		response = "pdr_level_farmlands_story_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_five_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_six_01",
		response = "pwh_level_farmlands_story_six_01",
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
				"global_context",
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pwh_level_farmlands_story_six_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_farmlands_story_six_01",
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
		name = "pwe_level_farmlands_story_six_01",
		response = "pwe_level_farmlands_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_six_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_six_02",
		response = "pwh_level_farmlands_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_six_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwe_level_farmlands_story_six_02",
		response = "pwe_level_farmlands_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_six_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_six_03",
		response = "pwh_level_farmlands_story_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_six_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwe_level_farmlands_story_six_03",
		response = "pwe_level_farmlands_story_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_six_03"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pes_level_farmlands_story_two_01",
		response = "pes_level_farmlands_story_two_01",
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
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pes_level_farmlands_story_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_two_01",
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
		name = "pwe_level_farmlands_story_two_01",
		response = "pwe_level_farmlands_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_two_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pdr_level_farmlands_story_two_01",
		response = "pdr_level_farmlands_story_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_two_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwe_level_farmlands_story_two_02",
		response = "pwe_level_farmlands_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_farmlands_story_two_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pes_level_farmlands_story_two_02",
		response = "pes_level_farmlands_story_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_two_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwe_level_farmlands_story_two_03",
		response = "pwe_level_farmlands_story_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_two_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pes_level_farmlands_story_eight_01",
		response = "pes_level_farmlands_story_eight_01",
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
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pes_level_farmlands_story_eight_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_eight_01",
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
		name = "pwh_level_farmlands_story_eight_02",
		response = "pwh_level_farmlands_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_eight_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pes_level_farmlands_story_eight_02",
		response = "pes_level_farmlands_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_eight_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_eight_03",
		response = "pwh_level_farmlands_story_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_eight_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_fourteen_01",
		response = "pwh_level_farmlands_story_fourteen_01",
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
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pwh_level_farmlands_story_fourteen_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_farmlands_story_fourteen_01",
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
		name = "pes_level_farmlands_story_fourteen_01",
		response = "pes_level_farmlands_story_fourteen_01",
		criterias = {
			{
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
				2
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
		name = "pwh_level_farmlands_story_fourteen_02",
		response = "pwh_level_farmlands_story_fourteen_02",
		criterias = {
			{
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
				2
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
		name = "pwe_level_farmlands_story_three_01",
		response = "pwe_level_farmlands_story_three_01",
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
				"global_context",
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pwe_level_farmlands_story_three_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_farmlands_story_three_01",
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
		name = "pbw_level_farmlands_story_three_01",
		response = "pbw_level_farmlands_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_three_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_three_01",
		response = "pwh_level_farmlands_story_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_three_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pbw_level_farmlands_story_three_02",
		response = "pbw_level_farmlands_story_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_three_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pes_level_farmlands_story_one_01",
		response = "pes_level_farmlands_story_one_01",
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
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pes_level_farmlands_story_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_one_01",
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
		name = "pwe_level_farmlands_story_one_01",
		response = "pwe_level_farmlands_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_one_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pes_level_farmlands_story_one_02",
		response = "pes_level_farmlands_story_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_one_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pbw_level_farmlands_story_one_01",
		response = "pbw_level_farmlands_story_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_one_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwe_level_farmlands_story_nine_01",
		response = "pwe_level_farmlands_story_nine_01",
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
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pwe_level_farmlands_story_nine_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_farmlands_story_nine_01",
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
		name = "pwh_level_farmlands_story_nine_01",
		response = "pwh_level_farmlands_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_nine_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwe_level_farmlands_story_nine_02",
		response = "pwe_level_farmlands_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_nine_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_nine_02",
		response = "pwh_level_farmlands_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_farmlands_story_nine_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwe_level_farmlands_story_nine_03",
		response = "pwe_level_farmlands_story_nine_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_nine_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pes_level_farmlands_story_four_01",
		response = "pes_level_farmlands_story_four_01",
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
				"global_context",
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pes_level_farmlands_story_four_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_farmlands_story_four_01",
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
		name = "pdr_level_farmlands_story_four_01",
		response = "pdr_level_farmlands_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_farmlands_story_four_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pbw_level_farmlands_story_four_01",
		response = "pbw_level_farmlands_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_farmlands_story_four_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pdr_level_farmlands_story_four_02",
		response = "pdr_level_farmlands_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_four_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_seven_01",
		response = "pwh_level_farmlands_story_seven_01",
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
				"global_context",
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pwh_level_farmlands_story_seven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwh_level_farmlands_story_seven_01",
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
		name = "pbw_level_farmlands_story_seven_01",
		response = "pbw_level_farmlands_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_seven_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pes_level_farmlands_story_seven_01",
		response = "pes_level_farmlands_story_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_seven_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pbw_level_farmlands_story_eleven_01",
		response = "pbw_level_farmlands_story_eleven_01",
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
				"current_level",
				OP.EQ,
				"farmlands"
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
				"once_per_level_pbw_level_farmlands_story_eleven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_farmlands_story_eleven_01",
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
		name = "pwh_level_farmlands_story_eleven_01",
		response = "pwh_level_farmlands_story_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_eleven_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pbw_level_farmlands_story_eleven_02",
		response = "pbw_level_farmlands_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_eleven_01"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_eleven_02",
		response = "pwh_level_farmlands_story_eleven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_eleven_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pbw_level_farmlands_story_eleven_03",
		response = "pbw_level_farmlands_story_eleven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_farmlands_story_eleven_02"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		name = "pwh_level_farmlands_story_eleven_03",
		response = "pwh_level_farmlands_story_eleven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_farmlands_story_eleven_03"
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2
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
		pwe_level_farmlands_story_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_ten_01"
			}
		},
		pes_level_farmlands_story_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_farmlands_story_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_five_01"
			}
		},
		pwh_level_farmlands_story_eleven_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_eleven_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_eleven_03"
			}
		},
		pbw_level_farmlands_story_eleven_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_farmlands_story_eleven_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_farmlands_story_eleven_03"
			}
		},
		pdr_level_farmlands_story_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_farmlands_story_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_farmlands_story_five_01"
			}
		},
		pwh_level_farmlands_story_eleven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_eleven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_eleven_02"
			}
		},
		pbw_level_farmlands_story_eleven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_farmlands_story_eleven_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_farmlands_story_eleven_02"
			}
		},
		pwh_level_farmlands_story_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_three_01"
			}
		},
		pwe_level_farmlands_story_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_two_01"
			}
		},
		pwh_level_farmlands_story_eight_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_eight_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_eight_03"
			}
		},
		pbw_level_farmlands_story_eleven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_farmlands_story_eleven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_level_farmlands_story_eleven_01"
			}
		},
		pwh_level_farmlands_story_thirteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_thirteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_thirteen_02"
			}
		},
		pbw_level_farmlands_story_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_farmlands_story_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_farmlands_story_three_01"
			}
		},
		pes_level_farmlands_story_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_farmlands_story_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_seven_01"
			}
		},
		pwh_level_farmlands_story_eight_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_eight_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_eight_02"
			}
		},
		pdr_level_farmlands_story_twelve_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_farmlands_story_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_farmlands_story_twelve_02"
			}
		},
		pbw_level_farmlands_story_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_farmlands_story_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_farmlands_story_seven_01"
			}
		},
		pdr_level_farmlands_story_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_farmlands_story_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_level_farmlands_story_twelve_01"
			}
		},
		pbw_level_farmlands_story_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_farmlands_story_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_farmlands_story_three_02"
			}
		},
		pwe_level_farmlands_story_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_nine_01"
			}
		},
		pbw_level_farmlands_story_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_farmlands_story_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_farmlands_story_four_01"
			}
		},
		pdr_level_farmlands_story_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_farmlands_story_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_farmlands_story_four_01"
			}
		},
		pwe_level_farmlands_story_ten_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_ten_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_ten_02"
			}
		},
		pes_level_farmlands_story_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_farmlands_story_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_four_01"
			}
		},
		pwe_level_farmlands_story_ten_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_ten_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_ten_03"
			}
		},
		pdr_level_farmlands_story_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_farmlands_story_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_farmlands_story_two_01"
			}
		},
		pes_level_farmlands_story_thirteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_farmlands_story_thirteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_thirteen_01"
			}
		},
		pes_level_farmlands_story_eight_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_farmlands_story_eight_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_eight_02"
			}
		},
		pes_level_farmlands_story_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_farmlands_story_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_one_01"
			}
		},
		pwe_level_farmlands_story_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_two_02"
			}
		},
		pdr_level_farmlands_story_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_farmlands_story_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_farmlands_story_five_02"
			}
		},
		pbw_level_farmlands_story_ten_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_farmlands_story_ten_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_farmlands_story_ten_02"
			}
		},
		pwe_level_farmlands_story_nine_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_nine_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_nine_02"
			}
		},
		pwh_level_farmlands_story_six_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_six_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_six_03"
			}
		},
		pwh_level_farmlands_story_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_nine_01"
			}
		},
		pdr_level_farmlands_story_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_farmlands_story_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_farmlands_story_four_02"
			}
		},
		pbw_level_farmlands_story_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_farmlands_story_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_farmlands_story_one_01"
			}
		},
		pwe_level_farmlands_story_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_three_01"
			}
		},
		pwh_level_farmlands_story_thirteen_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_thirteen_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_thirteen_03"
			}
		},
		pes_level_farmlands_story_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_farmlands_story_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_two_01"
			}
		},
		pes_level_farmlands_story_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_farmlands_story_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_eight_01"
			}
		},
		pwe_level_farmlands_story_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_one_01"
			}
		},
		pwh_level_farmlands_story_eleven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_eleven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_eleven_01"
			}
		},
		pwh_level_farmlands_story_fourteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_fourteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_fourteen_02"
			}
		},
		pwe_level_farmlands_story_twelve_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_twelve_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_twelve_02"
			}
		},
		pwe_level_farmlands_story_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_six_01"
			}
		},
		pwe_level_farmlands_story_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_twelve_01"
			}
		},
		pes_level_farmlands_story_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_farmlands_story_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_two_02"
			}
		},
		pwe_level_farmlands_story_nine_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_nine_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_nine_03"
			}
		},
		pwh_level_farmlands_story_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_seven_01"
			}
		},
		pes_level_farmlands_story_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_farmlands_story_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_one_02"
			}
		},
		pbw_level_farmlands_story_ten_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_farmlands_story_ten_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_farmlands_story_ten_03"
			}
		},
		pwh_level_farmlands_story_fourteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_fourteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_fourteen_01"
			}
		},
		pwh_level_farmlands_story_nine_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_nine_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_nine_02"
			}
		},
		pwe_level_farmlands_story_thirteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_thirteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_thirteen_02"
			}
		},
		pwh_level_farmlands_story_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_six_01"
			}
		},
		pwe_level_farmlands_story_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_two_03"
			}
		},
		pwe_level_farmlands_story_six_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_six_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_six_03"
			}
		},
		pwe_level_farmlands_story_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_farmlands_story_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_farmlands_story_six_02"
			}
		},
		pwh_level_farmlands_story_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_six_02"
			}
		},
		pbw_level_farmlands_story_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_farmlands_story_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_level_farmlands_story_ten_01"
			}
		},
		pes_level_farmlands_story_fourteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_farmlands_story_fourteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_farmlands_story_fourteen_01"
			}
		},
		pwh_level_farmlands_story_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_farmlands",
			category = "story_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_level_farmlands_story_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_farmlands_story_five_01"
			}
		}
	})
end
