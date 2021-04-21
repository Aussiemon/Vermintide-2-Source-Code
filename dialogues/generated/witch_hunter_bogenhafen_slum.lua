return function ()
	define_rule({
		name = "pwh_level_bogenhafen_slum_slum",
		response = "pwh_level_bogenhafen_slum_slum",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_bh_level_bogenhafen_slum_slum",
		response = "pwh_bh_level_bogenhafen_slum_slum",
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
				"player_career",
				OP.EQ,
				"wh_bountyhunter"
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
		name = "pwh_ze_level_bogenhafen_slum_slum",
		response = "pwh_ze_level_bogenhafen_slum_slum",
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
				"player_career",
				OP.EQ,
				"wh_zealot"
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
		name = "pwh_level_bogenhafen_slum_the_58",
		response = "pwh_level_bogenhafen_slum_the_58",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_ze_level_bogenhafen_slum_the_58",
		response = "pwh_ze_level_bogenhafen_slum_the_58",
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
				"player_career",
				OP.EQ,
				"wh_zealot"
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
		name = "pwh_level_bogenhafen_slum_river",
		response = "pwh_level_bogenhafen_slum_river",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_ze_level_bogenhafen_slum_river",
		response = "pwh_ze_level_bogenhafen_slum_river",
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
				"player_career",
				OP.EQ,
				"wh_zealot"
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
		name = "pwh_level_bogenhafen_slum_squalor",
		response = "pwh_level_bogenhafen_slum_squalor",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_blackfire",
		response = "pwh_level_bogenhafen_slum_blackfire",
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
				"level_bogenhafen_slum_blackfire"
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
				"faction_memory",
				"level_bogenhafen_slum_blackfire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_blackfire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_ze_level_bogenhafen_slum_blackfire",
		response = "pwh_ze_level_bogenhafen_slum_blackfire",
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
				"level_bogenhafen_slum_blackfire"
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
				"player_career",
				OP.EQ,
				"wh_zealot"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_blackfire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_blackfire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_bh_level_bogenhafen_slum_blackfire",
		response = "pwh_bh_level_bogenhafen_slum_blackfire",
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
				"level_bogenhafen_slum_blackfire"
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
				"player_career",
				OP.EQ,
				"wh_bountyhunter"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_blackfire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_blackfire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bogenhafen_slum_gang",
		response = "pwh_level_bogenhafen_slum_gang",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_bh_level_bogenhafen_slum_gang",
		response = "pwh_bh_level_bogenhafen_slum_gang",
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
				"player_career",
				OP.EQ,
				"wh_bountyhunter"
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
		name = "pwh_level_bogenhafen_slum_find_hideout",
		response = "pwh_level_bogenhafen_slum_find_hideout",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_bh_level_bogenhafen_slum_hideout",
		response = "pwh_bh_level_bogenhafen_slum_hideout",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_bountyhunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_too_quiet",
		response = "pwh_level_bogenhafen_slum_too_quiet",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_ze_level_bogenhafen_slum_too_quiet",
		response = "pwh_ze_level_bogenhafen_slum_too_quiet",
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
				"player_career",
				OP.EQ,
				"wh_zealot"
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
		name = "pwh_level_bogenhafen_slum_stolen_goods",
		response = "pwh_level_bogenhafen_slum_stolen_goods",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_foul_air",
		response = "pwh_level_bogenhafen_slum_foul_air",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_ambush",
		response = "pwh_level_bogenhafen_slum_ambush",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_ze_level_bogenhafen_slum_noble_food",
		response = "pwh_ze_level_bogenhafen_slum_noble_food",
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
				"player_career",
				OP.EQ,
				"wh_zealot"
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
		name = "pwh_level_bogenhafen_slum_fortify",
		response = "pwh_level_bogenhafen_slum_fortify",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_search",
		response = "pwh_level_bogenhafen_slum_search",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_tainted_food",
		response = "pwh_level_bogenhafen_slum_tainted_food",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_noble_food",
		response = "pwh_level_bogenhafen_slum_noble_food",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_burn_food",
		response = "pwh_level_bogenhafen_slum_burn_food",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_cannon",
		response = "pwh_level_bogenhafen_slum_cannon",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_noisy_exit",
		response = "pwh_level_bogenhafen_slum_noisy_exit",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_escape",
		response = "pwh_level_bogenhafen_slum_escape",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_the_wall",
		response = "pwh_level_bogenhafen_slum_the_wall",
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
				"pwh_level_bogenhafen_slum_the_wall"
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
				"faction_memory",
				"pwh_level_bogenhafen_slum_the_wall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_level_bogenhafen_slum_the_wall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_bh_level_bogenhafen_slum_the_wall_01",
		response = "pwh_bh_level_bogenhafen_slum_the_wall_01",
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
				"level_bogenhafen_slum_the_wall"
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
				"player_career",
				OP.EQ,
				"wh_bountyhunter"
			},
			{
				"faction_memory",
				"level_bogenhafen_slum_the_wall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_slum_the_wall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bogenhafen_slum_end",
		response = "pwh_level_bogenhafen_slum_end",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_intro_a",
		response = "pwh_level_bogenhafen_slum_intro_a",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_intro_b",
		response = "pwh_level_bogenhafen_slum_intro_b",
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
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_intro_c",
		response = "pwh_level_bogenhafen_slum_intro_c",
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
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_slum_fortify_prep",
		response = "pwh_level_bogenhafen_slum_fortify_prep",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
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
	add_dialogues({
		pwh_ze_level_bogenhafen_slum_too_quiet = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_too_quiet_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_too_quiet_01"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 5.5735001564026
			}
		},
		pwh_bh_level_bogenhafen_slum_slum = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_bh_level_bogenhafen_slum_slum_01"
			},
			sound_events = {
				[1.0] = "pwh_bh_level_bogenhafen_slum_slum_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 8.0019378662109
			}
		},
		pwh_level_bogenhafen_slum_escape = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_escape_01",
				"pwh_level_bogenhafen_slum_escape_02",
				"pwh_level_bogenhafen_slum_escape_03",
				"pwh_level_bogenhafen_slum_escape_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_escape_01",
				"pwh_level_bogenhafen_slum_escape_02",
				"pwh_level_bogenhafen_slum_escape_03",
				"pwh_level_bogenhafen_slum_escape_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.813333272934,
				3.2762498855591,
				4.4933543205261,
				5.8965001106262
			}
		},
		pwh_level_bogenhafen_slum_intro_b = {
			face_animations_n = 2,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_level_bogenhafen_slum_intro_b_01",
				[2.0] = "pwh_level_bogenhafen_slum_intro_b_02"
			},
			sound_events = {
				[1.0] = "pwh_level_bogenhafen_slum_intro_b_01",
				[2.0] = "pwh_level_bogenhafen_slum_intro_b_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 7.152916431427,
				[2.0] = 6.5689167976379
			}
		},
		pwh_level_bogenhafen_slum_search = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_search_01",
				"pwh_level_bogenhafen_slum_search_02",
				"pwh_level_bogenhafen_slum_search_03",
				"pwh_level_bogenhafen_slum_search_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_search_01",
				"pwh_level_bogenhafen_slum_search_02",
				"pwh_level_bogenhafen_slum_search_03",
				"pwh_level_bogenhafen_slum_search_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.7419581413269,
				4.6447916030884,
				3.5346040725708,
				4.6253123283386
			}
		},
		pwh_level_bogenhafen_slum_river = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_river_01",
				"pwh_level_bogenhafen_slum_river_02",
				"pwh_level_bogenhafen_slum_river_03",
				"pwh_level_bogenhafen_slum_river_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_river_01",
				"pwh_level_bogenhafen_slum_river_02",
				"pwh_level_bogenhafen_slum_river_03",
				"pwh_level_bogenhafen_slum_river_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				7.020103931427,
				5.4688749313355,
				4.8503751754761,
				7.9436459541321
			}
		},
		pwh_level_bogenhafen_slum_intro_a = {
			face_animations_n = 2,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_level_bogenhafen_slum_intro_a_01",
				[2.0] = "pwh_level_bogenhafen_slum_intro_a_02"
			},
			sound_events = {
				[1.0] = "pwh_level_bogenhafen_slum_intro_a_01",
				[2.0] = "pwh_level_bogenhafen_slum_intro_a_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 7.2877917289734,
				[2.0] = 5.7816877365112
			}
		},
		pwh_bh_level_bogenhafen_slum_hideout = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_bh_level_bogenhafen_slum_hideout_01"
			},
			sound_events = {
				[1.0] = "pwh_bh_level_bogenhafen_slum_hideout_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.1274580955505
			}
		},
		pwh_ze_level_bogenhafen_slum_slum = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_slum_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_slum_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 6.5494375228882
			}
		},
		pwh_level_bogenhafen_slum_blackfire = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_blackfire_01",
				"pwh_level_bogenhafen_slum_blackfire_02",
				"pwh_level_bogenhafen_slum_blackfire_03",
				"pwh_level_bogenhafen_slum_blackfire_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_blackfire_01",
				"pwh_level_bogenhafen_slum_blackfire_02",
				"pwh_level_bogenhafen_slum_blackfire_03",
				"pwh_level_bogenhafen_slum_blackfire_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.1429376602173,
				6.7887916564941,
				7.2508540153503,
				7.2387499809265
			}
		},
		pwh_ze_level_bogenhafen_slum_the_58 = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_the_58_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_the_58_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 8.9915418624878
			}
		},
		pwh_level_bogenhafen_slum_stolen_goods = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_stolen_goods_01",
				"pwh_level_bogenhafen_slum_stolen_goods_02",
				"pwh_level_bogenhafen_slum_stolen_goods_03",
				"pwh_level_bogenhafen_slum_stolen_goods_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_stolen_goods_01",
				"pwh_level_bogenhafen_slum_stolen_goods_02",
				"pwh_level_bogenhafen_slum_stolen_goods_03",
				"pwh_level_bogenhafen_slum_stolen_goods_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.569854259491,
				7.2409582138061,
				3.8926875591278,
				5.2554168701172
			}
		},
		pwh_bh_level_bogenhafen_slum_blackfire = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_bh_level_bogenhafen_slum_blackfire_01"
			},
			sound_events = {
				[1.0] = "pwh_bh_level_bogenhafen_slum_blackfire_01"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.9046669006348
			}
		},
		pwh_level_bogenhafen_slum_burn_food = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_burn_food_01",
				"pwh_level_bogenhafen_slum_burn_food_02",
				"pwh_level_bogenhafen_slum_burn_food_03",
				"pwh_level_bogenhafen_slum_burn_food_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_burn_food_01",
				"pwh_level_bogenhafen_slum_burn_food_02",
				"pwh_level_bogenhafen_slum_burn_food_03",
				"pwh_level_bogenhafen_slum_burn_food_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.838666677475,
				2.611270904541,
				2.8971874713898,
				5.0730624198914
			}
		},
		pwh_level_bogenhafen_slum_tainted_food = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_tainted_food_01",
				"pwh_level_bogenhafen_slum_tainted_food_02",
				"pwh_level_bogenhafen_slum_tainted_food_03",
				"pwh_level_bogenhafen_slum_tainted_food_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_tainted_food_01",
				"pwh_level_bogenhafen_slum_tainted_food_02",
				"pwh_level_bogenhafen_slum_tainted_food_03",
				"pwh_level_bogenhafen_slum_tainted_food_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.9588959217072,
				4.3995418548584,
				2.5286042690277,
				4.8513126373291
			}
		},
		pwh_level_bogenhafen_slum_noisy_exit = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_noisy_exit_01",
				"pwh_level_bogenhafen_slum_noisy_exit_02",
				"pwh_level_bogenhafen_slum_noisy_exit_03",
				"pwh_level_bogenhafen_slum_noisy_exit_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_noisy_exit_01",
				"pwh_level_bogenhafen_slum_noisy_exit_02",
				"pwh_level_bogenhafen_slum_noisy_exit_03",
				"pwh_level_bogenhafen_slum_noisy_exit_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.8463335037231,
				5.5656251907349,
				3.2887916564941,
				6.1804585456848
			}
		},
		pwh_level_bogenhafen_slum_find_hideout = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_find_hideout_01",
				"pwh_level_bogenhafen_slum_find_hideout_02",
				"pwh_level_bogenhafen_slum_find_hideout_03",
				"pwh_level_bogenhafen_slum_find_hideout_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_find_hideout_01",
				"pwh_level_bogenhafen_slum_find_hideout_02",
				"pwh_level_bogenhafen_slum_find_hideout_03",
				"pwh_level_bogenhafen_slum_find_hideout_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.7183957099915,
				3.5442082881927,
				6.0583543777466,
				5.9288125038147
			}
		},
		pwh_level_bogenhafen_slum_fortify_prep = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_fortify_prep_01",
				"pwh_level_bogenhafen_slum_fortify_prep_02",
				"pwh_level_bogenhafen_slum_fortify_prep_03",
				"pwh_level_bogenhafen_slum_fortify_prep_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_fortify_prep_01",
				"pwh_level_bogenhafen_slum_fortify_prep_02",
				"pwh_level_bogenhafen_slum_fortify_prep_03",
				"pwh_level_bogenhafen_slum_fortify_prep_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.665479183197,
				3.1177084445953,
				2.5346667766571,
				2.5140833854675
			}
		},
		pwh_level_bogenhafen_slum_fortify = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_fortify_01",
				"pwh_level_bogenhafen_slum_fortify_02",
				"pwh_level_bogenhafen_slum_fortify_03",
				"pwh_level_bogenhafen_slum_fortify_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_fortify_01",
				"pwh_level_bogenhafen_slum_fortify_02",
				"pwh_level_bogenhafen_slum_fortify_03",
				"pwh_level_bogenhafen_slum_fortify_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.0455417633057,
				3.8432500362396,
				4.4315414428711,
				4.87264585495
			}
		},
		pwh_level_bogenhafen_slum_ambush = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_ambush_01",
				"pwh_level_bogenhafen_slum_ambush_02",
				"pwh_level_bogenhafen_slum_ambush_03",
				"pwh_level_bogenhafen_slum_ambush_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_ambush_01",
				"pwh_level_bogenhafen_slum_ambush_02",
				"pwh_level_bogenhafen_slum_ambush_03",
				"pwh_level_bogenhafen_slum_ambush_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.0595207214356,
				3.5102083683014,
				5.091374874115,
				4.1610207557678
			}
		},
		pwh_level_bogenhafen_slum_foul_air = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_foul_air_01",
				"pwh_level_bogenhafen_slum_foul_air_02",
				"pwh_level_bogenhafen_slum_foul_air_03",
				"pwh_level_bogenhafen_slum_foul_air_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_foul_air_01",
				"pwh_level_bogenhafen_slum_foul_air_02",
				"pwh_level_bogenhafen_slum_foul_air_03",
				"pwh_level_bogenhafen_slum_foul_air_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.915020942688,
				6.348249912262,
				4.2305207252502,
				4.4851665496826
			}
		},
		pwh_level_bogenhafen_slum_too_quiet = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_too_quiet_01",
				"pwh_level_bogenhafen_slum_too_quiet_02",
				"pwh_level_bogenhafen_slum_too_quiet_03",
				"pwh_level_bogenhafen_slum_too_quiet_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_too_quiet_01",
				"pwh_level_bogenhafen_slum_too_quiet_02",
				"pwh_level_bogenhafen_slum_too_quiet_03",
				"pwh_level_bogenhafen_slum_too_quiet_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.0016665458679,
				2.8523540496826,
				6.0956039428711,
				6.0315418243408
			}
		},
		pwh_level_bogenhafen_slum_gang = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_gang_01",
				"pwh_level_bogenhafen_slum_gang_02",
				"pwh_level_bogenhafen_slum_gang_03",
				"pwh_level_bogenhafen_slum_gang_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_gang_01",
				"pwh_level_bogenhafen_slum_gang_02",
				"pwh_level_bogenhafen_slum_gang_03",
				"pwh_level_bogenhafen_slum_gang_04"
			},
			face_animations = {
				"face_concerned",
				"face_neutral",
				"face_neutral",
				"face_curious"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2938332557678,
				5.0092916488647,
				6.2537083625794,
				4.1873331069946
			}
		},
		pwh_ze_level_bogenhafen_slum_river = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_river_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_river_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 9.2340002059937
			}
		},
		pwh_level_bogenhafen_slum_squalor = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_squalor_01",
				"pwh_level_bogenhafen_slum_squalor_02",
				"pwh_level_bogenhafen_slum_squalor_03",
				"pwh_level_bogenhafen_slum_squalor_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_squalor_01",
				"pwh_level_bogenhafen_slum_squalor_02",
				"pwh_level_bogenhafen_slum_squalor_03",
				"pwh_level_bogenhafen_slum_squalor_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.105103969574,
				4.6881875991821,
				5.0326457023621,
				5.3067498207092
			}
		},
		pwh_level_bogenhafen_slum_the_58 = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_the_58_01",
				"pwh_level_bogenhafen_slum_the_58_02",
				"pwh_level_bogenhafen_slum_the_58_03",
				"pwh_level_bogenhafen_slum_the_58_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_the_58_01",
				"pwh_level_bogenhafen_slum_the_58_02",
				"pwh_level_bogenhafen_slum_the_58_03",
				"pwh_level_bogenhafen_slum_the_58_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				6.0112085342407,
				4.6493334770203,
				6.673770904541,
				6.7943959236145
			}
		},
		pwh_bh_level_bogenhafen_slum_the_wall_01 = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_bh_level_bogenhafen_slum_the_wall_01"
			},
			sound_events = {
				[1.0] = "pwh_bh_level_bogenhafen_slum_the_wall_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 7.9911041259766
			}
		},
		pwh_ze_level_bogenhafen_slum_noble_food = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_noble_food_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_noble_food_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 12.436103820801
			}
		},
		pwh_ze_level_bogenhafen_slum_blackfire = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_blackfire_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_slum_blackfire_01"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 7.6250414848328
			}
		},
		pwh_level_bogenhafen_slum_cannon = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_cannon_01",
				"pwh_level_bogenhafen_slum_cannon_02",
				"pwh_level_bogenhafen_slum_cannon_03",
				"pwh_level_bogenhafen_slum_cannon_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_cannon_01",
				"pwh_level_bogenhafen_slum_cannon_02",
				"pwh_level_bogenhafen_slum_cannon_03",
				"pwh_level_bogenhafen_slum_cannon_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.9253125190735,
				1.5779583454132,
				4.011604309082,
				3.6875207424164
			}
		},
		pwh_level_bogenhafen_slum_the_wall = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_the_wall_01",
				"pwh_level_bogenhafen_slum_the_wall_02",
				"pwh_level_bogenhafen_slum_the_wall_03",
				"pwh_level_bogenhafen_slum_the_wall_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_the_wall_01",
				"pwh_level_bogenhafen_slum_the_wall_02",
				"pwh_level_bogenhafen_slum_the_wall_03",
				"pwh_level_bogenhafen_slum_the_wall_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.3407499790192,
				5.5284376144409,
				5.6943960189819,
				4.6663751602173
			}
		},
		pwh_level_bogenhafen_slum_slum = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_slum_01",
				"pwh_level_bogenhafen_slum_slum_02",
				"pwh_level_bogenhafen_slum_slum_03",
				"pwh_level_bogenhafen_slum_slum_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_slum_01",
				"pwh_level_bogenhafen_slum_slum_02",
				"pwh_level_bogenhafen_slum_slum_03",
				"pwh_level_bogenhafen_slum_slum_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.0054998397827,
				6.5061664581299,
				5.8976459503174,
				5.1584582328796
			}
		},
		pwh_level_bogenhafen_slum_noble_food = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_noble_food_01",
				"pwh_level_bogenhafen_slum_noble_food_02",
				"pwh_level_bogenhafen_slum_noble_food_03",
				"pwh_level_bogenhafen_slum_noble_food_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_noble_food_01",
				"pwh_level_bogenhafen_slum_noble_food_02",
				"pwh_level_bogenhafen_slum_noble_food_03",
				"pwh_level_bogenhafen_slum_noble_food_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.9375624656677,
				5.5794792175293,
				8.1195421218872,
				4.8943333625794
			}
		},
		pwh_level_bogenhafen_slum_intro_c = {
			face_animations_n = 2,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_level_bogenhafen_slum_intro_c_01",
				[2.0] = "pwh_level_bogenhafen_slum_intro_c_02"
			},
			sound_events = {
				[1.0] = "pwh_level_bogenhafen_slum_intro_c_01",
				[2.0] = "pwh_level_bogenhafen_slum_intro_c_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.0454792976379,
				[2.0] = 5.2361249923706
			}
		},
		pwh_bh_level_bogenhafen_slum_gang = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_bh_level_bogenhafen_slum_gang_01"
			},
			sound_events = {
				[1.0] = "pwh_bh_level_bogenhafen_slum_gang_01"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 7.1976456642151
			}
		},
		pwh_level_bogenhafen_slum_end = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_slum",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_slum_end_01",
				"pwh_level_bogenhafen_slum_end_02",
				"pwh_level_bogenhafen_slum_end_03",
				"pwh_level_bogenhafen_slum_end_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_slum_end_01",
				"pwh_level_bogenhafen_slum_end_02",
				"pwh_level_bogenhafen_slum_end_03",
				"pwh_level_bogenhafen_slum_end_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.4559998512268,
				4.5708751678467,
				5.5681457519531,
				7.6100416183472
			}
		}
	})
end
