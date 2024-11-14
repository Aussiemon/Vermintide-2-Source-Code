-- chunkname: @dialogues/generated/witch_hunter_bogenhafen_city.lua

return function ()
	define_rule({
		name = "pwh_bh_level_bogenhafen_city_bogenauer",
		probability = 1,
		response = "pwh_bh_level_bogenhafen_city_bogenauer",
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
				"level_bogenhafen_city_bogenauer",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_bountyhunter",
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
		name = "pwh_bh_level_bogenhafen_city_dead_priest",
		probability = 1,
		response = "pwh_bh_level_bogenhafen_city_dead_priest",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_bountyhunter",
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
		name = "pwh_bh_level_bogenhafen_city_keep_moving_01",
		probability = 1,
		response = "pwh_bh_level_bogenhafen_city_keep_moving_01",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_bountyhunter",
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
		name = "pwh_bh_level_bogenhafen_city_revelry_01",
		probability = 1,
		response = "pwh_bh_level_bogenhafen_city_revelry_01",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_bountyhunter",
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
		name = "pwh_bh_level_bogenhafen_city_sewers",
		probability = 1,
		response = "pwh_bh_level_bogenhafen_city_sewers",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_bountyhunter",
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
		name = "pwh_level_bogenhafen_city_artefact",
		probability = 1,
		response = "pwh_level_bogenhafen_city_artefact",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_blocked",
		probability = 1,
		response = "pwh_level_bogenhafen_city_blocked",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_bogenauer",
		probability = 1,
		response = "pwh_level_bogenhafen_city_bogenauer",
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
				"level_bogenhafen_city_bogenauer",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_braziers",
		probability = 1,
		response = "pwh_level_bogenhafen_city_braziers",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_dead_priest",
		probability = 1,
		response = "pwh_level_bogenhafen_city_dead_priest",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_defiled",
		probability = 1,
		response = "pwh_level_bogenhafen_city_defiled",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_escape",
		probability = 1,
		response = "pwh_level_bogenhafen_city_escape",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_find_priest_key",
		probability = 1,
		response = "pwh_level_bogenhafen_city_find_priest_key",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_find_priest_key",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_find_priest_key",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_bogenhafen_city_found_artefact",
		probability = 1,
		response = "pwh_level_bogenhafen_city_found_artefact",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_goblin",
		probability = 1,
		response = "pwh_level_bogenhafen_city_goblin",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_here_they_come",
		probability = 1,
		response = "pwh_level_bogenhafen_city_here_they_come",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_infestation",
		probability = 1,
		response = "pwh_level_bogenhafen_city_infestation",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_intro_a",
		probability = 1,
		response = "pwh_level_bogenhafen_city_intro_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_intro_b",
		probability = 1,
		response = "pwh_level_bogenhafen_city_intro_b",
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
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_intro_c",
		probability = 1,
		response = "pwh_level_bogenhafen_city_intro_c",
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
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_keep_moving",
		probability = 1,
		response = "pwh_level_bogenhafen_city_keep_moving",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_noisy",
		probability = 1,
		response = "pwh_level_bogenhafen_city_noisy",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_objective_find",
		probability = 1,
		response = "pwh_level_bogenhafen_city_objective_find",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_objective_last",
		probability = 1,
		response = "pwh_level_bogenhafen_city_objective_last",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_objective_next",
		probability = 1,
		response = "pwh_level_bogenhafen_city_objective_next",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_level_bogenhafen_city_raining",
		probability = 1,
		response = "pwh_level_bogenhafen_city_raining",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_revelry",
		probability = 1,
		response = "pwh_level_bogenhafen_city_revelry",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_sanctum",
		probability = 1,
		response = "pwh_level_bogenhafen_city_sanctum",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_sanctum_books",
		probability = 1,
		response = "pwh_level_bogenhafen_city_sanctum_books",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_sewers",
		probability = 1,
		response = "pwh_level_bogenhafen_city_sewers",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_smoke_pillar",
		probability = 1,
		response = "pwh_level_bogenhafen_city_smoke_pillar",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_taking_too_long",
		probability = 1,
		response = "pwh_level_bogenhafen_city_taking_too_long",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_temple",
		probability = 1,
		response = "pwh_level_bogenhafen_city_temple",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_torch",
		probability = 1,
		response = "pwh_level_bogenhafen_city_torch",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_level_bogenhafen_city_way_out",
		probability = 1,
		response = "pwh_level_bogenhafen_city_way_out",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_ze_level_bogenhafen_city_bogenauer_01",
		probability = 1,
		response = "pwh_ze_level_bogenhafen_city_bogenauer_01",
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
				"level_bogenhafen_city_bogenauer",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_zealot",
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
		name = "pwh_ze_level_bogenhafen_city_defiled",
		probability = 1,
		response = "pwh_ze_level_bogenhafen_city_defiled",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_zealot",
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
		name = "pwh_ze_level_bogenhafen_city_here_they_come",
		probability = 1,
		response = "pwh_ze_level_bogenhafen_city_here_they_come",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_zealot",
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
		name = "pwh_ze_level_bogenhafen_city_raining",
		probability = 1,
		response = "pwh_ze_level_bogenhafen_city_raining",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_zealot",
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
		name = "pwh_ze_level_bogenhafen_city_temple",
		probability = 1,
		response = "pwh_ze_level_bogenhafen_city_temple",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_zealot",
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
		name = "pwh_ze_level_bogenhafen_city_torch",
		probability = 1,
		response = "pwh_ze_level_bogenhafen_city_torch",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"wh_zealot",
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
	add_dialogues({
		pwh_bh_level_bogenhafen_city_bogenauer = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_bh_level_bogenhafen_city_bogenauer_01",
			},
			sound_events = {
				[1] = "pwh_bh_level_bogenhafen_city_bogenauer_01",
			},
			sound_events_duration = {
				[1] = 8.6644372940063,
			},
		},
		pwh_bh_level_bogenhafen_city_dead_priest = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_bh_level_bogenhafen_city_dead_priest_01",
			},
			sound_events = {
				[1] = "pwh_bh_level_bogenhafen_city_dead_priest_01",
			},
			sound_events_duration = {
				[1] = 9.3897294998169,
			},
		},
		pwh_bh_level_bogenhafen_city_keep_moving_01 = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_bh_level_bogenhafen_city_keep_moving_01",
			},
			sound_events = {
				[1] = "pwh_bh_level_bogenhafen_city_keep_moving_01",
			},
			sound_events_duration = {
				[1] = 5.1521458625794,
			},
		},
		pwh_bh_level_bogenhafen_city_revelry_01 = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_bh_level_bogenhafen_city_revelry_01",
			},
			sound_events = {
				[1] = "pwh_bh_level_bogenhafen_city_revelry_01",
			},
			sound_events_duration = {
				[1] = 7.8194375038147,
			},
		},
		pwh_bh_level_bogenhafen_city_sewers = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_bh_level_bogenhafen_city_sewers_01",
			},
			sound_events = {
				[1] = "pwh_bh_level_bogenhafen_city_sewers_01",
			},
			sound_events_duration = {
				[1] = 4.7904582023621,
			},
		},
		pwh_level_bogenhafen_city_artefact = {
			category = "cut_scene",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_artefact_01",
				"pwh_level_bogenhafen_city_artefact_02",
				"pwh_level_bogenhafen_city_artefact_03",
				"pwh_level_bogenhafen_city_artefact_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_artefact_01",
				"pwh_level_bogenhafen_city_artefact_02",
				"pwh_level_bogenhafen_city_artefact_03",
				"pwh_level_bogenhafen_city_artefact_04",
			},
			sound_events_duration = {
				4.5818333625794,
				1.9384583234787,
				3.5348958969116,
				3.2109792232513,
			},
		},
		pwh_level_bogenhafen_city_blocked = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_blocked_01",
				"pwh_level_bogenhafen_city_blocked_02",
				"pwh_level_bogenhafen_city_blocked_03",
				"pwh_level_bogenhafen_city_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_blocked_01",
				"pwh_level_bogenhafen_city_blocked_02",
				"pwh_level_bogenhafen_city_blocked_03",
				"pwh_level_bogenhafen_city_blocked_04",
			},
			sound_events_duration = {
				2.1482083797455,
				1.4416874647141,
				4.1832709312439,
				3.506500005722,
			},
		},
		pwh_level_bogenhafen_city_bogenauer = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_bogenauer_01",
				"pwh_level_bogenhafen_city_bogenauer_02",
				"pwh_level_bogenhafen_city_bogenauer_03",
				"pwh_level_bogenhafen_city_bogenauer_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_bogenauer_01",
				"pwh_level_bogenhafen_city_bogenauer_02",
				"pwh_level_bogenhafen_city_bogenauer_03",
				"pwh_level_bogenhafen_city_bogenauer_04",
			},
			sound_events_duration = {
				6.0264372825623,
				5.8921666145325,
				6.8539581298828,
				5.6592082977295,
			},
		},
		pwh_level_bogenhafen_city_braziers = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_braziers_01",
				"pwh_level_bogenhafen_city_braziers_02",
				"pwh_level_bogenhafen_city_braziers_03",
				"pwh_level_bogenhafen_city_braziers_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_braziers_01",
				"pwh_level_bogenhafen_city_braziers_02",
				"pwh_level_bogenhafen_city_braziers_03",
				"pwh_level_bogenhafen_city_braziers_04",
			},
			sound_events_duration = {
				1.5555624961853,
				4.1255626678467,
				3.1248126029968,
				1.8872708082199,
			},
		},
		pwh_level_bogenhafen_city_dead_priest = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_dead_priest_01",
				"pwh_level_bogenhafen_city_dead_priest_02",
				"pwh_level_bogenhafen_city_dead_priest_03",
				"pwh_level_bogenhafen_city_dead_priest_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_dead_priest_01",
				"pwh_level_bogenhafen_city_dead_priest_02",
				"pwh_level_bogenhafen_city_dead_priest_03",
				"pwh_level_bogenhafen_city_dead_priest_04",
			},
			sound_events_duration = {
				6.4811248779297,
				4.6945209503174,
				5.4818539619446,
				9.6311664581299,
			},
		},
		pwh_level_bogenhafen_city_defiled = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_defiled_01",
				"pwh_level_bogenhafen_city_defiled_02",
				"pwh_level_bogenhafen_city_defiled_03",
				"pwh_level_bogenhafen_city_defiled_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_defiled_01",
				"pwh_level_bogenhafen_city_defiled_02",
				"pwh_level_bogenhafen_city_defiled_03",
				"pwh_level_bogenhafen_city_defiled_04",
			},
			sound_events_duration = {
				5.2138748168945,
				7.5437293052673,
				6.7680206298828,
				3.4790415763855,
			},
		},
		pwh_level_bogenhafen_city_escape = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_escape_01",
				"pwh_level_bogenhafen_city_escape_02",
				"pwh_level_bogenhafen_city_escape_03",
				"pwh_level_bogenhafen_city_escape_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_escape_01",
				"pwh_level_bogenhafen_city_escape_02",
				"pwh_level_bogenhafen_city_escape_03",
				"pwh_level_bogenhafen_city_escape_04",
			},
			sound_events_duration = {
				4.4088959693909,
				4.3280835151672,
				6.6952085494995,
				2.6404790878296,
			},
		},
		pwh_level_bogenhafen_city_find_priest_key = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_find_priest_key_01",
				"pwh_level_bogenhafen_city_find_priest_key_02",
				"pwh_level_bogenhafen_city_find_priest_key_03",
				"pwh_level_bogenhafen_city_find_priest_key_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_find_priest_key_01",
				"pwh_level_bogenhafen_city_find_priest_key_02",
				"pwh_level_bogenhafen_city_find_priest_key_03",
				"pwh_level_bogenhafen_city_find_priest_key_04",
			},
			sound_events_duration = {
				4.6185832023621,
				2.5392498970032,
				5.2710208892822,
				4.3240833282471,
			},
		},
		pwh_level_bogenhafen_city_found_artefact = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_found_artefact_04",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_found_artefact_04",
			},
			sound_events_duration = {
				[1] = 1.2983771562576,
			},
		},
		pwh_level_bogenhafen_city_goblin = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_goblin_01",
				"pwh_level_bogenhafen_city_goblin_02",
				"pwh_level_bogenhafen_city_goblin_03",
				"pwh_level_bogenhafen_city_goblin_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_goblin_01",
				"pwh_level_bogenhafen_city_goblin_02",
				"pwh_level_bogenhafen_city_goblin_03",
				"pwh_level_bogenhafen_city_goblin_04",
			},
			sound_events_duration = {
				5.960000038147,
				7.0119166374206,
				6.8868956565857,
				6.6305418014526,
			},
		},
		pwh_level_bogenhafen_city_here_they_come = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_here_they_come_01",
				"pwh_level_bogenhafen_city_here_they_come_02",
				"pwh_level_bogenhafen_city_here_they_come_03",
				"pwh_level_bogenhafen_city_here_they_come_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_here_they_come_01",
				"pwh_level_bogenhafen_city_here_they_come_02",
				"pwh_level_bogenhafen_city_here_they_come_03",
				"pwh_level_bogenhafen_city_here_they_come_04",
			},
			sound_events_duration = {
				3.1899375915527,
				3.1579167842865,
				3.6775832176209,
				4.924708366394,
			},
		},
		pwh_level_bogenhafen_city_infestation = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_infestation_01",
				"pwh_level_bogenhafen_city_infestation_02",
				"pwh_level_bogenhafen_city_infestation_03",
				"pwh_level_bogenhafen_city_infestation_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_infestation_01",
				"pwh_level_bogenhafen_city_infestation_02",
				"pwh_level_bogenhafen_city_infestation_03",
				"pwh_level_bogenhafen_city_infestation_04",
			},
			sound_events_duration = {
				5.9125208854675,
				5.5582914352417,
				4.9107084274292,
				5.8363122940064,
			},
		},
		pwh_level_bogenhafen_city_intro_a = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_intro_a_01",
				[2] = "pwh_level_bogenhafen_city_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_intro_a_01",
				[2] = "pwh_level_bogenhafen_city_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.6704998016357,
				[2] = 4.4376459121704,
			},
		},
		pwh_level_bogenhafen_city_intro_b = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_intro_b_01",
				[2] = "pwh_level_bogenhafen_city_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_intro_b_01",
				[2] = "pwh_level_bogenhafen_city_intro_b_02",
			},
			sound_events_duration = {
				[1] = 6.6416459083557,
				[2] = 4.1366872787476,
			},
		},
		pwh_level_bogenhafen_city_intro_c = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_intro_c_01",
				[2] = "pwh_level_bogenhafen_city_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_intro_c_01",
				[2] = "pwh_level_bogenhafen_city_intro_c_02",
			},
			sound_events_duration = {
				[1] = 4.4988956451416,
				[2] = 6.8908123970032,
			},
		},
		pwh_level_bogenhafen_city_keep_moving = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_keep_moving_01",
				"pwh_level_bogenhafen_city_keep_moving_02",
				"pwh_level_bogenhafen_city_keep_moving_03",
				"pwh_level_bogenhafen_city_keep_moving_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_keep_moving_01",
				"pwh_level_bogenhafen_city_keep_moving_02",
				"pwh_level_bogenhafen_city_keep_moving_03",
				"pwh_level_bogenhafen_city_keep_moving_04",
			},
			sound_events_duration = {
				3.0764999389648,
				2.1687707901001,
				4.0107083320618,
				3.4618332386017,
			},
		},
		pwh_level_bogenhafen_city_noisy = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_noisy_01",
				"pwh_level_bogenhafen_city_noisy_02",
				"pwh_level_bogenhafen_city_noisy_03",
				"pwh_level_bogenhafen_city_noisy_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_noisy_01",
				"pwh_level_bogenhafen_city_noisy_02",
				"pwh_level_bogenhafen_city_noisy_03",
				"pwh_level_bogenhafen_city_noisy_04",
			},
			sound_events_duration = {
				8.2846670150757,
				7.079562664032,
				5.4189167022705,
				6.1461248397827,
			},
		},
		pwh_level_bogenhafen_city_objective_find = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_objective_find_01",
				"pwh_level_bogenhafen_city_objective_find_02",
				"pwh_level_bogenhafen_city_objective_find_03",
				"pwh_level_bogenhafen_city_objective_find_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_objective_find_01",
				"pwh_level_bogenhafen_city_objective_find_02",
				"pwh_level_bogenhafen_city_objective_find_03",
				"pwh_level_bogenhafen_city_objective_find_04",
			},
			sound_events_duration = {
				4.9234790802002,
				1.0031875371933,
				4.1389374732971,
				2.2078957557678,
			},
		},
		pwh_level_bogenhafen_city_objective_last = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_objective_last_01",
				"pwh_level_bogenhafen_city_objective_last_02",
				"pwh_level_bogenhafen_city_objective_last_03",
				"pwh_level_bogenhafen_city_objective_last_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_objective_last_01",
				"pwh_level_bogenhafen_city_objective_last_02",
				"pwh_level_bogenhafen_city_objective_last_03",
				"pwh_level_bogenhafen_city_objective_last_04",
			},
			sound_events_duration = {
				2.0807082653046,
				1.0403541326523,
				1.4181250333786,
				1.856229186058,
			},
		},
		pwh_level_bogenhafen_city_objective_next = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_objective_next_01",
				"pwh_level_bogenhafen_city_objective_next_02",
				"pwh_level_bogenhafen_city_objective_next_03",
				"pwh_level_bogenhafen_city_objective_next_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_objective_next_01",
				"pwh_level_bogenhafen_city_objective_next_02",
				"pwh_level_bogenhafen_city_objective_next_03",
				"pwh_level_bogenhafen_city_objective_next_04",
			},
			sound_events_duration = {
				4.6247291564941,
				2.9504375457764,
				3.185625076294,
				4.0880208015442,
			},
		},
		pwh_level_bogenhafen_city_raining = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_raining_01",
				"pwh_level_bogenhafen_city_raining_02",
				"pwh_level_bogenhafen_city_raining_03",
				"pwh_level_bogenhafen_city_raining_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_raining_01",
				"pwh_level_bogenhafen_city_raining_02",
				"pwh_level_bogenhafen_city_raining_03",
				"pwh_level_bogenhafen_city_raining_04",
			},
			sound_events_duration = {
				4.7082915306091,
				3.0732083320618,
				5.1181039810181,
				6.2848958969116,
			},
		},
		pwh_level_bogenhafen_city_revelry = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_revelry_01",
				"pwh_level_bogenhafen_city_revelry_02",
				"pwh_level_bogenhafen_city_revelry_03",
				"pwh_level_bogenhafen_city_revelry_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_revelry_01",
				"pwh_level_bogenhafen_city_revelry_02",
				"pwh_level_bogenhafen_city_revelry_03",
				"pwh_level_bogenhafen_city_revelry_04",
			},
			sound_events_duration = {
				8.9188537597656,
				7.1464791297913,
				5.3950834274292,
				3.3062708377838,
			},
		},
		pwh_level_bogenhafen_city_sanctum = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_level_bogenhafen_city_sanctum_03",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_city_sanctum_03",
			},
			sound_events_duration = {
				[1] = 4.8898334503174,
			},
		},
		pwh_level_bogenhafen_city_sanctum_books = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_sanctum_books_01",
				"pwh_level_bogenhafen_city_sanctum_books_02",
				"pwh_level_bogenhafen_city_sanctum_books_03",
				"pwh_level_bogenhafen_city_sanctum_books_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_sanctum_books_01",
				"pwh_level_bogenhafen_city_sanctum_books_02",
				"pwh_level_bogenhafen_city_sanctum_books_03",
				"pwh_level_bogenhafen_city_sanctum_books_04",
			},
			sound_events_duration = {
				6.8224792480469,
				8.3964166641235,
				6.7430624961853,
				6.6485624313355,
			},
		},
		pwh_level_bogenhafen_city_sewers = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_sewers_01",
				"pwh_level_bogenhafen_city_sewers_02",
				"pwh_level_bogenhafen_city_sewers_03",
				"pwh_level_bogenhafen_city_sewers_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_sewers_01",
				"pwh_level_bogenhafen_city_sewers_02",
				"pwh_level_bogenhafen_city_sewers_03",
				"pwh_level_bogenhafen_city_sewers_04",
			},
			sound_events_duration = {
				4.1486248970032,
				5.6632289886475,
				5.9975833892822,
				5.9235000610352,
			},
		},
		pwh_level_bogenhafen_city_smoke_pillar = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_smoke_pillar_01",
				"pwh_level_bogenhafen_city_smoke_pillar_02",
				"pwh_level_bogenhafen_city_smoke_pillar_03",
				"pwh_level_bogenhafen_city_smoke_pillar_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_smoke_pillar_01",
				"pwh_level_bogenhafen_city_smoke_pillar_02",
				"pwh_level_bogenhafen_city_smoke_pillar_03",
				"pwh_level_bogenhafen_city_smoke_pillar_04",
			},
			sound_events_duration = {
				4.0499377250671,
				4.7402291297913,
				6.005916595459,
				7.3031249046326,
			},
		},
		pwh_level_bogenhafen_city_taking_too_long = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_taking_too_long_01",
				"pwh_level_bogenhafen_city_taking_too_long_02",
				"pwh_level_bogenhafen_city_taking_too_long_03",
				"pwh_level_bogenhafen_city_taking_too_long_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_taking_too_long_01",
				"pwh_level_bogenhafen_city_taking_too_long_02",
				"pwh_level_bogenhafen_city_taking_too_long_03",
				"pwh_level_bogenhafen_city_taking_too_long_04",
			},
			sound_events_duration = {
				5.1848959922791,
				4.6132497787476,
				3.9256041049957,
				5.2517709732056,
			},
		},
		pwh_level_bogenhafen_city_temple = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_temple_01",
				"pwh_level_bogenhafen_city_temple_02",
				"pwh_level_bogenhafen_city_temple_03",
				"pwh_level_bogenhafen_city_temple_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_temple_01",
				"pwh_level_bogenhafen_city_temple_02",
				"pwh_level_bogenhafen_city_temple_03",
				"pwh_level_bogenhafen_city_temple_04",
			},
			sound_events_duration = {
				1.7813750505447,
				3.7990207672119,
				6.1749167442322,
				4.5368747711182,
			},
		},
		pwh_level_bogenhafen_city_torch = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_torch_01",
				"pwh_level_bogenhafen_city_torch_02",
				"pwh_level_bogenhafen_city_torch_03",
				"pwh_level_bogenhafen_city_torch_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_torch_01",
				"pwh_level_bogenhafen_city_torch_02",
				"pwh_level_bogenhafen_city_torch_03",
				"pwh_level_bogenhafen_city_torch_04",
			},
			sound_events_duration = {
				2.7658751010895,
				3.6477499008179,
				3.8271250724792,
				2.6732292175293,
			},
		},
		pwh_level_bogenhafen_city_way_out = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				"pwh_level_bogenhafen_city_way_out_01",
				"pwh_level_bogenhafen_city_way_out_02",
				"pwh_level_bogenhafen_city_way_out_03",
				"pwh_level_bogenhafen_city_way_out_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_bogenhafen_city_way_out_01",
				"pwh_level_bogenhafen_city_way_out_02",
				"pwh_level_bogenhafen_city_way_out_03",
				"pwh_level_bogenhafen_city_way_out_04",
			},
			sound_events_duration = {
				3.0095207691193,
				2.9440834522247,
				3.4919373989105,
				5.4183540344238,
			},
		},
		pwh_ze_level_bogenhafen_city_bogenauer_01 = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_ze_level_bogenhafen_city_bogenauer_01",
			},
			sound_events = {
				[1] = "pwh_ze_level_bogenhafen_city_bogenauer_01",
			},
			sound_events_duration = {
				[1] = 7.4444789886475,
			},
		},
		pwh_ze_level_bogenhafen_city_defiled = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_ze_level_bogenhafen_city_defiled_01",
			},
			sound_events = {
				[1] = "pwh_ze_level_bogenhafen_city_defiled_01",
			},
			sound_events_duration = {
				[1] = 5.4083957672119,
			},
		},
		pwh_ze_level_bogenhafen_city_here_they_come = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_ze_level_bogenhafen_city_here_they_come_01",
			},
			sound_events = {
				[1] = "pwh_ze_level_bogenhafen_city_here_they_come_01",
			},
			sound_events_duration = {
				[1] = 10.137353897095,
			},
		},
		pwh_ze_level_bogenhafen_city_raining = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_exhausted",
			},
			localization_strings = {
				[1] = "pwh_ze_level_bogenhafen_city_raining_01",
			},
			sound_events = {
				[1] = "pwh_ze_level_bogenhafen_city_raining_01",
			},
			sound_events_duration = {
				[1] = 7.2760834693909,
			},
		},
		pwh_ze_level_bogenhafen_city_temple = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_ze_level_bogenhafen_city_temple_01",
			},
			sound_events = {
				[1] = "pwh_ze_level_bogenhafen_city_temple_01",
			},
			sound_events_duration = {
				[1] = 9.9782295227051,
			},
		},
		pwh_ze_level_bogenhafen_city_torch = {
			category = "level_talk",
			database = "witch_hunter_bogenhafen_city",
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
				[1] = "pwh_ze_level_bogenhafen_city_torch_01",
			},
			sound_events = {
				[1] = "pwh_ze_level_bogenhafen_city_torch_01",
			},
			sound_events_duration = {
				[1] = 11.9077501297,
			},
		},
	})
end
