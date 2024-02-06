﻿-- chunkname: @dialogues/generated/dwarf_ranger_dlc_dwarf_beacons.lua

return function ()
	define_rule({
		name = "pdr_dummy_memory_trigger_beacons",
		response = "pdr_dummy_memory_trigger_beacons",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dummy_memory_trigger_beacons",
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
				"dummy_memory_trigger_beacons",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dummy_memory_trigger_beacons",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_beacon_gas_c",
		response = "pdr_dwarf_beacons_beacon_gas_c",
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
				"dwarf_beacons_beacon_gas_b",
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
				"dwarf_beacons_beacon_gas_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_beacon_gas_d",
		response = "pdr_dwarf_beacons_beacon_gas_d",
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
				"dwarf_beacons_beacon_gas_c",
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
				"dwarf_beacons_beacon_gas_d",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_d",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_beacon_lit",
		response = "pdr_dwarf_beacons_beacon_lit",
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
				"dwarf_beacons_beacon_lit",
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
				"dwarf_beacons_beacon_lit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_beacon_lit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_bridge_down",
		response = "pdr_dwarf_beacons_bridge_down",
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
				"dwarf_beacons_bridge_down",
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
				"dwarf_beacons_bridge_down",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_bridge_down",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_head_for_heights_a",
		response = "pdr_dwarf_beacons_head_for_heights_a",
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
				"dwarf_beacons_head_for_heights_a",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_beacons_head_for_heights_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_head_for_heights_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_head_for_heights_b",
		response = "pdr_dwarf_beacons_head_for_heights_b",
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
				"dwarf_beacons_head_for_heights_a",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_beacons_head_for_heights_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_head_for_heights_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_long_walk_b",
		response = "pdr_dwarf_beacons_long_walk_b",
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
				"dwarf_beacons_long_walk_a",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_beacons_long_walk_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_long_walk_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_not_far",
		response = "pdr_dwarf_beacons_not_far",
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
				"dwarf_beacons_not_far",
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
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"dwarf_beacons_not_far",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_not_far",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_outpost_empty_a",
		response = "pdr_dwarf_beacons_outpost_empty_a",
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
				"dwarf_beacons_outpost_empty_a",
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
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"dwarf_beacons_outpost_empty_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_outpost_empty_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_over_the_mountain_01_a",
		response = "pdr_dwarf_beacons_over_the_mountain_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"enemies_close",
				OP.LT,
				1,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				20,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				80,
			},
			{
				"faction_memory",
				"dummy_memory_trigger_beacons",
				OP.NOT,
				"dummy_memory_trigger_beacons",
			},
			{
				"faction_memory",
				"dwarf_beacons_not_far",
				OP.NOT,
				"dwarf_beacons_not_far",
			},
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_e",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_over_the_mountain_02_a",
		response = "pdr_dwarf_beacons_over_the_mountain_02_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"enemies_close",
				OP.LT,
				1,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				20,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				80,
			},
			{
				"faction_memory",
				"dummy_memory_trigger_beacons",
				OP.NOT,
				"dummy_memory_trigger_beacons",
			},
			{
				"faction_memory",
				"dwarf_beacons_not_far",
				OP.NOT,
				"dwarf_beacons_not_far",
			},
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_d",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_over_the_mountain_03_a",
		response = "pdr_dwarf_beacons_over_the_mountain_03_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"enemies_close",
				OP.LT,
				1,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				20,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				80,
			},
			{
				"faction_memory",
				"dummy_memory_trigger_beacons",
				OP.NOT,
				"dummy_memory_trigger_beacons",
			},
			{
				"faction_memory",
				"dwarf_beacons_not_far",
				OP.NOT,
				"dwarf_beacons_not_far",
			},
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_d",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_over_the_mountain_04_a",
		response = "pdr_dwarf_beacons_over_the_mountain_04_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger",
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
				"user_context",
				"enemies_close",
				OP.LT,
				1,
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				20,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				80,
			},
			{
				"faction_memory",
				"dummy_memory_trigger_beacons",
				OP.NOT,
				"dummy_memory_trigger_beacons",
			},
			{
				"faction_memory",
				"dwarf_beacons_not_far",
				OP.NOT,
				"dwarf_beacons_not_far",
			},
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_d",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_over_the_mountain_d",
		response = "pdr_dwarf_beacons_over_the_mountain_d",
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
				"dwarf_beacons_over_the_mountain_c",
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
				"user_context",
				"enemies_close",
				OP.LT,
				3,
			},
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain_d",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain_d",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_skaven_retreat_a",
		response = "pdr_dwarf_beacons_skaven_retreat_a",
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
				"dwarf_beacons_skaven_retreat_a",
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
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"dwarf_beacons_skaven_retreat_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_skaven_retreat_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_skaven_retreat_b",
		response = "pdr_dwarf_beacons_skaven_retreat_b",
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
				"dwarf_beacons_skaven_retreat_a",
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
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				10,
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0,
			},
			{
				"faction_memory",
				"dwarf_beacons_skaven_retreat_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_skaven_retreat_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_start_banter_a",
		response = "pdr_dwarf_beacons_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_beacons_start_banter_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"dwarf_beacons_start_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_start_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_dwarf_beacons_start_banter_b",
		response = "pdr_dwarf_beacons_start_banter_b",
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
				"dwarf_beacons_start_banter_a",
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
		name = "pdr_dwarf_beacons_start_banter_c",
		response = "pdr_dwarf_beacons_start_banter_c",
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
				"dwarf_beacons_start_banter_b",
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
		name = "pdr_dwarf_beacons_victory_b",
		response = "pdr_dwarf_beacons_victory_b",
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
				"dwarf_beacons_victory_b",
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
				"dwarf_beacons_victory_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_victory_b",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pdr_dummy_memory_trigger_beacons = {
			category = "special_occasion",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pdr_dwarf_beacons_beacon_gas_c = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				"pdr_dwarf_beacons_beacon_gas_c_01",
				"pdr_dwarf_beacons_beacon_gas_c_02",
				"pdr_dwarf_beacons_beacon_gas_c_03",
				"pdr_dwarf_beacons_beacon_gas_c_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_beacon_gas_c_01",
				"pdr_dwarf_beacons_beacon_gas_c_02",
				"pdr_dwarf_beacons_beacon_gas_c_03",
				"pdr_dwarf_beacons_beacon_gas_c_04",
			},
			sound_events_duration = {
				1.6379791498184,
				4.2929792404175,
				3.39097905159,
				2.9819791316986,
			},
		},
		pdr_dwarf_beacons_beacon_gas_d = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				"pdr_dwarf_beacons_beacon_gas_d_01",
				"pdr_dwarf_beacons_beacon_gas_d_02",
				"pdr_dwarf_beacons_beacon_gas_d_03",
				"pdr_dwarf_beacons_beacon_gas_d_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_beacon_gas_d_01",
				"pdr_dwarf_beacons_beacon_gas_d_02",
				"pdr_dwarf_beacons_beacon_gas_d_03",
				"pdr_dwarf_beacons_beacon_gas_d_04",
			},
			sound_events_duration = {
				4.2529792785644,
				2.9459791183472,
				2.9709792137146,
				3.4169790744781,
			},
		},
		pdr_dwarf_beacons_beacon_lit = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				"pdr_dwarf_beacons_beacon_lit_01",
				"pdr_dwarf_beacons_beacon_lit_02",
				"pdr_dwarf_beacons_beacon_lit_03",
				"pdr_dwarf_beacons_beacon_lit_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_beacon_lit_01",
				"pdr_dwarf_beacons_beacon_lit_02",
				"pdr_dwarf_beacons_beacon_lit_03",
				"pdr_dwarf_beacons_beacon_lit_04",
			},
			sound_events_duration = {
				3.3499791622162,
				2.8399999141693,
				2.506979227066,
				5.7389793395996,
			},
		},
		pdr_dwarf_beacons_bridge_down = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				"pdr_dwarf_beacons_bridge_down_01",
				"pdr_dwarf_beacons_bridge_down_02",
				"pdr_dwarf_beacons_bridge_down_03",
				"pdr_dwarf_beacons_bridge_down_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_bridge_down_01",
				"pdr_dwarf_beacons_bridge_down_02",
				"pdr_dwarf_beacons_bridge_down_03",
				"pdr_dwarf_beacons_bridge_down_04",
			},
			sound_events_duration = {
				1.6859791278839,
				2.0869791507721,
				1.4639791250229,
				2.1529791355133,
			},
		},
		pdr_dwarf_beacons_head_for_heights_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				[1] = "pdr_dwarf_beacons_head_for_heights_a_01",
				[2] = "pdr_dwarf_beacons_head_for_heights_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dwarf_beacons_head_for_heights_a_01",
				[2] = "pdr_dwarf_beacons_head_for_heights_a_02",
			},
			sound_events_duration = {
				[1] = 1.7339792251587,
				[2] = 1.3869792222977,
			},
		},
		pdr_dwarf_beacons_head_for_heights_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				[1] = "pdr_dwarf_beacons_head_for_heights_b_01",
				[2] = "pdr_dwarf_beacons_head_for_heights_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dwarf_beacons_head_for_heights_b_01",
				[2] = "pdr_dwarf_beacons_head_for_heights_b_02",
			},
			sound_events_duration = {
				[1] = 2.477979183197,
				[2] = 2.8399791717529,
			},
		},
		pdr_dwarf_beacons_long_walk_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				"pdr_dwarf_beacons_long_walk_b_01",
				"pdr_dwarf_beacons_long_walk_b_02",
				"pdr_dwarf_beacons_long_walk_b_03",
				"pdr_dwarf_beacons_long_walk_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_long_walk_b_01",
				"pdr_dwarf_beacons_long_walk_b_02",
				"pdr_dwarf_beacons_long_walk_b_03",
				"pdr_dwarf_beacons_long_walk_b_04",
			},
			sound_events_duration = {
				1.5399792194366,
				2.5320000648499,
				2.209979057312,
				2.0909790992737,
			},
		},
		pdr_dwarf_beacons_not_far = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				"pdr_dwarf_beacons_not_far_01",
				"pdr_dwarf_beacons_not_far_02",
				"pdr_dwarf_beacons_not_far_03",
				"pdr_dwarf_beacons_not_far_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_not_far_01",
				"pdr_dwarf_beacons_not_far_02",
				"pdr_dwarf_beacons_not_far_03",
				"pdr_dwarf_beacons_not_far_04",
			},
			sound_events_duration = {
				2.0929999351502,
				2.3179790973663,
				1.9509791135788,
				4.3449792861939,
			},
		},
		pdr_dwarf_beacons_outpost_empty_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				"pdr_dwarf_beacons_outpost_empty_a_01",
				"pdr_dwarf_beacons_outpost_empty_a_02",
				"pdr_dwarf_beacons_outpost_empty_a_03",
				"pdr_dwarf_beacons_outpost_empty_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_outpost_empty_a_01",
				"pdr_dwarf_beacons_outpost_empty_a_02",
				"pdr_dwarf_beacons_outpost_empty_a_03",
				"pdr_dwarf_beacons_outpost_empty_a_04",
			},
			sound_events_duration = {
				3.1769790649414,
				3.7369792461395,
				2.1519792079926,
				2.3709790706634,
			},
		},
		pdr_dwarf_beacons_over_the_mountain_01_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				[1] = "pdr_dwarf_beacons_over_the_mountain_01_a_01",
			},
			sound_events = {
				[1] = "pdr_dwarf_beacons_over_the_mountain_01_a_01",
			},
			sound_events_duration = {
				[1] = 2.0219790935516,
			},
		},
		pdr_dwarf_beacons_over_the_mountain_02_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				[1] = "pdr_dwarf_beacons_over_the_mountain_02_a_01",
			},
			sound_events = {
				[1] = "pdr_dwarf_beacons_over_the_mountain_02_a_01",
			},
			sound_events_duration = {
				[1] = 1.9259791374207,
			},
		},
		pdr_dwarf_beacons_over_the_mountain_03_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				[1] = "pdr_dwarf_beacons_over_the_mountain_03_a_01",
			},
			sound_events = {
				[1] = "pdr_dwarf_beacons_over_the_mountain_03_a_01",
			},
			sound_events_duration = {
				[1] = 2.2269999980927,
			},
		},
		pdr_dwarf_beacons_over_the_mountain_04_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				[1] = "pdr_dwarf_beacons_over_the_mountain_04_a_01",
			},
			sound_events = {
				[1] = "pdr_dwarf_beacons_over_the_mountain_04_a_01",
			},
			sound_events_duration = {
				[1] = 2.7509999275208,
			},
		},
		pdr_dwarf_beacons_over_the_mountain_d = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				"pdr_dwarf_beacons_over_the_mountain_d_01",
				"pdr_dwarf_beacons_over_the_mountain_d_02",
				"pdr_dwarf_beacons_over_the_mountain_d_03",
				"pdr_dwarf_beacons_over_the_mountain_d_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_over_the_mountain_d_01",
				"pdr_dwarf_beacons_over_the_mountain_d_02",
				"pdr_dwarf_beacons_over_the_mountain_d_03",
				"pdr_dwarf_beacons_over_the_mountain_d_04",
			},
			sound_events_duration = {
				2.9519791603088,
				2.7079792022705,
				2.1129999160767,
				2.1219792366028,
			},
		},
		pdr_dwarf_beacons_skaven_retreat_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				"pdr_dwarf_beacons_skaven_retreat_a_01",
				"pdr_dwarf_beacons_skaven_retreat_a_02",
				"pdr_dwarf_beacons_skaven_retreat_a_03",
				"pdr_dwarf_beacons_skaven_retreat_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_skaven_retreat_a_01",
				"pdr_dwarf_beacons_skaven_retreat_a_02",
				"pdr_dwarf_beacons_skaven_retreat_a_03",
				"pdr_dwarf_beacons_skaven_retreat_a_04",
			},
			sound_events_duration = {
				1.819000005722,
				2.1849792003632,
				3.7789790630341,
				3.3019790649414,
			},
		},
		pdr_dwarf_beacons_skaven_retreat_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				"pdr_dwarf_beacons_skaven_retreat_b_01",
				"pdr_dwarf_beacons_skaven_retreat_b_02",
				"pdr_dwarf_beacons_skaven_retreat_b_03",
				"pdr_dwarf_beacons_skaven_retreat_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_skaven_retreat_b_01",
				"pdr_dwarf_beacons_skaven_retreat_b_02",
				"pdr_dwarf_beacons_skaven_retreat_b_03",
				"pdr_dwarf_beacons_skaven_retreat_b_04",
			},
			sound_events_duration = {
				9.0169792175293,
				4.8489789962769,
				6.2369790077209,
				8.0169792175293,
			},
		},
		pdr_dwarf_beacons_start_banter_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				[1] = "pdr_dwarf_beacons_start_banter_a_01",
				[2] = "pdr_dwarf_beacons_start_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dwarf_beacons_start_banter_a_01",
				[2] = "pdr_dwarf_beacons_start_banter_a_02",
			},
			sound_events_duration = {
				[1] = 5.120979309082,
				[2] = 3.1809792518616,
			},
		},
		pdr_dwarf_beacons_start_banter_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				[1] = "pdr_dwarf_beacons_start_banter_b_01",
				[2] = "pdr_dwarf_beacons_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dwarf_beacons_start_banter_b_01",
				[2] = "pdr_dwarf_beacons_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 2.7189791202545,
				[2] = 3.5589792728424,
			},
		},
		pdr_dwarf_beacons_start_banter_c = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				[1] = "pdr_dwarf_beacons_start_banter_c_01",
				[2] = "pdr_dwarf_beacons_start_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_dwarf_beacons_start_banter_c_01",
				[2] = "pdr_dwarf_beacons_start_banter_c_02",
			},
			sound_events_duration = {
				[1] = 3.294979095459,
				[2] = 4.1199793815613,
			},
		},
		pdr_dwarf_beacons_victory_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_dwarf_beacons",
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
				"pdr_dwarf_beacons_victory_b_01",
				"pdr_dwarf_beacons_victory_b_02",
				"pdr_dwarf_beacons_victory_b_03",
				"pdr_dwarf_beacons_victory_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_dwarf_beacons_victory_b_01",
				"pdr_dwarf_beacons_victory_b_02",
				"pdr_dwarf_beacons_victory_b_03",
				"pdr_dwarf_beacons_victory_b_04",
			},
			sound_events_duration = {
				3.566999912262,
				3.3889999389648,
				5.0089793205261,
				3.4219791889191,
			},
		},
	})
end
