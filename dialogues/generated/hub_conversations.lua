return function ()
	define_rule({
		response = "nik_greeting",
		name = "nik_greeting",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_greeting"
			}
		}
	})
	define_rule({
		response = "nik_map_intro",
		name = "nik_map_intro",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_map_intro"
			}
		}
	})
	define_rule({
		response = "nik_inventory_reminder",
		name = "nik_inventory_reminder",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_inventory_reminder"
			}
		}
	})
	define_rule({
		response = "nik_intro_forge",
		name = "nik_intro_forge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_intro_forge"
			}
		}
	})
	define_rule({
		response = "nik_intro_forge_reminder",
		name = "nik_intro_forge_reminder",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_intro_forge_reminder"
			}
		}
	})
	define_rule({
		response = "nik_altar",
		name = "nik_altar",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_altar"
			}
		}
	})
	define_rule({
		response = "nik_forge",
		name = "nik_forge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_forge"
			}
		}
	})
	define_rule({
		response = "nik_hub_welcome",
		name = "nik_hub_welcome",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_hub_welcome"
			}
		}
	})
	define_rule({
		response = "nik_hub_the_plan",
		name = "nik_hub_the_plan",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_hub_the_plan"
			},
			{
				"global_context",
				"completed_times_military",
				OP.EQ,
				0
			}
		}
	})
	define_rule({
		response = "nik_hub_long_waiting_01",
		name = "nik_hub_long_waiting_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_hub_long_waiting"
			}
		}
	})
	define_rule({
		response = "nik_greeting_first_time",
		name = "nik_greeting_first_time",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_greeting_first_time"
			}
		}
	})
	define_rule({
		response = "nik_hub_backstory_interaction",
		name = "nik_hub_backstory_interaction",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_backstory_interacting"
			}
		}
	})
	define_rule({
		response = "nik_greeting_sunny",
		name = "nik_greeting_sunny",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_greeting_sunny"
			}
		}
	})
	define_rule({
		response = "nik_greeting_rainy",
		name = "nik_greeting_rainy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_greeting_rainy"
			}
		}
	})
	define_rule({
		response = "nik_greeting_night",
		name = "nik_greeting_night",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_greeting_night"
			}
		}
	})
	define_rule({
		response = "nik_greeting_evening",
		name = "nik_greeting_evening",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nik_greeting_evening"
			}
		}
	})
	define_rule({
		response = "nik_callout_unready_bardin",
		name = "nik_callout_unready_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_bardin"
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
		response = "nik_callout_unready_kerillian",
		name = "nik_callout_unready_kerillian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_kerillian"
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
		response = "nik_callout_unready_kruber",
		name = "nik_callout_unready_kruber",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_kruber"
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
		response = "nik_callout_unready_kruber_mercenary",
		name = "nik_callout_unready_kruber_mercenary",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_kruber"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"global_context",
				"es_mercenary",
				OP.EQ,
				1
			}
		}
	})
	define_rule({
		response = "nik_callout_unready_saltzpyre",
		name = "nik_callout_unready_saltzpyre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_saltzpyre"
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
		response = "nik_callout_unready_sienna",
		name = "nik_callout_unready_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"callout_unready_sienna"
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
		name = "nik_keep_idle_banter_one_01",
		response = "nik_keep_idle_banter_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"npp_keep_idle_banter_one_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_keep_idle_banter_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_banter_one_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_idle_banter_two_01",
		response = "nik_keep_idle_banter_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"npp_keep_idle_banter_two_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_keep_idle_banter_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_banter_two_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_idle_banter_three",
		response = "nik_keep_idle_banter_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"npp_keep_idle_banter_three_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_keep_idle_banter_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_banter_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_idle_banter_four_01",
		response = "nik_keep_idle_banter_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_keep_idle_banter_four"
			},
			{
				"user_memory",
				"keep_idle_painter",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"keep_idle_painter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_idle_banter_four_02",
		response = "nik_keep_idle_banter_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"npp_keep_idle_banter_four_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_keep_idle_banter_four_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_banter_four_02",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_hub_lohner_conversation_twentyone_01",
		response = "nik_hub_lohner_conversation_twentyone_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversation_twentyone_01"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"nik_hub_lohner_conversation_twentyone_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_twentyone_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_hub_lohner_conversation_twentyone_01",
		name = "pes_hub_lohner_conversation_twentyone_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_twentyone_01"
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
		name = "nik_hub_lohner_conversation_twentytwo_01",
		response = "nik_hub_lohner_conversation_twentytwo_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversation_twentytwo_01"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"nik_hub_lohner_conversation_twentytwo_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_twentytwo_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_hub_lohner_conversation_twentytwo_01",
		name = "pes_hub_lohner_conversation_twentytwo_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_twentytwo_01"
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
		name = "nik_hub_lohner_conversation_twentythree_01",
		response = "nik_hub_lohner_conversation_twentythree_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversation_twentythree_01"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"nik_hub_lohner_conversation_twentythree_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_twentythree_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_hub_lohner_conversation_twentythree_01",
		name = "pes_hub_lohner_conversation_twentythree_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_twentythree_01"
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
		name = "nik_hub_lohner_conversation_twentyfour_01",
		response = "nik_hub_lohner_conversation_twentyfour_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversation_twentyfour_01"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"nik_hub_lohner_conversation_twentyfour_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_twentyfour_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_hub_lohner_conversation_twentyfour_01",
		name = "pes_hub_lohner_conversation_twentyfour_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_twentyfour_01"
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
		name = "nik_hub_lohner_conversation_twentyfive_01",
		response = "nik_hub_lohner_conversation_twentyfive_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversation_twentyfive_01"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"nik_hub_lohner_conversation_twentyfive_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_twentyfive_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_hub_lohner_conversation_twentyfive_01",
		name = "pes_hub_lohner_conversation_twentyfive_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_twentyfive_01"
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
		name = "pes_dr_backstory_six_01",
		response = "pes_dr_backstory_six_01",
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
				"dr_backstory_six",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dr_backstory_six",
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
		name = "pdr_dr_backstory_six_01",
		response = "pdr_dr_backstory_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dr_backstory_six_01"
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
		name = "pes_dr_backstory_six_02",
		response = "pes_dr_backstory_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_backstory_six_01"
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
		name = "pdr_dr_backstory_six_02",
		response = "pdr_dr_backstory_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dr_backstory_six_02"
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
		name = "pes_dr_backstory_six_03",
		response = "pes_dr_backstory_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_backstory_six_02"
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
		name = "pdr_dr_backstory_six_03",
		response = "pdr_dr_backstory_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dr_backstory_six_03"
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
		name = "pdr_bw_backstory_five_01",
		response = "pdr_bw_backstory_five_01",
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
				"bw_backstory_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_backstory_five",
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
		name = "pbw_bw_backstory_five_01",
		response = "pbw_bw_backstory_five_01",
		criterias = {
			{
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
		name = "pdr_bw_backstory_five_02",
		response = "pdr_bw_backstory_five_02",
		criterias = {
			{
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
		name = "pbw_bw_backstory_five_02",
		response = "pbw_bw_backstory_five_02",
		criterias = {
			{
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
		name = "pbw_es_future_one_01",
		response = "pbw_es_future_one_01",
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
				"es_future_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"es_future_one",
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
		name = "pes_es_future_one_01",
		response = "pes_es_future_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_es_future_one_01"
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
		name = "pbw_es_future_one_02",
		response = "pbw_es_future_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_future_one_01"
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
		name = "pes_es_future_one_02",
		response = "pes_es_future_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_es_future_one_02"
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
		name = "pbw_es_future_one_04",
		response = "pbw_es_future_one_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_future_one_02"
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
		name = "pes_dr_backstory_two_01",
		response = "pes_dr_backstory_two_01",
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
				"dr_backstory_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dr_backstory_two",
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
		name = "pdr_dr_backstory_two_01",
		response = "pdr_dr_backstory_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dr_backstory_two_01"
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
		name = "pes_dr_backstory_two_02",
		response = "pes_dr_backstory_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_backstory_two_01"
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
		name = "pdr_dr_backstory_two_02",
		response = "pdr_dr_backstory_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dr_backstory_two_02"
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
		name = "pwh_es_future_two_01",
		response = "pwh_es_future_two_01",
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
				"es_future_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"es_future_two",
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
		name = "pes_es_future_two_01",
		response = "pes_es_future_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_es_future_two_01"
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
		name = "pwh_es_future_two_02",
		response = "pwh_es_future_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_future_two_01"
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
		name = "pes_es_future_two_02",
		response = "pes_es_future_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dr_backstory_two_02"
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
		name = "pwh_es_future_two_03",
		response = "pwh_es_future_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_future_two_02"
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
		name = "pes_es_future_two_03",
		response = "pes_es_future_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_es_future_two_03"
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
		name = "pbw_bw_backstory_four_01",
		response = "pbw_bw_backstory_four_01",
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
				"bw_backstory_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_backstory_four",
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
		name = "pwe_bw_backstory_four_02",
		response = "pwe_bw_backstory_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_four_01"
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
		name = "pbw_bw_backstory_four_02",
		response = "pbw_bw_backstory_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bw_backstory_four_02"
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
		name = "pwe_bw_backstory_four_03",
		response = "pwe_bw_backstory_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_four_02"
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
		name = "pwe_es_backstory_huntsman_five_01",
		response = "pwe_es_backstory_huntsman_five_01",
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
				"es_huntsman",
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
				"es_backstory_huntsman_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"es_backstory_huntsman_five",
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
		name = "pes_es_backstory_huntsman_five_02",
		response = "pes_es_backstory_huntsman_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_es_backstory_huntsman_five_01"
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
		name = "pwe_es_backstory_huntsman_five_03",
		response = "pwe_es_backstory_huntsman_five_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_huntsman_five_02"
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
		name = "pes_es_backstory_huntsman_five_04",
		response = "pes_es_backstory_huntsman_five_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_es_backstory_huntsman_five_03"
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
		name = "pwe_es_backstory_huntsman_five_05",
		response = "pwe_es_backstory_huntsman_five_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_huntsman_five_04"
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
		name = "pbw_bw_future_three_01",
		response = "pbw_bw_future_three_01",
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
				"bw_future_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_future_three",
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
		name = "pdr_bw_future_three_01",
		response = "pdr_bw_future_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_three_01"
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
		name = "pbw_bw_future_three_02",
		response = "pbw_bw_future_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bw_future_three_01"
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
		name = "pdr_bw_future_three_02",
		response = "pdr_bw_future_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_three_02"
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
		name = "pbw_bw_future_three_03",
		response = "pbw_bw_future_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bw_future_three_02"
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
		name = "pdr_bw_future_three_03",
		response = "pdr_bw_future_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_three_03"
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
		name = "pbw_bw_future_three_04",
		response = "pbw_bw_future_three_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bw_future_three_03"
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
		name = "pdr_bw_future_three_04",
		response = "pdr_bw_future_three_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_three_04"
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
		name = "pes_we_backstory_three_01",
		response = "pes_we_backstory_three_01",
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
				"we_backstory_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"we_backstory_three",
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
		name = "pdr_we_backstory_three_01",
		response = "pdr_we_backstory_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_backstory_three_01"
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
		name = "pes_we_backstory_three_02",
		response = "pes_we_backstory_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_backstory_three_01"
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
		name = "pdr_we_backstory_three_02",
		response = "pdr_we_backstory_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_backstory_three_02"
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
		name = "pes_we_backstory_three_03",
		response = "pes_we_backstory_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_backstory_three_02"
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
		name = "pdr_we_backstory_three_03",
		response = "pdr_we_backstory_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_backstory_three_03"
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
		name = "pes_we_backstory_three_04",
		response = "pes_we_backstory_three_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_backstory_three_03"
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
		name = "pdr_we_backstory_three_04",
		response = "pdr_we_backstory_three_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_backstory_three_04"
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
		name = "pes_we_backstory_three_05",
		response = "pes_we_backstory_three_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_backstory_three_04"
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
		name = "pes_es_future_three_01",
		response = "pes_es_future_three_01",
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
				"player_career",
				OP.EQ,
				"es_mercenary"
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
				"es_future_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"es_future_three",
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
		name = "pdr_es_future_three_01",
		response = "pdr_es_future_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_future_three_01"
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
		name = "pes_es_future_three_02",
		response = "pes_es_future_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_es_future_three_01"
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
		name = "pdr_es_future_three_02",
		response = "pdr_es_future_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_future_three_02"
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
		name = "pes_es_future_three_03",
		response = "pes_es_future_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_es_future_three_02"
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
		name = "pdr_es_future_three_03",
		response = "pdr_es_future_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_future_three_03"
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
		name = "pwe_es_future_four_01",
		response = "pwe_es_future_four_01",
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
				"es_future_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"es_future_four",
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
		name = "pes_es_future_four_01",
		response = "pes_es_future_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_es_future_four_01"
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
		name = "pwe_es_future_four_02",
		response = "pwe_es_future_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_future_four_01"
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
		name = "pes_es_future_four_02",
		response = "pes_es_future_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_es_future_four_02"
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
		name = "pwe_es_future_four_03",
		response = "pwe_es_future_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_future_four_02"
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
		name = "pwe_es_future_four_04",
		response = "pwe_es_future_four_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_es_future_four_03"
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
		name = "pes_dr_backstory_five_01",
		response = "pes_dr_backstory_five_01",
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
				"dr_ironbreaker",
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
				"dr_backstory_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dr_backstory_five",
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
		name = "pdr_dr_backstory_five_02",
		response = "pdr_dr_backstory_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dr_backstory_five_01"
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
		name = "pes_dr_backstory_five_02",
		response = "pes_dr_backstory_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_backstory_five_02"
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
		name = "pdr_dr_backstory_five_03",
		response = "pdr_dr_backstory_five_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dr_backstory_five_02"
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
		name = "pdr_bw_backstory_one_01",
		response = "pdr_bw_backstory_one_01",
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
				"bw_backstory_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_backstory_one",
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
		name = "pbw_bw_backstory_one_01",
		response = "pbw_bw_backstory_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bw_backstory_one_01"
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
		name = "pdr_bw_backstory_one_02",
		response = "pdr_bw_backstory_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_one_01"
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
		name = "pbw_bw_backstory_one_02",
		response = "pbw_bw_backstory_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bw_backstory_one_02"
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
		name = "pdr_bw_backstory_one_03",
		response = "pdr_bw_backstory_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_one_02"
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
		name = "pbw_bw_backstory_one_03",
		response = "pbw_bw_backstory_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_bw_backstory_one_03"
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
		name = "pdr_dr_future_four_01",
		response = "pdr_dr_future_four_01",
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
				"dr_future_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dr_future_four",
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
		name = "pbw_dr_future_four_01",
		response = "pbw_dr_future_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_four_01"
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
		name = "pdr_dr_future_four_02",
		response = "pdr_dr_future_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dr_future_four_01"
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
		name = "pes_dr_future_four_02",
		response = "pes_dr_future_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_four_02"
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
		name = "pdr_dr_future_four_03",
		response = "pdr_dr_future_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dr_future_four_02"
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
		name = "pwh_we_future_one_01",
		response = "pwh_we_future_one_01",
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
				"we_future_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"we_future_one",
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
		name = "pwe_we_future_one_01",
		response = "pwe_we_future_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_we_future_one_01"
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
		name = "pwh_we_future_one_02",
		response = "pwh_we_future_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_future_one_01"
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
		name = "pwe_we_future_one_02",
		response = "pwe_we_future_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_we_future_one_02"
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
		name = "pwe_bw_future_four_01",
		response = "pwe_bw_future_four_01",
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
				"bw_future_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_future_four",
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
		name = "pbw_bw_future_four_01",
		response = "pbw_bw_future_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bw_future_four_01"
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
		name = "pwe_bw_future_four_02",
		response = "pwe_bw_future_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_four_01"
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
		name = "pbw_bw_future_four_02",
		response = "pbw_bw_future_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bw_future_four_02"
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
		name = "pwe_bw_future_four_03",
		response = "pwe_bw_future_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_four_02"
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
		name = "pwh_dr_backstory_one_01",
		response = "pwh_dr_backstory_one_01",
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
				"dr_backstory_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dr_backstory_one",
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
		name = "pdr_dr_backstory_one_01",
		response = "pdr_dr_backstory_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dr_backstory_one_01"
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
		name = "pwh_dr_backstory_one_02",
		response = "pwh_dr_backstory_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_backstory_one_01"
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
		name = "pdr_dr_backstory_one_02",
		response = "pdr_dr_backstory_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dr_backstory_one_02"
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
		name = "pwe_dr_backstory_one_03",
		response = "pwe_dr_backstory_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_backstory_one_02"
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
		name = "pes_wh_backstory_four_02",
		response = "pes_wh_backstory_four_02",
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
				"wh_backstory_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wh_backstory_four",
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
		name = "pwh_wh_backstory_four_02",
		response = "pwh_wh_backstory_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wh_backstory_four_02"
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
		name = "pes_wh_backstory_four_03",
		response = "pes_wh_backstory_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_four_02"
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
		name = "pwh_wh_backstory_four_03",
		response = "pwh_wh_backstory_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wh_backstory_four_03"
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
		name = "pes_wh_backstory_four_04",
		response = "pes_wh_backstory_four_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_four_03"
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
		name = "pwh_wh_backstory_four_04",
		response = "pwh_wh_backstory_four_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wh_backstory_four_04"
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
		name = "pes_wh_backstory_four_05",
		response = "pes_wh_backstory_four_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_four_04"
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
		name = "pwh_bw_future_two_01",
		response = "pwh_bw_future_two_01",
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
				"bw_future_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_future_two",
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
		name = "pbw_bw_future_two_01",
		response = "pbw_bw_future_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bw_future_two_01"
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
		name = "pwh_bw_future_two_02",
		response = "pwh_bw_future_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_two_01"
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
		name = "pbw_bw_future_two_02",
		response = "pbw_bw_future_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bw_future_two_02"
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
		name = "pwh_bw_future_two_033",
		response = "pwh_bw_future_two_033",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_two_02"
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
		name = "pes_bw_backstory_seven_03",
		response = "pes_bw_backstory_seven_03",
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
				"bw_backstory_seven",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_backstory_seven",
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
		name = "pbw_bw_backstory_seven_03",
		response = "pbw_bw_backstory_seven_03",
		criterias = {
			{
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
		name = "pes_bw_backstory_seven_04",
		response = "pes_bw_backstory_seven_04",
		criterias = {
			{
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
		name = "pbw_bw_backstory_seven_04",
		response = "pbw_bw_backstory_seven_04",
		criterias = {
			{
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
		name = "pes_bw_backstory_seven_05",
		response = "pes_bw_backstory_seven_05",
		criterias = {
			{
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
		name = "pbw_bw_backstory_three_01",
		response = "pbw_bw_backstory_three_01",
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
				"bw_backstory_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_backstory_three",
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
		name = "pwh_bw_backstory_three_01",
		response = "pwh_bw_backstory_three_01",
		criterias = {
			{
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
		name = "pbw_bw_backstory_three_02",
		response = "pbw_bw_backstory_three_02",
		criterias = {
			{
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
		name = "pwh_bw_backstory_three_02",
		response = "pwh_bw_backstory_three_02",
		criterias = {
			{
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
		name = "pbw_bw_backstory_three_03",
		response = "pbw_bw_backstory_three_03",
		criterias = {
			{
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
		name = "pwh_bw_backstory_three_03",
		response = "pwh_bw_backstory_three_03",
		criterias = {
			{
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
		name = "pbw_es_backstory_two_01",
		response = "pbw_es_backstory_two_01",
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
				"es_backstory_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"es_backstory_two",
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
		name = "pes_es_backstory_two_01",
		response = "pes_es_backstory_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_es_backstory_two_01"
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
		name = "pbw_es_backstory_two_02",
		response = "pbw_es_backstory_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_two_01"
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
		name = "pes_es_backstory_two_02",
		response = "pes_es_backstory_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_es_backstory_two_02"
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
		name = "pes_es_backstory_two_03",
		response = "pes_es_backstory_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_two_02"
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
		name = "pbw_es_backstory_two_03",
		response = "pbw_es_backstory_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_two_03"
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
		name = "pwh_we_backstory_four_01",
		response = "pwh_we_backstory_four_01",
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
				"we_backstory_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"we_backstory_four",
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
		name = "pbw_we_backstory_four_01",
		response = "pbw_we_backstory_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_we_backstory_four_01"
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
		name = "pwh_we_backstory_four_02",
		response = "pwh_we_backstory_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_we_backstory_four_01"
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
		name = "pbw_we_backstory_four_02",
		response = "pbw_we_backstory_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_we_backstory_four_02"
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
		name = "pwh_we_backstory_four_03",
		response = "pwh_we_backstory_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_we_backstory_four_02"
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
		name = "pdr_dr_future_one_01",
		response = "pdr_dr_future_one_01",
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
				"dr_future_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dr_future_one",
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
		name = "pes_dr_future_one_01",
		response = "pes_dr_future_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_one_01"
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
		name = "pdr_dr_future_one_02",
		response = "pdr_dr_future_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dr_future_one_01"
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
		name = "pes_dr_future_one_02",
		response = "pes_dr_future_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_one_02"
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
		name = "pdr_dr_future_one_03",
		response = "pdr_dr_future_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_dr_future_one_02"
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
		name = "pbw_we_backstory_one_01",
		response = "pbw_we_backstory_one_01",
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
				"we_backstory_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"we_backstory_one",
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
		name = "pwe_we_backstory_one_01",
		response = "pwe_we_backstory_one_01",
		criterias = {
			{
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
		name = "pbw_we_backstory_one_02",
		response = "pbw_we_backstory_one_02",
		criterias = {
			{
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
		name = "pwe_we_backstory_one_02",
		response = "pwe_we_backstory_one_02",
		criterias = {
			{
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
		name = "pwe_we_backstory_one_03",
		response = "pwe_we_backstory_one_03",
		criterias = {
			{
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
		name = "pbw_we_backstory_one_03",
		response = "pbw_we_backstory_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_one_03"
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
		name = "pdr_we_future_three_01",
		response = "pdr_we_future_three_01",
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
				"we_future_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"we_future_three",
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
		name = "pwe_we_future_three_01",
		response = "pwe_we_future_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_future_three_01"
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
		name = "pdr_we_future_three_02",
		response = "pdr_we_future_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_future_three_01"
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
		name = "pwe_we_future_three_02",
		response = "pwe_we_future_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_we_future_three_02"
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
		name = "pdr_we_future_three_03",
		response = "pdr_we_future_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_future_three_02"
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
		name = "pdr_wh_backstory_one_01",
		response = "pdr_wh_backstory_one_01",
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
				"wh_backstory_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wh_backstory_one",
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
		name = "pwh_wh_backstory_one_01",
		response = "pwh_wh_backstory_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_wh_backstory_one_01"
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
		name = "pdr_wh_backstory_one_02",
		response = "pdr_wh_backstory_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_one_01"
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
		name = "pwh_wh_backstory_one_02",
		response = "pwh_wh_backstory_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_wh_backstory_one_02"
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
		name = "pdr_wh_backstory_one_03",
		response = "pdr_wh_backstory_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_backstory_one_02"
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
		name = "pwh_bw_future_eight_03",
		response = "pwh_bw_future_eight_03",
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
				"bw_future_eight",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_future_eight",
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
		name = "pbw_bw_future_eight_03",
		response = "pbw_bw_future_eight_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bw_future_eight_03"
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
		name = "pwh_bw_future_eight_04",
		response = "pwh_bw_future_eight_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_eight_03"
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
		name = "pbw_bw_future_eight_04",
		response = "pbw_bw_future_eight_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_bw_future_eight_04"
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
		name = "pwh_we_backstory_two_01",
		response = "pwh_we_backstory_two_01",
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
				"we_backstory_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"we_backstory_two",
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
		name = "pwe_we_backstory_two_02",
		response = "pwe_we_backstory_two_02",
		criterias = {
			{
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
		name = "pwh_we_backstory_two_02",
		response = "pwh_we_backstory_two_02",
		criterias = {
			{
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
		name = "pwe_we_backstory_two_03",
		response = "pwe_we_backstory_two_03",
		criterias = {
			{
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
		name = "pwh_we_backstory_two_03",
		response = "pwh_we_backstory_two_03",
		criterias = {
			{
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
		name = "pwe_we_backstory_two_04",
		response = "pwe_we_backstory_two_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_we_backstory_two_03"
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
		name = "pwh_we_backstory_two_04",
		response = "pwh_we_backstory_two_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_two_04"
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
		name = "pwe_we_backstory_two_05",
		response = "pwe_we_backstory_two_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_we_backstory_two_04"
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
		name = "pwh_we_backstory_two_05",
		response = "pwh_we_backstory_two_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_backstory_two_05"
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
		name = "pwe_we_backstory_two_06",
		response = "pwe_we_backstory_two_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_we_backstory_two_05"
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
		name = "pwh_wh_backstory_two_01",
		response = "pwh_wh_backstory_two_01",
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
				"we_backstory_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"we_backstory_two",
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
		name = "pwe_wh_backstory_two_01",
		response = "pwe_wh_backstory_two_01",
		criterias = {
			{
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
		name = "pwh_wh_backstory_two_02",
		response = "pwh_wh_backstory_two_02",
		criterias = {
			{
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
		name = "pwe_wh_backstory_two_02",
		response = "pwe_wh_backstory_two_02",
		criterias = {
			{
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
		name = "pwh_wh_backstory_two_03",
		response = "pwh_wh_backstory_two_03",
		criterias = {
			{
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
		name = "pwe_wh_backstory_two_03",
		response = "pwe_wh_backstory_two_03",
		criterias = {
			{
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
		name = "pwh_wh_backstory_two_04",
		response = "pwh_wh_backstory_two_04",
		criterias = {
			{
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
		name = "pwe_wh_backstory_two_04",
		response = "pwe_wh_backstory_two_04",
		criterias = {
			{
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
		name = "pwh_wh_backstory_two_05",
		response = "pwh_wh_backstory_two_05",
		criterias = {
			{
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
		name = "pbw_we_future_five_01",
		response = "pbw_we_future_five_01",
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
				"we_future_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"we_future_five",
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
		name = "pwe_we_future_five_01",
		response = "pwe_we_future_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_we_future_five_01"
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
		name = "pbw_we_future_five_02",
		response = "pbw_we_future_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_future_five_01"
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
		name = "pwe_we_future_five_02",
		response = "pwe_we_future_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_we_future_five_02"
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
		name = "pbw_we_future_five_03",
		response = "pbw_we_future_five_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_future_five_02"
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
		name = "pwe_we_future_five_05",
		response = "pwe_we_future_five_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_we_future_five_03"
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
		name = "pes_bw_backstory_two_01",
		response = "pes_bw_backstory_two_01",
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
				"bw_backstory_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_backstory_two",
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
		name = "pbw_bw_backstory_two_01",
		response = "pbw_bw_backstory_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bw_backstory_two_01"
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
		name = "pes_bw_backstory_two_02",
		response = "pes_bw_backstory_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_two_01"
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
		name = "pbw_bw_backstory_two_02",
		response = "pbw_bw_backstory_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bw_backstory_two_02"
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
		name = "pes_bw_backstory_two_033",
		response = "pes_bw_backstory_two_033",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_two_02"
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
		name = "pes_we_future_four_01",
		response = "pes_we_future_four_01",
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
				"we_future_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"we_future_four",
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
		name = "pwe_we_future_four_01",
		response = "pwe_we_future_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_future_four_01"
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
		name = "pes_we_future_four_02",
		response = "pes_we_future_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_future_four_01"
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
		name = "pwe_we_future_four_03",
		response = "pwe_we_future_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_future_four_02"
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
		name = "pes_we_future_four_03",
		response = "pes_we_future_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_future_four_03"
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
		name = "pwe_we_future_four_04",
		response = "pwe_we_future_four_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_future_four_03"
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
		name = "pes_we_future_four_04",
		response = "pes_we_future_four_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_future_four_04"
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
		name = "pwh_dr_future_two_01",
		response = "pwh_dr_future_two_01",
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
				"dr_future_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dr_future_two",
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
		name = "pdr_dr_future_two_01",
		response = "pdr_dr_future_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dr_future_two_01"
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
		name = "pwh_dr_future_two_02",
		response = "pwh_dr_future_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_two_01"
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
		name = "pdr_dr_future_two_02",
		response = "pdr_dr_future_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dr_future_two_02"
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
		name = "pwh_dr_future_two_03",
		response = "pwh_dr_future_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_two_02"
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
		name = "pdr_dr_future_two_03",
		response = "pdr_dr_future_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_dr_future_two_03"
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
		name = "pes_wh_future_one_01",
		response = "pes_wh_future_one_01",
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
				"wh_future_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wh_future_one",
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
		name = "pwh_wh_future_one_01",
		response = "pwh_wh_future_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wh_future_one_01"
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
		name = "pes_wh_future_one_02",
		response = "pes_wh_future_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_future_one_01"
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
		name = "pwh_wh_future_one_02",
		response = "pwh_wh_future_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wh_future_one_02"
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
		name = "pes_wh_future_one_03",
		response = "pes_wh_future_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_future_one_02"
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
		name = "pwh_wh_future_one_03",
		response = "pwh_wh_future_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wh_future_one_03"
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
		name = "pwe_es_backstory_one_01",
		response = "pwe_es_backstory_one_01",
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
				"es_backstory_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"es_backstory_one",
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
		name = "pes_es_backstory_one_01",
		response = "pes_es_backstory_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_es_backstory_one_01"
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
		name = "pwe_es_backstory_one_02",
		response = "pwe_es_backstory_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_one_01"
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
		name = "pes_es_backstory_one_02",
		response = "pes_es_backstory_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_es_backstory_one_02"
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
		name = "pwe_es_backstory_one_03",
		response = "pwe_es_backstory_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_backstory_one_02"
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
		name = "pbw_dr_backstory_three_01",
		response = "pbw_dr_backstory_three_01",
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
				"dr_backstory_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dr_backstory_three",
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
		name = "pdr_dr_backstory_three_02",
		response = "pdr_dr_backstory_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dr_backstory_three_01"
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
		name = "pbw_dr_backstory_three_02",
		response = "pbw_dr_backstory_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_backstory_three_02"
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
		name = "pdr_dr_backstory_three_03",
		response = "pdr_dr_backstory_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dr_backstory_three_02"
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
		name = "pbw_dr_backstory_three_03",
		response = "pbw_dr_backstory_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_backstory_three_03"
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
		name = "pdr_dr_backstory_three_04",
		response = "pdr_dr_backstory_three_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dr_backstory_three_03"
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
		name = "pbw_dr_backstory_three_04",
		response = "pbw_dr_backstory_three_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_backstory_three_04"
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
		name = "pdr_dr_backstory_three_05",
		response = "pdr_dr_backstory_three_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dr_backstory_three_04"
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
		name = "pdr_dr_future_three_01",
		response = "pdr_dr_future_three_01",
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
				"dr_future_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dr_future_three",
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
		name = "pbw_dr_future_three_01",
		response = "pbw_dr_future_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_three_01"
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
		name = "pdr_dr_future_three_02",
		response = "pdr_dr_future_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dr_future_three_01"
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
		name = "pbw_dr_future_three_02",
		response = "pbw_dr_future_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_three_02"
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
		name = "pdr_dr_future_three_03",
		response = "pdr_dr_future_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_dr_future_three_02"
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
		name = "pes_es_backstory_three_01",
		response = "pes_es_backstory_three_01",
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
				"es_backstory_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"es_backstory_three",
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
		name = "pwh_es_backstory_three_01",
		response = "pwh_es_backstory_three_01",
		criterias = {
			{
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
		name = "pes_es_backstory_three_02",
		response = "pes_es_backstory_three_02",
		criterias = {
			{
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
		name = "pwh_es_backstory_three_02",
		response = "pwh_es_backstory_three_02",
		criterias = {
			{
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
		name = "pes_es_backstory_three_03",
		response = "pes_es_backstory_three_03",
		criterias = {
			{
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
		name = "pwh_es_backstory_three_03",
		response = "pwh_es_backstory_three_03",
		criterias = {
			{
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
		name = "pbw_bw_future_one_01",
		response = "pbw_bw_future_one_01",
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
				"bw_future_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_future_one",
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
		name = "pes_bw_future_one_02",
		response = "pes_bw_future_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_one_01"
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
		name = "pbw_bw_future_one_02",
		response = "pbw_bw_future_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bw_future_one_02"
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
		name = "pes_bw_future_one_03",
		response = "pes_bw_future_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_one_02"
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
		name = "pbw_bw_future_one_03",
		response = "pbw_bw_future_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bw_future_one_03"
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
		name = "pbw_bw_backstory_six_01",
		response = "pbw_bw_backstory_six_01",
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
				"bw_backstory_six",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_backstory_six",
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
		name = "pwe_bw_backstory_six_02",
		response = "pwe_bw_backstory_six_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_six_01"
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
		name = "pbw_bw_backstory_six_03",
		response = "pbw_bw_backstory_six_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bw_backstory_six_02"
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
		name = "pwe_bw_backstory_six_04",
		response = "pwe_bw_backstory_six_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_six_03"
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
		name = "pbw_bw_backstory_six_05",
		response = "pbw_bw_backstory_six_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bw_backstory_six_04"
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
		name = "pwe_bw_backstory_six_06",
		response = "pwe_bw_backstory_six_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_backstory_six_05"
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
		name = "pes_wh_future_two_01",
		response = "pes_wh_future_two_01",
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
				"wh_future_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wh_future_two",
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
		name = "pwh_wh_future_two_01",
		response = "pwh_wh_future_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wh_future_two_01"
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
		name = "pes_wh_future_two_02",
		response = "pes_wh_future_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_future_two_01"
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
		name = "pwh_wh_future_two_02",
		response = "pwh_wh_future_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wh_future_two_02"
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
		name = "pes_wh_future_two_03",
		response = "pes_wh_future_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_future_two_02"
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
		name = "pwh_wh_future_two_03",
		response = "pwh_wh_future_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wh_future_two_03"
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
		name = "pes_wh_future_two_04",
		response = "pes_wh_future_two_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_future_two_03"
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
		name = "pwh_wh_future_two_04",
		response = "pwh_wh_future_two_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_wh_future_two_04"
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
		name = "pwe_dr_backstory_four_01",
		response = "pwe_dr_backstory_four_01",
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
				"dr_backstory_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dr_backstory_four",
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
		name = "pdr_dr_backstory_four_01",
		response = "pdr_dr_backstory_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dr_backstory_four_01"
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
		name = "pwe_dr_backstory_four_02",
		response = "pwe_dr_backstory_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_backstory_four_01"
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
		name = "pdr_dr_backstory_four_02",
		response = "pdr_dr_backstory_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dr_backstory_four_02"
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
		name = "pwe_dr_backstory_four_03",
		response = "pwe_dr_backstory_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_backstory_four_02"
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
		name = "pdr_dr_backstory_four_03",
		response = "pdr_dr_backstory_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dr_backstory_four_03"
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
		name = "pwe_dr_future_five_01",
		response = "pwe_dr_future_five_01",
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
				"dr_future_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"dr_future_five",
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
		name = "pdr_dr_future_five_01",
		response = "pdr_dr_future_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dr_future_five_01"
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
		name = "pwe_dr_future_five_02",
		response = "pwe_dr_future_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_five_01"
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
		name = "pdr_dr_future_five_02",
		response = "pdr_dr_future_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dr_future_five_02"
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
		name = "pwe_dr_future_five_03",
		response = "pwe_dr_future_five_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_five_02"
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
		name = "pdr_dr_future_five_03",
		response = "pdr_dr_future_five_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dr_future_five_03"
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
		name = "pwe_dr_future_five_04",
		response = "pwe_dr_future_five_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_five_03"
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
		name = "pdr_dr_future_five_04",
		response = "pdr_dr_future_five_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dr_future_five_04"
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
		name = "pwe_dr_future_five_05",
		response = "pwe_dr_future_five_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_five_04"
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
		name = "pdr_dr_future_five_05",
		response = "pdr_dr_future_five_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_dr_future_five_05"
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
		name = "pwe_dr_future_five_06",
		response = "pwe_dr_future_five_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_dr_future_five_05"
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
		name = "pdr_we_backstory_five_01",
		response = "pdr_we_backstory_five_01",
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
				"we_backstory_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"we_backstory_five",
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
		name = "pes_we_backstory_five_01",
		response = "pes_we_backstory_five_01",
		criterias = {
			{
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
		name = "pwe_we_backstory_five_01",
		response = "pwe_we_backstory_five_01",
		criterias = {
			{
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
		name = "pes_we_backstory_five_02",
		response = "pes_we_backstory_five_02",
		criterias = {
			{
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
		name = "pdr_we_backstory_five_02",
		response = "pdr_we_backstory_five_02",
		criterias = {
			{
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
		name = "pwe_we_backstory_five_02",
		response = "pwe_we_backstory_five_02",
		criterias = {
			{
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
		name = "pdr_we_backstory_five_03",
		response = "pdr_we_backstory_five_03",
		criterias = {
			{
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
		name = "pwe_we_backstory_five_03",
		response = "pwe_we_backstory_five_03",
		criterias = {
			{
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
		name = "pbw_bw_future_five_01",
		response = "pbw_bw_future_five_01",
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
				"bw_future_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bw_future_five",
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
		name = "pes_bw_future_five_01",
		response = "pes_bw_future_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_five_01"
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
		name = "pwe_bw_future_five_01",
		response = "pwe_bw_future_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_bw_future_five_01"
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
		name = "pbw_bw_future_five_02",
		response = "pbw_bw_future_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bw_future_five_01"
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
		name = "pwe_bw_future_five_02",
		response = "pwe_bw_future_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_five_02"
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
		name = "pbw_bw_future_five_03",
		response = "pbw_bw_future_five_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bw_future_five_02"
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
		name = "pwe_bw_future_five_03",
		response = "pwe_bw_future_five_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_bw_future_five_03"
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
		name = "pbw_bw_future_five_04",
		response = "pbw_bw_future_five_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_bw_future_five_03"
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
		name = "pes_we_future_two_01",
		response = "pes_we_future_two_01",
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
				"we_future_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"we_future_two",
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
		name = "pwe_we_future_two_01",
		response = "pwe_we_future_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_future_two_01"
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
		name = "pes_we_future_two_02",
		response = "pes_we_future_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_future_two_01"
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
		name = "pwe_we_future_two_02",
		response = "pwe_we_future_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_future_two_02"
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
		name = "pes_we_future_two_03",
		response = "pes_we_future_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_we_future_two_02"
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
		name = "pwe_we_future_two_03",
		response = "pwe_we_future_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_we_future_two_03"
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
		name = "pes_es_future_five_01",
		response = "pes_es_future_five_01",
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
				"es_future_five",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"es_future_five",
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
		name = "pwh_es_future_five_01",
		response = "pwh_es_future_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_future_five_01"
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
		name = "pes_es_future_five_02",
		response = "pes_es_future_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_es_future_five_01"
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
		name = "pwh_es_future_five_02",
		response = "pwh_es_future_five_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_es_future_five_02"
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
		name = "pes_es_future_five_03",
		response = "pes_es_future_five_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_es_future_five_02"
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
		name = "pdr_wh_future_four_01",
		response = "pdr_wh_future_four_01",
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
				"wh_future_four",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wh_future_four",
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
		name = "pwh_wh_future_four_01",
		response = "pwh_wh_future_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_wh_future_four_01"
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
		name = "pdr_wh_future_four_02",
		response = "pdr_wh_future_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_future_four_01"
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
		name = "pwh_wh_future_four_02",
		response = "pwh_wh_future_four_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_wh_future_four_02"
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
		name = "pdr_wh_future_four_03",
		response = "pdr_wh_future_four_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_wh_future_four_02"
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
		name = "pbw_wh_future_three_01",
		response = "pbw_wh_future_three_01",
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
				"wh_future_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wh_future_three",
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
		name = "pwe_wh_future_three_01",
		response = "pwe_wh_future_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wh_future_three_01"
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
		name = "pbw_wh_future_three_02",
		response = "pbw_wh_future_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wh_future_three_01"
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
		name = "pwe_wh_future_three_02",
		response = "pwe_wh_future_three_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_wh_future_three_02"
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
		name = "pbw_wh_future_three_03",
		response = "pbw_wh_future_three_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_wh_future_three_02"
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
		response = "nfl_debrief_helmgart_military_01",
		name = "nfl_debrief_helmgart_military_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_helmgart_military_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"military"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_catacombs_01",
		name = "nfl_debrief_catacombs_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_catacombs_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"catacombs"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_mines_01",
		name = "nfl_debrief_mines_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_mines_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"mines"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_ground_zero_01",
		name = "nfl_debrief_ground_zero_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_ground_zero_01"
			},
			{
				"global_context",
				"level_name",
				OP.EQ,
				"ground_zero"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_elven_ruins_01",
		name = "nfl_debrief_elven_ruins_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_elven_ruins_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"elven_ruins"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_bell_01",
		name = "nfl_debrief_bell_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_bell_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"bell"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_fort_01",
		name = "nfl_debrief_fort_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_fort_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"fort"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_skaven_stronghold_01",
		name = "nfl_debrief_skaven_stronghold_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_skaven_stronghold_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"skaven_stronghold"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_farmland_01",
		name = "nfl_debrief_farmland_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_farmland_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"farmlands"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_ussingen_01",
		name = "nfl_debrief_ussingen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_ussingen_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"ussingen"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_nurgle_01",
		name = "nfl_debrief_nurgle_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_nurgle_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"nurgle"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_war_camp_01",
		name = "nfl_debrief_war_camp_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_war_camp_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"warcamp"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_skittergate_01",
		name = "nfl_debrief_skittergate_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_skittergate_01"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"skittergate"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_magnus_tower",
		name = "nfl_debrief_magnus_tower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_magnus_tower"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"magnus"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_cemetery",
		name = "nfl_debrief_cemetery",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_cemetery"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"cemetery"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_forest_ambush",
		name = "nfl_debrief_forest_ambush",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_forest_ambush"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"forest_ambush"
			}
		}
	})
	define_rule({
		response = "nfl_debrief_plaza",
		name = "nfl_debrief_plaza",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"nfl_debrief_plaza"
			},
			{
				"query_context",
				"level_name",
				OP.EQ,
				"plaza"
			}
		}
	})
	define_rule({
		name = "npp_keep_idle_banter_one_01",
		response = "npp_keep_idle_banter_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"npp_keep_idle_banter_one"
			},
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "npp_keep_idle_banter_two_01",
		response = "npp_keep_idle_banter_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"npp_keep_idle_banter_two"
			},
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "npp_keep_idle_banter_three_01",
		response = "npp_keep_idle_banter_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"npp_keep_idle_banter_three"
			},
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"keep_idle_banter_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "npp_keep_idle_banter_four",
		response = "npp_keep_idle_banter_four",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_keep_idle_banter_four_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"catrinne"
			},
			{
				"user_memory",
				"nik_keep_idle_banter_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_banter_three",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pes_bw_backstory_seven_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_bw_backstory_seven_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.9123333692551
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_seven_05"
			}
		},
		pwh_dr_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dr_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.2033748626709
			},
			localization_strings = {
				[1.0] = "pwh_dr_future_two_01"
			}
		},
		pwe_es_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_es_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.5869998931885
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_one_02"
			}
		},
		pwh_bw_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_bw_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 9.5503540039063
			},
			localization_strings = {
				[1.0] = "pwh_bw_backstory_three_03"
			}
		},
		pdr_bw_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_bw_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.3948750495911
			},
			localization_strings = {
				[1.0] = "pdr_bw_backstory_one_03"
			}
		},
		pes_es_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1442289352417
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_three_01"
			}
		},
		pdr_dr_backstory_six_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_six_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.8500623703003
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_six_03"
			}
		},
		pwe_wh_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wh_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.9249166250229
			},
			localization_strings = {
				[1.0] = "pwe_wh_backstory_two_01"
			}
		},
		pdr_dr_backstory_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.1925415992737
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_five_03"
			}
		},
		pes_we_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.7257709503174
			},
			localization_strings = {
				[1.0] = "pes_we_future_two_01"
			}
		},
		pwh_bw_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_bw_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.830020904541
			},
			localization_strings = {
				[1.0] = "pwh_bw_backstory_three_02"
			}
		},
		pes_we_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.6642708778381
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_five_01"
			}
		},
		pbw_bw_backstory_seven_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_seven_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 8.9575004577637
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_seven_04"
			}
		},
		pdr_dr_backstory_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.6213750839233
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_six_02"
			}
		},
		pdr_dr_backstory_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.9371249675751
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_six_01"
			}
		},
		nik_hub_lohner_conversation_twentyfive_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twentyfive_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1732501983643
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twentyfive_01"
			}
		},
		pwe_we_backstory_two_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_backstory_two_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.6901667118073
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_two_05"
			}
		},
		pes_hub_lohner_conversation_twentyfive_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_hub_lohner_conversation_twentyfive_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.4871873855591
			},
			localization_strings = {
				[1.0] = "pes_hub_lohner_conversation_twentyfive_01"
			}
		},
		pwh_dr_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dr_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.190333366394
			},
			localization_strings = {
				[1.0] = "pwh_dr_future_two_03"
			}
		},
		pes_es_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.7066874504089
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_one_02"
			}
		},
		pwh_dr_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dr_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.736270904541
			},
			localization_strings = {
				[1.0] = "pwh_dr_backstory_one_01"
			}
		},
		pwh_we_backstory_two_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_we_backstory_two_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.2149374485016
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_two_05"
			}
		},
		pbw_bw_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.9505832195282
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_four_01"
			}
		},
		pwh_wh_backstory_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_backstory_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 10.645041465759
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_two_04"
			}
		},
		pes_es_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.4843125343323
			},
			localization_strings = {
				[1.0] = "pes_es_future_five_03"
			}
		},
		nik_keep_idle_banter_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_keep_idle_banter_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1288957595825
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_four_02"
			}
		},
		pwe_we_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.5494999885559
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_two_02"
			}
		},
		pes_dr_backstory_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dr_backstory_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.4219584465027
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_six_02"
			}
		},
		pbw_wh_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_wh_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.2298126220703
			},
			localization_strings = {
				[1.0] = "pbw_wh_future_three_03"
			}
		},
		pdr_dr_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6263749599457
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_one_01"
			}
		},
		pes_es_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3369791507721
			},
			localization_strings = {
				[1.0] = "pes_es_future_three_01"
			}
		},
		nik_keep_idle_banter_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_keep_idle_banter_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 9.2859163284302
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_two_01"
			}
		},
		pbw_dr_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dr_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.3583750724792
			},
			localization_strings = {
				[1.0] = "pbw_dr_future_four_01"
			}
		},
		pwe_bw_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_bw_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.4184999465942
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_five_01"
			}
		},
		pbw_es_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_es_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.3561458587647
			},
			localization_strings = {
				[1.0] = "pbw_es_backstory_two_02"
			}
		},
		pbw_bw_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8146874904633
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_three_01"
			}
		},
		pwe_we_future_four_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_four_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.9141249656677
			},
			localization_strings = {
				[1.0] = "pwe_we_future_four_04"
			}
		},
		pes_es_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.9951250553131
			},
			localization_strings = {
				[1.0] = "pes_es_future_three_02"
			}
		},
		pbw_bw_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.6494793891907
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_one_01"
			}
		},
		pwe_dr_backstory_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dr_backstory_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.0270209312439
			},
			localization_strings = {
				[1.0] = "pwe_dr_backstory_four_01"
			}
		},
		pdr_dr_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.2327499389648
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_three_02"
			}
		},
		pwh_wh_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.2073957920074
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_two_03"
			}
		},
		pwh_we_backstory_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_we_backstory_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5217082500458
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_four_01"
			}
		},
		pbw_es_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_es_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.8863542079926
			},
			localization_strings = {
				[1.0] = "pbw_es_backstory_two_03"
			}
		},
		pwe_wh_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wh_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.5694789886475
			},
			localization_strings = {
				[1.0] = "pwe_wh_future_three_02"
			}
		},
		nfl_debrief_war_camp_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_war_camp_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 24.666458129883
			},
			localization_strings = {
				[1.0] = "nfl_debrief_war_camp_01"
			}
		},
		pes_wh_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wh_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1152083873749
			},
			localization_strings = {
				[1.0] = "pes_wh_future_one_01"
			}
		},
		pdr_dr_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1123542785644
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_four_01"
			}
		},
		nik_callout_unready_saltzpyre = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_callout_unready_saltzpyre_01",
				"nik_callout_unready_saltzpyre_02",
				"nik_callout_unready_saltzpyre_03",
				"nik_callout_unready_saltzpyre_04"
			},
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
			sound_events_duration = {
				9.6598749160767,
				7.1360416412353,
				8.4755210876465,
				3.8926665782928
			},
			localization_strings = {
				"nik_callout_unready_saltzpyre_01",
				"nik_callout_unready_saltzpyre_02",
				"nik_callout_unready_saltzpyre_03",
				"nik_callout_unready_saltzpyre_04"
			},
			randomize_indexes = {}
		},
		pdr_es_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_es_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.8196668624878
			},
			localization_strings = {
				[1.0] = "pdr_es_future_three_01"
			}
		},
		nfl_debrief_skaven_stronghold_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_skaven_stronghold_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 49.58247756958
			},
			localization_strings = {
				[1.0] = "nfl_debrief_skaven_stronghold_01"
			}
		},
		pdr_bw_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_bw_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4642915725708
			},
			localization_strings = {
				[1.0] = "pdr_bw_backstory_five_01"
			}
		},
		pes_bw_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_bw_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.0864999294281
			},
			localization_strings = {
				[1.0] = "pes_bw_future_five_01"
			}
		},
		pwh_es_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_es_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1514372825623
			},
			localization_strings = {
				[1.0] = "pwh_es_future_two_01"
			}
		},
		pwe_dr_future_five_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dr_future_five_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 8.3357706069946
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_05"
			}
		},
		nik_hub_backstory_interaction = {
			sound_events_n = 31,
			face_animations_n = 31,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 31,
			sound_events = {
				"nik_hub_backstory_03",
				"nik_hub_backstory_04",
				"nik_hub_backstory_05",
				"nik_hub_backstory_06",
				"nik_hub_backstory_07",
				"nik_hub_backstory_08",
				"nik_hub_backstory_09",
				"nik_hub_backstory_10",
				"nik_keep_idle_01",
				"nik_keep_idle_02",
				"nik_keep_idle_03",
				"nik_keep_idle_04",
				"nik_keep_idle_05",
				"nik_keep_idle_06",
				"nik_keep_idle_07",
				"nik_keep_idle_08",
				"nik_keep_idle_09",
				"nik_keep_idle_10",
				"nik_keep_idle_11",
				"nik_keep_idle_12",
				"nik_keep_idle_13",
				"nik_keep_idle_14",
				"nik_keep_idle_17",
				"nik_keep_idle_18",
				"nik_keep_idle_19",
				"nik_keep_idle_20",
				"nik_keep_idle_21",
				"nik_keep_idle_22",
				"nik_keep_idle_23",
				"nik_keep_idle_24",
				"nik_keep_idle_25"
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
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
			sound_events_duration = {
				14.694707870483,
				9.4800834655762,
				11.330812454224,
				5.8075623512268,
				4.6288747787476,
				8.1448335647583,
				12.64354133606,
				6.6951217651367,
				4.719229221344,
				9.9170837402344,
				4.587375164032,
				3.7447292804718,
				6.4479374885559,
				5.4015002250671,
				7.9590625762939,
				8.8776664733887,
				6.3288960456848,
				6.4083333015442,
				6.2114582061768,
				6.561999797821,
				4.4263124465942,
				16.537937164307,
				4.5551252365112,
				6.1234169006348,
				8.3766670227051,
				9.9232292175293,
				5.2719373703003,
				10.569812774658,
				15.338541984558,
				5.0747709274292,
				23.178459167481
			},
			localization_strings = {
				"nik_hub_backstory_03",
				"nik_hub_backstory_04",
				"nik_hub_backstory_05",
				"nik_hub_backstory_06",
				"nik_hub_backstory_07",
				"nik_hub_backstory_08",
				"nik_hub_backstory_09",
				"nik_hub_backstory_10",
				"nik_keep_idle_01",
				"nik_keep_idle_02",
				"nik_keep_idle_03",
				"nik_keep_idle_04",
				"nik_keep_idle_05",
				"nik_keep_idle_06",
				"nik_keep_idle_07",
				"nik_keep_idle_08",
				"nik_keep_idle_09",
				"nik_keep_idle_10",
				"nik_keep_idle_11",
				"nik_keep_idle_12",
				"nik_keep_idle_13",
				"nik_keep_idle_14",
				"nik_keep_idle_17",
				"nik_keep_idle_18",
				"nik_keep_idle_19",
				"nik_keep_idle_20",
				"nik_keep_idle_21",
				"nik_keep_idle_22",
				"nik_keep_idle_23",
				"nik_keep_idle_24",
				"nik_keep_idle_25"
			},
			randomize_indexes = {}
		},
		pbw_bw_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.0742707252502
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_one_02"
			}
		},
		pes_dr_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dr_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.2983331680298
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_five_02"
			}
		},
		pwe_bw_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_bw_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.8516459465027
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_five_03"
			}
		},
		pwe_es_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_es_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 0.71164584159851
			},
			localization_strings = {
				[1.0] = "pwe_es_future_four_02"
			}
		},
		pes_es_backstory_huntsman_five_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_backstory_huntsman_five_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.5134582519531
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_huntsman_five_04"
			}
		},
		pbw_bw_future_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.2199375629425
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_three_04"
			}
		},
		pwh_es_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_es_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.4861664772034
			},
			localization_strings = {
				[1.0] = "pwh_es_future_five_01"
			}
		},
		pwe_bw_backstory_six_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_bw_backstory_six_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.2941040992737
			},
			localization_strings = {
				[1.0] = "pwe_bw_backstory_six_06"
			}
		},
		pdr_dr_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.576708316803
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_one_02"
			}
		},
		pwe_dr_future_five_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dr_future_five_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.289562702179
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_06"
			}
		},
		pdr_bw_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_bw_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.6233749389648
			},
			localization_strings = {
				[1.0] = "pdr_bw_future_three_03"
			}
		},
		pes_es_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.544041633606
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_three_03"
			}
		},
		nik_inventory_reminder = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_inventory_reminder_01",
				"nik_inventory_reminder_02",
				"nik_inventory_reminder_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				5.1738543510437,
				2.6304376125336,
				2.4656040668488
			},
			localization_strings = {
				"nik_inventory_reminder_01",
				"nik_inventory_reminder_02",
				"nik_inventory_reminder_03"
			},
			randomize_indexes = {}
		},
		pwe_we_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 8.2357292175293
			},
			localization_strings = {
				[1.0] = "pwe_we_future_one_02"
			}
		},
		pes_wh_future_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wh_future_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.5171458721161
			},
			localization_strings = {
				[1.0] = "pes_wh_future_two_04"
			}
		},
		pdr_dr_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.7408957481384
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_five_02"
			}
		},
		pbw_wh_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_wh_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8291873931885
			},
			localization_strings = {
				[1.0] = "pbw_wh_future_three_01"
			}
		},
		nfl_debrief_farmland_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_farmland_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 52.099769592285
			},
			localization_strings = {
				[1.0] = "nfl_debrief_farmland_01"
			}
		},
		pdr_wh_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_wh_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.3561043739319
			},
			localization_strings = {
				[1.0] = "pdr_wh_future_four_03"
			}
		},
		pes_dr_backstory_six_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dr_backstory_six_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.5255832672119
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_six_03"
			}
		},
		nik_callout_unready_kruber = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_callout_unready_kruber_01",
				"nik_callout_unready_kruber_03",
				"nik_callout_unready_kruber_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				10.048958778381,
				6.3275418281555,
				7.7065415382385
			},
			localization_strings = {
				"nik_callout_unready_kruber_01",
				"nik_callout_unready_kruber_03",
				"nik_callout_unready_kruber_04"
			},
			randomize_indexes = {}
		},
		pbw_dr_backstory_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dr_backstory_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.282562494278
			},
			localization_strings = {
				[1.0] = "pbw_dr_backstory_three_04"
			}
		},
		pwe_es_backstory_huntsman_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_es_backstory_huntsman_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 7.2450833320618
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_huntsman_five_01"
			}
		},
		pes_es_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8579792976379
			},
			localization_strings = {
				[1.0] = "pes_es_future_five_01"
			}
		},
		pes_es_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.4383749961853
			},
			localization_strings = {
				[1.0] = "pes_es_future_four_01"
			}
		},
		pes_bw_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_bw_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.9069166183472
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_two_02"
			}
		},
		pdr_we_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_we_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.9586042165756
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_three_02"
			}
		},
		nik_map_intro = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_map_intro_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "nik_map_intro_01"
			}
		},
		pwh_es_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_es_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.8720626831055
			},
			localization_strings = {
				[1.0] = "pwh_es_future_two_02"
			}
		},
		pes_es_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 9.6743955612183
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_two_02"
			}
		},
		pwh_wh_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.1941456794739
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_four_02"
			}
		},
		pbw_bw_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 8.1498336791992
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_five_01"
			}
		},
		pes_wh_future_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wh_future_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.9271458387375
			},
			localization_strings = {
				[1.0] = "pes_wh_future_one_03"
			}
		},
		pwh_we_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_we_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.246333360672
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_two_01"
			}
		},
		pbw_we_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_we_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.3203125
			},
			localization_strings = {
				[1.0] = "pbw_we_backstory_four_02"
			}
		},
		pes_we_future_four_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_future_four_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.884124994278
			},
			localization_strings = {
				[1.0] = "pes_we_future_four_04"
			}
		},
		pes_es_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.1737499237061
			},
			localization_strings = {
				[1.0] = "pes_es_future_one_01"
			}
		},
		pdr_dr_backstory_three_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_three_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.3498539924622
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_three_05"
			}
		},
		pdr_bw_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_bw_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.8327499628067
			},
			localization_strings = {
				[1.0] = "pdr_bw_future_three_02"
			}
		},
		pes_wh_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wh_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.3393542766571
			},
			localization_strings = {
				[1.0] = "pes_wh_backstory_four_03"
			}
		},
		pbw_bw_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.6367292404175
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_three_02"
			}
		},
		pdr_dr_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.0908331871033
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_four_02"
			}
		},
		pwh_we_backstory_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_we_backstory_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.8683750629425
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_two_04"
			}
		},
		pes_wh_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wh_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.795916557312
			},
			localization_strings = {
				[1.0] = "pes_wh_future_one_02"
			}
		},
		nik_keep_idle_banter_four_01 = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 5,
			sound_events = {
				"nik_keep_idle_banter_four_01",
				"nik_keep_idle_painter_01",
				"nik_keep_idle_painter_02",
				"nik_keep_idle_painter_03",
				"nik_keep_idle_painter_04"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			sound_events_duration = {
				6.5802707672119,
				12.038042068481,
				9.8183126449585,
				9.7268333435059,
				7.1901459693909
			},
			localization_strings = {
				"nik_keep_idle_banter_four_01",
				"nik_keep_idle_painter_01",
				"nik_keep_idle_painter_02",
				"nik_keep_idle_painter_03",
				"nik_keep_idle_painter_04"
			},
			randomize_indexes = {}
		},
		pwe_we_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.3235416412353
			},
			localization_strings = {
				[1.0] = "pwe_we_future_three_02"
			}
		},
		pbw_we_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_we_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.572104215622
			},
			localization_strings = {
				[1.0] = "pbw_we_future_five_03"
			}
		},
		pdr_dr_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.5811042785644
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_two_02"
			}
		},
		pwh_dr_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dr_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.5374374389648
			},
			localization_strings = {
				[1.0] = "pwh_dr_future_two_02"
			}
		},
		pwh_wh_backstory_four_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_backstory_four_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.2819375991821
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_four_04"
			}
		},
		pdr_wh_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_wh_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.2819166183472
			},
			localization_strings = {
				[1.0] = "pdr_wh_backstory_one_03"
			}
		},
		pwe_we_future_five_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_five_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.1591458320618
			},
			localization_strings = {
				[1.0] = "pwe_we_future_five_05"
			}
		},
		nik_keep_idle_banter_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_keep_idle_banter_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1756875514984
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_one_01"
			}
		},
		pwh_wh_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.2799999713898
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_four_03"
			}
		},
		pdr_dr_future_five_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_five_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.4826250076294
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_five_04"
			}
		},
		pwe_we_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.1680417060852
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_five_02"
			}
		},
		pbw_we_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_we_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.6452708244324
			},
			localization_strings = {
				[1.0] = "pbw_we_backstory_one_03"
			}
		},
		pdr_wh_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_wh_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.6310625076294
			},
			localization_strings = {
				[1.0] = "pdr_wh_backstory_one_01"
			}
		},
		pwe_we_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.2468333244324
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_one_02"
			}
		},
		nik_hub_lohner_conversation_twentythree_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twentythree_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.3969793319702
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twentythree_01"
			}
		},
		pwh_wh_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.8264999389648
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_one_01"
			}
		},
		pdr_we_backstory_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_we_backstory_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.376416683197
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_five_03"
			}
		},
		nfl_debrief_mines_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_mines_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 61.894248962402
			},
			localization_strings = {
				[1.0] = "nfl_debrief_mines_01"
			}
		},
		pes_es_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.4415831565857
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_two_01"
			}
		},
		pdr_dr_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 9.0542707443237
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_two_01"
			}
		},
		pwe_es_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_es_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.8013124465942
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_one_01"
			}
		},
		pwe_we_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.2494583129883
			},
			localization_strings = {
				[1.0] = "pwe_we_future_five_01"
			}
		},
		pwh_es_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_es_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.9128332138061
			},
			localization_strings = {
				[1.0] = "pwh_es_backstory_three_03"
			}
		},
		nik_forge = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_forge_01",
				"nik_forge_02",
				"nik_forge_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				5.8668332099915,
				7.7072291374206,
				3.7555415630341
			},
			localization_strings = {
				"nik_forge_01",
				"nik_forge_02",
				"nik_forge_03"
			},
			randomize_indexes = {}
		},
		pwe_we_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.8939790725708
			},
			localization_strings = {
				[1.0] = "pwe_we_future_one_01"
			}
		},
		pes_wh_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wh_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3329374790192
			},
			localization_strings = {
				[1.0] = "pes_wh_backstory_four_02"
			}
		},
		pwe_dr_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dr_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2529165744781
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_01"
			}
		},
		pdr_bw_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_bw_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.5335416793823
			},
			localization_strings = {
				[1.0] = "pdr_bw_backstory_one_02"
			}
		},
		pwe_we_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.0990834236145
			},
			localization_strings = {
				[1.0] = "pwe_we_future_four_03"
			}
		},
		pes_we_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.0525832176209
			},
			localization_strings = {
				[1.0] = "pes_we_future_four_02"
			}
		},
		pwe_es_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_es_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 14.252541542053
			},
			localization_strings = {
				[1.0] = "pwe_es_future_four_03"
			}
		},
		nfl_debrief_bell_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_bell_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 72.382247924805
			},
			localization_strings = {
				[1.0] = "nfl_debrief_bell_01"
			}
		},
		pwh_bw_future_eight_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_bw_future_eight_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 8.6923332214356
			},
			localization_strings = {
				[1.0] = "pwh_bw_future_eight_03"
			}
		},
		pes_es_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.4297499656677
			},
			localization_strings = {
				[1.0] = "pes_es_future_two_01"
			}
		},
		pes_es_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 0.94120836257935
			},
			localization_strings = {
				[1.0] = "pes_es_future_three_03"
			}
		},
		pes_wh_backstory_four_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wh_backstory_four_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.2560625076294
			},
			localization_strings = {
				[1.0] = "pes_wh_backstory_four_05"
			}
		},
		nik_hub_welcome = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_hub_welcome_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 38.688293457031
			},
			localization_strings = {
				[1.0] = "nik_hub_welcome_01"
			}
		},
		pbw_es_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_es_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.362208366394
			},
			localization_strings = {
				[1.0] = "pbw_es_future_one_01"
			}
		},
		pwh_bw_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_bw_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.1572499275208
			},
			localization_strings = {
				[1.0] = "pwh_bw_backstory_three_01"
			}
		},
		pbw_we_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_we_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5214791297913
			},
			localization_strings = {
				[1.0] = "pbw_we_backstory_one_01"
			}
		},
		pwe_bw_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_bw_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.0803124904633
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_four_02"
			}
		},
		pdr_es_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_es_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.2369585037231
			},
			localization_strings = {
				[1.0] = "pdr_es_future_three_02"
			}
		},
		pbw_bw_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.3995208740234
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_three_03"
			}
		},
		nik_keep_idle_banter_three = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "nik_keep_idle_banter_three_01",
				[2.0] = "nik_keep_idle_banter_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1247916221619,
				[2.0] = 4.086416721344
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_three_01",
				[2.0] = "nik_keep_idle_banter_three_02"
			},
			randomize_indexes = {}
		},
		pes_bw_backstory_two_033 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_bw_backstory_two_033"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.9295001029968
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_two_033"
			}
		},
		pbw_dr_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dr_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.9092707633972
			},
			localization_strings = {
				[1.0] = "pbw_dr_backstory_three_02"
			}
		},
		pdr_es_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_es_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.0498957633972
			},
			localization_strings = {
				[1.0] = "pdr_es_future_three_03"
			}
		},
		pwh_wh_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.8822498321533
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_two_02"
			}
		},
		pwe_dr_future_five_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dr_future_five_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.4397501945496
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_04"
			}
		},
		pes_wh_backstory_four_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wh_backstory_four_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 11.346541404724
			},
			localization_strings = {
				[1.0] = "pes_wh_backstory_four_04"
			}
		},
		pbw_bw_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 0.84539586305618
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_five_03"
			}
		},
		nik_hub_lohner_conversation_twentytwo_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twentytwo_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9415625333786
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twentytwo_01"
			}
		},
		pwe_bw_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_bw_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.2332291603088
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_four_01"
			}
		},
		nik_hub_the_plan = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_hub_the_plan_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 49.661895751953
			},
			localization_strings = {
				[1.0] = "nik_hub_the_plan_01"
			}
		},
		pwe_bw_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_bw_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.3313751220703
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_four_03"
			}
		},
		npp_keep_idle_banter_four = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "npp_keep_idle_banter_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 8.0226459503174
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_four_01"
			}
		},
		npp_keep_idle_banter_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "npp_keep_idle_banter_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.7869377136231
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_three_01"
			}
		},
		npp_keep_idle_banter_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "npp_keep_idle_banter_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3284997940064
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_two_01"
			}
		},
		nik_greeting_evening = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_hub_greeting_evening_30",
				"nik_hub_greeting_evening_31",
				"nik_hub_greeting_evening_32"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.4648542404175,
				3.3333749771118,
				1.0735000371933
			},
			localization_strings = {
				"nik_hub_greeting_evening_30",
				"nik_hub_greeting_evening_31",
				"nik_hub_greeting_evening_32"
			},
			randomize_indexes = {}
		},
		pbw_bw_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 10.121083259583
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_five_02"
			}
		},
		pbw_bw_backstory_six_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_six_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.8426251411438
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_six_03"
			}
		},
		npp_keep_idle_banter_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "npp_keep_idle_banter_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7451872825623
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_one_01"
			}
		},
		pwe_we_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.1454167366028
			},
			localization_strings = {
				[1.0] = "pwe_we_future_five_02"
			}
		},
		pwh_bw_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_bw_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.4087710380554
			},
			localization_strings = {
				[1.0] = "pwh_bw_future_two_01"
			}
		},
		pwe_es_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_es_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.585916519165
			},
			localization_strings = {
				[1.0] = "pwe_es_future_four_01"
			}
		},
		nfl_debrief_plaza = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.748125076294,
				4.1700000762939,
				5.5100002288818
			},
			localization_strings = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			randomize_indexes = {}
		},
		pbw_bw_future_eight_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_eight_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.8774583339691
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_eight_03"
			}
		},
		nfl_debrief_forest_ambush = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.748125076294,
				4.1700000762939,
				5.5100002288818
			},
			localization_strings = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			randomize_indexes = {}
		},
		pwh_wh_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.5243542194366
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_one_01"
			}
		},
		nfl_debrief_cemetery = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.748125076294,
				4.1700000762939,
				5.5100002288818
			},
			localization_strings = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			randomize_indexes = {}
		},
		nik_greeting = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_greeting"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "nik_greeting"
			}
		},
		pbw_bw_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.330500125885
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_four_02"
			}
		},
		nfl_debrief_skittergate_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_skittergate_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 17.341541290283
			},
			localization_strings = {
				[1.0] = "nfl_debrief_skittergate_01"
			}
		},
		pdr_we_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_we_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.8474998474121
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_three_03"
			}
		},
		nfl_debrief_magnus_tower = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.748125076294,
				4.1700000762939,
				5.5100002288818
			},
			localization_strings = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
			},
			randomize_indexes = {}
		},
		pwe_we_backstory_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_backstory_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.6607291698456
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_two_04"
			}
		},
		nik_hub_lohner_conversation_twentyfour_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twentyfour_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5275001525879
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twentyfour_01"
			}
		},
		pdr_dr_backstory_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.3677082061768
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_three_04"
			}
		},
		pbw_bw_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.5926041603088
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_one_02"
			}
		},
		nfl_debrief_ussingen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_ussingen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 47.259853363037
			},
			localization_strings = {
				[1.0] = "nfl_debrief_ussingen_01"
			}
		},
		nfl_debrief_fort_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_fort_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 57.82689666748
			},
			localization_strings = {
				[1.0] = "nfl_debrief_fort_01"
			}
		},
		nfl_debrief_elven_ruins_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_elven_ruins_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 82.643623352051
			},
			localization_strings = {
				[1.0] = "nfl_debrief_elven_ruins_01"
			}
		},
		pwe_wh_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wh_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.5326042175293
			},
			localization_strings = {
				[1.0] = "pwe_wh_backstory_two_03"
			}
		},
		pdr_we_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_we_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.764312505722
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_three_01"
			}
		},
		nfl_debrief_catacombs_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_catacombs_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 61.535915374756
			},
			localization_strings = {
				[1.0] = "nfl_debrief_catacombs_01"
			}
		},
		nfl_debrief_helmgart_military_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_helmgart_military_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 53.744770050049
			},
			localization_strings = {
				[1.0] = "nfl_debrief_helmgart_military_01"
			}
		},
		pes_dr_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dr_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3866457939148
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_two_01"
			}
		},
		pwe_wh_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wh_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.4599585533142
			},
			localization_strings = {
				[1.0] = "pwe_wh_future_three_01"
			}
		},
		pbw_dr_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dr_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.2164793014526
			},
			localization_strings = {
				[1.0] = "pbw_dr_future_three_02"
			}
		},
		pdr_wh_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_wh_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.719250202179
			},
			localization_strings = {
				[1.0] = "pdr_wh_future_four_02"
			}
		},
		pwh_wh_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.6845831871033
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_one_02"
			}
		},
		pwh_wh_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.0769584178925
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_four_01"
			}
		},
		pdr_wh_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_wh_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3829998970032
			},
			localization_strings = {
				[1.0] = "pdr_wh_future_four_01"
			}
		},
		pwe_we_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.542396068573
			},
			localization_strings = {
				[1.0] = "pwe_we_future_three_01"
			}
		},
		pwh_es_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_es_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.0282499790192
			},
			localization_strings = {
				[1.0] = "pwh_es_future_five_02"
			}
		},
		pwh_bw_future_two_033 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_bw_future_two_033"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 10.321583747864
			},
			localization_strings = {
				[1.0] = "pwh_bw_future_two_033"
			}
		},
		pes_es_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.5956873893738
			},
			localization_strings = {
				[1.0] = "pes_es_future_five_02"
			}
		},
		pwe_we_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.6054792404175
			},
			localization_strings = {
				[1.0] = "pwe_we_future_two_03"
			}
		},
		pes_we_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.0471665859222
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_five_02"
			}
		},
		pes_we_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.5531041622162
			},
			localization_strings = {
				[1.0] = "pes_we_future_two_03"
			}
		},
		pwe_bw_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_bw_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 9.6675624847412
			},
			localization_strings = {
				[1.0] = "pwe_bw_backstory_four_03"
			}
		},
		pwe_we_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.2570624351502
			},
			localization_strings = {
				[1.0] = "pwe_we_future_two_02"
			}
		},
		pes_we_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.0545833110809
			},
			localization_strings = {
				[1.0] = "pes_we_future_two_02"
			}
		},
		pbw_bw_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.889791727066
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_one_01"
			}
		},
		pbw_bw_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.1752707958221
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_three_02"
			}
		},
		pwe_wh_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wh_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.0732917785645
			},
			localization_strings = {
				[1.0] = "pwe_wh_backstory_two_02"
			}
		},
		pes_bw_backstory_seven_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_bw_backstory_seven_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1843748092651
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_seven_03"
			}
		},
		pbw_bw_future_five_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_five_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.6497082710266
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_five_04"
			}
		},
		pwh_we_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_we_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.5261039733887
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_four_02"
			}
		},
		pwe_bw_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_bw_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.265145778656
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_five_02"
			}
		},
		pbw_bw_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.813458442688
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_five_02"
			}
		},
		pwe_we_backstory_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_backstory_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.2940833568573
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_five_03"
			}
		},
		pwh_wh_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.7812085151672
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_one_02"
			}
		},
		pdr_we_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_we_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.7444581985474
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_five_02"
			}
		},
		pdr_dr_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.2749999761581
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_five_03"
			}
		},
		pwe_we_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.0916874408722
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_five_01"
			}
		},
		pwh_we_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_we_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.6020624637604
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_four_03"
			}
		},
		pes_bw_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_bw_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.2758749723434
			},
			localization_strings = {
				[1.0] = "pes_bw_future_one_02"
			}
		},
		pes_dr_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dr_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.3910000324249
			},
			localization_strings = {
				[1.0] = "pes_dr_future_one_02"
			}
		},
		pdr_dr_future_five_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_five_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.7241041660309
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_five_05"
			}
		},
		pes_es_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.5077290534973
			},
			localization_strings = {
				[1.0] = "pes_es_future_two_02"
			}
		},
		pes_dr_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dr_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.0764999389648
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_two_02"
			}
		},
		pdr_dr_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.6641874313355
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_five_02"
			}
		},
		pwh_we_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_we_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.669145822525
			},
			localization_strings = {
				[1.0] = "pwh_we_future_one_01"
			}
		},
		pwe_bw_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_bw_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.3081459999084
			},
			localization_strings = {
				[1.0] = "pwe_bw_backstory_four_02"
			}
		},
		pwe_dr_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dr_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.2289166450501
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_02"
			}
		},
		pdr_dr_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.0141043663025
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_five_01"
			}
		},
		pdr_dr_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.2918748855591
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_four_03"
			}
		},
		pdr_dr_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.7201459407806
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_four_03"
			}
		},
		pwh_wh_backstory_two_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_backstory_two_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.1951665878296
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_two_05"
			}
		},
		pwh_we_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_we_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.8466665744781
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_two_03"
			}
		},
		pwe_dr_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dr_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.8121458292007
			},
			localization_strings = {
				[1.0] = "pwe_dr_backstory_four_03"
			}
		},
		pes_es_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.5218334197998
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_two_03"
			}
		},
		pdr_dr_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.0668749809265
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_four_02"
			}
		},
		pbw_bw_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 8.2277498245239
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_five_01"
			}
		},
		pbw_bw_future_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.0515418052673
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_one_03"
			}
		},
		pwe_dr_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dr_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.9703540802002
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_03"
			}
		},
		pes_dr_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dr_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.787750005722
			},
			localization_strings = {
				[1.0] = "pes_dr_future_one_01"
			}
		},
		pwh_wh_future_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_future_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.9176459312439
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_two_04"
			}
		},
		pwh_wh_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.5401248931885
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_two_03"
			}
		},
		pes_wh_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wh_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.6877291202545
			},
			localization_strings = {
				[1.0] = "pes_wh_future_two_03"
			}
		},
		pes_hub_lohner_conversation_twentyone_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_hub_lohner_conversation_twentyone_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.8297083377838
			},
			localization_strings = {
				[1.0] = "pes_hub_lohner_conversation_twentyone_01"
			}
		},
		pwe_we_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.1905832290649
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_two_03"
			}
		},
		pes_wh_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wh_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.7677083015442
			},
			localization_strings = {
				[1.0] = "pes_wh_future_two_02"
			}
		},
		pdr_dr_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.701354265213
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_two_03"
			}
		},
		pdr_bw_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_bw_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0273332595825
			},
			localization_strings = {
				[1.0] = "pdr_bw_backstory_one_01"
			}
		},
		pbw_bw_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.8533124923706
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_three_03"
			}
		},
		pes_wh_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_wh_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.0392084121704
			},
			localization_strings = {
				[1.0] = "pes_wh_future_two_01"
			}
		},
		pdr_dr_future_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.1293749809265
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_one_03"
			}
		},
		pbw_bw_backstory_six_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_six_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.5706667900085
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_six_05"
			}
		},
		pbw_bw_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.1261458396912
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_two_01"
			}
		},
		pwe_bw_backstory_six_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_bw_backstory_six_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 9.3888330459595
			},
			localization_strings = {
				[1.0] = "pwe_bw_backstory_six_04"
			}
		},
		pes_we_backstory_three_05 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "story_talk_keep",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_we_backstory_three_05",
				"pes_we_backstory_three_05_1 ",
				"pes_we_backstory_three_05_2",
				"pes_we_backstory_three_05_3"
			},
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
			sound_events_duration = {
				2.890145778656,
				3.4567,
				4.3738956451416,
				3.752729177475
			},
			localization_strings = {
				"pes_we_backstory_three_05",
				"pes_we_backstory_three_05_1 ",
				"pes_we_backstory_three_05_2",
				"pes_we_backstory_three_05_3"
			},
			randomize_indexes = {}
		},
		pbw_bw_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4375834465027
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_three_01"
			}
		},
		pwe_bw_backstory_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_bw_backstory_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.0477499961853
			},
			localization_strings = {
				[1.0] = "pwe_bw_backstory_six_02"
			}
		},
		pbw_bw_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 10.73889541626
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_two_02"
			}
		},
		nik_callout_unready_bardin = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_callout_unready_bardin_01",
				"nik_callout_unready_bardin_02",
				"nik_callout_unready_bardin_03",
				"nik_callout_unready_bardin_04"
			},
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
			sound_events_duration = {
				7.2825832366943,
				8.7650833129883,
				10.294437408447,
				10.031645774841
			},
			localization_strings = {
				"nik_callout_unready_bardin_01",
				"nik_callout_unready_bardin_02",
				"nik_callout_unready_bardin_03",
				"nik_callout_unready_bardin_04"
			},
			randomize_indexes = {}
		},
		pbw_bw_backstory_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 7.7623543739319
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_six_01"
			}
		},
		pwe_dr_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dr_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.468249797821
			},
			localization_strings = {
				[1.0] = "pwe_dr_backstory_four_02"
			}
		},
		pes_bw_future_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_bw_future_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.2734167575836
			},
			localization_strings = {
				[1.0] = "pes_bw_future_one_03"
			}
		},
		pwh_es_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_es_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.2699375152588
			},
			localization_strings = {
				[1.0] = "pwh_es_backstory_three_02"
			}
		},
		pwh_bw_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_bw_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.5774374008179
			},
			localization_strings = {
				[1.0] = "pwh_bw_future_two_02"
			}
		},
		pes_es_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.4248957633972
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_three_02"
			}
		},
		pwh_es_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_es_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.8949584960938
			},
			localization_strings = {
				[1.0] = "pwh_es_backstory_three_01"
			}
		},
		pdr_dr_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.8887708187103
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_three_03"
			}
		},
		pwe_we_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.1357707977295
			},
			localization_strings = {
				[1.0] = "pwe_we_future_four_01"
			}
		},
		pbw_dr_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dr_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.6533124446869
			},
			localization_strings = {
				[1.0] = "pbw_dr_future_three_01"
			}
		},
		pwh_bw_future_eight_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_bw_future_eight_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.2138750553131
			},
			localization_strings = {
				[1.0] = "pwh_bw_future_eight_04"
			}
		},
		pdr_dr_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.2052292823792
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_three_01"
			}
		},
		pbw_bw_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.0520417690277
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_two_01"
			}
		},
		pdr_dr_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.2361874580383
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_three_02"
			}
		},
		pwh_we_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_we_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.0313749313355
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_two_02"
			}
		},
		pdr_dr_backstory_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.3679165840149
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_four_01"
			}
		},
		pes_hub_lohner_conversation_twentythree_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_hub_lohner_conversation_twentythree_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.111750125885
			},
			localization_strings = {
				[1.0] = "pes_hub_lohner_conversation_twentythree_01"
			}
		},
		nfl_debrief_nurgle_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_nurgle_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 37.438373565674
			},
			localization_strings = {
				[1.0] = "nfl_debrief_nurgle_01"
			}
		},
		pbw_bw_future_eight_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_future_eight_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.4011874198914
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_eight_04"
			}
		},
		pes_es_backstory_huntsman_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_backstory_huntsman_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.8426249027252
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_huntsman_five_02"
			}
		},
		pwh_we_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_we_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.0906457901001
			},
			localization_strings = {
				[1.0] = "pwh_we_future_one_02"
			}
		},
		pdr_dr_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.8273124694824
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_one_01"
			}
		},
		pdr_dr_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.7031042575836
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_three_03"
			}
		},
		pes_hub_lohner_conversation_twentyfour_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_hub_lohner_conversation_twentyfour_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.7850208282471
			},
			localization_strings = {
				[1.0] = "pes_hub_lohner_conversation_twentyfour_01"
			}
		},
		pes_es_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 8.4341249465942
			},
			localization_strings = {
				[1.0] = "pes_es_future_four_02"
			}
		},
		pbw_dr_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dr_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.1755208969116
			},
			localization_strings = {
				[1.0] = "pbw_dr_backstory_three_01"
			}
		},
		pwe_es_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_es_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.6613125801086
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_one_03"
			}
		},
		pes_es_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.5529999732971
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_one_01"
			}
		},
		pbw_es_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_es_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.1812705993652
			},
			localization_strings = {
				[1.0] = "pbw_es_backstory_two_01"
			}
		},
		nik_greeting_first_time = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_hub_welcome_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 38.688293457031
			},
			localization_strings = {
				[1.0] = "nik_hub_welcome_01"
			}
		},
		pwh_wh_future_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_future_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.6239166259766
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_one_03"
			}
		},
		pwe_we_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.775687456131
			},
			localization_strings = {
				[1.0] = "pwe_we_future_two_01"
			}
		},
		pdr_bw_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_bw_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.229875087738
			},
			localization_strings = {
				[1.0] = "pdr_bw_backstory_five_02"
			}
		},
		pbw_we_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_we_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7907915115356
			},
			localization_strings = {
				[1.0] = "pbw_we_future_five_01"
			}
		},
		pdr_bw_future_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_bw_future_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.4998540878296
			},
			localization_strings = {
				[1.0] = "pdr_bw_future_three_04"
			}
		},
		pwh_wh_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.4080414772034
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_four_02"
			}
		},
		pes_bw_backstory_seven_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_bw_backstory_seven_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 0.87479168176651
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_seven_04"
			}
		},
		pes_hub_lohner_conversation_twentytwo_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_hub_lohner_conversation_twentytwo_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.2580416202545
			},
			localization_strings = {
				[1.0] = "pes_hub_lohner_conversation_twentytwo_01"
			}
		},
		pdr_dr_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.3938331604004
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_two_01"
			}
		},
		pbw_bw_backstory_seven_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_seven_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.6063957214356
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_seven_03"
			}
		},
		pes_es_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.4137916564941
			},
			localization_strings = {
				[1.0] = "pes_es_future_two_03"
			}
		},
		pes_we_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.3660416603088
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_three_03"
			}
		},
		pdr_we_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_we_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.1272916793823
			},
			localization_strings = {
				[1.0] = "pdr_we_future_three_02"
			}
		},
		pdr_we_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_we_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.228354215622
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_five_01"
			}
		},
		nik_altar = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 6,
			sound_events = {
				"nik_altar_01",
				"nik_altar_02",
				"nik_altar_03",
				"nik_altar_04",
				"nik_altar_05",
				"nik_altar_06"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			sound_events_duration = {
				17.289375305176,
				7.5209999084473,
				2.1196250915527,
				5.9983334541321,
				4.2588124275208,
				4.9398331642151
			},
			localization_strings = {
				"nik_altar_01",
				"nik_altar_02",
				"nik_altar_03",
				"nik_altar_04",
				"nik_altar_05",
				"nik_altar_06"
			},
			randomize_indexes = {}
		},
		nik_greeting_night = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_hub_greeting_night_27",
				"nik_hub_greeting_night_28",
				"nik_hub_greeting_night_29"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.1783747673035,
				5.6291251182556,
				6.9817290306091
			},
			localization_strings = {
				"nik_hub_greeting_night_27",
				"nik_hub_greeting_night_28",
				"nik_hub_greeting_night_29"
			},
			randomize_indexes = {}
		},
		pes_we_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9007707834244
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_three_01"
			}
		},
		nik_greeting_sunny = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 6,
			sound_events = {
				"nik_hub_greeting_14",
				"nik_hub_greeting_sunny_23",
				"nik_hub_greeting_sunny_22",
				"nik_hub_greeting_sunny_25",
				"nik_hub_greeting_sunny_21",
				"nik_hub_greeting_sunny_24"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			sound_events_duration = {
				3.323979139328,
				1.5245000123978,
				4.8956665992737,
				3.4472498893738,
				2.7051458358765,
				3.112104177475
			},
			localization_strings = {
				"nik_hub_greeting_14",
				"nik_hub_greeting_sunny_23",
				"nik_hub_greeting_sunny_22",
				"nik_hub_greeting_sunny_25",
				"nik_hub_greeting_sunny_21",
				"nik_hub_greeting_sunny_24"
			},
			randomize_indexes = {}
		},
		pwh_wh_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.6870625019074
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_two_01"
			}
		},
		pbw_es_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_es_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 8.7239370346069
			},
			localization_strings = {
				[1.0] = "pbw_es_future_one_02"
			}
		},
		pwh_dr_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_dr_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.0646457672119
			},
			localization_strings = {
				[1.0] = "pwh_dr_backstory_one_02"
			}
		},
		pdr_we_backstory_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_we_backstory_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.7282500267029
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_three_04"
			}
		},
		pwe_wh_backstory_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_wh_backstory_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.4274582862854
			},
			localization_strings = {
				[1.0] = "pwe_wh_backstory_two_04"
			}
		},
		pbw_bw_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 8.6177501678467
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_two_02"
			}
		},
		pbw_bw_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.8150417804718
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_four_02"
			}
		},
		nik_callout_unready_kerillian = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_callout_unready_kerillian_01",
				"nik_callout_unready_kerillian_02",
				"nik_callout_unready_kerillian_03",
				"nik_callout_unready_kerillian_04"
			},
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
			sound_events_duration = {
				8.9162912368774,
				8.5915212631226,
				6.625937461853,
				7.4648122787476
			},
			localization_strings = {
				"nik_callout_unready_kerillian_01",
				"nik_callout_unready_kerillian_02",
				"nik_callout_unready_kerillian_03",
				"nik_callout_unready_kerillian_04"
			},
			randomize_indexes = {}
		},
		pes_bw_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_bw_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0785417556763
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_two_01"
			}
		},
		nik_callout_unready_sienna = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "nik_callout_unready_sienna_03",
				[2.0] = "nik_callout_unready_sienna_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 9.9128541946411,
				[2.0] = 9.4418754577637
			},
			localization_strings = {
				[1.0] = "nik_callout_unready_sienna_03",
				[2.0] = "nik_callout_unready_sienna_04"
			},
			randomize_indexes = {}
		},
		nik_intro_forge_reminder = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "nik_intro_forge_reminder_01",
				[2.0] = "nik_intro_forge_reminder_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1456458568573,
				[2.0] = 2.2395417690277
			},
			localization_strings = {
				[1.0] = "nik_intro_forge_reminder_01",
				[2.0] = "nik_intro_forge_reminder_02"
			},
			randomize_indexes = {}
		},
		pes_we_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.0847916603088
			},
			localization_strings = {
				[1.0] = "pes_we_future_four_01"
			}
		},
		nik_hub_long_waiting_01 = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"nik_hub_greeting_08",
				"nik_hub_greeting_19",
				"nik_hub_idle_01",
				"nik_hub_idle_02",
				"nik_hub_idle_05"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			sound_events_duration = {
				2.4725000858307,
				3.34410405159,
				1.7756458520889,
				3.0182292461395,
				3.4308958053589
			},
			localization_strings = {
				"nik_hub_greeting_08",
				"nik_hub_greeting_19",
				"nik_hub_idle_01",
				"nik_hub_idle_02",
				"nik_hub_idle_05"
			},
			randomize_indexes = {}
		},
		nfl_debrief_ground_zero_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_debrief_ground_zero_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 36.859519958496
			},
			localization_strings = {
				[1.0] = "nfl_debrief_ground_zero_01"
			}
		},
		pbw_bw_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.4297082424164
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_one_03"
			}
		},
		pes_we_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.3887708187103
			},
			localization_strings = {
				[1.0] = "pes_we_future_four_03"
			}
		},
		pwh_wh_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.570291519165
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_two_01"
			}
		},
		pes_es_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_es_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 8.8698749542236
			},
			localization_strings = {
				[1.0] = "pes_es_future_one_02"
			}
		},
		nik_intro_forge = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_intro_forge_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 12.386166572571
			},
			localization_strings = {
				[1.0] = "nik_intro_forge_01"
			}
		},
		pwe_we_backstory_two_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_backstory_two_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.1117706298828
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_two_06"
			}
		},
		pbw_dr_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_dr_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.8071666955948
			},
			localization_strings = {
				[1.0] = "pbw_dr_backstory_three_03"
			}
		},
		pdr_wh_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_wh_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.4464583396912
			},
			localization_strings = {
				[1.0] = "pdr_wh_backstory_one_02"
			}
		},
		pbw_bw_backstory_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_bw_backstory_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9614584445953
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_four_01"
			}
		},
		pwh_es_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_es_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.0590624809265
			},
			localization_strings = {
				[1.0] = "pwh_es_future_two_03"
			}
		},
		pbw_es_future_one_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_es_future_one_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.8970416784286
			},
			localization_strings = {
				[1.0] = "pbw_es_future_one_04"
			}
		},
		pwe_es_future_four_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_es_future_four_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.3715207576752
			},
			localization_strings = {
				[1.0] = "pwe_es_future_four_04"
			}
		},
		pes_dr_backstory_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dr_backstory_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8023540973663
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_six_01"
			}
		},
		nik_greeting_rainy = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"nik_hub_greeting_rainy_24",
				"nik_hub_greeting_rainy_25",
				"nik_hub_greeting_rainy_26"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				2.4394583702087,
				6.7035417556763,
				5.4216456413269
			},
			localization_strings = {
				"nik_hub_greeting_rainy_24",
				"nik_hub_greeting_rainy_25",
				"nik_hub_greeting_rainy_26"
			},
			randomize_indexes = {}
		},
		pdr_we_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_we_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.5934584140778
			},
			localization_strings = {
				[1.0] = "pdr_we_future_three_03"
			}
		},
		pwe_dr_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_dr_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.7597708702087
			},
			localization_strings = {
				[1.0] = "pwe_dr_backstory_one_03"
			}
		},
		pdr_bw_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_bw_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.4652915000916
			},
			localization_strings = {
				[1.0] = "pdr_bw_future_three_01"
			}
		},
		pdr_we_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_we_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.602520942688
			},
			localization_strings = {
				[1.0] = "pdr_we_future_three_01"
			}
		},
		pwe_we_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.344583272934
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_one_01"
			}
		},
		pwe_we_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_we_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.8041458129883
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_one_03"
			}
		},
		pes_dr_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dr_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.5569167137146
			},
			localization_strings = {
				[1.0] = "pes_dr_future_four_02"
			}
		},
		pbw_we_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_we_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.1408541202545
			},
			localization_strings = {
				[1.0] = "pbw_we_future_five_02"
			}
		},
		pbw_we_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_we_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.0568333864212
			},
			localization_strings = {
				[1.0] = "pbw_we_backstory_one_02"
			}
		},
		pdr_dr_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.1294374465942
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_two_02"
			}
		},
		pes_we_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.4418125152588
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_three_02"
			}
		},
		pwh_wh_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_wh_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 0.88927084207535
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_two_02"
			}
		},
		pbw_wh_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_wh_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.3696041107178
			},
			localization_strings = {
				[1.0] = "pbw_wh_future_three_02"
			}
		},
		pdr_dr_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_dr_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.8601458072662
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_one_02"
			}
		},
		pbw_we_backstory_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_we_backstory_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.3959999084473
			},
			localization_strings = {
				[1.0] = "pbw_we_backstory_four_01"
			}
		},
		pes_we_backstory_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_we_backstory_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.9091458320618
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_three_04"
			}
		},
		pwe_es_backstory_huntsman_five_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_es_backstory_huntsman_five_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.2164793014526
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_huntsman_five_05"
			}
		},
		nik_callout_unready_kruber_mercenary = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "hub_conversations",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_callout_unready_kruber_01",
				"nik_callout_unready_kruber_02",
				"nik_callout_unready_kruber_03",
				"nik_callout_unready_kruber_04"
			},
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
			sound_events_duration = {
				10.048958778381,
				7.5940833091736,
				6.3275418281555,
				7.7065415382385
			},
			localization_strings = {
				"nik_callout_unready_kruber_01",
				"nik_callout_unready_kruber_02",
				"nik_callout_unready_kruber_03",
				"nik_callout_unready_kruber_04"
			},
			randomize_indexes = {}
		},
		nik_hub_lohner_conversation_twentyone_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twentyone_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.0775418281555
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twentyone_01"
			}
		},
		pwe_es_backstory_huntsman_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_es_backstory_huntsman_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 8.1218338012695
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_huntsman_five_03"
			}
		},
		pes_dr_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_dr_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.917854309082
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_five_01"
			}
		}
	})
end
