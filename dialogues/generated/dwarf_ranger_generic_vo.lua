﻿-- chunkname: @dialogues/generated/dwarf_ranger_generic_vo.lua

return function ()
	define_rule({
		name = "pdr_gameplay_path_clear",
		probability = 1,
		response = "pdr_gameplay_path_clear",
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
				"generic_path_clear",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_path_clear",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_path_clear",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_assemble",
		probability = 1,
		response = "pdr_generic_assemble",
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
				"generic_assemble",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_assemble",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_assemble",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_cold_inside",
		probability = 1,
		response = "pdr_generic_cold_inside",
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
				"generic_cold_inside",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_cold_inside",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_cold_inside",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_cold_outside",
		probability = 1,
		response = "pdr_generic_cold_outside",
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
				"generic_cold_outside",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_cold_outside",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_cold_outside",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_dark",
		probability = 1,
		response = "pdr_generic_dark",
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
				"generic_dark",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_dark",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_dark",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_door_locked",
		probability = 1,
		response = "pdr_generic_door_locked",
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
				"generic_door_locked",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_door_locked",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_door_locked",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_falling",
		probability = 1,
		response = "pdr_generic_falling",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"generic_falling",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_generic_found_key_known_purpose_a",
		probability = 1,
		response = "pdr_generic_found_key_known_purpose_a",
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
				"generic_key_known_purpose",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_key",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_key",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_found_key_unknown_purpose_a",
		probability = 1,
		response = "pdr_generic_found_key_unknown_purpose_a",
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
				"generic_key_unknown_purpose",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_key",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_key",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_getting_dark_outside",
		probability = 1,
		response = "pdr_generic_getting_dark_outside",
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
				"generic_getting_dark_outside",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_getting_dark_outside",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_getting_dark_outside",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_objective_complete",
		probability = 1,
		response = "pdr_generic_objective_complete",
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
				"generic_objective_complete",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_objective_complete",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_objective_complete",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_path_blocked",
		probability = 1,
		response = "pdr_generic_path_blocked",
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
				"generic_path_blocked",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_path_blocked",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_path_blocked",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_rain",
		probability = 1,
		response = "pdr_generic_rain",
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
				"generic_rain",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_rain",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_rain",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_reaction_action",
		probability = 1,
		response = "pdr_generic_reaction_action",
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
				"generic_reaction_action",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_reaction_action",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_reaction_action",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_reaction_sound",
		probability = 1,
		response = "pdr_generic_reaction_sound",
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
				"generic_reaction_sound",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_reaction_sound",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_reaction_sound",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_search_complete",
		probability = 1,
		response = "pdr_generic_search_complete",
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
				"generic_search_complete",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_search_complete",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_search_complete",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_search_progressing",
		probability = 1,
		response = "pdr_generic_search_progressing",
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
				"generic_search_progressing",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_search_progressing",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_search_progressing",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_search_start",
		probability = 1,
		response = "pdr_generic_search_start",
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
				"generic_search_start",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_search_start",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_search_start",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_seeing_ruin_a",
		probability = 1,
		response = "pdr_generic_seeing_ruin_a",
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
				"generic_seeing_ruin",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_memory",
				"generic_seeing_ruin",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"generic_seeing_ruin",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_success",
		probability = 1,
		response = "pdr_generic_success",
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
				"generic_success",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_success",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_success",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_generic_unexpected_event_01",
		probability = 1,
		response = "pdr_generic_unexpected_event_01",
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
				"generic_unexpected_event",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"generic_unexpected_event",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"generic_unexpected_event",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pdr_gameplay_path_clear = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_gameplay_path_clear_01",
				"pdr_gameplay_path_clear_02",
				"pdr_gameplay_path_clear_03",
				"pdr_gameplay_path_clear_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_path_clear_01",
				"pdr_gameplay_path_clear_02",
				"pdr_gameplay_path_clear_03",
				"pdr_gameplay_path_clear_04",
			},
			sound_events_duration = {
				1.8214583396912,
				1.163645863533,
				0.85487502813339,
				1.8477708101273,
			},
		},
		pdr_generic_assemble = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_assemble_01",
				"pdr_generic_assemble_02",
				"pdr_generic_assemble_03",
				"pdr_generic_assemble_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_assemble_01",
				"pdr_generic_assemble_02",
				"pdr_generic_assemble_03",
				"pdr_generic_assemble_04",
			},
			sound_events_duration = {
				1.0369791984558,
				1.3899791240692,
				1.0889791250229,
				0.81099998950958,
			},
		},
		pdr_generic_cold_inside = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_cold_inside_01",
				"pdr_generic_cold_inside_02",
				"pdr_generic_cold_inside_03",
				"pdr_generic_cold_inside_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_cold_inside_01",
				"pdr_generic_cold_inside_02",
				"pdr_generic_cold_inside_03",
				"pdr_generic_cold_inside_04",
			},
			sound_events_duration = {
				1.8279792070389,
				2.0439791679382,
				1.8789792060852,
				2.7459790706634,
			},
		},
		pdr_generic_cold_outside = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_cold_outside_01",
				"pdr_generic_cold_outside_02",
				"pdr_generic_cold_outside_03",
				"pdr_generic_cold_outside_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_cold_outside_01",
				"pdr_generic_cold_outside_02",
				"pdr_generic_cold_outside_03",
				"pdr_generic_cold_outside_04",
			},
			sound_events_duration = {
				1.6239792108536,
				1.8079792261124,
				2.9989790916443,
				1.545979142189,
			},
		},
		pdr_generic_dark = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_dark_01",
				"pdr_generic_dark_02",
				"pdr_generic_dark_03",
				"pdr_generic_dark_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_dark_01",
				"pdr_generic_dark_02",
				"pdr_generic_dark_03",
				"pdr_generic_dark_04",
			},
			sound_events_duration = {
				2.4249792098999,
				2.329999923706,
				1.7209792137146,
				1.7929791212082,
			},
		},
		pdr_generic_door_locked = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_door_locked_01",
				"pdr_generic_door_locked_02",
				"pdr_generic_door_locked_03",
				"pdr_generic_door_locked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_door_locked_01",
				"pdr_generic_door_locked_02",
				"pdr_generic_door_locked_03",
				"pdr_generic_door_locked_04",
			},
			sound_events_duration = {
				0.875,
				1.8370000123978,
				1.2599791288376,
				1.1469792127609,
			},
		},
		pdr_generic_falling = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_falling_01",
				"pdr_generic_falling_02",
				"pdr_generic_falling_03",
				"pdr_generic_falling_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_falling_01",
				"pdr_generic_falling_02",
				"pdr_generic_falling_03",
				"pdr_generic_falling_04",
			},
			sound_events_duration = {
				1.3420000076294,
				1.6710000038147,
				2.0220000743866,
				1.5069791078568,
			},
		},
		pdr_generic_found_key_known_purpose_a = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_gameplay_found_key_known_purpose_a_01",
				"pdr_gameplay_found_key_known_purpose_a_02",
				"pdr_gameplay_found_key_known_purpose_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_found_key_known_purpose_a_01",
				"pdr_gameplay_found_key_known_purpose_a_02",
				"pdr_gameplay_found_key_known_purpose_a_03",
			},
			sound_events_duration = {
				1.9094791412354,
				1.7547916173935,
				1.7470624446869,
			},
		},
		pdr_generic_found_key_unknown_purpose_a = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_gameplay_found_key_unknown_purpose_a_01",
				"pdr_gameplay_found_key_unknown_purpose_a_02",
				"pdr_gameplay_found_key_unknown_purpose_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_found_key_unknown_purpose_a_01",
				"pdr_gameplay_found_key_unknown_purpose_a_02",
				"pdr_gameplay_found_key_unknown_purpose_a_03",
			},
			sound_events_duration = {
				1.5256667137146,
				1.5436041355133,
				2.0860834121704,
			},
		},
		pdr_generic_getting_dark_outside = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_getting_dark_outside_01",
				"pdr_generic_getting_dark_outside_02",
				"pdr_generic_getting_dark_outside_03",
				"pdr_generic_getting_dark_outside_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_getting_dark_outside_01",
				"pdr_generic_getting_dark_outside_02",
				"pdr_generic_getting_dark_outside_03",
				"pdr_generic_getting_dark_outside_04",
			},
			sound_events_duration = {
				2.4469792842865,
				2.4499790668488,
				3.2629792690277,
				1.5399792194366,
			},
		},
		pdr_generic_objective_complete = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_objective_complete_01",
				"pdr_generic_objective_complete_02",
				"pdr_generic_objective_complete_03",
				"pdr_generic_objective_complete_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_objective_complete_01",
				"pdr_generic_objective_complete_02",
				"pdr_generic_objective_complete_03",
				"pdr_generic_objective_complete_04",
			},
			sound_events_duration = {
				0.8299999833107,
				2.0119791030884,
				2.1529791355133,
				2.3999791145325,
			},
		},
		pdr_generic_path_blocked = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_path_blocked_01",
				"pdr_generic_path_blocked_02",
				"pdr_generic_path_blocked_03",
				"pdr_generic_path_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_path_blocked_01",
				"pdr_generic_path_blocked_02",
				"pdr_generic_path_blocked_03",
				"pdr_generic_path_blocked_04",
			},
			sound_events_duration = {
				1.6169791221619,
				1.9629791975021,
				1.6459791660309,
				1.7539792060852,
			},
		},
		pdr_generic_rain = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_rain_01",
				"pdr_generic_rain_02",
				"pdr_generic_rain_03",
				"pdr_generic_rain_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_rain_01",
				"pdr_generic_rain_02",
				"pdr_generic_rain_03",
				"pdr_generic_rain_04",
			},
			sound_events_duration = {
				2.4049999713898,
				2.2419791221619,
				3.6569790840149,
				3.7939791679382,
			},
		},
		pdr_generic_reaction_action = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_reaction_action_01",
				"pdr_generic_reaction_action_02",
				"pdr_generic_reaction_action_03",
				"pdr_generic_reaction_action_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_reaction_action_01",
				"pdr_generic_reaction_action_02",
				"pdr_generic_reaction_action_03",
				"pdr_generic_reaction_action_04",
			},
			sound_events_duration = {
				0.41097918152809,
				0.41897916793823,
				1.255979180336,
				1.0440000295639,
			},
		},
		pdr_generic_reaction_sound = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_reaction_sound_01",
				"pdr_generic_reaction_sound_02",
				"pdr_generic_reaction_sound_03",
				"pdr_generic_reaction_sound_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_reaction_sound_01",
				"pdr_generic_reaction_sound_02",
				"pdr_generic_reaction_sound_03",
				"pdr_generic_reaction_sound_04",
			},
			sound_events_duration = {
				0.58697915077209,
				1.0839999914169,
				0.89197915792465,
				0.51297914981842,
			},
		},
		pdr_generic_search_complete = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_search_complete_01",
				"pdr_generic_search_complete_02",
				"pdr_generic_search_complete_03",
				"pdr_generic_search_complete_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_search_complete_01",
				"pdr_generic_search_complete_02",
				"pdr_generic_search_complete_03",
				"pdr_generic_search_complete_04",
			},
			sound_events_duration = {
				1.199979186058,
				0.76897919178009,
				0.83300000429153,
				1.6649792194366,
			},
		},
		pdr_generic_search_progressing = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
			dialogue_animations_n = 8,
			face_animations_n = 8,
			randomize_indexes_n = 0,
			sound_events_n = 8,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
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
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_generic_search_progressing_01",
				"pdr_generic_search_progressing_02",
				"pdr_generic_search_progressing_03",
				"pdr_generic_search_progressing_04",
				"pdr_generic_search_progressing_05",
				"pdr_generic_search_progressing_06",
				"pdr_generic_search_progressing_07",
				"pdr_generic_search_progressing_08",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_search_progressing_01",
				"pdr_generic_search_progressing_02",
				"pdr_generic_search_progressing_03",
				"pdr_generic_search_progressing_04",
				"pdr_generic_search_progressing_05",
				"pdr_generic_search_progressing_06",
				"pdr_generic_search_progressing_07",
				"pdr_generic_search_progressing_08",
			},
			sound_events_duration = {
				1.7539792060852,
				0.93800002336502,
				1.2359791994095,
				1.3369791507721,
				1.7459791898727,
				1.0499999523163,
				1.005979180336,
				1.2939791679382,
			},
		},
		pdr_generic_search_start = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_search_start_01",
				"pdr_generic_search_start_02",
				"pdr_generic_search_start_03",
				"pdr_generic_search_start_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_search_start_01",
				"pdr_generic_search_start_02",
				"pdr_generic_search_start_03",
				"pdr_generic_search_start_04",
			},
			sound_events_duration = {
				0.96899998188019,
				0.79197919368744,
				1.2729791402817,
				1.4389791488648,
			},
		},
		pdr_generic_seeing_ruin_a = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			randomize_indexes_n = 0,
			sound_events_n = 10,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
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
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_generic_seeing_ruin_a_01",
				"pdr_generic_seeing_ruin_a_02",
				"pdr_generic_seeing_ruin_a_03",
				"pdr_generic_seeing_ruin_a_04",
				"pdr_generic_seeing_ruin_a_05",
				"pdr_generic_seeing_ruin_a_06",
				"pdr_generic_seeing_ruin_a_07",
				"pdr_generic_seeing_ruin_a_08",
				"pdr_generic_seeing_ruin_a_09",
				"pdr_generic_seeing_ruin_a_10",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_seeing_ruin_a_01",
				"pdr_generic_seeing_ruin_a_02",
				"pdr_generic_seeing_ruin_a_03",
				"pdr_generic_seeing_ruin_a_04",
				"pdr_generic_seeing_ruin_a_05",
				"pdr_generic_seeing_ruin_a_06",
				"pdr_generic_seeing_ruin_a_07",
				"pdr_generic_seeing_ruin_a_08",
				"pdr_generic_seeing_ruin_a_09",
				"pdr_generic_seeing_ruin_a_10",
			},
			sound_events_duration = {
				3.6871666908264,
				2.8227708339691,
				5.3936877250671,
				3.7582292556763,
				3.4251458644867,
				4.7914581298828,
				4.5136251449585,
				4.8509168624878,
				4.8017292022705,
				5.0081872940064,
			},
		},
		pdr_generic_success = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_success_01",
				"pdr_generic_success_02",
				"pdr_generic_success_03",
				"pdr_generic_success_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_success_01",
				"pdr_generic_success_02",
				"pdr_generic_success_03",
				"pdr_generic_success_04",
			},
			sound_events_duration = {
				2.0559792518616,
				2.2939791679382,
				1.8849791288376,
				1.5569791793823,
			},
		},
		pdr_generic_unexpected_event_01 = {
			category = "level_talk",
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_unexpected_event_01",
				"pdr_generic_unexpected_event_02",
				"pdr_generic_unexpected_event_03",
				"pdr_generic_unexpected_event_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_unexpected_event_01",
				"pdr_generic_unexpected_event_02",
				"pdr_generic_unexpected_event_03",
				"pdr_generic_unexpected_event_04",
			},
			sound_events_duration = {
				1.0289791822434,
				2.1619791984558,
				1.0519791841507,
				1.1209791898727,
			},
		},
	})
end
