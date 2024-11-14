-- chunkname: @dialogues/generated/wood_elf_dlc_whaling_village.lua

return function ()
	define_rule({
		name = "pwe_village_01_opening_cinematic_a",
		probability = 1,
		response = "pwe_village_01_opening_cinematic_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_01_opening_cinematic_c",
		probability = 1,
		response = "pwe_village_01_opening_cinematic_c",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_01_opening_cinematic_d",
		probability = 1,
		response = "pwe_village_01_opening_cinematic_d",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_02_beach_a",
		probability = 1,
		response = "pwe_village_02_beach_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_02_beach_b",
		probability = 1,
		response = "pwe_village_02_beach_b",
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
				"pwe_village_02_beach_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_03_gather_a",
		probability = 1,
		response = "pwe_village_03_gather_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_03_gather_b",
		probability = 1,
		response = "pwe_village_03_gather_b",
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
				"wood_elf",
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
		name = "pwe_village_03_gather_c",
		probability = 1,
		response = "pwe_village_03_gather_c",
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
				"wood_elf",
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
		name = "pwe_village_03_gather_d",
		probability = 1,
		response = "pwe_village_03_gather_d",
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
				"wood_elf",
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
		name = "pwe_village_04_skaven_a",
		probability = 1,
		response = "pwe_village_04_skaven_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_05_hut_a",
		probability = 1,
		response = "pwe_village_05_hut_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_06_lighthouse_a",
		probability = 1,
		response = "pwe_village_06_lighthouse_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_06_lighthouse_b",
		probability = 1,
		response = "pwe_village_06_lighthouse_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_07_skaven_shipwreck_a",
		probability = 1,
		response = "pwe_village_07_skaven_shipwreck_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_09_chaos_ships_a",
		probability = 1,
		response = "pwe_village_09_chaos_ships_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_10_bridge_a",
		probability = 1,
		response = "pwe_village_10_bridge_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_11_harbour_shipwrecks_a",
		probability = 1,
		response = "pwe_village_11_harbour_shipwrecks_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_12_harbour_whale_carcass_a",
		probability = 1,
		response = "pwe_village_12_harbour_whale_carcass_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_12_harbour_whale_carcass_b",
		probability = 1,
		response = "pwe_village_12_harbour_whale_carcass_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_14_guidance_lighthouse_a",
		probability = 1,
		response = "pwe_village_14_guidance_lighthouse_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_14_guidance_lighthouse_b",
		probability = 1,
		response = "pwe_village_14_guidance_lighthouse_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_15_tainted_light_a",
		probability = 1,
		response = "pwe_village_15_tainted_light_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_16_intact_ship_a",
		probability = 1,
		response = "pwe_village_16_intact_ship_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_16_intact_ship_b",
		probability = 1,
		response = "pwe_village_16_intact_ship_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_18_elevator_sighted_a",
		probability = 1,
		response = "pwe_village_18_elevator_sighted_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_19_elevator_gears_a",
		probability = 1,
		response = "pwe_village_19_elevator_gears_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_20_elevator_oil_a",
		probability = 1,
		response = "pwe_village_20_elevator_oil_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_20a_elevator_arrived_a",
		probability = 1,
		response = "pwe_village_20a_elevator_arrived_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_23_nurgle_gateway_a",
		probability = 1,
		response = "pwe_village_23_nurgle_gateway_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_24_oil_tutorial_a",
		probability = 1,
		response = "pwe_village_24_oil_tutorial_a",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_25_oil_tutorial_complete_a",
		probability = 1,
		response = "pwe_village_25_oil_tutorial_complete_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_26_twisted_tree_a",
		probability = 1,
		response = "pwe_village_26_twisted_tree_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_26_twisted_tree_b",
		probability = 1,
		response = "pwe_village_26_twisted_tree_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_28_lighthouse_hero_moment_a",
		probability = 1,
		response = "pwe_village_28_lighthouse_hero_moment_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_29_corruption_source_a",
		probability = 1,
		response = "pwe_village_29_corruption_source_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_29_corruption_source_b",
		probability = 1,
		response = "pwe_village_29_corruption_source_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_29_corruption_source_c",
		probability = 1,
		response = "pwe_village_29_corruption_source_c",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_30_burning_town_a",
		probability = 1,
		response = "pwe_village_30_burning_town_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_30_burning_town_b",
		probability = 1,
		response = "pwe_village_30_burning_town_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_31_fill_cart_a",
		probability = 1,
		response = "pwe_village_31_fill_cart_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_32_that_did_it_a",
		probability = 1,
		response = "pwe_village_32_that_did_it_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_32a_wagon_full_a",
		probability = 1,
		response = "pwe_village_32a_wagon_full_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_33_fuse_a",
		probability = 1,
		response = "pwe_village_33_fuse_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_34_lighthouse_collapse_a",
		probability = 1,
		response = "pwe_village_34_lighthouse_collapse_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_34_lighthouse_collapse_b",
		probability = 1,
		response = "pwe_village_34_lighthouse_collapse_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_34_lighthouse_collapse_c",
		probability = 1,
		response = "pwe_village_34_lighthouse_collapse_c",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_35_missing_comrade_a",
		probability = 1,
		response = "pwe_village_35_missing_comrade_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				12,
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
		name = "pwe_village_35_missing_comrade_b",
		probability = 1,
		response = "pwe_village_35_missing_comrade_b",
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
				"wood_elf_npc",
			},
		},
	})
	define_rule({
		name = "pwe_village_35_missing_comrade_c",
		probability = 1,
		response = "pwe_village_35_missing_comrade_c",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_bonus_buboes_a",
		probability = 1,
		response = "pwe_village_bonus_buboes_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_bonus_buboes_b",
		probability = 1,
		response = "pwe_village_bonus_buboes_b",
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
				"wood_elf",
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
		name = "pwe_village_bonus_explosive_cart_tutorial_a",
		probability = 1,
		response = "pwe_village_bonus_explosive_cart_tutorial_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_bonus_explosive_cart_tutorial_b",
		probability = 1,
		response = "pwe_village_bonus_explosive_cart_tutorial_b",
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
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwe_village_bonus_fish_barrel_a",
		probability = 1,
		response = "pwe_village_bonus_fish_barrel_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_bonus_fish_barrel_b",
		probability = 1,
		response = "pwe_village_bonus_fish_barrel_b",
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
				"wood_elf",
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
		name = "pwe_village_bonus_harbour_evil_glow_a",
		probability = 1,
		response = "pwe_village_bonus_harbour_evil_glow_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_bonus_harbour_sewers_a",
		probability = 1,
		response = "pwe_village_bonus_harbour_sewers_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_bonus_oil_dispenser_a",
		probability = 1,
		response = "pwe_village_bonus_oil_dispenser_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_bonus_shallyan_idols_b",
		probability = 1,
		response = "pwe_village_bonus_shallyan_idols_b",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_bonus_tavern_a",
		probability = 1,
		response = "pwe_village_bonus_tavern_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_bonus_whale_guts_a",
		probability = 1,
		response = "pwe_village_bonus_whale_guts_a",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_village_bonus_whale_guts_b",
		probability = 1,
		response = "pwe_village_bonus_whale_guts_b",
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
				"wood_elf",
			},
		},
	})
	add_dialogues({
		pwe_village_01_opening_cinematic_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_01_opening_cinematic_a_01",
				[2] = "pwe_village_01_opening_cinematic_a_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pwe_village_01_opening_cinematic_a_01",
				[2] = "pwe_village_01_opening_cinematic_a_02",
			},
			sound_events_duration = {
				[1] = 1.6705416440964,
				[2] = 2.4310207366943,
			},
		},
		pwe_village_01_opening_cinematic_c = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_01_opening_cinematic_c_01",
				[2] = "pwe_village_01_opening_cinematic_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_01_opening_cinematic_c_01",
				[2] = "pwe_village_01_opening_cinematic_c_02",
			},
			sound_events_duration = {
				[1] = 3.3496251106262,
				[2] = 3.9721667766571,
			},
		},
		pwe_village_01_opening_cinematic_d = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_01_opening_cinematic_d_01",
			},
			sound_events = {
				[1] = "pwe_village_01_opening_cinematic_d_01",
			},
			sound_events_duration = {
				[1] = 2.1866567134857,
			},
		},
		pwe_village_02_beach_a = {
			category = "casual_singing_03",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_02_beach_a_01",
				"pwe_village_02_beach_a_02",
				"pwe_village_02_beach_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_02_beach_a_01",
				"pwe_village_02_beach_a_02",
				"pwe_village_02_beach_a_03",
			},
			sound_events_duration = {
				5.165479183197,
				3.5026457309723,
				5.3121666908264,
			},
		},
		pwe_village_02_beach_b = {
			category = "casual_singing_03",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_02_beach_b_01",
				"pwe_village_02_beach_b_02",
				"pwe_village_02_beach_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_02_beach_b_01",
				"pwe_village_02_beach_b_02",
				"pwe_village_02_beach_b_03",
			},
			sound_events_duration = {
				2.8157498836517,
				3.6610207557678,
				3.0603542327881,
			},
		},
		pwe_village_03_gather_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_03_gather_a_01",
				[2] = "pwe_village_03_gather_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_03_gather_a_01",
				[2] = "pwe_village_03_gather_a_02",
			},
			sound_events_duration = {
				[1] = 2.3600625991821,
				[2] = 2.7906665802002,
			},
		},
		pwe_village_03_gather_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_03_gather_b_01",
				[2] = "pwe_village_03_gather_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_03_gather_b_01",
				[2] = "pwe_village_03_gather_b_02",
			},
			sound_events_duration = {
				[1] = 2.9795417785645,
				[2] = 3.3750207424164,
			},
		},
		pwe_village_03_gather_c = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_03_gather_c_01",
				[2] = "pwe_village_03_gather_c_02",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pwe_village_03_gather_c_01 = {
					{
						"global_context",
						"witch_hunter",
						OP.EQ,
						true,
					},
				},
				pwe_village_03_gather_c_02 = {
					{
						"global_context",
						"bright_wizard",
						OP.EQ,
						true,
					},
				},
			},
			sound_events = {
				[1] = "pwe_village_03_gather_c_01",
				[2] = "pwe_village_03_gather_c_02",
			},
			sound_events_duration = {
				[1] = 2.5779166221619,
				[2] = 2.5921666622162,
			},
		},
		pwe_village_03_gather_d = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_03_gather_d_01",
				[2] = "pwe_village_03_gather_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_03_gather_d_01",
				[2] = "pwe_village_03_gather_d_02",
			},
			sound_events_duration = {
				[1] = 2.6735417842865,
				[2] = 3.7301042079926,
			},
		},
		pwe_village_04_skaven_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_04_skaven_a_01",
				"pwe_village_04_skaven_a_02",
				"pwe_village_04_skaven_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_04_skaven_a_01",
				"pwe_village_04_skaven_a_02",
				"pwe_village_04_skaven_a_03",
			},
			sound_events_duration = {
				2.4560208320618,
				4.2589373588562,
				3.93714594841,
			},
		},
		pwe_village_05_hut_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_05_hut_a_01",
				"pwe_village_05_hut_a_02",
				"pwe_village_05_hut_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_05_hut_a_01",
				"pwe_village_05_hut_a_02",
				"pwe_village_05_hut_a_03",
			},
			sound_events_duration = {
				4.5560626983643,
				3.2818334102631,
				4.3787083625794,
			},
		},
		pwe_village_06_lighthouse_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_06_lighthouse_a_01",
				[2] = "pwe_village_06_lighthouse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_06_lighthouse_a_01",
				[2] = "pwe_village_06_lighthouse_a_02",
			},
			sound_events_duration = {
				[1] = 1.6717292070389,
				[2] = 1.2943749427795,
			},
		},
		pwe_village_06_lighthouse_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_06_lighthouse_b_01",
				[2] = "pwe_village_06_lighthouse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_06_lighthouse_b_01",
				[2] = "pwe_village_06_lighthouse_b_02",
			},
			sound_events_duration = {
				[1] = 3.400333404541,
				[2] = 3.1977083683014,
			},
		},
		pwe_village_07_skaven_shipwreck_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_07_skaven_shipwreck_a_01",
				"pwe_village_07_skaven_shipwreck_a_02",
				"pwe_village_07_skaven_shipwreck_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_07_skaven_shipwreck_a_01",
				"pwe_village_07_skaven_shipwreck_a_02",
				"pwe_village_07_skaven_shipwreck_a_03",
			},
			sound_events_duration = {
				3.3058540821075,
				3.1723959445953,
				4.413104057312,
			},
		},
		pwe_village_09_chaos_ships_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_09_chaos_ships_a_01",
				"pwe_village_09_chaos_ships_a_02",
				"pwe_village_09_chaos_ships_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_09_chaos_ships_a_01",
				"pwe_village_09_chaos_ships_a_02",
				"pwe_village_09_chaos_ships_a_03",
			},
			sound_events_duration = {
				5.3422708511353,
				4.0646877288818,
				4.2624793052673,
			},
		},
		pwe_village_10_bridge_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_10_bridge_a_01",
				"pwe_village_10_bridge_a_02",
				"pwe_village_10_bridge_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_10_bridge_a_01",
				"pwe_village_10_bridge_a_02",
				"pwe_village_10_bridge_a_03",
			},
			sound_events_duration = {
				2.1293542385101,
				3.0230000019074,
				1.2510207891464,
			},
		},
		pwe_village_11_harbour_shipwrecks_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_11_harbour_shipwrecks_a_01",
				"pwe_village_11_harbour_shipwrecks_a_02",
				"pwe_village_11_harbour_shipwrecks_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_11_harbour_shipwrecks_a_01",
				"pwe_village_11_harbour_shipwrecks_a_02",
				"pwe_village_11_harbour_shipwrecks_a_03",
			},
			sound_events_duration = {
				4.2365832328796,
				3.9506666660309,
				5.5402293205261,
			},
		},
		pwe_village_12_harbour_whale_carcass_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_12_harbour_whale_carcass_a_01",
				[2] = "pwe_village_12_harbour_whale_carcass_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_12_harbour_whale_carcass_a_01",
				[2] = "pwe_village_12_harbour_whale_carcass_a_02",
			},
			sound_events_duration = {
				[1] = 2.8504791259766,
				[2] = 5.2861042022705,
			},
		},
		pwe_village_12_harbour_whale_carcass_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_12_harbour_whale_carcass_b_01",
				[2] = "pwe_village_12_harbour_whale_carcass_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_12_harbour_whale_carcass_b_01",
				[2] = "pwe_village_12_harbour_whale_carcass_b_02",
			},
			sound_events_duration = {
				[1] = 3.6426875591278,
				[2] = 2.6472916603088,
			},
		},
		pwe_village_14_guidance_lighthouse_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_14_guidance_lighthouse_a_01",
				[2] = "pwe_village_14_guidance_lighthouse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_14_guidance_lighthouse_a_01",
				[2] = "pwe_village_14_guidance_lighthouse_a_02",
			},
			sound_events_duration = {
				[1] = 4.6165418624878,
				[2] = 4.2848539352417,
			},
		},
		pwe_village_14_guidance_lighthouse_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_14_guidance_lighthouse_b_01",
				[2] = "pwe_village_14_guidance_lighthouse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_14_guidance_lighthouse_b_01",
				[2] = "pwe_village_14_guidance_lighthouse_b_02",
			},
			sound_events_duration = {
				[1] = 3.7056875228882,
				[2] = 4.1872081756592,
			},
		},
		pwe_village_15_tainted_light_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_15_tainted_light_a_01",
				"pwe_village_15_tainted_light_a_02",
				"pwe_village_15_tainted_light_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_15_tainted_light_a_01",
				"pwe_village_15_tainted_light_a_02",
				"pwe_village_15_tainted_light_a_03",
			},
			sound_events_duration = {
				4.4718332290649,
				3.111166715622,
				4.3054585456848,
			},
		},
		pwe_village_16_intact_ship_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_16_intact_ship_a_01",
				[2] = "pwe_village_16_intact_ship_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_16_intact_ship_a_01",
				[2] = "pwe_village_16_intact_ship_a_02",
			},
			sound_events_duration = {
				[1] = 1.8026875257492,
				[2] = 2.880916595459,
			},
		},
		pwe_village_16_intact_ship_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_16_intact_ship_b_01",
				[2] = "pwe_village_16_intact_ship_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_16_intact_ship_b_01",
				[2] = "pwe_village_16_intact_ship_b_02",
			},
			sound_events_duration = {
				[1] = 1.8930000066757,
				[2] = 3.0018541812897,
			},
		},
		pwe_village_18_elevator_sighted_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_18_elevator_sighted_a_01",
				[2] = "pwe_village_18_elevator_sighted_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_18_elevator_sighted_a_01",
				[2] = "pwe_village_18_elevator_sighted_a_02",
			},
			sound_events_duration = {
				[1] = 3.0571250915527,
				[2] = 2.6906249523163,
			},
		},
		pwe_village_19_elevator_gears_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_19_elevator_gears_a_01",
				[2] = "pwe_village_19_elevator_gears_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_19_elevator_gears_a_01",
				[2] = "pwe_village_19_elevator_gears_a_02",
			},
			sound_events_duration = {
				[1] = 2.8936042785645,
				[2] = 2.4046666622162,
			},
		},
		pwe_village_20_elevator_oil_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_20_elevator_oil_a_01",
				[2] = "pwe_village_20_elevator_oil_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_20_elevator_oil_a_01",
				[2] = "pwe_village_20_elevator_oil_a_02",
			},
			sound_events_duration = {
				[1] = 2.3320624828339,
				[2] = 2.4008333683014,
			},
		},
		pwe_village_20a_elevator_arrived_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_20a_elevator_arrived_a_01",
				[2] = "pwe_village_20a_elevator_arrived_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_20a_elevator_arrived_a_01",
				[2] = "pwe_village_20a_elevator_arrived_a_02",
			},
			sound_events_duration = {
				[1] = 2.3394999504089,
				[2] = 1.7702292203903,
			},
		},
		pwe_village_23_nurgle_gateway_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_23_nurgle_gateway_a_01",
				"pwe_village_23_nurgle_gateway_a_02",
				"pwe_village_23_nurgle_gateway_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_23_nurgle_gateway_a_01",
				"pwe_village_23_nurgle_gateway_a_02",
				"pwe_village_23_nurgle_gateway_a_03",
			},
			sound_events_duration = {
				1.7452708482742,
				3.6960000991821,
				3.5150833129883,
			},
		},
		pwe_village_24_oil_tutorial_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_24_oil_tutorial_a_01",
				[2] = "pwe_village_24_oil_tutorial_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_24_oil_tutorial_a_01",
				[2] = "pwe_village_24_oil_tutorial_a_02",
			},
			sound_events_duration = {
				[1] = 2.491708278656,
				[2] = 2.6527707576752,
			},
		},
		pwe_village_25_oil_tutorial_complete_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_25_oil_tutorial_complete_a_01",
				[2] = "pwe_village_25_oil_tutorial_complete_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_25_oil_tutorial_complete_a_01",
				[2] = "pwe_village_25_oil_tutorial_complete_a_02",
			},
			sound_events_duration = {
				[1] = 1.7927708625793,
				[2] = 2.4413957595825,
			},
		},
		pwe_village_26_twisted_tree_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_26_twisted_tree_a_01",
				[2] = "pwe_village_26_twisted_tree_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_26_twisted_tree_a_01",
				[2] = "pwe_village_26_twisted_tree_a_02",
			},
			sound_events_duration = {
				[1] = 2.203583240509,
				[2] = 2.8807082176209,
			},
		},
		pwe_village_26_twisted_tree_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_26_twisted_tree_b_01",
				[2] = "pwe_village_26_twisted_tree_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_26_twisted_tree_b_01",
				[2] = "pwe_village_26_twisted_tree_b_02",
			},
			sound_events_duration = {
				[1] = 3.2525207996368,
				[2] = 5.8004374504089,
			},
		},
		pwe_village_28_lighthouse_hero_moment_a = {
			category = "cut_scene_interrupt_three",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_28_lighthouse_hero_moment_a_01",
				"pwe_village_28_lighthouse_hero_moment_a_02",
				"pwe_village_28_lighthouse_hero_moment_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_28_lighthouse_hero_moment_a_01",
				"pwe_village_28_lighthouse_hero_moment_a_02",
				"pwe_village_28_lighthouse_hero_moment_a_03",
			},
			sound_events_duration = {
				3.0816667079926,
				3.5844376087189,
				4.094208240509,
			},
		},
		pwe_village_29_corruption_source_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_29_corruption_source_a_01",
				[2] = "pwe_village_29_corruption_source_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_29_corruption_source_a_01",
				[2] = "pwe_village_29_corruption_source_a_02",
			},
			sound_events_duration = {
				[1] = 4.1403751373291,
				[2] = 3.1973750591278,
			},
		},
		pwe_village_29_corruption_source_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_29_corruption_source_b_01",
				[2] = "pwe_village_29_corruption_source_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_29_corruption_source_b_01",
				[2] = "pwe_village_29_corruption_source_b_02",
			},
			sound_events_duration = {
				[1] = 2.8279376029968,
				[2] = 2.8726665973663,
			},
		},
		pwe_village_29_corruption_source_c = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_29_corruption_source_c_01",
				[2] = "pwe_village_29_corruption_source_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_29_corruption_source_c_01",
				[2] = "pwe_village_29_corruption_source_c_02",
			},
			sound_events_duration = {
				[1] = 1.6536666154861,
				[2] = 1.31014585495,
			},
		},
		pwe_village_30_burning_town_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_30_burning_town_a_01",
				[2] = "pwe_village_30_burning_town_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_30_burning_town_a_01",
				[2] = "pwe_village_30_burning_town_a_02",
			},
			sound_events_duration = {
				[1] = 4.2791666984558,
				[2] = 2.7851042747498,
			},
		},
		pwe_village_30_burning_town_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_30_burning_town_b_01",
				[2] = "pwe_village_30_burning_town_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_30_burning_town_b_01",
				[2] = "pwe_village_30_burning_town_b_02",
			},
			sound_events_duration = {
				[1] = 2.6483750343323,
				[2] = 4.1365418434143,
			},
		},
		pwe_village_31_fill_cart_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_31_fill_cart_a_01",
				[2] = "pwe_village_31_fill_cart_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_31_fill_cart_a_01",
				[2] = "pwe_village_31_fill_cart_a_02",
			},
			sound_events_duration = {
				[1] = 5.5842499732971,
				[2] = 4.337833404541,
			},
		},
		pwe_village_32_that_did_it_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_32_that_did_it_a_01",
				"pwe_village_32_that_did_it_a_02",
				"pwe_village_32_that_did_it_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_32_that_did_it_a_01",
				"pwe_village_32_that_did_it_a_02",
				"pwe_village_32_that_did_it_a_03",
			},
			sound_events_duration = {
				1.2571250200272,
				3.551500082016,
				1.3286875486374,
			},
		},
		pwe_village_32a_wagon_full_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_32a_wagon_full_a_01",
				[2] = "pwe_village_32a_wagon_full_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_32a_wagon_full_a_01",
				[2] = "pwe_village_32a_wagon_full_a_02",
			},
			sound_events_duration = {
				[1] = 2.0335624217987,
				[2] = 2.1525416374206,
			},
		},
		pwe_village_33_fuse_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_33_fuse_a_01",
				[2] = "pwe_village_33_fuse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_33_fuse_a_01",
				[2] = "pwe_village_33_fuse_a_02",
			},
			sound_events_duration = {
				[1] = 3.4743332862854,
				[2] = 3.997270822525,
			},
		},
		pwe_village_34_lighthouse_collapse_a = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_34_lighthouse_collapse_a_01",
				[2] = "pwe_village_34_lighthouse_collapse_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_34_lighthouse_collapse_a_01",
				[2] = "pwe_village_34_lighthouse_collapse_a_02",
			},
			sound_events_duration = {
				[1] = 3.3417291641235,
				[2] = 3.3212292194366,
			},
		},
		pwe_village_34_lighthouse_collapse_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_34_lighthouse_collapse_b_01",
				[2] = "pwe_village_34_lighthouse_collapse_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_34_lighthouse_collapse_b_01",
				[2] = "pwe_village_34_lighthouse_collapse_b_02",
			},
			sound_events_duration = {
				[1] = 3.5906040668488,
				[2] = 3.287291765213,
			},
		},
		pwe_village_34_lighthouse_collapse_c = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_34_lighthouse_collapse_c_01",
				[2] = "pwe_village_34_lighthouse_collapse_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_34_lighthouse_collapse_c_01",
				[2] = "pwe_village_34_lighthouse_collapse_c_02",
			},
			sound_events_duration = {
				[1] = 4.3232917785644,
				[2] = 3.7694165706634,
			},
		},
		pwe_village_35_missing_comrade_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_35_missing_comrade_a_01",
				[2] = "pwe_village_35_missing_comrade_a_02",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pwe_village_35_missing_comrade_a_01 = {
					{
						"global_context",
						"bright_wizard",
						OP.EQ,
						true,
					},
				},
				pwe_village_35_missing_comrade_a_02 = {
					{
						"global_context",
						"empire_soldier",
						OP.EQ,
						true,
					},
				},
			},
			sound_events = {
				[1] = "pwe_village_35_missing_comrade_a_01",
				[2] = "pwe_village_35_missing_comrade_a_02",
			},
			sound_events_duration = {
				[1] = 2.338187456131,
				[2] = 5.1641664505005,
			},
		},
		pwe_village_35_missing_comrade_b = {
			category = "level_talk_must_play",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_35_missing_comrade_b_01",
				[2] = "pwe_village_35_missing_comrade_b_02",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pwe_village_35_missing_comrade_b_01",
				[2] = "pwe_village_35_missing_comrade_b_02",
			},
			sound_events_duration = {
				[1] = 4.9795832633972,
				[2] = 4.676833152771,
			},
		},
		pwe_village_35_missing_comrade_c = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_35_missing_comrade_c_01",
				[2] = "pwe_village_35_missing_comrade_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_35_missing_comrade_c_01",
				[2] = "pwe_village_35_missing_comrade_c_02",
			},
			sound_events_duration = {
				[1] = 1.6308749914169,
				[2] = 4.0783958435059,
			},
		},
		pwe_village_bonus_buboes_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
		pwe_village_bonus_buboes_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_bonus_buboes_a_01",
			},
			sound_events = {
				[1] = "pwe_village_bonus_buboes_a_01",
			},
			sound_events_duration = {
				[1] = 3.0495624542236,
			},
		},
		pwe_village_bonus_explosive_cart_tutorial_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_generic_path_blocked_01",
				"pwe_generic_path_blocked_02",
				"pwe_generic_path_blocked_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_path_blocked_01",
				"pwe_generic_path_blocked_02",
				"pwe_generic_path_blocked_03",
			},
			sound_events_duration = {
				0.86000001430511,
				1.9159791469574,
				1.2020000219345,
			},
		},
		pwe_village_bonus_explosive_cart_tutorial_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_objective_magnus_tower_finding_explosives_04",
			},
			sound_events = {
				[1] = "pwe_objective_magnus_tower_finding_explosives_04",
			},
			sound_events_duration = {
				[1] = 4.9100208282471,
			},
		},
		pwe_village_bonus_fish_barrel_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
		pwe_village_bonus_fish_barrel_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_bonus_fish_barrel_a_01",
			},
			sound_events = {
				[1] = "pwe_village_bonus_fish_barrel_a_01",
			},
			sound_events_duration = {
				[1] = 3.6008749008179,
			},
		},
		pwe_village_bonus_harbour_evil_glow_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_bonus_harbour_evil_glow_a_01",
				"pwe_village_bonus_harbour_evil_glow_a_02",
				"pwe_village_bonus_harbour_evil_glow_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_bonus_harbour_evil_glow_a_01",
				"pwe_village_bonus_harbour_evil_glow_a_02",
				"pwe_village_bonus_harbour_evil_glow_a_03",
			},
			sound_events_duration = {
				4.7499585151672,
				3.1652083396912,
				3.3191874027252,
			},
		},
		pwe_village_bonus_harbour_sewers_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_bonus_harbour_sewers_a_01",
				"pwe_village_bonus_harbour_sewers_a_02",
				"pwe_village_bonus_harbour_sewers_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_bonus_harbour_sewers_a_01",
				"pwe_village_bonus_harbour_sewers_a_02",
				"pwe_village_bonus_harbour_sewers_a_03",
			},
			sound_events_duration = {
				2.6371250152588,
				3.8273749351502,
				3.0704374313355,
			},
		},
		pwe_village_bonus_oil_dispenser_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_bonus_oil_dispenser_a_01",
				[2] = "pwe_village_bonus_oil_dispenser_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_bonus_oil_dispenser_a_01",
				[2] = "pwe_village_bonus_oil_dispenser_a_02",
			},
			sound_events_duration = {
				[1] = 2.3331251144409,
				[2] = 3.1898958683014,
			},
		},
		pwe_village_bonus_shallyan_idols_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_bonus_shallyan_idols_a_01",
				"pwe_village_bonus_shallyan_idols_a_02",
				"pwe_village_bonus_shallyan_idols_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_bonus_shallyan_idols_a_01",
				"pwe_village_bonus_shallyan_idols_a_02",
				"pwe_village_bonus_shallyan_idols_a_03",
			},
			sound_events_duration = {
				3.9892709255219,
				3.4061665534973,
				2.9628541469574,
			},
		},
		pwe_village_bonus_tavern_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				"pwe_village_bonus_tavern_a_01",
				"pwe_village_bonus_tavern_a_02",
				"pwe_village_bonus_tavern_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_village_bonus_tavern_a_01",
				"pwe_village_bonus_tavern_a_02",
				"pwe_village_bonus_tavern_a_03",
			},
			sound_events_duration = {
				4.3585834503174,
				2.5318334102631,
				3.1467292308807,
			},
		},
		pwe_village_bonus_whale_guts_a = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_bonus_whale_guts_a_01",
			},
			sound_events = {
				[1] = "pwe_village_bonus_whale_guts_a_01",
			},
			sound_events_duration = {
				[1] = 3.1246874332428,
			},
		},
		pwe_village_bonus_whale_guts_b = {
			category = "level_talk",
			database = "wood_elf_dlc_whaling_village",
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
				[1] = "pwe_village_bonus_whale_guts_b_01",
			},
			sound_events = {
				[1] = "pwe_village_bonus_whale_guts_b_01",
			},
			sound_events_duration = {
				[1] = 2.4890208244324,
			},
		},
	})
end
