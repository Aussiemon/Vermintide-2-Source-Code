﻿-- chunkname: @dialogues/generated/wood_elf_nurgle.lua

return function ()
	define_rule({
		name = "pwe_level_nurgle_coming_down",
		response = "pwe_level_nurgle_coming_down",
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
				"level_nurgle_coming_down",
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
				"level_nurgle_coming_down",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_coming_down",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_nurgle_spotting_objective",
		response = "pwe_level_nurgle_spotting_objective",
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
				"level_nurgle_spotting_objective",
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
				"level_nurgle_spotting_objective",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_spotting_objective",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_nurgle_swift_river",
		response = "pwe_level_nurgle_swift_river",
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
				"level_nurgle_swift_river",
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
				"level_nurgle_swift_river",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_swift_river",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_nurgle_intro_a",
		response = "pwe_nurgle_intro_a",
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
				"nurgle_intro_a",
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
				"nurgle_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_nurgle_intro_b",
		response = "pwe_nurgle_intro_b",
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
				"nurgle_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"nurgle_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_intro_b",
				OP.TIMESET,
			},
		},
	})
	add_dialogues({
		pwe_level_nurgle_coming_down = {
			category = "level_talk",
			database = "wood_elf_nurgle",
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
				"pwe_level_nurgle_coming_down_01",
				"pwe_level_nurgle_coming_down_02",
				"pwe_level_nurgle_coming_down_03",
				"pwe_level_nurgle_coming_down_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_nurgle_coming_down_01",
				"pwe_level_nurgle_coming_down_02",
				"pwe_level_nurgle_coming_down_03",
				"pwe_level_nurgle_coming_down_04",
			},
			sound_events_duration = {
				4.6912498474121,
				5.1840624809265,
				6.0263748168945,
				4.5843749046326,
			},
		},
		pwe_level_nurgle_spotting_objective = {
			category = "level_talk",
			database = "wood_elf_nurgle",
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
				"pwe_level_nurgle_spotting_objective_01",
				"pwe_level_nurgle_spotting_objective_02",
				"pwe_level_nurgle_spotting_objective_03",
				"pwe_level_nurgle_spotting_objective_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_nurgle_spotting_objective_01",
				"pwe_level_nurgle_spotting_objective_02",
				"pwe_level_nurgle_spotting_objective_03",
				"pwe_level_nurgle_spotting_objective_04",
			},
			sound_events_duration = {
				3.4518959522247,
				3.3708124160767,
				4.223249912262,
				3.3921458721161,
			},
		},
		pwe_level_nurgle_swift_river = {
			category = "level_talk",
			database = "wood_elf_nurgle",
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
				"pwe_level_nurgle_swift_river_01",
				"pwe_level_nurgle_swift_river_02",
				"pwe_level_nurgle_swift_river_03",
				"pwe_level_nurgle_swift_river_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_nurgle_swift_river_01",
				"pwe_level_nurgle_swift_river_02",
				"pwe_level_nurgle_swift_river_03",
				"pwe_level_nurgle_swift_river_04",
			},
			sound_events_duration = {
				4.0989271402359,
				2.8746666908264,
				3.9763333797455,
				4.0714793205261,
			},
		},
		pwe_nurgle_intro_a = {
			category = "level_talk",
			database = "wood_elf_nurgle",
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
				[1] = "pwe_nurgle_intro_a_01",
				[2] = "pwe_nurgle_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_nurgle_intro_a_01",
				[2] = "pwe_nurgle_intro_a_02",
			},
			sound_events_duration = {
				[1] = 7.7614164352417,
				[2] = 8.7651872634888,
			},
		},
		pwe_nurgle_intro_b = {
			category = "level_talk",
			database = "wood_elf_nurgle",
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
				[1] = "pwe_nurgle_intro_b_01",
				[2] = "pwe_nurgle_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_nurgle_intro_b_01",
				[2] = "pwe_nurgle_intro_b_02",
			},
			sound_events_duration = {
				[1] = 10.481687545776,
				[2] = 9.5001878738403,
			},
		},
	})
end
