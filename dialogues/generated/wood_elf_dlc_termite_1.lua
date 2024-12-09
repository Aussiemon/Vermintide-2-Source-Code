-- chunkname: @dialogues/generated/wood_elf_dlc_termite_1.lua

return function ()
	define_rule({
		name = "pwe_temple_lake_crossing_destroy_bell_complete_a",
		probability = 1,
		response = "pwe_temple_lake_crossing_destroy_bell_complete_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_lake_crossing_long_route_a",
		probability = 1,
		response = "pwe_temple_lake_crossing_long_route_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_lake_crossing_maze_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_maze_b",
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
				"wood_elf",
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
		name = "pwe_temple_lake_crossing_red_herring_a",
		probability = 1,
		response = "pwe_temple_lake_crossing_red_herring_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_lake_crossing_red_herring_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_red_herring_b",
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
				"wood_elf",
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
		name = "pwe_temple_lake_crossing_statue_a",
		probability = 1,
		response = "pwe_temple_lake_crossing_statue_a",
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
				"temple_lake_crossing_statue_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"temple_lake_crossing_statue_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_statue_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_temple_lake_crossing_temple_sighted_elf_b",
		probability = 1,
		response = "pwe_temple_lake_crossing_temple_sighted_elf_b",
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
				"temple_lake_crossing_temple_sighted_elf_a",
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
		name = "pwe_temple_lake_crossing_toxic_air_a",
		probability = 1,
		response = "pwe_temple_lake_crossing_toxic_air_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_sanctum_find_waystone_a",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"override_nightmare_gate_c_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_temple_sanctum_find_waystone_c",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_c",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_temple_sanctum_find_waystone_puzzle_area_open_b",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_puzzle_area_open_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_temple_sanctum_find_waystone_puzzle_first_step_a",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_puzzle_first_step_a",
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
				"temple_sanctum_find_waystone_puzzle_first_step_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_first_step",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_first_step",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_temple_sanctum_find_waystone_puzzle_first_step_b",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_puzzle_first_step_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_a",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_broken_a",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_broken_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_sanctum_find_waystone_puzzle_start_a",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_puzzle_start_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_sanctum_find_waystone_puzzle_start_a_HEARD",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_puzzle_start_a_HEARD",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_sanctum_find_waystone_puzzle_waystone_complete_a",
		probability = 1,
		response = "pwe_temple_sanctum_find_waystone_puzzle_waystone_complete_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_sanctum_goods_elevator_a",
		probability = 1,
		response = "pwe_temple_sanctum_goods_elevator_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_sanctum_goods_elevator_b",
		probability = 1,
		response = "pwe_temple_sanctum_goods_elevator_b",
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
				"wood_elf",
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
		name = "pwe_temple_sanctum_great_seal_a",
		probability = 1,
		response = "pwe_temple_sanctum_great_seal_a",
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
				"temple_sanctum_great_seal_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"temple_sanctum_great_seal_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_great_seal_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_temple_sanctum_nightmare_gate_a",
		probability = 1,
		response = "pwe_temple_sanctum_nightmare_gate_a",
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
				"temple_sanctum_nightmare_gate_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"temple_sanctum_nightmare_gate_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_nightmare_gate_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_temple_sanctum_nightmare_gate_c",
		probability = 1,
		response = "pwe_temple_sanctum_nightmare_gate_c",
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
				"temple_sanctum_nightmare_gate_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_start_banter_c",
		probability = 1,
		response = "pwe_temple_start_banter_c",
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
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_temple_wilds_gate_gather_a",
		probability = 1,
		response = "pwe_temple_wilds_gate_gather_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_temple_wilds_lake_vista_elf_a",
		probability = 1,
		response = "pwe_temple_wilds_lake_vista_elf_a",
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
				"temple_wilds_lake_vista",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"faction_memory",
				"temple_wilds_lake_vista",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_wilds_lake_vista",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pwe_temple_lake_crossing_destroy_bell_complete_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_destroy_bell_complete_a_01",
				[2] = "pwe_temple_lake_crossing_destroy_bell_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_destroy_bell_complete_a_01",
				[2] = "pwe_temple_lake_crossing_destroy_bell_complete_a_02",
			},
			sound_events_duration = {
				[1] = 4.7791457176208,
				[2] = 4.1132707595825,
			},
		},
		pwe_temple_lake_crossing_long_route_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_long_route_a_01",
				[2] = "pwe_temple_lake_crossing_long_route_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_long_route_a_01",
				[2] = "pwe_temple_lake_crossing_long_route_a_02",
			},
			sound_events_duration = {
				[1] = 4.0111041069031,
				[2] = 3.05433344841,
			},
		},
		pwe_temple_lake_crossing_maze_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_maze_b_01",
				[2] = "pwe_temple_lake_crossing_maze_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_maze_b_01",
				[2] = "pwe_temple_lake_crossing_maze_b_02",
			},
			sound_events_duration = {
				[1] = 3.2932500839233,
				[2] = 3.4497709274292,
			},
		},
		pwe_temple_lake_crossing_red_herring_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_red_herring_a_01",
			},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_red_herring_a_01",
			},
			sound_events_duration = {
				[1] = 1.8803750276566,
			},
		},
		pwe_temple_lake_crossing_red_herring_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_red_herring_b_01",
				[2] = "pwe_temple_lake_crossing_red_herring_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_red_herring_b_01",
				[2] = "pwe_temple_lake_crossing_red_herring_b_02",
			},
			sound_events_duration = {
				[1] = 4.1457500457764,
				[2] = 3.8197500705719,
			},
		},
		pwe_temple_lake_crossing_statue_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				"pwe_temple_lake_crossing_statue_a_01",
				"pwe_temple_lake_crossing_statue_a_02",
				"pwe_temple_lake_crossing_statue_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_temple_lake_crossing_statue_a_01",
				"pwe_temple_lake_crossing_statue_a_02",
				"pwe_temple_lake_crossing_statue_a_03",
			},
			sound_events_duration = {
				4.7793126106262,
				5.1598124504089,
				5.1540207862854,
			},
		},
		pwe_temple_lake_crossing_temple_sighted_elf_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_1",
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
				"pwe_temple_lake_crossing_temple_sighted_elf_b_01",
				"pwe_temple_lake_crossing_temple_sighted_elf_b_02",
				"pwe_temple_lake_crossing_temple_sighted_elf_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_temple_lake_crossing_temple_sighted_elf_b_01",
				"pwe_temple_lake_crossing_temple_sighted_elf_b_02",
				"pwe_temple_lake_crossing_temple_sighted_elf_b_03",
			},
			sound_events_duration = {
				4.1878123283386,
				3.2399792671204,
				7.0784792900085,
			},
		},
		pwe_temple_lake_crossing_toxic_air_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_lake_crossing_toxic_air_a_01",
				[2] = "pwe_temple_lake_crossing_toxic_air_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_lake_crossing_toxic_air_a_01",
				[2] = "pwe_temple_lake_crossing_toxic_air_a_02",
			},
			sound_events_duration = {
				[1] = 4.3627915382385,
				[2] = 3.8247709274292,
			},
		},
		pwe_temple_sanctum_find_waystone_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_find_waystone_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_find_waystone_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_a_02",
			},
			sound_events_duration = {
				[1] = 7.8794374465942,
				[2] = 7.2752289772034,
			},
		},
		pwe_temple_sanctum_find_waystone_c = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_find_waystone_c_01",
				[2] = "pwe_temple_sanctum_find_waystone_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_find_waystone_c_01",
				[2] = "pwe_temple_sanctum_find_waystone_c_02",
			},
			sound_events_duration = {
				[1] = 5.4270000457764,
				[2] = 4.2162499427795,
			},
		},
		pwe_temple_sanctum_find_waystone_puzzle_area_open_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_area_open_b_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_area_open_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_area_open_b_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_area_open_b_02",
			},
			sound_events_duration = {
				[1] = 1.7960208654404,
				[2] = 3.6965208053589,
			},
		},
		pwe_temple_sanctum_find_waystone_puzzle_first_step_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				"pwe_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"pwe_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"pwe_temple_sanctum_find_waystone_puzzle_first_step_a_01",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"pwe_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"pwe_temple_sanctum_find_waystone_puzzle_first_step_a_01",
			},
			sound_events_duration = {
				6.1893749237061,
				6.1893749237061,
				6.1893749237061,
			},
		},
		pwe_temple_sanctum_find_waystone_puzzle_first_step_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_first_step_b_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_first_step_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_first_step_b_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_first_step_b_02",
			},
			sound_events_duration = {
				[1] = 1.5210624933243,
				[2] = 3.3029792308807,
			},
		},
		pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_02",
			},
			sound_events_duration = {
				[1] = 2.4440417289734,
				[2] = 3.129145860672,
			},
		},
		pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_02",
			},
			sound_events_duration = {
				[1] = 3.8335626125336,
				[2] = 4.6945624351502,
			},
		},
		pwe_temple_sanctum_find_waystone_puzzle_scaffold_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_a_02",
			},
			sound_events_duration = {
				[1] = 3.0475416183472,
				[2] = 2.5034375190735,
			},
		},
		pwe_temple_sanctum_find_waystone_puzzle_scaffold_broken_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_02",
			},
			sound_events_duration = {
				[1] = 3.2240207195282,
				[2] = 2.6424584388733,
			},
		},
		pwe_temple_sanctum_find_waystone_puzzle_start_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			sound_events_duration = {
				[1] = 4.6243333816528,
				[2] = 4.5185208320618,
			},
		},
		pwe_temple_sanctum_find_waystone_puzzle_start_a_HEARD = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			sound_events_duration = {
				[1] = 4.6243333816528,
				[2] = 4.5185208320618,
			},
		},
		pwe_temple_sanctum_find_waystone_puzzle_waystone_complete_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_waystone_complete_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_waystone_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_find_waystone_puzzle_waystone_complete_a_01",
				[2] = "pwe_temple_sanctum_find_waystone_puzzle_waystone_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.2112290859222,
				[2] = 2.58629155159,
			},
		},
		pwe_temple_sanctum_goods_elevator_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_goods_elevator_a_01",
				[2] = "pwe_temple_sanctum_goods_elevator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_goods_elevator_a_01",
				[2] = "pwe_temple_sanctum_goods_elevator_a_02",
			},
			sound_events_duration = {
				[1] = 4.2344164848328,
				[2] = 2.8243749141693,
			},
		},
		pwe_temple_sanctum_goods_elevator_b = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_sanctum_goods_elevator_b_01",
				[2] = "pwe_temple_sanctum_goods_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_sanctum_goods_elevator_b_01",
				[2] = "pwe_temple_sanctum_goods_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 3.6114165782928,
				[2] = 2.4546248912811,
			},
		},
		pwe_temple_sanctum_great_seal_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				"pwe_temple_sanctum_great_seal_a_01",
				"pwe_temple_sanctum_great_seal_a_02",
				"pwe_temple_sanctum_great_seal_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_temple_sanctum_great_seal_a_01",
				"pwe_temple_sanctum_great_seal_a_02",
				"pwe_temple_sanctum_great_seal_a_03",
			},
			sound_events_duration = {
				4.9197502136231,
				4.4678335189819,
				2.7828125953674,
			},
		},
		pwe_temple_sanctum_nightmare_gate_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				"pwe_temple_sanctum_nightmare_gate_a_01",
				"pwe_temple_sanctum_nightmare_gate_a_02",
				"pwe_temple_sanctum_nightmare_gate_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_temple_sanctum_nightmare_gate_a_01",
				"pwe_temple_sanctum_nightmare_gate_a_02",
				"pwe_temple_sanctum_nightmare_gate_a_03",
			},
			sound_events_duration = {
				4.8817081451416,
				5.5514168739319,
				4.5102291107178,
			},
		},
		pwe_temple_sanctum_nightmare_gate_c = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				"pwe_temple_sanctum_nightmare_gate_c_01",
				"pwe_temple_sanctum_nightmare_gate_c_02",
				"pwe_temple_sanctum_nightmare_gate_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_temple_sanctum_nightmare_gate_c_01",
				"pwe_temple_sanctum_nightmare_gate_c_02",
				"pwe_temple_sanctum_nightmare_gate_c_03",
			},
			sound_events_duration = {
				3.3976459503174,
				2.3205833435059,
				2.9447083473206,
			},
		},
		pwe_temple_start_banter_c = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_1",
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
				"pwe_temple_start_banter_elf_b_01",
				"pwe_temple_start_banter_elf_b_02",
				"pwe_temple_start_banter_elf_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_temple_start_banter_elf_b_01",
				"pwe_temple_start_banter_elf_b_02",
				"pwe_temple_start_banter_elf_b_03",
			},
			sound_events_duration = {
				8.1058540344238,
				9.1108541488647,
				8.5458335876465,
			},
		},
		pwe_temple_wilds_gate_gather_a = {
			category = "level_talk",
			database = "wood_elf_dlc_termite_1",
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
				[1] = "pwe_temple_wilds_gate_gather_a_01",
				[2] = "pwe_temple_wilds_gate_gather_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_temple_wilds_gate_gather_a_01",
				[2] = "pwe_temple_wilds_gate_gather_a_02",
			},
			sound_events_duration = {
				[1] = 2.4403541088104,
				[2] = 2.7708332538605,
			},
		},
		pwe_temple_wilds_lake_vista_elf_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_termite_1",
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
				"pwe_temple_wilds_lake_vista_elf_a_01",
				"pwe_temple_wilds_lake_vista_elf_a_02",
				"pwe_temple_wilds_lake_vista_elf_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_temple_wilds_lake_vista_elf_a_01",
				"pwe_temple_wilds_lake_vista_elf_a_02",
				"pwe_temple_wilds_lake_vista_elf_a_03",
			},
			sound_events_duration = {
				8.3930416107178,
				8.4103746414185,
				8.3267498016357,
			},
		},
	})
end
