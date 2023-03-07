return function ()
	define_rule({
		name = "pwh_level_bogenhafen_city_sewers",
		response = "pwh_level_bogenhafen_city_sewers",
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
		name = "pwh_bh_level_bogenhafen_city_sewers",
		response = "pwh_bh_level_bogenhafen_city_sewers",
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
		name = "pwh_level_bogenhafen_city_taking_too_long",
		response = "pwh_level_bogenhafen_city_taking_too_long",
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
		name = "pwh_level_bogenhafen_city_torch",
		response = "pwh_level_bogenhafen_city_torch",
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
		name = "pwh_ze_level_bogenhafen_city_torch",
		response = "pwh_ze_level_bogenhafen_city_torch",
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
		name = "pwh_level_bogenhafen_city_blocked",
		response = "pwh_level_bogenhafen_city_blocked",
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
		name = "pwh_level_bogenhafen_city_braziers",
		response = "pwh_level_bogenhafen_city_braziers",
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
		name = "pwh_level_bogenhafen_city_here_they_come",
		response = "pwh_level_bogenhafen_city_here_they_come",
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
		name = "pwh_ze_level_bogenhafen_city_here_they_come",
		response = "pwh_ze_level_bogenhafen_city_here_they_come",
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
		name = "pwh_level_bogenhafen_city_way_out",
		response = "pwh_level_bogenhafen_city_way_out",
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
		name = "pwh_level_bogenhafen_city_raining",
		response = "pwh_level_bogenhafen_city_raining",
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
		name = "pwh_ze_level_bogenhafen_city_raining",
		response = "pwh_ze_level_bogenhafen_city_raining",
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
		name = "pwh_level_bogenhafen_city_smoke_pillar",
		response = "pwh_level_bogenhafen_city_smoke_pillar",
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
		name = "pwh_level_bogenhafen_city_revelry",
		response = "pwh_level_bogenhafen_city_revelry",
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
		name = "pwh_bh_level_bogenhafen_city_revelry_01",
		response = "pwh_bh_level_bogenhafen_city_revelry_01",
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
		name = "pwh_level_bogenhafen_city_bogenauer",
		response = "pwh_level_bogenhafen_city_bogenauer",
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
				"level_bogenhafen_city_bogenauer"
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
		name = "pwh_bh_level_bogenhafen_city_bogenauer",
		response = "pwh_bh_level_bogenhafen_city_bogenauer",
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
				"level_bogenhafen_city_bogenauer"
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
		name = "pwh_ze_level_bogenhafen_city_bogenauer_01",
		response = "pwh_ze_level_bogenhafen_city_bogenauer_01",
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
				"level_bogenhafen_city_bogenauer"
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
		name = "pwh_level_bogenhafen_city_infestation",
		response = "pwh_level_bogenhafen_city_infestation",
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
		name = "pwh_level_bogenhafen_city_find_priest_key",
		response = "pwh_level_bogenhafen_city_find_priest_key",
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
				"level_bogenhafen_city_find_priest_key",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_find_priest_key",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bogenhafen_city_dead_priest",
		response = "pwh_level_bogenhafen_city_dead_priest",
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
		name = "pwh_bh_level_bogenhafen_city_dead_priest",
		response = "pwh_bh_level_bogenhafen_city_dead_priest",
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
		name = "pwh_level_bogenhafen_city_temple",
		response = "pwh_level_bogenhafen_city_temple",
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
		name = "pwh_ze_level_bogenhafen_city_temple",
		response = "pwh_ze_level_bogenhafen_city_temple",
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
		name = "pwh_level_bogenhafen_city_defiled",
		response = "pwh_level_bogenhafen_city_defiled",
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
		name = "pwh_ze_level_bogenhafen_city_defiled",
		response = "pwh_ze_level_bogenhafen_city_defiled",
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
		name = "pwh_level_bogenhafen_city_artefact",
		response = "pwh_level_bogenhafen_city_artefact",
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
		name = "pwh_level_bogenhafen_city_found_artefact",
		response = "pwh_level_bogenhafen_city_found_artefact",
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
		name = "pwh_level_bogenhafen_city_escape",
		response = "pwh_level_bogenhafen_city_escape",
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
		name = "pwh_level_bogenhafen_city_keep_moving",
		response = "pwh_level_bogenhafen_city_keep_moving",
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
		name = "pwh_bh_level_bogenhafen_city_keep_moving_01",
		response = "pwh_bh_level_bogenhafen_city_keep_moving_01",
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
		name = "pwh_level_bogenhafen_city_objective_find",
		response = "pwh_level_bogenhafen_city_objective_find",
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
				"level_bogenhafen_city_objective_find"
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
				"level_bogenhafen_city_objective_find",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_objective_find",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_level_bogenhafen_city_objective_next",
		name = "pwh_level_bogenhafen_city_objective_next",
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
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_city_objective_last",
		response = "pwh_level_bogenhafen_city_objective_last",
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
				"level_bogenhafen_city_objective_last"
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
				"level_bogenhafen_city_objective_last",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_objective_last",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bogenhafen_city_noisy",
		response = "pwh_level_bogenhafen_city_noisy",
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
				"level_bogenhafen_city_noisy"
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
				"level_bogenhafen_city_noisy",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_noisy",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bogenhafen_city_sanctum",
		response = "pwh_level_bogenhafen_city_sanctum",
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
				"level_bogenhafen_city_sanctum"
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
				"level_bogenhafen_city_sanctum",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sanctum",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bogenhafen_city_sanctum_books",
		response = "pwh_level_bogenhafen_city_sanctum_books",
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
				"level_bogenhafen_city_sanctum_books"
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
				"level_bogenhafen_city_sanctum_books",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sanctum_books",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bogenhafen_city_goblin",
		response = "pwh_level_bogenhafen_city_goblin",
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
				"level_bogenhafen_city_goblin"
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
				"level_bogenhafen_city_goblin",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_goblin",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_bogenhafen_city_intro_a",
		response = "pwh_level_bogenhafen_city_intro_a",
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
		name = "pwh_level_bogenhafen_city_intro_b",
		response = "pwh_level_bogenhafen_city_intro_b",
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
				"witch_hunter"
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
		name = "pwh_level_bogenhafen_city_intro_c",
		response = "pwh_level_bogenhafen_city_intro_c",
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
				"witch_hunter"
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
	add_dialogues({
		pwh_ze_level_bogenhafen_city_defiled = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_city_defiled_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_city_defiled_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.4083957672119
			}
		},
		pwh_level_bogenhafen_city_smoke_pillar = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_smoke_pillar_01",
				"pwh_level_bogenhafen_city_smoke_pillar_02",
				"pwh_level_bogenhafen_city_smoke_pillar_03",
				"pwh_level_bogenhafen_city_smoke_pillar_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_smoke_pillar_01",
				"pwh_level_bogenhafen_city_smoke_pillar_02",
				"pwh_level_bogenhafen_city_smoke_pillar_03",
				"pwh_level_bogenhafen_city_smoke_pillar_04"
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
				4.0499377250671,
				4.7402291297913,
				6.005916595459,
				7.3031249046326
			}
		},
		pwh_level_bogenhafen_city_taking_too_long = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_taking_too_long_01",
				"pwh_level_bogenhafen_city_taking_too_long_02",
				"pwh_level_bogenhafen_city_taking_too_long_03",
				"pwh_level_bogenhafen_city_taking_too_long_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_taking_too_long_01",
				"pwh_level_bogenhafen_city_taking_too_long_02",
				"pwh_level_bogenhafen_city_taking_too_long_03",
				"pwh_level_bogenhafen_city_taking_too_long_04"
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
				5.1848959922791,
				4.6132497787476,
				3.9256041049957,
				5.2517709732056
			}
		},
		pwh_bh_level_bogenhafen_city_revelry_01 = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_bh_level_bogenhafen_city_revelry_01"
			},
			sound_events = {
				[1.0] = "pwh_bh_level_bogenhafen_city_revelry_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 7.8194375038147
			}
		},
		pwh_ze_level_bogenhafen_city_bogenauer_01 = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_city_bogenauer_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_city_bogenauer_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 7.4444789886475
			}
		},
		pwh_level_bogenhafen_city_intro_b = {
			face_animations_n = 2,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_level_bogenhafen_city_intro_b_01",
				[2.0] = "pwh_level_bogenhafen_city_intro_b_02"
			},
			sound_events = {
				[1.0] = "pwh_level_bogenhafen_city_intro_b_01",
				[2.0] = "pwh_level_bogenhafen_city_intro_b_02"
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
				[1.0] = 6.6416459083557,
				[2.0] = 4.1366872787476
			}
		},
		pwh_level_bogenhafen_city_keep_moving = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_keep_moving_01",
				"pwh_level_bogenhafen_city_keep_moving_02",
				"pwh_level_bogenhafen_city_keep_moving_03",
				"pwh_level_bogenhafen_city_keep_moving_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_keep_moving_01",
				"pwh_level_bogenhafen_city_keep_moving_02",
				"pwh_level_bogenhafen_city_keep_moving_03",
				"pwh_level_bogenhafen_city_keep_moving_04"
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
				3.0764999389648,
				2.1687707901001,
				4.0107083320618,
				3.4618332386017
			}
		},
		pwh_level_bogenhafen_city_found_artefact = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_level_bogenhafen_city_found_artefact_04"
			},
			sound_events = {
				[1.0] = "pwh_level_bogenhafen_city_found_artefact_04"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.2983771562576
			}
		},
		pwh_level_bogenhafen_city_objective_find = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_objective_find_01",
				"pwh_level_bogenhafen_city_objective_find_02",
				"pwh_level_bogenhafen_city_objective_find_03",
				"pwh_level_bogenhafen_city_objective_find_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_objective_find_01",
				"pwh_level_bogenhafen_city_objective_find_02",
				"pwh_level_bogenhafen_city_objective_find_03",
				"pwh_level_bogenhafen_city_objective_find_04"
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
				4.9234790802002,
				1.0031875371933,
				4.1389374732971,
				2.2078957557678
			}
		},
		pwh_level_bogenhafen_city_raining = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_raining_01",
				"pwh_level_bogenhafen_city_raining_02",
				"pwh_level_bogenhafen_city_raining_03",
				"pwh_level_bogenhafen_city_raining_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_raining_01",
				"pwh_level_bogenhafen_city_raining_02",
				"pwh_level_bogenhafen_city_raining_03",
				"pwh_level_bogenhafen_city_raining_04"
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
				4.7082915306091,
				3.0732083320618,
				5.1181039810181,
				6.2848958969116
			}
		},
		pwh_level_bogenhafen_city_blocked = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_blocked_01",
				"pwh_level_bogenhafen_city_blocked_02",
				"pwh_level_bogenhafen_city_blocked_03",
				"pwh_level_bogenhafen_city_blocked_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_blocked_01",
				"pwh_level_bogenhafen_city_blocked_02",
				"pwh_level_bogenhafen_city_blocked_03",
				"pwh_level_bogenhafen_city_blocked_04"
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
				2.1482083797455,
				1.4416874647141,
				4.1832709312439,
				3.506500005722
			}
		},
		pwh_bh_level_bogenhafen_city_sewers = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_bh_level_bogenhafen_city_sewers_01"
			},
			sound_events = {
				[1.0] = "pwh_bh_level_bogenhafen_city_sewers_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.7904582023621
			}
		},
		pwh_level_bogenhafen_city_intro_a = {
			face_animations_n = 2,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_level_bogenhafen_city_intro_a_01",
				[2.0] = "pwh_level_bogenhafen_city_intro_a_02"
			},
			sound_events = {
				[1.0] = "pwh_level_bogenhafen_city_intro_a_01",
				[2.0] = "pwh_level_bogenhafen_city_intro_a_02"
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
				[1.0] = 4.6704998016357,
				[2.0] = 4.4376459121704
			}
		},
		pwh_level_bogenhafen_city_sewers = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_sewers_01",
				"pwh_level_bogenhafen_city_sewers_02",
				"pwh_level_bogenhafen_city_sewers_03",
				"pwh_level_bogenhafen_city_sewers_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_sewers_01",
				"pwh_level_bogenhafen_city_sewers_02",
				"pwh_level_bogenhafen_city_sewers_03",
				"pwh_level_bogenhafen_city_sewers_04"
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
				4.1486248970032,
				5.6632289886475,
				5.9975833892822,
				5.9235000610352
			}
		},
		pwh_level_bogenhafen_city_braziers = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_braziers_01",
				"pwh_level_bogenhafen_city_braziers_02",
				"pwh_level_bogenhafen_city_braziers_03",
				"pwh_level_bogenhafen_city_braziers_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_braziers_01",
				"pwh_level_bogenhafen_city_braziers_02",
				"pwh_level_bogenhafen_city_braziers_03",
				"pwh_level_bogenhafen_city_braziers_04"
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
				1.5555624961853,
				4.1255626678467,
				3.1248126029968,
				1.8872708082199
			}
		},
		pwh_level_bogenhafen_city_goblin = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_goblin_01",
				"pwh_level_bogenhafen_city_goblin_02",
				"pwh_level_bogenhafen_city_goblin_03",
				"pwh_level_bogenhafen_city_goblin_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_goblin_01",
				"pwh_level_bogenhafen_city_goblin_02",
				"pwh_level_bogenhafen_city_goblin_03",
				"pwh_level_bogenhafen_city_goblin_04"
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
				5.960000038147,
				7.0119166374206,
				6.8868956565857,
				6.6305418014526
			}
		},
		pwh_ze_level_bogenhafen_city_temple = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_city_temple_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_city_temple_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 9.9782295227051
			}
		},
		pwh_level_bogenhafen_city_torch = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_torch_01",
				"pwh_level_bogenhafen_city_torch_02",
				"pwh_level_bogenhafen_city_torch_03",
				"pwh_level_bogenhafen_city_torch_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_torch_01",
				"pwh_level_bogenhafen_city_torch_02",
				"pwh_level_bogenhafen_city_torch_03",
				"pwh_level_bogenhafen_city_torch_04"
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
				2.7658751010895,
				3.6477499008179,
				3.8271250724792,
				2.6732292175293
			}
		},
		pwh_ze_level_bogenhafen_city_raining = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_city_raining_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_city_raining_01"
			},
			face_animations = {
				[1.0] = "face_exhausted"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 7.2760834693909
			}
		},
		pwh_level_bogenhafen_city_artefact = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_artefact_01",
				"pwh_level_bogenhafen_city_artefact_02",
				"pwh_level_bogenhafen_city_artefact_03",
				"pwh_level_bogenhafen_city_artefact_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_artefact_01",
				"pwh_level_bogenhafen_city_artefact_02",
				"pwh_level_bogenhafen_city_artefact_03",
				"pwh_level_bogenhafen_city_artefact_04"
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
				4.5818333625794,
				1.9384583234787,
				3.5348958969116,
				3.2109792232513
			}
		},
		pwh_level_bogenhafen_city_dead_priest = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_dead_priest_01",
				"pwh_level_bogenhafen_city_dead_priest_02",
				"pwh_level_bogenhafen_city_dead_priest_03",
				"pwh_level_bogenhafen_city_dead_priest_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_dead_priest_01",
				"pwh_level_bogenhafen_city_dead_priest_02",
				"pwh_level_bogenhafen_city_dead_priest_03",
				"pwh_level_bogenhafen_city_dead_priest_04"
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
				6.4811248779297,
				4.6945209503174,
				5.4818539619446,
				9.6311664581299
			}
		},
		pwh_level_bogenhafen_city_defiled = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_defiled_01",
				"pwh_level_bogenhafen_city_defiled_02",
				"pwh_level_bogenhafen_city_defiled_03",
				"pwh_level_bogenhafen_city_defiled_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_defiled_01",
				"pwh_level_bogenhafen_city_defiled_02",
				"pwh_level_bogenhafen_city_defiled_03",
				"pwh_level_bogenhafen_city_defiled_04"
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
				5.2138748168945,
				7.5437293052673,
				6.7680206298828,
				3.4790415763855
			}
		},
		pwh_level_bogenhafen_city_way_out = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_way_out_01",
				"pwh_level_bogenhafen_city_way_out_02",
				"pwh_level_bogenhafen_city_way_out_03",
				"pwh_level_bogenhafen_city_way_out_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_way_out_01",
				"pwh_level_bogenhafen_city_way_out_02",
				"pwh_level_bogenhafen_city_way_out_03",
				"pwh_level_bogenhafen_city_way_out_04"
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
				3.0095207691193,
				2.9440834522247,
				3.4919373989105,
				5.4183540344238
			}
		},
		pwh_level_bogenhafen_city_escape = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_escape_01",
				"pwh_level_bogenhafen_city_escape_02",
				"pwh_level_bogenhafen_city_escape_03",
				"pwh_level_bogenhafen_city_escape_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_escape_01",
				"pwh_level_bogenhafen_city_escape_02",
				"pwh_level_bogenhafen_city_escape_03",
				"pwh_level_bogenhafen_city_escape_04"
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
				4.4088959693909,
				4.3280835151672,
				6.6952085494995,
				2.6404790878296
			}
		},
		pwh_level_bogenhafen_city_find_priest_key = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_find_priest_key_01",
				"pwh_level_bogenhafen_city_find_priest_key_02",
				"pwh_level_bogenhafen_city_find_priest_key_03",
				"pwh_level_bogenhafen_city_find_priest_key_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_find_priest_key_01",
				"pwh_level_bogenhafen_city_find_priest_key_02",
				"pwh_level_bogenhafen_city_find_priest_key_03",
				"pwh_level_bogenhafen_city_find_priest_key_04"
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
				4.6185832023621,
				2.5392498970032,
				5.2710208892822,
				4.3240833282471
			}
		},
		pwh_level_bogenhafen_city_infestation = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_infestation_01",
				"pwh_level_bogenhafen_city_infestation_02",
				"pwh_level_bogenhafen_city_infestation_03",
				"pwh_level_bogenhafen_city_infestation_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_infestation_01",
				"pwh_level_bogenhafen_city_infestation_02",
				"pwh_level_bogenhafen_city_infestation_03",
				"pwh_level_bogenhafen_city_infestation_04"
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
				5.9125208854675,
				5.5582914352417,
				4.9107084274292,
				5.8363122940064
			}
		},
		pwh_level_bogenhafen_city_revelry = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_revelry_01",
				"pwh_level_bogenhafen_city_revelry_02",
				"pwh_level_bogenhafen_city_revelry_03",
				"pwh_level_bogenhafen_city_revelry_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_revelry_01",
				"pwh_level_bogenhafen_city_revelry_02",
				"pwh_level_bogenhafen_city_revelry_03",
				"pwh_level_bogenhafen_city_revelry_04"
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
				8.9188537597656,
				7.1464791297913,
				5.3950834274292,
				3.3062708377838
			}
		},
		pwh_bh_level_bogenhafen_city_keep_moving_01 = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_bh_level_bogenhafen_city_keep_moving_01"
			},
			sound_events = {
				[1.0] = "pwh_bh_level_bogenhafen_city_keep_moving_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 5.1521458625794
			}
		},
		pwh_ze_level_bogenhafen_city_here_they_come = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_city_here_they_come_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_city_here_they_come_01"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 10.137353897095
			}
		},
		pwh_level_bogenhafen_city_temple = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_temple_01",
				"pwh_level_bogenhafen_city_temple_02",
				"pwh_level_bogenhafen_city_temple_03",
				"pwh_level_bogenhafen_city_temple_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_temple_01",
				"pwh_level_bogenhafen_city_temple_02",
				"pwh_level_bogenhafen_city_temple_03",
				"pwh_level_bogenhafen_city_temple_04"
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
				1.7813750505447,
				3.7990207672119,
				6.1749167442322,
				4.5368747711182
			}
		},
		pwh_level_bogenhafen_city_sanctum_books = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_sanctum_books_01",
				"pwh_level_bogenhafen_city_sanctum_books_02",
				"pwh_level_bogenhafen_city_sanctum_books_03",
				"pwh_level_bogenhafen_city_sanctum_books_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_sanctum_books_01",
				"pwh_level_bogenhafen_city_sanctum_books_02",
				"pwh_level_bogenhafen_city_sanctum_books_03",
				"pwh_level_bogenhafen_city_sanctum_books_04"
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
				6.8224792480469,
				8.3964166641235,
				6.7430624961853,
				6.6485624313355
			}
		},
		pwh_level_bogenhafen_city_objective_last = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_objective_last_01",
				"pwh_level_bogenhafen_city_objective_last_02",
				"pwh_level_bogenhafen_city_objective_last_03",
				"pwh_level_bogenhafen_city_objective_last_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_objective_last_01",
				"pwh_level_bogenhafen_city_objective_last_02",
				"pwh_level_bogenhafen_city_objective_last_03",
				"pwh_level_bogenhafen_city_objective_last_04"
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
				2.0807082653046,
				1.0403541326523,
				1.4181250333786,
				1.856229186058
			}
		},
		pwh_bh_level_bogenhafen_city_dead_priest = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_bh_level_bogenhafen_city_dead_priest_01"
			},
			sound_events = {
				[1.0] = "pwh_bh_level_bogenhafen_city_dead_priest_01"
			},
			face_animations = {
				[1.0] = "face_sadness"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 9.3897294998169
			}
		},
		pwh_level_bogenhafen_city_objective_next = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_objective_next_01",
				"pwh_level_bogenhafen_city_objective_next_02",
				"pwh_level_bogenhafen_city_objective_next_03",
				"pwh_level_bogenhafen_city_objective_next_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_objective_next_01",
				"pwh_level_bogenhafen_city_objective_next_02",
				"pwh_level_bogenhafen_city_objective_next_03",
				"pwh_level_bogenhafen_city_objective_next_04"
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
				4.6247291564941,
				2.9504375457764,
				3.185625076294,
				4.0880208015442
			}
		},
		pwh_bh_level_bogenhafen_city_bogenauer = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_bh_level_bogenhafen_city_bogenauer_01"
			},
			sound_events = {
				[1.0] = "pwh_bh_level_bogenhafen_city_bogenauer_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 8.6644372940063
			}
		},
		pwh_level_bogenhafen_city_noisy = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_noisy_01",
				"pwh_level_bogenhafen_city_noisy_02",
				"pwh_level_bogenhafen_city_noisy_03",
				"pwh_level_bogenhafen_city_noisy_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_noisy_01",
				"pwh_level_bogenhafen_city_noisy_02",
				"pwh_level_bogenhafen_city_noisy_03",
				"pwh_level_bogenhafen_city_noisy_04"
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
				8.2846670150757,
				7.079562664032,
				5.4189167022705,
				6.1461248397827
			}
		},
		pwh_level_bogenhafen_city_bogenauer = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_bogenauer_01",
				"pwh_level_bogenhafen_city_bogenauer_02",
				"pwh_level_bogenhafen_city_bogenauer_03",
				"pwh_level_bogenhafen_city_bogenauer_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_bogenauer_01",
				"pwh_level_bogenhafen_city_bogenauer_02",
				"pwh_level_bogenhafen_city_bogenauer_03",
				"pwh_level_bogenhafen_city_bogenauer_04"
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
				6.0264372825623,
				5.8921666145325,
				6.8539581298828,
				5.6592082977295
			}
		},
		pwh_level_bogenhafen_city_sanctum = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_level_bogenhafen_city_sanctum_03"
			},
			sound_events = {
				[1.0] = "pwh_level_bogenhafen_city_sanctum_03"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.8898334503174
			}
		},
		pwh_level_bogenhafen_city_here_they_come = {
			face_animations_n = 4,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_level_bogenhafen_city_here_they_come_01",
				"pwh_level_bogenhafen_city_here_they_come_02",
				"pwh_level_bogenhafen_city_here_they_come_03",
				"pwh_level_bogenhafen_city_here_they_come_04"
			},
			sound_events = {
				"pwh_level_bogenhafen_city_here_they_come_01",
				"pwh_level_bogenhafen_city_here_they_come_02",
				"pwh_level_bogenhafen_city_here_they_come_03",
				"pwh_level_bogenhafen_city_here_they_come_04"
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
				3.1899375915527,
				3.1579167842865,
				3.6775832176209,
				4.924708366394
			}
		},
		pwh_level_bogenhafen_city_intro_c = {
			face_animations_n = 2,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwh_level_bogenhafen_city_intro_c_01",
				[2.0] = "pwh_level_bogenhafen_city_intro_c_02"
			},
			sound_events = {
				[1.0] = "pwh_level_bogenhafen_city_intro_c_01",
				[2.0] = "pwh_level_bogenhafen_city_intro_c_02"
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
				[1.0] = 4.4988956451416,
				[2.0] = 6.8908123970032
			}
		},
		pwh_ze_level_bogenhafen_city_torch = {
			face_animations_n = 1,
			database = "witch_hunter_bogenhafen_city",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_ze_level_bogenhafen_city_torch_01"
			},
			sound_events = {
				[1.0] = "pwh_ze_level_bogenhafen_city_torch_01"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 11.9077501297
			}
		}
	})
end
