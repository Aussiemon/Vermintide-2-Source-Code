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
		name = "nik_keep_idle_pool_01",
		response = "nik_keep_idle_pool_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_keep_idle_pool"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_keep_idle_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_idle_pool_02",
		response = "nik_keep_idle_pool_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_keep_idle_pool"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_keep_idle_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_02",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_idle_shop",
		response = "nik_keep_idle_shop",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_keep_idle_shop"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				600
			},
			{
				"user_memory",
				"nik_keep_idle_shop",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_keep_idle_shop",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_hub_lohner_conversation_one_01",
		response = "nik_hub_lohner_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"witch_hunter",
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
				"nik_hub_lohner_conversation_pwh",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pwh",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_hub_lohner_conversation_one_01",
		name = "pwh_hub_lohner_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_one_01"
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
		name = "nik_hub_lohner_conversation_two_01",
		response = "nik_hub_lohner_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"witch_hunter",
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
				"nik_hub_lohner_conversation_pwh",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pwh",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_hub_lohner_conversation_two_01",
		name = "pwh_hub_lohner_conversation_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_two_01"
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
		name = "nik_hub_lohner_conversation_three_01",
		response = "nik_hub_lohner_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"witch_hunter",
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
				"nik_hub_lohner_conversation_pwh",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pwh",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_hub_lohner_conversation_three_01",
		name = "pwh_hub_lohner_conversation_three_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_three_01"
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
		name = "nik_hub_lohner_conversation_four_01",
		response = "nik_hub_lohner_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general_inactive"
			},
			{
				"global_context",
				"witch_hunter",
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
				"nik_hub_lohner_conversation_pwh",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pwh",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_hub_lohner_conversation_four_01",
		name = "pwh_hub_lohner_conversation_four_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_five_01"
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
		name = "nik_hub_lohner_conversation_five_01",
		response = "nik_hub_lohner_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general_inactive"
			},
			{
				"global_context",
				"witch_hunter",
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
				"nik_hub_lohner_conversation_pwh",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pwh",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_hub_lohner_conversation_five_01",
		name = "pwh_hub_lohner_conversation_five_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_four_01"
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
		name = "nik_hub_lohner_conversation_six_01",
		response = "nik_hub_lohner_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"dwarf_ranger",
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
				"nik_hub_lohner_conversation_pdr",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pdr",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_hub_lohner_conversation_six_01",
		name = "pdr_hub_lohner_conversation_six_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_six_01"
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
		name = "nik_hub_lohner_conversation_seven_01",
		response = "nik_hub_lohner_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"dwarf_ranger",
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
				"nik_hub_lohner_conversation_pdr",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pdr",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_hub_lohner_conversation_seven_01",
		name = "pdr_hub_lohner_conversation_seven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_seven_01"
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
		name = "nik_hub_lohner_conversation_eight_01",
		response = "nik_hub_lohner_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"dwarf_ranger",
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
				"nik_hub_lohner_conversation_pdr",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pdr",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_hub_lohner_conversation_eight_01",
		name = "pdr_hub_lohner_conversation_eight_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_eight_01"
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
		name = "nik_hub_lohner_conversation_nine_01",
		response = "nik_hub_lohner_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"dwarf_ranger",
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
				"nik_hub_lohner_conversation_pdr",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pdr",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_hub_lohner_conversation_nine_01",
		name = "pdr_hub_lohner_conversation_nine_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_nine_01"
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
		name = "nik_hub_lohner_conversation_ten_01",
		response = "nik_hub_lohner_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"dwarf_ranger",
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
				"nik_hub_lohner_conversation_pdr",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pdr",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_hub_lohner_conversation_ten_01",
		name = "pdr_hub_lohner_conversation_ten_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_ten_01"
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
		name = "nik_hub_lohner_conversation_eleven_01",
		response = "nik_hub_lohner_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"bright_wizard",
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
				"nik_hub_lohner_conversation_pbw",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pbw",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_hub_lohner_conversation_eleven_01",
		name = "pbw_hub_lohner_conversation_eleven_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_eleven_01"
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
		name = "nik_hub_lohner_conversation_twelve_01",
		response = "nik_hub_lohner_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"bright_wizard",
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
				"nik_hub_lohner_conversation_pbw",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pbw",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_hub_lohner_conversation_twelve_01",
		name = "pbw_hub_lohner_conversation_twelve_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_twelve_01"
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
		name = "nik_hub_lohner_conversation_thirteen_01",
		response = "nik_hub_lohner_conversation_thirteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"bright_wizard",
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
				"nik_hub_lohner_conversation_pbw",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pbw",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_hub_lohner_conversation_thirteen_01",
		name = "pbw_hub_lohner_conversation_thirteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_thirteen_01"
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
		name = "nik_hub_lohner_conversation_fourteen_01",
		response = "nik_hub_lohner_conversation_fourteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"bright_wizard",
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
				"nik_hub_lohner_conversation_pbw",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pbw",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_hub_lohner_conversation_fourteen_01",
		name = "pbw_hub_lohner_conversation_fourteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_fourteen_01"
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
		name = "nik_hub_lohner_conversation_fifteen_01",
		response = "nik_hub_lohner_conversation_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"bright_wizard",
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
				"nik_hub_lohner_conversation_pbw",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pbw",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_hub_lohner_conversation_fifteen_01",
		name = "pbw_hub_lohner_conversation_fifteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_fifteen_01"
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
		name = "nik_hub_lohner_conversation_sixteen_01",
		response = "nik_hub_lohner_conversation_sixteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"wood_elf",
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
				"nik_hub_lohner_conversation_pwe",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pwe",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_hub_lohner_conversation_sixteen_01",
		name = "pwe_hub_lohner_conversation_sixteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_sixteen_01"
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
		name = "nik_hub_lohner_conversation_seventeen_01",
		response = "nik_hub_lohner_conversation_seventeen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"wood_elf",
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
				"nik_hub_lohner_conversation_pwe",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pwe",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_hub_lohner_conversation_seventeen_01",
		name = "pwe_hub_lohner_conversation_seventeen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_seventeen_01"
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
		name = "nik_hub_lohner_conversation_eighteen_01",
		response = "nik_hub_lohner_conversation_eighteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"wood_elf",
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
				"nik_hub_lohner_conversation_pwe",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pwe",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_hub_lohner_conversation_eigthteen_01",
		name = "pwe_hub_lohner_conversation_eigthteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_eighteen_01"
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
		name = "nik_hub_lohner_conversation_nineteen_01",
		response = "nik_hub_lohner_conversation_nineteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"wood_elf",
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
				"nik_hub_lohner_conversation_pwe",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pwe",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_hub_lohner_conversation_nineteen_01",
		name = "pwe_hub_lohner_conversation_nineteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_nineteen_01"
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
		name = "nik_hub_lohner_conversation_twenty_01",
		response = "nik_hub_lohner_conversation_twenty_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"wood_elf",
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
				"nik_hub_lohner_conversation_pwe",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pwe",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_hub_lohner_conversation_twenty_01",
		name = "pwe_hub_lohner_conversation_twenty_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_hub_lohner_conversation_twenty_01"
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
		name = "nik_hub_lohner_conversation_twentyone_01",
		response = "nik_hub_lohner_conversation_twentyone_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"empire_soldier",
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
				"nik_hub_lohner_conversation_pes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pes",
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
				"user_context",
				"player_profile",
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
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"empire_soldier",
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
				"nik_hub_lohner_conversation_pes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pes",
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
				"user_context",
				"player_profile",
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
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"empire_soldier",
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
				"nik_hub_lohner_conversation_pes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pes",
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
				"user_context",
				"player_profile",
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
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"empire_soldier",
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
				"nik_hub_lohner_conversation_pes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pes",
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
				"user_context",
				"player_profile",
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
				"nik_hub_lohner_conversations_general"
			},
			{
				"global_context",
				"empire_soldier",
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
				"nik_hub_lohner_conversation_pes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_lohner_conversation_pes",
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
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		name = "nik_fleur_conversation_seventeen_01",
		response = "nik_fleur_conversation_seventeen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_fleur_conversations"
			},
			{
				"global_context",
				"es_questingknight",
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
				"nik_fleur_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_fleur_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_fleur_conversation_seventeen_01",
		name = "pes_fleur_conversation_seventeen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_fleur_conversation_seventeen_01"
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
		name = "nik_fleur_conversation_eighteen_01",
		response = "nik_fleur_conversation_eighteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_fleur_conversations"
			},
			{
				"global_context",
				"es_questingknight",
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
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_fleur_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_fleur_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_fleur_conversation_eighteen_01",
		name = "pes_fleur_conversation_eighteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_fleur_conversation_eighteen_01"
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
		response = "pwe_fleur_conversation_eighteen_01",
		name = "pwe_fleur_conversation_eighteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_fleur_conversation_eighteen_01"
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
		response = "pes_fleur_conversation_eighteen_02",
		name = "pes_fleur_conversation_eighteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_fleur_conversation_eighteen_01"
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
		response = "pwe_fleur_conversation_eighteen_02",
		name = "pwe_fleur_conversation_eighteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_fleur_conversation_eighteen_02"
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
		name = "nik_fleur_conversation_nineteen_01",
		response = "nik_fleur_conversation_nineteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_fleur_conversations"
			},
			{
				"global_context",
				"es_questingknight",
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
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_fleur_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_fleur_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_fleur_conversation_nineteen_01",
		name = "pes_fleur_conversation_nineteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_fleur_conversation_nineteen_01"
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
		response = "pwh_fleur_conversation_nineteen_01",
		name = "pwh_fleur_conversation_nineteen_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_fleur_conversation_nineteen_01"
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
		response = "pes_fleur_conversation_nineteen_02",
		name = "pes_fleur_conversation_nineteen_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_fleur_conversation_nineteen_01"
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
		name = "nik_fleur_conversation_twenty_01",
		response = "nik_fleur_conversation_twenty_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_fleur_conversations"
			},
			{
				"global_context",
				"es_questingknight",
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
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_fleur_conversations",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_fleur_conversations",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_fleur_conversation_twenty_01",
		name = "pes_fleur_conversation_twenty_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"nik_fleur_conversation_twenty_01"
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
		response = "pbw_fleur_conversation_twenty_01",
		name = "pbw_fleur_conversation_twenty_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_fleur_conversation_twenty_01"
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
		response = "pes_fleur_conversation_twenty_02",
		name = "pes_fleur_conversation_twenty_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_fleur_conversation_twenty_01"
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
		name = "nik_hub_okri_grudge",
		response = "nik_hub_okri_grudge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_hub_okri_grudge"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_hub_okri_grudge",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_okri_grudge",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_hub_store_first_time",
		response = "nik_hub_store_first_time",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"first_time_store_release"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"first_time_store_release",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"first_time_store_release",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_shop_purchase",
		response = "nik_keep_shop_purchase",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shop_closed_item_bought"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"time_since_closed_shop",
				OP.TIMEDIFF,
				OP.GT,
				120
			},
			{
				"user_memory",
				"nik_keep_shop_purchase",
				OP.LT,
				2
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_closed_shop",
				OP.TIMESET
			},
			{
				"user_memory",
				"nik_keep_shop_purchase",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_keep_shop_purchase_cancelled",
		response = "nik_keep_shop_purchase_cancelled",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shop_closed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"time_since_closed_shop",
				OP.TIMEDIFF,
				OP.GT,
				1200
			},
			{
				"user_memory",
				"time_since_closed_shop_cancelled",
				OP.TIMEDIFF,
				OP.GT,
				480
			},
			{
				"user_memory",
				"nik_keep_shop_purchase_cancelled",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_closed_shop_cancelled",
				OP.TIMESET
			},
			{
				"user_memory",
				"nik_keep_shop_purchase_cancelled",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "nik_hub_store_new_items",
		response = "nik_hub_store_new_items",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shop_new_items"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			},
			{
				"user_memory",
				"nik_hub_store_new_items",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nik_hub_store_new_items",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nik_greeting_halloween",
		name = "nik_greeting_halloween",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_greeting_halloween"
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
				"witch_hunter",
				OP.EQ,
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
				"wood_elf",
				OP.EQ,
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
		name = "pdr_additional_backstory_conversation_one_01",
		response = "pdr_additional_backstory_conversation_one_01",
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
				60
			},
			{
				"faction_memory",
				"additional_backstory_conversation_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"additional_backstory_conversation_one",
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
		name = "pes_additional_backstory_conversation_one_01",
		response = "pes_additional_backstory_conversation_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_additional_backstory_conversation_one_01"
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
		name = "pdr_additional_backstory_conversation_one_02",
		response = "pdr_additional_backstory_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_additional_backstory_conversation_one_01"
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
		name = "pes_additional_backstory_conversation_one_02",
		response = "pes_additional_backstory_conversation_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_additional_backstory_conversation_one_02"
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
		name = "pdr_additional_backstory_conversation_one_03",
		response = "pdr_additional_backstory_conversation_one_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_additional_backstory_conversation_one_02"
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
		name = "pdr_hub_songbook_one",
		response = "pdr_hub_songbook_one",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				600
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
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				60
			},
			{
				"faction_memory",
				"pdr_hub_songbook_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_hub_songbook_one",
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
		response = "nfl_olesya_tutorial_dlc_no_skittergate",
		name = "nfl_olesya_tutorial_dlc_no_skittergate",
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
				"nfl_olesya_tutorial_dlc_no_skittergate"
			}
		}
	})
	define_rule({
		response = "nfl_olesya_tutorial_dlc_skittergate_complete",
		name = "nfl_olesya_tutorial_dlc_skittergate_complete",
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
				"nfl_olesya_tutorial_dlc_skittergate_complete"
			}
		}
	})
	define_rule({
		response = "nfl_olesya_weaves_explain",
		name = "nfl_olesya_weaves_explain",
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
				"nfl_olesya_weaves_explain"
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
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_victor",
		response = "ndw_morris_daemon_whispers_hub_victor",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
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
				360
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_victor",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_victor",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_sienna",
		response = "ndw_morris_daemon_whispers_hub_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
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
				360
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_sienna",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_sienna",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_bardin",
		response = "ndw_morris_daemon_whispers_hub_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
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
				360
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_bardin",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_bardin",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_bardin_engineer",
		response = "ndw_morris_daemon_whispers_hub_bardin_engineer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
			},
			{
				"global_context",
				"dr_engineer",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				360
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_bardin",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_bardin",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_kerillian",
		response = "ndw_morris_daemon_whispers_hub_kerillian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
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
				360
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_kerillian",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_kerillian",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_kruber",
		response = "ndw_morris_daemon_whispers_hub_kruber",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
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
				360
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_kruber",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_kruber",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "ndw_morris_daemon_whispers_hub_kruber_gk",
		response = "ndw_morris_daemon_whispers_hub_kruber_gk",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
			},
			{
				"global_context",
				"es_questingknight",
				OP.EQ,
				1
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				360
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			},
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_kruber",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"ndw_morris_daemon_whispers_hub_kruber",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pes_wh_backstory_four_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wh_backstory_four_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_wh_backstory_four_04"
			},
			sound_events_duration = {
				[1.0] = 11.346541404724
			}
		},
		pwe_bw_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_bw_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_bw_backstory_four_03"
			},
			sound_events_duration = {
				[1.0] = 9.6675624847412
			}
		},
		pwh_dr_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_dr_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_dr_backstory_one_02"
			},
			sound_events_duration = {
				[1.0] = 2.0646457672119
			}
		},
		pbw_dr_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_dr_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_dr_backstory_three_02"
			},
			sound_events_duration = {
				[1.0] = 4.9092707633972
			}
		},
		pbw_es_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_es_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_es_backstory_two_03"
			},
			sound_events_duration = {
				[1.0] = 2.8863542079926
			}
		},
		pbw_es_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_es_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_es_backstory_two_01"
			},
			sound_events_duration = {
				[1.0] = 6.1812705993652
			}
		},
		pwe_dr_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_dr_future_five_01"
			},
			sound_events_duration = {
				[1.0] = 2.2529165744781
			}
		},
		pbw_bw_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_five_02"
			},
			sound_events_duration = {
				[1.0] = 5.813458442688
			}
		},
		nik_hub_lohner_conversation_eighteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_eighteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_eighteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.3479375839233
			}
		},
		nik_intro_forge = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_intro_forge_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events = {
				[1.0] = "nik_intro_forge_01"
			},
			sound_events_duration = {
				[1.0] = 12.386166572571
			}
		},
		pes_we_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.0471665859222
			}
		},
		pwe_we_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_three_01"
			},
			sound_events_duration = {
				[1.0] = 6.542396068573
			}
		},
		pwh_wh_future_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_future_two_04"
			},
			sound_events_duration = {
				[1.0] = 3.9176459312439
			}
		},
		pbw_we_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_we_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_we_future_five_02"
			},
			sound_events_duration = {
				[1.0] = 2.1408541202545
			}
		},
		pes_bw_backstory_two_033 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_two_033"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_bw_backstory_two_033"
			},
			sound_events_duration = {
				[1.0] = 6.0654895305634
			}
		},
		pwh_wh_backstory_two_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 5.1951665878296
			}
		},
		pwe_we_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_two_03"
			},
			sound_events_duration = {
				[1.0] = 2.6054792404175
			}
		},
		nfl_debrief_mines_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_mines_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_mines_01"
			},
			sound_events_duration = {
				[1.0] = 61.894248962402
			}
		},
		pes_bw_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_bw_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_bw_future_five_01"
			},
			sound_events_duration = {
				[1.0] = 3.0864999294281
			}
		},
		pbw_bw_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_two_02"
			},
			sound_events_duration = {
				[1.0] = 8.6177501678467
			}
		},
		pes_we_backstory_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_backstory_three_04"
			},
			sound_events_duration = {
				[1.0] = 1.9091458320618
			}
		},
		pwe_es_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_es_backstory_one_03"
			},
			sound_events_duration = {
				[1.0] = 3.6613125801086
			}
		},
		pwe_we_future_five_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_five_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_five_05"
			},
			sound_events_duration = {
				[1.0] = 2.1591458320618
			}
		},
		pwh_bw_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.1572499275208
			}
		},
		nik_keep_shop_purchase = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "hub_conversations",
			sound_events_n = 8,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 8,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
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
				"nik_keep_shop_purchase_01",
				"nik_keep_shop_purchase_02",
				"nik_keep_shop_purchase_03",
				"nik_keep_shop_purchase_04",
				"nik_keep_shop_purchase_05",
				"nik_keep_shop_purchase_06",
				"nik_keep_shop_purchase_07",
				"nik_keep_shop_purchase_08"
			},
			sound_events_duration = {
				3.1429584026337,
				2.9903540611267,
				4.17032289505,
				4.9012293815613,
				2.6801874637604,
				3.3099374771118,
				3.335479259491,
				1.780052125454
			},
			localization_strings = {
				"nik_keep_shop_purchase_01",
				"nik_keep_shop_purchase_02",
				"nik_keep_shop_purchase_03",
				"nik_keep_shop_purchase_04",
				"nik_keep_shop_purchase_05",
				"nik_keep_shop_purchase_06",
				"nik_keep_shop_purchase_07",
				"nik_keep_shop_purchase_08"
			}
		},
		pwh_wh_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_future_four_01"
			},
			sound_events_duration = {
				[1.0] = 3.0769584178925
			}
		},
		pwh_es_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 6.9128332138061
			}
		},
		pdr_dr_backstory_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_three_04"
			},
			sound_events_duration = {
				[1.0] = 7.3677082061768
			}
		},
		pwe_bw_backstory_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_bw_backstory_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_bw_backstory_six_02"
			},
			sound_events_duration = {
				[1.0] = 5.0477499961853
			}
		},
		nik_callout_unready_saltzpyre = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hub_conversations",
			sound_events_n = 4,
			category = "npc_talk",
			dialogue_animations_n = 4,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_callout_unready_saltzpyre_01",
				"nik_callout_unready_saltzpyre_02",
				"nik_callout_unready_saltzpyre_03",
				"nik_callout_unready_saltzpyre_04"
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
			}
		},
		pwe_we_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_five_01"
			},
			sound_events_duration = {
				[1.0] = 7.2494583129883
			}
		},
		pdr_we_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_we_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_we_future_three_01"
			},
			sound_events_duration = {
				[1.0] = 4.602520942688
			}
		},
		nik_hub_store_new_items = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "hub_conversations",
			sound_events_n = 15,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 15,
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
				"face_neutral"
			},
			randomize_indexes = {},
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
				"dialogue_talk"
			},
			sound_events = {
				"nik_hub_store_new_items_01",
				"nik_hub_store_new_items_02",
				"nik_hub_store_new_items_03",
				"nik_hub_store_new_items_04",
				"nik_hub_store_new_items_05",
				"nik_hub_store_new_items_06",
				"nik_hub_store_new_items_07",
				"nik_hub_store_new_items_08",
				"nik_hub_store_new_items_09",
				"nik_hub_store_new_items_10",
				"nik_hub_store_new_items_11",
				"nik_hub_store_new_items_12",
				"nik_hub_store_new_items_13",
				"nik_hub_store_new_items_14",
				"nik_hub_store_new_items_15"
			},
			sound_events_duration = {
				4.5888123512268,
				5.8592081069946,
				6.3331875801086,
				4.0580835342407,
				4.5209794044495,
				5.7645206451416,
				4.9202499389648,
				4.4137291908264,
				3.9314999580383,
				5.3068122863769,
				8.8881874084473,
				5.4347500801086,
				3.9421875476837,
				7.2155833244324,
				6.5186247825623
			},
			localization_strings = {
				"nik_hub_store_new_items_01",
				"nik_hub_store_new_items_02",
				"nik_hub_store_new_items_03",
				"nik_hub_store_new_items_04",
				"nik_hub_store_new_items_05",
				"nik_hub_store_new_items_06",
				"nik_hub_store_new_items_07",
				"nik_hub_store_new_items_08",
				"nik_hub_store_new_items_09",
				"nik_hub_store_new_items_10",
				"nik_hub_store_new_items_11",
				"nik_hub_store_new_items_12",
				"nik_hub_store_new_items_13",
				"nik_hub_store_new_items_14",
				"nik_hub_store_new_items_15"
			}
		},
		pwe_hub_lohner_conversation_seventeen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_hub_lohner_conversation_seventeen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_hub_lohner_conversation_seventeen_01"
			},
			sound_events_duration = {
				[1.0] = 4.0029168128967
			}
		},
		nik_map_intro = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_map_intro_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_map_intro_01"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			}
		},
		pwh_wh_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_future_one_01"
			},
			sound_events_duration = {
				[1.0] = 3.5243542194366
			}
		},
		pwe_dr_future_five_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_dr_future_five_04"
			},
			sound_events_duration = {
				[1.0] = 4.4397501945496
			}
		},
		pbw_bw_backstory_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_six_01"
			},
			sound_events_duration = {
				[1.0] = 7.7623543739319
			}
		},
		nik_hub_lohner_conversation_fifteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_fifteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_fifteen_01"
			},
			sound_events_duration = {
				[1.0] = 2.4594376087189
			}
		},
		pbw_bw_backstory_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_four_01"
			},
			sound_events_duration = {
				[1.0] = 2.9614584445953
			}
		},
		pbw_bw_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_four_02"
			},
			sound_events_duration = {
				[1.0] = 3.8150417804718
			}
		},
		pes_we_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 4.6642708778381
			}
		},
		pwh_dr_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_dr_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_dr_future_two_03"
			},
			sound_events_duration = {
				[1.0] = 4.190333366394
			}
		},
		pes_wh_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wh_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_wh_future_two_02"
			},
			sound_events_duration = {
				[1.0] = 1.7677083015442
			}
		},
		pwh_we_backstory_two_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_two_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_we_backstory_two_05"
			},
			sound_events_duration = {
				[1.0] = 2.2149374485016
			}
		},
		pbw_bw_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.0742707252502
			}
		},
		pbw_we_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 3.5214791297913
			}
		},
		pes_wh_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_wh_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_wh_backstory_four_02"
			},
			sound_events_duration = {
				[1.0] = 3.3329374790192
			}
		},
		pes_es_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_one_01"
			},
			sound_events_duration = {
				[1.0] = 6.1737499237061
			}
		},
		npp_keep_idle_banter_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "npp_keep_idle_banter_one_01"
			},
			sound_events_duration = {
				[1.0] = 4.7451872825623
			}
		},
		pdr_dr_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_two_02"
			},
			sound_events_duration = {
				[1.0] = 4.5811042785644
			}
		},
		pwh_wh_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_future_two_01"
			},
			sound_events_duration = {
				[1.0] = 3.6870625019074
			}
		},
		pwe_wh_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 7.5326042175293
			}
		},
		pbw_es_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_es_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_es_future_one_02"
			},
			sound_events_duration = {
				[1.0] = 8.7239370346069
			}
		},
		pes_dr_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_dr_backstory_five_02"
			},
			sound_events_duration = {
				[1.0] = 5.2983331680298
			}
		},
		nik_hub_lohner_conversation_fourteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_fourteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_fourteen_01"
			},
			sound_events_duration = {
				[1.0] = 4.8833541870117
			}
		},
		pwe_we_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_five_02"
			},
			sound_events_duration = {
				[1.0] = 5.1454167366028
			}
		},
		pwh_fleur_conversation_nineteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_fleur_conversation_nineteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_fleur_conversation_nineteen_01"
			},
			sound_events_duration = {
				[1.0] = 2.9098334312439
			}
		},
		pes_es_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_backstory_one_01"
			},
			sound_events_duration = {
				[1.0] = 5.5529999732971
			}
		},
		pes_fleur_conversation_seventeen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_fleur_conversation_seventeen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_fleur_conversation_seventeen_01"
			},
			sound_events_duration = {
				[1.0] = 8.122896194458
			}
		},
		pwh_dr_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dr_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_dr_backstory_one_01"
			},
			sound_events_duration = {
				[1.0] = 3.736270904541
			}
		},
		pbw_bw_future_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_three_04"
			},
			sound_events_duration = {
				[1.0] = 2.2199375629425
			}
		},
		pbw_bw_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_one_03"
			},
			sound_events_duration = {
				[1.0] = 3.4297082424164
			}
		},
		pdr_hub_songbook_one = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "hub_conversations",
			sound_events_n = 3,
			category = "story_talk_keep",
			dialogue_animations_n = 3,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"pdr_songbook_one_05",
				"pdr_songbook_one_06",
				"pdr_songbook_one_08"
			},
			sound_events_duration = {
				19.375228881836,
				14.301208496094,
				14.353520393372
			},
			localization_strings = {
				"pdr_songbook_one_05",
				"pdr_songbook_one_06",
				"pdr_songbook_one_08"
			}
		},
		nik_fleur_conversation_seventeen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_fleur_conversation_seventeen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_fleur_conversation_seventeen_01"
			},
			sound_events_duration = {
				[1.0] = 11.193520545959
			}
		},
		pes_fleur_conversation_eighteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_fleur_conversation_eighteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_fleur_conversation_eighteen_02"
			},
			sound_events_duration = {
				[1.0] = 5.4852085113525
			}
		},
		pes_wh_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wh_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_wh_future_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.795916557312
			}
		},
		pes_fleur_conversation_nineteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_fleur_conversation_nineteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_fleur_conversation_nineteen_01"
			},
			sound_events_duration = {
				[1.0] = 1.5914791822434
			}
		},
		nik_greeting_sunny = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "hub_conversations",
			sound_events_n = 6,
			category = "npc_talk",
			dialogue_animations_n = 6,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_hub_greeting_14",
				"nik_hub_greeting_sunny_23",
				"nik_hub_greeting_sunny_22",
				"nik_hub_greeting_sunny_25",
				"nik_hub_greeting_sunny_21",
				"nik_hub_greeting_sunny_24"
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
			}
		},
		pdr_bw_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_bw_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_bw_future_three_01"
			},
			sound_events_duration = {
				[1.0] = 4.4652915000916
			}
		},
		nik_fleur_conversation_nineteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_fleur_conversation_nineteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_fleur_conversation_nineteen_01"
			},
			sound_events_duration = {
				[1.0] = 2.5223541259766
			}
		},
		nik_keep_shop_purchase_cancelled = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "hub_conversations",
			sound_events_n = 8,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 8,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
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
				"nik_keep_shop_purchase_cancelled_01",
				"nik_keep_shop_purchase_cancelled_02",
				"nik_keep_shop_purchase_cancelled_03",
				"nik_keep_shop_purchase_cancelled_04",
				"nik_keep_shop_purchase_cancelled_05",
				"nik_keep_shop_purchase_cancelled_06",
				"nik_keep_shop_purchase_cancelled_07",
				"nik_keep_shop_purchase_cancelled_08"
			},
			sound_events_duration = {
				2.1110000610352,
				5.8378748893738,
				1.4573749899864,
				1.6609375476837,
				2.7443332672119,
				5.2989895343781,
				2.3890937566757,
				1.3648645877838
			},
			localization_strings = {
				"nik_keep_shop_purchase_cancelled_01",
				"nik_keep_shop_purchase_cancelled_02",
				"nik_keep_shop_purchase_cancelled_03",
				"nik_keep_shop_purchase_cancelled_04",
				"nik_keep_shop_purchase_cancelled_05",
				"nik_keep_shop_purchase_cancelled_06",
				"nik_keep_shop_purchase_cancelled_07",
				"nik_keep_shop_purchase_cancelled_08"
			}
		},
		nfl_debrief_helmgart_military_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_helmgart_military_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_helmgart_military_01"
			},
			sound_events_duration = {
				[1.0] = 53.744770050049
			}
		},
		pwe_we_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_one_01"
			},
			sound_events_duration = {
				[1.0] = 2.8939790725708
			}
		},
		nfl_debrief_skittergate_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_skittergate_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_skittergate_01"
			},
			sound_events_duration = {
				[1.0] = 17.341541290283
			}
		},
		pwe_fleur_conversation_eighteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_fleur_conversation_eighteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_fleur_conversation_eighteen_02"
			},
			sound_events_duration = {
				[1.0] = 1.4458750486374
			}
		},
		nik_keep_idle_banter_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_keep_idle_banter_two_01"
			},
			sound_events_duration = {
				[1.0] = 9.2859163284302
			}
		},
		nik_hub_lohner_conversation_twenty_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twenty_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twenty_01"
			},
			sound_events_duration = {
				[1.0] = 5.7716665267944
			}
		},
		pbw_bw_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_two_01"
			},
			sound_events_duration = {
				[1.0] = 2.0520417690277
			}
		},
		pbw_we_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_we_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_we_future_five_03"
			},
			sound_events_duration = {
				[1.0] = 2.572104215622
			}
		},
		pwe_we_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 3.5494999885559
			}
		},
		pbw_we_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 1.0568333864212
			}
		},
		pes_wh_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_wh_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_wh_future_one_01"
			},
			sound_events_duration = {
				[1.0] = 3.1152083873749
			}
		},
		pwe_es_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_es_backstory_one_01"
			},
			sound_events_duration = {
				[1.0] = 5.8013124465942
			}
		},
		pwh_wh_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_backstory_one_01"
			},
			sound_events_duration = {
				[1.0] = 3.8264999389648
			}
		},
		pdr_dr_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_three_03"
			},
			sound_events_duration = {
				[1.0] = 3.7031042575836
			}
		},
		pwe_we_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 7.2468333244324
			}
		},
		pwe_we_future_four_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_four_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_four_04"
			},
			sound_events_duration = {
				[1.0] = 5.9141249656677
			}
		},
		pwh_dr_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_dr_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_dr_future_two_02"
			},
			sound_events_duration = {
				[1.0] = 4.5374374389648
			}
		},
		pdr_wh_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wh_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_wh_backstory_one_02"
			},
			sound_events_duration = {
				[1.0] = 1.4464583396912
			}
		},
		pes_dr_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_dr_backstory_two_01"
			},
			sound_events_duration = {
				[1.0] = 3.3866457939148
			}
		},
		pwh_wh_backstory_four_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_four_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_backstory_four_04"
			},
			sound_events_duration = {
				[1.0] = 5.2819375991821
			}
		},
		pwe_dr_future_five_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_dr_future_five_05"
			},
			sound_events_duration = {
				[1.0] = 8.3357706069946
			}
		},
		pes_es_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_backstory_two_03"
			},
			sound_events_duration = {
				[1.0] = 6.5218334197998
			}
		},
		pwh_wh_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 4.8822498321533
			}
		},
		nik_callout_unready_kerillian = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hub_conversations",
			sound_events_n = 4,
			category = "npc_talk",
			dialogue_animations_n = 4,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_callout_unready_kerillian_01",
				"nik_callout_unready_kerillian_02",
				"nik_callout_unready_kerillian_03",
				"nik_callout_unready_kerillian_04"
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
			}
		},
		ndw_morris_daemon_whispers_hub_kruber = {
			intended_player_profile = "empire_soldier",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hub_conversations",
			sound_events_n = 4,
			category = "story_talk_keep",
			dialogue_animations_n = 4,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"ndw_morris_daemon_whispers_27",
				"ndw_morris_daemon_whispers_28",
				"ndw_morris_daemon_whispers_29",
				"ndw_morris_daemon_whispers_30"
			},
			sound_events_duration = {
				11.03074836731,
				8.644829750061,
				9.0631294250488,
				10.203220367432
			},
			localization_strings = {
				"ndw_morris_daemon_whispers_27",
				"ndw_morris_daemon_whispers_28",
				"ndw_morris_daemon_whispers_29",
				"ndw_morris_daemon_whispers_30"
			}
		},
		nik_hub_long_waiting_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "hub_conversations",
			sound_events_n = 5,
			category = "npc_talk",
			dialogue_animations_n = 5,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_hub_greeting_08",
				"nik_hub_greeting_19",
				"nik_hub_idle_01",
				"nik_hub_idle_02",
				"nik_hub_idle_05"
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
			}
		},
		pes_we_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_backstory_three_02"
			},
			sound_events_duration = {
				[1.0] = 7.4418125152588
			}
		},
		pwh_es_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_es_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_es_future_two_03"
			},
			sound_events_duration = {
				[1.0] = 6.0590624809265
			}
		},
		pdr_we_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_we_backstory_three_02"
			},
			sound_events_duration = {
				[1.0] = 1.9586042165756
			}
		},
		pwh_we_backstory_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_we_backstory_two_04"
			},
			sound_events_duration = {
				[1.0] = 3.8683750629425
			}
		},
		ndw_morris_daemon_whispers_hub_kruber_gk = {
			intended_player_profile = "empire_soldier",
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "hub_conversations",
			sound_events_n = 6,
			category = "story_talk_keep",
			dialogue_animations_n = 6,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"ndw_morris_daemon_whispers_25",
				"ndw_morris_daemon_whispers_26",
				"ndw_morris_daemon_whispers_27",
				"ndw_morris_daemon_whispers_28",
				"ndw_morris_daemon_whispers_29",
				"ndw_morris_daemon_whispers_30"
			},
			sound_events_duration = {
				8.5390024185181,
				11.126734733582,
				11.03074836731,
				8.644829750061,
				9.0631294250488,
				10.203220367432
			},
			localization_strings = {
				"ndw_morris_daemon_whispers_25",
				"ndw_morris_daemon_whispers_26",
				"ndw_morris_daemon_whispers_27",
				"ndw_morris_daemon_whispers_28",
				"ndw_morris_daemon_whispers_29",
				"ndw_morris_daemon_whispers_30"
			}
		},
		pdr_dr_backstory_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_six_02"
			},
			sound_events_duration = {
				[1.0] = 5.6213750839233
			}
		},
		nik_greeting_first_time = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_welcome_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_welcome_01"
			},
			sound_events_duration = {
				[1.0] = 38.688293457031
			}
		},
		pes_we_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_we_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_future_two_03"
			},
			sound_events_duration = {
				[1.0] = 2.5531041622162
			}
		},
		pdr_we_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_we_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_we_future_three_03"
			},
			sound_events_duration = {
				[1.0] = 2.5934584140778
			}
		},
		pes_dr_backstory_six_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_six_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_dr_backstory_six_03"
			},
			sound_events_duration = {
				[1.0] = 2.5255832672119
			}
		},
		pwe_hub_lohner_conversation_twenty_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_hub_lohner_conversation_twenty_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_hub_lohner_conversation_twenty_01"
			},
			sound_events_duration = {
				[1.0] = 6.2481665611267
			}
		},
		ndw_morris_daemon_whispers_hub_bardin_engineer = {
			intended_player_profile = "dwarf_ranger",
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "hub_conversations",
			sound_events_n = 6,
			category = "story_talk_keep",
			dialogue_animations_n = 6,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"ndw_morris_daemon_whispers_13",
				"ndw_morris_daemon_whispers_14",
				"ndw_morris_daemon_whispers_15",
				"ndw_morris_daemon_whispers_16",
				"ndw_morris_daemon_whispers_17",
				"ndw_morris_daemon_whispers_18"
			},
			sound_events_duration = {
				8.6380500793457,
				13.406372070313,
				12.186394691467,
				8.1970748901367,
				9.4446716308594,
				6.8946032524109
			},
			localization_strings = {
				"ndw_morris_daemon_whispers_13",
				"ndw_morris_daemon_whispers_14",
				"ndw_morris_daemon_whispers_15",
				"ndw_morris_daemon_whispers_16",
				"ndw_morris_daemon_whispers_17",
				"ndw_morris_daemon_whispers_18"
			}
		},
		ndw_morris_daemon_whispers_hub_bardin = {
			intended_player_profile = "dwarf_ranger",
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "hub_conversations",
			sound_events_n = 5,
			category = "story_talk_keep",
			dialogue_animations_n = 5,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"ndw_morris_daemon_whispers_13",
				"ndw_morris_daemon_whispers_14",
				"ndw_morris_daemon_whispers_15",
				"ndw_morris_daemon_whispers_16",
				"ndw_morris_daemon_whispers_18"
			},
			sound_events_duration = {
				8.6380500793457,
				13.406372070313,
				12.186394691467,
				8.1970748901367,
				6.8946032524109
			},
			localization_strings = {
				"ndw_morris_daemon_whispers_13",
				"ndw_morris_daemon_whispers_14",
				"ndw_morris_daemon_whispers_15",
				"ndw_morris_daemon_whispers_16",
				"ndw_morris_daemon_whispers_18"
			}
		},
		ndw_morris_daemon_whispers_hub_sienna = {
			intended_player_profile = "bright_wizard",
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "hub_conversations",
			sound_events_n = 6,
			category = "story_talk_keep",
			dialogue_animations_n = 6,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"ndw_morris_daemon_whispers_07",
				"ndw_morris_daemon_whispers_08",
				"ndw_morris_daemon_whispers_09",
				"ndw_morris_daemon_whispers_10",
				"ndw_morris_daemon_whispers_11",
				"ndw_morris_daemon_whispers_12"
			},
			sound_events_duration = {
				8.7563714981079,
				5.4378685951233,
				8.984354019165,
				9.0411338806152,
				9.0541038513184,
				7.112539768219
			},
			localization_strings = {
				"ndw_morris_daemon_whispers_07",
				"ndw_morris_daemon_whispers_08",
				"ndw_morris_daemon_whispers_09",
				"ndw_morris_daemon_whispers_10",
				"ndw_morris_daemon_whispers_11",
				"ndw_morris_daemon_whispers_12"
			}
		},
		ndw_morris_daemon_whispers_hub_victor = {
			intended_player_profile = "witch_hunter",
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "hub_conversations",
			sound_events_n = 6,
			category = "story_talk_keep",
			dialogue_animations_n = 6,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"ndw_morris_daemon_whispers_01",
				"ndw_morris_daemon_whispers_02",
				"ndw_morris_daemon_whispers_03",
				"ndw_morris_daemon_whispers_04",
				"ndw_morris_daemon_whispers_05",
				"ndw_morris_daemon_whispers_06"
			},
			sound_events_duration = {
				5.2502040863037,
				6.2606120109558,
				9.4107255935669,
				9.3419275283813,
				9.5092973709106,
				6.8406801223755
			},
			localization_strings = {
				"ndw_morris_daemon_whispers_01",
				"ndw_morris_daemon_whispers_02",
				"ndw_morris_daemon_whispers_03",
				"ndw_morris_daemon_whispers_04",
				"ndw_morris_daemon_whispers_05",
				"ndw_morris_daemon_whispers_06"
			}
		},
		pwe_dr_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_dr_future_five_02"
			},
			sound_events_duration = {
				[1.0] = 3.2289166450501
			}
		},
		pes_es_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_backstory_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.7066874504089
			}
		},
		nik_hub_lohner_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 4.5419793128967
			}
		},
		nik_inventory_reminder = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "hub_conversations",
			sound_events_n = 3,
			category = "npc_talk",
			dialogue_animations_n = 3,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_inventory_reminder_01",
				"nik_inventory_reminder_02",
				"nik_inventory_reminder_03"
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
			}
		},
		pdr_es_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_es_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_es_future_three_02"
			},
			sound_events_duration = {
				[1.0] = 4.2369585037231
			}
		},
		pwe_we_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 6.1680417060852
			}
		},
		pwe_es_backstory_huntsman_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_huntsman_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_es_backstory_huntsman_five_03"
			},
			sound_events_duration = {
				[1.0] = 8.1218338012695
			}
		},
		npp_keep_idle_banter_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "npp_keep_idle_banter_three_01"
			},
			sound_events_duration = {
				[1.0] = 6.7869377136231
			}
		},
		nfl_olesya_weaves_explain = {
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "hub_conversations",
			sound_events_n = 16,
			category = "npc_talk",
			dialogue_animations_n = 16,
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
				"face_neutral"
			},
			randomize_indexes = {},
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
				"dialogue_talk"
			},
			sound_events = {
				"nfl_olesya_weaves_explain_01",
				"nfl_olesya_weaves_explain_02",
				"nfl_olesya_weaves_explain_03",
				"nfl_olesya_weaves_explain_04",
				"nfl_olesya_weaves_explain_05",
				"nfl_olesya_weaves_explain_06",
				"nfl_olesya_weaves_explain_07",
				"nfl_olesya_weaves_explain_08",
				"nfl_olesya_weaves_explain_09",
				"nfl_olesya_weaves_explain_10",
				"nfl_olesya_weaves_explain_11",
				"nfl_olesya_weaves_explain_12",
				"nfl_olesya_weaves_explain_13",
				"nfl_olesya_weaves_explain_14",
				"nfl_olesya_weaves_explain_15",
				"nfl_olesya_weaves_explain_16"
			},
			sound_events_duration = {
				9.4889163970947,
				10.324895858765,
				7.3593125343323,
				4.8972706794739,
				8.0333747863769,
				10.909604072571,
				8.5408544540405,
				9.1458120346069,
				10.084562301636,
				11.508187294006,
				16.373041152954,
				5.5537915229797,
				4.3516874313355,
				11.50452041626,
				8.1889371871948,
				12.100271224976
			},
			localization_strings = {
				"nfl_olesya_weaves_explain_01",
				"nfl_olesya_weaves_explain_02",
				"nfl_olesya_weaves_explain_03",
				"nfl_olesya_weaves_explain_04",
				"nfl_olesya_weaves_explain_05",
				"nfl_olesya_weaves_explain_06",
				"nfl_olesya_weaves_explain_07",
				"nfl_olesya_weaves_explain_08",
				"nfl_olesya_weaves_explain_09",
				"nfl_olesya_weaves_explain_10",
				"nfl_olesya_weaves_explain_11",
				"nfl_olesya_weaves_explain_12",
				"nfl_olesya_weaves_explain_13",
				"nfl_olesya_weaves_explain_14",
				"nfl_olesya_weaves_explain_15",
				"nfl_olesya_weaves_explain_16"
			}
		},
		pwe_es_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_es_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_es_future_four_02"
			},
			sound_events_duration = {
				[1.0] = 0.71164584159851
			}
		},
		nfl_olesya_tutorial_dlc_skittergate_complete = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_olesya_tutorial_dlc_skittergate_complete_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_olesya_tutorial_dlc_skittergate_complete_01"
			},
			sound_events_duration = {
				[1.0] = 11.939812660217
			}
		},
		pwh_dr_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_dr_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_dr_future_two_01"
			},
			sound_events_duration = {
				[1.0] = 6.2033748626709
			}
		},
		pes_we_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_backstory_three_03"
			},
			sound_events_duration = {
				[1.0] = 3.3660416603088
			}
		},
		nik_hub_lohner_conversation_twentyfive_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twentyfive_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twentyfive_01"
			},
			sound_events_duration = {
				[1.0] = 5.1732501983643
			}
		},
		pbw_bw_future_eight_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_eight_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_eight_04"
			},
			sound_events_duration = {
				[1.0] = 5.4011874198914
			}
		},
		pdr_hub_lohner_conversation_ten_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_hub_lohner_conversation_ten_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_hub_lohner_conversation_ten_01"
			},
			sound_events_duration = {
				[1.0] = 2.6898748874664
			}
		},
		pes_fleur_conversation_twenty_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_fleur_conversation_twenty_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_fleur_conversation_twenty_02"
			},
			sound_events_duration = {
				[1.0] = 3.9483749866486
			}
		},
		nfl_debrief_cemetery = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "hub_conversations",
			sound_events_n = 3,
			category = "npc_talk",
			dialogue_animations_n = 3,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
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
			}
		},
		pdr_dr_backstory_three_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_three_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_three_05"
			},
			sound_events_duration = {
				[1.0] = 7.3498539924622
			}
		},
		pes_additional_backstory_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_additional_backstory_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_additional_backstory_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 6.3190417289734
			}
		},
		nfl_debrief_magnus_tower = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "hub_conversations",
			sound_events_n = 3,
			category = "npc_talk",
			dialogue_animations_n = 3,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
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
			}
		},
		pes_hub_lohner_conversation_twentyfive_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_hub_lohner_conversation_twentyfive_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_hub_lohner_conversation_twentyfive_01"
			},
			sound_events_duration = {
				[1.0] = 4.0241770744324
			}
		},
		pes_es_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_three_02"
			},
			sound_events_duration = {
				[1.0] = 3.9951250553131
			}
		},
		pdr_dr_backstory_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_six_01"
			},
			sound_events_duration = {
				[1.0] = 1.9371249675751
			}
		},
		nik_keep_idle_pool_02 = {
			randomize_indexes_n = 0,
			face_animations_n = 17,
			database = "hub_conversations",
			sound_events_n = 17,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 17,
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
				"face_neutral"
			},
			randomize_indexes = {},
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
				"dialogue_talk"
			},
			sound_events = {
				"nik_hub_idle_03",
				"nik_hub_idle_04",
				"nik_hub_idle_06",
				"nik_hub_idle_07",
				"nik_hub_idle_08",
				"nik_hub_idle_09",
				"nik_hub_idle_10",
				"nik_hub_idle_11",
				"nik_hub_idle_12",
				"nik_hub_idle_13",
				"nik_hub_idle_14",
				"nik_hub_idle_15",
				"nik_hub_idle_16",
				"nik_hub_idle_17",
				"nik_hub_idle_18",
				"nik_hub_idle_19",
				"nik_hub_idle_20"
			},
			sound_events_duration = {
				3.2481458187103,
				2.4919791221619,
				6.1250414848328,
				3.2443125247955,
				1.8351249694824,
				4.2249584197998,
				4.999520778656,
				4.9447293281555,
				4.351083278656,
				5.5266876220703,
				3.0822916030884,
				5.9784374237061,
				5.0483956336975,
				7.6319584846497,
				5.18204164505,
				5.1002292633057,
				5.0215835571289
			},
			localization_strings = {
				"nik_hub_idle_03",
				"nik_hub_idle_04",
				"nik_hub_idle_06",
				"nik_hub_idle_07",
				"nik_hub_idle_08",
				"nik_hub_idle_09",
				"nik_hub_idle_10",
				"nik_hub_idle_11",
				"nik_hub_idle_12",
				"nik_hub_idle_13",
				"nik_hub_idle_14",
				"nik_hub_idle_15",
				"nik_hub_idle_16",
				"nik_hub_idle_17",
				"nik_hub_idle_18",
				"nik_hub_idle_19",
				"nik_hub_idle_20"
			}
		},
		pwe_es_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_es_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_es_future_four_03"
			},
			sound_events_duration = {
				[1.0] = 14.252541542053
			}
		},
		pdr_bw_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_bw_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_bw_backstory_one_02"
			},
			sound_events_duration = {
				[1.0] = 1.5335416793823
			}
		},
		pbw_bw_backstory_seven_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 8.9575004577637
			}
		},
		nik_forge = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "hub_conversations",
			sound_events_n = 3,
			category = "npc_talk",
			dialogue_animations_n = 3,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_forge_01",
				"nik_forge_02",
				"nik_forge_03"
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
			}
		},
		pwh_es_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_es_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_es_future_five_02"
			},
			sound_events_duration = {
				[1.0] = 3.0282499790192
			}
		},
		nfl_debrief_war_camp_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_war_camp_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_war_camp_01"
			},
			sound_events_duration = {
				[1.0] = 24.666458129883
			}
		},
		nfl_debrief_nurgle_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_nurgle_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_nurgle_01"
			},
			sound_events_duration = {
				[1.0] = 37.438373565674
			}
		},
		nfl_debrief_ussingen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_ussingen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_ussingen_01"
			},
			sound_events_duration = {
				[1.0] = 47.259853363037
			}
		},
		pdr_additional_backstory_conversation_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_additional_backstory_conversation_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_additional_backstory_conversation_one_03"
			},
			sound_events_duration = {
				[1.0] = 3.9773125648499
			}
		},
		pwe_es_backstory_huntsman_five_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_huntsman_five_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_es_backstory_huntsman_five_05"
			},
			sound_events_duration = {
				[1.0] = 5.2164793014526
			}
		},
		pes_hub_lohner_conversation_twentyone_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_hub_lohner_conversation_twentyone_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_hub_lohner_conversation_twentyone_01"
			},
			sound_events_duration = {
				[1.0] = 2.8297083377838
			}
		},
		nfl_debrief_skaven_stronghold_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_skaven_stronghold_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_skaven_stronghold_01"
			},
			sound_events_duration = {
				[1.0] = 49.58247756958
			}
		},
		nfl_debrief_fort_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_fort_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_fort_01"
			},
			sound_events_duration = {
				[1.0] = 57.82689666748
			}
		},
		pwh_wh_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_backstory_four_03"
			},
			sound_events_duration = {
				[1.0] = 1.2799999713898
			}
		},
		nik_hub_lohner_conversation_eleven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_eleven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_eleven_01"
			},
			sound_events_duration = {
				[1.0] = 5.5886664390564
			}
		},
		pes_we_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_we_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_backstory_three_01"
			},
			sound_events_duration = {
				[1.0] = 1.9007707834244
			}
		},
		nik_hub_lohner_conversation_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 4.7715835571289
			}
		},
		pbw_dr_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_dr_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_dr_future_three_02"
			},
			sound_events_duration = {
				[1.0] = 6.2164793014526
			}
		},
		pbw_hub_lohner_conversation_eleven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_hub_lohner_conversation_eleven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_hub_lohner_conversation_eleven_01"
			},
			sound_events_duration = {
				[1.0] = 5.548312664032
			}
		},
		pwh_hub_lohner_conversation_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_hub_lohner_conversation_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_hub_lohner_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 5.6248126029968
			}
		},
		pwe_wh_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 3.0732917785645
			}
		},
		pbw_bw_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_one_01"
			},
			sound_events_duration = {
				[1.0] = 2.889791727066
			}
		},
		nik_callout_unready_kruber_mercenary = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hub_conversations",
			sound_events_n = 4,
			category = "npc_talk",
			dialogue_animations_n = 4,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_callout_unready_kruber_01",
				"nik_callout_unready_kruber_02",
				"nik_callout_unready_kruber_03",
				"nik_callout_unready_kruber_04"
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
			}
		},
		nik_hub_lohner_conversation_nineteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_nineteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_nineteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.0549583435059
			}
		},
		nfl_debrief_catacombs_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_catacombs_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_catacombs_01"
			},
			sound_events_duration = {
				[1.0] = 61.535915374756
			}
		},
		pwe_hub_lohner_conversation_nineteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_hub_lohner_conversation_nineteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_hub_lohner_conversation_nineteen_01"
			},
			sound_events_duration = {
				[1.0] = 4.8996043205261
			}
		},
		pwh_wh_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_backstory_one_02"
			},
			sound_events_duration = {
				[1.0] = 6.6845831871033
			}
		},
		pes_additional_backstory_conversation_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_additional_backstory_conversation_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_additional_backstory_conversation_one_02"
			},
			sound_events_duration = {
				[1.0] = 23.580604553223
			}
		},
		pdr_additional_backstory_conversation_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_additional_backstory_conversation_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_additional_backstory_conversation_one_02"
			},
			sound_events_duration = {
				[1.0] = 1.9202708005905
			}
		},
		pdr_additional_backstory_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_additional_backstory_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_additional_backstory_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 2.8766875267029
			}
		},
		nik_hub_lohner_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 4.7530627250671
			}
		},
		pes_dr_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_dr_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_dr_future_one_02"
			},
			sound_events_duration = {
				[1.0] = 2.3910000324249
			}
		},
		pdr_dr_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.576708316803
			}
		},
		pes_dr_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_dr_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_dr_future_one_01"
			},
			sound_events_duration = {
				[1.0] = 2.787750005722
			}
		},
		pes_dr_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_dr_backstory_two_02"
			},
			sound_events_duration = {
				[1.0] = 2.0764999389648
			}
		},
		pwh_we_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_we_backstory_four_03"
			},
			sound_events_duration = {
				[1.0] = 1.6020624637604
			}
		},
		pbw_we_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_we_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_we_backstory_four_02"
			},
			sound_events_duration = {
				[1.0] = 2.3203125
			}
		},
		pes_dr_backstory_six_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_six_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_dr_backstory_six_02"
			},
			sound_events_duration = {
				[1.0] = 7.4219584465027
			}
		},
		pes_dr_backstory_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_dr_backstory_six_01"
			},
			sound_events_duration = {
				[1.0] = 2.8023540973663
			}
		},
		pwh_we_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_we_backstory_four_02"
			},
			sound_events_duration = {
				[1.0] = 5.5261039733887
			}
		},
		pbw_we_backstory_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_we_backstory_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_we_backstory_four_01"
			},
			sound_events_duration = {
				[1.0] = 2.3959999084473
			}
		},
		pes_bw_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_bw_backstory_two_02"
			},
			sound_events_duration = {
				[1.0] = 1.9069166183472
			}
		},
		pdr_es_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_es_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_es_future_three_03"
			},
			sound_events_duration = {
				[1.0] = 5.0498957633972
			}
		},
		pbw_es_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_es_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_es_backstory_two_02"
			},
			sound_events_duration = {
				[1.0] = 2.3561458587647
			}
		},
		pes_es_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_backstory_two_01"
			},
			sound_events_duration = {
				[1.0] = 4.4415831565857
			}
		},
		pes_bw_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_bw_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_bw_backstory_two_01"
			},
			sound_events_duration = {
				[1.0] = 2.0785417556763
			}
		},
		pwh_es_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_es_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_es_future_five_01"
			},
			sound_events_duration = {
				[1.0] = 4.4861664772034
			}
		},
		pwh_bw_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 9.5503540039063
			}
		},
		pbw_bw_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 1.3995208740234
			}
		},
		pdr_hub_lohner_conversation_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_hub_lohner_conversation_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_hub_lohner_conversation_eight_01"
			},
			sound_events_duration = {
				[1.0] = 3.1982290744781
			}
		},
		pwh_bw_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 5.830020904541
			}
		},
		pes_es_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 7.544041633606
			}
		},
		pwe_we_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.0916874408722
			}
		},
		nik_keep_idle_banter_three = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "hub_conversations",
			sound_events_n = 2,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_keep_idle_banter_three_01",
				[2.0] = "nik_keep_idle_banter_three_02"
			},
			sound_events_duration = {
				[1.0] = 4.1247916221619,
				[2.0] = 4.086416721344
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_three_01",
				[2.0] = "nik_keep_idle_banter_three_02"
			}
		},
		nik_hub_lohner_conversation_eight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_eight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_eight_01"
			},
			sound_events_duration = {
				[1.0] = 4.5724582672119
			}
		},
		pwe_wh_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 1.9249166250229
			}
		},
		pes_es_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_five_02"
			},
			sound_events_duration = {
				[1.0] = 2.5956873893738
			}
		},
		pdr_wh_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wh_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_wh_backstory_one_03"
			},
			sound_events_duration = {
				[1.0] = 3.2819166183472
			}
		},
		pes_we_future_four_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_we_future_four_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_future_four_04"
			},
			sound_events_duration = {
				[1.0] = 2.884124994278
			}
		},
		pes_wh_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wh_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_wh_backstory_four_03"
			},
			sound_events_duration = {
				[1.0] = 3.3393542766571
			}
		},
		pbw_bw_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.8146874904633
			}
		},
		pdr_dr_future_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_one_03"
			},
			sound_events_duration = {
				[1.0] = 4.1293749809265
			}
		},
		nik_keep_idle_shop = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "hub_conversations",
			sound_events_n = 8,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 8,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
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
				"nik_keep_idle_shop_01",
				"nik_keep_idle_shop_02",
				"nik_keep_idle_shop_03",
				"nik_keep_idle_shop_04",
				"nik_keep_idle_shop_05",
				"nik_keep_idle_shop_06",
				"nik_keep_idle_shop_07",
				"nik_keep_idle_shop_08"
			},
			sound_events_duration = {
				5.4794373512268,
				8.2629165649414,
				5.5589790344238,
				3.1974167823791,
				5.7851042747498,
				3.768354177475,
				6.8426666259766,
				8.7068538665772
			},
			localization_strings = {
				"nik_keep_idle_shop_01",
				"nik_keep_idle_shop_02",
				"nik_keep_idle_shop_03",
				"nik_keep_idle_shop_04",
				"nik_keep_idle_shop_05",
				"nik_keep_idle_shop_06",
				"nik_keep_idle_shop_07",
				"nik_keep_idle_shop_08"
			}
		},
		pwh_es_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 4.8949584960938
			}
		},
		pwe_we_backstory_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.2940833568573
			}
		},
		pdr_bw_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_bw_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_bw_future_three_02"
			},
			sound_events_duration = {
				[1.0] = 1.8327499628067
			}
		},
		pbw_hub_lohner_conversation_thirteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_hub_lohner_conversation_thirteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_hub_lohner_conversation_thirteen_01"
			},
			sound_events_duration = {
				[1.0] = 4.0665001869202
			}
		},
		pwh_wh_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_future_four_02"
			},
			sound_events_duration = {
				[1.0] = 5.1941456794739
			}
		},
		npp_keep_idle_banter_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "npp_keep_idle_banter_two_01"
			},
			sound_events_duration = {
				[1.0] = 4.3284997940064
			}
		},
		pdr_dr_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_four_03"
			},
			sound_events_duration = {
				[1.0] = 2.2918748855591
			}
		},
		pbw_bw_backstory_seven_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 5.6063957214356
			}
		},
		pwe_we_backstory_two_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_two_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_backstory_two_05"
			},
			sound_events_duration = {
				[1.0] = 1.6901667118073
			}
		},
		nik_keep_idle_pool_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 25,
			database = "hub_conversations",
			sound_events_n = 25,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 25,
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
				"face_neutral"
			},
			randomize_indexes = {},
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
				"dialogue_talk"
			},
			sound_events = {
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
				"nik_keep_idle_15",
				"nik_keep_idle_16",
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
			sound_events_duration = {
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
				3.4701249599457,
				3.4403123855591,
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
				"nik_keep_idle_15",
				"nik_keep_idle_16",
				"nik_keep_idle_17",
				"nik_keep_idle_18",
				"nik_keep_idle_19",
				"nik_keep_idle_20",
				"nik_keep_idle_21",
				"nik_keep_idle_22",
				"nik_keep_idle_23",
				"nik_keep_idle_24",
				"nik_keep_idle_25"
			}
		},
		pes_we_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_we_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_future_four_03"
			},
			sound_events_duration = {
				[1.0] = 2.3887708187103
			}
		},
		pes_wh_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wh_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_wh_future_two_03"
			},
			sound_events_duration = {
				[1.0] = 1.6877291202545
			}
		},
		pwh_bw_future_two_033 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_bw_future_two_033"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_bw_future_two_033"
			},
			sound_events_duration = {
				[1.0] = 10.321583747864
			}
		},
		pbw_hub_lohner_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_hub_lohner_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_hub_lohner_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 5.4828333854675
			}
		},
		pdr_dr_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_five_02"
			},
			sound_events_duration = {
				[1.0] = 2.6641874313355
			}
		},
		pbw_bw_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_two_02"
			},
			sound_events_duration = {
				[1.0] = 10.73889541626
			}
		},
		nik_greeting = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_greeting"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_greeting"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			}
		},
		pwh_bw_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_bw_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_bw_future_two_02"
			},
			sound_events_duration = {
				[1.0] = 5.5774374008179
			}
		},
		pdr_bw_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_bw_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_bw_future_three_03"
			},
			sound_events_duration = {
				[1.0] = 5.6233749389648
			}
		},
		pes_wh_backstory_four_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wh_backstory_four_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_wh_backstory_four_05"
			},
			sound_events_duration = {
				[1.0] = 3.2560625076294
			}
		},
		nfl_debrief_bell_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_bell_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_bell_01"
			},
			sound_events_duration = {
				[1.0] = 72.382247924805
			}
		},
		pdr_dr_future_five_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_five_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_five_05"
			},
			sound_events_duration = {
				[1.0] = 2.7241041660309
			}
		},
		pwh_wh_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_backstory_four_02"
			},
			sound_events_duration = {
				[1.0] = 4.4080414772034
			}
		},
		pes_es_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_es_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_five_01"
			},
			sound_events_duration = {
				[1.0] = 4.8579792976379
			}
		},
		pdr_dr_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_one_02"
			},
			sound_events_duration = {
				[1.0] = 3.8601458072662
			}
		},
		pwe_we_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 3.344583272934
			}
		},
		pwe_bw_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_bw_future_four_03"
			},
			sound_events_duration = {
				[1.0] = 4.3313751220703
			}
		},
		pwe_dr_future_five_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_dr_future_five_06"
			},
			sound_events_duration = {
				[1.0] = 7.289562702179
			}
		},
		pdr_dr_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_one_01"
			},
			sound_events_duration = {
				[1.0] = 3.8273124694824
			}
		},
		pwe_we_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_one_02"
			},
			sound_events_duration = {
				[1.0] = 8.2357292175293
			}
		},
		pbw_bw_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.5926041603088
			}
		},
		nik_callout_unready_sienna = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "hub_conversations",
			sound_events_n = 2,
			category = "npc_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_callout_unready_sienna_03",
				[2.0] = "nik_callout_unready_sienna_04"
			},
			sound_events_duration = {
				[1.0] = 9.9128541946411,
				[2.0] = 9.4418754577637
			},
			localization_strings = {
				[1.0] = "nik_callout_unready_sienna_03",
				[2.0] = "nik_callout_unready_sienna_04"
			}
		},
		pbw_es_future_one_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_es_future_one_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_es_future_one_04"
			},
			sound_events_duration = {
				[1.0] = 1.8970416784286
			}
		},
		nik_hub_lohner_conversation_twelve_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twelve_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twelve_01"
			},
			sound_events_duration = {
				[1.0] = 5.4521460533142
			}
		},
		pwe_es_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_es_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_es_future_four_01"
			},
			sound_events_duration = {
				[1.0] = 5.585916519165
			}
		},
		pes_es_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_one_02"
			},
			sound_events_duration = {
				[1.0] = 8.8698749542236
			}
		},
		pwe_bw_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_bw_future_four_02"
			},
			sound_events_duration = {
				[1.0] = 3.0803124904633
			}
		},
		pbw_bw_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_four_01"
			},
			sound_events_duration = {
				[1.0] = 3.9505832195282
			}
		},
		pwe_bw_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_bw_future_four_01"
			},
			sound_events_duration = {
				[1.0] = 4.2332291603088
			}
		},
		pbw_bw_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_four_02"
			},
			sound_events_duration = {
				[1.0] = 4.330500125885
			}
		},
		pwh_we_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_we_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_we_future_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.0906457901001
			}
		},
		pwh_we_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_we_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_we_future_one_01"
			},
			sound_events_duration = {
				[1.0] = 3.669145822525
			}
		},
		pes_dr_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_dr_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_dr_future_four_02"
			},
			sound_events_duration = {
				[1.0] = 8.5366146564484
			}
		},
		pbw_bw_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 8.2277498245239
			}
		},
		pdr_dr_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_four_02"
			},
			sound_events_duration = {
				[1.0] = 6.0908331871033
			}
		},
		pes_bw_backstory_seven_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 1.9123333692551
			}
		},
		pdr_dr_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_four_01"
			},
			sound_events_duration = {
				[1.0] = 4.1123542785644
			}
		},
		pdr_bw_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_bw_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_bw_backstory_one_03"
			},
			sound_events_duration = {
				[1.0] = 2.3948750495911
			}
		},
		pdr_dr_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_three_02"
			},
			sound_events_duration = {
				[1.0] = 6.2361874580383
			}
		},
		pwe_dr_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_dr_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_dr_backstory_four_02"
			},
			sound_events_duration = {
				[1.0] = 6.468249797821
			}
		},
		pwe_bw_backstory_six_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_bw_backstory_six_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_bw_backstory_six_06"
			},
			sound_events_duration = {
				[1.0] = 6.2941040992737
			}
		},
		pdr_dr_backstory_six_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_six_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_six_03"
			},
			sound_events_duration = {
				[1.0] = 4.8500623703003
			}
		},
		pwe_bw_backstory_six_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_bw_backstory_six_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_bw_backstory_six_04"
			},
			sound_events_duration = {
				[1.0] = 9.3888330459595
			}
		},
		pdr_bw_future_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_bw_future_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_bw_future_three_04"
			},
			sound_events_duration = {
				[1.0] = 2.4998540878296
			}
		},
		pbw_bw_future_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_one_03"
			},
			sound_events_duration = {
				[1.0] = 6.0515418052673
			}
		},
		pdr_hub_lohner_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_hub_lohner_conversation_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_hub_lohner_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 3.5387499332428
			}
		},
		pdr_dr_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_four_02"
			},
			sound_events_duration = {
				[1.0] = 2.0668749809265
			}
		},
		pdr_bw_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_bw_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_bw_backstory_one_01"
			},
			sound_events_duration = {
				[1.0] = 3.0273332595825
			}
		},
		nik_hub_lohner_conversation_seven_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_seven_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_seven_01"
			},
			sound_events_duration = {
				[1.0] = 5.1822290420532
			}
		},
		pbw_fleur_conversation_twenty_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_fleur_conversation_twenty_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_fleur_conversation_twenty_01"
			},
			sound_events_duration = {
				[1.0] = 5.2492289543152
			}
		},
		nik_greeting_halloween = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hub_conversations",
			sound_events_n = 4,
			category = "npc_talk",
			dialogue_animations_n = 4,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_hub_event_geheimnisnacht_01",
				"nik_hub_event_geheimnisnacht_02",
				"nik_hub_event_geheimnisnacht_03",
				"nik_hub_event_geheimnisnacht_04"
			},
			sound_events_duration = {
				6.9875416755676,
				4.6539373397827,
				6.7383127212524,
				10.055396080017
			},
			localization_strings = {
				"nik_hub_event_geheimnisnacht_01",
				"nik_hub_event_geheimnisnacht_02",
				"nik_hub_event_geheimnisnacht_03",
				"nik_hub_event_geheimnisnacht_04"
			}
		},
		nik_hub_lohner_conversation_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 4.5058751106262
			}
		},
		nik_hub_lohner_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 4.1797914505005
			}
		},
		pes_we_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_we_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_future_four_01"
			},
			sound_events_duration = {
				[1.0] = 5.0847916603088
			}
		},
		pwh_es_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 5.2699375152588
			}
		},
		pwe_dr_backstory_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_dr_backstory_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_dr_backstory_four_01"
			},
			sound_events_duration = {
				[1.0] = 6.0270209312439
			}
		},
		pbw_dr_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_dr_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_dr_backstory_three_03"
			},
			sound_events_duration = {
				[1.0] = 1.8071666955948
			}
		},
		pdr_dr_backstory_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_five_03"
			},
			sound_events_duration = {
				[1.0] = 5.1925415992737
			}
		},
		nik_fleur_conversation_twenty_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_fleur_conversation_twenty_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_fleur_conversation_twenty_01"
			},
			sound_events_duration = {
				[1.0] = 2.6505208015442
			}
		},
		pes_bw_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_bw_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_bw_future_one_02"
			},
			sound_events_duration = {
				[1.0] = 1.2758749723434
			}
		},
		pwh_wh_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_future_two_02"
			},
			sound_events_duration = {
				[1.0] = 0.88927084207535
			}
		},
		pes_es_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_two_03"
			},
			sound_events_duration = {
				[1.0] = 2.4137916564941
			}
		},
		pdr_dr_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_four_03"
			},
			sound_events_duration = {
				[1.0] = 2.7201459407806
			}
		},
		pwe_dr_backstory_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_dr_backstory_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_dr_backstory_four_03"
			},
			sound_events_duration = {
				[1.0] = 1.8121458292007
			}
		},
		pes_dr_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_dr_backstory_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_dr_backstory_five_01"
			},
			sound_events_duration = {
				[1.0] = 5.917854309082
			}
		},
		pdr_dr_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_two_03"
			},
			sound_events_duration = {
				[1.0] = 2.701354265213
			}
		},
		pwh_wh_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.2073957920074
			}
		},
		pbw_hub_lohner_conversation_fifteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_hub_lohner_conversation_fifteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_hub_lohner_conversation_fifteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.9630208015442
			}
		},
		nik_greeting_rainy = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "hub_conversations",
			sound_events_n = 3,
			category = "npc_talk",
			dialogue_animations_n = 3,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_hub_greeting_rainy_24",
				"nik_hub_greeting_rainy_25",
				"nik_hub_greeting_rainy_26"
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
			}
		},
		pes_es_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_backstory_two_02"
			},
			sound_events_duration = {
				[1.0] = 9.6743955612183
			}
		},
		pes_es_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_three_03"
			},
			sound_events_duration = {
				[1.0] = 0.94120836257935
			}
		},
		pes_bw_backstory_seven_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 0.87479168176651
			}
		},
		pdr_we_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_we_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_we_future_three_02"
			},
			sound_events_duration = {
				[1.0] = 2.1272916793823
			}
		},
		pbw_dr_backstory_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_dr_backstory_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_dr_backstory_three_04"
			},
			sound_events_duration = {
				[1.0] = 2.282562494278
			}
		},
		pwe_we_backstory_two_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_two_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_backstory_two_06"
			},
			sound_events_duration = {
				[1.0] = 6.1117706298828
			}
		},
		pwe_hub_lohner_conversation_sixteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_hub_lohner_conversation_sixteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_hub_lohner_conversation_sixteen_01"
			},
			sound_events_duration = {
				[1.0] = 4.0502500534058
			}
		},
		pdr_we_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_we_backstory_three_01"
			},
			sound_events_duration = {
				[1.0] = 2.764312505722
			}
		},
		nik_hub_lohner_conversation_thirteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_thirteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_thirteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.1409997940064
			}
		},
		pwe_we_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_four_03"
			},
			sound_events_duration = {
				[1.0] = 4.0990834236145
			}
		},
		pes_es_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_es_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_three_01"
			},
			sound_events_duration = {
				[1.0] = 3.3369791507721
			}
		},
		pes_we_backstory_three_05 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hub_conversations",
			sound_events_n = 4,
			category = "story_talk_keep",
			dialogue_animations_n = 4,
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"pes_we_backstory_three_05",
				"pes_we_backstory_three_05_1",
				"pes_we_backstory_three_05_2",
				"pes_we_backstory_three_05_3"
			},
			sound_events_duration = {
				2.890145778656,
				4.1955623626709,
				4.3738956451416,
				3.752729177475
			},
			localization_strings = {
				"pes_we_backstory_three_05",
				"pes_we_backstory_three_05_1",
				"pes_we_backstory_three_05_2",
				"pes_we_backstory_three_05_3"
			}
		},
		pdr_we_backstory_three_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_three_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_we_backstory_three_04"
			},
			sound_events_duration = {
				[1.0] = 6.4841666221619
			}
		},
		pdr_we_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_we_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_we_backstory_three_03"
			},
			sound_events_duration = {
				[1.0] = 4.8474998474121
			}
		},
		nfl_debrief_plaza = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "hub_conversations",
			sound_events_n = 3,
			category = "npc_talk",
			dialogue_animations_n = 3,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
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
			}
		},
		nfl_debrief_elven_ruins_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_elven_ruins_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_elven_ruins_01"
			},
			sound_events_duration = {
				[1.0] = 82.643623352051
			}
		},
		pbw_bw_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_one_01"
			},
			sound_events_duration = {
				[1.0] = 6.6494793891907
			}
		},
		pwh_bw_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_bw_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_bw_future_two_01"
			},
			sound_events_duration = {
				[1.0] = 5.4087710380554
			}
		},
		pdr_dr_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_two_01"
			},
			sound_events_duration = {
				[1.0] = 9.0542707443237
			}
		},
		pbw_bw_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_three_03"
			},
			sound_events_duration = {
				[1.0] = 5.8533124923706
			}
		},
		pbw_bw_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_three_02"
			},
			sound_events_duration = {
				[1.0] = 5.6367292404175
			}
		},
		pdr_dr_backstory_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_four_01"
			},
			sound_events_duration = {
				[1.0] = 3.3679165840149
			}
		},
		pdr_we_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 3.228354215622
			}
		},
		pdr_dr_future_five_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_five_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_five_04"
			},
			sound_events_duration = {
				[1.0] = 2.4826250076294
			}
		},
		pwe_es_backstory_huntsman_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_huntsman_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_es_backstory_huntsman_five_01"
			},
			sound_events_duration = {
				[1.0] = 7.2450833320618
			}
		},
		pwe_bw_backstory_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_bw_backstory_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_bw_backstory_four_02"
			},
			sound_events_duration = {
				[1.0] = 5.3081459999084
			}
		},
		pdr_dr_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_five_02"
			},
			sound_events_duration = {
				[1.0] = 3.7408957481384
			}
		},
		pbw_wh_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_wh_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_wh_future_three_01"
			},
			sound_events_duration = {
				[1.0] = 2.8291873931885
			}
		},
		pdr_dr_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_two_01"
			},
			sound_events_duration = {
				[1.0] = 6.3938331604004
			}
		},
		pwh_es_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_es_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_es_future_two_02"
			},
			sound_events_duration = {
				[1.0] = 7.8720626831055
			}
		},
		nfl_debrief_forest_ambush = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "hub_conversations",
			sound_events_n = 3,
			category = "npc_talk",
			dialogue_animations_n = 3,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nfl_holly_level_debriefing_01",
				"nfl_holly_level_debriefing_02",
				"nfl_holly_level_debriefing_03"
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
			}
		},
		pwh_es_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_es_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_es_future_two_01"
			},
			sound_events_duration = {
				[1.0] = 4.1514372825623
			}
		},
		pdr_dr_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_one_01"
			},
			sound_events_duration = {
				[1.0] = 2.6263749599457
			}
		},
		nik_hub_welcome = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_welcome_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_welcome_01"
			},
			sound_events_duration = {
				[1.0] = 38.688293457031
			}
		},
		pbw_es_future_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_es_future_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_es_future_one_01"
			},
			sound_events_duration = {
				[1.0] = 4.362208366394
			}
		},
		pbw_bw_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 10.121083259583
			}
		},
		pwh_wh_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 4.570291519165
			}
		},
		pes_hub_lohner_conversation_twentyfour_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_hub_lohner_conversation_twentyfour_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_hub_lohner_conversation_twentyfour_01"
			},
			sound_events_duration = {
				[1.0] = 4.7850208282471
			}
		},
		pbw_bw_future_eight_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_eight_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_eight_03"
			},
			sound_events_duration = {
				[1.0] = 3.8774583339691
			}
		},
		pdr_bw_backstory_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 3.4642915725708
			}
		},
		pdr_dr_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_three_02"
			},
			sound_events_duration = {
				[1.0] = 2.2327499389648
			}
		},
		nik_hub_the_plan = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk_interrupt",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_the_plan_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_the_plan_01"
			},
			sound_events_duration = {
				[1.0] = 49.661895751953
			}
		},
		pwe_wh_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wh_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_wh_future_three_02"
			},
			sound_events_duration = {
				[1.0] = 5.5694789886475
			}
		},
		pbw_wh_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wh_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_wh_future_three_02"
			},
			sound_events_duration = {
				[1.0] = 1.3696041107178
			}
		},
		pbw_bw_future_five_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_five_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_five_04"
			},
			sound_events_duration = {
				[1.0] = 2.6497082710266
			}
		},
		nik_hub_lohner_conversation_twentyfour_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twentyfour_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twentyfour_01"
			},
			sound_events_duration = {
				[1.0] = 4.5275001525879
			}
		},
		pwe_bw_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_bw_future_five_03"
			},
			sound_events_duration = {
				[1.0] = 2.8516459465027
			}
		},
		pwe_bw_future_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_bw_future_five_02"
			},
			sound_events_duration = {
				[1.0] = 3.265145778656
			}
		},
		pes_es_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_two_02"
			},
			sound_events_duration = {
				[1.0] = 3.5077290534973
			}
		},
		pdr_wh_future_four_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wh_future_four_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_wh_future_four_03"
			},
			sound_events_duration = {
				[1.0] = 5.3561043739319
			}
		},
		pdr_dr_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_two_02"
			},
			sound_events_duration = {
				[1.0] = 5.1294374465942
			}
		},
		pwe_we_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.1905832290649
			}
		},
		pes_hub_lohner_conversation_twentytwo_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_hub_lohner_conversation_twentytwo_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_hub_lohner_conversation_twentytwo_01"
			},
			sound_events_duration = {
				[1.0] = 3.2580416202545
			}
		},
		pbw_bw_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_three_01"
			},
			sound_events_duration = {
				[1.0] = 4.4375834465027
			}
		},
		pdr_wh_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_wh_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_wh_future_four_01"
			},
			sound_events_duration = {
				[1.0] = 3.3829998970032
			}
		},
		nik_greeting_evening = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "hub_conversations",
			sound_events_n = 3,
			category = "npc_talk",
			dialogue_animations_n = 3,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_hub_greeting_evening_30",
				"nik_hub_greeting_evening_31",
				"nik_hub_greeting_evening_32"
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
			}
		},
		nik_hub_lohner_conversation_twentytwo_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twentytwo_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twentytwo_01"
			},
			sound_events_duration = {
				[1.0] = 1.9415625333786
			}
		},
		pes_es_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_five_03"
			},
			sound_events_duration = {
				[1.0] = 2.4843125343323
			}
		},
		nik_keep_idle_banter_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_keep_idle_banter_four_02"
			},
			sound_events_duration = {
				[1.0] = 2.1288957595825
			}
		},
		pwe_we_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_two_01"
			},
			sound_events_duration = {
				[1.0] = 2.775687456131
			}
		},
		pwh_wh_backstory_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 10.645041465759
			}
		},
		pwe_we_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_four_01"
			},
			sound_events_duration = {
				[1.0] = 2.1357707977295
			}
		},
		pwe_dr_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_dr_backstory_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_dr_backstory_one_03"
			},
			sound_events_duration = {
				[1.0] = 3.7597708702087
			}
		},
		pdr_wh_backstory_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_wh_backstory_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_wh_backstory_one_01"
			},
			sound_events_duration = {
				[1.0] = 5.6310625076294
			}
		},
		pes_we_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_we_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_future_two_01"
			},
			sound_events_duration = {
				[1.0] = 5.7257709503174
			}
		},
		pes_we_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_we_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_future_four_02"
			},
			sound_events_duration = {
				[1.0] = 2.0525832176209
			}
		},
		ndw_morris_daemon_whispers_hub_kerillian = {
			intended_player_profile = "wood_elf",
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "hub_conversations",
			sound_events_n = 6,
			category = "story_talk_keep",
			dialogue_animations_n = 6,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"ndw_morris_daemon_whispers_19",
				"ndw_morris_daemon_whispers_20",
				"ndw_morris_daemon_whispers_21",
				"ndw_morris_daemon_whispers_22",
				"ndw_morris_daemon_whispers_23",
				"ndw_morris_daemon_whispers_24"
			},
			sound_events_duration = {
				6.9955329895019,
				6.3398637771606,
				6.9110884666443,
				10.011269569397,
				11.321927070618,
				10.094920158386
			},
			localization_strings = {
				"ndw_morris_daemon_whispers_19",
				"ndw_morris_daemon_whispers_20",
				"ndw_morris_daemon_whispers_21",
				"ndw_morris_daemon_whispers_22",
				"ndw_morris_daemon_whispers_23",
				"ndw_morris_daemon_whispers_24"
			}
		},
		pes_es_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_two_01"
			},
			sound_events_duration = {
				[1.0] = 3.4297499656677
			}
		},
		pwe_we_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_two_02"
			},
			sound_events_duration = {
				[1.0] = 6.2570624351502
			}
		},
		pes_es_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_four_01"
			},
			sound_events_duration = {
				[1.0] = 5.4383749961853
			}
		},
		pwe_es_future_four_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_es_future_four_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_es_future_four_04"
			},
			sound_events_duration = {
				[1.0] = 2.3715207576752
			}
		},
		pes_es_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 6.4248957633972
			}
		},
		pes_we_future_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_we_future_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_we_future_two_02"
			},
			sound_events_duration = {
				[1.0] = 3.0545833110809
			}
		},
		nik_callout_unready_kruber = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "hub_conversations",
			sound_events_n = 3,
			category = "npc_talk",
			dialogue_animations_n = 3,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_callout_unready_kruber_01",
				"nik_callout_unready_kruber_03",
				"nik_callout_unready_kruber_04"
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
			}
		},
		pbw_bw_backstory_six_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_six_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_six_03"
			},
			sound_events_duration = {
				[1.0] = 7.8426251411438
			}
		},
		nik_hub_store_first_time = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_store_onboarding_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_store_onboarding_01"
			},
			sound_events_duration = {
				[1.0] = 13.155421257019
			}
		},
		pwe_we_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.8041458129883
			}
		},
		pbw_we_backstory_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 1.6452708244324
			}
		},
		pbw_bw_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_five_01"
			},
			sound_events_duration = {
				[1.0] = 8.1498336791992
			}
		},
		nik_hub_okri_grudge = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "hub_conversations",
			sound_events_n = 10,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 10,
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
			randomize_indexes = {},
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
			sound_events = {
				"nik_hub_okri_grudge_01",
				"nik_hub_okri_grudge_02",
				"nik_hub_okri_grudge_03",
				"nik_hub_okri_grudge_04",
				"nik_hub_okri_grudge_05",
				"nik_hub_okri_grudge_06",
				"nik_hub_okri_grudge_07",
				"nik_hub_okri_grudge_08",
				"nik_hub_okri_grudge_09",
				"nik_hub_okri_grudge_10"
			},
			sound_events_duration = {
				3.5900208950043,
				5.1087918281555,
				4.2502918243408,
				3.0745625495911,
				3.6684999465942,
				6.5011043548584,
				3.4041249752045,
				4.9919791221619,
				4.6316666603088,
				7.1039581298828
			},
			localization_strings = {
				"nik_hub_okri_grudge_01",
				"nik_hub_okri_grudge_02",
				"nik_hub_okri_grudge_03",
				"nik_hub_okri_grudge_04",
				"nik_hub_okri_grudge_05",
				"nik_hub_okri_grudge_06",
				"nik_hub_okri_grudge_07",
				"nik_hub_okri_grudge_08",
				"nik_hub_okri_grudge_09",
				"nik_hub_okri_grudge_10"
			}
		},
		pwh_wh_future_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_future_one_03"
			},
			sound_events_duration = {
				[1.0] = 6.6239166259766
			}
		},
		nfl_debrief_farmland_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_farmland_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_farmland_01"
			},
			sound_events_duration = {
				[1.0] = 52.099769592285
			}
		},
		pwe_wh_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_wh_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_wh_future_three_01"
			},
			sound_events_duration = {
				[1.0] = 6.4599585533142
			}
		},
		pbw_dr_future_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_dr_future_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_dr_future_four_01"
			},
			sound_events_duration = {
				[1.0] = 2.3583750724792
			}
		},
		nfl_debrief_ground_zero_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_debrief_ground_zero_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_debrief_ground_zero_01"
			},
			sound_events_duration = {
				[1.0] = 36.859519958496
			}
		},
		pdr_es_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_es_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_es_future_three_01"
			},
			sound_events_duration = {
				[1.0] = 5.8196668624878
			}
		},
		pwh_hub_lohner_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_hub_lohner_conversation_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_hub_lohner_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 6.4116044044495
			}
		},
		pes_fleur_conversation_eighteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_fleur_conversation_eighteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_fleur_conversation_eighteen_01"
			},
			sound_events_duration = {
				[1.0] = 4.4650831222534
			}
		},
		pwe_hub_lohner_conversation_eigthteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_hub_lohner_conversation_eigthteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_hub_lohner_conversation_eigthteen_01"
			},
			sound_events_duration = {
				[1.0] = 4.0511040687561
			}
		},
		pwe_bw_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_bw_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_bw_future_five_01"
			},
			sound_events_duration = {
				[1.0] = 3.4184999465942
			}
		},
		nik_fleur_conversation_eighteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_fleur_conversation_eighteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_fleur_conversation_eighteen_01"
			},
			sound_events_duration = {
				[1.0] = 3.7312083244324
			}
		},
		pes_es_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_future_four_02"
			},
			sound_events_duration = {
				[1.0] = 8.4341249465942
			}
		},
		pdr_we_backstory_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 1.376416683197
			}
		},
		pbw_bw_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_two_01"
			},
			sound_events_duration = {
				[1.0] = 5.1261458396912
			}
		},
		pdr_we_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 4.7444581985474
			}
		},
		pes_wh_future_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wh_future_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_wh_future_one_03"
			},
			sound_events_duration = {
				[1.0] = 1.9271458387375
			}
		},
		nik_hub_lohner_conversation_seventeen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_seventeen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_seventeen_01"
			},
			sound_events_duration = {
				[1.0] = 4.7351875305176
			}
		},
		pwh_bw_future_eight_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_bw_future_eight_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_bw_future_eight_03"
			},
			sound_events_duration = {
				[1.0] = 8.6923332214356
			}
		},
		nik_hub_lohner_conversation_sixteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_sixteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_sixteen_01"
			},
			sound_events_duration = {
				[1.0] = 5.5921249389648
			}
		},
		pwh_we_backstory_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 3.8466665744781
			}
		},
		pes_fleur_conversation_nineteen_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_fleur_conversation_nineteen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_fleur_conversation_nineteen_02"
			},
			sound_events_duration = {
				[1.0] = 5.5476040840149
			}
		},
		nik_keep_idle_banter_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_keep_idle_banter_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_keep_idle_banter_one_01"
			},
			sound_events_duration = {
				[1.0] = 3.1756875514984
			}
		},
		pwh_hub_lohner_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_hub_lohner_conversation_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_hub_lohner_conversation_four_01"
			},
			sound_events_duration = {
				[1.0] = 9.840895652771
			}
		},
		nik_hub_lohner_conversation_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_five_01"
			},
			sound_events_duration = {
				[1.0] = 4.5042085647583
			}
		},
		pbw_we_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_we_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_we_future_five_01"
			},
			sound_events_duration = {
				[1.0] = 4.7907915115356
			}
		},
		pbw_bw_backstory_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.1752707958221
			}
		},
		pes_es_backstory_huntsman_five_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_huntsman_five_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_backstory_huntsman_five_04"
			},
			sound_events_duration = {
				[1.0] = 7.5134582519531
			}
		},
		pdr_bw_backstory_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.229875087738
			}
		},
		pes_es_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 4.1442289352417
			}
		},
		pdr_dr_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_five_03"
			},
			sound_events_duration = {
				[1.0] = 1.2749999761581
			}
		},
		pes_es_backstory_huntsman_five_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_es_backstory_huntsman_five_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_es_backstory_huntsman_five_02"
			},
			sound_events_duration = {
				[1.0] = 3.8426249027252
			}
		},
		pdr_hub_lohner_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_hub_lohner_conversation_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_hub_lohner_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 8.7674579620361
			}
		},
		pwh_we_backstory_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.246333360672
			}
		},
		pes_fleur_conversation_twenty_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_fleur_conversation_twenty_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_fleur_conversation_twenty_01"
			},
			sound_events_duration = {
				[1.0] = 4.3840832710266
			}
		},
		pwh_we_backstory_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 5.0313749313355
			}
		},
		pwe_dr_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_dr_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_dr_future_five_03"
			},
			sound_events_duration = {
				[1.0] = 4.9703540802002
			}
		},
		pwe_fleur_conversation_eighteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_fleur_conversation_eighteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_fleur_conversation_eighteen_01"
			},
			sound_events_duration = {
				[1.0] = 3.0281667709351
			}
		},
		nik_intro_forge_reminder = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "hub_conversations",
			sound_events_n = 2,
			category = "npc_talk",
			dialogue_animations_n = 2,
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_intro_forge_reminder_01",
				[2.0] = "nik_intro_forge_reminder_02"
			},
			sound_events_duration = {
				[1.0] = 3.1456458568573,
				[2.0] = 2.2395417690277
			},
			localization_strings = {
				[1.0] = "nik_intro_forge_reminder_01",
				[2.0] = "nik_intro_forge_reminder_02"
			}
		},
		nik_hub_backstory_interaction = {
			randomize_indexes_n = 0,
			face_animations_n = 20,
			database = "hub_conversations",
			sound_events_n = 20,
			category = "npc_talk",
			dialogue_animations_n = 20,
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
				"face_neutral"
			},
			randomize_indexes = {},
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
				"dialogue_talk"
			},
			sound_events = {
				"nik_keep_endtimes_12",
				"nik_keep_endtimes_13",
				"nik_keep_endtimes_14",
				"nik_keep_endtimes_15",
				"nik_keep_endtimes_16",
				"nik_keep_endtimes_17",
				"nik_keep_endtimes_18",
				"nik_keep_endtimes_19",
				"nik_keep_endtimes_20",
				"nik_keep_endtimes_01",
				"nik_keep_endtimes_02",
				"nik_keep_endtimes_03",
				"nik_keep_endtimes_04",
				"nik_keep_endtimes_05",
				"nik_keep_endtimes_06",
				"nik_keep_endtimes_07",
				"nik_keep_endtimes_08",
				"nik_keep_endtimes_09",
				"nik_keep_endtimes_10",
				"nik_keep_endtimes_11"
			},
			sound_events_duration = {
				6.7096042633057,
				9.9928541183472,
				7.9246249198914,
				11.810020446777,
				8.2530002593994,
				7.7996459007263,
				6.5647292137146,
				9.6796455383301,
				9.1075620651245,
				12.651082992554,
				8.0274162292481,
				8.8123121261597,
				9.9306039810181,
				7.1796250343323,
				10.061666488648,
				8.7913961410522,
				9.5934791564941,
				5.8461875915527,
				7.9879374504089,
				7.8400206565857
			},
			localization_strings = {
				"nik_keep_endtimes_12",
				"nik_keep_endtimes_13",
				"nik_keep_endtimes_14",
				"nik_keep_endtimes_15",
				"nik_keep_endtimes_16",
				"nik_keep_endtimes_17",
				"nik_keep_endtimes_18",
				"nik_keep_endtimes_19",
				"nik_keep_endtimes_20",
				"nik_keep_endtimes_01",
				"nik_keep_endtimes_02",
				"nik_keep_endtimes_03",
				"nik_keep_endtimes_04",
				"nik_keep_endtimes_05",
				"nik_keep_endtimes_06",
				"nik_keep_endtimes_07",
				"nik_keep_endtimes_08",
				"nik_keep_endtimes_09",
				"nik_keep_endtimes_10",
				"nik_keep_endtimes_11"
			}
		},
		nik_hub_lohner_conversation_nine_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_nine_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_nine_01"
			},
			sound_events_duration = {
				[1.0] = 3.787166595459
			}
		},
		pdr_hub_lohner_conversation_six_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_hub_lohner_conversation_six_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_hub_lohner_conversation_six_01"
			},
			sound_events_duration = {
				[1.0] = 2.3779165744781
			}
		},
		npp_keep_idle_banter_four = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "npp_keep_idle_banter_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "npp_keep_idle_banter_four_01"
			},
			sound_events_duration = {
				[1.0] = 8.0226459503174
			}
		},
		pdr_dr_future_five_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_five_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_five_01"
			},
			sound_events_duration = {
				[1.0] = 4.0141043663025
			}
		},
		pdr_wh_future_four_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_wh_future_four_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_wh_future_four_02"
			},
			sound_events_duration = {
				[1.0] = 5.719250202179
			}
		},
		pes_wh_future_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_wh_future_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_wh_future_two_04"
			},
			sound_events_duration = {
				[1.0] = 1.5171458721161
			}
		},
		pbw_hub_lohner_conversation_fourteen_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_hub_lohner_conversation_fourteen_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_hub_lohner_conversation_fourteen_01"
			},
			sound_events_duration = {
				[1.0] = 2.3364791870117
			}
		},
		pwh_wh_future_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_future_two_03"
			},
			sound_events_duration = {
				[1.0] = 7.5401248931885
			}
		},
		pes_hub_lohner_conversation_twentythree_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_hub_lohner_conversation_twentythree_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_hub_lohner_conversation_twentythree_01"
			},
			sound_events_duration = {
				[1.0] = 4.111750125885
			}
		},
		pes_wh_future_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_wh_future_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_wh_future_two_01"
			},
			sound_events_duration = {
				[1.0] = 5.0392084121704
			}
		},
		pbw_bw_future_five_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_future_five_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_future_five_03"
			},
			sound_events_duration = {
				[1.0] = 0.84539586305618
			}
		},
		pbw_bw_backstory_six_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_bw_backstory_six_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_bw_backstory_six_05"
			},
			sound_events_duration = {
				[1.0] = 4.5706667900085
			}
		},
		nik_hub_lohner_conversation_twentythree_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twentythree_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twentythree_01"
			},
			sound_events_duration = {
				[1.0] = 5.3969793319702
			}
		},
		pwe_es_backstory_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_es_backstory_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_es_backstory_one_02"
			},
			sound_events_duration = {
				[1.0] = 2.5869998931885
			}
		},
		pes_bw_future_one_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_bw_future_one_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pes_bw_future_one_03"
			},
			sound_events_duration = {
				[1.0] = 2.2734167575836
			}
		},
		pwe_wh_backstory_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 2.4274582862854
			}
		},
		nik_hub_lohner_conversation_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_two_01"
			},
			sound_events_duration = {
				[1.0] = 6.0409374237061
			}
		},
		pbw_dr_backstory_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_dr_backstory_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_dr_backstory_three_01"
			},
			sound_events_duration = {
				[1.0] = 6.1755208969116
			}
		},
		pwh_we_backstory_four_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_we_backstory_four_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_we_backstory_four_01"
			},
			sound_events_duration = {
				[1.0] = 2.5217082500458
			}
		},
		pbw_wh_future_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wh_future_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_wh_future_three_03"
			},
			sound_events_duration = {
				[1.0] = 7.2298126220703
			}
		},
		pbw_dr_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_dr_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pbw_dr_future_three_01"
			},
			sound_events_duration = {
				[1.0] = 1.6533124446869
			}
		},
		nik_hub_lohner_conversation_twentyone_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			sound_distance = 20,
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nik_hub_lohner_conversation_twentyone_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nik_hub_lohner_conversation_twentyone_01"
			},
			sound_events_duration = {
				[1.0] = 6.0775418281555
			}
		},
		pdr_dr_future_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_dr_future_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_future_three_01"
			},
			sound_events_duration = {
				[1.0] = 4.2052292823792
			}
		},
		pwe_we_backstory_two_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_backstory_two_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_backstory_two_04"
			},
			sound_events_duration = {
				[1.0] = 2.6607291698456
			}
		},
		pwh_hub_lohner_conversation_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_hub_lohner_conversation_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_hub_lohner_conversation_one_01"
			},
			sound_events_duration = {
				[1.0] = 5.7972083091736
			}
		},
		pdr_dr_backstory_three_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_dr_backstory_three_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pdr_dr_backstory_three_03"
			},
			sound_events_duration = {
				[1.0] = 3.8887708187103
			}
		},
		pwe_we_future_three_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwe_we_future_three_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwe_we_future_three_02"
			},
			sound_events_duration = {
				[1.0] = 4.3235416412353
			}
		},
		pwh_wh_future_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_wh_future_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_wh_future_one_02"
			},
			sound_events_duration = {
				[1.0] = 5.7812085151672
			}
		},
		nik_greeting_night = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "hub_conversations",
			sound_events_n = 3,
			category = "npc_talk",
			dialogue_animations_n = 3,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_hub_greeting_night_27",
				"nik_hub_greeting_night_28",
				"nik_hub_greeting_night_29"
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
			}
		},
		nfl_olesya_tutorial_dlc_no_skittergate = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "npc_talk",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "nfl_olesya_tutorial_dlc_no_skittergate_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "nfl_olesya_tutorial_dlc_no_skittergate_01"
			},
			sound_events_duration = {
				[1.0] = 13.643208503723
			}
		},
		pwh_bw_future_eight_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_bw_future_eight_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_bw_future_eight_04"
			},
			sound_events_duration = {
				[1.0] = 2.2138750553131
			}
		},
		pes_bw_backstory_seven_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
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
			},
			sound_events_duration = {
				[1.0] = 5.1843748092651
			}
		},
		pwh_hub_lohner_conversation_three_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "hub_conversations",
			category = "story_talk_keep",
			dialogue_animations_n = 1,
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pwh_hub_lohner_conversation_three_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events = {
				[1.0] = "pwh_hub_lohner_conversation_three_01"
			},
			sound_events_duration = {
				[1.0] = 4.5066666603088
			}
		},
		nik_keep_idle_banter_four_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "hub_conversations",
			sound_events_n = 5,
			sound_distance = 30,
			category = "story_talk_keep",
			dialogue_animations_n = 5,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_keep_idle_banter_four_01",
				"nik_keep_idle_painter_01",
				"nik_keep_idle_painter_02",
				"nik_keep_idle_painter_03",
				"nik_keep_idle_painter_04"
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
			}
		},
		nik_altar = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "hub_conversations",
			sound_events_n = 6,
			category = "npc_talk",
			dialogue_animations_n = 6,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_altar_01",
				"nik_altar_02",
				"nik_altar_03",
				"nik_altar_04",
				"nik_altar_05",
				"nik_altar_06"
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
			}
		},
		nik_callout_unready_bardin = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hub_conversations",
			sound_events_n = 4,
			category = "npc_talk",
			dialogue_animations_n = 4,
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			randomize_indexes = {},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events = {
				"nik_callout_unready_bardin_01",
				"nik_callout_unready_bardin_02",
				"nik_callout_unready_bardin_03",
				"nik_callout_unready_bardin_04"
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
			}
		}
	})
end
