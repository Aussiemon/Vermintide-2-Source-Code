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
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_temple_01",
				"pdr_level_bogenhafen_city_temple_02",
				"pdr_level_bogenhafen_city_temple_03",
				"pdr_level_bogenhafen_city_temple_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_temple_01",
				"pdr_level_bogenhafen_city_temple_02",
				"pdr_level_bogenhafen_city_temple_03",
				"pdr_level_bogenhafen_city_temple_04"
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
				1.4965416193008,
				2.0969166755676,
				1.9544583559036,
				2.7716250419617
			}
		},
		pdr_ib_level_bogenhafen_city_way_out = {
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_way_out_01"
			},
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_way_out_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.5621042251587
			}
		},
		pdr_level_bogenhafen_city_escape = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_escape_01",
				"pdr_level_bogenhafen_city_escape_02",
				"pdr_level_bogenhafen_city_escape_03",
				"pdr_level_bogenhafen_city_escape_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_escape_01",
				"pdr_level_bogenhafen_city_escape_02",
				"pdr_level_bogenhafen_city_escape_03",
				"pdr_level_bogenhafen_city_escape_04"
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
				2.4416666030884,
				3.0212500095367,
				3.9062707424164,
				5.1441459655762
			}
		},
		pdr_level_bogenhafen_city_here_they_come = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_here_they_come_01",
				"pdr_level_bogenhafen_city_here_they_come_02",
				"pdr_level_bogenhafen_city_here_they_come_03",
				"pdr_level_bogenhafen_city_here_they_come_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_here_they_come_01",
				"pdr_level_bogenhafen_city_here_they_come_02",
				"pdr_level_bogenhafen_city_here_they_come_03",
				"pdr_level_bogenhafen_city_here_they_come_04"
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
				3.4006249904633,
				2.9398334026337,
				3.0215001106262,
				2.6831667423248
			}
		},
		pdr_ib_level_bogenhafen_city_sewers = {
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_sewers_01"
			},
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_sewers_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.7383751869202
			}
		},
		pdr_ib_level_bogenhafen_city_raining = {
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_raining_01"
			},
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_raining_01"
			},
			face_animations = {
				[1.0] = "face_exhausted"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 5.3903751373291
			}
		},
		pdr_sl_level_bogenhafen_city_taking_too_long = {
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_sl_level_bogenhafen_city_taking_too_long_01"
			},
			sound_events = {
				[1.0] = "pdr_sl_level_bogenhafen_city_taking_too_long_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.973249912262
			}
		},
		pdr_level_bogenhafen_city_blocked = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_blocked_01",
				"pdr_level_bogenhafen_city_blocked_02",
				"pdr_level_bogenhafen_city_blocked_03",
				"pdr_level_bogenhafen_city_blocked_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_blocked_01",
				"pdr_level_bogenhafen_city_blocked_02",
				"pdr_level_bogenhafen_city_blocked_03",
				"pdr_level_bogenhafen_city_blocked_04"
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
				5.3943748474121,
				4.7359790802002,
				2.564749956131,
				3.2200832366943
			}
		},
		pdr_level_bogenhafen_city_intro_a = {
			face_animations_n = 2,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_level_bogenhafen_city_intro_a_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_a_02"
			},
			sound_events = {
				[1.0] = "pdr_level_bogenhafen_city_intro_a_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_a_02"
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
				[1.0] = 6.3446249961853,
				[2.0] = 6.480103969574
			}
		},
		pdr_sl_level_bogenhafen_city_bogenauer = {
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_sl_level_bogenhafen_city_bogenauer_01"
			},
			sound_events = {
				[1.0] = "pdr_sl_level_bogenhafen_city_bogenauer_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.5588960647583
			}
		},
		pdr_level_bogenhafen_city_sewers = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_sewers_01",
				"pdr_level_bogenhafen_city_sewers_02",
				"pdr_level_bogenhafen_city_sewers_03",
				"pdr_level_bogenhafen_city_sewers_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_sewers_01",
				"pdr_level_bogenhafen_city_sewers_02",
				"pdr_level_bogenhafen_city_sewers_03",
				"pdr_level_bogenhafen_city_sewers_04"
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
				1.9640417098999,
				2.6011250019074,
				3.7640416622162,
				3.4476249217987
			}
		},
		pdr_sl_level_bogenhafen_city_revelry = {
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_sl_level_bogenhafen_city_revelry_01"
			},
			sound_events = {
				[1.0] = "pdr_sl_level_bogenhafen_city_revelry_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 6.106541633606
			}
		},
		pdr_level_bogenhafen_city_intro_c = {
			face_animations_n = 2,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_level_bogenhafen_city_intro_c_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_c_02"
			},
			sound_events = {
				[1.0] = "pdr_level_bogenhafen_city_intro_c_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_c_02"
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
				[1.0] = 5.6725001335144,
				[2.0] = 5.1629376411438
			}
		},
		pdr_ib_level_bogenhafen_city_escape_01 = {
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_escape_01"
			},
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_escape_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.0023956298828
			}
		},
		pdr_level_bogenhafen_city_braziers = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_braziers_01",
				"pdr_level_bogenhafen_city_braziers_02",
				"pdr_level_bogenhafen_city_braziers_03",
				"pdr_level_bogenhafen_city_braziers_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_braziers_01",
				"pdr_level_bogenhafen_city_braziers_02",
				"pdr_level_bogenhafen_city_braziers_03",
				"pdr_level_bogenhafen_city_braziers_04"
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
				2.9802083969116,
				3.6707291603088,
				2.9874792098999,
				1.875416636467
			}
		},
		pdr_sl_level_bogenhafen_city_dead_priest = {
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_sl_level_bogenhafen_city_dead_priest_01"
			},
			sound_events = {
				[1.0] = "pdr_sl_level_bogenhafen_city_dead_priest_01"
			},
			face_animations = {
				[1.0] = "face_sadness"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.8067083358765
			}
		},
		pdr_level_bogenhafen_city_way_out = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_way_out_01",
				"pdr_level_bogenhafen_city_way_out_02",
				"pdr_level_bogenhafen_city_way_out_03",
				"pdr_level_bogenhafen_city_way_out_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_way_out_01",
				"pdr_level_bogenhafen_city_way_out_02",
				"pdr_level_bogenhafen_city_way_out_03",
				"pdr_level_bogenhafen_city_way_out_04"
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
				2.4556875228882,
				3.9606041908264,
				5.1563539505005,
				3.0914790630341
			}
		},
		pdr_level_bogenhafen_city_defiled = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_defiled_01",
				"pdr_level_bogenhafen_city_defiled_02",
				"pdr_level_bogenhafen_city_defiled_03",
				"pdr_level_bogenhafen_city_defiled_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_defiled_01",
				"pdr_level_bogenhafen_city_defiled_02",
				"pdr_level_bogenhafen_city_defiled_03",
				"pdr_level_bogenhafen_city_defiled_04"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.1903541088104,
				2.8474373817444,
				2.8973751068115,
				3.0714166164398
			}
		},
		pdr_level_bogenhafen_city_dead_priest = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_dead_priest_01",
				"pdr_level_bogenhafen_city_dead_priest_02",
				"pdr_level_bogenhafen_city_dead_priest_03",
				"pdr_level_bogenhafen_city_dead_priest_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_dead_priest_01",
				"pdr_level_bogenhafen_city_dead_priest_02",
				"pdr_level_bogenhafen_city_dead_priest_03",
				"pdr_level_bogenhafen_city_dead_priest_04"
			},
			face_animations = {
				"face_sadness",
				"face_sadness",
				"face_sadness",
				"face_sadness"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1567916870117,
				4.6422500610352,
				5.1312084197998,
				4.2301664352417
			}
		},
		pdr_ib_level_bogenhafen_city_smoke_pillar = {
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_smoke_pillar_01"
			},
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_smoke_pillar_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 8.4113540649414
			}
		},
		pdr_level_bogenhafen_city_torch = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_torch_01",
				"pdr_level_bogenhafen_city_torch_02",
				"pdr_level_bogenhafen_city_torch_03",
				"pdr_level_bogenhafen_city_torch_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_torch_01",
				"pdr_level_bogenhafen_city_torch_02",
				"pdr_level_bogenhafen_city_torch_03",
				"pdr_level_bogenhafen_city_torch_04"
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
				3.4595000743866,
				2.7927498817444,
				3.9896457195282,
				1.8035207986832
			}
		},
		pdr_level_bogenhafen_city_objective_next = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_objective_next_01",
				"pdr_level_bogenhafen_city_objective_next_02",
				"pdr_level_bogenhafen_city_objective_next_03",
				"pdr_level_bogenhafen_city_objective_next_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_objective_next_01",
				"pdr_level_bogenhafen_city_objective_next_02",
				"pdr_level_bogenhafen_city_objective_next_03",
				"pdr_level_bogenhafen_city_objective_next_04"
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
				1.5841666460037,
				2.1873540878296,
				2.0237500667572,
				1.9389375448227
			}
		},
		pdr_level_bogenhafen_city_taking_too_long = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_taking_too_long_01",
				"pdr_level_bogenhafen_city_taking_too_long_02",
				"pdr_level_bogenhafen_city_taking_too_long_03",
				"pdr_level_bogenhafen_city_taking_too_long_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_taking_too_long_01",
				"pdr_level_bogenhafen_city_taking_too_long_02",
				"pdr_level_bogenhafen_city_taking_too_long_03",
				"pdr_level_bogenhafen_city_taking_too_long_04"
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
				2.1822707653046,
				2.3405208587647,
				1.9292291402817,
				3.1698334217072
			}
		},
		pdr_level_bogenhafen_city_artefact = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_artefact_01",
				"pdr_level_bogenhafen_city_artefact_02",
				"pdr_level_bogenhafen_city_artefact_03",
				"pdr_level_bogenhafen_city_artefact_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_artefact_01",
				"pdr_level_bogenhafen_city_artefact_02",
				"pdr_level_bogenhafen_city_artefact_03",
				"pdr_level_bogenhafen_city_artefact_04"
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
				3.1953959465027,
				2.4794166088104,
				2.1052498817444,
				3.650687456131
			}
		},
		pdr_level_bogenhafen_city_find_priest_key = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_find_priest_key_01",
				"pdr_level_bogenhafen_city_find_priest_key_02",
				"pdr_level_bogenhafen_city_find_priest_key_03",
				"pdr_level_bogenhafen_city_find_priest_key_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_find_priest_key_01",
				"pdr_level_bogenhafen_city_find_priest_key_02",
				"pdr_level_bogenhafen_city_find_priest_key_03",
				"pdr_level_bogenhafen_city_find_priest_key_04"
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
				2.4265208244324,
				3.0116250514984,
				2.0446875095367,
				4.6351041793823
			}
		},
		pdr_sl_level_bogenhafen_city_here_they_come = {
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_sl_level_bogenhafen_city_here_they_come_01"
			},
			sound_events = {
				[1.0] = "pdr_sl_level_bogenhafen_city_here_they_come_01"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 5.2650418281555
			}
		},
		pdr_level_bogenhafen_city_smoke_pillar = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_smoke_pillar_01",
				"pdr_level_bogenhafen_city_smoke_pillar_02",
				"pdr_level_bogenhafen_city_smoke_pillar_03",
				"pdr_level_bogenhafen_city_smoke_pillar_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_smoke_pillar_01",
				"pdr_level_bogenhafen_city_smoke_pillar_02",
				"pdr_level_bogenhafen_city_smoke_pillar_03",
				"pdr_level_bogenhafen_city_smoke_pillar_04"
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
				3.3166875839233,
				3.266458272934,
				6.8376040458679,
				5.6457290649414
			}
		},
		pdr_ib_level_bogenhafen_city_find_priest_key = {
			face_animations_n = 1,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_ib_level_bogenhafen_city_find_priest_key_01"
			},
			sound_events = {
				[1.0] = "pdr_ib_level_bogenhafen_city_find_priest_key_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 7.0856251716614
			}
		},
		pdr_level_bogenhafen_city_bögenauer = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_bögenauer_01",
				"pdr_level_bogenhafen_city_bögenauer_02",
				"pdr_level_bogenhafen_city_bögenauer_03",
				"pdr_level_bogenhafen_city_bögenauer_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_bögenauer_01",
				"pdr_level_bogenhafen_city_bögenauer_02",
				"pdr_level_bogenhafen_city_bögenauer_03",
				"pdr_level_bogenhafen_city_bögenauer_04"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		pdr_level_bogenhafen_city_infestation = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_infestation_01",
				"pdr_level_bogenhafen_city_infestation_02",
				"pdr_level_bogenhafen_city_infestation_03",
				"pdr_level_bogenhafen_city_infestation_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_infestation_01",
				"pdr_level_bogenhafen_city_infestation_02",
				"pdr_level_bogenhafen_city_infestation_03",
				"pdr_level_bogenhafen_city_infestation_04"
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
				6.0933957099915,
				4.2505207061768,
				4.7235832214356,
				2.2304792404175
			}
		},
		pdr_level_bogenhafen_city_revelry = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_revelry_01",
				"pdr_level_bogenhafen_city_revelry_02",
				"pdr_level_bogenhafen_city_revelry_03",
				"pdr_level_bogenhafen_city_revelry_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_revelry_01",
				"pdr_level_bogenhafen_city_revelry_02",
				"pdr_level_bogenhafen_city_revelry_03",
				"pdr_level_bogenhafen_city_revelry_04"
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
				4.8293333053589,
				5.1575417518616,
				3.9304790496826,
				1.8440833091736
			}
		},
		pdr_level_bogenhafen_city_intro_b = {
			face_animations_n = 2,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_level_bogenhafen_city_intro_b_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_b_02"
			},
			sound_events = {
				[1.0] = "pdr_level_bogenhafen_city_intro_b_01",
				[2.0] = "pdr_level_bogenhafen_city_intro_b_02"
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
				[1.0] = 4.8972706794739,
				[2.0] = 5.6114792823792
			}
		},
		pdr_level_bogenhafen_city_keep_moving = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_keep_moving_01",
				"pdr_level_bogenhafen_city_keep_moving_02",
				"pdr_level_bogenhafen_city_keep_moving_03",
				"pdr_level_bogenhafen_city_keep_moving_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_keep_moving_01",
				"pdr_level_bogenhafen_city_keep_moving_02",
				"pdr_level_bogenhafen_city_keep_moving_03",
				"pdr_level_bogenhafen_city_keep_moving_04"
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
				8.1724586486816,
				1.8145625591278,
				1.7618124485016,
				2.9554166793823
			}
		},
		pdr_level_bogenhafen_city_raining = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_raining_01",
				"pdr_level_bogenhafen_city_raining_02",
				"pdr_level_bogenhafen_city_raining_03",
				"pdr_level_bogenhafen_city_raining_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_raining_01",
				"pdr_level_bogenhafen_city_raining_02",
				"pdr_level_bogenhafen_city_raining_03",
				"pdr_level_bogenhafen_city_raining_04"
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2347497940064,
				4.0247502326965,
				3.7392916679382,
				5.8585209846497
			}
		},
		pdr_level_bogenhafen_city_found_artefact = {
			face_animations_n = 4,
			database = "dwarf_ranger_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_bogenhafen_city_found_artefact_01",
				"pdr_level_bogenhafen_city_found_artefact_02",
				"pdr_level_bogenhafen_city_found_artefact_03",
				"pdr_level_bogenhafen_city_found_artefact_04"
			},
			sound_events = {
				"pdr_level_bogenhafen_city_found_artefact_01",
				"pdr_level_bogenhafen_city_found_artefact_02",
				"pdr_level_bogenhafen_city_found_artefact_03",
				"pdr_level_bogenhafen_city_found_artefact_04"
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
				1.6197376251221,
				2.5657279491425,
				3.0672104358673,
				2.6774654388428
			}
		}
	})
end
