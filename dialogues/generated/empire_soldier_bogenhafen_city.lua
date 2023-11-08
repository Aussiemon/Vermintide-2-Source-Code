return function ()
	define_rule({
		name = "pes_hu_level_bogenhafen_city_blocked",
		response = "pes_hu_level_bogenhafen_city_blocked",
		criterias = {
			{
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
				"player_career",
				OP.EQ,
				"es_huntsman"
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
		name = "pes_hu_level_bogenhafen_city_bogenauer_01",
		response = "pes_hu_level_bogenhafen_city_bogenauer_01",
		criterias = {
			{
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
				"player_career",
				OP.EQ,
				"es_huntsman"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_hu_level_bogenhafen_city_sewers",
		response = "pes_hu_level_bogenhafen_city_sewers",
		criterias = {
			{
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
				"player_career",
				OP.EQ,
				"es_huntsman"
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
		name = "pes_hu_level_bogenhafen_city_smoke_pillar",
		response = "pes_hu_level_bogenhafen_city_smoke_pillar",
		criterias = {
			{
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
				"player_career",
				OP.EQ,
				"es_huntsman"
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
		name = "pes_hu_level_bogenhafen_city_taking_too_long",
		response = "pes_hu_level_bogenhafen_city_taking_too_long",
		criterias = {
			{
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
				"player_career",
				OP.EQ,
				"es_huntsman"
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
		name = "pes_hu_level_bogenhafen_city_way_out",
		response = "pes_hu_level_bogenhafen_city_way_out",
		criterias = {
			{
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
				"player_career",
				OP.EQ,
				"es_knight"
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
		name = "pes_kn_level_bogenhafen_city_here_they_come",
		response = "pes_kn_level_bogenhafen_city_here_they_come",
		criterias = {
			{
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
				"player_career",
				OP.EQ,
				"es_knight"
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
		name = "pes_kn_level_bogenhafen_city_infestation",
		response = "pes_kn_level_bogenhafen_city_infestation",
		criterias = {
			{
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
				"player_career",
				OP.EQ,
				"es_knight"
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
		name = "pes_kn_level_bogenhafen_city_keep_moving",
		response = "pes_kn_level_bogenhafen_city_keep_moving",
		criterias = {
			{
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
				"player_career",
				OP.EQ,
				"es_knight"
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
		name = "pes_kn_level_bogenhafen_city_sewers",
		response = "pes_kn_level_bogenhafen_city_sewers",
		criterias = {
			{
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
				"player_career",
				OP.EQ,
				"es_knight"
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
		name = "pes_kn_level_bogenhafen_city_torch_01",
		response = "pes_kn_level_bogenhafen_city_torch_01",
		criterias = {
			{
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
				"player_career",
				OP.EQ,
				"es_knight"
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
		name = "pes_level_bogenhafen_city_artefact",
		response = "pes_level_bogenhafen_city_artefact",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_blocked",
		response = "pes_level_bogenhafen_city_blocked",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_bogenauer",
		response = "pes_level_bogenhafen_city_bogenauer",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_braziers",
		response = "pes_level_bogenhafen_city_braziers",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_dead_priest",
		response = "pes_level_bogenhafen_city_dead_priest",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_defiled",
		response = "pes_level_bogenhafen_city_defiled",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_escape",
		response = "pes_level_bogenhafen_city_escape",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_find_priest_key",
		response = "pes_level_bogenhafen_city_find_priest_key",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pes_level_bogenhafen_city_find_priest_key",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_level_bogenhafen_city_find_priest_key",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_bogenhafen_city_found_artefact",
		response = "pes_level_bogenhafen_city_found_artefact",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_goblin",
		response = "pes_level_bogenhafen_city_goblin",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_here_they_come",
		response = "pes_level_bogenhafen_city_here_they_come",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_infestation",
		response = "pes_level_bogenhafen_city_infestation",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_intro_a",
		response = "pes_level_bogenhafen_city_intro_a",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_intro_b",
		response = "pes_level_bogenhafen_city_intro_b",
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
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_intro_c",
		response = "pes_level_bogenhafen_city_intro_c",
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
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_keep_moving",
		response = "pes_level_bogenhafen_city_keep_moving",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_noisy",
		response = "pes_level_bogenhafen_city_noisy",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_objective_find",
		response = "pes_level_bogenhafen_city_objective_find",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_objective_last",
		response = "pes_level_bogenhafen_city_objective_last",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		response = "pes_level_bogenhafen_city_objective_next",
		name = "pes_level_bogenhafen_city_objective_next",
		criterias = {
			{
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
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_raining",
		response = "pes_level_bogenhafen_city_raining",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_revelry",
		response = "pes_level_bogenhafen_city_revelry",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_sanctum",
		response = "pes_level_bogenhafen_city_sanctum",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_sanctum_books",
		response = "pes_level_bogenhafen_city_sanctum_books",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_sewers",
		response = "pes_level_bogenhafen_city_sewers",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_smoke_pillar",
		response = "pes_level_bogenhafen_city_smoke_pillar",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_taking_too_long",
		response = "pes_level_bogenhafen_city_taking_too_long",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_temple",
		response = "pes_level_bogenhafen_city_temple",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_torch",
		response = "pes_level_bogenhafen_city_torch",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_level_bogenhafen_city_way_out",
		response = "pes_level_bogenhafen_city_way_out",
		criterias = {
			{
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
	add_dialogues({
		pes_hu_level_bogenhafen_city_blocked = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_blocked_01"
			},
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_blocked_01"
			},
			sound_events_duration = {
				[1.0] = 4.8307914733887
			}
		},
		pes_hu_level_bogenhafen_city_bogenauer_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_bogenauer_01"
			},
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_bogenauer_01"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			}
		},
		pes_hu_level_bogenhafen_city_sewers = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_sewers_01"
			},
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_sewers_01"
			},
			sound_events_duration = {
				[1.0] = 8.0201663970947
			}
		},
		pes_hu_level_bogenhafen_city_smoke_pillar = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_smoke_pillar_01"
			},
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_smoke_pillar_01"
			},
			sound_events_duration = {
				[1.0] = 4.7374582290649
			}
		},
		pes_hu_level_bogenhafen_city_taking_too_long = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_taking_too_long_01"
			},
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_taking_too_long_01"
			},
			sound_events_duration = {
				[1.0] = 4.1887917518616
			}
		},
		pes_hu_level_bogenhafen_city_way_out = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_hu_level_bogenhafen_city_way_out_01"
			},
			sound_events = {
				[1.0] = "pes_hu_level_bogenhafen_city_way_out_01"
			},
			sound_events_duration = {
				[1.0] = 3.3342292308807
			}
		},
		pes_kn_level_bogenhafen_city_here_they_come = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			localization_strings = {
				[1.0] = "pes_kn_level_bogenhafen_city_here_they_come_01"
			},
			sound_events = {
				[1.0] = "pes_kn_level_bogenhafen_city_here_they_come_01"
			},
			sound_events_duration = {
				[1.0] = 3.8368124961853
			}
		},
		pes_kn_level_bogenhafen_city_infestation = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_kn_level_bogenhafen_city_infestation_01"
			},
			sound_events = {
				[1.0] = "pes_kn_level_bogenhafen_city_infestation_01"
			},
			sound_events_duration = {
				[1.0] = 7.491229057312
			}
		},
		pes_kn_level_bogenhafen_city_keep_moving = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_kn_level_bogenhafen_city_keep_moving_01"
			},
			sound_events = {
				[1.0] = "pes_kn_level_bogenhafen_city_keep_moving_01"
			},
			sound_events_duration = {
				[1.0] = 4.3694581985474
			}
		},
		pes_kn_level_bogenhafen_city_sewers = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_kn_level_bogenhafen_city_sewers_01"
			},
			sound_events = {
				[1.0] = "pes_kn_level_bogenhafen_city_sewers_01"
			},
			sound_events_duration = {
				[1.0] = 4.2871251106262
			}
		},
		pes_kn_level_bogenhafen_city_torch_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "empire_soldier_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_kn_level_bogenhafen_city_torch_01"
			},
			sound_events = {
				[1.0] = "pes_kn_level_bogenhafen_city_torch_01"
			},
			sound_events_duration = {
				[1.0] = 9.304479598999
			}
		},
		pes_level_bogenhafen_city_artefact = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_artefact_01",
				"pes_level_bogenhafen_city_artefact_02",
				"pes_level_bogenhafen_city_artefact_03",
				"pes_level_bogenhafen_city_artefact_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_artefact_01",
				"pes_level_bogenhafen_city_artefact_02",
				"pes_level_bogenhafen_city_artefact_03",
				"pes_level_bogenhafen_city_artefact_04"
			},
			sound_events_duration = {
				2.0157916545868,
				2.2630832195282,
				3.3301458358765,
				2.0279166698456
			}
		},
		pes_level_bogenhafen_city_blocked = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_blocked_01",
				"pes_level_bogenhafen_city_blocked_02",
				"pes_level_bogenhafen_city_blocked_03",
				"pes_level_bogenhafen_city_blocked_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_blocked_01",
				"pes_level_bogenhafen_city_blocked_02",
				"pes_level_bogenhafen_city_blocked_03",
				"pes_level_bogenhafen_city_blocked_04"
			},
			sound_events_duration = {
				3.7932291030884,
				4.4268751144409,
				4.3548331260681,
				2.5255208015442
			}
		},
		pes_level_bogenhafen_city_bogenauer = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_bogenauer_01",
				"pes_level_bogenhafen_city_bogenauer_02",
				"pes_level_bogenhafen_city_bogenauer_03",
				"pes_level_bogenhafen_city_bogenauer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_bogenauer_01",
				"pes_level_bogenhafen_city_bogenauer_02",
				"pes_level_bogenhafen_city_bogenauer_03",
				"pes_level_bogenhafen_city_bogenauer_04"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		pes_level_bogenhafen_city_braziers = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_braziers_01",
				"pes_level_bogenhafen_city_braziers_02",
				"pes_level_bogenhafen_city_braziers_03",
				"pes_level_bogenhafen_city_braziers_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_braziers_01",
				"pes_level_bogenhafen_city_braziers_02",
				"pes_level_bogenhafen_city_braziers_03",
				"pes_level_bogenhafen_city_braziers_04"
			},
			sound_events_duration = {
				2.5244584083557,
				4.4000000953674,
				2.864458322525,
				2.2849583625794
			}
		},
		pes_level_bogenhafen_city_dead_priest = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"face_sadness",
				"face_sadness",
				"face_sadness",
				"face_sadness"
			},
			localization_strings = {
				"pes_level_bogenhafen_city_dead_priest_01",
				"pes_level_bogenhafen_city_dead_priest_02",
				"pes_level_bogenhafen_city_dead_priest_03",
				"pes_level_bogenhafen_city_dead_priest_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_dead_priest_01",
				"pes_level_bogenhafen_city_dead_priest_02",
				"pes_level_bogenhafen_city_dead_priest_03",
				"pes_level_bogenhafen_city_dead_priest_04"
			},
			sound_events_duration = {
				3.1536250114441,
				3.8323333263397,
				3.7833125591278,
				5.2732706069946
			}
		},
		pes_level_bogenhafen_city_defiled = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_level_bogenhafen_city_defiled_01",
				"pes_level_bogenhafen_city_defiled_02",
				"pes_level_bogenhafen_city_defiled_03",
				"pes_level_bogenhafen_city_defiled_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_defiled_01",
				"pes_level_bogenhafen_city_defiled_02",
				"pes_level_bogenhafen_city_defiled_03",
				"pes_level_bogenhafen_city_defiled_04"
			},
			sound_events_duration = {
				5.2222499847412,
				5.4837708473206,
				4.8040623664856,
				4.1970415115356
			}
		},
		pes_level_bogenhafen_city_escape = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_escape_01",
				"pes_level_bogenhafen_city_escape_02",
				"pes_level_bogenhafen_city_escape_03",
				"pes_level_bogenhafen_city_escape_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_escape_01",
				"pes_level_bogenhafen_city_escape_02",
				"pes_level_bogenhafen_city_escape_03",
				"pes_level_bogenhafen_city_escape_04"
			},
			sound_events_duration = {
				2.1652915477753,
				2.3477292060852,
				2.8695416450501,
				2.4227707386017
			}
		},
		pes_level_bogenhafen_city_find_priest_key = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_find_priest_key_01",
				"pes_level_bogenhafen_city_find_priest_key_02",
				"pes_level_bogenhafen_city_find_priest_key_03",
				"pes_level_bogenhafen_city_find_priest_key_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_find_priest_key_01",
				"pes_level_bogenhafen_city_find_priest_key_02",
				"pes_level_bogenhafen_city_find_priest_key_03",
				"pes_level_bogenhafen_city_find_priest_key_04"
			},
			sound_events_duration = {
				5.6131458282471,
				2.0826041698456,
				3.2301666736603,
				7.2635626792908
			}
		},
		pes_level_bogenhafen_city_found_artefact = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_found_artefact_01",
				"pes_level_bogenhafen_city_found_artefact_02",
				"pes_level_bogenhafen_city_found_artefact_03",
				"pes_level_bogenhafen_city_found_artefact_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_found_artefact_01",
				"pes_level_bogenhafen_city_found_artefact_02",
				"pes_level_bogenhafen_city_found_artefact_03",
				"pes_level_bogenhafen_city_found_artefact_04"
			},
			sound_events_duration = {
				2.3227695226669,
				1.8399503231049,
				1.1191099882126,
				1.36756336689
			}
		},
		pes_level_bogenhafen_city_goblin = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_goblin_01",
				"pes_level_bogenhafen_city_goblin_02",
				"pes_level_bogenhafen_city_goblin_03",
				"pes_level_bogenhafen_city_goblin_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_goblin_01",
				"pes_level_bogenhafen_city_goblin_02",
				"pes_level_bogenhafen_city_goblin_03",
				"pes_level_bogenhafen_city_goblin_04"
			},
			sound_events_duration = {
				6.2984166145325,
				7.5612707138061,
				3.5507707595825,
				7.6521668434143
			}
		},
		pes_level_bogenhafen_city_here_they_come = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_here_they_come_01",
				"pes_level_bogenhafen_city_here_they_come_02",
				"pes_level_bogenhafen_city_here_they_come_03",
				"pes_level_bogenhafen_city_here_they_come_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_here_they_come_01",
				"pes_level_bogenhafen_city_here_they_come_02",
				"pes_level_bogenhafen_city_here_they_come_03",
				"pes_level_bogenhafen_city_here_they_come_04"
			},
			sound_events_duration = {
				3.4444061517715,
				2.7536458969116,
				1.4624999761581,
				2.305999994278
			}
		},
		pes_level_bogenhafen_city_infestation = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_infestation_01",
				"pes_level_bogenhafen_city_infestation_02",
				"pes_level_bogenhafen_city_infestation_03",
				"pes_level_bogenhafen_city_infestation_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_infestation_01",
				"pes_level_bogenhafen_city_infestation_02",
				"pes_level_bogenhafen_city_infestation_03",
				"pes_level_bogenhafen_city_infestation_04"
			},
			sound_events_duration = {
				4.6192708015442,
				2.9952707290649,
				5.4603333473206,
				4.9678540229797
			}
		},
		pes_level_bogenhafen_city_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_bogenhafen_city",
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
				[1.0] = "pes_level_bogenhafen_city_intro_a_01",
				[2.0] = "pes_level_bogenhafen_city_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_level_bogenhafen_city_intro_a_01",
				[2.0] = "pes_level_bogenhafen_city_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.0761876106262,
				[2.0] = 4.0819582939148
			}
		},
		pes_level_bogenhafen_city_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_bogenhafen_city",
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
				[1.0] = "pes_level_bogenhafen_city_intro_b_01",
				[2.0] = "pes_level_bogenhafen_city_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_level_bogenhafen_city_intro_b_01",
				[2.0] = "pes_level_bogenhafen_city_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 5.3566040992737,
				[2.0] = 5.106999874115
			}
		},
		pes_level_bogenhafen_city_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_bogenhafen_city",
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
				[1.0] = "pes_level_bogenhafen_city_intro_c_01",
				[2.0] = "pes_level_bogenhafen_city_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_level_bogenhafen_city_intro_c_01",
				[2.0] = "pes_level_bogenhafen_city_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 4.4778542518616,
				[2.0] = 4.4948959350586
			}
		},
		pes_level_bogenhafen_city_keep_moving = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_keep_moving_01",
				"pes_level_bogenhafen_city_keep_moving_02",
				"pes_level_bogenhafen_city_keep_moving_03",
				"pes_level_bogenhafen_city_keep_moving_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_keep_moving_01",
				"pes_level_bogenhafen_city_keep_moving_02",
				"pes_level_bogenhafen_city_keep_moving_03",
				"pes_level_bogenhafen_city_keep_moving_04"
			},
			sound_events_duration = {
				2.323979139328,
				2.8123333454132,
				3.1193542480469,
				2.3855624198914
			}
		},
		pes_level_bogenhafen_city_noisy = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_noisy_01",
				"pes_level_bogenhafen_city_noisy_02",
				"pes_level_bogenhafen_city_noisy_03",
				"pes_level_bogenhafen_city_noisy_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_noisy_01",
				"pes_level_bogenhafen_city_noisy_02",
				"pes_level_bogenhafen_city_noisy_03",
				"pes_level_bogenhafen_city_noisy_04"
			},
			sound_events_duration = {
				5.7433958053589,
				5.5374794006348,
				7.5279998779297,
				5.8120727539063
			}
		},
		pes_level_bogenhafen_city_objective_find = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_objective_find_01",
				"pes_level_bogenhafen_city_objective_find_02",
				"pes_level_bogenhafen_city_objective_find_03",
				"pes_level_bogenhafen_city_objective_find_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_objective_find_01",
				"pes_level_bogenhafen_city_objective_find_02",
				"pes_level_bogenhafen_city_objective_find_03",
				"pes_level_bogenhafen_city_objective_find_04"
			},
			sound_events_duration = {
				1.3492292165756,
				2.3317708969116,
				3.1651458740234,
				1.8025624752045
			}
		},
		pes_level_bogenhafen_city_objective_last = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_objective_last_01",
				"pes_level_bogenhafen_city_objective_last_02",
				"pes_level_bogenhafen_city_objective_last_03",
				"pes_level_bogenhafen_city_objective_last_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_objective_last_01",
				"pes_level_bogenhafen_city_objective_last_02",
				"pes_level_bogenhafen_city_objective_last_03",
				"pes_level_bogenhafen_city_objective_last_04"
			},
			sound_events_duration = {
				1.6710937619209,
				1.4773124456406,
				1.8208124637604,
				1.7461874485016
			}
		},
		pes_level_bogenhafen_city_objective_next = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_objective_next_01",
				"pes_level_bogenhafen_city_objective_next_02",
				"pes_level_bogenhafen_city_objective_next_03",
				"pes_level_bogenhafen_city_objective_next_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_objective_next_01",
				"pes_level_bogenhafen_city_objective_next_02",
				"pes_level_bogenhafen_city_objective_next_03",
				"pes_level_bogenhafen_city_objective_next_04"
			},
			sound_events_duration = {
				1.1832083463669,
				1.0050624608993,
				1.8729374408722,
				2.1957499980927
			}
		},
		pes_level_bogenhafen_city_raining = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pes_level_bogenhafen_city_raining_01",
				"pes_level_bogenhafen_city_raining_02",
				"pes_level_bogenhafen_city_raining_03",
				"pes_level_bogenhafen_city_raining_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_raining_01",
				"pes_level_bogenhafen_city_raining_02",
				"pes_level_bogenhafen_city_raining_03",
				"pes_level_bogenhafen_city_raining_04"
			},
			sound_events_duration = {
				4.5762710571289,
				4.7553958892822,
				5.0076041221619,
				3.189270734787
			}
		},
		pes_level_bogenhafen_city_revelry = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_revelry_01",
				"pes_level_bogenhafen_city_revelry_02",
				"pes_level_bogenhafen_city_revelry_03",
				"pes_level_bogenhafen_city_revelry_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_revelry_01",
				"pes_level_bogenhafen_city_revelry_02",
				"pes_level_bogenhafen_city_revelry_03",
				"pes_level_bogenhafen_city_revelry_04"
			},
			sound_events_duration = {
				3.5400624275208,
				4.4904789924622,
				4.6863331794739,
				3.7258541584015
			}
		},
		pes_level_bogenhafen_city_sanctum = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_bogenhafen_city",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pes_level_bogenhafen_city_sanctum_01",
				[2.0] = "pes_level_bogenhafen_city_sanctum_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_level_bogenhafen_city_sanctum_01",
				[2.0] = "pes_level_bogenhafen_city_sanctum_02"
			},
			sound_events_duration = {
				[1.0] = 2.9768958091736,
				[2.0] = 5.2633333206177
			}
		},
		pes_level_bogenhafen_city_sanctum_books = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_sanctum_books_01",
				"pes_level_bogenhafen_city_sanctum_books_02",
				"pes_level_bogenhafen_city_sanctum_books_03",
				"pes_level_bogenhafen_city_sanctum_books_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_sanctum_books_01",
				"pes_level_bogenhafen_city_sanctum_books_02",
				"pes_level_bogenhafen_city_sanctum_books_03",
				"pes_level_bogenhafen_city_sanctum_books_04"
			},
			sound_events_duration = {
				5.2015624046326,
				5.1394166946411,
				5.3105206489563,
				3.3366665840149
			}
		},
		pes_level_bogenhafen_city_sewers = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_sewers_01",
				"pes_level_bogenhafen_city_sewers_02",
				"pes_level_bogenhafen_city_sewers_03",
				"pes_level_bogenhafen_city_sewers_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_sewers_01",
				"pes_level_bogenhafen_city_sewers_02",
				"pes_level_bogenhafen_city_sewers_03",
				"pes_level_bogenhafen_city_sewers_04"
			},
			sound_events_duration = {
				4.061562538147,
				3.9101874828339,
				5.0309166908264,
				4.7551040649414
			}
		},
		pes_level_bogenhafen_city_smoke_pillar = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_smoke_pillar_01",
				"pes_level_bogenhafen_city_smoke_pillar_02",
				"pes_level_bogenhafen_city_smoke_pillar_03",
				"pes_level_bogenhafen_city_smoke_pillar_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_smoke_pillar_01",
				"pes_level_bogenhafen_city_smoke_pillar_02",
				"pes_level_bogenhafen_city_smoke_pillar_03",
				"pes_level_bogenhafen_city_smoke_pillar_04"
			},
			sound_events_duration = {
				2.9335417747498,
				4.8662085533142,
				6.026291847229,
				5.1582083702087
			}
		},
		pes_level_bogenhafen_city_taking_too_long = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_taking_too_long_01",
				"pes_level_bogenhafen_city_taking_too_long_02",
				"pes_level_bogenhafen_city_taking_too_long_03",
				"pes_level_bogenhafen_city_taking_too_long_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_taking_too_long_01",
				"pes_level_bogenhafen_city_taking_too_long_02",
				"pes_level_bogenhafen_city_taking_too_long_03",
				"pes_level_bogenhafen_city_taking_too_long_04"
			},
			sound_events_duration = {
				2.1319582462311,
				2.9226875305176,
				5.4653334617615,
				5.4747500419617
			}
		},
		pes_level_bogenhafen_city_temple = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_temple_01",
				"pes_level_bogenhafen_city_temple_02",
				"pes_level_bogenhafen_city_temple_03",
				"pes_level_bogenhafen_city_temple_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_temple_01",
				"pes_level_bogenhafen_city_temple_02",
				"pes_level_bogenhafen_city_temple_03",
				"pes_level_bogenhafen_city_temple_04"
			},
			sound_events_duration = {
				1.9786666631699,
				1.8487499952316,
				2.4639167785645,
				3.6540625095367
			}
		},
		pes_level_bogenhafen_city_torch = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_torch_01",
				"pes_level_bogenhafen_city_torch_02",
				"pes_level_bogenhafen_city_torch_03",
				"pes_level_bogenhafen_city_torch_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_torch_01",
				"pes_level_bogenhafen_city_torch_02",
				"pes_level_bogenhafen_city_torch_03",
				"pes_level_bogenhafen_city_torch_04"
			},
			sound_events_duration = {
				3.7764999866486,
				1.8830000162125,
				1.2776875495911,
				2.819375038147
			}
		},
		pes_level_bogenhafen_city_way_out = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_bogenhafen_city",
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
				"pes_level_bogenhafen_city_way_out_01",
				"pes_level_bogenhafen_city_way_out_02",
				"pes_level_bogenhafen_city_way_out_03",
				"pes_level_bogenhafen_city_way_out_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_bogenhafen_city_way_out_01",
				"pes_level_bogenhafen_city_way_out_02",
				"pes_level_bogenhafen_city_way_out_03",
				"pes_level_bogenhafen_city_way_out_04"
			},
			sound_events_duration = {
				3.4331874847412,
				2.2358124256134,
				3.6672291755676,
				3.4918959140778
			}
		}
	})
end
