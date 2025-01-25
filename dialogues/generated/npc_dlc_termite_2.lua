-- chunkname: @dialogues/generated/npc_dlc_termite_2.lua

return function ()
	define_rule({
		name = "nik_power_escape_final_word_a",
		probability = 1,
		response = "nik_power_escape_final_word_a",
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
				"power_escape_final_word_a",
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
		name = "nik_power_start_banter_a",
		probability = 1,
		response = "nik_power_start_banter_a",
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
				"power_start_banter_a",
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
		name = "vmg_a_power_cavern_bomb_leaves_a",
		probability = 1,
		response = "vmg_a_power_cavern_bomb_leaves_a",
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
				"power_cavern_bomb_leaves_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"power_cavern_bomb_leaves",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"power_cavern_bomb_leaves",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_power_cavern_disable_warp_sphere_complete_a",
		probability = 1,
		response = "vmg_a_power_cavern_disable_warp_sphere_complete_a",
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
				"power_cavern_disable_warp_sphere_complete_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"power_cavern_disable_warp_sphere_complete",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"power_cavern_disable_warp_sphere_complete",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_power_cavern_disable_wheel_two_complete_a",
		probability = 1,
		response = "vmg_a_power_cavern_disable_wheel_two_complete_a",
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
				"power_cavern_disable_wheel_two_complete_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"power_cavern_disable_wheel_two_complete",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"power_cavern_disable_wheel_two_complete",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_power_cavern_event_complete_a",
		probability = 1,
		response = "vmg_a_power_cavern_event_complete_a",
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
				"power_cavern_event_complete_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"power_cavern_event_complete",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"power_cavern_event_complete",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_power_cavern_second_interstitial_a",
		probability = 1,
		response = "vmg_a_power_cavern_second_interstitial_a",
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
				"power_cavern_disable_wheel_complete_c",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"power_cavern_second_interstitial",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"power_cavern_second_interstitial",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_power_escape_monster_fight_a",
		probability = 1,
		response = "vmg_a_power_escape_monster_fight_a",
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
				"power_escape_monster_fight_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver_02",
			},
			{
				"user_memory",
				"power_escape_monster_fight",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"power_escape_monster_fight",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_power_escape_monster_fight_end_b",
		probability = 1,
		response = "vmg_a_power_escape_monster_fight_end_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"power_escape_monster_fight_end_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver_02",
			},
		},
	})
	define_rule({
		name = "vmg_a_power_escape_monster_fight_three_a",
		probability = 1,
		response = "vmg_a_power_escape_monster_fight_three_a",
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
				"power_escape_monster_fight_three_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver_02",
			},
			{
				"user_memory",
				"power_escape_monster_fight_three",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"power_escape_monster_fight_three",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_power_escape_monster_fight_two_a",
		probability = 1,
		response = "vmg_a_power_escape_monster_fight_two_a",
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
				"power_escape_monster_fight_two_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver_02",
			},
			{
				"user_memory",
				"power_escape_monster_fight_two",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"power_escape_monster_fight_two",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_power_escape_monster_reveal_b",
		probability = 1,
		response = "vmg_a_power_escape_monster_reveal_b",
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
				"power_escape_monster_reveal_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver_02",
			},
		},
	})
	define_rule({
		name = "vmg_a_power_escape_surprise_a",
		probability = 1,
		response = "vmg_a_power_escape_surprise_a",
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
				"power_escape_surprise_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"power_escape_surprise",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"power_escape_surprise",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_a_power_first_interstitial_a",
		probability = 1,
		response = "vmg_a_power_first_interstitial_a",
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
				"power_first_interstitial_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver_01",
			},
			{
				"user_memory",
				"power_first_interstitial",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"power_first_interstitial",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		nik_power_escape_final_word_a = {
			category = "cut_scene_interrupt_three",
			database = "npc_dlc_termite_2",
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
				"nik_power_escape_final_word_a_01",
				"nik_power_escape_final_word_a_02",
				"nik_power_escape_final_word_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_power_escape_final_word_a_01",
				"nik_power_escape_final_word_a_02",
				"nik_power_escape_final_word_a_03",
			},
			sound_events_duration = {
				6.2150001525879,
				6.679666519165,
				5.0049166679382,
			},
		},
		nik_power_start_banter_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"nik_power_start_banter_a_01",
				"nik_power_start_banter_a_02",
				"nik_power_start_banter_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_power_start_banter_a_01",
				"nik_power_start_banter_a_02",
				"nik_power_start_banter_a_03",
			},
			sound_events_duration = {
				6.5648956298828,
				6.3692498207092,
				6.0251040458679,
			},
		},
		vmg_a_power_cavern_bomb_leaves_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_cavern_bomb_leaves_a_01",
				"vmg_a_power_cavern_bomb_leaves_a_02",
				"vmg_a_power_cavern_bomb_leaves_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"vmg_a_power_cavern_bomb_leaves_a_01",
				"vmg_a_power_cavern_bomb_leaves_a_02",
				"vmg_a_power_cavern_bomb_leaves_a_03",
			},
			sound_events_duration = {
				15.542791366577,
				11.168000221252,
				16.581146240234,
			},
		},
		vmg_a_power_cavern_disable_warp_sphere_complete_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_cavern_disable_warp_sphere_complete_a_01",
				"vmg_a_power_cavern_disable_warp_sphere_complete_a_02",
				"vmg_a_power_cavern_disable_warp_sphere_complete_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"vmg_a_power_cavern_disable_warp_sphere_complete_a_01",
				"vmg_a_power_cavern_disable_warp_sphere_complete_a_02",
				"vmg_a_power_cavern_disable_warp_sphere_complete_a_03",
			},
			sound_events_duration = {
				6.0424165725708,
				6.9378542900085,
				7.3083748817444,
			},
		},
		vmg_a_power_cavern_disable_wheel_two_complete_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_cavern_disable_wheel_two_complete_a_01",
				"vmg_a_power_cavern_disable_wheel_two_complete_a_02",
				"vmg_a_power_cavern_disable_wheel_two_complete_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_power_cavern_disable_wheel_two_complete_a_01",
				"vmg_a_power_cavern_disable_wheel_two_complete_a_02",
				"vmg_a_power_cavern_disable_wheel_two_complete_a_03",
			},
			sound_events_duration = {
				5.0775833129883,
				5.9542708396912,
				6.4128127098083,
			},
		},
		vmg_a_power_cavern_event_complete_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_cavern_event_complete_a_01",
				"vmg_a_power_cavern_event_complete_a_02",
				"vmg_a_power_cavern_event_complete_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"vmg_a_power_cavern_event_complete_a_01",
				"vmg_a_power_cavern_event_complete_a_02",
				"vmg_a_power_cavern_event_complete_a_03",
			},
			sound_events_duration = {
				5.8594164848328,
				4.7991876602173,
				5.6088542938232,
			},
		},
		vmg_a_power_cavern_second_interstitial_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_cavern_second_interstitial_a_01",
				"vmg_a_power_cavern_second_interstitial_a_02",
				"vmg_a_power_cavern_second_interstitial_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_power_cavern_second_interstitial_a_01",
				"vmg_a_power_cavern_second_interstitial_a_02",
				"vmg_a_power_cavern_second_interstitial_a_03",
			},
			sound_events_duration = {
				4.2265625,
				6.5672292709351,
				6.3228335380554,
			},
		},
		vmg_a_power_escape_monster_fight_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_escape_monster_fight_a_01",
				"vmg_a_power_escape_monster_fight_a_02",
				"vmg_a_power_escape_monster_fight_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"vmg_a_power_escape_monster_fight_a_01",
				"vmg_a_power_escape_monster_fight_a_02",
				"vmg_a_power_escape_monster_fight_a_03",
			},
			sound_events_duration = {
				7.3778958320618,
				6.529333114624,
				6.4856457710266,
			},
		},
		vmg_a_power_escape_monster_fight_end_b = {
			category = "npc_talk_interrupt",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_escape_monster_fight_end_b_01",
				"vmg_a_power_escape_monster_fight_end_b_02",
				"vmg_a_power_escape_monster_fight_end_b_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"vmg_a_power_escape_monster_fight_end_b_01",
				"vmg_a_power_escape_monster_fight_end_b_02",
				"vmg_a_power_escape_monster_fight_end_b_03",
			},
			sound_events_duration = {
				7.6716666221619,
				6.8877501487732,
				8.3066873550415,
			},
		},
		vmg_a_power_escape_monster_fight_three_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_escape_monster_fight_three_a_01",
				"vmg_a_power_escape_monster_fight_three_a_02",
				"vmg_a_power_escape_monster_fight_three_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_power_escape_monster_fight_three_a_01",
				"vmg_a_power_escape_monster_fight_three_a_02",
				"vmg_a_power_escape_monster_fight_three_a_03",
			},
			sound_events_duration = {
				3.379145860672,
				7.5510835647583,
				4.3835206031799,
			},
		},
		vmg_a_power_escape_monster_fight_two_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_escape_monster_fight_two_a_01",
				"vmg_a_power_escape_monster_fight_two_a_02",
				"vmg_a_power_escape_monster_fight_two_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_power_escape_monster_fight_two_a_01",
				"vmg_a_power_escape_monster_fight_two_a_02",
				"vmg_a_power_escape_monster_fight_two_a_03",
			},
			sound_events_duration = {
				5.3212289810181,
				5.1009373664856,
				5.9825415611267,
			},
		},
		vmg_a_power_escape_monster_reveal_b = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_escape_monster_reveal_b_01",
				"vmg_a_power_escape_monster_reveal_b_02",
				"vmg_a_power_escape_monster_reveal_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_power_escape_monster_reveal_b_01",
				"vmg_a_power_escape_monster_reveal_b_02",
				"vmg_a_power_escape_monster_reveal_b_03",
			},
			sound_events_duration = {
				3.6542084217072,
				3.8642916679382,
				3.8218958377838,
			},
		},
		vmg_a_power_escape_surprise_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_escape_surprise_a_01",
				"vmg_a_power_escape_surprise_a_02",
				"vmg_a_power_escape_surprise_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"vmg_a_power_escape_surprise_a_01",
				"vmg_a_power_escape_surprise_a_02",
				"vmg_a_power_escape_surprise_a_03",
			},
			sound_events_duration = {
				5.8220834732056,
				5.9228959083557,
				8.2291460037231,
			},
		},
		vmg_a_power_first_interstitial_a = {
			category = "npc_talk",
			database = "npc_dlc_termite_2",
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
				"vmg_a_power_first_interstitial_a_01",
				"vmg_a_power_first_interstitial_a_02",
				"vmg_a_power_first_interstitial_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"vmg_a_power_first_interstitial_a_01",
				"vmg_a_power_first_interstitial_a_02",
				"vmg_a_power_first_interstitial_a_03",
			},
			sound_events_duration = {
				4.4008750915527,
				6.0734167098999,
				6.2247085571289,
			},
		},
	})
end
