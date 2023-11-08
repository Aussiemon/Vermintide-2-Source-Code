return function ()
	define_rule({
		name = "pbw_level_fort_story_four_01",
		response = "pbw_level_fort_story_four_01",
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
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600
			},
			{
				"faction_memory",
				"once_per_level_pbw_level_fort_story_four_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_fort_story_four_01",
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
		name = "pbw_level_fort_story_four_02",
		response = "pbw_level_fort_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_fort_story_four_01"
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
		name = "pbw_level_fort_story_nine_01",
		response = "pbw_level_fort_story_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_fort_story_nine_01"
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
		name = "pbw_level_fort_story_on_the_way_one_01",
		response = "pbw_level_fort_story_on_the_way_one_01",
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
				600
			},
			{
				"faction_memory",
				"once_per_level_pbw_level_fort_story_on_the_way_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_fort_story_on_the_way_one_01",
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
		name = "pbw_level_fort_story_on_the_way_one_02",
		response = "pbw_level_fort_story_on_the_way_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_fort_story_on_the_way_one_01"
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
		name = "pbw_level_fort_story_river_one_01",
		response = "pbw_level_fort_story_river_one_01",
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
				600
			},
			{
				"faction_memory",
				"once_per_level_pbw_level_fort_story_river_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pbw_level_fort_story_river_one_01",
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
		name = "pbw_level_fort_story_river_one_02",
		response = "pbw_level_fort_story_river_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_fort_story_river_one_01"
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
		name = "pbw_level_fort_story_river_one_03",
		response = "pbw_level_fort_story_river_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_fort_story_river_one_02"
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
		name = "pdr_level_fort_story_on_the_way_five_01",
		response = "pdr_level_fort_story_on_the_way_five_01",
		criterias = {
			{
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
		name = "pdr_level_fort_story_on_the_way_five_02",
		response = "pdr_level_fort_story_on_the_way_five_02",
		criterias = {
			{
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
		name = "pdr_level_fort_story_on_the_way_one_01",
		response = "pdr_level_fort_story_on_the_way_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_fort_story_on_the_way_one_01"
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
		name = "pdr_level_fort_story_on_the_way_one_02",
		response = "pdr_level_fort_story_on_the_way_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_fort_story_on_the_way_one_02"
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
		name = "pdr_level_fort_story_on_the_way_two_01",
		response = "pdr_level_fort_story_on_the_way_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_fort_story_on_the_way_two_01"
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
		name = "pdr_level_fort_story_on_the_way_two_02",
		response = "pdr_level_fort_story_on_the_way_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_fort_story_on_the_way_two_02"
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
		name = "pdr_level_fort_story_river_one_01",
		response = "pdr_level_fort_story_river_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_fort_story_river_one_01"
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
		name = "pdr_level_fort_story_river_one_02",
		response = "pdr_level_fort_story_river_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_fort_story_river_one_02"
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
		name = "pdr_level_fort_story_six_01",
		response = "pdr_level_fort_story_six_01",
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
				600
			},
			{
				"faction_memory",
				"once_per_level_pdr_level_fort_story_six_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pdr_level_fort_story_six_01",
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
		name = "pdr_level_fort_story_six_02",
		response = "pdr_level_fort_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_fort_story_six_01"
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
		name = "pes_level_fort_story_eight_01",
		response = "pes_level_fort_story_eight_01",
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
				600
			},
			{
				"faction_memory",
				"once_per_level_pes_level_fort_story_eight_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_fort_story_eight_01",
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
		name = "pes_level_fort_story_eight_02",
		response = "pes_level_fort_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_fort_story_eight_01"
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
		name = "pes_level_fort_story_four_01",
		response = "pes_level_fort_story_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_fort_story_four_01"
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
		name = "pes_level_fort_story_four_02",
		response = "pes_level_fort_story_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_fort_story_four_02"
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
		name = "pes_level_fort_story_on_the_way_three_01",
		response = "pes_level_fort_story_on_the_way_three_01",
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
				600
			},
			{
				"faction_memory",
				"once_per_level_pes_level_fort_story_on_the_way_three_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_fort_story_on_the_way_three_01",
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
		name = "pes_level_fort_story_seven_01",
		response = "pes_level_fort_story_seven_01",
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
				600
			},
			{
				"faction_memory",
				"once_per_level_pes_level_fort_story_seven_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pes_level_fort_story_seven_01",
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
		name = "pes_level_fort_story_seven_02",
		response = "pes_level_fort_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_fort_story_seven_02"
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
		name = "pes_level_fort_story_seven_03",
		response = "pes_level_fort_story_seven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_fort_story_seven_03"
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
		name = "pwe_level_fort_story_eight_01",
		response = "pwe_level_fort_story_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_fort_story_eight_01"
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
		name = "pwe_level_fort_story_eight_02",
		response = "pwe_level_fort_story_eight_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_fort_story_eight_02"
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
		name = "pwe_level_fort_story_nine_01",
		response = "pwe_level_fort_story_nine_01",
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
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600
			},
			{
				"faction_memory",
				"once_per_level_pwe_level_fort_story_nine_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_fort_story_nine_01",
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
		name = "pwe_level_fort_story_nine_02",
		response = "pwe_level_fort_story_nine_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_level_fort_story_nine_01"
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
		name = "pwe_level_fort_story_on_the_way_five_01",
		response = "pwe_level_fort_story_on_the_way_five_01",
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
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600
			},
			{
				"faction_memory",
				"once_per_level_pwe_level_fort_story_on_the_way_five_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_fort_story_on_the_way_five_01",
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
		name = "pwe_level_fort_story_on_the_way_five_02",
		response = "pwe_level_fort_story_on_the_way_five_02",
		criterias = {
			{
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
		name = "pwe_level_fort_story_on_the_way_three_01",
		response = "pwe_level_fort_story_on_the_way_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_fort_story_on_the_way_three_01"
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
		name = "pwe_level_fort_story_on_the_way_three_02",
		response = "pwe_level_fort_story_on_the_way_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_level_fort_story_on_the_way_three_02"
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
		name = "pwe_level_fort_story_on_the_way_two_01",
		response = "pwe_level_fort_story_on_the_way_two_01",
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
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				600
			},
			{
				"faction_memory",
				"once_per_level_pwe_level_fort_story_on_the_way_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"once_per_level_pwe_level_fort_story_on_the_way_two_01",
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
		name = "pwe_level_fort_story_on_the_way_two_02",
		response = "pwe_level_fort_story_on_the_way_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_fort_story_on_the_way_two_01"
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
		name = "pwh_level_fort_story_on_the_way_three_02",
		response = "pwh_level_fort_story_on_the_way_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_level_fort_story_on_the_way_three_01"
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
		name = "pwh_level_fort_story_seven_02",
		response = "pwh_level_fort_story_seven_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_fort_story_seven_01"
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
		name = "pwh_level_fort_story_seven_03",
		response = "pwh_level_fort_story_seven_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_level_fort_story_seven_02"
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
		name = "pwh_level_fort_story_six_01",
		response = "pwh_level_fort_story_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_fort_story_six_01"
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
		name = "pwh_level_fort_story_six_02",
		response = "pwh_level_fort_story_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_level_fort_story_six_02"
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
		pbw_level_fort_story_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_level_fort_story_four_01"
			},
			sound_events = {
				[1.0] = "pbw_level_fort_story_four_01"
			},
			sound_events_duration = {
				[1.0] = 2.7546665668488
			}
		},
		pbw_level_fort_story_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_fort_story_four_02"
			},
			sound_events = {
				[1.0] = "pbw_level_fort_story_four_02"
			},
			sound_events_duration = {
				[1.0] = 2.9789166450501
			}
		},
		pbw_level_fort_story_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_fort_story_nine_01"
			},
			sound_events = {
				[1.0] = "pbw_level_fort_story_nine_01"
			},
			sound_events_duration = {
				[1.0] = 8.567271232605
			}
		},
		pbw_level_fort_story_on_the_way_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_level_fort_story_on_the_way_one_01"
			},
			sound_events = {
				[1.0] = "pbw_level_fort_story_on_the_way_one_01"
			},
			sound_events_duration = {
				[1.0] = 2.0683541297913
			}
		},
		pbw_level_fort_story_on_the_way_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_fort_story_on_the_way_one_02"
			},
			sound_events = {
				[1.0] = "pbw_level_fort_story_on_the_way_one_02"
			},
			sound_events_duration = {
				[1.0] = 2.7313957214356
			}
		},
		pbw_level_fort_story_river_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_level_fort_story_river_one_01"
			},
			sound_events = {
				[1.0] = "pbw_level_fort_story_river_one_01"
			},
			sound_events_duration = {
				[1.0] = 1.2875624895096
			}
		},
		pbw_level_fort_story_river_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_fort_story_river_one_02"
			},
			sound_events = {
				[1.0] = "pbw_level_fort_story_river_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.0754792690277
			}
		},
		pbw_level_fort_story_river_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_level_fort_story_river_one_03"
			},
			sound_events = {
				[1.0] = "pbw_level_fort_story_river_one_03"
			},
			sound_events_duration = {
				[1.0] = 8.6843538284302
			}
		},
		pdr_level_fort_story_on_the_way_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_on_the_way_five_01"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_on_the_way_five_01"
			},
			sound_events_duration = {
				[1.0] = 1.9148958921433
			}
		},
		pdr_level_fort_story_on_the_way_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_on_the_way_five_02"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_on_the_way_five_02"
			},
			sound_events_duration = {
				[1.0] = 5.5929789543152
			}
		},
		pdr_level_fort_story_on_the_way_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_on_the_way_one_01"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_on_the_way_one_01"
			},
			sound_events_duration = {
				[1.0] = 4.7048540115356
			}
		},
		pdr_level_fort_story_on_the_way_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_on_the_way_one_02"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_on_the_way_one_02"
			},
			sound_events_duration = {
				[1.0] = 6.3976874351502
			}
		},
		pdr_level_fort_story_on_the_way_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_on_the_way_two_01"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_on_the_way_two_01"
			},
			sound_events_duration = {
				[1.0] = 5.0714998245239
			}
		},
		pdr_level_fort_story_on_the_way_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_on_the_way_two_02"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_on_the_way_two_02"
			},
			sound_events_duration = {
				[1.0] = 3.2992084026337
			}
		},
		pdr_level_fort_story_river_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_river_one_01"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_river_one_01"
			},
			sound_events_duration = {
				[1.0] = 5.2088332176208
			}
		},
		pdr_level_fort_story_river_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_river_one_02"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_river_one_02"
			},
			sound_events_duration = {
				[1.0] = 2.2925000190735
			}
		},
		pdr_level_fort_story_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_six_01"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_six_01"
			},
			sound_events_duration = {
				[1.0] = 8.0789794921875
			}
		},
		pdr_level_fort_story_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_level_fort_story_six_02"
			},
			sound_events = {
				[1.0] = "pdr_level_fort_story_six_02"
			},
			sound_events_duration = {
				[1.0] = 1.3393541574478
			}
		},
		pes_level_fort_story_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_fort_story_eight_01"
			},
			sound_events = {
				[1.0] = "pes_level_fort_story_eight_01"
			},
			sound_events_duration = {
				[1.0] = 1.9908958673477
			}
		},
		pes_level_fort_story_eight_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_fort_story_eight_02"
			},
			sound_events = {
				[1.0] = "pes_level_fort_story_eight_02"
			},
			sound_events_duration = {
				[1.0] = 2.2130000591278
			}
		},
		pes_level_fort_story_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_fort_story_four_01"
			},
			sound_events = {
				[1.0] = "pes_level_fort_story_four_01"
			},
			sound_events_duration = {
				[1.0] = 5.1050415039063
			}
		},
		pes_level_fort_story_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_fort_story_four_02"
			},
			sound_events = {
				[1.0] = "pes_level_fort_story_four_02"
			},
			sound_events_duration = {
				[1.0] = 4.741229057312
			}
		},
		pes_level_fort_story_on_the_way_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_fort_story_on_the_way_three_01"
			},
			sound_events = {
				[1.0] = "pes_level_fort_story_on_the_way_three_01"
			},
			sound_events_duration = {
				[1.0] = 4.6878333091736
			}
		},
		pes_level_fort_story_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_level_fort_story_seven_01"
			},
			sound_events = {
				[1.0] = "pes_level_fort_story_seven_01"
			},
			sound_events_duration = {
				[1.0] = 6.8752918243408
			}
		},
		pes_level_fort_story_seven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_fort_story_seven_02"
			},
			sound_events = {
				[1.0] = "pes_level_fort_story_seven_02"
			},
			sound_events_duration = {
				[1.0] = 5.8703126907349
			}
		},
		pes_level_fort_story_seven_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_fort_story_seven_03"
			},
			sound_events = {
				[1.0] = "pes_level_fort_story_seven_03"
			},
			sound_events_duration = {
				[1.0] = 4.4756875634193
			}
		},
		pwe_level_fort_story_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_eight_01"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_eight_01"
			},
			sound_events_duration = {
				[1.0] = 7.249499797821
			}
		},
		pwe_level_fort_story_eight_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_eight_02"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_eight_02"
			},
			sound_events_duration = {
				[1.0] = 9.3509168624878
			}
		},
		pwe_level_fort_story_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_nine_01"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_nine_01"
			},
			sound_events_duration = {
				[1.0] = 5.7159583568573
			}
		},
		pwe_level_fort_story_nine_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_nine_02"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_nine_02"
			},
			sound_events_duration = {
				[1.0] = 6.562479019165
			}
		},
		pwe_level_fort_story_on_the_way_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_on_the_way_five_01"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_on_the_way_five_01"
			},
			sound_events_duration = {
				[1.0] = 6.2733335494995
			}
		},
		pwe_level_fort_story_on_the_way_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_on_the_way_five_02"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_on_the_way_five_02"
			},
			sound_events_duration = {
				[1.0] = 6.5626459121704
			}
		},
		pwe_level_fort_story_on_the_way_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_on_the_way_three_01"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_on_the_way_three_01"
			},
			sound_events_duration = {
				[1.0] = 3.4620625972748
			}
		},
		pwe_level_fort_story_on_the_way_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_on_the_way_three_02"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_on_the_way_three_02"
			},
			sound_events_duration = {
				[1.0] = 9.8548545837402
			}
		},
		pwe_level_fort_story_on_the_way_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_on_the_way_two_01"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_on_the_way_two_01"
			},
			sound_events_duration = {
				[1.0] = 5.0198750495911
			}
		},
		pwe_level_fort_story_on_the_way_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_level_fort_story_on_the_way_two_02"
			},
			sound_events = {
				[1.0] = "pwe_level_fort_story_on_the_way_two_02"
			},
			sound_events_duration = {
				[1.0] = 2.4214792251587
			}
		},
		pwh_level_fort_story_on_the_way_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_fort_story_on_the_way_three_02"
			},
			sound_events = {
				[1.0] = "pwh_level_fort_story_on_the_way_three_02"
			},
			sound_events_duration = {
				[1.0] = 3.1121873855591
			}
		},
		pwh_level_fort_story_seven_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_fort_story_seven_02"
			},
			sound_events = {
				[1.0] = "pwh_level_fort_story_seven_02"
			},
			sound_events_duration = {
				[1.0] = 8.0330419540405
			}
		},
		pwh_level_fort_story_seven_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_fort_story_seven_03"
			},
			sound_events = {
				[1.0] = "pwh_level_fort_story_seven_03"
			},
			sound_events_duration = {
				[1.0] = 5.3658957481384
			}
		},
		pwh_level_fort_story_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_fort_story_six_01"
			},
			sound_events = {
				[1.0] = "pwh_level_fort_story_six_01"
			},
			sound_events_duration = {
				[1.0] = 5.0516457557678
			}
		},
		pwh_level_fort_story_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_fort",
			category = "story_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_level_fort_story_six_02"
			},
			sound_events = {
				[1.0] = "pwh_level_fort_story_six_02"
			},
			sound_events_duration = {
				[1.0] = 8.0833120346069
			}
		}
	})
end
