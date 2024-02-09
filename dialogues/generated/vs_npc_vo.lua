-- chunkname: @dialogues/generated/vs_npc_vo.lua

return function ()
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
				2.9854193925858,
				2.9854193925858,
				2.9854193925858,
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
				2.9854193925858,
				2.9854193925858,
				2.9854193925858,
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
				2.9854193925858,
				2.9854193925858,
				3.086014509201,
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
				2.9854193925858,
				2.9854193925858,
				2.9854193925858,
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
				2.9854193925858,
				2.9854193925858,
				2.9854193925858,
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
				2.9854193925858,
				3.3664178848267,
				3.329993724823,
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
				4.7192521095276,
				4.9304494857788,
				5.9209570884705,
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
				2.5047733783722,
				3.22944688797,
				3.4005990028381,
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
				3.9843239784241,
				5.1823873519897,
				5.3881311416626,
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
				4.6908149719238,
				6.3440756797791,
				5.7505078315735,
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
				6.2858176231384,
				7.0596332550049,
				7.1433877944946,
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
				6.9522128105164,
				7.5098400115967,
				7.4019370079041,
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
				3.8135657310486,
				5.0597243309021,
				5.6842622756958,
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
				4.2440309524536,
				5.0123929977417,
				2.9854193925858,
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
				4.4588713645935,
				6.1248903274536,
				4.6973972320557,
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
				2.3146924972534,
				2.0251932144165,
				2.0024213790894,
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
				7.5452575683594,
				7.6466002464294,
				7.8681015968323,
			},
		},
	})
end
