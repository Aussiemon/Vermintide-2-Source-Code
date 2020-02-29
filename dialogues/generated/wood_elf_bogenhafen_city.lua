return function ()
	define_rule({
		name = "pwe_level_bogenhafen_city_sewers",
		response = "pwe_level_bogenhafen_city_sewers",
		criterias = {
			{
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
		name = "pwe_sh_level_bogenhafen_city_sewers",
		response = "pwe_sh_level_bogenhafen_city_sewers",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_taking_too_long",
		response = "pwe_level_bogenhafen_city_taking_too_long",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_torch",
		response = "pwe_level_bogenhafen_city_torch",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_blocked",
		response = "pwe_level_bogenhafen_city_blocked",
		criterias = {
			{
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
		name = "pwe_hm_level_bogenhafen_city_blocked",
		response = "pwe_hm_level_bogenhafen_city_blocked",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_braziers",
		response = "pwe_level_bogenhafen_city_braziers",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_here_they_come",
		response = "pwe_level_bogenhafen_city_here_they_come",
		criterias = {
			{
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
		name = "pwe_sh_level_bogenhafen_city_here_they_come",
		response = "pwe_sh_level_bogenhafen_city_here_they_come",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_way_out",
		response = "pwe_level_bogenhafen_city_way_out",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_raining",
		response = "pwe_level_bogenhafen_city_raining",
		criterias = {
			{
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
		name = "pwe_hm_level_bogenhafen_city_raining",
		response = "pwe_hm_level_bogenhafen_city_raining",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_smoke_pillar",
		response = "pwe_level_bogenhafen_city_smoke_pillar",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_revelry",
		response = "pwe_level_bogenhafen_city_revelry",
		criterias = {
			{
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
		name = "pwe_sh_level_bogenhafen_city_revelry",
		response = "pwe_sh_level_bogenhafen_city_revelry",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_bögenauer",
		response = "pwe_level_bogenhafen_city_bögenauer",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_infestation",
		response = "pwe_level_bogenhafen_city_infestation",
		criterias = {
			{
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
		name = "pwe_sh_level_bogenhafen_city_infestation",
		response = "pwe_sh_level_bogenhafen_city_infestation",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_find_priest_key",
		response = "pwe_level_bogenhafen_city_find_priest_key",
		criterias = {
			{
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
				"pwe_level_bogenhafen_city_find_priest_key",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_level_bogenhafen_city_find_priest_key",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_dead_priest",
		response = "pwe_level_bogenhafen_city_dead_priest",
		criterias = {
			{
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
		name = "pwe_sh_level_bogenhafen_city_dead_priest",
		response = "pwe_sh_level_bogenhafen_city_dead_priest",
		criterias = {
			{
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
		name = "pwe_hm_level_bogenhafen_city_dead_priest",
		response = "pwe_hm_level_bogenhafen_city_dead_priest",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_temple",
		response = "pwe_level_bogenhafen_city_temple",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_defiled",
		response = "pwe_level_bogenhafen_city_defiled",
		criterias = {
			{
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
		name = "pwe_sh_level_bogenhafen_city_defiled",
		response = "pwe_sh_level_bogenhafen_city_defiled",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_artefact",
		response = "pwe_level_bogenhafen_city_artefact",
		criterias = {
			{
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
		name = "pwe_hm_level_bogenhafen_city_found_artefact",
		response = "pwe_hm_level_bogenhafen_city_found_artefact",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_escape",
		response = "pwe_level_bogenhafen_city_escape",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_keep_moving",
		response = "pwe_level_bogenhafen_city_keep_moving",
		criterias = {
			{
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
		name = "pwe_hm_level_bogenhafen_city_keep_moving",
		response = "pwe_hm_level_bogenhafen_city_keep_moving",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_objective_find",
		response = "pwe_level_bogenhafen_city_objective_find",
		criterias = {
			{
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
		response = "pwe_level_bogenhafen_city_objective_next",
		name = "pwe_level_bogenhafen_city_objective_next",
		criterias = {
			{
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
				"wood_elf"
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
		name = "pwe_level_bogenhafen_city_objective_last",
		response = "pwe_level_bogenhafen_city_objective_last",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_noisy",
		response = "pwe_level_bogenhafen_city_noisy",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_sanctum",
		response = "pwe_level_bogenhafen_city_sanctum",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_sanctum_books",
		response = "pwe_level_bogenhafen_city_sanctum_books",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city_goblin",
		response = "pwe_level_bogenhafen_city_goblin",
		criterias = {
			{
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
		name = "pwe_level_bogenhafen_city _intro_a",
		response = "pwe_level_bogenhafen_city _intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city _intro_a"
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
				"level_bogenhafen_city _intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city _intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_bogenhafen_city _intro_b",
		response = "pwe_level_bogenhafen_city _intro_b",
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
				"level_bogenhafen_city _intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"level_bogenhafen_city _intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city _intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_level_bogenhafen_city _intro_c",
		response = "pwe_level_bogenhafen_city _intro_c",
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
				"level_bogenhafen_city _intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"level_bogenhafen_city _intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city _intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pwe_level_bogenhafen_city_here_they_come = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_here_they_come_01",
				"pwe_level_bogenhafen_city_here_they_come_02",
				"pwe_level_bogenhafen_city_here_they_come_03",
				"pwe_level_bogenhafen_city_here_they_come_04"
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
			sound_events_duration = {
				2.261958360672,
				2.2698333263397,
				3.9174375534058,
				2.9136667251587
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_here_they_come_01",
				"pwe_level_bogenhafen_city_here_they_come_02",
				"pwe_level_bogenhafen_city_here_they_come_03",
				"pwe_level_bogenhafen_city_here_they_come_04"
			},
			randomize_indexes = {}
		},
		pwe_hm_level_bogenhafen_city_raining = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_city_raining_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.364000082016
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_city_raining_01"
			}
		},
		pwe_level_bogenhafen_city_noisy = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_noisy_01",
				"pwe_level_bogenhafen_city_noisy_02",
				"pwe_level_bogenhafen_city_noisy_03",
				"pwe_level_bogenhafen_city_noisy_04"
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
				6.4674372673035,
				7.7010626792908,
				4.4657917022705,
				6.2866249084473
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_noisy_01",
				"pwe_level_bogenhafen_city_noisy_02",
				"pwe_level_bogenhafen_city_noisy_03",
				"pwe_level_bogenhafen_city_noisy_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_braziers = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_braziers_01",
				"pwe_level_bogenhafen_city_braziers_02",
				"pwe_level_bogenhafen_city_braziers_03",
				"pwe_level_bogenhafen_city_braziers_04"
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
				2.5082292556763,
				1.7737916707993,
				2.7790207862854,
				2.7282500267029
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_braziers_01",
				"pwe_level_bogenhafen_city_braziers_02",
				"pwe_level_bogenhafen_city_braziers_03",
				"pwe_level_bogenhafen_city_braziers_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_smoke_pillar = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_smoke_pillar_01",
				"pwe_level_bogenhafen_city_smoke_pillar_02",
				"pwe_level_bogenhafen_city_smoke_pillar_03",
				"pwe_level_bogenhafen_city_smoke_pillar_04"
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
				3.8079791069031,
				4.0750622749329,
				5.143958568573,
				6.2142081260681
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_smoke_pillar_01",
				"pwe_level_bogenhafen_city_smoke_pillar_02",
				"pwe_level_bogenhafen_city_smoke_pillar_03",
				"pwe_level_bogenhafen_city_smoke_pillar_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_blocked = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_blocked_01",
				"pwe_level_bogenhafen_city_blocked_02",
				"pwe_level_bogenhafen_city_blocked_03",
				"pwe_level_bogenhafen_city_blocked_04"
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
				3.3856875896454,
				1.6657291650772,
				4.614333152771,
				3.2432498931885
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_blocked_01",
				"pwe_level_bogenhafen_city_blocked_02",
				"pwe_level_bogenhafen_city_blocked_03",
				"pwe_level_bogenhafen_city_blocked_04"
			},
			randomize_indexes = {}
		},
		pwe_sh_level_bogenhafen_city_infestation = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_city_infestation_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 7.8150625228882
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_city_infestation_01"
			}
		},
		pwe_level_bogenhafen_city_goblin = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_goblin_01",
				"pwe_level_bogenhafen_city_goblin_02",
				"pwe_level_bogenhafen_city_goblin_03",
				"pwe_level_bogenhafen_city_goblin_04"
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
				4.804229259491,
				4.0930624008179,
				4.9245209693909,
				3.7713541984558
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_goblin_01",
				"pwe_level_bogenhafen_city_goblin_02",
				"pwe_level_bogenhafen_city_goblin_03",
				"pwe_level_bogenhafen_city_goblin_04"
			},
			randomize_indexes = {}
		},
		pwe_sh_level_bogenhafen_city_dead_priest = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_city_dead_priest_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_sadness"
			},
			sound_events_duration = {
				[1.0] = 6.8157916069031
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_city_dead_priest_01"
			}
		},
		pwe_level_bogenhafen_city_raining = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_raining_01",
				"pwe_level_bogenhafen_city_raining_02",
				"pwe_level_bogenhafen_city_raining_03",
				"pwe_level_bogenhafen_city_raining_04"
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
			sound_events_duration = {
				2.0129792690277,
				3.5430624485016,
				2.9190833568573,
				4.5522708892822
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_raining_01",
				"pwe_level_bogenhafen_city_raining_02",
				"pwe_level_bogenhafen_city_raining_03",
				"pwe_level_bogenhafen_city_raining_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_objective_last = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_objective_last_01",
				"pwe_level_bogenhafen_city_objective_last_02",
				"pwe_level_bogenhafen_city_objective_last_03",
				"pwe_level_bogenhafen_city_objective_last_04"
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
				0.97164583206177,
				0.88162499666214,
				2.4211666584015,
				1.7842708826065
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_objective_last_01",
				"pwe_level_bogenhafen_city_objective_last_02",
				"pwe_level_bogenhafen_city_objective_last_03",
				"pwe_level_bogenhafen_city_objective_last_04"
			},
			randomize_indexes = {}
		},
		pwe_hm_level_bogenhafen_city_keep_moving = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_city_keep_moving_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.3970415592194
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_city_keep_moving_01"
			}
		},
		pwe_sh_level_bogenhafen_city_sewers = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_city_sewers_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.3765416145325
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_city_sewers_01"
			}
		},
		pwe_level_bogenhafen_city_find_priest_key = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_find_priest_key_01",
				"pwe_level_bogenhafen_city_find_priest_key_02",
				"pwe_level_bogenhafen_city_find_priest_key_03",
				"pwe_level_bogenhafen_city_find_priest_key_04"
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
				2.5411875247955,
				4.0015625953674,
				3.9377708435059,
				4.6960835456848
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_find_priest_key_01",
				"pwe_level_bogenhafen_city_find_priest_key_02",
				"pwe_level_bogenhafen_city_find_priest_key_03",
				"pwe_level_bogenhafen_city_find_priest_key_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_keep_moving = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_keep_moving_01",
				"pwe_level_bogenhafen_city_keep_moving_02",
				"pwe_level_bogenhafen_city_keep_moving_03",
				"pwe_level_bogenhafen_city_keep_moving_04"
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
				3.0517916679382,
				2.203604221344,
				1.2531042098999,
				2.7662291526794
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_keep_moving_01",
				"pwe_level_bogenhafen_city_keep_moving_02",
				"pwe_level_bogenhafen_city_keep_moving_03",
				"pwe_level_bogenhafen_city_keep_moving_04"
			},
			randomize_indexes = {}
		},
		pwe_hm_level_bogenhafen_city_blocked = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_city_blocked_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.0306043624878
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_city_blocked_01"
			}
		},
		["pwe_level_bogenhafen_city _intro_b"] = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_level_bogenhafen_city _intro_b_01",
				[2.0] = "pwe_level_bogenhafen_city _intro_b_02"
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
				[1.0] = 3.4567,
				[2.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "pwe_level_bogenhafen_city _intro_b_01",
				[2.0] = "pwe_level_bogenhafen_city _intro_b_02"
			},
			randomize_indexes = {}
		},
		["pwe_level_bogenhafen_city _intro_a"] = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_level_bogenhafen_city _intro_a_01",
				[2.0] = "pwe_level_bogenhafen_city _intro_a_02"
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
				[1.0] = 3.4567,
				[2.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "pwe_level_bogenhafen_city _intro_a_01",
				[2.0] = "pwe_level_bogenhafen_city _intro_a_02"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_objective_next = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_objective_next_01",
				"pwe_level_bogenhafen_city_objective_next_02",
				"pwe_level_bogenhafen_city_objective_next_03",
				"pwe_level_bogenhafen_city_objective_next_04"
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
				3.7331042289734,
				2.1338124275208,
				2.6831042766571,
				2.0927708148956
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_objective_next_01",
				"pwe_level_bogenhafen_city_objective_next_02",
				"pwe_level_bogenhafen_city_objective_next_03",
				"pwe_level_bogenhafen_city_objective_next_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_revelry = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_revelry_01",
				"pwe_level_bogenhafen_city_revelry_02",
				"pwe_level_bogenhafen_city_revelry_03",
				"pwe_level_bogenhafen_city_revelry_04"
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
				2.0193750858307,
				3.9771873950958,
				5.8094582557678,
				5.9241666793823
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_revelry_01",
				"pwe_level_bogenhafen_city_revelry_02",
				"pwe_level_bogenhafen_city_revelry_03",
				"pwe_level_bogenhafen_city_revelry_04"
			},
			randomize_indexes = {}
		},
		pwe_hm_level_bogenhafen_city_dead_priest = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_city_dead_priest_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_sadness"
			},
			sound_events_duration = {
				[1.0] = 4.9331874847412
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_city_dead_priest_01"
			}
		},
		pwe_level_bogenhafen_city_dead_priest = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_dead_priest_01",
				"pwe_level_bogenhafen_city_dead_priest_02",
				"pwe_level_bogenhafen_city_dead_priest_03",
				"pwe_level_bogenhafen_city_dead_priest_04"
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
			sound_events_duration = {
				3.5184373855591,
				3.0798332691193,
				3.0123751163483,
				3.0299999713898
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_dead_priest_01",
				"pwe_level_bogenhafen_city_dead_priest_02",
				"pwe_level_bogenhafen_city_dead_priest_03",
				"pwe_level_bogenhafen_city_dead_priest_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_escape = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_escape_01",
				"pwe_level_bogenhafen_city_escape_02",
				"pwe_level_bogenhafen_city_escape_03",
				"pwe_level_bogenhafen_city_escape_04"
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
				5.9377293586731,
				1.9265625476837,
				3.6062917709351,
				3.7337501049042
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_escape_01",
				"pwe_level_bogenhafen_city_escape_02",
				"pwe_level_bogenhafen_city_escape_03",
				"pwe_level_bogenhafen_city_escape_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_defiled = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_defiled_01",
				"pwe_level_bogenhafen_city_defiled_02",
				"pwe_level_bogenhafen_city_defiled_03",
				"pwe_level_bogenhafen_city_defiled_04"
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
			sound_events_duration = {
				3.9163334369659,
				3.7948541641235,
				2.8908958435059,
				3.8121666908264
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_defiled_01",
				"pwe_level_bogenhafen_city_defiled_02",
				"pwe_level_bogenhafen_city_defiled_03",
				"pwe_level_bogenhafen_city_defiled_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_sanctum_books = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_sanctum_books_01",
				"pwe_level_bogenhafen_city_sanctum_books_02",
				"pwe_level_bogenhafen_city_sanctum_books_03",
				"pwe_level_bogenhafen_city_sanctum_books_04"
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
				3.7655625343323,
				4.3111872673035,
				4.1772294044495,
				3.9059584140778
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_sanctum_books_01",
				"pwe_level_bogenhafen_city_sanctum_books_02",
				"pwe_level_bogenhafen_city_sanctum_books_03",
				"pwe_level_bogenhafen_city_sanctum_books_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_taking_too_long = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_taking_too_long_01",
				"pwe_level_bogenhafen_city_taking_too_long_02",
				"pwe_level_bogenhafen_city_taking_too_long_03",
				"pwe_level_bogenhafen_city_taking_too_long_04"
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
				2.5945000648499,
				2.6615207195282,
				2.799708366394,
				2.9254999160767
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_taking_too_long_01",
				"pwe_level_bogenhafen_city_taking_too_long_02",
				"pwe_level_bogenhafen_city_taking_too_long_03",
				"pwe_level_bogenhafen_city_taking_too_long_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_objective_find = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_objective_find_01",
				"pwe_level_bogenhafen_city_objective_find_02",
				"pwe_level_bogenhafen_city_objective_find_03",
				"pwe_level_bogenhafen_city_objective_find_04"
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
				2.7380208969116,
				1.2227292060852,
				1.521124958992,
				3.1790833473206
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_objective_find_01",
				"pwe_level_bogenhafen_city_objective_find_02",
				"pwe_level_bogenhafen_city_objective_find_03",
				"pwe_level_bogenhafen_city_objective_find_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_sanctum = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_level_bogenhafen_city_sanctum_02",
				[2.0] = "pwe_level_bogenhafen_city_sanctum_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.6485209465027,
				[2.0] = 3.7993333339691
			},
			localization_strings = {
				[1.0] = "pwe_level_bogenhafen_city_sanctum_02",
				[2.0] = "pwe_level_bogenhafen_city_sanctum_04"
			},
			randomize_indexes = {}
		},
		pwe_sh_level_bogenhafen_city_here_they_come = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_city_here_they_come_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_concerned"
			},
			sound_events_duration = {
				[1.0] = 6.3131456375122
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_city_here_they_come_01"
			}
		},
		pwe_level_bogenhafen_city_infestation = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_infestation_01",
				"pwe_level_bogenhafen_city_infestation_02",
				"pwe_level_bogenhafen_city_infestation_03",
				"pwe_level_bogenhafen_city_infestation_04"
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
				3.0632500648499,
				4.7371873855591,
				4.1951251029968,
				6.0613331794739
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_infestation_01",
				"pwe_level_bogenhafen_city_infestation_02",
				"pwe_level_bogenhafen_city_infestation_03",
				"pwe_level_bogenhafen_city_infestation_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_bögenauer = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_bögenauer_01",
				"pwe_level_bogenhafen_city_bögenauer_02",
				"pwe_level_bogenhafen_city_bögenauer_03",
				"pwe_level_bogenhafen_city_bögenauer_04"
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
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_bögenauer_01",
				"pwe_level_bogenhafen_city_bögenauer_02",
				"pwe_level_bogenhafen_city_bögenauer_03",
				"pwe_level_bogenhafen_city_bögenauer_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_temple = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_temple_01",
				"pwe_level_bogenhafen_city_temple_02",
				"pwe_level_bogenhafen_city_temple_03",
				"pwe_level_bogenhafen_city_temple_04"
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
				1.7589166164398,
				1.8482291698456,
				2.665854215622,
				3.4185209274292
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_temple_01",
				"pwe_level_bogenhafen_city_temple_02",
				"pwe_level_bogenhafen_city_temple_03",
				"pwe_level_bogenhafen_city_temple_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_sewers = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_sewers_01",
				"pwe_level_bogenhafen_city_sewers_02",
				"pwe_level_bogenhafen_city_sewers_03",
				"pwe_level_bogenhafen_city_sewers_04"
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
				2.7427084445953,
				3.6157290935516,
				3.7027916908264,
				3.8629584312439
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_sewers_01",
				"pwe_level_bogenhafen_city_sewers_02",
				"pwe_level_bogenhafen_city_sewers_03",
				"pwe_level_bogenhafen_city_sewers_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_artefact = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "cut_scene",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_artefact_01",
				"pwe_level_bogenhafen_city_artefact_02",
				"pwe_level_bogenhafen_city_artefact_03",
				"pwe_level_bogenhafen_city_artefact_04"
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
				4.0966873168945,
				2.2171041965485,
				3.3130834102631,
				3.5454375743866
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_artefact_01",
				"pwe_level_bogenhafen_city_artefact_02",
				"pwe_level_bogenhafen_city_artefact_03",
				"pwe_level_bogenhafen_city_artefact_04"
			},
			randomize_indexes = {}
		},
		pwe_sh_level_bogenhafen_city_revelry = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_city_revelry_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.3925833702087
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_city_revelry_01"
			}
		},
		pwe_sh_level_bogenhafen_city_defiled = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_sh_level_bogenhafen_city_defiled_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			sound_events_duration = {
				[1.0] = 6.8956456184387
			},
			localization_strings = {
				[1.0] = "pwe_sh_level_bogenhafen_city_defiled_01"
			}
		},
		["pwe_level_bogenhafen_city _intro_c"] = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_level_bogenhafen_city _intro_c_01",
				[2.0] = "pwe_level_bogenhafen_city _intro_c_02"
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
				[1.0] = 3.4567,
				[2.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "pwe_level_bogenhafen_city _intro_c_01",
				[2.0] = "pwe_level_bogenhafen_city _intro_c_02"
			},
			randomize_indexes = {}
		},
		pwe_hm_level_bogenhafen_city_found_artefact = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "wood_elf_bogenhafen_city",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_hm_level_bogenhafen_city_found_artefact_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			sound_events_duration = {
				[1.0] = 2.5893664360046
			},
			localization_strings = {
				[1.0] = "pwe_hm_level_bogenhafen_city_found_artefact_01"
			}
		},
		pwe_level_bogenhafen_city_torch = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_torch_01",
				"pwe_level_bogenhafen_city_torch_02",
				"pwe_level_bogenhafen_city_torch_03",
				"pwe_level_bogenhafen_city_torch_04"
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
				1.7790625095367,
				1.3680416345596,
				4.7892498970032,
				3.0710208415985
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_torch_01",
				"pwe_level_bogenhafen_city_torch_02",
				"pwe_level_bogenhafen_city_torch_03",
				"pwe_level_bogenhafen_city_torch_04"
			},
			randomize_indexes = {}
		},
		pwe_level_bogenhafen_city_way_out = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_bogenhafen_city",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_bogenhafen_city_way_out_01",
				"pwe_level_bogenhafen_city_way_out_02",
				"pwe_level_bogenhafen_city_way_out_03",
				"pwe_level_bogenhafen_city_way_out_04"
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
				3.9859583377838,
				2.9081873893738,
				2.10902094841,
				3.2377917766571
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_way_out_01",
				"pwe_level_bogenhafen_city_way_out_02",
				"pwe_level_bogenhafen_city_way_out_03",
				"pwe_level_bogenhafen_city_way_out_04"
			},
			randomize_indexes = {}
		}
	})
end
