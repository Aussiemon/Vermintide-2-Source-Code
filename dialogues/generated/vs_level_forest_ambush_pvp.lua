-- chunkname: @dialogues/generated/vs_level_forest_ambush_pvp.lua

return function ()
	define_rule({
		name = "nde_vs_forest_ambush_set1_briefing_a",
		probability = 1,
		response = "nde_vs_forest_ambush_set1_briefing_a",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set1_obj1_a",
		probability = 1,
		response = "nde_vs_forest_ambush_set1_obj1_a",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set1_obj1_reached",
		probability = 1,
		response = "nde_vs_forest_ambush_set1_obj1_reached",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set1_obj2_a",
		probability = 1,
		response = "nde_vs_forest_ambush_set1_obj2_a",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set1_obj2_reached_p1",
		probability = 1,
		response = "nde_vs_forest_ambush_set1_obj2_reached_p1",
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
				"forest_ambush_pvp",
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
			{
				"global_context",
				"objective_part",
				OP.EQ,
				1,
			},
		},
	})
	define_rule({
		name = "nde_vs_forest_ambush_set1_obj2_reached_p2",
		probability = 1,
		response = "nde_vs_forest_ambush_set1_obj2_reached_p2",
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
				"forest_ambush_pvp",
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
			{
				"global_context",
				"objective_part",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "nde_vs_forest_ambush_set2_obj1_a",
		probability = 1,
		response = "nde_vs_forest_ambush_set2_obj1_a",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set2_obj1_reached",
		probability = 1,
		response = "nde_vs_forest_ambush_set2_obj1_reached",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set2_obj2_a",
		probability = 1,
		response = "nde_vs_forest_ambush_set2_obj2_a",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set2_obj2_reached",
		probability = 1,
		response = "nde_vs_forest_ambush_set2_obj2_reached",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set2_obj3_reached",
		probability = 1,
		response = "nde_vs_forest_ambush_set2_obj3_reached",
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
				"forest_ambush_pvp",
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
				"three",
			},
		},
	})
	define_rule({
		name = "nde_vs_forest_ambush_set3_obj1_a",
		probability = 1,
		response = "nde_vs_forest_ambush_set3_obj1_a",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set3_obj1_reached_new",
		probability = 1,
		response = "nde_vs_forest_ambush_set3_obj1_reached_new",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set3_obj2_a",
		probability = 1,
		response = "nde_vs_forest_ambush_set3_obj2_a",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set3_obj2_reached",
		probability = 1,
		response = "nde_vs_forest_ambush_set3_obj2_reached",
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
				"forest_ambush_pvp",
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
		name = "nde_vs_forest_ambush_set3_obj2_reminder",
		probability = 1,
		response = "nde_vs_forest_ambush_set3_obj2_reminder",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_almost_completed",
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
				"forest_ambush_pvp",
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
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_boat_arrives_PVP",
		probability = 1,
		response = "pbw_objective_forest_ambush_boat_arrives_PVP",
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
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_doomwheel_objective_done_PVP",
		probability = 1,
		response = "pbw_objective_forest_ambush_doomwheel_objective_done_PVP",
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
				"nde_vs_forest_ambush_set2_obj2_a",
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
		name = "pbw_objective_forest_ambush_reaching_skaven_camp_PVP",
		probability = 1,
		response = "pbw_objective_forest_ambush_reaching_skaven_camp_PVP",
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
				"nde_vs_forest_ambush_set2_obj1_reached",
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
		name = "pbw_objective_forest_ambush_ring_bell_PVP",
		probability = 1,
		response = "pbw_objective_forest_ambush_ring_bell_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"forest_ambush_ring_bell",
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
				"forest_ambush_ring_bell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"forest_ambush_ring_bell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_spotting_bridge_PVP",
		probability = 1,
		response = "pbw_objective_forest_ambush_spotting_bridge_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"forest_ambush_spotting_bridge",
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
				"time_since_forest_ambush_spotting_bridge",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_bridge",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_vs_safe_room_forest_ambush_01_b",
		probability = 1,
		response = "pbw_vs_safe_room_forest_ambush_01_b",
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
				"pwh_vs_safe_room_forest_ambush_01_a",
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
		name = "pbw_vs_safe_room_forest_ambush_02_a",
		probability = 1,
		response = "pbw_vs_safe_room_forest_ambush_02_a",
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
				"nde_vs_forest_ambush_set1_briefing_a",
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
				"forest_ambush_pvp",
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
		name = "pbw_vs_safe_room_forest_ambush_03_b",
		probability = 1,
		response = "pbw_vs_safe_room_forest_ambush_03_b",
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
				"pdr_vs_safe_room_forest_ambush_03_a",
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
		name = "pbw_vs_safe_room_forest_ambush_04_b",
		probability = 1,
		response = "pbw_vs_safe_room_forest_ambush_04_b",
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
				"pwe_vs_safe_room_forest_ambush_04_a",
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
		name = "pbw_vs_safe_room_forest_ambush_05_b",
		probability = 1,
		response = "pbw_vs_safe_room_forest_ambush_05_b",
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
				"pes_vs_safe_room_forest_ambush_05_a",
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
		name = "pbw_vs_safe_room_forest_ambush_06_b",
		probability = 1,
		response = "pbw_vs_safe_room_forest_ambush_06_b",
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
				"pwh_vs_safe_room_forest_ambush_06_a",
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
		name = "pbw_vs_safe_room_forest_ambush_07_a",
		probability = 1,
		response = "pbw_vs_safe_room_forest_ambush_07_a",
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
				"nde_vs_forest_ambush_set1_briefing_a",
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
				"forest_ambush_pvp",
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
		name = "pbw_vs_safe_room_forest_ambush_08_b",
		probability = 1,
		response = "pbw_vs_safe_room_forest_ambush_08_b",
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
				"pdr_vs_safe_room_forest_ambush_08_a",
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
		name = "pbw_vs_safe_room_forest_ambush_09_b",
		probability = 1,
		response = "pbw_vs_safe_room_forest_ambush_09_b",
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
				"pwe_vs_safe_room_forest_ambush_09_a",
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
		name = "pbw_vs_safe_room_forest_ambush_10_b",
		probability = 1,
		response = "pbw_vs_safe_room_forest_ambush_10_b",
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
				"pes_vs_safe_room_forest_ambush_10_a",
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
		name = "pdr_objective_forest_ambush_boat_arrives_PVP",
		probability = 1,
		response = "pdr_objective_forest_ambush_boat_arrives_PVP",
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
		},
	})
	define_rule({
		name = "pdr_objective_forest_ambush_doomwheel_objective_done_PVP",
		probability = 1,
		response = "pdr_objective_forest_ambush_doomwheel_objective_done_PVP",
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
				"nde_vs_forest_ambush_set2_obj2_a",
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
		name = "pdr_objective_forest_ambush_reaching_skaven_camp_PVP",
		probability = 1,
		response = "pdr_objective_forest_ambush_reaching_skaven_camp_PVP",
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
				"nde_vs_forest_ambush_set2_obj1_reached",
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
		name = "pdr_objective_forest_ambush_ring_bell_PVP",
		probability = 1,
		response = "pdr_objective_forest_ambush_ring_bell_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"forest_ambush_ring_bell",
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
				"forest_ambush_ring_bell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"forest_ambush_ring_bell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_objective_forest_ambush_spotting_bridge_PVP",
		probability = 1,
		response = "pdr_objective_forest_ambush_spotting_bridge_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"forest_ambush_spotting_bridge",
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
				"time_since_forest_ambush_spotting_bridge",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_bridge",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_vs_safe_room_forest_ambush_01_b",
		probability = 1,
		response = "pdr_vs_safe_room_forest_ambush_01_b",
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
				"pwh_vs_safe_room_forest_ambush_01_a",
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
		name = "pdr_vs_safe_room_forest_ambush_02_b",
		probability = 1,
		response = "pdr_vs_safe_room_forest_ambush_02_b",
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
				"pbw_vs_safe_room_forest_ambush_02_a",
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
		name = "pdr_vs_safe_room_forest_ambush_03_a",
		probability = 1,
		response = "pdr_vs_safe_room_forest_ambush_03_a",
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
				"nde_vs_forest_ambush_set1_briefing_a",
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
				"forest_ambush_pvp",
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
		name = "pdr_vs_safe_room_forest_ambush_04_b",
		probability = 1,
		response = "pdr_vs_safe_room_forest_ambush_04_b",
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
				"pwe_vs_safe_room_forest_ambush_04_a",
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
		name = "pdr_vs_safe_room_forest_ambush_05_b",
		probability = 1,
		response = "pdr_vs_safe_room_forest_ambush_05_b",
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
				"pes_vs_safe_room_forest_ambush_05_a",
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
		name = "pdr_vs_safe_room_forest_ambush_06_b",
		probability = 1,
		response = "pdr_vs_safe_room_forest_ambush_06_b",
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
				"pwh_vs_safe_room_forest_ambush_06_a",
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
		name = "pdr_vs_safe_room_forest_ambush_07_b",
		probability = 1,
		response = "pdr_vs_safe_room_forest_ambush_07_b",
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
				"pbw_vs_safe_room_forest_ambush_07_a",
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
		name = "pdr_vs_safe_room_forest_ambush_08_a",
		probability = 1,
		response = "pdr_vs_safe_room_forest_ambush_08_a",
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
				"nde_vs_forest_ambush_set1_briefing_a",
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
				"forest_ambush_pvp",
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
		name = "pdr_vs_safe_room_forest_ambush_09_b",
		probability = 1,
		response = "pdr_vs_safe_room_forest_ambush_09_b",
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
				"pwe_vs_safe_room_forest_ambush_09_a",
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
		name = "pdr_vs_safe_room_forest_ambush_10_b",
		probability = 1,
		response = "pdr_vs_safe_room_forest_ambush_10_b",
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
				"pes_vs_safe_room_forest_ambush_10_a",
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
		name = "pes_objective_forest_ambush_boat_arrives_PVP",
		probability = 1,
		response = "pes_objective_forest_ambush_boat_arrives_PVP",
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
		},
	})
	define_rule({
		name = "pes_objective_forest_ambush_doomwheel_objective_done_PVP",
		probability = 1,
		response = "pes_objective_forest_ambush_doomwheel_objective_done_PVP",
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
				"nde_vs_forest_ambush_set2_obj2_a",
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
		name = "pes_objective_forest_ambush_spotting_bridge_PVP",
		probability = 1,
		response = "pes_objective_forest_ambush_spotting_bridge_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"forest_ambush_spotting_bridge",
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
				"time_since_forest_ambush_spotting_bridge",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_bridge",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_vs_safe_room_forest_ambush_01_b",
		probability = 1,
		response = "pes_vs_safe_room_forest_ambush_01_b",
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
				"pwh_vs_safe_room_forest_ambush_01_a",
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
		name = "pes_vs_safe_room_forest_ambush_02_b",
		probability = 1,
		response = "pes_vs_safe_room_forest_ambush_02_b",
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
				"pbw_vs_safe_room_forest_ambush_02_a",
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
		name = "pes_vs_safe_room_forest_ambush_03_b",
		probability = 1,
		response = "pes_vs_safe_room_forest_ambush_03_b",
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
				"pdr_vs_safe_room_forest_ambush_03_a",
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
		name = "pes_vs_safe_room_forest_ambush_04_b",
		probability = 1,
		response = "pes_vs_safe_room_forest_ambush_04_b",
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
				"pwe_vs_safe_room_forest_ambush_04_a",
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
		name = "pes_vs_safe_room_forest_ambush_05_a",
		probability = 1,
		response = "pes_vs_safe_room_forest_ambush_05_a",
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
				"nde_vs_forest_ambush_set1_briefing_a",
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
				"forest_ambush_pvp",
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
		name = "pes_vs_safe_room_forest_ambush_06_b",
		probability = 1,
		response = "pes_vs_safe_room_forest_ambush_06_b",
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
				"pwh_vs_safe_room_forest_ambush_06_a",
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
		name = "pes_vs_safe_room_forest_ambush_07_b",
		probability = 1,
		response = "pes_vs_safe_room_forest_ambush_07_b",
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
				"pbw_vs_safe_room_forest_ambush_07_a",
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
		name = "pes_vs_safe_room_forest_ambush_08_b",
		probability = 1,
		response = "pes_vs_safe_room_forest_ambush_08_b",
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
				"pdr_vs_safe_room_forest_ambush_08_a",
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
		name = "pes_vs_safe_room_forest_ambush_09_b",
		probability = 1,
		response = "pes_vs_safe_room_forest_ambush_09_b",
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
				"pwe_vs_safe_room_forest_ambush_09_a",
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
		name = "pes_vs_safe_room_forest_ambush_10_a",
		probability = 1,
		response = "pes_vs_safe_room_forest_ambush_10_a",
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
				"nde_vs_forest_ambush_set1_briefing_a",
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
				"forest_ambush_pvp",
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
		name = "pwe_objective_forest_ambush_boat_arrives_PVP",
		probability = 1,
		response = "pwe_objective_forest_ambush_boat_arrives_PVP",
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
		},
	})
	define_rule({
		name = "pwe_objective_forest_ambush_doomwheel_objective_done_PVP",
		probability = 1,
		response = "pwe_objective_forest_ambush_doomwheel_objective_done_PVP",
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
				"nde_vs_forest_ambush_set2_obj2_a",
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
		name = "pwe_objective_forest_ambush_reaching_skaven_camp_PVP",
		probability = 1,
		response = "pwe_objective_forest_ambush_reaching_skaven_camp_PVP",
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
				"nde_vs_forest_ambush_set2_obj1_reached",
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
		name = "pwe_objective_forest_ambush_ring_bell_PVP",
		probability = 1,
		response = "pwe_objective_forest_ambush_ring_bell_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"forest_ambush_ring_bell",
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
				"forest_ambush_ring_bell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"forest_ambush_ring_bell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_objective_forest_ambush_spotting_bridge_PVP",
		probability = 1,
		response = "pwe_objective_forest_ambush_spotting_bridge_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"forest_ambush_spotting_bridge",
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
				"time_since_forest_ambush_spotting_bridge",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_bridge",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_vs_safe_room_forest_ambush_01_b",
		probability = 1,
		response = "pwe_vs_safe_room_forest_ambush_01_b",
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
				"pwh_vs_safe_room_forest_ambush_01_a",
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
		name = "pwe_vs_safe_room_forest_ambush_02_b",
		probability = 1,
		response = "pwe_vs_safe_room_forest_ambush_02_b",
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
				"pbw_vs_safe_room_forest_ambush_02_a",
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
		name = "pwe_vs_safe_room_forest_ambush_03_b",
		probability = 1,
		response = "pwe_vs_safe_room_forest_ambush_03_b",
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
				"pdr_vs_safe_room_forest_ambush_03_a",
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
		name = "pwe_vs_safe_room_forest_ambush_04_a",
		probability = 1,
		response = "pwe_vs_safe_room_forest_ambush_04_a",
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
				"nde_vs_forest_ambush_set1_briefing_a",
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
				"forest_ambush_pvp",
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
		name = "pwe_vs_safe_room_forest_ambush_05_b",
		probability = 1,
		response = "pwe_vs_safe_room_forest_ambush_05_b",
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
				"pes_vs_safe_room_forest_ambush_05_a",
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
		name = "pwe_vs_safe_room_forest_ambush_06_b",
		probability = 1,
		response = "pwe_vs_safe_room_forest_ambush_06_b",
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
				"pwh_vs_safe_room_forest_ambush_06_a",
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
		name = "pwe_vs_safe_room_forest_ambush_07_b",
		probability = 1,
		response = "pwe_vs_safe_room_forest_ambush_07_b",
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
				"pbw_vs_safe_room_forest_ambush_07_a",
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
		name = "pwe_vs_safe_room_forest_ambush_08_b",
		probability = 1,
		response = "pwe_vs_safe_room_forest_ambush_08_b",
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
				"pdr_vs_safe_room_forest_ambush_08_a",
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
		name = "pwe_vs_safe_room_forest_ambush_09_a",
		probability = 1,
		response = "pwe_vs_safe_room_forest_ambush_09_a",
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
				"nde_vs_forest_ambush_set1_briefing_a",
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
				"forest_ambush_pvp",
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
		name = "pwe_vs_safe_room_forest_ambush_10_b",
		probability = 1,
		response = "pwe_vs_safe_room_forest_ambush_10_b",
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
				"pes_vs_safe_room_forest_ambush_10_a",
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
		name = "pwh_objective_forest_ambush_boat_arrives_PVP",
		probability = 1,
		response = "pwh_objective_forest_ambush_boat_arrives_PVP",
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
		},
	})
	define_rule({
		name = "pwh_objective_forest_ambush_doomwheel_objective_done_PVP",
		probability = 1,
		response = "pwh_objective_forest_ambush_doomwheel_objective_done_PVP",
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
				"nde_vs_forest_ambush_set2_obj2_a",
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
		name = "pwh_objective_forest_ambush_reaching_skaven_camp_PVP",
		probability = 1,
		response = "pwh_objective_forest_ambush_reaching_skaven_camp_PVP",
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
				"nde_vs_forest_ambush_set2_obj1_reached",
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
		name = "pwh_objective_forest_ambush_ring_bell_PVP",
		probability = 1,
		response = "pwh_objective_forest_ambush_ring_bell_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"forest_ambush_ring_bell",
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
				"forest_ambush_ring_bell",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"forest_ambush_ring_bell",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_objective_forest_ambush_spotting_bridge_PVP",
		probability = 1,
		response = "pwh_objective_forest_ambush_spotting_bridge_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"forest_ambush_spotting_bridge",
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
				"time_since_forest_ambush_spotting_bridge",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_bridge",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_vs_safe_room_forest_ambush_01_a",
		probability = 1,
		response = "pwh_vs_safe_room_forest_ambush_01_a",
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
				"nde_vs_forest_ambush_set1_briefing_a",
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
				"forest_ambush_pvp",
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
		name = "pwh_vs_safe_room_forest_ambush_02_b",
		probability = 1,
		response = "pwh_vs_safe_room_forest_ambush_02_b",
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
				"pbw_vs_safe_room_forest_ambush_02_a",
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
		name = "pwh_vs_safe_room_forest_ambush_03_b",
		probability = 1,
		response = "pwh_vs_safe_room_forest_ambush_03_b",
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
				"pdr_vs_safe_room_forest_ambush_03_a",
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
		name = "pwh_vs_safe_room_forest_ambush_04_b",
		probability = 1,
		response = "pwh_vs_safe_room_forest_ambush_04_b",
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
				"pwe_vs_safe_room_forest_ambush_04_a",
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
		name = "pwh_vs_safe_room_forest_ambush_05_b",
		probability = 1,
		response = "pwh_vs_safe_room_forest_ambush_05_b",
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
				"pes_vs_safe_room_forest_ambush_05_a",
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
		name = "pwh_vs_safe_room_forest_ambush_06_a",
		probability = 1,
		response = "pwh_vs_safe_room_forest_ambush_06_a",
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
				"nde_vs_forest_ambush_set1_briefing_a",
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
				"forest_ambush_pvp",
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
		name = "pwh_vs_safe_room_forest_ambush_07_b",
		probability = 1,
		response = "pwh_vs_safe_room_forest_ambush_07_b",
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
				"pbw_vs_safe_room_forest_ambush_07_a",
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
		name = "pwh_vs_safe_room_forest_ambush_08_b",
		probability = 1,
		response = "pwh_vs_safe_room_forest_ambush_08_b",
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
				"pdr_vs_safe_room_forest_ambush_08_a",
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
		name = "pwh_vs_safe_room_forest_ambush_09_b",
		probability = 1,
		response = "pwh_vs_safe_room_forest_ambush_09_b",
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
				"pwe_vs_safe_room_forest_ambush_09_a",
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
		name = "pwh_vs_safe_room_forest_ambush_10_b",
		probability = 1,
		response = "pwh_vs_safe_room_forest_ambush_10_b",
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
				"pes_vs_safe_room_forest_ambush_10_a",
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
		nde_vs_forest_ambush_set1_briefing_a = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"nde_vs_forest_ambush_set1_briefing_a_01",
				"nde_vs_forest_ambush_set1_briefing_a_02",
				"nde_vs_forest_ambush_set1_briefing_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_vs_forest_ambush_set1_briefing_a_01",
				"nde_vs_forest_ambush_set1_briefing_a_02",
				"nde_vs_forest_ambush_set1_briefing_a_03",
			},
			sound_events_duration = {
				8.1607704162598,
				8.0519371032715,
				8.2905206680298,
			},
		},
		nde_vs_forest_ambush_set1_obj1_a = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"nde_vs_forest_ambush_set1_obj1_a_01",
				"nde_vs_forest_ambush_set1_obj1_a_02",
				"nde_vs_forest_ambush_set1_obj1_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_forest_ambush_set1_obj1_a_01",
				"nde_vs_forest_ambush_set1_obj1_a_02",
				"nde_vs_forest_ambush_set1_obj1_a_03",
			},
			sound_events_duration = {
				3.2593748569488,
				3.8113958835602,
				2.860687494278,
			},
		},
		nde_vs_forest_ambush_set1_obj1_reached = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"nde_vs_farmlands_set1_obj1_event_a_01",
				"nde_vs_farmlands_set1_obj1_event_a_02",
				"nde_vs_farmlands_set1_obj1_event_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_farmlands_set1_obj1_event_a_01",
				"nde_vs_farmlands_set1_obj1_event_a_02",
				"nde_vs_farmlands_set1_obj1_event_a_03",
			},
			sound_events_duration = {
				5.1456670761108,
				5.2193541526794,
				6.0405416488647,
			},
		},
		nde_vs_forest_ambush_set1_obj2_a = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
		nde_vs_forest_ambush_set1_obj2_reached_p1 = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			only_allies = true,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "nde_vs_forest_ambush_set1_obj2_event_a_a_02",
			},
			sound_events = {
				[1] = "nde_vs_forest_ambush_set1_obj2_event_a_a_02",
			},
			sound_events_duration = {
				[1] = 5.2410001754761,
			},
		},
		nde_vs_forest_ambush_set1_obj2_reached_p2 = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"nde_vs_forest_ambush_set1_obj2_event_b_a_01",
				"nde_vs_forest_ambush_set1_obj2_event_b_a_02",
				"nde_vs_forest_ambush_set1_obj2_event_b_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_forest_ambush_set1_obj2_event_b_a_01",
				"nde_vs_forest_ambush_set1_obj2_event_b_a_02",
				"nde_vs_forest_ambush_set1_obj2_event_b_a_03",
			},
			sound_events_duration = {
				3.9665207862854,
				3.9409999847412,
				4.853000164032,
			},
		},
		nde_vs_forest_ambush_set2_obj1_a = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"nde_vs_forest_ambush_set2_obj1_a_01",
				"nde_vs_forest_ambush_set2_obj1_a_02",
				"nde_vs_forest_ambush_set2_obj1_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_forest_ambush_set2_obj1_a_01",
				"nde_vs_forest_ambush_set2_obj1_a_02",
				"nde_vs_forest_ambush_set2_obj1_a_03",
			},
			sound_events_duration = {
				6.8304586410522,
				5.6022295951843,
				4.2249999046326,
			},
		},
		nde_vs_forest_ambush_set2_obj1_reached = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
			dialogue_animations_n = 5,
			face_animations_n = 5,
			only_allies = true,
			randomize_indexes_n = 0,
			sound_events_n = 5,
			dialogue_animations = {
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
			},
			localization_strings = {
				"nde_vs_agnostic_destroy_doomwheels_a_01",
				"nde_vs_agnostic_destroy_doomwheels_a_02",
				"nde_vs_agnostic_destroy_doomwheels_a_03",
				"nde_vs_agnostic_destroy_doomwheels_a_04",
				"nde_vs_agnostic_destroy_doomwheels_a_05",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_vs_agnostic_destroy_doomwheels_a_01",
				"nde_vs_agnostic_destroy_doomwheels_a_02",
				"nde_vs_agnostic_destroy_doomwheels_a_03",
				"nde_vs_agnostic_destroy_doomwheels_a_04",
				"nde_vs_agnostic_destroy_doomwheels_a_05",
			},
			sound_events_duration = {
				4.2600002288818,
				3.7009999752045,
				3.7269999980927,
				4.0069999694824,
				4.8800001144409,
			},
		},
		nde_vs_forest_ambush_set2_obj2_a = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
			sound_distance = math.huge,
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
		nde_vs_forest_ambush_set2_obj2_reached = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"nde_vs_forest_ambush_set2_obj2_event_a_01",
				"nde_vs_forest_ambush_set2_obj2_event_a_02",
				"nde_vs_forest_ambush_set2_obj2_event_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_forest_ambush_set2_obj2_event_a_01",
				"nde_vs_forest_ambush_set2_obj2_event_a_02",
				"nde_vs_forest_ambush_set2_obj2_event_a_03",
			},
			sound_events_duration = {
				5.0940003395081,
				3.5729999542236,
				3.7289998531342,
			},
		},
		nde_vs_forest_ambush_set2_obj3_reached = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"nde_vs_forest_ambush_set1_obj1_event_a_01",
				"nde_vs_forest_ambush_set1_obj1_event_a_02",
				"nde_vs_forest_ambush_set1_obj1_event_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_forest_ambush_set1_obj1_event_a_01",
				"nde_vs_forest_ambush_set1_obj1_event_a_02",
				"nde_vs_forest_ambush_set1_obj1_event_a_03",
			},
			sound_events_duration = {
				3.5812706947327,
				3.3199999332428,
				3.7333958148956,
			},
		},
		nde_vs_forest_ambush_set3_obj1_a = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"nde_vs_forest_ambush_set3_obj1_a_01",
				"nde_vs_forest_ambush_set3_obj1_a_02",
				"nde_vs_forest_ambush_set3_obj1_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_forest_ambush_set3_obj1_a_01",
				"nde_vs_forest_ambush_set3_obj1_a_02",
				"nde_vs_forest_ambush_set3_obj1_a_03",
			},
			sound_events_duration = {
				5.1555004119873,
				5.9861874580383,
				4.5,
			},
		},
		nde_vs_forest_ambush_set3_obj1_reached_new = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
		nde_vs_forest_ambush_set3_obj2_a = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
		nde_vs_forest_ambush_set3_obj2_reached = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"nde_vs_forest_ambush_set3_obj1_event_a_01",
				"nde_vs_forest_ambush_set3_obj1_event_a_02",
				"nde_vs_forest_ambush_set3_obj1_event_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_forest_ambush_set3_obj1_event_a_01",
				"nde_vs_forest_ambush_set3_obj1_event_a_02",
				"nde_vs_forest_ambush_set3_obj1_event_a_03",
			},
			sound_events_duration = {
				3.7241666316986,
				4.6360626220703,
				4.341166973114,
			},
		},
		nde_vs_forest_ambush_set3_obj2_reminder = {
			category = "npc_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"nde_vs_agnostic_survive_a_01",
				"nde_vs_agnostic_survive_a_02",
				"nde_vs_agnostic_survive_a_03",
				"nde_vs_agnostic_survive_a_04",
				"nde_vs_agnostic_survive_a_05",
				"nde_vs_agnostic_survive_a_06",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_agnostic_survive_a_01",
				"nde_vs_agnostic_survive_a_02",
				"nde_vs_agnostic_survive_a_03",
				"nde_vs_agnostic_survive_a_04",
				"nde_vs_agnostic_survive_a_05",
				"nde_vs_agnostic_survive_a_06",
			},
			sound_events_duration = {
				3.1959998607635,
				3.4609999656677,
				3.7438750267029,
				3.0457499027252,
				3.0737082958221,
				5.335000038147,
			},
		},
		pbw_objective_forest_ambush_boat_arrives_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_boat_arrives_01",
				"pbw_objective_forest_ambush_boat_arrives_02",
				"pbw_objective_forest_ambush_boat_arrives_03",
				"pbw_objective_forest_ambush_boat_arrives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_boat_arrives_01",
				"pbw_objective_forest_ambush_boat_arrives_02",
				"pbw_objective_forest_ambush_boat_arrives_03",
				"pbw_objective_forest_ambush_boat_arrives_04",
			},
			sound_events_duration = {
				0.95202082395554,
				2.0999999046326,
				1.1334166526794,
				0.97247916460037,
			},
		},
		pbw_objective_forest_ambush_doomwheel_objective_done_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_doomwheel_objective_done_01",
				"pbw_objective_forest_ambush_doomwheel_objective_done_02",
				"pbw_objective_forest_ambush_doomwheel_objective_done_03",
				"pbw_objective_forest_ambush_doomwheel_objective_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_doomwheel_objective_done_01",
				"pbw_objective_forest_ambush_doomwheel_objective_done_02",
				"pbw_objective_forest_ambush_doomwheel_objective_done_03",
				"pbw_objective_forest_ambush_doomwheel_objective_done_04",
			},
			sound_events_duration = {
				3.9454998970032,
				2.2462916374206,
				3.5333333015442,
				4.4322500228882,
			},
		},
		pbw_objective_forest_ambush_reaching_skaven_camp_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_reaching_skaven_camp_01",
				"pbw_objective_forest_ambush_reaching_skaven_camp_02",
				"pbw_objective_forest_ambush_reaching_skaven_camp_03",
				"pbw_objective_forest_ambush_reaching_skaven_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_reaching_skaven_camp_01",
				"pbw_objective_forest_ambush_reaching_skaven_camp_02",
				"pbw_objective_forest_ambush_reaching_skaven_camp_03",
				"pbw_objective_forest_ambush_reaching_skaven_camp_04",
			},
			sound_events_duration = {
				4.2854790687561,
				4.4578957557678,
				5.1139998435974,
				5.0067706108093,
			},
		},
		pbw_objective_forest_ambush_ring_bell_PVP = {
			category = "player_feedback",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_ring_bell_01",
				"pbw_objective_forest_ambush_ring_bell_02",
				"pbw_objective_forest_ambush_ring_bell_03",
				"pbw_objective_forest_ambush_ring_bell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_ring_bell_01",
				"pbw_objective_forest_ambush_ring_bell_02",
				"pbw_objective_forest_ambush_ring_bell_03",
				"pbw_objective_forest_ambush_ring_bell_04",
			},
			sound_events_duration = {
				4.0349583625794,
				2.8488540649414,
				1.5101041793823,
				1.8621250391007,
			},
		},
		pbw_objective_forest_ambush_spotting_bridge_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"pbw_objective_forest_ambush_spotting_bridge_01",
				"pbw_objective_forest_ambush_spotting_bridge_03",
				"pbw_objective_forest_ambush_spotting_bridge_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_spotting_bridge_01",
				"pbw_objective_forest_ambush_spotting_bridge_03",
				"pbw_objective_forest_ambush_spotting_bridge_04",
			},
			sound_events_duration = {
				1.067583322525,
				1.0366458892822,
				1.2558125257492,
			},
		},
		pbw_vs_safe_room_forest_ambush_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pbw_vs_safe_room_forest_ambush_01_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_forest_ambush_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.566999912262,
			},
		},
		pbw_vs_safe_room_forest_ambush_02_a = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pbw_vs_safe_room_forest_ambush_02_a_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_forest_ambush_02_a_01",
			},
			sound_events_duration = {
				[1] = 3.6984167098999,
			},
		},
		pbw_vs_safe_room_forest_ambush_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pbw_vs_safe_room_forest_ambush_03_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_forest_ambush_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.272125005722,
			},
		},
		pbw_vs_safe_room_forest_ambush_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pbw_vs_safe_room_forest_ambush_04_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_forest_ambush_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.261479139328,
			},
		},
		pbw_vs_safe_room_forest_ambush_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pbw_vs_safe_room_forest_ambush_05_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_forest_ambush_05_b_01",
			},
			sound_events_duration = {
				[1] = 2.6349582672119,
			},
		},
		pbw_vs_safe_room_forest_ambush_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pbw_vs_safe_room_forest_ambush_06_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_forest_ambush_06_b_01",
			},
			sound_events_duration = {
				[1] = 2.614458322525,
			},
		},
		pbw_vs_safe_room_forest_ambush_07_a = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pbw_vs_safe_room_forest_ambush_07_a_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_forest_ambush_07_a_01",
			},
			sound_events_duration = {
				[1] = 4.0107083320618,
			},
		},
		pbw_vs_safe_room_forest_ambush_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pbw_vs_safe_room_forest_ambush_08_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_forest_ambush_08_b_01",
			},
			sound_events_duration = {
				[1] = 4.2894792556763,
			},
		},
		pbw_vs_safe_room_forest_ambush_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pbw_vs_safe_room_forest_ambush_09_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_forest_ambush_09_b_01",
			},
			sound_events_duration = {
				[1] = 2.2928957939148,
			},
		},
		pbw_vs_safe_room_forest_ambush_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pbw_vs_safe_room_forest_ambush_10_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_forest_ambush_10_b_01",
			},
			sound_events_duration = {
				[1] = 4.711895942688,
			},
		},
		pdr_objective_forest_ambush_boat_arrives_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pdr_objective_forest_ambush_boat_arrives_01",
				"pdr_objective_forest_ambush_boat_arrives_02",
				"pdr_objective_forest_ambush_boat_arrives_03",
				"pdr_objective_forest_ambush_boat_arrives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_boat_arrives_01",
				"pdr_objective_forest_ambush_boat_arrives_02",
				"pdr_objective_forest_ambush_boat_arrives_03",
				"pdr_objective_forest_ambush_boat_arrives_04",
			},
			sound_events_duration = {
				0.85000002384186,
				1.2641667127609,
				3.9430832862854,
				1.2961250543594,
			},
		},
		pdr_objective_forest_ambush_doomwheel_objective_done_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pdr_objective_forest_ambush_doomwheel_objective_done_01",
				"pdr_objective_forest_ambush_doomwheel_objective_done_02",
				"pdr_objective_forest_ambush_doomwheel_objective_done_03",
				"pdr_objective_forest_ambush_doomwheel_objective_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_doomwheel_objective_done_01",
				"pdr_objective_forest_ambush_doomwheel_objective_done_02",
				"pdr_objective_forest_ambush_doomwheel_objective_done_03",
				"pdr_objective_forest_ambush_doomwheel_objective_done_04",
			},
			sound_events_duration = {
				1.8719791173935,
				3.0031666755676,
				3.0786874294281,
				2.4349167346954,
			},
		},
		pdr_objective_forest_ambush_reaching_skaven_camp_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"pdr_objective_forest_ambush_reaching_skaven_camp_02",
				"pdr_objective_forest_ambush_reaching_skaven_camp_03",
				"pdr_objective_forest_ambush_reaching_skaven_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_forest_ambush_reaching_skaven_camp_02",
				"pdr_objective_forest_ambush_reaching_skaven_camp_03",
				"pdr_objective_forest_ambush_reaching_skaven_camp_04",
			},
			sound_events_duration = {
				3.5152292251587,
				2.720624923706,
				5.6372289657593,
			},
		},
		pdr_objective_forest_ambush_ring_bell_PVP = {
			category = "player_feedback",
			database = "vs_level_forest_ambush_pvp",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_objective_forest_ambush_ring_bell_01",
			},
			sound_events = {
				[1] = "pdr_objective_forest_ambush_ring_bell_01",
			},
			sound_events_duration = {
				[1] = 1.194375038147,
			},
		},
		pdr_objective_forest_ambush_spotting_bridge_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pdr_objective_forest_ambush_spotting_bridge_03",
				[2] = "pdr_objective_forest_ambush_spotting_bridge_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_objective_forest_ambush_spotting_bridge_03",
				[2] = "pdr_objective_forest_ambush_spotting_bridge_04",
			},
			sound_events_duration = {
				[1] = 2.3151874542236,
				[2] = 1.6655625104904,
			},
		},
		pdr_vs_safe_room_forest_ambush_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pdr_vs_safe_room_forest_ambush_01_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_forest_ambush_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.0612082481384,
			},
		},
		pdr_vs_safe_room_forest_ambush_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pdr_vs_safe_room_forest_ambush_02_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_forest_ambush_02_b_01",
			},
			sound_events_duration = {
				[1] = 6.0164999961853,
			},
		},
		pdr_vs_safe_room_forest_ambush_03_a = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pdr_vs_safe_room_forest_ambush_03_a_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_forest_ambush_03_a_01",
			},
			sound_events_duration = {
				[1] = 5.2468957901001,
			},
		},
		pdr_vs_safe_room_forest_ambush_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pdr_vs_safe_room_forest_ambush_04_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_forest_ambush_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.5921874046326,
			},
		},
		pdr_vs_safe_room_forest_ambush_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pdr_vs_safe_room_forest_ambush_05_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_forest_ambush_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.2164165973663,
			},
		},
		pdr_vs_safe_room_forest_ambush_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pdr_vs_safe_room_forest_ambush_06_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_forest_ambush_06_b_01",
			},
			sound_events_duration = {
				[1] = 3.8495209217072,
			},
		},
		pdr_vs_safe_room_forest_ambush_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pdr_vs_safe_room_forest_ambush_07_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_forest_ambush_07_b_01",
			},
			sound_events_duration = {
				[1] = 3.2761249542236,
			},
		},
		pdr_vs_safe_room_forest_ambush_08_a = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pdr_vs_safe_room_forest_ambush_08_a_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_forest_ambush_08_a_01",
			},
			sound_events_duration = {
				[1] = 4.5122709274292,
			},
		},
		pdr_vs_safe_room_forest_ambush_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pdr_vs_safe_room_forest_ambush_09_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_forest_ambush_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.8245625495911,
			},
		},
		pdr_vs_safe_room_forest_ambush_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pdr_vs_safe_room_forest_ambush_10_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_forest_ambush_10_b_01",
			},
			sound_events_duration = {
				[1] = 7.2690210342407,
			},
		},
		pes_objective_forest_ambush_boat_arrives_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pes_objective_forest_ambush_boat_arrives_01",
				"pes_objective_forest_ambush_boat_arrives_02",
				"pes_objective_forest_ambush_boat_arrives_03",
				"pes_objective_forest_ambush_boat_arrives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_forest_ambush_boat_arrives_01",
				"pes_objective_forest_ambush_boat_arrives_02",
				"pes_objective_forest_ambush_boat_arrives_03",
				"pes_objective_forest_ambush_boat_arrives_04",
			},
			sound_events_duration = {
				1.0425000190735,
				0.77499997615814,
				0.6319375038147,
				1.3798333406448,
			},
		},
		pes_objective_forest_ambush_doomwheel_objective_done_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pes_objective_forest_ambush_doomwheel_objective_done_01",
				"pes_objective_forest_ambush_doomwheel_objective_done_02",
				"pes_objective_forest_ambush_doomwheel_objective_done_03",
				"pes_objective_forest_ambush_doomwheel_objective_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_forest_ambush_doomwheel_objective_done_01",
				"pes_objective_forest_ambush_doomwheel_objective_done_02",
				"pes_objective_forest_ambush_doomwheel_objective_done_03",
				"pes_objective_forest_ambush_doomwheel_objective_done_04",
			},
			sound_events_duration = {
				1.8449062108993,
				1.7062292098999,
				3.0207917690277,
				2.629604101181,
			},
		},
		pes_objective_forest_ambush_spotting_bridge_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pes_objective_forest_ambush_spotting_bridge_01",
				"pes_objective_forest_ambush_spotting_bridge_02",
				"pes_objective_forest_ambush_spotting_bridge_03",
				"pes_objective_forest_ambush_spotting_bridge_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_forest_ambush_spotting_bridge_01",
				"pes_objective_forest_ambush_spotting_bridge_02",
				"pes_objective_forest_ambush_spotting_bridge_03",
				"pes_objective_forest_ambush_spotting_bridge_04",
			},
			sound_events_duration = {
				1.1302291154861,
				1.1564166545868,
				2.1568124294281,
				1.017874956131,
			},
		},
		pes_vs_safe_room_forest_ambush_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pes_vs_safe_room_forest_ambush_01_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_forest_ambush_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.0977082252502,
			},
		},
		pes_vs_safe_room_forest_ambush_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pes_vs_safe_room_forest_ambush_02_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_forest_ambush_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.1387915611267,
			},
		},
		pes_vs_safe_room_forest_ambush_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pes_vs_safe_room_forest_ambush_03_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_forest_ambush_03_b_01",
			},
			sound_events_duration = {
				[1] = 2.8687915802002,
			},
		},
		pes_vs_safe_room_forest_ambush_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pes_vs_safe_room_forest_ambush_04_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_forest_ambush_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.8689374923706,
			},
		},
		pes_vs_safe_room_forest_ambush_05_a = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pes_vs_safe_room_forest_ambush_05_a_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_forest_ambush_05_a_01",
			},
			sound_events_duration = {
				[1] = 3.3744790554047,
			},
		},
		pes_vs_safe_room_forest_ambush_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pes_vs_safe_room_forest_ambush_06_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_forest_ambush_06_b_01",
			},
			sound_events_duration = {
				[1] = 3.011479139328,
			},
		},
		pes_vs_safe_room_forest_ambush_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pes_vs_safe_room_forest_ambush_07_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_forest_ambush_07_b_01",
			},
			sound_events_duration = {
				[1] = 3.0457084178925,
			},
		},
		pes_vs_safe_room_forest_ambush_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pes_vs_safe_room_forest_ambush_08_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_forest_ambush_08_b_01",
			},
			sound_events_duration = {
				[1] = 2.819854259491,
			},
		},
		pes_vs_safe_room_forest_ambush_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pes_vs_safe_room_forest_ambush_09_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_forest_ambush_09_b_01",
			},
			sound_events_duration = {
				[1] = 2.4253749847412,
			},
		},
		pes_vs_safe_room_forest_ambush_10_a = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pes_vs_safe_room_forest_ambush_10_a_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_forest_ambush_10_a_01",
			},
			sound_events_duration = {
				[1] = 1.8825833797455,
			},
		},
		pwe_objective_forest_ambush_boat_arrives_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwe_objective_forest_ambush_boat_arrives_01",
				"pwe_objective_forest_ambush_boat_arrives_02",
				"pwe_objective_forest_ambush_boat_arrives_03",
				"pwe_objective_forest_ambush_boat_arrives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_boat_arrives_01",
				"pwe_objective_forest_ambush_boat_arrives_02",
				"pwe_objective_forest_ambush_boat_arrives_03",
				"pwe_objective_forest_ambush_boat_arrives_04",
			},
			sound_events_duration = {
				1.0335416793823,
				1.5670833587647,
				3.5815207958221,
				2.3906042575836,
			},
		},
		pwe_objective_forest_ambush_doomwheel_objective_done_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwe_objective_forest_ambush_doomwheel_objective_done_01",
				"pwe_objective_forest_ambush_doomwheel_objective_done_02",
				"pwe_objective_forest_ambush_doomwheel_objective_done_03",
				"pwe_objective_forest_ambush_doomwheel_objective_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_doomwheel_objective_done_01",
				"pwe_objective_forest_ambush_doomwheel_objective_done_02",
				"pwe_objective_forest_ambush_doomwheel_objective_done_03",
				"pwe_objective_forest_ambush_doomwheel_objective_done_04",
			},
			sound_events_duration = {
				2.2595000267029,
				4.9688959121704,
				4.6127915382385,
				2.1247916221619,
			},
		},
		pwe_objective_forest_ambush_reaching_skaven_camp_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwe_objective_forest_ambush_reaching_skaven_camp_01",
				"pwe_objective_forest_ambush_reaching_skaven_camp_02",
				"pwe_objective_forest_ambush_reaching_skaven_camp_03",
				"pwe_objective_forest_ambush_reaching_skaven_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_reaching_skaven_camp_01",
				"pwe_objective_forest_ambush_reaching_skaven_camp_02",
				"pwe_objective_forest_ambush_reaching_skaven_camp_03",
				"pwe_objective_forest_ambush_reaching_skaven_camp_04",
			},
			sound_events_duration = {
				3.7863125801086,
				4.1138124465942,
				1.7016458511352,
				2.4332292079926,
			},
		},
		pwe_objective_forest_ambush_ring_bell_PVP = {
			category = "player_feedback",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_objective_forest_ambush_ring_bell_01",
				[2] = "pwe_objective_forest_ambush_ring_bell_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_objective_forest_ambush_ring_bell_01",
				[2] = "pwe_objective_forest_ambush_ring_bell_04",
			},
			sound_events_duration = {
				[1] = 1.2860000133514,
				[2] = 2.4909999370575,
			},
		},
		pwe_objective_forest_ambush_spotting_bridge_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_objective_forest_ambush_spotting_bridge_01",
				[2] = "pwe_objective_forest_ambush_spotting_bridge_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_objective_forest_ambush_spotting_bridge_01",
				[2] = "pwe_objective_forest_ambush_spotting_bridge_03",
			},
			sound_events_duration = {
				[1] = 1.3483958244324,
				[2] = 2.1226458549499,
			},
		},
		pwe_vs_safe_room_forest_ambush_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_vs_safe_room_forest_ambush_01_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_forest_ambush_01_b_01",
			},
			sound_events_duration = {
				[1] = 2.8838334083557,
			},
		},
		pwe_vs_safe_room_forest_ambush_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_vs_safe_room_forest_ambush_02_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_forest_ambush_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.3848333358765,
			},
		},
		pwe_vs_safe_room_forest_ambush_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_vs_safe_room_forest_ambush_03_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_forest_ambush_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.5532290935516,
			},
		},
		pwe_vs_safe_room_forest_ambush_04_a = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_vs_safe_room_forest_ambush_04_a_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_forest_ambush_04_a_01",
			},
			sound_events_duration = {
				[1] = 6.3736457824707,
			},
		},
		pwe_vs_safe_room_forest_ambush_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_vs_safe_room_forest_ambush_05_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_forest_ambush_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.1183958053589,
			},
		},
		pwe_vs_safe_room_forest_ambush_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_vs_safe_room_forest_ambush_06_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_forest_ambush_06_b_01",
			},
			sound_events_duration = {
				[1] = 4.5579376220703,
			},
		},
		pwe_vs_safe_room_forest_ambush_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_vs_safe_room_forest_ambush_07_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_forest_ambush_07_b_01",
			},
			sound_events_duration = {
				[1] = 3.709166765213,
			},
		},
		pwe_vs_safe_room_forest_ambush_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_vs_safe_room_forest_ambush_08_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_forest_ambush_08_b_01",
			},
			sound_events_duration = {
				[1] = 3.9117500782013,
			},
		},
		pwe_vs_safe_room_forest_ambush_09_a = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_vs_safe_room_forest_ambush_09_a_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_forest_ambush_09_a_01",
			},
			sound_events_duration = {
				[1] = 5.0741457939148,
			},
		},
		pwe_vs_safe_room_forest_ambush_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwe_vs_safe_room_forest_ambush_10_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_forest_ambush_10_b_01",
			},
			sound_events_duration = {
				[1] = 4.2457499504089,
			},
		},
		pwh_objective_forest_ambush_boat_arrives_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwh_objective_forest_ambush_boat_arrives_01",
				"pwh_objective_forest_ambush_boat_arrives_02",
				"pwh_objective_forest_ambush_boat_arrives_03",
				"pwh_objective_forest_ambush_boat_arrives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_boat_arrives_01",
				"pwh_objective_forest_ambush_boat_arrives_02",
				"pwh_objective_forest_ambush_boat_arrives_03",
				"pwh_objective_forest_ambush_boat_arrives_04",
			},
			sound_events_duration = {
				1.1015416383743,
				2.0301666259766,
				2.6105833053589,
				1.6853333711624,
			},
		},
		pwh_objective_forest_ambush_doomwheel_objective_done_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwh_objective_forest_ambush_doomwheel_objective_done_01",
				"pwh_objective_forest_ambush_doomwheel_objective_done_02",
				"pwh_objective_forest_ambush_doomwheel_objective_done_03",
				"pwh_objective_forest_ambush_doomwheel_objective_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_doomwheel_objective_done_01",
				"pwh_objective_forest_ambush_doomwheel_objective_done_02",
				"pwh_objective_forest_ambush_doomwheel_objective_done_03",
				"pwh_objective_forest_ambush_doomwheel_objective_done_04",
			},
			sound_events_duration = {
				3.4138123989105,
				4.1237916946411,
				4.3378958702087,
				3.7784583568573,
			},
		},
		pwh_objective_forest_ambush_reaching_skaven_camp_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwh_objective_forest_ambush_reaching_skaven_camp_02",
				[2] = "pwh_objective_forest_ambush_reaching_skaven_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_forest_ambush_reaching_skaven_camp_02",
				[2] = "pwh_objective_forest_ambush_reaching_skaven_camp_04",
			},
			sound_events_duration = {
				[1] = 5.7699375152588,
				[2] = 6.2432293891907,
			},
		},
		pwh_objective_forest_ambush_ring_bell_PVP = {
			category = "player_feedback",
			database = "vs_level_forest_ambush_pvp",
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
				"pwh_objective_forest_ambush_ring_bell_01",
				"pwh_objective_forest_ambush_ring_bell_02",
				"pwh_objective_forest_ambush_ring_bell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_ring_bell_01",
				"pwh_objective_forest_ambush_ring_bell_02",
				"pwh_objective_forest_ambush_ring_bell_04",
			},
			sound_events_duration = {
				2.0468332767487,
				4.1363124847412,
				3.7992498874664,
			},
		},
		pwh_objective_forest_ambush_spotting_bridge_PVP = {
			category = "level_talk",
			database = "vs_level_forest_ambush_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwh_objective_forest_ambush_spotting_bridge_01",
				"pwh_objective_forest_ambush_spotting_bridge_02",
				"pwh_objective_forest_ambush_spotting_bridge_03",
				"pwh_objective_forest_ambush_spotting_bridge_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_forest_ambush_spotting_bridge_01",
				"pwh_objective_forest_ambush_spotting_bridge_02",
				"pwh_objective_forest_ambush_spotting_bridge_03",
				"pwh_objective_forest_ambush_spotting_bridge_04",
			},
			sound_events_duration = {
				2.0553123950958,
				3.4140832424164,
				1.5814791917801,
				1.8647083044052,
			},
		},
		pwh_vs_safe_room_forest_ambush_01_a = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwh_vs_safe_room_forest_ambush_01_a_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_forest_ambush_01_a_01",
			},
			sound_events_duration = {
				[1] = 3.6020834445953,
			},
		},
		pwh_vs_safe_room_forest_ambush_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwh_vs_safe_room_forest_ambush_02_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_forest_ambush_02_b_01",
			},
			sound_events_duration = {
				[1] = 5.084020614624,
			},
		},
		pwh_vs_safe_room_forest_ambush_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwh_vs_safe_room_forest_ambush_03_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_forest_ambush_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.5055415630341,
			},
		},
		pwh_vs_safe_room_forest_ambush_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwh_vs_safe_room_forest_ambush_04_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_forest_ambush_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.6004166603088,
			},
		},
		pwh_vs_safe_room_forest_ambush_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwh_vs_safe_room_forest_ambush_05_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_forest_ambush_05_b_01",
			},
			sound_events_duration = {
				[1] = 5.7517085075378,
			},
		},
		pwh_vs_safe_room_forest_ambush_06_a = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwh_vs_safe_room_forest_ambush_06_a_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_forest_ambush_06_a_01",
			},
			sound_events_duration = {
				[1] = 5.6559791564941,
			},
		},
		pwh_vs_safe_room_forest_ambush_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwh_vs_safe_room_forest_ambush_07_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_forest_ambush_07_b_01",
			},
			sound_events_duration = {
				[1] = 4.3969373703003,
			},
		},
		pwh_vs_safe_room_forest_ambush_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwh_vs_safe_room_forest_ambush_08_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_forest_ambush_08_b_01",
			},
			sound_events_duration = {
				[1] = 4.2708334922791,
			},
		},
		pwh_vs_safe_room_forest_ambush_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwh_vs_safe_room_forest_ambush_09_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_forest_ambush_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.204083442688,
			},
		},
		pwh_vs_safe_room_forest_ambush_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_forest_ambush_pvp",
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
				[1] = "pwh_vs_safe_room_forest_ambush_10_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_forest_ambush_10_b_01",
			},
			sound_events_duration = {
				[1] = 6.945770740509,
			},
		},
	})
end
