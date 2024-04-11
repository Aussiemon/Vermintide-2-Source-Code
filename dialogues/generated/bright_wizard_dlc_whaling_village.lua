-- chunkname: @dialogues/generated/bright_wizard_dlc_whaling_village.lua

return function ()
	define_rule({
		name = "pbw_village_01_opening_cinematic_a",
		response = "pbw_village_01_opening_cinematic_a",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_village_01_opening_cinematic_c",
		response = "pbw_village_01_opening_cinematic_c",
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
		name = "pbw_village_01_opening_cinematic_d",
		response = "pbw_village_01_opening_cinematic_d",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_village_02_beach_a",
		response = "pbw_village_02_beach_a",
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
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_village_02_beach_b",
		response = "pbw_village_02_beach_b",
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
				"pbw_village_02_beach_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
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
		name = "pbw_village_03_gather_a",
		response = "pbw_village_03_gather_a",
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
				"player_career",
				OP.NEQ,
				"bw_necromancer",
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
		name = "pbw_village_03_gather_b",
		response = "pbw_village_03_gather_b",
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
				"bright_wizard",
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
		name = "pbw_village_03_gather_c",
		response = "pbw_village_03_gather_c",
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
				"bright_wizard",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"wood_elf",
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
		name = "pbw_village_03_gather_d",
		response = "pbw_village_03_gather_d",
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
				"bright_wizard",
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
		name = "pbw_village_04_skaven_a",
		response = "pbw_village_04_skaven_a",
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
		name = "pbw_village_05_hut_a",
		response = "pbw_village_05_hut_a",
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
		name = "pbw_village_06_lighthouse_a",
		response = "pbw_village_06_lighthouse_a",
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
		name = "pbw_village_06_lighthouse_b",
		response = "pbw_village_06_lighthouse_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_07_skaven_shipwreck_a",
		response = "pbw_village_07_skaven_shipwreck_a",
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
		name = "pbw_village_09_chaos_ships_a",
		response = "pbw_village_09_chaos_ships_a",
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
		name = "pbw_village_10_bridge_a",
		response = "pbw_village_10_bridge_a",
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
		name = "pbw_village_11_harbour_shipwrecks_a",
		response = "pbw_village_11_harbour_shipwrecks_a",
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
		name = "pbw_village_12_harbour_whale_carcass_a",
		response = "pbw_village_12_harbour_whale_carcass_a",
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
		name = "pbw_village_12_harbour_whale_carcass_b",
		response = "pbw_village_12_harbour_whale_carcass_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_14_guidance_lighthouse_a",
		response = "pbw_village_14_guidance_lighthouse_a",
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
		name = "pbw_village_14_guidance_lighthouse_b",
		response = "pbw_village_14_guidance_lighthouse_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_15_tainted_light_a",
		response = "pbw_village_15_tainted_light_a",
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
		name = "pbw_village_16_intact_ship_a",
		response = "pbw_village_16_intact_ship_a",
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
		name = "pbw_village_16_intact_ship_b",
		response = "pbw_village_16_intact_ship_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_18_elevator_sighted_a",
		response = "pbw_village_18_elevator_sighted_a",
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
		name = "pbw_village_19_elevator_gears_a",
		response = "pbw_village_19_elevator_gears_a",
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
		name = "pbw_village_20_elevator_oil_a",
		response = "pbw_village_20_elevator_oil_a",
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
		name = "pbw_village_20a_elevator_arrived_a",
		response = "pbw_village_20a_elevator_arrived_a",
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
		name = "pbw_village_23_nurgle_gateway_a",
		response = "pbw_village_23_nurgle_gateway_a",
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
		name = "pbw_village_24_oil_tutorial_a",
		response = "pbw_village_24_oil_tutorial_a",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_25_oil_tutorial_complete_a",
		response = "pbw_village_25_oil_tutorial_complete_a",
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
		name = "pbw_village_26_twisted_tree_a",
		response = "pbw_village_26_twisted_tree_a",
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
		name = "pbw_village_26_twisted_tree_b",
		response = "pbw_village_26_twisted_tree_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_28_lighthouse_hero_moment_a",
		response = "pbw_village_28_lighthouse_hero_moment_a",
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
		name = "pbw_village_29_corruption_source_a",
		response = "pbw_village_29_corruption_source_a",
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
		name = "pbw_village_29_corruption_source_b",
		response = "pbw_village_29_corruption_source_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_29_corruption_source_c",
		response = "pbw_village_29_corruption_source_c",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_30_burning_town_a",
		response = "pbw_village_30_burning_town_a",
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
		name = "pbw_village_30_burning_town_b",
		response = "pbw_village_30_burning_town_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_31_fill_cart_a",
		response = "pbw_village_31_fill_cart_a",
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
		name = "pbw_village_32_that_did_it_a",
		response = "pbw_village_32_that_did_it_a",
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
		name = "pbw_village_32a_wagon_full_a",
		response = "pbw_village_32a_wagon_full_a",
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
		name = "pbw_village_33_fuse_a",
		response = "pbw_village_33_fuse_a",
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
		name = "pbw_village_34_lighthouse_collapse_a",
		response = "pbw_village_34_lighthouse_collapse_a",
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
		name = "pbw_village_34_lighthouse_collapse_b",
		response = "pbw_village_34_lighthouse_collapse_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_34_lighthouse_collapse_c",
		response = "pbw_village_34_lighthouse_collapse_c",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_35_missing_comrade_a",
		response = "pbw_village_35_missing_comrade_a",
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
				"empire_soldier",
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
		name = "pbw_village_35_missing_comrade_b",
		response = "pbw_village_35_missing_comrade_b",
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
				"bright_wizard_npc",
			},
		},
	})
	define_rule({
		name = "pbw_village_35_missing_comrade_c",
		response = "pbw_village_35_missing_comrade_c",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_bonus_buboes_a",
		response = "pbw_village_bonus_buboes_a",
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
		},
	})
	define_rule({
		name = "pbw_village_bonus_buboes_b",
		response = "pbw_village_bonus_buboes_b",
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
				"bright_wizard",
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
		name = "pbw_village_bonus_explosive_cart_tutorial_a",
		response = "pbw_village_bonus_explosive_cart_tutorial_a",
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
		name = "pbw_village_bonus_explosive_cart_tutorial_b",
		response = "pbw_village_bonus_explosive_cart_tutorial_b",
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
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pbw_village_bonus_fish_barrel_a",
		response = "pbw_village_bonus_fish_barrel_a",
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
		},
	})
	define_rule({
		name = "pbw_village_bonus_fish_barrel_b",
		response = "pbw_village_bonus_fish_barrel_b",
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
		name = "pbw_village_bonus_harbour_evil_glow_a",
		response = "pbw_village_bonus_harbour_evil_glow_a",
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
		name = "pbw_village_bonus_harbour_sewers_a",
		response = "pbw_village_bonus_harbour_sewers_a",
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
		name = "pbw_village_bonus_oil_dispenser_a",
		response = "pbw_village_bonus_oil_dispenser_a",
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
		name = "pbw_village_bonus_shallyan_idols_a",
		response = "pbw_village_bonus_shallyan_idols_a",
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
		name = "pbw_village_bonus_tavern_a",
		response = "pbw_village_bonus_tavern_a",
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
		name = "pbw_village_bonus_whale_guts_a",
		response = "pbw_village_bonus_whale_guts_a",
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
		name = "pbw_village_bonus_whale_guts_b",
		response = "pbw_village_bonus_whale_guts_b",
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
				"bright_wizard",
			},
		},
	})
	add_dialogues({
		pbw_village_01_opening_cinematic_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_01_opening_cinematic_a_01",
				[2] = "pbw_village_01_opening_cinematic_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pbw_village_01_opening_cinematic_a_01",
				[2] = "pbw_village_01_opening_cinematic_a_02",
			},
			sound_events_duration = {
				[1] = 4.3597083091736,
				[2] = 2.959166765213,
			},
		},
		pbw_village_01_opening_cinematic_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_01_opening_cinematic_c_01",
				[2] = "pbw_village_01_opening_cinematic_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_01_opening_cinematic_c_01",
				[2] = "pbw_village_01_opening_cinematic_c_02",
			},
			sound_events_duration = {
				[1] = 2.4928123950958,
				[2] = 2.5279166698456,
			},
		},
		pbw_village_01_opening_cinematic_d = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_01_opening_cinematic_d_01",
			},
			sound_events = {
				[1] = "pbw_village_01_opening_cinematic_d_01",
			},
			sound_events_duration = {
				[1] = 2.1866567134857,
			},
		},
		pbw_village_02_beach_a = {
			category = "casual_singing_03",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_02_beach_a_01",
				"pbw_village_02_beach_a_02",
				"pbw_village_02_beach_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_02_beach_a_01",
				"pbw_village_02_beach_a_02",
				"pbw_village_02_beach_a_03",
			},
			sound_events_duration = {
				4.6674375534058,
				5.1848335266113,
				5.1366667747498,
			},
		},
		pbw_village_02_beach_b = {
			category = "casual_singing_03",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_02_beach_b_01",
				"pbw_village_02_beach_b_02",
				"pbw_village_02_beach_b_03",
				"pbw_nm_village_02_beach_b_04",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pbw_nm_village_02_beach_b_04 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						false,
					},
				},
			},
			sound_events = {
				"pbw_village_02_beach_b_01",
				"pbw_village_02_beach_b_02",
				"pbw_village_02_beach_b_03",
				"pbw_nm_village_02_beach_b_04",
			},
			sound_events_duration = {
				2.1426250934601,
				2.3121666908264,
				1.7976875305176,
				5.8272914886475,
			},
		},
		pbw_village_03_gather_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_03_gather_a_01",
				[2] = "pbw_village_03_gather_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_03_gather_a_01",
				[2] = "pbw_village_03_gather_a_02",
			},
			sound_events_duration = {
				[1] = 4.5608334541321,
				[2] = 2.8329374790192,
			},
		},
		pbw_village_03_gather_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_03_gather_b_01",
				[2] = "pbw_village_03_gather_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_03_gather_b_01",
				[2] = "pbw_village_03_gather_b_02",
			},
			sound_events_duration = {
				[1] = 2.2287292480469,
				[2] = 3.3942084312439,
			},
		},
		pbw_village_03_gather_c = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_03_gather_c_01",
				"pbw_village_03_gather_c_02",
				"pbw_nm_village_03_gather_c_03",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pbw_nm_village_03_gather_c_03 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						false,
					},
					{
						"global_context",
						"empire_soldier",
						OP.EQ,
						true,
					},
				},
				pbw_village_03_gather_c_01 = {
					{
						"global_context",
						"empire_soldier",
						OP.EQ,
						true,
					},
				},
				pbw_village_03_gather_c_02 = {
					{
						"global_context",
						"wood_elf",
						OP.EQ,
						true,
					},
				},
			},
			sound_events = {
				"pbw_village_03_gather_c_01",
				"pbw_village_03_gather_c_02",
				"pbw_nm_village_03_gather_c_03",
			},
			sound_events_duration = {
				2.6311457157135,
				2.4684791564941,
				4.0643539428711,
			},
		},
		pbw_village_03_gather_d = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_03_gather_d_01",
				[2] = "pbw_village_03_gather_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_03_gather_d_01",
				[2] = "pbw_village_03_gather_d_02",
			},
			sound_events_duration = {
				[1] = 3.8421041965485,
				[2] = 4.0962290763855,
			},
		},
		pbw_village_04_skaven_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_04_skaven_a_01",
				"pbw_village_04_skaven_a_02",
				"pbw_village_04_skaven_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_04_skaven_a_01",
				"pbw_village_04_skaven_a_02",
				"pbw_village_04_skaven_a_03",
			},
			sound_events_duration = {
				3.9764375686645,
				3.6236457824707,
				4.1824584007263,
			},
		},
		pbw_village_05_hut_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_05_hut_a_01",
				"pbw_village_05_hut_a_02",
				"pbw_village_05_hut_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_05_hut_a_01",
				"pbw_village_05_hut_a_02",
				"pbw_village_05_hut_a_03",
			},
			sound_events_duration = {
				3.9373750686645,
				4.1605415344238,
				4.1320624351502,
			},
		},
		pbw_village_06_lighthouse_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_06_lighthouse_a_01",
				[2] = "pbw_village_06_lighthouse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_06_lighthouse_a_01",
				[2] = "pbw_village_06_lighthouse_a_02",
			},
			sound_events_duration = {
				[1] = 1.7507083415985,
				[2] = 1.6161249876022,
			},
		},
		pbw_village_06_lighthouse_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_06_lighthouse_b_01",
				[2] = "pbw_village_06_lighthouse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_06_lighthouse_b_01",
				[2] = "pbw_village_06_lighthouse_b_02",
			},
			sound_events_duration = {
				[1] = 1.2062499523163,
				[2] = 1.4244166612625,
			},
		},
		pbw_village_07_skaven_shipwreck_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_07_skaven_shipwreck_a_01",
				"pbw_village_07_skaven_shipwreck_a_02",
				"pbw_village_07_skaven_shipwreck_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_07_skaven_shipwreck_a_01",
				"pbw_village_07_skaven_shipwreck_a_02",
				"pbw_village_07_skaven_shipwreck_a_03",
			},
			sound_events_duration = {
				2.7928750514984,
				3.8274374008179,
				2.6751666069031,
			},
		},
		pbw_village_09_chaos_ships_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_09_chaos_ships_a_01",
				"pbw_village_09_chaos_ships_a_02",
				"pbw_village_09_chaos_ships_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_09_chaos_ships_a_01",
				"pbw_village_09_chaos_ships_a_02",
				"pbw_village_09_chaos_ships_a_03",
			},
			sound_events_duration = {
				5.8037085533142,
				4.5476040840149,
				4.2920207977295,
			},
		},
		pbw_village_10_bridge_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_10_bridge_a_01",
				"pbw_village_10_bridge_a_02",
				"pbw_village_10_bridge_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_10_bridge_a_01",
				"pbw_village_10_bridge_a_02",
				"pbw_village_10_bridge_a_03",
			},
			sound_events_duration = {
				3.6367082595825,
				1.2369375228882,
				1.6714375019074,
			},
		},
		pbw_village_11_harbour_shipwrecks_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_11_harbour_shipwrecks_a_01",
				"pbw_village_11_harbour_shipwrecks_a_02",
				"pbw_village_11_harbour_shipwrecks_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_11_harbour_shipwrecks_a_01",
				"pbw_village_11_harbour_shipwrecks_a_02",
				"pbw_village_11_harbour_shipwrecks_a_03",
			},
			sound_events_duration = {
				2.369062423706,
				5.5753126144409,
				5.5548958778381,
			},
		},
		pbw_village_12_harbour_whale_carcass_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_12_harbour_whale_carcass_a_01",
				[2] = "pbw_village_12_harbour_whale_carcass_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_12_harbour_whale_carcass_a_01",
				[2] = "pbw_village_12_harbour_whale_carcass_a_02",
			},
			sound_events_duration = {
				[1] = 4.0139789581299,
				[2] = 2.0056874752045,
			},
		},
		pbw_village_12_harbour_whale_carcass_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_12_harbour_whale_carcass_b_01",
				[2] = "pbw_village_12_harbour_whale_carcass_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_12_harbour_whale_carcass_b_01",
				[2] = "pbw_village_12_harbour_whale_carcass_b_02",
			},
			sound_events_duration = {
				[1] = 2.9471249580383,
				[2] = 5.9049792289734,
			},
		},
		pbw_village_14_guidance_lighthouse_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_14_guidance_lighthouse_a_01",
				[2] = "pbw_village_14_guidance_lighthouse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_14_guidance_lighthouse_a_01",
				[2] = "pbw_village_14_guidance_lighthouse_a_02",
			},
			sound_events_duration = {
				[1] = 3.743979215622,
				[2] = 4.2291874885559,
			},
		},
		pbw_village_14_guidance_lighthouse_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_14_guidance_lighthouse_b_01",
				[2] = "pbw_village_14_guidance_lighthouse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_14_guidance_lighthouse_b_01",
				[2] = "pbw_village_14_guidance_lighthouse_b_02",
			},
			sound_events_duration = {
				[1] = 3.1951251029968,
				[2] = 3.1600832939148,
			},
		},
		pbw_village_15_tainted_light_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_15_tainted_light_a_01",
				"pbw_village_15_tainted_light_a_02",
				"pbw_village_15_tainted_light_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_15_tainted_light_a_01",
				"pbw_village_15_tainted_light_a_02",
				"pbw_village_15_tainted_light_a_03",
			},
			sound_events_duration = {
				5.8551459312439,
				3.8417708873749,
				3.9910209178925,
			},
		},
		pbw_village_16_intact_ship_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_16_intact_ship_a_01",
				[2] = "pbw_village_16_intact_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_16_intact_ship_a_01",
				[2] = "pbw_village_16_intact_ship_a_02",
			},
			sound_events_duration = {
				[1] = 3.1026666164398,
				[2] = 2.1923124790192,
			},
		},
		pbw_village_16_intact_ship_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_16_intact_ship_b_01",
				[2] = "pbw_village_16_intact_ship_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_16_intact_ship_b_01",
				[2] = "pbw_village_16_intact_ship_b_02",
			},
			sound_events_duration = {
				[1] = 2.4316666126251,
				[2] = 2.8097083568573,
			},
		},
		pbw_village_18_elevator_sighted_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_18_elevator_sighted_a_01",
				[2] = "pbw_village_18_elevator_sighted_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_18_elevator_sighted_a_01",
				[2] = "pbw_village_18_elevator_sighted_a_02",
			},
			sound_events_duration = {
				[1] = 2.4677708148956,
				[2] = 3.6396458148956,
			},
		},
		pbw_village_19_elevator_gears_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_19_elevator_gears_a_01",
				[2] = "pbw_village_19_elevator_gears_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_19_elevator_gears_a_01",
				[2] = "pbw_village_19_elevator_gears_a_02",
			},
			sound_events_duration = {
				[1] = 2.3885207176209,
				[2] = 2.4031040668488,
			},
		},
		pbw_village_20_elevator_oil_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_20_elevator_oil_a_01",
				[2] = "pbw_village_20_elevator_oil_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_20_elevator_oil_a_01",
				[2] = "pbw_village_20_elevator_oil_a_02",
			},
			sound_events_duration = {
				[1] = 2.9841041564941,
				[2] = 2.7677500247955,
			},
		},
		pbw_village_20a_elevator_arrived_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_20a_elevator_arrived_a_01",
				[2] = "pbw_village_20a_elevator_arrived_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_20a_elevator_arrived_a_01",
				[2] = "pbw_village_20a_elevator_arrived_a_02",
			},
			sound_events_duration = {
				[1] = 1.7980208396912,
				[2] = 1.6592082977295,
			},
		},
		pbw_village_23_nurgle_gateway_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_23_nurgle_gateway_a_01",
				"pbw_village_23_nurgle_gateway_a_02",
				"pbw_village_23_nurgle_gateway_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_23_nurgle_gateway_a_01",
				"pbw_village_23_nurgle_gateway_a_02",
				"pbw_village_23_nurgle_gateway_a_03",
			},
			sound_events_duration = {
				2.9253957271576,
				2.888854265213,
				3.3436458110809,
			},
		},
		pbw_village_24_oil_tutorial_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_24_oil_tutorial_a_01",
				[2] = "pbw_village_24_oil_tutorial_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_24_oil_tutorial_a_01",
				[2] = "pbw_village_24_oil_tutorial_a_02",
			},
			sound_events_duration = {
				[1] = 2.5959374904633,
				[2] = 4.2541666030884,
			},
		},
		pbw_village_25_oil_tutorial_complete_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_25_oil_tutorial_complete_a_01",
				[2] = "pbw_village_25_oil_tutorial_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_25_oil_tutorial_complete_a_01",
				[2] = "pbw_village_25_oil_tutorial_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.8841457366943,
				[2] = 3.7204792499542,
			},
		},
		pbw_village_26_twisted_tree_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_26_twisted_tree_a_01",
				[2] = "pbw_village_26_twisted_tree_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_26_twisted_tree_a_01",
				[2] = "pbw_village_26_twisted_tree_a_02",
			},
			sound_events_duration = {
				[1] = 3.0779583454132,
				[2] = 2.3838334083557,
			},
		},
		pbw_village_26_twisted_tree_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_26_twisted_tree_b_01",
				[2] = "pbw_village_26_twisted_tree_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_26_twisted_tree_b_01",
				[2] = "pbw_village_26_twisted_tree_b_02",
			},
			sound_events_duration = {
				[1] = 2.8892290592194,
				[2] = 3.6563959121704,
			},
		},
		pbw_village_28_lighthouse_hero_moment_a = {
			category = "cut_scene_interrupt_three",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_28_lighthouse_hero_moment_a_01",
				"pbw_village_28_lighthouse_hero_moment_a_02",
				"pbw_village_28_lighthouse_hero_moment_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_28_lighthouse_hero_moment_a_01",
				"pbw_village_28_lighthouse_hero_moment_a_02",
				"pbw_village_28_lighthouse_hero_moment_a_03",
			},
			sound_events_duration = {
				5.7940626144409,
				4.5081667900085,
				3.6847500801086,
			},
		},
		pbw_village_29_corruption_source_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_29_corruption_source_a_01",
				[2] = "pbw_village_29_corruption_source_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_29_corruption_source_a_01",
				[2] = "pbw_village_29_corruption_source_a_02",
			},
			sound_events_duration = {
				[1] = 2.7479374408722,
				[2] = 4.6021666526794,
			},
		},
		pbw_village_29_corruption_source_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_29_corruption_source_b_01",
				[2] = "pbw_village_29_corruption_source_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_29_corruption_source_b_01",
				[2] = "pbw_village_29_corruption_source_b_02",
			},
			sound_events_duration = {
				[1] = 2.9234166145325,
				[2] = 2.8384165763855,
			},
		},
		pbw_village_29_corruption_source_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_29_corruption_source_c_01",
				[2] = "pbw_village_29_corruption_source_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_29_corruption_source_c_01",
				[2] = "pbw_village_29_corruption_source_c_02",
			},
			sound_events_duration = {
				[1] = 1.2665833234787,
				[2] = 1.5674375295639,
			},
		},
		pbw_village_30_burning_town_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_30_burning_town_a_01",
				[2] = "pbw_village_30_burning_town_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_30_burning_town_a_01",
				[2] = "pbw_village_30_burning_town_a_02",
			},
			sound_events_duration = {
				[1] = 5.1817083358765,
				[2] = 3.6076250076294,
			},
		},
		pbw_village_30_burning_town_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_30_burning_town_b_01",
				[2] = "pbw_village_30_burning_town_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_30_burning_town_b_01",
				[2] = "pbw_village_30_burning_town_b_02",
			},
			sound_events_duration = {
				[1] = 2.0131874084473,
				[2] = 3.0329792499542,
			},
		},
		pbw_village_31_fill_cart_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_31_fill_cart_a_01",
				[2] = "pbw_village_31_fill_cart_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_31_fill_cart_a_01",
				[2] = "pbw_village_31_fill_cart_a_02",
			},
			sound_events_duration = {
				[1] = 6.04452085495,
				[2] = 4.8865833282471,
			},
		},
		pbw_village_32_that_did_it_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_32_that_did_it_a_01",
				"pbw_village_32_that_did_it_a_02",
				"pbw_village_32_that_did_it_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_32_that_did_it_a_01",
				"pbw_village_32_that_did_it_a_02",
				"pbw_village_32_that_did_it_a_03",
			},
			sound_events_duration = {
				2.7617917060852,
				2.4428749084473,
				2.2533540725708,
			},
		},
		pbw_village_32a_wagon_full_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_32a_wagon_full_a_01",
				[2] = "pbw_village_32a_wagon_full_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_32a_wagon_full_a_01",
				[2] = "pbw_village_32a_wagon_full_a_02",
			},
			sound_events_duration = {
				[1] = 2.8738334178925,
				[2] = 3.0412707328796,
			},
		},
		pbw_village_33_fuse_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_33_fuse_a_01",
				[2] = "pbw_village_33_fuse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_33_fuse_a_01",
				[2] = "pbw_village_33_fuse_a_02",
			},
			sound_events_duration = {
				[1] = 2.5643541812897,
				[2] = 3.6720416545868,
			},
		},
		pbw_village_34_lighthouse_collapse_a = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_34_lighthouse_collapse_a_01",
				[2] = "pbw_village_34_lighthouse_collapse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_34_lighthouse_collapse_a_01",
				[2] = "pbw_village_34_lighthouse_collapse_a_02",
			},
			sound_events_duration = {
				[1] = 6.3379583358765,
				[2] = 5.0933332443237,
			},
		},
		pbw_village_34_lighthouse_collapse_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_34_lighthouse_collapse_b_01",
				[2] = "pbw_village_34_lighthouse_collapse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_34_lighthouse_collapse_b_01",
				[2] = "pbw_village_34_lighthouse_collapse_b_02",
			},
			sound_events_duration = {
				[1] = 4.2049999237061,
				[2] = 3.903041601181,
			},
		},
		pbw_village_34_lighthouse_collapse_c = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_34_lighthouse_collapse_c_01",
				[2] = "pbw_village_34_lighthouse_collapse_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_34_lighthouse_collapse_c_01",
				[2] = "pbw_village_34_lighthouse_collapse_c_02",
			},
			sound_events_duration = {
				[1] = 2.7997915744781,
				[2] = 3.5437707901001,
			},
		},
		pbw_village_35_missing_comrade_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_35_missing_comrade_a_01",
				[2] = "pbw_village_35_missing_comrade_a_02",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pbw_village_35_missing_comrade_a_01 = {
					{
						"global_context",
						"wood_elf",
						OP.EQ,
						true,
					},
				},
				pbw_village_35_missing_comrade_a_02 = {
					{
						"global_context",
						"empire_soldier",
						OP.EQ,
						true,
					},
				},
			},
			sound_events = {
				[1] = "pbw_village_35_missing_comrade_a_01",
				[2] = "pbw_village_35_missing_comrade_a_02",
			},
			sound_events_duration = {
				[1] = 3.9125416278839,
				[2] = 3.7255001068115,
			},
		},
		pbw_village_35_missing_comrade_b = {
			category = "level_talk_must_play",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_35_missing_comrade_b_01",
				[2] = "pbw_village_35_missing_comrade_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pbw_village_35_missing_comrade_b_01",
				[2] = "pbw_village_35_missing_comrade_b_02",
			},
			sound_events_duration = {
				[1] = 4.6987290382385,
				[2] = 4.0866250991821,
			},
		},
		pbw_village_35_missing_comrade_c = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_35_missing_comrade_c_01",
				[2] = "pbw_village_35_missing_comrade_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_35_missing_comrade_c_01",
				[2] = "pbw_village_35_missing_comrade_c_02",
			},
			sound_events_duration = {
				[1] = 2.4053750038147,
				[2] = 3.0400834083557,
			},
		},
		pbw_village_bonus_buboes_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
		pbw_village_bonus_buboes_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_bonus_buboes_a_01",
			},
			sound_events = {
				[1] = "pbw_village_bonus_buboes_a_01",
			},
			sound_events_duration = {
				[1] = 2.2147707939148,
			},
		},
		pbw_village_bonus_explosive_cart_tutorial_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_generic_path_blocked_01",
				"pbw_generic_path_blocked_03",
				"pbw_generic_path_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_generic_path_blocked_01",
				"pbw_generic_path_blocked_03",
				"pbw_generic_path_blocked_04",
			},
			sound_events_duration = {
				1.229708313942,
				1.2307499647141,
				2.3981459140778,
			},
		},
		pbw_village_bonus_explosive_cart_tutorial_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_level_ussingen_cart_ideas_01",
				[2] = "pbw_level_ussingen_cart_ideas_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_ussingen_cart_ideas_01",
				[2] = "pbw_level_ussingen_cart_ideas_02",
			},
			sound_events_duration = {
				[1] = 3.2255833148956,
				[2] = 2.5411040782928,
			},
		},
		pbw_village_bonus_fish_barrel_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
		pbw_village_bonus_fish_barrel_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_bonus_fish_barrel_a_01",
			},
			sound_events = {
				[1] = "pbw_village_bonus_fish_barrel_a_01",
			},
			sound_events_duration = {
				[1] = 3.5711667537689,
			},
		},
		pbw_village_bonus_harbour_evil_glow_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_bonus_harbour_evil_glow_a_01",
				"pbw_village_bonus_harbour_evil_glow_a_02",
				"pbw_village_bonus_harbour_evil_glow_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_bonus_harbour_evil_glow_a_01",
				"pbw_village_bonus_harbour_evil_glow_a_02",
				"pbw_village_bonus_harbour_evil_glow_a_03",
			},
			sound_events_duration = {
				3.2424376010895,
				3.5185832977295,
				5.1222500801086,
			},
		},
		pbw_village_bonus_harbour_sewers_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_bonus_harbour_sewers_a_01",
				"pbw_village_bonus_harbour_sewers_a_02",
				"pbw_village_bonus_harbour_sewers_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_bonus_harbour_sewers_a_01",
				"pbw_village_bonus_harbour_sewers_a_02",
				"pbw_village_bonus_harbour_sewers_a_03",
			},
			sound_events_duration = {
				5.3663539886475,
				3.737208366394,
				3.7795000076294,
			},
		},
		pbw_village_bonus_oil_dispenser_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_bonus_oil_dispenser_a_01",
				[2] = "pbw_village_bonus_oil_dispenser_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_bonus_oil_dispenser_a_01",
				[2] = "pbw_village_bonus_oil_dispenser_a_02",
			},
			sound_events_duration = {
				[1] = 2.9170832633972,
				[2] = 2.6283750534058,
			},
		},
		pbw_village_bonus_shallyan_idols_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_bonus_shallyan_idols_a_01",
				"pbw_village_bonus_shallyan_idols_a_02",
				"pbw_village_bonus_shallyan_idols_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_bonus_shallyan_idols_a_01",
				"pbw_village_bonus_shallyan_idols_a_02",
				"pbw_village_bonus_shallyan_idols_a_03",
			},
			sound_events_duration = {
				5.2999582290649,
				4.151978969574,
				3.1511249542236,
			},
		},
		pbw_village_bonus_tavern_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				"pbw_village_bonus_tavern_a_01",
				"pbw_village_bonus_tavern_a_02",
				"pbw_village_bonus_tavern_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_village_bonus_tavern_a_01",
				"pbw_village_bonus_tavern_a_02",
				"pbw_village_bonus_tavern_a_03",
			},
			sound_events_duration = {
				2.8830626010895,
				3.3706667423248,
				3.5272500514984,
			},
		},
		pbw_village_bonus_whale_guts_a = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_bonus_whale_guts_a_01",
			},
			sound_events = {
				[1] = "pbw_village_bonus_whale_guts_a_01",
			},
			sound_events_duration = {
				[1] = 3.5045833587647,
			},
		},
		pbw_village_bonus_whale_guts_b = {
			category = "level_talk",
			database = "bright_wizard_dlc_whaling_village",
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
				[1] = "pbw_village_bonus_whale_guts_b_01",
			},
			sound_events = {
				[1] = "pbw_village_bonus_whale_guts_b_01",
			},
			sound_events_duration = {
				[1] = 2.6715416908264,
			},
		},
	})
end
