﻿-- chunkname: @dialogues/generated/bright_wizard_warcamp.lua

return function ()
	define_rule({
		name = "pbw_chaos_war_camp_challenge_reply_a",
		probability = 1,
		response = "pbw_chaos_war_camp_challenge_reply_a",
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
				"ecc_chaos_war_camp_challenge",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMEDIFF,
				OP.GT,
				60,
			},
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_chaos_war_camp_intro_a",
		probability = 1,
		response = "pbw_chaos_war_camp_intro_a",
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
				"chaos_war_camp_intro_a",
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
				"chaos_war_camp_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_chaos_war_camp_intro_b",
		probability = 1,
		response = "pbw_chaos_war_camp_intro_b",
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
				"chaos_war_camp_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"chaos_war_camp_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_chaos_war_camp_intro_c",
		probability = 1,
		response = "pbw_chaos_war_camp_intro_c",
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
				"chaos_war_camp_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"chaos_war_camp_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_c",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_arena_01",
		probability = 1,
		response = "pbw_level_chaos_war_camp_arena_01",
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
				"chaos_war_camp_arena",
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
				"level_chaos_war_camp_arena",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_arena",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_battering_ram_01",
		probability = 1,
		response = "pbw_level_chaos_war_camp_battering_ram_01",
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
				"chaos_war_camp_battering_ram",
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
				"level_chaos_war_camp_battering_ram",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_battering_ram",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_battering_ram_use_01",
		probability = 1,
		response = "pbw_level_chaos_war_camp_battering_ram_use_01",
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
				"chaos_war_camp_battering_ram_use",
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
				"level_chaos_war_camp_battering_ram_use",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_battering_ram_use",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_cabin",
		probability = 1,
		response = "pbw_level_chaos_war_camp_cabin",
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
				"chaos_war_camp_cabin",
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
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_chaos_war_camp_cabin",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_cabin",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_camp_view_01",
		probability = 1,
		response = "pbw_level_chaos_war_camp_camp_view_01",
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
				"chaos_war_camp_camp_view",
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
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_chaos_war_camp_camp_view",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_camp_view",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_dead_champion",
		probability = 1,
		response = "pbw_level_chaos_war_camp_dead_champion",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"chaos_war_camp_dead_champion",
				OP.TIMEDIFF,
				OP.GT,
				10,
			},
		},
		on_done = {
			{
				"user_memory",
				"chaos_war_camp_dead_champion",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_dead_champion_01",
		probability = 1,
		response = "pbw_level_chaos_war_camp_dead_champion_01",
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
				"chaos_war_camp_dead_champion",
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
				"level_chaos_war_camp_dead_champion",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_dead_champion",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_depart_01",
		probability = 1,
		response = "pbw_level_chaos_war_camp_depart_01",
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
				"chaos_war_camp_depart",
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
				"level_chaos_war_camp_depart",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_depart",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_ghost_town_state",
		probability = 1,
		response = "pbw_level_chaos_war_camp_ghost_town_state",
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
				"chaos_war_camp_ghost_town_state",
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
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_chaos_war_camp_ghost_town_state",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_ghost_town_state",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_islands_01",
		probability = 1,
		response = "pbw_level_chaos_war_camp_islands_01",
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
				"chaos_war_camp_islands",
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
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_chaos_war_camp_islands",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_islands",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_keep_fighting_01",
		probability = 1,
		response = "pbw_level_chaos_war_camp_keep_fighting_01",
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
				"chaos_war_camp_keep_fighting",
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
				"level_chaos_war_camp_keep_fighting",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_keep_fighting",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_live_in_swamp",
		probability = 1,
		response = "pbw_level_chaos_war_camp_live_in_swamp",
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
				"chaos_war_camp_live_in_swamp",
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
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_chaos_war_camp_live_in_swamp",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_live_in_swamp",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_outer_gate_01",
		probability = 1,
		response = "pbw_level_chaos_war_camp_outer_gate_01",
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
				"chaos_war_camp_outer_gate",
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
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_chaos_war_camp_outer_gate",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_outer_gate",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_ravine",
		probability = 1,
		response = "pbw_level_chaos_war_camp_ravine",
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
				"chaos_war_camp_ravine",
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
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_chaos_war_camp_ravine",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_ravine",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_success_01",
		probability = 1,
		response = "pbw_level_chaos_war_camp_success_01",
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
				"chaos_war_camp_success",
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
				"level_chaos_war_camp_success",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_success",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_tree",
		probability = 1,
		response = "pbw_level_chaos_war_camp_tree",
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
				"chaos_war_camp_tree",
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
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_chaos_war_camp_tree",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_tree",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_wall_01",
		probability = 1,
		response = "pbw_level_chaos_war_camp_wall_01",
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
				"chaos_war_camp_wall",
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
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_chaos_war_camp_wall",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_wall",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_which_way",
		probability = 1,
		response = "pbw_level_chaos_war_camp_which_way",
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
				"chaos_war_camp_which_way",
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
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_chaos_war_camp_which_way",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_which_way",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_chaos_war_surprise_01",
		probability = 1,
		response = "pbw_level_chaos_war_surprise_01",
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
				"chaos_war_surprise",
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
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_chaos_war_surprise",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_surprise",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_chaos_war_camp_challenge_reply_a = {
			category = "player_alerts_boss",
			database = "bright_wizard_warcamp",
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
				[1] = "pbw_chaos_war_camp_challenge_reply_a_01",
				[2] = "pbw_chaos_war_camp_challenge_reply_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_chaos_war_camp_challenge_reply_a_01",
				[2] = "pbw_chaos_war_camp_challenge_reply_a_02",
			},
			sound_events_duration = {
				[1] = 2.8155207633972,
				[2] = 2.4991874694824,
			},
		},
		pbw_chaos_war_camp_intro_a = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				[1] = "pbw_chaos_war_camp_intro_a_01",
				[2] = "pbw_chaos_war_camp_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_chaos_war_camp_intro_a_01",
				[2] = "pbw_chaos_war_camp_intro_a_02",
			},
			sound_events_duration = {
				[1] = 3.4534375667572,
				[2] = 3.8464584350586,
			},
		},
		pbw_chaos_war_camp_intro_b = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				[1] = "pbw_chaos_war_camp_intro_b_01",
				[2] = "pbw_chaos_war_camp_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_chaos_war_camp_intro_b_01",
				[2] = "pbw_chaos_war_camp_intro_b_02",
			},
			sound_events_duration = {
				[1] = 5.3362498283386,
				[2] = 2.7710626125336,
			},
		},
		pbw_chaos_war_camp_intro_c = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				[1] = "pbw_chaos_war_camp_intro_c_01",
				[2] = "pbw_chaos_war_camp_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_chaos_war_camp_intro_c_01",
				[2] = "pbw_chaos_war_camp_intro_c_02",
			},
			sound_events_duration = {
				[1] = 5.3787605762482,
				[2] = 2.9767498970032,
			},
		},
		pbw_level_chaos_war_camp_arena_01 = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_arena_01",
				"pbw_level_chaos_war_camp_arena_02",
				"pbw_level_chaos_war_camp_arena_03",
				"pbw_level_chaos_war_camp_arena_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_arena_01",
				"pbw_level_chaos_war_camp_arena_02",
				"pbw_level_chaos_war_camp_arena_03",
				"pbw_level_chaos_war_camp_arena_04",
			},
			sound_events_duration = {
				5.4471249580383,
				1.9747500419617,
				4.4695000648499,
				5.2272706031799,
			},
		},
		pbw_level_chaos_war_camp_battering_ram_01 = {
			category = "level_talk_must_play",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_battering_ram_01",
				"pbw_level_chaos_war_camp_battering_ram_02",
				"pbw_level_chaos_war_camp_battering_ram_03",
				"pbw_level_chaos_war_camp_battering_ram_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_battering_ram_01",
				"pbw_level_chaos_war_camp_battering_ram_02",
				"pbw_level_chaos_war_camp_battering_ram_03",
				"pbw_level_chaos_war_camp_battering_ram_04",
			},
			sound_events_duration = {
				2.2778332233429,
				3.0701665878296,
				3.5445415973663,
				3.683354139328,
			},
		},
		pbw_level_chaos_war_camp_battering_ram_use_01 = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_battering_ram_use_01",
				"pbw_level_chaos_war_camp_battering_ram_use_02",
				"pbw_level_chaos_war_camp_battering_ram_use_03",
				"pbw_level_chaos_war_camp_battering_ram_use_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_battering_ram_use_01",
				"pbw_level_chaos_war_camp_battering_ram_use_02",
				"pbw_level_chaos_war_camp_battering_ram_use_03",
				"pbw_level_chaos_war_camp_battering_ram_use_04",
			},
			sound_events_duration = {
				3.3551042079926,
				2.0651874542236,
				2.418687582016,
				2.7967290878296,
			},
		},
		pbw_level_chaos_war_camp_cabin = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_cabin_01",
				"pbw_level_chaos_war_camp_cabin_02",
				"pbw_level_chaos_war_camp_cabin_03",
				"pbw_level_chaos_war_camp_cabin_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_cabin_01",
				"pbw_level_chaos_war_camp_cabin_02",
				"pbw_level_chaos_war_camp_cabin_03",
				"pbw_level_chaos_war_camp_cabin_04",
			},
			sound_events_duration = {
				4.5075206756592,
				4.8966250419617,
				2.0161459445953,
				4.6859583854675,
			},
		},
		pbw_level_chaos_war_camp_camp_view_01 = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_camp_view_01",
				"pbw_level_chaos_war_camp_camp_view_02",
				"pbw_level_chaos_war_camp_camp_view_03",
				"pbw_level_chaos_war_camp_camp_view_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_camp_view_01",
				"pbw_level_chaos_war_camp_camp_view_02",
				"pbw_level_chaos_war_camp_camp_view_03",
				"pbw_level_chaos_war_camp_camp_view_04",
			},
			sound_events_duration = {
				4.4492292404175,
				2.9384167194366,
				4.5131669044495,
				2.5415000915527,
			},
		},
		pbw_level_chaos_war_camp_dead_champion = {
			category = "player_alerts_boss",
			database = "bright_wizard_warcamp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_level_chaos_war_camp_dead_champion_01",
				"pbw_level_chaos_war_camp_dead_champion_02",
				"pbw_level_chaos_war_camp_dead_champion_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_dead_champion_01",
				"pbw_level_chaos_war_camp_dead_champion_02",
				"pbw_level_chaos_war_camp_dead_champion_03",
			},
			sound_events_duration = {
				2.8590416908264,
				4.3844585418701,
				5.3462710380554,
			},
		},
		pbw_level_chaos_war_camp_dead_champion_01 = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_dead_champion_01",
				"pbw_level_chaos_war_camp_dead_champion_02",
				"pbw_level_chaos_war_camp_dead_champion_03",
				"pbw_level_chaos_war_camp_dead_champion_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_dead_champion_01",
				"pbw_level_chaos_war_camp_dead_champion_02",
				"pbw_level_chaos_war_camp_dead_champion_03",
				"pbw_level_chaos_war_camp_dead_champion_04",
			},
			sound_events_duration = {
				2.8590416908264,
				4.3844585418701,
				5.3462710380554,
				3.5911250114441,
			},
		},
		pbw_level_chaos_war_camp_depart_01 = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_depart_01",
				"pbw_level_chaos_war_camp_depart_02",
				"pbw_level_chaos_war_camp_depart_03",
				"pbw_level_chaos_war_camp_depart_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_depart_01",
				"pbw_level_chaos_war_camp_depart_02",
				"pbw_level_chaos_war_camp_depart_03",
				"pbw_level_chaos_war_camp_depart_04",
			},
			sound_events_duration = {
				2.0766665935516,
				3.9757082462311,
				2.3970000743866,
				4.6653542518616,
			},
		},
		pbw_level_chaos_war_camp_ghost_town_state = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_ghost_town_state_01",
				"pbw_level_chaos_war_camp_ghost_town_state_02",
				"pbw_level_chaos_war_camp_ghost_town_state_03",
				"pbw_level_chaos_war_camp_ghost_town_state_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_ghost_town_state_01",
				"pbw_level_chaos_war_camp_ghost_town_state_02",
				"pbw_level_chaos_war_camp_ghost_town_state_03",
				"pbw_level_chaos_war_camp_ghost_town_state_04",
			},
			sound_events_duration = {
				4.3880000114441,
				4.5003957748413,
				5.4198956489563,
				4.3127708435059,
			},
		},
		pbw_level_chaos_war_camp_islands_01 = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_neutral",
			},
			localization_strings = {
				"pbw_level_chaos_war_camp_islands_01",
				"pbw_level_chaos_war_camp_islands_02",
				"pbw_level_chaos_war_camp_islands_03",
				"pbw_level_chaos_war_camp_islands_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_islands_01",
				"pbw_level_chaos_war_camp_islands_02",
				"pbw_level_chaos_war_camp_islands_03",
				"pbw_level_chaos_war_camp_islands_04",
			},
			sound_events_duration = {
				4.5649790763855,
				4.6299376487732,
				2.4221251010895,
				2.1261041164398,
			},
		},
		pbw_level_chaos_war_camp_keep_fighting_01 = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_keep_fighting_01",
				"pbw_level_chaos_war_camp_keep_fighting_02",
				"pbw_level_chaos_war_camp_keep_fighting_03",
				"pbw_level_chaos_war_camp_keep_fighting_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_keep_fighting_01",
				"pbw_level_chaos_war_camp_keep_fighting_02",
				"pbw_level_chaos_war_camp_keep_fighting_03",
				"pbw_level_chaos_war_camp_keep_fighting_04",
			},
			sound_events_duration = {
				6.1513748168945,
				3.8312082290649,
				4.4977707862854,
				4.991229057312,
			},
		},
		pbw_level_chaos_war_camp_live_in_swamp = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_live_in_swamp_01",
				"pbw_level_chaos_war_camp_live_in_swamp_02",
				"pbw_level_chaos_war_camp_live_in_swamp_03",
				"pbw_level_chaos_war_camp_live_in_swamp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_live_in_swamp_01",
				"pbw_level_chaos_war_camp_live_in_swamp_02",
				"pbw_level_chaos_war_camp_live_in_swamp_03",
				"pbw_level_chaos_war_camp_live_in_swamp_04",
			},
			sound_events_duration = {
				3.589604139328,
				4.9180002212524,
				5.6458539962769,
				4.3270206451416,
			},
		},
		pbw_level_chaos_war_camp_outer_gate_01 = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_outer_gate_01",
				"pbw_level_chaos_war_camp_outer_gate_02",
				"pbw_level_chaos_war_camp_outer_gate_03",
				"pbw_level_chaos_war_camp_outer_gate_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_outer_gate_01",
				"pbw_level_chaos_war_camp_outer_gate_02",
				"pbw_level_chaos_war_camp_outer_gate_03",
				"pbw_level_chaos_war_camp_outer_gate_04",
			},
			sound_events_duration = {
				3.1246042251587,
				2.50816655159,
				5.5915622711182,
				2.5814583301544,
			},
		},
		pbw_level_chaos_war_camp_ravine = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_ravine_01",
				"pbw_level_chaos_war_camp_ravine_02",
				"pbw_level_chaos_war_camp_ravine_03",
				"pbw_level_chaos_war_camp_ravine_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_ravine_01",
				"pbw_level_chaos_war_camp_ravine_02",
				"pbw_level_chaos_war_camp_ravine_03",
				"pbw_level_chaos_war_camp_ravine_04",
			},
			sound_events_duration = {
				4.5408959388733,
				3.8839166164398,
				1.650229215622,
				3.3247082233429,
			},
		},
		pbw_level_chaos_war_camp_success_01 = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_success_01",
				"pbw_level_chaos_war_camp_success_02",
				"pbw_level_chaos_war_camp_success_03",
				"pbw_level_chaos_war_camp_success_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_success_01",
				"pbw_level_chaos_war_camp_success_02",
				"pbw_level_chaos_war_camp_success_03",
				"pbw_level_chaos_war_camp_success_04",
			},
			sound_events_duration = {
				4.1722707748413,
				5.0391459465027,
				3.8974375724792,
				5.2774167060852,
			},
		},
		pbw_level_chaos_war_camp_tree = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_tree_01",
				"pbw_level_chaos_war_camp_tree_02",
				"pbw_level_chaos_war_camp_tree_03",
				"pbw_level_chaos_war_camp_tree_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_tree_01",
				"pbw_level_chaos_war_camp_tree_02",
				"pbw_level_chaos_war_camp_tree_03",
				"pbw_level_chaos_war_camp_tree_04",
			},
			sound_events_duration = {
				5.024395942688,
				4.4871459007263,
				4.8664584159851,
				4.3928542137146,
			},
		},
		pbw_level_chaos_war_camp_wall_01 = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_wall_01",
				"pbw_level_chaos_war_camp_wall_02",
				"pbw_level_chaos_war_camp_wall_03",
				"pbw_level_chaos_war_camp_wall_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_wall_01",
				"pbw_level_chaos_war_camp_wall_02",
				"pbw_level_chaos_war_camp_wall_03",
				"pbw_level_chaos_war_camp_wall_04",
			},
			sound_events_duration = {
				5.9194169044495,
				3.037291765213,
				2.1322708129883,
				4.1092915534973,
			},
		},
		pbw_level_chaos_war_camp_which_way = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_camp_which_way_01",
				"pbw_level_chaos_war_camp_which_way_02",
				"pbw_level_chaos_war_camp_which_way_03",
				"pbw_level_chaos_war_camp_which_way_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_camp_which_way_01",
				"pbw_level_chaos_war_camp_which_way_02",
				"pbw_level_chaos_war_camp_which_way_03",
				"pbw_level_chaos_war_camp_which_way_04",
			},
			sound_events_duration = {
				3.7198958396912,
				3.9061458110809,
				2.6866042613983,
				3.6540832519531,
			},
		},
		pbw_level_chaos_war_surprise_01 = {
			category = "level_talk",
			database = "bright_wizard_warcamp",
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
				"pbw_level_chaos_war_surprise_01",
				"pbw_level_chaos_war_surprise_02",
				"pbw_level_chaos_war_surprise_03",
				"pbw_level_chaos_war_surprise_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_chaos_war_surprise_01",
				"pbw_level_chaos_war_surprise_02",
				"pbw_level_chaos_war_surprise_03",
				"pbw_level_chaos_war_surprise_04",
			},
			sound_events_duration = {
				4.5018749237061,
				3.9176249504089,
				4.6479997634888,
				4.0102500915527,
			},
		},
	})
end
