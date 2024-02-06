-- chunkname: @dialogues/generated/npc_dlc_dwarf_beacons.lua

return function ()
	define_rule({
		name = "nde_dwarf_beacons_beacon_gas_a",
		response = "nde_dwarf_beacons_beacon_gas_a",
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
				"dwarf_beacons_beacon_gas_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_beacon_gas_c",
		response = "nde_dwarf_beacons_beacon_gas_c",
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
				"dwarf_beacons_beacon_gas_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
			{
				"user_memory",
				"dwarf_internal_start_gas_c_hedda",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"dwarf_internal_start_gas_c_hedda",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_beacon_gas_d",
		response = "nde_dwarf_beacons_beacon_gas_d",
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
				"dwarf_beacons_beacon_gas_c",
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
			{
				"user_memory",
				"dwarf_internal_start_gas_c_hedda",
				OP.EQ,
				0,
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_beyond_caves",
		response = "nde_dwarf_beacons_beyond_caves",
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
				"dwarf_beacons_beyond_caves",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_break_sighted",
		response = "nde_dwarf_beacons_break_sighted",
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
				"dwarf_beacons_break_sighted",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_bridge_down",
		response = "nde_dwarf_beacons_bridge_down",
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
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_bridge_start",
		response = "nde_dwarf_beacons_bridge_start",
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
				"dwarf_beacons_bridge_start",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_light_beacon",
		response = "nde_dwarf_beacons_light_beacon",
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
				"dwarf_beacons_light_beacon",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_long_walk_a",
		response = "nde_dwarf_beacons_long_walk_a",
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
				"dwarf_beacons_long_walk_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_on_the_plate",
		response = "nde_dwarf_beacons_on_the_plate",
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
				"dwarf_beacons_on_the_plate",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_on_the_plate_reminder",
		response = "nde_dwarf_beacons_on_the_plate_reminder",
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
				"dwarf_beacons_on_the_plate_reminder",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
			{
				"user_memory",
				"dwarf_beacons_on_the_plate_reminder",
				OP.LT,
				2,
			},
		},
		on_done = {
			{
				"user_memory",
				"dwarf_beacons_on_the_plate_reminder",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_outpost_empty_b",
		response = "nde_dwarf_beacons_outpost_empty_b",
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
				"dwarf_beacons_outpost_empty_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_over_the_mountain_01_b",
		response = "nde_dwarf_beacons_over_the_mountain_01_b",
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
				"pdr_dwarf_beacons_over_the_mountain_01_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_over_the_mountain_02_b",
		response = "nde_dwarf_beacons_over_the_mountain_02_b",
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
				"pdr_dwarf_beacons_over_the_mountain_02_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_over_the_mountain_03_b",
		response = "nde_dwarf_beacons_over_the_mountain_03_b",
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
				"pdr_dwarf_beacons_over_the_mountain_03_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_over_the_mountain_04_b",
		response = "nde_dwarf_beacons_over_the_mountain_04_b",
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
				"pdr_dwarf_beacons_over_the_mountain_04_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_over_the_mountain_d",
		response = "nde_dwarf_beacons_over_the_mountain_d",
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
				"dwarf_beacons_over_the_mountain_c",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_repair_pipe",
		response = "nde_dwarf_beacons_repair_pipe",
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
				"dwarf_beacons_repair_pipe",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
			{
				"user_memory",
				"dwarf_beacons_repair_pipe",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"dwarf_beacons_repair_pipe",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_skaven_retreat_bardin_only_d",
		response = "nde_dwarf_beacons_skaven_retreat_bardin_only_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nde_dwarf_beacons_skaven_retreat_c_done",
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_skaven_retreat_c",
		response = "nde_dwarf_beacons_skaven_retreat_c",
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
				"dwarf_beacons_skaven_retreat_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_start_banter_a",
		response = "nde_dwarf_beacons_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_beacons_start_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
			{
				"user_memory",
				"dwarf_beacons_start_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"dwarf_beacons_start_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_start_banter_b",
		response = "nde_dwarf_beacons_start_banter_b",
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
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_start_banter_c",
		response = "nde_dwarf_beacons_start_banter_c",
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
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_supply_flowing",
		response = "nde_dwarf_beacons_supply_flowing",
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
				"dwarf_beacons_supply_flowing",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nde_dwarf_beacons_victory_c",
		response = "nde_dwarf_beacons_victory_c",
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
				"dwarf_beacons_victory_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_engineer",
			},
		},
	})
	define_rule({
		name = "nik_dwarf_beacons_beacon_gas_a",
		response = "nik_dwarf_beacons_beacon_gas_a",
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
				"dwarf_beacons_beacon_gas_a",
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
		name = "nik_dwarf_beacons_beyond_caves",
		response = "nik_dwarf_beacons_beyond_caves",
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
				"dwarf_beacons_beyond_caves",
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
		name = "nik_dwarf_beacons_break_sighted",
		response = "nik_dwarf_beacons_break_sighted",
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
				"dwarf_beacons_break_sighted",
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
		name = "nik_dwarf_beacons_bridge_down",
		response = "nik_dwarf_beacons_bridge_down",
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
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_dwarf_beacons_come_home",
		response = "nik_dwarf_beacons_come_home",
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
				"dwarf_beacons_come_home",
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
		name = "nik_dwarf_beacons_light_beacon",
		response = "nik_dwarf_beacons_light_beacon",
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
				"dwarf_beacons_light_beacon",
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
		name = "nik_dwarf_beacons_on_the_plate",
		response = "nik_dwarf_beacons_on_the_plate",
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
				"dwarf_beacons_on_the_plate",
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
		name = "nik_dwarf_beacons_on_the_plate_reminder",
		response = "nik_dwarf_beacons_on_the_plate_reminder",
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
				"dwarf_beacons_on_the_plate_reminder",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"dwarf_beacons_on_the_plate_reminder",
				OP.LT,
				2,
			},
		},
		on_done = {
			{
				"user_memory",
				"dwarf_beacons_on_the_plate_reminder",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_dwarf_beacons_outpost_empty_b",
		response = "nik_dwarf_beacons_outpost_empty_b",
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
				"dwarf_beacons_outpost_empty_a",
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
		name = "nik_dwarf_beacons_over_the_mountain_d",
		response = "nik_dwarf_beacons_over_the_mountain_d",
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
				"dwarf_beacons_over_the_mountain_c",
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
		name = "nik_dwarf_beacons_skaven_retreat_b",
		response = "nik_dwarf_beacons_skaven_retreat_b",
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
				"dwarf_beacons_skaven_retreat_a",
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
		name = "nik_dwarf_beacons_start_banter_a",
		response = "nik_dwarf_beacons_start_banter_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"dwarf_beacons_start_banter_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
			{
				"user_memory",
				"dwarf_beacons_start_banter_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"dwarf_beacons_start_banter_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nik_dwarf_beacons_start_banter_b",
		response = "nik_dwarf_beacons_start_banter_b",
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
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_dwarf_beacons_start_banter_c",
		response = "nik_dwarf_beacons_start_banter_c",
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
				"inn_keeper",
			},
		},
	})
	define_rule({
		name = "nik_dwarf_beacons_supply_flowing",
		response = "nik_dwarf_beacons_supply_flowing",
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
				"dwarf_beacons_supply_flowing",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper",
			},
		},
	})
	add_dialogues({
		nde_dwarf_beacons_beacon_gas_a = {
			category = "level_talk_must_play",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_beacon_gas_a_01",
				"nde_dwarf_beacons_beacon_gas_a_02",
				"nde_dwarf_beacons_beacon_gas_a_03",
				"nde_dwarf_beacons_beacon_gas_a_04",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_beacons_beacon_gas_a_01",
				"nde_dwarf_beacons_beacon_gas_a_02",
				"nde_dwarf_beacons_beacon_gas_a_03",
				"nde_dwarf_beacons_beacon_gas_a_04",
			},
			sound_events_duration = {
				3.3589792251587,
				3.0829999446869,
				2.4289999008179,
				3.9719791412353,
			},
		},
		nde_dwarf_beacons_beacon_gas_c = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_beacon_gas_c_01",
				"nde_dwarf_beacons_beacon_gas_c_02",
				"nde_dwarf_beacons_beacon_gas_c_03",
				"nde_dwarf_beacons_beacon_gas_c_04",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_beacons_beacon_gas_c_01",
				"nde_dwarf_beacons_beacon_gas_c_02",
				"nde_dwarf_beacons_beacon_gas_c_03",
				"nde_dwarf_beacons_beacon_gas_c_04",
			},
			sound_events_duration = {
				3.1440000534058,
				1.6519999504089,
				2.7309999465942,
				2.3369998931885,
			},
		},
		nde_dwarf_beacons_beacon_gas_d = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_beacon_gas_d_01",
				"nde_dwarf_beacons_beacon_gas_d_02",
				"nde_dwarf_beacons_beacon_gas_d_03",
				"nde_dwarf_beacons_beacon_gas_d_04",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_beacons_beacon_gas_d_01",
				"nde_dwarf_beacons_beacon_gas_d_02",
				"nde_dwarf_beacons_beacon_gas_d_03",
				"nde_dwarf_beacons_beacon_gas_d_04",
			},
			sound_events_duration = {
				1.5700000524521,
				1.4769999980927,
				2.6170001029968,
				1.9240000247955,
			},
		},
		nde_dwarf_beacons_beyond_caves = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_beyond_caves_01",
				"nde_dwarf_beacons_beyond_caves_02",
				"nde_dwarf_beacons_beyond_caves_03",
				"nde_dwarf_beacons_beyond_caves_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_beyond_caves_01",
				"nde_dwarf_beacons_beyond_caves_02",
				"nde_dwarf_beacons_beyond_caves_03",
				"nde_dwarf_beacons_beyond_caves_04",
			},
			sound_events_duration = {
				3.1589999198914,
				4.4619793891907,
				3.0069999694824,
				5.7930002212524,
			},
		},
		nde_dwarf_beacons_break_sighted = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_break_sighted_01",
				"nde_dwarf_beacons_break_sighted_02",
				"nde_dwarf_beacons_break_sighted_03",
				"nde_dwarf_beacons_break_sighted_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_break_sighted_01",
				"nde_dwarf_beacons_break_sighted_02",
				"nde_dwarf_beacons_break_sighted_03",
				"nde_dwarf_beacons_break_sighted_04",
			},
			sound_events_duration = {
				3.687979221344,
				2.8099999427795,
				3.2279999256134,
				2.8959999084473,
			},
		},
		nde_dwarf_beacons_bridge_down = {
			category = "level_talk_must_play",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_bridge_down_01",
				"nde_dwarf_beacons_bridge_down_02",
				"nde_dwarf_beacons_bridge_down_03",
				"nde_dwarf_beacons_bridge_down_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_bridge_down_01",
				"nde_dwarf_beacons_bridge_down_02",
				"nde_dwarf_beacons_bridge_down_03",
				"nde_dwarf_beacons_bridge_down_04",
			},
			sound_events_duration = {
				4.2919998168945,
				5.8769998550415,
				3.579999923706,
				4.7550001144409,
			},
		},
		nde_dwarf_beacons_bridge_start = {
			category = "level_talk_must_play",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_bridge_start_01",
				"nde_dwarf_beacons_bridge_start_02",
				"nde_dwarf_beacons_bridge_start_03",
				"nde_dwarf_beacons_bridge_start_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_bridge_start_01",
				"nde_dwarf_beacons_bridge_start_02",
				"nde_dwarf_beacons_bridge_start_03",
				"nde_dwarf_beacons_bridge_start_04",
			},
			sound_events_duration = {
				2.0829999446869,
				3.3410000801086,
				2.5829999446869,
				3.8180000782013,
			},
		},
		nde_dwarf_beacons_light_beacon = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_light_beacon_01",
				"nde_dwarf_beacons_light_beacon_02",
				"nde_dwarf_beacons_light_beacon_03",
				"nde_dwarf_beacons_light_beacon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_light_beacon_01",
				"nde_dwarf_beacons_light_beacon_02",
				"nde_dwarf_beacons_light_beacon_03",
				"nde_dwarf_beacons_light_beacon_04",
			},
			sound_events_duration = {
				4.4990000724792,
				5.3070001602173,
				3.8329999446869,
				3.1280000209808,
			},
		},
		nde_dwarf_beacons_long_walk_a = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_long_walk_a_01",
				"nde_dwarf_beacons_long_walk_a_02",
				"nde_dwarf_beacons_long_walk_a_03",
				"nde_dwarf_beacons_long_walk_a_04",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_dwarf_beacons_long_walk_a_01",
				"nde_dwarf_beacons_long_walk_a_02",
				"nde_dwarf_beacons_long_walk_a_03",
				"nde_dwarf_beacons_long_walk_a_04",
			},
			sound_events_duration = {
				3.0729999542236,
				2.3889999389648,
				3.4790000915527,
				3.2939999103546,
			},
		},
		nde_dwarf_beacons_on_the_plate = {
			category = "level_talk_must_play",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_on_the_plate_01",
				"nde_dwarf_beacons_on_the_plate_02",
				"nde_dwarf_beacons_on_the_plate_03",
				"nde_dwarf_beacons_on_the_plate_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_on_the_plate_01",
				"nde_dwarf_beacons_on_the_plate_02",
				"nde_dwarf_beacons_on_the_plate_03",
				"nde_dwarf_beacons_on_the_plate_04",
			},
			sound_events_duration = {
				2.2969999313355,
				3,
				2.9449999332428,
				4.2140002250671,
			},
		},
		nde_dwarf_beacons_on_the_plate_reminder = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_on_the_plate_reminder_01",
				"nde_dwarf_beacons_on_the_plate_reminder_02",
				"nde_dwarf_beacons_on_the_plate_reminder_03",
				"nde_dwarf_beacons_on_the_plate_reminder_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_on_the_plate_reminder_01",
				"nde_dwarf_beacons_on_the_plate_reminder_02",
				"nde_dwarf_beacons_on_the_plate_reminder_03",
				"nde_dwarf_beacons_on_the_plate_reminder_04",
			},
			sound_events_duration = {
				3.8759999275208,
				1.9129999876022,
				2.941999912262,
				1.9379999637604,
			},
		},
		nde_dwarf_beacons_outpost_empty_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_outpost_empty_b_01",
				"nde_dwarf_beacons_outpost_empty_b_02",
				"nde_dwarf_beacons_outpost_empty_b_03",
				"nde_dwarf_beacons_outpost_empty_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_outpost_empty_b_01",
				"nde_dwarf_beacons_outpost_empty_b_02",
				"nde_dwarf_beacons_outpost_empty_b_03",
				"nde_dwarf_beacons_outpost_empty_b_04",
			},
			sound_events_duration = {
				3.3939790725708,
				2.5139999389648,
				4.651978969574,
				6.7750000953674,
			},
		},
		nde_dwarf_beacons_over_the_mountain_01_b = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "dwarf_beacons_over_the_mountain_b_done",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "nde_dwarf_beacons_over_the_mountain_01_b_01",
			},
			sound_events = {
				[1] = "nde_dwarf_beacons_over_the_mountain_01_b_01",
			},
			sound_events_duration = {
				[1] = 2.0969998836517,
			},
		},
		nde_dwarf_beacons_over_the_mountain_02_b = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "dwarf_beacons_over_the_mountain_b_done",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "nde_dwarf_beacons_over_the_mountain_02_b_01",
			},
			sound_events = {
				[1] = "nde_dwarf_beacons_over_the_mountain_02_b_01",
			},
			sound_events_duration = {
				[1] = 2.0929999351502,
			},
		},
		nde_dwarf_beacons_over_the_mountain_03_b = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "dwarf_beacons_over_the_mountain_b_done",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "nde_dwarf_beacons_over_the_mountain_03_b_01",
			},
			sound_events = {
				[1] = "nde_dwarf_beacons_over_the_mountain_03_b_01",
			},
			sound_events_duration = {
				[1] = 2.1779999732971,
			},
		},
		nde_dwarf_beacons_over_the_mountain_04_b = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			override_awareness = "dwarf_beacons_over_the_mountain_b_done",
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "nde_dwarf_beacons_over_the_mountain_04_b_01",
			},
			sound_events = {
				[1] = "nde_dwarf_beacons_over_the_mountain_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.2730000019074,
			},
		},
		nde_dwarf_beacons_over_the_mountain_d = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_over_the_mountain_d_01",
				"nde_dwarf_beacons_over_the_mountain_d_02",
				"nde_dwarf_beacons_over_the_mountain_d_03",
				"nde_dwarf_beacons_over_the_mountain_d_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_over_the_mountain_d_01",
				"nde_dwarf_beacons_over_the_mountain_d_02",
				"nde_dwarf_beacons_over_the_mountain_d_03",
				"nde_dwarf_beacons_over_the_mountain_d_04",
			},
			sound_events_duration = {
				2.3710000514984,
				2.7890000343323,
				3.2860000133514,
				2.3789792060852,
			},
		},
		nde_dwarf_beacons_repair_pipe = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_repair_pipe_01",
				"nde_dwarf_beacons_repair_pipe_02",
				"nde_dwarf_beacons_repair_pipe_03",
				"nde_dwarf_beacons_repair_pipe_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_repair_pipe_01",
				"nde_dwarf_beacons_repair_pipe_02",
				"nde_dwarf_beacons_repair_pipe_03",
				"nde_dwarf_beacons_repair_pipe_04",
			},
			sound_events_duration = {
				4.7140002250671,
				3.8900001049042,
				3.5059790611267,
				4.6490001678467,
			},
		},
		nde_dwarf_beacons_skaven_retreat_bardin_only_d = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			intended_player_profile = "dwarf_ranger",
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
				"nde_dwarf_beacons_skaven_retreat_bardin_only_d_01",
				"nde_dwarf_beacons_skaven_retreat_bardin_only_d_02",
				"nde_dwarf_beacons_skaven_retreat_bardin_only_d_03",
				"nde_dwarf_beacons_skaven_retreat_bardin_only_d_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_skaven_retreat_bardin_only_d_01",
				"nde_dwarf_beacons_skaven_retreat_bardin_only_d_02",
				"nde_dwarf_beacons_skaven_retreat_bardin_only_d_03",
				"nde_dwarf_beacons_skaven_retreat_bardin_only_d_04",
			},
			sound_events_duration = {
				4.6219997406006,
				3.0420000553131,
				4.8799996376038,
				7.2429790496826,
			},
		},
		nde_dwarf_beacons_skaven_retreat_c = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			override_awareness = "nde_dwarf_beacons_skaven_retreat_c_done",
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
				"nde_dwarf_beacons_skaven_retreat_c_01",
				"nde_dwarf_beacons_skaven_retreat_c_02",
				"nde_dwarf_beacons_skaven_retreat_c_03",
				"nde_dwarf_beacons_skaven_retreat_c_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_skaven_retreat_c_01",
				"nde_dwarf_beacons_skaven_retreat_c_02",
				"nde_dwarf_beacons_skaven_retreat_c_03",
				"nde_dwarf_beacons_skaven_retreat_c_04",
			},
			sound_events_duration = {
				4.0339999198914,
				3.5819792747498,
				4.183000087738,
				3.8320000171661,
			},
		},
		nde_dwarf_beacons_start_banter_a = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
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
				[1] = "nde_dwarf_beacons_start_banter_a_01",
				[2] = "nde_dwarf_beacons_start_banter_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nde_dwarf_beacons_start_banter_a_01",
				[2] = "nde_dwarf_beacons_start_banter_a_02",
			},
			sound_events_duration = {
				[1] = 3.9140000343323,
				[2] = 7.2379789352417,
			},
		},
		nde_dwarf_beacons_start_banter_b = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
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
				[1] = "nde_dwarf_beacons_start_banter_b_01",
				[2] = "nde_dwarf_beacons_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nde_dwarf_beacons_start_banter_b_01",
				[2] = "nde_dwarf_beacons_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 5.5840001106262,
				[2] = 4.0920000076294,
			},
		},
		nde_dwarf_beacons_start_banter_c = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
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
				[1] = "nde_dwarf_beacons_start_banter_c_01",
				[2] = "nde_dwarf_beacons_start_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "nde_dwarf_beacons_start_banter_c_01",
				[2] = "nde_dwarf_beacons_start_banter_c_02",
			},
			sound_events_duration = {
				[1] = 3.460000038147,
				[2] = 3.6730000972748,
			},
		},
		nde_dwarf_beacons_supply_flowing = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_supply_flowing_01",
				"nde_dwarf_beacons_supply_flowing_02",
				"nde_dwarf_beacons_supply_flowing_03",
				"nde_dwarf_beacons_supply_flowing_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_supply_flowing_01",
				"nde_dwarf_beacons_supply_flowing_02",
				"nde_dwarf_beacons_supply_flowing_03",
				"nde_dwarf_beacons_supply_flowing_04",
			},
			sound_events_duration = {
				3.404000043869,
				3.4809999465942,
				3.914999961853,
				2.5179998874664,
			},
		},
		nde_dwarf_beacons_victory_c = {
			category = "level_talk_must_play",
			database = "npc_dlc_dwarf_beacons",
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
				"nde_dwarf_beacons_victory_c_01",
				"nde_dwarf_beacons_victory_c_02",
				"nde_dwarf_beacons_victory_c_03",
				"nde_dwarf_beacons_victory_c_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_dwarf_beacons_victory_c_01",
				"nde_dwarf_beacons_victory_c_02",
				"nde_dwarf_beacons_victory_c_03",
				"nde_dwarf_beacons_victory_c_04",
			},
			sound_events_duration = {
				3.0829999446869,
				2.5999999046326,
				2.2109999656677,
				5.3839998245239,
			},
		},
		nik_dwarf_beacons_beacon_gas_a = {
			category = "level_talk_must_play",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_beacon_gas_a_01",
				"nik_dwarf_beacons_beacon_gas_a_02",
				"nik_dwarf_beacons_beacon_gas_a_03",
				"nik_dwarf_beacons_beacon_gas_a_04",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_dwarf_beacons_beacon_gas_a_01",
				"nik_dwarf_beacons_beacon_gas_a_02",
				"nik_dwarf_beacons_beacon_gas_a_03",
				"nik_dwarf_beacons_beacon_gas_a_04",
			},
			sound_events_duration = {
				5.2039790153503,
				4.2539792060852,
				3.5699999332428,
				2.4660000801086,
			},
		},
		nik_dwarf_beacons_beyond_caves = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_beyond_caves_01",
				"nik_dwarf_beacons_beyond_caves_02",
				"nik_dwarf_beacons_beyond_caves_03",
				"nik_dwarf_beacons_beyond_caves_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_beacons_beyond_caves_01",
				"nik_dwarf_beacons_beyond_caves_02",
				"nik_dwarf_beacons_beyond_caves_03",
				"nik_dwarf_beacons_beyond_caves_04",
			},
			sound_events_duration = {
				4.3839998245239,
				5.7339792251587,
				3.7269999980927,
				6.8639793395996,
			},
		},
		nik_dwarf_beacons_break_sighted = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_break_sighted_01",
				"nik_dwarf_beacons_break_sighted_02",
				"nik_dwarf_beacons_break_sighted_03",
				"nik_dwarf_beacons_break_sighted_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_beacons_break_sighted_01",
				"nik_dwarf_beacons_break_sighted_02",
				"nik_dwarf_beacons_break_sighted_03",
				"nik_dwarf_beacons_break_sighted_04",
			},
			sound_events_duration = {
				3.4749791622162,
				3.6019999980927,
				2.9649999141693,
				2.7439999580383,
			},
		},
		nik_dwarf_beacons_bridge_down = {
			category = "level_talk_must_play",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_bridge_down_01",
				"nik_dwarf_beacons_bridge_down_02",
				"nik_dwarf_beacons_bridge_down_03",
				"nik_dwarf_beacons_bridge_down_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_beacons_bridge_down_01",
				"nik_dwarf_beacons_bridge_down_02",
				"nik_dwarf_beacons_bridge_down_03",
				"nik_dwarf_beacons_bridge_down_04",
			},
			sound_events_duration = {
				4.9320001602173,
				3.4949998855591,
				2.5789999961853,
				2.9319791793823,
			},
		},
		nik_dwarf_beacons_come_home = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_come_home_01",
				"nik_dwarf_beacons_come_home_02",
				"nik_dwarf_beacons_come_home_03",
				"nik_dwarf_beacons_come_home_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_beacons_come_home_01",
				"nik_dwarf_beacons_come_home_02",
				"nik_dwarf_beacons_come_home_03",
				"nik_dwarf_beacons_come_home_04",
			},
			sound_events_duration = {
				10.786978721619,
				9.6639795303345,
				4.686999797821,
				6.6549792289734,
			},
		},
		nik_dwarf_beacons_light_beacon = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_light_beacon_01",
				"nik_dwarf_beacons_light_beacon_02",
				"nik_dwarf_beacons_light_beacon_03",
				"nik_dwarf_beacons_light_beacon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_beacons_light_beacon_01",
				"nik_dwarf_beacons_light_beacon_02",
				"nik_dwarf_beacons_light_beacon_03",
				"nik_dwarf_beacons_light_beacon_04",
			},
			sound_events_duration = {
				5.1109790802002,
				4.5760002136231,
				4.2579998970032,
				5.0529789924622,
			},
		},
		nik_dwarf_beacons_on_the_plate = {
			category = "level_talk_must_play",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_on_the_plate_01",
				"nik_dwarf_beacons_on_the_plate_02",
				"nik_dwarf_beacons_on_the_plate_03",
				"nik_dwarf_beacons_on_the_plate_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_beacons_on_the_plate_01",
				"nik_dwarf_beacons_on_the_plate_02",
				"nik_dwarf_beacons_on_the_plate_03",
				"nik_dwarf_beacons_on_the_plate_04",
			},
			sound_events_duration = {
				4.3899998664856,
				4.0679998397827,
				3.5959792137146,
				4.9389791488647,
			},
		},
		nik_dwarf_beacons_on_the_plate_reminder = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_on_the_plate_reminder_01",
				"nik_dwarf_beacons_on_the_plate_reminder_02",
				"nik_dwarf_beacons_on_the_plate_reminder_03",
				"nik_dwarf_beacons_on_the_plate_reminder_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_beacons_on_the_plate_reminder_01",
				"nik_dwarf_beacons_on_the_plate_reminder_02",
				"nik_dwarf_beacons_on_the_plate_reminder_03",
				"nik_dwarf_beacons_on_the_plate_reminder_04",
			},
			sound_events_duration = {
				2.920000076294,
				3.2349791526794,
				4.5979790687561,
				4.3270001411438,
			},
		},
		nik_dwarf_beacons_outpost_empty_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_outpost_empty_b_01",
				"nik_dwarf_beacons_outpost_empty_b_02",
				"nik_dwarf_beacons_outpost_empty_b_03",
				"nik_dwarf_beacons_outpost_empty_b_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_beacons_outpost_empty_b_01",
				"nik_dwarf_beacons_outpost_empty_b_02",
				"nik_dwarf_beacons_outpost_empty_b_03",
				"nik_dwarf_beacons_outpost_empty_b_04",
			},
			sound_events_duration = {
				6.414999961853,
				3.5329999923706,
				5.3049793243408,
				3.7089791297913,
			},
		},
		nik_dwarf_beacons_over_the_mountain_d = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_over_the_mountain_d_01",
				"nik_dwarf_beacons_over_the_mountain_d_02",
				"nik_dwarf_beacons_over_the_mountain_d_03",
				"nik_dwarf_beacons_over_the_mountain_d_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_beacons_over_the_mountain_d_01",
				"nik_dwarf_beacons_over_the_mountain_d_02",
				"nik_dwarf_beacons_over_the_mountain_d_03",
				"nik_dwarf_beacons_over_the_mountain_d_04",
			},
			sound_events_duration = {
				3.8619999885559,
				5.7719793319702,
				5.039999961853,
				3.834979057312,
			},
		},
		nik_dwarf_beacons_skaven_retreat_b = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_skaven_retreat_b_01",
				"nik_dwarf_beacons_skaven_retreat_b_02",
				"nik_dwarf_beacons_skaven_retreat_b_03",
				"nik_dwarf_beacons_skaven_retreat_b_04",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nik_dwarf_beacons_skaven_retreat_b_01",
				"nik_dwarf_beacons_skaven_retreat_b_02",
				"nik_dwarf_beacons_skaven_retreat_b_03",
				"nik_dwarf_beacons_skaven_retreat_b_04",
			},
			sound_events_duration = {
				7.5759792327881,
				4.6770000457764,
				4.3489999771118,
				6.7319793701172,
			},
		},
		nik_dwarf_beacons_start_banter_a = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
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
				[1] = "nik_dwarf_beacons_start_banter_a_01",
				[2] = "nik_dwarf_beacons_start_banter_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_dwarf_beacons_start_banter_a_01",
				[2] = "nik_dwarf_beacons_start_banter_a_02",
			},
			sound_events_duration = {
				[1] = 5.1599998474121,
				[2] = 5.7589998245239,
			},
		},
		nik_dwarf_beacons_start_banter_b = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
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
				[1] = "nik_dwarf_beacons_start_banter_b_01",
				[2] = "nik_dwarf_beacons_start_banter_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "nik_dwarf_beacons_start_banter_b_01",
				[2] = "nik_dwarf_beacons_start_banter_b_02",
			},
			sound_events_duration = {
				[1] = 6.5379791259766,
				[2] = 7.2229790687561,
			},
		},
		nik_dwarf_beacons_start_banter_c = {
			category = "level_talk",
			database = "npc_dlc_dwarf_beacons",
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
				[1] = "nik_dwarf_beacons_start_banter_c_01",
				[2] = "nik_dwarf_beacons_start_banter_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "nik_dwarf_beacons_start_banter_c_01",
				[2] = "nik_dwarf_beacons_start_banter_c_02",
			},
			sound_events_duration = {
				[1] = 6.2999792098999,
				[2] = 5.7309789657593,
			},
		},
		nik_dwarf_beacons_supply_flowing = {
			category = "npc_talk",
			database = "npc_dlc_dwarf_beacons",
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
				"nik_dwarf_beacons_supply_flowing_01",
				"nik_dwarf_beacons_supply_flowing_02",
				"nik_dwarf_beacons_supply_flowing_03",
				"nik_dwarf_beacons_supply_flowing_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nik_dwarf_beacons_supply_flowing_01",
				"nik_dwarf_beacons_supply_flowing_02",
				"nik_dwarf_beacons_supply_flowing_03",
				"nik_dwarf_beacons_supply_flowing_04",
			},
			sound_events_duration = {
				2.5479791164398,
				2.7860000133514,
				2.3149790763855,
				2.7439999580383,
			},
		},
	})
end
