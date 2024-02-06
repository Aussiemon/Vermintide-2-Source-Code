﻿-- chunkname: @dialogues/generated/bright_wizard_bogenhafen_city.lua

return function ()
	define_rule({
		name = "pbw_level_bogenhafen_city_artefact",
		response = "pbw_level_bogenhafen_city_artefact",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_blocked",
		response = "pbw_level_bogenhafen_city_blocked",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_bogenauer",
		response = "pbw_level_bogenhafen_city_bogenauer",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_bogenhafen_city_braziers",
		response = "pbw_level_bogenhafen_city_braziers",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_dead_priest",
		response = "pbw_level_bogenhafen_city_dead_priest",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_defiled",
		response = "pbw_level_bogenhafen_city_defiled",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_escape",
		response = "pbw_level_bogenhafen_city_escape",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_find_priest_key",
		response = "pbw_level_bogenhafen_city_find_priest_key",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"pbw_level_bogenhafen_city_find_priest_key",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_level_bogenhafen_city_find_priest_key",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_bogenhafen_city_found_artefact",
		response = "pbw_level_bogenhafen_city_found_artefact",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_goblin",
		response = "pbw_level_bogenhafen_city_goblin",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_here_they_come",
		response = "pbw_level_bogenhafen_city_here_they_come",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_infestation",
		response = "pbw_level_bogenhafen_city_infestation",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_intro_a",
		response = "pbw_level_bogenhafen_city_intro_a",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_intro_b",
		response = "pbw_level_bogenhafen_city_intro_b",
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
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_intro_c",
		response = "pbw_level_bogenhafen_city_intro_c",
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
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_keep_moving",
		response = "pbw_level_bogenhafen_city_keep_moving",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_noisy",
		response = "pbw_level_bogenhafen_city_noisy",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_objective_find",
		response = "pbw_level_bogenhafen_city_objective_find",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_objective_last",
		response = "pbw_level_bogenhafen_city_objective_last",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_objective_next",
		response = "pbw_level_bogenhafen_city_objective_next",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_level_bogenhafen_city_raining",
		response = "pbw_level_bogenhafen_city_raining",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_revelry",
		response = "pbw_level_bogenhafen_city_revelry",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_sanctum",
		response = "pbw_level_bogenhafen_city_sanctum",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_sanctum_books",
		response = "pbw_level_bogenhafen_city_sanctum_books",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_sewers",
		response = "pbw_level_bogenhafen_city_sewers",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_smoke_pillar",
		response = "pbw_level_bogenhafen_city_smoke_pillar",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_taking_too_long",
		response = "pbw_level_bogenhafen_city_taking_too_long",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_temple",
		response = "pbw_level_bogenhafen_city_temple",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_torch",
		response = "pbw_level_bogenhafen_city_torch",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_level_bogenhafen_city_way_out",
		response = "pbw_level_bogenhafen_city_way_out",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_py_level_bogenhafen_city_artefact",
		response = "pbw_py_level_bogenhafen_city_artefact",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_scholar",
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
		name = "pbw_py_level_bogenhafen_city_bogenauer",
		response = "pbw_py_level_bogenhafen_city_bogenauer",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_scholar",
			},
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_bogenhafen_city_bogenauer",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_py_level_bogenhafen_city_defiled",
		response = "pbw_py_level_bogenhafen_city_defiled",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_scholar",
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
		name = "pbw_py_level_bogenhafen_city_found_artefact",
		response = "pbw_py_level_bogenhafen_city_found_artefact",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_ironbreaker",
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
		name = "pbw_py_level_bogenhafen_city_infestation",
		response = "pbw_py_level_bogenhafen_city_infestation",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_scholar",
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
		name = "pbw_un_level_bogenhafen_city_dead_priest",
		response = "pbw_un_level_bogenhafen_city_dead_priest",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained",
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
		name = "pbw_un_level_bogenhafen_city_find_priest_key",
		response = "pbw_un_level_bogenhafen_city_find_priest_key",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained",
			},
			{
				"faction_memory",
				"pbw_level_bogenhafen_city_find_priest_key",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"pbw_level_bogenhafen_city_find_priest_key",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_un_level_bogenhafen_city_here_they_come",
		response = "pbw_un_level_bogenhafen_city_here_they_come",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained",
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
		name = "pbw_un_level_bogenhafen_city_noisy",
		response = "pbw_un_level_bogenhafen_city_noisy",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained",
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
		name = "pbw_un_level_bogenhafen_city_raining_01",
		response = "pbw_un_level_bogenhafen_city_raining_01",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained",
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
		name = "pbw_un_level_bogenhafen_city_sewers",
		response = "pbw_un_level_bogenhafen_city_sewers",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained",
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
		name = "pbw_un_level_bogenhafen_city_smoke_pillar_01",
		response = "pbw_un_level_bogenhafen_city_smoke_pillar_01",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained",
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
	add_dialogues({
		pbw_level_bogenhafen_city_artefact = {
			category = "cut_scene",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_artefact_01",
				"pbw_level_bogenhafen_city_artefact_02",
				"pbw_level_bogenhafen_city_artefact_03",
				"pbw_level_bogenhafen_city_artefact_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_artefact_01",
				"pbw_level_bogenhafen_city_artefact_02",
				"pbw_level_bogenhafen_city_artefact_03",
				"pbw_level_bogenhafen_city_artefact_04",
			},
			sound_events_duration = {
				2.9558749198914,
				1.8793958425522,
				4.3005833625794,
				2.9691457748413,
			},
		},
		pbw_level_bogenhafen_city_blocked = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_blocked_01",
				"pbw_level_bogenhafen_city_blocked_02",
				"pbw_level_bogenhafen_city_blocked_03",
				"pbw_level_bogenhafen_city_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_blocked_01",
				"pbw_level_bogenhafen_city_blocked_02",
				"pbw_level_bogenhafen_city_blocked_03",
				"pbw_level_bogenhafen_city_blocked_04",
			},
			sound_events_duration = {
				2.3153541088104,
				2.1383540630341,
				8.4596042633057,
				3.9864165782928,
			},
		},
		pbw_level_bogenhafen_city_bogenauer = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_bogenauer_01",
				"pbw_level_bogenhafen_city_bogenauer_02",
				"pbw_level_bogenhafen_city_bogenauer_03",
				"pbw_level_bogenhafen_city_bogenauer_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_bogenauer_01",
				"pbw_level_bogenhafen_city_bogenauer_02",
				"pbw_level_bogenhafen_city_bogenauer_03",
				"pbw_level_bogenhafen_city_bogenauer_04",
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
			},
		},
		pbw_level_bogenhafen_city_braziers = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_braziers_01",
				"pbw_level_bogenhafen_city_braziers_02",
				"pbw_level_bogenhafen_city_braziers_03",
				"pbw_level_bogenhafen_city_braziers_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_braziers_01",
				"pbw_level_bogenhafen_city_braziers_02",
				"pbw_level_bogenhafen_city_braziers_03",
				"pbw_level_bogenhafen_city_braziers_04",
			},
			sound_events_duration = {
				1.8591874837875,
				2.2679374217987,
				4.1215000152588,
				1.0816874504089,
			},
		},
		pbw_level_bogenhafen_city_dead_priest = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_dead_priest_01",
				"pbw_level_bogenhafen_city_dead_priest_02",
				"pbw_level_bogenhafen_city_dead_priest_03",
				"pbw_level_bogenhafen_city_dead_priest_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_dead_priest_01",
				"pbw_level_bogenhafen_city_dead_priest_02",
				"pbw_level_bogenhafen_city_dead_priest_03",
				"pbw_level_bogenhafen_city_dead_priest_04",
			},
			sound_events_duration = {
				3.1063125133514,
				2.2100832462311,
				2.4332709312439,
				3.1840417385101,
			},
		},
		pbw_level_bogenhafen_city_defiled = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_defiled_01",
				"pbw_level_bogenhafen_city_defiled_02",
				"pbw_level_bogenhafen_city_defiled_03",
				"pbw_level_bogenhafen_city_defiled_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_defiled_01",
				"pbw_level_bogenhafen_city_defiled_02",
				"pbw_level_bogenhafen_city_defiled_03",
				"pbw_level_bogenhafen_city_defiled_04",
			},
			sound_events_duration = {
				2.7083125114441,
				4.2089166641235,
				3.4955625534058,
				3.3818957805634,
			},
		},
		pbw_level_bogenhafen_city_escape = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_escape_01",
				"pbw_level_bogenhafen_city_escape_02",
				"pbw_level_bogenhafen_city_escape_03",
				"pbw_level_bogenhafen_city_escape_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_escape_01",
				"pbw_level_bogenhafen_city_escape_02",
				"pbw_level_bogenhafen_city_escape_03",
				"pbw_level_bogenhafen_city_escape_04",
			},
			sound_events_duration = {
				2.6548125743866,
				2.2491250038147,
				3.0310626029968,
				2.2105207443237,
			},
		},
		pbw_level_bogenhafen_city_find_priest_key = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_find_priest_key_01",
				"pbw_level_bogenhafen_city_find_priest_key_02",
				"pbw_level_bogenhafen_city_find_priest_key_03",
				"pbw_level_bogenhafen_city_find_priest_key_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_find_priest_key_01",
				"pbw_level_bogenhafen_city_find_priest_key_02",
				"pbw_level_bogenhafen_city_find_priest_key_03",
				"pbw_level_bogenhafen_city_find_priest_key_04",
			},
			sound_events_duration = {
				3.9318332672119,
				4.1258749961853,
				4.4874167442322,
				3.5724792480469,
			},
		},
		pbw_level_bogenhafen_city_found_artefact = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_level_bogenhafen_city_found_artefact_01",
				"pbw_level_bogenhafen_city_found_artefact_02",
				"pbw_level_bogenhafen_city_found_artefact_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_found_artefact_01",
				"pbw_level_bogenhafen_city_found_artefact_02",
				"pbw_level_bogenhafen_city_found_artefact_04",
			},
			sound_events_duration = {
				2.2259685993195,
				3.149142742157,
				2.0732095241547,
			},
		},
		pbw_level_bogenhafen_city_goblin = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_goblin_01",
				"pbw_level_bogenhafen_city_goblin_02",
				"pbw_level_bogenhafen_city_goblin_03",
				"pbw_level_bogenhafen_city_goblin_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_goblin_01",
				"pbw_level_bogenhafen_city_goblin_02",
				"pbw_level_bogenhafen_city_goblin_03",
				"pbw_level_bogenhafen_city_goblin_04",
			},
			sound_events_duration = {
				6.1918125152588,
				6.6490626335144,
				3.3581666946411,
				5.6095209121704,
			},
		},
		pbw_level_bogenhafen_city_here_they_come = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_here_they_come_01",
				"pbw_level_bogenhafen_city_here_they_come_02",
				"pbw_level_bogenhafen_city_here_they_come_03",
				"pbw_level_bogenhafen_city_here_they_come_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_here_they_come_01",
				"pbw_level_bogenhafen_city_here_they_come_02",
				"pbw_level_bogenhafen_city_here_they_come_03",
				"pbw_level_bogenhafen_city_here_they_come_04",
			},
			sound_events_duration = {
				4.1556458473206,
				2.6343541145325,
				4.2936873435974,
				5.6802082061768,
			},
		},
		pbw_level_bogenhafen_city_infestation = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_infestation_01",
				"pbw_level_bogenhafen_city_infestation_02",
				"pbw_level_bogenhafen_city_infestation_03",
				"pbw_level_bogenhafen_city_infestation_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_infestation_01",
				"pbw_level_bogenhafen_city_infestation_02",
				"pbw_level_bogenhafen_city_infestation_03",
				"pbw_level_bogenhafen_city_infestation_04",
			},
			sound_events_duration = {
				4.6454582214356,
				4.2542290687561,
				4.5261039733887,
				4.9397916793823,
			},
		},
		pbw_level_bogenhafen_city_intro_a = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_level_bogenhafen_city_intro_a_01",
				[2] = "pbw_level_bogenhafen_city_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_bogenhafen_city_intro_a_01",
				[2] = "pbw_level_bogenhafen_city_intro_a_02",
			},
			sound_events_duration = {
				[1] = 7.5618124008179,
				[2] = 6.2957706451416,
			},
		},
		pbw_level_bogenhafen_city_intro_b = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_level_bogenhafen_city_intro_b_01",
				[2] = "pbw_level_bogenhafen_city_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_bogenhafen_city_intro_b_01",
				[2] = "pbw_level_bogenhafen_city_intro_b_02",
			},
			sound_events_duration = {
				[1] = 7.7382707595825,
				[2] = 5.653416633606,
			},
		},
		pbw_level_bogenhafen_city_intro_c = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_level_bogenhafen_city_intro_c_01",
				[2] = "pbw_level_bogenhafen_city_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_bogenhafen_city_intro_c_01",
				[2] = "pbw_level_bogenhafen_city_intro_c_02",
			},
			sound_events_duration = {
				[1] = 4.3213748931885,
				[2] = 4.7382917404175,
			},
		},
		pbw_level_bogenhafen_city_keep_moving = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_keep_moving_01",
				"pbw_level_bogenhafen_city_keep_moving_02",
				"pbw_level_bogenhafen_city_keep_moving_03",
				"pbw_level_bogenhafen_city_keep_moving_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_keep_moving_01",
				"pbw_level_bogenhafen_city_keep_moving_02",
				"pbw_level_bogenhafen_city_keep_moving_03",
				"pbw_level_bogenhafen_city_keep_moving_04",
			},
			sound_events_duration = {
				2.4932084083557,
				4.4651250839233,
				2.6508123874664,
				5.3957290649414,
			},
		},
		pbw_level_bogenhafen_city_noisy = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_noisy_01",
				"pbw_level_bogenhafen_city_noisy_02",
				"pbw_level_bogenhafen_city_noisy_03",
				"pbw_level_bogenhafen_city_noisy_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_noisy_01",
				"pbw_level_bogenhafen_city_noisy_02",
				"pbw_level_bogenhafen_city_noisy_03",
				"pbw_level_bogenhafen_city_noisy_04",
			},
			sound_events_duration = {
				6.9221873283386,
				4.1146459579468,
				7.0753331184387,
				4.017041683197,
			},
		},
		pbw_level_bogenhafen_city_objective_find = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_objective_find_01",
				"pbw_level_bogenhafen_city_objective_find_02",
				"pbw_level_bogenhafen_city_objective_find_03",
				"pbw_level_bogenhafen_city_objective_find_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_objective_find_01",
				"pbw_level_bogenhafen_city_objective_find_02",
				"pbw_level_bogenhafen_city_objective_find_03",
				"pbw_level_bogenhafen_city_objective_find_04",
			},
			sound_events_duration = {
				1.4751249551773,
				2.2308542728424,
				1.5387500524521,
				1.6169583797455,
			},
		},
		pbw_level_bogenhafen_city_objective_last = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_objective_last_01",
				"pbw_level_bogenhafen_city_objective_last_02",
				"pbw_level_bogenhafen_city_objective_last_03",
				"pbw_level_bogenhafen_city_objective_last_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_objective_last_01",
				"pbw_level_bogenhafen_city_objective_last_02",
				"pbw_level_bogenhafen_city_objective_last_03",
				"pbw_level_bogenhafen_city_objective_last_04",
			},
			sound_events_duration = {
				3.1773540973663,
				2.8704791069031,
				1.8739583492279,
				1.2695208787918,
			},
		},
		pbw_level_bogenhafen_city_objective_next = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_objective_next_01",
				"pbw_level_bogenhafen_city_objective_next_02",
				"pbw_level_bogenhafen_city_objective_next_03",
				"pbw_level_bogenhafen_city_objective_next_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_objective_next_01",
				"pbw_level_bogenhafen_city_objective_next_02",
				"pbw_level_bogenhafen_city_objective_next_03",
				"pbw_level_bogenhafen_city_objective_next_04",
			},
			sound_events_duration = {
				1.4333125352859,
				2.7539999485016,
				1.9998124837875,
				3.1388332843781,
			},
		},
		pbw_level_bogenhafen_city_raining = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_raining_01",
				"pbw_level_bogenhafen_city_raining_02",
				"pbw_level_bogenhafen_city_raining_03",
				"pbw_level_bogenhafen_city_raining_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_raining_01",
				"pbw_level_bogenhafen_city_raining_02",
				"pbw_level_bogenhafen_city_raining_03",
				"pbw_level_bogenhafen_city_raining_04",
			},
			sound_events_duration = {
				4.4342498779297,
				4.8367915153503,
				3.3883957862854,
				3.6342084407806,
			},
		},
		pbw_level_bogenhafen_city_revelry = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_revelry_01",
				"pbw_level_bogenhafen_city_revelry_02",
				"pbw_level_bogenhafen_city_revelry_03",
				"pbw_level_bogenhafen_city_revelry_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_revelry_01",
				"pbw_level_bogenhafen_city_revelry_02",
				"pbw_level_bogenhafen_city_revelry_03",
				"pbw_level_bogenhafen_city_revelry_04",
			},
			sound_events_duration = {
				3.2162082195282,
				4.9286875724792,
				4.982479095459,
				4.6691875457764,
			},
		},
		pbw_level_bogenhafen_city_sanctum = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_level_bogenhafen_city_sanctum_01",
				[2] = "pbw_level_bogenhafen_city_sanctum_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_bogenhafen_city_sanctum_01",
				[2] = "pbw_level_bogenhafen_city_sanctum_03",
			},
			sound_events_duration = {
				[1] = 4.4042291641235,
				[2] = 5.3954582214356,
			},
		},
		pbw_level_bogenhafen_city_sanctum_books = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_sanctum_books_01",
				"pbw_level_bogenhafen_city_sanctum_books_02",
				"pbw_level_bogenhafen_city_sanctum_books_03",
				"pbw_level_bogenhafen_city_sanctum_books_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_sanctum_books_01",
				"pbw_level_bogenhafen_city_sanctum_books_02",
				"pbw_level_bogenhafen_city_sanctum_books_03",
				"pbw_level_bogenhafen_city_sanctum_books_04",
			},
			sound_events_duration = {
				2.869916677475,
				3.8852915763855,
				4.1545209884644,
				5.0185418128967,
			},
		},
		pbw_level_bogenhafen_city_sewers = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_sewers_01",
				"pbw_level_bogenhafen_city_sewers_02",
				"pbw_level_bogenhafen_city_sewers_03",
				"pbw_level_bogenhafen_city_sewers_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_sewers_01",
				"pbw_level_bogenhafen_city_sewers_02",
				"pbw_level_bogenhafen_city_sewers_03",
				"pbw_level_bogenhafen_city_sewers_04",
			},
			sound_events_duration = {
				3.1523332595825,
				4.0998959541321,
				5.2881460189819,
				6.1781249046326,
			},
		},
		pbw_level_bogenhafen_city_smoke_pillar = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_smoke_pillar_01",
				"pbw_level_bogenhafen_city_smoke_pillar_02",
				"pbw_level_bogenhafen_city_smoke_pillar_03",
				"pbw_level_bogenhafen_city_smoke_pillar_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_smoke_pillar_01",
				"pbw_level_bogenhafen_city_smoke_pillar_02",
				"pbw_level_bogenhafen_city_smoke_pillar_03",
				"pbw_level_bogenhafen_city_smoke_pillar_04",
			},
			sound_events_duration = {
				3.5404999256134,
				3.8604373931885,
				3.231062412262,
				5.5611248016357,
			},
		},
		pbw_level_bogenhafen_city_taking_too_long = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_taking_too_long_01",
				"pbw_level_bogenhafen_city_taking_too_long_02",
				"pbw_level_bogenhafen_city_taking_too_long_03",
				"pbw_level_bogenhafen_city_taking_too_long_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_taking_too_long_01",
				"pbw_level_bogenhafen_city_taking_too_long_02",
				"pbw_level_bogenhafen_city_taking_too_long_03",
				"pbw_level_bogenhafen_city_taking_too_long_04",
			},
			sound_events_duration = {
				3.815687417984,
				2.9177498817444,
				2.1135001182556,
				5.3544583320618,
			},
		},
		pbw_level_bogenhafen_city_temple = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_temple_01",
				"pbw_level_bogenhafen_city_temple_02",
				"pbw_level_bogenhafen_city_temple_03",
				"pbw_level_bogenhafen_city_temple_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_temple_01",
				"pbw_level_bogenhafen_city_temple_02",
				"pbw_level_bogenhafen_city_temple_03",
				"pbw_level_bogenhafen_city_temple_04",
			},
			sound_events_duration = {
				2.970645904541,
				2.5456249713898,
				4.2000832557678,
				1.8789166212082,
			},
		},
		pbw_level_bogenhafen_city_torch = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_torch_01",
				"pbw_level_bogenhafen_city_torch_02",
				"pbw_level_bogenhafen_city_torch_03",
				"pbw_level_bogenhafen_city_torch_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_torch_01",
				"pbw_level_bogenhafen_city_torch_02",
				"pbw_level_bogenhafen_city_torch_03",
				"pbw_level_bogenhafen_city_torch_04",
			},
			sound_events_duration = {
				1.445729136467,
				1.6540207862854,
				2.9032499790192,
				2.2235832214356,
			},
		},
		pbw_level_bogenhafen_city_way_out = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				"pbw_level_bogenhafen_city_way_out_01",
				"pbw_level_bogenhafen_city_way_out_02",
				"pbw_level_bogenhafen_city_way_out_03",
				"pbw_level_bogenhafen_city_way_out_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_bogenhafen_city_way_out_01",
				"pbw_level_bogenhafen_city_way_out_02",
				"pbw_level_bogenhafen_city_way_out_03",
				"pbw_level_bogenhafen_city_way_out_04",
			},
			sound_events_duration = {
				4.2681250572205,
				5.122145652771,
				3.5752084255219,
				5.149875164032,
			},
		},
		pbw_py_level_bogenhafen_city_artefact = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_py_level_bogenhafen_city_artefact_01",
			},
			sound_events = {
				[1] = "pbw_py_level_bogenhafen_city_artefact_01",
			},
			sound_events_duration = {
				[1] = 5.898937702179,
			},
		},
		pbw_py_level_bogenhafen_city_bogenauer = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_py_level_bogenhafen_city_bogenauer_01",
			},
			sound_events = {
				[1] = "pbw_py_level_bogenhafen_city_bogenauer_01",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		pbw_py_level_bogenhafen_city_defiled = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_py_level_bogenhafen_city_defiled_01",
			},
			sound_events = {
				[1] = "pbw_py_level_bogenhafen_city_defiled_01",
			},
			sound_events_duration = {
				[1] = 5.688000202179,
			},
		},
		pbw_py_level_bogenhafen_city_found_artefact = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_py_level_bogenhafen_city_found_artefact_01",
			},
			sound_events = {
				[1] = "pbw_py_level_bogenhafen_city_found_artefact_01",
			},
			sound_events_duration = {
				[1] = 6.4773960113525,
			},
		},
		pbw_py_level_bogenhafen_city_infestation = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_py_level_bogenhafen_city_infestation_01",
			},
			sound_events = {
				[1] = "pbw_py_level_bogenhafen_city_infestation_01",
			},
			sound_events_duration = {
				[1] = 5.1736249923706,
			},
		},
		pbw_un_level_bogenhafen_city_dead_priest = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_un_level_bogenhafen_city_dead_priest_01",
			},
			sound_events = {
				[1] = "pbw_un_level_bogenhafen_city_dead_priest_01",
			},
			sound_events_duration = {
				[1] = 5.2874374389648,
			},
		},
		pbw_un_level_bogenhafen_city_find_priest_key = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_un_level_bogenhafen_city_find_priest_key_01",
			},
			sound_events = {
				[1] = "pbw_un_level_bogenhafen_city_find_priest_key_01",
			},
			sound_events_duration = {
				[1] = 6.0194582939148,
			},
		},
		pbw_un_level_bogenhafen_city_here_they_come = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_un_level_bogenhafen_city_here_they_come_01",
			},
			sound_events = {
				[1] = "pbw_un_level_bogenhafen_city_here_they_come_01",
			},
			sound_events_duration = {
				[1] = 4.7984580993652,
			},
		},
		pbw_un_level_bogenhafen_city_noisy = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_un_level_bogenhafen_city_noisy_01",
			},
			sound_events = {
				[1] = "pbw_un_level_bogenhafen_city_noisy_01",
			},
			sound_events_duration = {
				[1] = 4.9451456069946,
			},
		},
		pbw_un_level_bogenhafen_city_raining_01 = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_un_level_bogenhafen_city_raining_01",
			},
			sound_events = {
				[1] = "pbw_un_level_bogenhafen_city_raining_01",
			},
			sound_events_duration = {
				[1] = 7.7247290611267,
			},
		},
		pbw_un_level_bogenhafen_city_sewers = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_un_level_bogenhafen_city_sewers_01",
			},
			sound_events = {
				[1] = "pbw_un_level_bogenhafen_city_sewers_01",
			},
			sound_events_duration = {
				[1] = 3.756875038147,
			},
		},
		pbw_un_level_bogenhafen_city_smoke_pillar_01 = {
			category = "level_talk",
			database = "bright_wizard_bogenhafen_city",
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
				[1] = "pbw_un_level_bogenhafen_city_smoke_pillar_01",
			},
			sound_events = {
				[1] = "pbw_un_level_bogenhafen_city_smoke_pillar_01",
			},
			sound_events_duration = {
				[1] = 10.713541984558,
			},
		},
	})
end
