﻿-- chunkname: @dialogues/generated/empire_soldier_ground_zero.lua

return function ()
	define_rule({
		name = "pes_ground_zero_intro_a",
		response = "pes_ground_zero_intro_a",
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
				"ground_zero_intro_a",
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
				"ground_zero_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_ground_zero_intro_b",
		response = "pes_ground_zero_intro_b",
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
				"ground_zero_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"ground_zero_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_ground_zero_intro_c",
		response = "pes_ground_zero_intro_c",
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
				"ground_zero_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"ground_zero_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_c",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_boss_spotted",
		response = "pes_level_ground_zero_boss_spotted",
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
				"ebh_level_ground_zero_lord_intro",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"ground_zero_boss_spotted",
				OP.TIMEDIFF,
				OP.GT,
				10,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_boss_spotted",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_boss_taunt_reply",
		response = "pes_level_ground_zero_boss_taunt_reply",
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
				"ebh_level_ground_zero_lord_banter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"faction_memory",
				"ground_zero_boss_taunt_reply",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_boss_taunt_reply",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_canal_crossing",
		response = "pes_level_ground_zero_canal_crossing",
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
				"ground_zero_canal_crossing",
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
				"level_ground_zero_canal_crossing",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_canal_crossing",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_canals",
		response = "pes_level_ground_zero_canals",
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
				"ground_zero_canals",
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
				"level_ground_zero_canals",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_canals",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_cargo_elevator",
		response = "pes_level_ground_zero_cargo_elevator",
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
				"ground_zero_cargo_elevator",
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
				"level_ground_zero_cargo_elevator",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_cargo_elevator",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_complete",
		response = "pes_level_ground_zero_complete",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill",
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_exalted_champion_warcamp",
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
				"user_memory",
				"level_ground_zero_complete",
				OP.TIMEDIFF,
				OP.GT,
				10,
			},
		},
		on_done = {
			{
				"user_memory",
				"level_ground_zero_complete",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_corruption_everywhere",
		response = "pes_level_ground_zero_corruption_everywhere",
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
				"ground_zero_corruption_everywhere",
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
				"level_ground_zero_corruption_everywhere",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_corruption_everywhere",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_crumbling",
		response = "pes_level_ground_zero_crumbling",
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
				"ground_zero_crumbling",
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
				"level_ground_zero_crumbling",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_crumbling",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_landslide",
		response = "pes_level_ground_zero_landslide",
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
				"ground_zero_landslide",
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
				"level_ground_zero_landslide",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_landslide",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_looking_for_elevator",
		response = "pes_level_ground_zero_looking_for_elevator",
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
				"ground_zero_looking_for_elevator",
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
				"level_ground_zero_looking_for_elevator",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_looking_for_elevator",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_precarious",
		response = "pes_level_ground_zero_precarious",
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
				"ground_zero_precarious",
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
				"level_ground_zero_precarious",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_precarious",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_smell",
		response = "pes_level_ground_zero_smell",
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
				"ground_zero_smell",
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
				"level_ground_zero_smell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_smell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_the_hole",
		response = "pes_level_ground_zero_the_hole",
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
				"ground_zero_the_hole",
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
				"level_ground_zero_the_hole",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_the_hole",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_the_hole_second_view",
		response = "pes_level_ground_zero_the_hole_second_view",
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
				"ground_zero_the_hole_second_view",
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
				"level_ground_zero_the_hole_second_view",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_the_hole_second_view",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_ground_zero_welcoming_committee",
		response = "pes_level_ground_zero_welcoming_committee",
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
				"ground_zero_welcoming_committee",
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
				"level_ground_zero_welcoming_committee",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_welcoming_committee",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pes_ground_zero_intro_a = {
			category = "level_talk",
			database = "empire_soldier_ground_zero",
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
				[1] = "pes_ground_zero_intro_a_01",
				[2] = "pes_ground_zero_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_ground_zero_intro_a_01",
				[2] = "pes_ground_zero_intro_a_02",
			},
			sound_events_duration = {
				[1] = 4.9998540878296,
				[2] = 5.8291873931885,
			},
		},
		pes_ground_zero_intro_b = {
			category = "level_talk",
			database = "empire_soldier_ground_zero",
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
				[1] = "pes_ground_zero_intro_b_01",
				[2] = "pes_ground_zero_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_ground_zero_intro_b_01",
				[2] = "pes_ground_zero_intro_b_02",
			},
			sound_events_duration = {
				[1] = 4.4172291755676,
				[2] = 7.4405207633972,
			},
		},
		pes_ground_zero_intro_c = {
			category = "level_talk",
			database = "empire_soldier_ground_zero",
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
				[1] = "pes_ground_zero_intro_c_01",
				[2] = "pes_ground_zero_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_ground_zero_intro_c_01",
				[2] = "pes_ground_zero_intro_c_02",
			},
			sound_events_duration = {
				[1] = 6.7882499694824,
				[2] = 8.435396194458,
			},
		},
		pes_level_ground_zero_boss_spotted = {
			category = "player_alerts_boss",
			database = "empire_soldier_ground_zero",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pes_level_ground_zero_boss_spotted_01",
				"pes_level_ground_zero_boss_spotted_02",
				"pes_level_ground_zero_boss_spotted_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_boss_spotted_01",
				"pes_level_ground_zero_boss_spotted_02",
				"pes_level_ground_zero_boss_spotted_03",
			},
			sound_events_duration = {
				6.8886251449585,
				8.8464164733887,
				9.1421041488647,
			},
		},
		pes_level_ground_zero_boss_taunt_reply = {
			category = "player_alerts_boss",
			database = "empire_soldier_ground_zero",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_level_ground_zero_boss_taunt_reply_01",
				[2] = "pes_level_ground_zero_boss_taunt_reply_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_ground_zero_boss_taunt_reply_01",
				[2] = "pes_level_ground_zero_boss_taunt_reply_02",
			},
			sound_events_duration = {
				[1] = 7.738395690918,
				[2] = 9.7863750457764,
			},
		},
		pes_level_ground_zero_canal_crossing = {
			category = "level_talk",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_canal_crossing_01",
				"pes_level_ground_zero_canal_crossing_02",
				"pes_level_ground_zero_canal_crossing_03",
				"pes_level_ground_zero_canal_crossing_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_canal_crossing_01",
				"pes_level_ground_zero_canal_crossing_02",
				"pes_level_ground_zero_canal_crossing_03",
				"pes_level_ground_zero_canal_crossing_04",
			},
			sound_events_duration = {
				2.7639374732971,
				2.8159375190735,
				2.6757917404175,
				3.0418124198914,
			},
		},
		pes_level_ground_zero_canals = {
			category = "level_talk",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_canals_01",
				"pes_level_ground_zero_canals_02",
				"pes_level_ground_zero_canals_03",
				"pes_level_ground_zero_canals_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_canals_01",
				"pes_level_ground_zero_canals_02",
				"pes_level_ground_zero_canals_03",
				"pes_level_ground_zero_canals_04",
			},
			sound_events_duration = {
				3.5518958568573,
				2.6656041145325,
				2.2019166946411,
				4.6565208435059,
			},
		},
		pes_level_ground_zero_cargo_elevator = {
			category = "level_talk",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_cargo_elevator_01",
				"pes_level_ground_zero_cargo_elevator_02",
				"pes_level_ground_zero_cargo_elevator_03",
				"pes_level_ground_zero_cargo_elevator_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_cargo_elevator_01",
				"pes_level_ground_zero_cargo_elevator_02",
				"pes_level_ground_zero_cargo_elevator_03",
				"pes_level_ground_zero_cargo_elevator_04",
			},
			sound_events_duration = {
				4.2834167480469,
				2.4035625457764,
				3.0251667499542,
				3.065333366394,
			},
		},
		pes_level_ground_zero_complete = {
			category = "player_alerts_boss",
			database = "empire_soldier_ground_zero",
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
				[1] = "pes_level_ground_zero_complete_01",
				[2] = "pes_level_ground_zero_complete_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_ground_zero_complete_01",
				[2] = "pes_level_ground_zero_complete_02",
			},
			sound_events_duration = {
				[1] = 6.8177914619446,
				[2] = 7.0135002136231,
			},
		},
		pes_level_ground_zero_corruption_everywhere = {
			category = "level_talk",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_corruption_everywhere_01",
				"pes_level_ground_zero_corruption_everywhere_02",
				"pes_level_ground_zero_corruption_everywhere_03",
				"pes_level_ground_zero_corruption_everywhere_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_corruption_everywhere_01",
				"pes_level_ground_zero_corruption_everywhere_02",
				"pes_level_ground_zero_corruption_everywhere_03",
				"pes_level_ground_zero_corruption_everywhere_04",
			},
			sound_events_duration = {
				3.3790416717529,
				3.6476666927338,
				6.5644583702087,
				4.6164164543152,
			},
		},
		pes_level_ground_zero_crumbling = {
			category = "level_talk",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_crumbling_01",
				"pes_level_ground_zero_crumbling_02",
				"pes_level_ground_zero_crumbling_03",
				"pes_level_ground_zero_crumbling_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_crumbling_01",
				"pes_level_ground_zero_crumbling_02",
				"pes_level_ground_zero_crumbling_03",
				"pes_level_ground_zero_crumbling_04",
			},
			sound_events_duration = {
				3.2160832881927,
				3,
				5.0997915267944,
				4.4368958473206,
			},
		},
		pes_level_ground_zero_landslide = {
			category = "cut_scene",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_landslide_01",
				"pes_level_ground_zero_landslide_02",
				"pes_level_ground_zero_landslide_03",
				"pes_level_ground_zero_landslide_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_landslide_01",
				"pes_level_ground_zero_landslide_02",
				"pes_level_ground_zero_landslide_03",
				"pes_level_ground_zero_landslide_04",
			},
			sound_events_duration = {
				3.606187582016,
				3.5,
				2.6655209064484,
				4.4354166984558,
			},
		},
		pes_level_ground_zero_looking_for_elevator = {
			category = "level_talk",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_looking_for_elevator_01",
				"pes_level_ground_zero_looking_for_elevator_02",
				"pes_level_ground_zero_looking_for_elevator_03",
				"pes_level_ground_zero_looking_for_elevator_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_looking_for_elevator_01",
				"pes_level_ground_zero_looking_for_elevator_02",
				"pes_level_ground_zero_looking_for_elevator_03",
				"pes_level_ground_zero_looking_for_elevator_04",
			},
			sound_events_duration = {
				1.9454791545868,
				2.770124912262,
				2.5388751029968,
				3.5882499217987,
			},
		},
		pes_level_ground_zero_precarious = {
			category = "story_talk",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_precarious_01",
				"pes_level_ground_zero_precarious_02",
				"pes_level_ground_zero_precarious_03",
				"pes_level_ground_zero_precarious_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_precarious_01",
				"pes_level_ground_zero_precarious_02",
				"pes_level_ground_zero_precarious_03",
				"pes_level_ground_zero_precarious_04",
			},
			sound_events_duration = {
				2.2663958072662,
				2.9711875915527,
				3.2054584026337,
				4.1206459999084,
			},
		},
		pes_level_ground_zero_smell = {
			category = "level_talk",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_smell_01",
				"pes_level_ground_zero_smell_02",
				"pes_level_ground_zero_smell_03",
				"pes_level_ground_zero_smell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_smell_01",
				"pes_level_ground_zero_smell_02",
				"pes_level_ground_zero_smell_03",
				"pes_level_ground_zero_smell_04",
			},
			sound_events_duration = {
				5.6272501945496,
				3.331312417984,
				2.6627082824707,
				4.6801042556763,
			},
		},
		pes_level_ground_zero_the_hole = {
			category = "story_talk",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_the_hole_01",
				"pes_level_ground_zero_the_hole_02",
				"pes_level_ground_zero_the_hole_03",
				"pes_level_ground_zero_the_hole_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_the_hole_01",
				"pes_level_ground_zero_the_hole_02",
				"pes_level_ground_zero_the_hole_03",
				"pes_level_ground_zero_the_hole_04",
			},
			sound_events_duration = {
				5.1390416622162,
				6.7150418758392,
				5.1349895000458,
				6.1933958530426,
			},
		},
		pes_level_ground_zero_the_hole_second_view = {
			category = "story_talk",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_the_hole_second_view_01",
				"pes_level_ground_zero_the_hole_second_view_02",
				"pes_level_ground_zero_the_hole_second_view_03",
				"pes_level_ground_zero_the_hole_second_view_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_the_hole_second_view_01",
				"pes_level_ground_zero_the_hole_second_view_02",
				"pes_level_ground_zero_the_hole_second_view_03",
				"pes_level_ground_zero_the_hole_second_view_04",
			},
			sound_events_duration = {
				6.3555207252502,
				5.4949584007263,
				4.907666683197,
				3.8080415725708,
			},
		},
		pes_level_ground_zero_welcoming_committee = {
			category = "story_talk",
			database = "empire_soldier_ground_zero",
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
				"pes_level_ground_zero_welcoming_committee_01",
				"pes_level_ground_zero_welcoming_committee_02",
				"pes_level_ground_zero_welcoming_committee_03",
				"pes_level_ground_zero_welcoming_committee_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_ground_zero_welcoming_committee_01",
				"pes_level_ground_zero_welcoming_committee_02",
				"pes_level_ground_zero_welcoming_committee_03",
				"pes_level_ground_zero_welcoming_committee_04",
			},
			sound_events_duration = {
				6.9880833625794,
				3.3226459026337,
				4.2186665534973,
				4.5,
			},
		},
	})
end
