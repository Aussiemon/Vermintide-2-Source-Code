-- chunkname: @dialogues/generated/witch_hunter_dlc_reikwald_river.lua

return function ()
	define_rule({
		name = "pwh_reik2_beached_chaos_ship_a",
		probability = 1,
		response = "pwh_reik2_beached_chaos_ship_a",
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
				"reik2_beached_chaos_ship_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_beached_skaven_ship_a",
		probability = 1,
		response = "pwh_reik2_beached_skaven_ship_a",
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
				"reik2_beached_skaven_ship_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_blocked_in_a",
		probability = 1,
		response = "pwh_reik2_blocked_in_a",
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
				"reik2_blocked_in_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_blocked_in_b",
		probability = 1,
		response = "pwh_reik2_blocked_in_b",
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
				"reik2_blocked_in_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_blocked_in_complete_a",
		probability = 1,
		response = "pwh_reik2_blocked_in_complete_a",
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
				"reik2_blocked_in_complete_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_blocked_in_complete_b",
		probability = 1,
		response = "pwh_reik2_blocked_in_complete_b",
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
				"reik2_blocked_in_complete_b",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_board_ship_a",
		probability = 1,
		response = "pwh_reik2_board_ship_a",
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
				"reik2_board_ship",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_catapults_a",
		probability = 1,
		response = "pwh_reik2_catapults_a",
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
				"reik2_catapults",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_chaos_raiders_a",
		probability = 1,
		response = "pwh_reik2_chaos_raiders_a",
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
				"reik2_chaos_raiders",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_chaos_raiders_b",
		probability = 1,
		response = "pwh_reik2_chaos_raiders_b",
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
				"reik2_chaos_raiders_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_chaos_raiders_complete_a",
		probability = 1,
		response = "pwh_reik2_chaos_raiders_complete_a",
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
				"reik2_chaos_raiders_complete",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_grappled_01_a",
		probability = 1,
		response = "pwh_reik2_grappled_01_a",
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
				"reik2_grappled_01",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_grappled_01_b",
		probability = 1,
		response = "pwh_reik2_grappled_01_b",
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
				"reik2_grappled_01_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_grappled_02_a",
		probability = 1,
		response = "pwh_reik2_grappled_02_a",
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
				"reik2_grappled_02",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_grappled_02_b",
		probability = 1,
		response = "pwh_reik2_grappled_02_b",
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
				"reik2_grappled_02_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_light_beacon_b",
		probability = 1,
		response = "pwh_reik2_light_beacon_b",
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
				"reik2_light_beacon_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_more_grapples_a",
		probability = 1,
		response = "pwh_reik2_more_grapples_a",
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
				"reik2_more_grapples_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_player_has_found_sword_a",
		probability = 1,
		response = "pwh_reik2_player_has_found_sword_a",
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
				"reik2_player_has_found_sword_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				15,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_power_event_mid_b",
		probability = 1,
		response = "pwh_reik2_power_event_mid_b",
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
				"reik2_power_event_mid_b",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_power_event_started_a",
		probability = 1,
		response = "pwh_reik2_power_event_started_a",
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
				"reik2_power_event_started_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_side_path_cave_a",
		probability = 1,
		response = "pwh_reik2_side_path_cave_a",
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
				"reik2_side_path_cave",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_side_path_end_a",
		probability = 1,
		response = "pwh_reik2_side_path_end_a",
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
				"reik2_side_path_end",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_side_path_start_a",
		probability = 1,
		response = "pwh_reik2_side_path_start_a",
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
				"reik2_side_path_start_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_side_path_start_b",
		probability = 1,
		response = "pwh_reik2_side_path_start_b",
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
				"reik2_side_path_start_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_skaven_outpost_a",
		probability = 1,
		response = "pwh_reik2_skaven_outpost_a",
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
				"reik2_skaven_outpost_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_skaven_outpost_c",
		probability = 1,
		response = "pwh_reik2_skaven_outpost_c",
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
				"reik2_skaven_outpost_c",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_skaven_ship_a",
		probability = 1,
		response = "pwh_reik2_skaven_ship_a",
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
				"reik2_skaven_ship",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_start_banter_b",
		probability = 1,
		response = "pwh_reik2_start_banter_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"reik2_start_banter_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_start_search_a",
		probability = 1,
		response = "pwh_reik2_start_search_a",
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
				"reik2_start_search_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_survive_event_a",
		probability = 1,
		response = "pwh_reik2_survive_event_a",
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
				"reik2_survive_event_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_survive_event_b",
		probability = 1,
		response = "pwh_reik2_survive_event_b",
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
				"reik2_survive_event_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_torches_a",
		probability = 1,
		response = "pwh_reik2_torches_a",
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
				"reik2_torches_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"reik2_torches_a",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"reik2_torches_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_reik2_war_camp_approach_a",
		probability = 1,
		response = "pwh_reik2_war_camp_approach_a",
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
				"reik2_war_camp_approach_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_war_camp_event_empty_tent_01_a",
		probability = 1,
		response = "pwh_reik2_war_camp_event_empty_tent_01_a",
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
				"reik2_war_camp_event_empty_tent",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"reik2_war_camp_event_empty_tent",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"reik2_war_camp_event_empty_tent",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_reik2_war_camp_event_empty_tent_02_a",
		probability = 1,
		response = "pwh_reik2_war_camp_event_empty_tent_02_a",
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
				"reik2_war_camp_event_empty_tent",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"reik2_war_camp_event_empty_tent",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
		on_done = {
			{
				"faction_memory",
				"reik2_war_camp_event_empty_tent",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_reik2_war_camp_event_map_found_a",
		probability = 1,
		response = "pwh_reik2_war_camp_event_map_found_a",
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
				"reik2_war_camp_event_map_found",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				10,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_reik2_war_camp_event_map_found_b",
		probability = 1,
		response = "pwh_reik2_war_camp_event_map_found_b",
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
				"reik2_war_camp_event_map_found_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	add_dialogues({
		pwh_reik2_beached_chaos_ship_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_beached_chaos_ship_a_01",
				[2] = "pwh_reik2_beached_chaos_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_beached_chaos_ship_a_01",
				[2] = "pwh_reik2_beached_chaos_ship_a_02",
			},
			sound_events_duration = {
				[1] = 2.1184582710266,
				[2] = 3.6862499713898,
			},
		},
		pwh_reik2_beached_skaven_ship_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_beached_skaven_ship_a_01",
				[2] = "pwh_reik2_beached_skaven_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_beached_skaven_ship_a_01",
				[2] = "pwh_reik2_beached_skaven_ship_a_02",
			},
			sound_events_duration = {
				[1] = 2.256979227066,
				[2] = 3.0610001087189,
			},
		},
		pwh_reik2_blocked_in_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_blocked_in_a_01",
				[2] = "pwh_reik2_blocked_in_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_blocked_in_a_01",
				[2] = "pwh_reik2_blocked_in_a_02",
			},
			sound_events_duration = {
				[1] = 1.3707499504089,
				[2] = 1.5548750162125,
			},
		},
		pwh_reik2_blocked_in_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_blocked_in_b_01",
				[2] = "pwh_reik2_blocked_in_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_blocked_in_b_01",
				[2] = "pwh_reik2_blocked_in_b_02",
			},
			sound_events_duration = {
				[1] = 4.2190623283386,
				[2] = 5.3397083282471,
			},
		},
		pwh_reik2_blocked_in_complete_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_blocked_in_complete_a_01",
				[2] = "pwh_reik2_blocked_in_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_blocked_in_complete_a_01",
				[2] = "pwh_reik2_blocked_in_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.0159583091736,
				[2] = 4.0061459541321,
			},
		},
		pwh_reik2_blocked_in_complete_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_blocked_in_complete_b_01",
				[2] = "pwh_reik2_blocked_in_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_blocked_in_complete_b_01",
				[2] = "pwh_reik2_blocked_in_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.6113541126251,
				[2] = 2.5682709217072,
			},
		},
		pwh_reik2_board_ship_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_board_ship_a_01",
				[2] = "pwh_reik2_board_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_board_ship_a_01",
				[2] = "pwh_reik2_board_ship_a_02",
			},
			sound_events_duration = {
				[1] = 3.826250076294,
				[2] = 5.7373747825623,
			},
		},
		pwh_reik2_catapults_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_catapults_a_01",
				[2] = "pwh_reik2_catapults_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_catapults_a_01",
				[2] = "pwh_reik2_catapults_a_02",
			},
			sound_events_duration = {
				[1] = 4.5225625038147,
				[2] = 4.5027499198914,
			},
		},
		pwh_reik2_chaos_raiders_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_chaos_raiders_a_01",
				[2] = "pwh_reik2_chaos_raiders_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_chaos_raiders_a_01",
				[2] = "pwh_reik2_chaos_raiders_a_02",
			},
			sound_events_duration = {
				[1] = 1.3439583778381,
				[2] = 2.3126249313355,
			},
		},
		pwh_reik2_chaos_raiders_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_chaos_raiders_b_01",
				[2] = "pwh_reik2_chaos_raiders_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_chaos_raiders_b_01",
				[2] = "pwh_reik2_chaos_raiders_b_02",
			},
			sound_events_duration = {
				[1] = 2.6507916450501,
				[2] = 1.2948958873749,
			},
		},
		pwh_reik2_chaos_raiders_complete_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_chaos_raiders_complete_a_01",
				[2] = "pwh_reik2_chaos_raiders_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_chaos_raiders_complete_a_01",
				[2] = "pwh_reik2_chaos_raiders_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.4226250648499,
				[2] = 3.0579373836517,
			},
		},
		pwh_reik2_grappled_01_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_grappled_01_a_01",
				[2] = "pwh_reik2_grappled_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_grappled_01_a_01",
				[2] = "pwh_reik2_grappled_01_a_02",
			},
			sound_events_duration = {
				[1] = 1.4031666517258,
				[2] = 1.15725004673,
			},
		},
		pwh_reik2_grappled_01_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_grappled_01_b_01",
				[2] = "pwh_reik2_grappled_01_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_grappled_01_b_01",
				[2] = "pwh_reik2_grappled_01_b_02",
			},
			sound_events_duration = {
				[1] = 1.080958366394,
				[2] = 1.9678958654404,
			},
		},
		pwh_reik2_grappled_02_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_grappled_02_a_01",
				[2] = "pwh_reik2_grappled_02_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_grappled_02_a_01",
				[2] = "pwh_reik2_grappled_02_a_02",
			},
			sound_events_duration = {
				[1] = 2.3841874599457,
				[2] = 2.9370000362396,
			},
		},
		pwh_reik2_grappled_02_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_grappled_02_b_01",
				[2] = "pwh_reik2_grappled_02_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_grappled_02_b_01",
				[2] = "pwh_reik2_grappled_02_b_02",
			},
			sound_events_duration = {
				[1] = 2.2326667308807,
				[2] = 3.1363332271576,
			},
		},
		pwh_reik2_light_beacon_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_light_beacon_b_01",
				[2] = "pwh_reik2_light_beacon_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_light_beacon_b_01",
				[2] = "pwh_reik2_light_beacon_b_02",
			},
			sound_events_duration = {
				[1] = 0.82872915267944,
				[2] = 2.4710624217987,
			},
		},
		pwh_reik2_more_grapples_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_more_grapples_a_01",
				[2] = "pwh_reik2_more_grapples_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_more_grapples_a_01",
				[2] = "pwh_reik2_more_grapples_a_02",
			},
			sound_events_duration = {
				[1] = 1.7071458101273,
				[2] = 3.0105209350586,
			},
		},
		pwh_reik2_player_has_found_sword_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_player_has_found_sword_a_01",
				[2] = "pwh_reik2_player_has_found_sword_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_player_has_found_sword_a_01",
				[2] = "pwh_reik2_player_has_found_sword_a_02",
			},
			sound_events_duration = {
				[1] = 3.7553749084473,
				[2] = 1.7989375591278,
			},
		},
		pwh_reik2_power_event_mid_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_power_event_mid_b_01",
				[2] = "pwh_reik2_power_event_mid_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_power_event_mid_b_01",
				[2] = "pwh_reik2_power_event_mid_b_02",
			},
			sound_events_duration = {
				[1] = 1.5553958415985,
				[2] = 1.7624167203903,
			},
		},
		pwh_reik2_power_event_started_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_power_event_started_a_01",
				[2] = "pwh_reik2_power_event_started_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_power_event_started_a_01",
				[2] = "pwh_reik2_power_event_started_a_02",
			},
			sound_events_duration = {
				[1] = 4.0276460647583,
				[2] = 2.730708360672,
			},
		},
		pwh_reik2_side_path_cave_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_side_path_cave_a_01",
				[2] = "pwh_reik2_side_path_cave_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_side_path_cave_a_01",
				[2] = "pwh_reik2_side_path_cave_a_02",
			},
			sound_events_duration = {
				[1] = 2.892395734787,
				[2] = 3.6504166126251,
			},
		},
		pwh_reik2_side_path_end_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_side_path_end_a_01",
				[2] = "pwh_reik2_side_path_end_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_side_path_end_a_01",
				[2] = "pwh_reik2_side_path_end_a_02",
			},
			sound_events_duration = {
				[1] = 4.3380832672119,
				[2] = 3.4567,
			},
		},
		pwh_reik2_side_path_start_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_side_path_start_a_01",
			},
			sound_events = {
				[1] = "pwh_reik2_side_path_start_a_01",
			},
			sound_events_duration = {
				[1] = 2.9068748950958,
			},
		},
		pwh_reik2_side_path_start_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_side_path_start_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_side_path_start_b_01",
			},
			sound_events_duration = {
				[1] = 5.554208278656,
			},
		},
		pwh_reik2_skaven_outpost_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_skaven_outpost_a_01",
				[2] = "pwh_reik2_skaven_outpost_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_skaven_outpost_a_01",
				[2] = "pwh_reik2_skaven_outpost_a_02",
			},
			sound_events_duration = {
				[1] = 6.1356248855591,
				[2] = 6.560124874115,
			},
		},
		pwh_reik2_skaven_outpost_c = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_skaven_outpost_c_01",
				[2] = "pwh_reik2_skaven_outpost_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_skaven_outpost_c_01",
				[2] = "pwh_reik2_skaven_outpost_c_02",
			},
			sound_events_duration = {
				[1] = 4.1896247863769,
				[2] = 4.5501456260681,
			},
		},
		pwh_reik2_skaven_ship_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_skaven_ship_a_01",
				[2] = "pwh_reik2_skaven_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_skaven_ship_a_01",
				[2] = "pwh_reik2_skaven_ship_a_02",
			},
			sound_events_duration = {
				[1] = 1.8074375391007,
				[2] = 2.651750087738,
			},
		},
		pwh_reik2_start_banter_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_start_banter_b_01",
				[2] = "pwh_reik2_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_start_banter_b_01",
				[2] = "pwh_reik2_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 5.587354183197,
				[2] = 3.9145834445953,
			},
		},
		pwh_reik2_start_search_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_start_search_a_01",
				[2] = "pwh_reik2_start_search_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_start_search_a_01",
				[2] = "pwh_reik2_start_search_a_02",
			},
			sound_events_duration = {
				[1] = 4.6890001296997,
				[2] = 3.1967709064484,
			},
		},
		pwh_reik2_survive_event_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_survive_event_a_01",
				[2] = "pwh_reik2_survive_event_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_survive_event_a_01",
				[2] = "pwh_reik2_survive_event_a_02",
			},
			sound_events_duration = {
				[1] = 2.2712082862854,
				[2] = 3.5617499351502,
			},
		},
		pwh_reik2_survive_event_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_survive_event_b_01",
				[2] = "pwh_reik2_survive_event_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_survive_event_b_01",
				[2] = "pwh_reik2_survive_event_b_02",
			},
			sound_events_duration = {
				[1] = 4.4052290916443,
				[2] = 4.2028751373291,
			},
		},
		pwh_reik2_torches_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_torches_a_01",
				[2] = "pwh_reik2_torches_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_torches_a_01",
				[2] = "pwh_reik2_torches_a_02",
			},
			sound_events_duration = {
				[1] = 3.391583442688,
				[2] = 2.4085209369659,
			},
		},
		pwh_reik2_war_camp_approach_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_war_camp_approach_a_01",
				[2] = "pwh_reik2_war_camp_approach_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_war_camp_approach_a_01",
				[2] = "pwh_reik2_war_camp_approach_a_02",
			},
			sound_events_duration = {
				[1] = 5.8523125648499,
				[2] = 5.0828332901001,
			},
		},
		pwh_reik2_war_camp_event_empty_tent_01_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_war_camp_event_empty_tent_01_a_01",
				[2] = "pwh_reik2_war_camp_event_empty_tent_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_war_camp_event_empty_tent_01_a_01",
				[2] = "pwh_reik2_war_camp_event_empty_tent_01_a_02",
			},
			sound_events_duration = {
				[1] = 0.96722918748856,
				[2] = 1.2985416650772,
			},
		},
		pwh_reik2_war_camp_event_empty_tent_02_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_war_camp_event_empty_tent_02_a_01",
				[2] = "pwh_reik2_war_camp_event_empty_tent_02_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_war_camp_event_empty_tent_02_a_01",
				[2] = "pwh_reik2_war_camp_event_empty_tent_02_a_02",
			},
			sound_events_duration = {
				[1] = 1.8539583683014,
				[2] = 2.6943333148956,
			},
		},
		pwh_reik2_war_camp_event_map_found_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_war_camp_event_map_found_a_01",
				[2] = "pwh_reik2_war_camp_event_map_found_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_war_camp_event_map_found_a_01",
				[2] = "pwh_reik2_war_camp_event_map_found_a_02",
			},
			sound_events_duration = {
				[1] = 2.228437423706,
				[2] = 2.393354177475,
			},
		},
		pwh_reik2_war_camp_event_map_found_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_reikwald_river",
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
				[1] = "pwh_reik2_war_camp_event_map_found_b_01",
				[2] = "pwh_reik2_war_camp_event_map_found_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_reik2_war_camp_event_map_found_b_01",
				[2] = "pwh_reik2_war_camp_event_map_found_b_02",
			},
			sound_events_duration = {
				[1] = 2.8663125038147,
				[2] = 2.2295832633972,
			},
		},
	})
end
