﻿-- chunkname: @dialogues/generated/empire_soldier_dlc_drachenfels_bastion.lua

return function ()
	define_rule({
		name = "pes_bastion_intro_line_a",
		probability = 1,
		response = "pes_bastion_intro_line_a",
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
				"bastion_intro_line_a",
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
				"bastion_intro_line_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_intro_line_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_intro_line_b",
		probability = 1,
		response = "pes_bastion_intro_line_b",
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
				"bastion_intro_line_a",
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
				"bastion_intro_line_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_intro_line_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_intro_line_c",
		probability = 1,
		response = "pes_bastion_intro_line_c",
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
				"bastion_intro_line_b",
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
				"bastion_intro_line_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_intro_line_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_caves",
		probability = 1,
		response = "pes_bastion_vo_caves",
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
				"bastion_vo_caves",
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
				"bastion_vo_caves",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_caves",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_courtyard_done",
		probability = 1,
		response = "pes_bastion_vo_courtyard_done",
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
				"bastion_vo_courtyard_done",
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
				"bastion_vo_courtyard_done",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_courtyard_done",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_courtyard_first_villager",
		probability = 1,
		response = "pes_bastion_vo_courtyard_first_villager",
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
				"bastion_vo_courtyard_first_villager",
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
				"bastion_vo_courtyard_first_villager",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_courtyard_first_villager",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_entering_courtyard",
		probability = 1,
		response = "pes_bastion_vo_entering_courtyard",
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
				"bastion_vo_entering_courtyard",
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
				"bastion_vo_entering_courtyard",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entering_courtyard",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_entering_darkness",
		probability = 1,
		response = "pes_bastion_vo_entering_darkness",
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
				"bastion_vo_entering_darkness",
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
				"bastion_vo_entering_darkness",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entering_darkness",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_entering_finale",
		probability = 1,
		response = "pes_bastion_vo_entering_finale",
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
				"bastion_vo_entering_finale",
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
				"bastion_vo_entering_finale",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entering_finale",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_entrance",
		probability = 1,
		response = "pes_bastion_vo_entrance",
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
				"bastion_vo_entrance",
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
				"bastion_vo_entrance",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_entrance",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_exiting_pes_bastion",
		probability = 1,
		response = "pes_bastion_vo_exiting_pes_bastion",
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
				"bastion_vo_exiting_bastion",
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
				"bastion_vo_exiting_bastion",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_exiting_bastion",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_finale_done",
		probability = 1,
		response = "pes_bastion_vo_finale_done",
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
				"bastion_vo_finale_done",
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
				"bastion_vo_finale_done",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_finale_done",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_finale_missile",
		probability = 1,
		response = "pes_bastion_vo_finale_missile",
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
				"bastion_vo_finale_missile",
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
				"bastion_vo_finale_missile",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_finale_missile",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_finale_tiring",
		probability = 1,
		response = "pes_bastion_vo_finale_tiring",
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
				"bastion_vo_finale_tiring",
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
				"bastion_vo_finale_tiring",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_finale_tiring",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_head_to_surface",
		probability = 1,
		response = "pes_bastion_vo_head_to_surface",
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
				"bastion_vo_head_to_surface",
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
				"bastion_vo_head_to_surface",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_head_to_surface",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_inside_cellblock",
		probability = 1,
		response = "pes_bastion_vo_inside_cellblock",
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
				"bastion_vo_inside_cellblock",
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
				"bastion_vo_inside_cellblock",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_inside_cellblock",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_no_prisoners",
		probability = 1,
		response = "pes_bastion_vo_no_prisoners",
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
				"bastion_vo_no_prisoners",
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
				"bastion_vo_no_prisoners",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_no_prisoners",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_possessed",
		probability = 1,
		response = "pes_bastion_vo_possessed",
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
				"bastion_vo_possessed",
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
				"bastion_vo_possessed",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_possessed",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_bastion_vo_search_cells",
		probability = 1,
		response = "pes_bastion_vo_search_cells",
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
				"bastion_vo_search_cells",
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
				"bastion_vo_search_cells",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"bastion_vo_search_cells",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pes_bastion_intro_line_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				[1] = "pes_bastion_intro_line_a_01",
				[2] = "pes_bastion_intro_line_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_bastion_intro_line_a_01",
				[2] = "pes_bastion_intro_line_a_02",
			},
			sound_events_duration = {
				[1] = 5.9929790496826,
				[2] = 4.0479793548584,
			},
		},
		pes_bastion_intro_line_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				[1] = "pes_bastion_intro_line_b_01",
				[2] = "pes_bastion_intro_line_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_bastion_intro_line_b_01",
				[2] = "pes_bastion_intro_line_b_02",
			},
			sound_events_duration = {
				[1] = 2.2819790840149,
				[2] = 5.0139789581299,
			},
		},
		pes_bastion_intro_line_c = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				[1] = "pes_bastion_intro_line_c_01",
				[2] = "pes_bastion_intro_line_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_bastion_intro_line_c_01",
				[2] = "pes_bastion_intro_line_c_02",
			},
			sound_events_duration = {
				[1] = 2.3869791030884,
				[2] = 4.5369791984558,
			},
		},
		pes_bastion_vo_caves = {
			category = "level_talk",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_caves_01",
				"pes_bastion_vo_caves_02",
				"pes_bastion_vo_caves_03",
				"pes_bastion_vo_caves_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_caves_01",
				"pes_bastion_vo_caves_02",
				"pes_bastion_vo_caves_03",
				"pes_bastion_vo_caves_04",
			},
			sound_events_duration = {
				3.3889791965485,
				3.2919790744781,
				2.419979095459,
				1.7089999914169,
			},
		},
		pes_bastion_vo_courtyard_done = {
			category = "level_talk",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_courtyard_done_01",
				"pes_bastion_vo_courtyard_done_02",
				"pes_bastion_vo_courtyard_done_03",
				"pes_bastion_vo_courtyard_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_courtyard_done_01",
				"pes_bastion_vo_courtyard_done_02",
				"pes_bastion_vo_courtyard_done_03",
				"pes_bastion_vo_courtyard_done_04",
			},
			sound_events_duration = {
				2.7779791355133,
				3.6089792251587,
				3.2339792251587,
				4.6509790420532,
			},
		},
		pes_bastion_vo_courtyard_first_villager = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_courtyard_first_villager_01",
				"pes_bastion_vo_courtyard_first_villager_02",
				"pes_bastion_vo_courtyard_first_villager_03",
				"pes_bastion_vo_courtyard_first_villager_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_courtyard_first_villager_01",
				"pes_bastion_vo_courtyard_first_villager_02",
				"pes_bastion_vo_courtyard_first_villager_03",
				"pes_bastion_vo_courtyard_first_villager_04",
			},
			sound_events_duration = {
				2.5029792785645,
				2.5839791297913,
				1.4899791479111,
				4.5509791374206,
			},
		},
		pes_bastion_vo_entering_courtyard = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_entering_courtyard_01",
				"pes_bastion_vo_entering_courtyard_02",
				"pes_bastion_vo_entering_courtyard_03",
				"pes_bastion_vo_entering_courtyard_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_entering_courtyard_01",
				"pes_bastion_vo_entering_courtyard_02",
				"pes_bastion_vo_entering_courtyard_03",
				"pes_bastion_vo_entering_courtyard_04",
			},
			sound_events_duration = {
				2.1229999065399,
				2.718093752861,
				1.965979218483,
				2.7849791049957,
			},
		},
		pes_bastion_vo_entering_darkness = {
			category = "level_talk",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_entering_darkness_01",
				"pes_bastion_vo_entering_darkness_02",
				"pes_bastion_vo_entering_darkness_03",
				"pes_bastion_vo_entering_darkness_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_entering_darkness_01",
				"pes_bastion_vo_entering_darkness_02",
				"pes_bastion_vo_entering_darkness_03",
				"pes_bastion_vo_entering_darkness_04",
			},
			sound_events_duration = {
				3.7609791755676,
				2.2139792442322,
				1.8609791994095,
				3.2369792461395,
			},
		},
		pes_bastion_vo_entering_finale = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_entering_finale_01",
				"pes_bastion_vo_entering_finale_02",
				"pes_bastion_vo_entering_finale_03",
				"pes_bastion_vo_entering_finale_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_entering_finale_01",
				"pes_bastion_vo_entering_finale_02",
				"pes_bastion_vo_entering_finale_03",
				"pes_bastion_vo_entering_finale_04",
			},
			sound_events_duration = {
				3.8959791660309,
				3.9479792118073,
				3.3369791507721,
				3.6769790649414,
			},
		},
		pes_bastion_vo_entrance = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_entrance_01",
				"pes_bastion_vo_entrance_02",
				"pes_bastion_vo_entrance_03",
				"pes_bastion_vo_entrance_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_entrance_01",
				"pes_bastion_vo_entrance_02",
				"pes_bastion_vo_entrance_03",
				"pes_bastion_vo_entrance_04",
			},
			sound_events_duration = {
				4.004979133606,
				3.4769792556763,
				2.629979133606,
				1.7629791498184,
			},
		},
		pes_bastion_vo_exiting_pes_bastion = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_exiting_pes_bastion_01",
				"pes_bastion_vo_exiting_pes_bastion_02",
				"pes_bastion_vo_exiting_pes_bastion_03",
				"pes_bastion_vo_exiting_pes_bastion_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_exiting_pes_bastion_01",
				"pes_bastion_vo_exiting_pes_bastion_02",
				"pes_bastion_vo_exiting_pes_bastion_03",
				"pes_bastion_vo_exiting_pes_bastion_04",
			},
			sound_events_duration = {
				2.7529792785645,
				4.9749794006348,
				5.0059790611267,
				4.7199792861939,
			},
		},
		pes_bastion_vo_finale_done = {
			category = "level_talk",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_finale_done_01",
				"pes_bastion_vo_finale_done_02",
				"pes_bastion_vo_finale_done_03",
				"pes_bastion_vo_finale_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_finale_done_01",
				"pes_bastion_vo_finale_done_02",
				"pes_bastion_vo_finale_done_03",
				"pes_bastion_vo_finale_done_04",
			},
			sound_events_duration = {
				1.7050000429153,
				3.2269792556763,
				2.8619792461395,
				2.8412187099457,
			},
		},
		pes_bastion_vo_finale_missile = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_finale_missile_01",
				"pes_bastion_vo_finale_missile_02",
				"pes_bastion_vo_finale_missile_03",
				"pes_bastion_vo_finale_missile_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_finale_missile_01",
				"pes_bastion_vo_finale_missile_02",
				"pes_bastion_vo_finale_missile_03",
				"pes_bastion_vo_finale_missile_04",
			},
			sound_events_duration = {
				2.0879790782928,
				1.0609999895096,
				2.3089792728424,
				2.0729792118073,
			},
		},
		pes_bastion_vo_finale_tiring = {
			category = "level_talk",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_finale_tiring_01",
				"pes_bastion_vo_finale_tiring_02",
				"pes_bastion_vo_finale_tiring_03",
				"pes_bastion_vo_finale_tiring_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_finale_tiring_01",
				"pes_bastion_vo_finale_tiring_02",
				"pes_bastion_vo_finale_tiring_03",
				"pes_bastion_vo_finale_tiring_04",
			},
			sound_events_duration = {
				1.6959791183472,
				1.4839999675751,
				2.1959791183472,
				2.6559791564941,
			},
		},
		pes_bastion_vo_head_to_surface = {
			category = "level_talk",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_head_to_surface_01",
				"pes_bastion_vo_head_to_surface_02",
				"pes_bastion_vo_head_to_surface_03",
				"pes_bastion_vo_head_to_surface_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_head_to_surface_01",
				"pes_bastion_vo_head_to_surface_02",
				"pes_bastion_vo_head_to_surface_03",
				"pes_bastion_vo_head_to_surface_04",
			},
			sound_events_duration = {
				2.0019791126251,
				2.4229791164398,
				0.625,
				2.8329792022705,
			},
		},
		pes_bastion_vo_inside_cellblock = {
			category = "level_talk",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_inside_cellblock_01",
				"pes_bastion_vo_inside_cellblock_02",
				"pes_bastion_vo_inside_cellblock_03",
				"pes_bastion_vo_inside_cellblock_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_inside_cellblock_01",
				"pes_bastion_vo_inside_cellblock_02",
				"pes_bastion_vo_inside_cellblock_03",
				"pes_bastion_vo_inside_cellblock_04",
			},
			sound_events_duration = {
				2.868979215622,
				2.8149790763855,
				1.3469791412354,
				3.3959791660309,
			},
		},
		pes_bastion_vo_no_prisoners = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_no_prisoners_01",
				"pes_bastion_vo_no_prisoners_02",
				"pes_bastion_vo_no_prisoners_03",
				"pes_bastion_vo_no_prisoners_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_no_prisoners_01",
				"pes_bastion_vo_no_prisoners_02",
				"pes_bastion_vo_no_prisoners_03",
				"pes_bastion_vo_no_prisoners_04",
			},
			sound_events_duration = {
				1.9909791946411,
				3.216979265213,
				2.7769792079926,
				2.7639791965485,
			},
		},
		pes_bastion_vo_possessed = {
			category = "level_talk",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_possessed_01",
				"pes_bastion_vo_possessed_02",
				"pes_bastion_vo_possessed_03",
				"pes_bastion_vo_possessed_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_possessed_01",
				"pes_bastion_vo_possessed_02",
				"pes_bastion_vo_possessed_03",
				"pes_bastion_vo_possessed_04",
			},
			sound_events_duration = {
				2.3918645381927,
				1.2920000553131,
				1.573979139328,
				1.1749792098999,
			},
		},
		pes_bastion_vo_search_cells = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_search_cells_01",
				"pes_bastion_vo_search_cells_02",
				"pes_bastion_vo_search_cells_03",
				"pes_bastion_vo_search_cells_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_search_cells_01",
				"pes_bastion_vo_search_cells_02",
				"pes_bastion_vo_search_cells_03",
				"pes_bastion_vo_search_cells_04",
			},
			sound_events_duration = {
				2.4969792366028,
				1.4949791431427,
				1.4709792137146,
				1.9929791688919,
			},
		},
	})
end
