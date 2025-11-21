-- chunkname: @dialogues/generated/dwarf_ranger_dlc_reikwald_river.lua

return function ()
	define_rule({
		name = "pdr_reik2_beached_chaos_ship_a",
		probability = 1,
		response = "pdr_reik2_beached_chaos_ship_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_beached_skaven_ship_a",
		probability = 1,
		response = "pdr_reik2_beached_skaven_ship_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_blocked_in_a",
		probability = 1,
		response = "pdr_reik2_blocked_in_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_blocked_in_b",
		probability = 1,
		response = "pdr_reik2_blocked_in_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_blocked_in_complete_a",
		probability = 1,
		response = "pdr_reik2_blocked_in_complete_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_blocked_in_complete_b",
		probability = 1,
		response = "pdr_reik2_blocked_in_complete_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_board_ship_a",
		probability = 1,
		response = "pdr_reik2_board_ship_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_catapults_a",
		probability = 1,
		response = "pdr_reik2_catapults_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_chaos_raiders_a",
		probability = 1,
		response = "pdr_reik2_chaos_raiders_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_chaos_raiders_b",
		probability = 1,
		response = "pdr_reik2_chaos_raiders_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_chaos_raiders_complete_a",
		probability = 1,
		response = "pdr_reik2_chaos_raiders_complete_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_grappled_01_a",
		probability = 1,
		response = "pdr_reik2_grappled_01_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_grappled_01_b",
		probability = 1,
		response = "pdr_reik2_grappled_01_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_grappled_02_a",
		probability = 1,
		response = "pdr_reik2_grappled_02_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_grappled_02_b",
		probability = 1,
		response = "pdr_reik2_grappled_02_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_light_beacon_b",
		probability = 1,
		response = "pdr_reik2_light_beacon_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_more_grapples_a",
		probability = 1,
		response = "pdr_reik2_more_grapples_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_player_has_found_sword_a",
		probability = 1,
		response = "pdr_reik2_player_has_found_sword_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_power_event_mid_b",
		probability = 1,
		response = "pdr_reik2_power_event_mid_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_power_event_started_a",
		probability = 1,
		response = "pdr_reik2_power_event_started_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_side_path_cave_a",
		probability = 1,
		response = "pdr_reik2_side_path_cave_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_side_path_end_a",
		probability = 1,
		response = "pdr_reik2_side_path_end_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_side_path_start_a",
		probability = 1,
		response = "pdr_reik2_side_path_start_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_side_path_start_b",
		probability = 1,
		response = "pdr_reik2_side_path_start_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_skaven_outpost_a",
		probability = 1,
		response = "pdr_reik2_skaven_outpost_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_skaven_outpost_c",
		probability = 1,
		response = "pdr_reik2_skaven_outpost_c",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_skaven_ship_a",
		probability = 1,
		response = "pdr_reik2_skaven_ship_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_start_banter_b",
		probability = 1,
		response = "pdr_reik2_start_banter_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_start_search_a",
		probability = 1,
		response = "pdr_reik2_start_search_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_survive_event_a",
		probability = 1,
		response = "pdr_reik2_survive_event_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_survive_event_b",
		probability = 1,
		response = "pdr_reik2_survive_event_b",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_torches_a",
		probability = 1,
		response = "pdr_reik2_torches_a",
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
				"dwarf_ranger",
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
		name = "pdr_reik2_war_camp_approach_a",
		probability = 1,
		response = "pdr_reik2_war_camp_approach_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_war_camp_event_empty_tent_01_a",
		probability = 1,
		response = "pdr_reik2_war_camp_event_empty_tent_01_a",
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
				"dwarf_ranger",
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
		name = "pdr_reik2_war_camp_event_empty_tent_02_a",
		probability = 1,
		response = "pdr_reik2_war_camp_event_empty_tent_02_a",
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
				"dwarf_ranger",
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
		name = "pdr_reik2_war_camp_event_map_found_a",
		probability = 1,
		response = "pdr_reik2_war_camp_event_map_found_a",
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
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_reik2_war_camp_event_map_found_b",
		probability = 1,
		response = "pdr_reik2_war_camp_event_map_found_b",
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
				"dwarf_ranger",
			},
		},
	})
	add_dialogues({
		pdr_reik2_beached_chaos_ship_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_beached_chaos_ship_a_01",
				[2] = "pdr_reik2_beached_chaos_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_beached_chaos_ship_a_01",
				[2] = "pdr_reik2_beached_chaos_ship_a_02",
			},
			sound_events_duration = {
				[1] = 3.4476873874664,
				[2] = 2.4293541908264,
			},
		},
		pdr_reik2_beached_skaven_ship_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_beached_skaven_ship_a_01",
				[2] = "pdr_reik2_beached_skaven_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_beached_skaven_ship_a_01",
				[2] = "pdr_reik2_beached_skaven_ship_a_02",
			},
			sound_events_duration = {
				[1] = 2.4542500972748,
				[2] = 1.9845833778381,
			},
		},
		pdr_reik2_blocked_in_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_blocked_in_a_01",
				[2] = "pdr_reik2_blocked_in_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_blocked_in_a_01",
				[2] = "pdr_reik2_blocked_in_a_02",
			},
			sound_events_duration = {
				[1] = 2.8736667633057,
				[2] = 1.5861041545868,
			},
		},
		pdr_reik2_blocked_in_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_blocked_in_b_01",
				[2] = "pdr_reik2_blocked_in_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_blocked_in_b_01",
				[2] = "pdr_reik2_blocked_in_b_02",
			},
			sound_events_duration = {
				[1] = 2.9977083206177,
				[2] = 3.5035834312439,
			},
		},
		pdr_reik2_blocked_in_complete_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_blocked_in_complete_a_01",
				[2] = "pdr_reik2_blocked_in_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_blocked_in_complete_a_01",
				[2] = "pdr_reik2_blocked_in_complete_a_02",
			},
			sound_events_duration = {
				[1] = 1.9938750267029,
				[2] = 4.0931458473206,
			},
		},
		pdr_reik2_blocked_in_complete_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_blocked_in_complete_b_01",
				[2] = "pdr_reik2_blocked_in_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_blocked_in_complete_b_01",
				[2] = "pdr_reik2_blocked_in_complete_b_02",
			},
			sound_events_duration = {
				[1] = 2.8981873989105,
				[2] = 2.6540207862854,
			},
		},
		pdr_reik2_board_ship_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_board_ship_a_01",
				[2] = "pdr_reik2_board_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_board_ship_a_01",
				[2] = "pdr_reik2_board_ship_a_02",
			},
			sound_events_duration = {
				[1] = 1.4475417137146,
				[2] = 1.4962916374207,
			},
		},
		pdr_reik2_catapults_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_catapults_a_01",
				[2] = "pdr_reik2_catapults_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_catapults_a_01",
				[2] = "pdr_reik2_catapults_a_02",
			},
			sound_events_duration = {
				[1] = 3.7723751068115,
				[2] = 5.5736875534058,
			},
		},
		pdr_reik2_chaos_raiders_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_chaos_raiders_a_01",
				[2] = "pdr_reik2_chaos_raiders_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_chaos_raiders_a_01",
				[2] = "pdr_reik2_chaos_raiders_a_02",
			},
			sound_events_duration = {
				[1] = 1.6193333864212,
				[2] = 1.2419583797455,
			},
		},
		pdr_reik2_chaos_raiders_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_chaos_raiders_b_01",
				[2] = "pdr_reik2_chaos_raiders_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_chaos_raiders_b_01",
				[2] = "pdr_reik2_chaos_raiders_b_02",
			},
			sound_events_duration = {
				[1] = 1.9414374828339,
				[2] = 1.7345625162125,
			},
		},
		pdr_reik2_chaos_raiders_complete_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_chaos_raiders_complete_a_01",
				[2] = "pdr_reik2_chaos_raiders_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_chaos_raiders_complete_a_01",
				[2] = "pdr_reik2_chaos_raiders_complete_a_02",
			},
			sound_events_duration = {
				[1] = 1.8715208768845,
				[2] = 1.7930833101273,
			},
		},
		pdr_reik2_grappled_01_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_grappled_01_a_01",
				[2] = "pdr_reik2_grappled_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_grappled_01_a_01",
				[2] = "pdr_reik2_grappled_01_a_02",
			},
			sound_events_duration = {
				[1] = 1.8273750543594,
				[2] = 1.2704999446869,
			},
		},
		pdr_reik2_grappled_01_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_grappled_01_b_01",
				[2] = "pdr_reik2_grappled_01_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_grappled_01_b_01",
				[2] = "pdr_reik2_grappled_01_b_02",
			},
			sound_events_duration = {
				[1] = 2.0513958930969,
				[2] = 1.7337708473206,
			},
		},
		pdr_reik2_grappled_02_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_grappled_02_a_01",
				[2] = "pdr_reik2_grappled_02_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_grappled_02_a_01",
				[2] = "pdr_reik2_grappled_02_a_02",
			},
			sound_events_duration = {
				[1] = 2.0211250782013,
				[2] = 1.5959166288376,
			},
		},
		pdr_reik2_grappled_02_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_grappled_02_b_01",
				[2] = "pdr_reik2_grappled_02_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_grappled_02_b_01",
				[2] = "pdr_reik2_grappled_02_b_02",
			},
			sound_events_duration = {
				[1] = 2.3305625915527,
				[2] = 3.0848958492279,
			},
		},
		pdr_reik2_light_beacon_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_light_beacon_b_01",
				[2] = "pdr_reik2_light_beacon_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_light_beacon_b_01",
				[2] = "pdr_reik2_light_beacon_b_02",
			},
			sound_events_duration = {
				[1] = 1.6141458749771,
				[2] = 1.7331875562668,
			},
		},
		pdr_reik2_more_grapples_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_more_grapples_a_01",
				[2] = "pdr_reik2_more_grapples_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_more_grapples_a_01",
				[2] = "pdr_reik2_more_grapples_a_02",
			},
			sound_events_duration = {
				[1] = 2.1706459522247,
				[2] = 1.6113749742508,
			},
		},
		pdr_reik2_player_has_found_sword_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_player_has_found_sword_a_01",
				[2] = "pdr_reik2_player_has_found_sword_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_player_has_found_sword_a_01",
				[2] = "pdr_reik2_player_has_found_sword_a_02",
			},
			sound_events_duration = {
				[1] = 2.8771250247955,
				[2] = 1.6972500085831,
			},
		},
		pdr_reik2_power_event_mid_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_power_event_mid_b_01",
				[2] = "pdr_reik2_power_event_mid_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_power_event_mid_b_01",
				[2] = "pdr_reik2_power_event_mid_b_02",
			},
			sound_events_duration = {
				[1] = 3.2117290496826,
				[2] = 4.3291039466858,
			},
		},
		pdr_reik2_power_event_started_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_power_event_started_a_01",
				[2] = "pdr_reik2_power_event_started_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_power_event_started_a_01",
				[2] = "pdr_reik2_power_event_started_a_02",
			},
			sound_events_duration = {
				[1] = 1.555999994278,
				[2] = 1.6366666555405,
			},
		},
		pdr_reik2_side_path_cave_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_side_path_cave_a_01",
				[2] = "pdr_reik2_side_path_cave_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_side_path_cave_a_01",
				[2] = "pdr_reik2_side_path_cave_a_02",
			},
			sound_events_duration = {
				[1] = 2.1657083034515,
				[2] = 3.2659583091736,
			},
		},
		pdr_reik2_side_path_end_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_side_path_end_a_01",
				[2] = "pdr_reik2_side_path_end_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_side_path_end_a_01",
				[2] = "pdr_reik2_side_path_end_a_02",
			},
			sound_events_duration = {
				[1] = 2.4197082519531,
				[2] = 3.4567,
			},
		},
		pdr_reik2_side_path_start_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_side_path_start_a_01",
			},
			sound_events = {
				[1] = "pdr_reik2_side_path_start_a_01",
			},
			sound_events_duration = {
				[1] = 3.2508749961853,
			},
		},
		pdr_reik2_side_path_start_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_side_path_start_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_side_path_start_b_01",
			},
			sound_events_duration = {
				[1] = 3.8543541431427,
			},
		},
		pdr_reik2_skaven_outpost_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_skaven_outpost_a_01",
				[2] = "pdr_reik2_skaven_outpost_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_skaven_outpost_a_01",
				[2] = "pdr_reik2_skaven_outpost_a_02",
			},
			sound_events_duration = {
				[1] = 4.5278749465942,
				[2] = 2.4968333244324,
			},
		},
		pdr_reik2_skaven_outpost_c = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_skaven_outpost_c_01",
				[2] = "pdr_reik2_skaven_outpost_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_skaven_outpost_c_01",
				[2] = "pdr_reik2_skaven_outpost_c_02",
			},
			sound_events_duration = {
				[1] = 4.9430832862854,
				[2] = 3.0624792575836,
			},
		},
		pdr_reik2_skaven_ship_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_skaven_ship_a_01",
				[2] = "pdr_reik2_skaven_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_skaven_ship_a_01",
				[2] = "pdr_reik2_skaven_ship_a_02",
			},
			sound_events_duration = {
				[1] = 2.0942916870117,
				[2] = 1.8786457777023,
			},
		},
		pdr_reik2_start_banter_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_start_banter_b_01",
				[2] = "pdr_reik2_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_start_banter_b_01",
				[2] = "pdr_reik2_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 4.9807915687561,
				[2] = 5.2834792137146,
			},
		},
		pdr_reik2_start_search_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_start_search_a_01",
				[2] = "pdr_reik2_start_search_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_start_search_a_01",
				[2] = "pdr_reik2_start_search_a_02",
			},
			sound_events_duration = {
				[1] = 3.6627707481384,
				[2] = 4.8892917633057,
			},
		},
		pdr_reik2_survive_event_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_survive_event_a_01",
				[2] = "pdr_reik2_survive_event_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_survive_event_a_01",
				[2] = "pdr_reik2_survive_event_a_02",
			},
			sound_events_duration = {
				[1] = 2.1024792194366,
				[2] = 2.6563334465027,
			},
		},
		pdr_reik2_survive_event_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_survive_event_b_01",
				[2] = "pdr_reik2_survive_event_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_survive_event_b_01",
				[2] = "pdr_reik2_survive_event_b_02",
			},
			sound_events_duration = {
				[1] = 3.2927916049957,
				[2] = 2.8495416641235,
			},
		},
		pdr_reik2_torches_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_torches_a_01",
				[2] = "pdr_reik2_torches_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_torches_a_01",
				[2] = "pdr_reik2_torches_a_02",
			},
			sound_events_duration = {
				[1] = 2.762791633606,
				[2] = 2.1638123989105,
			},
		},
		pdr_reik2_war_camp_approach_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_war_camp_approach_a_01",
				[2] = "pdr_reik2_war_camp_approach_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_war_camp_approach_a_01",
				[2] = "pdr_reik2_war_camp_approach_a_02",
			},
			sound_events_duration = {
				[1] = 4.6114583015442,
				[2] = 5.2801456451416,
			},
		},
		pdr_reik2_war_camp_event_empty_tent_01_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_war_camp_event_empty_tent_01_a_01",
				[2] = "pdr_reik2_war_camp_event_empty_tent_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_war_camp_event_empty_tent_01_a_01",
				[2] = "pdr_reik2_war_camp_event_empty_tent_01_a_02",
			},
			sound_events_duration = {
				[1] = 1.8881666660309,
				[2] = 1.6488125324249,
			},
		},
		pdr_reik2_war_camp_event_empty_tent_02_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_war_camp_event_empty_tent_02_a_01",
				[2] = "pdr_reik2_war_camp_event_empty_tent_02_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_war_camp_event_empty_tent_02_a_01",
				[2] = "pdr_reik2_war_camp_event_empty_tent_02_a_02",
			},
			sound_events_duration = {
				[1] = 2.2165207862854,
				[2] = 2.6903123855591,
			},
		},
		pdr_reik2_war_camp_event_map_found_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_war_camp_event_map_found_a_01",
				[2] = "pdr_reik2_war_camp_event_map_found_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_war_camp_event_map_found_a_01",
				[2] = "pdr_reik2_war_camp_event_map_found_a_02",
			},
			sound_events_duration = {
				[1] = 1.5024583339691,
				[2] = 1.7118124961853,
			},
		},
		pdr_reik2_war_camp_event_map_found_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_reikwald_river",
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
				[1] = "pdr_reik2_war_camp_event_map_found_b_01",
				[2] = "pdr_reik2_war_camp_event_map_found_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_reik2_war_camp_event_map_found_b_01",
				[2] = "pdr_reik2_war_camp_event_map_found_b_02",
			},
			sound_events_duration = {
				[1] = 3.2894792556763,
				[2] = 2.0217499732971,
			},
		},
	})
end
