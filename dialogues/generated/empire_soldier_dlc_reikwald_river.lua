-- chunkname: @dialogues/generated/empire_soldier_dlc_reikwald_river.lua

return function ()
	define_rule({
		name = "pes_reik2_barricade_a",
		probability = 1,
		response = "pes_reik2_barricade_a",
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
				"reik2_barricade",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_barricade_complete_a",
		probability = 1,
		response = "pes_reik2_barricade_complete_a",
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
				"reik2_barricade_complete",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_beached_chaos_ship_a",
		probability = 1,
		response = "pes_reik2_beached_chaos_ship_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_beached_skaven_ship_a",
		probability = 1,
		response = "pes_reik2_beached_skaven_ship_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_beached_skaven_ship_b",
		probability = 1,
		response = "pes_reik2_beached_skaven_ship_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_blocked_in_a",
		probability = 1,
		response = "pes_reik2_blocked_in_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_blocked_in_b",
		probability = 1,
		response = "pes_reik2_blocked_in_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_blocked_in_complete_a",
		probability = 1,
		response = "pes_reik2_blocked_in_complete_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_blocked_in_complete_b",
		probability = 1,
		response = "pes_reik2_blocked_in_complete_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_board_ship_a",
		probability = 1,
		response = "pes_reik2_board_ship_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_catapults_a",
		probability = 1,
		response = "pes_reik2_catapults_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_chaos_raiders_a",
		probability = 1,
		response = "pes_reik2_chaos_raiders_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_chaos_raiders_b",
		probability = 1,
		response = "pes_reik2_chaos_raiders_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_chaos_raiders_complete_a",
		probability = 1,
		response = "pes_reik2_chaos_raiders_complete_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_clear_the_decks_a",
		probability = 1,
		response = "pes_reik2_clear_the_decks_a",
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
				"reik2_clear_the_decks_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_get_out_a",
		probability = 1,
		response = "pes_reik2_get_out_a",
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
				"reik2_get_out_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_grappled_01_a",
		probability = 1,
		response = "pes_reik2_grappled_01_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_grappled_01_b",
		probability = 1,
		response = "pes_reik2_grappled_01_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_grappled_02_a",
		probability = 1,
		response = "pes_reik2_grappled_02_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_grappled_02_b",
		probability = 1,
		response = "pes_reik2_grappled_02_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_kruber_swap_in_a",
		probability = 1,
		response = "pes_reik2_kruber_swap_in_a",
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
				"reik2_kruber_swap_in_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_kruber_swap_out_a",
		probability = 1,
		response = "pes_reik2_kruber_swap_out_a",
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
				"reik2_kruber_swap_out_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_light_beacon_a",
		probability = 1,
		response = "pes_reik2_light_beacon_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_more_grapples_a",
		probability = 1,
		response = "pes_reik2_more_grapples_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_player_has_found_sword_a",
		probability = 1,
		response = "pes_reik2_player_has_found_sword_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_player_has_found_sword_b",
		probability = 1,
		response = "pes_reik2_player_has_found_sword_b",
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
				"reik2_player_has_found_sword_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				20,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_power_event_mid_b",
		probability = 1,
		response = "pes_reik2_power_event_mid_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_power_event_started_a",
		probability = 1,
		response = "pes_reik2_power_event_started_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_ship_arrived_a",
		probability = 1,
		response = "pes_reik2_ship_arrived_a",
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
				"reik2_ship_arrived_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_side_path_cave_a",
		probability = 1,
		response = "pes_reik2_side_path_cave_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_side_path_end_a",
		probability = 1,
		response = "pes_reik2_side_path_end_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_side_path_start_a",
		probability = 1,
		response = "pes_reik2_side_path_start_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_side_path_start_b",
		probability = 1,
		response = "pes_reik2_side_path_start_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_skaven_outpost_b",
		probability = 1,
		response = "pes_reik2_skaven_outpost_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_skaven_outpost_c",
		probability = 1,
		response = "pes_reik2_skaven_outpost_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_skaven_ship_a",
		probability = 1,
		response = "pes_reik2_skaven_ship_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_start_banter_a",
		probability = 1,
		response = "pes_reik2_start_banter_a",
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
				"reik2_start_banter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_start_banter_c",
		probability = 1,
		response = "pes_reik2_start_banter_c",
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
				"reik2_start_banter_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_start_sailing_a",
		probability = 1,
		response = "pes_reik2_start_sailing_a",
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
				"reik2_start_sailing_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_start_search_a",
		probability = 1,
		response = "pes_reik2_start_search_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_survive_event_a",
		probability = 1,
		response = "pes_reik2_survive_event_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_survive_event_b",
		probability = 1,
		response = "pes_reik2_survive_event_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_torches_a",
		probability = 1,
		response = "pes_reik2_torches_a",
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
				"empire_soldier",
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
		name = "pes_reik2_war_camp_approach_a",
		probability = 1,
		response = "pes_reik2_war_camp_approach_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_war_camp_event_complete_a",
		probability = 1,
		response = "pes_reik2_war_camp_event_complete_a",
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
				"reik2_war_camp_event_complete",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_war_camp_event_complete_b",
		probability = 1,
		response = "pes_reik2_war_camp_event_complete_b",
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
				"reik2_war_camp_event_complete_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_war_camp_event_empty_tent_01_a",
		probability = 1,
		response = "pes_reik2_war_camp_event_empty_tent_01_a",
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
				"empire_soldier",
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
		name = "pes_reik2_war_camp_event_empty_tent_02_a",
		probability = 1,
		response = "pes_reik2_war_camp_event_empty_tent_02_a",
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
				"empire_soldier",
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
		name = "pes_reik2_war_camp_event_map_found_a",
		probability = 1,
		response = "pes_reik2_war_camp_event_map_found_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_war_camp_event_map_found_b",
		probability = 1,
		response = "pes_reik2_war_camp_event_map_found_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_reik2_war_camp_event_start_a",
		probability = 1,
		response = "pes_reik2_war_camp_event_start_a",
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
				"reik2_war_camp_approach_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	add_dialogues({
		pes_reik2_barricade_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				"pes_reik2_barricade_a_01",
				"pes_reik2_barricade_a_02",
				"pes_reik2_barricade_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_reik2_barricade_a_01",
				"pes_reik2_barricade_a_02",
				"pes_reik2_barricade_a_03",
			},
			sound_events_duration = {
				4.7512083053589,
				3.1646041870117,
				3.2419583797455,
			},
		},
		pes_reik2_barricade_complete_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				"pes_reik2_barricade_complete_a_01",
				"pes_reik2_barricade_complete_a_02",
				"pes_reik2_barricade_complete_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_reik2_barricade_complete_a_01",
				"pes_reik2_barricade_complete_a_02",
				"pes_reik2_barricade_complete_a_03",
			},
			sound_events_duration = {
				3.2281458377838,
				1.9804166555405,
				2.7506458759308,
			},
		},
		pes_reik2_beached_chaos_ship_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_beached_chaos_ship_a_01",
				[2] = "pes_reik2_beached_chaos_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_beached_chaos_ship_a_01",
				[2] = "pes_reik2_beached_chaos_ship_a_02",
			},
			sound_events_duration = {
				[1] = 0.79143750667572,
				[2] = 2.5939791202545,
			},
		},
		pes_reik2_beached_skaven_ship_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_beached_skaven_ship_a_01",
				[2] = "pes_reik2_beached_skaven_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_beached_skaven_ship_a_01",
				[2] = "pes_reik2_beached_skaven_ship_a_02",
			},
			sound_events_duration = {
				[1] = 3.1194791793823,
				[2] = 1.4412083625793,
			},
		},
		pes_reik2_beached_skaven_ship_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_beached_skaven_ship_b_01",
				[2] = "pes_reik2_beached_skaven_ship_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_beached_skaven_ship_b_01",
				[2] = "pes_reik2_beached_skaven_ship_b_02",
			},
			sound_events_duration = {
				[1] = 1.3581458330154,
				[2] = 2.2064790725708,
			},
		},
		pes_reik2_blocked_in_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_blocked_in_a_01",
				[2] = "pes_reik2_blocked_in_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_blocked_in_a_01",
				[2] = "pes_reik2_blocked_in_a_02",
			},
			sound_events_duration = {
				[1] = 1.5671458244324,
				[2] = 0.98822915554047,
			},
		},
		pes_reik2_blocked_in_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_blocked_in_b_01",
				[2] = "pes_reik2_blocked_in_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_blocked_in_b_01",
				[2] = "pes_reik2_blocked_in_b_02",
			},
			sound_events_duration = {
				[1] = 2.7711040973663,
				[2] = 2.4658541679382,
			},
		},
		pes_reik2_blocked_in_complete_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_blocked_in_complete_a_01",
				[2] = "pes_reik2_blocked_in_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_blocked_in_complete_a_01",
				[2] = "pes_reik2_blocked_in_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.9083957672119,
				[2] = 1.5328749418259,
			},
		},
		pes_reik2_blocked_in_complete_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_blocked_in_complete_b_01",
				[2] = "pes_reik2_blocked_in_complete_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_blocked_in_complete_b_01",
				[2] = "pes_reik2_blocked_in_complete_b_02",
			},
			sound_events_duration = {
				[1] = 3.6704790592194,
				[2] = 5.7321667671204,
			},
		},
		pes_reik2_board_ship_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_board_ship_a_01",
				[2] = "pes_reik2_board_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_board_ship_a_01",
				[2] = "pes_reik2_board_ship_a_02",
			},
			sound_events_duration = {
				[1] = 3.2018332481384,
				[2] = 2.3469791412353,
			},
		},
		pes_reik2_catapults_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_catapults_a_01",
				[2] = "pes_reik2_catapults_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_catapults_a_01",
				[2] = "pes_reik2_catapults_a_02",
			},
			sound_events_duration = {
				[1] = 4.0685210227966,
				[2] = 3.1370625495911,
			},
		},
		pes_reik2_chaos_raiders_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_chaos_raiders_a_01",
				[2] = "pes_reik2_chaos_raiders_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_chaos_raiders_a_01",
				[2] = "pes_reik2_chaos_raiders_a_02",
			},
			sound_events_duration = {
				[1] = 1.5017708539963,
				[2] = 1.0529999732971,
			},
		},
		pes_reik2_chaos_raiders_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_chaos_raiders_b_01",
				[2] = "pes_reik2_chaos_raiders_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_chaos_raiders_b_01",
				[2] = "pes_reik2_chaos_raiders_b_02",
			},
			sound_events_duration = {
				[1] = 1.1693333387375,
				[2] = 2.7013957500458,
			},
		},
		pes_reik2_chaos_raiders_complete_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_chaos_raiders_complete_a_01",
				[2] = "pes_reik2_chaos_raiders_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_chaos_raiders_complete_a_01",
				[2] = "pes_reik2_chaos_raiders_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.0206665992737,
				[2] = 3.3551249504089,
			},
		},
		pes_reik2_clear_the_decks_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_clear_the_decks_a_01",
				[2] = "pes_reik2_clear_the_decks_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_clear_the_decks_a_01",
				[2] = "pes_reik2_clear_the_decks_a_02",
			},
			sound_events_duration = {
				[1] = 3.0298957824707,
				[2] = 2.2253541946411,
			},
		},
		pes_reik2_get_out_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_get_out_a_01",
				[2] = "pes_reik2_get_out_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_get_out_a_01",
				[2] = "pes_reik2_get_out_a_02",
			},
			sound_events_duration = {
				[1] = 2.0070624351502,
				[2] = 2.6110000610352,
			},
		},
		pes_reik2_grappled_01_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_grappled_01_a_01",
				[2] = "pes_reik2_grappled_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_grappled_01_a_01",
				[2] = "pes_reik2_grappled_01_a_02",
			},
			sound_events_duration = {
				[1] = 2.1017291545868,
				[2] = 1.1444166898727,
			},
		},
		pes_reik2_grappled_01_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_grappled_01_b_01",
				[2] = "pes_reik2_grappled_01_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_grappled_01_b_01",
				[2] = "pes_reik2_grappled_01_b_02",
			},
			sound_events_duration = {
				[1] = 1.3926458358765,
				[2] = 1.4458750486374,
			},
		},
		pes_reik2_grappled_02_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_grappled_02_a_01",
				[2] = "pes_reik2_grappled_02_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_grappled_02_a_01",
				[2] = "pes_reik2_grappled_02_a_02",
			},
			sound_events_duration = {
				[1] = 1.8866666555405,
				[2] = 1.5426666736603,
			},
		},
		pes_reik2_grappled_02_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_grappled_02_b_01",
				[2] = "pes_reik2_grappled_02_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_grappled_02_b_01",
				[2] = "pes_reik2_grappled_02_b_02",
			},
			sound_events_duration = {
				[1] = 2.6217291355133,
				[2] = 1.3995624780655,
			},
		},
		pes_reik2_kruber_swap_in_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				"pes_reik2_kruber_swap_in_a_01",
				"pes_reik2_kruber_swap_in_a_02",
				"pes_reik2_kruber_swap_in_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_reik2_kruber_swap_in_a_01",
				"pes_reik2_kruber_swap_in_a_02",
				"pes_reik2_kruber_swap_in_a_03",
			},
			sound_events_duration = {
				4.330041885376,
				3.1646459102631,
				5.9167709350586,
			},
		},
		pes_reik2_kruber_swap_out_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				"pes_reik2_kruber_swap_out_a_01",
				"pes_reik2_kruber_swap_out_a_02",
				"pes_reik2_kruber_swap_out_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_reik2_kruber_swap_out_a_01",
				"pes_reik2_kruber_swap_out_a_02",
				"pes_reik2_kruber_swap_out_a_03",
			},
			sound_events_duration = {
				5.3800001144409,
				7.7849998474121,
				4.9650001525879,
			},
		},
		pes_reik2_light_beacon_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_light_beacon_a_01",
				[2] = "pes_reik2_light_beacon_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_light_beacon_a_01",
				[2] = "pes_reik2_light_beacon_a_02",
			},
			sound_events_duration = {
				[1] = 4.3735208511353,
				[2] = 2.5462083816528,
			},
		},
		pes_reik2_more_grapples_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_more_grapples_a_01",
				[2] = "pes_reik2_more_grapples_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_more_grapples_a_01",
				[2] = "pes_reik2_more_grapples_a_02",
			},
			sound_events_duration = {
				[1] = 1.6089792251587,
				[2] = 1.7665833234787,
			},
		},
		pes_reik2_player_has_found_sword_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_player_has_found_sword_a_01",
				[2] = "pes_reik2_player_has_found_sword_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_player_has_found_sword_a_01",
				[2] = "pes_reik2_player_has_found_sword_a_02",
			},
			sound_events_duration = {
				[1] = 3.577645778656,
				[2] = 3.0214166641235,
			},
		},
		pes_reik2_player_has_found_sword_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_player_has_found_sword_b_01",
				[2] = "pes_reik2_player_has_found_sword_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_player_has_found_sword_b_01",
				[2] = "pes_reik2_player_has_found_sword_b_02",
			},
			sound_events_duration = {
				[1] = 2.2106459140778,
				[2] = 3.7309374809265,
			},
		},
		pes_reik2_power_event_mid_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_power_event_mid_b_01",
				[2] = "pes_reik2_power_event_mid_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_power_event_mid_b_01",
				[2] = "pes_reik2_power_event_mid_b_02",
			},
			sound_events_duration = {
				[1] = 3.3564167022705,
				[2] = 2.634583234787,
			},
		},
		pes_reik2_power_event_started_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_power_event_started_a_01",
				[2] = "pes_reik2_power_event_started_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_power_event_started_a_01",
				[2] = "pes_reik2_power_event_started_a_02",
			},
			sound_events_duration = {
				[1] = 1.1890208721161,
				[2] = 3.2725207805634,
			},
		},
		pes_reik2_ship_arrived_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_ship_arrived_a_01",
				[2] = "pes_reik2_ship_arrived_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_ship_arrived_a_01",
				[2] = "pes_reik2_ship_arrived_a_02",
			},
			sound_events_duration = {
				[1] = 1.6186457872391,
				[2] = 1.7146458625793,
			},
		},
		pes_reik2_side_path_cave_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_side_path_cave_a_01",
				[2] = "pes_reik2_side_path_cave_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_side_path_cave_a_01",
				[2] = "pes_reik2_side_path_cave_a_02",
			},
			sound_events_duration = {
				[1] = 1.8387500047684,
				[2] = 2.9087290763855,
			},
		},
		pes_reik2_side_path_end_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_side_path_end_a_01",
				[2] = "pes_reik2_side_path_end_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_side_path_end_a_01",
				[2] = "pes_reik2_side_path_end_a_02",
			},
			sound_events_duration = {
				[1] = 1.8817083835602,
				[2] = 3.4567,
			},
		},
		pes_reik2_side_path_start_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_side_path_start_a_01",
			},
			sound_events = {
				[1] = "pes_reik2_side_path_start_a_01",
			},
			sound_events_duration = {
				[1] = 3.2549374103546,
			},
		},
		pes_reik2_side_path_start_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_side_path_start_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_side_path_start_b_01",
			},
			sound_events_duration = {
				[1] = 2.4253542423248,
			},
		},
		pes_reik2_skaven_outpost_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_skaven_outpost_b_01",
				[2] = "pes_reik2_skaven_outpost_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_skaven_outpost_b_01",
				[2] = "pes_reik2_skaven_outpost_b_02",
			},
			sound_events_duration = {
				[1] = 2.64097905159,
				[2] = 3.9887917041779,
			},
		},
		pes_reik2_skaven_outpost_c = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_skaven_outpost_c_01",
				[2] = "pes_reik2_skaven_outpost_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_skaven_outpost_c_01",
				[2] = "pes_reik2_skaven_outpost_c_02",
			},
			sound_events_duration = {
				[1] = 2.4261250495911,
				[2] = 3.458208322525,
			},
		},
		pes_reik2_skaven_ship_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_skaven_ship_a_01",
				[2] = "pes_reik2_skaven_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_skaven_ship_a_01",
				[2] = "pes_reik2_skaven_ship_a_02",
			},
			sound_events_duration = {
				[1] = 2.2237708568573,
				[2] = 1.6956875324249,
			},
		},
		pes_reik2_start_banter_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				"pes_reik2_start_banter_a_01",
				"pes_reik2_start_banter_a_02",
				"pes_reik2_start_banter_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_reik2_start_banter_a_01",
				"pes_reik2_start_banter_a_02",
				"pes_reik2_start_banter_a_03",
			},
			sound_events_duration = {
				4.6288542747498,
				5.3863959312439,
				4.2106251716614,
			},
		},
		pes_reik2_start_banter_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_start_banter_c_01",
				[2] = "pes_reik2_start_banter_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_start_banter_c_01",
				[2] = "pes_reik2_start_banter_c_03",
			},
			sound_events_duration = {
				[1] = 5.4762501716614,
				[2] = 4.6819167137146,
			},
		},
		pes_reik2_start_sailing_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_start_sailing_a_01",
				[2] = "pes_reik2_start_sailing_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_start_sailing_a_01",
				[2] = "pes_reik2_start_sailing_a_02",
			},
			sound_events_duration = {
				[1] = 3.0938959121704,
				[2] = 2.158499956131,
			},
		},
		pes_reik2_start_search_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_start_search_a_01",
				[2] = "pes_reik2_start_search_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_start_search_a_01",
				[2] = "pes_reik2_start_search_a_02",
			},
			sound_events_duration = {
				[1] = 5.1693959236145,
				[2] = 2.3862707614899,
			},
		},
		pes_reik2_survive_event_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_survive_event_a_01",
				[2] = "pes_reik2_survive_event_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_survive_event_a_01",
				[2] = "pes_reik2_survive_event_a_02",
			},
			sound_events_duration = {
				[1] = 1.86618745327,
				[2] = 3.9399583339691,
			},
		},
		pes_reik2_survive_event_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_survive_event_b_01",
				[2] = "pes_reik2_survive_event_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_survive_event_b_01",
				[2] = "pes_reik2_survive_event_b_02",
			},
			sound_events_duration = {
				[1] = 3.9408333301544,
				[2] = 3.5274374485016,
			},
		},
		pes_reik2_torches_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_torches_a_01",
				[2] = "pes_reik2_torches_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_torches_a_01",
				[2] = "pes_reik2_torches_a_02",
			},
			sound_events_duration = {
				[1] = 3.4655208587647,
				[2] = 3.9114167690277,
			},
		},
		pes_reik2_war_camp_approach_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_war_camp_approach_a_01",
				[2] = "pes_reik2_war_camp_approach_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_war_camp_approach_a_01",
				[2] = "pes_reik2_war_camp_approach_a_02",
			},
			sound_events_duration = {
				[1] = 4.0097918510437,
				[2] = 3.9020833969116,
			},
		},
		pes_reik2_war_camp_event_complete_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				"pes_reik2_war_camp_event_complete_a_01",
				"pes_reik2_war_camp_event_complete_a_02",
				"pes_reik2_war_camp_event_complete_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_reik2_war_camp_event_complete_a_01",
				"pes_reik2_war_camp_event_complete_a_02",
				"pes_reik2_war_camp_event_complete_a_03",
			},
			sound_events_duration = {
				3.5403332710266,
				3.8614792823791,
				4.3851041793823,
			},
		},
		pes_reik2_war_camp_event_complete_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				"pes_reik2_war_camp_event_complete_b_01",
				"pes_reik2_war_camp_event_complete_b_02",
				"pes_reik2_war_camp_event_complete_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_reik2_war_camp_event_complete_b_01",
				"pes_reik2_war_camp_event_complete_b_02",
				"pes_reik2_war_camp_event_complete_b_03",
			},
			sound_events_duration = {
				4.3886666297913,
				3.4101874828339,
				4.4683542251587,
			},
		},
		pes_reik2_war_camp_event_empty_tent_01_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_war_camp_event_empty_tent_01_a_01",
				[2] = "pes_reik2_war_camp_event_empty_tent_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_war_camp_event_empty_tent_01_a_01",
				[2] = "pes_reik2_war_camp_event_empty_tent_01_a_02",
			},
			sound_events_duration = {
				[1] = 1.8676458597183,
				[2] = 1.2362916469574,
			},
		},
		pes_reik2_war_camp_event_empty_tent_02_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_war_camp_event_empty_tent_02_a_01",
				[2] = "pes_reik2_war_camp_event_empty_tent_02_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_war_camp_event_empty_tent_02_a_01",
				[2] = "pes_reik2_war_camp_event_empty_tent_02_a_02",
			},
			sound_events_duration = {
				[1] = 1.0975416898727,
				[2] = 2.0431876182556,
			},
		},
		pes_reik2_war_camp_event_map_found_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_war_camp_event_map_found_a_01",
				[2] = "pes_reik2_war_camp_event_map_found_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_war_camp_event_map_found_a_01",
				[2] = "pes_reik2_war_camp_event_map_found_a_02",
			},
			sound_events_duration = {
				[1] = 1.040895819664,
				[2] = 1.414541721344,
			},
		},
		pes_reik2_war_camp_event_map_found_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				[1] = "pes_reik2_war_camp_event_map_found_b_01",
				[2] = "pes_reik2_war_camp_event_map_found_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_reik2_war_camp_event_map_found_b_01",
				[2] = "pes_reik2_war_camp_event_map_found_b_02",
			},
			sound_events_duration = {
				[1] = 2.1996667385101,
				[2] = 2.5338542461395,
			},
		},
		pes_reik2_war_camp_event_start_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_reikwald_river",
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
				"pes_reik2_war_camp_event_start_a_01",
				"pes_reik2_war_camp_event_start_a_02",
				"pes_reik2_war_camp_event_start_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_reik2_war_camp_event_start_a_01",
				"pes_reik2_war_camp_event_start_a_02",
				"pes_reik2_war_camp_event_start_a_03",
			},
			sound_events_duration = {
				4.063437461853,
				4.1415414810181,
				5.6854376792908,
			},
		},
	})
end
