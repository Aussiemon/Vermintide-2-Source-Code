-- chunkname: @dialogues/generated/vs_level_fort_pvp.lua

return function ()
	define_rule({
		name = "nde_vs_fort_set1_briefing_a",
		probability = 1,
		response = "nde_vs_fort_set1_briefing_a",
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
				"fort_pvp",
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
		name = "nde_vs_fort_set1_obj1_a",
		probability = 1,
		response = "nde_vs_fort_set1_obj1_a",
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
				"fort_pvp",
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
		name = "nde_vs_fort_set1_obj1_reached",
		probability = 1,
		response = "nde_vs_fort_set1_obj1_reached",
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
				"fort_pvp",
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
		name = "nde_vs_fort_set1_obj2_a",
		probability = 1,
		response = "nde_vs_fort_set1_obj2_a",
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
				"fort_pvp",
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
		name = "nde_vs_fort_set1_obj2_reached",
		probability = 1,
		response = "nde_vs_fort_set1_obj2_reached",
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
				"fort_pvp",
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
		name = "nde_vs_fort_set1_safe_room_reminder",
		probability = 1,
		response = "nde_vs_fort_set1_safe_room_reminder",
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
				"fort_pvp",
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
				"safe_room",
			},
		},
	})
	define_rule({
		name = "nde_vs_fort_set2_obj1_a",
		probability = 1,
		response = "nde_vs_fort_set2_obj1_a",
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
				"fort_pvp",
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
		name = "nde_vs_fort_set2_obj1_reached_p1",
		probability = 1,
		response = "nde_vs_fort_set2_obj1_reached_p1",
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
				"fort_pvp",
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
			{
				"global_context",
				"objective_part",
				OP.EQ,
				1,
			},
		},
	})
	define_rule({
		name = "nde_vs_fort_set2_obj1_reached_p2",
		probability = 1,
		response = "nde_vs_fort_set2_obj1_reached_p2",
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
				"fort_pvp",
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
			{
				"global_context",
				"objective_part",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "nde_vs_fort_set2_obj2_a",
		probability = 1,
		response = "nde_vs_fort_set2_obj2_a",
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
				"nde_vs_fort_set2_obj2_a_BRIDGE",
			},
			{
				"global_context",
				"game_about_to_end",
				OP.EQ,
				0,
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
		name = "nde_vs_fort_set2_obj2_a_BRIDGE",
		probability = 1,
		response = "nde_vs_fort_set2_obj2_a_BRIDGE",
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
				"fort_pvp",
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
		name = "nde_vs_fort_set2_obj2_reached",
		probability = 1,
		response = "nde_vs_fort_set2_obj2_reached",
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
				"fort_pvp",
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
		name = "nde_vs_fort_set3_obj1_a",
		probability = 1,
		response = "nde_vs_fort_set3_obj1_a",
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
				"fort_pvp",
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
		name = "nde_vs_fort_set3_obj2_a",
		probability = 1,
		response = "nde_vs_fort_set3_obj2_a",
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
				"fort_pvp",
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
		name = "nde_vs_fort_set3_obj2_reached_p1",
		probability = 1,
		response = "nde_vs_fort_set3_obj2_reached_p1",
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
				"fort_pvp",
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
				"global_context",
				"objective_part",
				OP.EQ,
				1,
			},
		},
	})
	define_rule({
		name = "nde_vs_fort_set3_obj2_reached_p2",
		probability = 1,
		response = "nde_vs_fort_set3_obj2_reached_p2",
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
				"fort_pvp",
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
				"global_context",
				"objective_part",
				OP.EQ,
				2,
			},
		},
	})
	define_rule({
		name = "nde_vs_fort_set3_obj3_reached",
		probability = 1,
		response = "nde_vs_fort_set3_obj3_reached",
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
				"fort_pvp",
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
				"three",
			},
		},
	})
	define_rule({
		name = "pbw_level_fort_cannonballs_PVP",
		probability = 1,
		response = "pbw_level_fort_cannonballs_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_cannonballs",
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
				"level_fort_cannonballs",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_cannonballs",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_fort_fire_cannon_final_hit_PVP",
		probability = 1,
		response = "pbw_level_fort_fire_cannon_final_hit_PVP",
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
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_fort_fire_cannon_first_hit_PVP",
		probability = 1,
		response = "pbw_level_fort_fire_cannon_first_hit_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_fire_cannon_first_hit",
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
				"level_fort_fire_cannon_first_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_first_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_level_fort_fire_cannon_second_hit_PVP",
		probability = 1,
		response = "pbw_level_fort_fire_cannon_second_hit_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_fire_cannon_second_hit",
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
				"level_fort_fire_cannon_second_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_second_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_vs_safe_room_fort_01_b",
		probability = 1,
		response = "pbw_vs_safe_room_fort_01_b",
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
				"pwh_vs_safe_room_fort_01_a",
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
		name = "pbw_vs_safe_room_fort_02_a",
		probability = 1,
		response = "pbw_vs_safe_room_fort_02_a",
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
				"nde_vs_fort_set1_briefing_a",
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
				"fort_pvp",
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
		name = "pbw_vs_safe_room_fort_03_b",
		probability = 1,
		response = "pbw_vs_safe_room_fort_03_b",
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
				"pdr_vs_safe_room_fort_03_a",
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
		name = "pbw_vs_safe_room_fort_04_b",
		probability = 1,
		response = "pbw_vs_safe_room_fort_04_b",
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
				"pwe_vs_safe_room_fort_04_a",
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
		name = "pbw_vs_safe_room_fort_05_b",
		probability = 1,
		response = "pbw_vs_safe_room_fort_05_b",
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
				"pes_vs_safe_room_fort_05_a",
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
		name = "pbw_vs_safe_room_fort_06_b",
		probability = 1,
		response = "pbw_vs_safe_room_fort_06_b",
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
				"pwh_vs_safe_room_fort_06_a",
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
		name = "pbw_vs_safe_room_fort_07_a",
		probability = 1,
		response = "pbw_vs_safe_room_fort_07_a",
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
				"nde_vs_fort_set1_briefing_a",
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
				"fort_pvp",
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
		name = "pbw_vs_safe_room_fort_08_b",
		probability = 1,
		response = "pbw_vs_safe_room_fort_08_b",
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
				"pdr_vs_safe_room_fort_08_a",
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
		name = "pbw_vs_safe_room_fort_09_b",
		probability = 1,
		response = "pbw_vs_safe_room_fort_09_b",
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
				"pwe_vs_safe_room_fort_09_a",
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
		name = "pbw_vs_safe_room_fort_10_b",
		probability = 1,
		response = "pbw_vs_safe_room_fort_10_b",
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
				"pes_vs_safe_room_fort_10_a",
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
		name = "pdr_level_fort_cannonballs_PVP",
		probability = 1,
		response = "pdr_level_fort_cannonballs_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_cannonballs",
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
				"level_fort_cannonballs",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_cannonballs",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_fort_fire_cannon_final_hit_PVP",
		probability = 1,
		response = "pdr_level_fort_fire_cannon_final_hit_PVP",
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
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_fort_fire_cannon_first_hit_PVP",
		probability = 1,
		response = "pdr_level_fort_fire_cannon_first_hit_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_fire_cannon_first_hit",
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
				"level_fort_fire_cannon_first_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_first_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_fort_fire_cannon_second_hit_PVP",
		probability = 1,
		response = "pdr_level_fort_fire_cannon_second_hit_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_fire_cannon_second_hit",
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
				"level_fort_fire_cannon_second_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_second_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_fort_plague_claw_shelling_move_PVP",
		probability = 1,
		response = "pdr_level_fort_plague_claw_shelling_move_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_plague_claw_shelling_move",
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
				"level_fort_plague_claw_shelling_move",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_plague_claw_shelling_move",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_level_fort_under_attack_PVP",
		probability = 1,
		response = "pdr_level_fort_under_attack_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_under_attack",
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
				"level_fort_under_attack",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_under_attack",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_vs_safe_room_fort_01_b",
		probability = 1,
		response = "pdr_vs_safe_room_fort_01_b",
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
				"pwh_vs_safe_room_fort_01_a",
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
		name = "pdr_vs_safe_room_fort_02_b",
		probability = 1,
		response = "pdr_vs_safe_room_fort_02_b",
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
				"pbw_vs_safe_room_fort_02_a",
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
		name = "pdr_vs_safe_room_fort_03_a",
		probability = 1,
		response = "pdr_vs_safe_room_fort_03_a",
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
				"nde_vs_fort_set1_briefing_a",
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
				"fort_pvp",
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
		name = "pdr_vs_safe_room_fort_04_b",
		probability = 1,
		response = "pdr_vs_safe_room_fort_04_b",
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
				"pwe_vs_safe_room_fort_04_a",
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
		name = "pdr_vs_safe_room_fort_05_b",
		probability = 1,
		response = "pdr_vs_safe_room_fort_05_b",
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
				"pes_vs_safe_room_fort_05_a",
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
		name = "pdr_vs_safe_room_fort_06_b",
		probability = 1,
		response = "pdr_vs_safe_room_fort_06_b",
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
				"pwh_vs_safe_room_fort_06_a",
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
		name = "pdr_vs_safe_room_fort_07_b",
		probability = 1,
		response = "pdr_vs_safe_room_fort_07_b",
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
				"pbw_vs_safe_room_fort_07_a",
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
		name = "pdr_vs_safe_room_fort_08_a",
		probability = 1,
		response = "pdr_vs_safe_room_fort_08_a",
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
				"nde_vs_fort_set1_briefing_a",
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
				"fort_pvp",
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
		name = "pdr_vs_safe_room_fort_09_b",
		probability = 1,
		response = "pdr_vs_safe_room_fort_09_b",
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
				"pwe_vs_safe_room_fort_09_a",
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
		name = "pdr_vs_safe_room_fort_10_b",
		probability = 1,
		response = "pdr_vs_safe_room_fort_10_b",
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
				"pes_vs_safe_room_fort_10_a",
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
		name = "pes_level_fort_cannonballs_PVP",
		probability = 1,
		response = "pes_level_fort_cannonballs_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_cannonballs",
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
				"level_fort_cannonballs",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_cannonballs",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_fort_fire_cannon_final_hit_PVP",
		probability = 1,
		response = "pes_level_fort_fire_cannon_final_hit_PVP",
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
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_fort_fire_cannon_first_hit_PVP",
		probability = 1,
		response = "pes_level_fort_fire_cannon_first_hit_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_fire_cannon_first_hit",
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
				"level_fort_fire_cannon_first_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_first_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_fort_fire_cannon_second_hit_PVP",
		probability = 1,
		response = "pes_level_fort_fire_cannon_second_hit_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_fire_cannon_second_hit",
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
				"level_fort_fire_cannon_second_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_second_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_fort_plague_claw_shelling_move_PVP",
		probability = 1,
		response = "pes_level_fort_plague_claw_shelling_move_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_plague_claw_shelling_move",
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
				"level_fort_plague_claw_shelling_move",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_plague_claw_shelling_move",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_level_fort_under_attack_PVP",
		probability = 1,
		response = "pes_level_fort_under_attack_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_under_attack",
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
				"level_fort_under_attack",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_under_attack",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_vs_safe_room_fort_01_b",
		probability = 1,
		response = "pes_vs_safe_room_fort_01_b",
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
				"pwh_vs_safe_room_fort_01_a",
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
		name = "pes_vs_safe_room_fort_02_b",
		probability = 1,
		response = "pes_vs_safe_room_fort_02_b",
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
				"pbw_vs_safe_room_fort_02_a",
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
		name = "pes_vs_safe_room_fort_03_b",
		probability = 1,
		response = "pes_vs_safe_room_fort_03_b",
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
				"pdr_vs_safe_room_fort_03_a",
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
		name = "pes_vs_safe_room_fort_04_b",
		probability = 1,
		response = "pes_vs_safe_room_fort_04_b",
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
				"pwe_vs_safe_room_fort_04_a",
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
		name = "pes_vs_safe_room_fort_05_a",
		probability = 1,
		response = "pes_vs_safe_room_fort_05_a",
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
				"nde_vs_fort_set1_briefing_a",
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
				"fort_pvp",
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
		name = "pes_vs_safe_room_fort_06_b",
		probability = 1,
		response = "pes_vs_safe_room_fort_06_b",
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
				"pwh_vs_safe_room_fort_06_a",
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
		name = "pes_vs_safe_room_fort_07_b",
		probability = 1,
		response = "pes_vs_safe_room_fort_07_b",
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
				"pbw_vs_safe_room_fort_07_a",
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
		name = "pes_vs_safe_room_fort_08_b",
		probability = 1,
		response = "pes_vs_safe_room_fort_08_b",
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
				"pdr_vs_safe_room_fort_08_a",
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
		name = "pes_vs_safe_room_fort_09_b",
		probability = 1,
		response = "pes_vs_safe_room_fort_09_b",
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
				"pwe_vs_safe_room_fort_09_a",
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
		name = "pes_vs_safe_room_fort_10_a",
		probability = 1,
		response = "pes_vs_safe_room_fort_10_a",
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
				"nde_vs_fort_set1_briefing_a",
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
				"fort_pvp",
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
		name = "pwe_level_fort_cannonballs_PVP",
		probability = 1,
		response = "pwe_level_fort_cannonballs_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_cannonballs",
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
				"level_fort_cannonballs",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_cannonballs",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_fort_fire_cannon_final_hit_PVP",
		probability = 1,
		response = "pwe_level_fort_fire_cannon_final_hit_PVP",
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
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_fort_fire_cannon_first_hit_PVP",
		probability = 1,
		response = "pwe_level_fort_fire_cannon_first_hit_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_fire_cannon_first_hit",
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
				"level_fort_fire_cannon_first_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_first_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_fort_fire_cannon_second_hit_PVP",
		probability = 1,
		response = "pwe_level_fort_fire_cannon_second_hit_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_fire_cannon_second_hit",
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
				"level_fort_fire_cannon_second_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_second_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_level_fort_plague_claw_shelling_move_PVP",
		probability = 1,
		response = "pwe_level_fort_plague_claw_shelling_move_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_plague_claw_shelling_move",
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
				"level_fort_plague_claw_shelling_move",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_plague_claw_shelling_move",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_vs_safe_room_fort_01_b",
		probability = 1,
		response = "pwe_vs_safe_room_fort_01_b",
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
				"pwh_vs_safe_room_fort_01_a",
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
		name = "pwe_vs_safe_room_fort_02_b",
		probability = 1,
		response = "pwe_vs_safe_room_fort_02_b",
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
				"pbw_vs_safe_room_fort_02_a",
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
		name = "pwe_vs_safe_room_fort_03_b",
		probability = 1,
		response = "pwe_vs_safe_room_fort_03_b",
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
				"pdr_vs_safe_room_fort_03_a",
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
		name = "pwe_vs_safe_room_fort_04_a",
		probability = 1,
		response = "pwe_vs_safe_room_fort_04_a",
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
				"nde_vs_fort_set1_briefing_a",
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
				"fort_pvp",
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
		name = "pwe_vs_safe_room_fort_05_b",
		probability = 1,
		response = "pwe_vs_safe_room_fort_05_b",
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
				"pes_vs_safe_room_fort_05_a",
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
		name = "pwe_vs_safe_room_fort_06_b",
		probability = 1,
		response = "pwe_vs_safe_room_fort_06_b",
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
				"pwh_vs_safe_room_fort_06_a",
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
		name = "pwe_vs_safe_room_fort_07_b",
		probability = 1,
		response = "pwe_vs_safe_room_fort_07_b",
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
				"pbw_vs_safe_room_fort_07_a",
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
		name = "pwe_vs_safe_room_fort_08_b",
		probability = 1,
		response = "pwe_vs_safe_room_fort_08_b",
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
				"pdr_vs_safe_room_fort_08_a",
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
		name = "pwe_vs_safe_room_fort_09_a",
		probability = 1,
		response = "pwe_vs_safe_room_fort_09_a",
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
				"nde_vs_fort_set1_briefing_a",
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
				"fort_pvp",
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
		name = "pwe_vs_safe_room_fort_10_b",
		probability = 1,
		response = "pwe_vs_safe_room_fort_10_b",
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
				"pes_vs_safe_room_fort_10_a",
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
		name = "pwh_level_fort_cannonballs_PVP",
		probability = 1,
		response = "pwh_level_fort_cannonballs_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_cannonballs",
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
				"level_fort_cannonballs",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_cannonballs",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_fire_cannon_final_hit_PVP",
		probability = 1,
		response = "pwh_level_fort_fire_cannon_final_hit_PVP",
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
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_fire_cannon_first_hit_PVP",
		probability = 1,
		response = "pwh_level_fort_fire_cannon_first_hit_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_fire_cannon_first_hit",
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
				"level_fort_fire_cannon_first_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_first_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_fire_cannon_second_hit_PVP",
		probability = 1,
		response = "pwh_level_fort_fire_cannon_second_hit_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_fire_cannon_second_hit",
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
				"level_fort_fire_cannon_second_hit",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_second_hit",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_plague_claw_shelling_move_PVP",
		probability = 1,
		response = "pwh_level_fort_plague_claw_shelling_move_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_plague_claw_shelling_move",
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
				"level_fort_plague_claw_shelling_move",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_plague_claw_shelling_move",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_fort_under_attack_PVP",
		probability = 1,
		response = "pwh_level_fort_under_attack_PVP",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"level_fort_under_attack",
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
				"level_fort_under_attack",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_under_attack",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_vs_safe_room_fort_01_a",
		probability = 1,
		response = "pwh_vs_safe_room_fort_01_a",
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
				"nde_vs_fort_set1_briefing_a",
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
				"fort_pvp",
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
		name = "pwh_vs_safe_room_fort_02_b",
		probability = 1,
		response = "pwh_vs_safe_room_fort_02_b",
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
				"pbw_vs_safe_room_fort_02_a",
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
		name = "pwh_vs_safe_room_fort_03_b",
		probability = 1,
		response = "pwh_vs_safe_room_fort_03_b",
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
				"pdr_vs_safe_room_fort_03_a",
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
		name = "pwh_vs_safe_room_fort_04_b",
		probability = 1,
		response = "pwh_vs_safe_room_fort_04_b",
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
				"pwe_vs_safe_room_fort_04_a",
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
		name = "pwh_vs_safe_room_fort_05_b",
		probability = 1,
		response = "pwh_vs_safe_room_fort_05_b",
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
				"pes_vs_safe_room_fort_05_a",
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
		name = "pwh_vs_safe_room_fort_06_a",
		probability = 1,
		response = "pwh_vs_safe_room_fort_06_a",
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
				"nde_vs_fort_set1_briefing_a",
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
				"fort_pvp",
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
		name = "pwh_vs_safe_room_fort_07_b",
		probability = 1,
		response = "pwh_vs_safe_room_fort_07_b",
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
				"pbw_vs_safe_room_fort_07_a",
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
		name = "pwh_vs_safe_room_fort_08_b",
		probability = 1,
		response = "pwh_vs_safe_room_fort_08_b",
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
				"pdr_vs_safe_room_fort_08_a",
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
		name = "pwh_vs_safe_room_fort_09_b",
		probability = 1,
		response = "pwh_vs_safe_room_fort_09_b",
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
				"pwe_vs_safe_room_fort_09_a",
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
		name = "pwh_vs_safe_room_fort_10_b",
		probability = 1,
		response = "pwh_vs_safe_room_fort_10_b",
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
				"pes_vs_safe_room_fort_10_a",
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
		nde_vs_fort_set1_briefing_a = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set1_briefing_a_01",
				"nde_vs_fort_set1_briefing_a_02",
				"nde_vs_fort_set1_briefing_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_vs_fort_set1_briefing_a_01",
				"nde_vs_fort_set1_briefing_a_02",
				"nde_vs_fort_set1_briefing_a_03",
			},
			sound_events_duration = {
				7.9663753509522,
				6.7640833854675,
				11.140250205994,
			},
		},
		nde_vs_fort_set1_obj1_a = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set1_obj1_a_01",
				"nde_vs_fort_set1_obj1_a_02",
				"nde_vs_fort_set1_obj1_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set1_obj1_a_01",
				"nde_vs_fort_set1_obj1_a_02",
				"nde_vs_fort_set1_obj1_a_03",
			},
			sound_events_duration = {
				5.0760002136231,
				5.4793334007263,
				5.6435418128967,
			},
		},
		nde_vs_fort_set1_obj1_reached = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
		nde_vs_fort_set1_obj2_a = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set1_obj2_a_01",
				"nde_vs_fort_set1_obj2_a_02",
				"nde_vs_fort_set1_obj2_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set1_obj2_a_01",
				"nde_vs_fort_set1_obj2_a_02",
				"nde_vs_fort_set1_obj2_a_03",
			},
			sound_events_duration = {
				4.5055418014526,
				3.3772292137146,
				5.0829586982727,
			},
		},
		nde_vs_fort_set1_obj2_reached = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set1_obj2_event_a_01",
				"nde_vs_fort_set1_obj2_event_a_02",
				"nde_vs_fort_set1_obj2_event_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set1_obj2_event_a_01",
				"nde_vs_fort_set1_obj2_event_a_02",
				"nde_vs_fort_set1_obj2_event_a_03",
			},
			sound_events_duration = {
				4.4154586791992,
				4.4720001220703,
				4.1287498474121,
			},
		},
		nde_vs_fort_set1_safe_room_reminder = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_safe_room_near_a_01",
				"nde_vs_safe_room_near_a_02",
				"nde_vs_safe_room_near_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_safe_room_near_a_01",
				"nde_vs_safe_room_near_a_02",
				"nde_vs_safe_room_near_a_03",
			},
			sound_events_duration = {
				2.7338125705719,
				2.0170834064484,
				2.5909998416901,
			},
		},
		nde_vs_fort_set2_obj1_a = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set2_obj1_a_01",
				"nde_vs_fort_set2_obj1_a_02",
				"nde_vs_fort_set2_obj1_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set2_obj1_a_01",
				"nde_vs_fort_set2_obj1_a_02",
				"nde_vs_fort_set2_obj1_a_03",
			},
			sound_events_duration = {
				4.4107084274292,
				3.9607291221619,
				4.1736669540405,
			},
		},
		nde_vs_fort_set2_obj1_reached_p1 = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set2_obj1_event_A_a_01",
				"nde_vs_fort_set2_obj1_event_A_a_02",
				"nde_vs_fort_set2_obj1_event_A_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set2_obj1_event_A_a_01",
				"nde_vs_fort_set2_obj1_event_A_a_02",
				"nde_vs_fort_set2_obj1_event_A_a_03",
			},
			sound_events_duration = {
				3.9860000610352,
				4.6146669387817,
				4.261125087738,
			},
		},
		nde_vs_fort_set2_obj1_reached_p2 = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set2_obj1_event_C_a_01",
				"nde_vs_fort_set2_obj1_event_C_a_02",
				"nde_vs_fort_set2_obj1_event_C_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set2_obj1_event_C_a_01",
				"nde_vs_fort_set2_obj1_event_C_a_02",
				"nde_vs_fort_set2_obj1_event_C_a_03",
			},
			sound_events_duration = {
				3.7289791107178,
				3.0801665782928,
				5.8835000991821,
			},
		},
		nde_vs_fort_set2_obj2_a = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set2_obj2_a_01",
				"nde_vs_fort_set2_obj2_a_02",
				"nde_vs_fort_set2_obj2_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set2_obj2_a_01",
				"nde_vs_fort_set2_obj2_a_02",
				"nde_vs_fort_set2_obj2_a_03",
			},
			sound_events_duration = {
				3.7451040744781,
				4.5869793891907,
				5.8270626068115,
			},
		},
		nde_vs_fort_set2_obj2_a_BRIDGE = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"nde_vs_new_objective_intro_a_03",
				"nde_vs_new_objective_intro_a_04",
				"nde_vs_new_objective_intro_a_05",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_new_objective_intro_a_03",
				"nde_vs_new_objective_intro_a_04",
				"nde_vs_new_objective_intro_a_05",
			},
			sound_events_duration = {
				2.8559999465942,
				2.7655208110809,
				2.8721873760223,
			},
		},
		nde_vs_fort_set2_obj2_reached = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set2_obj2_event_a_01",
				"nde_vs_fort_set2_obj2_event_a_02",
				"nde_vs_fort_set2_obj2_event_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set2_obj2_event_a_01",
				"nde_vs_fort_set2_obj2_event_a_02",
				"nde_vs_fort_set2_obj2_event_a_03",
			},
			sound_events_duration = {
				4.0353336334228,
				4.9609999656677,
				5.3905625343323,
			},
		},
		nde_vs_fort_set3_obj1_a = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set3_obj1_a_01",
				"nde_vs_fort_set3_obj1_a_02",
				"nde_vs_fort_set3_obj1_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set3_obj1_a_01",
				"nde_vs_fort_set3_obj1_a_02",
				"nde_vs_fort_set3_obj1_a_03",
			},
			sound_events_duration = {
				5.9097499847412,
				5.1950416564941,
				6.2532711029053,
			},
		},
		nde_vs_fort_set3_obj2_a = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set3_obj2_a_01",
				"nde_vs_fort_set3_obj2_a_02",
				"nde_vs_fort_set3_obj2_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set3_obj2_a_01",
				"nde_vs_fort_set3_obj2_a_02",
				"nde_vs_fort_set3_obj2_a_03",
			},
			sound_events_duration = {
				4.9727501869202,
				4.1231250762939,
				5.7756042480469,
			},
		},
		nde_vs_fort_set3_obj2_reached_p1 = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			only_allies = true,
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
				[1] = "nde_vs_agnostic_go_gate_a_01",
				[2] = "nde_vs_agnostic_go_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "nde_vs_agnostic_go_gate_a_01",
				[2] = "nde_vs_agnostic_go_gate_a_02",
			},
			sound_events_duration = {
				[1] = 3.4189999103546,
				[2] = 3.0579998493195,
			},
		},
		nde_vs_fort_set3_obj2_reached_p2 = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set3_obj2_event_B_a_01",
				"nde_vs_fort_set3_obj2_event_B_a_02",
				"nde_vs_fort_set3_obj2_event_B_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set3_obj2_event_B_a_01",
				"nde_vs_fort_set3_obj2_event_B_a_02",
				"nde_vs_fort_set3_obj2_event_B_a_03",
			},
			sound_events_duration = {
				3.6325833797455,
				4.3700003623962,
				5.1860003471375,
			},
		},
		nde_vs_fort_set3_obj3_reached = {
			category = "npc_talk",
			database = "vs_level_fort_pvp",
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
				"nde_vs_fort_set3_obj3_event_a_a_01",
				"nde_vs_fort_set3_obj3_event_a_a_02",
				"nde_vs_fort_set3_obj3_event_a_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_fort_set3_obj3_event_a_a_01",
				"nde_vs_fort_set3_obj3_event_a_a_02",
				"nde_vs_fort_set3_obj3_event_a_a_03",
			},
			sound_events_duration = {
				4.8071670532227,
				4.6792502403259,
				4.9893336296081,
			},
		},
		pbw_level_fort_cannonballs_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pbw_level_fort_cannonballs_01",
				[2] = "pbw_level_fort_cannonballs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_cannonballs_01",
				[2] = "pbw_level_fort_cannonballs_02",
			},
			sound_events_duration = {
				[1] = 3.9113540649414,
				[2] = 3.4015834331513,
			},
		},
		pbw_level_fort_fire_cannon_final_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pbw_level_fort_fire_cannon_final_fire_01",
				[2] = "pbw_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_fire_cannon_final_fire_01",
				[2] = "pbw_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 4.1717081069946,
				[2] = 4.5877914428711,
			},
		},
		pbw_level_fort_fire_cannon_first_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pbw_level_fort_fire_cannon_first_hit_01",
				[2] = "pbw_level_fort_fire_cannon_first_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_fire_cannon_first_hit_01",
				[2] = "pbw_level_fort_fire_cannon_first_hit_02",
			},
			sound_events_duration = {
				[1] = 3.5760416984558,
				[2] = 3.648895740509,
			},
		},
		pbw_level_fort_fire_cannon_second_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pbw_level_fort_fire_cannon_second_hit_01",
				[2] = "pbw_level_fort_fire_cannon_second_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_level_fort_fire_cannon_second_hit_01",
				[2] = "pbw_level_fort_fire_cannon_second_hit_02",
			},
			sound_events_duration = {
				[1] = 4.202166557312,
				[2] = 7.2180833816528,
			},
		},
		pbw_vs_safe_room_fort_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pbw_vs_safe_room_fort_01_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_fort_01_b_01",
			},
			sound_events_duration = {
				[1] = 2.2170207500458,
			},
		},
		pbw_vs_safe_room_fort_02_a = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pbw_vs_safe_room_fort_02_a_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_fort_02_a_01",
			},
			sound_events_duration = {
				[1] = 4.7363748550415,
			},
		},
		pbw_vs_safe_room_fort_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pbw_vs_safe_room_fort_03_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_fort_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.5098748207092,
			},
		},
		pbw_vs_safe_room_fort_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pbw_vs_safe_room_fort_04_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_fort_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.8763749599457,
			},
		},
		pbw_vs_safe_room_fort_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pbw_vs_safe_room_fort_05_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_fort_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.3159375190735,
			},
		},
		pbw_vs_safe_room_fort_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pbw_vs_safe_room_fort_06_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_fort_06_b_01",
			},
			sound_events_duration = {
				[1] = 3.6368541717529,
			},
		},
		pbw_vs_safe_room_fort_07_a = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pbw_vs_safe_room_fort_07_a_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_fort_07_a_01",
			},
			sound_events_duration = {
				[1] = 2.6355834007263,
			},
		},
		pbw_vs_safe_room_fort_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pbw_vs_safe_room_fort_08_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_fort_08_b_01",
			},
			sound_events_duration = {
				[1] = 2.8826665878296,
			},
		},
		pbw_vs_safe_room_fort_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pbw_vs_safe_room_fort_09_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_fort_09_b_01",
			},
			sound_events_duration = {
				[1] = 2.4403958320618,
			},
		},
		pbw_vs_safe_room_fort_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pbw_vs_safe_room_fort_10_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_fort_10_b_01",
			},
			sound_events_duration = {
				[1] = 2.5056667327881,
			},
		},
		pdr_level_fort_cannonballs_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pdr_level_fort_cannonballs_01",
				[2] = "pdr_level_fort_cannonballs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_cannonballs_01",
				[2] = "pdr_level_fort_cannonballs_02",
			},
			sound_events_duration = {
				[1] = 2.6036667823791,
				[2] = 3.5911250114441,
			},
		},
		pdr_level_fort_fire_cannon_final_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pdr_level_fort_fire_cannon_final_fire_01",
				[2] = "pdr_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_fire_cannon_final_fire_01",
				[2] = "pdr_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 4.3071041107178,
				[2] = 3.9170207977295,
			},
		},
		pdr_level_fort_fire_cannon_first_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pdr_level_fort_fire_cannon_first_hit_01",
				[2] = "pdr_level_fort_fire_cannon_first_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_fire_cannon_first_hit_01",
				[2] = "pdr_level_fort_fire_cannon_first_hit_02",
			},
			sound_events_duration = {
				[1] = 4.9608335494995,
				[2] = 6.5361876487732,
			},
		},
		pdr_level_fort_fire_cannon_second_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pdr_level_fort_fire_cannon_second_hit_01",
				[2] = "pdr_level_fort_fire_cannon_second_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_fire_cannon_second_hit_01",
				[2] = "pdr_level_fort_fire_cannon_second_hit_02",
			},
			sound_events_duration = {
				[1] = 6.4185833930969,
				[2] = 9.1484794616699,
			},
		},
		pdr_level_fort_plague_claw_shelling_move_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pdr_level_fort_plague_claw_shelling_move_01",
				[2] = "pdr_level_fort_plague_claw_shelling_move_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_plague_claw_shelling_move_01",
				[2] = "pdr_level_fort_plague_claw_shelling_move_02",
			},
			sound_events_duration = {
				[1] = 2.6545832157135,
				[2] = 2.830958366394,
			},
		},
		pdr_level_fort_under_attack_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_level_fort_under_attack_01",
				[2] = "pdr_level_fort_under_attack_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_level_fort_under_attack_01",
				[2] = "pdr_level_fort_under_attack_02",
			},
			sound_events_duration = {
				[1] = 5.0784792900085,
				[2] = 5.9916667938232,
			},
		},
		pdr_vs_safe_room_fort_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pdr_vs_safe_room_fort_01_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_fort_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.797833442688,
			},
		},
		pdr_vs_safe_room_fort_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pdr_vs_safe_room_fort_02_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_fort_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.50745844841,
			},
		},
		pdr_vs_safe_room_fort_03_a = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pdr_vs_safe_room_fort_03_a_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_fort_03_a_01",
			},
			sound_events_duration = {
				[1] = 5.6551876068115,
			},
		},
		pdr_vs_safe_room_fort_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pdr_vs_safe_room_fort_04_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_fort_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.0968124866486,
			},
		},
		pdr_vs_safe_room_fort_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pdr_vs_safe_room_fort_05_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_fort_05_b_01",
			},
			sound_events_duration = {
				[1] = 4.0285415649414,
			},
		},
		pdr_vs_safe_room_fort_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pdr_vs_safe_room_fort_06_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_fort_06_b_01",
			},
			sound_events_duration = {
				[1] = 2.5963749885559,
			},
		},
		pdr_vs_safe_room_fort_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pdr_vs_safe_room_fort_07_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_fort_07_b_01",
			},
			sound_events_duration = {
				[1] = 3.7863540649414,
			},
		},
		pdr_vs_safe_room_fort_08_a = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pdr_vs_safe_room_fort_08_a_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_fort_08_a_01",
			},
			sound_events_duration = {
				[1] = 5.0722498893738,
			},
		},
		pdr_vs_safe_room_fort_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pdr_vs_safe_room_fort_09_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_fort_09_b_01",
			},
			sound_events_duration = {
				[1] = 2.4271874427795,
			},
		},
		pdr_vs_safe_room_fort_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pdr_vs_safe_room_fort_10_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_fort_10_b_01",
			},
			sound_events_duration = {
				[1] = 2.395229101181,
			},
		},
		pes_level_fort_cannonballs_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_fort_cannonballs_01",
				[2] = "pes_level_fort_cannonballs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_cannonballs_01",
				[2] = "pes_level_fort_cannonballs_02",
			},
			sound_events_duration = {
				[1] = 1.9230833053589,
				[2] = 3.3242499828339,
			},
		},
		pes_level_fort_fire_cannon_final_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_fort_fire_cannon_final_fire_01",
				[2] = "pes_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_fire_cannon_final_fire_01",
				[2] = "pes_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 5.5894584655762,
				[2] = 5.2293853759766,
			},
		},
		pes_level_fort_fire_cannon_first_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_fort_fire_cannon_first_hit_01",
				[2] = "pes_level_fort_fire_cannon_first_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_fire_cannon_first_hit_01",
				[2] = "pes_level_fort_fire_cannon_first_hit_02",
			},
			sound_events_duration = {
				[1] = 4.1897916793823,
				[2] = 5.9237289428711,
			},
		},
		pes_level_fort_fire_cannon_second_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_fort_fire_cannon_second_hit_01",
				[2] = "pes_level_fort_fire_cannon_second_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_fire_cannon_second_hit_01",
				[2] = "pes_level_fort_fire_cannon_second_hit_02",
			},
			sound_events_duration = {
				[1] = 3.8996665477753,
				[2] = 5.3803334236145,
			},
		},
		pes_level_fort_plague_claw_shelling_move_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_fort_plague_claw_shelling_move_01",
				[2] = "pes_level_fort_plague_claw_shelling_move_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_plague_claw_shelling_move_01",
				[2] = "pes_level_fort_plague_claw_shelling_move_02",
			},
			sound_events_duration = {
				[1] = 1.8506457805634,
				[2] = 3.012312412262,
			},
		},
		pes_level_fort_under_attack_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_fort_under_attack_01",
				[2] = "pes_level_fort_under_attack_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_fort_under_attack_01",
				[2] = "pes_level_fort_under_attack_02",
			},
			sound_events_duration = {
				[1] = 4.9742918014526,
				[2] = 4.160041809082,
			},
		},
		pes_vs_safe_room_fort_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pes_vs_safe_room_fort_01_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_fort_01_b_01",
			},
			sound_events_duration = {
				[1] = 2.5515832901001,
			},
		},
		pes_vs_safe_room_fort_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pes_vs_safe_room_fort_02_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_fort_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.2567081451416,
			},
		},
		pes_vs_safe_room_fort_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pes_vs_safe_room_fort_03_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_fort_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.2109167575836,
			},
		},
		pes_vs_safe_room_fort_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pes_vs_safe_room_fort_04_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_fort_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.2974998950958,
			},
		},
		pes_vs_safe_room_fort_05_a = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pes_vs_safe_room_fort_05_a_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_fort_05_a_01",
			},
			sound_events_duration = {
				[1] = 7.6169166564941,
			},
		},
		pes_vs_safe_room_fort_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pes_vs_safe_room_fort_06_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_fort_06_b_01",
			},
			sound_events_duration = {
				[1] = 2.4556457996368,
			},
		},
		pes_vs_safe_room_fort_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pes_vs_safe_room_fort_07_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_fort_07_b_01",
			},
			sound_events_duration = {
				[1] = 2.6188750267029,
			},
		},
		pes_vs_safe_room_fort_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pes_vs_safe_room_fort_08_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_fort_08_b_01",
			},
			sound_events_duration = {
				[1] = 2.9717500209808,
			},
		},
		pes_vs_safe_room_fort_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pes_vs_safe_room_fort_09_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_fort_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.7673332691193,
			},
		},
		pes_vs_safe_room_fort_10_a = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pes_vs_safe_room_fort_10_a_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_fort_10_a_01",
			},
			sound_events_duration = {
				[1] = 3.7226042747498,
			},
		},
		pwe_level_fort_cannonballs_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwe_level_fort_cannonballs_01",
				[2] = "pwe_level_fort_cannonballs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_cannonballs_01",
				[2] = "pwe_level_fort_cannonballs_02",
			},
			sound_events_duration = {
				[1] = 2.3011040687561,
				[2] = 3.2113125324249,
			},
		},
		pwe_level_fort_fire_cannon_final_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwe_level_fort_fire_cannon_final_fire_01",
				[2] = "pwe_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_fire_cannon_final_fire_01",
				[2] = "pwe_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 2.3011667728424,
				[2] = 1.971083343029,
			},
		},
		pwe_level_fort_fire_cannon_first_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwe_level_fort_fire_cannon_first_hit_01",
				[2] = "pwe_level_fort_fire_cannon_first_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_fire_cannon_first_hit_01",
				[2] = "pwe_level_fort_fire_cannon_first_hit_02",
			},
			sound_events_duration = {
				[1] = 3.6615207195282,
				[2] = 3.0288333892822,
			},
		},
		pwe_level_fort_fire_cannon_second_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwe_level_fort_fire_cannon_second_hit_01",
				[2] = "pwe_level_fort_fire_cannon_second_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_level_fort_fire_cannon_second_hit_01",
				[2] = "pwe_level_fort_fire_cannon_second_hit_02",
			},
			sound_events_duration = {
				[1] = 2.1298542022705,
				[2] = 3.5463540554047,
			},
		},
		pwe_level_fort_plague_claw_shelling_move_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
			},
			localization_strings = {
				"pwe_level_fort_plague_claw_shelling_move_01",
				"pwe_level_fort_plague_claw_shelling_move_02",
				"pwe_level_fort_plague_claw_shelling_move_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_level_fort_plague_claw_shelling_move_01",
				"pwe_level_fort_plague_claw_shelling_move_02",
				"pwe_level_fort_plague_claw_shelling_move_03",
			},
			sound_events_duration = {
				3.9244167804718,
				3.5269999504089,
				3.3503124713898,
			},
		},
		pwe_vs_safe_room_fort_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwe_vs_safe_room_fort_01_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_fort_01_b_01",
			},
			sound_events_duration = {
				[1] = 4.6542916297913,
			},
		},
		pwe_vs_safe_room_fort_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwe_vs_safe_room_fort_02_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_fort_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.9508543014526,
			},
		},
		pwe_vs_safe_room_fort_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwe_vs_safe_room_fort_03_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_fort_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.7288749217987,
			},
		},
		pwe_vs_safe_room_fort_04_a = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwe_vs_safe_room_fort_04_a_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_fort_04_a_01",
			},
			sound_events_duration = {
				[1] = 5.6119999885559,
			},
		},
		pwe_vs_safe_room_fort_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwe_vs_safe_room_fort_05_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_fort_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.8127291202545,
			},
		},
		pwe_vs_safe_room_fort_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwe_vs_safe_room_fort_06_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_fort_06_b_01",
			},
			sound_events_duration = {
				[1] = 3.4481041431427,
			},
		},
		pwe_vs_safe_room_fort_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwe_vs_safe_room_fort_07_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_fort_07_b_01",
			},
			sound_events_duration = {
				[1] = 4.2947916984558,
			},
		},
		pwe_vs_safe_room_fort_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwe_vs_safe_room_fort_08_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_fort_08_b_01",
			},
			sound_events_duration = {
				[1] = 3.9279375076294,
			},
		},
		pwe_vs_safe_room_fort_09_a = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwe_vs_safe_room_fort_09_a_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_fort_09_a_01",
			},
			sound_events_duration = {
				[1] = 4.7335834503174,
			},
		},
		pwe_vs_safe_room_fort_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwe_vs_safe_room_fort_10_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_fort_10_b_01",
			},
			sound_events_duration = {
				[1] = 4.4532084465027,
			},
		},
		pwh_level_fort_cannonballs_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_fort_cannonballs_01",
				[2] = "pwh_level_fort_cannonballs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_cannonballs_01",
				[2] = "pwh_level_fort_cannonballs_02",
			},
			sound_events_duration = {
				[1] = 2.9701249599457,
				[2] = 4.8348541259766,
			},
		},
		pwh_level_fort_fire_cannon_final_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_fort_fire_cannon_final_fire_01",
				[2] = "pwh_level_fort_fire_cannon_final_fire_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_fire_cannon_final_fire_01",
				[2] = "pwh_level_fort_fire_cannon_final_fire_02",
			},
			sound_events_duration = {
				[1] = 5.6393957138061,
				[2] = 5.3575415611267,
			},
		},
		pwh_level_fort_fire_cannon_first_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_fort_fire_cannon_first_hit_01",
				[2] = "pwh_level_fort_fire_cannon_first_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_fire_cannon_first_hit_01",
				[2] = "pwh_level_fort_fire_cannon_first_hit_02",
			},
			sound_events_duration = {
				[1] = 6.9782710075378,
				[2] = 4.97891664505,
			},
		},
		pwh_level_fort_fire_cannon_second_hit_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_fort_fire_cannon_second_hit_01",
				[2] = "pwh_level_fort_fire_cannon_second_hit_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_fire_cannon_second_hit_01",
				[2] = "pwh_level_fort_fire_cannon_second_hit_02",
			},
			sound_events_duration = {
				[1] = 4.9750623703003,
				[2] = 4.7232084274292,
			},
		},
		pwh_level_fort_plague_claw_shelling_move_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_fort_plague_claw_shelling_move_01",
				[2] = "pwh_level_fort_plague_claw_shelling_move_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_level_fort_plague_claw_shelling_move_01",
				[2] = "pwh_level_fort_plague_claw_shelling_move_02",
			},
			sound_events_duration = {
				[1] = 4.7643122673035,
				[2] = 4.915979385376,
			},
		},
		pwh_level_fort_under_attack_PVP = {
			category = "level_talk",
			database = "vs_level_fort_pvp",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
			},
			localization_strings = {
				"pwh_level_fort_under_attack_01",
				"pwh_level_fort_under_attack_02",
				"pwh_level_fort_under_attack_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_fort_under_attack_01",
				"pwh_level_fort_under_attack_02",
				"pwh_level_fort_under_attack_04",
			},
			sound_events_duration = {
				5.583104133606,
				4.9067707061768,
				3.4567,
			},
		},
		pwh_vs_safe_room_fort_01_a = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwh_vs_safe_room_fort_01_a_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_fort_01_a_01",
			},
			sound_events_duration = {
				[1] = 4.2722082138061,
			},
		},
		pwh_vs_safe_room_fort_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwh_vs_safe_room_fort_02_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_fort_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.9129166603088,
			},
		},
		pwh_vs_safe_room_fort_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwh_vs_safe_room_fort_03_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_fort_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.1841042041779,
			},
		},
		pwh_vs_safe_room_fort_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwh_vs_safe_room_fort_04_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_fort_04_b_01",
			},
			sound_events_duration = {
				[1] = 5.8776874542236,
			},
		},
		pwh_vs_safe_room_fort_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwh_vs_safe_room_fort_05_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_fort_05_b_01",
			},
			sound_events_duration = {
				[1] = 5.0357708930969,
			},
		},
		pwh_vs_safe_room_fort_06_a = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwh_vs_safe_room_fort_06_a_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_fort_06_a_01",
			},
			sound_events_duration = {
				[1] = 4.6236248016357,
			},
		},
		pwh_vs_safe_room_fort_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwh_vs_safe_room_fort_07_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_fort_07_b_01",
			},
			sound_events_duration = {
				[1] = 5.5630831718445,
			},
		},
		pwh_vs_safe_room_fort_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwh_vs_safe_room_fort_08_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_fort_08_b_01",
			},
			sound_events_duration = {
				[1] = 3.0412917137146,
			},
		},
		pwh_vs_safe_room_fort_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwh_vs_safe_room_fort_09_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_fort_09_b_01",
			},
			sound_events_duration = {
				[1] = 4.0663123130798,
			},
		},
		pwh_vs_safe_room_fort_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_fort_pvp",
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
				[1] = "pwh_vs_safe_room_fort_10_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_fort_10_b_01",
			},
			sound_events_duration = {
				[1] = 3.7712500095367,
			},
		},
	})
end
