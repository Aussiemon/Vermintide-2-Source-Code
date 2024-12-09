-- chunkname: @dialogues/generated/npc_dlc_termite_1.lua

return function ()
	define_rule({
		name = "nik_temple_lake_crossing_destroy_bell_a",
		probability = 1,
		response = "nik_temple_lake_crossing_destroy_bell_a",
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
				"temple_lake_crossing_destroy_bell_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"faction_memory",
				"temple_lake_crossing_destroy_bell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_destroy_bell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_temple_lake_crossing_maze_a",
		probability = 1,
		response = "nik_temple_lake_crossing_maze_a",
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
				"temple_lake_crossing_maze_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"faction_memory",
				"temple_lake_crossing_maze",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_maze",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_temple_lake_crossing_start_a",
		probability = 1,
		response = "nik_temple_lake_crossing_start_a",
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
				"pes_temple_lake_landing_stage_conversation_01_d",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_temple_lake_landing_stage_conversation_02_b",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pdr_temple_lake_landing_stage_conversation_03_c",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pdr_temple_lake_landing_stage_conversation_04_b",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_temple_lake_landing_stage_conversation_05_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"faction_memory",
				"temple_lake_crossing_start",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_lake_crossing_start",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_temple_lake_crossing_temple_sighted_no_elf_b",
		probability = 1,
		response = "nik_temple_lake_crossing_temple_sighted_no_elf_b",
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
				"temple_lake_crossing_temple_sighted_no_elf_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_temple_sanctum_find_waystone_b",
		probability = 1,
		response = "nik_temple_sanctum_find_waystone_b",
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
				"temple_sanctum_find_waystone_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_temple_sanctum_find_waystone_puzzle_area_open_a",
		probability = 1,
		response = "nik_temple_sanctum_find_waystone_puzzle_area_open_a",
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
				"temple_sanctum_find_waystone_puzzle_area_open_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_area_open",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_area_open",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_temple_sanctum_find_waystone_puzzle_door_open_a",
		probability = 1,
		response = "nik_temple_sanctum_find_waystone_puzzle_door_open_a",
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
				"temple_sanctum_find_waystone_puzzle_door_open_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_door_open",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_door_open",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_temple_sanctum_find_waystone_puzzle_first_step_a",
		probability = 1,
		response = "nik_temple_sanctum_find_waystone_puzzle_first_step_a",
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
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
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
		name = "nik_temple_sanctum_find_waystone_puzzle_first_step_c",
		probability = 1,
		response = "nik_temple_sanctum_find_waystone_puzzle_first_step_c",
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
				"temple_sanctum_find_waystone_puzzle_first_step_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_temple_sanctum_find_waystone_puzzle_fragment_in_open_a",
		probability = 1,
		response = "nik_temple_sanctum_find_waystone_puzzle_fragment_in_open_a",
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
				"temple_sanctum_find_waystone_puzzle_fragment_in_open_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_fragment_in_open",
				OP.LT,
				2,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_fragment_in_open",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_temple_sanctum_find_waystone_puzzle_fragment_three_placed_a",
		probability = 1,
		response = "nik_temple_sanctum_find_waystone_puzzle_fragment_three_placed_a",
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
				"temple_sanctum_find_waystone_puzzle_fragment_three_placed_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_fragment_three_placed",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_fragment_three_placed",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_temple_sanctum_find_waystone_puzzle_fragment_two_placed_a",
		probability = 1,
		response = "nik_temple_sanctum_find_waystone_puzzle_fragment_two_placed_a",
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
				"temple_sanctum_find_waystone_puzzle_fragment_two_placed_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_fragment_two_placed",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"temple_sanctum_find_waystone_puzzle_fragment_two_placed",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_temple_sanctum_find_waystone_puzzle_start_b",
		probability = 1,
		response = "nik_temple_sanctum_find_waystone_puzzle_start_b",
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
				"temple_sanctum_find_waystone_puzzle_start_a",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"temple_sanctum_find_waystone_puzzle_start_a_HEARD",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_temple_sanctum_find_waystone_puzzle_waystone_complete_b",
		probability = 1,
		response = "nik_temple_sanctum_find_waystone_puzzle_waystone_complete_b",
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
				"temple_sanctum_find_waystone_puzzle_waystone_complete_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_temple_sanctum_great_seal_c",
		probability = 1,
		response = "nik_temple_sanctum_great_seal_c",
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
				"temple_sanctum_great_seal_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_temple_sanctum_nightmare_gate_b",
		probability = 1,
		response = "nik_temple_sanctum_nightmare_gate_b",
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
				"temple_sanctum_nightmare_gate_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_temple_start_banter_b",
		probability = 1,
		response = "nik_temple_start_banter_b",
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
				"temple_start_banter_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_temple_wilds_lake_vista_no_elf_a",
		probability = 1,
		response = "nik_temple_wilds_lake_vista_no_elf_a",
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
				"inn_keeper",
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
				"inn_keeper",
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
		nik_temple_lake_crossing_destroy_bell_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_lake_crossing_destroy_bell_a_01",
				"nik_temple_lake_crossing_destroy_bell_a_02",
				"nik_temple_lake_crossing_destroy_bell_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_temple_lake_crossing_destroy_bell_a_01",
				"nik_temple_lake_crossing_destroy_bell_a_02",
				"nik_temple_lake_crossing_destroy_bell_a_03",
			},
			sound_events_duration = {
				7.2220001220703,
				6.7170000076294,
				6.87735414505,
			},
		},
		nik_temple_lake_crossing_maze_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_lake_crossing_maze_a_01",
				"nik_temple_lake_crossing_maze_a_02",
				"nik_temple_lake_crossing_maze_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_lake_crossing_maze_a_01",
				"nik_temple_lake_crossing_maze_a_02",
				"nik_temple_lake_crossing_maze_a_03",
			},
			sound_events_duration = {
				4.0057082176208,
				4.2736248970032,
				4.7964792251587,
			},
		},
		nik_temple_lake_crossing_start_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_lake_crossing_start_a_01",
				"nik_temple_lake_crossing_start_a_02",
				"nik_temple_lake_crossing_start_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_temple_lake_crossing_start_a_01",
				"nik_temple_lake_crossing_start_a_02",
				"nik_temple_lake_crossing_start_a_03",
			},
			sound_events_duration = {
				3.2340834140778,
				3.5031042098999,
				7.8506460189819,
			},
		},
		nik_temple_lake_crossing_temple_sighted_no_elf_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_lake_crossing_temple_sighted_no_elf_b_01",
				"nik_temple_lake_crossing_temple_sighted_no_elf_b_02",
				"nik_temple_lake_crossing_temple_sighted_no_elf_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_temple_lake_crossing_temple_sighted_no_elf_b_01",
				"nik_temple_lake_crossing_temple_sighted_no_elf_b_02",
				"nik_temple_lake_crossing_temple_sighted_no_elf_b_03",
			},
			sound_events_duration = {
				3.1467916965485,
				5.3478126525879,
				5.858437538147,
			},
		},
		nik_temple_sanctum_find_waystone_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_find_waystone_b_01",
				"nik_temple_sanctum_find_waystone_b_02",
				"nik_temple_sanctum_find_waystone_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_sanctum_find_waystone_b_01",
				"nik_temple_sanctum_find_waystone_b_02",
				"nik_temple_sanctum_find_waystone_b_03",
			},
			sound_events_duration = {
				4.4125418663025,
				3.3889582157135,
				3.4890415668488,
			},
		},
		nik_temple_sanctum_find_waystone_puzzle_area_open_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_find_waystone_puzzle_area_open_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_area_open_a_02",
				"nik_temple_sanctum_find_waystone_puzzle_area_open_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_sanctum_find_waystone_puzzle_area_open_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_area_open_a_02",
				"nik_temple_sanctum_find_waystone_puzzle_area_open_a_03",
			},
			sound_events_duration = {
				4.2596249580383,
				2.7676875591278,
				4.7312917709351,
			},
		},
		nik_temple_sanctum_find_waystone_puzzle_door_open_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_find_waystone_puzzle_door_open_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_door_open_a_02",
				"nik_temple_sanctum_find_waystone_puzzle_door_open_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_sanctum_find_waystone_puzzle_door_open_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_door_open_a_02",
				"nik_temple_sanctum_find_waystone_puzzle_door_open_a_03",
			},
			sound_events_duration = {
				1.7637708187103,
				2.2564375400543,
				2.5659582614899,
			},
		},
		nik_temple_sanctum_find_waystone_puzzle_first_step_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_first_step_a_01",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_first_step_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_first_step_a_01",
			},
			sound_events_duration = {
				4.6075000762939,
				4.6075000762939,
				4.6075000762939,
			},
		},
		nik_temple_sanctum_find_waystone_puzzle_first_step_c = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_find_waystone_puzzle_first_step_c_01",
				"nik_temple_sanctum_find_waystone_puzzle_first_step_c_02",
				"nik_temple_sanctum_find_waystone_puzzle_first_step_c_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_sanctum_find_waystone_puzzle_first_step_c_01",
				"nik_temple_sanctum_find_waystone_puzzle_first_step_c_02",
				"nik_temple_sanctum_find_waystone_puzzle_first_step_c_03",
			},
			sound_events_duration = {
				1.2663749456406,
				3.172833442688,
				3.7873125076294,
			},
		},
		nik_temple_sanctum_find_waystone_puzzle_fragment_in_open_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_find_waystone_puzzle_fragment_in_open_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_in_open_a_02",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_in_open_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_sanctum_find_waystone_puzzle_fragment_in_open_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_in_open_a_02",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_in_open_a_03",
			},
			sound_events_duration = {
				2.5793957710266,
				1.8831042051315,
				3.0751457214356,
			},
		},
		nik_temple_sanctum_find_waystone_puzzle_fragment_three_placed_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_find_waystone_puzzle_fragment_three_placed_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_three_placed_a_02",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_three_placed_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_sanctum_find_waystone_puzzle_fragment_three_placed_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_three_placed_a_02",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_three_placed_a_03",
			},
			sound_events_duration = {
				1.9378333091736,
				2.2543542385101,
				3.5299167633057,
			},
		},
		nik_temple_sanctum_find_waystone_puzzle_fragment_two_placed_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_find_waystone_puzzle_fragment_two_placed_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_two_placed_a_02",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_two_placed_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_sanctum_find_waystone_puzzle_fragment_two_placed_a_01",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_two_placed_a_02",
				"nik_temple_sanctum_find_waystone_puzzle_fragment_two_placed_a_03",
			},
			sound_events_duration = {
				2.4020209312439,
				2.4245624542236,
				2.1885209083557,
			},
		},
		nik_temple_sanctum_find_waystone_puzzle_start_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_find_waystone_puzzle_start_b_01",
				"nik_temple_sanctum_find_waystone_puzzle_start_b_02",
				"nik_temple_sanctum_find_waystone_puzzle_start_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_sanctum_find_waystone_puzzle_start_b_01",
				"nik_temple_sanctum_find_waystone_puzzle_start_b_02",
				"nik_temple_sanctum_find_waystone_puzzle_start_b_03",
			},
			sound_events_duration = {
				4.5986666679382,
				2.9727499485016,
				4.6416249275208,
			},
		},
		nik_temple_sanctum_find_waystone_puzzle_waystone_complete_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_find_waystone_puzzle_waystone_complete_b_01",
				"nik_temple_sanctum_find_waystone_puzzle_waystone_complete_b_02",
				"nik_temple_sanctum_find_waystone_puzzle_waystone_complete_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_sanctum_find_waystone_puzzle_waystone_complete_b_01",
				"nik_temple_sanctum_find_waystone_puzzle_waystone_complete_b_02",
				"nik_temple_sanctum_find_waystone_puzzle_waystone_complete_b_03",
			},
			sound_events_duration = {
				4.8828125,
				6.1446876525879,
				8.3621454238892,
			},
		},
		nik_temple_sanctum_great_seal_c = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_great_seal_c_01",
				"nik_temple_sanctum_great_seal_c_02",
				"nik_temple_sanctum_great_seal_c_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_temple_sanctum_great_seal_c_01",
				"nik_temple_sanctum_great_seal_c_02",
				"nik_temple_sanctum_great_seal_c_03",
			},
			sound_events_duration = {
				4.3410415649414,
				2.6901042461395,
				4.7230000495911,
			},
		},
		nik_temple_sanctum_nightmare_gate_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_sanctum_nightmare_gate_b_01",
				"nik_temple_sanctum_nightmare_gate_b_02",
				"nik_temple_sanctum_nightmare_gate_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_sanctum_nightmare_gate_b_01",
				"nik_temple_sanctum_nightmare_gate_b_02",
				"nik_temple_sanctum_nightmare_gate_b_03",
			},
			sound_events_duration = {
				1.9130417108536,
				3.6427292823791,
				3.993958234787,
			},
		},
		nik_temple_start_banter_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_start_banter_no_elf_b_01",
				"nik_temple_start_banter_no_elf_b_02",
				"nik_temple_start_banter_no_elf_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_start_banter_no_elf_b_01",
				"nik_temple_start_banter_no_elf_b_02",
				"nik_temple_start_banter_no_elf_b_03",
			},
			sound_events_duration = {
				8.1944580078125,
				10.077771186829,
				7.7008333206177,
			},
		},
		nik_temple_wilds_lake_vista_no_elf_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_1",
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
				"nik_temple_wilds_lake_vista_no_elf_a_01",
				"nik_temple_wilds_lake_vista_no_elf_a_02",
				"nik_temple_wilds_lake_vista_no_elf_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_temple_wilds_lake_vista_no_elf_a_01",
				"nik_temple_wilds_lake_vista_no_elf_a_02",
				"nik_temple_wilds_lake_vista_no_elf_a_03",
			},
			sound_events_duration = {
				5.5727500915527,
				5.6302289962769,
				8.989312171936,
			},
		},
	})
end
