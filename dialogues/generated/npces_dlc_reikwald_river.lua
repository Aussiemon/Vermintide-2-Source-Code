-- chunkname: @dialogues/generated/npces_dlc_reikwald_river.lua

return function ()
	define_rule({
		name = "npc_reik2_barricade_a",
		probability = 1,
		response = "npc_reik2_barricade_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_barricade_complete_a",
		probability = 1,
		response = "npc_reik2_barricade_complete_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_beached_skaven_ship_b",
		probability = 1,
		response = "npc_reik2_beached_skaven_ship_b",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_clear_the_decks_a",
		probability = 1,
		response = "npc_reik2_clear_the_decks_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_get_out_a",
		probability = 1,
		response = "npc_reik2_get_out_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_light_beacon_a",
		probability = 1,
		response = "npc_reik2_light_beacon_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_mission_end_a",
		probability = 1,
		response = "npc_reik2_mission_end_a",
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
				"reik2_mission_end_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_player_has_found_sword_b",
		probability = 1,
		response = "npc_reik2_player_has_found_sword_b",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_ship_arrived_a",
		probability = 1,
		response = "npc_reik2_ship_arrived_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_side_path_cave_a",
		probability = 1,
		response = "npc_reik2_side_path_cave_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_side_path_end_a",
		probability = 1,
		response = "npc_reik2_side_path_end_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_side_path_start_a",
		probability = 1,
		response = "npc_reik2_side_path_start_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_side_path_start_b",
		probability = 1,
		response = "npc_reik2_side_path_start_b",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_skaven_outpost_b",
		probability = 1,
		response = "npc_reik2_skaven_outpost_b",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_start_banter_a",
		probability = 1,
		response = "npc_reik2_start_banter_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_start_banter_c",
		probability = 1,
		response = "npc_reik2_start_banter_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
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
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_start_sailing_a",
		probability = 1,
		response = "npc_reik2_start_sailing_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_start_search_a",
		probability = 1,
		response = "npc_reik2_start_search_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_war_camp_event_complete_a",
		probability = 1,
		response = "npc_reik2_war_camp_event_complete_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_war_camp_event_complete_b",
		probability = 1,
		response = "npc_reik2_war_camp_event_complete_b",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npc_reik2_war_camp_event_start_a",
		probability = 1,
		response = "npc_reik2_war_camp_event_start_a",
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
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	add_dialogues({
		npc_reik2_barricade_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_barricade_a_01",
				"npces_reik2_barricade_a_02",
				"npces_reik2_barricade_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"npces_reik2_barricade_a_01",
				"npces_reik2_barricade_a_02",
				"npces_reik2_barricade_a_03",
			},
			sound_events_duration = {
				5,
				3.4793334007263,
				3.5890207290649,
			},
		},
		npc_reik2_barricade_complete_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_barricade_complete_a_01",
				"npces_reik2_barricade_complete_a_02",
				"npces_reik2_barricade_complete_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"npces_reik2_barricade_complete_a_01",
				"npces_reik2_barricade_complete_a_02",
				"npces_reik2_barricade_complete_a_03",
			},
			sound_events_duration = {
				5.0080833435059,
				2.7485001087189,
				3.7161457538605,
			},
		},
		npc_reik2_beached_skaven_ship_b = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_beached_skaven_ship_b_01",
				"npces_reik2_beached_skaven_ship_b_02",
				"npces_reik2_beached_skaven_ship_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"npces_reik2_beached_skaven_ship_b_01",
				"npces_reik2_beached_skaven_ship_b_02",
				"npces_reik2_beached_skaven_ship_b_03",
			},
			sound_events_duration = {
				3.7051665782928,
				4.5733957290649,
				5.115749835968,
			},
		},
		npc_reik2_clear_the_decks_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_clear_the_decks_a_01",
				"npces_reik2_clear_the_decks_a_02",
				"npces_reik2_clear_the_decks_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"npces_reik2_clear_the_decks_a_01",
				"npces_reik2_clear_the_decks_a_02",
				"npces_reik2_clear_the_decks_a_03",
			},
			sound_events_duration = {
				3.5940208435059,
				3.6141457557678,
				3.6182708740234,
			},
		},
		npc_reik2_get_out_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_get_out_a_01",
				"npces_reik2_get_out_a_02",
				"npces_reik2_get_out_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"npces_reik2_get_out_a_01",
				"npces_reik2_get_out_a_02",
				"npces_reik2_get_out_a_03",
			},
			sound_events_duration = {
				2.7311251163483,
				3.7714166641235,
				2.8550000190735,
			},
		},
		npc_reik2_light_beacon_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_light_beacon_a_01",
				"npces_reik2_light_beacon_a_02",
				"npces_reik2_light_beacon_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"npces_reik2_light_beacon_a_01",
				"npces_reik2_light_beacon_a_02",
				"npces_reik2_light_beacon_a_03",
			},
			sound_events_duration = {
				4.1883335113525,
				3.7374999523163,
				5.3150210380554,
			},
		},
		npc_reik2_mission_end_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_mission_end_a_01",
				"npces_reik2_mission_end_a_02",
				"npces_reik2_mission_end_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"npces_reik2_mission_end_a_01",
				"npces_reik2_mission_end_a_02",
				"npces_reik2_mission_end_a_03",
			},
			sound_events_duration = {
				3.6276667118073,
				5.4224376678467,
				3.884687423706,
			},
		},
		npc_reik2_player_has_found_sword_b = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				[1] = "npces_reik2_player_has_found_sword_b_01",
				[2] = "npces_reik2_player_has_found_sword_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "npces_reik2_player_has_found_sword_b_01",
				[2] = "npces_reik2_player_has_found_sword_b_02",
			},
			sound_events_duration = {
				[1] = 4.4264168739319,
				[2] = 2.6685416698456,
			},
		},
		npc_reik2_ship_arrived_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_ship_arrived_a_01",
				"npces_reik2_ship_arrived_a_02",
				"npces_reik2_ship_arrived_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"npces_reik2_ship_arrived_a_01",
				"npces_reik2_ship_arrived_a_02",
				"npces_reik2_ship_arrived_a_03",
			},
			sound_events_duration = {
				2.6366250514984,
				2.6845417022705,
				2.5227084159851,
			},
		},
		npc_reik2_side_path_cave_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				[1] = "npces_reik2_side_path_cave_a_01",
				[2] = "npces_reik2_side_path_cave_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npces_reik2_side_path_cave_a_01",
				[2] = "npces_reik2_side_path_cave_a_02",
			},
			sound_events_duration = {
				[1] = 3.4567,
				[2] = 3.4567,
			},
		},
		npc_reik2_side_path_end_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				[1] = "npces_reik2_side_path_end_a_01",
				[2] = "npces_reik2_side_path_end_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npces_reik2_side_path_end_a_01",
				[2] = "npces_reik2_side_path_end_a_02",
			},
			sound_events_duration = {
				[1] = 3.4567,
				[2] = 3.4567,
			},
		},
		npc_reik2_side_path_start_a = {
			category = "level_talk",
			database = "npces_dlc_reikwald_river",
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
				[1] = "npces_reik2_side_path_start_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npces_reik2_side_path_start_a_01",
			},
			sound_events_duration = {
				[1] = 4.029812335968,
			},
		},
		npc_reik2_side_path_start_b = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				[1] = "npces_reik2_side_path_start_b_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npces_reik2_side_path_start_b_01",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		npc_reik2_skaven_outpost_b = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_skaven_outpost_b_01",
				"npces_reik2_skaven_outpost_b_02",
				"npces_reik2_skaven_outpost_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"npces_reik2_skaven_outpost_b_01",
				"npces_reik2_skaven_outpost_b_02",
				"npces_reik2_skaven_outpost_b_03",
			},
			sound_events_duration = {
				3.4791042804718,
				5.5135831832886,
				4.1231460571289,
			},
		},
		npc_reik2_start_banter_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_start_banter_a_01",
				"npces_reik2_start_banter_a_02",
				"npces_reik2_start_banter_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"npces_reik2_start_banter_a_01",
				"npces_reik2_start_banter_a_02",
				"npces_reik2_start_banter_a_03",
			},
			sound_events_duration = {
				4.5920414924622,
				5.6271667480469,
				4.9143958091736,
			},
		},
		npc_reik2_start_banter_c = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				[1] = "npces_reik2_start_banter_c_01",
				[2] = "npces_reik2_start_banter_c_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npces_reik2_start_banter_c_01",
				[2] = "npces_reik2_start_banter_c_03",
			},
			sound_events_duration = {
				[1] = 6.8975415229797,
				[2] = 5.1288542747498,
			},
		},
		npc_reik2_start_sailing_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_start_sailing_a_01",
				"npces_reik2_start_sailing_a_02",
				"npces_reik2_start_sailing_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"npces_reik2_start_sailing_a_01",
				"npces_reik2_start_sailing_a_02",
				"npces_reik2_start_sailing_a_03",
			},
			sound_events_duration = {
				4.4203124046326,
				3.1009583473206,
				3.3922708034515,
			},
		},
		npc_reik2_start_search_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				[1] = "npces_reik2_start_search_a_01",
				[2] = "npces_reik2_start_search_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "npces_reik2_start_search_a_01",
				[2] = "npces_reik2_start_search_a_02",
			},
			sound_events_duration = {
				[1] = 5.0689792633057,
				[2] = 7.2649374008179,
			},
		},
		npc_reik2_war_camp_event_complete_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_war_camp_event_complete_a_01",
				"npces_reik2_war_camp_event_complete_a_02",
				"npces_reik2_war_camp_event_complete_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"npces_reik2_war_camp_event_complete_a_01",
				"npces_reik2_war_camp_event_complete_a_02",
				"npces_reik2_war_camp_event_complete_a_03",
			},
			sound_events_duration = {
				4.1594376564026,
				5.0682706832886,
				6.4944167137146,
			},
		},
		npc_reik2_war_camp_event_complete_b = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_war_camp_event_complete_b_01",
				"npces_reik2_war_camp_event_complete_b_02",
				"npces_reik2_war_camp_event_complete_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"npces_reik2_war_camp_event_complete_b_01",
				"npces_reik2_war_camp_event_complete_b_02",
				"npces_reik2_war_camp_event_complete_b_03",
			},
			sound_events_duration = {
				6.7176456451416,
				5.8440208435059,
				5.1748542785644,
			},
		},
		npc_reik2_war_camp_event_start_a = {
			category = "npc_talk",
			database = "npces_dlc_reikwald_river",
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
				"npces_reik2_war_camp_event_start_a_01",
				"npces_reik2_war_camp_event_start_a_02",
				"npces_reik2_war_camp_event_start_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"npces_reik2_war_camp_event_start_a_01",
				"npces_reik2_war_camp_event_start_a_02",
				"npces_reik2_war_camp_event_start_a_03",
			},
			sound_events_duration = {
				4.1232085227966,
				6.0804166793823,
				8.4245004653931,
			},
		},
	})
end
