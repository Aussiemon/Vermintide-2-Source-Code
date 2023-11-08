return function ()
	define_rule({
		response = "nfl_shadow_curse_arena_a",
		name = "nfl_shadow_curse_arena_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"no_curse_intro"
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"arena_belakor"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			}
		}
	})
	define_rule({
		response = "nfl_shadow_curse_arena_event_start",
		name = "nfl_shadow_curse_arena_event_start",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_event_start"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			}
		}
	})
	define_rule({
		response = "nfl_shadow_curse_complete",
		name = "nfl_shadow_curse_complete",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_complete_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			}
		}
	})
	define_rule({
		name = "nfl_shadow_curse_vortex_crystal",
		response = "nfl_shadow_curse_vortex_crystal",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_vortex_crystal"
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"arena_belakor"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"nfl_shadow_curse_vortex_crystal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nfl_shadow_curse_vortex_crystal",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_event_defeat",
		name = "nwd_shadow_curse_arena_event_defeat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_complete"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_event_taunt",
		name = "nwd_shadow_curse_arena_event_taunt",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_event_taunt"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_eight_a",
		name = "nwd_shadow_curse_arena_mid_conversation_eight_a",
		criterias = {
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
				"global_context",
				"current_level",
				OP.EQ,
				"arena_belakor"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_mid_conversation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_five_a",
		name = "nwd_shadow_curse_arena_mid_conversation_five_a",
		criterias = {
			{
				"global_context",
				"we_thornsister",
				OP.EQ,
				1
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor"
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"arena_belakor"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_mid_conversation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_five_c",
		name = "nwd_shadow_curse_arena_mid_conversation_five_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pwe_st_shadow_curse_arena_mid_conversation_five_b_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_four_a",
		name = "nwd_shadow_curse_arena_mid_conversation_four_a",
		criterias = {
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor"
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"arena_belakor"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_mid_conversation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_four_c",
		name = "nwd_shadow_curse_arena_mid_conversation_four_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_shadow_curse_arena_mid_conversation_four_b_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_nine_a",
		name = "nwd_shadow_curse_arena_mid_conversation_nine_a",
		criterias = {
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
				"global_context",
				"current_level",
				OP.EQ,
				"arena_belakor"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_mid_conversation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_one_a",
		name = "nwd_shadow_curse_arena_mid_conversation_one_a",
		criterias = {
			{
				"global_context",
				"wh_priest",
				OP.EQ,
				1
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor"
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"arena_belakor"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_mid_conversation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_one_c",
		name = "nwd_shadow_curse_arena_mid_conversation_one_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pwh_wp_shadow_curse_arena_mid_conversation_one_b_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_seven_a",
		name = "nwd_shadow_curse_arena_mid_conversation_seven_a",
		criterias = {
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
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_mid_conversation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_six_a",
		name = "nwd_shadow_curse_arena_mid_conversation_six_a",
		criterias = {
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor"
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"arena_belakor"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_mid_conversation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_six_c",
		name = "nwd_shadow_curse_arena_mid_conversation_six_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_shadow_curse_arena_mid_conversation_six_b_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_ten_dummy",
		name = "nwd_shadow_curse_arena_mid_conversation_ten_dummy",
		criterias = {
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
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_mid_conversation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_three_a",
		name = "nwd_shadow_curse_arena_mid_conversation_three_a",
		criterias = {
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor"
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"arena_belakor"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_mid_conversation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_three_c",
		name = "nwd_shadow_curse_arena_mid_conversation_three_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pbw_shadow_curse_arena_mid_conversation_three_b_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_two_a",
		name = "nwd_shadow_curse_arena_mid_conversation_two_a",
		criterias = {
			{
				"global_context",
				"wh_priest",
				OP.EQ,
				1
			},
			{
				"global_context",
				"current_theme",
				OP.EQ,
				"belakor"
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"arena_belakor"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_arena_mid_conversation"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_arena_mid_conversation_two_c",
		name = "nwd_shadow_curse_arena_mid_conversation_two_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pwh_wp_shadow_curse_arena_mid_conversation_two_b_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "nwd_shadow_curse_laughter",
		name = "nwd_shadow_curse_laughter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_laughter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		name = "pbw_shadow_curse_arena_b",
		response = "pbw_shadow_curse_arena_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_shadow_curse_arena_a_done"
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
		name = "pbw_shadow_curse_arena_mid_conversation_seven_c",
		response = "pbw_shadow_curse_arena_mid_conversation_seven_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shadow_curse_arena_mid_conversation_seven_b_01"
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
		name = "pbw_shadow_curse_arena_mid_conversation_ten_a",
		response = "pbw_shadow_curse_arena_mid_conversation_ten_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_ten_dummy_done"
			},
			{
				"query_context",
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
		name = "pbw_shadow_curse_arena_mid_conversation_ten_d",
		response = "pbw_shadow_curse_arena_mid_conversation_ten_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_arena_mid_conversation_ten_c_01"
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
		name = "pbw_shadow_curse_arena_mid_conversation_three_b",
		response = "pbw_shadow_curse_arena_mid_conversation_three_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_three_a_done"
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
		name = "pbw_shadow_curse_arena_mid_conversation_three_d",
		response = "pbw_shadow_curse_arena_mid_conversation_three_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_three_c_done"
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
		name = "pdr_shadow_curse_arena_b",
		response = "pdr_shadow_curse_arena_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_shadow_curse_arena_a_done"
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
		name = "pdr_shadow_curse_arena_mid_conversation_eight_b",
		response = "pdr_shadow_curse_arena_mid_conversation_eight_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_eight_a_done"
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
		name = "pdr_shadow_curse_arena_mid_conversation_eight_d",
		response = "pdr_shadow_curse_arena_mid_conversation_eight_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_shadow_curse_arena_mid_conversation_eight_c_01"
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
		name = "pdr_shadow_curse_arena_mid_conversation_four_b",
		response = "pdr_shadow_curse_arena_mid_conversation_four_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_four_a_done"
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
		name = "pdr_shadow_curse_arena_mid_conversation_four_d",
		response = "pdr_shadow_curse_arena_mid_conversation_four_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_four_c_done"
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
		name = "pes_shadow_curse_arena_b",
		response = "pes_shadow_curse_arena_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_shadow_curse_arena_a_done"
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
		name = "pes_shadow_curse_arena_mid_conversation_nine_b",
		response = "pes_shadow_curse_arena_mid_conversation_nine_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_nine_a_done"
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
		name = "pes_shadow_curse_arena_mid_conversation_nine_d",
		response = "pes_shadow_curse_arena_mid_conversation_nine_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_arena_mid_conversation_nine_c_01"
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
		name = "pes_shadow_curse_arena_mid_conversation_seven_b",
		response = "pes_shadow_curse_arena_mid_conversation_seven_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_seven_a_done"
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
		name = "pes_shadow_curse_arena_mid_conversation_six_b",
		response = "pes_shadow_curse_arena_mid_conversation_six_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_six_a_done"
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
		name = "pes_shadow_curse_arena_mid_conversation_six_d",
		response = "pes_shadow_curse_arena_mid_conversation_six_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_six_c_done"
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
		name = "pwe_shadow_curse_arena_b",
		response = "pwe_shadow_curse_arena_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_shadow_curse_arena_a_done"
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
		name = "pwe_shadow_curse_arena_mid_conversation_nine_c",
		response = "pwe_shadow_curse_arena_mid_conversation_nine_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_shadow_curse_arena_mid_conversation_nine_b_01"
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
		name = "pwe_shadow_curse_arena_mid_conversation_ten_b",
		response = "pwe_shadow_curse_arena_mid_conversation_ten_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_shadow_curse_arena_mid_conversation_ten_a_01"
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
		name = "pwe_st_shadow_curse_arena_mid_conversation_five_b",
		response = "pwe_st_shadow_curse_arena_mid_conversation_five_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_five_a_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_thornsister"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_st_shadow_curse_arena_mid_conversation_five_d",
		response = "pwe_st_shadow_curse_arena_mid_conversation_five_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_five_c_done"
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
		name = "pwh_shadow_curse_arena_b",
		response = "pwh_shadow_curse_arena_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_shadow_curse_arena_a_done"
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
		name = "pwh_shadow_curse_arena_mid_conversation_eight_c",
		response = "pwh_shadow_curse_arena_mid_conversation_eight_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shadow_curse_arena_mid_conversation_eight_b_01"
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
		name = "pwh_shadow_curse_arena_mid_conversation_eight_e",
		response = "pwh_shadow_curse_arena_mid_conversation_eight_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_shadow_curse_arena_mid_conversation_eight_d_01"
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
		name = "pwh_shadow_curse_arena_mid_conversation_seven_d",
		response = "pwh_shadow_curse_arena_mid_conversation_seven_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_shadow_curse_arena_mid_conversation_seven_c_01"
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
		name = "pwh_shadow_curse_arena_mid_conversation_ten_c",
		response = "pwh_shadow_curse_arena_mid_conversation_ten_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_shadow_curse_arena_mid_conversation_ten_b_01"
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
		name = "pwh_wp_shadow_curse_arena_mid_conversation_one_b",
		response = "pwh_wp_shadow_curse_arena_mid_conversation_one_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_one_a_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_priest"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_wp_shadow_curse_arena_mid_conversation_one_d",
		response = "pwh_wp_shadow_curse_arena_mid_conversation_one_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_one_c_done"
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
		name = "pwh_wp_shadow_curse_arena_mid_conversation_two_b",
		response = "pwh_wp_shadow_curse_arena_mid_conversation_two_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_two_a_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_priest"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_wp_shadow_curse_arena_mid_conversation_two_d",
		response = "pwh_wp_shadow_curse_arena_mid_conversation_two_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nwd_shadow_curse_arena_mid_conversation_two_c_done"
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
		response = "sc1_shadow_curse_arrival_a_arena",
		name = "sc1_shadow_curse_arrival_a_arena",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_sc1_spawn"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_shadow_lieutenant"
			}
		}
	})
	define_rule({
		response = "sc2_shadow_curse_arrival_a_arena",
		name = "sc2_shadow_curse_arrival_a_arena",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_sc2_spawn"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_shadow_lieutenant"
			}
		}
	})
	define_rule({
		response = "sc3_shadow_curse_arrival_a_arena",
		name = "sc3_shadow_curse_arrival_a_arena",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shadow_curse_sc3_spawn"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_shadow_lieutenant"
			}
		}
	})
	add_dialogues({
		nfl_shadow_curse_arena_a = {
			override_awareness = "nfl_shadow_curse_arena_a_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"nfl_shadow_curse_arena_a_01",
				"nfl_shadow_curse_arena_a_02",
				"nfl_shadow_curse_arena_a_03",
				"nfl_shadow_curse_arena_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_shadow_curse_arena_a_01",
				"nfl_shadow_curse_arena_a_02",
				"nfl_shadow_curse_arena_a_03",
				"nfl_shadow_curse_arena_a_04"
			},
			sound_events_duration = {
				8.1029787063599,
				7.1859793663025,
				8.0309791564941,
				6.3729791641235
			}
		},
		nfl_shadow_curse_arena_event_start = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"nfl_shadow_curse_arena_event_start_01",
				"nfl_shadow_curse_arena_event_start_02",
				"nfl_shadow_curse_arena_event_start_03",
				"nfl_shadow_curse_arena_event_start_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_shadow_curse_arena_event_start_01",
				"nfl_shadow_curse_arena_event_start_02",
				"nfl_shadow_curse_arena_event_start_03",
				"nfl_shadow_curse_arena_event_start_04"
			},
			sound_events_duration = {
				3.6799790859222,
				5.0759792327881,
				4.9909791946411,
				4.4839792251587
			}
		},
		nfl_shadow_curse_complete = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"nfl_shadow_curse_complete_01",
				"nfl_shadow_curse_complete_02",
				"nfl_shadow_curse_complete_03",
				"nfl_shadow_curse_complete_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_shadow_curse_complete_01",
				"nfl_shadow_curse_complete_02",
				"nfl_shadow_curse_complete_03",
				"nfl_shadow_curse_complete_04"
			},
			sound_events_duration = {
				8.1729793548584,
				8.4719791412353,
				7.6909790039063,
				6.0279793739319
			}
		},
		nfl_shadow_curse_vortex_crystal = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 4,
			category = "npc_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"nfl_shadow_curse_vortex_crystal_01",
				"nfl_shadow_curse_vortex_crystal_02",
				"nfl_shadow_curse_vortex_crystal_03",
				"nfl_shadow_curse_vortex_crystal_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_shadow_curse_vortex_crystal_01",
				"nfl_shadow_curse_vortex_crystal_02",
				"nfl_shadow_curse_vortex_crystal_03",
				"nfl_shadow_curse_vortex_crystal_04"
			},
			sound_events_duration = {
				4.4249792098999,
				3.210000038147,
				3.6629791259766,
				3.1340000629425
			}
		},
		nwd_shadow_curse_arena_event_defeat = {
			override_awareness = "shadow_curse_complete_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"nwd_shadow_curse_arena_event_defeat_01",
				"nwd_shadow_curse_arena_event_defeat_02",
				"nwd_shadow_curse_arena_event_defeat_03",
				"nwd_shadow_curse_arena_event_defeat_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nwd_shadow_curse_arena_event_defeat_01",
				"nwd_shadow_curse_arena_event_defeat_02",
				"nwd_shadow_curse_arena_event_defeat_03",
				"nwd_shadow_curse_arena_event_defeat_04"
			},
			sound_events_duration = {
				7.683000087738,
				5.8850002288818,
				6.2800002098083,
				11.671999931335
			}
		},
		nwd_shadow_curse_arena_event_taunt = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 10,
			category = "boss_talk",
			dialogue_animations_n = 10,
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
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"nwd_shadow_curse_arena_event_taunt_01",
				"nwd_shadow_curse_arena_event_taunt_02",
				"nwd_shadow_curse_arena_event_taunt_03",
				"nwd_shadow_curse_arena_event_taunt_04",
				"nwd_shadow_curse_arena_event_taunt_05",
				"nwd_shadow_curse_arena_event_taunt_06",
				"nwd_shadow_curse_arena_event_taunt_07",
				"nwd_shadow_curse_arena_event_taunt_08",
				"nwd_shadow_curse_arena_event_taunt_09",
				"nwd_shadow_curse_arena_event_taunt_10"
			},
			randomize_indexes = {},
			sound_events = {
				"nwd_shadow_curse_arena_event_taunt_01",
				"nwd_shadow_curse_arena_event_taunt_02",
				"nwd_shadow_curse_arena_event_taunt_03",
				"nwd_shadow_curse_arena_event_taunt_04",
				"nwd_shadow_curse_arena_event_taunt_05",
				"nwd_shadow_curse_arena_event_taunt_06",
				"nwd_shadow_curse_arena_event_taunt_07",
				"nwd_shadow_curse_arena_event_taunt_08",
				"nwd_shadow_curse_arena_event_taunt_09",
				"nwd_shadow_curse_arena_event_taunt_10"
			},
			sound_events_duration = {
				4.2439250946045,
				7.2743620872498,
				3.6848711967468,
				5.5128312110901,
				5.9478712081909,
				5.3806052207947,
				7.5253267288208,
				6.9052367210388,
				7.3841409683228,
				13.849537849426
			}
		},
		nwd_shadow_curse_arena_mid_conversation_eight_a = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_eight_a_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_eight_a_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_eight_a_01"
			},
			sound_events_duration = {
				[1.0] = 10.864999771118
			}
		},
		nwd_shadow_curse_arena_mid_conversation_five_a = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_five_a_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_five_a_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_five_a_01"
			},
			sound_events_duration = {
				[1.0] = 10.47500038147
			}
		},
		nwd_shadow_curse_arena_mid_conversation_five_c = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_five_c_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_five_c_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_five_c_01"
			},
			sound_events_duration = {
				[1.0] = 4.3599791526794
			}
		},
		nwd_shadow_curse_arena_mid_conversation_four_a = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_four_a_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_four_a_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_four_a_01"
			},
			sound_events_duration = {
				[1.0] = 12.307999610901
			}
		},
		nwd_shadow_curse_arena_mid_conversation_four_c = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_four_c_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_four_c_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_four_c_01"
			},
			sound_events_duration = {
				[1.0] = 5.3239998817444
			}
		},
		nwd_shadow_curse_arena_mid_conversation_nine_a = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_nine_a_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_nine_a_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_nine_a_01"
			},
			sound_events_duration = {
				[1.0] = 6.4980001449585
			}
		},
		nwd_shadow_curse_arena_mid_conversation_one_a = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_one_a_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_one_a_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_one_a_01"
			},
			sound_events_duration = {
				[1.0] = 8.6369791030884
			}
		},
		nwd_shadow_curse_arena_mid_conversation_one_c = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_one_c_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_one_c_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_one_c_01"
			},
			sound_events_duration = {
				[1.0] = 8.6858682632446
			}
		},
		nwd_shadow_curse_arena_mid_conversation_seven_a = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_seven_a_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_seven_a_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_seven_a_01"
			},
			sound_events_duration = {
				[1.0] = 13.539999961853
			}
		},
		nwd_shadow_curse_arena_mid_conversation_six_a = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_six_a_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_six_a_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_six_a_01"
			},
			sound_events_duration = {
				[1.0] = 10.837999343872
			}
		},
		nwd_shadow_curse_arena_mid_conversation_six_c = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_six_c_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_six_c_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_six_c_01"
			},
			sound_events_duration = {
				[1.0] = 3.5150001049042
			}
		},
		nwd_shadow_curse_arena_mid_conversation_ten_dummy = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_ten_dummy_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "dummy"
			},
			sound_events = {
				[1.0] = "dummy"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			}
		},
		nwd_shadow_curse_arena_mid_conversation_three_a = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_three_a_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_three_a_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_three_a_01"
			},
			sound_events_duration = {
				[1.0] = 9.75
			}
		},
		nwd_shadow_curse_arena_mid_conversation_three_c = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_three_c_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_three_c_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_three_c_01"
			},
			sound_events_duration = {
				[1.0] = 5.1799998283386
			}
		},
		nwd_shadow_curse_arena_mid_conversation_two_a = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_two_a_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_two_a_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_two_a_01"
			},
			sound_events_duration = {
				[1.0] = 11.571000099182
			}
		},
		nwd_shadow_curse_arena_mid_conversation_two_c = {
			override_awareness = "nwd_shadow_curse_arena_mid_conversation_two_c_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_two_c_01"
			},
			sound_events = {
				[1.0] = "nwd_shadow_curse_arena_mid_conversation_two_c_01"
			},
			sound_events_duration = {
				[1.0] = 8.9949998855591
			}
		},
		nwd_shadow_curse_laughter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 4,
			category = "boss_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"nwd_shadow_curse_laughter_01",
				"nwd_shadow_curse_laughter_02",
				"nwd_shadow_curse_laughter_03",
				"nwd_shadow_curse_laughter_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nwd_shadow_curse_laughter_01",
				"nwd_shadow_curse_laughter_02",
				"nwd_shadow_curse_laughter_03",
				"nwd_shadow_curse_laughter_04"
			},
			sound_events_duration = {
				5.1395554542542,
				4.2991892099381,
				4.9596469402313,
				3.4991388320923
			}
		},
		pbw_shadow_curse_arena_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_shadow_curse_arena_b_01",
				"pbw_shadow_curse_arena_b_02",
				"pbw_shadow_curse_arena_b_03",
				"pbw_shadow_curse_arena_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_shadow_curse_arena_b_01",
				"pbw_shadow_curse_arena_b_02",
				"pbw_shadow_curse_arena_b_03",
				"pbw_shadow_curse_arena_b_04"
			},
			sound_events_duration = {
				3.3849792480469,
				4.0559792518616,
				3.095999956131,
				2.8059792518616
			}
		},
		pbw_shadow_curse_arena_mid_conversation_seven_c = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_shadow_curse_arena_mid_conversation_seven_c_01"
			},
			sound_events = {
				[1.0] = "pbw_shadow_curse_arena_mid_conversation_seven_c_01"
			},
			sound_events_duration = {
				[1.0] = 3.14097905159
			}
		},
		pbw_shadow_curse_arena_mid_conversation_ten_a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_shadow_curse_arena_mid_conversation_ten_a_01"
			},
			sound_events = {
				[1.0] = "pbw_shadow_curse_arena_mid_conversation_ten_a_01"
			},
			sound_events_duration = {
				[1.0] = 7.0419793128967
			}
		},
		pbw_shadow_curse_arena_mid_conversation_ten_d = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_shadow_curse_arena_mid_conversation_ten_d_01"
			},
			sound_events = {
				[1.0] = "pbw_shadow_curse_arena_mid_conversation_ten_d_01"
			},
			sound_events_duration = {
				[1.0] = 2.170000076294
			}
		},
		pbw_shadow_curse_arena_mid_conversation_three_b = {
			override_awareness = "pbw_shadow_curse_arena_mid_conversation_three_b_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_shadow_curse_arena_mid_conversation_three_b_01"
			},
			sound_events = {
				[1.0] = "pbw_shadow_curse_arena_mid_conversation_three_b_01"
			},
			sound_events_duration = {
				[1.0] = 6.7219791412353
			}
		},
		pbw_shadow_curse_arena_mid_conversation_three_d = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_shadow_curse_arena_mid_conversation_three_d_01"
			},
			sound_events = {
				[1.0] = "pbw_shadow_curse_arena_mid_conversation_three_d_01"
			},
			sound_events_duration = {
				[1.0] = 3.5169999599457
			}
		},
		pdr_shadow_curse_arena_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_shadow_curse_arena_b_01",
				"pdr_shadow_curse_arena_b_02",
				"pdr_shadow_curse_arena_b_03",
				"pdr_shadow_curse_arena_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_shadow_curse_arena_b_01",
				"pdr_shadow_curse_arena_b_02",
				"pdr_shadow_curse_arena_b_03",
				"pdr_shadow_curse_arena_b_04"
			},
			sound_events_duration = {
				3.0219790935516,
				3.0299792289734,
				4.0119791030884,
				5.4169793128967
			}
		},
		pdr_shadow_curse_arena_mid_conversation_eight_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_shadow_curse_arena_mid_conversation_eight_b_01"
			},
			sound_events = {
				[1.0] = "pdr_shadow_curse_arena_mid_conversation_eight_b_01"
			},
			sound_events_duration = {
				[1.0] = 3.2739791870117
			}
		},
		pdr_shadow_curse_arena_mid_conversation_eight_d = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_shadow_curse_arena_mid_conversation_eight_d_01"
			},
			sound_events = {
				[1.0] = "pdr_shadow_curse_arena_mid_conversation_eight_d_01"
			},
			sound_events_duration = {
				[1.0] = 3.437979221344
			}
		},
		pdr_shadow_curse_arena_mid_conversation_four_b = {
			override_awareness = "pdr_shadow_curse_arena_mid_conversation_four_b_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_shadow_curse_arena_mid_conversation_four_b_01"
			},
			sound_events = {
				[1.0] = "pdr_shadow_curse_arena_mid_conversation_four_b_01"
			},
			sound_events_duration = {
				[1.0] = 7.2349791526794
			}
		},
		pdr_shadow_curse_arena_mid_conversation_four_d = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_shadow_curse_arena_mid_conversation_four_d_01"
			},
			sound_events = {
				[1.0] = "pdr_shadow_curse_arena_mid_conversation_four_d_01"
			},
			sound_events_duration = {
				[1.0] = 3.4239792823791
			}
		},
		pes_shadow_curse_arena_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_shadow_curse_arena_b_01",
				"pes_shadow_curse_arena_b_02",
				"pes_shadow_curse_arena_b_03",
				"pes_shadow_curse_arena_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_shadow_curse_arena_b_01",
				"pes_shadow_curse_arena_b_02",
				"pes_shadow_curse_arena_b_03",
				"pes_shadow_curse_arena_b_04"
			},
			sound_events_duration = {
				2.5150001049042,
				3.3919792175293,
				4.6539998054504,
				5.3330001831055
			}
		},
		pes_shadow_curse_arena_mid_conversation_nine_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_shadow_curse_arena_mid_conversation_nine_b_01"
			},
			sound_events = {
				[1.0] = "pes_shadow_curse_arena_mid_conversation_nine_b_01"
			},
			sound_events_duration = {
				[1.0] = 3.8770000934601
			}
		},
		pes_shadow_curse_arena_mid_conversation_nine_d = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_shadow_curse_arena_mid_conversation_nine_d_01"
			},
			sound_events = {
				[1.0] = "pes_shadow_curse_arena_mid_conversation_nine_d_01"
			},
			sound_events_duration = {
				[1.0] = 3.2890000343323
			}
		},
		pes_shadow_curse_arena_mid_conversation_seven_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_shadow_curse_arena_mid_conversation_seven_b_01"
			},
			sound_events = {
				[1.0] = "pes_shadow_curse_arena_mid_conversation_seven_b_01"
			},
			sound_events_duration = {
				[1.0] = 6.5859789848328
			}
		},
		pes_shadow_curse_arena_mid_conversation_six_b = {
			override_awareness = "pes_shadow_curse_arena_mid_conversation_six_b_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_shadow_curse_arena_mid_conversation_six_b_01"
			},
			sound_events = {
				[1.0] = "pes_shadow_curse_arena_mid_conversation_six_b_01"
			},
			sound_events_duration = {
				[1.0] = 4.5079998970032
			}
		},
		pes_shadow_curse_arena_mid_conversation_six_d = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_shadow_curse_arena_mid_conversation_six_d_01"
			},
			sound_events = {
				[1.0] = "pes_shadow_curse_arena_mid_conversation_six_d_01"
			},
			sound_events_duration = {
				[1.0] = 3.4360001087189
			}
		},
		pwe_shadow_curse_arena_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_shadow_curse_arena_b_01",
				"pwe_shadow_curse_arena_b_02",
				"pwe_shadow_curse_arena_b_03",
				"pwe_shadow_curse_arena_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_shadow_curse_arena_b_01",
				"pwe_shadow_curse_arena_b_02",
				"pwe_shadow_curse_arena_b_03",
				"pwe_shadow_curse_arena_b_04"
			},
			sound_events_duration = {
				4.603000164032,
				3.3589999675751,
				3.2630000114441,
				4.1289792060852
			}
		},
		pwe_shadow_curse_arena_mid_conversation_nine_c = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_shadow_curse_arena_mid_conversation_nine_c_01"
			},
			sound_events = {
				[1.0] = "pwe_shadow_curse_arena_mid_conversation_nine_c_01"
			},
			sound_events_duration = {
				[1.0] = 3.3269791603088
			}
		},
		pwe_shadow_curse_arena_mid_conversation_ten_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_shadow_curse_arena_mid_conversation_ten_b_01"
			},
			sound_events = {
				[1.0] = "pwe_shadow_curse_arena_mid_conversation_ten_b_01"
			},
			sound_events_duration = {
				[1.0] = 4.4469790458679
			}
		},
		pwe_st_shadow_curse_arena_mid_conversation_five_b = {
			override_awareness = "pwe_st_shadow_curse_arena_mid_conversation_five_b_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_st_shadow_curse_arena_mid_conversation_five_b_01"
			},
			sound_events = {
				[1.0] = "pwe_st_shadow_curse_arena_mid_conversation_five_b_01"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			}
		},
		pwe_st_shadow_curse_arena_mid_conversation_five_d = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_st_shadow_curse_arena_mid_conversation_five_d_01"
			},
			sound_events = {
				[1.0] = "pwe_st_shadow_curse_arena_mid_conversation_five_d_01"
			},
			sound_events_duration = {
				[1.0] = 2.5369791984558
			}
		},
		pwh_shadow_curse_arena_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 4,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_shadow_curse_arena_b_01",
				"pwh_shadow_curse_arena_b_02",
				"pwh_shadow_curse_arena_b_03",
				"pwh_shadow_curse_arena_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_shadow_curse_arena_b_01",
				"pwh_shadow_curse_arena_b_02",
				"pwh_shadow_curse_arena_b_03",
				"pwh_shadow_curse_arena_b_04"
			},
			sound_events_duration = {
				5.2329998016357,
				4.2779793739319,
				4.7009792327881,
				5.1859793663025
			}
		},
		pwh_shadow_curse_arena_mid_conversation_eight_c = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_shadow_curse_arena_mid_conversation_eight_c_01"
			},
			sound_events = {
				[1.0] = "pwh_shadow_curse_arena_mid_conversation_eight_c_01"
			},
			sound_events_duration = {
				[1.0] = 2.7479999065399
			}
		},
		pwh_shadow_curse_arena_mid_conversation_eight_e = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_shadow_curse_arena_mid_conversation_eight_e_01"
			},
			sound_events = {
				[1.0] = "pwh_shadow_curse_arena_mid_conversation_eight_e_01"
			},
			sound_events_duration = {
				[1.0] = 2.6809792518616
			}
		},
		pwh_shadow_curse_arena_mid_conversation_seven_d = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_shadow_curse_arena_mid_conversation_seven_d_01"
			},
			sound_events = {
				[1.0] = "pwh_shadow_curse_arena_mid_conversation_seven_d_01"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			}
		},
		pwh_shadow_curse_arena_mid_conversation_ten_c = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_shadow_curse_arena_mid_conversation_ten_c_01"
			},
			sound_events = {
				[1.0] = "pwh_shadow_curse_arena_mid_conversation_ten_c_01"
			},
			sound_events_duration = {
				[1.0] = 4.7449793815613
			}
		},
		pwh_wp_shadow_curse_arena_mid_conversation_one_b = {
			override_awareness = "pwh_wp_shadow_curse_arena_mid_conversation_one_b_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_wp_shadow_curse_arena_mid_conversation_one_b_01"
			},
			sound_events = {
				[1.0] = "pwh_wp_shadow_curse_arena_mid_conversation_one_b_01"
			},
			sound_events_duration = {
				[1.0] = 2.8379790782928
			}
		},
		pwh_wp_shadow_curse_arena_mid_conversation_one_d = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_wp_shadow_curse_arena_mid_conversation_one_d_01"
			},
			sound_events = {
				[1.0] = "pwh_wp_shadow_curse_arena_mid_conversation_one_d_01"
			},
			sound_events_duration = {
				[1.0] = 2.8659999370575
			}
		},
		pwh_wp_shadow_curse_arena_mid_conversation_two_b = {
			override_awareness = "pwh_wp_shadow_curse_arena_mid_conversation_two_b_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_wp_shadow_curse_arena_mid_conversation_two_b_01"
			},
			sound_events = {
				[1.0] = "pwh_wp_shadow_curse_arena_mid_conversation_two_b_01"
			},
			sound_events_duration = {
				[1.0] = 5.9979791641235
			}
		},
		pwh_wp_shadow_curse_arena_mid_conversation_two_d = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hero_conversations_dlc_cowbell_arena",
			category = "level_talk_must_play",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_wp_shadow_curse_arena_mid_conversation_two_d_01"
			},
			sound_events = {
				[1.0] = "pwh_wp_shadow_curse_arena_mid_conversation_two_d_01"
			},
			sound_events_duration = {
				[1.0] = 7.7059998512268
			}
		},
		sc1_shadow_curse_arrival_a_arena = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 10,
			category = "player_alerts_boss",
			dialogue_animations_n = 10,
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
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"sc1_shadow_curse_arrival_a_01",
				"sc1_shadow_curse_arrival_a_02",
				"sc1_shadow_curse_arrival_a_03",
				"sc1_shadow_curse_arrival_a_04",
				"sc1_shadow_curse_arrival_a_05",
				"sc1_shadow_curse_arrival_a_06",
				"sc1_shadow_curse_arrival_a_07",
				"sc1_shadow_curse_arrival_a_08",
				"sc1_shadow_curse_arrival_a_09",
				"sc1_shadow_curse_arrival_a_10"
			},
			randomize_indexes = {},
			sound_events = {
				"sc1_shadow_curse_arrival_a_01",
				"sc1_shadow_curse_arrival_a_02",
				"sc1_shadow_curse_arrival_a_03",
				"sc1_shadow_curse_arrival_a_04",
				"sc1_shadow_curse_arrival_a_05",
				"sc1_shadow_curse_arrival_a_06",
				"sc1_shadow_curse_arrival_a_07",
				"sc1_shadow_curse_arrival_a_08",
				"sc1_shadow_curse_arrival_a_09",
				"sc1_shadow_curse_arrival_a_10"
			},
			sound_events_duration = {
				4.5900001525879,
				3.5039999485016,
				3.6929790973663,
				5.7890000343323,
				2.920000076294,
				3.6949999332428,
				4.643000125885,
				4.6020002365112,
				6.7010002136231,
				6.0689792633057
			}
		},
		sc2_shadow_curse_arrival_a_arena = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 10,
			category = "player_alerts_boss",
			dialogue_animations_n = 10,
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
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"sc2_shadow_curse_arrival_a_01",
				"sc2_shadow_curse_arrival_a_02",
				"sc2_shadow_curse_arrival_a_03",
				"sc2_shadow_curse_arrival_a_04",
				"sc2_shadow_curse_arrival_a_05",
				"sc2_shadow_curse_arrival_a_06",
				"sc2_shadow_curse_arrival_a_07",
				"sc2_shadow_curse_arrival_a_08",
				"sc2_shadow_curse_arrival_a_09",
				"sc2_shadow_curse_arrival_a_10"
			},
			randomize_indexes = {},
			sound_events = {
				"sc2_shadow_curse_arrival_a_01",
				"sc2_shadow_curse_arrival_a_02",
				"sc2_shadow_curse_arrival_a_03",
				"sc2_shadow_curse_arrival_a_04",
				"sc2_shadow_curse_arrival_a_05",
				"sc2_shadow_curse_arrival_a_06",
				"sc2_shadow_curse_arrival_a_07",
				"sc2_shadow_curse_arrival_a_08",
				"sc2_shadow_curse_arrival_a_09",
				"sc2_shadow_curse_arrival_a_10"
			},
			sound_events_duration = {
				4.1630001068115,
				4.7020001411438,
				3.8650000095367,
				3.4679999351502,
				5.1240000724792,
				3.2369999885559,
				3.5039999485016,
				3.1979999542236,
				3.845999956131,
				3.789999961853
			}
		},
		sc3_shadow_curse_arrival_a_arena = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "hero_conversations_dlc_cowbell_arena",
			sound_events_n = 10,
			category = "player_alerts_boss",
			dialogue_animations_n = 10,
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
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"sc3_shadow_curse_arrival_a_01",
				"sc3_shadow_curse_arrival_a_02",
				"sc3_shadow_curse_arrival_a_03",
				"sc3_shadow_curse_arrival_a_04",
				"sc3_shadow_curse_arrival_a_05",
				"sc3_shadow_curse_arrival_a_06",
				"sc3_shadow_curse_arrival_a_07",
				"sc3_shadow_curse_arrival_a_08",
				"sc3_shadow_curse_arrival_a_09",
				"sc3_shadow_curse_arrival_a_10"
			},
			randomize_indexes = {},
			sound_events = {
				"sc3_shadow_curse_arrival_a_01",
				"sc3_shadow_curse_arrival_a_02",
				"sc3_shadow_curse_arrival_a_03",
				"sc3_shadow_curse_arrival_a_04",
				"sc3_shadow_curse_arrival_a_05",
				"sc3_shadow_curse_arrival_a_06",
				"sc3_shadow_curse_arrival_a_07",
				"sc3_shadow_curse_arrival_a_08",
				"sc3_shadow_curse_arrival_a_09",
				"sc3_shadow_curse_arrival_a_10"
			},
			sound_events_duration = {
				3.6649792194366,
				3.9140000343323,
				6.1199998855591,
				5.7490000724792,
				5.4039998054504,
				3.1989998817444,
				3.9639999866486,
				5.5780000686645,
				3.295000076294,
				6.0869998931885
			}
		}
	})
end
