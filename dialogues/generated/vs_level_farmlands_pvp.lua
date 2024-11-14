-- chunkname: @dialogues/generated/vs_level_farmlands_pvp.lua

return function ()
	define_rule({
		name = "nde_vs_farmlands_set1_briefing_a",
		probability = 1,
		response = "nde_vs_farmlands_set1_briefing_a",
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
				"farmlands_pvp",
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
		name = "nde_vs_farmlands_set1_obj1_a",
		probability = 1,
		response = "nde_vs_farmlands_set1_obj1_a",
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
				"farmlands_pvp",
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
		name = "nde_vs_farmlands_set1_obj1_reached",
		probability = 1,
		response = "nde_vs_farmlands_set1_obj1_reached",
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
				"farmlands_pvp",
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
		name = "nde_vs_farmlands_set1_obj2_a",
		probability = 1,
		response = "nde_vs_farmlands_set1_obj2_a",
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
				"farmlands_pvp",
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
		name = "nde_vs_farmlands_set1_obj2_reached",
		probability = 1,
		response = "nde_vs_farmlands_set1_obj2_reached",
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
				"farmlands_pvp",
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
		name = "nde_vs_farmlands_set1_obj3_reached",
		probability = 1,
		response = "nde_vs_farmlands_set1_obj3_reached",
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
				"farmlands_pvp",
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
				"three",
			},
		},
	})
	define_rule({
		name = "nde_vs_farmlands_set2_obj1_COMPLETED",
		probability = 1,
		response = "nde_vs_farmlands_set2_obj1_COMPLETED",
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
				"farmlands_pvp",
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
		name = "nde_vs_farmlands_set2_obj1_a",
		probability = 1,
		response = "nde_vs_farmlands_set2_obj1_a",
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
				"farmlands_pvp",
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
		name = "nde_vs_farmlands_set2_obj1_reached",
		probability = 1,
		response = "nde_vs_farmlands_set2_obj1_reached",
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
				"farmlands_pvp",
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
		name = "nde_vs_farmlands_set2_obj2_reached",
		probability = 1,
		response = "nde_vs_farmlands_set2_obj2_reached",
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
				"farmlands_pvp",
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
		name = "pbw_vs_safe_room_farmlands_01_b",
		probability = 1,
		response = "pbw_vs_safe_room_farmlands_01_b",
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
				"pwh_vs_safe_room_farmlands_01_a",
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
		name = "pbw_vs_safe_room_farmlands_02_a",
		probability = 1,
		response = "pbw_vs_safe_room_farmlands_02_a",
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
				"nde_vs_farmlands_set1_briefing_a",
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
				"farmlands_pvp",
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
		name = "pbw_vs_safe_room_farmlands_03_b",
		probability = 1,
		response = "pbw_vs_safe_room_farmlands_03_b",
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
				"pdr_vs_safe_room_farmlands_03_a",
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
		name = "pbw_vs_safe_room_farmlands_04_b",
		probability = 1,
		response = "pbw_vs_safe_room_farmlands_04_b",
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
				"pwe_vs_safe_room_farmlands_04_a",
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
		name = "pbw_vs_safe_room_farmlands_05_b",
		probability = 1,
		response = "pbw_vs_safe_room_farmlands_05_b",
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
				"pes_vs_safe_room_farmlands_05_a",
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
		name = "pbw_vs_safe_room_farmlands_06_b",
		probability = 1,
		response = "pbw_vs_safe_room_farmlands_06_b",
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
				"pwh_vs_safe_room_farmlands_06_a",
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
		name = "pbw_vs_safe_room_farmlands_07_a",
		probability = 1,
		response = "pbw_vs_safe_room_farmlands_07_a",
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
				"nde_vs_farmlands_set1_briefing_a",
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
				"farmlands_pvp",
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
		name = "pbw_vs_safe_room_farmlands_08_b",
		probability = 1,
		response = "pbw_vs_safe_room_farmlands_08_b",
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
				"pdr_vs_safe_room_farmlands_08_a",
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
		name = "pbw_vs_safe_room_farmlands_09_b",
		probability = 1,
		response = "pbw_vs_safe_room_farmlands_09_b",
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
				"pwe_vs_safe_room_farmlands_09_a",
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
		name = "pbw_vs_safe_room_farmlands_10_b",
		probability = 1,
		response = "pbw_vs_safe_room_farmlands_10_b",
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
				"pes_vs_safe_room_farmlands_10_a",
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
		name = "pdr_vs_safe_room_farmlands_01_b",
		probability = 1,
		response = "pdr_vs_safe_room_farmlands_01_b",
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
				"pwh_vs_safe_room_farmlands_01_a",
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
		name = "pdr_vs_safe_room_farmlands_02_b",
		probability = 1,
		response = "pdr_vs_safe_room_farmlands_02_b",
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
				"pbw_vs_safe_room_farmlands_02_a",
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
		name = "pdr_vs_safe_room_farmlands_03_a",
		probability = 1,
		response = "pdr_vs_safe_room_farmlands_03_a",
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
				"nde_vs_farmlands_set1_briefing_a",
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
				"farmlands_pvp",
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
		name = "pdr_vs_safe_room_farmlands_04_b",
		probability = 1,
		response = "pdr_vs_safe_room_farmlands_04_b",
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
				"pwe_vs_safe_room_farmlands_04_a",
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
		name = "pdr_vs_safe_room_farmlands_05_b",
		probability = 1,
		response = "pdr_vs_safe_room_farmlands_05_b",
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
				"pes_vs_safe_room_farmlands_05_a",
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
		name = "pdr_vs_safe_room_farmlands_06_b",
		probability = 1,
		response = "pdr_vs_safe_room_farmlands_06_b",
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
				"pwh_vs_safe_room_farmlands_06_a",
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
		name = "pdr_vs_safe_room_farmlands_07_b",
		probability = 1,
		response = "pdr_vs_safe_room_farmlands_07_b",
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
				"pbw_vs_safe_room_farmlands_07_a",
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
		name = "pdr_vs_safe_room_farmlands_08_a",
		probability = 1,
		response = "pdr_vs_safe_room_farmlands_08_a",
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
				"nde_vs_farmlands_set1_briefing_a",
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
				"farmlands_pvp",
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
		name = "pdr_vs_safe_room_farmlands_09_b",
		probability = 1,
		response = "pdr_vs_safe_room_farmlands_09_b",
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
				"pwe_vs_safe_room_farmlands_09_a",
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
		name = "pdr_vs_safe_room_farmlands_10_b",
		probability = 1,
		response = "pdr_vs_safe_room_farmlands_10_b",
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
				"pes_vs_safe_room_farmlands_10_a",
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
		name = "pes_vs_safe_room_farmlands_01_b",
		probability = 1,
		response = "pes_vs_safe_room_farmlands_01_b",
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
				"pwh_vs_safe_room_farmlands_01_a",
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
		name = "pes_vs_safe_room_farmlands_02_b",
		probability = 1,
		response = "pes_vs_safe_room_farmlands_02_b",
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
				"pbw_vs_safe_room_farmlands_02_a",
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
		name = "pes_vs_safe_room_farmlands_03_b",
		probability = 1,
		response = "pes_vs_safe_room_farmlands_03_b",
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
				"pdr_vs_safe_room_farmlands_03_a",
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
		name = "pes_vs_safe_room_farmlands_04_b",
		probability = 1,
		response = "pes_vs_safe_room_farmlands_04_b",
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
				"pwe_vs_safe_room_farmlands_04_a",
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
		name = "pes_vs_safe_room_farmlands_05_a",
		probability = 1,
		response = "pes_vs_safe_room_farmlands_05_a",
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
				"nde_vs_farmlands_set1_briefing_a",
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
				"farmlands_pvp",
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
		name = "pes_vs_safe_room_farmlands_06_b",
		probability = 1,
		response = "pes_vs_safe_room_farmlands_06_b",
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
				"pwh_vs_safe_room_farmlands_06_a",
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
		name = "pes_vs_safe_room_farmlands_07_b",
		probability = 1,
		response = "pes_vs_safe_room_farmlands_07_b",
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
				"pbw_vs_safe_room_farmlands_07_a",
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
		name = "pes_vs_safe_room_farmlands_08_b",
		probability = 1,
		response = "pes_vs_safe_room_farmlands_08_b",
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
				"pdr_vs_safe_room_farmlands_08_a",
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
		name = "pes_vs_safe_room_farmlands_09_b",
		probability = 1,
		response = "pes_vs_safe_room_farmlands_09_b",
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
				"pwe_vs_safe_room_farmlands_09_a",
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
		name = "pes_vs_safe_room_farmlands_10_a",
		probability = 1,
		response = "pes_vs_safe_room_farmlands_10_a",
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
				"nde_vs_farmlands_set1_briefing_a",
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
				"farmlands_pvp",
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
		name = "pwe_vs_safe_room_farmlands_01_b",
		probability = 1,
		response = "pwe_vs_safe_room_farmlands_01_b",
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
				"pwh_vs_safe_room_farmlands_01_a",
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
		name = "pwe_vs_safe_room_farmlands_02_b",
		probability = 1,
		response = "pwe_vs_safe_room_farmlands_02_b",
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
				"pbw_vs_safe_room_farmlands_02_a",
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
		name = "pwe_vs_safe_room_farmlands_03_b",
		probability = 1,
		response = "pwe_vs_safe_room_farmlands_03_b",
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
				"pdr_vs_safe_room_farmlands_03_a",
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
		name = "pwe_vs_safe_room_farmlands_04_a",
		probability = 1,
		response = "pwe_vs_safe_room_farmlands_04_a",
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
				"nde_vs_farmlands_set1_briefing_a",
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
				"farmlands_pvp",
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
		name = "pwe_vs_safe_room_farmlands_05_b",
		probability = 1,
		response = "pwe_vs_safe_room_farmlands_05_b",
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
				"pes_vs_safe_room_farmlands_05_a",
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
		name = "pwe_vs_safe_room_farmlands_06_b",
		probability = 1,
		response = "pwe_vs_safe_room_farmlands_06_b",
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
				"pwh_vs_safe_room_farmlands_06_a",
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
		name = "pwe_vs_safe_room_farmlands_07_b",
		probability = 1,
		response = "pwe_vs_safe_room_farmlands_07_b",
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
				"pbw_vs_safe_room_farmlands_07_a",
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
		name = "pwe_vs_safe_room_farmlands_08_b",
		probability = 1,
		response = "pwe_vs_safe_room_farmlands_08_b",
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
				"pdr_vs_safe_room_farmlands_08_a",
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
		name = "pwe_vs_safe_room_farmlands_09_a",
		probability = 1,
		response = "pwe_vs_safe_room_farmlands_09_a",
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
				"nde_vs_farmlands_set1_briefing_a",
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
				"farmlands_pvp",
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
		name = "pwe_vs_safe_room_farmlands_10_b",
		probability = 1,
		response = "pwe_vs_safe_room_farmlands_10_b",
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
				"pes_vs_safe_room_farmlands_10_a",
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
		name = "pwh_vs_safe_room_farmlands_01_a",
		probability = 1,
		response = "pwh_vs_safe_room_farmlands_01_a",
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
				"nde_vs_farmlands_set1_briefing_a",
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
				"farmlands_pvp",
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
		name = "pwh_vs_safe_room_farmlands_02_b",
		probability = 1,
		response = "pwh_vs_safe_room_farmlands_02_b",
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
				"pbw_vs_safe_room_farmlands_02_a",
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
		name = "pwh_vs_safe_room_farmlands_03_b",
		probability = 1,
		response = "pwh_vs_safe_room_farmlands_03_b",
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
				"pdr_vs_safe_room_farmlands_03_a",
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
		name = "pwh_vs_safe_room_farmlands_04_b",
		probability = 1,
		response = "pwh_vs_safe_room_farmlands_04_b",
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
				"pwe_vs_safe_room_farmlands_04_a",
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
		name = "pwh_vs_safe_room_farmlands_05_b",
		probability = 1,
		response = "pwh_vs_safe_room_farmlands_05_b",
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
				"pes_vs_safe_room_farmlands_05_a",
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
		name = "pwh_vs_safe_room_farmlands_06_a",
		probability = 1,
		response = "pwh_vs_safe_room_farmlands_06_a",
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
				"nde_vs_farmlands_set1_briefing_a",
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
				"farmlands_pvp",
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
		name = "pwh_vs_safe_room_farmlands_07_b",
		probability = 1,
		response = "pwh_vs_safe_room_farmlands_07_b",
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
				"pbw_vs_safe_room_farmlands_07_a",
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
		name = "pwh_vs_safe_room_farmlands_08_b",
		probability = 1,
		response = "pwh_vs_safe_room_farmlands_08_b",
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
				"pdr_vs_safe_room_farmlands_08_a",
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
		name = "pwh_vs_safe_room_farmlands_09_b",
		probability = 1,
		response = "pwh_vs_safe_room_farmlands_09_b",
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
				"pwe_vs_safe_room_farmlands_09_a",
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
		name = "pwh_vs_safe_room_farmlands_10_b",
		probability = 1,
		response = "pwh_vs_safe_room_farmlands_10_b",
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
				"pes_vs_safe_room_farmlands_10_a",
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
		nde_vs_farmlands_set1_briefing_a = {
			category = "npc_talk",
			database = "vs_level_farmlands_pvp",
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
				"nde_vs_farmlands_set1_briefing_a_01",
				"nde_vs_farmlands_set1_briefing_a_02",
				"nde_vs_farmlands_set1_briefing_a_03",
			},
			randomize_indexes = {},
			sound_distance = math.huge,
			sound_events = {
				"nde_vs_farmlands_set1_briefing_a_01",
				"nde_vs_farmlands_set1_briefing_a_02",
				"nde_vs_farmlands_set1_briefing_a_03",
			},
			sound_events_duration = {
				6.7516670227051,
				8.3739585876465,
				7.7105212211609,
			},
		},
		nde_vs_farmlands_set1_obj1_a = {
			category = "npc_talk",
			database = "vs_level_farmlands_pvp",
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
				"nde_vs_farmlands_set1_obj1_a_01",
				"nde_vs_farmlands_set1_obj1_a_02",
				"nde_vs_farmlands_set1_obj1_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_farmlands_set1_obj1_a_01",
				"nde_vs_farmlands_set1_obj1_a_02",
				"nde_vs_farmlands_set1_obj1_a_03",
			},
			sound_events_duration = {
				3.9414792060852,
				4.8791460990906,
				4.6409583091736,
			},
		},
		nde_vs_farmlands_set1_obj1_reached = {
			category = "npc_talk",
			database = "vs_level_farmlands_pvp",
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
		nde_vs_farmlands_set1_obj2_a = {
			category = "npc_talk",
			database = "vs_level_farmlands_pvp",
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
		nde_vs_farmlands_set1_obj2_reached = {
			category = "npc_talk",
			database = "vs_level_farmlands_pvp",
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
				"nde_vs_farmlands_set1_obj2_event_a_01",
				"nde_vs_farmlands_set1_obj2_event_a_02",
				"nde_vs_farmlands_set1_obj2_event_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_farmlands_set1_obj2_event_a_01",
				"nde_vs_farmlands_set1_obj2_event_a_02",
				"nde_vs_farmlands_set1_obj2_event_a_03",
			},
			sound_events_duration = {
				4.7190003395081,
				5.125,
				4.1960000991821,
			},
		},
		nde_vs_farmlands_set1_obj3_reached = {
			category = "npc_talk",
			database = "vs_level_farmlands_pvp",
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
		nde_vs_farmlands_set2_obj1_COMPLETED = {
			category = "npc_talk",
			database = "vs_level_farmlands_pvp",
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
		nde_vs_farmlands_set2_obj1_a = {
			category = "npc_talk",
			database = "vs_level_farmlands_pvp",
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
				"nde_vs_farmlands_set2_obj1_a_01",
				"nde_vs_farmlands_set2_obj1_a_02",
				"nde_vs_farmlands_set2_obj1_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_farmlands_set2_obj1_a_01",
				"nde_vs_farmlands_set2_obj1_a_02",
				"nde_vs_farmlands_set2_obj1_a_03",
			},
			sound_events_duration = {
				4.2451667785644,
				5.8002710342407,
				7.2957291603088,
			},
		},
		nde_vs_farmlands_set2_obj1_reached = {
			category = "npc_talk",
			database = "vs_level_farmlands_pvp",
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
		nde_vs_farmlands_set2_obj2_reached = {
			category = "npc_talk",
			database = "vs_level_farmlands_pvp",
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
				"nde_vs_farmlands_set2_obj1_event_a_01",
				"nde_vs_farmlands_set2_obj1_event_a_02",
				"nde_vs_farmlands_set2_obj1_event_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_farmlands_set2_obj1_event_a_01",
				"nde_vs_farmlands_set2_obj1_event_a_02",
				"nde_vs_farmlands_set2_obj1_event_a_03",
			},
			sound_events_duration = {
				3.8050000667572,
				3.9679999351502,
				3.925999879837,
			},
		},
		pbw_vs_safe_room_farmlands_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pbw_vs_safe_room_farmlands_01_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_farmlands_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.0035417079926,
			},
		},
		pbw_vs_safe_room_farmlands_02_a = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pbw_vs_safe_room_farmlands_02_a_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_farmlands_02_a_01",
			},
			sound_events_duration = {
				[1] = 4.4626460075378,
			},
		},
		pbw_vs_safe_room_farmlands_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pbw_vs_safe_room_farmlands_03_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_farmlands_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.6458957195282,
			},
		},
		pbw_vs_safe_room_farmlands_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pbw_vs_safe_room_farmlands_04_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_farmlands_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.3992083072662,
			},
		},
		pbw_vs_safe_room_farmlands_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pbw_vs_safe_room_farmlands_05_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_farmlands_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.4467709064484,
			},
		},
		pbw_vs_safe_room_farmlands_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pbw_vs_safe_room_farmlands_06_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_farmlands_06_b_01",
			},
			sound_events_duration = {
				[1] = 3.6949791908264,
			},
		},
		pbw_vs_safe_room_farmlands_07_a = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pbw_vs_safe_room_farmlands_07_a_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_farmlands_07_a_01",
			},
			sound_events_duration = {
				[1] = 5.2989373207092,
			},
		},
		pbw_vs_safe_room_farmlands_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pbw_vs_safe_room_farmlands_08_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_farmlands_08_b_01",
			},
			sound_events_duration = {
				[1] = 3.1816458702087,
			},
		},
		pbw_vs_safe_room_farmlands_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pbw_vs_safe_room_farmlands_09_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_farmlands_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.4003958702087,
			},
		},
		pbw_vs_safe_room_farmlands_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pbw_vs_safe_room_farmlands_10_b_01",
			},
			sound_events = {
				[1] = "pbw_vs_safe_room_farmlands_10_b_01",
			},
			sound_events_duration = {
				[1] = 4.0989999771118,
			},
		},
		pdr_vs_safe_room_farmlands_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pdr_vs_safe_room_farmlands_01_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_farmlands_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.0990834236145,
			},
		},
		pdr_vs_safe_room_farmlands_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pdr_vs_safe_room_farmlands_02_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_farmlands_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.2710208892822,
			},
		},
		pdr_vs_safe_room_farmlands_03_a = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pdr_vs_safe_room_farmlands_03_a_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_farmlands_03_a_01",
			},
			sound_events_duration = {
				[1] = 3.9119791984558,
			},
		},
		pdr_vs_safe_room_farmlands_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pdr_vs_safe_room_farmlands_04_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_farmlands_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.464124917984,
			},
		},
		pdr_vs_safe_room_farmlands_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pdr_vs_safe_room_farmlands_05_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_farmlands_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.9530000686645,
			},
		},
		pdr_vs_safe_room_farmlands_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pdr_vs_safe_room_farmlands_06_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_farmlands_06_b_01",
			},
			sound_events_duration = {
				[1] = 2.5779376029968,
			},
		},
		pdr_vs_safe_room_farmlands_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pdr_vs_safe_room_farmlands_07_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_farmlands_07_b_01",
			},
			sound_events_duration = {
				[1] = 3.4892499446869,
			},
		},
		pdr_vs_safe_room_farmlands_08_a = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pdr_vs_safe_room_farmlands_08_a_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_farmlands_08_a_01",
			},
			sound_events_duration = {
				[1] = 4.1487498283386,
			},
		},
		pdr_vs_safe_room_farmlands_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pdr_vs_safe_room_farmlands_09_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_farmlands_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.7945415973663,
			},
		},
		pdr_vs_safe_room_farmlands_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pdr_vs_safe_room_farmlands_10_b_01",
			},
			sound_events = {
				[1] = "pdr_vs_safe_room_farmlands_10_b_01",
			},
			sound_events_duration = {
				[1] = 5.0745000839233,
			},
		},
		pes_vs_safe_room_farmlands_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pes_vs_safe_room_farmlands_01_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_farmlands_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.9226458072662,
			},
		},
		pes_vs_safe_room_farmlands_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pes_vs_safe_room_farmlands_02_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_farmlands_02_b_01",
			},
			sound_events_duration = {
				[1] = 2.8356041908264,
			},
		},
		pes_vs_safe_room_farmlands_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pes_vs_safe_room_farmlands_03_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_farmlands_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.427791595459,
			},
		},
		pes_vs_safe_room_farmlands_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pes_vs_safe_room_farmlands_04_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_farmlands_04_b_01",
			},
			sound_events_duration = {
				[1] = 1.5718749761581,
			},
		},
		pes_vs_safe_room_farmlands_05_a = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pes_vs_safe_room_farmlands_05_a_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_farmlands_05_a_01",
			},
			sound_events_duration = {
				[1] = 4.3726043701172,
			},
		},
		pes_vs_safe_room_farmlands_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pes_vs_safe_room_farmlands_06_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_farmlands_06_b_01",
			},
			sound_events_duration = {
				[1] = 2.3937082290649,
			},
		},
		pes_vs_safe_room_farmlands_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pes_vs_safe_room_farmlands_07_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_farmlands_07_b_01",
			},
			sound_events_duration = {
				[1] = 2.3162083625794,
			},
		},
		pes_vs_safe_room_farmlands_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pes_vs_safe_room_farmlands_08_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_farmlands_08_b_01",
			},
			sound_events_duration = {
				[1] = 3.2379791736603,
			},
		},
		pes_vs_safe_room_farmlands_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pes_vs_safe_room_farmlands_09_b_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_farmlands_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.7015416622162,
			},
		},
		pes_vs_safe_room_farmlands_10_a = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pes_vs_safe_room_farmlands_10_a_01",
			},
			sound_events = {
				[1] = "pes_vs_safe_room_farmlands_10_a_01",
			},
			sound_events_duration = {
				[1] = 2.6292500495911,
			},
		},
		pwe_vs_safe_room_farmlands_01_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwe_vs_safe_room_farmlands_01_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_farmlands_01_b_01",
			},
			sound_events_duration = {
				[1] = 2.8926250934601,
			},
		},
		pwe_vs_safe_room_farmlands_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwe_vs_safe_room_farmlands_02_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_farmlands_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.4071249961853,
			},
		},
		pwe_vs_safe_room_farmlands_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwe_vs_safe_room_farmlands_03_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_farmlands_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.3552916049957,
			},
		},
		pwe_vs_safe_room_farmlands_04_a = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwe_vs_safe_room_farmlands_04_a_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_farmlands_04_a_01",
			},
			sound_events_duration = {
				[1] = 5.3059167861939,
			},
		},
		pwe_vs_safe_room_farmlands_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwe_vs_safe_room_farmlands_05_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_farmlands_05_b_01",
			},
			sound_events_duration = {
				[1] = 5.1166667938232,
			},
		},
		pwe_vs_safe_room_farmlands_06_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwe_vs_safe_room_farmlands_06_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_farmlands_06_b_01",
			},
			sound_events_duration = {
				[1] = 3.5209584236145,
			},
		},
		pwe_vs_safe_room_farmlands_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwe_vs_safe_room_farmlands_07_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_farmlands_07_b_01",
			},
			sound_events_duration = {
				[1] = 4.6669998168945,
			},
		},
		pwe_vs_safe_room_farmlands_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwe_vs_safe_room_farmlands_08_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_farmlands_08_b_01",
			},
			sound_events_duration = {
				[1] = 3.2480208873749,
			},
		},
		pwe_vs_safe_room_farmlands_09_a = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwe_vs_safe_room_farmlands_09_a_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_farmlands_09_a_01",
			},
			sound_events_duration = {
				[1] = 3.5874583721161,
			},
		},
		pwe_vs_safe_room_farmlands_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwe_vs_safe_room_farmlands_10_b_01",
			},
			sound_events = {
				[1] = "pwe_vs_safe_room_farmlands_10_b_01",
			},
			sound_events_duration = {
				[1] = 2.4079167842865,
			},
		},
		pwh_vs_safe_room_farmlands_01_a = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwh_vs_safe_room_farmlands_01_a_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_farmlands_01_a_01",
			},
			sound_events_duration = {
				[1] = 4.352979183197,
			},
		},
		pwh_vs_safe_room_farmlands_02_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwh_vs_safe_room_farmlands_02_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_farmlands_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.6977708339691,
			},
		},
		pwh_vs_safe_room_farmlands_03_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwh_vs_safe_room_farmlands_03_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_farmlands_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.5203747749329,
			},
		},
		pwh_vs_safe_room_farmlands_04_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwh_vs_safe_room_farmlands_04_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_farmlands_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.7217707633972,
			},
		},
		pwh_vs_safe_room_farmlands_05_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwh_vs_safe_room_farmlands_05_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_farmlands_05_b_01",
			},
			sound_events_duration = {
				[1] = 2.8978540897369,
			},
		},
		pwh_vs_safe_room_farmlands_06_a = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwh_vs_safe_room_farmlands_06_a_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_farmlands_06_a_01",
			},
			sound_events_duration = {
				[1] = 5.5608959197998,
			},
		},
		pwh_vs_safe_room_farmlands_07_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwh_vs_safe_room_farmlands_07_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_farmlands_07_b_01",
			},
			sound_events_duration = {
				[1] = 4.8828539848328,
			},
		},
		pwh_vs_safe_room_farmlands_08_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwh_vs_safe_room_farmlands_08_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_farmlands_08_b_01",
			},
			sound_events_duration = {
				[1] = 4.3715000152588,
			},
		},
		pwh_vs_safe_room_farmlands_09_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwh_vs_safe_room_farmlands_09_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_farmlands_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.7135832309723,
			},
		},
		pwh_vs_safe_room_farmlands_10_b = {
			category = "level_talk_must_play",
			database = "vs_level_farmlands_pvp",
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
				[1] = "pwh_vs_safe_room_farmlands_10_b_01",
			},
			sound_events = {
				[1] = "pwh_vs_safe_room_farmlands_10_b_01",
			},
			sound_events_duration = {
				[1] = 4.4939165115356,
			},
		},
	})
end
