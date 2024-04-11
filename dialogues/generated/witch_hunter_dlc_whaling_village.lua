-- chunkname: @dialogues/generated/witch_hunter_dlc_whaling_village.lua

return function ()
	define_rule({
		name = "pwh_village_01_opening_cinematic_a",
		response = "pwh_village_01_opening_cinematic_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_village_01_opening_cinematic_c",
		response = "pwh_village_01_opening_cinematic_c",
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
				"deactive",
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
		},
	})
	define_rule({
		name = "pwh_village_01_opening_cinematic_d",
		response = "pwh_village_01_opening_cinematic_d",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_village_02_beach_a",
		response = "pwh_village_02_beach_a",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_village_02_beach_b",
		response = "pwh_village_02_beach_b",
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
				"pwh_village_02_beach_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_village_03_gather_a",
		response = "pwh_village_03_gather_a",
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
		name = "pwh_village_03_gather_b",
		response = "pwh_village_03_gather_b",
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
				"witch_hunter",
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
		name = "pwh_village_03_gather_c",
		response = "pwh_village_03_gather_c",
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
				"witch_hunter",
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				0,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"empire_soldier",
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
		name = "pwh_village_03_gather_d",
		response = "pwh_village_03_gather_d",
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
				"witch_hunter",
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
		name = "pwh_village_04_skaven_a",
		response = "pwh_village_04_skaven_a",
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
		name = "pwh_village_05_hut_a",
		response = "pwh_village_05_hut_a",
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
		name = "pwh_village_06_lighthouse_a",
		response = "pwh_village_06_lighthouse_a",
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
		name = "pwh_village_06_lighthouse_b",
		response = "pwh_village_06_lighthouse_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_07_skaven_shipwreck_a",
		response = "pwh_village_07_skaven_shipwreck_a",
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
		name = "pwh_village_09_chaos_ships_a",
		response = "pwh_village_09_chaos_ships_a",
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
		name = "pwh_village_10_bridge_a",
		response = "pwh_village_10_bridge_a",
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
		name = "pwh_village_11_harbour_shipwrecks_a",
		response = "pwh_village_11_harbour_shipwrecks_a",
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
		name = "pwh_village_12_harbour_whale_carcass_a",
		response = "pwh_village_12_harbour_whale_carcass_a",
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
		name = "pwh_village_12_harbour_whale_carcass_b",
		response = "pwh_village_12_harbour_whale_carcass_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_14_guidance_lighthouse_a",
		response = "pwh_village_14_guidance_lighthouse_a",
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
		name = "pwh_village_14_guidance_lighthouse_b",
		response = "pwh_village_14_guidance_lighthouse_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_15_tainted_light_a",
		response = "pwh_village_15_tainted_light_a",
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
		name = "pwh_village_16_intact_ship_a",
		response = "pwh_village_16_intact_ship_a",
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
		name = "pwh_village_16_intact_ship_b",
		response = "pwh_village_16_intact_ship_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_18_elevator_sighted_a",
		response = "pwh_village_18_elevator_sighted_a",
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
		name = "pwh_village_19_elevator_gears_a",
		response = "pwh_village_19_elevator_gears_a",
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
		name = "pwh_village_20_elevator_oil_a",
		response = "pwh_village_20_elevator_oil_a",
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
		name = "pwh_village_20a_elevator_arrived_a",
		response = "pwh_village_20a_elevator_arrived_a",
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
		name = "pwh_village_23_nurgle_gateway_a",
		response = "pwh_village_23_nurgle_gateway_a",
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
		name = "pwh_village_24_oil_tutorial_a",
		response = "pwh_village_24_oil_tutorial_a",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_25_oil_tutorial_complete_a",
		response = "pwh_village_25_oil_tutorial_complete_a",
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
		name = "pwh_village_26_twisted_tree_a",
		response = "pwh_village_26_twisted_tree_a",
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
		name = "pwh_village_26_twisted_tree_b",
		response = "pwh_village_26_twisted_tree_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_28_lighthouse_hero_moment_a",
		response = "pwh_village_28_lighthouse_hero_moment_a",
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
		name = "pwh_village_29_corruption_source_a",
		response = "pwh_village_29_corruption_source_a",
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
		name = "pwh_village_29_corruption_source_b",
		response = "pwh_village_29_corruption_source_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_29_corruption_source_c",
		response = "pwh_village_29_corruption_source_c",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_30_burning_town_a",
		response = "pwh_village_30_burning_town_a",
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
		name = "pwh_village_30_burning_town_b",
		response = "pwh_village_30_burning_town_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_31_fill_cart_a",
		response = "pwh_village_31_fill_cart_a",
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
		name = "pwh_village_32_that_did_it_a",
		response = "pwh_village_32_that_did_it_a",
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
		name = "pwh_village_32a_wagon_full_a",
		response = "pwh_village_32a_wagon_full_a",
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
		name = "pwh_village_33_fuse_a",
		response = "pwh_village_33_fuse_a",
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
		name = "pwh_village_34_lighthouse_collapse_a",
		response = "pwh_village_34_lighthouse_collapse_a",
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
		name = "pwh_village_34_lighthouse_collapse_b",
		response = "pwh_village_34_lighthouse_collapse_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_34_lighthouse_collapse_c",
		response = "pwh_village_34_lighthouse_collapse_c",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_35_missing_comrade_a",
		response = "pwh_village_35_missing_comrade_a",
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
				"dwarf_ranger",
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
		name = "pwh_village_35_missing_comrade_b",
		response = "pwh_village_35_missing_comrade_b",
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
				"witch_hunter_npc",
			},
		},
	})
	define_rule({
		name = "pwh_village_35_missing_comrade_c",
		response = "pwh_village_35_missing_comrade_c",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_bonus_buboes_a",
		response = "pwh_village_bonus_buboes_a",
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
		},
	})
	define_rule({
		name = "pwh_village_bonus_buboes_b",
		response = "pwh_village_bonus_buboes_b",
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
				"witch_hunter",
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
		name = "pwh_village_bonus_explosive_cart_tutorial_a",
		response = "pwh_village_bonus_explosive_cart_tutorial_a",
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
		name = "pwh_village_bonus_explosive_cart_tutorial_b",
		response = "pwh_village_bonus_explosive_cart_tutorial_b",
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
				"witch_hunter",
			},
		},
	})
	define_rule({
		name = "pwh_village_bonus_fish_barrel_a",
		response = "pwh_village_bonus_fish_barrel_a",
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
		},
	})
	define_rule({
		name = "pwh_village_bonus_fish_barrel_b",
		response = "pwh_village_bonus_fish_barrel_b",
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
		name = "pwh_village_bonus_harbour_evil_glow_a",
		response = "pwh_village_bonus_harbour_evil_glow_a",
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
		name = "pwh_village_bonus_harbour_sewers_a",
		response = "pwh_village_bonus_harbour_sewers_a",
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
		name = "pwh_village_bonus_oil_dispenser_a",
		response = "pwh_village_bonus_oil_dispenser_a",
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
		name = "pwh_village_bonus_shallyan_idols_a",
		response = "pwh_village_bonus_shallyan_idols_a",
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
				"village_bonus_shallyan_idols_a",
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
				"village_bonus_shallyan_idols_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_bonus_shallyan_idols_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_village_bonus_tavern_a",
		response = "pwh_village_bonus_tavern_a",
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
		name = "pwh_village_bonus_whale_guts_a",
		response = "pwh_village_bonus_whale_guts_a",
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
		name = "pwh_village_bonus_whale_guts_b",
		response = "pwh_village_bonus_whale_guts_b",
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
				"witch_hunter",
			},
		},
	})
	add_dialogues({
		pwh_village_01_opening_cinematic_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_01_opening_cinematic_a_01",
				[2] = "pwh_village_01_opening_cinematic_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pwh_village_01_opening_cinematic_a_01",
				[2] = "pwh_village_01_opening_cinematic_a_02",
			},
			sound_events_duration = {
				[1] = 5.3602709770203,
				[2] = 2.6890833377838,
			},
		},
		pwh_village_01_opening_cinematic_c = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_01_opening_cinematic_c_01",
				[2] = "pwh_village_01_opening_cinematic_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_01_opening_cinematic_c_01",
				[2] = "pwh_village_01_opening_cinematic_c_02",
			},
			sound_events_duration = {
				[1] = 3.4635000228882,
				[2] = 3.1877501010895,
			},
		},
		pwh_village_01_opening_cinematic_d = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_01_opening_cinematic_d_01",
			},
			sound_events = {
				[1] = "pwh_village_01_opening_cinematic_d_01",
			},
			sound_events_duration = {
				[1] = 2.1542863845825,
			},
		},
		pwh_village_02_beach_a = {
			category = "casual_singing_03",
			database = "witch_hunter_dlc_whaling_village",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			only_local = true,
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
				"pwh_village_02_beach_a_01",
				"pwh_village_02_beach_a_02",
				"pwh_village_02_beach_a_03",
				"pwh_wp_village_02_beach_a_04",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pwh_wp_village_02_beach_a_04 = {
					{
						"global_context",
						"wh_priest",
						OP.EQ,
						false,
					},
				},
			},
			sound_events = {
				"pwh_village_02_beach_a_01",
				"pwh_village_02_beach_a_02",
				"pwh_village_02_beach_a_03",
				"pwh_wp_village_02_beach_a_04",
			},
			sound_events_duration = {
				3.8679583072662,
				6.0471873283386,
				5.3008751869202,
				5.8667497634888,
			},
		},
		pwh_village_02_beach_b = {
			category = "casual_singing_03",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_02_beach_b_01",
				"pwh_village_02_beach_b_02",
				"pwh_village_02_beach_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_02_beach_b_01",
				"pwh_village_02_beach_b_02",
				"pwh_village_02_beach_b_03",
			},
			sound_events_duration = {
				3.1307499408722,
				1.8912708759308,
				3.2244167327881,
			},
		},
		pwh_village_03_gather_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_03_gather_a_01",
				[2] = "pwh_village_03_gather_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_03_gather_a_01",
				[2] = "pwh_village_03_gather_a_02",
			},
			sound_events_duration = {
				[1] = 4.2999167442322,
				[2] = 3.9408333301544,
			},
		},
		pwh_village_03_gather_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_03_gather_b_01",
				[2] = "pwh_village_03_gather_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_03_gather_b_01",
				[2] = "pwh_village_03_gather_b_02",
			},
			sound_events_duration = {
				[1] = 7.2570834159851,
				[2] = 5.1043543815613,
			},
		},
		pwh_village_03_gather_c = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_03_gather_c_01",
				[2] = "pwh_village_03_gather_c_02",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pwh_village_03_gather_c_01 = {
					{
						"global_context",
						"dwarf_ranger",
						OP.EQ,
						true,
					},
				},
				pwh_village_03_gather_c_02 = {
					{
						"global_context",
						"empire_soldier",
						OP.EQ,
						true,
					},
				},
			},
			sound_events = {
				[1] = "pwh_village_03_gather_c_01",
				[2] = "pwh_village_03_gather_c_02",
			},
			sound_events_duration = {
				[1] = 2.4118957519531,
				[2] = 2.7320001125336,
			},
		},
		pwh_village_03_gather_d = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_03_gather_d_01",
				[2] = "pwh_village_03_gather_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_03_gather_d_01",
				[2] = "pwh_village_03_gather_d_02",
			},
			sound_events_duration = {
				[1] = 6.1320209503174,
				[2] = 6.0490417480469,
			},
		},
		pwh_village_04_skaven_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_04_skaven_a_02",
				[2] = "pwh_village_04_skaven_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_04_skaven_a_02",
				[2] = "pwh_village_04_skaven_a_03",
			},
			sound_events_duration = {
				[1] = 5.9422082901001,
				[2] = 6.2809791564941,
			},
		},
		pwh_village_05_hut_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_05_hut_a_01",
				"pwh_village_05_hut_a_02",
				"pwh_village_05_hut_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_05_hut_a_01",
				"pwh_village_05_hut_a_02",
				"pwh_village_05_hut_a_03",
			},
			sound_events_duration = {
				5.2348127365112,
				3.4926042556763,
				3.9546875953674,
			},
		},
		pwh_village_06_lighthouse_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_06_lighthouse_a_01",
				[2] = "pwh_village_06_lighthouse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_06_lighthouse_a_01",
				[2] = "pwh_village_06_lighthouse_a_02",
			},
			sound_events_duration = {
				[1] = 1.9291249513626,
				[2] = 2.2540624141693,
			},
		},
		pwh_village_06_lighthouse_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_06_lighthouse_b_01",
				[2] = "pwh_village_06_lighthouse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_06_lighthouse_b_01",
				[2] = "pwh_village_06_lighthouse_b_02",
			},
			sound_events_duration = {
				[1] = 3.316645860672,
				[2] = 2.4148750305176,
			},
		},
		pwh_village_07_skaven_shipwreck_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				"face_curious",
				"face_curious",
				"face_curious",
			},
			localization_strings = {
				"pwh_village_07_skaven_shipwreck_a_01",
				"pwh_village_07_skaven_shipwreck_a_02",
				"pwh_village_07_skaven_shipwreck_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_07_skaven_shipwreck_a_01",
				"pwh_village_07_skaven_shipwreck_a_02",
				"pwh_village_07_skaven_shipwreck_a_03",
			},
			sound_events_duration = {
				3.5602917671204,
				3.5541250705719,
				4.6799793243408,
			},
		},
		pwh_village_09_chaos_ships_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_09_chaos_ships_a_01",
				"pwh_village_09_chaos_ships_a_02",
				"pwh_village_09_chaos_ships_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_09_chaos_ships_a_01",
				"pwh_village_09_chaos_ships_a_02",
				"pwh_village_09_chaos_ships_a_03",
			},
			sound_events_duration = {
				6.8619999885559,
				5.039041519165,
				5.6205415725708,
			},
		},
		pwh_village_10_bridge_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_10_bridge_a_01",
				"pwh_village_10_bridge_a_02",
				"pwh_village_10_bridge_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_10_bridge_a_01",
				"pwh_village_10_bridge_a_02",
				"pwh_village_10_bridge_a_03",
			},
			sound_events_duration = {
				3.2331874370575,
				3.0818958282471,
				4.176374912262,
			},
		},
		pwh_village_11_harbour_shipwrecks_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_11_harbour_shipwrecks_a_01",
				"pwh_village_11_harbour_shipwrecks_a_02",
				"pwh_village_11_harbour_shipwrecks_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_11_harbour_shipwrecks_a_01",
				"pwh_village_11_harbour_shipwrecks_a_02",
				"pwh_village_11_harbour_shipwrecks_a_03",
			},
			sound_events_duration = {
				6.4814167022705,
				5.4627914428711,
				5.4353122711182,
			},
		},
		pwh_village_12_harbour_whale_carcass_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_12_harbour_whale_carcass_a_01",
				[2] = "pwh_village_12_harbour_whale_carcass_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_12_harbour_whale_carcass_a_01",
				[2] = "pwh_village_12_harbour_whale_carcass_a_02",
			},
			sound_events_duration = {
				[1] = 3.7226457595825,
				[2] = 5.3612289428711,
			},
		},
		pwh_village_12_harbour_whale_carcass_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_12_harbour_whale_carcass_b_01",
				[2] = "pwh_village_12_harbour_whale_carcass_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_12_harbour_whale_carcass_b_01",
				[2] = "pwh_village_12_harbour_whale_carcass_b_02",
			},
			sound_events_duration = {
				[1] = 4.6765418052673,
				[2] = 4.0935206413269,
			},
		},
		pwh_village_14_guidance_lighthouse_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_14_guidance_lighthouse_a_01",
				[2] = "pwh_village_14_guidance_lighthouse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_14_guidance_lighthouse_a_01",
				[2] = "pwh_village_14_guidance_lighthouse_a_02",
			},
			sound_events_duration = {
				[1] = 5.2951040267944,
				[2] = 5.012770652771,
			},
		},
		pwh_village_14_guidance_lighthouse_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_14_guidance_lighthouse_b_01",
				[2] = "pwh_village_14_guidance_lighthouse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_14_guidance_lighthouse_b_01",
				[2] = "pwh_village_14_guidance_lighthouse_b_02",
			},
			sound_events_duration = {
				[1] = 5.490270614624,
				[2] = 4.7094168663025,
			},
		},
		pwh_village_15_tainted_light_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_15_tainted_light_a_01",
				"pwh_village_15_tainted_light_a_02",
				"pwh_village_15_tainted_light_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_15_tainted_light_a_01",
				"pwh_village_15_tainted_light_a_02",
				"pwh_village_15_tainted_light_a_03",
			},
			sound_events_duration = {
				5.5719375610352,
				4.4973750114441,
				5.203583240509,
			},
		},
		pwh_village_16_intact_ship_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_16_intact_ship_a_01",
				[2] = "pwh_village_16_intact_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_16_intact_ship_a_01",
				[2] = "pwh_village_16_intact_ship_a_02",
			},
			sound_events_duration = {
				[1] = 6.1541666984558,
				[2] = 4.1221251487732,
			},
		},
		pwh_village_16_intact_ship_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_16_intact_ship_b_01",
				[2] = "pwh_village_16_intact_ship_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_16_intact_ship_b_01",
				[2] = "pwh_village_16_intact_ship_b_02",
			},
			sound_events_duration = {
				[1] = 3.2401041984558,
				[2] = 4.9930415153503,
			},
		},
		pwh_village_18_elevator_sighted_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_18_elevator_sighted_a_01",
				[2] = "pwh_village_18_elevator_sighted_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_18_elevator_sighted_a_01",
				[2] = "pwh_village_18_elevator_sighted_a_02",
			},
			sound_events_duration = {
				[1] = 2.8628542423248,
				[2] = 3.2806251049042,
			},
		},
		pwh_village_19_elevator_gears_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_19_elevator_gears_a_01",
				[2] = "pwh_village_19_elevator_gears_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_19_elevator_gears_a_01",
				[2] = "pwh_village_19_elevator_gears_a_02",
			},
			sound_events_duration = {
				[1] = 3.1858749389648,
				[2] = 3.0121042728424,
			},
		},
		pwh_village_20_elevator_oil_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_20_elevator_oil_a_01",
				[2] = "pwh_village_20_elevator_oil_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_20_elevator_oil_a_01",
				[2] = "pwh_village_20_elevator_oil_a_02",
			},
			sound_events_duration = {
				[1] = 2.1934790611267,
				[2] = 3.03089594841,
			},
		},
		pwh_village_20a_elevator_arrived_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_20a_elevator_arrived_a_01",
				[2] = "pwh_village_20a_elevator_arrived_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_20a_elevator_arrived_a_01",
				[2] = "pwh_village_20a_elevator_arrived_a_02",
			},
			sound_events_duration = {
				[1] = 1.6964583396912,
				[2] = 1.6017916202545,
			},
		},
		pwh_village_23_nurgle_gateway_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_23_nurgle_gateway_a_01",
				"pwh_village_23_nurgle_gateway_a_02",
				"pwh_village_23_nurgle_gateway_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_23_nurgle_gateway_a_01",
				"pwh_village_23_nurgle_gateway_a_02",
				"pwh_village_23_nurgle_gateway_a_03",
			},
			sound_events_duration = {
				3.5037708282471,
				4.8267498016357,
				3.7295625209808,
			},
		},
		pwh_village_24_oil_tutorial_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_24_oil_tutorial_a_01",
				[2] = "pwh_village_24_oil_tutorial_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_24_oil_tutorial_a_01",
				[2] = "pwh_village_24_oil_tutorial_a_02",
			},
			sound_events_duration = {
				[1] = 4.0481042861939,
				[2] = 4.3545207977295,
			},
		},
		pwh_village_25_oil_tutorial_complete_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_25_oil_tutorial_complete_a_01",
				[2] = "pwh_village_25_oil_tutorial_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_25_oil_tutorial_complete_a_01",
				[2] = "pwh_village_25_oil_tutorial_complete_a_02",
			},
			sound_events_duration = {
				[1] = 5.7308959960938,
				[2] = 3.5452916622162,
			},
		},
		pwh_village_26_twisted_tree_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_26_twisted_tree_a_01",
				[2] = "pwh_village_26_twisted_tree_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_26_twisted_tree_a_01",
				[2] = "pwh_village_26_twisted_tree_a_02",
			},
			sound_events_duration = {
				[1] = 3.8641874790192,
				[2] = 4.2108960151672,
			},
		},
		pwh_village_26_twisted_tree_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_26_twisted_tree_b_01",
				[2] = "pwh_village_26_twisted_tree_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_26_twisted_tree_b_01",
				[2] = "pwh_village_26_twisted_tree_b_02",
			},
			sound_events_duration = {
				[1] = 4.163104057312,
				[2] = 7.2353959083557,
			},
		},
		pwh_village_28_lighthouse_hero_moment_a = {
			category = "cut_scene_interrupt_three",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_28_lighthouse_hero_moment_a_01",
				"pwh_village_28_lighthouse_hero_moment_a_02",
				"pwh_village_28_lighthouse_hero_moment_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_28_lighthouse_hero_moment_a_01",
				"pwh_village_28_lighthouse_hero_moment_a_02",
				"pwh_village_28_lighthouse_hero_moment_a_03",
			},
			sound_events_duration = {
				5.7499585151672,
				3.9646248817444,
				5.5311665534973,
			},
		},
		pwh_village_29_corruption_source_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_29_corruption_source_a_01",
				[2] = "pwh_village_29_corruption_source_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_29_corruption_source_a_01",
				[2] = "pwh_village_29_corruption_source_a_02",
			},
			sound_events_duration = {
				[1] = 4.2450833320618,
				[2] = 4.4632291793823,
			},
		},
		pwh_village_29_corruption_source_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_29_corruption_source_b_01",
				[2] = "pwh_village_29_corruption_source_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_29_corruption_source_b_01",
				[2] = "pwh_village_29_corruption_source_b_02",
			},
			sound_events_duration = {
				[1] = 6.4255208969116,
				[2] = 4.7915205955505,
			},
		},
		pwh_village_29_corruption_source_c = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_29_corruption_source_c_01",
				[2] = "pwh_village_29_corruption_source_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_29_corruption_source_c_01",
				[2] = "pwh_village_29_corruption_source_c_02",
			},
			sound_events_duration = {
				[1] = 1.404833316803,
				[2] = 2.0211250782013,
			},
		},
		pwh_village_30_burning_town_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_30_burning_town_a_01",
				[2] = "pwh_village_30_burning_town_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_30_burning_town_a_01",
				[2] = "pwh_village_30_burning_town_a_02",
			},
			sound_events_duration = {
				[1] = 3.3763332366943,
				[2] = 3.409437417984,
			},
		},
		pwh_village_30_burning_town_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_30_burning_town_b_01",
				[2] = "pwh_village_30_burning_town_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_30_burning_town_b_01",
				[2] = "pwh_village_30_burning_town_b_02",
			},
			sound_events_duration = {
				[1] = 3.6901874542236,
				[2] = 4.10702085495,
			},
		},
		pwh_village_31_fill_cart_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_31_fill_cart_a_01",
				[2] = "pwh_village_31_fill_cart_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_31_fill_cart_a_01",
				[2] = "pwh_village_31_fill_cart_a_02",
			},
			sound_events_duration = {
				[1] = 5.1093125343323,
				[2] = 5.5431041717529,
			},
		},
		pwh_village_32_that_did_it_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_32_that_did_it_a_01",
				"pwh_village_32_that_did_it_a_02",
				"pwh_village_32_that_did_it_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_32_that_did_it_a_01",
				"pwh_village_32_that_did_it_a_02",
				"pwh_village_32_that_did_it_a_03",
			},
			sound_events_duration = {
				2.2646458148956,
				1.8737916946411,
				2.0337500572205,
			},
		},
		pwh_village_32a_wagon_full_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_32a_wagon_full_a_01",
				[2] = "pwh_village_32a_wagon_full_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_32a_wagon_full_a_01",
				[2] = "pwh_village_32a_wagon_full_a_02",
			},
			sound_events_duration = {
				[1] = 3.3477916717529,
				[2] = 2.8548333644867,
			},
		},
		pwh_village_33_fuse_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_33_fuse_a_01",
				[2] = "pwh_village_33_fuse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_33_fuse_a_01",
				[2] = "pwh_village_33_fuse_a_02",
			},
			sound_events_duration = {
				[1] = 3.8862707614899,
				[2] = 1.9629166126251,
			},
		},
		pwh_village_34_lighthouse_collapse_a = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_34_lighthouse_collapse_a_01",
				[2] = "pwh_village_34_lighthouse_collapse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_34_lighthouse_collapse_a_01",
				[2] = "pwh_village_34_lighthouse_collapse_a_02",
			},
			sound_events_duration = {
				[1] = 4.521541595459,
				[2] = 4.0841665267944,
			},
		},
		pwh_village_34_lighthouse_collapse_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_34_lighthouse_collapse_b_01",
				[2] = "pwh_village_34_lighthouse_collapse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_34_lighthouse_collapse_b_01",
				[2] = "pwh_village_34_lighthouse_collapse_b_02",
			},
			sound_events_duration = {
				[1] = 3.1819791793823,
				[2] = 4.8552293777466,
			},
		},
		pwh_village_34_lighthouse_collapse_c = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_34_lighthouse_collapse_c_01",
				[2] = "pwh_village_34_lighthouse_collapse_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_34_lighthouse_collapse_c_01",
				[2] = "pwh_village_34_lighthouse_collapse_c_02",
			},
			sound_events_duration = {
				[1] = 4.0618543624878,
				[2] = 3.7193334102631,
			},
		},
		pwh_village_35_missing_comrade_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_35_missing_comrade_a_01",
				[2] = "pwh_village_35_missing_comrade_a_02",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pwh_village_35_missing_comrade_a_01 = {
					{
						"global_context",
						"wood_elf",
						OP.EQ,
						true,
					},
				},
				pwh_village_35_missing_comrade_a_02 = {
					{
						"global_context",
						"dwarf_ranger",
						OP.EQ,
						true,
					},
				},
			},
			sound_events = {
				[1] = "pwh_village_35_missing_comrade_a_01",
				[2] = "pwh_village_35_missing_comrade_a_02",
			},
			sound_events_duration = {
				[1] = 4.4626665115356,
				[2] = 4.5474166870117,
			},
		},
		pwh_village_35_missing_comrade_b = {
			category = "level_talk_must_play",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_35_missing_comrade_b_01",
				[2] = "pwh_village_35_missing_comrade_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pwh_village_35_missing_comrade_b_01",
				[2] = "pwh_village_35_missing_comrade_b_02",
			},
			sound_events_duration = {
				[1] = 5.5038542747498,
				[2] = 5.2926664352417,
			},
		},
		pwh_village_35_missing_comrade_c = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_35_missing_comrade_c_01",
				[2] = "pwh_village_35_missing_comrade_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_35_missing_comrade_c_01",
				[2] = "pwh_village_35_missing_comrade_c_02",
			},
			sound_events_duration = {
				[1] = 2.1653125286102,
				[2] = 4.6571249961853,
			},
		},
		pwh_village_bonus_buboes_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
		pwh_village_bonus_buboes_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_bonus_buboes_a_01",
			},
			sound_events = {
				[1] = "pwh_village_bonus_buboes_a_01",
			},
			sound_events_duration = {
				[1] = 1.9363332986832,
			},
		},
		pwh_village_bonus_explosive_cart_tutorial_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_generic_path_blocked_03",
				[2] = "pwh_generic_path_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_generic_path_blocked_03",
				[2] = "pwh_generic_path_blocked_04",
			},
			sound_events_duration = {
				[1] = 1.2155208587647,
				[2] = 1.0631250143051,
			},
		},
		pwh_village_bonus_explosive_cart_tutorial_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_level_bogenhafen_slum_burn_food_03",
			},
			sound_events = {
				[1] = "pwh_level_bogenhafen_slum_burn_food_03",
			},
			sound_events_duration = {
				[1] = 2.8971874713898,
			},
		},
		pwh_village_bonus_fish_barrel_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
		pwh_village_bonus_fish_barrel_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_bonus_fish_barrel_a_01",
			},
			sound_events = {
				[1] = "pwh_village_bonus_fish_barrel_a_01",
			},
			sound_events_duration = {
				[1] = 4.5193958282471,
			},
		},
		pwh_village_bonus_harbour_evil_glow_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_bonus_harbour_evil_glow_a_01",
				"pwh_village_bonus_harbour_evil_glow_a_02",
				"pwh_village_bonus_harbour_evil_glow_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_bonus_harbour_evil_glow_a_01",
				"pwh_village_bonus_harbour_evil_glow_a_02",
				"pwh_village_bonus_harbour_evil_glow_a_03",
			},
			sound_events_duration = {
				2.8346042633057,
				3.3452084064484,
				3.1740832328796,
			},
		},
		pwh_village_bonus_harbour_sewers_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_bonus_harbour_sewers_a_01",
				"pwh_village_bonus_harbour_sewers_a_02",
				"pwh_village_bonus_harbour_sewers_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_bonus_harbour_sewers_a_01",
				"pwh_village_bonus_harbour_sewers_a_02",
				"pwh_village_bonus_harbour_sewers_a_03",
			},
			sound_events_duration = {
				4.4616250991821,
				3.7653541564941,
				4.0332083702087,
			},
		},
		pwh_village_bonus_oil_dispenser_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_bonus_oil_dispenser_a_01",
				[2] = "pwh_village_bonus_oil_dispenser_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_bonus_oil_dispenser_a_01",
				[2] = "pwh_village_bonus_oil_dispenser_a_02",
			},
			sound_events_duration = {
				[1] = 4.2015209197998,
				[2] = 2.7193334102631,
			},
		},
		pwh_village_bonus_shallyan_idols_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_distance = 10,
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
				"pwh_village_bonus_shallyan_idols_a_01",
				"pwh_village_bonus_shallyan_idols_a_02",
				"pwh_village_bonus_shallyan_idols_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_bonus_shallyan_idols_a_01",
				"pwh_village_bonus_shallyan_idols_a_02",
				"pwh_village_bonus_shallyan_idols_a_03",
			},
			sound_events_duration = {
				6.9497289657593,
				5.8597917556763,
				7.9633331298828,
			},
		},
		pwh_village_bonus_tavern_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				"pwh_village_bonus_tavern_a_01",
				"pwh_village_bonus_tavern_a_02",
				"pwh_village_bonus_tavern_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_village_bonus_tavern_a_01",
				"pwh_village_bonus_tavern_a_02",
				"pwh_village_bonus_tavern_a_03",
			},
			sound_events_duration = {
				4.9228749275208,
				2.5837082862854,
				5.0733542442322,
			},
		},
		pwh_village_bonus_whale_guts_a = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_bonus_whale_guts_a_01",
			},
			sound_events = {
				[1] = "pwh_village_bonus_whale_guts_a_01",
			},
			sound_events_duration = {
				[1] = 2.9162917137146,
			},
		},
		pwh_village_bonus_whale_guts_b = {
			category = "level_talk",
			database = "witch_hunter_dlc_whaling_village",
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
				[1] = "pwh_village_bonus_whale_guts_b_01",
			},
			sound_events = {
				[1] = "pwh_village_bonus_whale_guts_b_01",
			},
			sound_events_duration = {
				[1] = 2.3718957901001,
			},
		},
	})
end
