﻿-- chunkname: @dialogues/generated/bright_wizard_generic_vo.lua

return function ()
	define_rule({
		name = "pbw_gameplay_path_clear",
		probability = 1,
		response = "pbw_gameplay_path_clear",
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
		name = "pbw_generic_assemble",
		probability = 1,
		response = "pbw_generic_assemble",
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
		name = "pbw_generic_cold_inside",
		probability = 1,
		response = "pbw_generic_cold_inside",
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
		name = "pbw_generic_cold_outside",
		probability = 1,
		response = "pbw_generic_cold_outside",
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
		name = "pbw_generic_dark",
		probability = 1,
		response = "pbw_generic_dark",
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
		name = "pbw_generic_door_locked",
		probability = 1,
		response = "pbw_generic_door_locked",
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
		name = "pbw_generic_falling",
		probability = 1,
		response = "pbw_generic_falling",
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
		name = "pbw_generic_found_key_known_purpose_a",
		probability = 1,
		response = "pbw_generic_found_key_known_purpose_a",
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
		name = "pbw_generic_found_key_unknown_purpose_a",
		probability = 1,
		response = "pbw_generic_found_key_unknown_purpose_a",
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
		name = "pbw_generic_getting_dark_outside",
		probability = 1,
		response = "pbw_generic_getting_dark_outside",
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
		name = "pbw_generic_objective_complete",
		probability = 1,
		response = "pbw_generic_objective_complete",
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
		name = "pbw_generic_path_blocked",
		probability = 1,
		response = "pbw_generic_path_blocked",
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
		name = "pbw_generic_rain",
		probability = 1,
		response = "pbw_generic_rain",
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
		name = "pbw_generic_reaction_action",
		probability = 1,
		response = "pbw_generic_reaction_action",
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
		name = "pbw_generic_reaction_sound",
		probability = 1,
		response = "pbw_generic_reaction_sound",
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
		name = "pbw_generic_search_complete",
		probability = 1,
		response = "pbw_generic_search_complete",
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
		name = "pbw_generic_search_progressing",
		probability = 1,
		response = "pbw_generic_search_progressing",
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
		name = "pbw_generic_search_start",
		probability = 1,
		response = "pbw_generic_search_start",
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
		name = "pbw_generic_success",
		probability = 1,
		response = "pbw_generic_success",
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
		name = "pbw_generic_unexpected_event_01",
		probability = 1,
		response = "pbw_generic_unexpected_event_01",
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
		pbw_gameplay_path_clear = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_gameplay_path_clear_01",
				"pbw_gameplay_path_clear_02",
				"pbw_gameplay_path_clear_03",
				"pbw_gameplay_path_clear_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_path_clear_01",
				"pbw_gameplay_path_clear_02",
				"pbw_gameplay_path_clear_03",
				"pbw_gameplay_path_clear_04",
			},
			sound_events_duration = {
				1.3549582958221,
				1.7879166603088,
				1.0822917222977,
				2.1028957366943,
			},
		},
		pbw_generic_assemble = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_assemble_01",
				"pbw_generic_assemble_02",
				"pbw_generic_assemble_03",
				"pbw_generic_assemble_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_assemble_01",
				"pbw_generic_assemble_02",
				"pbw_generic_assemble_03",
				"pbw_generic_assemble_04",
			},
			sound_events_duration = {
				0.79199999570847,
				1.6030000448227,
				1.420979142189,
				0.55697917938232,
			},
		},
		pbw_generic_cold_inside = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_cold_inside_01",
				"pbw_generic_cold_inside_02",
				"pbw_generic_cold_inside_03",
				"pbw_generic_cold_inside_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_cold_inside_01",
				"pbw_generic_cold_inside_02",
				"pbw_generic_cold_inside_03",
				"pbw_generic_cold_inside_04",
			},
			sound_events_duration = {
				1.880979180336,
				2.993979215622,
				2.2589790821075,
				4.7119793891907,
			},
		},
		pbw_generic_cold_outside = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_cold_outside_01",
				"pbw_generic_cold_outside_02",
				"pbw_generic_cold_outside_03",
				"pbw_generic_cold_outside_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_cold_outside_01",
				"pbw_generic_cold_outside_02",
				"pbw_generic_cold_outside_03",
				"pbw_generic_cold_outside_04",
			},
			sound_events_duration = {
				1.1919791698456,
				2.3429791927338,
				4.0959792137146,
				1.3819791078568,
			},
		},
		pbw_generic_dark = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_dark_01",
				"pbw_generic_dark_02",
				"pbw_generic_dark_03",
				"pbw_generic_dark_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_dark_01",
				"pbw_generic_dark_02",
				"pbw_generic_dark_03",
				"pbw_generic_dark_04",
			},
			sound_events_duration = {
				1.1579999923706,
				2.2339792251587,
				1.4449791908264,
				2.8119790554047,
			},
		},
		pbw_generic_door_locked = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_door_locked_01",
				"pbw_generic_door_locked_02",
				"pbw_generic_door_locked_03",
				"pbw_generic_door_locked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_door_locked_01",
				"pbw_generic_door_locked_02",
				"pbw_generic_door_locked_03",
				"pbw_generic_door_locked_04",
			},
			sound_events_duration = {
				0.6769791841507,
				2.3849792480469,
				2.3079791069031,
				1.1139792203903,
			},
		},
		pbw_generic_falling = {
			category = "level_talk_must_play",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_falling_01",
				"pbw_generic_falling_02",
				"pbw_generic_falling_03",
				"pbw_generic_falling_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_falling_01",
				"pbw_generic_falling_02",
				"pbw_generic_falling_03",
				"pbw_generic_falling_04",
			},
			sound_events_duration = {
				1.4780000448227,
				1.1779999732971,
				1.0939999818802,
				1.9390000104904,
			},
		},
		pbw_generic_found_key_known_purpose_a = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_gameplay_found_key_known_purpose_a_01",
				"pbw_gameplay_found_key_known_purpose_a_02",
				"pbw_gameplay_found_key_known_purpose_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_found_key_known_purpose_a_01",
				"pbw_gameplay_found_key_known_purpose_a_02",
				"pbw_gameplay_found_key_known_purpose_a_03",
			},
			sound_events_duration = {
				1.1974166631699,
				1.8944375514984,
				1.6510833501816,
			},
		},
		pbw_generic_found_key_unknown_purpose_a = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_gameplay_found_key_unknown_purpose_a_01",
				"pbw_gameplay_found_key_unknown_purpose_a_02",
				"pbw_gameplay_found_key_unknown_purpose_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_found_key_unknown_purpose_a_01",
				"pbw_gameplay_found_key_unknown_purpose_a_02",
				"pbw_gameplay_found_key_unknown_purpose_a_03",
			},
			sound_events_duration = {
				1.45993745327,
				1.5460833311081,
				1.0101041793823,
			},
		},
		pbw_generic_getting_dark_outside = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_getting_dark_outside_01",
				"pbw_generic_getting_dark_outside_02",
				"pbw_generic_getting_dark_outside_03",
				"pbw_generic_getting_dark_outside_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_getting_dark_outside_01",
				"pbw_generic_getting_dark_outside_02",
				"pbw_generic_getting_dark_outside_03",
				"pbw_generic_getting_dark_outside_04",
			},
			sound_events_duration = {
				1.6729999780655,
				1.1180000305176,
				1.3269791603088,
				1.6489791870117,
			},
		},
		pbw_generic_objective_complete = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_objective_complete_01",
				"pbw_generic_objective_complete_02",
				"pbw_generic_objective_complete_03",
				"pbw_generic_objective_complete_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_objective_complete_01",
				"pbw_generic_objective_complete_02",
				"pbw_generic_objective_complete_03",
				"pbw_generic_objective_complete_04",
			},
			sound_events_duration = {
				1.2609791755676,
				1.0659999847412,
				1.39297914505,
				3.2639791965485,
			},
		},
		pbw_generic_path_blocked = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_path_blocked_01",
				"pbw_generic_path_blocked_02",
				"pbw_generic_path_blocked_03",
				"pbw_generic_path_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_path_blocked_01",
				"pbw_generic_path_blocked_02",
				"pbw_generic_path_blocked_03",
				"pbw_generic_path_blocked_04",
			},
			sound_events_duration = {
				1.2289791107178,
				1.3489791154861,
				1.2300000190735,
				2.397979259491,
			},
		},
		pbw_generic_rain = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_rain_01",
				"pbw_generic_rain_02",
				"pbw_generic_rain_03",
				"pbw_generic_rain_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_rain_01",
				"pbw_generic_rain_02",
				"pbw_generic_rain_03",
				"pbw_generic_rain_04",
			},
			sound_events_duration = {
				1.8120000362396,
				2.216979265213,
				1.6009792089462,
				3.0889792442322,
			},
		},
		pbw_generic_reaction_action = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_reaction_action_01",
				"pbw_generic_reaction_action_02",
				"pbw_generic_reaction_action_03",
				"pbw_generic_reaction_action_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_reaction_action_01",
				"pbw_generic_reaction_action_02",
				"pbw_generic_reaction_action_03",
				"pbw_generic_reaction_action_04",
			},
			sound_events_duration = {
				0.39297917485237,
				0.64197915792465,
				0.80199998617172,
				0.47197917103767,
			},
		},
		pbw_generic_reaction_sound = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_reaction_sound_01",
				"pbw_generic_reaction_sound_02",
				"pbw_generic_reaction_sound_03",
				"pbw_generic_reaction_sound_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_reaction_sound_01",
				"pbw_generic_reaction_sound_02",
				"pbw_generic_reaction_sound_03",
				"pbw_generic_reaction_sound_04",
			},
			sound_events_duration = {
				0.50897914171219,
				0.64897918701172,
				0.51797914505005,
				0.58700001239777,
			},
		},
		pbw_generic_search_complete = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_search_complete_01",
				"pbw_generic_search_complete_02",
				"pbw_generic_search_complete_03",
				"pbw_generic_search_complete_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_search_complete_01",
				"pbw_generic_search_complete_02",
				"pbw_generic_search_complete_03",
				"pbw_generic_search_complete_04",
			},
			sound_events_duration = {
				0.66000002622604,
				1.1480000019074,
				1.5799791812897,
				2.7459790706634,
			},
		},
		pbw_generic_search_progressing = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_search_progressing_01",
				"pbw_generic_search_progressing_02",
				"pbw_generic_search_progressing_03",
				"pbw_generic_search_progressing_04",
				"pbw_generic_search_progressing_05",
				"pbw_generic_search_progressing_06",
				"pbw_generic_search_progressing_07",
				"pbw_generic_search_progressing_08",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_search_progressing_01",
				"pbw_generic_search_progressing_02",
				"pbw_generic_search_progressing_03",
				"pbw_generic_search_progressing_04",
				"pbw_generic_search_progressing_05",
				"pbw_generic_search_progressing_06",
				"pbw_generic_search_progressing_07",
				"pbw_generic_search_progressing_08",
			},
			sound_events_duration = {
				1.6379791498184,
				1.0659999847412,
				1.12399995327,
				0.87699997425079,
				1.1619999408722,
				1.7469999790192,
				1.1409791707993,
				1.3759791851044,
			},
		},
		pbw_generic_search_start = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_search_start_01",
				"pbw_generic_search_start_02",
				"pbw_generic_search_start_03",
				"pbw_generic_search_start_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_search_start_01",
				"pbw_generic_search_start_02",
				"pbw_generic_search_start_03",
				"pbw_generic_search_start_04",
			},
			sound_events_duration = {
				0.77799999713898,
				1.164999961853,
				1.0039792060852,
				1.493979215622,
			},
		},
		pbw_generic_success = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_success_01",
				"pbw_generic_success_02",
				"pbw_generic_success_03",
				"pbw_generic_success_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_success_01",
				"pbw_generic_success_02",
				"pbw_generic_success_03",
				"pbw_generic_success_04",
			},
			sound_events_duration = {
				2.516458272934,
				1.1759791374207,
				1.948979139328,
				1.8049999475479,
			},
		},
		pbw_generic_unexpected_event_01 = {
			category = "level_talk",
			database = "bright_wizard_generic_vo",
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
				"pbw_generic_unexpected_event_01",
				"pbw_generic_unexpected_event_02",
				"pbw_generic_unexpected_event_03",
				"pbw_generic_unexpected_event_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_unexpected_event_01",
				"pbw_generic_unexpected_event_02",
				"pbw_generic_unexpected_event_03",
				"pbw_generic_unexpected_event_04",
			},
			sound_events_duration = {
				1.8369791507721,
				1.9239791631699,
				0.72097915410995,
				1.2319999933243,
			},
		},
	})
end
