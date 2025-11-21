-- chunkname: @dialogues/generated/wood_elf_dlc_reikwald_river.lua

return function ()
	define_rule({
		name = "pwe_reik2_beached_chaos_ship_a",
		probability = 1,
		response = "pwe_reik2_beached_chaos_ship_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_beached_skaven_ship_a",
		probability = 1,
		response = "pwe_reik2_beached_skaven_ship_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_blocked_in_a",
		probability = 1,
		response = "pwe_reik2_blocked_in_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_blocked_in_b",
		probability = 1,
		response = "pwe_reik2_blocked_in_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_blocked_in_complete_a",
		probability = 1,
		response = "pwe_reik2_blocked_in_complete_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_blocked_in_complete_b",
		probability = 1,
		response = "pwe_reik2_blocked_in_complete_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_board_ship_a",
		probability = 1,
		response = "pwe_reik2_board_ship_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_catapults_a",
		probability = 1,
		response = "pwe_reik2_catapults_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_chaos_raiders_a",
		probability = 1,
		response = "pwe_reik2_chaos_raiders_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_chaos_raiders_b",
		probability = 1,
		response = "pwe_reik2_chaos_raiders_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_chaos_raiders_complete_a",
		probability = 1,
		response = "pwe_reik2_chaos_raiders_complete_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_grappled_01_a",
		probability = 1,
		response = "pwe_reik2_grappled_01_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_grappled_01_b",
		probability = 1,
		response = "pwe_reik2_grappled_01_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_grappled_02_a",
		probability = 1,
		response = "pwe_reik2_grappled_02_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_grappled_02_b",
		probability = 1,
		response = "pwe_reik2_grappled_02_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_light_beacon_b",
		probability = 1,
		response = "pwe_reik2_light_beacon_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_more_grapples_a",
		probability = 1,
		response = "pwe_reik2_more_grapples_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_player_has_found_sword_a",
		probability = 1,
		response = "pwe_reik2_player_has_found_sword_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_power_event_mid_b",
		probability = 1,
		response = "pwe_reik2_power_event_mid_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_power_event_started_a",
		probability = 1,
		response = "pwe_reik2_power_event_started_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_side_path_cave_a",
		probability = 1,
		response = "pwe_reik2_side_path_cave_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_side_path_end_a",
		probability = 1,
		response = "pwe_reik2_side_path_end_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_side_path_start_a",
		probability = 1,
		response = "pwe_reik2_side_path_start_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_side_path_start_b",
		probability = 1,
		response = "pwe_reik2_side_path_start_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_skaven_outpost_a",
		probability = 1,
		response = "pwe_reik2_skaven_outpost_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_skaven_outpost_c",
		probability = 1,
		response = "pwe_reik2_skaven_outpost_c",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_skaven_ship_a",
		probability = 1,
		response = "pwe_reik2_skaven_ship_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_start_banter_b",
		probability = 1,
		response = "pwe_reik2_start_banter_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_start_search_a",
		probability = 1,
		response = "pwe_reik2_start_search_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_survive_event_a",
		probability = 1,
		response = "pwe_reik2_survive_event_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_survive_event_b",
		probability = 1,
		response = "pwe_reik2_survive_event_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_torches_a",
		probability = 1,
		response = "pwe_reik2_torches_a",
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
				"wood_elf",
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
		name = "pwe_reik2_war_camp_approach_a",
		probability = 1,
		response = "pwe_reik2_war_camp_approach_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_war_camp_event_empty_tent_01_a",
		probability = 1,
		response = "pwe_reik2_war_camp_event_empty_tent_01_a",
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
				"wood_elf",
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
		name = "pwe_reik2_war_camp_event_empty_tent_02_a",
		probability = 1,
		response = "pwe_reik2_war_camp_event_empty_tent_02_a",
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
				"wood_elf",
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
		name = "pwe_reik2_war_camp_event_map_found_a",
		probability = 1,
		response = "pwe_reik2_war_camp_event_map_found_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_reik2_war_camp_event_map_found_b",
		probability = 1,
		response = "pwe_reik2_war_camp_event_map_found_b",
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
				"wood_elf",
			},
		},
	})
	add_dialogues({
		pwe_reik2_beached_chaos_ship_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_beached_chaos_ship_a_02",
			},
			sound_events = {
				[1] = "pwe_reik2_beached_chaos_ship_a_02",
			},
			sound_events_duration = {
				[1] = 2.0621042251587,
			},
		},
		pwe_reik2_beached_skaven_ship_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_beached_skaven_ship_a_01",
				[2] = "pwe_reik2_beached_skaven_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_beached_skaven_ship_a_01",
				[2] = "pwe_reik2_beached_skaven_ship_a_02",
			},
			sound_events_duration = {
				[1] = 2.2782292366028,
				[2] = 1.9132291078568,
			},
		},
		pwe_reik2_blocked_in_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_blocked_in_a_01",
				[2] = "pwe_reik2_blocked_in_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_blocked_in_a_01",
				[2] = "pwe_reik2_blocked_in_a_02",
			},
			sound_events_duration = {
				[1] = 1.4414374828339,
				[2] = 2.9822916984558,
			},
		},
		pwe_reik2_blocked_in_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_blocked_in_b_01",
				[2] = "pwe_reik2_blocked_in_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_blocked_in_b_01",
				[2] = "pwe_reik2_blocked_in_b_02",
			},
			sound_events_duration = {
				[1] = 5.4119582176208,
				[2] = 3.2476251125336,
			},
		},
		pwe_reik2_blocked_in_complete_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_blocked_in_complete_a_01",
				[2] = "pwe_reik2_blocked_in_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_blocked_in_complete_a_01",
				[2] = "pwe_reik2_blocked_in_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.344583272934,
				[2] = 1.3582500219345,
			},
		},
		pwe_reik2_blocked_in_complete_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_blocked_in_complete_b_01",
				[2] = "pwe_reik2_blocked_in_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_blocked_in_complete_b_01",
				[2] = "pwe_reik2_blocked_in_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.7991666793823,
				[2] = 2.5878958702087,
			},
		},
		pwe_reik2_board_ship_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_board_ship_a_01",
				[2] = "pwe_reik2_board_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_board_ship_a_01",
				[2] = "pwe_reik2_board_ship_a_02",
			},
			sound_events_duration = {
				[1] = 3.4725208282471,
				[2] = 2.0372500419617,
			},
		},
		pwe_reik2_catapults_a = {
			category = "level_talk",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_catapults_a_01",
				[2] = "pwe_reik2_catapults_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_catapults_a_01",
				[2] = "pwe_reik2_catapults_a_02",
			},
			sound_events_duration = {
				[1] = 5.6015000343323,
				[2] = 2.7981457710266,
			},
		},
		pwe_reik2_chaos_raiders_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_chaos_raiders_a_01",
				[2] = "pwe_reik2_chaos_raiders_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_chaos_raiders_a_01",
				[2] = "pwe_reik2_chaos_raiders_a_02",
			},
			sound_events_duration = {
				[1] = 1.7570208311081,
				[2] = 1.2899792194366,
			},
		},
		pwe_reik2_chaos_raiders_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_chaos_raiders_b_01",
				[2] = "pwe_reik2_chaos_raiders_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_chaos_raiders_b_01",
				[2] = "pwe_reik2_chaos_raiders_b_02",
			},
			sound_events_duration = {
				[1] = 1.3262083530426,
				[2] = 2.0237708091736,
			},
		},
		pwe_reik2_chaos_raiders_complete_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_chaos_raiders_complete_a_01",
				[2] = "pwe_reik2_chaos_raiders_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_chaos_raiders_complete_a_01",
				[2] = "pwe_reik2_chaos_raiders_complete_a_02",
			},
			sound_events_duration = {
				[1] = 1.3119583129883,
				[2] = 1.528937458992,
			},
		},
		pwe_reik2_grappled_01_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_grappled_01_a_01",
				[2] = "pwe_reik2_grappled_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_grappled_01_a_01",
				[2] = "pwe_reik2_grappled_01_a_02",
			},
			sound_events_duration = {
				[1] = 0.89733332395554,
				[2] = 0.99389582872391,
			},
		},
		pwe_reik2_grappled_01_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_grappled_01_b_01",
				[2] = "pwe_reik2_grappled_01_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_grappled_01_b_01",
				[2] = "pwe_reik2_grappled_01_b_02",
			},
			sound_events_duration = {
				[1] = 1.4431250095367,
				[2] = 1.3882917165756,
			},
		},
		pwe_reik2_grappled_02_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_grappled_02_a_01",
				[2] = "pwe_reik2_grappled_02_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_grappled_02_a_01",
				[2] = "pwe_reik2_grappled_02_a_02",
			},
			sound_events_duration = {
				[1] = 1.6959999799728,
				[2] = 3.4533958435059,
			},
		},
		pwe_reik2_grappled_02_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_grappled_02_b_01",
				[2] = "pwe_reik2_grappled_02_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_grappled_02_b_01",
				[2] = "pwe_reik2_grappled_02_b_02",
			},
			sound_events_duration = {
				[1] = 1.3069167137146,
				[2] = 2.6177709102631,
			},
		},
		pwe_reik2_light_beacon_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_light_beacon_b_01",
				[2] = "pwe_reik2_light_beacon_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_light_beacon_b_01",
				[2] = "pwe_reik2_light_beacon_b_02",
			},
			sound_events_duration = {
				[1] = 2.4063749313355,
				[2] = 1.7414375543594,
			},
		},
		pwe_reik2_more_grapples_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_more_grapples_a_01",
				[2] = "pwe_reik2_more_grapples_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_more_grapples_a_01",
				[2] = "pwe_reik2_more_grapples_a_02",
			},
			sound_events_duration = {
				[1] = 1.6678541898727,
				[2] = 1.4098333120346,
			},
		},
		pwe_reik2_player_has_found_sword_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_player_has_found_sword_a_01",
				[2] = "pwe_reik2_player_has_found_sword_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_player_has_found_sword_a_01",
				[2] = "pwe_reik2_player_has_found_sword_a_02",
			},
			sound_events_duration = {
				[1] = 2.0971667766571,
				[2] = 1.9247499704361,
			},
		},
		pwe_reik2_power_event_mid_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_power_event_mid_b_01",
				[2] = "pwe_reik2_power_event_mid_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_power_event_mid_b_01",
				[2] = "pwe_reik2_power_event_mid_b_02",
			},
			sound_events_duration = {
				[1] = 1.3174375295639,
				[2] = 2.7657709121704,
			},
		},
		pwe_reik2_power_event_started_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_power_event_started_a_01",
				[2] = "pwe_reik2_power_event_started_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_power_event_started_a_01",
				[2] = "pwe_reik2_power_event_started_a_02",
			},
			sound_events_duration = {
				[1] = 2.8902916908264,
				[2] = 3.9772708415985,
			},
		},
		pwe_reik2_side_path_cave_a = {
			category = "level_talk",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_side_path_cave_a_01",
				[2] = "pwe_reik2_side_path_cave_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_side_path_cave_a_01",
				[2] = "pwe_reik2_side_path_cave_a_02",
			},
			sound_events_duration = {
				[1] = 3.2052083015442,
				[2] = 3.4239792823791,
			},
		},
		pwe_reik2_side_path_end_a = {
			category = "level_talk",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_side_path_end_a_01",
				[2] = "pwe_reik2_side_path_end_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_side_path_end_a_01",
				[2] = "pwe_reik2_side_path_end_a_02",
			},
			sound_events_duration = {
				[1] = 2.571145772934,
				[2] = 3.4567,
			},
		},
		pwe_reik2_side_path_start_a = {
			category = "level_talk",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_side_path_start_a_01",
			},
			sound_events = {
				[1] = "pwe_reik2_side_path_start_a_01",
			},
			sound_events_duration = {
				[1] = 2.4502291679382,
			},
		},
		pwe_reik2_side_path_start_b = {
			category = "level_talk",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_side_path_start_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_side_path_start_b_01",
			},
			sound_events_duration = {
				[1] = 4.9091248512268,
			},
		},
		pwe_reik2_skaven_outpost_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_skaven_outpost_a_01",
				[2] = "pwe_reik2_skaven_outpost_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_skaven_outpost_a_01",
				[2] = "pwe_reik2_skaven_outpost_a_02",
			},
			sound_events_duration = {
				[1] = 3.5090625286102,
				[2] = 5.0940208435059,
			},
		},
		pwe_reik2_skaven_outpost_c = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_skaven_outpost_c_01",
				[2] = "pwe_reik2_skaven_outpost_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_skaven_outpost_c_01",
				[2] = "pwe_reik2_skaven_outpost_c_02",
			},
			sound_events_duration = {
				[1] = 3.7096667289734,
				[2] = 4.1032710075378,
			},
		},
		pwe_reik2_skaven_ship_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_skaven_ship_a_01",
				[2] = "pwe_reik2_skaven_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_skaven_ship_a_01",
				[2] = "pwe_reik2_skaven_ship_a_02",
			},
			sound_events_duration = {
				[1] = 2.3649582862854,
				[2] = 2.7764792442322,
			},
		},
		pwe_reik2_start_banter_b = {
			category = "level_talk",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_start_banter_b_01",
				[2] = "pwe_reik2_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_start_banter_b_01",
				[2] = "pwe_reik2_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 1.5775208473206,
				[2] = 2.3581874370575,
			},
		},
		pwe_reik2_start_search_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_start_search_a_01",
				[2] = "pwe_reik2_start_search_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_start_search_a_01",
				[2] = "pwe_reik2_start_search_a_02",
			},
			sound_events_duration = {
				[1] = 2.8107082843781,
				[2] = 3.2313332557678,
			},
		},
		pwe_reik2_survive_event_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_survive_event_a_01",
				[2] = "pwe_reik2_survive_event_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_survive_event_a_01",
				[2] = "pwe_reik2_survive_event_a_02",
			},
			sound_events_duration = {
				[1] = 5.3232293128967,
				[2] = 4.3177499771118,
			},
		},
		pwe_reik2_survive_event_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_survive_event_b_01",
				[2] = "pwe_reik2_survive_event_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_survive_event_b_01",
				[2] = "pwe_reik2_survive_event_b_02",
			},
			sound_events_duration = {
				[1] = 3.4774582386017,
				[2] = 1.6063749790192,
			},
		},
		pwe_reik2_torches_a = {
			category = "level_talk",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_torches_a_01",
				[2] = "pwe_reik2_torches_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_torches_a_01",
				[2] = "pwe_reik2_torches_a_02",
			},
			sound_events_duration = {
				[1] = 3.3253333568573,
				[2] = 2.6768124103546,
			},
		},
		pwe_reik2_war_camp_approach_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_war_camp_approach_a_01",
				[2] = "pwe_reik2_war_camp_approach_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_war_camp_approach_a_01",
				[2] = "pwe_reik2_war_camp_approach_a_02",
			},
			sound_events_duration = {
				[1] = 3.208208322525,
				[2] = 4.1756043434143,
			},
		},
		pwe_reik2_war_camp_event_empty_tent_01_a = {
			category = "level_talk",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_war_camp_event_empty_tent_01_a_01",
				[2] = "pwe_reik2_war_camp_event_empty_tent_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_war_camp_event_empty_tent_01_a_01",
				[2] = "pwe_reik2_war_camp_event_empty_tent_01_a_02",
			},
			sound_events_duration = {
				[1] = 2.2846667766571,
				[2] = 1.8978749513626,
			},
		},
		pwe_reik2_war_camp_event_empty_tent_02_a = {
			category = "level_talk",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_war_camp_event_empty_tent_02_a_01",
				[2] = "pwe_reik2_war_camp_event_empty_tent_02_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_war_camp_event_empty_tent_02_a_01",
				[2] = "pwe_reik2_war_camp_event_empty_tent_02_a_02",
			},
			sound_events_duration = {
				[1] = 1.9919583797455,
				[2] = 1.7076666355133,
			},
		},
		pwe_reik2_war_camp_event_map_found_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_war_camp_event_map_found_a_01",
				[2] = "pwe_reik2_war_camp_event_map_found_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_war_camp_event_map_found_a_01",
				[2] = "pwe_reik2_war_camp_event_map_found_a_02",
			},
			sound_events_duration = {
				[1] = 0.99381250143051,
				[2] = 1.9633958339691,
			},
		},
		pwe_reik2_war_camp_event_map_found_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_reikwald_river",
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
				[1] = "pwe_reik2_war_camp_event_map_found_b_01",
				[2] = "pwe_reik2_war_camp_event_map_found_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_reik2_war_camp_event_map_found_b_01",
				[2] = "pwe_reik2_war_camp_event_map_found_b_02",
			},
			sound_events_duration = {
				[1] = 2.4603540897369,
				[2] = 2.5786459445953,
			},
		},
	})
end
