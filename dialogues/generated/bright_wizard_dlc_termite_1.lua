-- chunkname: @dialogues/generated/bright_wizard_dlc_termite_1.lua

return function ()
	define_rule({
		name = "pbw_temple_lake_crossing_destroy_bell_complete_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_destroy_bell_complete_a",
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
		name = "pbw_temple_lake_crossing_long_route_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_long_route_a",
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
		name = "pbw_temple_lake_crossing_maze_b",
		probability = 1,
		response = "pbw_temple_lake_crossing_maze_b",
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
				"bright_wizard",
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
		name = "pbw_temple_lake_crossing_red_herring_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_red_herring_a",
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
		name = "pbw_temple_lake_crossing_red_herring_b",
		probability = 1,
		response = "pbw_temple_lake_crossing_red_herring_b",
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
				"bright_wizard",
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
		name = "pbw_temple_lake_crossing_statue_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_statue_a",
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
				OP.LT,
				5,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
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
		name = "pbw_temple_lake_crossing_temple_sighted_elf_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_temple_sighted_elf_a",
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
				"bright_wizard",
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
				"bright_wizard",
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
		name = "pbw_temple_lake_crossing_temple_sighted_no_elf_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_temple_sighted_no_elf_a",
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
				"bright_wizard",
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
				"bright_wizard",
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
		name = "pbw_temple_lake_crossing_toxic_air_a",
		probability = 1,
		response = "pbw_temple_lake_crossing_toxic_air_a",
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
		name = "pbw_temple_sanctum_find_waystone_a",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_a",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
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
		name = "pbw_temple_sanctum_find_waystone_c",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_c",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_temple_sanctum_find_waystone_puzzle_area_open_b",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_puzzle_area_open_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_temple_sanctum_find_waystone_puzzle_first_step_a",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_puzzle_first_step_a",
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
				"temple_slotted_waystone_DUMMY",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_temple_sanctum_find_waystone_puzzle_first_step_b",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_puzzle_first_step_b",
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
				"user_memory",
				"slotted_first_event_piece",
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
	})
	define_rule({
		name = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a",
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
				"flow_gap_piece_blocker",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"flow_event_started",
				OP.EQ,
				1,
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
		name = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_a",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_a",
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
		name = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_broken_a",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_broken_a",
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
		name = "pbw_temple_sanctum_find_waystone_puzzle_start_a",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_puzzle_start_a",
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
		name = "pbw_temple_sanctum_find_waystone_puzzle_start_a_HEARD",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_puzzle_start_a_HEARD",
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
		name = "pbw_temple_sanctum_find_waystone_puzzle_waystone_complete_a",
		probability = 1,
		response = "pbw_temple_sanctum_find_waystone_puzzle_waystone_complete_a",
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
		name = "pbw_temple_sanctum_goods_elevator_a",
		probability = 1,
		response = "pbw_temple_sanctum_goods_elevator_a",
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
		name = "pbw_temple_sanctum_goods_elevator_b",
		probability = 1,
		response = "pbw_temple_sanctum_goods_elevator_b",
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
				"bright_wizard",
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
		name = "pbw_temple_sanctum_great_seal_a",
		probability = 1,
		response = "pbw_temple_sanctum_great_seal_a",
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
				OP.LT,
				5,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
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
		name = "pbw_temple_sanctum_nightmare_gate_a",
		probability = 1,
		response = "pbw_temple_sanctum_nightmare_gate_a",
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
				OP.LT,
				5,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
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
		name = "pbw_temple_sanctum_nightmare_gate_c",
		probability = 1,
		response = "pbw_temple_sanctum_nightmare_gate_c",
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
				"bright_wizard",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
			},
		},
	})
	define_rule({
		name = "pbw_temple_slotted_waystone_DUMMY",
		probability = 1,
		response = "pbw_temple_slotted_waystone_DUMMY",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"temple_slotted_first_event_piece",
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
				"slotted_first_event_piece",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"slotted_first_event_piece",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_temple_start_banter_a",
		probability = 1,
		response = "pbw_temple_start_banter_a",
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
		name = "pbw_temple_start_banter_c",
		probability = 1,
		response = "pbw_temple_start_banter_c",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_temple_wilds_gate_gather_a",
		probability = 1,
		response = "pbw_temple_wilds_gate_gather_a",
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
		name = "pbw_temple_wilds_lake_vista_elf_b",
		probability = 1,
		response = "pbw_temple_wilds_lake_vista_elf_b",
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
				"bright_wizard",
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
		name = "pbw_temple_wilds_lake_vista_no_elf_b",
		probability = 1,
		response = "pbw_temple_wilds_lake_vista_no_elf_b",
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
				"bright_wizard",
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
		pbw_temple_lake_crossing_destroy_bell_complete_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_destroy_bell_complete_a_01",
				[2] = "pbw_temple_lake_crossing_destroy_bell_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_destroy_bell_complete_a_01",
				[2] = "pbw_temple_lake_crossing_destroy_bell_complete_a_02",
			},
			sound_events_duration = {
				[1] = 3.8571667671204,
				[2] = 3.7873542308807,
			},
		},
		pbw_temple_lake_crossing_long_route_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_long_route_a_01",
				[2] = "pbw_temple_lake_crossing_long_route_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_long_route_a_01",
				[2] = "pbw_temple_lake_crossing_long_route_a_02",
			},
			sound_events_duration = {
				[1] = 2.5072915554047,
				[2] = 3.9447083473206,
			},
		},
		pbw_temple_lake_crossing_maze_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_maze_b_01",
				[2] = "pbw_temple_lake_crossing_maze_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_maze_b_01",
				[2] = "pbw_temple_lake_crossing_maze_b_02",
			},
			sound_events_duration = {
				[1] = 2.7371459007263,
				[2] = 3.057416677475,
			},
		},
		pbw_temple_lake_crossing_red_herring_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_red_herring_a_01",
			},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_red_herring_a_01",
			},
			sound_events_duration = {
				[1] = 1.6316875219345,
			},
		},
		pbw_temple_lake_crossing_red_herring_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_red_herring_b_01",
				[2] = "pbw_temple_lake_crossing_red_herring_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_red_herring_b_01",
				[2] = "pbw_temple_lake_crossing_red_herring_b_02",
			},
			sound_events_duration = {
				[1] = 2.8338749408722,
				[2] = 2.7028958797455,
			},
		},
		pbw_temple_lake_crossing_statue_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				"pbw_temple_lake_crossing_statue_a_01",
				"pbw_temple_lake_crossing_statue_a_02",
				"pbw_temple_lake_crossing_statue_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_temple_lake_crossing_statue_a_01",
				"pbw_temple_lake_crossing_statue_a_02",
				"pbw_temple_lake_crossing_statue_a_03",
			},
			sound_events_duration = {
				6.1465001106262,
				4.1352705955505,
				4.0076251029968,
			},
		},
		pbw_temple_lake_crossing_temple_sighted_elf_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_temple_sighted_elf_a_01",
				[2] = "pbw_temple_lake_crossing_temple_sighted_elf_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_temple_sighted_elf_a_01",
				[2] = "pbw_temple_lake_crossing_temple_sighted_elf_a_02",
			},
			sound_events_duration = {
				[1] = 3.8436250686645,
				[2] = 1.8626041412354,
			},
		},
		pbw_temple_lake_crossing_temple_sighted_no_elf_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_temple_sighted_no_elf_a_01",
				[2] = "pbw_temple_lake_crossing_temple_sighted_no_elf_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_temple_sighted_no_elf_a_01",
				[2] = "pbw_temple_lake_crossing_temple_sighted_no_elf_a_02",
			},
			sound_events_duration = {
				[1] = 4.3277916908264,
				[2] = 4.0661873817444,
			},
		},
		pbw_temple_lake_crossing_toxic_air_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_lake_crossing_toxic_air_a_01",
				[2] = "pbw_temple_lake_crossing_toxic_air_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_lake_crossing_toxic_air_a_01",
				[2] = "pbw_temple_lake_crossing_toxic_air_a_02",
			},
			sound_events_duration = {
				[1] = 4.1248960494995,
				[2] = 2.3710625171661,
			},
		},
		pbw_temple_sanctum_find_waystone_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_find_waystone_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_find_waystone_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_a_02",
			},
			sound_events_duration = {
				[1] = 7.6925206184387,
				[2] = 5.7233748435974,
			},
		},
		pbw_temple_sanctum_find_waystone_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_find_waystone_c_01",
				[2] = "pbw_temple_sanctum_find_waystone_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_find_waystone_c_01",
				[2] = "pbw_temple_sanctum_find_waystone_c_02",
			},
			sound_events_duration = {
				[1] = 4.7899374961853,
				[2] = 2.1058125495911,
			},
		},
		pbw_temple_sanctum_find_waystone_puzzle_area_open_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_area_open_b_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_area_open_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_area_open_b_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_area_open_b_02",
			},
			sound_events_duration = {
				[1] = 2.25,
				[2] = 3.6788332462311,
			},
		},
		pbw_temple_sanctum_find_waystone_puzzle_first_step_a = {
			category = "npc_talk",
			database = "bright_wizard_dlc_termite_1",
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
				"pbw_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"pbw_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"pbw_temple_sanctum_find_waystone_puzzle_first_step_a_01",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"pbw_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"pbw_temple_sanctum_find_waystone_puzzle_first_step_a_01",
			},
			sound_events_duration = {
				2.8272082805634,
				2.8272082805634,
				2.8272082805634,
			},
		},
		pbw_temple_sanctum_find_waystone_puzzle_first_step_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_first_step_b_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_first_step_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_first_step_b_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_first_step_b_02",
			},
			sound_events_duration = {
				[1] = 3.4111874103546,
				[2] = 2.9578125476837,
			},
		},
		pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_02",
			},
			sound_events_duration = {
				[1] = 2.385645866394,
				[2] = 2.1721875667572,
			},
		},
		pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_02",
			},
			sound_events_duration = {
				[1] = 4.104875087738,
				[2] = 4.3637499809265,
			},
		},
		pbw_temple_sanctum_find_waystone_puzzle_scaffold_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_a_02",
			},
			sound_events_duration = {
				[1] = 5.1536040306091,
				[2] = 3.0025832653046,
			},
		},
		pbw_temple_sanctum_find_waystone_puzzle_scaffold_broken_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_02",
			},
			sound_events_duration = {
				[1] = 1.6608333587647,
				[2] = 1.6377291679382,
			},
		},
		pbw_temple_sanctum_find_waystone_puzzle_start_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			sound_events_duration = {
				[1] = 3.6199791431427,
				[2] = 2.3020000457764,
			},
		},
		pbw_temple_sanctum_find_waystone_puzzle_start_a_HEARD = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			sound_events_duration = {
				[1] = 3.6199791431427,
				[2] = 2.3020000457764,
			},
		},
		pbw_temple_sanctum_find_waystone_puzzle_waystone_complete_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_waystone_complete_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_waystone_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_find_waystone_puzzle_waystone_complete_a_01",
				[2] = "pbw_temple_sanctum_find_waystone_puzzle_waystone_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.017499923706,
				[2] = 3.0462291240692,
			},
		},
		pbw_temple_sanctum_goods_elevator_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_goods_elevator_a_01",
				[2] = "pbw_temple_sanctum_goods_elevator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_goods_elevator_a_01",
				[2] = "pbw_temple_sanctum_goods_elevator_a_02",
			},
			sound_events_duration = {
				[1] = 3.2878749370575,
				[2] = 3.3079791069031,
			},
		},
		pbw_temple_sanctum_goods_elevator_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_sanctum_goods_elevator_b_01",
				[2] = "pbw_temple_sanctum_goods_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_sanctum_goods_elevator_b_01",
				[2] = "pbw_temple_sanctum_goods_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 2.0282082557678,
				[2] = 3.1820833683014,
			},
		},
		pbw_temple_sanctum_great_seal_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				"pbw_temple_sanctum_great_seal_a_01",
				"pbw_temple_sanctum_great_seal_a_02",
				"pbw_temple_sanctum_great_seal_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_temple_sanctum_great_seal_a_01",
				"pbw_temple_sanctum_great_seal_a_02",
				"pbw_temple_sanctum_great_seal_a_03",
			},
			sound_events_duration = {
				4.2170624732971,
				4.6683540344238,
				4.419979095459,
			},
		},
		pbw_temple_sanctum_nightmare_gate_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				"pbw_temple_sanctum_nightmare_gate_a_01",
				"pbw_temple_sanctum_nightmare_gate_a_02",
				"pbw_temple_sanctum_nightmare_gate_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_temple_sanctum_nightmare_gate_a_01",
				"pbw_temple_sanctum_nightmare_gate_a_02",
				"pbw_temple_sanctum_nightmare_gate_a_03",
			},
			sound_events_duration = {
				3.5265624523163,
				4.2673125267029,
				3.9307498931885,
			},
		},
		pbw_temple_sanctum_nightmare_gate_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				"pbw_temple_sanctum_nightmare_gate_c_01",
				"pbw_temple_sanctum_nightmare_gate_c_02",
				"pbw_temple_sanctum_nightmare_gate_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_temple_sanctum_nightmare_gate_c_01",
				"pbw_temple_sanctum_nightmare_gate_c_02",
				"pbw_temple_sanctum_nightmare_gate_c_03",
			},
			sound_events_duration = {
				2.8604583740234,
				3.8733959197998,
				4.231062412262,
			},
		},
		pbw_temple_slotted_waystone_DUMMY = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "dummy",
			},
			sound_events = {
				[1] = "dummy",
			},
			sound_events_duration = {
				[1] = 0.20000000298023,
			},
		},
		pbw_temple_start_banter_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_start_banter_no_elf_a_01",
				[2] = "pbw_temple_start_banter_no_elf_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_start_banter_no_elf_a_01",
				[2] = "pbw_temple_start_banter_no_elf_a_02",
			},
			sound_events_duration = {
				[1] = 4.7031874656677,
				[2] = 5.1954374313355,
			},
		},
		pbw_temple_start_banter_c = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_start_banter_no_elf_c_01",
				[2] = "pbw_temple_start_banter_no_elf_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_start_banter_no_elf_c_01",
				[2] = "pbw_temple_start_banter_no_elf_c_02",
			},
			sound_events_duration = {
				[1] = 4.3255624771118,
				[2] = 4.5473957061768,
			},
		},
		pbw_temple_wilds_gate_gather_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_gate_gather_a_01",
				[2] = "pbw_temple_wilds_gate_gather_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_wilds_gate_gather_a_01",
				[2] = "pbw_temple_wilds_gate_gather_a_02",
			},
			sound_events_duration = {
				[1] = 2.341500043869,
				[2] = 3.5640833377838,
			},
		},
		pbw_temple_wilds_lake_vista_elf_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_lake_vista_elf_b_01",
				[2] = "pbw_temple_wilds_lake_vista_elf_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_wilds_lake_vista_elf_b_01",
				[2] = "pbw_temple_wilds_lake_vista_elf_b_02",
			},
			sound_events_duration = {
				[1] = 4.1053748130798,
				[2] = 4.310604095459,
			},
		},
		pbw_temple_wilds_lake_vista_no_elf_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_termite_1",
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
				[1] = "pbw_temple_wilds_lake_vista_no_elf_b_01",
				[2] = "pbw_temple_wilds_lake_vista_no_elf_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_temple_wilds_lake_vista_no_elf_b_01",
				[2] = "pbw_temple_wilds_lake_vista_no_elf_b_02",
			},
			sound_events_duration = {
				[1] = 4.4859790802002,
				[2] = 3.6209583282471,
			},
		},
	})
end
