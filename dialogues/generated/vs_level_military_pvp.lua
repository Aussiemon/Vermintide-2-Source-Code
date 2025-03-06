-- chunkname: @dialogues/generated/vs_level_military_pvp.lua

return function ()
	define_rule({
		name = "nde_vs_military_set1_briefing_a",
		probability = 1,
		response = "nde_vs_military_set1_briefing_a",
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
				"nde_vs_safe_room_start_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"start_zone",
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set1_obj1_a",
		probability = 1,
		response = "nde_vs_military_set1_obj1_a",
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
				"nde_vs_safe_room_round_started_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set1_obj1_reached",
		probability = 1,
		response = "nde_vs_military_set1_obj1_reached",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_reached",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"game_about_to_end",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"one",
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set1_obj2_a",
		probability = 1,
		response = "nde_vs_military_set1_obj2_a",
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
				"nde_vs_objective_completed_agnostic_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"game_about_to_end",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"two",
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set1_obj2_reached",
		probability = 1,
		response = "nde_vs_military_set1_obj2_reached",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_reached",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"game_about_to_end",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"two",
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set2_obj1_a",
		probability = 1,
		response = "nde_vs_military_set2_obj1_a",
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
				"nde_vs_safe_room_round_started_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set2_obj1_reached",
		probability = 1,
		response = "nde_vs_military_set2_obj1_reached",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_reached",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"game_about_to_end",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"one",
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set2_obj2_a",
		probability = 1,
		response = "nde_vs_military_set2_obj2_a",
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
				"nde_vs_objective_completed_agnostic_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"game_about_to_end",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"two",
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set2_obj2_p2",
		probability = 1,
		response = "nde_vs_military_set2_obj2_p2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_reached",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"game_about_to_end",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"two",
			},
			{
				"global_context",
				"objective_part",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set2_obj2_reached",
		probability = 1,
		response = "nde_vs_military_set2_obj2_reached",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_reached",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"game_about_to_end",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				2,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"two",
			},
			{
				"global_context",
				"objective_part",
				OP.EQ,
				1,
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set3_obj1_a",
		probability = 1,
		response = "nde_vs_military_set3_obj1_a",
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
				"nde_vs_safe_room_round_started_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				3,
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set3_obj1_reached",
		probability = 1,
		response = "nde_vs_military_set3_obj1_reached",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_reached",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"game_about_to_end",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				3,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"one",
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set3_obj2_a",
		probability = 1,
		response = "nde_vs_military_set3_obj2_a",
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
				"nde_vs_objective_completed_agnostic_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"game_about_to_end",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				3,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"two",
			},
		},
	})
	define_rule({
		name = "nde_vs_military_set3_obj2_reached",
		probability = 1,
		response = "nde_vs_military_set3_obj2_reached",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_reached",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"game_about_to_end",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				3,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"two",
			},
		},
	})
	define_rule({
		name = "pbw_level_helmgart_military_courtyard_event_PVP",
		probability = 1,
		response = "pbw_level_helmgart_military_courtyard_event_PVP",
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
				"helmgart_military_courtyard_event",
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
				"helmgart_military_courtyard_event",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_courtyard_event",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_helmgart_military_door_opens_PVP",
		probability = 1,
		response = "pbw_level_helmgart_military_door_opens_PVP",
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
				"nde_vs_objective_completed_final_waystone_b",
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
				"helmgart_military_door_opens",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_door_opens",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_helmgart_military_empty_town_PVP",
		probability = 1,
		response = "pbw_level_helmgart_military_empty_town_PVP",
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
				"helmgart_military_empty_town",
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
				"helmgart_military_empty_town",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_empty_town",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_helmgart_military_fire_cannon_PVP",
		probability = 1,
		response = "pbw_level_helmgart_military_fire_cannon_PVP",
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
				"helmgart_military_fire_cannon",
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
				"helmgart_military_fire_cannon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_fire_cannon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_helmgart_military_halfway_through_horde_PVP",
		probability = 1,
		response = "pbw_level_helmgart_military_halfway_through_horde_PVP",
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
				"helmgart_military_halfway_through_horde",
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
				"helmgart_military_halfway_through_horde",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_halfway_through_horde",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_helmgart_military_ring_bell_PVP",
		probability = 1,
		response = "pbw_level_helmgart_military_ring_bell_PVP",
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
				"nde_vs_military_set3_obj2_reached",
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
				"helmgart_military_ring_bell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_ring_bell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_helmgart_military_they_are_coming_PVP",
		probability = 1,
		response = "pbw_level_helmgart_military_they_are_coming_PVP",
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
				"helmgart_military_they_are_coming",
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
				"helmgart_military_they_are_coming",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_they_are_coming",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_helmgart_military_turn_cannon_PVP",
		probability = 1,
		response = "pbw_level_helmgart_military_turn_cannon_PVP",
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
				"nde_vs_military_set2_obj2_reached",
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
				"helmgart_military_turn_cannon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_turn_cannon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_vs_safe_room_military_01_b",
		probability = 1,
		response = "pbw_vs_safe_room_military_01_b",
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
				"pwh_vs_safe_room_military_01_a",
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
		name = "pbw_vs_safe_room_military_02_a",
		probability = 1,
		response = "pbw_vs_safe_room_military_02_a",
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
				"nde_vs_military_set1_briefing_a",
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
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"start_zone",
			},
		},
	})
	define_rule({
		name = "pbw_vs_safe_room_military_03_b",
		probability = 1,
		response = "pbw_vs_safe_room_military_03_b",
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
				"pdr_vs_safe_room_military_03_a",
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
		name = "pbw_vs_safe_room_military_04_b",
		probability = 1,
		response = "pbw_vs_safe_room_military_04_b",
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
				"pwe_vs_safe_room_military_04_a",
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
		name = "pbw_vs_safe_room_military_05_b",
		probability = 1,
		response = "pbw_vs_safe_room_military_05_b",
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
				"pes_vs_safe_room_military_05_a",
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
		name = "pbw_vs_safe_room_military_06_b",
		probability = 1,
		response = "pbw_vs_safe_room_military_06_b",
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
				"pwh_vs_safe_room_military_06_a",
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
		name = "pbw_vs_safe_room_military_07_a",
		probability = 1,
		response = "pbw_vs_safe_room_military_07_a",
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
				"nde_vs_military_set1_briefing_a",
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
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"start_zone",
			},
		},
	})
	define_rule({
		name = "pbw_vs_safe_room_military_08_b",
		probability = 1,
		response = "pbw_vs_safe_room_military_08_b",
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
				"pdr_vs_safe_room_military_08_a",
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
		name = "pbw_vs_safe_room_military_09_b",
		probability = 1,
		response = "pbw_vs_safe_room_military_09_b",
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
				"pwe_vs_safe_room_military_09_a",
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
		name = "pbw_vs_safe_room_military_10_b",
		probability = 1,
		response = "pbw_vs_safe_room_military_10_b",
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
				"pes_vs_safe_room_military_10_a",
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
		name = "pdr_level_helmgart_military_courtyard_event_PVP",
		probability = 1,
		response = "pdr_level_helmgart_military_courtyard_event_PVP",
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
				"helmgart_military_courtyard_event",
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
				"helmgart_military_courtyard_event",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_courtyard_event",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_helmgart_military_door_opens_PVP",
		probability = 1,
		response = "pdr_level_helmgart_military_door_opens_PVP",
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
				"nde_vs_objective_completed_final_waystone_b",
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
				3,
			},
			{
				"faction_memory",
				"helmgart_military_door_opens",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_door_opens",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_helmgart_military_empty_town_PVP",
		probability = 1,
		response = "pdr_level_helmgart_military_empty_town_PVP",
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
				"helmgart_military_empty_town",
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
				"helmgart_military_empty_town",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_empty_town",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_helmgart_military_fire_cannon_PVP",
		probability = 1,
		response = "pdr_level_helmgart_military_fire_cannon_PVP",
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
				"helmgart_military_fire_cannon",
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
				"helmgart_military_fire_cannon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_fire_cannon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_helmgart_military_halfway_through_horde_PVP",
		probability = 1,
		response = "pdr_level_helmgart_military_halfway_through_horde_PVP",
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
				"helmgart_military_halfway_through_horde",
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
				"helmgart_military_halfway_through_horde",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_halfway_through_horde",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_helmgart_military_ring_bell_PVP",
		probability = 1,
		response = "pdr_level_helmgart_military_ring_bell_PVP",
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
				"nde_vs_military_set3_obj2_reached",
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
				"helmgart_military_ring_bell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_ring_bell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_helmgart_military_they_are_coming_PVP",
		probability = 1,
		response = "pdr_level_helmgart_military_they_are_coming_PVP",
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
				"helmgart_military_they_are_coming",
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
				"helmgart_military_they_are_coming",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_they_are_coming",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_helmgart_military_turn_cannon_PVP",
		probability = 1,
		response = "pdr_level_helmgart_military_turn_cannon_PVP",
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
				"nde_vs_military_set2_obj2_reached",
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
				"helmgart_military_turn_cannon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_turn_cannon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_vs_safe_room_military_01_b",
		probability = 1,
		response = "pdr_vs_safe_room_military_01_b",
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
				"pwh_vs_safe_room_military_01_a",
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
		name = "pdr_vs_safe_room_military_02_b",
		probability = 1,
		response = "pdr_vs_safe_room_military_02_b",
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
				"pbw_vs_safe_room_military_02_a",
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
		name = "pdr_vs_safe_room_military_03_a",
		probability = 1,
		response = "pdr_vs_safe_room_military_03_a",
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
				"nde_vs_military_set1_briefing_a",
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
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"start_zone",
			},
		},
	})
	define_rule({
		name = "pdr_vs_safe_room_military_04_b",
		probability = 1,
		response = "pdr_vs_safe_room_military_04_b",
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
				"pwe_vs_safe_room_military_04_a",
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
		name = "pdr_vs_safe_room_military_05_b",
		probability = 1,
		response = "pdr_vs_safe_room_military_05_b",
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
				"pes_vs_safe_room_military_05_a",
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
		name = "pdr_vs_safe_room_military_06_b",
		probability = 1,
		response = "pdr_vs_safe_room_military_06_b",
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
				"pwh_vs_safe_room_military_06_a",
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
		name = "pdr_vs_safe_room_military_07_b",
		probability = 1,
		response = "pdr_vs_safe_room_military_07_b",
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
				"pbw_vs_safe_room_military_07_a",
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
		name = "pdr_vs_safe_room_military_08_a",
		probability = 1,
		response = "pdr_vs_safe_room_military_08_a",
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
				"nde_vs_military_set1_briefing_a",
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
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"start_zone",
			},
		},
	})
	define_rule({
		name = "pdr_vs_safe_room_military_09_b",
		probability = 1,
		response = "pdr_vs_safe_room_military_09_b",
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
				"pwe_vs_safe_room_military_09_a",
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
		name = "pdr_vs_safe_room_military_10_b",
		probability = 1,
		response = "pdr_vs_safe_room_military_10_b",
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
				"pes_vs_safe_room_military_10_a",
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
		name = "pes_level_helmgart_military_courtyard_event_PVP",
		probability = 1,
		response = "pes_level_helmgart_military_courtyard_event_PVP",
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
				"helmgart_military_courtyard_event",
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
				"helmgart_military_courtyard_event",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_courtyard_event",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_helmgart_military_door_opens_PVP",
		probability = 1,
		response = "pes_level_helmgart_military_door_opens_PVP",
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
				"nde_vs_objective_completed_final_waystone_b",
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
				3,
			},
			{
				"faction_memory",
				"helmgart_military_door_opens",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_door_opens",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_helmgart_military_empty_town_PVP",
		probability = 1,
		response = "pes_level_helmgart_military_empty_town_PVP",
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
				"helmgart_military_empty_town",
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
				"helmgart_military_empty_town",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_empty_town",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_helmgart_military_fire_cannon_PVP",
		probability = 1,
		response = "pes_level_helmgart_military_fire_cannon_PVP",
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
				"helmgart_military_fire_cannon",
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
				"helmgart_military_fire_cannon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_fire_cannon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_helmgart_military_halfway_through_horde_PVP",
		probability = 1,
		response = "pes_level_helmgart_military_halfway_through_horde_PVP",
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
				"helmgart_military_halfway_through_horde",
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
				"helmgart_military_halfway_through_horde",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_halfway_through_horde",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_helmgart_military_ring_bell_PVP",
		probability = 1,
		response = "pes_level_helmgart_military_ring_bell_PVP",
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
				"nde_vs_military_set3_obj2_reached",
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
				"helmgart_military_ring_bell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_ring_bell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_helmgart_military_they_are_coming_PVP",
		probability = 1,
		response = "pes_level_helmgart_military_they_are_coming_PVP",
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
				"helmgart_military_they_are_coming",
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
				"helmgart_military_they_are_coming",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_they_are_coming",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_helmgart_military_turn_cannon_PVP",
		probability = 1,
		response = "pes_level_helmgart_military_turn_cannon_PVP",
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
				"nde_vs_military_set2_obj2_reached",
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
				"helmgart_military_turn_cannon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_turn_cannon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_vs_safe_room_military_01_b",
		probability = 1,
		response = "pes_vs_safe_room_military_01_b",
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
				"pwh_vs_safe_room_military_01_a",
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
		name = "pes_vs_safe_room_military_02_b",
		probability = 1,
		response = "pes_vs_safe_room_military_02_b",
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
				"pbw_vs_safe_room_military_02_a",
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
		name = "pes_vs_safe_room_military_03_b",
		probability = 1,
		response = "pes_vs_safe_room_military_03_b",
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
				"pdr_vs_safe_room_military_03_a",
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
		name = "pes_vs_safe_room_military_04_b",
		probability = 1,
		response = "pes_vs_safe_room_military_04_b",
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
				"pwe_vs_safe_room_military_04_a",
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
		name = "pes_vs_safe_room_military_05_a",
		probability = 1,
		response = "pes_vs_safe_room_military_05_a",
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
				"nde_vs_military_set1_briefing_a",
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
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"start_zone",
			},
		},
	})
	define_rule({
		name = "pes_vs_safe_room_military_06_b",
		probability = 1,
		response = "pes_vs_safe_room_military_06_b",
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
				"pwh_vs_safe_room_military_06_a",
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
		name = "pes_vs_safe_room_military_07_b",
		probability = 1,
		response = "pes_vs_safe_room_military_07_b",
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
				"pbw_vs_safe_room_military_07_a",
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
		name = "pes_vs_safe_room_military_08_b",
		probability = 1,
		response = "pes_vs_safe_room_military_08_b",
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
				"pdr_vs_safe_room_military_08_a",
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
		name = "pes_vs_safe_room_military_09_b",
		probability = 1,
		response = "pes_vs_safe_room_military_09_b",
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
				"pwe_vs_safe_room_military_09_a",
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
		name = "pes_vs_safe_room_military_10_a",
		probability = 1,
		response = "pes_vs_safe_room_military_10_a",
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
				"nde_vs_military_set1_briefing_a",
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
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"start_zone",
			},
		},
	})
	define_rule({
		name = "pwe_level_helmgart_military_courtyard_event_PVP",
		probability = 1,
		response = "pwe_level_helmgart_military_courtyard_event_PVP",
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
				"helmgart_military_courtyard_event",
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
				"helmgart_military_courtyard_event",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_courtyard_event",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_helmgart_military_door_opens_PVP",
		probability = 1,
		response = "pwe_level_helmgart_military_door_opens_PVP",
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
				"nde_vs_objective_completed_final_waystone_b",
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
				3,
			},
			{
				"faction_memory",
				"helmgart_military_door_opens",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_door_opens",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_helmgart_military_empty_town_PVP",
		probability = 1,
		response = "pwe_level_helmgart_military_empty_town_PVP",
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
				"helmgart_military_empty_town",
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
				"helmgart_military_empty_town",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_empty_town",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_helmgart_military_fire_cannon_PVP",
		probability = 1,
		response = "pwe_level_helmgart_military_fire_cannon_PVP",
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
				"helmgart_military_fire_cannon",
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
				"helmgart_military_fire_cannon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_fire_cannon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_helmgart_military_halfway_through_horde_PVP",
		probability = 1,
		response = "pwe_level_helmgart_military_halfway_through_horde_PVP",
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
				"helmgart_military_halfway_through_horde",
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
				"helmgart_military_halfway_through_horde",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_halfway_through_horde",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_helmgart_military_ring_bell_PVP",
		probability = 1,
		response = "pwe_level_helmgart_military_ring_bell_PVP",
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
				"nde_vs_military_set3_obj2_reached",
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
				"helmgart_military_ring_bell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_ring_bell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_helmgart_military_they_are_coming_PVP",
		probability = 1,
		response = "pwe_level_helmgart_military_they_are_coming_PVP",
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
				"helmgart_military_they_are_coming",
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
				"helmgart_military_they_are_coming",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_they_are_coming",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_helmgart_military_turn_cannon_PVP",
		probability = 1,
		response = "pwe_level_helmgart_military_turn_cannon_PVP",
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
				"nde_vs_military_set2_obj2_reached",
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
				"helmgart_military_turn_cannon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_turn_cannon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_vs_safe_room_military_01_b",
		probability = 1,
		response = "pwe_vs_safe_room_military_01_b",
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
				"pwh_vs_safe_room_military_01_a",
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
		name = "pwe_vs_safe_room_military_02_b",
		probability = 1,
		response = "pwe_vs_safe_room_military_02_b",
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
				"pbw_vs_safe_room_military_02_a",
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
		name = "pwe_vs_safe_room_military_03_b",
		probability = 1,
		response = "pwe_vs_safe_room_military_03_b",
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
				"pdr_vs_safe_room_military_03_a",
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
		name = "pwe_vs_safe_room_military_04_a",
		probability = 1,
		response = "pwe_vs_safe_room_military_04_a",
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
				"nde_vs_military_set1_briefing_a",
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
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"start_zone",
			},
		},
	})
	define_rule({
		name = "pwe_vs_safe_room_military_05_b",
		probability = 1,
		response = "pwe_vs_safe_room_military_05_b",
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
				"pes_vs_safe_room_military_05_a",
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
		name = "pwe_vs_safe_room_military_06_b",
		probability = 1,
		response = "pwe_vs_safe_room_military_06_b",
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
				"pwh_vs_safe_room_military_06_a",
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
		name = "pwe_vs_safe_room_military_07_b",
		probability = 1,
		response = "pwe_vs_safe_room_military_07_b",
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
				"pbw_vs_safe_room_military_07_a",
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
		name = "pwe_vs_safe_room_military_08_b",
		probability = 1,
		response = "pwe_vs_safe_room_military_08_b",
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
				"pdr_vs_safe_room_military_08_a",
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
		name = "pwe_vs_safe_room_military_09_a",
		probability = 1,
		response = "pwe_vs_safe_room_military_09_a",
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
				"nde_vs_military_set1_briefing_a",
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
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"start_zone",
			},
		},
	})
	define_rule({
		name = "pwe_vs_safe_room_military_10_b",
		probability = 1,
		response = "pwe_vs_safe_room_military_10_b",
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
				"pes_vs_safe_room_military_10_a",
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
		name = "pwh_level_helmgart_military_courtyard_event_PVP",
		probability = 1,
		response = "pwh_level_helmgart_military_courtyard_event_PVP",
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
				"helmgart_military_courtyard_event",
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
				"helmgart_military_courtyard_event",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_courtyard_event",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_helmgart_military_door_opens_PVP",
		probability = 1,
		response = "pwh_level_helmgart_military_door_opens_PVP",
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
				"nde_vs_objective_completed_final_waystone_b",
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
				3,
			},
			{
				"faction_memory",
				"helmgart_military_door_opens",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_door_opens",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_helmgart_military_empty_town_PVP",
		probability = 1,
		response = "pwh_level_helmgart_military_empty_town_PVP",
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
				"helmgart_military_empty_town",
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
				"helmgart_military_empty_town",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_empty_town",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_helmgart_military_fire_cannon_PVP",
		probability = 1,
		response = "pwh_level_helmgart_military_fire_cannon_PVP",
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
				"helmgart_military_fire_cannon",
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
				"helmgart_military_fire_cannon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_fire_cannon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_helmgart_military_halfway_through_horde_PVP",
		probability = 1,
		response = "pwh_level_helmgart_military_halfway_through_horde_PVP",
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
				"helmgart_military_halfway_through_horde",
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
				"helmgart_military_halfway_through_horde",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_halfway_through_horde",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_helmgart_military_ring_bell_PVP",
		probability = 1,
		response = "pwh_level_helmgart_military_ring_bell_PVP",
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
				"nde_vs_military_set3_obj2_reached",
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
				"helmgart_military_ring_bell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_ring_bell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_helmgart_military_they_are_coming_PVP",
		probability = 1,
		response = "pwh_level_helmgart_military_they_are_coming_PVP",
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
				"helmgart_military_they_are_coming",
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
				"helmgart_military_they_are_coming",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_they_are_coming",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_helmgart_military_turn_cannon_PVP",
		probability = 1,
		response = "pwh_level_helmgart_military_turn_cannon_PVP",
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
				"nde_vs_military_set2_obj2_reached",
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
				"helmgart_military_turn_cannon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"helmgart_military_turn_cannon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_vs_safe_room_military_01_a",
		probability = 1,
		response = "pwh_vs_safe_room_military_01_a",
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
				"nde_vs_military_set1_briefing_a",
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
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"start_zone",
			},
		},
	})
	define_rule({
		name = "pwh_vs_safe_room_military_02_b",
		probability = 1,
		response = "pwh_vs_safe_room_military_02_b",
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
				"pbw_vs_safe_room_military_02_a",
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
		name = "pwh_vs_safe_room_military_03_b",
		probability = 1,
		response = "pwh_vs_safe_room_military_03_b",
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
				"pdr_vs_safe_room_military_03_a",
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
		name = "pwh_vs_safe_room_military_04_b",
		probability = 1,
		response = "pwh_vs_safe_room_military_04_b",
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
				"pwe_vs_safe_room_military_04_a",
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
		name = "pwh_vs_safe_room_military_05_b",
		probability = 1,
		response = "pwh_vs_safe_room_military_05_b",
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
				"pes_vs_safe_room_military_05_a",
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
		name = "pwh_vs_safe_room_military_06_a",
		probability = 1,
		response = "pwh_vs_safe_room_military_06_a",
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
				"nde_vs_military_set1_briefing_a",
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
				"global_context",
				"current_level",
				OP.EQ,
				"military_pvp",
			},
			{
				"global_context",
				"current_set",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"start_zone",
			},
		},
	})
	define_rule({
		name = "pwh_vs_safe_room_military_07_b",
		probability = 1,
		response = "pwh_vs_safe_room_military_07_b",
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
				"pbw_vs_safe_room_military_07_a",
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
		name = "pwh_vs_safe_room_military_08_b",
		probability = 1,
		response = "pwh_vs_safe_room_military_08_b",
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
				"pdr_vs_safe_room_military_08_a",
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
		name = "pwh_vs_safe_room_military_09_b",
		probability = 1,
		response = "pwh_vs_safe_room_military_09_b",
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
				"pwe_vs_safe_room_military_09_a",
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
		name = "pwh_vs_safe_room_military_10_b",
		probability = 1,
		response = "pwh_vs_safe_room_military_10_b",
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
				"pes_vs_safe_room_military_10_a",
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
		nde_vs_military_set1_briefing_a = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_allies = true,
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
				"nde_vs_military_set1_briefing_a_01",
				"nde_vs_military_set1_briefing_a_02",
				"nde_vs_military_set1_briefing_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_vs_military_set1_briefing_a_01",
				"nde_vs_military_set1_briefing_a_02",
				"nde_vs_military_set1_briefing_a_03",
			},
			sound_events_duration = {
				7.4441041946411,
				8.4426460266113,
				8.1624374389648,
			},
		},
		nde_vs_military_set1_obj1_a = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_allies = true,
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
				"nde_vs_military_set1_obj1_a_01",
				"nde_vs_military_set1_obj1_a_02",
				"nde_vs_military_set1_obj1_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_military_set1_obj1_a_01",
				"nde_vs_military_set1_obj1_a_02",
				"nde_vs_military_set1_obj1_a_03",
			},
			sound_events_duration = {
				4.858437538147,
				5.2245836257935,
				5.2468333244324,
			},
		},
		nde_vs_military_set1_obj1_reached = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_allies = true,
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
				"nde_vs_military_set1_obj1_event_a_01",
				"nde_vs_military_set1_obj1_event_a_02",
				"nde_vs_military_set1_obj1_event_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_military_set1_obj1_event_a_01",
				"nde_vs_military_set1_obj1_event_a_02",
				"nde_vs_military_set1_obj1_event_a_03",
			},
			sound_events_duration = {
				6.4188752174377,
				6.2730002403259,
				5.8959169387817,
			},
		},
		nde_vs_military_set1_obj2_a = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			only_allies = true,
			randomize_indexes_n = 0,
			sound_events_n = 10,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
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
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"nde_vs_keep_moving_a_01",
				"nde_vs_keep_moving_a_02",
				"nde_vs_keep_moving_a_03",
				"nde_vs_keep_moving_a_04",
				"nde_vs_keep_moving_a_05",
				"nde_vs_keep_moving_a_06",
				"nde_vs_keep_moving_a_07",
				"nde_vs_keep_moving_a_08",
				"nde_vs_keep_moving_a_09",
				"nde_vs_keep_moving_a_10",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_keep_moving_a_01",
				"nde_vs_keep_moving_a_02",
				"nde_vs_keep_moving_a_03",
				"nde_vs_keep_moving_a_04",
				"nde_vs_keep_moving_a_05",
				"nde_vs_keep_moving_a_06",
				"nde_vs_keep_moving_a_07",
				"nde_vs_keep_moving_a_08",
				"nde_vs_keep_moving_a_09",
				"nde_vs_keep_moving_a_10",
			},
			sound_events_duration = {
				2.8272707462311,
				3.482937335968,
				4.1608748435974,
				2.2954792976379,
				3.455020904541,
				4.7318124771118,
				3.6683125495911,
				3.4177916049957,
				4.1398334503174,
				3.8463540077209,
			},
		},
		nde_vs_military_set1_obj2_reached = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_allies = true,
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
				"nde_vs_military_set1_obj2_event_a_01",
				"nde_vs_military_set1_obj2_event_a_02",
				"nde_vs_military_set1_obj2_event_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_military_set1_obj2_event_a_01",
				"nde_vs_military_set1_obj2_event_a_02",
				"nde_vs_military_set1_obj2_event_a_03",
			},
			sound_events_duration = {
				5.5290002822876,
				4.6579999923706,
				5.2245001792908,
			},
		},
		nde_vs_military_set2_obj1_a = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_allies = true,
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
				"nde_vs_military_set2_obj1_a_01",
				"nde_vs_military_set2_obj1_a_02",
				"nde_vs_military_set2_obj1_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_military_set2_obj1_a_01",
				"nde_vs_military_set2_obj1_a_02",
				"nde_vs_military_set2_obj1_a_03",
			},
			sound_events_duration = {
				5.1617293357849,
				5.0095624923706,
				6.2935628890991,
			},
		},
		nde_vs_military_set2_obj1_reached = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 6,
			face_animations_n = 6,
			only_allies = true,
			randomize_indexes_n = 0,
			sound_events_n = 6,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
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
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"nde_vs_agnostic_capture_a_01",
				"nde_vs_agnostic_capture_a_02",
				"nde_vs_agnostic_capture_a_03",
				"nde_vs_agnostic_capture_a_04",
				"nde_vs_agnostic_capture_a_05",
				"nde_vs_agnostic_capture_a_06",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_agnostic_capture_a_01",
				"nde_vs_agnostic_capture_a_02",
				"nde_vs_agnostic_capture_a_03",
				"nde_vs_agnostic_capture_a_04",
				"nde_vs_agnostic_capture_a_05",
				"nde_vs_agnostic_capture_a_06",
			},
			sound_events_duration = {
				3.7752499580383,
				3.8846249580383,
				3.7248332500458,
				3.4297707080841,
				2.9989998340607,
				4.3700003623962,
			},
		},
		nde_vs_military_set2_obj2_a = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			only_allies = true,
			randomize_indexes_n = 0,
			sound_events_n = 10,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
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
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"nde_vs_keep_moving_a_01",
				"nde_vs_keep_moving_a_02",
				"nde_vs_keep_moving_a_03",
				"nde_vs_keep_moving_a_04",
				"nde_vs_keep_moving_a_05",
				"nde_vs_keep_moving_a_06",
				"nde_vs_keep_moving_a_07",
				"nde_vs_keep_moving_a_08",
				"nde_vs_keep_moving_a_09",
				"nde_vs_keep_moving_a_10",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_keep_moving_a_01",
				"nde_vs_keep_moving_a_02",
				"nde_vs_keep_moving_a_03",
				"nde_vs_keep_moving_a_04",
				"nde_vs_keep_moving_a_05",
				"nde_vs_keep_moving_a_06",
				"nde_vs_keep_moving_a_07",
				"nde_vs_keep_moving_a_08",
				"nde_vs_keep_moving_a_09",
				"nde_vs_keep_moving_a_10",
			},
			sound_events_duration = {
				2.8272707462311,
				3.482937335968,
				4.1608748435974,
				2.2954792976379,
				3.455020904541,
				4.7318124771118,
				3.6683125495911,
				3.4177916049957,
				4.1398334503174,
				3.8463540077209,
			},
		},
		nde_vs_military_set2_obj2_p2 = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			only_allies = true,
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
				"nde_vs_agnostic_load_cannon_a_01",
				"nde_vs_agnostic_load_cannon_a_02",
				"nde_vs_agnostic_load_cannon_a_03",
				"nde_vs_agnostic_load_cannon_a_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_agnostic_load_cannon_a_01",
				"nde_vs_agnostic_load_cannon_a_02",
				"nde_vs_agnostic_load_cannon_a_03",
				"nde_vs_agnostic_load_cannon_a_04",
			},
			sound_events_duration = {
				2.2139999866486,
				2.4679999351502,
				2.8989999294281,
				3.7235417366028,
			},
		},
		nde_vs_military_set2_obj2_reached = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_allies = true,
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
				"nde_vs_military_set2_obj2_event_a_01",
				"nde_vs_military_set2_obj2_event_a_02",
				"nde_vs_military_set2_obj2_event_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_vs_military_set2_obj2_event_a_01",
				"nde_vs_military_set2_obj2_event_a_02",
				"nde_vs_military_set2_obj2_event_a_03",
			},
			sound_events_duration = {
				3.6459999084473,
				4.6900000572205,
				6.1860003471375,
			},
		},
		nde_vs_military_set3_obj1_a = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_allies = true,
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
				"nde_vs_military_set3_obj1_a_01",
				"nde_vs_military_set3_obj1_a_02",
				"nde_vs_military_set3_obj1_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_military_set3_obj1_a_01",
				"nde_vs_military_set3_obj1_a_02",
				"nde_vs_military_set3_obj1_a_03",
			},
			sound_events_duration = {
				3.2869582176209,
				4.362729549408,
				4.4957504272461,
			},
		},
		nde_vs_military_set3_obj1_reached = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 6,
			face_animations_n = 6,
			only_allies = true,
			randomize_indexes_n = 0,
			sound_events_n = 6,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
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
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"nde_vs_agnostic_capture_a_01",
				"nde_vs_agnostic_capture_a_02",
				"nde_vs_agnostic_capture_a_03",
				"nde_vs_agnostic_capture_a_04",
				"nde_vs_agnostic_capture_a_05",
				"nde_vs_agnostic_capture_a_06",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_agnostic_capture_a_01",
				"nde_vs_agnostic_capture_a_02",
				"nde_vs_agnostic_capture_a_03",
				"nde_vs_agnostic_capture_a_04",
				"nde_vs_agnostic_capture_a_05",
				"nde_vs_agnostic_capture_a_06",
			},
			sound_events_duration = {
				3.7752499580383,
				3.8846249580383,
				3.7248332500458,
				3.4297707080841,
				2.9989998340607,
				4.3700003623962,
			},
		},
		nde_vs_military_set3_obj2_a = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 10,
			face_animations_n = 10,
			only_allies = true,
			randomize_indexes_n = 0,
			sound_events_n = 10,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
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
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"nde_vs_keep_moving_a_01",
				"nde_vs_keep_moving_a_02",
				"nde_vs_keep_moving_a_03",
				"nde_vs_keep_moving_a_04",
				"nde_vs_keep_moving_a_05",
				"nde_vs_keep_moving_a_06",
				"nde_vs_keep_moving_a_07",
				"nde_vs_keep_moving_a_08",
				"nde_vs_keep_moving_a_09",
				"nde_vs_keep_moving_a_10",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_keep_moving_a_01",
				"nde_vs_keep_moving_a_02",
				"nde_vs_keep_moving_a_03",
				"nde_vs_keep_moving_a_04",
				"nde_vs_keep_moving_a_05",
				"nde_vs_keep_moving_a_06",
				"nde_vs_keep_moving_a_07",
				"nde_vs_keep_moving_a_08",
				"nde_vs_keep_moving_a_09",
				"nde_vs_keep_moving_a_10",
			},
			sound_events_duration = {
				2.8272707462311,
				3.482937335968,
				4.1608748435974,
				2.2954792976379,
				3.455020904541,
				4.7318124771118,
				3.6683125495911,
				3.4177916049957,
				4.1398334503174,
				3.8463540077209,
			},
		},
		nde_vs_military_set3_obj2_reached = {
			category = "npc_talk",
			database = "vs_level_military_pvp",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_allies = true,
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
				"nde_vs_military_set3_obj2_event_a_01",
				"nde_vs_military_set3_obj2_event_a_02",
				"nde_vs_military_set3_obj2_event_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_vs_military_set3_obj2_event_a_01",
				"nde_vs_military_set3_obj2_event_a_02",
				"nde_vs_military_set3_obj2_event_a_03",
			},
			sound_events_duration = {
				3.6440000534058,
				5.1810002326965,
				4.188000202179,
			},
		},
		pbw_level_helmgart_military_courtyard_event_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pbw_level_helmgart_military_courtyard_event_01",
				"pbw_level_helmgart_military_courtyard_event_02",
				"pbw_level_helmgart_military_courtyard_event_03",
				"pbw_level_helmgart_military_courtyard_event_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_helmgart_military_courtyard_event_01",
				"pbw_level_helmgart_military_courtyard_event_02",
				"pbw_level_helmgart_military_courtyard_event_03",
				"pbw_level_helmgart_military_courtyard_event_04",
			},
			sound_events_duration = {
				3.5007708072662,
				2.5677917003632,
				2.2261874675751,
				5.051146030426,
			},
		},
		pbw_level_helmgart_military_door_opens_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pbw_level_helmgart_military_door_opens_01",
				"pbw_level_helmgart_military_door_opens_02",
				"pbw_level_helmgart_military_door_opens_03",
				"pbw_level_helmgart_military_door_opens_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_helmgart_military_door_opens_01",
				"pbw_level_helmgart_military_door_opens_02",
				"pbw_level_helmgart_military_door_opens_03",
				"pbw_level_helmgart_military_door_opens_04",
			},
			sound_events_duration = {
				1.6056250333786,
				1.4767291545868,
				2.5077290534973,
				3.2498126029968,
			},
		},
		pbw_level_helmgart_military_empty_town_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pbw_level_helmgart_military_empty_town_01",
				"pbw_level_helmgart_military_empty_town_02",
				"pbw_level_helmgart_military_empty_town_03",
				"pbw_level_helmgart_military_empty_town_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_helmgart_military_empty_town_01",
				"pbw_level_helmgart_military_empty_town_02",
				"pbw_level_helmgart_military_empty_town_03",
				"pbw_level_helmgart_military_empty_town_04",
			},
			sound_events_duration = {
				3.8374166488648,
				3.5300834178925,
				4.3595623970032,
				3.7443749904633,
			},
		},
		pbw_level_helmgart_military_fire_cannon_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pbw_level_helmgart_military_fire_cannon_01",
				"pbw_level_helmgart_military_fire_cannon_02",
				"pbw_level_helmgart_military_fire_cannon_03",
				"pbw_level_helmgart_military_fire_cannon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_helmgart_military_fire_cannon_01",
				"pbw_level_helmgart_military_fire_cannon_02",
				"pbw_level_helmgart_military_fire_cannon_03",
				"pbw_level_helmgart_military_fire_cannon_04",
			},
			sound_events_duration = {
				3.3581042289734,
				1.5076458454132,
				3.2410209178925,
				3.3165833950043,
			},
		},
		pbw_level_helmgart_military_halfway_through_horde_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pbw_level_helmgart_military_halfway_through_horde_01",
				"pbw_level_helmgart_military_halfway_through_horde_02",
				"pbw_level_helmgart_military_halfway_through_horde_03",
				"pbw_level_helmgart_military_halfway_through_horde_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_helmgart_military_halfway_through_horde_01",
				"pbw_level_helmgart_military_halfway_through_horde_02",
				"pbw_level_helmgart_military_halfway_through_horde_03",
				"pbw_level_helmgart_military_halfway_through_horde_04",
			},
			sound_events_duration = {
				3.0733749866486,
				2.6832292079926,
				2.2461042404175,
				1.8004583120346,
			},
		},
		pbw_level_helmgart_military_ring_bell_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"pbw_level_helmgart_military_ring_bell_01",
				"pbw_level_helmgart_military_ring_bell_02",
				"pbw_level_helmgart_military_ring_bell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_helmgart_military_ring_bell_01",
				"pbw_level_helmgart_military_ring_bell_02",
				"pbw_level_helmgart_military_ring_bell_04",
			},
			sound_events_duration = {
				4.3669376373291,
				4.2549166679382,
				1.9238125085831,
			},
		},
		pbw_level_helmgart_military_they_are_coming_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pbw_level_helmgart_military_they_are_coming_01",
				"pbw_level_helmgart_military_they_are_coming_02",
				"pbw_level_helmgart_military_they_are_coming_03",
				"pbw_level_helmgart_military_they_are_coming_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_helmgart_military_they_are_coming_01",
				"pbw_level_helmgart_military_they_are_coming_02",
				"pbw_level_helmgart_military_they_are_coming_03",
				"pbw_level_helmgart_military_they_are_coming_04",
			},
			sound_events_duration = {
				3.3129374980927,
				2.6273748874664,
				1.5969582796097,
				4.1210417747498,
			},
		},
		pbw_level_helmgart_military_turn_cannon_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pbw_level_helmgart_military_turn_cannon_01",
				"pbw_level_helmgart_military_turn_cannon_02",
				"pbw_level_helmgart_military_turn_cannon_03",
				"pbw_level_helmgart_military_turn_cannon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_helmgart_military_turn_cannon_01",
				"pbw_level_helmgart_military_turn_cannon_02",
				"pbw_level_helmgart_military_turn_cannon_03",
				"pbw_level_helmgart_military_turn_cannon_04",
			},
			sound_events_duration = {
				3.913583278656,
				4.4962291717529,
				5.6284165382385,
				4.2127709388733,
			},
		},
		pbw_vs_safe_room_military_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pbw_vs_safe_room_military_01_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_military_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.1400001049042,
			},
		},
		pbw_vs_safe_room_military_02_a = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pbw_vs_safe_room_military_02_a_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_military_02_a_01",
			},
			sound_events_duration = {
				[1] = 4.8552918434143,
			},
		},
		pbw_vs_safe_room_military_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pbw_vs_safe_room_military_03_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_military_03_b_01",
			},
			sound_events_duration = {
				[1] = 2.8931040763855,
			},
		},
		pbw_vs_safe_room_military_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pbw_vs_safe_room_military_04_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_military_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.9088957309723,
			},
		},
		pbw_vs_safe_room_military_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pbw_vs_safe_room_military_05_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_military_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.6543333530426,
			},
		},
		pbw_vs_safe_room_military_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pbw_vs_safe_room_military_06_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_military_06_b_01",
			},
			sound_events_duration = {
				[1] = 3.4661874771118,
			},
		},
		pbw_vs_safe_room_military_07_a = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pbw_vs_safe_room_military_07_a_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_military_07_a_01",
			},
			sound_events_duration = {
				[1] = 4.2560000419617,
			},
		},
		pbw_vs_safe_room_military_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pbw_vs_safe_room_military_08_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_military_08_b_01",
			},
			sound_events_duration = {
				[1] = 4.211395740509,
			},
		},
		pbw_vs_safe_room_military_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pbw_vs_safe_room_military_09_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_military_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.637416601181,
			},
		},
		pbw_vs_safe_room_military_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pbw_vs_safe_room_military_10_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_military_10_b_01",
			},
			sound_events_duration = {
				[1] = 4.2537498474121,
			},
		},
		pdr_level_helmgart_military_courtyard_event_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pdr_level_helmgart_military_courtyard_event_01",
				"pdr_level_helmgart_military_courtyard_event_02",
				"pdr_level_helmgart_military_courtyard_event_03",
				"pdr_level_helmgart_military_courtyard_event_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_helmgart_military_courtyard_event_01",
				"pdr_level_helmgart_military_courtyard_event_02",
				"pdr_level_helmgart_military_courtyard_event_03",
				"pdr_level_helmgart_military_courtyard_event_04",
			},
			sound_events_duration = {
				2.7634792327881,
				5.0606250762939,
				2.527583360672,
				4.9257707595825,
			},
		},
		pdr_level_helmgart_military_door_opens_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pdr_level_helmgart_military_door_opens_01",
				"pdr_level_helmgart_military_door_opens_02",
				"pdr_level_helmgart_military_door_opens_03",
				"pdr_level_helmgart_military_door_opens_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_helmgart_military_door_opens_01",
				"pdr_level_helmgart_military_door_opens_02",
				"pdr_level_helmgart_military_door_opens_03",
				"pdr_level_helmgart_military_door_opens_04",
			},
			sound_events_duration = {
				2.6133542060852,
				3.1862916946411,
				3.7561249732971,
				3.5553958415985,
			},
		},
		pdr_level_helmgart_military_empty_town_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pdr_level_helmgart_military_empty_town_01",
				"pdr_level_helmgart_military_empty_town_02",
				"pdr_level_helmgart_military_empty_town_03",
				"pdr_level_helmgart_military_empty_town_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_helmgart_military_empty_town_01",
				"pdr_level_helmgart_military_empty_town_02",
				"pdr_level_helmgart_military_empty_town_03",
				"pdr_level_helmgart_military_empty_town_04",
			},
			sound_events_duration = {
				3.7899582386017,
				4.7538747787476,
				5.3006458282471,
				3.3939790725708,
			},
		},
		pdr_level_helmgart_military_fire_cannon_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pdr_level_helmgart_military_fire_cannon_01",
				"pdr_level_helmgart_military_fire_cannon_02",
				"pdr_level_helmgart_military_fire_cannon_03",
				"pdr_level_helmgart_military_fire_cannon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_helmgart_military_fire_cannon_01",
				"pdr_level_helmgart_military_fire_cannon_02",
				"pdr_level_helmgart_military_fire_cannon_03",
				"pdr_level_helmgart_military_fire_cannon_04",
			},
			sound_events_duration = {
				4.6996665000916,
				2.2576875686645,
				2.8654375076294,
				3.758645772934,
			},
		},
		pdr_level_helmgart_military_halfway_through_horde_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pdr_level_helmgart_military_halfway_through_horde_01",
				"pdr_level_helmgart_military_halfway_through_horde_02",
				"pdr_level_helmgart_military_halfway_through_horde_03",
				"pdr_level_helmgart_military_halfway_through_horde_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_helmgart_military_halfway_through_horde_01",
				"pdr_level_helmgart_military_halfway_through_horde_02",
				"pdr_level_helmgart_military_halfway_through_horde_03",
				"pdr_level_helmgart_military_halfway_through_horde_04",
			},
			sound_events_duration = {
				1.6504166126251,
				2.2209792137146,
				3.2572290897369,
				4.0632290840149,
			},
		},
		pdr_level_helmgart_military_ring_bell_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pdr_level_helmgart_military_ring_bell_01",
				"pdr_level_helmgart_military_ring_bell_02",
				"pdr_level_helmgart_military_ring_bell_03",
				"pdr_level_helmgart_military_ring_bell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_helmgart_military_ring_bell_01",
				"pdr_level_helmgart_military_ring_bell_02",
				"pdr_level_helmgart_military_ring_bell_03",
				"pdr_level_helmgart_military_ring_bell_04",
			},
			sound_events_duration = {
				2.1650416851044,
				2.6662499904633,
				3.4975416660309,
				2.9554374217987,
			},
		},
		pdr_level_helmgart_military_they_are_coming_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pdr_level_helmgart_military_they_are_coming_01",
				"pdr_level_helmgart_military_they_are_coming_02",
				"pdr_level_helmgart_military_they_are_coming_03",
				"pdr_level_helmgart_military_they_are_coming_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_helmgart_military_they_are_coming_01",
				"pdr_level_helmgart_military_they_are_coming_02",
				"pdr_level_helmgart_military_they_are_coming_03",
				"pdr_level_helmgart_military_they_are_coming_04",
			},
			sound_events_duration = {
				3.2921042442322,
				4.230103969574,
				4.7291874885559,
				4.3141875267029,
			},
		},
		pdr_level_helmgart_military_turn_cannon_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pdr_level_helmgart_military_turn_cannon_01",
				"pdr_level_helmgart_military_turn_cannon_02",
				"pdr_level_helmgart_military_turn_cannon_03",
				"pdr_level_helmgart_military_turn_cannon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_level_helmgart_military_turn_cannon_01",
				"pdr_level_helmgart_military_turn_cannon_02",
				"pdr_level_helmgart_military_turn_cannon_03",
				"pdr_level_helmgart_military_turn_cannon_04",
			},
			sound_events_duration = {
				4.8270831108093,
				4.0190415382385,
				4.0926876068115,
				4.4005417823792,
			},
		},
		pdr_vs_safe_room_military_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pdr_vs_safe_room_military_01_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_military_01_b_01",
			},
			sound_events_duration = {
				[1] = 2.8919999599457,
			},
		},
		pdr_vs_safe_room_military_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pdr_vs_safe_room_military_02_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_military_02_b_01",
			},
			sound_events_duration = {
				[1] = 2.3164167404175,
			},
		},
		pdr_vs_safe_room_military_03_a = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pdr_vs_safe_room_military_03_a_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_military_03_a_01",
			},
			sound_events_duration = {
				[1] = 3.3011040687561,
			},
		},
		pdr_vs_safe_room_military_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pdr_vs_safe_room_military_04_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_military_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.9873542785645,
			},
		},
		pdr_vs_safe_room_military_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pdr_vs_safe_room_military_05_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_military_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.1240832805634,
			},
		},
		pdr_vs_safe_room_military_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pdr_vs_safe_room_military_06_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_military_06_b_01",
			},
			sound_events_duration = {
				[1] = 3.4221041202545,
			},
		},
		pdr_vs_safe_room_military_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pdr_vs_safe_room_military_07_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_military_07_b_01",
			},
			sound_events_duration = {
				[1] = 4.2697081565857,
			},
		},
		pdr_vs_safe_room_military_08_a = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pdr_vs_safe_room_military_08_a_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_military_08_a_01",
			},
			sound_events_duration = {
				[1] = 3.141458272934,
			},
		},
		pdr_vs_safe_room_military_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pdr_vs_safe_room_military_09_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_military_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.3682084083557,
			},
		},
		pdr_vs_safe_room_military_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pdr_vs_safe_room_military_10_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_military_10_b_01",
			},
			sound_events_duration = {
				[1] = 4.9506039619446,
			},
		},
		pes_level_helmgart_military_courtyard_event_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pes_level_helmgart_military_courtyard_event_01",
				"pes_level_helmgart_military_courtyard_event_02",
				"pes_level_helmgart_military_courtyard_event_03",
				"pes_level_helmgart_military_courtyard_event_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_helmgart_military_courtyard_event_01",
				"pes_level_helmgart_military_courtyard_event_02",
				"pes_level_helmgart_military_courtyard_event_03",
				"pes_level_helmgart_military_courtyard_event_04",
			},
			sound_events_duration = {
				3.0221667289734,
				1.4870208501816,
				2.0821874141693,
				2.9092292785645,
			},
		},
		pes_level_helmgart_military_door_opens_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pes_level_helmgart_military_door_opens_01",
				"pes_level_helmgart_military_door_opens_02",
				"pes_level_helmgart_military_door_opens_03",
				"pes_level_helmgart_military_door_opens_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_helmgart_military_door_opens_01",
				"pes_level_helmgart_military_door_opens_02",
				"pes_level_helmgart_military_door_opens_03",
				"pes_level_helmgart_military_door_opens_04",
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
			},
		},
		pes_level_helmgart_military_empty_town_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pes_level_helmgart_military_empty_town_01",
				"pes_level_helmgart_military_empty_town_02",
				"pes_level_helmgart_military_empty_town_03",
				"pes_level_helmgart_military_empty_town_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_helmgart_military_empty_town_01",
				"pes_level_helmgart_military_empty_town_02",
				"pes_level_helmgart_military_empty_town_03",
				"pes_level_helmgart_military_empty_town_04",
			},
			sound_events_duration = {
				4.4623332023621,
				3.794041633606,
				3.3384375572205,
				2.7131667137146,
			},
		},
		pes_level_helmgart_military_fire_cannon_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pes_level_helmgart_military_fire_cannon_01",
				"pes_level_helmgart_military_fire_cannon_02",
				"pes_level_helmgart_military_fire_cannon_03",
				"pes_level_helmgart_military_fire_cannon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_helmgart_military_fire_cannon_01",
				"pes_level_helmgart_military_fire_cannon_02",
				"pes_level_helmgart_military_fire_cannon_03",
				"pes_level_helmgart_military_fire_cannon_04",
			},
			sound_events_duration = {
				2.4451251029968,
				2.2653748989105,
				2.016083240509,
				1.7268542051315,
			},
		},
		pes_level_helmgart_military_halfway_through_horde_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pes_level_helmgart_military_halfway_through_horde_01",
				"pes_level_helmgart_military_halfway_through_horde_02",
				"pes_level_helmgart_military_halfway_through_horde_03",
				"pes_level_helmgart_military_halfway_through_horde_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_helmgart_military_halfway_through_horde_01",
				"pes_level_helmgart_military_halfway_through_horde_02",
				"pes_level_helmgart_military_halfway_through_horde_03",
				"pes_level_helmgart_military_halfway_through_horde_04",
			},
			sound_events_duration = {
				1.5057708024979,
				1.2655416727066,
				1.2520416975021,
				1.5326042175293,
			},
		},
		pes_level_helmgart_military_ring_bell_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				[1] = "pes_level_helmgart_military_ring_bell_03",
				[2] = "pes_level_helmgart_military_ring_bell_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_helmgart_military_ring_bell_03",
				[2] = "pes_level_helmgart_military_ring_bell_04",
			},
			sound_events_duration = {
				[1] = 3.3825833797455,
				[2] = 1.7938541173935,
			},
		},
		pes_level_helmgart_military_they_are_coming_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pes_level_helmgart_military_they_are_coming_01",
				"pes_level_helmgart_military_they_are_coming_02",
				"pes_level_helmgart_military_they_are_coming_03",
				"pes_level_helmgart_military_they_are_coming_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_helmgart_military_they_are_coming_01",
				"pes_level_helmgart_military_they_are_coming_02",
				"pes_level_helmgart_military_they_are_coming_03",
				"pes_level_helmgart_military_they_are_coming_04",
			},
			sound_events_duration = {
				1.9290624856949,
				1.7779582738876,
				2.0611978769302,
				2.0568332672119,
			},
		},
		pes_level_helmgart_military_turn_cannon_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pes_level_helmgart_military_turn_cannon_01",
				"pes_level_helmgart_military_turn_cannon_02",
				"pes_level_helmgart_military_turn_cannon_03",
				"pes_level_helmgart_military_turn_cannon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_level_helmgart_military_turn_cannon_01",
				"pes_level_helmgart_military_turn_cannon_02",
				"pes_level_helmgart_military_turn_cannon_03",
				"pes_level_helmgart_military_turn_cannon_04",
			},
			sound_events_duration = {
				2.5670626163483,
				2.4896667003632,
				2.8720624446869,
				3.5803959369659,
			},
		},
		pes_vs_safe_room_military_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pes_vs_safe_room_military_01_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_military_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.5768959522247,
			},
		},
		pes_vs_safe_room_military_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pes_vs_safe_room_military_02_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_military_02_b_01",
			},
			sound_events_duration = {
				[1] = 2.6494584083557,
			},
		},
		pes_vs_safe_room_military_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pes_vs_safe_room_military_03_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_military_03_b_01",
			},
			sound_events_duration = {
				[1] = 5.036229133606,
			},
		},
		pes_vs_safe_room_military_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pes_vs_safe_room_military_04_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_military_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.7319166660309,
			},
		},
		pes_vs_safe_room_military_05_a = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pes_vs_safe_room_military_05_a_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_military_05_a_01",
			},
			sound_events_duration = {
				[1] = 1.8615208864212,
			},
		},
		pes_vs_safe_room_military_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pes_vs_safe_room_military_06_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_military_06_b_01",
			},
			sound_events_duration = {
				[1] = 3.6279582977295,
			},
		},
		pes_vs_safe_room_military_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pes_vs_safe_room_military_07_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_military_07_b_01",
			},
			sound_events_duration = {
				[1] = 2.5515832901001,
			},
		},
		pes_vs_safe_room_military_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pes_vs_safe_room_military_08_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_military_08_b_01",
			},
			sound_events_duration = {
				[1] = 3.333687543869,
			},
		},
		pes_vs_safe_room_military_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pes_vs_safe_room_military_09_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_military_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.8822708129883,
			},
		},
		pes_vs_safe_room_military_10_a = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pes_vs_safe_room_military_10_a_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_military_10_a_01",
			},
			sound_events_duration = {
				[1] = 3.4806876182556,
			},
		},
		pwe_level_helmgart_military_courtyard_event_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwe_level_helmgart_military_courtyard_event_01",
				"pwe_level_helmgart_military_courtyard_event_02",
				"pwe_level_helmgart_military_courtyard_event_03",
				"pwe_level_helmgart_military_courtyard_event_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_helmgart_military_courtyard_event_01",
				"pwe_level_helmgart_military_courtyard_event_02",
				"pwe_level_helmgart_military_courtyard_event_03",
				"pwe_level_helmgart_military_courtyard_event_04",
			},
			sound_events_duration = {
				3.8313958644867,
				2.447104215622,
				3.7882499694824,
				2.3091562986374,
			},
		},
		pwe_level_helmgart_military_door_opens_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwe_level_helmgart_military_door_opens_01",
				"pwe_level_helmgart_military_door_opens_02",
				"pwe_level_helmgart_military_door_opens_03",
				"pwe_level_helmgart_military_door_opens_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_helmgart_military_door_opens_01",
				"pwe_level_helmgart_military_door_opens_02",
				"pwe_level_helmgart_military_door_opens_03",
				"pwe_level_helmgart_military_door_opens_04",
			},
			sound_events_duration = {
				2.5517499446869,
				3.049124956131,
				2.5999999046326,
				2.7028748989105,
			},
		},
		pwe_level_helmgart_military_empty_town_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwe_level_helmgart_military_empty_town_01",
				"pwe_level_helmgart_military_empty_town_02",
				"pwe_level_helmgart_military_empty_town_03",
				"pwe_level_helmgart_military_empty_town_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_helmgart_military_empty_town_01",
				"pwe_level_helmgart_military_empty_town_02",
				"pwe_level_helmgart_military_empty_town_03",
				"pwe_level_helmgart_military_empty_town_04",
			},
			sound_events_duration = {
				2.8010001182556,
				4.3311877250671,
				2.7167499065399,
				5.5278539657593,
			},
		},
		pwe_level_helmgart_military_fire_cannon_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwe_level_helmgart_military_fire_cannon_01",
				"pwe_level_helmgart_military_fire_cannon_02",
				"pwe_level_helmgart_military_fire_cannon_03",
				"pwe_level_helmgart_military_fire_cannon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_helmgart_military_fire_cannon_01",
				"pwe_level_helmgart_military_fire_cannon_02",
				"pwe_level_helmgart_military_fire_cannon_03",
				"pwe_level_helmgart_military_fire_cannon_04",
			},
			sound_events_duration = {
				2.4308958053589,
				3.0527708530426,
				1.5434166193008,
				4.2070627212524,
			},
		},
		pwe_level_helmgart_military_halfway_through_horde_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwe_level_helmgart_military_halfway_through_horde_01",
				"pwe_level_helmgart_military_halfway_through_horde_02",
				"pwe_level_helmgart_military_halfway_through_horde_03",
				"pwe_level_helmgart_military_halfway_through_horde_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_helmgart_military_halfway_through_horde_01",
				"pwe_level_helmgart_military_halfway_through_horde_02",
				"pwe_level_helmgart_military_halfway_through_horde_03",
				"pwe_level_helmgart_military_halfway_through_horde_04",
			},
			sound_events_duration = {
				1.7365208864212,
				3.5887084007263,
				3.5839791297913,
				4.0229997634888,
			},
		},
		pwe_level_helmgart_military_ring_bell_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwe_level_helmgart_military_ring_bell_01",
				"pwe_level_helmgart_military_ring_bell_02",
				"pwe_level_helmgart_military_ring_bell_03",
				"pwe_level_helmgart_military_ring_bell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_helmgart_military_ring_bell_01",
				"pwe_level_helmgart_military_ring_bell_02",
				"pwe_level_helmgart_military_ring_bell_03",
				"pwe_level_helmgart_military_ring_bell_04",
			},
			sound_events_duration = {
				3.1982500553131,
				3.9574999809265,
				2.3229374885559,
				4.949812412262,
			},
		},
		pwe_level_helmgart_military_they_are_coming_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwe_level_helmgart_military_they_are_coming_01",
				"pwe_level_helmgart_military_they_are_coming_02",
				"pwe_level_helmgart_military_they_are_coming_03",
				"pwe_level_helmgart_military_they_are_coming_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_helmgart_military_they_are_coming_01",
				"pwe_level_helmgart_military_they_are_coming_02",
				"pwe_level_helmgart_military_they_are_coming_03",
				"pwe_level_helmgart_military_they_are_coming_04",
			},
			sound_events_duration = {
				1.7464791536331,
				1.7864270806313,
				3.3851249217987,
				3.5206875801086,
			},
		},
		pwe_level_helmgart_military_turn_cannon_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwe_level_helmgart_military_turn_cannon_01",
				"pwe_level_helmgart_military_turn_cannon_02",
				"pwe_level_helmgart_military_turn_cannon_03",
				"pwe_level_helmgart_military_turn_cannon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_helmgart_military_turn_cannon_01",
				"pwe_level_helmgart_military_turn_cannon_02",
				"pwe_level_helmgart_military_turn_cannon_03",
				"pwe_level_helmgart_military_turn_cannon_04",
			},
			sound_events_duration = {
				6.7195625305176,
				4.6693539619446,
				4.9003748893738,
				4.9588751792908,
			},
		},
		pwe_vs_safe_room_military_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwe_vs_safe_room_military_01_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_military_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.4403750896454,
			},
		},
		pwe_vs_safe_room_military_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwe_vs_safe_room_military_02_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_military_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.7795209884644,
			},
		},
		pwe_vs_safe_room_military_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwe_vs_safe_room_military_03_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_military_03_b_01",
			},
			sound_events_duration = {
				[1] = 5.396999835968,
			},
		},
		pwe_vs_safe_room_military_04_a = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwe_vs_safe_room_military_04_a_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_military_04_a_01",
			},
			sound_events_duration = {
				[1] = 3.4802708625794,
			},
		},
		pwe_vs_safe_room_military_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwe_vs_safe_room_military_05_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_military_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.7846667766571,
			},
		},
		pwe_vs_safe_room_military_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwe_vs_safe_room_military_06_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_military_06_b_01",
			},
			sound_events_duration = {
				[1] = 2.6802291870117,
			},
		},
		pwe_vs_safe_room_military_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwe_vs_safe_room_military_07_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_military_07_b_01",
			},
			sound_events_duration = {
				[1] = 3.829083442688,
			},
		},
		pwe_vs_safe_room_military_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwe_vs_safe_room_military_08_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_military_08_b_01",
			},
			sound_events_duration = {
				[1] = 4.2731876373291,
			},
		},
		pwe_vs_safe_room_military_09_a = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwe_vs_safe_room_military_09_a_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_military_09_a_01",
			},
			sound_events_duration = {
				[1] = 3.7917292118073,
			},
		},
		pwe_vs_safe_room_military_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwe_vs_safe_room_military_10_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_military_10_b_01",
			},
			sound_events_duration = {
				[1] = 2.3201875686645,
			},
		},
		pwh_level_helmgart_military_courtyard_event_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwh_level_helmgart_military_courtyard_event_01",
				"pwh_level_helmgart_military_courtyard_event_02",
				"pwh_level_helmgart_military_courtyard_event_03",
				"pwh_level_helmgart_military_courtyard_event_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_helmgart_military_courtyard_event_01",
				"pwh_level_helmgart_military_courtyard_event_02",
				"pwh_level_helmgart_military_courtyard_event_03",
				"pwh_level_helmgart_military_courtyard_event_04",
			},
			sound_events_duration = {
				2.8777709007263,
				3.5144791603088,
				3.5273542404175,
				4.8129167556763,
			},
		},
		pwh_level_helmgart_military_door_opens_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwh_level_helmgart_military_door_opens_01",
				"pwh_level_helmgart_military_door_opens_02",
				"pwh_level_helmgart_military_door_opens_03",
				"pwh_level_helmgart_military_door_opens_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_helmgart_military_door_opens_01",
				"pwh_level_helmgart_military_door_opens_02",
				"pwh_level_helmgart_military_door_opens_03",
				"pwh_level_helmgart_military_door_opens_04",
			},
			sound_events_duration = {
				2.5231666564941,
				1.3234167098999,
				2.8141667842865,
				2.5940001010895,
			},
		},
		pwh_level_helmgart_military_empty_town_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwh_level_helmgart_military_empty_town_01",
				"pwh_level_helmgart_military_empty_town_02",
				"pwh_level_helmgart_military_empty_town_03",
				"pwh_level_helmgart_military_empty_town_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_helmgart_military_empty_town_01",
				"pwh_level_helmgart_military_empty_town_02",
				"pwh_level_helmgart_military_empty_town_03",
				"pwh_level_helmgart_military_empty_town_04",
			},
			sound_events_duration = {
				4.4033331871033,
				3.1399791240692,
				4.1536250114441,
				3.6559791564941,
			},
		},
		pwh_level_helmgart_military_fire_cannon_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwh_level_helmgart_military_fire_cannon_01",
				"pwh_level_helmgart_military_fire_cannon_02",
				"pwh_level_helmgart_military_fire_cannon_03",
				"pwh_level_helmgart_military_fire_cannon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_helmgart_military_fire_cannon_01",
				"pwh_level_helmgart_military_fire_cannon_02",
				"pwh_level_helmgart_military_fire_cannon_03",
				"pwh_level_helmgart_military_fire_cannon_04",
			},
			sound_events_duration = {
				4.589729309082,
				4.7250208854675,
				3.2835624217987,
				4.1397914886475,
			},
		},
		pwh_level_helmgart_military_halfway_through_horde_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwh_level_helmgart_military_halfway_through_horde_01",
				"pwh_level_helmgart_military_halfway_through_horde_02",
				"pwh_level_helmgart_military_halfway_through_horde_03",
				"pwh_level_helmgart_military_halfway_through_horde_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_helmgart_military_halfway_through_horde_01",
				"pwh_level_helmgart_military_halfway_through_horde_02",
				"pwh_level_helmgart_military_halfway_through_horde_03",
				"pwh_level_helmgart_military_halfway_through_horde_04",
			},
			sound_events_duration = {
				1.4448750019074,
				3.8711249828339,
				4.8889374732971,
				2.89097905159,
			},
		},
		pwh_level_helmgart_military_ring_bell_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwh_level_helmgart_military_ring_bell_01",
				"pwh_level_helmgart_military_ring_bell_02",
				"pwh_level_helmgart_military_ring_bell_03",
				"pwh_level_helmgart_military_ring_bell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_helmgart_military_ring_bell_01",
				"pwh_level_helmgart_military_ring_bell_02",
				"pwh_level_helmgart_military_ring_bell_03",
				"pwh_level_helmgart_military_ring_bell_04",
			},
			sound_events_duration = {
				3.9284999370575,
				3.7051041126251,
				3.7415416240692,
				4.2974791526794,
			},
		},
		pwh_level_helmgart_military_they_are_coming_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwh_level_helmgart_military_they_are_coming_01",
				"pwh_level_helmgart_military_they_are_coming_02",
				"pwh_level_helmgart_military_they_are_coming_03",
				"pwh_level_helmgart_military_they_are_coming_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_helmgart_military_they_are_coming_01",
				"pwh_level_helmgart_military_they_are_coming_02",
				"pwh_level_helmgart_military_they_are_coming_03",
				"pwh_level_helmgart_military_they_are_coming_04",
			},
			sound_events_duration = {
				2.0539166927338,
				2.2517082691193,
				1.4111042022705,
				3.1251666545868,
			},
		},
		pwh_level_helmgart_military_turn_cannon_PVP = {
			category = "level_talk",
			database = "vs_level_military_pvp",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pwh_level_helmgart_military_turn_cannon_01",
				"pwh_level_helmgart_military_turn_cannon_02",
				"pwh_level_helmgart_military_turn_cannon_03",
				"pwh_level_helmgart_military_turn_cannon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_helmgart_military_turn_cannon_01",
				"pwh_level_helmgart_military_turn_cannon_02",
				"pwh_level_helmgart_military_turn_cannon_03",
				"pwh_level_helmgart_military_turn_cannon_04",
			},
			sound_events_duration = {
				4.9067707061768,
				2.6700208187103,
				4.8180832862854,
				4.8460831642151,
			},
		},
		pwh_vs_safe_room_military_01_a = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwh_vs_safe_room_military_01_a_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_military_01_a_01",
			},
			sound_events_duration = {
				[1] = 3.9111874103546,
			},
		},
		pwh_vs_safe_room_military_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwh_vs_safe_room_military_02_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_military_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.3239998817444,
			},
		},
		pwh_vs_safe_room_military_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwh_vs_safe_room_military_03_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_military_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.6083126068115,
			},
		},
		pwh_vs_safe_room_military_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwh_vs_safe_room_military_04_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_military_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.8280000686645,
			},
		},
		pwh_vs_safe_room_military_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwh_vs_safe_room_military_05_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_military_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.7250626087189,
			},
		},
		pwh_vs_safe_room_military_06_a = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwh_vs_safe_room_military_06_a_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_military_06_a_01",
			},
			sound_events_duration = {
				[1] = 5.4216456413269,
			},
		},
		pwh_vs_safe_room_military_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwh_vs_safe_room_military_07_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_military_07_b_01",
			},
			sound_events_duration = {
				[1] = 4.7352914810181,
			},
		},
		pwh_vs_safe_room_military_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwh_vs_safe_room_military_08_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_military_08_b_01",
			},
			sound_events_duration = {
				[1] = 5.2754998207092,
			},
		},
		pwh_vs_safe_room_military_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwh_vs_safe_room_military_09_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_military_09_b_01",
			},
			sound_events_duration = {
				[1] = 4.8056664466858,
			},
		},
		pwh_vs_safe_room_military_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_military_pvp",
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
				[1] = "pwh_vs_safe_room_military_10_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_military_10_b_01",
			},
			sound_events_duration = {
				[1] = 3.0776875019074,
			},
		},
	})
end
