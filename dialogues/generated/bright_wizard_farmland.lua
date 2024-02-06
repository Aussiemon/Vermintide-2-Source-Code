﻿-- chunkname: @dialogues/generated/bright_wizard_farmland.lua

return function ()
	define_rule({
		name = "pbw_farmlands_intro_a",
		response = "pbw_farmlands_intro_a",
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
				"farmlands_intro_a",
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
				"farmlands_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_farmlands_intro_b",
		response = "pbw_farmlands_intro_b",
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
				"farmlands_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"farmlands_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_farmlands_intro_c",
		response = "pbw_farmlands_intro_c",
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
				"farmlands_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"farmlands_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_intro_c",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmland_stick_to_the_road_01",
		response = "pbw_level_farmland_stick_to_the_road_01",
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
				"farmland_stick_to_the_road",
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
				"farmland_stick_to_the_road",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmland_stick_to_the_road",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_cart_01",
		response = "pbw_level_farmlands_cart_01",
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
				"farmlands_cart",
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
				"farmlands_cart",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_cart",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_deserted_01",
		response = "pbw_level_farmlands_deserted_01",
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
				"farmlands_deserted",
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
				"farmlands_deserted",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_deserted",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_end_level_01",
		response = "pbw_level_farmlands_end_level_01",
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
				"farmlands_end_level",
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
				"farmlands_end_level",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_end_level",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_fence_01",
		response = "pbw_level_farmlands_fence_01",
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
				"farmlands_fence",
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
				"farmlands_fence",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_fence",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_investigate_farm_01",
		response = "pbw_level_farmlands_investigate_farm_01",
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
				"farmlands_investigate_farm",
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
				"farmlands_investigate_farm",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_investigate_farm",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_kill_the_brute_01",
		response = "pbw_level_farmlands_kill_the_brute_01",
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
				"farmlands_kill_the_brute",
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
				"farmlands_kill_the_brute",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_kill_the_brute",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_last_farm_01",
		response = "pbw_level_farmlands_last_farm_01",
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
				"farmlands_last_farm",
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
				"farmlands_last_farm",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_last_farm",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_locked_gate_01",
		response = "pbw_level_farmlands_locked_gate_01",
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
				"farmlands_locked_gate",
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
				"farmlands_locked_gate",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_locked_gate",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_monster_in_barn_01",
		response = "pbw_level_farmlands_monster_in_barn_01",
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
				"farmlands_monster_in_barn",
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
				"farmlands_monster_in_barn",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_monster_in_barn",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_move_on_01",
		response = "pbw_level_farmlands_move_on_01",
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
				"farmlands_move_on",
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
				"farmlands_move_on",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_move_on",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_next_farm_01",
		response = "pbw_level_farmlands_next_farm_01",
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
				"farmlands_next_farm",
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
				"farmlands_next_farm",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_next_farm",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_no_prisoners_01",
		response = "pbw_level_farmlands_no_prisoners_01",
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
				"farmlands_no_prisoners",
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
				"farmlands_no_prisoners",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_no_prisoners",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_prisoners_01",
		response = "pbw_level_farmlands_prisoners_01",
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
				"farmlands_prisoners",
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
				"farmlands_prisoners",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_prisoners",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_smoke_plume_01",
		response = "pbw_level_farmlands_smoke_plume_01",
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
				"farmlands_smoke_plume",
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
				"farmlands_smoke_plume",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_smoke_plume",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_through_the_barn_01",
		response = "pbw_level_farmlands_through_the_barn_01",
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
				"farmlands_through_the_barn",
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
				"farmlands_through_the_barn",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_through_the_barn",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_farmlands_unlocking_the_cage_01",
		response = "pbw_level_farmlands_unlocking_the_cage_01",
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
				"farmlands_unlocking_the_cage",
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
				"farmlands_unlocking_the_cage",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"farmlands_unlocking_the_cage",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_farmlands_intro_a = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				[1] = "pbw_farmlands_intro_a_01",
				[2] = "pbw_farmlands_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_farmlands_intro_a_01",
				[2] = "pbw_farmlands_intro_a_02",
			},
			sound_events_duration = {
				[1] = 3.9078750610352,
				[2] = 2.4624791145325,
			},
		},
		pbw_farmlands_intro_b = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				[1] = "pbw_farmlands_intro_b_01",
				[2] = "pbw_farmlands_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_farmlands_intro_b_01",
				[2] = "pbw_farmlands_intro_b_02",
			},
			sound_events_duration = {
				[1] = 4.2869167327881,
				[2] = 3.9176249504089,
			},
		},
		pbw_farmlands_intro_c = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				[1] = "pbw_farmlands_intro_c_01",
				[2] = "pbw_farmlands_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_farmlands_intro_c_01",
				[2] = "pbw_farmlands_intro_c_02",
			},
			sound_events_duration = {
				[1] = 5.0680418014526,
				[2] = 6.7714478969574,
			},
		},
		pbw_level_farmland_stick_to_the_road_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pbw_level_farmland_stick_to_the_road_01",
				"pbw_level_farmland_stick_to_the_road_02",
				"pbw_level_farmland_stick_to_the_road_03",
				"pbw_level_farmland_stick_to_the_road_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmland_stick_to_the_road_01",
				"pbw_level_farmland_stick_to_the_road_02",
				"pbw_level_farmland_stick_to_the_road_03",
				"pbw_level_farmland_stick_to_the_road_04",
			},
			sound_events_duration = {
				3.1505625247955,
				2.283124923706,
				3.140145778656,
				2.6709792613983,
			},
		},
		pbw_level_farmlands_cart_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_cart_01",
				"pbw_level_farmlands_cart_02",
				"pbw_level_farmlands_cart_03",
				"pbw_level_farmlands_cart_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_cart_01",
				"pbw_level_farmlands_cart_02",
				"pbw_level_farmlands_cart_03",
				"pbw_level_farmlands_cart_04",
			},
			sound_events_duration = {
				3.1635208129883,
				3.4076459407806,
				2.5502290725708,
				3.3789167404175,
			},
		},
		pbw_level_farmlands_deserted_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pbw_level_farmlands_deserted_01",
				"pbw_level_farmlands_deserted_02",
				"pbw_level_farmlands_deserted_03",
				"pbw_level_farmlands_deserted_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_deserted_01",
				"pbw_level_farmlands_deserted_02",
				"pbw_level_farmlands_deserted_03",
				"pbw_level_farmlands_deserted_04",
			},
			sound_events_duration = {
				4.1550416946411,
				3.6177499294281,
				3.6943125724792,
				4.8976874351502,
			},
		},
		pbw_level_farmlands_end_level_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_end_level_01",
				"pbw_level_farmlands_end_level_02",
				"pbw_level_farmlands_end_level_03",
				"pbw_level_farmlands_end_level_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_end_level_01",
				"pbw_level_farmlands_end_level_02",
				"pbw_level_farmlands_end_level_03",
				"pbw_level_farmlands_end_level_04",
			},
			sound_events_duration = {
				3.628312587738,
				2.9664165973663,
				4.4056458473206,
				3.3228332996368,
			},
		},
		pbw_level_farmlands_fence_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_fence_01",
				"pbw_level_farmlands_fence_02",
				"pbw_level_farmlands_fence_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_fence_01",
				"pbw_level_farmlands_fence_02",
				"pbw_level_farmlands_fence_03",
			},
			sound_events_duration = {
				1.5828541517258,
				1.9067083597183,
				3.8161041736603,
			},
		},
		pbw_level_farmlands_investigate_farm_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_investigate_farm_01",
				"pbw_level_farmlands_investigate_farm_02",
				"pbw_level_farmlands_investigate_farm_03",
				"pbw_level_farmlands_investigate_farm_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_investigate_farm_01",
				"pbw_level_farmlands_investigate_farm_02",
				"pbw_level_farmlands_investigate_farm_03",
				"pbw_level_farmlands_investigate_farm_04",
			},
			sound_events_duration = {
				1.608437538147,
				2.2949376106262,
				2.4404582977295,
				3.7126042842865,
			},
		},
		pbw_level_farmlands_kill_the_brute_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_kill_the_brute_01",
				"pbw_level_farmlands_kill_the_brute_02",
				"pbw_level_farmlands_kill_the_brute_03",
				"pbw_level_farmlands_kill_the_brute_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_kill_the_brute_01",
				"pbw_level_farmlands_kill_the_brute_02",
				"pbw_level_farmlands_kill_the_brute_03",
				"pbw_level_farmlands_kill_the_brute_04",
			},
			sound_events_duration = {
				1.6255625486374,
				1.8860833644867,
				1.5398541688919,
				2.2361042499542,
			},
		},
		pbw_level_farmlands_last_farm_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_last_farm_01",
				"pbw_level_farmlands_last_farm_02",
				"pbw_level_farmlands_last_farm_03",
				"pbw_level_farmlands_last_farm_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_last_farm_01",
				"pbw_level_farmlands_last_farm_02",
				"pbw_level_farmlands_last_farm_03",
				"pbw_level_farmlands_last_farm_04",
			},
			sound_events_duration = {
				2.5235834121704,
				6.0839583873749,
				3.7766041755676,
				3.9015624523163,
			},
		},
		pbw_level_farmlands_locked_gate_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pbw_level_farmlands_locked_gate_01",
				"pbw_level_farmlands_locked_gate_02",
				"pbw_level_farmlands_locked_gate_03",
				"pbw_level_farmlands_locked_gate_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_locked_gate_01",
				"pbw_level_farmlands_locked_gate_02",
				"pbw_level_farmlands_locked_gate_03",
				"pbw_level_farmlands_locked_gate_04",
			},
			sound_events_duration = {
				5.4869999885559,
				3.4442291259766,
				2.27379155159,
				2.6918332576752,
			},
		},
		pbw_level_farmlands_monster_in_barn_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_monster_in_barn_01",
				"pbw_level_farmlands_monster_in_barn_02",
				"pbw_level_farmlands_monster_in_barn_03",
				"pbw_level_farmlands_monster_in_barn_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_monster_in_barn_01",
				"pbw_level_farmlands_monster_in_barn_02",
				"pbw_level_farmlands_monster_in_barn_03",
				"pbw_level_farmlands_monster_in_barn_04",
			},
			sound_events_duration = {
				3.0697290897369,
				5.9274373054504,
				5.9120416641235,
				4.5048332214356,
			},
		},
		pbw_level_farmlands_move_on_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_move_on_01",
				"pbw_level_farmlands_move_on_02",
				"pbw_level_farmlands_move_on_03",
				"pbw_level_farmlands_move_on_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_move_on_01",
				"pbw_level_farmlands_move_on_02",
				"pbw_level_farmlands_move_on_03",
				"pbw_level_farmlands_move_on_04",
			},
			sound_events_duration = {
				3.384604215622,
				4.2198958396912,
				3.8830416202545,
				3.6472084522247,
			},
		},
		pbw_level_farmlands_next_farm_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pbw_level_farmlands_next_farm_01",
				"pbw_level_farmlands_next_farm_02",
				"pbw_level_farmlands_next_farm_03",
				"pbw_level_farmlands_next_farm_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_next_farm_01",
				"pbw_level_farmlands_next_farm_02",
				"pbw_level_farmlands_next_farm_03",
				"pbw_level_farmlands_next_farm_04",
			},
			sound_events_duration = {
				3.1141042709351,
				3.5352709293366,
				3.2350833415985,
				3.529354095459,
			},
		},
		pbw_level_farmlands_no_prisoners_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_no_prisoners_01",
				"pbw_level_farmlands_no_prisoners_02",
				"pbw_level_farmlands_no_prisoners_03",
				"pbw_level_farmlands_no_prisoners_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_no_prisoners_01",
				"pbw_level_farmlands_no_prisoners_02",
				"pbw_level_farmlands_no_prisoners_03",
				"pbw_level_farmlands_no_prisoners_04",
			},
			sound_events_duration = {
				3.2873125076294,
				2.244083404541,
				2.3159999847412,
				3.3313748836517,
			},
		},
		pbw_level_farmlands_prisoners_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_prisoners_01",
				"pbw_level_farmlands_prisoners_02",
				"pbw_level_farmlands_prisoners_03",
				"pbw_level_farmlands_prisoners_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_prisoners_01",
				"pbw_level_farmlands_prisoners_02",
				"pbw_level_farmlands_prisoners_03",
				"pbw_level_farmlands_prisoners_04",
			},
			sound_events_duration = {
				4.5115418434143,
				3.5034999847412,
				2.842437505722,
				3.8629167079926,
			},
		},
		pbw_level_farmlands_smoke_plume_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_smoke_plume_01",
				"pbw_level_farmlands_smoke_plume_02",
				"pbw_level_farmlands_smoke_plume_03",
				"pbw_level_farmlands_smoke_plume_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_smoke_plume_01",
				"pbw_level_farmlands_smoke_plume_02",
				"pbw_level_farmlands_smoke_plume_03",
				"pbw_level_farmlands_smoke_plume_04",
			},
			sound_events_duration = {
				3.2405624389648,
				6.367666721344,
				6.4806666374206,
				3.2006459236145,
			},
		},
		pbw_level_farmlands_through_the_barn_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_through_the_barn_01",
				"pbw_level_farmlands_through_the_barn_02",
				"pbw_level_farmlands_through_the_barn_03",
				"pbw_level_farmlands_through_the_barn_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_through_the_barn_01",
				"pbw_level_farmlands_through_the_barn_02",
				"pbw_level_farmlands_through_the_barn_03",
				"pbw_level_farmlands_through_the_barn_04",
			},
			sound_events_duration = {
				3.7582082748413,
				2.0498125553131,
				4.1073126792908,
				1.5559375286102,
			},
		},
		pbw_level_farmlands_unlocking_the_cage_01 = {
			category = "level_talk",
			database = "bright_wizard_farmland",
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
				"pbw_level_farmlands_unlocking_the_cage_01",
				"pbw_level_farmlands_unlocking_the_cage_02",
				"pbw_level_farmlands_unlocking_the_cage_03",
				"pbw_level_farmlands_unlocking_the_cage_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_farmlands_unlocking_the_cage_01",
				"pbw_level_farmlands_unlocking_the_cage_02",
				"pbw_level_farmlands_unlocking_the_cage_03",
				"pbw_level_farmlands_unlocking_the_cage_04",
			},
			sound_events_duration = {
				2.8785624504089,
				1.551958322525,
				1.9605624675751,
				1.1044791936874,
			},
		},
	})
end
