-- chunkname: @dialogues/generated/bright_wizard_dlc_dwarf_beacons.lua

return function ()
	define_rule({
		name = "pbw_dummy_memory_trigger_beacons",
		response = "pbw_dummy_memory_trigger_beacons",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dummy_memory_trigger_beacons",
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
				"dummy_memory_trigger_beacons",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dummy_memory_trigger_beacons",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_beacon_gas_b",
		response = "pbw_dwarf_beacons_beacon_gas_b",
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
				"dwarf_beacons_beacon_gas_a",
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
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_beacon_gas_e",
		response = "pbw_dwarf_beacons_beacon_gas_e",
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
				"dwarf_beacons_beacon_gas_d",
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
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_e",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_beacon_gas_e",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_beacon_lit",
		response = "pbw_dwarf_beacons_beacon_lit",
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
				"dwarf_beacons_beacon_lit",
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
				"dwarf_beacons_beacon_lit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_beacon_lit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_bridge_down",
		response = "pbw_dwarf_beacons_bridge_down",
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
				"dwarf_beacons_bridge_down",
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
				"dwarf_beacons_bridge_down",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_bridge_down",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_head_for_heights_a",
		response = "pbw_dwarf_beacons_head_for_heights_a",
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
				"dwarf_beacons_head_for_heights_a",
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
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_beacons_head_for_heights_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_head_for_heights_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_head_for_heights_b",
		response = "pbw_dwarf_beacons_head_for_heights_b",
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
				"dwarf_beacons_head_for_heights_a",
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
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_beacons_head_for_heights_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_head_for_heights_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_long_walk_b",
		response = "pbw_dwarf_beacons_long_walk_b",
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
				"dwarf_beacons_long_walk_a",
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
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dwarf_beacons_long_walk_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_long_walk_b",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_not_far",
		response = "pbw_dwarf_beacons_not_far",
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
				"dwarf_beacons_not_far",
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
				3,
			},
			{
				"faction_memory",
				"dwarf_beacons_not_far",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_not_far",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_outpost_empty_a",
		response = "pbw_dwarf_beacons_outpost_empty_a",
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
				"dwarf_beacons_outpost_empty_a",
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
				3,
			},
			{
				"faction_memory",
				"dwarf_beacons_outpost_empty_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_outpost_empty_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_over_the_mountain_c",
		response = "pbw_dwarf_beacons_over_the_mountain_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_beacons_over_the_mountain_b_done",
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
				3,
			},
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain_c",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_over_the_mountain_c",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_skaven_retreat_a",
		response = "pbw_dwarf_beacons_skaven_retreat_a",
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
				"dwarf_beacons_skaven_retreat_a",
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
				"dwarf_beacons_skaven_retreat_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_skaven_retreat_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_start_banter_a",
		response = "pbw_dwarf_beacons_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_beacons_start_banter_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"dwarf_beacons_start_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_start_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_start_banter_b",
		response = "pbw_dwarf_beacons_start_banter_b",
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
				"dwarf_beacons_start_banter_a",
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
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_start_banter_c",
		response = "pbw_dwarf_beacons_start_banter_c",
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
				"dwarf_beacons_start_banter_b",
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
		},
	})
	define_rule({
		name = "pbw_dwarf_beacons_victory_b",
		response = "pbw_dwarf_beacons_victory_b",
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
				"dwarf_beacons_victory_b",
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
				"dwarf_beacons_victory_b",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"dwarf_beacons_victory_b",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_dummy_memory_trigger_beacons = {
			category = "special_occasion",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
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
		pbw_dwarf_beacons_beacon_gas_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_dwarf_beacons_beacon_gas_b_01",
				"pbw_dwarf_beacons_beacon_gas_b_02",
				"pbw_dwarf_beacons_beacon_gas_b_03",
				"pbw_dwarf_beacons_beacon_gas_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_beacons_beacon_gas_b_01",
				"pbw_dwarf_beacons_beacon_gas_b_02",
				"pbw_dwarf_beacons_beacon_gas_b_03",
				"pbw_dwarf_beacons_beacon_gas_b_04",
			},
			sound_events_duration = {
				3.7989792823791,
				3.209979057312,
				4.0440001487732,
				2.738979101181,
			},
		},
		pbw_dwarf_beacons_beacon_gas_e = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_dwarf_beacons_beacon_gas_e_01",
				"pbw_dwarf_beacons_beacon_gas_e_02",
				"pbw_dwarf_beacons_beacon_gas_e_03",
				"pbw_dwarf_beacons_beacon_gas_e_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_beacons_beacon_gas_e_01",
				"pbw_dwarf_beacons_beacon_gas_e_02",
				"pbw_dwarf_beacons_beacon_gas_e_03",
				"pbw_dwarf_beacons_beacon_gas_e_04",
			},
			sound_events_duration = {
				2.0119791030884,
				1.5770000219345,
				1.215979218483,
				2.9990000724792,
			},
		},
		pbw_dwarf_beacons_beacon_lit = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_dwarf_beacons_beacon_lit_01",
				"pbw_dwarf_beacons_beacon_lit_02",
				"pbw_dwarf_beacons_beacon_lit_03",
				"pbw_dwarf_beacons_beacon_lit_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_beacons_beacon_lit_01",
				"pbw_dwarf_beacons_beacon_lit_02",
				"pbw_dwarf_beacons_beacon_lit_03",
				"pbw_dwarf_beacons_beacon_lit_04",
			},
			sound_events_duration = {
				5.5079793930054,
				4.9049792289734,
				5.9489998817444,
				1.75100004673,
			},
		},
		pbw_dwarf_beacons_bridge_down = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_dwarf_beacons_bridge_down_01",
				"pbw_dwarf_beacons_bridge_down_02",
				"pbw_dwarf_beacons_bridge_down_03",
				"pbw_dwarf_beacons_bridge_down_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_beacons_bridge_down_01",
				"pbw_dwarf_beacons_bridge_down_02",
				"pbw_dwarf_beacons_bridge_down_03",
				"pbw_dwarf_beacons_bridge_down_04",
			},
			sound_events_duration = {
				3.4609792232513,
				4.1049790382385,
				1.5210000276566,
				1.3609791994095,
			},
		},
		pbw_dwarf_beacons_head_for_heights_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_dwarf_beacons_head_for_heights_a_01",
				[2] = "pbw_dwarf_beacons_head_for_heights_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_dwarf_beacons_head_for_heights_a_01",
				[2] = "pbw_dwarf_beacons_head_for_heights_a_02",
			},
			sound_events_duration = {
				[1] = 1.8639792203903,
				[2] = 1.6490000486374,
			},
		},
		pbw_dwarf_beacons_head_for_heights_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_dwarf_beacons_head_for_heights_b_01",
				[2] = "pbw_dwarf_beacons_head_for_heights_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_dwarf_beacons_head_for_heights_b_01",
				[2] = "pbw_dwarf_beacons_head_for_heights_b_02",
			},
			sound_events_duration = {
				[1] = 3.2289791107178,
				[2] = 2.5539999008179,
			},
		},
		pbw_dwarf_beacons_long_walk_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_dwarf_beacons_long_walk_b_01",
				"pbw_dwarf_beacons_long_walk_b_02",
				"pbw_dwarf_beacons_long_walk_b_03",
				"pbw_dwarf_beacons_long_walk_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_beacons_long_walk_b_01",
				"pbw_dwarf_beacons_long_walk_b_02",
				"pbw_dwarf_beacons_long_walk_b_03",
				"pbw_dwarf_beacons_long_walk_b_04",
			},
			sound_events_duration = {
				4.9229793548584,
				2.6040000915527,
				3.0360000133514,
				1.9529792070389,
			},
		},
		pbw_dwarf_beacons_not_far = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_dwarf_beacons_not_far_01",
				"pbw_dwarf_beacons_not_far_02",
				"pbw_dwarf_beacons_not_far_03",
				"pbw_dwarf_beacons_not_far_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_beacons_not_far_01",
				"pbw_dwarf_beacons_not_far_02",
				"pbw_dwarf_beacons_not_far_03",
				"pbw_dwarf_beacons_not_far_04",
			},
			sound_events_duration = {
				2.3670001029968,
				2.5969791412353,
				2.9900000095367,
				2.9719998836517,
			},
		},
		pbw_dwarf_beacons_outpost_empty_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_dwarf_beacons_outpost_empty_a_01",
				"pbw_dwarf_beacons_outpost_empty_a_02",
				"pbw_dwarf_beacons_outpost_empty_a_03",
				"pbw_dwarf_beacons_outpost_empty_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_beacons_outpost_empty_a_01",
				"pbw_dwarf_beacons_outpost_empty_a_02",
				"pbw_dwarf_beacons_outpost_empty_a_03",
				"pbw_dwarf_beacons_outpost_empty_a_04",
			},
			sound_events_duration = {
				2.0469791889191,
				2.544979095459,
				3.2559790611267,
				4.5869998931885,
			},
		},
		pbw_dwarf_beacons_over_the_mountain_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_dwarf_beacons_over_the_mountain_c_01",
				"pbw_dwarf_beacons_over_the_mountain_c_02",
				"pbw_dwarf_beacons_over_the_mountain_c_03",
				"pbw_dwarf_beacons_over_the_mountain_c_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_beacons_over_the_mountain_c_01",
				"pbw_dwarf_beacons_over_the_mountain_c_02",
				"pbw_dwarf_beacons_over_the_mountain_c_03",
				"pbw_dwarf_beacons_over_the_mountain_c_04",
			},
			sound_events_duration = {
				3.6279792785645,
				4.816978931427,
				2.8999791145325,
				5.0619792938232,
			},
		},
		pbw_dwarf_beacons_skaven_retreat_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_dwarf_beacons_skaven_retreat_a_01",
				"pbw_dwarf_beacons_skaven_retreat_a_02",
				"pbw_dwarf_beacons_skaven_retreat_a_03",
				"pbw_dwarf_beacons_skaven_retreat_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_beacons_skaven_retreat_a_01",
				"pbw_dwarf_beacons_skaven_retreat_a_02",
				"pbw_dwarf_beacons_skaven_retreat_a_03",
				"pbw_dwarf_beacons_skaven_retreat_a_04",
			},
			sound_events_duration = {
				3.2030000686645,
				4.566999912262,
				2.8220000267029,
				5.1119790077209,
			},
		},
		pbw_dwarf_beacons_start_banter_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_dwarf_beacons_start_banter_a_01",
				[2] = "pbw_dwarf_beacons_start_banter_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_dwarf_beacons_start_banter_a_01",
				[2] = "pbw_dwarf_beacons_start_banter_a_02",
			},
			sound_events_duration = {
				[1] = 4.1149792671204,
				[2] = 6.6619791984558,
			},
		},
		pbw_dwarf_beacons_start_banter_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_dwarf_beacons_start_banter_b_01",
				[2] = "pbw_dwarf_beacons_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_dwarf_beacons_start_banter_b_01",
				[2] = "pbw_dwarf_beacons_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 5.6999793052673,
				[2] = 4.9929790496826,
			},
		},
		pbw_dwarf_beacons_start_banter_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_dwarf_beacons_start_banter_c_01",
				[2] = "pbw_dwarf_beacons_start_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_dwarf_beacons_start_banter_c_01",
				[2] = "pbw_dwarf_beacons_start_banter_c_02",
			},
			sound_events_duration = {
				[1] = 3.9079792499542,
				[2] = 4.254979133606,
			},
		},
		pbw_dwarf_beacons_victory_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pbw_dwarf_beacons_victory_b_01",
				"pbw_dwarf_beacons_victory_b_02",
				"pbw_dwarf_beacons_victory_b_03",
				"pbw_dwarf_beacons_victory_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_beacons_victory_b_01",
				"pbw_dwarf_beacons_victory_b_02",
				"pbw_dwarf_beacons_victory_b_03",
				"pbw_dwarf_beacons_victory_b_04",
			},
			sound_events_duration = {
				4.6459794044495,
				3.8449790477753,
				3.4049792289734,
				4.3409790992737,
			},
		},
	})
end
