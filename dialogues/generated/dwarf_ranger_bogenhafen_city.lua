return function ()
	define_rule({
		name = "pdr_level_bogenhafen_city_sewers",
		response = "pdr_level_bogenhafen_city_sewers",
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
				"level_bogenhafen_city_sewers"
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
				"level_bogenhafen_city_sewers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_ib_level_bogenhafen_city_sewers",
		response = "pdr_ib_level_bogenhafen_city_sewers",
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
				"level_bogenhafen_city_sewers"
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
				"player_career",
				OP.EQ,
				"dr_ironbreaker"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_taking_too_long",
		response = "pdr_level_bogenhafen_city_taking_too_long",
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
				"level_bogenhafen_city_taking_too_long"
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
				"level_bogenhafen_city_taking_too_long",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_taking_too_long",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_sl_level_bogenhafen_city_taking_too_long",
		response = "pdr_sl_level_bogenhafen_city_taking_too_long",
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
				"level_bogenhafen_city_taking_too_long"
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
				"player_career",
				OP.EQ,
				"dr_ironbreaker"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_taking_too_long",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_taking_too_long",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_torch",
		response = "pdr_level_bogenhafen_city_torch",
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
				"level_bogenhafen_city_torch"
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
				"level_bogenhafen_city_torch",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_torch",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_blocked",
		response = "pdr_level_bogenhafen_city_blocked",
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
				"level_bogenhafen_city_blocked"
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
				"level_bogenhafen_city_blocked",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_blocked",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_braziers",
		response = "pdr_level_bogenhafen_city_braziers",
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
				"level_bogenhafen_city_braziers"
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
				"level_bogenhafen_city_braziers",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_braziers",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_here_they_come",
		response = "pdr_level_bogenhafen_city_here_they_come",
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
				"level_bogenhafen_city_here_they_come"
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
				"level_bogenhafen_city_here_they_come",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_here_they_come",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_sl_level_bogenhafen_city_here_they_come",
		response = "pdr_sl_level_bogenhafen_city_here_they_come",
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
				"level_bogenhafen_city_here_they_come"
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
				"player_career",
				OP.EQ,
				"dr_slayer"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_here_they_come",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_here_they_come",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_way_out",
		response = "pdr_level_bogenhafen_city_way_out",
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
				"level_bogenhafen_city_way_out"
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
				"level_bogenhafen_city_way_out",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_way_out",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_ib_level_bogenhafen_city_way_out",
		response = "pdr_ib_level_bogenhafen_city_way_out",
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
				"level_bogenhafen_city_way_out"
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
				"player_career",
				OP.EQ,
				"dr_ironbreaker"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_way_out",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_way_out",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_raining",
		response = "pdr_level_bogenhafen_city_raining",
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
				"level_bogenhafen_city_raining"
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
				"level_bogenhafen_city_raining",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_raining",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_ib_level_bogenhafen_city_raining",
		response = "pdr_ib_level_bogenhafen_city_raining",
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
				"level_bogenhafen_city_raining"
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
				"player_career",
				OP.EQ,
				"dr_ironbreaker"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_raining",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_raining",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_smoke_pillar",
		response = "pdr_level_bogenhafen_city_smoke_pillar",
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
				"level_bogenhafen_city_smoke_pillar"
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
				"level_bogenhafen_city_smoke_pillar",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_smoke_pillar",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_ib_level_bogenhafen_city_smoke_pillar",
		response = "pdr_ib_level_bogenhafen_city_smoke_pillar",
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
				"level_bogenhafen_city_smoke_pillar"
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
				"player_career",
				OP.EQ,
				"dr_ironbreaker"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_smoke_pillar",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_smoke_pillar",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_revelry",
		response = "pdr_level_bogenhafen_city_revelry",
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
				"level_bogenhafen_city_revelry"
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
				"level_bogenhafen_city_revelry",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_revelry",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_sl_level_bogenhafen_city_revelry",
		response = "pdr_sl_level_bogenhafen_city_revelry",
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
				"level_bogenhafen_city_revelry"
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
				"player_career",
				OP.EQ,
				"dr_slayer"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_revelry",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_revelry",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_bögenauer",
		response = "pdr_level_bogenhafen_city_bögenauer",
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
				"level_bogenhafen_city_bögenauer"
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
				"level_bogenhafen_city_bögenauer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_bögenauer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_sl_level_bogenhafen_city_bogenauer",
		response = "pdr_sl_level_bogenhafen_city_bogenauer",
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
				"level_bogenhafen_city_bögenauer"
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
				"player_career",
				OP.EQ,
				"dr_slayer"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_bögenauer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_bögenauer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_infestation",
		response = "pdr_level_bogenhafen_city_infestation",
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
				"level_bogenhafen_city_infestation"
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
				"level_bogenhafen_city_infestation",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_infestation",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_find_priest_key",
		response = "pdr_level_bogenhafen_city_find_priest_key",
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
				"level_bogenhafen_city_find_priest_key"
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
				"pdr_level_bogenhafen_city_find_priest_key",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_level_bogenhafen_city_find_priest_key",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_ib_level_bogenhafen_city_find_priest_key",
		response = "pdr_ib_level_bogenhafen_city_find_priest_key",
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
				"level_bogenhafen_city_find_priest_key"
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
				"player_career",
				OP.EQ,
				"dr_ironbreaker"
			},
			{
				"faction_memory",
				"pdr_level_bogenhafen_city_find_priest_key",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_level_bogenhafen_city_find_priest_key",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_dead_priest",
		response = "pdr_level_bogenhafen_city_dead_priest",
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
				"level_bogenhafen_city_dead_priest"
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
				"level_bogenhafen_city_dead_priest",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_dead_priest",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_sl_level_bogenhafen_city_dead_priest",
		response = "pdr_sl_level_bogenhafen_city_dead_priest",
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
				"level_bogenhafen_city_dead_priest"
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
				"player_career",
				OP.EQ,
				"dr_slayer"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_dead_priest",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_dead_priest",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_temple",
		response = "pdr_level_bogenhafen_city_temple",
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
				"level_bogenhafen_city_temple"
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
				"level_bogenhafen_city_temple",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_temple",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_defiled",
		response = "pdr_level_bogenhafen_city_defiled",
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
				"level_bogenhafen_city_defiled"
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
				"level_bogenhafen_city_defiled",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_defiled",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_artefact",
		response = "pdr_level_bogenhafen_city_artefact",
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
				"level_bogenhafen_city_artefact"
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
				"level_bogenhafen_city_artefact",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_found_artefact",
		response = "pdr_level_bogenhafen_city_found_artefact",
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
				"level_bogenhafen_city_found_artefact"
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
				"level_bogenhafen_city_found_artefact",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_found_artefact",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_escape",
		response = "pdr_level_bogenhafen_city_escape",
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
				"level_bogenhafen_city_escape"
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
				"level_bogenhafen_city_escape",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_escape",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_ib_level_bogenhafen_city_escape_01",
		response = "pdr_ib_level_bogenhafen_city_escape_01",
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
				"level_bogenhafen_city_escape"
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
				"player_career",
				OP.EQ,
				"dr_ironbreaker"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_escape",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_escape",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_keep_moving",
		response = "pdr_level_bogenhafen_city_keep_moving",
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
				"level_bogenhafen_city_keep_moving"
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
				"level_bogenhafen_city_keep_moving",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_keep_moving",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_intro_a",
		response = "pdr_level_bogenhafen_city_intro_a",
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
				"level_bogenhafen_city_intro_a"
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
				"level_bogenhafen_city_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_intro_b",
		response = "pdr_level_bogenhafen_city_intro_b",
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
				"level_bogenhafen_city_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_bogenhafen_city_intro_c",
		response = "pdr_level_bogenhafen_city_intro_c",
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
				"level_bogenhafen_city_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pdr_level_bogenhafen_city_objective_next",
		name = "pdr_level_bogenhafen_city_objective_next",
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
				"level_bogenhafen_city_objective_next"
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
			}
		}
	})
	add_dialogues({
		pdr_level_bogenhafen_city_temple = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_temple_01",
				"pdr_level_bogenhafen_city_temple_02",
				"pdr_level_bogenhafen_city_temple_03",
				"pdr_level_bogenhafen_city_temple_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_temple_01",
				"pdr_level_bogenhafen_city_temple_02",
				"pdr_level_bogenhafen_city_temple_03",
				"pdr_level_bogenhafen_city_temple_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_bogenhafen_city_intro_b_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_b_02"
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
				[1.0] = "pdr_level_bogenhafen_city_intro_b_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_bogenhafen_city_intro_c_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_c_02"
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
				[1.0] = "pdr_level_bogenhafen_city_intro_c_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_sl_level_bogenhafen_city_bogenauer = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_sl_level_bogenhafen_city_bogenauer_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_sl_level_bogenhafen_city_bogenauer_01"
			}
		},
		pdr_level_bogenhafen_city_way_out = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_way_out_01",
				"pdr_level_bogenhafen_city_way_out_02",
				"pdr_level_bogenhafen_city_way_out_03",
				"pdr_level_bogenhafen_city_way_out_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_way_out_01",
				"pdr_level_bogenhafen_city_way_out_02",
				"pdr_level_bogenhafen_city_way_out_03",
				"pdr_level_bogenhafen_city_way_out_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_infestation = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_infestation_01",
				"pdr_level_bogenhafen_city_infestation_02",
				"pdr_level_bogenhafen_city_infestation_03",
				"pdr_level_bogenhafen_city_infestation_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_infestation_01",
				"pdr_level_bogenhafen_city_infestation_02",
				"pdr_level_bogenhafen_city_infestation_03",
				"pdr_level_bogenhafen_city_infestation_04"
			},
			randomize_indexes = {}
		},
		pdr_sl_level_bogenhafen_city_revelry = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_sl_level_bogenhafen_city_revelry_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_sl_level_bogenhafen_city_revelry_01"
			}
		},
		pdr_level_bogenhafen_city_taking_too_long = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_taking_too_long_01",
				"pdr_level_bogenhafen_city_taking_too_long_02",
				"pdr_level_bogenhafen_city_taking_too_long_03",
				"pdr_level_bogenhafen_city_taking_too_long_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_taking_too_long_01",
				"pdr_level_bogenhafen_city_taking_too_long_02",
				"pdr_level_bogenhafen_city_taking_too_long_03",
				"pdr_level_bogenhafen_city_taking_too_long_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_torch = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_torch_01",
				"pdr_level_bogenhafen_city_torch_02",
				"pdr_level_bogenhafen_city_torch_03",
				"pdr_level_bogenhafen_city_torch_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_torch_01",
				"pdr_level_bogenhafen_city_torch_02",
				"pdr_level_bogenhafen_city_torch_03",
				"pdr_level_bogenhafen_city_torch_04"
			},
			randomize_indexes = {}
		},
		pdr_ib_level_bogenhafen_city_sewers = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_sewers_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_sewers_01"
			}
		},
		pdr_sl_level_bogenhafen_city_dead_priest = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_sl_level_bogenhafen_city_dead_priest_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_sadness"
			},
			localization_strings = {
				[1.0] = "pdr_sl_level_bogenhafen_city_dead_priest_01"
			}
		},
		pdr_level_bogenhafen_city_defiled = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_defiled_01",
				"pdr_level_bogenhafen_city_defiled_02",
				"pdr_level_bogenhafen_city_defiled_03",
				"pdr_level_bogenhafen_city_defiled_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pdr_level_bogenhafen_city_defiled_01",
				"pdr_level_bogenhafen_city_defiled_02",
				"pdr_level_bogenhafen_city_defiled_03",
				"pdr_level_bogenhafen_city_defiled_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_artefact = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "cut_scene",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_artefact_01",
				"pdr_level_bogenhafen_city_artefact_02",
				"pdr_level_bogenhafen_city_artefact_03",
				"pdr_level_bogenhafen_city_artefact_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_artefact_01",
				"pdr_level_bogenhafen_city_artefact_02",
				"pdr_level_bogenhafen_city_artefact_03",
				"pdr_level_bogenhafen_city_artefact_04"
			},
			randomize_indexes = {}
		},
		pdr_ib_level_bogenhafen_city_raining = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_raining_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_exhausted"
			},
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_raining_01"
			}
		},
		pdr_level_bogenhafen_city_bögenauer = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_bögenauer_01",
				"pdr_level_bogenhafen_city_bögenauer_02",
				"pdr_level_bogenhafen_city_bögenauer_03",
				"pdr_level_bogenhafen_city_bögenauer_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_bögenauer_01",
				"pdr_level_bogenhafen_city_bögenauer_02",
				"pdr_level_bogenhafen_city_bögenauer_03",
				"pdr_level_bogenhafen_city_bögenauer_04"
			},
			randomize_indexes = {}
		},
		pdr_sl_level_bogenhafen_city_taking_too_long = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_sl_level_bogenhafen_city_taking_too_long_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_sl_level_bogenhafen_city_taking_too_long_01"
			}
		},
		pdr_ib_level_bogenhafen_city_way_out = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_way_out_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_way_out_01"
			}
		},
		pdr_level_bogenhafen_city_smoke_pillar = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_smoke_pillar_01",
				"pdr_level_bogenhafen_city_smoke_pillar_02",
				"pdr_level_bogenhafen_city_smoke_pillar_03",
				"pdr_level_bogenhafen_city_smoke_pillar_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_smoke_pillar_01",
				"pdr_level_bogenhafen_city_smoke_pillar_02",
				"pdr_level_bogenhafen_city_smoke_pillar_03",
				"pdr_level_bogenhafen_city_smoke_pillar_04"
			},
			randomize_indexes = {}
		},
		pdr_ib_level_bogenhafen_city_smoke_pillar = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_smoke_pillar_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_smoke_pillar_01"
			}
		},
		pdr_level_bogenhafen_city_find_priest_key = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_find_priest_key_01",
				"pdr_level_bogenhafen_city_find_priest_key_02",
				"pdr_level_bogenhafen_city_find_priest_key_03",
				"pdr_level_bogenhafen_city_find_priest_key_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_find_priest_key_01",
				"pdr_level_bogenhafen_city_find_priest_key_02",
				"pdr_level_bogenhafen_city_find_priest_key_03",
				"pdr_level_bogenhafen_city_find_priest_key_04"
			},
			randomize_indexes = {}
		},
		pdr_ib_level_bogenhafen_city_find_priest_key = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_find_priest_key_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_find_priest_key_01"
			}
		},
		pdr_level_bogenhafen_city_raining = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_raining_01",
				"pdr_level_bogenhafen_city_raining_02",
				"pdr_level_bogenhafen_city_raining_03",
				"pdr_level_bogenhafen_city_raining_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pdr_level_bogenhafen_city_raining_01",
				"pdr_level_bogenhafen_city_raining_02",
				"pdr_level_bogenhafen_city_raining_03",
				"pdr_level_bogenhafen_city_raining_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_keep_moving = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_keep_moving_01",
				"pdr_level_bogenhafen_city_keep_moving_02",
				"pdr_level_bogenhafen_city_keep_moving_03",
				"pdr_level_bogenhafen_city_keep_moving_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_keep_moving_01",
				"pdr_level_bogenhafen_city_keep_moving_02",
				"pdr_level_bogenhafen_city_keep_moving_03",
				"pdr_level_bogenhafen_city_keep_moving_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_objective_next = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_objective_next_01",
				"pdr_level_bogenhafen_city_objective_next_02",
				"pdr_level_bogenhafen_city_objective_next_03",
				"pdr_level_bogenhafen_city_objective_next_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_objective_next_01",
				"pdr_level_bogenhafen_city_objective_next_02",
				"pdr_level_bogenhafen_city_objective_next_03",
				"pdr_level_bogenhafen_city_objective_next_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_bogenhafen_city_intro_a_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_a_02"
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
				[1.0] = "pdr_level_bogenhafen_city_intro_a_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_blocked = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_blocked_01",
				"pdr_level_bogenhafen_city_blocked_02",
				"pdr_level_bogenhafen_city_blocked_03",
				"pdr_level_bogenhafen_city_blocked_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_blocked_01",
				"pdr_level_bogenhafen_city_blocked_02",
				"pdr_level_bogenhafen_city_blocked_03",
				"pdr_level_bogenhafen_city_blocked_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_revelry = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_revelry_01",
				"pdr_level_bogenhafen_city_revelry_02",
				"pdr_level_bogenhafen_city_revelry_03",
				"pdr_level_bogenhafen_city_revelry_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_revelry_01",
				"pdr_level_bogenhafen_city_revelry_02",
				"pdr_level_bogenhafen_city_revelry_03",
				"pdr_level_bogenhafen_city_revelry_04"
			},
			randomize_indexes = {}
		},
		pdr_ib_level_bogenhafen_city_escape_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_escape_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_escape_01"
			}
		},
		pdr_level_bogenhafen_city_escape = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_escape_01",
				"pdr_level_bogenhafen_city_escape_02",
				"pdr_level_bogenhafen_city_escape_03",
				"pdr_level_bogenhafen_city_escape_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_escape_01",
				"pdr_level_bogenhafen_city_escape_02",
				"pdr_level_bogenhafen_city_escape_03",
				"pdr_level_bogenhafen_city_escape_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_dead_priest = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_dead_priest_01",
				"pdr_level_bogenhafen_city_dead_priest_02",
				"pdr_level_bogenhafen_city_dead_priest_03",
				"pdr_level_bogenhafen_city_dead_priest_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_sadness",
				"face_sadness",
				"face_sadness",
				"face_sadness"
			},
			localization_strings = {
				"pdr_level_bogenhafen_city_dead_priest_01",
				"pdr_level_bogenhafen_city_dead_priest_02",
				"pdr_level_bogenhafen_city_dead_priest_03",
				"pdr_level_bogenhafen_city_dead_priest_04"
			},
			randomize_indexes = {}
		},
		pdr_sl_level_bogenhafen_city_here_they_come = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_sl_level_bogenhafen_city_here_they_come_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			localization_strings = {
				[1.0] = "pdr_sl_level_bogenhafen_city_here_they_come_01"
			}
		},
		pdr_level_bogenhafen_city_found_artefact = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_found_artefact_01",
				"pdr_level_bogenhafen_city_found_artefact_02",
				"pdr_level_bogenhafen_city_found_artefact_03",
				"pdr_level_bogenhafen_city_found_artefact_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_found_artefact_01",
				"pdr_level_bogenhafen_city_found_artefact_02",
				"pdr_level_bogenhafen_city_found_artefact_03",
				"pdr_level_bogenhafen_city_found_artefact_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_sewers = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_sewers_01",
				"pdr_level_bogenhafen_city_sewers_02",
				"pdr_level_bogenhafen_city_sewers_03",
				"pdr_level_bogenhafen_city_sewers_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_sewers_01",
				"pdr_level_bogenhafen_city_sewers_02",
				"pdr_level_bogenhafen_city_sewers_03",
				"pdr_level_bogenhafen_city_sewers_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_here_they_come = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_here_they_come_01",
				"pdr_level_bogenhafen_city_here_they_come_02",
				"pdr_level_bogenhafen_city_here_they_come_03",
				"pdr_level_bogenhafen_city_here_they_come_04"
			},
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
				"pdr_level_bogenhafen_city_here_they_come_01",
				"pdr_level_bogenhafen_city_here_they_come_02",
				"pdr_level_bogenhafen_city_here_they_come_03",
				"pdr_level_bogenhafen_city_here_they_come_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bogenhafen_city_braziers = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bogenhafen_city_braziers_01",
				"pdr_level_bogenhafen_city_braziers_02",
				"pdr_level_bogenhafen_city_braziers_03",
				"pdr_level_bogenhafen_city_braziers_04"
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
			localization_strings = {
				"pdr_level_bogenhafen_city_braziers_01",
				"pdr_level_bogenhafen_city_braziers_02",
				"pdr_level_bogenhafen_city_braziers_03",
				"pdr_level_bogenhafen_city_braziers_04"
			},
			randomize_indexes = {}
		}
	})
end
