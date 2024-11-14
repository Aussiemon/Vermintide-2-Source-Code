-- chunkname: @dialogues/generated/empire_soldier_dlc_whaling_village.lua

return function ()
	define_rule({
		name = "pes_village_01_opening_cinematic_a",
		probability = 1,
		response = "pes_village_01_opening_cinematic_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_village_01_opening_cinematic_b",
		probability = 1,
		response = "pes_village_01_opening_cinematic_b",
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
				"empire_soldier",
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
		name = "pes_village_01_opening_cinematic_d",
		probability = 1,
		response = "pes_village_01_opening_cinematic_d",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_village_02_beach_a",
		probability = 1,
		response = "pes_village_02_beach_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_village_02_beach_b",
		probability = 1,
		response = "pes_village_02_beach_b",
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
				"pes_village_02_beach_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_village_03_gather_a",
		probability = 1,
		response = "pes_village_03_gather_a",
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
		name = "pes_village_03_gather_b",
		probability = 1,
		response = "pes_village_03_gather_b",
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
				"empire_soldier",
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
		name = "pes_village_03_gather_c",
		probability = 1,
		response = "pes_village_03_gather_c",
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
				"empire_soldier",
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
		name = "pes_village_03_gather_d",
		probability = 1,
		response = "pes_village_03_gather_d",
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
				"empire_soldier",
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
		name = "pes_village_04_skaven_a",
		probability = 1,
		response = "pes_village_04_skaven_a",
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
		name = "pes_village_05_hut_a",
		probability = 1,
		response = "pes_village_05_hut_a",
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
		name = "pes_village_06_lighthouse_a",
		probability = 1,
		response = "pes_village_06_lighthouse_a",
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
		name = "pes_village_06_lighthouse_b",
		probability = 1,
		response = "pes_village_06_lighthouse_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_07_skaven_shipwreck_a",
		probability = 1,
		response = "pes_village_07_skaven_shipwreck_a",
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
		name = "pes_village_09_chaos_ships_a",
		probability = 1,
		response = "pes_village_09_chaos_ships_a",
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
		name = "pes_village_10_bridge_a",
		probability = 1,
		response = "pes_village_10_bridge_a",
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
		name = "pes_village_11_harbour_shipwrecks_a",
		probability = 1,
		response = "pes_village_11_harbour_shipwrecks_a",
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
		name = "pes_village_12_harbour_whale_carcass_a",
		probability = 1,
		response = "pes_village_12_harbour_whale_carcass_a",
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
		name = "pes_village_12_harbour_whale_carcass_b",
		probability = 1,
		response = "pes_village_12_harbour_whale_carcass_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_14_guidance_lighthouse_a",
		probability = 1,
		response = "pes_village_14_guidance_lighthouse_a",
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
		name = "pes_village_14_guidance_lighthouse_b",
		probability = 1,
		response = "pes_village_14_guidance_lighthouse_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_15_tainted_light_a",
		probability = 1,
		response = "pes_village_15_tainted_light_a",
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
		name = "pes_village_16_intact_ship_a",
		probability = 1,
		response = "pes_village_16_intact_ship_a",
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
		name = "pes_village_16_intact_ship_b",
		probability = 1,
		response = "pes_village_16_intact_ship_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_18_elevator_sighted_a",
		probability = 1,
		response = "pes_village_18_elevator_sighted_a",
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
		name = "pes_village_19_elevator_gears_a",
		probability = 1,
		response = "pes_village_19_elevator_gears_a",
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
		name = "pes_village_20_elevator_oil_a",
		probability = 1,
		response = "pes_village_20_elevator_oil_a",
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
		name = "pes_village_20a_elevator_arrived_a",
		probability = 1,
		response = "pes_village_20a_elevator_arrived_a",
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
		name = "pes_village_23_nurgle_gateway_a",
		probability = 1,
		response = "pes_village_23_nurgle_gateway_a",
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
		name = "pes_village_24_oil_tutorial_a",
		probability = 1,
		response = "pes_village_24_oil_tutorial_a",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_25_oil_tutorial_complete_a",
		probability = 1,
		response = "pes_village_25_oil_tutorial_complete_a",
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
		name = "pes_village_26_twisted_tree_a",
		probability = 1,
		response = "pes_village_26_twisted_tree_a",
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
		name = "pes_village_26_twisted_tree_b",
		probability = 1,
		response = "pes_village_26_twisted_tree_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_28_lighthouse_hero_moment_a",
		probability = 1,
		response = "pes_village_28_lighthouse_hero_moment_a",
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
		name = "pes_village_29_corruption_source_a",
		probability = 1,
		response = "pes_village_29_corruption_source_a",
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
		name = "pes_village_29_corruption_source_b",
		probability = 1,
		response = "pes_village_29_corruption_source_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_29_corruption_source_c",
		probability = 1,
		response = "pes_village_29_corruption_source_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_30_burning_town_a",
		probability = 1,
		response = "pes_village_30_burning_town_a",
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
		name = "pes_village_30_burning_town_b",
		probability = 1,
		response = "pes_village_30_burning_town_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_31_fill_cart_a",
		probability = 1,
		response = "pes_village_31_fill_cart_a",
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
		name = "pes_village_32_that_did_it_a",
		probability = 1,
		response = "pes_village_32_that_did_it_a",
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
		name = "pes_village_32a_wagon_full_a",
		probability = 1,
		response = "pes_village_32a_wagon_full_a",
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
		name = "pes_village_33_fuse_a",
		probability = 1,
		response = "pes_village_33_fuse_a",
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
		name = "pes_village_34_lighthouse_collapse_a",
		probability = 1,
		response = "pes_village_34_lighthouse_collapse_a",
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
		name = "pes_village_34_lighthouse_collapse_b",
		probability = 1,
		response = "pes_village_34_lighthouse_collapse_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_34_lighthouse_collapse_c",
		probability = 1,
		response = "pes_village_34_lighthouse_collapse_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_35_missing_comrade_a",
		probability = 1,
		response = "pes_village_35_missing_comrade_a",
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
				12,
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
		name = "pes_village_35_missing_comrade_b",
		probability = 1,
		response = "pes_village_35_missing_comrade_b",
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
				"empire_soldier_npc",
			},
		},
	})
	define_rule({
		name = "pes_village_35_missing_comrade_c",
		probability = 1,
		response = "pes_village_35_missing_comrade_c",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_bonus_buboes_a",
		probability = 1,
		response = "pes_village_bonus_buboes_a",
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
		},
	})
	define_rule({
		name = "pes_village_bonus_buboes_b",
		probability = 1,
		response = "pes_village_bonus_buboes_b",
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
				"empire_soldier",
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
		name = "pes_village_bonus_explosive_cart_tutorial_a",
		probability = 1,
		response = "pes_village_bonus_explosive_cart_tutorial_a",
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
		name = "pes_village_bonus_explosive_cart_tutorial_b",
		probability = 1,
		response = "pes_village_bonus_explosive_cart_tutorial_b",
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
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pes_village_bonus_fish_barrel_a",
		probability = 1,
		response = "pes_village_bonus_fish_barrel_a",
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
		},
	})
	define_rule({
		name = "pes_village_bonus_fish_barrel_b",
		probability = 1,
		response = "pes_village_bonus_fish_barrel_b",
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
		name = "pes_village_bonus_harbour_evil_glow_a",
		probability = 1,
		response = "pes_village_bonus_harbour_evil_glow_a",
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
		name = "pes_village_bonus_harbour_sewers_a",
		probability = 1,
		response = "pes_village_bonus_harbour_sewers_a",
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
		name = "pes_village_bonus_oil_dispenser_a",
		probability = 1,
		response = "pes_village_bonus_oil_dispenser_a",
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
		name = "pes_village_bonus_shallyan_idols_b",
		probability = 1,
		response = "pes_village_bonus_shallyan_idols_b",
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
		},
	})
	define_rule({
		name = "pes_village_bonus_tavern_a",
		probability = 1,
		response = "pes_village_bonus_tavern_a",
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
		name = "pes_village_bonus_whale_guts_a",
		probability = 1,
		response = "pes_village_bonus_whale_guts_a",
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
		name = "pes_village_bonus_whale_guts_b",
		probability = 1,
		response = "pes_village_bonus_whale_guts_b",
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
				"empire_soldier",
			},
		},
	})
	add_dialogues({
		pes_village_01_opening_cinematic_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_01_opening_cinematic_a_01",
				[2] = "pes_village_01_opening_cinematic_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pes_village_01_opening_cinematic_a_01",
				[2] = "pes_village_01_opening_cinematic_a_02",
			},
			sound_events_duration = {
				[1] = 3.0046665668488,
				[2] = 4.4823541641235,
			},
		},
		pes_village_01_opening_cinematic_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_01_opening_cinematic_b_01",
				[2] = "pes_village_01_opening_cinematic_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_01_opening_cinematic_b_01",
				[2] = "pes_village_01_opening_cinematic_b_02",
			},
			sound_events_duration = {
				[1] = 2.3414165973663,
				[2] = 2.4448957443237,
			},
		},
		pes_village_01_opening_cinematic_d = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_01_opening_cinematic_d_01",
			},
			sound_events = {
				[1] = "pes_village_01_opening_cinematic_d_01",
			},
			sound_events_duration = {
				[1] = 2.2866567373276,
			},
		},
		pes_village_02_beach_a = {
			category = "casual_singing_03",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_02_beach_a_01",
				"pes_village_02_beach_a_02",
				"pes_village_02_beach_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_02_beach_a_01",
				"pes_village_02_beach_a_02",
				"pes_village_02_beach_a_03",
			},
			sound_events_duration = {
				2.8854999542236,
				3.1113750934601,
				4.5618124008179,
			},
		},
		pes_village_02_beach_b = {
			category = "casual_singing_03",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_02_beach_b_01",
				"pes_village_02_beach_b_02",
				"pes_village_02_beach_b_03",
				"pes_gk_village_02_beach_b_04",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pes_gk_village_02_beach_b_04 = {
					{
						"global_context",
						"es_questingknight",
						OP.EQ,
						false,
					},
				},
			},
			sound_events = {
				"pes_village_02_beach_b_01",
				"pes_village_02_beach_b_02",
				"pes_village_02_beach_b_03",
				"pes_gk_village_02_beach_b_04",
			},
			sound_events_duration = {
				2.4948749542236,
				2.0821249485016,
				2.7751667499542,
				3.2172083854675,
			},
		},
		pes_village_03_gather_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_03_gather_a_01",
				[2] = "pes_village_03_gather_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_03_gather_a_01",
				[2] = "pes_village_03_gather_a_02",
			},
			sound_events_duration = {
				[1] = 4.4037084579468,
				[2] = 4.4261250495911,
			},
		},
		pes_village_03_gather_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_03_gather_b_01",
				[2] = "pes_village_03_gather_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_03_gather_b_01",
				[2] = "pes_village_03_gather_b_02",
			},
			sound_events_duration = {
				[1] = 4.6691875457764,
				[2] = 3.1119999885559,
			},
		},
		pes_village_03_gather_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_03_gather_c_01",
				[2] = "pes_village_03_gather_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_03_gather_c_01",
				[2] = "pes_village_03_gather_c_02",
			},
			sound_events_duration = {
				[1] = 3.1984167098999,
				[2] = 4.1001873016357,
			},
		},
		pes_village_03_gather_d = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_03_gather_d_01",
				[2] = "pes_village_03_gather_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_03_gather_d_01",
				[2] = "pes_village_03_gather_d_02",
			},
			sound_events_duration = {
				[1] = 2.7744166851044,
				[2] = 3.0637290477753,
			},
		},
		pes_village_04_skaven_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_04_skaven_a_01",
				"pes_village_04_skaven_a_02",
				"pes_village_04_skaven_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_04_skaven_a_01",
				"pes_village_04_skaven_a_02",
				"pes_village_04_skaven_a_03",
			},
			sound_events_duration = {
				2.5558333396912,
				3.9454998970032,
				4.0961666107178,
			},
		},
		pes_village_05_hut_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_05_hut_a_01",
				"pes_village_05_hut_a_02",
				"pes_village_05_hut_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_05_hut_a_01",
				"pes_village_05_hut_a_02",
				"pes_village_05_hut_a_03",
			},
			sound_events_duration = {
				4.5943956375122,
				3.5076458454132,
				2.9188332557678,
			},
		},
		pes_village_06_lighthouse_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_06_lighthouse_a_01",
				[2] = "pes_village_06_lighthouse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_06_lighthouse_a_01",
				[2] = "pes_village_06_lighthouse_a_02",
			},
			sound_events_duration = {
				[1] = 1.5124167203903,
				[2] = 1.3095624446869,
			},
		},
		pes_village_06_lighthouse_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_06_lighthouse_b_01",
				[2] = "pes_village_06_lighthouse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_06_lighthouse_b_01",
				[2] = "pes_village_06_lighthouse_b_02",
			},
			sound_events_duration = {
				[1] = 1.8861666917801,
				[2] = 1.377770781517,
			},
		},
		pes_village_07_skaven_shipwreck_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_07_skaven_shipwreck_a_01",
				"pes_village_07_skaven_shipwreck_a_02",
				"pes_village_07_skaven_shipwreck_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_07_skaven_shipwreck_a_01",
				"pes_village_07_skaven_shipwreck_a_02",
				"pes_village_07_skaven_shipwreck_a_03",
			},
			sound_events_duration = {
				2.4267082214356,
				1.9808958768845,
				2.8536250591278,
			},
		},
		pes_village_09_chaos_ships_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_09_chaos_ships_a_01",
				"pes_village_09_chaos_ships_a_02",
				"pes_village_09_chaos_ships_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_09_chaos_ships_a_01",
				"pes_village_09_chaos_ships_a_02",
				"pes_village_09_chaos_ships_a_03",
			},
			sound_events_duration = {
				4.646999835968,
				5.7006874084473,
				4.5612707138061,
			},
		},
		pes_village_10_bridge_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_10_bridge_a_01",
				"pes_village_10_bridge_a_02",
				"pes_village_10_bridge_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_10_bridge_a_01",
				"pes_village_10_bridge_a_02",
				"pes_village_10_bridge_a_03",
			},
			sound_events_duration = {
				2.2737083435059,
				2.6810417175293,
				1.3708958625793,
			},
		},
		pes_village_11_harbour_shipwrecks_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_11_harbour_shipwrecks_a_01",
				"pes_village_11_harbour_shipwrecks_a_02",
				"pes_village_11_harbour_shipwrecks_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_11_harbour_shipwrecks_a_01",
				"pes_village_11_harbour_shipwrecks_a_02",
				"pes_village_11_harbour_shipwrecks_a_03",
			},
			sound_events_duration = {
				3.3172707557678,
				5.5727081298828,
				5.4031457901001,
			},
		},
		pes_village_12_harbour_whale_carcass_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_12_harbour_whale_carcass_a_01",
				[2] = "pes_village_12_harbour_whale_carcass_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_12_harbour_whale_carcass_a_01",
				[2] = "pes_village_12_harbour_whale_carcass_a_02",
			},
			sound_events_duration = {
				[1] = 2.3975625038147,
				[2] = 2.6598124504089,
			},
		},
		pes_village_12_harbour_whale_carcass_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_12_harbour_whale_carcass_b_01",
				[2] = "pes_village_12_harbour_whale_carcass_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_12_harbour_whale_carcass_b_01",
				[2] = "pes_village_12_harbour_whale_carcass_b_02",
			},
			sound_events_duration = {
				[1] = 1.2617708444595,
				[2] = 3.823041677475,
			},
		},
		pes_village_14_guidance_lighthouse_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_14_guidance_lighthouse_a_01",
				[2] = "pes_village_14_guidance_lighthouse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_14_guidance_lighthouse_a_01",
				[2] = "pes_village_14_guidance_lighthouse_a_02",
			},
			sound_events_duration = {
				[1] = 3.1786041259766,
				[2] = 2.500833272934,
			},
		},
		pes_village_14_guidance_lighthouse_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_14_guidance_lighthouse_b_01",
				[2] = "pes_village_14_guidance_lighthouse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_14_guidance_lighthouse_b_01",
				[2] = "pes_village_14_guidance_lighthouse_b_02",
			},
			sound_events_duration = {
				[1] = 2.0744166374206,
				[2] = 4.6952085494995,
			},
		},
		pes_village_15_tainted_light_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_15_tainted_light_a_01",
				"pes_village_15_tainted_light_a_02",
				"pes_village_15_tainted_light_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_15_tainted_light_a_01",
				"pes_village_15_tainted_light_a_02",
				"pes_village_15_tainted_light_a_03",
			},
			sound_events_duration = {
				4.2231459617615,
				3.0259375572205,
				6.0400624275208,
			},
		},
		pes_village_16_intact_ship_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_16_intact_ship_a_01",
				[2] = "pes_village_16_intact_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_16_intact_ship_a_01",
				[2] = "pes_village_16_intact_ship_a_02",
			},
			sound_events_duration = {
				[1] = 3.2205834388733,
				[2] = 6.2585625648499,
			},
		},
		pes_village_16_intact_ship_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_16_intact_ship_b_01",
				[2] = "pes_village_16_intact_ship_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_16_intact_ship_b_01",
				[2] = "pes_village_16_intact_ship_b_02",
			},
			sound_events_duration = {
				[1] = 2.5121874809265,
				[2] = 3.188812494278,
			},
		},
		pes_village_18_elevator_sighted_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_18_elevator_sighted_a_01",
				[2] = "pes_village_18_elevator_sighted_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_18_elevator_sighted_a_01",
				[2] = "pes_village_18_elevator_sighted_a_02",
			},
			sound_events_duration = {
				[1] = 2.4798123836517,
				[2] = 2.6054375171661,
			},
		},
		pes_village_19_elevator_gears_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_19_elevator_gears_a_01",
				[2] = "pes_village_19_elevator_gears_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_19_elevator_gears_a_01",
				[2] = "pes_village_19_elevator_gears_a_02",
			},
			sound_events_duration = {
				[1] = 2.8521666526794,
				[2] = 2.0493957996368,
			},
		},
		pes_village_20_elevator_oil_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_20_elevator_oil_a_01",
				[2] = "pes_village_20_elevator_oil_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_20_elevator_oil_a_01",
				[2] = "pes_village_20_elevator_oil_a_02",
			},
			sound_events_duration = {
				[1] = 1.7939583063126,
				[2] = 1.4580208063126,
			},
		},
		pes_village_20a_elevator_arrived_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_20a_elevator_arrived_a_01",
				[2] = "pes_village_20a_elevator_arrived_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_20a_elevator_arrived_a_01",
				[2] = "pes_village_20a_elevator_arrived_a_02",
			},
			sound_events_duration = {
				[1] = 1.3547916412354,
				[2] = 1.1588125228882,
			},
		},
		pes_village_23_nurgle_gateway_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_23_nurgle_gateway_a_01",
				"pes_village_23_nurgle_gateway_a_02",
				"pes_village_23_nurgle_gateway_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_23_nurgle_gateway_a_01",
				"pes_village_23_nurgle_gateway_a_02",
				"pes_village_23_nurgle_gateway_a_03",
			},
			sound_events_duration = {
				3.2193124294281,
				4.8930830955505,
				2.5697500705719,
			},
		},
		pes_village_24_oil_tutorial_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_24_oil_tutorial_a_01",
				[2] = "pes_village_24_oil_tutorial_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_24_oil_tutorial_a_01",
				[2] = "pes_village_24_oil_tutorial_a_02",
			},
			sound_events_duration = {
				[1] = 2.3956665992737,
				[2] = 2.3748540878296,
			},
		},
		pes_village_25_oil_tutorial_complete_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_25_oil_tutorial_complete_a_01",
				[2] = "pes_village_25_oil_tutorial_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_25_oil_tutorial_complete_a_01",
				[2] = "pes_village_25_oil_tutorial_complete_a_02",
			},
			sound_events_duration = {
				[1] = 2.4944999217987,
				[2] = 2.5270833969116,
			},
		},
		pes_village_26_twisted_tree_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_26_twisted_tree_a_01",
				[2] = "pes_village_26_twisted_tree_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_26_twisted_tree_a_01",
				[2] = "pes_village_26_twisted_tree_a_02",
			},
			sound_events_duration = {
				[1] = 2.577166557312,
				[2] = 2.9598958492279,
			},
		},
		pes_village_26_twisted_tree_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_26_twisted_tree_b_01",
				[2] = "pes_village_26_twisted_tree_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_26_twisted_tree_b_01",
				[2] = "pes_village_26_twisted_tree_b_02",
			},
			sound_events_duration = {
				[1] = 3.0111041069031,
				[2] = 3.8880000114441,
			},
		},
		pes_village_28_lighthouse_hero_moment_a = {
			category = "cut_scene_interrupt_three",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_28_lighthouse_hero_moment_a_01",
				"pes_village_28_lighthouse_hero_moment_a_02",
				"pes_village_28_lighthouse_hero_moment_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_28_lighthouse_hero_moment_a_01",
				"pes_village_28_lighthouse_hero_moment_a_02",
				"pes_village_28_lighthouse_hero_moment_a_03",
			},
			sound_events_duration = {
				2.7906665802002,
				2.9467916488648,
				2.6187708377838,
			},
		},
		pes_village_29_corruption_source_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_29_corruption_source_a_01",
				[2] = "pes_village_29_corruption_source_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_29_corruption_source_a_01",
				[2] = "pes_village_29_corruption_source_a_02",
			},
			sound_events_duration = {
				[1] = 3.3354165554047,
				[2] = 4.4517707824707,
			},
		},
		pes_village_29_corruption_source_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_29_corruption_source_b_01",
				[2] = "pes_village_29_corruption_source_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_29_corruption_source_b_01",
				[2] = "pes_village_29_corruption_source_b_02",
			},
			sound_events_duration = {
				[1] = 3.0268125534058,
				[2] = 2.4979999065399,
			},
		},
		pes_village_29_corruption_source_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_29_corruption_source_c_01",
				[2] = "pes_village_29_corruption_source_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_29_corruption_source_c_01",
				[2] = "pes_village_29_corruption_source_c_02",
			},
			sound_events_duration = {
				[1] = 1.5467708110809,
				[2] = 1.2019582986832,
			},
		},
		pes_village_30_burning_town_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_30_burning_town_a_01",
				[2] = "pes_village_30_burning_town_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_30_burning_town_a_01",
				[2] = "pes_village_30_burning_town_a_02",
			},
			sound_events_duration = {
				[1] = 2.914999961853,
				[2] = 2.2244374752045,
			},
		},
		pes_village_30_burning_town_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_30_burning_town_b_01",
				[2] = "pes_village_30_burning_town_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_30_burning_town_b_01",
				[2] = "pes_village_30_burning_town_b_02",
			},
			sound_events_duration = {
				[1] = 2.764312505722,
				[2] = 3.6193542480469,
			},
		},
		pes_village_31_fill_cart_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_31_fill_cart_a_01",
				[2] = "pes_village_31_fill_cart_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_31_fill_cart_a_01",
				[2] = "pes_village_31_fill_cart_a_02",
			},
			sound_events_duration = {
				[1] = 4.9994168281555,
				[2] = 5.2557501792908,
			},
		},
		pes_village_32_that_did_it_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_32_that_did_it_a_01",
				"pes_village_32_that_did_it_a_02",
				"pes_village_32_that_did_it_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_32_that_did_it_a_01",
				"pes_village_32_that_did_it_a_02",
				"pes_village_32_that_did_it_a_03",
			},
			sound_events_duration = {
				0.8672291636467,
				2.8839375972748,
				2.0805208683014,
			},
		},
		pes_village_32a_wagon_full_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_32a_wagon_full_a_01",
				[2] = "pes_village_32a_wagon_full_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_32a_wagon_full_a_01",
				[2] = "pes_village_32a_wagon_full_a_02",
			},
			sound_events_duration = {
				[1] = 2.8801250457764,
				[2] = 2.727874994278,
			},
		},
		pes_village_33_fuse_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_33_fuse_a_01",
				[2] = "pes_village_33_fuse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_33_fuse_a_01",
				[2] = "pes_village_33_fuse_a_02",
			},
			sound_events_duration = {
				[1] = 3.9070415496826,
				[2] = 2.977520942688,
			},
		},
		pes_village_34_lighthouse_collapse_a = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_34_lighthouse_collapse_a_01",
				[2] = "pes_village_34_lighthouse_collapse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_34_lighthouse_collapse_a_01",
				[2] = "pes_village_34_lighthouse_collapse_a_02",
			},
			sound_events_duration = {
				[1] = 4.3742918968201,
				[2] = 5.2587084770203,
			},
		},
		pes_village_34_lighthouse_collapse_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_34_lighthouse_collapse_b_01",
				[2] = "pes_village_34_lighthouse_collapse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_34_lighthouse_collapse_b_01",
				[2] = "pes_village_34_lighthouse_collapse_b_02",
			},
			sound_events_duration = {
				[1] = 4.1710834503174,
				[2] = 4.3895206451416,
			},
		},
		pes_village_34_lighthouse_collapse_c = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_34_lighthouse_collapse_c_01",
				[2] = "pes_village_34_lighthouse_collapse_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_34_lighthouse_collapse_c_01",
				[2] = "pes_village_34_lighthouse_collapse_c_02",
			},
			sound_events_duration = {
				[1] = 3.1212916374206,
				[2] = 3.3897500038147,
			},
		},
		pes_village_35_missing_comrade_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_35_missing_comrade_a_01",
				[2] = "pes_village_35_missing_comrade_a_02",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pes_village_35_missing_comrade_a_01 = {
					{
						"global_context",
						"dwarf_ranger",
						OP.EQ,
						true,
					},
				},
				pes_village_35_missing_comrade_a_02 = {
					{
						"global_context",
						"witch_hunter",
						OP.EQ,
						true,
					},
				},
			},
			sound_events = {
				[1] = "pes_village_35_missing_comrade_a_01",
				[2] = "pes_village_35_missing_comrade_a_02",
			},
			sound_events_duration = {
				[1] = 4.2657289505005,
				[2] = 2.8804166316986,
			},
		},
		pes_village_35_missing_comrade_b = {
			category = "level_talk_must_play",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_35_missing_comrade_b_01",
				[2] = "pes_village_35_missing_comrade_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pes_village_35_missing_comrade_b_01",
				[2] = "pes_village_35_missing_comrade_b_02",
			},
			sound_events_duration = {
				[1] = 3.8470208644867,
				[2] = 4.6937708854675,
			},
		},
		pes_village_35_missing_comrade_c = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_35_missing_comrade_c_01",
				[2] = "pes_village_35_missing_comrade_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_35_missing_comrade_c_01",
				[2] = "pes_village_35_missing_comrade_c_02",
			},
			sound_events_duration = {
				[1] = 0.90668749809265,
				[2] = 2.5334582328796,
			},
		},
		pes_village_bonus_buboes_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
		pes_village_bonus_buboes_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_bonus_buboes_a_01",
			},
			sound_events = {
				[1] = "pes_village_bonus_buboes_a_01",
			},
			sound_events_duration = {
				[1] = 2.6939792633057,
			},
		},
		pes_village_bonus_explosive_cart_tutorial_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_generic_path_blocked_02",
				"pes_generic_path_blocked_03",
				"pes_generic_path_blocked_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_path_blocked_02",
				"pes_generic_path_blocked_03",
				"pes_generic_path_blocked_04",
			},
			sound_events_duration = {
				1.1100000143051,
				1.8349791765213,
				1.0189791917801,
			},
		},
		pes_village_bonus_explosive_cart_tutorial_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_objective_wizards_tower_open_door_01",
			},
			sound_events = {
				[1] = "pes_objective_wizards_tower_open_door_01",
			},
			sound_events_duration = {
				[1] = 1.5269583463669,
			},
		},
		pes_village_bonus_fish_barrel_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
		pes_village_bonus_fish_barrel_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_bonus_fish_barrel_a_01",
			},
			sound_events = {
				[1] = "pes_village_bonus_fish_barrel_a_01",
			},
			sound_events_duration = {
				[1] = 2.783020734787,
			},
		},
		pes_village_bonus_harbour_evil_glow_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_bonus_harbour_evil_glow_a_01",
				"pes_village_bonus_harbour_evil_glow_a_02",
				"pes_village_bonus_harbour_evil_glow_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_bonus_harbour_evil_glow_a_01",
				"pes_village_bonus_harbour_evil_glow_a_02",
				"pes_village_bonus_harbour_evil_glow_a_03",
			},
			sound_events_duration = {
				1.9315625429153,
				1.984854221344,
				4.6097497940064,
			},
		},
		pes_village_bonus_harbour_sewers_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_bonus_harbour_sewers_a_01",
				"pes_village_bonus_harbour_sewers_a_02",
				"pes_village_bonus_harbour_sewers_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_bonus_harbour_sewers_a_01",
				"pes_village_bonus_harbour_sewers_a_02",
				"pes_village_bonus_harbour_sewers_a_03",
			},
			sound_events_duration = {
				4.1999373435974,
				2.5524792671204,
				2.5359792709351,
			},
		},
		pes_village_bonus_oil_dispenser_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_bonus_oil_dispenser_a_01",
				[2] = "pes_village_bonus_oil_dispenser_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_bonus_oil_dispenser_a_01",
				[2] = "pes_village_bonus_oil_dispenser_a_02",
			},
			sound_events_duration = {
				[1] = 3.7563750743866,
				[2] = 2.6949374675751,
			},
		},
		pes_village_bonus_shallyan_idols_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_bonus_shallyan_idols_a_01",
				"pes_village_bonus_shallyan_idols_a_02",
				"pes_village_bonus_shallyan_idols_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_bonus_shallyan_idols_a_01",
				"pes_village_bonus_shallyan_idols_a_02",
				"pes_village_bonus_shallyan_idols_a_03",
			},
			sound_events_duration = {
				4.4316668510437,
				2.5534999370575,
				3.4997916221619,
			},
		},
		pes_village_bonus_tavern_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				"pes_village_bonus_tavern_a_01",
				"pes_village_bonus_tavern_a_02",
				"pes_village_bonus_tavern_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_village_bonus_tavern_a_01",
				"pes_village_bonus_tavern_a_02",
				"pes_village_bonus_tavern_a_03",
			},
			sound_events_duration = {
				2.9620416164398,
				2.2324583530426,
				3.4382915496826,
			},
		},
		pes_village_bonus_whale_guts_a = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_bonus_whale_guts_a_01",
			},
			sound_events = {
				[1] = "pes_village_bonus_whale_guts_a_01",
			},
			sound_events_duration = {
				[1] = 2.1482291221619,
			},
		},
		pes_village_bonus_whale_guts_b = {
			category = "level_talk",
			database = "empire_soldier_dlc_whaling_village",
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
				[1] = "pes_village_bonus_whale_guts_b_01",
			},
			sound_events = {
				[1] = "pes_village_bonus_whale_guts_b_01",
			},
			sound_events_duration = {
				[1] = 1.6552916765213,
			},
		},
	})
end
