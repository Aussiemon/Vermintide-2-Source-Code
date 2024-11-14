-- chunkname: @dialogues/generated/wood_elf_bogenhafen_city.lua

return function ()
	define_rule({
		name = "pwe_hm_level_bogenhafen_city_blocked",
		probability = 1,
		response = "pwe_hm_level_bogenhafen_city_blocked",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_blocked",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_maidenguard",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_blocked",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_blocked",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_hm_level_bogenhafen_city_dead_priest",
		probability = 1,
		response = "pwe_hm_level_bogenhafen_city_dead_priest",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_dead_priest",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_maidenguard",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_dead_priest",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_dead_priest",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_hm_level_bogenhafen_city_found_artefact",
		probability = 1,
		response = "pwe_hm_level_bogenhafen_city_found_artefact",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_found_artefact",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_maidenguard",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_found_artefact",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_found_artefact",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_hm_level_bogenhafen_city_keep_moving",
		probability = 1,
		response = "pwe_hm_level_bogenhafen_city_keep_moving",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_keep_moving",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_maidenguard",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_keep_moving",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_keep_moving",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_hm_level_bogenhafen_city_raining",
		probability = 1,
		response = "pwe_hm_level_bogenhafen_city_raining",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_raining",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_maidenguard",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_raining",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_raining",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_artefact",
		probability = 1,
		response = "pwe_level_bogenhafen_city_artefact",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_artefact",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_artefact",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_blocked",
		probability = 1,
		response = "pwe_level_bogenhafen_city_blocked",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_blocked",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_blocked",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_blocked",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_braziers",
		probability = 1,
		response = "pwe_level_bogenhafen_city_braziers",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_braziers",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_braziers",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_braziers",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_bögenauer",
		probability = 1,
		response = "pwe_level_bogenhafen_city_bögenauer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_bögenauer",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_bögenauer",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_bögenauer",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_dead_priest",
		probability = 1,
		response = "pwe_level_bogenhafen_city_dead_priest",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_dead_priest",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_dead_priest",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_dead_priest",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_defiled",
		probability = 1,
		response = "pwe_level_bogenhafen_city_defiled",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_defiled",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_defiled",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_defiled",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_escape",
		probability = 1,
		response = "pwe_level_bogenhafen_city_escape",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_escape",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_escape",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_escape",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_find_priest_key",
		probability = 1,
		response = "pwe_level_bogenhafen_city_find_priest_key",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_find_priest_key",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"pwe_level_bogenhafen_city_find_priest_key",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pwe_level_bogenhafen_city_find_priest_key",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_goblin",
		probability = 1,
		response = "pwe_level_bogenhafen_city_goblin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_goblin",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_goblin",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_goblin",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_here_they_come",
		probability = 1,
		response = "pwe_level_bogenhafen_city_here_they_come",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_here_they_come",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_here_they_come",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_here_they_come",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_infestation",
		probability = 1,
		response = "pwe_level_bogenhafen_city_infestation",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_infestation",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_infestation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_infestation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_intro_a",
		probability = 1,
		response = "pwe_level_bogenhafen_city_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_intro_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_intro_b",
		probability = 1,
		response = "pwe_level_bogenhafen_city_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_bogenhafen_city_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_intro_c",
		probability = 1,
		response = "pwe_level_bogenhafen_city_intro_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"level_bogenhafen_city_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_intro_c",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_keep_moving",
		probability = 1,
		response = "pwe_level_bogenhafen_city_keep_moving",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_keep_moving",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_keep_moving",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_keep_moving",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_noisy",
		probability = 1,
		response = "pwe_level_bogenhafen_city_noisy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_noisy",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_noisy",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_noisy",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_objective_find",
		probability = 1,
		response = "pwe_level_bogenhafen_city_objective_find",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_objective_find",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_objective_find",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_objective_find",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_objective_last",
		probability = 1,
		response = "pwe_level_bogenhafen_city_objective_last",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_objective_last",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_objective_last",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_objective_last",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_objective_next",
		probability = 1,
		response = "pwe_level_bogenhafen_city_objective_next",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_objective_next",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_raining",
		probability = 1,
		response = "pwe_level_bogenhafen_city_raining",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_raining",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_raining",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_raining",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_revelry",
		probability = 1,
		response = "pwe_level_bogenhafen_city_revelry",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_revelry",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_revelry",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_revelry",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_sanctum",
		probability = 1,
		response = "pwe_level_bogenhafen_city_sanctum",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_sanctum",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_sanctum",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sanctum",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_sanctum_books",
		probability = 1,
		response = "pwe_level_bogenhafen_city_sanctum_books",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_sanctum_books",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_sanctum_books",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sanctum_books",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_sewers",
		probability = 1,
		response = "pwe_level_bogenhafen_city_sewers",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_sewers",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_smoke_pillar",
		probability = 1,
		response = "pwe_level_bogenhafen_city_smoke_pillar",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_smoke_pillar",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_smoke_pillar",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_smoke_pillar",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_taking_too_long",
		probability = 1,
		response = "pwe_level_bogenhafen_city_taking_too_long",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_taking_too_long",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_taking_too_long",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_taking_too_long",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_temple",
		probability = 1,
		response = "pwe_level_bogenhafen_city_temple",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_temple",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_temple",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_temple",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_torch",
		probability = 1,
		response = "pwe_level_bogenhafen_city_torch",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_torch",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_torch",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_torch",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_bogenhafen_city_way_out",
		probability = 1,
		response = "pwe_level_bogenhafen_city_way_out",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_way_out",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_way_out",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_way_out",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_sh_level_bogenhafen_city_dead_priest",
		probability = 1,
		response = "pwe_sh_level_bogenhafen_city_dead_priest",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_dead_priest",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_shade",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_dead_priest",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_dead_priest",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_sh_level_bogenhafen_city_defiled",
		probability = 1,
		response = "pwe_sh_level_bogenhafen_city_defiled",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_defiled",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_shade",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_defiled",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_defiled",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_sh_level_bogenhafen_city_here_they_come",
		probability = 1,
		response = "pwe_sh_level_bogenhafen_city_here_they_come",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_here_they_come",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_shade",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_here_they_come",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_here_they_come",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_sh_level_bogenhafen_city_infestation",
		probability = 1,
		response = "pwe_sh_level_bogenhafen_city_infestation",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_infestation",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_shade",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_infestation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_infestation",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_sh_level_bogenhafen_city_revelry",
		probability = 1,
		response = "pwe_sh_level_bogenhafen_city_revelry",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_revelry",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_shade",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_revelry",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_revelry",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_sh_level_bogenhafen_city_sewers",
		probability = 1,
		response = "pwe_sh_level_bogenhafen_city_sewers",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_bogenhafen_city_sewers",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_shade",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_sewers",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pwe_hm_level_bogenhafen_city_blocked = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_hm_level_bogenhafen_city_blocked_01",
			},
			sound_events = {
				[1] = "pwe_hm_level_bogenhafen_city_blocked_01",
			},
			sound_events_duration = {
				[1] = 4.484395980835,
			},
		},
		pwe_hm_level_bogenhafen_city_dead_priest = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_sadness",
			},
			localization_strings = {
				[1] = "pwe_hm_level_bogenhafen_city_dead_priest_01",
			},
			sound_events = {
				[1] = "pwe_hm_level_bogenhafen_city_dead_priest_01",
			},
			sound_events_duration = {
				[1] = 4.9331874847412,
			},
		},
		pwe_hm_level_bogenhafen_city_found_artefact = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_hm_level_bogenhafen_city_found_artefact_01",
			},
			sound_events = {
				[1] = "pwe_hm_level_bogenhafen_city_found_artefact_01",
			},
			sound_events_duration = {
				[1] = 2.5893664360046,
			},
		},
		pwe_hm_level_bogenhafen_city_keep_moving = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_hm_level_bogenhafen_city_keep_moving_01",
			},
			sound_events = {
				[1] = "pwe_hm_level_bogenhafen_city_keep_moving_01",
			},
			sound_events_duration = {
				[1] = 3.3970415592194,
			},
		},
		pwe_hm_level_bogenhafen_city_raining = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_hm_level_bogenhafen_city_raining_01",
			},
			sound_events = {
				[1] = "pwe_hm_level_bogenhafen_city_raining_01",
			},
			sound_events_duration = {
				[1] = 3.364000082016,
			},
		},
		pwe_level_bogenhafen_city_artefact = {
			category = "cut_scene",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_artefact_01",
				"pwe_level_bogenhafen_city_artefact_02",
				"pwe_level_bogenhafen_city_artefact_03",
				"pwe_level_bogenhafen_city_artefact_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_artefact_01",
				"pwe_level_bogenhafen_city_artefact_02",
				"pwe_level_bogenhafen_city_artefact_03",
				"pwe_level_bogenhafen_city_artefact_04",
			},
			sound_events_duration = {
				4.0966873168945,
				2.2171041965485,
				3.3130834102631,
				3.5454375743866,
			},
		},
		pwe_level_bogenhafen_city_blocked = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_blocked_01",
				"pwe_level_bogenhafen_city_blocked_02",
				"pwe_level_bogenhafen_city_blocked_03",
				"pwe_level_bogenhafen_city_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_blocked_01",
				"pwe_level_bogenhafen_city_blocked_02",
				"pwe_level_bogenhafen_city_blocked_03",
				"pwe_level_bogenhafen_city_blocked_04",
			},
			sound_events_duration = {
				3.3856875896454,
				1.6657291650772,
				4.614333152771,
				3.2432498931885,
			},
		},
		pwe_level_bogenhafen_city_braziers = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_braziers_01",
				"pwe_level_bogenhafen_city_braziers_02",
				"pwe_level_bogenhafen_city_braziers_03",
				"pwe_level_bogenhafen_city_braziers_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_braziers_01",
				"pwe_level_bogenhafen_city_braziers_02",
				"pwe_level_bogenhafen_city_braziers_03",
				"pwe_level_bogenhafen_city_braziers_04",
			},
			sound_events_duration = {
				2.5082292556763,
				1.7737916707993,
				2.7790207862854,
				2.7282500267029,
			},
		},
		pwe_level_bogenhafen_city_bögenauer = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_bögenauer_01",
				"pwe_level_bogenhafen_city_bögenauer_02",
				"pwe_level_bogenhafen_city_bögenauer_03",
				"pwe_level_bogenhafen_city_bögenauer_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_bögenauer_01",
				"pwe_level_bogenhafen_city_bögenauer_02",
				"pwe_level_bogenhafen_city_bögenauer_03",
				"pwe_level_bogenhafen_city_bögenauer_04",
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
			},
		},
		pwe_level_bogenhafen_city_dead_priest = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_sadness",
				"face_sadness",
				"face_sadness",
				"face_sadness",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_dead_priest_01",
				"pwe_level_bogenhafen_city_dead_priest_02",
				"pwe_level_bogenhafen_city_dead_priest_03",
				"pwe_level_bogenhafen_city_dead_priest_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_dead_priest_01",
				"pwe_level_bogenhafen_city_dead_priest_02",
				"pwe_level_bogenhafen_city_dead_priest_03",
				"pwe_level_bogenhafen_city_dead_priest_04",
			},
			sound_events_duration = {
				3.5184373855591,
				3.0798332691193,
				3.0123751163483,
				3.0299999713898,
			},
		},
		pwe_level_bogenhafen_city_defiled = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_defiled_01",
				"pwe_level_bogenhafen_city_defiled_02",
				"pwe_level_bogenhafen_city_defiled_03",
				"pwe_level_bogenhafen_city_defiled_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_defiled_01",
				"pwe_level_bogenhafen_city_defiled_02",
				"pwe_level_bogenhafen_city_defiled_03",
				"pwe_level_bogenhafen_city_defiled_04",
			},
			sound_events_duration = {
				3.9163334369659,
				3.7948541641235,
				2.8908958435059,
				3.8121666908264,
			},
		},
		pwe_level_bogenhafen_city_escape = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_escape_01",
				"pwe_level_bogenhafen_city_escape_02",
				"pwe_level_bogenhafen_city_escape_03",
				"pwe_level_bogenhafen_city_escape_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_escape_01",
				"pwe_level_bogenhafen_city_escape_02",
				"pwe_level_bogenhafen_city_escape_03",
				"pwe_level_bogenhafen_city_escape_04",
			},
			sound_events_duration = {
				5.9377293586731,
				1.9265625476837,
				3.6062917709351,
				3.7337501049042,
			},
		},
		pwe_level_bogenhafen_city_find_priest_key = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_find_priest_key_01",
				"pwe_level_bogenhafen_city_find_priest_key_02",
				"pwe_level_bogenhafen_city_find_priest_key_03",
				"pwe_level_bogenhafen_city_find_priest_key_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_find_priest_key_01",
				"pwe_level_bogenhafen_city_find_priest_key_02",
				"pwe_level_bogenhafen_city_find_priest_key_03",
				"pwe_level_bogenhafen_city_find_priest_key_04",
			},
			sound_events_duration = {
				2.5411875247955,
				4.0015625953674,
				3.9377708435059,
				4.6960835456848,
			},
		},
		pwe_level_bogenhafen_city_goblin = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_goblin_01",
				"pwe_level_bogenhafen_city_goblin_02",
				"pwe_level_bogenhafen_city_goblin_03",
				"pwe_level_bogenhafen_city_goblin_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_goblin_01",
				"pwe_level_bogenhafen_city_goblin_02",
				"pwe_level_bogenhafen_city_goblin_03",
				"pwe_level_bogenhafen_city_goblin_04",
			},
			sound_events_duration = {
				4.804229259491,
				4.0930624008179,
				4.9245209693909,
				3.7713541984558,
			},
		},
		pwe_level_bogenhafen_city_here_they_come = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_concerned",
				"face_neutral",
				"face_neutral",
				"face_curious",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_here_they_come_01",
				"pwe_level_bogenhafen_city_here_they_come_02",
				"pwe_level_bogenhafen_city_here_they_come_03",
				"pwe_level_bogenhafen_city_here_they_come_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_here_they_come_01",
				"pwe_level_bogenhafen_city_here_they_come_02",
				"pwe_level_bogenhafen_city_here_they_come_03",
				"pwe_level_bogenhafen_city_here_they_come_04",
			},
			sound_events_duration = {
				2.261958360672,
				2.2698333263397,
				3.9174375534058,
				2.9603958129883,
			},
		},
		pwe_level_bogenhafen_city_infestation = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_infestation_01",
				"pwe_level_bogenhafen_city_infestation_02",
				"pwe_level_bogenhafen_city_infestation_03",
				"pwe_level_bogenhafen_city_infestation_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_infestation_01",
				"pwe_level_bogenhafen_city_infestation_02",
				"pwe_level_bogenhafen_city_infestation_03",
				"pwe_level_bogenhafen_city_infestation_04",
			},
			sound_events_duration = {
				3.0632500648499,
				4.7371873855591,
				4.1951251029968,
				6.0613331794739,
			},
		},
		pwe_level_bogenhafen_city_intro_a = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_city_intro_a_01",
				[2] = "pwe_level_bogenhafen_city_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_bogenhafen_city_intro_a_01",
				[2] = "pwe_level_bogenhafen_city_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.4502291679382,
				[2] = 4.7129998207092,
			},
		},
		pwe_level_bogenhafen_city_intro_b = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_city_intro_b_01",
				[2] = "pwe_level_bogenhafen_city_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_bogenhafen_city_intro_b_01",
				[2] = "pwe_level_bogenhafen_city_intro_b_02",
			},
			sound_events_duration = {
				[1] = 6.5562915802002,
				[2] = 8.109395980835,
			},
		},
		pwe_level_bogenhafen_city_intro_c = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_city_intro_c_01",
				[2] = "pwe_level_bogenhafen_city_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_bogenhafen_city_intro_c_01",
				[2] = "pwe_level_bogenhafen_city_intro_c_02",
			},
			sound_events_duration = {
				[1] = 5.1345415115356,
				[2] = 7.2982082366943,
			},
		},
		pwe_level_bogenhafen_city_keep_moving = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_keep_moving_01",
				"pwe_level_bogenhafen_city_keep_moving_02",
				"pwe_level_bogenhafen_city_keep_moving_03",
				"pwe_level_bogenhafen_city_keep_moving_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_keep_moving_01",
				"pwe_level_bogenhafen_city_keep_moving_02",
				"pwe_level_bogenhafen_city_keep_moving_03",
				"pwe_level_bogenhafen_city_keep_moving_04",
			},
			sound_events_duration = {
				3.0517916679382,
				2.1002604365349,
				1.2531042098999,
				2.7662291526794,
			},
		},
		pwe_level_bogenhafen_city_noisy = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_noisy_01",
				"pwe_level_bogenhafen_city_noisy_02",
				"pwe_level_bogenhafen_city_noisy_03",
				"pwe_level_bogenhafen_city_noisy_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_noisy_01",
				"pwe_level_bogenhafen_city_noisy_02",
				"pwe_level_bogenhafen_city_noisy_03",
				"pwe_level_bogenhafen_city_noisy_04",
			},
			sound_events_duration = {
				6.4674372673035,
				7.7010626792908,
				4.4657917022705,
				6.2866249084473,
			},
		},
		pwe_level_bogenhafen_city_objective_find = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_objective_find_01",
				"pwe_level_bogenhafen_city_objective_find_02",
				"pwe_level_bogenhafen_city_objective_find_03",
				"pwe_level_bogenhafen_city_objective_find_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_objective_find_01",
				"pwe_level_bogenhafen_city_objective_find_02",
				"pwe_level_bogenhafen_city_objective_find_03",
				"pwe_level_bogenhafen_city_objective_find_04",
			},
			sound_events_duration = {
				2.7380208969116,
				1.2227292060852,
				1.521124958992,
				3.1790833473206,
			},
		},
		pwe_level_bogenhafen_city_objective_last = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_objective_last_01",
				"pwe_level_bogenhafen_city_objective_last_02",
				"pwe_level_bogenhafen_city_objective_last_03",
				"pwe_level_bogenhafen_city_objective_last_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_objective_last_01",
				"pwe_level_bogenhafen_city_objective_last_02",
				"pwe_level_bogenhafen_city_objective_last_03",
				"pwe_level_bogenhafen_city_objective_last_04",
			},
			sound_events_duration = {
				0.97164583206177,
				0.88162499666214,
				2.3060520887375,
				1.7842708826065,
			},
		},
		pwe_level_bogenhafen_city_objective_next = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_objective_next_01",
				"pwe_level_bogenhafen_city_objective_next_02",
				"pwe_level_bogenhafen_city_objective_next_03",
				"pwe_level_bogenhafen_city_objective_next_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_objective_next_01",
				"pwe_level_bogenhafen_city_objective_next_02",
				"pwe_level_bogenhafen_city_objective_next_03",
				"pwe_level_bogenhafen_city_objective_next_04",
			},
			sound_events_duration = {
				3.7331042289734,
				2.1338124275208,
				2.6831042766571,
				2.0927708148956,
			},
		},
		pwe_level_bogenhafen_city_raining = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_raining_01",
				"pwe_level_bogenhafen_city_raining_02",
				"pwe_level_bogenhafen_city_raining_03",
				"pwe_level_bogenhafen_city_raining_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_raining_01",
				"pwe_level_bogenhafen_city_raining_02",
				"pwe_level_bogenhafen_city_raining_03",
				"pwe_level_bogenhafen_city_raining_04",
			},
			sound_events_duration = {
				2.0129792690277,
				4.2800415754318,
				2.9190833568573,
				4.5522708892822,
			},
		},
		pwe_level_bogenhafen_city_revelry = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_revelry_01",
				"pwe_level_bogenhafen_city_revelry_02",
				"pwe_level_bogenhafen_city_revelry_03",
				"pwe_level_bogenhafen_city_revelry_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_revelry_01",
				"pwe_level_bogenhafen_city_revelry_02",
				"pwe_level_bogenhafen_city_revelry_03",
				"pwe_level_bogenhafen_city_revelry_04",
			},
			sound_events_duration = {
				2.0193750858307,
				3.9771873950958,
				5.8094582557678,
				5.9241666793823,
			},
		},
		pwe_level_bogenhafen_city_sanctum = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_level_bogenhafen_city_sanctum_02",
				[2] = "pwe_level_bogenhafen_city_sanctum_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_bogenhafen_city_sanctum_02",
				[2] = "pwe_level_bogenhafen_city_sanctum_04",
			},
			sound_events_duration = {
				[1] = 3.6485209465027,
				[2] = 3.5782395601273,
			},
		},
		pwe_level_bogenhafen_city_sanctum_books = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_sanctum_books_01",
				"pwe_level_bogenhafen_city_sanctum_books_02",
				"pwe_level_bogenhafen_city_sanctum_books_03",
				"pwe_level_bogenhafen_city_sanctum_books_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_sanctum_books_01",
				"pwe_level_bogenhafen_city_sanctum_books_02",
				"pwe_level_bogenhafen_city_sanctum_books_03",
				"pwe_level_bogenhafen_city_sanctum_books_04",
			},
			sound_events_duration = {
				3.7655625343323,
				4.3111872673035,
				4.1772294044495,
				3.9059584140778,
			},
		},
		pwe_level_bogenhafen_city_sewers = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_sewers_01",
				"pwe_level_bogenhafen_city_sewers_02",
				"pwe_level_bogenhafen_city_sewers_03",
				"pwe_level_bogenhafen_city_sewers_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_sewers_01",
				"pwe_level_bogenhafen_city_sewers_02",
				"pwe_level_bogenhafen_city_sewers_03",
				"pwe_level_bogenhafen_city_sewers_04",
			},
			sound_events_duration = {
				2.7427084445953,
				3.6157290935516,
				3.7027916908264,
				3.8629584312439,
			},
		},
		pwe_level_bogenhafen_city_smoke_pillar = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_smoke_pillar_01",
				"pwe_level_bogenhafen_city_smoke_pillar_02",
				"pwe_level_bogenhafen_city_smoke_pillar_03",
				"pwe_level_bogenhafen_city_smoke_pillar_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_smoke_pillar_01",
				"pwe_level_bogenhafen_city_smoke_pillar_02",
				"pwe_level_bogenhafen_city_smoke_pillar_03",
				"pwe_level_bogenhafen_city_smoke_pillar_04",
			},
			sound_events_duration = {
				3.8079791069031,
				4.0750622749329,
				5.143958568573,
				6.2142081260681,
			},
		},
		pwe_level_bogenhafen_city_taking_too_long = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_taking_too_long_01",
				"pwe_level_bogenhafen_city_taking_too_long_02",
				"pwe_level_bogenhafen_city_taking_too_long_03",
				"pwe_level_bogenhafen_city_taking_too_long_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_taking_too_long_01",
				"pwe_level_bogenhafen_city_taking_too_long_02",
				"pwe_level_bogenhafen_city_taking_too_long_03",
				"pwe_level_bogenhafen_city_taking_too_long_04",
			},
			sound_events_duration = {
				2.5945000648499,
				2.6615207195282,
				2.799708366394,
				2.6819478273392,
			},
		},
		pwe_level_bogenhafen_city_temple = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_temple_01",
				"pwe_level_bogenhafen_city_temple_02",
				"pwe_level_bogenhafen_city_temple_03",
				"pwe_level_bogenhafen_city_temple_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_temple_01",
				"pwe_level_bogenhafen_city_temple_02",
				"pwe_level_bogenhafen_city_temple_03",
				"pwe_level_bogenhafen_city_temple_04",
			},
			sound_events_duration = {
				1.7589166164398,
				1.8482291698456,
				2.665854215622,
				3.4185209274292,
			},
		},
		pwe_level_bogenhafen_city_torch = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_torch_01",
				"pwe_level_bogenhafen_city_torch_02",
				"pwe_level_bogenhafen_city_torch_03",
				"pwe_level_bogenhafen_city_torch_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_torch_01",
				"pwe_level_bogenhafen_city_torch_02",
				"pwe_level_bogenhafen_city_torch_03",
				"pwe_level_bogenhafen_city_torch_04",
			},
			sound_events_duration = {
				1.7790625095367,
				1.3680416345596,
				4.7892498970032,
				3.0710208415985,
			},
		},
		pwe_level_bogenhafen_city_way_out = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwe_level_bogenhafen_city_way_out_01",
				"pwe_level_bogenhafen_city_way_out_02",
				"pwe_level_bogenhafen_city_way_out_03",
				"pwe_level_bogenhafen_city_way_out_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_bogenhafen_city_way_out_01",
				"pwe_level_bogenhafen_city_way_out_02",
				"pwe_level_bogenhafen_city_way_out_03",
				"pwe_level_bogenhafen_city_way_out_04",
			},
			sound_events_duration = {
				3.9859583377838,
				2.9081873893738,
				2.10902094841,
				3.2377917766571,
			},
		},
		pwe_sh_level_bogenhafen_city_dead_priest = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_sadness",
			},
			localization_strings = {
				[1] = "pwe_sh_level_bogenhafen_city_dead_priest_01",
			},
			sound_events = {
				[1] = "pwe_sh_level_bogenhafen_city_dead_priest_01",
			},
			sound_events_duration = {
				[1] = 6.8157916069031,
			},
		},
		pwe_sh_level_bogenhafen_city_defiled = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_sh_level_bogenhafen_city_defiled_01",
			},
			sound_events = {
				[1] = "pwe_sh_level_bogenhafen_city_defiled_01",
			},
			sound_events_duration = {
				[1] = 6.8956456184387,
			},
		},
		pwe_sh_level_bogenhafen_city_here_they_come = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pwe_sh_level_bogenhafen_city_here_they_come_01",
			},
			sound_events = {
				[1] = "pwe_sh_level_bogenhafen_city_here_they_come_01",
			},
			sound_events_duration = {
				[1] = 6.3131456375122,
			},
		},
		pwe_sh_level_bogenhafen_city_infestation = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_sh_level_bogenhafen_city_infestation_01",
			},
			sound_events = {
				[1] = "pwe_sh_level_bogenhafen_city_infestation_01",
			},
			sound_events_duration = {
				[1] = 7.8150625228882,
			},
		},
		pwe_sh_level_bogenhafen_city_revelry = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_sh_level_bogenhafen_city_revelry_01",
			},
			sound_events = {
				[1] = "pwe_sh_level_bogenhafen_city_revelry_01",
			},
			sound_events_duration = {
				[1] = 6.3925833702087,
			},
		},
		pwe_sh_level_bogenhafen_city_sewers = {
			category = "level_talk",
			database = "wood_elf_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_sh_level_bogenhafen_city_sewers_01",
			},
			sound_events = {
				[1] = "pwe_sh_level_bogenhafen_city_sewers_01",
			},
			sound_events_duration = {
				[1] = 4.3765416145325,
			},
		},
	})
end
