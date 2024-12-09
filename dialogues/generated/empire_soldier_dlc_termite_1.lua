-- chunkname: @dialogues/generated/empire_soldier_dlc_termite_1.lua

return function ()
	define_rule({
		name = "pes_temple_lake_crossing_destroy_bell_complete_a",
		probability = 1,
		response = "pes_temple_lake_crossing_destroy_bell_complete_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_lake_crossing_long_route_a",
		probability = 1,
		response = "pes_temple_lake_crossing_long_route_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_lake_crossing_maze_b",
		probability = 1,
		response = "pes_temple_lake_crossing_maze_b",
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
				"empire_soldier",
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
		name = "pes_temple_lake_crossing_red_herring_a",
		probability = 1,
		response = "pes_temple_lake_crossing_red_herring_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_lake_crossing_red_herring_b",
		probability = 1,
		response = "pes_temple_lake_crossing_red_herring_b",
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
				"empire_soldier",
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
		name = "pes_temple_lake_crossing_statue_b",
		probability = 1,
		response = "pes_temple_lake_crossing_statue_b",
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
				"empire_soldier",
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
		name = "pes_temple_lake_crossing_temple_sighted_elf_a",
		probability = 1,
		response = "pes_temple_lake_crossing_temple_sighted_elf_a",
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
				"empire_soldier",
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
				"empire_soldier",
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
		name = "pes_temple_lake_crossing_temple_sighted_no_elf_a",
		probability = 1,
		response = "pes_temple_lake_crossing_temple_sighted_no_elf_a",
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
				"empire_soldier",
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
				"empire_soldier",
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
		name = "pes_temple_lake_crossing_toxic_air_a",
		probability = 1,
		response = "pes_temple_lake_crossing_toxic_air_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_sanctum_find_waystone_c",
		probability = 1,
		response = "pes_temple_sanctum_find_waystone_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_temple_sanctum_find_waystone_puzzle_area_open_b",
		probability = 1,
		response = "pes_temple_sanctum_find_waystone_puzzle_area_open_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_temple_sanctum_find_waystone_puzzle_first_step_b",
		probability = 1,
		response = "pes_temple_sanctum_find_waystone_puzzle_first_step_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a",
		probability = 1,
		response = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b",
		probability = 1,
		response = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_temple_sanctum_find_waystone_puzzle_scaffold_a",
		probability = 1,
		response = "pes_temple_sanctum_find_waystone_puzzle_scaffold_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_sanctum_find_waystone_puzzle_scaffold_broken_a",
		probability = 1,
		response = "pes_temple_sanctum_find_waystone_puzzle_scaffold_broken_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_sanctum_find_waystone_puzzle_start_a",
		probability = 1,
		response = "pes_temple_sanctum_find_waystone_puzzle_start_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_sanctum_find_waystone_puzzle_start_a_HEARD",
		probability = 1,
		response = "pes_temple_sanctum_find_waystone_puzzle_start_a_HEARD",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_sanctum_find_waystone_puzzle_waystone_complete_a",
		probability = 1,
		response = "pes_temple_sanctum_find_waystone_puzzle_waystone_complete_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_sanctum_goods_elevator_a",
		probability = 1,
		response = "pes_temple_sanctum_goods_elevator_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_sanctum_goods_elevator_b",
		probability = 1,
		response = "pes_temple_sanctum_goods_elevator_b",
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
				"empire_soldier",
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
		name = "pes_temple_sanctum_great_seal_b",
		probability = 1,
		response = "pes_temple_sanctum_great_seal_b",
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
				"empire_soldier",
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
		name = "pes_temple_sanctum_nightmare_gate_d",
		probability = 1,
		response = "pes_temple_sanctum_nightmare_gate_d",
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
				"empire_soldier",
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
		name = "pes_temple_start_banter_a",
		probability = 1,
		response = "pes_temple_start_banter_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_start_banter_c",
		probability = 1,
		response = "pes_temple_start_banter_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_temple_wilds_gate_gather_a",
		probability = 1,
		response = "pes_temple_wilds_gate_gather_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_temple_wilds_lake_vista_elf_b",
		probability = 1,
		response = "pes_temple_wilds_lake_vista_elf_b",
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
				"empire_soldier",
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
		name = "pes_temple_wilds_lake_vista_no_elf_b",
		probability = 1,
		response = "pes_temple_wilds_lake_vista_no_elf_b",
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
				"empire_soldier",
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
		pes_temple_lake_crossing_destroy_bell_complete_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_destroy_bell_complete_a_01",
				[2] = "pes_temple_lake_crossing_destroy_bell_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_lake_crossing_destroy_bell_complete_a_01",
				[2] = "pes_temple_lake_crossing_destroy_bell_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.5174584388733,
				[2] = 2.6426250934601,
			},
		},
		pes_temple_lake_crossing_long_route_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_long_route_a_01",
				[2] = "pes_temple_lake_crossing_long_route_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_lake_crossing_long_route_a_01",
				[2] = "pes_temple_lake_crossing_long_route_a_02",
			},
			sound_events_duration = {
				[1] = 3.0733749866486,
				[2] = 4.0265626907349,
			},
		},
		pes_temple_lake_crossing_maze_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_maze_b_01",
				[2] = "pes_temple_lake_crossing_maze_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_lake_crossing_maze_b_01",
				[2] = "pes_temple_lake_crossing_maze_b_02",
			},
			sound_events_duration = {
				[1] = 2.3557915687561,
				[2] = 2.1555209159851,
			},
		},
		pes_temple_lake_crossing_red_herring_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_red_herring_a_01",
			},
			sound_events = {
				[1] = "pes_temple_lake_crossing_red_herring_a_01",
			},
			sound_events_duration = {
				[1] = 3.8632082939148,
			},
		},
		pes_temple_lake_crossing_red_herring_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_red_herring_b_01",
				[2] = "pes_temple_lake_crossing_red_herring_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_lake_crossing_red_herring_b_01",
				[2] = "pes_temple_lake_crossing_red_herring_b_02",
			},
			sound_events_duration = {
				[1] = 5.1814165115356,
				[2] = 5.4673748016357,
			},
		},
		pes_temple_lake_crossing_statue_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				"pes_temple_lake_crossing_statue_b_01",
				"pes_temple_lake_crossing_statue_b_02",
				"pes_temple_lake_crossing_statue_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_temple_lake_crossing_statue_b_01",
				"pes_temple_lake_crossing_statue_b_02",
				"pes_temple_lake_crossing_statue_b_03",
			},
			sound_events_duration = {
				1.6343749761581,
				2.5264582633972,
				2.7484166622162,
			},
		},
		pes_temple_lake_crossing_temple_sighted_elf_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_temple_sighted_elf_a_01",
				[2] = "pes_temple_lake_crossing_temple_sighted_elf_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_lake_crossing_temple_sighted_elf_a_01",
				[2] = "pes_temple_lake_crossing_temple_sighted_elf_a_02",
			},
			sound_events_duration = {
				[1] = 2.9670832157135,
				[2] = 2.470062494278,
			},
		},
		pes_temple_lake_crossing_temple_sighted_no_elf_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_temple_sighted_no_elf_a_01",
				[2] = "pes_temple_lake_crossing_temple_sighted_no_elf_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_lake_crossing_temple_sighted_no_elf_a_01",
				[2] = "pes_temple_lake_crossing_temple_sighted_no_elf_a_02",
			},
			sound_events_duration = {
				[1] = 3.3168332576752,
				[2] = 3.5047292709351,
			},
		},
		pes_temple_lake_crossing_toxic_air_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_lake_crossing_toxic_air_a_01",
				[2] = "pes_temple_lake_crossing_toxic_air_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_lake_crossing_toxic_air_a_01",
				[2] = "pes_temple_lake_crossing_toxic_air_a_02",
			},
			sound_events_duration = {
				[1] = 2.8700625896454,
				[2] = 4.5225415229797,
			},
		},
		pes_temple_sanctum_find_waystone_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_find_waystone_c_01",
				[2] = "pes_temple_sanctum_find_waystone_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_find_waystone_c_01",
				[2] = "pes_temple_sanctum_find_waystone_c_02",
			},
			sound_events_duration = {
				[1] = 4.8456039428711,
				[2] = 3.2460832595825,
			},
		},
		pes_temple_sanctum_find_waystone_puzzle_area_open_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_find_waystone_puzzle_area_open_b_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_area_open_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_find_waystone_puzzle_area_open_b_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_area_open_b_02",
			},
			sound_events_duration = {
				[1] = 3.4806041717529,
				[2] = 2.8707499504089,
			},
		},
		pes_temple_sanctum_find_waystone_puzzle_first_step_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_find_waystone_puzzle_first_step_b_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_first_step_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_find_waystone_puzzle_first_step_b_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_first_step_b_02",
			},
			sound_events_duration = {
				[1] = 3.7132499217987,
				[2] = 2.921416759491,
			},
		},
		pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_a_02",
			},
			sound_events_duration = {
				[1] = 2.0526459217072,
				[2] = 2.1078333854675,
			},
		},
		pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_fragment_through_gap_b_02",
			},
			sound_events_duration = {
				[1] = 3.71910405159,
				[2] = 3.667249917984,
			},
		},
		pes_temple_sanctum_find_waystone_puzzle_scaffold_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_find_waystone_puzzle_scaffold_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_scaffold_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_find_waystone_puzzle_scaffold_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_scaffold_a_02",
			},
			sound_events_duration = {
				[1] = 2.4616665840149,
				[2] = 2.432895898819,
			},
		},
		pes_temple_sanctum_find_waystone_puzzle_scaffold_broken_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_scaffold_broken_a_02",
			},
			sound_events_duration = {
				[1] = 2.5139999389648,
				[2] = 2.1312084197998,
			},
		},
		pes_temple_sanctum_find_waystone_puzzle_start_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			sound_events_duration = {
				[1] = 3.8152709007263,
				[2] = 1.8787499666214,
			},
		},
		pes_temple_sanctum_find_waystone_puzzle_start_a_HEARD = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_find_waystone_puzzle_start_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_start_a_02",
			},
			sound_events_duration = {
				[1] = 3.8152709007263,
				[2] = 1.8787499666214,
			},
		},
		pes_temple_sanctum_find_waystone_puzzle_waystone_complete_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_find_waystone_puzzle_waystone_complete_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_waystone_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_find_waystone_puzzle_waystone_complete_a_01",
				[2] = "pes_temple_sanctum_find_waystone_puzzle_waystone_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.8460624217987,
				[2] = 1.8511874675751,
			},
		},
		pes_temple_sanctum_goods_elevator_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_goods_elevator_a_01",
				[2] = "pes_temple_sanctum_goods_elevator_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_goods_elevator_a_01",
				[2] = "pes_temple_sanctum_goods_elevator_a_02",
			},
			sound_events_duration = {
				[1] = 2.025208234787,
				[2] = 2.0668332576752,
			},
		},
		pes_temple_sanctum_goods_elevator_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_sanctum_goods_elevator_b_01",
				[2] = "pes_temple_sanctum_goods_elevator_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_sanctum_goods_elevator_b_01",
				[2] = "pes_temple_sanctum_goods_elevator_b_02",
			},
			sound_events_duration = {
				[1] = 2.1327917575836,
				[2] = 2.8811874389648,
			},
		},
		pes_temple_sanctum_great_seal_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				"pes_temple_sanctum_great_seal_b_01",
				"pes_temple_sanctum_great_seal_b_02",
				"pes_temple_sanctum_great_seal_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_temple_sanctum_great_seal_b_01",
				"pes_temple_sanctum_great_seal_b_02",
				"pes_temple_sanctum_great_seal_b_03",
			},
			sound_events_duration = {
				2.25,
				3.5117917060852,
				3.1310207843781,
			},
		},
		pes_temple_sanctum_nightmare_gate_d = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				"pes_temple_sanctum_nightmare_gate_d_01",
				"pes_temple_sanctum_nightmare_gate_d_02",
				"pes_temple_sanctum_nightmare_gate_d_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_temple_sanctum_nightmare_gate_d_01",
				"pes_temple_sanctum_nightmare_gate_d_02",
				"pes_temple_sanctum_nightmare_gate_d_03",
			},
			sound_events_duration = {
				4.892541885376,
				3.1551876068115,
				2.4968957901001,
			},
		},
		pes_temple_start_banter_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_start_banter_no_elf_a_01",
				[2] = "pes_temple_start_banter_no_elf_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_start_banter_no_elf_a_01",
				[2] = "pes_temple_start_banter_no_elf_a_02",
			},
			sound_events_duration = {
				[1] = 2.9787082672119,
				[2] = 3.5629374980927,
			},
		},
		pes_temple_start_banter_c = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_start_banter_no_elf_c_01",
				[2] = "pes_temple_start_banter_no_elf_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_start_banter_no_elf_c_01",
				[2] = "pes_temple_start_banter_no_elf_c_02",
			},
			sound_events_duration = {
				[1] = 3.7044999599457,
				[2] = 3.1385834217072,
			},
		},
		pes_temple_wilds_gate_gather_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_wilds_gate_gather_a_01",
				[2] = "pes_temple_wilds_gate_gather_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_wilds_gate_gather_a_01",
				[2] = "pes_temple_wilds_gate_gather_a_02",
			},
			sound_events_duration = {
				[1] = 1.2287917137146,
				[2] = 2.236624956131,
			},
		},
		pes_temple_wilds_lake_vista_elf_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_wilds_lake_vista_elf_b_01",
				[2] = "pes_temple_wilds_lake_vista_elf_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_wilds_lake_vista_elf_b_01",
				[2] = "pes_temple_wilds_lake_vista_elf_b_02",
			},
			sound_events_duration = {
				[1] = 2.4253957271576,
				[2] = 6.4071664810181,
			},
		},
		pes_temple_wilds_lake_vista_no_elf_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_termite_1",
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
				[1] = "pes_temple_wilds_lake_vista_no_elf_b_01",
				[2] = "pes_temple_wilds_lake_vista_no_elf_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_temple_wilds_lake_vista_no_elf_b_01",
				[2] = "pes_temple_wilds_lake_vista_no_elf_b_02",
			},
			sound_events_duration = {
				[1] = 3.6359584331513,
				[2] = 4.4130001068115,
			},
		},
	})
end
