-- chunkname: @dialogues/generated/witch_hunter_dlc_termite_1.lua

return function ()
	define_rule({
		name = "pwh_temple_lake_crossing_destroy_bell_complete_a",
		probability = 1,
		response = "pwh_temple_lake_crossing_destroy_bell_complete_a",
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
				"temple_lake_crossing_destroy_bell_complete_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"temple_lake_crossing_destroy_bell_complete",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_destroy_bell_complete",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_long_route_a",
		probability = 1,
		response = "pwh_temple_lake_crossing_long_route_a",
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
				"temple_lake_crossing_long_route_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"temple_lake_crossing_long_route",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_long_route",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_maze_b",
		probability = 1,
		response = "pwh_temple_lake_crossing_maze_b",
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
				"temple_lake_crossing_maze_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_red_herring_a",
		probability = 1,
		response = "pwh_temple_lake_crossing_red_herring_a",
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
				"temple_lake_crossing_red_herring_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"temple_lake_crossing_red_herring",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_red_herring",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_red_herring_b",
		probability = 1,
		response = "pwh_temple_lake_crossing_red_herring_b",
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
				"temple_lake_crossing_red_herring_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_statue_b",
		probability = 1,
		response = "pwh_temple_lake_crossing_statue_b",
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
				"temple_lake_crossing_statue_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_temple_sighted_elf_a",
		probability = 1,
		response = "pwh_temple_lake_crossing_temple_sighted_elf_a",
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
				"temple_lake_crossing_temple_sighted",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"temple_lake_crossing_temple_sighted",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_temple_sighted",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_temple_sighted_no_elf_a",
		probability = 1,
		response = "pwh_temple_lake_crossing_temple_sighted_no_elf_a",
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
				"temple_lake_crossing_temple_sighted",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"temple_lake_crossing_temple_sighted",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_temple_sighted",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_lake_crossing_toxic_air_a",
		probability = 1,
		response = "pwh_temple_lake_crossing_toxic_air_a",
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
				"temple_lake_crossing_toxic_air_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"temple_lake_crossing_toxic_air",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_toxic_air",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_sanctum_find_waystone_c",
		probability = 1,
		response = "pwh_temple_sanctum_find_waystone_c",
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
				"nik_temple_sanctum_find_waystone_b",
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
		name = "pwh_temple_sanctum_find_waystone_puzzle_area_open_b",
		probability = 1,
		response = "pwh_temple_sanctum_find_waystone_puzzle_area_open_b",
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
				"temple_sanctum_find_waystone_puzzle_area_open_a",
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
		name = "pwh_temple_sanctum_find_waystone_puzzle_first_step_b",
		probability = 1,
		response = "pwh_temple_sanctum_find_waystone_puzzle_first_step_b",
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
				"temple_sanctum_find_waystone_puzzle_first_step_a",
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
		name = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a",
		probability = 1,
		response = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a",
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
				"temple_sanctum_find_waystone_puzzle_fragment_through_gap_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"flow_event_started",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"flow_gap_piece_blocker",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_fragment_through_gap",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_fragment_through_gap",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b",
		probability = 1,
		response = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b",
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
				"temple_sanctum_find_waystone_puzzle_fragment_through_gap_a",
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
		name = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_a",
		probability = 1,
		response = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_a",
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
				"temple_sanctum_find_waystone_puzzle_scaffold_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_scaffold",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_scaffold",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_broken_a",
		probability = 1,
		response = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_broken_a",
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
				"temple_sanctum_find_waystone_puzzle_scaffold_broken_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_scaffold_broken",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_scaffold_broken",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_sanctum_find_waystone_puzzle_start_a",
		probability = 1,
		response = "pwh_temple_sanctum_find_waystone_puzzle_start_a",
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
				"temple_sanctum_find_waystone_puzzle_start_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_start",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_start",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_sanctum_find_waystone_puzzle_start_a_HEARD",
		probability = 1,
		response = "pwh_temple_sanctum_find_waystone_puzzle_start_a_HEARD",
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
				"temple_sanctum_find_waystone_c",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"flow_found_waystone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_start",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_start",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_sanctum_find_waystone_puzzle_waystone_complete_a",
		probability = 1,
		response = "pwh_temple_sanctum_find_waystone_puzzle_waystone_complete_a",
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
				"temple_sanctum_find_waystone_puzzle_waystone_complete_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_waystone_complete",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_waystone_complete",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_sanctum_goods_elevator_a",
		probability = 1,
		response = "pwh_temple_sanctum_goods_elevator_a",
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
				"temple_sanctum_goods_elevator_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"temple_sanctum_goods_elevator",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_goods_elevator",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_sanctum_goods_elevator_b",
		probability = 1,
		response = "pwh_temple_sanctum_goods_elevator_b",
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
				"temple_sanctum_goods_elevator_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwh_temple_sanctum_great_seal_b",
		probability = 1,
		response = "pwh_temple_sanctum_great_seal_b",
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
				"temple_sanctum_great_seal_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwh_temple_sanctum_nightmare_gate_d",
		probability = 1,
		response = "pwh_temple_sanctum_nightmare_gate_d",
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
				"temple_sanctum_nightmare_gate_c",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwh_temple_start_banter_a",
		probability = 1,
		response = "pwh_temple_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"start_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"start_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_start_banter_c",
		probability = 1,
		response = "pwh_temple_start_banter_c",
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
				"temple_start_banter_b",
			},
			{
				"global_context",
				"wood_elf",
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
	})
	define_rule({
		name = "pwh_temple_wilds_gate_gather_a",
		probability = 1,
		response = "pwh_temple_wilds_gate_gather_a",
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
				"temple_wilds_gate_gather_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"temple_wilds_gate_gather",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_gate_gather",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_temple_wilds_lake_vista_elf_b",
		probability = 1,
		response = "pwh_temple_wilds_lake_vista_elf_b",
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
				"temple_wilds_lake_vista_elf_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	define_rule({
		name = "pwh_temple_wilds_lake_vista_no_elf_b",
		probability = 1,
		response = "pwh_temple_wilds_lake_vista_no_elf_b",
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
				"temple_wilds_lake_vista_no_elf_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
		},
	})
	add_dialogues({
		pwh_temple_lake_crossing_destroy_bell_complete_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_destroy_bell_complete_a_01",
				[2] = "pwh_temple_lake_crossing_destroy_bell_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_destroy_bell_complete_a_01",
				[2] = "pwh_temple_lake_crossing_destroy_bell_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.0406250953674,
				[2] = 3.2609167098999,
			},
		},
		pwh_temple_lake_crossing_long_route_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_long_route_a_01",
				[2] = "pwh_temple_lake_crossing_long_route_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_long_route_a_01",
				[2] = "pwh_temple_lake_crossing_long_route_a_02",
			},
			sound_events_duration = {
				[1] = 4.0943751335144,
				[2] = 4.0281667709351,
			},
		},
		pwh_temple_lake_crossing_maze_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_maze_b_01",
				[2] = "pwh_temple_lake_crossing_maze_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_maze_b_01",
				[2] = "pwh_temple_lake_crossing_maze_b_02",
			},
			sound_events_duration = {
				[1] = 2.5472083091736,
				[2] = 3.2230207920074,
			},
		},
		pwh_temple_lake_crossing_red_herring_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_red_herring_a_01",
			},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_red_herring_a_01",
			},
			sound_events_duration = {
				[1] = 3.9593749046326,
			},
		},
		pwh_temple_lake_crossing_red_herring_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_red_herring_b_01",
				[2] = "pwh_temple_lake_crossing_red_herring_b_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_red_herring_b_01",
				[2] = "pwh_temple_lake_crossing_red_herring_b_01",
			},
			sound_events_duration = {
				[1] = 2.1832082271576,
				[2] = 2.1832082271576,
			},
		},
		pwh_temple_lake_crossing_statue_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				"pwh_temple_lake_crossing_statue_b_01",
				"pwh_temple_lake_crossing_statue_b_02",
				"pwh_temple_lake_crossing_statue_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_temple_lake_crossing_statue_b_01",
				"pwh_temple_lake_crossing_statue_b_02",
				"pwh_temple_lake_crossing_statue_b_03",
			},
			sound_events_duration = {
				3.9852499961853,
				3.8012292385101,
				2.6025624275208,
			},
		},
		pwh_temple_lake_crossing_temple_sighted_elf_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_temple_sighted_elf_a_01",
				[2] = "pwh_temple_lake_crossing_temple_sighted_elf_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_temple_sighted_elf_a_01",
				[2] = "pwh_temple_lake_crossing_temple_sighted_elf_a_02",
			},
			sound_events_duration = {
				[1] = 4.3559374809265,
				[2] = 5.1979789733887,
			},
		},
		pwh_temple_lake_crossing_temple_sighted_no_elf_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_temple_sighted_no_elf_a_01",
				[2] = "pwh_temple_lake_crossing_temple_sighted_no_elf_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_temple_sighted_no_elf_a_01",
				[2] = "pwh_temple_lake_crossing_temple_sighted_no_elf_a_02",
			},
			sound_events_duration = {
				[1] = 5.547375202179,
				[2] = 5.7672500610352,
			},
		},
		pwh_temple_lake_crossing_toxic_air_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_lake_crossing_toxic_air_a_01",
				[2] = "pwh_temple_lake_crossing_toxic_air_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_lake_crossing_toxic_air_a_01",
				[2] = "pwh_temple_lake_crossing_toxic_air_a_02",
			},
			sound_events_duration = {
				[1] = 5.452166557312,
				[2] = 5.7579793930054,
			},
		},
		pwh_temple_sanctum_find_waystone_c = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_find_waystone_c_01",
				[2] = "pwh_temple_sanctum_find_waystone_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_find_waystone_c_01",
				[2] = "pwh_temple_sanctum_find_waystone_c_02",
			},
			sound_events_duration = {
				[1] = 5.8026456832886,
				[2] = 6.1887497901917,
			},
		},
		pwh_temple_sanctum_find_waystone_puzzle_area_open_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_area_open_b_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_area_open_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_area_open_b_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_area_open_b_02",
			},
			sound_events_duration = {
				[1] = 2.1449999809265,
				[2] = 5.2000207901001,
			},
		},
		pwh_temple_sanctum_find_waystone_puzzle_first_step_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_first_step_b_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_first_step_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_first_step_b_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_first_step_b_02",
			},
			sound_events_duration = {
				[1] = 5.5347709655762,
				[2] = 3.1658959388733,
			},
		},
		pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_02",
			},
			sound_events_duration = {
				[1] = 7.8779373168945,
				[2] = 3.9197916984558,
			},
		},
		pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_02",
			},
			sound_events_duration = {
				[1] = 5.4726457595825,
				[2] = 4.5065207481384,
			},
		},
		pwh_temple_sanctum_find_waystone_puzzle_scaffold_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_a_02",
			},
			sound_events_duration = {
				[1] = 5.5982708930969,
				[2] = 3.4254791736603,
			},
		},
		pwh_temple_sanctum_find_waystone_puzzle_scaffold_broken_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_02",
			},
			sound_events_duration = {
				[1] = 2.8378748893738,
				[2] = 2.8829998970032,
			},
		},
		pwh_temple_sanctum_find_waystone_puzzle_start_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			sound_events_duration = {
				[1] = 4.2896251678467,
				[2] = 3.6496458053589,
			},
		},
		pwh_temple_sanctum_find_waystone_puzzle_start_a_HEARD = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			sound_events_duration = {
				[1] = 4.2896251678467,
				[2] = 3.6496458053589,
			},
		},
		pwh_temple_sanctum_find_waystone_puzzle_waystone_complete_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_waystone_complete_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_waystone_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_find_waystone_puzzle_waystone_complete_a_01",
				[2] = "pwh_temple_sanctum_find_waystone_puzzle_waystone_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.7458748817444,
				[2] = 2.5702290534973,
			},
		},
		pwh_temple_sanctum_goods_elevator_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_goods_elevator_a_01",
				[2] = "pwh_temple_sanctum_goods_elevator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_goods_elevator_a_01",
				[2] = "pwh_temple_sanctum_goods_elevator_a_02",
			},
			sound_events_duration = {
				[1] = 1.5741875171661,
				[2] = 1.630979180336,
			},
		},
		pwh_temple_sanctum_goods_elevator_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_sanctum_goods_elevator_b_01",
				[2] = "pwh_temple_sanctum_goods_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_sanctum_goods_elevator_b_01",
				[2] = "pwh_temple_sanctum_goods_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 7.1333332061768,
				[2] = 4.1353125572205,
			},
		},
		pwh_temple_sanctum_great_seal_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				"pwh_temple_sanctum_great_seal_b_01",
				"pwh_temple_sanctum_great_seal_b_02",
				"pwh_temple_sanctum_great_seal_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_temple_sanctum_great_seal_b_01",
				"pwh_temple_sanctum_great_seal_b_02",
				"pwh_temple_sanctum_great_seal_b_03",
			},
			sound_events_duration = {
				2.5989999771118,
				2.0822501182556,
				1.4603542089462,
			},
		},
		pwh_temple_sanctum_nightmare_gate_d = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			override_awareness = "override_nightmare_gate_c_done",
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
				"pwh_temple_sanctum_nightmare_gate_d_01",
				"pwh_temple_sanctum_nightmare_gate_d_02",
				"pwh_temple_sanctum_nightmare_gate_d_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_temple_sanctum_nightmare_gate_d_01",
				"pwh_temple_sanctum_nightmare_gate_d_02",
				"pwh_temple_sanctum_nightmare_gate_d_03",
			},
			sound_events_duration = {
				4.8527293205261,
				3.8186874389648,
				4.9856457710266,
			},
		},
		pwh_temple_start_banter_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_start_banter_no_elf_a_01",
				[2] = "pwh_temple_start_banter_no_elf_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_start_banter_no_elf_a_01",
				[2] = "pwh_temple_start_banter_no_elf_a_02",
			},
			sound_events_duration = {
				[1] = 4.3877501487732,
				[2] = 6.581666469574,
			},
		},
		pwh_temple_start_banter_c = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_start_banter_no_elf_c_01",
				[2] = "pwh_temple_start_banter_no_elf_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_start_banter_no_elf_c_01",
				[2] = "pwh_temple_start_banter_no_elf_c_02",
			},
			sound_events_duration = {
				[1] = 5.8237709999084,
				[2] = 5.0287499427795,
			},
		},
		pwh_temple_wilds_gate_gather_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_gate_gather_a_01",
				[2] = "pwh_temple_wilds_gate_gather_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_wilds_gate_gather_a_01",
				[2] = "pwh_temple_wilds_gate_gather_a_02",
			},
			sound_events_duration = {
				[1] = 4.0975623130798,
				[2] = 3.8862917423248,
			},
		},
		pwh_temple_wilds_lake_vista_elf_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_lake_vista_elf_b_01",
				[2] = "pwh_temple_wilds_lake_vista_elf_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_wilds_lake_vista_elf_b_01",
				[2] = "pwh_temple_wilds_lake_vista_elf_b_02",
			},
			sound_events_duration = {
				[1] = 6.5592083930969,
				[2] = 7.8923125267029,
			},
		},
		pwh_temple_wilds_lake_vista_no_elf_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_termite_1",
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
				[1] = "pwh_temple_wilds_lake_vista_no_elf_b_01",
				[2] = "pwh_temple_wilds_lake_vista_no_elf_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_temple_wilds_lake_vista_no_elf_b_01",
				[2] = "pwh_temple_wilds_lake_vista_no_elf_b_02",
			},
			sound_events_duration = {
				[1] = 8.3492918014526,
				[2] = 3.8160417079926,
			},
		},
	})
end
