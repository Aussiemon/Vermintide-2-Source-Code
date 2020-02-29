return function ()
	define_rule({
		name = "pwe_level_bogenhafen_slum_slum",
		response = "pwe_level_bogenhafen_slum_slum",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_sh_level_bogenhafen_slum_slum",
		response = "pwe_sh_level_bogenhafen_slum_slum",
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
				"player_career",
				OP.EQ,
				"we_shade"
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
		name = "pwe_level_bogenhafen_slum_the_58",
		response = "pwe_level_bogenhafen_slum_the_58",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_sh_level_bogenhafen_slum_the_58",
		response = "pwe_sh_level_bogenhafen_slum_the_58",
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
				"player_career",
				OP.EQ,
				"we_shade"
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
		name = "pwe_level_bogenhafen_slum_river",
		response = "pwe_level_bogenhafen_slum_river",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_hm_level_bogenhafen_slum_river",
		response = "pwe_hm_level_bogenhafen_slum_river",
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
				"player_career",
				OP.EQ,
				"we_maidenguard"
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
		name = "pwe_level_bogenhafen_slum_squalor",
		response = "pwe_level_bogenhafen_slum_squalor",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_bogenhafen_slum_blackfire",
		response = "pwe_level_bogenhafen_slum_blackfire",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_hm_level_bogenhafen_slum_blackfire",
		response = "pwe_hm_level_bogenhafen_slum_blackfire",
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
				"player_career",
				OP.EQ,
				"we_maidenguard"
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
		name = "pwe_level_bogenhafen_slum_gang",
		response = "pwe_level_bogenhafen_slum_gang",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_sh_level_bogenhafen_slum_gang",
		response = "pwe_sh_level_bogenhafen_slum_gang",
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
				"player_career",
				OP.EQ,
				"we_shade"
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
		name = "pwe_level_bogenhafen_slum_find_hideout",
		response = "pwe_level_bogenhafen_slum_find_hideout",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_bogenhafen_slum_too_quiet",
		response = "pwe_level_bogenhafen_slum_too_quiet",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_hm_level_bogenhafen_slum_too_quiet",
		response = "pwe_hm_level_bogenhafen_slum_too_quiet",
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
				"player_career",
				OP.EQ,
				"we_maidenguard"
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
		name = "pwe_level_bogenhafen_slum_stolen_goods",
		response = "pwe_level_bogenhafen_slum_stolen_goods",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_sh_level_bogenhafen_slum_stolen_goods",
		response = "pwe_sh_level_bogenhafen_slum_stolen_goods",
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
				"player_career",
				OP.EQ,
				"we_shade"
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
		name = "pwe_level_bogenhafen_slum_foul_air",
		response = "pwe_level_bogenhafen_slum_foul_air",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_hm_level_bogenhafen_slum_foul_air",
		response = "pwe_hm_level_bogenhafen_slum_foul_air",
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
				"player_career",
				OP.EQ,
				"we_maidenguard"
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
		name = "pwe_level_bogenhafen_slum_ambush",
		response = "pwe_level_bogenhafen_slum_ambush",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_bogenhafen_slum_fortify",
		response = "pwe_level_bogenhafen_slum_fortify",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_hm_level_bogenhafen_slum_fortify",
		response = "pwe_hm_level_bogenhafen_slum_fortify",
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
				"player_career",
				OP.EQ,
				"we_maidenguard"
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
		name = "pwe_level_bogenhafen_slum_search",
		response = "pwe_level_bogenhafen_slum_search",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_hm_level_bogenhafen_slum_search",
		response = "pwe_hm_level_bogenhafen_slum_search",
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
				"player_career",
				OP.EQ,
				"we_maidenguard"
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
		name = "pwe_level_bogenhafen_slum_tainted_food",
		response = "pwe_level_bogenhafen_slum_tainted_food",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_sh_level_bogenhafen_slum_tainted_food",
		response = "pwe_sh_level_bogenhafen_slum_tainted_food",
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
				"player_career",
				OP.EQ,
				"we_shade"
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
		name = "pwe_level_bogenhafen_slum_noble_food",
		response = "pwe_level_bogenhafen_slum_noble_food",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_bogenhafen_slum_burn_food",
		response = "pwe_level_bogenhafen_slum_burn_food",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_hm_level_bogenhafen_slum_burn_food",
		response = "pwe_hm_level_bogenhafen_slum_burn_food",
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
				"player_career",
				OP.EQ,
				"we_maidenguard"
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
		name = "pwe_level_bogenhafen_slum_cannon",
		response = "pwe_level_bogenhafen_slum_cannon",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_bogenhafen_slum_noisy_exit",
		response = "pwe_level_bogenhafen_slum_noisy_exit",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_bogenhafen_slum_escape",
		response = "pwe_level_bogenhafen_slum_escape",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_sh_level_bogenhafen_slum_escape",
		response = "pwe_sh_level_bogenhafen_slum_escape",
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
				"player_career",
				OP.EQ,
				"we_shade"
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
		name = "pwe_level_bogenhafen_slum_the_wall",
		response = "pwe_level_bogenhafen_slum_the_wall",
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
				"pwe_level_bogenhafen_slum_the_wall"
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
				"faction_memory",
				"pwe_level_bogenhafen_slum_the_wall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_level_bogenhafen_slum_the_wall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_bogenhafen_slum_end",
		response = "pwe_level_bogenhafen_slum_end",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_bogenhafen_slum_intro_a",
		response = "pwe_level_bogenhafen_slum_intro_a",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_level_bogenhafen_slum_intro_b",
		response = "pwe_level_bogenhafen_slum_intro_b",
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
				"wood_elf"
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
		name = "pwe_level_bogenhafen_slum_intro_c",
		response = "pwe_level_bogenhafen_slum_intro_c",
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
				"wood_elf"
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
		name = "pwe_level_bogenhafen_slum_fortify_prep",
		response = "pwe_level_bogenhafen_slum_fortify_prep",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		pwe_sh_level_bogenhafen_slum_escape = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_escape_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.1363124847412
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_escape_01"
			}
		},
		pwe_level_bogenhafen_slum_end = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_end_01",
				"pwe_level_bogenhafen_slum_end_02",
				"pwe_level_bogenhafen_slum_end_03",
				"pwe_level_bogenhafen_slum_end_04"
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
				5.6732707023621,
				4.9606666564941,
				4.8917083740234,
				4.6395416259766
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_end_01",
				"pwe_level_bogenhafen_slum_end_02",
				"pwe_level_bogenhafen_slum_end_03",
				"pwe_level_bogenhafen_slum_end_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_the_wall = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_the_wall_01",
				"pwe_level_bogenhafen_slum_the_wall_02",
				"pwe_level_bogenhafen_slum_the_wall_03",
				"pwe_level_bogenhafen_slum_the_wall_04"
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
				1.9954792261124,
				3.3323540687561,
				2.7688748836517,
				2.5457916259766
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_the_wall_01",
				"pwe_level_bogenhafen_slum_the_wall_02",
				"pwe_level_bogenhafen_slum_the_wall_03",
				"pwe_level_bogenhafen_slum_the_wall_04"
			},
			randomize_indexes = {}
		},
		pwe_hm_level_bogenhafen_slum_blackfire = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_blackfire_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_blackfire_01"
			}
		},
		pwe_level_bogenhafen_slum_find_hideout = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_find_hideout_01",
				"pwe_level_bogenhafen_slum_find_hideout_02",
				"pwe_level_bogenhafen_slum_find_hideout_03",
				"pwe_level_bogenhafen_slum_find_hideout_04"
			},
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
			sound_events_duration = {
				2.4800417423248,
				2.5981457233429,
				2.1412916183472,
				5.3696250915527
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_find_hideout_01",
				"pwe_level_bogenhafen_slum_find_hideout_02",
				"pwe_level_bogenhafen_slum_find_hideout_03",
				"pwe_level_bogenhafen_slum_find_hideout_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_tainted_food = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_tainted_food_01",
				"pwe_level_bogenhafen_slum_tainted_food_02",
				"pwe_level_bogenhafen_slum_tainted_food_03",
				"pwe_level_bogenhafen_slum_tainted_food_04"
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
				2.3751459121704,
				2.290374994278,
				2.8784375190735,
				4.0918960571289
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_tainted_food_01",
				"pwe_level_bogenhafen_slum_tainted_food_02",
				"pwe_level_bogenhafen_slum_tainted_food_03",
				"pwe_level_bogenhafen_slum_tainted_food_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_blackfire = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_blackfire_01",
				"pwe_level_bogenhafen_slum_blackfire_02",
				"pwe_level_bogenhafen_slum_blackfire_03",
				"pwe_level_bogenhafen_slum_blackfire_04"
			},
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
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_blackfire_01",
				"pwe_level_bogenhafen_slum_blackfire_02",
				"pwe_level_bogenhafen_slum_blackfire_03",
				"pwe_level_bogenhafen_slum_blackfire_04"
			},
			randomize_indexes = {}
		},
		pwe_sh_level_bogenhafen_slum_stolen_goods = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_stolen_goods_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 9.565333366394
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_stolen_goods_01"
			}
		},
		pwe_level_bogenhafen_slum_noisy_exit = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_noisy_exit_01",
				"pwe_level_bogenhafen_slum_noisy_exit_02",
				"pwe_level_bogenhafen_slum_noisy_exit_03",
				"pwe_level_bogenhafen_slum_noisy_exit_04"
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
				2.524749994278,
				3.0455417633057,
				3.0514166355133,
				5.9168334007263
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_noisy_exit_01",
				"pwe_level_bogenhafen_slum_noisy_exit_02",
				"pwe_level_bogenhafen_slum_noisy_exit_03",
				"pwe_level_bogenhafen_slum_noisy_exit_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_ambush = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_ambush_01",
				"pwe_level_bogenhafen_slum_ambush_02",
				"pwe_level_bogenhafen_slum_ambush_03",
				"pwe_level_bogenhafen_slum_ambush_04"
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
				1.9411041736603,
				2.4177083969116,
				3.004499912262,
				3.1946666240692
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_ambush_01",
				"pwe_level_bogenhafen_slum_ambush_02",
				"pwe_level_bogenhafen_slum_ambush_03",
				"pwe_level_bogenhafen_slum_ambush_04"
			},
			randomize_indexes = {}
		},
		pwe_hm_level_bogenhafen_slum_search = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_search_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.2078125476837
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_search_01"
			}
		},
		pwe_level_bogenhafen_slum_river = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_river_01",
				"pwe_level_bogenhafen_slum_river_02",
				"pwe_level_bogenhafen_slum_river_03",
				"pwe_level_bogenhafen_slum_river_04"
			},
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
			sound_events_duration = {
				2.1292917728424,
				2.7816457748413,
				3.8165624141693,
				2.7880833148956
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_river_01",
				"pwe_level_bogenhafen_slum_river_02",
				"pwe_level_bogenhafen_slum_river_03",
				"pwe_level_bogenhafen_slum_river_04"
			},
			randomize_indexes = {}
		},
		pwe_hm_level_bogenhafen_slum_too_quiet = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_too_quiet_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 4.5585832595825
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_too_quiet_01"
			}
		},
		pwe_hm_level_bogenhafen_slum_fortify = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_fortify_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.5248124599457
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_fortify_01"
			}
		},
		pwe_level_bogenhafen_slum_cannon = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_cannon_01",
				"pwe_level_bogenhafen_slum_cannon_02",
				"pwe_level_bogenhafen_slum_cannon_03",
				"pwe_level_bogenhafen_slum_cannon_04"
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
				3.2249999046326,
				4.1075210571289,
				3.0029375553131,
				4.9458956718445
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_cannon_01",
				"pwe_level_bogenhafen_slum_cannon_02",
				"pwe_level_bogenhafen_slum_cannon_03",
				"pwe_level_bogenhafen_slum_cannon_04"
			},
			randomize_indexes = {}
		},
		pwe_hm_level_bogenhafen_slum_foul_air = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_foul_air_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5913333892822
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_foul_air_01"
			}
		},
		pwe_level_bogenhafen_slum_fortify = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_fortify_01",
				"pwe_level_bogenhafen_slum_fortify_02",
				"pwe_level_bogenhafen_slum_fortify_03",
				"pwe_level_bogenhafen_slum_fortify_04"
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
				3.0187709331513,
				3.3527915477753,
				3.6890833377838,
				4.9254584312439
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_fortify_01",
				"pwe_level_bogenhafen_slum_fortify_02",
				"pwe_level_bogenhafen_slum_fortify_03",
				"pwe_level_bogenhafen_slum_fortify_04"
			},
			randomize_indexes = {}
		},
		pwe_sh_level_bogenhafen_slum_slum = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_slum_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.4660832881927
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_slum_01"
			}
		},
		pwe_level_bogenhafen_slum_escape = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_escape_01",
				"pwe_level_bogenhafen_slum_escape_02",
				"pwe_level_bogenhafen_slum_escape_03",
				"pwe_level_bogenhafen_slum_escape_04"
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
				2.7090833187103,
				2.0567708015442,
				3.5046875476837,
				3.1013123989105
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_escape_01",
				"pwe_level_bogenhafen_slum_escape_02",
				"pwe_level_bogenhafen_slum_escape_03",
				"pwe_level_bogenhafen_slum_escape_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_fortify_prep = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_fortify_prep_01",
				"pwe_level_bogenhafen_slum_fortify_prep_02",
				"pwe_level_bogenhafen_slum_fortify_prep_03",
				"pwe_level_bogenhafen_slum_fortify_prep_04"
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
				2.8714165687561,
				3.9363541603088,
				3.8094167709351,
				2.4815833568573
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_fortify_prep_01",
				"pwe_level_bogenhafen_slum_fortify_prep_02",
				"pwe_level_bogenhafen_slum_fortify_prep_03",
				"pwe_level_bogenhafen_slum_fortify_prep_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_level_bogenhafen_slum_intro_c_01",
				[2.0] = "pwe_level_bogenhafen_slum_intro_c_02"
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
				[1.0] = 4.6017498970032,
				[2.0] = 4.5089373588562
			},
			localization_strings = {
				[1.0] = "pwe_level_bogenhafen_slum_intro_c_01",
				[2.0] = "pwe_level_bogenhafen_slum_intro_c_02"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_level_bogenhafen_slum_intro_b_01",
				[2.0] = "pwe_level_bogenhafen_slum_intro_b_02"
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
				[1.0] = 5.341833114624,
				[2.0] = 4.1101040840149
			},
			localization_strings = {
				[1.0] = "pwe_level_bogenhafen_slum_intro_b_01",
				[2.0] = "pwe_level_bogenhafen_slum_intro_b_02"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_intro_a = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_level_bogenhafen_slum_intro_a_01",
				[2.0] = "pwe_level_bogenhafen_slum_intro_a_02"
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
				[1.0] = 5.6034164428711,
				[2.0] = 4.8662085533142
			},
			localization_strings = {
				[1.0] = "pwe_level_bogenhafen_slum_intro_a_01",
				[2.0] = "pwe_level_bogenhafen_slum_intro_a_02"
			},
			randomize_indexes = {}
		},
		pwe_sh_level_bogenhafen_slum_tainted_food = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_tainted_food_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 5.6461043357849
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_tainted_food_01"
			}
		},
		pwe_level_bogenhafen_slum_gang = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_level_bogenhafen_slum_gang_02",
				[2.0] = "pwe_level_bogenhafen_slum_gang_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9903333187103,
				[2.0] = 6.3444790840149
			},
			localization_strings = {
				[1.0] = "pwe_level_bogenhafen_slum_gang_02",
				[2.0] = "pwe_level_bogenhafen_slum_gang_03"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_foul_air = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_foul_air_01",
				"pwe_level_bogenhafen_slum_foul_air_02",
				"pwe_level_bogenhafen_slum_foul_air_03",
				"pwe_level_bogenhafen_slum_foul_air_04"
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
				2.4253125190735,
				3.4690208435059,
				3.9855000972748,
				3.4395833015442
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_foul_air_01",
				"pwe_level_bogenhafen_slum_foul_air_02",
				"pwe_level_bogenhafen_slum_foul_air_03",
				"pwe_level_bogenhafen_slum_foul_air_04"
			},
			randomize_indexes = {}
		},
		pwe_sh_level_bogenhafen_slum_gang = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_gang_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			sound_events_duration = {
				[1.0] = 7.2257709503174
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_gang_01"
			}
		},
		pwe_level_bogenhafen_slum_stolen_goods = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_stolen_goods_01",
				"pwe_level_bogenhafen_slum_stolen_goods_02",
				"pwe_level_bogenhafen_slum_stolen_goods_03",
				"pwe_level_bogenhafen_slum_stolen_goods_04"
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
				2.7861874103546,
				3.7382082939148,
				3.9374582767487,
				4.2624373435974
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_stolen_goods_01",
				"pwe_level_bogenhafen_slum_stolen_goods_02",
				"pwe_level_bogenhafen_slum_stolen_goods_03",
				"pwe_level_bogenhafen_slum_stolen_goods_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_squalor = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_squalor_01",
				"pwe_level_bogenhafen_slum_squalor_02",
				"pwe_level_bogenhafen_slum_squalor_03",
				"pwe_level_bogenhafen_slum_squalor_04"
			},
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
			sound_events_duration = {
				6.4317083358765,
				3.6909582614899,
				3.3026874065399,
				4.3441667556763
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_squalor_01",
				"pwe_level_bogenhafen_slum_squalor_02",
				"pwe_level_bogenhafen_slum_squalor_03",
				"pwe_level_bogenhafen_slum_squalor_04"
			},
			randomize_indexes = {}
		},
		pwe_sh_level_bogenhafen_slum_the_58 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_the_58_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 6.9081873893738
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_slum_the_58_01"
			}
		},
		pwe_level_bogenhafen_slum_burn_food = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_burn_food_01",
				"pwe_level_bogenhafen_slum_burn_food_02",
				"pwe_level_bogenhafen_slum_burn_food_03",
				"pwe_level_bogenhafen_slum_burn_food_04"
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
				3.0295832157135,
				2.1985833644867,
				2.7735209465027,
				3.9358749389648
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_burn_food_01",
				"pwe_level_bogenhafen_slum_burn_food_02",
				"pwe_level_bogenhafen_slum_burn_food_03",
				"pwe_level_bogenhafen_slum_burn_food_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_search = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_search_01",
				"pwe_level_bogenhafen_slum_search_02",
				"pwe_level_bogenhafen_slum_search_03",
				"pwe_level_bogenhafen_slum_search_04"
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
				3.7032916545868,
				2.3826041221619,
				2.087354183197,
				5.4416666030884
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_search_01",
				"pwe_level_bogenhafen_slum_search_02",
				"pwe_level_bogenhafen_slum_search_03",
				"pwe_level_bogenhafen_slum_search_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_noble_food = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_noble_food_01",
				"pwe_level_bogenhafen_slum_noble_food_02",
				"pwe_level_bogenhafen_slum_noble_food_03",
				"pwe_level_bogenhafen_slum_noble_food_04"
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
				4.4254789352417,
				4.7984166145325,
				4.9624791145325,
				2.9626250267029
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_noble_food_01",
				"pwe_level_bogenhafen_slum_noble_food_02",
				"pwe_level_bogenhafen_slum_noble_food_03",
				"pwe_level_bogenhafen_slum_noble_food_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_too_quiet = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_too_quiet_01",
				"pwe_level_bogenhafen_slum_too_quiet_02",
				"pwe_level_bogenhafen_slum_too_quiet_03",
				"pwe_level_bogenhafen_slum_too_quiet_04"
			},
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
			sound_events_duration = {
				4.2784790992737,
				3.6708750724792,
				5.7086668014526,
				4.2074165344238
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_too_quiet_01",
				"pwe_level_bogenhafen_slum_too_quiet_02",
				"pwe_level_bogenhafen_slum_too_quiet_03",
				"pwe_level_bogenhafen_slum_too_quiet_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_slum_slum = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_slum_01",
				"pwe_level_bogenhafen_slum_slum_02",
				"pwe_level_bogenhafen_slum_slum_03",
				"pwe_level_bogenhafen_slum_slum_04"
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
				5.9541459083557,
				4.7740831375122,
				2.7783541679382,
				4.3868541717529
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_slum_01",
				"pwe_level_bogenhafen_slum_slum_02",
				"pwe_level_bogenhafen_slum_slum_03",
				"pwe_level_bogenhafen_slum_slum_04"
			},
			randomize_indexes = {}
		},
		pwe_hm_level_bogenhafen_slum_burn_food = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_burn_food_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.1470623016357
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_burn_food_01"
			}
		},
		pwe_level_bogenhafen_slum_the_58 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_slum",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_slum_the_58_01",
				"pwe_level_bogenhafen_slum_the_58_02",
				"pwe_level_bogenhafen_slum_the_58_03",
				"pwe_level_bogenhafen_slum_the_58_04"
			},
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
			sound_events_duration = {
				4.4989581108093,
				5.8630208969116,
				3.7247500419617,
				4.6554789543152
			},
			localization_strings = {
				"pwe_level_bogenhafen_slum_the_58_01",
				"pwe_level_bogenhafen_slum_the_58_02",
				"pwe_level_bogenhafen_slum_the_58_03",
				"pwe_level_bogenhafen_slum_the_58_04"
			},
			randomize_indexes = {}
		},
		pwe_hm_level_bogenhafen_slum_river = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_slum",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_river_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.0220415592194
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_slum_river_01"
			}
		}
	})
end
