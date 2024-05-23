-- chunkname: @dialogues/generated/vs_npc_vo.lua

return function ()
	define_rule({
		name = "nde_vs_bell_set1_obj1_reached",
		response = "nde_vs_bell_set1_obj1_reached",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_reached",
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"bell_pvp",
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
				1,
			},
		},
	})
	define_rule({
		name = "nde_vs_bell_set1_obj2_reached",
		response = "nde_vs_bell_set1_obj2_reached",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_reached",
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"bell_pvp",
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
				2,
			},
		},
	})
	define_rule({
		name = "nde_vs_bell_set2_obj1_reached",
		response = "nde_vs_bell_set2_obj1_reached",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_reached",
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"bell_pvp",
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
				1,
			},
		},
	})
	define_rule({
		name = "nde_vs_bell_set2_obj2_reached",
		response = "nde_vs_bell_set2_obj2_reached",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_reached",
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"bell_pvp",
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
				2,
			},
		},
	})
	define_rule({
		name = "nde_vs_heroes_team_wipe_a",
		response = "nde_vs_heroes_team_wipe_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_team_wipe",
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
		name = "nde_vs_new_objective_intro_a",
		response = "nde_vs_new_objective_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"objective_completed_vo_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_objective",
				OP.NEQ,
				"safe_room",
			},
			{
				"global_context",
				"current_objective",
				OP.NEQ,
				"waystone",
			},
		},
	})
	define_rule({
		name = "nde_vs_objective_completed_agnostic_a",
		response = "nde_vs_objective_completed_agnostic_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_completed",
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
		name = "nde_vs_objective_completed_final_safe_room_b",
		response = "nde_vs_objective_completed_final_safe_room_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"objective_completed_vo_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
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
		name = "nde_vs_objective_completed_final_waystone_b",
		response = "nde_vs_objective_completed_final_waystone_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"objective_completed_vo_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_objective",
				OP.EQ,
				"waystone",
			},
		},
	})
	define_rule({
		name = "nde_vs_reached_safe_room_a",
		response = "nde_vs_reached_safe_room_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_reached_safe_room",
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
		name = "nde_vs_reached_waystone_a",
		response = "nde_vs_reached_waystone_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_reached_waystone",
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
		name = "nde_vs_safe_room_round_started_a",
		response = "nde_vs_safe_room_round_started_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_left_safe_room",
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
		name = "nde_vs_safe_room_start_a",
		response = "nde_vs_safe_room_start_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_round_start",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"user_memory",
				"mg_round_started_vo",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_round_started_vo",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "nde_vs_set1_obj1_screaming_bell_a",
		response = "nde_vs_set1_obj1_screaming_bell_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"vs_safe_room_start_a",
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"bell_pvp",
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
				1,
			},
		},
	})
	define_rule({
		name = "nde_vs_set1_obj2_screaming_bell_a",
		response = "nde_vs_set1_obj2_screaming_bell_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"new_objective_intro_vo_done",
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"bell_pvp",
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
				2,
			},
		},
	})
	define_rule({
		name = "nde_vs_set2_obj1_screaming_bell_a",
		response = "nde_vs_set2_obj1_screaming_bell_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"vs_safe_room_start_a",
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"bell_pvp",
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
				1,
			},
		},
	})
	define_rule({
		name = "nde_vs_set2_obj2_screaming_bell_a",
		response = "nde_vs_set2_obj2_screaming_bell_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"new_objective_intro_vo_done",
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"vs_heroes_mission_giver",
			},
			{
				"global_context",
				"current_level",
				OP.EQ,
				"bell_pvp",
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
				2,
			},
		},
	})
	define_rule({
		name = "vmg_vs_hero_bright_wizard_dead_a",
		response = "vmg_vs_hero_bright_wizard_dead_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"mg_hero_bright_wizard_dead",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_hero_bright_wizard_dead",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_vs_hero_dwarf_ranger_dead_a",
		response = "vmg_vs_hero_dwarf_ranger_dead_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"mg_hero_dwarf_ranger_dead",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_hero_dwarf_ranger_dead",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_vs_hero_empire_soldier_dead_a",
		response = "vmg_vs_hero_empire_soldier_dead_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"mg_hero_empire_soldier_dead",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_hero_empire_soldier_dead",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_vs_hero_witch_hunter_dead_a",
		response = "vmg_vs_hero_witch_hunter_dead_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"mg_hero_witch_hunter_dead",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_hero_witch_hunter_dead",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_vs_hero_wood_elf_dead_a",
		response = "vmg_vs_hero_wood_elf_dead_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death",
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"mg_hero_wood_elf_dead",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_hero_wood_elf_dead",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_vs_heroes_objective_almost_completed_a",
		response = "vmg_vs_heroes_objective_almost_completed_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_almost_completed",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
		},
	})
	define_rule({
		name = "vmg_vs_heroes_objective_completed_a",
		response = "vmg_vs_heroes_objective_completed_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_objective_completed",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
		},
	})
	define_rule({
		name = "vmg_vs_heroes_objective_completed_b",
		response = "vmg_vs_heroes_objective_completed_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vmg_vs_heroes_objective_completed_a_done",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
		},
	})
	define_rule({
		name = "vmg_vs_heroes_objective_reached_a",
		response = "vmg_vs_heroes_objective_reached_a",
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
				"vs_pactsworn_mission_giver",
			},
		},
	})
	define_rule({
		name = "vmg_vs_heroes_reached_safe_room_a",
		response = "vmg_vs_heroes_reached_safe_room_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_reached_safe_room",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"mg_heroes_reached_safe_room",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_heroes_reached_safe_room",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_vs_heroes_reached_waystone_a",
		response = "vmg_vs_heroes_reached_waystone_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_reached_waystone",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"mg_heroes_reached_waystone",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_heroes_reached_waystone",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_vs_heroes_team_wipe_a",
		response = "vmg_vs_heroes_team_wipe_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_team_wipe",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"mg_heroes_team_wipe",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_heroes_team_wipe",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_vs_new_spawn_horde_a",
		response = "vmg_vs_new_spawn_horde_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"horde",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
		},
	})
	define_rule({
		name = "vmg_vs_new_spawn_monster_a",
		response = "vmg_vs_new_spawn_monster_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_new_spawn_monster",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
		},
	})
	define_rule({
		name = "vmg_vs_pactsworn_wipe_a",
		response = "vmg_vs_pactsworn_wipe_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_pactsworn_wipe",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"mg_pactsworn_wipe",
				OP.LT,
				2,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_pactsworn_wipe",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_vs_round_start_go_a",
		response = "vmg_vs_round_start_go_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_heroes_left_safe_room",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"mg_heroes_left_safe_room",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_heroes_left_safe_room",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "vmg_vs_round_start_rant_a",
		response = "vmg_vs_round_start_rant_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"vs_mg_round_start",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_pactsworn_mission_giver",
			},
			{
				"user_memory",
				"mg_round_started_vo",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"user_memory",
				"mg_round_started_vo",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		nde_vs_bell_set1_obj1_reached = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_objective_sighted_agnostic_object_a_01",
				"nde_vs_objective_sighted_agnostic_object_a_02",
				"nde_vs_objective_sighted_agnostic_object_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_objective_sighted_agnostic_object_a_01",
				"nde_vs_objective_sighted_agnostic_object_a_02",
				"nde_vs_objective_sighted_agnostic_object_a_03",
			},
			sound_events_duration = {
				1.7391874790192,
				2.2400000095367,
				1.7391874790192,
			},
		},
		nde_vs_bell_set1_obj2_reached = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				[1] = "nde_vs_agnostic_open_gate_a_01",
				[2] = "nde_vs_agnostic_open_gate_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "nde_vs_agnostic_open_gate_a_01",
				[2] = "nde_vs_agnostic_open_gate_a_02",
			},
			sound_events_duration = {
				[1] = 1.9509999752045,
				[2] = 2.3269999027252,
			},
		},
		nde_vs_bell_set2_obj1_reached = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_objective_sighted_agnostic_object_a_01",
				"nde_vs_objective_sighted_agnostic_object_a_02",
				"nde_vs_objective_sighted_agnostic_object_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_objective_sighted_agnostic_object_a_01",
				"nde_vs_objective_sighted_agnostic_object_a_02",
				"nde_vs_objective_sighted_agnostic_object_a_03",
			},
			sound_events_duration = {
				1.7391874790192,
				2.2400000095367,
				1.7391874790192,
			},
		},
		nde_vs_bell_set2_obj2_reached = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				[1] = "nde_vs_agnostic_destroy_chains_a_01",
				[2] = "nde_vs_agnostic_destroy_chains_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "nde_vs_agnostic_destroy_chains_a_01",
				[2] = "nde_vs_agnostic_destroy_chains_a_02",
			},
			sound_events_duration = {
				[1] = 2.8659999370575,
				[2] = 3.550999879837,
			},
		},
		nde_vs_heroes_team_wipe_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_heroes_team_wipe_a_01",
				"nde_vs_heroes_team_wipe_a_02",
				"nde_vs_heroes_team_wipe_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_heroes_team_wipe_a_01",
				"nde_vs_heroes_team_wipe_a_02",
				"nde_vs_heroes_team_wipe_a_03",
			},
			sound_events_duration = {
				3.5179998874664,
				3.0899999141693,
				3.2239999771118,
			},
		},
		nde_vs_new_objective_intro_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_allies = true,
			override_awareness = "new_objective_intro_vo_done",
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
				"nde_vs_new_objective_intro_a_01",
				"nde_vs_new_objective_intro_a_02",
				"nde_vs_new_objective_intro_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_new_objective_intro_a_01",
				"nde_vs_new_objective_intro_a_02",
				"nde_vs_new_objective_intro_a_03",
			},
			sound_events_duration = {
				1.8970000743866,
				2.0480000972748,
				2.7360000610352,
			},
		},
		nde_vs_objective_completed_agnostic_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
			dialogue_animations_n = 5,
			face_animations_n = 5,
			only_allies = true,
			override_awareness = "objective_completed_vo_done",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"nde_vs_objective_completed_agnostic_a_01",
				"nde_vs_objective_completed_agnostic_a_02",
				"nde_vs_objective_completed_agnostic_a_03",
				"nde_vs_objective_completed_agnostic_a_04",
				"nde_vs_objective_completed_agnostic_a_05",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_objective_completed_agnostic_a_01",
				"nde_vs_objective_completed_agnostic_a_02",
				"nde_vs_objective_completed_agnostic_a_03",
				"nde_vs_objective_completed_agnostic_a_04",
				"nde_vs_objective_completed_agnostic_a_05",
			},
			sound_events_duration = {
				3.2639999389648,
				2.3220000267029,
				3.9279999732971,
				1.7450001239777,
				1.7391874790192,
			},
		},
		nde_vs_objective_completed_final_safe_room_b = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_objective_completed_final_safe_room_b_01",
				"nde_vs_objective_completed_final_safe_room_b_02",
				"nde_vs_objective_completed_final_safe_room_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_objective_completed_final_safe_room_b_01",
				"nde_vs_objective_completed_final_safe_room_b_02",
				"nde_vs_objective_completed_final_safe_room_b_03",
			},
			sound_events_duration = {
				2.0280001163483,
				1.8819999694824,
				2.5680000782013,
			},
		},
		nde_vs_objective_completed_final_waystone_b = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_objective_completed_final_waystone_b_01",
				"nde_vs_objective_completed_final_waystone_b_02",
				"nde_vs_objective_completed_final_waystone_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_objective_completed_final_waystone_b_01",
				"nde_vs_objective_completed_final_waystone_b_02",
				"nde_vs_objective_completed_final_waystone_b_03",
			},
			sound_events_duration = {
				2.7639999389648,
				1.9939999580383,
				2.6240000724792,
			},
		},
		nde_vs_reached_safe_room_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_reached_safe_room_a_01",
				"nde_vs_reached_safe_room_a_02",
				"nde_vs_reached_safe_room_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_reached_safe_room_a_01",
				"nde_vs_reached_safe_room_a_02",
				"nde_vs_reached_safe_room_a_03",
			},
			sound_events_duration = {
				3.3450000286102,
				3.795000076294,
				2.5739998817444,
			},
		},
		nde_vs_reached_waystone_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_reached_waystone_a_01",
				"nde_vs_reached_waystone_a_02",
				"nde_vs_reached_waystone_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_reached_waystone_a_01",
				"nde_vs_reached_waystone_a_02",
				"nde_vs_reached_waystone_a_03",
			},
			sound_events_duration = {
				3.9570000171661,
				4.5989999771118,
				6.2909998893738,
			},
		},
		nde_vs_safe_room_round_started_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_safe_room_round_started_a_01",
				"nde_vs_safe_room_round_started_a_02",
				"nde_vs_safe_room_round_started_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_safe_room_round_started_a_01",
				"nde_vs_safe_room_round_started_a_02",
				"nde_vs_safe_room_round_started_a_03",
			},
			sound_events_duration = {
				2.4279999732971,
				1.2929999828339,
				1.7400000095367,
			},
		},
		nde_vs_safe_room_start_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_safe_room_start_a_01",
				"nde_vs_safe_room_start_a_02",
				"nde_vs_safe_room_start_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_safe_room_start_a_01",
				"nde_vs_safe_room_start_a_02",
				"nde_vs_safe_room_start_a_03",
			},
			sound_events_duration = {
				4.2536668777466,
				2.7862083911896,
				2.587833404541,
			},
		},
		nde_vs_set1_obj1_screaming_bell_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_set1_obj1_screaming_bell_a_01",
				"nde_vs_set1_obj1_screaming_bell_a_02",
				"nde_vs_set1_obj1_screaming_bell_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_set1_obj1_screaming_bell_a_01",
				"nde_vs_set1_obj1_screaming_bell_a_02",
				"nde_vs_set1_obj1_screaming_bell_a_03",
			},
			sound_events_duration = {
				4.75,
				5.4099998474121,
				4.2329998016357,
			},
		},
		nde_vs_set1_obj2_screaming_bell_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_set1_obj2_screaming_bell_a_01",
				"nde_vs_set1_obj2_screaming_bell_a_02",
				"nde_vs_set1_obj2_screaming_bell_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_set1_obj2_screaming_bell_a_01",
				"nde_vs_set1_obj2_screaming_bell_a_02",
				"nde_vs_set1_obj2_screaming_bell_a_03",
			},
			sound_events_duration = {
				2.9760000705719,
				3.9059998989105,
				3.2149999141693,
			},
		},
		nde_vs_set2_obj1_screaming_bell_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"nde_vs_set2_obj1_screaming_bell_a_01",
				"nde_vs_set2_obj1_screaming_bell_a_02",
				"nde_vs_set2_obj1_screaming_bell_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"nde_vs_set2_obj1_screaming_bell_a_01",
				"nde_vs_set2_obj1_screaming_bell_a_02",
				"nde_vs_set2_obj1_screaming_bell_a_03",
			},
			sound_events_duration = {
				4.3769998550415,
				5.8540000915527,
				5.2300000190735,
			},
		},
		nde_vs_set2_obj2_screaming_bell_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				[1] = "nde_vs_set2_obj2_screaming_bell_a_01",
				[2] = "nde_vs_set2_obj2_screaming_bell_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "nde_vs_set2_obj2_screaming_bell_a_01",
				[2] = "nde_vs_set2_obj2_screaming_bell_a_02",
			},
			sound_events_duration = {
				[1] = 4.1849999427795,
				[2] = 4.8410000801086,
			},
		},
		vmg_vs_hero_bright_wizard_dead_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_hero_bright_wizard_dead_a_01",
				"vmg_a_vs_hero_bright_wizard_dead_a_02",
				"vmg_a_vs_hero_bright_wizard_dead_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_hero_bright_wizard_dead_a_01",
				"vmg_a_vs_hero_bright_wizard_dead_a_02",
				"vmg_a_vs_hero_bright_wizard_dead_a_03",
			},
			sound_events_duration = {
				3.0907000303268,
				3.0907000303268,
				3.0907000303268,
			},
		},
		vmg_vs_hero_dwarf_ranger_dead_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_hero_dwarf_ranger_dead_a_01",
				"vmg_a_vs_hero_dwarf_ranger_dead_a_02",
				"vmg_a_vs_hero_dwarf_ranger_dead_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_hero_dwarf_ranger_dead_a_01",
				"vmg_a_vs_hero_dwarf_ranger_dead_a_02",
				"vmg_a_vs_hero_dwarf_ranger_dead_a_03",
			},
			sound_events_duration = {
				3.0907000303268,
				3.2422504425049,
				3.2675104141235,
			},
		},
		vmg_vs_hero_empire_soldier_dead_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_hero_empire_soldier_dead_a_01",
				"vmg_a_vs_hero_empire_soldier_dead_a_02",
				"vmg_a_vs_hero_empire_soldier_dead_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_hero_empire_soldier_dead_a_01",
				"vmg_a_vs_hero_empire_soldier_dead_a_02",
				"vmg_a_vs_hero_empire_soldier_dead_a_03",
			},
			sound_events_duration = {
				3.0907000303268,
				3.0907000303268,
				4.5402173995972,
			},
		},
		vmg_vs_hero_witch_hunter_dead_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_hero_witch_hunter_dead_a_01",
				"vmg_a_vs_hero_witch_hunter_dead_a_02",
				"vmg_a_vs_hero_witch_hunter_dead_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_hero_witch_hunter_dead_a_01",
				"vmg_a_vs_hero_witch_hunter_dead_a_02",
				"vmg_a_vs_hero_witch_hunter_dead_a_03",
			},
			sound_events_duration = {
				3.0907000303268,
				3.0907000303268,
				3.0907000303268,
			},
		},
		vmg_vs_hero_wood_elf_dead_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_hero_wood_elf_dead_a_01",
				"vmg_a_vs_hero_wood_elf_dead_a_02",
				"vmg_a_vs_hero_wood_elf_dead_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_hero_wood_elf_dead_a_01",
				"vmg_a_vs_hero_wood_elf_dead_a_02",
				"vmg_a_vs_hero_wood_elf_dead_a_03",
			},
			sound_events_duration = {
				3.0907000303268,
				3.0907000303268,
				3.0907000303268,
			},
		},
		vmg_vs_heroes_objective_almost_completed_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_heroes_objective_almost_completed_a_01",
				"vmg_a_vs_heroes_objective_almost_completed_a_02",
				"vmg_a_vs_heroes_objective_almost_completed_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_heroes_objective_almost_completed_a_01",
				"vmg_a_vs_heroes_objective_almost_completed_a_02",
				"vmg_a_vs_heroes_objective_almost_completed_a_03",
			},
			sound_events_duration = {
				3.1276097297669,
				4.0865116119385,
				3.4948487281799,
			},
		},
		vmg_vs_heroes_objective_completed_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			only_allies = true,
			override_awareness = "vmg_vs_heroes_objective_completed_a_done",
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
				"vmg_a_vs_heroes_objective_completed_a_01",
				"vmg_a_vs_heroes_objective_completed_a_02",
				"vmg_a_vs_heroes_objective_completed_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_heroes_objective_completed_a_01",
				"vmg_a_vs_heroes_objective_completed_a_02",
				"vmg_a_vs_heroes_objective_completed_a_03",
			},
			sound_events_duration = {
				4.9278583526611,
				5.2698378562927,
				5.6943969726563,
			},
		},
		vmg_vs_heroes_objective_completed_b = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_heroes_objective_completed_b_01",
				"vmg_a_vs_heroes_objective_completed_b_02",
				"vmg_a_vs_heroes_objective_completed_b_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_heroes_objective_completed_b_01",
				"vmg_a_vs_heroes_objective_completed_b_02",
				"vmg_a_vs_heroes_objective_completed_b_03",
			},
			sound_events_duration = {
				3.5276324748993,
				4.6652965545654,
				4.4437870979309,
			},
		},
		vmg_vs_heroes_objective_reached_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_heroes_objective_reached_a_01",
				"vmg_a_vs_heroes_objective_reached_a_02",
				"vmg_a_vs_heroes_objective_reached_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_heroes_objective_reached_a_01",
				"vmg_a_vs_heroes_objective_reached_a_02",
				"vmg_a_vs_heroes_objective_reached_a_03",
			},
			sound_events_duration = {
				5.2295074462891,
				5.2434129714966,
				6.4028549194336,
			},
		},
		vmg_vs_heroes_reached_safe_room_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_heroes_reached_safe_room_a_01",
				"vmg_a_vs_heroes_reached_safe_room_a_02",
				"vmg_a_vs_heroes_reached_safe_room_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_heroes_reached_safe_room_a_01",
				"vmg_a_vs_heroes_reached_safe_room_a_02",
				"vmg_a_vs_heroes_reached_safe_room_a_03",
			},
			sound_events_duration = {
				5.478129863739,
				8.6326942443848,
				6.9529151916504,
			},
		},
		vmg_vs_heroes_reached_waystone_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_heroes_reached_waystone_a_01",
				"vmg_a_vs_heroes_reached_waystone_a_02",
				"vmg_a_vs_heroes_reached_waystone_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_heroes_reached_waystone_a_01",
				"vmg_a_vs_heroes_reached_waystone_a_02",
				"vmg_a_vs_heroes_reached_waystone_a_03",
			},
			sound_events_duration = {
				6.6480159759522,
				7.7145962715149,
				7.119047164917,
			},
		},
		vmg_vs_heroes_team_wipe_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_heroes_team_wipe_a_01",
				"vmg_a_vs_heroes_team_wipe_a_02",
				"vmg_a_vs_heroes_team_wipe_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_heroes_team_wipe_a_01",
				"vmg_a_vs_heroes_team_wipe_a_02",
				"vmg_a_vs_heroes_team_wipe_a_03",
			},
			sound_events_duration = {
				7.028694152832,
				5.4314961433411,
				7.6631050109863,
			},
		},
		vmg_vs_new_spawn_horde_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_new_spawn_horde_a_01",
				"vmg_a_vs_new_spawn_horde_a_02",
				"vmg_a_vs_new_spawn_horde_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_new_spawn_horde_a_01",
				"vmg_a_vs_new_spawn_horde_a_02",
				"vmg_a_vs_new_spawn_horde_a_03",
			},
			sound_events_duration = {
				4.9109778404236,
				5.0483283996582,
				7.3498873710632,
			},
		},
		vmg_vs_new_spawn_monster_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_new_spawn_monster_a_01",
				"vmg_a_vs_new_spawn_monster_a_02",
				"vmg_a_vs_new_spawn_monster_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_new_spawn_monster_a_01",
				"vmg_a_vs_new_spawn_monster_a_02",
				"vmg_a_vs_new_spawn_monster_a_03",
			},
			sound_events_duration = {
				4.2196116447449,
				3.0907000303268,
				3.0907000303268,
			},
		},
		vmg_vs_pactsworn_wipe_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_pactsworn_wipe_a_01",
				"vmg_a_vs_pactsworn_wipe_a_02",
				"vmg_a_vs_pactsworn_wipe_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_pactsworn_wipe_a_01",
				"vmg_a_vs_pactsworn_wipe_a_02",
				"vmg_a_vs_pactsworn_wipe_a_03",
			},
			sound_events_duration = {
				4.9327158927917,
				6.7193632125855,
				5.2688660621643,
			},
		},
		vmg_vs_round_start_go_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_round_start_go_a_01",
				"vmg_a_vs_round_start_go_a_02",
				"vmg_a_vs_round_start_go_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_round_start_go_a_01",
				"vmg_a_vs_round_start_go_a_02",
				"vmg_a_vs_round_start_go_a_03",
			},
			sound_events_duration = {
				3.8100295066834,
				3.5243787765503,
				3.5982291698456,
			},
		},
		vmg_vs_round_start_rant_a = {
			category = "npc_talk",
			database = "vs_npc_vo",
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
				"vmg_a_vs_round_start_rant_a_01",
				"vmg_a_vs_round_start_rant_a_02",
				"vmg_a_vs_round_start_rant_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"vmg_a_vs_round_start_rant_a_01",
				"vmg_a_vs_round_start_rant_a_02",
				"vmg_a_vs_round_start_rant_a_03",
			},
			sound_events_duration = {
				8.5326251983643,
				8.5534934997559,
				8.0429744720459,
			},
		},
	})
end
