-- chunkname: @dialogues/generated/bright_wizard_dlc_reikwald_river.lua

return function ()
	define_rule({
		name = "pbw_reik2_beached_chaos_ship_a",
		probability = 1,
		response = "pbw_reik2_beached_chaos_ship_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_beached_skaven_ship_a",
		probability = 1,
		response = "pbw_reik2_beached_skaven_ship_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_blocked_in_a",
		probability = 1,
		response = "pbw_reik2_blocked_in_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_blocked_in_b",
		probability = 1,
		response = "pbw_reik2_blocked_in_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_blocked_in_complete_a",
		probability = 1,
		response = "pbw_reik2_blocked_in_complete_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_blocked_in_complete_b",
		probability = 1,
		response = "pbw_reik2_blocked_in_complete_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_board_ship_a",
		probability = 1,
		response = "pbw_reik2_board_ship_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_catapults_a",
		probability = 1,
		response = "pbw_reik2_catapults_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_chaos_raiders_a",
		probability = 1,
		response = "pbw_reik2_chaos_raiders_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_chaos_raiders_b",
		probability = 1,
		response = "pbw_reik2_chaos_raiders_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_chaos_raiders_complete_a",
		probability = 1,
		response = "pbw_reik2_chaos_raiders_complete_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_grappled_01_a",
		probability = 1,
		response = "pbw_reik2_grappled_01_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_grappled_01_b",
		probability = 1,
		response = "pbw_reik2_grappled_01_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_grappled_02_a",
		probability = 1,
		response = "pbw_reik2_grappled_02_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_grappled_02_b",
		probability = 1,
		response = "pbw_reik2_grappled_02_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_light_beacon_b",
		probability = 1,
		response = "pbw_reik2_light_beacon_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_more_grapples_a",
		probability = 1,
		response = "pbw_reik2_more_grapples_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_player_has_found_sword_a",
		probability = 1,
		response = "pbw_reik2_player_has_found_sword_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_power_event_mid_b",
		probability = 1,
		response = "pbw_reik2_power_event_mid_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_power_event_started_a",
		probability = 1,
		response = "pbw_reik2_power_event_started_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_side_path_cave_a",
		probability = 1,
		response = "pbw_reik2_side_path_cave_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_side_path_end_a",
		probability = 1,
		response = "pbw_reik2_side_path_end_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_side_path_start_a",
		probability = 1,
		response = "pbw_reik2_side_path_start_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_side_path_start_b",
		probability = 1,
		response = "pbw_reik2_side_path_start_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_skaven_outpost_a",
		probability = 1,
		response = "pbw_reik2_skaven_outpost_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_skaven_outpost_c",
		probability = 1,
		response = "pbw_reik2_skaven_outpost_c",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_skaven_ship_a",
		probability = 1,
		response = "pbw_reik2_skaven_ship_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_start_banter_b",
		probability = 1,
		response = "pbw_reik2_start_banter_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_start_search_a",
		probability = 1,
		response = "pbw_reik2_start_search_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_survive_event_a",
		probability = 1,
		response = "pbw_reik2_survive_event_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_survive_event_b",
		probability = 1,
		response = "pbw_reik2_survive_event_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_torches_a",
		probability = 1,
		response = "pbw_reik2_torches_a",
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
				"bright_wizard",
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
		name = "pbw_reik2_war_camp_approach_a",
		probability = 1,
		response = "pbw_reik2_war_camp_approach_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_war_camp_event_empty_tent_01_a",
		probability = 1,
		response = "pbw_reik2_war_camp_event_empty_tent_01_a",
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
				"bright_wizard",
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
		name = "pbw_reik2_war_camp_event_empty_tent_02_a",
		probability = 1,
		response = "pbw_reik2_war_camp_event_empty_tent_02_a",
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
				"bright_wizard",
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
		name = "pbw_reik2_war_camp_event_map_found_a",
		probability = 1,
		response = "pbw_reik2_war_camp_event_map_found_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_reik2_war_camp_event_map_found_b",
		probability = 1,
		response = "pbw_reik2_war_camp_event_map_found_b",
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
				"bright_wizard",
			},
		},
	})
	add_dialogues({
		pbw_reik2_beached_chaos_ship_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_beached_chaos_ship_a_01",
				[2] = "pbw_reik2_beached_chaos_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_beached_chaos_ship_a_01",
				[2] = "pbw_reik2_beached_chaos_ship_a_02",
			},
			sound_events_duration = {
				[1] = 3.1829166412353,
				[2] = 2.9696457386017,
			},
		},
		pbw_reik2_beached_skaven_ship_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_beached_skaven_ship_a_01",
				[2] = "pbw_reik2_beached_skaven_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_beached_skaven_ship_a_01",
				[2] = "pbw_reik2_beached_skaven_ship_a_02",
			},
			sound_events_duration = {
				[1] = 4.1389164924622,
				[2] = 2.1290624141693,
			},
		},
		pbw_reik2_blocked_in_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_blocked_in_a_01",
				[2] = "pbw_reik2_blocked_in_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_blocked_in_a_01",
				[2] = "pbw_reik2_blocked_in_a_02",
			},
			sound_events_duration = {
				[1] = 2.2447500228882,
				[2] = 2.4489374160767,
			},
		},
		pbw_reik2_blocked_in_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_blocked_in_b_01",
				[2] = "pbw_reik2_blocked_in_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_blocked_in_b_01",
				[2] = "pbw_reik2_blocked_in_b_02",
			},
			sound_events_duration = {
				[1] = 3.7686250209808,
				[2] = 3.30433344841,
			},
		},
		pbw_reik2_blocked_in_complete_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_blocked_in_complete_a_01",
				[2] = "pbw_reik2_blocked_in_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_blocked_in_complete_a_01",
				[2] = "pbw_reik2_blocked_in_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.6188125610352,
				[2] = 1.9824792146683,
			},
		},
		pbw_reik2_blocked_in_complete_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_blocked_in_complete_b_01",
				[2] = "pbw_reik2_blocked_in_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_blocked_in_complete_b_01",
				[2] = "pbw_reik2_blocked_in_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.5657291412353,
				[2] = 2.3965208530426,
			},
		},
		pbw_reik2_board_ship_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_board_ship_a_01",
				[2] = "pbw_reik2_board_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_board_ship_a_01",
				[2] = "pbw_reik2_board_ship_a_02",
			},
			sound_events_duration = {
				[1] = 1.9390208721161,
				[2] = 1.8753541707993,
			},
		},
		pbw_reik2_catapults_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_catapults_a_01",
				[2] = "pbw_reik2_catapults_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_catapults_a_01",
				[2] = "pbw_reik2_catapults_a_02",
			},
			sound_events_duration = {
				[1] = 4.2541041374206,
				[2] = 3.7124373912811,
			},
		},
		pbw_reik2_chaos_raiders_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_chaos_raiders_a_01",
				[2] = "pbw_reik2_chaos_raiders_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_chaos_raiders_a_01",
				[2] = "pbw_reik2_chaos_raiders_a_02",
			},
			sound_events_duration = {
				[1] = 1.718333363533,
				[2] = 2.0655832290649,
			},
		},
		pbw_reik2_chaos_raiders_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_chaos_raiders_b_01",
				[2] = "pbw_reik2_chaos_raiders_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_chaos_raiders_b_01",
				[2] = "pbw_reik2_chaos_raiders_b_02",
			},
			sound_events_duration = {
				[1] = 1.313916683197,
				[2] = 1.3018958568573,
			},
		},
		pbw_reik2_chaos_raiders_complete_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_chaos_raiders_complete_a_01",
				[2] = "pbw_reik2_chaos_raiders_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_chaos_raiders_complete_a_01",
				[2] = "pbw_reik2_chaos_raiders_complete_a_02",
			},
			sound_events_duration = {
				[1] = 1.4370000362396,
				[2] = 1.1312500238419,
			},
		},
		pbw_reik2_grappled_01_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_grappled_01_a_01",
				[2] = "pbw_reik2_grappled_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_grappled_01_a_01",
				[2] = "pbw_reik2_grappled_01_a_02",
			},
			sound_events_duration = {
				[1] = 1.3312292098999,
				[2] = 1.1939582824707,
			},
		},
		pbw_reik2_grappled_01_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_grappled_01_b_01",
				[2] = "pbw_reik2_grappled_01_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_grappled_01_b_01",
				[2] = "pbw_reik2_grappled_01_b_02",
			},
			sound_events_duration = {
				[1] = 1.2469999790192,
				[2] = 2.2381041049957,
			},
		},
		pbw_reik2_grappled_02_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_grappled_02_a_01",
				[2] = "pbw_reik2_grappled_02_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_grappled_02_a_01",
				[2] = "pbw_reik2_grappled_02_a_02",
			},
			sound_events_duration = {
				[1] = 2.4584999084473,
				[2] = 2.9127292633057,
			},
		},
		pbw_reik2_grappled_02_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_grappled_02_b_01",
				[2] = "pbw_reik2_grappled_02_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_grappled_02_b_01",
				[2] = "pbw_reik2_grappled_02_b_02",
			},
			sound_events_duration = {
				[1] = 3.1101665496826,
				[2] = 3.4184792041779,
			},
		},
		pbw_reik2_light_beacon_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_light_beacon_b_01",
				[2] = "pbw_reik2_light_beacon_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_light_beacon_b_01",
				[2] = "pbw_reik2_light_beacon_b_02",
			},
			sound_events_duration = {
				[1] = 4.0806460380554,
				[2] = 1.8536666631699,
			},
		},
		pbw_reik2_more_grapples_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_more_grapples_a_01",
				[2] = "pbw_reik2_more_grapples_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_more_grapples_a_01",
				[2] = "pbw_reik2_more_grapples_a_02",
			},
			sound_events_duration = {
				[1] = 1.6744166612625,
				[2] = 1.5613958835602,
			},
		},
		pbw_reik2_player_has_found_sword_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_player_has_found_sword_a_01",
				[2] = "pbw_reik2_player_has_found_sword_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_player_has_found_sword_a_01",
				[2] = "pbw_reik2_player_has_found_sword_a_02",
			},
			sound_events_duration = {
				[1] = 2.9164791107178,
				[2] = 3.1402082443237,
			},
		},
		pbw_reik2_power_event_mid_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_power_event_mid_b_01",
				[2] = "pbw_reik2_power_event_mid_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_power_event_mid_b_01",
				[2] = "pbw_reik2_power_event_mid_b_02",
			},
			sound_events_duration = {
				[1] = 2.1630208492279,
				[2] = 2.4102709293366,
			},
		},
		pbw_reik2_power_event_started_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_power_event_started_a_01",
				[2] = "pbw_reik2_power_event_started_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_power_event_started_a_01",
				[2] = "pbw_reik2_power_event_started_a_02",
			},
			sound_events_duration = {
				[1] = 2.1579792499542,
				[2] = 1.8604375123978,
			},
		},
		pbw_reik2_side_path_cave_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_side_path_cave_a_01",
				[2] = "pbw_reik2_side_path_cave_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_side_path_cave_a_01",
				[2] = "pbw_reik2_side_path_cave_a_02",
			},
			sound_events_duration = {
				[1] = 2.7706458568573,
				[2] = 3.4087707996368,
			},
		},
		pbw_reik2_side_path_end_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_side_path_end_a_01",
				[2] = "pbw_reik2_side_path_end_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_side_path_end_a_01",
				[2] = "pbw_reik2_side_path_end_a_02",
			},
			sound_events_duration = {
				[1] = 2.4576666355133,
				[2] = 3.4567,
			},
		},
		pbw_reik2_side_path_start_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_side_path_start_a_01",
			},
			sound_events = {
				[1] = "pbw_reik2_side_path_start_a_01",
			},
			sound_events_duration = {
				[1] = 3.2529582977295,
			},
		},
		pbw_reik2_side_path_start_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_side_path_start_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_side_path_start_b_01",
			},
			sound_events_duration = {
				[1] = 2.5437917709351,
			},
		},
		pbw_reik2_skaven_outpost_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_skaven_outpost_a_01",
				[2] = "pbw_reik2_skaven_outpost_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_skaven_outpost_a_01",
				[2] = "pbw_reik2_skaven_outpost_a_02",
			},
			sound_events_duration = {
				[1] = 4.3416042327881,
				[2] = 3.5681667327881,
			},
		},
		pbw_reik2_skaven_outpost_c = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_skaven_outpost_c_01",
				[2] = "pbw_reik2_skaven_outpost_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_skaven_outpost_c_01",
				[2] = "pbw_reik2_skaven_outpost_c_02",
			},
			sound_events_duration = {
				[1] = 3.7991874217987,
				[2] = 3.6746249198914,
			},
		},
		pbw_reik2_skaven_ship_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_skaven_ship_a_01",
				[2] = "pbw_reik2_skaven_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_skaven_ship_a_01",
				[2] = "pbw_reik2_skaven_ship_a_02",
			},
			sound_events_duration = {
				[1] = 1.2372499704361,
				[2] = 1.3157917261124,
			},
		},
		pbw_reik2_start_banter_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_start_banter_b_01",
				[2] = "pbw_reik2_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_start_banter_b_01",
				[2] = "pbw_reik2_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 3.0842707157135,
				[2] = 5.005895614624,
			},
		},
		pbw_reik2_start_search_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_start_search_a_01",
				[2] = "pbw_reik2_start_search_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_start_search_a_01",
				[2] = "pbw_reik2_start_search_a_02",
			},
			sound_events_duration = {
				[1] = 4.991687297821,
				[2] = 2.0018124580383,
			},
		},
		pbw_reik2_survive_event_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_survive_event_a_01",
				[2] = "pbw_reik2_survive_event_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_survive_event_a_01",
				[2] = "pbw_reik2_survive_event_a_02",
			},
			sound_events_duration = {
				[1] = 3.0713958740234,
				[2] = 2.3386459350586,
			},
		},
		pbw_reik2_survive_event_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_survive_event_b_01",
				[2] = "pbw_reik2_survive_event_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_survive_event_b_01",
				[2] = "pbw_reik2_survive_event_b_02",
			},
			sound_events_duration = {
				[1] = 4.2234582901001,
				[2] = 2.3828332424164,
			},
		},
		pbw_reik2_torches_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_torches_a_01",
				[2] = "pbw_reik2_torches_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_torches_a_01",
				[2] = "pbw_reik2_torches_a_02",
			},
			sound_events_duration = {
				[1] = 4.2164583206177,
				[2] = 2.2378125190735,
			},
		},
		pbw_reik2_war_camp_approach_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_war_camp_approach_a_01",
				[2] = "pbw_reik2_war_camp_approach_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_war_camp_approach_a_01",
				[2] = "pbw_reik2_war_camp_approach_a_02",
			},
			sound_events_duration = {
				[1] = 3.7859375476837,
				[2] = 3.6121873855591,
			},
		},
		pbw_reik2_war_camp_event_empty_tent_01_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_war_camp_event_empty_tent_01_a_01",
				[2] = "pbw_reik2_war_camp_event_empty_tent_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_war_camp_event_empty_tent_01_a_01",
				[2] = "pbw_reik2_war_camp_event_empty_tent_01_a_02",
			},
			sound_events_duration = {
				[1] = 1.6393749713898,
				[2] = 1.6550208330154,
			},
		},
		pbw_reik2_war_camp_event_empty_tent_02_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_war_camp_event_empty_tent_02_a_01",
				[2] = "pbw_reik2_war_camp_event_empty_tent_02_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_war_camp_event_empty_tent_02_a_01",
				[2] = "pbw_reik2_war_camp_event_empty_tent_02_a_02",
			},
			sound_events_duration = {
				[1] = 1.7364583015442,
				[2] = 2.2427709102631,
			},
		},
		pbw_reik2_war_camp_event_map_found_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_war_camp_event_map_found_a_01",
				[2] = "pbw_reik2_war_camp_event_map_found_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_war_camp_event_map_found_a_01",
				[2] = "pbw_reik2_war_camp_event_map_found_a_02",
			},
			sound_events_duration = {
				[1] = 3.2373750209808,
				[2] = 2.472895860672,
			},
		},
		pbw_reik2_war_camp_event_map_found_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_reikwald_river",
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
				[1] = "pbw_reik2_war_camp_event_map_found_b_01",
				[2] = "pbw_reik2_war_camp_event_map_found_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_reik2_war_camp_event_map_found_b_01",
				[2] = "pbw_reik2_war_camp_event_map_found_b_02",
			},
			sound_events_duration = {
				[1] = 2.759229183197,
				[2] = 2.0166041851044,
			},
		},
	})
end
