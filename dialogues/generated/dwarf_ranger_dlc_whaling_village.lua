-- chunkname: @dialogues/generated/dwarf_ranger_dlc_whaling_village.lua

return function ()
	define_rule({
		name = "pdr_village_01_opening_cinematic_a",
		probability = 1,
		response = "pdr_village_01_opening_cinematic_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"village_01_opening_cinematic_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_village_01_opening_cinematic_b",
		probability = 1,
		response = "pdr_village_01_opening_cinematic_b",
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
				"village_01_opening_cinematic_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_01_opening_cinematic_d",
		probability = 1,
		response = "pdr_village_01_opening_cinematic_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"village_01_opening_cinematic_d",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_village_02_beach_a",
		probability = 1,
		response = "pdr_village_02_beach_a",
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
				"village_02_beach_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_village_02_beach_b",
		probability = 1,
		response = "pdr_village_02_beach_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pdr_village_02_beach_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_village_03_gather_a",
		probability = 1,
		response = "pdr_village_03_gather_a",
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
				"village_03_gather_a",
			},
			{
				"query_context",
				"friends_close",
				OP.GT,
				1,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				0,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_03_gather_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_03_gather_a",
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
		name = "pdr_village_03_gather_b",
		probability = 1,
		response = "pdr_village_03_gather_b",
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
				"village_03_gather_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_village_03_gather_c",
		probability = 1,
		response = "pdr_village_03_gather_c",
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
				"village_03_gather_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				0,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_village_03_gather_d",
		probability = 1,
		response = "pdr_village_03_gather_d",
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
				"village_03_gather_c",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pdr_village_04_skaven_a",
		probability = 1,
		response = "pdr_village_04_skaven_a",
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
				"village_04_skaven_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_04_skaven_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_04_skaven_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_05_hut_a",
		probability = 1,
		response = "pdr_village_05_hut_a",
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
				"village_05_hut_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"village_05_hut_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_05_hut_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_06_lighthouse_a",
		probability = 1,
		response = "pdr_village_06_lighthouse_a",
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
				"village_06_lighthouse_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_06_lighthouse_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_06_lighthouse_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_06_lighthouse_b",
		probability = 1,
		response = "pdr_village_06_lighthouse_b",
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
				"village_06_lighthouse_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_07_skaven_shipwreck_a",
		probability = 1,
		response = "pdr_village_07_skaven_shipwreck_a",
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
				"village_07_skaven_shipwreck_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"village_07_skaven_shipwreck_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_07_skaven_shipwreck_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_09_chaos_ships_a",
		probability = 1,
		response = "pdr_village_09_chaos_ships_a",
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
				"village_09_chaos_ships_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"village_09_chaos_ships_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_09_chaos_ships_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_10_bridge_a",
		probability = 1,
		response = "pdr_village_10_bridge_a",
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
				"village_10_bridge_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"village_10_bridge_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_10_bridge_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_11_harbour_shipwrecks_a",
		probability = 1,
		response = "pdr_village_11_harbour_shipwrecks_a",
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
				"village_11_harbour_shipwrecks_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"village_11_harbour_shipwrecks_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_11_harbour_shipwrecks_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_12_harbour_whale_carcass_a",
		probability = 1,
		response = "pdr_village_12_harbour_whale_carcass_a",
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
				"village_12_harbour_whale_carcass_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"village_12_harbour_whale_carcass_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_12_harbour_whale_carcass_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_12_harbour_whale_carcass_b",
		probability = 1,
		response = "pdr_village_12_harbour_whale_carcass_b",
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
				"village_12_harbour_whale_carcass_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_14_guidance_lighthouse_a",
		probability = 1,
		response = "pdr_village_14_guidance_lighthouse_a",
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
				"village_14_guidance_lighthouse_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_14_guidance_lighthouse_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_14_guidance_lighthouse_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_14_guidance_lighthouse_b",
		probability = 1,
		response = "pdr_village_14_guidance_lighthouse_b",
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
				"village_14_guidance_lighthouse_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_15_tainted_light_a",
		probability = 1,
		response = "pdr_village_15_tainted_light_a",
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
				"village_15_tainted_light_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"village_15_tainted_light_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_15_tainted_light_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_16_intact_ship_a",
		probability = 1,
		response = "pdr_village_16_intact_ship_a",
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
				"village_16_intact_ship_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"village_16_intact_ship_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_16_intact_ship_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_16_intact_ship_b",
		probability = 1,
		response = "pdr_village_16_intact_ship_b",
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
				"village_16_intact_ship_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_18_elevator_sighted_a",
		probability = 1,
		response = "pdr_village_18_elevator_sighted_a",
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
				"village_18_elevator_sighted_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_18_elevator_sighted_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_18_elevator_sighted_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_19_elevator_gears_a",
		probability = 1,
		response = "pdr_village_19_elevator_gears_a",
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
				"village_19_elevator_gears_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_19_elevator_gears_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_19_elevator_gears_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_20_elevator_oil_a",
		probability = 1,
		response = "pdr_village_20_elevator_oil_a",
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
				"village_20_elevator_oil_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_20_elevator_oil_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_20_elevator_oil_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_20a_elevator_arrived_a",
		probability = 1,
		response = "pdr_village_20a_elevator_arrived_a",
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
				"village_20a_elevator_arrived_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_20a_elevator_arrived_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_20a_elevator_arrived_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_23_nurgle_gateway_a",
		probability = 1,
		response = "pdr_village_23_nurgle_gateway_a",
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
				"village_23_nurgle_gateway_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_23_nurgle_gateway_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_23_nurgle_gateway_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_24_oil_tutorial_a",
		probability = 1,
		response = "pdr_village_24_oil_tutorial_a",
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
				"village_23_nurgle_gateway_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_25_oil_tutorial_complete_a",
		probability = 1,
		response = "pdr_village_25_oil_tutorial_complete_a",
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
				"village_25_oil_tutorial_complete_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_25_oil_tutorial_complete_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_25_oil_tutorial_complete_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_26_twisted_tree_a",
		probability = 1,
		response = "pdr_village_26_twisted_tree_a",
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
				"village_26_twisted_tree_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
			},
			{
				"faction_memory",
				"village_26_twisted_tree_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_26_twisted_tree_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_26_twisted_tree_b",
		probability = 1,
		response = "pdr_village_26_twisted_tree_b",
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
				"village_26_twisted_tree_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_28_lighthouse_hero_moment_a",
		probability = 1,
		response = "pdr_village_28_lighthouse_hero_moment_a",
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
				"village_28_lighthouse_hero_moment_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_28_lighthouse_hero_moment_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_28_lighthouse_hero_moment_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_29_corruption_source_a",
		probability = 1,
		response = "pdr_village_29_corruption_source_a",
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
				"village_29_corruption_source_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_29_corruption_source_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_29_corruption_source_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_29_corruption_source_b",
		probability = 1,
		response = "pdr_village_29_corruption_source_b",
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
				"village_29_corruption_source_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_29_corruption_source_c",
		probability = 1,
		response = "pdr_village_29_corruption_source_c",
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
				"village_29_corruption_source_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_30_burning_town_a",
		probability = 1,
		response = "pdr_village_30_burning_town_a",
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
				"village_30_burning_town_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				12,
			},
			{
				"faction_memory",
				"village_30_burning_town_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_30_burning_town_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_30_burning_town_b",
		probability = 1,
		response = "pdr_village_30_burning_town_b",
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
				"village_30_burning_town_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_31_fill_cart_a",
		probability = 1,
		response = "pdr_village_31_fill_cart_a",
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
				"village_31_fill_cart_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"village_31_fill_cart_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_31_fill_cart_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_32_that_did_it_a",
		probability = 1,
		response = "pdr_village_32_that_did_it_a",
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
				"village_32_that_did_it_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				12,
			},
			{
				"faction_memory",
				"village_32_that_did_it_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_32_that_did_it_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_32a_wagon_full_a",
		probability = 1,
		response = "pdr_village_32a_wagon_full_a",
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
				"village_32a_wagon_full_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_32a_wagon_full_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_32a_wagon_full_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_33_fuse_a",
		probability = 1,
		response = "pdr_village_33_fuse_a",
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
				"village_33_fuse_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_33_fuse_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_33_fuse_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_34_lighthouse_collapse_a",
		probability = 1,
		response = "pdr_village_34_lighthouse_collapse_a",
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
				"village_34_lighthouse_collapse_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_34_lighthouse_collapse_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_34_lighthouse_collapse_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_34_lighthouse_collapse_b",
		probability = 1,
		response = "pdr_village_34_lighthouse_collapse_b",
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
				"village_34_lighthouse_collapse_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_34_lighthouse_collapse_c",
		probability = 1,
		response = "pdr_village_34_lighthouse_collapse_c",
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
				"village_34_lighthouse_collapse_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_35_missing_comrade_a",
		probability = 1,
		response = "pdr_village_35_missing_comrade_a",
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
				"village_35_missing_comrade_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				12,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				0,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"village_35_missing_comrade_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_35_missing_comrade_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_35_missing_comrade_b",
		probability = 1,
		response = "pdr_village_35_missing_comrade_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"village_35_missing_comrade_b",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger_npc",
			},
		},
	})
	define_rule({
		name = "pdr_village_35_missing_comrade_c",
		probability = 1,
		response = "pdr_village_35_missing_comrade_c",
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
				"village_35_missing_comrade_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_bonus_buboes_a",
		probability = 1,
		response = "pdr_village_bonus_buboes_a",
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
				"village_bonus_buboes_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_village_bonus_buboes_b",
		probability = 1,
		response = "pdr_village_bonus_buboes_b",
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
				"village_bonus_buboes_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_bonus_buboes_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_bonus_buboes_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_bonus_explosive_cart_tutorial_a",
		probability = 1,
		response = "pdr_village_bonus_explosive_cart_tutorial_a",
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
				"village_bonus_explosive_cart_tutorial_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"faction_memory",
				"village_bonus_explosive_cart_tutorial_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_bonus_explosive_cart_tutorial_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_bonus_explosive_cart_tutorial_b",
		probability = 1,
		response = "pdr_village_bonus_explosive_cart_tutorial_b",
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
				"village_bonus_explosive_cart_tutorial_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pdr_village_bonus_fish_barrel_a",
		probability = 1,
		response = "pdr_village_bonus_fish_barrel_a",
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
				"village_bonus_fish_barrel_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
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
		name = "pdr_village_bonus_fish_barrel_b",
		probability = 1,
		response = "pdr_village_bonus_fish_barrel_b",
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
				"village_bonus_fish_barrel_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"faction_memory",
				"village_bonus_fish_barrel_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_bonus_fish_barrel_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_bonus_harbour_evil_glow_a",
		probability = 1,
		response = "pdr_village_bonus_harbour_evil_glow_a",
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
				"village_bonus_harbour_evil_glow_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"village_bonus_harbour_evil_glow_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_bonus_harbour_evil_glow_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_bonus_harbour_sewers_a",
		probability = 1,
		response = "pdr_village_bonus_harbour_sewers_a",
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
				"village_bonus_harbour_sewers_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"village_bonus_harbour_sewers_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_bonus_harbour_sewers_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_bonus_oil_dispenser_a",
		probability = 1,
		response = "pdr_village_bonus_oil_dispenser_a",
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
				"village_bonus_oil_dispenser_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"village_bonus_oil_dispenser_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_bonus_oil_dispenser_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_bonus_shallyan_idols_b",
		probability = 1,
		response = "pdr_village_bonus_shallyan_idols_b",
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
				"village_bonus_shallyan_idols_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
		},
	})
	define_rule({
		name = "pdr_village_bonus_tavern_a",
		probability = 1,
		response = "pdr_village_bonus_tavern_a",
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
				"village_bonus_tavern_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"village_bonus_tavern_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_bonus_tavern_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_bonus_whale_guts_a",
		probability = 1,
		response = "pdr_village_bonus_whale_guts_a",
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
				"village_bonus_whale_guts_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"village_bonus_whale_guts_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_bonus_whale_guts_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_bonus_whale_guts_b",
		probability = 1,
		response = "pdr_village_bonus_whale_guts_b",
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
				"village_bonus_whale_guts_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	add_dialogues({
		pdr_village_01_opening_cinematic_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_01_opening_cinematic_a_01",
				[2] = "pdr_village_01_opening_cinematic_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pdr_village_01_opening_cinematic_a_01",
				[2] = "pdr_village_01_opening_cinematic_a_02",
			},
			sound_events_duration = {
				[1] = 2.3336040973663,
				[2] = 3.3103542327881,
			},
		},
		pdr_village_01_opening_cinematic_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_01_opening_cinematic_b_01",
				[2] = "pdr_village_01_opening_cinematic_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_01_opening_cinematic_b_01",
				[2] = "pdr_village_01_opening_cinematic_b_02",
			},
			sound_events_duration = {
				[1] = 1.5361042022705,
				[2] = 2.3604373931885,
			},
		},
		pdr_village_01_opening_cinematic_d = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_01_opening_cinematic_d_01",
			},
			sound_events = {
				[1] = "pdr_village_01_opening_cinematic_d_01",
			},
			sound_events_duration = {
				[1] = 2.2542864084244,
			},
		},
		pdr_village_02_beach_a = {
			category = "casual_singing_03",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_local = true,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_village_02_beach_a_01",
				"pdr_village_02_beach_a_02",
				"pdr_village_02_beach_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_02_beach_a_01",
				"pdr_village_02_beach_a_02",
				"pdr_village_02_beach_a_03",
			},
			sound_events_duration = {
				7.2666873931885,
				6.0027499198914,
				4.5275626182556,
			},
		},
		pdr_village_02_beach_b = {
			category = "casual_singing_03",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_local = true,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_village_02_beach_b_01",
				"pdr_village_02_beach_b_02",
				"pdr_village_02_beach_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_02_beach_b_01",
				"pdr_village_02_beach_b_02",
				"pdr_village_02_beach_b_03",
			},
			sound_events_duration = {
				3.4079999923706,
				2.6031458377838,
				4.1043124198914,
			},
		},
		pdr_village_03_gather_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
				[2] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_03_gather_a_01",
				[2] = "pdr_village_03_gather_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_03_gather_a_01",
				[2] = "pdr_village_03_gather_a_02",
			},
			sound_events_duration = {
				[1] = 2.9586250782013,
				[2] = 3.525333404541,
			},
		},
		pdr_village_03_gather_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_nervous",
				[2] = "face_nervous",
			},
			localization_strings = {
				[1] = "pdr_village_03_gather_b_01",
				[2] = "pdr_village_03_gather_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_03_gather_b_01",
				[2] = "pdr_village_03_gather_b_02",
			},
			sound_events_duration = {
				[1] = 4.139687538147,
				[2] = 5.3650207519531,
			},
		},
		pdr_village_03_gather_c = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
				[2] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_03_gather_c_01",
				[2] = "pdr_village_03_gather_c_02",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pdr_village_03_gather_c_01 = {
					{
						"global_context",
						"witch_hunter",
						OP.EQ,
						true,
					},
				},
				pdr_village_03_gather_c_02 = {
					{
						"global_context",
						"bright_wizard",
						OP.EQ,
						true,
					},
				},
			},
			sound_events = {
				[1] = "pdr_village_03_gather_c_01",
				[2] = "pdr_village_03_gather_c_02",
			},
			sound_events_duration = {
				[1] = 3.0333125591278,
				[2] = 3.2821042537689,
			},
		},
		pdr_village_03_gather_d = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_sadness",
				[2] = "face_sadness",
			},
			localization_strings = {
				[1] = "pdr_village_03_gather_d_01",
				[2] = "pdr_village_03_gather_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_03_gather_d_01",
				[2] = "pdr_village_03_gather_d_02",
			},
			sound_events_duration = {
				[1] = 4.0577917098999,
				[2] = 4.7948751449585,
			},
		},
		pdr_village_04_skaven_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_angry",
				"face_angry",
				"face_angry",
			},
			localization_strings = {
				"pdr_village_04_skaven_a_01",
				"pdr_village_04_skaven_a_02",
				"pdr_village_04_skaven_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_04_skaven_a_01",
				"pdr_village_04_skaven_a_02",
				"pdr_village_04_skaven_a_03",
			},
			sound_events_duration = {
				2.300187587738,
				3.0962083339691,
				4.3412919044495,
			},
		},
		pdr_village_05_hut_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pdr_village_05_hut_a_01",
				"pdr_village_05_hut_a_02",
				"pdr_village_05_hut_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_05_hut_a_01",
				"pdr_village_05_hut_a_02",
				"pdr_village_05_hut_a_03",
			},
			sound_events_duration = {
				3.409437417984,
				4.5101456642151,
				5.8048748970032,
			},
		},
		pdr_village_06_lighthouse_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_surprise",
				[2] = "face_surprise",
			},
			localization_strings = {
				[1] = "pdr_village_06_lighthouse_a_01",
				[2] = "pdr_village_06_lighthouse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_06_lighthouse_a_01",
				[2] = "pdr_village_06_lighthouse_a_02",
			},
			sound_events_duration = {
				[1] = 1.6699166297913,
				[2] = 1.8405833244324,
			},
		},
		pdr_village_06_lighthouse_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_village_06_lighthouse_b_01",
				[2] = "pdr_village_06_lighthouse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_06_lighthouse_b_01",
				[2] = "pdr_village_06_lighthouse_b_02",
			},
			sound_events_duration = {
				[1] = 2.061666727066,
				[2] = 1.9426875114441,
			},
		},
		pdr_village_07_skaven_shipwreck_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_curious",
				"face_curious",
				"face_curious",
				"face_curious",
			},
			localization_strings = {
				"pdr_village_07_skaven_shipwreck_a_01",
				"pdr_village_07_skaven_shipwreck_a_02",
				"pdr_village_07_skaven_shipwreck_a_03",
				"pdr_de_village_07_skaven_shipwreck_a_04",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pdr_de_village_07_skaven_shipwreck_a_04 = {
					{
						"global_context",
						"dr_engineer",
						OP.EQ,
						false,
					},
				},
			},
			sound_events = {
				"pdr_village_07_skaven_shipwreck_a_01",
				"pdr_village_07_skaven_shipwreck_a_02",
				"pdr_village_07_skaven_shipwreck_a_03",
				"pdr_de_village_07_skaven_shipwreck_a_04",
			},
			sound_events_duration = {
				2.9930000305176,
				3.8444375991821,
				4.461395740509,
				4.2457499504089,
			},
		},
		pdr_village_09_chaos_ships_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"pdr_village_09_chaos_ships_a_01",
				"pdr_village_09_chaos_ships_a_02",
				"pdr_village_09_chaos_ships_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_09_chaos_ships_a_01",
				"pdr_village_09_chaos_ships_a_02",
				"pdr_village_09_chaos_ships_a_03",
			},
			sound_events_duration = {
				5.1773958206177,
				5.2690834999084,
				3.9099791049957,
			},
		},
		pdr_village_10_bridge_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"pdr_village_10_bridge_a_01",
				"pdr_village_10_bridge_a_02",
				"pdr_village_10_bridge_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_10_bridge_a_01",
				"pdr_village_10_bridge_a_02",
				"pdr_village_10_bridge_a_03",
			},
			sound_events_duration = {
				2.7690417766571,
				2.1027708053589,
				1.6847916841507,
			},
		},
		pdr_village_11_harbour_shipwrecks_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_angry",
				"face_angry",
				"face_angry",
			},
			localization_strings = {
				"pdr_village_11_harbour_shipwrecks_a_01",
				"pdr_village_11_harbour_shipwrecks_a_02",
				"pdr_village_11_harbour_shipwrecks_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_11_harbour_shipwrecks_a_01",
				"pdr_village_11_harbour_shipwrecks_a_02",
				"pdr_village_11_harbour_shipwrecks_a_03",
			},
			sound_events_duration = {
				3.2417500019074,
				3.7101459503174,
				5.3166251182556,
			},
		},
		pdr_village_12_harbour_whale_carcass_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_disgust",
				[2] = "face_disgust",
			},
			localization_strings = {
				[1] = "pdr_village_12_harbour_whale_carcass_a_01",
				[2] = "pdr_village_12_harbour_whale_carcass_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_12_harbour_whale_carcass_a_01",
				[2] = "pdr_village_12_harbour_whale_carcass_a_02",
			},
			sound_events_duration = {
				[1] = 4.2024998664856,
				[2] = 3.5551042556763,
			},
		},
		pdr_village_12_harbour_whale_carcass_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_village_12_harbour_whale_carcass_b_01",
				[2] = "pdr_village_12_harbour_whale_carcass_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_12_harbour_whale_carcass_b_01",
				[2] = "pdr_village_12_harbour_whale_carcass_b_02",
			},
			sound_events_duration = {
				[1] = 7.049250125885,
				[2] = 5.0886874198914,
			},
		},
		pdr_village_14_guidance_lighthouse_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
				[2] = "face_curious",
			},
			localization_strings = {
				[1] = "pdr_village_14_guidance_lighthouse_a_01",
				[2] = "pdr_village_14_guidance_lighthouse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_14_guidance_lighthouse_a_01",
				[2] = "pdr_village_14_guidance_lighthouse_a_02",
			},
			sound_events_duration = {
				[1] = 2.8631041049957,
				[2] = 4.5405626296997,
			},
		},
		pdr_village_14_guidance_lighthouse_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
				[2] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_14_guidance_lighthouse_b_01",
				[2] = "pdr_village_14_guidance_lighthouse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_14_guidance_lighthouse_b_01",
				[2] = "pdr_village_14_guidance_lighthouse_b_02",
			},
			sound_events_duration = {
				[1] = 3.3817501068115,
				[2] = 3.0658540725708,
			},
		},
		pdr_village_15_tainted_light_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pdr_village_15_tainted_light_a_01",
				"pdr_village_15_tainted_light_a_02",
				"pdr_village_15_tainted_light_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_15_tainted_light_a_01",
				"pdr_village_15_tainted_light_a_02",
				"pdr_village_15_tainted_light_a_03",
			},
			sound_events_duration = {
				4.8931040763855,
				3.7660000324249,
				3.1291251182556,
			},
		},
		pdr_village_16_intact_ship_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_surprise",
				[2] = "face_surprise",
			},
			localization_strings = {
				[1] = "pdr_village_16_intact_ship_a_01",
				[2] = "pdr_village_16_intact_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_16_intact_ship_a_01",
				[2] = "pdr_village_16_intact_ship_a_02",
			},
			sound_events_duration = {
				[1] = 4.9154167175293,
				[2] = 2.8494374752045,
			},
		},
		pdr_village_16_intact_ship_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
				[2] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_16_intact_ship_b_01",
				[2] = "pdr_village_16_intact_ship_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_16_intact_ship_b_01",
				[2] = "pdr_village_16_intact_ship_b_02",
			},
			sound_events_duration = {
				[1] = 3.1704375743866,
				[2] = 2.9040625095367,
			},
		},
		pdr_village_18_elevator_sighted_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
				[2] = "face_curious",
			},
			localization_strings = {
				[1] = "pdr_village_18_elevator_sighted_a_01",
				[2] = "pdr_village_18_elevator_sighted_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_18_elevator_sighted_a_01",
				[2] = "pdr_village_18_elevator_sighted_a_02",
			},
			sound_events_duration = {
				[1] = 3.8575625419617,
				[2] = 2.6784167289734,
			},
		},
		pdr_village_19_elevator_gears_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_19_elevator_gears_a_01",
				[2] = "pdr_village_19_elevator_gears_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_19_elevator_gears_a_01",
				[2] = "pdr_village_19_elevator_gears_a_02",
			},
			sound_events_duration = {
				[1] = 2.8325624465942,
				[2] = 3.6842501163483,
			},
		},
		pdr_village_20_elevator_oil_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_20_elevator_oil_a_01",
				[2] = "pdr_village_20_elevator_oil_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_20_elevator_oil_a_01",
				[2] = "pdr_village_20_elevator_oil_a_02",
			},
			sound_events_duration = {
				[1] = 2.437958240509,
				[2] = 3.5785000324249,
			},
		},
		pdr_village_20a_elevator_arrived_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_20a_elevator_arrived_a_01",
				[2] = "pdr_village_20a_elevator_arrived_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_20a_elevator_arrived_a_01",
				[2] = "pdr_village_20a_elevator_arrived_a_02",
			},
			sound_events_duration = {
				[1] = 2.0783541202545,
				[2] = 2.4739167690277,
			},
		},
		pdr_village_23_nurgle_gateway_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_disgust",
				"face_disgust",
				"face_concerned",
			},
			localization_strings = {
				"pdr_village_23_nurgle_gateway_a_01",
				"pdr_village_23_nurgle_gateway_a_02",
				"pdr_village_23_nurgle_gateway_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_23_nurgle_gateway_a_01",
				"pdr_village_23_nurgle_gateway_a_02",
				"pdr_village_23_nurgle_gateway_a_03",
			},
			sound_events_duration = {
				1.9094375371933,
				3.089250087738,
				4.0271248817444,
			},
		},
		pdr_village_24_oil_tutorial_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_village_24_oil_tutorial_a_01",
				[2] = "pdr_village_24_oil_tutorial_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_24_oil_tutorial_a_01",
				[2] = "pdr_village_24_oil_tutorial_a_02",
			},
			sound_events_duration = {
				[1] = 3.3323540687561,
				[2] = 3.4201667308807,
			},
		},
		pdr_village_25_oil_tutorial_complete_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_village_25_oil_tutorial_complete_a_01",
				[2] = "pdr_village_25_oil_tutorial_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_25_oil_tutorial_complete_a_01",
				[2] = "pdr_village_25_oil_tutorial_complete_a_02",
			},
			sound_events_duration = {
				[1] = 1.5364583730698,
				[2] = 3.8514583110809,
			},
		},
		pdr_village_26_twisted_tree_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_disgust",
				[2] = "face_disgust",
			},
			localization_strings = {
				[1] = "pdr_village_26_twisted_tree_a_01",
				[2] = "pdr_village_26_twisted_tree_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_26_twisted_tree_a_01",
				[2] = "pdr_village_26_twisted_tree_a_02",
			},
			sound_events_duration = {
				[1] = 3.9414999485016,
				[2] = 2.6024374961853,
			},
		},
		pdr_village_26_twisted_tree_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
				[2] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_26_twisted_tree_b_01",
				[2] = "pdr_village_26_twisted_tree_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_26_twisted_tree_b_01",
				[2] = "pdr_village_26_twisted_tree_b_02",
			},
			sound_events_duration = {
				[1] = 2.2998750209808,
				[2] = 2.2890000343323,
			},
		},
		pdr_village_28_lighthouse_hero_moment_a = {
			category = "cut_scene_interrupt_three",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_concerned",
				"face_nervous",
				"face_concerned",
			},
			localization_strings = {
				"pdr_village_28_lighthouse_hero_moment_a_01",
				"pdr_village_28_lighthouse_hero_moment_a_02",
				"pdr_village_28_lighthouse_hero_moment_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_28_lighthouse_hero_moment_a_01",
				"pdr_village_28_lighthouse_hero_moment_a_02",
				"pdr_village_28_lighthouse_hero_moment_a_03",
			},
			sound_events_duration = {
				2.3207499980927,
				4.7359166145325,
				2.8154582977295,
			},
		},
		pdr_village_29_corruption_source_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_disgust",
				[2] = "face_disgust",
			},
			localization_strings = {
				[1] = "pdr_village_29_corruption_source_a_01",
				[2] = "pdr_village_29_corruption_source_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_29_corruption_source_a_01",
				[2] = "pdr_village_29_corruption_source_a_02",
			},
			sound_events_duration = {
				[1] = 2.7912707328796,
				[2] = 1.8881666660309,
			},
		},
		pdr_village_29_corruption_source_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_29_corruption_source_b_01",
				[2] = "pdr_village_29_corruption_source_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_29_corruption_source_b_01",
				[2] = "pdr_village_29_corruption_source_b_02",
			},
			sound_events_duration = {
				[1] = 2.7438542842865,
				[2] = 2.6063125133514,
			},
		},
		pdr_village_29_corruption_source_c = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_29_corruption_source_c_01",
				[2] = "pdr_village_29_corruption_source_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_29_corruption_source_c_01",
				[2] = "pdr_village_29_corruption_source_c_02",
			},
			sound_events_duration = {
				[1] = 0.95833331346512,
				[2] = 1.3377083539963,
			},
		},
		pdr_village_30_burning_town_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_confused",
				[2] = "face_nervous",
			},
			localization_strings = {
				[1] = "pdr_village_30_burning_town_a_01",
				[2] = "pdr_village_30_burning_town_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_30_burning_town_a_01",
				[2] = "pdr_village_30_burning_town_a_02",
			},
			sound_events_duration = {
				[1] = 3.6352500915527,
				[2] = 1.4732707738876,
			},
		},
		pdr_village_30_burning_town_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_village_30_burning_town_b_01",
				[2] = "pdr_village_30_burning_town_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_30_burning_town_b_01",
				[2] = "pdr_village_30_burning_town_b_02",
			},
			sound_events_duration = {
				[1] = 3.317125082016,
				[2] = 2.8939166069031,
			},
		},
		pdr_village_31_fill_cart_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_31_fill_cart_a_01",
				[2] = "pdr_village_31_fill_cart_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_31_fill_cart_a_01",
				[2] = "pdr_village_31_fill_cart_a_02",
			},
			sound_events_duration = {
				[1] = 4.5768957138061,
				[2] = 3.639312505722,
			},
		},
		pdr_village_32_that_did_it_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_happy",
				"face_happy",
				"face_happy",
			},
			localization_strings = {
				"pdr_village_32_that_did_it_a_01",
				"pdr_village_32_that_did_it_a_02",
				"pdr_village_32_that_did_it_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_32_that_did_it_a_01",
				"pdr_village_32_that_did_it_a_02",
				"pdr_village_32_that_did_it_a_03",
			},
			sound_events_duration = {
				1.721583366394,
				1.5711041688919,
				2.1312708854675,
			},
		},
		pdr_village_32a_wagon_full_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_32a_wagon_full_a_01",
				[2] = "pdr_village_32a_wagon_full_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_32a_wagon_full_a_01",
				[2] = "pdr_village_32a_wagon_full_a_02",
			},
			sound_events_duration = {
				[1] = 2.0792915821075,
				[2] = 2.7816457748413,
			},
		},
		pdr_village_33_fuse_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_33_fuse_a_01",
				[2] = "pdr_village_33_fuse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_33_fuse_a_01",
				[2] = "pdr_village_33_fuse_a_02",
			},
			sound_events_duration = {
				[1] = 3.1529166698456,
				[2] = 2.7636041641235,
			},
		},
		pdr_village_34_lighthouse_collapse_a = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_village_34_lighthouse_collapse_a_01",
				[2] = "pdr_village_34_lighthouse_collapse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_34_lighthouse_collapse_a_01",
				[2] = "pdr_village_34_lighthouse_collapse_a_02",
			},
			sound_events_duration = {
				[1] = 5.326708316803,
				[2] = 2.6136667728424,
			},
		},
		pdr_village_34_lighthouse_collapse_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
				[2] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_34_lighthouse_collapse_b_01",
				[2] = "pdr_village_34_lighthouse_collapse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_34_lighthouse_collapse_b_01",
				[2] = "pdr_village_34_lighthouse_collapse_b_02",
			},
			sound_events_duration = {
				[1] = 3.8742916584015,
				[2] = 3.8239998817444,
			},
		},
		pdr_village_34_lighthouse_collapse_c = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_surprise",
				[2] = "face_surprise",
			},
			localization_strings = {
				[1] = "pdr_village_34_lighthouse_collapse_c_01",
				[2] = "pdr_village_34_lighthouse_collapse_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_34_lighthouse_collapse_c_01",
				[2] = "pdr_village_34_lighthouse_collapse_c_02",
			},
			sound_events_duration = {
				[1] = 4.610312461853,
				[2] = 2.7171874046326,
			},
		},
		pdr_village_35_missing_comrade_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_sadness",
				[2] = "face_sadness",
			},
			localization_strings = {
				[1] = "pdr_village_35_missing_comrade_a_01",
				[2] = "pdr_village_35_missing_comrade_a_02",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pdr_village_35_missing_comrade_a_01 = {
					{
						"global_context",
						"wood_elf",
						OP.EQ,
						true,
					},
				},
				pdr_village_35_missing_comrade_a_02 = {
					{
						"global_context",
						"witch_hunter",
						OP.EQ,
						true,
					},
				},
			},
			sound_events = {
				[1] = "pdr_village_35_missing_comrade_a_01",
				[2] = "pdr_village_35_missing_comrade_a_02",
			},
			sound_events_duration = {
				[1] = 5.8390002250671,
				[2] = 4.3678956031799,
			},
		},
		pdr_village_35_missing_comrade_b = {
			category = "level_talk_must_play",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_village_35_missing_comrade_b_01",
				[2] = "pdr_village_35_missing_comrade_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pdr_village_35_missing_comrade_b_01",
				[2] = "pdr_village_35_missing_comrade_b_02",
			},
			sound_events_duration = {
				[1] = 5.0821042060852,
				[2] = 4.1751666069031,
			},
		},
		pdr_village_35_missing_comrade_c = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_village_35_missing_comrade_c_01",
				[2] = "pdr_village_35_missing_comrade_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_35_missing_comrade_c_01",
				[2] = "pdr_village_35_missing_comrade_c_02",
			},
			sound_events_duration = {
				[1] = 3.0981874465942,
				[2] = 2.5509374141693,
			},
		},
		pdr_village_bonus_buboes_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 12,
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
		pdr_village_bonus_buboes_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_bonus_buboes_a_01",
			},
			sound_events = {
				[1] = "pdr_village_bonus_buboes_a_01",
			},
			sound_events_duration = {
				[1] = 2.3318333625794,
			},
		},
		pdr_village_bonus_explosive_cart_tutorial_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pdr_generic_path_blocked_01",
				"pdr_generic_path_blocked_02",
				"pdr_generic_path_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_path_blocked_01",
				"pdr_generic_path_blocked_02",
				"pdr_generic_path_blocked_04",
			},
			sound_events_duration = {
				1.6169791221619,
				1.9629791975021,
				1.7539792060852,
			},
		},
		pdr_village_bonus_explosive_cart_tutorial_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_level_bogenhafen_slum_burn_food_01",
				[2] = "pdr_objective_magnus_tower_finding_explosives_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_bogenhafen_slum_burn_food_01",
				[2] = "pdr_objective_magnus_tower_finding_explosives_04",
			},
			sound_events_duration = {
				[1] = 1.8505208492279,
				[2] = 3.6420209407806,
			},
		},
		pdr_village_bonus_fish_barrel_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_distance = 12,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_smug",
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
		pdr_village_bonus_fish_barrel_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_bonus_fish_barrel_a_01",
			},
			sound_events = {
				[1] = "pdr_village_bonus_fish_barrel_a_01",
			},
			sound_events_duration = {
				[1] = 2.942125082016,
			},
		},
		pdr_village_bonus_harbour_evil_glow_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pdr_village_bonus_harbour_evil_glow_a_01",
				"pdr_village_bonus_harbour_evil_glow_a_02",
				"pdr_village_bonus_harbour_evil_glow_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_bonus_harbour_evil_glow_a_01",
				"pdr_village_bonus_harbour_evil_glow_a_02",
				"pdr_village_bonus_harbour_evil_glow_a_03",
			},
			sound_events_duration = {
				1.503145813942,
				4.1871042251587,
				4.6188335418701,
			},
		},
		pdr_village_bonus_harbour_sewers_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_disgust",
				"face_disgust",
				"face_disgust",
			},
			localization_strings = {
				"pdr_village_bonus_harbour_sewers_a_01",
				"pdr_village_bonus_harbour_sewers_a_02",
				"pdr_village_bonus_harbour_sewers_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_bonus_harbour_sewers_a_01",
				"pdr_village_bonus_harbour_sewers_a_02",
				"pdr_village_bonus_harbour_sewers_a_03",
			},
			sound_events_duration = {
				3.5915832519531,
				4.8890209197998,
				3.334625005722,
			},
		},
		pdr_village_bonus_oil_dispenser_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				[1] = "pdr_village_bonus_oil_dispenser_a_01",
				[2] = "pdr_village_bonus_oil_dispenser_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_bonus_oil_dispenser_a_01",
				[2] = "pdr_village_bonus_oil_dispenser_a_02",
			},
			sound_events_duration = {
				[1] = 2.9107084274292,
				[2] = 3.6596040725708,
			},
		},
		pdr_village_bonus_shallyan_idols_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_village_bonus_shallyan_idols_a_01",
				"pdr_village_bonus_shallyan_idols_a_02",
				"pdr_village_bonus_shallyan_idols_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_bonus_shallyan_idols_a_01",
				"pdr_village_bonus_shallyan_idols_a_02",
				"pdr_village_bonus_shallyan_idols_a_03",
			},
			sound_events_duration = {
				2.0310626029968,
				1.7352917194366,
				2.2369375228882,
			},
		},
		pdr_village_bonus_tavern_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
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
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pdr_village_bonus_tavern_a_01",
				"pdr_village_bonus_tavern_a_02",
				"pdr_village_bonus_tavern_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_village_bonus_tavern_a_01",
				"pdr_village_bonus_tavern_a_02",
				"pdr_village_bonus_tavern_a_03",
			},
			sound_events_duration = {
				2.489937543869,
				2.9644582271576,
				3.3507499694824,
			},
		},
		pdr_village_bonus_whale_guts_a = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_disgust",
			},
			localization_strings = {
				[1] = "pdr_village_bonus_whale_guts_a_01",
			},
			sound_events = {
				[1] = "pdr_village_bonus_whale_guts_a_01",
			},
			sound_events_duration = {
				[1] = 2.3125,
			},
		},
		pdr_village_bonus_whale_guts_b = {
			category = "level_talk",
			database = "dwarf_ranger_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_smug",
			},
			localization_strings = {
				[1] = "pdr_village_bonus_whale_guts_b_01",
			},
			sound_events = {
				[1] = "pdr_village_bonus_whale_guts_b_01",
			},
			sound_events_duration = {
				[1] = 1.6749792098999,
			},
		},
	})
end
