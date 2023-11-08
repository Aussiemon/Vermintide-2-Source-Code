return function ()
	define_rule({
		name = "pbw_level_bogenhafen_slum_ambush",
		response = "pbw_level_bogenhafen_slum_ambush",
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
				"level_bogenhafen_slum_ambush"
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
				"faction_memory",
				"level_bogenhafen_slum_ambush",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_ambush",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_blackfire",
		response = "pbw_level_bogenhafen_slum_blackfire",
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
				"pit_blackfire"
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
				"faction_memory",
				"pit_blackfire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pit_blackfire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_burn_food",
		response = "pbw_level_bogenhafen_slum_burn_food",
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
				"level_bogenhafen_slum_burn_food"
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
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_cannon",
		response = "pbw_level_bogenhafen_slum_cannon",
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
				"level_bogenhafen_slum_cannon"
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
				"faction_memory",
				"level_bogenhafen_slum_cannon",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_cannon",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_end",
		response = "pbw_level_bogenhafen_slum_end",
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
				"level_bogenhafen_slum_end"
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
				"faction_memory",
				"level_bogenhafen_slum_end",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_end",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_escape",
		response = "pbw_level_bogenhafen_slum_escape",
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
				"level_bogenhafen_slum_escape"
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
				"faction_memory",
				"level_bogenhafen_slum_escape",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_escape",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_find_hideout",
		response = "pbw_level_bogenhafen_slum_find_hideout",
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
				"level_bogenhafen_slum_find_hideout"
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
				"faction_memory",
				"level_bogenhafen_slum_find_hideout",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_find_hideout",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_fortify",
		response = "pbw_level_bogenhafen_slum_fortify",
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
				"level_bogenhafen_slum_fortify"
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
				"faction_memory",
				"level_bogenhafen_slum_fortify",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_fortify",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_fortify_prep",
		response = "pbw_level_bogenhafen_slum_fortify_prep",
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
				"level_bogenhafen_slum_fortify_prep"
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
				"faction_memory",
				"level_bogenhafen_slum_fortify_prep",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_fortify_prep",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_foul_air",
		response = "pbw_level_bogenhafen_slum_foul_air",
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
				"level_bogenhafen_slum_foul_air"
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
				"faction_memory",
				"level_bogenhafen_slum_foul_air",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_foul_air",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_gang",
		response = "pbw_level_bogenhafen_slum_gang",
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
				"level_bogenhafen_slum_gang"
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
				"faction_memory",
				"level_bogenhafen_slum_gang",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_gang",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_intro_a",
		response = "pbw_level_bogenhafen_slum_intro_a",
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
				"level_bogenhafen_slum_intro_a"
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
				"faction_memory",
				"level_bogenhafen_slum_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_intro_b",
		response = "pbw_level_bogenhafen_slum_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_bogenhafen_slum_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_intro_c",
		response = "pbw_level_bogenhafen_slum_intro_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_bogenhafen_slum_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_noble_food",
		response = "pbw_level_bogenhafen_slum_noble_food",
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
				"level_bogenhafen_slum_noble_food"
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
				"faction_memory",
				"level_bogenhafen_slum_noble_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noble_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_noisy_exit",
		response = "pbw_level_bogenhafen_slum_noisy_exit",
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
				"level_bogenhafen_slum_noisy_exit"
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
				"faction_memory",
				"level_bogenhafen_slum_noisy_exit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noisy_exit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_river",
		response = "pbw_level_bogenhafen_slum_river",
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
				"level_bogenhafen_slum_river"
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
				"faction_memory",
				"level_bogenhafen_slum_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_search",
		response = "pbw_level_bogenhafen_slum_search",
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
				"level_bogenhafen_slum_search"
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
				"faction_memory",
				"level_bogenhafen_slum_search",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_search",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_slum",
		response = "pbw_level_bogenhafen_slum_slum",
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
				"level_bogenhafen_slum_slum"
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
				"faction_memory",
				"level_bogenhafen_slum_slum",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_slum",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_squalor",
		response = "pbw_level_bogenhafen_slum_squalor",
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
				"level_bogenhafen_slum_squalor"
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
				"faction_memory",
				"level_bogenhafen_slum_squalor",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_squalor",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_stolen_goods",
		response = "pbw_level_bogenhafen_slum_stolen_goods",
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
				"level_bogenhafen_slum_stolen_goods"
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
				"faction_memory",
				"level_bogenhafen_slum_stolen_goods",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_stolen_goods",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_tainted_food",
		response = "pbw_level_bogenhafen_slum_tainted_food",
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
				"level_bogenhafen_slum_tainted_food"
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
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_the_58",
		response = "pbw_level_bogenhafen_slum_the_58",
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
				"level_bogenhafen_slum_the_58"
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
				"faction_memory",
				"level_bogenhafen_slum_the_58",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_the_58",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_the_wall",
		response = "pbw_level_bogenhafen_slum_the_wall",
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
				"pbw_level_bogenhafen_slum_the_wall"
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
				"faction_memory",
				"pbw_level_bogenhafen_slum_the_wall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_level_bogenhafen_slum_the_wall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_bogenhafen_slum_too_quiet",
		response = "pbw_level_bogenhafen_slum_too_quiet",
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
				"level_bogenhafen_slum_too_quiet"
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
				"faction_memory",
				"level_bogenhafen_slum_too_quiet",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_too_quiet",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_py_level_bogenhafen_slum_burn_food",
		response = "pbw_py_level_bogenhafen_slum_burn_food",
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
				"level_bogenhafen_slum_burn_food"
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
				"player_career",
				OP.EQ,
				"bw_scholar"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_py_level_bogenhafen_slum_noble_food_01",
		response = "pbw_py_level_bogenhafen_slum_noble_food_01",
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
				"level_bogenhafen_slum_noble_food"
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
				"player_career",
				OP.EQ,
				"bw_scholar"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_noble_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noble_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_py_level_bogenhafen_slum_stolen_goods",
		response = "pbw_py_level_bogenhafen_slum_stolen_goods",
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
				"level_bogenhafen_slum_stolen_goods"
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
				"player_career",
				OP.EQ,
				"bw_scholar"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_stolen_goods",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_stolen_goods",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_py_level_bogenhafen_slum_the_58",
		response = "pbw_py_level_bogenhafen_slum_the_58",
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
				"level_bogenhafen_slum_the_58"
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
				"player_career",
				OP.EQ,
				"bw_scholar"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_the_58",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_the_58",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_ambush",
		response = "pbw_un_level_bogenhafen_slum_ambush",
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
				"level_bogenhafen_slum_ambush"
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
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_ambush",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_ambush",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_blackfire",
		response = "pbw_un_level_bogenhafen_slum_blackfire",
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
				"pit_blackfire"
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
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"pit_blackfire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pit_blackfire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_burn_food",
		response = "pbw_un_level_bogenhafen_slum_burn_food",
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
				"level_bogenhafen_slum_burn_food"
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
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_burn_food",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_noisy_exit",
		response = "pbw_un_level_bogenhafen_slum_noisy_exit",
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
				"level_bogenhafen_slum_noisy_exit"
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
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_noisy_exit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_noisy_exit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_river",
		response = "pbw_un_level_bogenhafen_slum_river",
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
				"level_bogenhafen_slum_river"
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
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_slum_tainted_food",
		response = "pbw_un_level_bogenhafen_slum_tainted_food",
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
				"level_bogenhafen_slum_tainted_food"
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
				"player_career",
				OP.EQ,
				"bw_unchained"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_tainted_food",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_level_bogenhafen_slum_ambush = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_ambush_01",
				"pbw_level_bogenhafen_slum_ambush_02",
				"pbw_level_bogenhafen_slum_ambush_03",
				"pbw_level_bogenhafen_slum_ambush_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_ambush_01",
				"pbw_level_bogenhafen_slum_ambush_02",
				"pbw_level_bogenhafen_slum_ambush_03",
				"pbw_level_bogenhafen_slum_ambush_04"
			},
			sound_events_duration = {
				2.6245832443237,
				3.8427500724792,
				5.1233539581299,
				1.8712291717529
			}
		},
		pbw_level_bogenhafen_slum_blackfire = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_level_bogenhafen_slum_blackfire_01",
				"pbw_level_bogenhafen_slum_blackfire_02",
				"pbw_level_bogenhafen_slum_blackfire_03",
				"pbw_level_bogenhafen_slum_blackfire_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_blackfire_01",
				"pbw_level_bogenhafen_slum_blackfire_02",
				"pbw_level_bogenhafen_slum_blackfire_03",
				"pbw_level_bogenhafen_slum_blackfire_04"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		pbw_level_bogenhafen_slum_burn_food = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_burn_food_01",
				"pbw_level_bogenhafen_slum_burn_food_02",
				"pbw_level_bogenhafen_slum_burn_food_03",
				"pbw_level_bogenhafen_slum_burn_food_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_burn_food_01",
				"pbw_level_bogenhafen_slum_burn_food_02",
				"pbw_level_bogenhafen_slum_burn_food_03",
				"pbw_level_bogenhafen_slum_burn_food_04"
			},
			sound_events_duration = {
				3.5480833053589,
				5.0897917747498,
				6.4099793434143,
				4.733416557312
			}
		},
		pbw_level_bogenhafen_slum_cannon = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_cannon_01",
				"pbw_level_bogenhafen_slum_cannon_02",
				"pbw_level_bogenhafen_slum_cannon_03",
				"pbw_level_bogenhafen_slum_cannon_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_cannon_01",
				"pbw_level_bogenhafen_slum_cannon_02",
				"pbw_level_bogenhafen_slum_cannon_03",
				"pbw_level_bogenhafen_slum_cannon_04"
			},
			sound_events_duration = {
				4.2804374694824,
				4.045937538147,
				5.5272498130798,
				3.4624166488648
			}
		},
		pbw_level_bogenhafen_slum_end = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_end_01",
				"pbw_level_bogenhafen_slum_end_02",
				"pbw_level_bogenhafen_slum_end_03",
				"pbw_level_bogenhafen_slum_end_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_end_01",
				"pbw_level_bogenhafen_slum_end_02",
				"pbw_level_bogenhafen_slum_end_03",
				"pbw_level_bogenhafen_slum_end_04"
			},
			sound_events_duration = {
				3.407562494278,
				3.3890624046326,
				4.1748123168945,
				3.0899999141693
			}
		},
		pbw_level_bogenhafen_slum_escape = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_escape_01",
				"pbw_level_bogenhafen_slum_escape_02",
				"pbw_level_bogenhafen_slum_escape_03",
				"pbw_level_bogenhafen_slum_escape_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_escape_01",
				"pbw_level_bogenhafen_slum_escape_02",
				"pbw_level_bogenhafen_slum_escape_03",
				"pbw_level_bogenhafen_slum_escape_04"
			},
			sound_events_duration = {
				3.2825832366943,
				4.3844375610352,
				4.3326668739319,
				3.5542707443237
			}
		},
		pbw_level_bogenhafen_slum_find_hideout = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_level_bogenhafen_slum_find_hideout_01",
				"pbw_level_bogenhafen_slum_find_hideout_02",
				"pbw_level_bogenhafen_slum_find_hideout_03",
				"pbw_level_bogenhafen_slum_find_hideout_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_find_hideout_01",
				"pbw_level_bogenhafen_slum_find_hideout_02",
				"pbw_level_bogenhafen_slum_find_hideout_03",
				"pbw_level_bogenhafen_slum_find_hideout_04"
			},
			sound_events_duration = {
				4.421395778656,
				3.2448959350586,
				3.837833404541,
				3.2670834064484
			}
		},
		pbw_level_bogenhafen_slum_fortify = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_fortify_01",
				"pbw_level_bogenhafen_slum_fortify_02",
				"pbw_level_bogenhafen_slum_fortify_03",
				"pbw_level_bogenhafen_slum_fortify_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_fortify_01",
				"pbw_level_bogenhafen_slum_fortify_02",
				"pbw_level_bogenhafen_slum_fortify_03",
				"pbw_level_bogenhafen_slum_fortify_04"
			},
			sound_events_duration = {
				3.1887083053589,
				2.8887083530426,
				3.4092917442322,
				5.4241456985474
			}
		},
		pbw_level_bogenhafen_slum_fortify_prep = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_fortify_prep_01",
				"pbw_level_bogenhafen_slum_fortify_prep_02",
				"pbw_level_bogenhafen_slum_fortify_prep_03",
				"pbw_level_bogenhafen_slum_fortify_prep_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_fortify_prep_01",
				"pbw_level_bogenhafen_slum_fortify_prep_02",
				"pbw_level_bogenhafen_slum_fortify_prep_03",
				"pbw_level_bogenhafen_slum_fortify_prep_04"
			},
			sound_events_duration = {
				1.8064374923706,
				2.0522291660309,
				2.6005415916443,
				3.2995624542236
			}
		},
		pbw_level_bogenhafen_slum_foul_air = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_foul_air_01",
				"pbw_level_bogenhafen_slum_foul_air_02",
				"pbw_level_bogenhafen_slum_foul_air_03",
				"pbw_level_bogenhafen_slum_foul_air_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_foul_air_01",
				"pbw_level_bogenhafen_slum_foul_air_02",
				"pbw_level_bogenhafen_slum_foul_air_03",
				"pbw_level_bogenhafen_slum_foul_air_04"
			},
			sound_events_duration = {
				2.8209583759308,
				6.5180830955505,
				6.5008335113525,
				6.9537706375122
			}
		},
		pbw_level_bogenhafen_slum_gang = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_neutral",
				"face_neutral",
				"face_curious"
			},
			localization_strings = {
				"pbw_level_bogenhafen_slum_gang_01",
				"pbw_level_bogenhafen_slum_gang_02",
				"pbw_level_bogenhafen_slum_gang_03",
				"pbw_level_bogenhafen_slum_gang_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_gang_01",
				"pbw_level_bogenhafen_slum_gang_02",
				"pbw_level_bogenhafen_slum_gang_03",
				"pbw_level_bogenhafen_slum_gang_04"
			},
			sound_events_duration = {
				5.5571875572205,
				5.179208278656,
				3.9289791584015,
				5.6542706489563
			}
		},
		pbw_level_bogenhafen_slum_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_level_bogenhafen_slum_intro_a_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_level_bogenhafen_slum_intro_a_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 4.6120414733887,
				[2.0] = 6.9083747863769
			}
		},
		pbw_level_bogenhafen_slum_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_level_bogenhafen_slum_intro_b_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_level_bogenhafen_slum_intro_b_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 7.6114997863769,
				[2.0] = 5.4470415115356
			}
		},
		pbw_level_bogenhafen_slum_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_level_bogenhafen_slum_intro_c_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_level_bogenhafen_slum_intro_c_01",
				[2.0] = "pbw_level_bogenhafen_slum_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 5.4300417900085,
				[2.0] = 6.1684789657593
			}
		},
		pbw_level_bogenhafen_slum_noble_food = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_noble_food_01",
				"pbw_level_bogenhafen_slum_noble_food_02",
				"pbw_level_bogenhafen_slum_noble_food_03",
				"pbw_level_bogenhafen_slum_noble_food_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_noble_food_01",
				"pbw_level_bogenhafen_slum_noble_food_02",
				"pbw_level_bogenhafen_slum_noble_food_03",
				"pbw_level_bogenhafen_slum_noble_food_04"
			},
			sound_events_duration = {
				3.9130415916443,
				4.1787915229797,
				4.7986459732056,
				6.8450207710266
			}
		},
		pbw_level_bogenhafen_slum_noisy_exit = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_noisy_exit_01",
				"pbw_level_bogenhafen_slum_noisy_exit_02",
				"pbw_level_bogenhafen_slum_noisy_exit_03",
				"pbw_level_bogenhafen_slum_noisy_exit_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_noisy_exit_01",
				"pbw_level_bogenhafen_slum_noisy_exit_02",
				"pbw_level_bogenhafen_slum_noisy_exit_03",
				"pbw_level_bogenhafen_slum_noisy_exit_04"
			},
			sound_events_duration = {
				4.7626252174377,
				3.6096041202545,
				5.0308542251587,
				5.4009375572205
			}
		},
		pbw_level_bogenhafen_slum_river = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pbw_level_bogenhafen_slum_river_01",
				"pbw_level_bogenhafen_slum_river_02",
				"pbw_level_bogenhafen_slum_river_03",
				"pbw_level_bogenhafen_slum_river_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_river_01",
				"pbw_level_bogenhafen_slum_river_02",
				"pbw_level_bogenhafen_slum_river_03",
				"pbw_level_bogenhafen_slum_river_04"
			},
			sound_events_duration = {
				3.0855207443237,
				2.4090416431427,
				5.0422706604004,
				4.3071665763855
			}
		},
		pbw_level_bogenhafen_slum_search = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_search_01",
				"pbw_level_bogenhafen_slum_search_02",
				"pbw_level_bogenhafen_slum_search_03",
				"pbw_level_bogenhafen_slum_search_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_search_01",
				"pbw_level_bogenhafen_slum_search_02",
				"pbw_level_bogenhafen_slum_search_03",
				"pbw_level_bogenhafen_slum_search_04"
			},
			sound_events_duration = {
				4.7676248550415,
				5.7130208015442,
				3.7280833721161,
				3.5687291622162
			}
		},
		pbw_level_bogenhafen_slum_slum = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_slum_01",
				"pbw_level_bogenhafen_slum_slum_02",
				"pbw_level_bogenhafen_slum_slum_03",
				"pbw_level_bogenhafen_slum_slum_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_slum_01",
				"pbw_level_bogenhafen_slum_slum_02",
				"pbw_level_bogenhafen_slum_slum_03",
				"pbw_level_bogenhafen_slum_slum_04"
			},
			sound_events_duration = {
				2.6812707781792,
				3.1489584445953,
				3.2589790821075,
				4.3266458511353
			}
		},
		pbw_level_bogenhafen_slum_squalor = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pbw_level_bogenhafen_slum_squalor_01",
				"pbw_level_bogenhafen_slum_squalor_02",
				"pbw_level_bogenhafen_slum_squalor_03",
				"pbw_level_bogenhafen_slum_squalor_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_squalor_01",
				"pbw_level_bogenhafen_slum_squalor_02",
				"pbw_level_bogenhafen_slum_squalor_03",
				"pbw_level_bogenhafen_slum_squalor_04"
			},
			sound_events_duration = {
				4.6680207252502,
				3.2294583320618,
				3.7313749790192,
				5.6440210342407
			}
		},
		pbw_level_bogenhafen_slum_stolen_goods = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_stolen_goods_01",
				"pbw_level_bogenhafen_slum_stolen_goods_02",
				"pbw_level_bogenhafen_slum_stolen_goods_03",
				"pbw_level_bogenhafen_slum_stolen_goods_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_stolen_goods_01",
				"pbw_level_bogenhafen_slum_stolen_goods_02",
				"pbw_level_bogenhafen_slum_stolen_goods_03",
				"pbw_level_bogenhafen_slum_stolen_goods_04"
			},
			sound_events_duration = {
				5.3546042442322,
				4.3909168243408,
				6.2133750915527,
				6.8338751792908
			}
		},
		pbw_level_bogenhafen_slum_tainted_food = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "cut_scene",
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
				"pbw_level_bogenhafen_slum_tainted_food_01",
				"pbw_level_bogenhafen_slum_tainted_food_02",
				"pbw_level_bogenhafen_slum_tainted_food_03",
				"pbw_level_bogenhafen_slum_tainted_food_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_tainted_food_01",
				"pbw_level_bogenhafen_slum_tainted_food_02",
				"pbw_level_bogenhafen_slum_tainted_food_03",
				"pbw_level_bogenhafen_slum_tainted_food_04"
			},
			sound_events_duration = {
				3.5447499752045,
				4.1041460037231,
				5.1458749771118,
				4.6731247901917
			}
		},
		pbw_level_bogenhafen_slum_the_58 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pbw_level_bogenhafen_slum_the_58_01",
				"pbw_level_bogenhafen_slum_the_58_02",
				"pbw_level_bogenhafen_slum_the_58_03",
				"pbw_level_bogenhafen_slum_the_58_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_the_58_01",
				"pbw_level_bogenhafen_slum_the_58_02",
				"pbw_level_bogenhafen_slum_the_58_03",
				"pbw_level_bogenhafen_slum_the_58_04"
			},
			sound_events_duration = {
				4.8133335113525,
				5.0736665725708,
				5.3544998168945,
				5.4252290725708
			}
		},
		pbw_level_bogenhafen_slum_the_wall = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
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
				"pbw_level_bogenhafen_slum_the_wall_01",
				"pbw_level_bogenhafen_slum_the_wall_02",
				"pbw_level_bogenhafen_slum_the_wall_03",
				"pbw_level_bogenhafen_slum_the_wall_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_the_wall_01",
				"pbw_level_bogenhafen_slum_the_wall_02",
				"pbw_level_bogenhafen_slum_the_wall_03",
				"pbw_level_bogenhafen_slum_the_wall_04"
			},
			sound_events_duration = {
				3.0694167613983,
				2.422354221344,
				2.8611042499542,
				2.8878750801086
			}
		},
		pbw_level_bogenhafen_slum_too_quiet = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_bogenhafen_slum",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_level_bogenhafen_slum_too_quiet_01",
				"pbw_level_bogenhafen_slum_too_quiet_02",
				"pbw_level_bogenhafen_slum_too_quiet_03",
				"pbw_level_bogenhafen_slum_too_quiet_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_slum_too_quiet_01",
				"pbw_level_bogenhafen_slum_too_quiet_02",
				"pbw_level_bogenhafen_slum_too_quiet_03",
				"pbw_level_bogenhafen_slum_too_quiet_04"
			},
			sound_events_duration = {
				3.3724792003632,
				2.7653748989105,
				5.1620001792908,
				2.0548541545868
			}
		},
		pbw_py_level_bogenhafen_slum_burn_food = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_py_level_bogenhafen_slum_burn_food_01"
			},
			sound_events = {
				[1.0] = "pbw_py_level_bogenhafen_slum_burn_food_01"
			},
			sound_events_duration = {
				[1.0] = 3.7377707958221
			}
		},
		pbw_py_level_bogenhafen_slum_noble_food_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_py_level_bogenhafen_slum_noble_food_01"
			},
			sound_events = {
				[1.0] = "pbw_py_level_bogenhafen_slum_noble_food_01"
			},
			sound_events_duration = {
				[1.0] = 6.953125
			}
		},
		pbw_py_level_bogenhafen_slum_stolen_goods = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_py_level_bogenhafen_slum_stolen_goods_01"
			},
			sound_events = {
				[1.0] = "pbw_py_level_bogenhafen_slum_stolen_goods_01"
			},
			sound_events_duration = {
				[1.0] = 3.8335208892822
			}
		},
		pbw_py_level_bogenhafen_slum_the_58 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_py_level_bogenhafen_slum_the_58_01"
			},
			sound_events = {
				[1.0] = "pbw_py_level_bogenhafen_slum_the_58_01"
			},
			sound_events_duration = {
				[1.0] = 5.1775832176208
			}
		},
		pbw_un_level_bogenhafen_slum_ambush = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_ambush_01"
			},
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_ambush_01"
			},
			sound_events_duration = {
				[1.0] = 5.1789374351502
			}
		},
		pbw_un_level_bogenhafen_slum_blackfire = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_blackfire_01"
			},
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_blackfire_01"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			}
		},
		pbw_un_level_bogenhafen_slum_burn_food = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_burn_food_01"
			},
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_burn_food_01"
			},
			sound_events_duration = {
				[1.0] = 6.695291519165
			}
		},
		pbw_un_level_bogenhafen_slum_noisy_exit = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_noisy_exit_01"
			},
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_noisy_exit_01"
			},
			sound_events_duration = {
				[1.0] = 9.2867498397827
			}
		},
		pbw_un_level_bogenhafen_slum_river = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_river_01"
			},
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_river_01"
			},
			sound_events_duration = {
				[1.0] = 5.7960624694824
			}
		},
		pbw_un_level_bogenhafen_slum_tainted_food = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_un_level_bogenhafen_slum_tainted_food_01"
			},
			sound_events = {
				[1.0] = "pbw_un_level_bogenhafen_slum_tainted_food_01"
			},
			sound_events_duration = {
				[1.0] = 5.4349999427795
			}
		}
	})
end
