﻿-- chunkname: @dialogues/generated/empire_soldier_generic_vo.lua

return function ()
	define_rule({
		name = "pes_gameplay_path_clear",
		probability = 1,
		response = "pes_gameplay_path_clear",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_assemble",
		probability = 1,
		response = "pes_generic_assemble",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_cold_inside",
		probability = 1,
		response = "pes_generic_cold_inside",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_cold_outside",
		probability = 1,
		response = "pes_generic_cold_outside",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_dark",
		probability = 1,
		response = "pes_generic_dark",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_door_locked",
		probability = 1,
		response = "pes_generic_door_locked",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_falling",
		probability = 1,
		response = "pes_generic_falling",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_generic_found_key_known_purpose_a",
		probability = 1,
		response = "pes_generic_found_key_known_purpose_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_found_key_unknown_purpose_a",
		probability = 1,
		response = "pes_generic_found_key_unknown_purpose_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_getting_dark_outside",
		probability = 1,
		response = "pes_generic_getting_dark_outside",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_objective_complete",
		probability = 1,
		response = "pes_generic_objective_complete",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_path_blocked",
		probability = 1,
		response = "pes_generic_path_blocked",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_rain",
		probability = 1,
		response = "pes_generic_rain",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_reaction_action",
		probability = 1,
		response = "pes_generic_reaction_action",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_reaction_sound",
		probability = 1,
		response = "pes_generic_reaction_sound",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_search_complete",
		probability = 1,
		response = "pes_generic_search_complete",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_search_progressing",
		probability = 1,
		response = "pes_generic_search_progressing",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_search_start",
		probability = 1,
		response = "pes_generic_search_start",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_success",
		probability = 1,
		response = "pes_generic_success",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_generic_unexpected_event_01",
		probability = 1,
		response = "pes_generic_unexpected_event_01",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		pes_gameplay_path_clear = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_gameplay_path_clear_01",
				"pes_gameplay_path_clear_02",
				"pes_gameplay_path_clear_03",
				"pes_gameplay_path_clear_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_path_clear_01",
				"pes_gameplay_path_clear_02",
				"pes_gameplay_path_clear_03",
				"pes_gameplay_path_clear_04",
			},
			sound_events_duration = {
				0.95856249332428,
				1.3850833177566,
				1.0187916755676,
				0.91704165935516,
			},
		},
		pes_generic_assemble = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_assemble_01",
				"pes_generic_assemble_02",
				"pes_generic_assemble_03",
				"pes_generic_assemble_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_assemble_01",
				"pes_generic_assemble_02",
				"pes_generic_assemble_03",
				"pes_generic_assemble_04",
			},
			sound_events_duration = {
				1.5629999637604,
				1.2539792060852,
				1.9609792232513,
				1.3830000162125,
			},
		},
		pes_generic_cold_inside = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_cold_inside_01",
				"pes_generic_cold_inside_02",
				"pes_generic_cold_inside_03",
				"pes_generic_cold_inside_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_cold_inside_01",
				"pes_generic_cold_inside_02",
				"pes_generic_cold_inside_03",
				"pes_generic_cold_inside_04",
			},
			sound_events_duration = {
				1.6389791965485,
				2.1179790496826,
				2.879979133606,
				3.0879790782928,
			},
		},
		pes_generic_cold_outside = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_cold_outside_01",
				"pes_generic_cold_outside_02",
				"pes_generic_cold_outside_03",
				"pes_generic_cold_outside_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_cold_outside_01",
				"pes_generic_cold_outside_02",
				"pes_generic_cold_outside_03",
				"pes_generic_cold_outside_04",
			},
			sound_events_duration = {
				2.2089791297913,
				2.0909790992737,
				1.7389792203903,
				1.7249791622162,
			},
		},
		pes_generic_dark = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_dark_01",
				"pes_generic_dark_02",
				"pes_generic_dark_03",
				"pes_generic_dark_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_dark_01",
				"pes_generic_dark_02",
				"pes_generic_dark_03",
				"pes_generic_dark_04",
			},
			sound_events_duration = {
				1.4599791765213,
				1.9589791297913,
				1.3969792127609,
				5.5369791984558,
			},
		},
		pes_generic_door_locked = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_door_locked_01",
				"pes_generic_door_locked_02",
				"pes_generic_door_locked_03",
				"pes_generic_door_locked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_door_locked_01",
				"pes_generic_door_locked_02",
				"pes_generic_door_locked_03",
				"pes_generic_door_locked_04",
			},
			sound_events_duration = {
				1.0129791498184,
				0.95700001716614,
				1.6360000371933,
				2.2379791736603,
			},
		},
		pes_generic_falling = {
			category = "level_talk_must_play",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_falling_01",
				"pes_generic_falling_02",
				"pes_generic_falling_03",
				"pes_generic_falling_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_falling_01",
				"pes_generic_falling_02",
				"pes_generic_falling_03",
				"pes_generic_falling_04",
			},
			sound_events_duration = {
				0.89099997282028,
				1.0930000543594,
				1.1779999732971,
				0.95700001716614,
			},
		},
		pes_generic_found_key_known_purpose_a = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_gameplay_found_key_known_purpose_a_01",
				"pes_gameplay_found_key_known_purpose_a_02",
				"pes_gameplay_found_key_known_purpose_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_found_key_known_purpose_a_01",
				"pes_gameplay_found_key_known_purpose_a_02",
				"pes_gameplay_found_key_known_purpose_a_03",
			},
			sound_events_duration = {
				0.88354164361954,
				1.0237292051315,
				1.2346667051315,
			},
		},
		pes_generic_found_key_unknown_purpose_a = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_gameplay_found_key_unknown_purpose_a_01",
				"pes_gameplay_found_key_unknown_purpose_a_02",
				"pes_gameplay_found_key_unknown_purpose_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_found_key_unknown_purpose_a_01",
				"pes_gameplay_found_key_unknown_purpose_a_02",
				"pes_gameplay_found_key_unknown_purpose_a_03",
			},
			sound_events_duration = {
				1.8389791250229,
				1.8184167146683,
				1.7078541517258,
			},
		},
		pes_generic_getting_dark_outside = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_getting_dark_outside_01",
				"pes_generic_getting_dark_outside_02",
				"pes_generic_getting_dark_outside_03",
				"pes_generic_getting_dark_outside_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_getting_dark_outside_01",
				"pes_generic_getting_dark_outside_02",
				"pes_generic_getting_dark_outside_03",
				"pes_generic_getting_dark_outside_04",
			},
			sound_events_duration = {
				1.4739999771118,
				2.2919790744781,
				1.6769791841507,
				2.9179792404175,
			},
		},
		pes_generic_objective_complete = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_objective_complete_01",
				"pes_generic_objective_complete_02",
				"pes_generic_objective_complete_03",
				"pes_generic_objective_complete_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_objective_complete_01",
				"pes_generic_objective_complete_02",
				"pes_generic_objective_complete_03",
				"pes_generic_objective_complete_04",
			},
			sound_events_duration = {
				1.4609792232513,
				1.2499791383743,
				1.2249791622162,
				1.2769792079925,
			},
		},
		pes_generic_path_blocked = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_path_blocked_01",
				"pes_generic_path_blocked_02",
				"pes_generic_path_blocked_03",
				"pes_generic_path_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_path_blocked_01",
				"pes_generic_path_blocked_02",
				"pes_generic_path_blocked_03",
				"pes_generic_path_blocked_04",
			},
			sound_events_duration = {
				1.0849791765213,
				1.1100000143051,
				1.8349791765213,
				1.0189791917801,
			},
		},
		pes_generic_rain = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_rain_01",
				"pes_generic_rain_02",
				"pes_generic_rain_03",
				"pes_generic_rain_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_rain_01",
				"pes_generic_rain_02",
				"pes_generic_rain_03",
				"pes_generic_rain_04",
			},
			sound_events_duration = {
				1.5419791936874,
				2.6919791698456,
				2.1099791526794,
				1.9319791793823,
			},
		},
		pes_generic_reaction_action = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_reaction_action_01",
				"pes_generic_reaction_action_02",
				"pes_generic_reaction_action_03",
				"pes_generic_reaction_action_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_reaction_action_01",
				"pes_generic_reaction_action_02",
				"pes_generic_reaction_action_03",
				"pes_generic_reaction_action_04",
			},
			sound_events_duration = {
				0.59299999475479,
				0.70397919416428,
				0.77397918701172,
				0.60500001907349,
			},
		},
		pes_generic_reaction_sound = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_reaction_sound_01",
				"pes_generic_reaction_sound_02",
				"pes_generic_reaction_sound_03",
				"pes_generic_reaction_sound_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_reaction_sound_01",
				"pes_generic_reaction_sound_02",
				"pes_generic_reaction_sound_03",
				"pes_generic_reaction_sound_04",
			},
			sound_events_duration = {
				0.76297914981842,
				0.62297916412354,
				1.0939791202545,
				1.2929999828339,
			},
		},
		pes_generic_search_complete = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_search_complete_01",
				"pes_generic_search_complete_02",
				"pes_generic_search_complete_03",
				"pes_generic_search_complete_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_search_complete_01",
				"pes_generic_search_complete_02",
				"pes_generic_search_complete_03",
				"pes_generic_search_complete_04",
			},
			sound_events_duration = {
				1.5049999952316,
				2.0360000133514,
				1.2939791679382,
				1.2619999647141,
			},
		},
		pes_generic_search_progressing = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_search_progressing_01",
				"pes_generic_search_progressing_02",
				"pes_generic_search_progressing_03",
				"pes_generic_search_progressing_04",
				"pes_generic_search_progressing_05",
				"pes_generic_search_progressing_06",
				"pes_generic_search_progressing_07",
				"pes_generic_search_progressing_08",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_search_progressing_01",
				"pes_generic_search_progressing_02",
				"pes_generic_search_progressing_03",
				"pes_generic_search_progressing_04",
				"pes_generic_search_progressing_05",
				"pes_generic_search_progressing_06",
				"pes_generic_search_progressing_07",
				"pes_generic_search_progressing_08",
			},
			sound_events_duration = {
				0.6299791932106,
				0.86397916078568,
				0.60297918319702,
				1.2619792222977,
				0.9589791893959,
				2.1229791641235,
				2.0619790554047,
				1.2419791221619,
			},
		},
		pes_generic_search_start = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_search_start_01",
				"pes_generic_search_start_02",
				"pes_generic_search_start_03",
				"pes_generic_search_start_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_search_start_01",
				"pes_generic_search_start_02",
				"pes_generic_search_start_03",
				"pes_generic_search_start_04",
			},
			sound_events_duration = {
				1.6209791898727,
				1.699979186058,
				1.1749999523163,
				1.6229791641235,
			},
		},
		pes_generic_success = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_success_01",
				"pes_generic_success_02",
				"pes_generic_success_03",
				"pes_generic_success_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_success_01",
				"pes_generic_success_02",
				"pes_generic_success_03",
				"pes_generic_success_04",
			},
			sound_events_duration = {
				1.5030000209808,
				1.1379791498184,
				2.323979139328,
				1.1790000200272,
			},
		},
		pes_generic_unexpected_event_01 = {
			category = "level_talk",
			database = "empire_soldier_generic_vo",
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
				"pes_generic_unexpected_event_01",
				"pes_generic_unexpected_event_02",
				"pes_generic_unexpected_event_03",
				"pes_generic_unexpected_event_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_unexpected_event_01",
				"pes_generic_unexpected_event_02",
				"pes_generic_unexpected_event_03",
				"pes_generic_unexpected_event_04",
			},
			sound_events_duration = {
				0.93497914075851,
				1.2489792108536,
				1.4679791927338,
				1.279000043869,
			},
		},
	})
end
