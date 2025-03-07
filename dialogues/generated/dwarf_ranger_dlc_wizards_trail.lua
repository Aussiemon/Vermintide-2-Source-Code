﻿-- chunkname: @dialogues/generated/dwarf_ranger_dlc_wizards_trail.lua

return function ()
	define_rule({
		name = "pdr_wizard_trail_bridge_down",
		probability = 1,
		response = "pdr_wizard_trail_bridge_down",
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
				"wizard_trail_bridge_down",
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
				"wizard_trail_bridge_down",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_bridge_down",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_caravan_b",
		probability = 1,
		response = "pdr_wizard_trail_caravan_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_caravan_a_done",
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
		name = "pdr_wizard_trail_cargo",
		probability = 1,
		response = "pdr_wizard_trail_cargo",
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
				"wizard_trail_cargo",
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
				"wizard_trail_cargo",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_cargo",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_crate_down",
		probability = 1,
		response = "pdr_wizard_trail_crate_down",
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
				"wizard_trail_crate_down",
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
				"wizard_trail_crate_down",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_crate_down",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_crate_drop_b",
		probability = 1,
		response = "pdr_wizard_trail_crate_drop_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_crate_drop_a_done",
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
		name = "pdr_wizard_trail_free_sleigh",
		probability = 1,
		response = "pdr_wizard_trail_free_sleigh",
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
				"wizard_trail_free_sleigh",
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
				"wizard_trail_free_sleigh",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_free_sleigh",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_illusion_fades_a",
		probability = 1,
		response = "pdr_wizard_trail_illusion_fades_a",
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
				"wizard_trail_illusion_fades_a",
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
				"wizard_trail_illusion_fades_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_illusion_fades_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_illusion_fades_b",
		probability = 1,
		response = "pdr_wizard_trail_illusion_fades_b",
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
				"wizard_trail_illusion_fades_b",
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
		name = "pdr_wizard_trail_illusion_fades_c",
		probability = 1,
		response = "pdr_wizard_trail_illusion_fades_c",
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
				"wizard_trail_illusion_fades_b",
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
		name = "pdr_wizard_trail_intro_b",
		probability = 1,
		response = "pdr_wizard_trail_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_intro_a_done",
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
				"wizard_trail_intro_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_intro_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_intro_c",
		probability = 1,
		response = "pdr_wizard_trail_intro_c",
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
				"wizard_trail_intro_b",
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
				"wizard_trail_intro_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_intro_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_intruders_b",
		probability = 1,
		response = "pdr_wizard_trail_intruders_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nsf_wizard_trail_intruders_a_done",
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
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
		name = "pdr_wizard_trail_lower_bridge_b",
		probability = 1,
		response = "pdr_wizard_trail_lower_bridge_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_lower_bridge_a_done",
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
		name = "pdr_wizard_trail_olesya_revealed_b",
		probability = 1,
		response = "pdr_wizard_trail_olesya_revealed_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nfl_wizard_trail_olesya_revealed_a",
			},
			{
				"query_context",
				"friends_distant",
				OP.GT,
				0,
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
		name = "pdr_wizard_trail_olesya_revealed_b_distance",
		probability = 1,
		response = "pdr_wizard_trail_olesya_revealed_b_distance",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_olesya_revealed_a_done",
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
		name = "pdr_wizard_trail_open_crate",
		probability = 1,
		response = "pdr_wizard_trail_open_crate",
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
				"wizard_trail_open_crate",
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
				"wizard_trail_open_crate",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_open_crate",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_shove",
		probability = 1,
		response = "pdr_wizard_trail_shove",
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
				"wizard_trail_shove",
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
				"wizard_trail_shove",
				OP.LT,
				3,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_shove",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_sleigh_found",
		probability = 1,
		response = "pdr_wizard_trail_sleigh_found",
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
				"wizard_trail_sleigh_found",
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
				"wizard_trail_sleigh_found",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_sleigh_found",
				OP.TIMEDIFF,
				OP.GT,
				120,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_sleigh_found",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"wizard_trail_sleigh_found",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_sleigh_gone",
		probability = 1,
		response = "pdr_wizard_trail_sleigh_gone",
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
				"wizard_trail_sleigh_gone",
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
				"wizard_trail_sleigh_gone",
				OP.LT,
				2,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_sleigh_gone",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_stuck_a",
		probability = 1,
		response = "pdr_wizard_trail_stuck_a",
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
				"wizard_trail_stuck_a",
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
				"wizard_trail_stuck_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_stuck_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_stuck_b",
		probability = 1,
		response = "pdr_wizard_trail_stuck_b",
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
				"wizard_trail_stuck_a",
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
		name = "pdr_wizard_trail_vista",
		probability = 1,
		response = "pdr_wizard_trail_vista",
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
				"wizard_trail_vista",
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
				"wizard_trail_vista",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_vista",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_wizard_trail_vista_two",
		probability = 1,
		response = "pdr_wizard_trail_vista_two",
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
				"wizard_trail_vista_two",
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
				"wizard_trail_vista_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_vista_two",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pdr_wizard_trail_bridge_down = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_bridge_down_01",
				"pdr_wizard_trail_bridge_down_02",
				"pdr_wizard_trail_bridge_down_03",
				"pdr_wizard_trail_bridge_down_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_bridge_down_01",
				"pdr_wizard_trail_bridge_down_02",
				"pdr_wizard_trail_bridge_down_03",
				"pdr_wizard_trail_bridge_down_04",
			},
			sound_events_duration = {
				2.3149790763855,
				2.216979265213,
				3.2709791660309,
				2.5749790668488,
			},
		},
		pdr_wizard_trail_caravan_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				[1] = "pdr_wizard_trail_caravan_b_01",
				[2] = "pdr_wizard_trail_caravan_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wizard_trail_caravan_b_01",
				[2] = "pdr_wizard_trail_caravan_b_02",
			},
			sound_events_duration = {
				[1] = 1.7909791469574,
				[2] = 3.5719792842865,
			},
		},
		pdr_wizard_trail_cargo = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			override_awareness = "wizard_trail_winch",
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
				"pdr_wizard_trail_cargo_01",
				"pdr_wizard_trail_cargo_02",
				"pdr_wizard_trail_cargo_03",
				"pdr_wizard_trail_cargo_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_cargo_01",
				"pdr_wizard_trail_cargo_02",
				"pdr_wizard_trail_cargo_03",
				"pdr_wizard_trail_cargo_04",
			},
			sound_events_duration = {
				2.3079791069031,
				3.2199790477753,
				2.0969791412353,
				2.5260000228882,
			},
		},
		pdr_wizard_trail_crate_down = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_crate_down_01",
				"pdr_wizard_trail_crate_down_02",
				"pdr_wizard_trail_crate_down_03",
				"pdr_wizard_trail_crate_down_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_crate_down_01",
				"pdr_wizard_trail_crate_down_02",
				"pdr_wizard_trail_crate_down_03",
				"pdr_wizard_trail_crate_down_04",
			},
			sound_events_duration = {
				2.7349791526794,
				2.1840000152588,
				2.6549792289734,
				3.5689792633057,
			},
		},
		pdr_wizard_trail_crate_drop_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_crate_drop_b_01",
				"pdr_wizard_trail_crate_drop_b_02",
				"pdr_wizard_trail_crate_drop_b_03",
				"pdr_wizard_trail_crate_drop_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_crate_drop_b_01",
				"pdr_wizard_trail_crate_drop_b_02",
				"pdr_wizard_trail_crate_drop_b_03",
				"pdr_wizard_trail_crate_drop_b_04",
			},
			sound_events_duration = {
				3.4679999351502,
				1.6379791498184,
				2.8119790554047,
				2.7379999160767,
			},
		},
		pdr_wizard_trail_free_sleigh = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_free_sleigh_01",
				"pdr_wizard_trail_free_sleigh_02",
				"pdr_wizard_trail_free_sleigh_03",
				"pdr_wizard_trail_free_sleigh_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_free_sleigh_01",
				"pdr_wizard_trail_free_sleigh_02",
				"pdr_wizard_trail_free_sleigh_03",
				"pdr_wizard_trail_free_sleigh_04",
			},
			sound_events_duration = {
				3.4709792137146,
				1.7929791212082,
				3.1449792385101,
				2.9919791221619,
			},
		},
		pdr_wizard_trail_illusion_fades_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_illusion_fades_a_01",
				"pdr_wizard_trail_illusion_fades_a_02",
				"pdr_wizard_trail_illusion_fades_a_03",
				"pdr_wizard_trail_illusion_fades_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_illusion_fades_a_01",
				"pdr_wizard_trail_illusion_fades_a_02",
				"pdr_wizard_trail_illusion_fades_a_03",
				"pdr_wizard_trail_illusion_fades_a_04",
			},
			sound_events_duration = {
				2.8099792003632,
				2.8119790554047,
				4.5639791488647,
				1.3849999904633,
			},
		},
		pdr_wizard_trail_illusion_fades_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_illusion_fades_b_01",
				"pdr_wizard_trail_illusion_fades_b_02",
				"pdr_wizard_trail_illusion_fades_b_03",
				"pdr_wizard_trail_illusion_fades_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_illusion_fades_b_01",
				"pdr_wizard_trail_illusion_fades_b_02",
				"pdr_wizard_trail_illusion_fades_b_03",
				"pdr_wizard_trail_illusion_fades_b_04",
			},
			sound_events_duration = {
				2.3229792118073,
				2.3398749828339,
				3.0721666812897,
				2.1721665859222,
			},
		},
		pdr_wizard_trail_illusion_fades_c = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_illusion_fades_c_01",
				"pdr_wizard_trail_illusion_fades_c_02",
				"pdr_wizard_trail_illusion_fades_c_03",
				"pdr_wizard_trail_illusion_fades_c_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_illusion_fades_c_01",
				"pdr_wizard_trail_illusion_fades_c_02",
				"pdr_wizard_trail_illusion_fades_c_03",
				"pdr_wizard_trail_illusion_fades_c_04",
			},
			sound_events_duration = {
				2.7481458187103,
				2.158145904541,
				2.4916875362396,
				2.7465000152588,
			},
		},
		pdr_wizard_trail_intro_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				[1] = "pdr_wizard_trail_intro_b_01",
				[2] = "pdr_wizard_trail_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wizard_trail_intro_b_01",
				[2] = "pdr_wizard_trail_intro_b_02",
			},
			sound_events_duration = {
				[1] = 4.9889793395996,
				[2] = 5.8009791374206,
			},
		},
		pdr_wizard_trail_intro_c = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				[1] = "pdr_wizard_trail_intro_c_01",
				[2] = "pdr_wizard_trail_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wizard_trail_intro_c_01",
				[2] = "pdr_wizard_trail_intro_c_02",
			},
			sound_events_duration = {
				[1] = 5.245979309082,
				[2] = 5.5639791488647,
			},
		},
		pdr_wizard_trail_intruders_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				[1] = "pdr_wizard_trail_intruders_b_01",
				[2] = "pdr_wizard_trail_intruders_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wizard_trail_intruders_b_01",
				[2] = "pdr_wizard_trail_intruders_b_02",
			},
			sound_events_duration = {
				[1] = 2.7379791736603,
				[2] = 3.9769792556763,
			},
		},
		pdr_wizard_trail_lower_bridge_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				[1] = "pdr_wizard_trail_lower_bridge_b_01",
				[2] = "pdr_wizard_trail_lower_bridge_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_wizard_trail_lower_bridge_b_01",
				[2] = "pdr_wizard_trail_lower_bridge_b_02",
			},
			sound_events_duration = {
				[1] = 2.2369792461395,
				[2] = 2.2409791946411,
			},
		},
		pdr_wizard_trail_olesya_revealed_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			override_awareness = "wizard_trail_olesya_revealed_b_done",
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
				"pdr_wizard_trail_olesya_revealed_b_01",
				"pdr_wizard_trail_olesya_revealed_b_02",
				"pdr_wizard_trail_olesya_revealed_b_03",
				"pdr_wizard_trail_olesya_revealed_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_olesya_revealed_b_01",
				"pdr_wizard_trail_olesya_revealed_b_02",
				"pdr_wizard_trail_olesya_revealed_b_03",
				"pdr_wizard_trail_olesya_revealed_b_04",
			},
			sound_events_duration = {
				2.4349792003632,
				0.86197918653488,
				3.5979790687561,
				2.3849792480469,
			},
		},
		pdr_wizard_trail_olesya_revealed_b_distance = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			override_awareness = "wizard_trail_olesya_revealed_b_done",
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
				"pdr_wizard_trail_olesya_revealed_b_01",
				"pdr_wizard_trail_olesya_revealed_b_02",
				"pdr_wizard_trail_olesya_revealed_b_03",
				"pdr_wizard_trail_olesya_revealed_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_olesya_revealed_b_01",
				"pdr_wizard_trail_olesya_revealed_b_02",
				"pdr_wizard_trail_olesya_revealed_b_03",
				"pdr_wizard_trail_olesya_revealed_b_04",
			},
			sound_events_duration = {
				2.4349792003632,
				0.86197918653488,
				3.5979790687561,
				2.3849792480469,
			},
		},
		pdr_wizard_trail_open_crate = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_open_crate_01",
				"pdr_wizard_trail_open_crate_02",
				"pdr_wizard_trail_open_crate_03",
				"pdr_wizard_trail_open_crate_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_open_crate_01",
				"pdr_wizard_trail_open_crate_02",
				"pdr_wizard_trail_open_crate_03",
				"pdr_wizard_trail_open_crate_04",
			},
			sound_events_duration = {
				2.8709790706634,
				2.0309791564941,
				3.0819792747498,
				3.6159791946411,
			},
		},
		pdr_wizard_trail_shove = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_shove_01",
				"pdr_wizard_trail_shove_02",
				"pdr_wizard_trail_shove_03",
				"pdr_wizard_trail_shove_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_shove_01",
				"pdr_wizard_trail_shove_02",
				"pdr_wizard_trail_shove_03",
				"pdr_wizard_trail_shove_04",
			},
			sound_events_duration = {
				2.3959999084473,
				1.9980000257492,
				1.8420000076294,
				0.93599998950958,
			},
		},
		pdr_wizard_trail_sleigh_found = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_sleigh_found_01",
				"pdr_wizard_trail_sleigh_found_02",
				"pdr_wizard_trail_sleigh_found_03",
				"pdr_wizard_trail_sleigh_found_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_sleigh_found_01",
				"pdr_wizard_trail_sleigh_found_02",
				"pdr_wizard_trail_sleigh_found_03",
				"pdr_wizard_trail_sleigh_found_04",
			},
			sound_events_duration = {
				2.0789792537689,
				3.4519791603088,
				2.2769999504089,
				3.8589792251587,
			},
		},
		pdr_wizard_trail_sleigh_gone = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			override_awareness = "wizard_trail_sleigh_lost",
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
				"pdr_wizard_trail_sleigh_gone_01",
				"pdr_wizard_trail_sleigh_gone_02",
				"pdr_wizard_trail_sleigh_gone_03",
				"pdr_wizard_trail_sleigh_gone_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_sleigh_gone_01",
				"pdr_wizard_trail_sleigh_gone_02",
				"pdr_wizard_trail_sleigh_gone_03",
				"pdr_wizard_trail_sleigh_gone_04",
			},
			sound_events_duration = {
				2.5299792289734,
				1.9839792251587,
				1.7400000095367,
				2.3939790725708,
			},
		},
		pdr_wizard_trail_stuck_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_stuck_a_01",
				"pdr_wizard_trail_stuck_a_02",
				"pdr_wizard_trail_stuck_a_03",
				"pdr_wizard_trail_stuck_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_stuck_a_01",
				"pdr_wizard_trail_stuck_a_02",
				"pdr_wizard_trail_stuck_a_03",
				"pdr_wizard_trail_stuck_a_04",
			},
			sound_events_duration = {
				3.8579790592194,
				1.8499791622162,
				3.3939790725708,
				1.6819791793823,
			},
		},
		pdr_wizard_trail_stuck_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_stuck_b_01",
				"pdr_wizard_trail_stuck_b_02",
				"pdr_wizard_trail_stuck_b_03",
				"pdr_wizard_trail_stuck_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_stuck_b_01",
				"pdr_wizard_trail_stuck_b_02",
				"pdr_wizard_trail_stuck_b_03",
				"pdr_wizard_trail_stuck_b_04",
			},
			sound_events_duration = {
				2.1889791488648,
				2.1949791908264,
				4.7079792022705,
				2.6629791259766,
			},
		},
		pdr_wizard_trail_vista = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_vista_01",
				"pdr_wizard_trail_vista_02",
				"pdr_wizard_trail_vista_03",
				"pdr_wizard_trail_vista_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_vista_01",
				"pdr_wizard_trail_vista_02",
				"pdr_wizard_trail_vista_03",
				"pdr_wizard_trail_vista_04",
			},
			sound_events_duration = {
				2.9799792766571,
				2.408979177475,
				4.7249794006348,
				2.5899791717529,
			},
		},
		pdr_wizard_trail_vista_two = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_wizards_trail",
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
				"pdr_wizard_trail_vista_two_01",
				"pdr_wizard_trail_vista_two_02",
				"pdr_wizard_trail_vista_two_03",
				"pdr_wizard_trail_vista_two_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wizard_trail_vista_two_01",
				"pdr_wizard_trail_vista_two_02",
				"pdr_wizard_trail_vista_two_03",
				"pdr_wizard_trail_vista_two_04",
			},
			sound_events_duration = {
				1.3639999628067,
				2.3739790916443,
				3.1119999885559,
				2.6649792194366,
			},
		},
	})
end
